Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39CEE62C0CC
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 15:29:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovJOP-0003Ur-BS; Wed, 16 Nov 2022 09:27:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1ovJOM-0003T1-Dk; Wed, 16 Nov 2022 09:27:54 -0500
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1ovJOJ-0003fG-R7; Wed, 16 Nov 2022 09:27:54 -0500
Received: by mail-qk1-x736.google.com with SMTP id k2so11689939qkk.7;
 Wed, 16 Nov 2022 06:27:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O0cnVQmGskChIX0U4DveNcPZGbh+svbp+LgTGLXRJRI=;
 b=ThW+TrkYoO8MvZ7PNlIuyPbnDwRIpKE3H0AXBECzGv9ucXVRMzdO+MK9RQfv7ljt8N
 zf4tou3dXHetLzZijdIdu9K9K2yLA1LNxErgpVKtHfr2GrUBnzQRMDHrB1SeUSXsLw5G
 teZpSrd406N081SyMQDYlQDppDndNI8oxyYRH6+naS7oxA+HOqllXbyn5CfDTsemooWP
 IKwdxShaAHO7T/v5dhMSHwJcvZpPb59zf3mvd6G1f0pMdbMeK4R6AY7//BQdK7BMYebN
 uJgTjuC4YjJNez1L5FT51ASGfOjtyLmo/gk+rBT5MqJl0XvIG6cuUstr1cG4nQj1glGF
 0v6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=O0cnVQmGskChIX0U4DveNcPZGbh+svbp+LgTGLXRJRI=;
 b=65nOke5qFdEI38aXXEB744hhsXhwd3pRMMZnwHugbg1mrghzWOjqFbWHsLk+Y+O8d4
 OGLibmuWsv82eDriAt6SeJGoPDIaIR0349O+b6z42c1hr1IGCoi1xORX71v4+TWMNIXT
 v7L4+dR0cgnF6/XLXFnCcbiV5Qt/73Wfq3swoFZs1qReXRpHNXbaVnbeyRK0Gb7UZ1df
 +3rXHKwSYzB4BXn6j1f5OvdspgBeKpD9Yf3HN5wklWKvluObAwrBFvC5Z1gtAzwQ9wAt
 wgJyCjx9zID3j0/U0xnbeDm6yA7s9Xkgzcd42NAEzp3F3mI8+gKeP7ie//AnJbpPFihl
 9Elg==
X-Gm-Message-State: ANoB5pm8BxOn9cKaN9yMnFwZDEms0+ebLyEnLhW9HsXJu57KrR7tyUU3
 Ui/mOXIO56ularEpSPpPDg==
X-Google-Smtp-Source: AA0mqf49fBvUpTPIT/l/jN+mhsV4gfGDCTJxnMH7lMu/kkbLDAOyfoLHCP3+V/xEppxwK2I40c42Fg==
X-Received: by 2002:a05:620a:199d:b0:6fa:e099:bc12 with SMTP id
 bm29-20020a05620a199d00b006fae099bc12mr19917284qkb.308.1668608869809; 
 Wed, 16 Nov 2022 06:27:49 -0800 (PST)
Received: from serve.minyard.net ([47.184.147.45])
 by smtp.gmail.com with ESMTPSA id
 t23-20020ac87617000000b003a586888a20sm8820675qtq.79.2022.11.16.06.27.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Nov 2022 06:27:49 -0800 (PST)
Received: from minyard.net (unknown [IPv6:2001:470:b8f6:1b:4cd:c1c0:2972:bb31])
 by serve.minyard.net (Postfix) with ESMTPSA id D4219180044;
 Wed, 16 Nov 2022 14:27:47 +0000 (UTC)
Date: Wed, 16 Nov 2022 08:27:46 -0600
From: Corey Minyard <minyard@acm.org>
To: Klaus Jensen <its@irrelevant.dk>
Cc: qemu-devel@nongnu.org, Andrew Jeffery <andrew@aj.id.au>,
 Keith Busch <kbusch@kernel.org>, Corey Minyard <cminyard@mvista.com>,
 Peter Delevoryas <peter@pjd.dev>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 Jeremy Kerr <jk@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Klaus Jensen <k.jensen@samsung.com>
