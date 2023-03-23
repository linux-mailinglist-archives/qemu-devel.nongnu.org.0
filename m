Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 487FE6C6CE3
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 17:04:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfNPB-00029c-6R; Thu, 23 Mar 2023 12:03:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1pfNP8-000255-Rf
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 12:03:07 -0400
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1pfNP6-0002Os-3j
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 12:03:06 -0400
Received: by mail-qt1-x836.google.com with SMTP id bz27so15362025qtb.1
 for <qemu-devel@nongnu.org>; Thu, 23 Mar 2023 09:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679587383;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QZTFJZSPuWkx8Cln9CaQeyXEglM8tEa7mt6PYOcpGSQ=;
 b=boFzQW7i8YB7QwuSH+tRDCBZarZN9F1hbgbi0xdNveefXvD3CepedzlmcK6gCafLEt
 skyII9mQ5wGzG990G6/uhAGyUVLrDNzf6O0sOotqFJ7kP+FaCwTdEStSXEgkqlIm21Tu
 QWMLiAvaxIVsnvytu7heVhpDR562C5Vx1EKdKZMCwLbCS2jyxb5uRb5ZvV/2rA6SY+Ht
 EbHPryiYukEW+BO7OLqO+x1iIho9Y35nzdqdx6py6R3mdx6dW+yn3iERirXANj1nmmIG
 8N5+PhITz58ZttkJFWF69MSveDiA+157Z6l8x6IE8QHja8thRYWp8bkloxKyKYmvDDOK
 VGTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679587383;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=QZTFJZSPuWkx8Cln9CaQeyXEglM8tEa7mt6PYOcpGSQ=;
 b=PYJ3WG9MrO+e5SEIs8SM5h7Id7yPWZCjCPNAlqoydeBjnNCCU9Y++YsFBUP9o4V2/k
 /ksfYANlCLLKgOLAm8FrNZUcVFfFqTDgRzTpT+R5xhr9SQbLyzxa9NLd+xaAV2UOt8pT
 ouhR+ngP59bLWgQjavHgy4InTk2AQMS+cDYbKgqZLGLDwHOR+y+AaFm8nE0nhpcIVc5P
 IQ5jBiu/qeprwRODuHs4S2lW4lrDggzbDp2s3pXtotXKJcLyfsP3dSCffpaDTs8v0Pay
 Mu57AI6+/T0I4Cx7qzkmBbaP/+06f4Q6/cE1/OnfYNeHIM9YEF3Qz+60YSZJ+0+5yiLf
 0CZg==
X-Gm-Message-State: AO0yUKWqL/BEscAvQo1lu5Xv/BLHF/iYPLFhF3XRAMOAoKfRc0NVqfz4
 jWzKynQHHe/mB1z12WhBYQ==
X-Google-Smtp-Source: AK7set8I5LKSyFflT+bsaeY4J7j2Mi51ePpwp2kHW2MHpoyfSQYPIN7R7H+YLm0xQfLF8uCUyQfCaQ==
X-Received: by 2002:a05:622a:130f:b0:3de:81b0:aab8 with SMTP id
 v15-20020a05622a130f00b003de81b0aab8mr13457022qtk.52.1679587382603; 
 Thu, 23 Mar 2023 09:03:02 -0700 (PDT)
Received: from serve.minyard.net ([47.184.185.84])
 by smtp.gmail.com with ESMTPSA id
 y15-20020ac8524f000000b003e3910db4f1sm1508747qtn.35.2023.03.23.09.03.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Mar 2023 09:03:02 -0700 (PDT)
Received: from minyard.net (unknown
 [IPv6:2001:470:b8f6:1b:3214:777f:4ba9:15f6])
 by serve.minyard.net (Postfix) with ESMTPSA id 3368C1800BD;
 Thu, 23 Mar 2023 16:03:01 +0000 (UTC)
