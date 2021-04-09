Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE98635A72E
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 21:34:22 +0200 (CEST)
Received: from localhost ([::1]:45012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUwtX-0008Eb-Dq
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 15:34:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1lUwqU-0007GU-Cn
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 15:31:11 -0400
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733]:41566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1lUwqR-0000A6-AX
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 15:31:10 -0400
Received: by mail-qk1-x733.google.com with SMTP id v70so6976351qkb.8
 for <qemu-devel@nongnu.org>; Fri, 09 Apr 2021 12:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kgxQe1Nv5BjTuYLdSiX3olze8Mc95+O+2UuZ5wKE6Ow=;
 b=K2BpfKPpSaE5vTjXvn2oIFB5OmyDEIDV3qB6aiUxqtjEnsGbS1XTTTxRMtF0S3nIuO
 ozk5Xakr5hN8Coo45lPxvfzS3bKwqOm4OaBXA/g33PqNvre+OChjpLIdxYMnJX9PkJ3Z
 6GihGxprv0pT3eKPPk2yY/ATXwVlAvlggsutl1KiaclP4i7z/g7A4G91AkznFVshxgOD
 kiX77kSXDT7YMJZ/SLhySUUvzTtnMl4lYkYOXw2emRoW/TVyPe8HiuDWmm1q3YE7SoPF
 9CBWXIDmmsWz2/ccX7tbPFOYpHq/8G+r+uw+vuKUgsifZfUdGkp58gwanDxyyq2vM8DD
 T54Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kgxQe1Nv5BjTuYLdSiX3olze8Mc95+O+2UuZ5wKE6Ow=;
 b=fop5QsMggGWNKMLpCgpQkEpAbB4L6ibHH14Cwkcl8eseamPmusC7gZIMG3WwNpf2Db
 Pne8Jj4Quguo48kgQLSh/6MdWNgRloyyQ8wPn8R47DU61vMFZ0gardZWNyQRLGUNAQAH
 s2uBr9AVAemncdPKgpriQiO0KIPyAGe9PFAMizPYEcbpBrxHRHs5D6zmjZBeSxG0Prhx
 yUH9kQi8Y7ImcFhr/fx6acUGgqppUoS4XHiq/K3VWZcxV5xgIgeMedmcKXV+4I0mvsio
 j1l1IK6cA4Z2ftmkJCV6Wv92wrRiq9nA4ObDa6PmQf7gz8Ja3t99zuVeC7pQ3uFaXi/N
 6I1A==
X-Gm-Message-State: AOAM530SNZP9ncSFdphTFW8mn9cmpMyUzVinLNoE4VG8SVd7bCyDIsaC
 AdkFuVkZhMUjmtiGt9EvFM+frH4mongrokI1xWwrQQ==
X-Google-Smtp-Source: ABdhPJyyHjloTmhy8A64fVYYUea4O6rq/4zY8cyqTkg4WpBWiAHzhNnuqwPnbKdBTglXdekgD7BT2BDJKHZMJIRFQFI=
X-Received: by 2002:a37:b801:: with SMTP id i1mr15458948qkf.133.1617996665747; 
 Fri, 09 Apr 2021 12:31:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210409162545.3705962-1-venture@google.com>
 <20210409162545.3705962-5-venture@google.com>
 <20210409183401.GX7167@minyard.net>
In-Reply-To: <20210409183401.GX7167@minyard.net>
From: Patrick Venture <venture@google.com>
Date: Fri, 9 Apr 2021 12:30:54 -0700
Message-ID: <CAO=notz=hKBtZ3=h9snS+9NShF0AF6g8YOFm4anjrZXXvwEh7Q@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] hw/i2c: add pca954x i2c-mux switch
To: Corey Minyard <cminyard@mvista.com>
Cc: Hao Wu <wuhaotsh@google.com>, Havard Skinnemoen <hskinnemoen@google.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::733;
 envelope-from=venture@google.com; helo=mail-qk1-x733.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 9, 2021 at 11:34 AM Corey Minyard <cminyard@mvista.com> wrote:
