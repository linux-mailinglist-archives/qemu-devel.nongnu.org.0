Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 798713E87A8
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Aug 2021 03:28:42 +0200 (CEST)
Received: from localhost ([::1]:59906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDd2u-0003xt-TK
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 21:28:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1mDczp-0002u5-4v; Tue, 10 Aug 2021 21:25:29 -0400
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30]:42820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1mDczk-0004CU-NM; Tue, 10 Aug 2021 21:25:28 -0400
Received: by mail-qv1-xf30.google.com with SMTP id f91so316826qva.9;
 Tue, 10 Aug 2021 18:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=OdXFDlIJlvou0iE6HOe32rXD2oDT0MNgdVve259oayc=;
 b=KINxFIfZVQDBxCSenHzmb3Xy9kS8lwq6zcLg/cyKBcY0hWCgUZ4Cqu3fqSPdsqgW3A
 SWchSculJBf/hZDQutNeii9WGTqMc86SUo9M1S6fyGphBVvuE3qpoWcRsbI+tDjL6bMh
 iJPU5/vqlR2YpuK/cLPIAJKU1p0wS/ft5TcQ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=OdXFDlIJlvou0iE6HOe32rXD2oDT0MNgdVve259oayc=;
 b=V3F4wEius4YtdN5T/c5v1re3Y6PG5JoA57ILJx9J/MvkfusmTCdRP/HXw3K0WRN2fU
 Tn8TNaIMppYmdVAhqht0MniYvAOosAk1at+qtG6ji4xtaXLyOr40wVixHxRKCocxnlJ9
 6za9LcBn2WFlJ8ZJiFcSO2BXG1MRq64mz5m+7ZKF2U1mFhSpRHOy43VlqXRyJQA1SVza
 p50mRzsPeIEL+e5DoElTOXfYUk4nBibBQmzg5Lc8CMPitbY4/398ZJIMs43TeqMzTeYg
 1ROTk+KT1HG1R2fkOcsPnGl6URXdvMDzVI2UfsWCKhtiishHOJ/6+4sbVwWeB0pwvQ2D
 vbxg==
X-Gm-Message-State: AOAM532PilErgd/ffVUACGem625NcMPgLe5NxPxcs5dML6zC2JpjvMEq
 qvPTP3yylpl1AGQuEm+WVuYdzknxfyh/NG1T4Oc=
X-Google-Smtp-Source: ABdhPJy46MAIG5umxdYIu5UD72RFm564HxERsNMAC4MwbkE4IDxRtx6AwSlZvLmm4j07R8BpQpA4DTJjHIlEPRrpY7Y=
X-Received: by 2002:a05:6214:501d:: with SMTP id
 jo29mr20411284qvb.43.1628645123348; 
 Tue, 10 Aug 2021 18:25:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210809131556.686260-1-clg@kaod.org>
 <20210809131556.686260-10-clg@kaod.org>
 <20210810233727.GR3406@minyard.net>
In-Reply-To: <20210810233727.GR3406@minyard.net>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 11 Aug 2021 01:25:11 +0000
Message-ID: <CACPK8XdL_s5AqdRH=VW_Csu7oWPvaD48LL8wz9B0X4jckJDLig@mail.gmail.com>
Subject: Re: [PATCH 09/10] hw/misc: Add Infineon DPS310 sensor model
To: Corey Minyard <minyard@acm.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::f30;
 envelope-from=joel.stan@gmail.com; helo=mail-qv1-xf30.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 10 Aug 2021 at 23:37, Corey Minyard <minyard@acm.org> wrote:
>
> On Mon, Aug 09, 2021 at 03:15:55PM +0200, C=C3=A9dric Le Goater wrote:
> > From: Joel Stanley <joel@jms.id.au>
> >
> > This contains some hardcoded register values that were obtained from th=
e
> > hardware after reading the temperature.
> >
> > It does enough to test the Linux kernel driver. The FIFO mode, IRQs and
> > operation modes other than the default as used by Linux are not modelle=
d.
> >
> > Signed-off-by: Joel Stanley <joel@jms.id.au>
> > [ clg: Fix sequential reading ]
> > Message-Id: <20210616073358.750472-2-joel@jms.id.au>
> > Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> > Message-Id: <20210629142336.750058-4-clg@kaod.org>
> > Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> > ---
> >  hw/misc/dps310.c    | 227 ++++++++++++++++++++++++++++++++++++++++++++
>
> Can this go into hw/sensor?