Date: Thu, 23 Mar 2023 11:03:00 -0500
From: Corey Minyard <minyard@acm.org>
To: Karol Nowak <knw@spyro-soft.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "philmd@linaro.org" <philmd@linaro.org>, "clg@kaod.org" <clg@kaod.org>
Subject: Re: [RFC PATCH v1] hw/misc: add i2c slave device that passes i2c ops
 outside
Message-ID: <ZBx4NBzCFmyTslSL@minyard.net>
References: <PAXP193MB16793F753AA32E8FAA831D7B83879@PAXP193MB1679.EURP193.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXP193MB16793F753AA32E8FAA831D7B83879@PAXP193MB1679.EURP193.PROD.OUTLOOK.COM>
Received-SPF: pass client-ip=2607:f8b0:4864:20::836;
 envelope-from=tcminyard@gmail.com; helo=mail-qt1-x836.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: minyard@acm.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Mar 23, 2023 at 10:09:02AM +0000, Karol Nowak wrote:
> Hi,
> 
> There is a feature I prepared which may be practical for some QEMU users.
> 
> The feature provides a new I2C slave device
> that prepares a message depending what i2c-slave callback was called
> and sends it outside of QEMU through the character device to a client
> that receives that message, processes it and send back a response.
> Thanks to that feature,
> a user can emulate a logic of I2C device outside of QEMU.
> The message contains 3 bytes ended with CRLF: BBB\r\l
> Basically, the I2C slave does 4 steps in each i2c-slave callback:
> * encode
> * send
> * receive
> * decode
> 
> I put more details in esp32_i2c_tcp_slave.c
> and also provided a demo client in python that uses TCP.
> 
> The feature still needs some improvements, but the question is:
> * Do you find the feature useful?

Someone else has proposed this before with a patch, and it was actually
pretty complete and mostly ok, but I pointed out an issue and never
heard back from them.  This feature is something that might be nice.  As
you say, this needs some improvements.  Some I would point out:

Obviously this can't be named esp32, it needs to be general.

All the I/O (reading and writing) has to be non-blocking.  I/O handling
in qemu is single-threaded, if you block anywhere you basically stop
qemu.  You need to implement something where whatever you do (like
handling a NAK, for instance) it doesn't block qemu.

The protocol you have implemented is basically an extension of the QEMU
protocol.  That's probably not ideal, it would be best to think about a
general protocol for extending I2C over a TCP connection.  A lot of the
details of the QEMU implementation is probably not necessary over a TCP
connection.

-corey