Subject: Re: [PATCH RFC 2/3] hw/i2c: add mctp core
Message-ID: <Y3TzYnSmB+UDD6st@minyard.net>
References: <20221116084312.35808-1-its@irrelevant.dk>
 <20221116084312.35808-3-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221116084312.35808-3-its@irrelevant.dk>
Received-SPF: pass client-ip=2607:f8b0:4864:20::736;
 envelope-from=tcminyard@gmail.com; helo=mail-qk1-x736.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
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

On Wed, Nov 16, 2022 at 09:43:11AM +0100, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> Add an abstract MCTP over I2C endpoint model. This implements MCTP
> control message handling as well as handling the actual I2C transport
> (packetization).
> 
> Devices are intended to derive from this and implement the class
> methods.
> 
> Parts of this implementation is inspired by code[1] previously posted by
> Jonathan Cameron.

I have some comments inline, mostly about buffer handling.  Buffer
handling is scary to me, so you might see some paranoia here :-).

> 
>   [1]: https://lore.kernel.org/qemu-devel/20220520170128.4436-1-Jonathan.Cameron@huawei.com/
> 
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> ---
>  hw/arm/Kconfig         |   1 +
>  hw/i2c/Kconfig         |   4 +
>  hw/i2c/mctp.c          | 365 +++++++++++++++++++++++++++++++++++++++++
>  hw/i2c/meson.build     |   1 +
>  hw/i2c/trace-events    |  12 ++
>  include/hw/i2c/mctp.h  |  83 ++++++++++
>  include/hw/misc/mctp.h |  43 +++++
>  7 files changed, 509 insertions(+)
>  create mode 100644 hw/i2c/mctp.c
>  create mode 100644 include/hw/i2c/mctp.h
>  create mode 100644 include/hw/misc/mctp.h
> 
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 17fcde8e1ccc..3233bdc193d7 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -444,6 +444,7 @@ config ASPEED_SOC
>      select DS1338
>      select FTGMAC100
>      select I2C
> +    select MCTP_I2C
>      select DPS310
>      select PCA9552
>      select SERIAL
> diff --git a/hw/i2c/Kconfig b/hw/i2c/Kconfig
> index 9bb8870517f8..5dd43d550c32 100644
> --- a/hw/i2c/Kconfig
> +++ b/hw/i2c/Kconfig
> @@ -41,3 +41,7 @@ config PCA954X
>  config PMBUS
>      bool
>      select SMBUS
> +
> +config MCTP_I2C
> +    bool
> +    select I2C
> diff --git a/hw/i2c/mctp.c b/hw/i2c/mctp.c
> new file mode 100644
> index 000000000000..46376de95a98
> --- /dev/null
> +++ b/hw/i2c/mctp.c
> @@ -0,0 +1,365 @@
> +/*
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + * SPDX-FileCopyrightText: Copyright (c) 2022 Samsung Electronics Co., Ltd.
> + * SPDX-FileContributor: Klaus Jensen <k.jensen@samsung.com>
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/main-loop.h"
> +
> +#include "hw/qdev-properties.h"
> +#include "hw/i2c/i2c.h"
> +#include "hw/i2c/mctp.h"
> +
> +#include "trace.h"
> +
> +static uint8_t crc8(uint16_t data)
> +{
> +#define POLY (0x1070U << 3)
> +    int i;
> +
> +    for (i = 0; i < 8; i++) {
> +        if (data & 0x8000) {
> +            data = data ^ POLY;
> +        }
> +
> +        data = data << 1;
> +    }
> +
> +    return (uint8_t)(data >> 8);
> +#undef POLY
> +}
> +
> +static uint8_t i2c_smbus_pec(uint8_t crc, uint8_t *buf, size_t len)
> +{
> +    int i;
> +
> +    for (i = 0; i < len; i++) {
> +        crc = crc8((crc ^ buf[i]) << 8);
> +    }
> +
> +    return crc;
> +}

The PEC calculation probably belongs in it's own smbus.c file, since
it's generic, so someone looking will find it.

> +
> +void i2c_mctp_schedule_send(MCTPI2CEndpoint *mctp)
> +{
> +    I2CBus *i2c = I2C_BUS(qdev_get_parent_bus(DEVICE(mctp)));
> +
> +    mctp->tx.state = I2C_MCTP_STATE_TX_START_SEND;
> +
> +    i2c_bus_master(i2c, mctp->tx.bh);
> +}
> +
> +static void i2c_mctp_tx(void *opaque)
> +{
> +    DeviceState *dev = DEVICE(opaque);
> +    I2CBus *i2c = I2C_BUS(qdev_get_parent_bus(dev));
> +    I2CSlave *slave = I2C_SLAVE(dev);
> +    MCTPI2CEndpoint *mctp = MCTP_I2C_ENDPOINT(dev);
> +    MCTPI2CEndpointClass *mc = MCTP_I2C_ENDPOINT_GET_CLASS(mctp);
> +    MCTPI2CPacket *pkt = (MCTPI2CPacket *)mctp->buffer;
> +    uint8_t flags = 0;
> +
> +    switch (mctp->tx.state) {
> +    case I2C_MCTP_STATE_TX_SEND_BYTE:
> +        if (mctp->pos < mctp->len) {
> +            uint8_t byte = mctp->buffer[mctp->pos];
> +
> +            trace_i2c_mctp_tx_send_byte(mctp->pos, byte);
> +
> +            /* send next byte */
> +            i2c_send_async(i2c, byte);
> +
> +            mctp->pos++;
> +
> +            break;
> +        }
> +
> +        /* packet sent */
> +        i2c_end_transfer(i2c);
> +
> +        /* fall through */
> +
> +    case I2C_MCTP_STATE_TX_START_SEND:
> +        if (mctp->tx.is_control) {
> +            /* packet payload is already in buffer */
> +            flags |= MCTP_H_FLAGS_SOM | MCTP_H_FLAGS_EOM;
> +        } else {
> +            /* get message bytes from derived device */
> +            mctp->len = mc->get_message_bytes(mctp, pkt->mctp.payload,
> +                                              I2C_MCTP_MAXMTU, &flags);
> +        }
> +
> +        if (!mctp->len) {
> +            trace_i2c_mctp_tx_done();
> +
> +            /* no more packets needed; release the bus */
> +            i2c_bus_release(i2c);
> +
> +            mctp->state = I2C_MCTP_STATE_IDLE;
> +            mctp->tx.is_control = false;
> +
> +            break;
> +        }
> +
> +        mctp->state = I2C_MCTP_STATE_TX;
> +
> +        pkt->i2c = (MCTPI2CPacketHeader) {
> +            .dest = mctp->tx.addr & ~0x1,
> +            .prot = 0xf,
> +            .byte_count = 5 + mctp->len,
> +            .source = slave->address << 1 | 0x1,
> +        };
> +
> +        pkt->mctp.hdr = (MCTPPacketHeader) {
> +            .version = 0x1,
> +            .eid.dest = mctp->tx.eid,
> +            .eid.source = mctp->my_eid,
> +            .flags = flags | (mctp->tx.pktseq++ & 0x3) << 4 | mctp->tx.flags,
> +        };
> +
> +        mctp->len += sizeof(MCTPI2CPacket);