For sure. I wrote it four years ago, when obviously hw/sensor didn't exist.

>
> -corey
>
> >  hw/arm/Kconfig      |   1 +
> >  hw/misc/Kconfig     |   4 +
> >  hw/misc/meson.build |   1 +
> >  4 files changed, 233 insertions(+)
> >  create mode 100644 hw/misc/dps310.c
> >
> > diff --git a/hw/misc/dps310.c b/hw/misc/dps310.c
> > new file mode 100644
> > index 000000000000..893521ab8516
> > --- /dev/null
> > +++ b/hw/misc/dps310.c
> > @@ -0,0 +1,227 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +/*
> > + * Copyright 2017-2021 Joel Stanley <joel@jms.id.au>, IBM Corporation
> > + *
> > + * Infineon DPS310 temperature and humidity sensor
> > + *
> > + * https://www.infineon.com/cms/en/product/sensor/pressure-sensors/pre=
ssure-sensors-for-iot/dps310/
> > + */
> > +
> > +#include "qemu/osdep.h"
> > +#include "qemu/log.h"
> > +#include "hw/hw.h"
> > +#include "hw/i2c/i2c.h"
> > +#include "qapi/error.h"
> > +#include "qapi/visitor.h"
> > +#include "migration/vmstate.h"
> > +
> > +#define NUM_REGISTERS   0x33
> > +
> > +typedef struct DPS310State {
> > +    /*< private >*/
> > +    I2CSlave i2c;
> > +
> > +    /*< public >*/
> > +    uint8_t regs[NUM_REGISTERS];
> > +
> > +    uint8_t len;
> > +    uint8_t pointer;
> > +
> > +} DPS310State;
> > +
> > +#define TYPE_DPS310 "dps310"
> > +#define DPS310(obj) OBJECT_CHECK(DPS310State, (obj), TYPE_DPS310)
> > +
> > +#define DPS310_PRS_B2           0x00
> > +#define DPS310_PRS_B1           0x01
> > +#define DPS310_PRS_B0           0x02
> > +#define DPS310_TMP_B2           0x03
> > +#define DPS310_TMP_B1           0x04
> > +#define DPS310_TMP_B0           0x05
> > +#define DPS310_PRS_CFG          0x06
> > +#define DPS310_TMP_CFG          0x07
> > +#define  DPS310_TMP_RATE_BITS   (0x70)
> > +#define DPS310_MEAS_CFG         0x08
> > +#define  DPS310_MEAS_CTRL_BITS  (0x07)
> > +#define   DPS310_PRESSURE_EN    BIT(0)
> > +#define   DPS310_TEMP_EN        BIT(1)
> > +#define   DPS310_BACKGROUND     BIT(2)
> > +#define  DPS310_PRS_RDY         BIT(4)
> > +#define  DPS310_TMP_RDY         BIT(5)
> > +#define  DPS310_SENSOR_RDY      BIT(6)
> > +#define  DPS310_COEF_RDY        BIT(7)
> > +#define DPS310_CFG_REG          0x09
> > +#define DPS310_RESET            0x0c
> > +#define  DPS310_RESET_MAGIC     (BIT(0) | BIT(3))
> > +#define DPS310_COEF_BASE        0x10
> > +#define DPS310_COEF_LAST        0x21
> > +#define DPS310_COEF_SRC         0x28
> > +
> > +static void dps310_reset(DeviceState *dev)
> > +{
> > +    DPS310State *s =3D DPS310(dev);
> > +
> > +    static const uint8_t regs_reset_state[] =3D {
> > +        0xfe, 0x2f, 0xee, 0x02, 0x69, 0xa6, 0x00, 0x80, 0xc7, 0x00, 0x=
00, 0x00,
> > +        0x00, 0x10, 0x00, 0x00, 0x0e, 0x1e, 0xdd, 0x13, 0xca, 0x5f, 0x=
21, 0x52,
> > +        0xf9, 0xc6, 0x04, 0xd1, 0xdb, 0x47, 0x00, 0x5b, 0xfb, 0x3a, 0x=
00, 0x00,
> > +        0x20, 0x49, 0x4e, 0xa5, 0x90, 0x00, 0x00, 0x00, 0x00, 0x00, 0x=
00, 0x00,
> > +        0x60, 0x15, 0x02
> > +    };
> > +
> > +    QEMU_BUILD_BUG_ON(sizeof(regs_reset_state) !=3D sizeof(s->regs));
> > +
> > +    memcpy(s->regs, regs_reset_state, sizeof(s->regs));
> > +    s->pointer =3D 0;
> > +
> > +    /* TODO: assert these after some timeout ? */
> > +    s->regs[DPS310_MEAS_CFG] =3D DPS310_COEF_RDY | DPS310_SENSOR_RDY
> > +        | DPS310_TMP_RDY | DPS310_PRS_RDY;
> > +}
> > +
> > +static uint8_t dps310_read(DPS310State *s, uint8_t reg)
> > +{
> > +    if (reg >=3D sizeof(s->regs)) {
> > +        qemu_log_mask(LOG_GUEST_ERROR, "%s: register 0x%02x out of bou=
nds\n",
> > +                      __func__, s->pointer);
> > +        return 0xFF;
> > +    }
> > +
> > +    switch (reg) {
> > +    case DPS310_PRS_B2:
> > +    case DPS310_PRS_B1:
> > +    case DPS310_PRS_B0:
> > +    case DPS310_TMP_B2:
> > +    case DPS310_TMP_B1:
> > +    case DPS310_TMP_B0:
> > +    case DPS310_PRS_CFG:
> > +    case DPS310_TMP_CFG:
> > +    case DPS310_MEAS_CFG:
> > +    case DPS310_CFG_REG:
> > +    case DPS310_COEF_BASE...DPS310_COEF_LAST:
> > +    case DPS310_COEF_SRC:
> > +    case 0x32: /* Undocumented register to indicate workaround not req=
uired */
> > +        return s->regs[reg];
> > +    default:
> > +        qemu_log_mask(LOG_UNIMP, "%s: register 0x%02x unimplemented\n"=
,
> > +                      __func__, reg);
> > +        return 0xFF;
> > +    }
> > +}
> > +
> > +static void dps310_write(DPS310State *s, uint8_t reg, uint8_t data)
> > +{
> > +    if (reg >=3D sizeof(s->regs)) {
> > +        qemu_log_mask(LOG_GUEST_ERROR, "%s: register %d out of bounds\=
n",
> > +                      __func__, s->pointer);
> > +        return;
> > +    }
> > +
> > +    switch (reg) {
> > +    case DPS310_RESET:
> > +        if (data =3D=3D DPS310_RESET_MAGIC) {
> > +            device_cold_reset(DEVICE(s));
> > +        }
> > +        break;
> > +    case DPS310_PRS_CFG:
> > +    case DPS310_TMP_CFG:
> > +    case DPS310_MEAS_CFG:
> > +    case DPS310_CFG_REG:
> > +        s->regs[reg] =3D data;
> > +        break;
> > +    default:
> > +        qemu_log_mask(LOG_UNIMP, "%s: register 0x%02x unimplemented\n"=
,
> > +                      __func__, reg);
> > +        return;
> > +    }
> > +}
> > +
> > +static uint8_t dps310_rx(I2CSlave *i2c)
> > +{
> > +    DPS310State *s =3D DPS310(i2c);
> > +
> > +    if (s->len =3D=3D 1) {
> > +        return dps310_read(s, s->pointer++);
> > +    } else {
> > +        return 0xFF;
> > +    }
> > +}
> > +
> > +static int dps310_tx(I2CSlave *i2c, uint8_t data)
> > +{
> > +    DPS310State *s =3D DPS310(i2c);
> > +
> > +    if (s->len =3D=3D 0) {
> > +        /*
> > +         * first byte is the register pointer for a read or write
> > +         * operation
> > +         */
> > +        s->pointer =3D data;
> > +        s->len++;
> > +    } else if (s->len =3D=3D 1) {
> > +        dps310_write(s, s->pointer++, data);
> > +    }
> > +
> > +    return 0;
> > +}
> > +
> > +static int dps310_event(I2CSlave *i2c, enum i2c_event event)
> > +{
> > +    DPS310State *s =3D DPS310(i2c);
> > +
> > +    switch (event) {
> > +    case I2C_START_SEND:
> > +        s->pointer =3D 0xFF;
> > +        s->len =3D 0;
> > +        break;
> > +    case I2C_START_RECV:
> > +        if (s->len !=3D 1) {
> > +            qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid recv sequence\=
n",
> > +                          __func__);
> > +        }
> > +        break;
> > +    default:
> > +        break;
> > +    }
> > +
> > +    return 0;
> > +}
> > +
> > +static const VMStateDescription vmstate_dps310 =3D {
> > +    .name =3D "DPS310",
> > +    .version_id =3D 0,
> > +    .minimum_version_id =3D 0,
> > +    .fields =3D (VMStateField[]) {
> > +        VMSTATE_UINT8(len, DPS310State),
> > +        VMSTATE_UINT8_ARRAY(regs, DPS310State, NUM_REGISTERS),
> > +        VMSTATE_UINT8(pointer, DPS310State),
> > +        VMSTATE_I2C_SLAVE(i2c, DPS310State),
> > +        VMSTATE_END_OF_LIST()
> > +    }
> > +};
> > +
> > +static void dps310_class_init(ObjectClass *klass, void *data)
> > +{
> > +    DeviceClass *dc =3D DEVICE_CLASS(klass);
> > +    I2CSlaveClass *k =3D I2C_SLAVE_CLASS(klass);
> > +
> > +    k->event =3D dps310_event;
> > +    k->recv =3D dps310_rx;
> > +    k->send =3D dps310_tx;
> > +    dc->reset =3D dps310_reset;
> > +    dc->vmsd =3D &vmstate_dps310;
> > +}
> > +
> > +static const TypeInfo dps310_info =3D {
> > +    .name          =3D TYPE_DPS310,
> > +    .parent        =3D TYPE_I2C_SLAVE,
> > +    .instance_size =3D sizeof(DPS310State),
> > +    .class_init    =3D dps310_class_init,
> > +};
> > +
> > +static void dps310_register_types(void)
> > +{
> > +    type_register_static(&dps310_info);
> > +}
> > +
> > +type_init(dps310_register_types)
> > diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> > index 4ba0aca0676b..2c4e2df470d2 100644
> > --- a/hw/arm/Kconfig
> > +++ b/hw/arm/Kconfig
> > @@ -429,6 +429,7 @@ config ASPEED_SOC
> >      select DS1338
> >      select FTGMAC100
> >      select I2C
> > +    select DPS310
> >      select PCA9552
> >      select SERIAL
> >      select SMBUS_EEPROM
> > diff --git a/hw/misc/Kconfig b/hw/misc/Kconfig
> > index 507058d8bffb..1c913dc3b837 100644
> > --- a/hw/misc/Kconfig
> > +++ b/hw/misc/Kconfig
> > @@ -34,6 +34,10 @@ config EDU
> >      default y if TEST_DEVICES
> >      depends on PCI && MSI_NONBROKEN
> >
> > +config DPS310
> > +    bool
> > +    depends on I2C
> > +
> >  config PCA9552
> >      bool
> >      depends on I2C
> > diff --git a/hw/misc/meson.build b/hw/misc/meson.build
> > index a53b849a5a0b..93b90ecd39e4 100644
> > --- a/hw/misc/meson.build
> > +++ b/hw/misc/meson.build
> > @@ -1,4 +1,5 @@
> >  softmmu_ss.add(when: 'CONFIG_APPLESMC', if_true: files('applesmc.c'))
> > +softmmu_ss.add(when: 'CONFIG_DPS310', if_true: files('dps310.c'))
> >  softmmu_ss.add(when: 'CONFIG_EDU', if_true: files('edu.c'))
> >  softmmu_ss.add(when: 'CONFIG_FW_CFG_DMA', if_true: files('vmcoreinfo.c=
'))
> >  softmmu_ss.add(when: 'CONFIG_ISA_DEBUG', if_true: files('debugexit.c')=
)
> > --
> > 2.31.1
> >
> >

