FROM golang:1.21 AS builder
WORKDIR /app
COPY . .
RUN go build -o main

FROM alpine:3.18
COPY --from=builder /app/main ./bin
CMD [ "main" ]
