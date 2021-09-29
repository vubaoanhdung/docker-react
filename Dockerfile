FROM node:lts-alpine as builder
WORKDIR /home/node/app
COPY ./package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=builder /home/node/app/build /usr/share/nginx/html