>
> On Fri, Apr 09, 2021 at 09:25:45AM -0700, Patrick Venture wrote:
> > The pca954x is an i2c mux, and this adds support for two variants of
> > this device: the pca9546 and pca9548.
> >
> > This device is very common on BMCs to route a different channel to each
> > PCIe i2c bus downstream from the BMC.
> >
> > Signed-off-by: Patrick Venture <venture@google.com>
> > Reviewed-by: Hao Wu <wuhaotsh@google.com>
> > Reviewed-by: Havard Skinnemoen <hskinnemoen@google.com>
> > ---
> >  MAINTAINERS                      |   6 +
> >  hw/i2c/Kconfig                   |   4 +
> >  hw/i2c/i2c_mux_pca954x.c         | 290 +++++++++++++++++++++++++++++++
> >  hw/i2c/meson.build               |   1 +
> >  hw/i2c/trace-events              |   5 +
> >  include/hw/i2c/i2c_mux_pca954x.h |  19 ++
> >  6 files changed, 325 insertions(+)
> >  create mode 100644 hw/i2c/i2c_mux_pca954x.c
> >  create mode 100644 include/hw/i2c/i2c_mux_pca954x.h
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 58f342108e..5ea0b60b8a 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -2039,6 +2039,12 @@ S: Maintained
> >  F: hw/net/tulip.c
> >  F: hw/net/tulip.h
> >
> > +pca954x
> > +M: Patrick Venture <venture@google.com>
> > +S: Maintained
> > +F: hw/i2c/i2c_mux_pca954x.c
> > +F: include/hw/i2c/i2c_mux_pca954x.h
> > +
> >  Generic Loader
> >  M: Alistair Francis <alistair@alistair23.me>
> >  S: Maintained
> > diff --git a/hw/i2c/Kconfig b/hw/i2c/Kconfig
> > index 09642a6dcb..8d120a25d5 100644
> > --- a/hw/i2c/Kconfig
> > +++ b/hw/i2c/Kconfig
> > @@ -28,3 +28,7 @@ config IMX_I2C
> >  config MPC_I2C
> >      bool
> >      select I2C
> > +
> > +config PCA954X
> > +    bool
> > +    select I2C
> > diff --git a/hw/i2c/i2c_mux_pca954x.c b/hw/i2c/i2c_mux_pca954x.c
> > new file mode 100644
> > index 0000000000..9aa1a8872f
> > --- /dev/null
> > +++ b/hw/i2c/i2c_mux_pca954x.c
> > @@ -0,0 +1,290 @@
> > +/*
> > + * I2C multiplexer for PCA954x series of I2C multiplexer/switch chips.
> > + *
> > + * Copyright 2021 Google LLC
> > + *
> > + * This program is free software; you can redistribute it and/or modify it
> > + * under the terms of the GNU General Public License as published by the
> > + * Free Software Foundation; either version 2 of the License, or
> > + * (at your option) any later version.
> > + *
> > + * This program is distributed in the hope that it will be useful, but WITHOUT
> > + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> > + * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
> > + * for more details.
> > + */
> > +
> > +#include "qemu/osdep.h"
> > +#include "qapi/error.h"
> > +#include "hw/i2c/i2c.h"
> > +#include "hw/i2c/i2c_mux_pca954x.h"
> > +#include "hw/i2c/smbus_slave.h"
> > +#include "hw/qdev-core.h"
> > +#include "hw/sysbus.h"
> > +#include "qemu/log.h"
> > +#include "qemu/module.h"
> > +#include "qemu/queue.h"
> > +#include "qom/object.h"
> > +#include "trace.h"
> > +
> > +#define PCA9548_CHANNEL_COUNT 8
> > +#define PCA9546_CHANNEL_COUNT 4
> > +
> > +/*
> > + * struct Pca954xChannel - The i2c mux device will have N of these states
> > + * that own the i2c channel bus.
> > + * @bus: The owned channel bus.
> > + * @enabled: Is this channel active?
> > + */
> > +typedef struct Pca954xChannel {
> > +    SysBusDevice parent;
> > +
> > +    I2CBus       *bus;
> > +
> > +    bool         enabled;
> > +} Pca954xChannel;
> > +
> > +#define TYPE_PCA954X_CHANNEL "pca954x-channel"
> > +#define PCA954X_CHANNEL(obj) \
> > +    OBJECT_CHECK(Pca954xChannel, (obj), TYPE_PCA954X_CHANNEL)
> > +
> > +/*
> > + * struct Pca954xState - The pca954x state object.
> > + * @control: The value written to the mux control.
> > + * @channel: The set of i2c channel buses that act as channels which own the
> > + * i2c children.
> > + */
> > +typedef struct Pca954xState {
> > +    SMBusDevice parent;
> > +
> > +    uint8_t control;
> > +
> > +    /* The channel i2c buses. */
> > +    Pca954xChannel channel[PCA9548_CHANNEL_COUNT];
> > +} Pca954xState;
> > +
> > +/*
> > + * struct Pca954xClass - The pca954x class object.
> > + * @nchans: The number of i2c channels this device has.
> > + */
> > +typedef struct Pca954xClass {
> > +    SMBusDeviceClass parent;
> > +
> > +    uint8_t nchans;
> > +} Pca954xClass;
> > +
> > +#define TYPE_PCA954X "pca954x"
> > +OBJECT_DECLARE_TYPE(Pca954xState, Pca954xClass, PCA954X)
> > +
> > +/*
> > + * For each channel, if it's enabled, recursively call match on those children.
> > + */
> > +static bool pca954x_match(I2CSlave *candidate, uint8_t address,
> > +                          bool broadcast,
> > +                          I2CNodeList *current_devs)
> > +{
> > +    Pca954xState *mux = PCA954X(candidate);
> > +    Pca954xClass *mc = PCA954X_GET_CLASS(mux);
> > +    int i;
> > +
> > +    /* They are talking to the mux itself (or all devices enabled. */
>
> Missing close paren in the comment above.  Really minor nit :)

