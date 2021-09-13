Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34026409414
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 16:27:09 +0200 (CEST)
Received: from localhost ([::1]:39450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPmvM-00084G-9e
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 10:27:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPmlw-0003OX-FI
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 10:17:24 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:43930)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPmls-0002V5-7J
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 10:17:23 -0400
Received: by mail-wr1-x42a.google.com with SMTP id b6so14941612wrh.10
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 07:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wmlaXx6GHxoRhPXE6C7Nep6pRd5XEGRbkmxohQZcfsk=;
 b=BNdFHWTcEMOAzjhvJbthV+48CS5CceTHRXYy2D5Brb+c1DC7agbziHfoBbBsEzIW6k
 FwTjDNtonCLhcD72+Wa37gW1NwXi6ddh4YROnd3wWJ65dlImIirzSocHIIR2QhleN9tq
 n1IJ1iiPVQ1jwRKVcEFXJTnpY4oi/CrsI6+cJBl0oHiLtBN6bKL+0nI31kF+mBqDVohK
 wflGWIVd24WLZ1ncZEs8CWbI96TkZI77uLwq8Fzqw6VKGpbsJ/Hw1zj9Xi58vBIdm/hP
 s/QPH95UI8owR51M+83QfpD2GBKnFntDNfUCJzUS5MY9i0u32MIJlmY8lrjUxxbkgnUL
 SAWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wmlaXx6GHxoRhPXE6C7Nep6pRd5XEGRbkmxohQZcfsk=;
 b=Xd5DCmp6qMpDMpqJXk3GizNat7Yna518aOF9tGSZ0TC5QJC8rfGCaWFQMv+XIvLNQH
 +IRpmi2YETqIb7ACtLOguD9GELQRBJ1BE8lU/ljJmVJMWFVxD2AAe/v/o3QDJ3VWTwO0
 F1liJMAs8dW1DxkbFlDKLt7OeBWYDq5XdvUhlixDukAZzgNmVwwBmAlrz3iqzOK2cOEn
 6XC9xQ6FposMLPV53Jgd+qQjrOZXSIsDxtkiYR0+hhri+ojLGAWR4UWnQ3IU9EQI4la6
 cdT04fTDEyasyIcb6FO1WggflJiomLxxoUn7jnQZFHeZlXhTMJrCvbWRnk5HhRJz8yn5
 t2Sw==
X-Gm-Message-State: AOAM531rjagrV46HlTJBib6AfjNBEkHyz5PEZ+DlTKPTL+ppTuJqvg0X
 hh0KQX+BO0aznqFuHHplWtqDQEs9ijPkLHmFPcTGZQ==
X-Google-Smtp-Source: ABdhPJyU3ASbFS8NayHl/SSGR7lUImMKUGT4Dm0NU+A3Af6wRJibE8n0aXww3l12M+PQKRsWJb/Mz3kkVP4aCe8afYo=
X-Received: by 2002:adf:fd12:: with SMTP id e18mr8834847wrr.275.1631542638342; 
 Mon, 13 Sep 2021 07:17:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210907232555.3268967-1-wuhaotsh@google.com>
 <20210907232555.3268967-3-wuhaotsh@google.com>
In-Reply-To: <20210907232555.3268967-3-wuhaotsh@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Sep 2021 15:16:27 +0100
Message-ID: <CAFEAcA8R5AkFqpeWymbMfZygzk=TvXFgTGb8GobTaYtR1ozXTg@mail.gmail.com>
Subject: Re: [PATCH 2/4] hw/sd: add nuvoton MMC
To: Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Qemu-block <qemu-block@nongnu.org>, Patrick Venture <venture@google.com>,
 Shengtan Mao <stmao@google.com>, Bin Meng <bin.meng@windriver.com>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 QEMU Developers <qemu-devel@nongnu.org>, CS20 KFTing <kfting@nuvoton.com>,
 qemu-arm <qemu-arm@nongnu.org>, IS20 Avi Fishman <Avi.Fishman@nuvoton.com>,
 Chris Rauer <crauer@google.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 8 Sept 2021 at 00:26, Hao Wu <wuhaotsh@google.com> wrote:
>
> From: Shengtan Mao <stmao@google.com>
>
> Signed-off-by: Shengtan Mao <stmao@google.com>
> Reviewed-by: Hao Wu <wuhaotsh@google.com>
> Reviewed-by: Chris Rauer <crauer@google.com>
> Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
> ---
>  hw/arm/npcm7xx.c              |  12 +++-
>  hw/sd/meson.build             |   1 +
>  hw/sd/npcm7xx_sdhci.c         | 131 ++++++++++++++++++++++++++++++++++
>  include/hw/arm/npcm7xx.h      |   2 +
>  include/hw/sd/npcm7xx_sdhci.h |  65 +++++++++++++++++
>  5 files changed, 210 insertions(+), 1 deletion(-)
>  create mode 100644 hw/sd/npcm7xx_sdhci.c
>  create mode 100644 include/hw/sd/npcm7xx_sdhci.h
>
> diff --git a/hw/arm/npcm7xx.c b/hw/arm/npcm7xx.c
> index 2ab0080e0b..878c2208e0 100644
> --- a/hw/arm/npcm7xx.c
> +++ b/hw/arm/npcm7xx.c
> @@ -63,6 +63,8 @@
>  #define NPCM7XX_ROM_BA          (0xffff0000)
>  #define NPCM7XX_ROM_SZ          (64 * KiB)
>
> +/* SDHCI Modules */
> +#define NPCM7XX_MMC_BA          (0xf0842000)
>
>  /* Clock configuration values to be fixed up when bypassing bootloader */
>
> @@ -83,6 +85,7 @@ enum NPCM7xxInterrupt {
>      NPCM7XX_UART3_IRQ,
>      NPCM7XX_EMC1RX_IRQ          = 15,
>      NPCM7XX_EMC1TX_IRQ,
> +    NPCM7XX_MMC_IRQ             = 26,
>      NPCM7XX_TIMER0_IRQ          = 32,   /* Timer Module 0 */
>      NPCM7XX_TIMER1_IRQ,
>      NPCM7XX_TIMER2_IRQ,
> @@ -443,6 +446,8 @@ static void npcm7xx_init(Object *obj)
>      for (i = 0; i < ARRAY_SIZE(s->emc); i++) {
>          object_initialize_child(obj, "emc[*]", &s->emc[i], TYPE_NPCM7XX_EMC);
>      }
> +
> +    object_initialize_child(obj, "mmc", &s->mmc, TYPE_NPCM7XX_SDHCI);
>  }
>
>  static void npcm7xx_realize(DeviceState *dev, Error **errp)
> @@ -707,6 +712,12 @@ static void npcm7xx_realize(DeviceState *dev, Error **errp)
>                             &error_abort);
>      memory_region_add_subregion(get_system_memory(), NPCM7XX_ROM_BA, &s->irom);
>
> +    /* SDHCI */
> +    sysbus_realize(SYS_BUS_DEVICE(&s->mmc), &error_abort);
> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->mmc), 0, NPCM7XX_MMC_BA);
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->mmc), 0,
> +            npcm7xx_irq(s, NPCM7XX_MMC_IRQ));
> +
>      create_unimplemented_device("npcm7xx.shm",          0xc0001000,   4 * KiB);
>      create_unimplemented_device("npcm7xx.vdmx",         0xe0800000,   4 * KiB);
>      create_unimplemented_device("npcm7xx.pcierc",       0xe1000000,  64 * KiB);
> @@ -736,7 +747,6 @@ static void npcm7xx_realize(DeviceState *dev, Error **errp)
>      create_unimplemented_device("npcm7xx.usbd[8]",      0xf0838000,   4 * KiB);
>      create_unimplemented_device("npcm7xx.usbd[9]",      0xf0839000,   4 * KiB);
>      create_unimplemented_device("npcm7xx.sd",           0xf0840000,   8 * KiB);
> -    create_unimplemented_device("npcm7xx.mmc",          0xf0842000,   8 * KiB);
>      create_unimplemented_device("npcm7xx.pcimbx",       0xf0848000, 512 * KiB);
>      create_unimplemented_device("npcm7xx.aes",          0xf0858000,   4 * KiB);
>      create_unimplemented_device("npcm7xx.des",          0xf0859000,   4 * KiB);

The "add to board" code should be a separate patch from
"implement this new device".

