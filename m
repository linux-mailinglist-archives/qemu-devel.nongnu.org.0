Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD7273E869D
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Aug 2021 01:39:32 +0200 (CEST)
Received: from localhost ([::1]:59718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDbLH-0000g8-Sl
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 19:39:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1mDbJN-0007gO-RC; Tue, 10 Aug 2021 19:37:33 -0400
Received: from mail-oo1-xc2a.google.com ([2607:f8b0:4864:20::c2a]:34493)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1mDbJL-0002y2-Lz; Tue, 10 Aug 2021 19:37:33 -0400
Received: by mail-oo1-xc2a.google.com with SMTP id
 w2-20020a4a9e420000b02902859adadf0fso181052ook.1; 
 Tue, 10 Aug 2021 16:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:reply-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=tRPfRQ0gTDO30SXGnoMzIEJjcEoWQeiGuDiyVrctpUQ=;
 b=YKNO/N+1NnyCTga1r6JvZCHh7kxxDEZz59Xt0UvtwAc3Z8KpNxWS4EBxhyqATyZ7oU
 2YUm2qd1XIR/smKbMeGmmT02K83QBiQ+wG34xvv4IOK+p/jursZd630B/+OfhFHRFLZP
 enosmuHqP0KYkfn5vNxtGq8Z5g2ajZ6ZE+mVZR7cBftYeqhkuL41TXJ9qhlzC+6TNxnu
 Qb+efbNNKJVmrOfSf4dlBy46B64vW+tcfqratspwBFgHQODHPSTWnGT9EPR70KjBscBM
 cRKK6Nr+tawBJEdH7pShHCVGm5vV7nd4tl1jdvY2uDSawzbEzfm7kzD/wFx1zerMJwgR
 rLwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :reply-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=tRPfRQ0gTDO30SXGnoMzIEJjcEoWQeiGuDiyVrctpUQ=;
 b=gfHIx8khQDUxpMg77cP/rjnfDxUS49nJCqc1unZWErm/WziqpisVxWKcSlo9+Ow7Gq
 9nGKecpiKIYo3niNQZ5L3kA/mBvk3LhteofC1yViZFxruQa79hfLio/sosrvftwZMpID
 CT05NQMPSjFcxw3aABJeryB5To9SGeUQf8ZpI7LCw89Sr28CRG5cQDRQK3DFaYgIImle
 3ekA7ehyOJWokbGpo4gtToBoTpQPUNQtNIl++tanI1m3nSimEQm3vMT9Hh9kUB9jxdAf
 cjstxTawuGIXCcwwBvfhGZ24ev8Vx8D3YijYkmIHVKXrOGfDUX+XyyiAp6zuu9NdQFON
 FhGg==
X-Gm-Message-State: AOAM532kXaU+f0eaLYlJVY7kbqUROa4b60rzIfUyMZAb/V08ymsM4gF7
 ty1cXKUwaoi21az8fYiffA==
X-Google-Smtp-Source: ABdhPJzOM+yi/IEHxlho2dxrQNzmYC9BpqTvkSSa5MKkN83tjoKo7lvSF7pCuAwqG3LPj1uJQPcANQ==
X-Received: by 2002:a4a:d5d0:: with SMTP id a16mr20327740oot.18.1628638649477; 
 Tue, 10 Aug 2021 16:37:29 -0700 (PDT)
Received: from serve.minyard.net ([47.184.156.158])
 by smtp.gmail.com with ESMTPSA id t8sm2382151ool.20.2021.08.10.16.37.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Aug 2021 16:37:29 -0700 (PDT)
Received: from minyard.net (unknown
 [IPv6:2001:470:b8f6:1b:397e:8d59:b175:ef82])
 by serve.minyard.net (Postfix) with ESMTPSA id 5282818005A;
 Tue, 10 Aug 2021 23:37:28 +0000 (UTC)
Date: Tue, 10 Aug 2021 18:37:27 -0500
From: Corey Minyard <minyard@acm.org>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH 09/10] hw/misc: Add Infineon DPS310 sensor model
Message-ID: <20210810233727.GR3406@minyard.net>
References: <20210809131556.686260-1-clg@kaod.org>
 <20210809131556.686260-10-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210809131556.686260-10-clg@kaod.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2a;
 envelope-from=tcminyard@gmail.com; helo=mail-oo1-xc2a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Reply-To: minyard@acm.org
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Aug 09, 2021 at 03:15:55PM +0200, Cédric Le Goater wrote:
> From: Joel Stanley <joel@jms.id.au>
> 
> This contains some hardcoded register values that were obtained from the
> hardware after reading the temperature.
> 
> It does enough to test the Linux kernel driver. The FIFO mode, IRQs and
> operation modes other than the default as used by Linux are not modelled.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> [ clg: Fix sequential reading ]
> Message-Id: <20210616073358.750472-2-joel@jms.id.au>
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> Message-Id: <20210629142336.750058-4-clg@kaod.org>
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>  hw/misc/dps310.c    | 227 ++++++++++++++++++++++++++++++++++++++++++++

