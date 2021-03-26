Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 213D634B24C
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 23:50:46 +0100 (CET)
Received: from localhost ([::1]:40676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPvHw-0005iI-Hh
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 18:50:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lPvGZ-00051r-EL; Fri, 26 Mar 2021 18:49:19 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:42670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lPvGX-0000H0-5E; Fri, 26 Mar 2021 18:49:18 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 b2-20020a7bc2420000b029010be1081172so3760466wmj.1; 
 Fri, 26 Mar 2021 15:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+CEM2M0T/cnC2NdZhE7Qr8460XdFbb/ZXa3v8xb4LsU=;
 b=r4GohVb3GdQikLJ72Ivc9HsENf+knuvCQiu1HgNAB4t19eO8QW3uSUmyJy4qpVMGRM
 YBnxwTM+eE8s10guEBnt8DUFIMXpNcoejIOrh0nj7qsVLK7U0aLYA0fUblWxdAv0fmxC
 uPpbEy6Tg6EZ4abQzvCBlZQ1lOcjuo//XahEMdh3dlqCoXp0y0sVR6n6JSTvKrr7CoUb
 eUNW45aiyv7S8wfbMeHa6oUshKJEpX0JIzoyQotk1Ynjr3jWpEfUpoO/6d3RGQA4LHiz
 aDTKfe2lQ3hvAG/Ahps9YEt3Vh6LErveVONRwPjFlOc9vhr8Hl+wULt832at9T/5i7/7
 Bkig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+CEM2M0T/cnC2NdZhE7Qr8460XdFbb/ZXa3v8xb4LsU=;
 b=qvJE3e9nIFdR5Dc1HsEVnTWTat56Nm/k7ZxeZBV9u3OBm+Rks3JkRRW4mnkwiCsEqS
 iCg1OuIRJtefFPZHL+Mkdwo7EqYENJduteHi6DwAOoYcqvulZAAeiT2CSj7kaG8KVtmu
 fW1OaqHyXTjVyWhMVc68TAcaYrEqE/Ty/osdvBYjvUjskJD11VFhMBERc74P5OeSa+8h
 O1F7oDHM4kbYrPdpZ+4/MvmTvXG/nyI0bhwyQsGaZYk3F3ccSGq4l//QZeaE2Is0jRfn
 AM5/xl/1NWTuPXRc1uiz3AKgtQBOQj3Od62BQLGW4nV5JsS/k9/Ke1ECrnqkqbXXP5pS
 eg1A==
X-Gm-Message-State: AOAM530U9ok/IZzUcu2i34MsJ4qYL/8nSjBUPNur0G8f996ZmocQLR3i
 wzZEcPaav4cFVcx/qKMMacc=
X-Google-Smtp-Source: ABdhPJxUadYlRJ9nqypz7uZKoxaM9IekW43Fig5m6qjAsFyDbkJhTsgUq9UG/xUgBFdA4fiE0M5fOA==
X-Received: by 2002:a1c:7210:: with SMTP id n16mr14545785wmc.13.1616798953280; 
 Fri, 26 Mar 2021 15:49:13 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id y10sm14688171wrl.19.2021.03.26.15.49.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Mar 2021 15:49:12 -0700 (PDT)
Subject: Re: [RFC PATCH-for-6.1 03/10] hw/arm/musicpal: Map flash using
 memory_region_add_subregion_aliased()
To: qemu-devel@nongnu.org
References: <20210326002728.1069834-1-f4bug@amsat.org>
 <20210326002728.1069834-4-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <4feab40f-0133-8617-52c3-0af0adf419c6@amsat.org>
Date: Fri, 26 Mar 2021 23:49:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210326002728.1069834-4-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>, qemu-arm@nongnu.org,
 Jan Kiszka <jan.kiszka@web.de>, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/26/21 1:27 AM, Philippe Mathieu-Daudé wrote:
> Instead of using a device specific feature for mapping the
> flash memory multiple times over a wider region, use the
> generic memory_region_add_subregion_aliased() helper.
> 
> There is no change in the memory layout.

- before:

  (qemu) info mtree
  00000000fe000000-00000000ffffffff (prio 0, i/o): pflash
    00000000fe000000-00000000fe7fffff (prio 0, romd): alias pflash-alias
@musicpal.flash 0000000000000000-00000000007fffff
    00000000fe800000-00000000feffffff (prio 0, romd): alias pflash-alias
@musicpal.flash 0000000000000000-00000000007fffff
    00000000ff000000-00000000ff7fffff (prio 0, romd): alias pflash-alias
@musicpal.flash 0000000000000000-00000000007fffff
    00000000ff800000-00000000ffffffff (prio 0, romd): alias pflash-alias
@musicpal.flash 0000000000000000-00000000007fffff

- after:

  00000000fe000000-00000000ffffffff (prio 0, i/o): masked musicpal.flash
[span of 8 MiB]
    00000000fe000000-00000000fe7fffff (prio 0, romd): alias
musicpal.flash [#0/4] @musicpal.flash 0000000000000000-00000000007fffff
    00000000fe800000-00000000feffffff (prio 0, romd): alias
musicpal.flash [#1/4] @musicpal.flash 0000000000000000-00000000007fffff
    00000000ff000000-00000000ff7fffff (prio 0, romd): alias
musicpal.flash [#2/4] @musicpal.flash 0000000000000000-00000000007fffff
    00000000ff800000-00000000ffffffff (prio 0, romd): alias
musicpal.flash [#3/4] @musicpal.flash 0000000000000000-00000000007fffff

Flatview is the same:

  (qemu) info mtree -f
  FlatView #0
   AS "memory", root: system
   AS "cpu-memory-0", root: system
   AS "emac-dma", root: system
   Root memory region: system
    00000000fe000000-00000000fe7fffff (prio 0, romd): musicpal.flash
    00000000fe800000-00000000feffffff (prio 0, romd): musicpal.flash
    00000000ff000000-00000000ff7fffff (prio 0, romd): musicpal.flash
    00000000ff800000-00000000ffffffff (prio 0, romd): musicpal.flash

> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/arm/musicpal.c | 11 +++++++----
>  hw/arm/Kconfig    |  1 +
>  2 files changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/arm/musicpal.c b/hw/arm/musicpal.c
> index 8b58b66f263..7d1f2f3fb3f 100644
> --- a/hw/arm/musicpal.c
> +++ b/hw/arm/musicpal.c
> @@ -30,6 +30,7 @@
>  #include "hw/irq.h"
>  #include "hw/or-irq.h"
>  #include "hw/audio/wm8750.h"
> +#include "hw/misc/aliased_region.h"
>  #include "sysemu/block-backend.h"
>  #include "sysemu/runstate.h"
>  #include "sysemu/dma.h"
> @@ -1656,7 +1657,7 @@ static void musicpal_init(MachineState *machine)
>          qdev_prop_set_uint32(dev, "num-blocks", flash_size / sector_size);
>          qdev_prop_set_uint32(dev, "sector-length", sector_size);
>          qdev_prop_set_uint8(dev, "width", 2); /* 16-bit */
> -        qdev_prop_set_uint8(dev, "mappings", MP_FLASH_SIZE_MAX / flash_size);
> +        qdev_prop_set_uint8(dev, "mappings", 0);
>          qdev_prop_set_uint8(dev, "big-endian", 0);
>          qdev_prop_set_uint16(dev, "id0", 0x00bf);
>          qdev_prop_set_uint16(dev, "id1", 0x236d);
> @@ -1667,14 +1668,16 @@ static void musicpal_init(MachineState *machine)
>          qdev_prop_set_string(dev, "name", "musicpal.flash");
>          sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
>  
> -        sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0,
> -                        0x100000000ULL - MP_FLASH_SIZE_MAX);
> -
>          /*
>           * The original U-Boot accesses the flash at 0xFE000000 instead of
>           * 0xFF800000 (if there is 8 MB flash). So remap flash access if the
>           * image is smaller than 32 MB.
>           */
> +        memory_region_add_subregion_aliased(get_system_memory(),
> +                                0x100000000ULL - MP_FLASH_SIZE_MAX,
> +                                MP_FLASH_SIZE_MAX,
> +                                sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 0),
> +                                flash_size);
>      }
>      sysbus_create_simple(TYPE_MV88W8618_FLASHCFG, MP_FLASHCFG_BASE, NULL);
>  
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 8c37cf00da7..aa8553b3cd3 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -101,6 +101,7 @@ config MUSICPAL
>      select MARVELL_88W8618
>      select PTIMER
>      select PFLASH_CFI02
> +    select ALIASED_REGION
>      select SERIAL
>      select WM8750
>  
> 

