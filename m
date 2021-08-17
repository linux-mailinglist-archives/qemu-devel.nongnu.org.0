Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B2A3EEA1B
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 11:40:48 +0200 (CEST)
Received: from localhost ([::1]:53486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFvaR-0004Fd-NU
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 05:40:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1mFvYx-0003CR-Nz; Tue, 17 Aug 2021 05:39:15 -0400
Received: from pharaoh.lmichel.fr ([149.202.28.74]:54506)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1mFvYv-0008E6-Ac; Tue, 17 Aug 2021 05:39:15 -0400
Received: from localhost (sekoia-pc.home.lmichel.fr [192.168.61.100])
 by pharaoh.lmichel.fr (Postfix) with ESMTPSA id 685C6C6019D;
 Tue, 17 Aug 2021 11:39:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lmichel.fr; s=pharaoh; 
 t=1629193150;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=esSYkqaqvpLesv055491I1Ka52ygEF+D2tI2npKS0OE=;
 b=HdIPAn2LCtR/UTIfO0czVTNNS+AVA6aUhhgBK+JHxqKGhC2CEsJ6gupppPNkrgHiJR4y6N
 ci29I17OY7WVY33uC6Dg745DlYU2Q4I5o2jxo+ZIvQeyWu4FXBy8iW/Q4ea8O5pw6fo0aU
 ibVoLVnQLWmiarB7pe+s5fP6JKJGodHeP2JCo2YZGS8pPXhxeY7FYLrZbSTOqk9x8gKID9
 tTQ7WhPdC73PvJkaaVY23YVO4t646fqAwbPdRHKWt2jDaE/vhIutm8hNR5OmuIDTW7SQWd
 Gugzo7wAw5lkCTvgr4pruMdRdyJVXJRHdr0GmImTD7Ie3z1Eyg5m/ktr1Sbs3w==
Date: Tue, 17 Aug 2021 11:41:22 +0200
From: Luc Michel <luc@lmichel.fr>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH for-6.2 10/25] hw/arm: Don't allocate separate
 MemoryRegions in stm32 SoC realize
Message-ID: <20210817094122.tirpikovtvhhhtyk@sekoia-pc.home.lmichel.fr>
References: <20210812093356.1946-1-peter.maydell@linaro.org>
 <20210812093356.1946-11-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210812093356.1946-11-peter.maydell@linaro.org>
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
> In the realize methods of the stm32f100 and stm32f205 SoC objects, we
> call g_new() to create new MemoryRegion objjects for the sram, flash,
> and flash_alias.  This is unnecessary (and leaves open the
> possibility of leaking the allocations if we exit from realize with
> an error).  Make these MemoryRegions member fields of the device
> state struct instead, as stm32f405 already does.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

(with the typo fixed)

Reviewed-by: Luc Michel <luc@lmichel.fr>

