Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 878013EAE33
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Aug 2021 03:40:45 +0200 (CEST)
Received: from localhost ([::1]:50314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEMBg-0003qZ-Jk
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 21:40:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mEMAN-0002Fp-SX; Thu, 12 Aug 2021 21:39:23 -0400
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32]:41644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mEMAM-00034V-A3; Thu, 12 Aug 2021 21:39:23 -0400
Received: by mail-io1-xd32.google.com with SMTP id 188so11148620ioa.8;
 Thu, 12 Aug 2021 18:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=amGi0SMAVglzC1C1KS71BYCeGwnKa+Vqk5zM6VDfBog=;
 b=Fn1hU9T6xCNDEzMeJRkHPWTw1Cd/XwQ0Mf2b9hkObX4h6R7fAOpnqblHGXW7K/402w
 ro/2oxpkI0SvbpzIaBpo3rQhZIcp20p0wTyYMPy7qh+Sx6ZBFFRJnBukweMsUHYoDyWl
 oiwZYbs95uFNr2jM8CU9GUJjv1KD415FXRnl3dTM07+yEGpkJYpoPQALspDI19rupedx
 01rlrm1gv4B7YepOV1MyyUokuNFM+btZFNMzPzaMrK9LCupKTR6iTjz/USRdfxe3rl5g
 D9msDrBgLrIOg2G/f1oNloK1uIVGNLpK4qxAm7boK1SvVwnApj6AxV6LVq+jxRdB9dxc
 s85g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=amGi0SMAVglzC1C1KS71BYCeGwnKa+Vqk5zM6VDfBog=;
 b=nOeMd1Pebdwe+dsRyttyxrt5BHG8oe3/jVevHSr8sFcbJ/5ab/pzuOoJ/SOcRiyq71
 sypFofNSTRlZayAYyZWu7lxmHbCQv63u8p1D62p3A7DuzkGIhgrCjSygyit4T5Is7QeA
 vmxE5OpSghj510Wfr7vONZ5VW29I78aHvDh1DH6kgbnwomsiGfbPV1r//v5DMlSl93cl
 lGSALbO8x93Ssh+0m9JUeIgYLiXGlI+kDqxbI1OFIS0YM8GnXWTzY/M8vcNAocYzKnHI
 6Wmc6wzoPD3vMavLC8ZSYPtG+58wodzBZgVvjdd7nFdORcFfdNaZ7Pfb77mDmNEYAMsR
 IHgg==
X-Gm-Message-State: AOAM530StyaGFb/VE3I5zIwRtJpB/yFv0Mu14w/gD6F5n3oSannNKyQI
 KVvhGekhFb761yVh/KS5KWYClybaRnTS6GMF3Bc=
X-Google-Smtp-Source: ABdhPJxVq1WkvMpg+/VhXlhJVnChgwOGsAvYskgo2b6/+1VuL984/oU/dQRLhNcCMtzhBFMDAlYdIVy1l0z9Ueverxs=
X-Received: by 2002:a02:cc22:: with SMTP id o2mr6193866jap.26.1628818760526;
 Thu, 12 Aug 2021 18:39:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210812093356.1946-1-peter.maydell@linaro.org>
 <20210812093356.1946-13-peter.maydell@linaro.org>