> 
> 
> NOTE:
> The feature originally was prepared for espressif/qemu
> that's why there are references to esp32
> 
> 
> Signed-off-by: Karol Nowak <knw@spyro-soft.com>
> ---
>  hw/misc/esp32_i2c_tcp_slave.c         | 288 ++++++++++++++++++++++++++
>  include/hw/misc/esp32_i2c_tcp_slave.h |  19 ++
>  tests/i2c-tcp-demo/i2c-tcp-demo.py    | 133 ++++++++++++
>  3 files changed, 440 insertions(+)
>  create mode 100644 hw/misc/esp32_i2c_tcp_slave.c
>  create mode 100644 include/hw/misc/esp32_i2c_tcp_slave.h
>  create mode 100644 tests/i2c-tcp-demo/i2c-tcp-demo.py
> 
> diff --git a/hw/misc/esp32_i2c_tcp_slave.c b/hw/misc/esp32_i2c_tcp_slave.c
> new file mode 100644
> index 0000000000..db3b6d366a
> --- /dev/null
> +++ b/hw/misc/esp32_i2c_tcp_slave.c
> @@ -0,0 +1,288 @@
> +#include "qemu/osdep.h"
> +#include "qemu/error-report.h"
> +#include "qemu/log.h"
> +#include "hw/i2c/i2c.h"
> +#include "hw/irq.h"
> +#include "hw/misc/esp32_i2c_tcp_slave.h"
> +#include "qemu/module.h"
> +
> +#include "qapi/qmp/json-writer.h"
> +#include "chardev/char-fe.h"
> +#include "io/channel-socket.h"
> +#include "chardev/char-io.h"
> +#include "chardev/char-socket.h"
> +#include "qapi/error.h"
> +
> +/*
> + * Description:
> + * To allow to emulate a I2C slave device which is not supported by QEMU,
> + * a new I2C slave device was created that encapsulates I2C operations
> + * and passes them through a selected chardev to the host
> + * where a client resides that implements a logic of emulated device.
> + *
> + *
> + * Architecture:
> + *    ---------------------------
> + *    | QEMU                    |
> + *    |                         |         -----------------------
> + *    |  ESP32 Firmware writes  |         |                     |
> + *    |  to I2C Slave           |         | I2C Slave Emulation |
> + *    |                         |         |                     |
> + *    |  -----------------------&---------&----                 |
> + *    |  | I2C Slave at 0x7F    &   tcp   &     recv msg        |
> + *    |  -----------------------&---------&---- process msg     |
> + *    |                         |         |     send respone    |
> + *    |                         |         |                     |
> + *    |                         |         |                     |
> + *    ---------------------------         |----------------------
> + *
> + *
> + * Syntax & protocol:
> + *      QEMU I2C Slave sends a msg in following format: BBB\r\n
> + *      where each 'B' represents a single byte 0-255
> + *      QEMU I2C Slave expects a respone message in the same format as fast as possible
> + *      Example:
> + *         req: 0x45 0x01 0x00 \r\n
> + *        resp: 0x45 0x01 0x00 \r\n
> + *
> + *      The format BBB\r\n
> + *        first 'B' is a message type
> + *        second 'B' is a data value
> + *        third 'B' is an error value (not used at the moment)
> + *
> + *      There are three types of message
> + *        'E' or 0x45 - Event:
> + *        'S' or 0x53 - Send: byte sent to emulated I2C Slave
> + *        'R' or 0x52 - Recv: byte to be received by I2C Master
> + *
> + *
> + *      'E' message
> + *        second byte is an event type:
> + *         0x0: I2C_START_RECV
> + *         0x1: I2C_START_SEND
> + *         0x2: I2C_START_SEND_ASYNC
> + *         0x3: I2C_FINISH
> + *         0x4: I2C_NACK
> + *
> + *        Example:
> + *            0x45 0x01 0x00  - start send
> + *            0x45 0x03 0x00  - finish
> + *
> + *        In case of 'E' message, a response is the same as a request message
> + *
> + *      'S' message
> + *        second byte is a byte transmitted from I2C Master to I2C slave device
> + *        the byte to by processed by I2C Slave Device
> + *
> + *        Example:
> + *            0x53 0x20 0x00
> + *
> + *        In case of 'S' message, a response is the same as a request message
> + *
> + *      'R' message
> + *        the I2C Master expect a byte from the emulated i2c slave device
> + *        A client has to modify the second byte of the request message
> + *         and send it back as a response.
> + *
> + *        Example:
> + *             req: 0x52 0x00 0x00
> + *            resp: 0x52 0x11 0x00
> + *
> + *
> + * Examples of Transmission:
> + *     1) i2cset -c 0x7F -r 0x20 0x11 0x22 0x33 0x44 0x55
> + *          req: 45 01 00
> + *         resp: 45 01 00
> + *
> + *          req: 53 20 00
> + *         resp: 53 20 00
> + *
> + *          req: 53 11 00
> + *         resp: 53 11 00
> + *
> + *          req: 53 22 00
> + *         resp: 53 22 00
> + *
> + *          req: 53 33 00
> + *         resp: 53 33 00
> + *
> + *          req: 53 44 00
> + *         resp: 53 44 00
> + *
> + *          req: 53 55 00
> + *         resp: 53 55 00
> + *
> + *          req: 45 03 00
> + *         resp: 45 03 00
> + *
> + *     2) i2cget -c 0x7F -r 0x20 -l 0x03
> + *          req: 45 01 00
> + *         resp: 45 01 00
> + *
> + *          req: 53 20 00
> + *         resp: 53 20 00
> + *
> + *          req: 45 03 00
> + *         resp: 45 03 00
> + *
> + *          req: 45 00 00
> + *         resp: 45 00 00
> + *
> + *          req: 52 00 00
> + *         resp: 52 11 00
> + *
> + *          req: 52 00 00
> + *         resp: 52 22 00
> + *
> + *          req: 52 00 00
> + *         resp: 52 33 00
> + *
> + *          req: 45 03 00
> + *         resp: 45 03 00
> + *
> + *
> + * To start i2c.socket server, set QEMU param:
> + *   -chardev socket,port=16001,wait=no,host=localhost,server=on,ipv4=on,id=i2c.socket
> + *
> + * Simple demo I2C Slave Emulation in Python:
> + *   tests/i2c-tcp-demo/i2c-tcp-demo.py
> + *
> + * Limitations:
> + *   - there is no recv timeout which may lead to qemu hang
> + *
> + */
> +
> +#define CHARDEV_NAME "i2c.socket"
> +
> +static Chardev *chardev;
> +static CharBackend char_backend;
> +static bool chardev_open;
> +
> +typedef struct {
> +    uint8_t id;
> +    uint8_t byte;
> +    uint8_t err;
> +} packet;
> +
> +static int chr_can_receive(void *opaque)
> +{
> +    return CHR_READ_BUF_LEN;
> +}
> +
> +static void chr_event(void *opaque, QEMUChrEvent event)
> +{
> +    switch (event) {
> +    case CHR_EVENT_OPENED:
> +        qemu_log("connected\n");
> +        chardev_open = true;
> +        break;
> +    case CHR_EVENT_CLOSED:
> +        qemu_log("disconnected\n");
> +        chardev_open = false;
> +        break;
> +    case CHR_EVENT_BREAK:
> +    case CHR_EVENT_MUX_IN:
> +    case CHR_EVENT_MUX_OUT:
> +        /* Ignore */
> +        break;
> +    }
> +}
> +
> +static void send_packet(packet *p)
> +{
> +    static const char *PACKET_FMT = "%c%c%c\r\n";
> +    static char buff[32];
> +
> +    /* encode */
> +    int len = snprintf(buff, sizeof(buff), PACKET_FMT, p->id, p->byte, p->err);
> +
> +    /* send */
> +    qemu_chr_fe_write_all(&char_backend, (uint8_t *)buff, len);
> +
> +    /* receive */
> +    qemu_chr_fe_read_all(&char_backend, (uint8_t *)buff, len);
> +
> +    /* decode */
> +    sscanf(buff, PACKET_FMT, &p->id, &p->byte, &p->err);
> +}
> +
> +static uint8_t slave_rx(I2CSlave *i2c)
> +{
> +    packet p = {.id = 'R',
> +                .byte = 0,
> +                .err = 0};
> +
> +    send_packet(&p);
> +
> +    return p.byte;
> +}
> +
> +static int slave_tx(I2CSlave *i2c, uint8_t data)
> +{
> +    packet p = {.id = 'S',
> +                .byte = data,
> +                .err = 0};
> +
> +    send_packet(&p);
> +
> +    return 0;
> +}
> +
> +static int slave_event(I2CSlave *i2c, enum i2c_event event)
> +{
> +    packet p = {.id = 'E',
> +                .byte = event,
> +                .err = 0};
> +
> +    send_packet(&p);
> +
> +    return 0;
> +}
> +
> +static void slave_realize(DeviceState *dev, Error **errp)
> +{
> +}
> +
> +static void slave_init(Object *obj)
> +{
> +    Error *err = NULL;
> +    chardev = qemu_chr_find(CHARDEV_NAME);
> +    if (!chardev) {
> +        error_report("chardev '%s' not found", CHARDEV_NAME);
> +        return;
> +    }
> +
> +    if (!qemu_chr_fe_init(&char_backend, chardev, &err)) {
> +        error_report_err(err);
> +        return;
> +    }
> +
> +    qemu_chr_fe_set_handlers(&char_backend, chr_can_receive, NULL, chr_event,
> +                             NULL, NULL, NULL, true);
> +}
> +
> +static void slave_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +    I2CSlaveClass *k = I2C_SLAVE_CLASS(klass);
> +
> +    dc->realize = slave_realize;
> +    k->event = slave_event;
> +    k->recv = slave_rx;
> +    k->send = slave_tx;
> +}
> +
> +static const TypeInfo esp32_i2c_tcp_info = {
> +    .name = TYPE_ESP32_I2C_TCP,
> +    .parent = TYPE_I2C_SLAVE,
> +    .instance_size = sizeof(ESP32_I2C_TCP_State),
> +    .instance_init = slave_init,
> +    .class_init = slave_class_init,
> +};
> +
> +static void esp32_i2c_tcp_type_init(void)
> +{
> +    type_register_static(&esp32_i2c_tcp_info);
> +}
> +
> +type_init(esp32_i2c_tcp_type_init);
> diff --git a/include/hw/misc/esp32_i2c_tcp_slave.h b/include/hw/misc/esp32_i2c_tcp_slave.h
> new file mode 100644
> index 0000000000..e36bac7ffe
> --- /dev/null
> +++ b/include/hw/misc/esp32_i2c_tcp_slave.h
> @@ -0,0 +1,19 @@
> +/*
> + */
> +#ifndef QEMU_ESP32_I2C_TCP_SLAVE_H
> +#define QEMU_ESP32_I2C_TCP_SLAVE_H
> +
> +#include "hw/i2c/i2c.h"
> +#include "qom/object.h"
> +
> +#define TYPE_ESP32_I2C_TCP "esp32_i2c_tcp"
> +OBJECT_DECLARE_SIMPLE_TYPE(ESP32_I2C_TCP_State, ESP32_I2C_TCP)
> +
> +/**
> + */
> +struct ESP32_I2C_TCP_State {
> +    /*< private >*/
> +    I2CSlave i2c;
> +};
> +
> +#endif
> diff --git a/tests/i2c-tcp-demo/i2c-tcp-demo.py b/tests/i2c-tcp-demo/i2c-tcp-demo.py
> new file mode 100644
> index 0000000000..d4bec457f3
> --- /dev/null
> +++ b/tests/i2c-tcp-demo/i2c-tcp-demo.py
> @@ -0,0 +1,133 @@
> +import json
> +from twisted.internet import task
> +from twisted.internet.defer import Deferred
> +from twisted.internet.protocol import ClientFactory
> +from twisted.protocols.basic import LineReceiver
> +from dataclasses import dataclass
> +from enum import Enum
> +
> +# i2cset -c 0x7F -r 0x20 0x11 0x22 0x33 0x44 0x55
> +# i2cget -c 0x7F -r 0x20 -l 0x0A
> +
> +HOST = "localhost"
> +PORT = 16001
> +
> +
> +class EVENT(Enum):
> +    I2C_START_RECV = 0
> +    I2C_START_SEND = 1
> +    I2C_START_SEND_ASYNC = 2
> +    I2C_FINISH = 3
> +    I2C_NACK = 4
> +
> +
> +@dataclass
> +class I2CSlave:
> +    mem: bytearray = bytearray(256)
> +    mem_addr: int = 0
> +    curr_addr: int = 0
> +    first_send: bool = True
> +    recv_conuter: int = 0
> +
> +
> +i2cslave = I2CSlave()
> +
> +
> +def dump_mem():
> +    print("Mem:")
> +    bytes_per_row = 32
> +    rows = int(256 / bytes_per_row)
> +    for i in range(0, rows):
> +        begin = i*bytes_per_row
> +        end = begin+bytes_per_row
> +        prefix = hex(begin)
> +        if i == 0:
> +            prefix = "0x00"
> +        print(prefix + ": " + i2cslave.mem[begin:end].hex(" "))
> +
> +    print("\n")
> +
> +
> +def event_handler(packet):
> +    evt = EVENT(packet[1])
> +    print("Event handler: " + evt.name)
> +
> +    if evt is EVENT.I2C_FINISH:
> +        i2cslave.recv_conuter = 0
> +        i2cslave.first_send = True
> +        dump_mem()
> +
> +    return packet
> +
> +
> +def recv_handler(packet):
> +    print("Recv handler: byte number " + str(i2cslave.recv_conuter) +
> +          " from addr=" + hex(i2cslave.mem_addr) +
> +          ", val=" + hex(i2cslave.mem[i2cslave.mem_addr]))
> +    i2cslave.recv_conuter += 1
> +    resp = bytearray(packet)
> +    resp[1] = i2cslave.mem[i2cslave.mem_addr]
> +    i2cslave.mem_addr += 1
> +    if i2cslave.mem_addr == 256:
> +        i2cslave.mem_addr = 0
> +    return bytes(resp)
> +
> +
> +def send_handler(packet):
> +    print("Send handler: ", end='')
> +    if i2cslave.first_send == True:
> +        print("address byte: ", hex(packet[1]))
> +        i2cslave.mem_addr = packet[1]
> +        i2cslave.first_send = False
> +    else:
> +        print("data byte: ", hex(packet[1]))
> +        i2cslave.mem[i2cslave.mem_addr] = packet[1]
> +        i2cslave.mem_addr += 1
> +        if i2cslave.mem_addr == 256:
> +            i2cslave.mem_addr = 0
> +    return packet
> +
> +
> +handlers = {'E': event_handler, 'R': recv_handler, 'S': send_handler}
> +
> +
> +class PacketReceiver(LineReceiver):
> +    def __init__(self) -> None:
> +        super().__init__()
> +
> +    def connectionMade(self):
> +        print("connected")
> +
> +    def lineReceived(self, line):
> +        # print(line.hex(" "))
> +        resp = line
> +        if len(line) == 3:
> +            resp = handlers[chr(line[0])](line)
> +
> +        self.sendLine(resp)
> +
> +
> +class PacketReceiverFactory(ClientFactory):
> +    protocol = PacketReceiver
> +
> +    def __init__(self):
> +        self.done = Deferred()
> +
> +    def clientConnectionFailed(self, connector, reason):
> +        print("connection failed:", reason.getErrorMessage())
> +        self.done.errback(reason)
> +
> +    def clientConnectionLost(self, connector, reason):
> +        print("connection lost:", reason.getErrorMessage())
> +        self.done.callback(None)
> +
> +
> +def main(reactor):
> +    dump_mem()
> +    factory = PacketReceiverFactory()
> +    reactor.connectTCP(HOST, PORT, factory)
> +    return factory.done
> +
> +
> +if __name__ == "__main__":
> +    task.react(main)
> --
> 2.34.1
> 
> 
> Please consider the environment before printing this e-mail.
> ________________________________
> This e-mail (including any attachments) is intended solely for the use of the individual or entity to which it is addressed and may contain confidential information. This message is not a binding agreement and does not conclude an agreement without the express confirmation of the sender's superior or a director of the company.
> If you are not the intended recipient, you should immediately notify the sender and delete the message along all the attachments. Any disclosure, copying, distribution or any other action is prohibited and may be illegal. No e-mail transmission can be guaranteed to be 100% secure or error-free, as information could be intercepted, corrupted, lost, destroyed, arrive late or incomplete, or contain viruses. Although Spyrosoft has taken precautions to ensure that this e-mail is free from viruses, the company does not accept liability for any errors or omissions in the content of this message, which arise as a result of the e-mail transmission. This e-mail is deemed to be professional in nature. Spyrosoft does not permit the employees to send emails which contravene provisions of the law.