Do you need overflow checking here?  There are lots of increments of
mctp->len in the code that might or might not need overflow checks.
It does seem like you have pre-calculated everything so it fits; I worry
more about later changes that might violate those assumptions.
You could use something like i2c_mctp_send_cb() to send all data.  Not
sure, but something to think about.

> +        mctp->buffer[mctp->len] = i2c_smbus_pec(0, mctp->buffer, mctp->len);
> +        mctp->len++;
> +
> +        trace_i2c_mctp_tx_start_send(mctp->len);
> +
> +        i2c_start_send_async(i2c, pkt->i2c.dest >> 1);
> +
> +        /* already "sent" the destination slave address */
> +        mctp->pos = 1;
> +
> +        mctp->tx.state = I2C_MCTP_STATE_TX_SEND_BYTE;
> +
> +        break;
> +    }
> +}
> +
> +#define i2c_mctp_control_data(buf) \
> +    (i2c_mctp_payload(buf) + offsetof(MCTPControlMessage, data))
> +
> +static void i2c_mctp_handle_control_set_eid(MCTPI2CEndpoint *mctp, uint8_t eid)
> +{
> +    mctp->my_eid = eid;
> +
> +    uint8_t buf[] = {
> +        0x0, 0x0, eid, 0x0,
> +    };
> +
> +    memcpy(i2c_mctp_control_data(mctp->buffer), buf, sizeof(buf));
> +    mctp->len += sizeof(buf);
> +}
> +
> +static void i2c_mctp_handle_control_get_eid(MCTPI2CEndpoint *mctp)
> +{
> +    uint8_t buf[] = {
> +        0x0, mctp->my_eid, 0x0, 0x0,
> +    };
> +
> +    memcpy(i2c_mctp_control_data(mctp->buffer), buf, sizeof(buf));
> +    mctp->len += sizeof(buf);
> +}
> +
> +static void i2c_mctp_handle_control_get_version(MCTPI2CEndpoint *mctp)
> +{
> +    uint8_t buf[] = {
> +        0x0, 0x1, 0x0, 0x1, 0x3, 0x1,
> +    };
> +
> +    memcpy(i2c_mctp_control_data(mctp->buffer), buf, sizeof(buf));
> +    mctp->len += sizeof(buf);
> +}
> +
> +enum {
> +    MCTP_CONTROL_SET_EID                    = 0x01,
> +    MCTP_CONTROL_GET_EID                    = 0x02,
> +    MCTP_CONTROL_GET_VERSION                = 0x04,
> +    MCTP_CONTROL_GET_MESSAGE_TYPE_SUPPORT   = 0x05,
> +};
> +
> +static void i2c_mctp_handle_control(MCTPI2CEndpoint *mctp)
> +{
> +    MCTPI2CEndpointClass *mc = MCTP_I2C_ENDPOINT_GET_CLASS(mctp);
> +    MCTPControlMessage *msg = (MCTPControlMessage *)i2c_mctp_payload(mctp->buffer);
> +
> +    /* clear Rq/D */
> +    msg->flags &= 0x1f;
> +
> +    mctp->len = offsetof(MCTPControlMessage, data);
> +
> +    trace_i2c_mctp_handle_control(msg->command);
> +
> +    switch (msg->command) {
> +    case MCTP_CONTROL_SET_EID:
> +        i2c_mctp_handle_control_set_eid(mctp, msg->data[1]);
> +        break;
> +
> +    case MCTP_CONTROL_GET_EID:
> +        i2c_mctp_handle_control_get_eid(mctp);
> +        break;
> +
> +    case MCTP_CONTROL_GET_VERSION:
> +        i2c_mctp_handle_control_get_version(mctp);
> +        break;
> +
> +    case MCTP_CONTROL_GET_MESSAGE_TYPE_SUPPORT:
> +        mctp->len += mc->get_message_types(mctp, i2c_mctp_control_data(mctp->buffer));

You don't pass in how much data is available for the subclass to use.
That's generally good API behavior.

> +        break;
> +
> +    default:
> +        trace_i2c_mctp_unhandled_control(msg->command);
> +
> +        msg->data[0] = MCTP_CONTROL_ERROR_UNSUPPORTED_CMD;
> +        mctp->len++;
> +
> +        break;
> +    }
> +
> +    i2c_mctp_schedule_send(mctp);
> +}
> +
> +static int i2c_mctp_event_cb(I2CSlave *i2c, enum i2c_event event)
> +{
> +    MCTPI2CEndpoint *mctp = MCTP_I2C_ENDPOINT(i2c);
> +    MCTPI2CEndpointClass *mc = MCTP_I2C_ENDPOINT_GET_CLASS(mctp);
> +    MCTPI2CPacket *pkt = (MCTPI2CPacket *)mctp->buffer;
> +    size_t payload_len;
> +    uint8_t pec;
> +
> +    switch (event) {
> +    case I2C_START_SEND:
> +        if (mctp->state != I2C_MCTP_STATE_IDLE) {
> +            return -1;
> +        }
> +
> +        /* the i2c core eats the slave address, so put it back in */
> +        pkt->i2c.dest = i2c->address << 1;

This seems like a bit of a hack since pkt->i2c.dest never seems to be
used.  I guess it's ok, since it's matching what the specifications say,
but it seems a bit odd since you don't need it.

> +        mctp->len = 1;
> +
> +        mctp->state = I2C_MCTP_STATE_RX_STARTED;
> +
> +        return 0;
> +
> +    case I2C_FINISH:
> +        payload_len = mctp->len - (1 + offsetof(MCTPI2CPacket, mctp.payload));

Is there a way this can underflow?

> +
> +        if (pkt->i2c.byte_count + 3 != mctp->len - 1) {
> +            trace_i2c_mctp_drop_invalid_length(pkt->i2c.byte_count + 3,
> +                                               mctp->len - 1);
> +            goto drop;
> +        }
> +
> +        pec = i2c_smbus_pec(0, mctp->buffer, mctp->len - 1);
> +        if (mctp->buffer[mctp->len - 1] != pec) {
> +            trace_i2c_mctp_drop_invalid_pec(mctp->buffer[mctp->len - 1], pec);
> +            goto drop;
> +        }
> +
> +        if (pkt->mctp.hdr.eid.dest != mctp->my_eid) {
> +            trace_i2c_mctp_drop_invalid_eid(pkt->mctp.hdr.eid.dest,
> +                                            mctp->my_eid);
> +            goto drop;
> +        }
> +
> +        if (pkt->mctp.hdr.flags & MCTP_H_FLAGS_SOM) {
> +            mctp->tx.is_control = false;
> +
> +            if (mctp->state == I2C_MCTP_STATE_RX) {
> +                mc->reset_message(mctp);
> +            }
> +
> +            mctp->state = I2C_MCTP_STATE_RX;
> +
> +            mctp->tx.addr = pkt->i2c.source;
> +            mctp->tx.eid = pkt->mctp.hdr.eid.source;
> +            mctp->tx.flags = pkt->mctp.hdr.flags & 0x7;
> +            mctp->tx.pktseq = (pkt->mctp.hdr.flags >> 4) & 0x3;
> +
> +            if ((pkt->mctp.payload[0] & 0x7f) == MCTP_MESSAGE_TYPE_CONTROL) {
> +                mctp->tx.is_control = true;
> +
> +                i2c_mctp_handle_control(mctp);
> +
> +                return 0;
> +            }
> +        } else if (mctp->state == I2C_MCTP_STATE_RX_STARTED) {
> +            trace_i2c_mctp_drop("expected SOM");
> +            goto drop;
> +        } else if (((pkt->mctp.hdr.flags >> 4) & 0x3) != (mctp->tx.pktseq++ & 0x3)) {
> +            trace_i2c_mctp_drop_invalid_pktseq((pkt->mctp.hdr.flags >> 4) & 0x3,
> +                                               mctp->tx.pktseq & 0x3);
> +            goto drop;
> +        }
> +
> +        mc->put_message_bytes(mctp, i2c_mctp_payload(mctp->buffer), payload_len);
> +
> +        if (pkt->mctp.hdr.flags & MCTP_H_FLAGS_EOM) {
> +            mc->handle_message(mctp);
> +            mctp->state = I2C_MCTP_STATE_WAIT_TX;
> +        }
> +
> +        return 0;
> +
> +    default:
> +        return -1;
> +    }
> +
> +drop:
> +    mc->reset_message(mctp);
> +
> +    mctp->state = I2C_MCTP_STATE_IDLE;
> +
> +    return 0;
> +}
> +
> +static int i2c_mctp_send_cb(I2CSlave *i2c, uint8_t data)
> +{
> +    MCTPI2CEndpoint *mctp = MCTP_I2C_ENDPOINT(i2c);
> +
> +    if (mctp->len < I2C_MCTP_MAX_LENGTH) {
> +        mctp->buffer[mctp->len++] = data;
> +        return 0;
> +    }
> +
> +    return -1;
> +}
> +
> +static void i2c_mctp_instance_init(Object *obj)
> +{
> +    MCTPI2CEndpoint *mctp = MCTP_I2C_ENDPOINT(obj);
> +
> +    mctp->tx.bh = qemu_bh_new(i2c_mctp_tx, mctp);
> +}
> +
> +static Property mctp_i2c_props[] = {
> +    DEFINE_PROP_UINT8("eid", MCTPI2CEndpoint, my_eid, 0x9),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static void i2c_mctp_class_init(ObjectClass *oc, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(oc);
> +    I2CSlaveClass *k = I2C_SLAVE_CLASS(oc);
> +
> +    k->event = i2c_mctp_event_cb;
> +    k->send = i2c_mctp_send_cb;
> +
> +    device_class_set_props(dc, mctp_i2c_props);
> +}
> +
> +static const TypeInfo i2c_mctp_info = {
> +    .name = TYPE_MCTP_I2C_ENDPOINT,
> +    .parent = TYPE_I2C_SLAVE,
> +    .abstract = true,
> +    .instance_init = i2c_mctp_instance_init,
> +    .instance_size = sizeof(MCTPI2CEndpoint),
> +    .class_init = i2c_mctp_class_init,
> +    .class_size = sizeof(MCTPI2CEndpointClass),
> +};
> +
> +static void register_types(void)
> +{
> +    type_register_static(&i2c_mctp_info);
> +}
> +
> +type_init(register_types)
> diff --git a/hw/i2c/meson.build b/hw/i2c/meson.build
> index d3df273251f7..97d0bfd9ac67 100644
> --- a/hw/i2c/meson.build
> +++ b/hw/i2c/meson.build
> @@ -1,5 +1,6 @@
>  i2c_ss = ss.source_set()
>  i2c_ss.add(when: 'CONFIG_I2C', if_true: files('core.c'))
> +i2c_ss.add(when: 'CONFIG_MCTP_I2C', if_true: files('mctp.c'))
>  i2c_ss.add(when: 'CONFIG_SMBUS', if_true: files('smbus_slave.c', 'smbus_master.c'))
>  i2c_ss.add(when: 'CONFIG_ACPI_SMBUS', if_true: files('pm_smbus.c'))
>  i2c_ss.add(when: 'CONFIG_ACPI_X86_ICH', if_true: files('smbus_ich9.c'))
> diff --git a/hw/i2c/trace-events b/hw/i2c/trace-events
> index af181d43ee64..778139d08166 100644
> --- a/hw/i2c/trace-events
> +++ b/hw/i2c/trace-events
> @@ -33,3 +33,15 @@ npcm7xx_smbus_recv_fifo(const char *id, uint8_t received, uint8_t expected) "%s
>  
>  pca954x_write_bytes(uint8_t value) "PCA954X write data: 0x%02x"
>  pca954x_read_data(uint8_t value) "PCA954X read data: 0x%02x"
> +
> +# mctp.c
> +i2c_mctp_tx_start_send(size_t len) "len %zu"
> +i2c_mctp_tx_send_byte(size_t pos, uint8_t byte) "pos %zu byte 0x%"PRIx8""
> +i2c_mctp_tx_done(void) "packet sent"
> +i2c_mctp_handle_control(uint8_t command) "command 0x%"PRIx8""
> +i2c_mctp_unhandled_control(uint8_t command) "command 0x%"PRIx8""
> +i2c_mctp_drop(const char *reason) "%s"
> +i2c_mctp_drop_invalid_length(unsigned byte_count, size_t expected) "byte_count %u expected %zu"
> +i2c_mctp_drop_invalid_pec(uint8_t pec, uint8_t expected) "pec 0x%"PRIx8" expected 0x%"PRIx8""
> +i2c_mctp_drop_invalid_eid(uint8_t eid, uint8_t expected) "eid 0x%"PRIx8" expected 0x%"PRIx8""
> +i2c_mctp_drop_invalid_pktseq(uint8_t pktseq, uint8_t expected) "pktseq 0x%"PRIx8" expected 0x%"PRIx8""
> diff --git a/include/hw/i2c/mctp.h b/include/hw/i2c/mctp.h
> new file mode 100644
> index 000000000000..17dae662138b
> --- /dev/null
> +++ b/include/hw/i2c/mctp.h
> @@ -0,0 +1,83 @@
> +#ifndef QEMU_I2C_MCTP_H
> +#define QEMU_I2C_MCTP_H
> +
> +#include "qom/object.h"
> +#include "hw/qdev-core.h"
> +#include "hw/misc/mctp.h"
> +
> +typedef struct MCTPI2CPacketHeader {
> +    uint8_t dest;
> +    uint8_t prot;
> +    uint8_t byte_count;
> +    uint8_t source;
> +} MCTPI2CPacketHeader;
> +
> +typedef struct MCTPI2CPacket {
> +    MCTPI2CPacketHeader i2c;
> +    MCTPPacket          mctp;
> +} MCTPI2CPacket;
> +
> +#define i2c_mctp_payload(buf) (buf + offsetof(MCTPI2CPacket, mctp.payload))
> +
> +#define TYPE_MCTP_I2C_ENDPOINT "mctp-i2c-endpoint"
> +OBJECT_DECLARE_TYPE(MCTPI2CEndpoint, MCTPI2CEndpointClass, MCTP_I2C_ENDPOINT)
> +
> +struct MCTPI2CEndpointClass {
> +    I2CSlaveClass parent_class;
> +
> +    int (*put_message_bytes)(MCTPI2CEndpoint *mctp, uint8_t *buf, size_t len);
> +    size_t (*get_message_bytes)(MCTPI2CEndpoint *mctp, uint8_t *buf,
> +                                size_t maxlen, uint8_t *mctp_flags);
> +
> +    void (*handle_message)(MCTPI2CEndpoint *mctp);
> +    void (*reset_message)(MCTPI2CEndpoint *mctp);
> +
> +    size_t (*get_message_types)(MCTPI2CEndpoint *mctp, uint8_t *data);
> +};
> +
> +#define I2C_MCTP_MAXBLOCK 255
> +#define I2C_MCTP_MAXMTU (I2C_MCTP_MAXBLOCK - (sizeof(MCTPPacketHeader) + 1))
> +#define I2C_MCTP_MAX_LENGTH (3 + I2C_MCTP_MAXBLOCK + 1)
> +
> +typedef enum {
> +    I2C_MCTP_STATE_IDLE,
> +    I2C_MCTP_STATE_RX_STARTED,
> +    I2C_MCTP_STATE_RX,
> +    I2C_MCTP_STATE_WAIT_TX,
> +    I2C_MCTP_STATE_TX,
> +} MCTPState;
> +
> +typedef enum {
> +    I2C_MCTP_STATE_TX_START_SEND,
> +    I2C_MCTP_STATE_TX_SEND_BYTE,
> +} MCTPTxState;
> +
> +typedef struct MCTPI2CEndpoint {
> +    I2CSlave parent_obj;
> +    I2CBus *i2c;
> +
> +    MCTPState state;
> +
> +    /* mctp endpoint identifier */
> +    uint8_t my_eid;
> +
> +    uint8_t  buffer[I2C_MCTP_MAX_LENGTH];
> +    uint64_t pos;
> +    size_t   len;
> +
> +    struct {
> +        MCTPTxState state;
> +        bool is_control;
> +
> +        uint8_t eid;
> +        uint8_t addr;
> +        uint8_t pktseq;
> +        uint8_t flags;
> +
> +        QEMUBH *bh;
> +    } tx;
> +} MCTPI2CEndpoint;
> +
> +void i2c_mctp_schedule_send(MCTPI2CEndpoint *mctp);
> +
> +#endif /* QEMU_I2C_MCTP_H */
> diff --git a/include/hw/misc/mctp.h b/include/hw/misc/mctp.h
> new file mode 100644
> index 000000000000..c936224ecf60
> --- /dev/null
> +++ b/include/hw/misc/mctp.h
> @@ -0,0 +1,43 @@
> +#ifndef QEMU_MCTP_H
> +#define QEMU_MCTP_H
> +
> +#define MCTP_BASELINE_MTU 64
> +
> +enum {
> +    MCTP_H_FLAGS_EOM = 1 << 6,
> +    MCTP_H_FLAGS_SOM = 1 << 7,
> +};
> +
> +enum {
> +    MCTP_MESSAGE_TYPE_CONTROL   = 0x0,
> +    MCTP_MESSAGE_TYPE_NMI       = 0x4,
> +
> +    MCTP_MESSAGE_IC             = 1 << 7,
> +};
> +
> +typedef struct MCTPPacketHeader {
> +    uint8_t version;
> +    struct {
> +        uint8_t dest;
> +        uint8_t source;
> +    } eid;
> +    uint8_t flags;
> +} MCTPPacketHeader;
> +
> +typedef struct MCTPPacket {
> +    MCTPPacketHeader hdr;
> +    uint8_t          payload[];
> +} MCTPPacket;
> +
> +typedef struct MCTPControlMessage {
> +    uint8_t type;
> +    uint8_t flags;
> +    uint8_t command;
> +    uint8_t data[];
> +} MCTPControlMessage;
> +
> +enum {
> +    MCTP_CONTROL_ERROR_UNSUPPORTED_CMD = 0x5,
> +};
> +
> +#endif /* QEMU_MCTP_H */
> -- 
> 2.38.1
> 
> 