In-Reply-To: <20210812093356.1946-13-peter.maydell@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 13 Aug 2021 11:38:54 +1000
Message-ID: <CAKmqyKPUOjjVkNH_Jw=_h-g1tjJNWaugV4kBp_05nF466y=Eaw@mail.gmail.com>
Subject: Re: [PATCH for-6.2 12/25] hw/arm/stm32f205: Wire up sysclk and refclk
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d32;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd32.google.com
X-Spam_score_int: 1
X-Spam_score: 0.1
X-Spam_bar: /
X-Spam_report: (0.1 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, Luc Michel <luc@lmichel.fr>,
 Alistair Francis <alistair@alistair23.me>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Joel Stanley <joel@jms.id.au>, Alexandre Iooss <erdnaxe@crans.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Aug 12, 2021 at 7:38 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Wire up the sysclk and refclk for the stm32f205 SoC.  This SoC always
> runs the systick refclk at 1/8 the frequency of the main CPU clock,
> so the board code only needs to provide a single sysclk clock.
>
> Because there is only one board using this SoC, we convert the SoC
> and the board together, rather than splitting it into "add clock to
> SoC; connect clock in board; add error check in SoC code that clock
> is wired up".
>
> When the systick device starts honouring its clock inputs, this will
> fix an emulation inaccuracy in the netduino2 board where the systick
> reference clock was running at 1MHz rather than 15MHz.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  include/hw/arm/stm32f205_soc.h |  4 ++++
>  hw/arm/netduino2.c             | 12 +++++++-----
>  hw/arm/stm32f205_soc.c         | 30 ++++++++++++++++++++++++++++++
>  3 files changed, 41 insertions(+), 5 deletions(-)
>
> diff --git a/include/hw/arm/stm32f205_soc.h b/include/hw/arm/stm32f205_soc.h
> index 75251494917..849d3ed8891 100644
> --- a/include/hw/arm/stm32f205_soc.h
> +++ b/include/hw/arm/stm32f205_soc.h
> @@ -32,6 +32,7 @@
>  #include "hw/or-irq.h"
>  #include "hw/ssi/stm32f2xx_spi.h"
>  #include "hw/arm/armv7m.h"
> +#include "hw/clock.h"
>  #include "qom/object.h"
>
>  #define TYPE_STM32F205_SOC "stm32f205-soc"
> @@ -67,6 +68,9 @@ struct STM32F205State {
>      MemoryRegion sram;
>      MemoryRegion flash;
>      MemoryRegion flash_alias;
> +
> +    Clock *sysclk;
> +    Clock *refclk;
>  };
>
>  #endif
> diff --git a/hw/arm/netduino2.c b/hw/arm/netduino2.c
> index 1733b71507c..b5c0ba23ee5 100644
> --- a/hw/arm/netduino2.c
> +++ b/hw/arm/netduino2.c
> @@ -26,6 +26,7 @@
>  #include "qapi/error.h"
>  #include "hw/boards.h"
>  #include "hw/qdev-properties.h"
> +#include "hw/qdev-clock.h"
>  #include "qemu/error-report.h"
>  #include "hw/arm/stm32f205_soc.h"
>  #include "hw/arm/boot.h"
> @@ -36,16 +37,17 @@
>  static void netduino2_init(MachineState *machine)
>  {
>      DeviceState *dev;
> +    Clock *sysclk;
>
> -    /*
> -     * TODO: ideally we would model the SoC RCC and let it handle
> -     * system_clock_scale, including its ability to define different
> -     * possible SYSCLK sources.
> -     */
>      system_clock_scale = NANOSECONDS_PER_SECOND / SYSCLK_FRQ;
>
> +    /* This clock doesn't need migration because it is fixed-frequency */
> +    sysclk = clock_new(OBJECT(machine), "SYSCLK");
> +    clock_set_hz(sysclk, SYSCLK_FRQ);
> +
>      dev = qdev_new(TYPE_STM32F205_SOC);
>      qdev_prop_set_string(dev, "cpu-type", ARM_CPU_TYPE_NAME("cortex-m3"));
> +    qdev_connect_clock_in(dev, "sysclk", sysclk);
>      sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
>
>      armv7m_load_kernel(ARM_CPU(first_cpu), machine->kernel_filename,
> diff --git a/hw/arm/stm32f205_soc.c b/hw/arm/stm32f205_soc.c
> index 0bd215aebd7..c6b75a381d9 100644
> --- a/hw/arm/stm32f205_soc.c
> +++ b/hw/arm/stm32f205_soc.c
> @@ -29,6 +29,7 @@
>  #include "exec/address-spaces.h"
>  #include "hw/arm/stm32f205_soc.h"
>  #include "hw/qdev-properties.h"
> +#include "hw/qdev-clock.h"
>  #include "sysemu/sysemu.h"
>
>  /* At the moment only Timer 2 to 5 are modelled */
> @@ -74,6 +75,9 @@ static void stm32f205_soc_initfn(Object *obj)
>      for (i = 0; i < STM_NUM_SPIS; i++) {
>          object_initialize_child(obj, "spi[*]", &s->spi[i], TYPE_STM32F2XX_SPI);
>      }
> +
> +    s->sysclk = qdev_init_clock_in(DEVICE(s), "sysclk", NULL, NULL, 0);
> +    s->refclk = qdev_init_clock_in(DEVICE(s), "refclk", NULL, NULL, 0);
>  }
>
>  static void stm32f205_soc_realize(DeviceState *dev_soc, Error **errp)
> @@ -85,6 +89,30 @@ static void stm32f205_soc_realize(DeviceState *dev_soc, Error **errp)
>
>      MemoryRegion *system_memory = get_system_memory();
>
> +    /*
> +     * We use s->refclk internally and only define it with qdev_init_clock_in()
> +     * so it is correctly parented and not leaked on an init/deinit; it is not
> +     * intended as an externally exposed clock.
> +     */
> +    if (clock_has_source(s->refclk)) {
> +        error_setg(errp, "refclk clock must not be wired up by the board code");
> +        return;
> +    }
> +
> +    if (!clock_has_source(s->sysclk)) {
> +        error_setg(errp, "sysclk clock must be wired up by the board code");
> +        return;
> +    }
> +
> +    /*
> +     * TODO: ideally we should model the SoC RCC and its ability to
> +     * change the sysclk frequency and define different sysclk sources.
> +     */
> +
> +    /* The refclk always runs at frequency HCLK / 8 */
> +    clock_set_mul_div(s->refclk, 8, 1);
> +    clock_set_source(s->refclk, s->sysclk);
> +
>      memory_region_init_rom(&s->flash, OBJECT(dev_soc), "STM32F205.flash",
>                             FLASH_SIZE, &error_fatal);
>      memory_region_init_alias(&s->flash_alias, OBJECT(dev_soc),
> @@ -101,6 +129,8 @@ static void stm32f205_soc_realize(DeviceState *dev_soc, Error **errp)
>      qdev_prop_set_uint32(armv7m, "num-irq", 96);
>      qdev_prop_set_string(armv7m, "cpu-type", s->cpu_type);
>      qdev_prop_set_bit(armv7m, "enable-bitband", true);
> +    qdev_connect_clock_in(armv7m, "cpuclk", s->sysclk);
> +    qdev_connect_clock_in(armv7m, "refclk", s->refclk);
>      object_property_set_link(OBJECT(&s->armv7m), "memory",
>                               OBJECT(get_system_memory()), &error_abort);
>      if (!sysbus_realize(SYS_BUS_DEVICE(&s->armv7m), errp)) {
> --
> 2.20.1
>
>

