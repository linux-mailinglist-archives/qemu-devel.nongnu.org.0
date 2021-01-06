Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F77C2EC2B6
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 18:49:48 +0100 (CET)
Received: from localhost ([::1]:47512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxCwM-0004yO-MO
	for lists+qemu-devel@lfdr.de; Wed, 06 Jan 2021 12:49:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxCvS-0004Xc-Tw
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 12:48:50 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:42484)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxCvO-0004pR-5z
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 12:48:49 -0500
Received: by mail-wr1-x436.google.com with SMTP id m5so3184231wrx.9
 for <qemu-devel@nongnu.org>; Wed, 06 Jan 2021 09:48:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3Pwj/2erWVTfxJvyl/604z+zJQ23cvN/d6WdRV2V7Jc=;
 b=Vyq6ruOg9IbfdzfBm15eEn/VNKJexxAaiyOgG1GLi+EpYsXTUpHMBSqWQveoqXrm5Q
 g6jzCNyeuIdfn2IAsFXjGvrG2MDFGjLjNz+SPNqV8Vk2eNi0wc/WECgria6YgOL4WzYt
 gWAkjCsjp4Ee9bQOf+u/0GZDROcY/k4TfQ4Pq5tqNsVrT9F+FzRX5ZcuOAu0V4wX/kMx
 +k/dg7r3YowqJalMMrlm/1uVhFfit8d1wjozpXXuD7kQ+7V4srYyhc0ZgseIyRdCRUSQ
 Z0E0vajYdLq8UqFLWSgiJswqamfeHA1qACPWNLf8uBMXxFuhtvGihV+E3UJ0o04xrUuG
 PJfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3Pwj/2erWVTfxJvyl/604z+zJQ23cvN/d6WdRV2V7Jc=;
 b=moZRVHZOjtapVqQm9Zca/3fUZguQO3y58V8fALx6fzUoa1oUyW4A/m3j4ulKSTjBTy
 RTl/uynECdFzWRRSmwd2ldIWHs5NlkzDoATjSPgcpMM+eTe9YXeiCUO/R+nuDsYE/OHo
 dK0WEcb35lvPq0Kv1mlRkqVU3SyEn9JBP7qyLR8aZEghVV1CpYdu0sfiqouqm4syM0R8
 6PECFU+7XpVXMd5kbEH60PpgFK2ttoQtcoh4XHtY3TdRooCbIg2vksKPzwIM59RVCPti
 f12huh9R4F1ftIUfhLkQaaHGJdVGGtHmH4OTaOcxx1l6VPnZQnjQbxvSa+FLNJiFhTaX
 X9jA==
X-Gm-Message-State: AOAM531t/1qQLsTWKqJcmZZdgfg3X816/m06qFH3GMQ5vQfj4K/vNVX4
 +LIHt9sjBMsIhb2g1jGGzE0=
X-Google-Smtp-Source: ABdhPJxHQNKsgWTQz0uC86DeQ4D3Yo3rbC9gADG0ZaRsNMcomZ+WkSw29d6PN/QqlHdijdTe5uuRQQ==
X-Received: by 2002:adf:bc92:: with SMTP id g18mr5190717wrh.160.1609955324658; 
 Wed, 06 Jan 2021 09:48:44 -0800 (PST)
Received: from [192.168.1.36] (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id w4sm3789766wmc.13.2021.01.06.09.48.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Jan 2021 09:48:43 -0800 (PST)
Subject: Re: [PATCH v2 5/8] hw/mips: Use bl_gen_kernel_jump to generate
 bootloaders
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org
References: <20201215064200.28751-1-jiaxun.yang@flygoat.com>
 <20201215064507.30148-2-jiaxun.yang@flygoat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <7dac375f-0cc8-7855-4578-e54b319bd2af@amsat.org>
Date: Wed, 6 Jan 2021 18:48:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201215064507.30148-2-jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.249,
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
Cc: chenhuacai@kernel.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, paulburton@kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+Alex

On 12/15/20 7:45 AM, Jiaxun Yang wrote:
> Replace embedded binary with generated code.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  hw/mips/boston.c    | 17 ++---------------
>  hw/mips/fuloong2e.c | 28 ++++------------------------
>  hw/mips/malta.c     | 41 ++++++++++-------------------------------
>  3 files changed, 16 insertions(+), 70 deletions(-)
> 
> diff --git a/hw/mips/boston.c b/hw/mips/boston.c
> index c3b94c68e1..b622222c7d 100644
> --- a/hw/mips/boston.c
> +++ b/hw/mips/boston.c
> @@ -27,6 +27,7 @@
>  #include "hw/ide/ahci.h"
>  #include "hw/loader.h"
>  #include "hw/loader-fit.h"
> +#include "hw/mips/bootloader.h"
>  #include "hw/mips/cps.h"
>  #include "hw/pci-host/xilinx-pcie.h"
>  #include "hw/qdev-clock.h"
> @@ -324,21 +325,7 @@ static void gen_firmware(uint32_t *p, hwaddr kernel_entry, hwaddr fdt_addr,
>       * a2/$6 = 0
>       * a3/$7 = 0
>       */
> -    stl_p(p++, 0x2404fffe);                     /* li   $4, -2 */
> -                                                /* lui  $5, hi(fdt_addr) */
> -    stl_p(p++, 0x3c050000 | ((fdt_addr >> 16) & 0xffff));
> -    if (fdt_addr & 0xffff) {                    /* ori  $5, lo(fdt_addr) */
> -        stl_p(p++, 0x34a50000 | (fdt_addr & 0xffff));
> -    }
> -    stl_p(p++, 0x34060000);                     /* li   $6, 0 */
> -    stl_p(p++, 0x34070000);                     /* li   $7, 0 */
> -
> -    /* Load kernel entry address & jump to it */
> -                                                /* lui  $25, hi(kernel_entry) */
> -    stl_p(p++, 0x3c190000 | ((kernel_entry >> 16) & 0xffff));
> -                                                /* ori  $25, lo(kernel_entry) */
> -    stl_p(p++, 0x37390000 | (kernel_entry & 0xffff));
> -    stl_p(p++, 0x03200009);                     /* jr   $25 */

Eh, no delay slot NOP :)

> +    bl_gen_jump_kernel(&p, 0, (int32_t)-2, fdt_addr, 0, 0, kernel_entry);
>  }
>  
...