> diff --git a/hw/sd/meson.build b/hw/sd/meson.build
> index f1ce357a3b..807ca07b7c 100644
> --- a/hw/sd/meson.build
> +++ b/hw/sd/meson.build
> @@ -9,4 +9,5 @@ softmmu_ss.add(when: 'CONFIG_PXA2XX', if_true: files('pxa2xx_mmci.c'))
>  softmmu_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2835_sdhost.c'))
>  softmmu_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files('aspeed_sdhci.c'))
>  softmmu_ss.add(when: 'CONFIG_ALLWINNER_H3', if_true: files('allwinner-sdhost.c'))
> +softmmu_ss.add(when: 'CONFIG_NPCM7XX', if_true: files('npcm7xx_sdhci.c'))
>  softmmu_ss.add(when: 'CONFIG_CADENCE_SDHCI', if_true: files('cadence_sdhci.c'))
> diff --git a/hw/sd/npcm7xx_sdhci.c b/hw/sd/npcm7xx_sdhci.c
> new file mode 100644
> index 0000000000..85cccdc485
> --- /dev/null
> +++ b/hw/sd/npcm7xx_sdhci.c
> @@ -0,0 +1,131 @@
> +/*
> + * NPCM7xx SD-3.0 / eMMC-4.51 Host Controller
> + *
> + * Copyright (c) 2021 Google LLC
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms of the GNU General Public License as published by the
> + * Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
> + * for more details.
> + */
> +
> +#include "qemu/osdep.h"
> +
> +#include "hw/sd/npcm7xx_sdhci.h"
> +#include "sdhci-internal.h"
> +
> +static uint64_t npcm7xx_sdhci_read(void *opaque, hwaddr addr, unsigned int size)
> +{
> +    NPCM7xxSDHCIState *s = opaque;
> +    uint64_t val = 0;
> +
> +    switch (addr) {
> +    case NPCM7XX_PRSTVALS_0:
> +    case NPCM7XX_PRSTVALS_1:
> +    case NPCM7XX_PRSTVALS_2:
> +    case NPCM7XX_PRSTVALS_3:
> +    case NPCM7XX_PRSTVALS_4:
> +    case NPCM7XX_PRSTVALS_5:
> +        val = (uint64_t)s->regs.prstvals[(addr - NPCM7XX_PRSTVALS_0) / 2];
> +        break;
> +    case NPCM7XX_BOOTTOCTRL:
> +        val = (uint64_t)s->regs.boottoctrl;

Your MemoryRegionOps says that accesses of between 1 and 4
bytes are OK, but this code won't handle eg byte reads of the
high byte of one of these 16-bit registers. What does the
hardware require in the way of alignment ?

> +        break;
> +    default:
> +        val = (uint64_t)s->sdhci.io_ops->read(&s->sdhci, addr, size);

I don't think all these (uint64_t) casts are necessary.

I think it would be nicer to handle the registers that
are done by the generic-sdhci object the same way that
hw/sd/cadence-sdhci.c does it -- have a container region
that the sdhci registers get mapped into at the appropriate
offset, with a fallback io ops for the ones that aren't
handled by the generic-sdhci MemoryRegion.

> +    }
> +
> +    return val;
> +}
> +
> +static void npcm7xx_sdhci_write(void *opaque, hwaddr addr, uint64_t val,
> +                                unsigned int size)
> +{
> +    NPCM7xxSDHCIState *s = opaque;
> +
> +    switch (addr) {
> +    case NPCM7XX_BOOTTOCTRL:
> +        s->regs.boottoctrl = (uint32_t)val;

This cast isn't needed either.

> +        break;
> +    default:
> +        s->sdhci.io_ops->write(&s->sdhci, addr, val, size);
> +    }
> +}
> +
> +static const MemoryRegionOps npcm7xx_sdhci_ops = {
> +    .read = npcm7xx_sdhci_read,
> +    .write = npcm7xx_sdhci_write,
> +    .endianness = DEVICE_NATIVE_ENDIAN,
> +    .valid = {.min_access_size = 1, .max_access_size = 4, .unaligned = false},

This shouldn't be all on one line;
    .valid = {
        .min_access_size = 1,
        .max_access_size = 4,
        .unaligned = false,
    },



> +};
> +
> +static void npcm7xx_sdhci_realize(DeviceState *dev, Error **errp)
> +{
> +    NPCM7xxSDHCIState *s = NPCM7XX_SDHCI(dev);
> +    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
> +    SysBusDevice *sbd_sdhci = SYS_BUS_DEVICE(&s->sdhci);
> +
> +    memory_region_init_io(&s->iomem, OBJECT(s), &npcm7xx_sdhci_ops, s,
> +                          TYPE_NPCM7XX_SDHCI, 0x1000);
> +    sysbus_init_mmio(sbd, &s->iomem);
> +    sysbus_realize(sbd_sdhci, errp);
> +
> +    /* propagate irq and "sd-bus" from generic-sdhci */
> +    sysbus_pass_irq(sbd, sbd_sdhci);
> +    s->bus = qdev_get_child_bus(DEVICE(sbd_sdhci), "sd-bus");
> +}
> +
> +static void npcm7xx_sdhci_reset(DeviceState *dev)
> +{
> +    NPCM7xxSDHCIState *s = NPCM7XX_SDHCI(dev);
> +    device_cold_reset(DEVICE(&s->sdhci));
> +    s->regs.boottoctrl = 0;
> +
> +    s->sdhci.prnsts = NPCM7XX_PRSNTS_RESET;
> +    s->sdhci.blkgap = NPCM7XX_BLKGAP_RESET;
> +    s->sdhci.capareg = NPCM7XX_CAPAB_RESET;
> +    s->sdhci.maxcurr = NPCM7XX_MAXCURR_RESET;
> +    s->sdhci.version = NPCM7XX_HCVER_RESET;
> +
> +    memset(s->regs.prstvals, 0, NPCM7XX_PRSTVALS_SIZE * sizeof(uint16_t));

Using 'sizeof(s->regs.prstvals)' allows you to avoid having
to keep the type and member count in sync here.

> +    s->regs.prstvals[0] = NPCM7XX_PRSTVALS_0_RESET;
> +    s->regs.prstvals[1] = NPCM7XX_PRSTVALS_1_RESET;
> +    s->regs.prstvals[3] = NPCM7XX_PRSTVALS_3_RESET;

Aren't these read-only? If so, you can set them to their
correct values in the realize function and need not reinit
them in reset.

> +}
> +
> +static void npcm7xx_sdhci_class_init(ObjectClass *classp, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(classp);
> +
> +    dc->desc = "NPCM7xx SD/eMMC Host Controller";
> +    dc->realize = npcm7xx_sdhci_realize;
> +    dc->reset = npcm7xx_sdhci_reset;

This device has at least one piece of modifiable internal
state (the boottoctrl register). So it needs a vmstate
struct for migration.

thanks
-- PMM

