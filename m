Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1FBE3959B6
	for <lists+qemu-devel@lfdr.de>; Mon, 31 May 2021 13:25:24 +0200 (CEST)
Received: from localhost ([::1]:50470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lng2t-0005aa-JW
	for lists+qemu-devel@lfdr.de; Mon, 31 May 2021 07:25:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lng1V-0004di-7R; Mon, 31 May 2021 07:23:57 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:43972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lng1T-0005jw-3H; Mon, 31 May 2021 07:23:56 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 n5-20020a1c72050000b0290192e1f9a7e1so6377475wmc.2; 
 Mon, 31 May 2021 04:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Dfclu7J7a6l5sSPTCc6fYfSpDr39vkrtne6NGqG5+as=;
 b=NiGahZVlq3IWrGK3DmQ+biUNBLK8SnP3NcWWZ+bApT2JDxQUxslraFLmSryuAGB43s
 zO7ha6yXMCIBc/Xo8swavA4lcMzjSXFKPtgZqTDuUwqTKlnAI3iuIzFHx80Z8Vny81DM
 McXI7xQIZN1/7VS0nveX7aqLFBcyiOOWoYo4bNs6sei+ySdIBUyF6cRSZGM4rh/X5nRd
 fWHtFXkDhlF0x0HkuvZ6XR+qfFVTjvXaUvQIXm+4ws2lA5Y0YNdQww449UetGNHV2lPs
 6EW34M0H8c4cF9jtFzHKKFH8YRVyVet113apwwugntnYjUBx8T+egxxw73FJ168yxVos
 ZaQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Dfclu7J7a6l5sSPTCc6fYfSpDr39vkrtne6NGqG5+as=;
 b=bPGC1v0ZsaymPolnZ0+6HmfktVcEtUJYpM6PuTa2CXjUDxcWMoNGk5TXcO5PYGI0u0
 ff+v0YyYxLqSh4Yg515cwbDC5mrlfNCYNEdkjg2/0uN8ALr3QTC/Xn80h0yRuBaAUeCj
 z3t+724PTwZhPqk55L0cuz5TMULjJXdCaqOCLa8OAKxzTVAzrqeA4Abmo1bcVHsTE0Tk
 mx60Oj+/5NFH50tJ2A0KbbJn/1M/fhU08BvLZA/s6NwY5H4Suw46ieUIJUJoSv4JjBAV
 0TPHT7CKpWdmcKDrqYtHRzrJPlr+ksgZt8aosHSr3b1m1qkiZGhRGiUMrcH0jOkJpQWo
 tREQ==
X-Gm-Message-State: AOAM530yLqHFaO12eTYD6jixtvBQ4CbhlrEJFEo6KDBUBh01gS013AMF
 0l/fGeiVAs3WfdbbllPUN14=
X-Google-Smtp-Source: ABdhPJznw3RsbiRTJyrwbVMgojQlUCGTlKCqrKdkGlFHl4xdL0qemDClvZx8sbtJTqmMnyHUMvKMQQ==
X-Received: by 2002:a05:600c:4282:: with SMTP id
 v2mr3675380wmc.18.1622460232326; 
 Mon, 31 May 2021 04:23:52 -0700 (PDT)
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id l3sm15127308wmh.2.2021.05.31.04.23.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 May 2021 04:23:51 -0700 (PDT)
Subject: Re: [PATCH qemu] Add basic power management to raspi.
To: qemu-devel@nongnu.org, Nolan Leake <nolan@sigbus.net>
References: <162137039825.30884.2445825798240809194-0@git.sr.ht>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <65187b48-2449-e2b4-2d13-ed9ffb6fe2a8@amsat.org>
Date: Mon, 31 May 2021 13:23:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <162137039825.30884.2445825798240809194-0@git.sr.ht>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.591,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Nolan,

Thanks for your patch!

There is something odd with your email address, which apparently
became sourcehut@sigbus.net instead of nolan@sigbus.net.

On 5/18/21 10:24 PM, ~nolanl wrote:
> From: Nolan Leake <nolan@sigbus.net>
> 
> This is just enough to make reboot and poweroff work.

Please precise "for Linux kernels", since this doesn't work
with firmwares (ideally we should implement the FIRMWARE_NOTIFY_REBOOT
property - which Linux sends - to handle the machine reboot/halt
via the videocore firmware model).

> Notably, the
> watchdog timer functionality is not yet implemented.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/64
> Signed-off-by: Nolan Leake <nolan@sigbus.net>
> ---
>  hw/arm/bcm2835_peripherals.c         |  13 ++-
>  hw/misc/bcm2835_powermgt.c           | 157 +++++++++++++++++++++++++++
>  hw/misc/meson.build                  |   1 +
>  include/hw/arm/bcm2835_peripherals.h |   3 +-
>  include/hw/misc/bcm2835_powermgt.h   |  29 +++++
>  5 files changed, 201 insertions(+), 2 deletions(-)
>  create mode 100644 hw/misc/bcm2835_powermgt.c
>  create mode 100644 include/hw/misc/bcm2835_powermgt.h
> 
> diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals.c
> index dcff13433e..48538c9360 100644
> --- a/hw/arm/bcm2835_peripherals.c
> +++ b/hw/arm/bcm2835_peripherals.c
> @@ -126,6 +126,10 @@ static void bcm2835_peripherals_init(Object *obj)
>  
>      object_property_add_const_link(OBJECT(&s->dwc2), "dma-mr",
>                                     OBJECT(&s->gpu_bus_mr));
> +
> +    /* Power Management */
> +    object_initialize_child(obj, "powermgt", &s->powermgt,
> +                            TYPE_BCM2835_POWERMGT);
>  }
>  
>  static void bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
> @@ -364,9 +368,16 @@ static void bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
>          qdev_get_gpio_in_named(DEVICE(&s->ic), BCM2835_IC_GPU_IRQ,
>                                 INTERRUPT_USB));
>  
> +    /* Power Management */
> +    if (!sysbus_realize(SYS_BUS_DEVICE(&s->powermgt), errp)) {
> +        return;
> +    }
> +
> +    memory_region_add_subregion(&s->peri_mr, PM_OFFSET,
> +                sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->powermgt), 0));
> +
>      create_unimp(s, &s->txp, "bcm2835-txp", TXP_OFFSET, 0x1000);
>      create_unimp(s, &s->armtmr, "bcm2835-sp804", ARMCTRL_TIMER0_1_OFFSET, 0x40);
> -    create_unimp(s, &s->powermgt, "bcm2835-powermgt", PM_OFFSET, 0x114);
>      create_unimp(s, &s->i2s, "bcm2835-i2s", I2S_OFFSET, 0x100);
>      create_unimp(s, &s->smi, "bcm2835-smi", SMI_OFFSET, 0x100);
>      create_unimp(s, &s->spi[0], "bcm2835-spi0", SPI0_OFFSET, 0x20);
> diff --git a/hw/misc/bcm2835_powermgt.c b/hw/misc/bcm2835_powermgt.c
> new file mode 100644
> index 0000000000..81107ecc8f
> --- /dev/null
> +++ b/hw/misc/bcm2835_powermgt.c
> @@ -0,0 +1,157 @@
> +/*
> + * BCM2835 Power Management emulation
> + *
> + * Copyright (C) 2017 Marcin Chojnacki <marcinch7@gmail.com>
> + * Copyright (C) 2021 Nolan Leake <nolan@sigbus.net>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/log.h"
> +#include "qemu/module.h"
> +#include "hw/misc/bcm2835_powermgt.h"
> +#include "migration/vmstate.h"
> +#include "sysemu/runstate.h"
> +
> +#define PASSWORD 0x5a000000
> +#define PASSWORD_MASK 0xff000000
> +
> +#define R_RSTC 0x1c
> +#define V_RSTC_RESET 0x20
> +#define R_RSTS 0x20
> +#define V_RSTS_POWEROFF 0x555
> +#define R_WDOG 0x24
> +
> +static uint64_t bcm2835_powermgt_read(void *opaque, hwaddr offset,
> +                                      unsigned size)
> +{
> +    BCM2835PowerMgtState *s = (BCM2835PowerMgtState *)opaque;
> +    uint32_t res = 0;
> +
> +    assert(size == 4);

Instead of this assert, add in bcm2835_powermgt_ops:

  .impl.min_access_size = 4,
  .impl.max_access_size = 4,

> +
> +    switch (offset) {
> +    case R_RSTC:
> +        res = s->rstc;
> +        break;
> +    case R_RSTS:
> +        res = s->rsts;
> +        break;
> +    case R_WDOG:
> +        res = s->wdog;
> +        break;
> +
> +    default:
> +        qemu_log_mask(LOG_UNIMP,
> +                      "bcm2835_powermgt_read: Unknown offset %x\n",
> +                      (int)offset);
> +        res = 0;
> +        break;
> +    }
> +
> +    return res;
> +}
> +
> +static void bcm2835_powermgt_write(void *opaque, hwaddr offset,
> +                                   uint64_t value, unsigned size)
> +{
> +    BCM2835PowerMgtState *s = (BCM2835PowerMgtState *)opaque;
> +
> +    assert(size == 4);

(remove this assert too).

> +    if ((value & PASSWORD_MASK) != PASSWORD) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "bcm2835_powermgt_write: Bad password %x at offset %x\n",

Please prefix hexadecimal formats with 0x,

> +                      (uint32_t)value, (int)offset);

and do not cast.

> +        return;
> +    }
> +
> +    value = value & ~PASSWORD_MASK;
> +
> +    switch (offset) {
> +    case R_RSTC:
> +        s->rstc = value;
> +        if (value & V_RSTC_RESET) {
> +            if ((s->rsts & 0xfff) == V_RSTS_POWEROFF) {
> +                /* Linux uses partition 63 to indicate halt. */