> diff --git a/hw/mips/malta.c b/hw/mips/malta.c
> index 9afc0b427b..ffd67b8293 100644
> --- a/hw/mips/malta.c
> +++ b/hw/mips/malta.c
> @@ -37,6 +37,7 @@
>  #include "hw/i2c/smbus_eeprom.h"
>  #include "hw/block/flash.h"
>  #include "hw/mips/mips.h"
> +#include "hw/mips/bootloader.h"
>  #include "hw/mips/cpudevs.h"
>  #include "hw/pci/pci.h"
>  #include "sysemu/sysemu.h"
> @@ -844,6 +845,7 @@ static void write_bootloader_nanomips(uint8_t *base, uint64_t run_addr,
>  static void write_bootloader(uint8_t *base, uint64_t run_addr,
>                               uint64_t kernel_entry)
>  {
> +    target_ulong a0;
>      uint32_t *p;
>  
>      /* Small bootloader */
> @@ -872,30 +874,6 @@ static void write_bootloader(uint8_t *base, uint64_t run_addr,
>      /* Second part of the bootloader */
>      p = (uint32_t *) (base + 0x580);
>  
> -    if (semihosting_get_argc()) {
> -        /* Preserve a0 content as arguments have been passed */
> -        stl_p(p++, 0x00000000);              /* nop */
> -    } else {
> -        stl_p(p++, 0x24040002);              /* addiu a0, zero, 2 */
> -    }
> -
> -    /* lui sp, high(ENVP_VADDR) */
> -    stl_p(p++, 0x3c1d0000 | (((ENVP_VADDR - 64) >> 16) & 0xffff));
> -    /* ori sp, sp, low(ENVP_VADDR) */
> -    stl_p(p++, 0x37bd0000 | ((ENVP_VADDR - 64) & 0xffff));
> -    /* lui a1, high(ENVP_VADDR) */
> -    stl_p(p++, 0x3c050000 | ((ENVP_VADDR >> 16) & 0xffff));
> -    /* ori a1, a1, low(ENVP_VADDR) */
> -    stl_p(p++, 0x34a50000 | (ENVP_VADDR & 0xffff));
> -    /* lui a2, high(ENVP_VADDR + 8) */
> -    stl_p(p++, 0x3c060000 | (((ENVP_VADDR + 8) >> 16) & 0xffff));
> -    /* ori a2, a2, low(ENVP_VADDR + 8) */
> -    stl_p(p++, 0x34c60000 | ((ENVP_VADDR + 8) & 0xffff));
> -    /* lui a3, high(ram_low_size) */
> -    stl_p(p++, 0x3c070000 | (loaderparams.ram_low_size >> 16));
> -    /* ori a3, a3, low(ram_low_size) */
> -    stl_p(p++, 0x34e70000 | (loaderparams.ram_low_size & 0xffff));
> -
>      /* Load BAR registers as done by YAMON */
>      stl_p(p++, 0x3c09b400);                  /* lui t1, 0xb400 */
>  
> @@ -947,13 +925,14 @@ static void write_bootloader(uint8_t *base, uint64_t run_addr,
>  #endif
>      stl_p(p++, 0xad280088);                  /* sw t0, 0x0088(t1) */
>  
> -    /* Jump to kernel code */
> -    stl_p(p++, 0x3c1f0000 |
> -          ((kernel_entry >> 16) & 0xffff));  /* lui ra, high(kernel_entry) */
> -    stl_p(p++, 0x37ff0000 |
> -          (kernel_entry & 0xffff));          /* ori ra, ra, low(kernel_entry) */
> -    stl_p(p++, 0x03e00009);                  /* jalr ra */
> -    stl_p(p++, 0x00000000);                  /* nop */
> +    if (semihosting_get_argc()) {
> +        a0 = 0;

I never used semihosting with Malta, but it seems you are
clearing $a0 content.

> +    } else {
> +        a0 = 2;
> +    }
> +    bl_gen_jump_kernel(&p, ENVP_VADDR - 64, a0, ENVP_VADDR,
> +                       ENVP_VADDR + 8, loaderparams.ram_low_size,
> +                       kernel_entry);
>  
>      /* YAMON subroutines */
>      p = (uint32_t *) (base + 0x800);
> 