Ack, will fix in v3.

>
> > +    if ((candidate->address == address) || broadcast) {
> > +        I2CNode *node = g_malloc(sizeof(struct I2CNode));
> > +        node->elt = candidate;
> > +        QLIST_INSERT_HEAD(current_devs, node, next);
> > +        if (!broadcast) {
> > +            return true;
> > +        }
> > +    }
> > +
> > +    for (i = 0; i < mc->nchans; i++) {
> > +        if (!mux->channel[i].enabled) {
> > +            continue;
> > +        }
> > +
> > +        if (i2c_scan_bus(mux->channel[i].bus, address, broadcast)) {
> > +            if (!broadcast) {
> > +                return true;
> > +            }
> > +        }
> > +    }
> > +
> > +    /* If we arrived here we didn't find a match, return broadcast. */
> > +    return broadcast;
> > +}
> > +
> > +static void pca954x_enable_channel(Pca954xState *s, uint8_t enable_mask)
> > +{
> > +    Pca954xClass *mc = PCA954X_GET_CLASS(s);
> > +    int i;
> > +
> > +    /*
> > +     * For each channel, check if their bit is set in enable_mask and if yes,
> > +     * enable it, otherwise disable, hide it.
> > +     */
> > +    for (i = 0; i < mc->nchans; i++) {
> > +        if (enable_mask & (1 << i)) {
> > +            s->channel[i].enabled = true;
> > +        } else {
> > +            s->channel[i].enabled = false;
> > +        }
> > +    }
> > +}
> > +
> > +static void pca954x_write(Pca954xState *s, uint8_t data)
> > +{
> > +    s->control = data;
> > +    pca954x_enable_channel(s, data);
> > +
> > +    trace_pca954x_write_bytes(data);
> > +}
> > +
> > +static int pca954x_write_data(SMBusDevice *d, uint8_t *buf, uint8_t len)
> > +{
> > +    Pca954xState *s = PCA954X(d);
> > +
> > +    if (len == 0) {
> > +        qemu_log_mask(LOG_GUEST_ERROR, "%s: writing empty data\n", __func__);
> > +        return -1;
> > +    }
> > +
> > +    /*
> > +     * len should be 1, because they write one byte to enable/disable channels.
> > +     */
> > +    if (len > 1) {
> > +        qemu_log_mask(LOG_GUEST_ERROR,
> > +            "%s: extra data after channel selection mask\n",
> > +            __func__);
> > +        return -1;
> > +    }
> > +
> > +    pca954x_write(s, buf[0]);
> > +    return 0;
> > +}
> > +
> > +static uint8_t pca954x_read_byte(SMBusDevice *d)
> > +{
> > +    Pca954xState *s = PCA954X(d);
> > +    uint8_t data = s->control;
> > +    trace_pca954x_read_data(data);
> > +    return data;
> > +}
> > +
> > +static void pca954x_enter_reset(Object *obj, ResetType type)
> > +{
> > +    Pca954xState *s = PCA954X(obj);
> > +    /* Reset will disable all channels. */
> > +    pca954x_write(s, 0);
> > +}
> > +
> > +I2CBus *pca954x_i2c_get_bus(I2CSlave *mux, uint8_t channel)
> > +{
> > +    Pca954xClass *pc = PCA954X_GET_CLASS(mux);
> > +    Pca954xState *pca954x = PCA954X(mux);
> > +
> > +    g_assert(channel < pc->nchans);
> > +    return I2C_BUS(qdev_get_child_bus(DEVICE(&pca954x->channel[channel]),
> > +                                      "i2c-bus"));
> > +}
> > +
> > +static void pca954x_smbus_init(Object *obj)
> > +{
> > +    Pca954xChannel *s = PCA954X_CHANNEL(obj);
> > +    s->bus = i2c_init_bus(DEVICE(s), "i2c-bus");
> > +
> > +    /* Start all channels as disabled. */
> > +    s->enabled = false;
> > +}
> > +
> > +static void pca954x_channel_class_init(ObjectClass *klass, void *data)
> > +{
> > +    DeviceClass *dc = DEVICE_CLASS(klass);
> > +    dc->desc = "Pca954x Channel";
> > +}
> > +
> > +static void pca9546_class_init(ObjectClass *klass, void *data)
> > +{
> > +    Pca954xClass *s = PCA954X_CLASS(klass);
> > +    s->nchans = PCA9546_CHANNEL_COUNT;
> > +}
> > +
> > +static void pca9548_class_init(ObjectClass *oc, void *data)
> > +{
> > +    Pca954xClass *s = PCA954X_CLASS(oc);
> > +    s->nchans = PCA9548_CHANNEL_COUNT;
> > +}
> > +
> > +static void pca954x_realize(DeviceState *dev, Error **errp)
> > +{
> > +    Pca954xState *s = PCA954X(dev);
> > +    Pca954xClass *c = PCA954X_GET_CLASS(s);
> > +    int i;
> > +
> > +    /* SMBus modules. Cannot fail. */
> > +    for (i = 0; i < c->nchans; i++) {
> > +        Object *obj = OBJECT(&s->channel[i]);
> > +        sysbus_realize(SYS_BUS_DEVICE(obj), &error_abort);
> > +    }
> > +}
> > +
> > +static void pca954x_init(Object *obj)
> > +{
> > +    int i;
> > +    Pca954xState *s = PCA954X(obj);
> > +    Pca954xClass *c = PCA954X_GET_CLASS(obj);
> > +
> > +    /* Only initialize the children we expect. */
> > +    for (i = 0; i < c->nchans; i++) {
> > +        object_initialize_child(obj, "channel[*]", &s->channel[i],
> > +                                TYPE_PCA954X_CHANNEL);
> > +    }
> > +}
> > +
> > +static void pca954x_class_init(ObjectClass *klass, void *data)
> > +{
> > +    I2CSlaveClass *sc = I2C_SLAVE_CLASS(klass);
> > +    ResettableClass *rc = RESETTABLE_CLASS(klass);
> > +    DeviceClass *dc = DEVICE_CLASS(klass);
> > +    SMBusDeviceClass *k = SMBUS_DEVICE_CLASS(klass);
> > +
> > +    sc->match_and_add = pca954x_match;
> > +
> > +    rc->phases.enter = pca954x_enter_reset;
> > +
> > +    dc->desc = "Pca954x i2c-mux";
> > +    dc->realize = pca954x_realize;
> > +
> > +    k->write_data = pca954x_write_data;
> > +    k->receive_byte = pca954x_read_byte;
> > +}
> > +
> > +static const TypeInfo pca954x_info[] = {
> > +    {
> > +        .name          = TYPE_PCA954X,
> > +        .parent        = TYPE_SMBUS_DEVICE,
> > +        .instance_size = sizeof(Pca954xState),
> > +        .instance_init = pca954x_init,
> > +        .class_size    = sizeof(Pca954xClass),
> > +        .class_init    = pca954x_class_init,
> > +        .abstract      = true,
> > +    },
> > +    {
> > +        .name          = TYPE_PCA9546,
> > +        .parent        = TYPE_PCA954X,
> > +        .class_init    = pca9546_class_init,
> > +    },
> > +    {
> > +        .name          = TYPE_PCA9548,
> > +        .parent        = TYPE_PCA954X,
> > +        .class_init    = pca9548_class_init,
> > +    },
> > +    {
> > +        .name = TYPE_PCA954X_CHANNEL,
> > +        .parent = TYPE_SYS_BUS_DEVICE,
> > +        .class_init = pca954x_channel_class_init,
> > +        .instance_size = sizeof(Pca954xChannel),
> > +        .instance_init = pca954x_smbus_init,
> > +    }
> > +};
> > +
> > +DEFINE_TYPES(pca954x_info)
> > diff --git a/hw/i2c/meson.build b/hw/i2c/meson.build
> > index cdcd694a7f..dd3aef02b2 100644
> > --- a/hw/i2c/meson.build
> > +++ b/hw/i2c/meson.build
> > @@ -14,4 +14,5 @@ i2c_ss.add(when: 'CONFIG_SMBUS_EEPROM', if_true: files('smbus_eeprom.c'))
> >  i2c_ss.add(when: 'CONFIG_VERSATILE_I2C', if_true: files('versatile_i2c.c'))
> >  i2c_ss.add(when: 'CONFIG_OMAP', if_true: files('omap_i2c.c'))
> >  i2c_ss.add(when: 'CONFIG_PPC4XX', if_true: files('ppc4xx_i2c.c'))
> > +i2c_ss.add(when: 'CONFIG_PCA954X', if_true: files('i2c_mux_pca954x.c'))
> >  softmmu_ss.add_all(when: 'CONFIG_I2C', if_true: i2c_ss)
> > diff --git a/hw/i2c/trace-events b/hw/i2c/trace-events
> > index 82fe6f965f..82f19e6a2d 100644
> > --- a/hw/i2c/trace-events
> > +++ b/hw/i2c/trace-events
> > @@ -26,3 +26,8 @@ npcm7xx_smbus_recv_byte(const char *id, uint8_t value) "%s recv byte: 0x%02x"
> >  npcm7xx_smbus_stop(const char *id) "%s stopping"
> >  npcm7xx_smbus_nack(const char *id) "%s nacking"
> >  npcm7xx_smbus_recv_fifo(const char *id, uint8_t received, uint8_t expected) "%s recv fifo: received %u, expected %u"
> > +
> > +# i2c-mux-pca954x.c
> > +
> > +pca954x_write_bytes(uint8_t value) "PCA954X write data: 0x%02x"
> > +pca954x_read_data(uint8_t value) "PCA954X read data: 0x%02x"
> > diff --git a/include/hw/i2c/i2c_mux_pca954x.h b/include/hw/i2c/i2c_mux_pca954x.h
> > new file mode 100644
> > index 0000000000..8aaf9bbc39
> > --- /dev/null
> > +++ b/include/hw/i2c/i2c_mux_pca954x.h
> > @@ -0,0 +1,19 @@
> > +#ifndef QEMU_I2C_MUX_PCA954X
> > +#define QEMU_I2C_MUX_PCA954X
> > +
> > +#include "hw/i2c/i2c.h"
> > +
> > +#define TYPE_PCA9546 "pca9546"
> > +#define TYPE_PCA9548 "pca9548"
> > +
> > +/**
> > + * Retrieves the i2c bus associated with the specified channel on this i2c
> > + * mux.
> > + * @mux: an i2c mux device.
> > + * @channel: the i2c channel requested
> > + *
> > + * Returns: a pointer to the associated i2c bus.
> > + */
> > +I2CBus *pca954x_i2c_get_bus(I2CSlave *mux, uint8_t channel);
>
> I assume your machine-specific code will be referencing this, which is
> the way it should work.

Yes. The ARM board inits create these devices, and then have a pointer
to then request specific channels.

>
> I'm happy with this.
>
> -corey
>
> > +
> > +#endif
> > --
> > 2.31.1.295.g9ea45b61b8-goog
> >