I'd move this comment with the V_RSTS_POWEROFF definition.

> +                qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
> +            } else {
> +                qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
> +            }
> +        }

Shouldn't we log the unsupported bits?

> +        break;
> +    case R_RSTS:
> +        s->rsts = value;
> +        break;
> +    case R_WDOG:
> +        s->wdog = value;
> +        break;
> +
> +    default:
> +        qemu_log_mask(LOG_UNIMP,
> +                      "bcm2835_powermgt_write: Unknown offset %x\n",
> +                      (int)offset);

Please do not cast, use the proper format.

> +        break;
> +    }
> +}
> +
> +static const MemoryRegionOps bcm2835_powermgt_ops = {
> +    .read = bcm2835_powermgt_read,
> +    .write = bcm2835_powermgt_write,
> +    .endianness = DEVICE_NATIVE_ENDIAN,
> +};
> +
> +static const VMStateDescription vmstate_bcm2835_powermgt = {
> +    .name = TYPE_BCM2835_POWERMGT,
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_UINT32(rstc, BCM2835PowerMgtState),
> +        VMSTATE_UINT32(rsts, BCM2835PowerMgtState),
> +        VMSTATE_UINT32(wdog, BCM2835PowerMgtState),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
> +static void bcm2835_powermgt_init(Object *obj)
> +{
> +    BCM2835PowerMgtState *s = BCM2835_POWERMGT(obj);
> +
> +    memory_region_init_io(&s->iomem, obj, &bcm2835_powermgt_ops, s,
> +                          TYPE_BCM2835_POWERMGT, 0x114);
> +    sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->iomem);
> +}
> +
> +static void bcm2835_powermgt_reset(DeviceState *dev)
> +{
> +    BCM2835PowerMgtState *s = BCM2835_POWERMGT(dev);
> +
> +    s->rstc = 0x00000102;
> +    s->rsts = 0x00001000;
> +    s->wdog = 0x00000000;

Where these bits come from?

> +}
> +
> +static void bcm2835_powermgt_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +
> +    dc->reset = bcm2835_powermgt_reset;
> +    dc->vmsd = &vmstate_bcm2835_powermgt;
> +}
> +
> +static TypeInfo bcm2835_powermgt_info = {
> +    .name          = TYPE_BCM2835_POWERMGT,
> +    .parent        = TYPE_SYS_BUS_DEVICE,
> +    .instance_size = sizeof(BCM2835PowerMgtState),
> +    .class_init    = bcm2835_powermgt_class_init,
> +    .instance_init = bcm2835_powermgt_init,
> +};

Minor comments, otherwise:

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

