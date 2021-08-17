Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F01D3EEA46
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 11:48:14 +0200 (CEST)
Received: from localhost ([::1]:37158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFvhd-00045k-N9
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 05:48:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1mFvfH-00012I-5Y; Tue, 17 Aug 2021 05:45:47 -0400
Received: from pharaoh.lmichel.fr ([149.202.28.74]:54822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1mFvfD-0005WB-4m; Tue, 17 Aug 2021 05:45:46 -0400
Received: from localhost (sekoia-pc.home.lmichel.fr [192.168.61.100])
 by pharaoh.lmichel.fr (Postfix) with ESMTPSA id 26A6BC6019D;
 Tue, 17 Aug 2021 11:45:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lmichel.fr; s=pharaoh; 
 t=1629193541;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HEw/STByF0H4XZS0qQRy78nPrRzpfdwRNY/31H9RHa4=;
 b=fVMK7s+iM2teC1cOzoVUc+/SW2ir+xSJ4nJbxqcmKod/tPC4wceKPjUQ1G1SgaY0ETobKl
 O8oNZJ6F9AmNRdEBxVb4TTZ2rvwydUhdCyL4XDOHtQ0QcuSYGPtnYVv6y+4R1J4UlyG0vC
 ZvCi2g9SY36Vu4JuK3aSkW9xQJSGH4lZUaB9pvFPPi6fXKaZSMe2KogNIqvxIpe9m66tXG
 Uc2h3flMjMVg7D+FpSz73TPEolAGHUuJN6Ue2c1OT0xjpju5FAZ4pORtlfI31esQzb8V1l
 smQ0jHSs1ZhSSqiIUBBqxQL8hjsImsvqhAGUt8c9Jc7VPMAC1iNdc0DNtZP9nA==
Date: Tue, 17 Aug 2021 11:47:53 +0200
From: Luc Michel <luc@lmichel.fr>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH for-6.2 13/25] hw/arm/stm32f405: Wire up sysclk and refclk
Message-ID: <20210817094753.4pmpwcp4ijblpe4t@sekoia-pc.home.lmichel.fr>
References: <20210812093356.1946-1-peter.maydell@linaro.org>
 <20210812093356.1946-14-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210812093356.1946-14-peter.maydell@linaro.org>
Received-SPF: pass client-ip=149.202.28.74; envelope-from=luc@lmichel.fr;
 helo=pharaoh.lmichel.fr
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-devel@nongnu.org,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Alexandre Iooss <erdnaxe@crans.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10:33 Thu 12 Aug     , Peter Maydell wrote:
> Wire up the sysclk and refclk for the stm32f405 SoC.  This SoC always
> runs the systick refclk at 1/8 the frequency of the main CPU clock,
> so the board code only needs to provide a single sysclk clock.
> 
> Because there is only one board using this SoC, we convert the SoC
> and the board together, rather than splitting it into "add clock to
> SoC; connect clock in board; add error check in SoC code that clock
> is wired up".
> 
> When the systick device starts honouring its clock inputs, this will
> fix an emulation inaccuracy in the netduinoplus2 board where the
> systick reference clock was running at 1MHz rather than 21MHz.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Luc Michel <luc@lmichel.fr>

> ---
>  include/hw/arm/stm32f405_soc.h |  3 +++
>  hw/arm/netduinoplus2.c         | 12 +++++++-----
>  hw/arm/stm32f405_soc.c         | 30 ++++++++++++++++++++++++++++++
>  3 files changed, 40 insertions(+), 5 deletions(-)
> 
> diff --git a/include/hw/arm/stm32f405_soc.h b/include/hw/arm/stm32f405_soc.h
> index 347105e709b..5bb0c8d5697 100644
> --- a/include/hw/arm/stm32f405_soc.h
> +++ b/include/hw/arm/stm32f405_soc.h
> @@ -68,6 +68,9 @@ struct STM32F405State {
>      MemoryRegion sram;
>      MemoryRegion flash;
>      MemoryRegion flash_alias;
> +
> +    Clock *sysclk;
> +    Clock *refclk;
>  };
>  
>  #endif
> diff --git a/hw/arm/netduinoplus2.c b/hw/arm/netduinoplus2.c
> index d3ad7a2b675..a5a8999cc8c 100644
> --- a/hw/arm/netduinoplus2.c
> +++ b/hw/arm/netduinoplus2.c
> @@ -26,6 +26,7 @@
>  #include "qapi/error.h"
>  #include "hw/boards.h"
>  #include "hw/qdev-properties.h"
> +#include "hw/qdev-clock.h"
>  #include "qemu/error-report.h"
>  #include "hw/arm/stm32f405_soc.h"
>  #include "hw/arm/boot.h"
> @@ -36,16 +37,17 @@
>  static void netduinoplus2_init(MachineState *machine)
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
>      dev = qdev_new(TYPE_STM32F405_SOC);
>      qdev_prop_set_string(dev, "cpu-type", ARM_CPU_TYPE_NAME("cortex-m4"));
> +    qdev_connect_clock_in(dev, "sysclk", sysclk);
>      sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
>  
>      armv7m_load_kernel(ARM_CPU(first_cpu),
> diff --git a/hw/arm/stm32f405_soc.c b/hw/arm/stm32f405_soc.c
> index cb04c111987..0019b7f4785 100644
> --- a/hw/arm/stm32f405_soc.c
> +++ b/hw/arm/stm32f405_soc.c
> @@ -28,6 +28,7 @@
>  #include "exec/address-spaces.h"
>  #include "sysemu/sysemu.h"
>  #include "hw/arm/stm32f405_soc.h"
> +#include "hw/qdev-clock.h"
>  #include "hw/misc/unimp.h"
>  
>  #define SYSCFG_ADD                     0x40013800
> @@ -80,6 +81,9 @@ static void stm32f405_soc_initfn(Object *obj)
>      }
>  
>      object_initialize_child(obj, "exti", &s->exti, TYPE_STM32F4XX_EXTI);
> +
> +    s->sysclk = qdev_init_clock_in(DEVICE(s), "sysclk", NULL, NULL, 0);
> +    s->refclk = qdev_init_clock_in(DEVICE(s), "refclk", NULL, NULL, 0);
>  }
>  
>  static void stm32f405_soc_realize(DeviceState *dev_soc, Error **errp)
> @@ -91,6 +95,30 @@ static void stm32f405_soc_realize(DeviceState *dev_soc, Error **errp)
>      Error *err = NULL;
>      int i;
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
>      memory_region_init_rom(&s->flash, OBJECT(dev_soc), "STM32F405.flash",
>                             FLASH_SIZE, &err);
>      if (err != NULL) {
> @@ -116,6 +144,8 @@ static void stm32f405_soc_realize(DeviceState *dev_soc, Error **errp)
>      qdev_prop_set_uint32(armv7m, "num-irq", 96);
>      qdev_prop_set_string(armv7m, "cpu-type", s->cpu_type);
>      qdev_prop_set_bit(armv7m, "enable-bitband", true);
> +    qdev_connect_clock_in(armv7m, "cpuclk", s->sysclk);
> +    qdev_connect_clock_in(armv7m, "refclk", s->refclk);
>      object_property_set_link(OBJECT(&s->armv7m), "memory",
>                               OBJECT(system_memory), &error_abort);
>      if (!sysbus_realize(SYS_BUS_DEVICE(&s->armv7m), errp)) {
> -- 
> 2.20.1
> 

-- 