> ---
>  include/hw/arm/stm32f100_soc.h |  4 ++++
>  include/hw/arm/stm32f205_soc.h |  4 ++++
>  hw/arm/stm32f100_soc.c         | 17 +++++++----------
>  hw/arm/stm32f205_soc.c         | 17 +++++++----------
>  4 files changed, 22 insertions(+), 20 deletions(-)
> 
> diff --git a/include/hw/arm/stm32f100_soc.h b/include/hw/arm/stm32f100_soc.h
> index 71bffcf4fd5..b7d71c6c634 100644
> --- a/include/hw/arm/stm32f100_soc.h
> +++ b/include/hw/arm/stm32f100_soc.h
> @@ -52,6 +52,10 @@ struct STM32F100State {
>  
>      STM32F2XXUsartState usart[STM_NUM_USARTS];
>      STM32F2XXSPIState spi[STM_NUM_SPIS];
> +
> +    MemoryRegion sram;
> +    MemoryRegion flash;
> +    MemoryRegion flash_alias;
>  };
>  
>  #endif
> diff --git a/include/hw/arm/stm32f205_soc.h b/include/hw/arm/stm32f205_soc.h
> index 985ff63aa9e..75251494917 100644
> --- a/include/hw/arm/stm32f205_soc.h
> +++ b/include/hw/arm/stm32f205_soc.h
> @@ -63,6 +63,10 @@ struct STM32F205State {
>      STM32F2XXSPIState spi[STM_NUM_SPIS];
>  
>      qemu_or_irq *adc_irqs;
> +
> +    MemoryRegion sram;
> +    MemoryRegion flash;
> +    MemoryRegion flash_alias;
>  };
>  
>  #endif
> diff --git a/hw/arm/stm32f100_soc.c b/hw/arm/stm32f100_soc.c
> index 0c4a5c66451..0be92b2c475 100644
> --- a/hw/arm/stm32f100_soc.c
> +++ b/hw/arm/stm32f100_soc.c
> @@ -67,25 +67,22 @@ static void stm32f100_soc_realize(DeviceState *dev_soc, Error **errp)
>      int i;
>  
>      MemoryRegion *system_memory = get_system_memory();
> -    MemoryRegion *sram = g_new(MemoryRegion, 1);
> -    MemoryRegion *flash = g_new(MemoryRegion, 1);
> -    MemoryRegion *flash_alias = g_new(MemoryRegion, 1);
>  
>      /*
>       * Init flash region
>       * Flash starts at 0x08000000 and then is aliased to boot memory at 0x0
>       */
> -    memory_region_init_rom(flash, OBJECT(dev_soc), "STM32F100.flash",
> +    memory_region_init_rom(&s->flash, OBJECT(dev_soc), "STM32F100.flash",
>                             FLASH_SIZE, &error_fatal);
> -    memory_region_init_alias(flash_alias, OBJECT(dev_soc),
> -                             "STM32F100.flash.alias", flash, 0, FLASH_SIZE);
> -    memory_region_add_subregion(system_memory, FLASH_BASE_ADDRESS, flash);
> -    memory_region_add_subregion(system_memory, 0, flash_alias);
> +    memory_region_init_alias(&s->flash_alias, OBJECT(dev_soc),
> +                             "STM32F100.flash.alias", &s->flash, 0, FLASH_SIZE);
> +    memory_region_add_subregion(system_memory, FLASH_BASE_ADDRESS, &s->flash);
> +    memory_region_add_subregion(system_memory, 0, &s->flash_alias);
>  
>      /* Init SRAM region */
> -    memory_region_init_ram(sram, NULL, "STM32F100.sram", SRAM_SIZE,
> +    memory_region_init_ram(&s->sram, NULL, "STM32F100.sram", SRAM_SIZE,
>                             &error_fatal);
> -    memory_region_add_subregion(system_memory, SRAM_BASE_ADDRESS, sram);
> +    memory_region_add_subregion(system_memory, SRAM_BASE_ADDRESS, &s->sram);
>  
>      /* Init ARMv7m */
>      armv7m = DEVICE(&s->armv7m);
> diff --git a/hw/arm/stm32f205_soc.c b/hw/arm/stm32f205_soc.c
> index 9cd41bf56da..0bd215aebd7 100644
> --- a/hw/arm/stm32f205_soc.c
> +++ b/hw/arm/stm32f205_soc.c
> @@ -84,21 +84,18 @@ static void stm32f205_soc_realize(DeviceState *dev_soc, Error **errp)
>      int i;
>  
>      MemoryRegion *system_memory = get_system_memory();
> -    MemoryRegion *sram = g_new(MemoryRegion, 1);
> -    MemoryRegion *flash = g_new(MemoryRegion, 1);
> -    MemoryRegion *flash_alias = g_new(MemoryRegion, 1);
>  
> -    memory_region_init_rom(flash, OBJECT(dev_soc), "STM32F205.flash",
> +    memory_region_init_rom(&s->flash, OBJECT(dev_soc), "STM32F205.flash",
>                             FLASH_SIZE, &error_fatal);
> -    memory_region_init_alias(flash_alias, OBJECT(dev_soc),
> -                             "STM32F205.flash.alias", flash, 0, FLASH_SIZE);
> +    memory_region_init_alias(&s->flash_alias, OBJECT(dev_soc),
> +                             "STM32F205.flash.alias", &s->flash, 0, FLASH_SIZE);
>  
> -    memory_region_add_subregion(system_memory, FLASH_BASE_ADDRESS, flash);
> -    memory_region_add_subregion(system_memory, 0, flash_alias);
> +    memory_region_add_subregion(system_memory, FLASH_BASE_ADDRESS, &s->flash);
> +    memory_region_add_subregion(system_memory, 0, &s->flash_alias);
>  
> -    memory_region_init_ram(sram, NULL, "STM32F205.sram", SRAM_SIZE,
> +    memory_region_init_ram(&s->sram, NULL, "STM32F205.sram", SRAM_SIZE,
>                             &error_fatal);
> -    memory_region_add_subregion(system_memory, SRAM_BASE_ADDRESS, sram);
> +    memory_region_add_subregion(system_memory, SRAM_BASE_ADDRESS, &s->sram);
>  
>      armv7m = DEVICE(&s->armv7m);
>      qdev_prop_set_uint32(armv7m, "num-irq", 96);
> -- 
> 2.20.1
> 

-- 