Can this go into hw/sensor?

-corey

>  hw/arm/Kconfig      |   1 +
>  hw/misc/Kconfig     |   4 +
>  hw/misc/meson.build |   1 +
>  4 files changed, 233 insertions(+)
>  create mode 100644 hw/misc/dps310.c
> 
> diff --git a/hw/misc/dps310.c b/hw/misc/dps310.c
> new file mode 100644
> index 000000000000..893521ab8516
> --- /dev/null
> +++ b/hw/misc/dps310.c
> @@ -0,0 +1,227 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright 2017-2021 Joel Stanley <joel@jms.id.au>, IBM Corporation
> + *
> + * Infineon DPS310 temperature and humidity sensor
> + *
> + * https://www.infineon.com/cms/en/product/sensor/pressure-sensors/pressure-sensors-for-iot/dps310/
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/log.h"
> +#include "hw/hw.h"
> +#include "hw/i2c/i2c.h"
> +#include "qapi/error.h"
> +#include "qapi/visitor.h"
> +#include "migration/vmstate.h"
> +
> +#define NUM_REGISTERS   0x33
> +
> +typedef struct DPS310State {
> +    /*< private >*/
> +    I2CSlave i2c;
> +
> +    /*< public >*/
> +    uint8_t regs[NUM_REGISTERS];
> +
> +    uint8_t len;
> +    uint8_t pointer;
> +
> +} DPS310State;
> +
> +#define TYPE_DPS310 "dps310"
> +#define DPS310(obj) OBJECT_CHECK(DPS310State, (obj), TYPE_DPS310)
> +
> +#define DPS310_PRS_B2           0x00
> +#define DPS310_PRS_B1           0x01
> +#define DPS310_PRS_B0           0x02
> +#define DPS310_TMP_B2           0x03
> +#define DPS310_TMP_B1           0x04
> +#define DPS310_TMP_B0           0x05
> +#define DPS310_PRS_CFG          0x06
> +#define DPS310_TMP_CFG          0x07
> +#define  DPS310_TMP_RATE_BITS   (0x70)
> +#define DPS310_MEAS_CFG         0x08
> +#define  DPS310_MEAS_CTRL_BITS  (0x07)
> +#define   DPS310_PRESSURE_EN    BIT(0)
> +#define   DPS310_TEMP_EN        BIT(1)
> +#define   DPS310_BACKGROUND     BIT(2)
> +#define  DPS310_PRS_RDY         BIT(4)
> +#define  DPS310_TMP_RDY         BIT(5)
> +#define  DPS310_SENSOR_RDY      BIT(6)
> +#define  DPS310_COEF_RDY        BIT(7)
> +#define DPS310_CFG_REG          0x09
> +#define DPS310_RESET            0x0c
> +#define  DPS310_RESET_MAGIC     (BIT(0) | BIT(3))
> +#define DPS310_COEF_BASE        0x10
> +#define DPS310_COEF_LAST        0x21
> +#define DPS310_COEF_SRC         0x28
> +
> +static void dps310_reset(DeviceState *dev)
> +{
> +    DPS310State *s = DPS310(dev);
> +
> +    static const uint8_t regs_reset_state[] = {
> +        0xfe, 0x2f, 0xee, 0x02, 0x69, 0xa6, 0x00, 0x80, 0xc7, 0x00, 0x00, 0x00,
> +        0x00, 0x10, 0x00, 0x00, 0x0e, 0x1e, 0xdd, 0x13, 0xca, 0x5f, 0x21, 0x52,
> +        0xf9, 0xc6, 0x04, 0xd1, 0xdb, 0x47, 0x00, 0x5b, 0xfb, 0x3a, 0x00, 0x00,
> +        0x20, 0x49, 0x4e, 0xa5, 0x90, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +        0x60, 0x15, 0x02
> +    };
> +
> +    QEMU_BUILD_BUG_ON(sizeof(regs_reset_state) != sizeof(s->regs));
> +
> +    memcpy(s->regs, regs_reset_state, sizeof(s->regs));
> +    s->pointer = 0;
> +
> +    /* TODO: assert these after some timeout ? */
> +    s->regs[DPS310_MEAS_CFG] = DPS310_COEF_RDY | DPS310_SENSOR_RDY
> +        | DPS310_TMP_RDY | DPS310_PRS_RDY;
> +}
> +
> +static uint8_t dps310_read(DPS310State *s, uint8_t reg)
> +{
> +    if (reg >= sizeof(s->regs)) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: register 0x%02x out of bounds\n",
> +                      __func__, s->pointer);
> +        return 0xFF;
> +    }
> +
> +    switch (reg) {
> +    case DPS310_PRS_B2:
> +    case DPS310_PRS_B1:
> +    case DPS310_PRS_B0:
> +    case DPS310_TMP_B2:
> +    case DPS310_TMP_B1:
> +    case DPS310_TMP_B0:
> +    case DPS310_PRS_CFG:
> +    case DPS310_TMP_CFG:
> +    case DPS310_MEAS_CFG:
> +    case DPS310_CFG_REG:
> +    case DPS310_COEF_BASE...DPS310_COEF_LAST:
> +    case DPS310_COEF_SRC:
> +    case 0x32: /* Undocumented register to indicate workaround not required */
> +        return s->regs[reg];
> +    default:
> +        qemu_log_mask(LOG_UNIMP, "%s: register 0x%02x unimplemented\n",
> +                      __func__, reg);
> +        return 0xFF;
> +    }
> +}
> +
> +static void dps310_write(DPS310State *s, uint8_t reg, uint8_t data)
> +{
> +    if (reg >= sizeof(s->regs)) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: register %d out of bounds\n",
> +                      __func__, s->pointer);
> +        return;
> +    }
> +
> +    switch (reg) {
> +    case DPS310_RESET:
> +        if (data == DPS310_RESET_MAGIC) {
> +            device_cold_reset(DEVICE(s));
> +        }
> +        break;
> +    case DPS310_PRS_CFG:
> +    case DPS310_TMP_CFG:
> +    case DPS310_MEAS_CFG:
> +    case DPS310_CFG_REG:
> +        s->regs[reg] = data;
> +        break;
> +    default:
> +        qemu_log_mask(LOG_UNIMP, "%s: register 0x%02x unimplemented\n",
> +                      __func__, reg);
> +        return;
> +    }
> +}
> +
> +static uint8_t dps310_rx(I2CSlave *i2c)
> +{
> +    DPS310State *s = DPS310(i2c);
> +
> +    if (s->len == 1) {
> +        return dps310_read(s, s->pointer++);
> +    } else {
> +        return 0xFF;
> +    }
> +}
> +
> +static int dps310_tx(I2CSlave *i2c, uint8_t data)
> +{
> +    DPS310State *s = DPS310(i2c);
> +
> +    if (s->len == 0) {
> +        /*
> +         * first byte is the register pointer for a read or write
> +         * operation
> +         */
> +        s->pointer = data;
> +        s->len++;
> +    } else if (s->len == 1) {
> +        dps310_write(s, s->pointer++, data);
> +    }
> +
> +    return 0;
> +}
> +
> +static int dps310_event(I2CSlave *i2c, enum i2c_event event)
> +{
> +    DPS310State *s = DPS310(i2c);
> +
> +    switch (event) {
> +    case I2C_START_SEND:
> +        s->pointer = 0xFF;
> +        s->len = 0;
> +        break;
> +    case I2C_START_RECV:
> +        if (s->len != 1) {
> +            qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid recv sequence\n",
> +                          __func__);
> +        }
> +        break;
> +    default:
> +        break;
> +    }
> +
> +    return 0;
> +}
> +
> +static const VMStateDescription vmstate_dps310 = {
> +    .name = "DPS310",
> +    .version_id = 0,
> +    .minimum_version_id = 0,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_UINT8(len, DPS310State),
> +        VMSTATE_UINT8_ARRAY(regs, DPS310State, NUM_REGISTERS),
> +        VMSTATE_UINT8(pointer, DPS310State),
> +        VMSTATE_I2C_SLAVE(i2c, DPS310State),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
> +static void dps310_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +    I2CSlaveClass *k = I2C_SLAVE_CLASS(klass);
> +
> +    k->event = dps310_event;
> +    k->recv = dps310_rx;
> +    k->send = dps310_tx;
> +    dc->reset = dps310_reset;
> +    dc->vmsd = &vmstate_dps310;
> +}
> +
> +static const TypeInfo dps310_info = {
> +    .name          = TYPE_DPS310,
> +    .parent        = TYPE_I2C_SLAVE,
> +    .instance_size = sizeof(DPS310State),
> +    .class_init    = dps310_class_init,
> +};
> +
> +static void dps310_register_types(void)
> +{
> +    type_register_static(&dps310_info);
> +}
> +
> +type_init(dps310_register_types)
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 4ba0aca0676b..2c4e2df470d2 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -429,6 +429,7 @@ config ASPEED_SOC
>      select DS1338
>      select FTGMAC100
>      select I2C
> +    select DPS310
>      select PCA9552
>      select SERIAL
>      select SMBUS_EEPROM
> diff --git a/hw/misc/Kconfig b/hw/misc/Kconfig
> index 507058d8bffb..1c913dc3b837 100644
> --- a/hw/misc/Kconfig
> +++ b/hw/misc/Kconfig
> @@ -34,6 +34,10 @@ config EDU
>      default y if TEST_DEVICES
>      depends on PCI && MSI_NONBROKEN
>  
> +config DPS310
> +    bool
> +    depends on I2C
> +
>  config PCA9552
>      bool
>      depends on I2C
> diff --git a/hw/misc/meson.build b/hw/misc/meson.build
> index a53b849a5a0b..93b90ecd39e4 100644
> --- a/hw/misc/meson.build
> +++ b/hw/misc/meson.build
> @@ -1,4 +1,5 @@
>  softmmu_ss.add(when: 'CONFIG_APPLESMC', if_true: files('applesmc.c'))
> +softmmu_ss.add(when: 'CONFIG_DPS310', if_true: files('dps310.c'))
>  softmmu_ss.add(when: 'CONFIG_EDU', if_true: files('edu.c'))
>  softmmu_ss.add(when: 'CONFIG_FW_CFG_DMA', if_true: files('vmcoreinfo.c'))
>  softmmu_ss.add(when: 'CONFIG_ISA_DEBUG', if_true: files('debugexit.c'))
> -- 
> 2.31.1
> 
> 

