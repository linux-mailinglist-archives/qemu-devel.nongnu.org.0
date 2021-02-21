Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6345A320A37
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 13:13:56 +0100 (CET)
Received: from localhost ([::1]:46292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDncY-0007sc-T0
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 07:13:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDnaZ-00078T-LB
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 07:11:51 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:44530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDnaX-0001bB-TA
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 07:11:51 -0500
Received: by mail-wr1-x432.google.com with SMTP id h98so11234647wrh.11
 for <qemu-devel@nongnu.org>; Sun, 21 Feb 2021 04:11:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=j/1pVp9pluC4+pLIJI4x61/nabMENWKa+n+SyOzsJD8=;
 b=YSCzoxfVzG7FWPuqEohVXJFhJlEz/Jaic/nsjiRspfot8FShHgu8e77s6HgYxUxWbS
 jdDgeTj2x5PJLM0Y0UHKmJXQEnEA4C04z4sZX399RuNcZAP+LWHat9/ALFSQnnShUoTW
 4RNQXQefmWYWiYS+nhbElan98IhP35zb/6sZVICgNvno3Mpfig8Fl9hAJ48+9Yj/DCgr
 d8+N7lZM81ojDgKAmbNQ2hI+1pAlRBKk8P71UWsKOBL0Mx1kK0YgwCoLGAPMsUa4jYTQ
 qP1z7OUzarANj5XtqhVHu8LZP1/T1Nj+OuJKN25x/4CUjHwry+rrQFeyO/T63fuRsqOk
 OBNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=j/1pVp9pluC4+pLIJI4x61/nabMENWKa+n+SyOzsJD8=;
 b=bNK8EJ3alk61wtlqJWtTeBhoBYGEXIuabWFSXwZvF9MwuVGkNNXYcxYvhUXurVR4Vd
 hIALdTd01marudZac4K9CjpTlcwtjNbb7AjULcuRoVIu19Cq9IyfAIfU5weAkAr/5gpd
 Xg2AhCySzd5+W/wLsyoj84IPK3JcLNm6x99Zz/fiuNbPdOqH5gU90OxOGx8fIRi4pcde
 dz892eP+Bz5qTUDdyw2hcTzyGAiV4rFlYfse15bIkpdJrfNFyjUI/E0sRG0WbwaBrqMc
 2dCwKqg0LeBywKLxHQmS+yJMmrgT1mX75mwnxIO4FKa5qJtyGBk1D7Ra2c3BQaKM7ukp
 IvHw==
X-Gm-Message-State: AOAM5305U22y52qpUxhlH7lPF9Fjkce58fG6+POho3pf6FgCKjy/FSU6
 peHDT1nqdilkjo7tvCa34b0=
X-Google-Smtp-Source: ABdhPJwzVIf6tDgQ0SIn56BChn8GY6ehaeZOUqVx3Fwykh8vqKNgoxs4xNADKutvSuRPZN3mi9+YEg==
X-Received: by 2002:a5d:4c82:: with SMTP id z2mr17172765wrs.220.1613909508405; 
 Sun, 21 Feb 2021 04:11:48 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id b11sm23849794wrw.68.2021.02.21.04.11.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 21 Feb 2021 04:11:47 -0800 (PST)
Subject: Re: [PATCH v3 2/4] hw/mips: Use bl_gen_kernel_jump to generate
 bootloaders
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org
References: <20210127065424.114125-1-jiaxun.yang@flygoat.com>
 <20210127065424.114125-3-jiaxun.yang@flygoat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <48718537-6799-74b9-0aae-6c780e23fc1c@amsat.org>
Date: Sun, 21 Feb 2021 13:11:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210127065424.114125-3-jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>,
 Paul Burton <paulburton@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/27/21 7:54 AM, Jiaxun Yang wrote:
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
> index 467fbc1c8b..b976c8199a 100644
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
> +    bl_gen_jump_kernel(&p, 0, (int32_t)-2, fdt_addr, 0, 0, kernel_entry);

OK.

>  }
>  
>  static const void *boston_fdt_filter(void *opaque, const void *fdt_orig,
> diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
> index bac2adbd5a..1ae84ecf92 100644
> --- a/hw/mips/fuloong2e.c
> +++ b/hw/mips/fuloong2e.c
> @@ -33,6 +33,7 @@
>  #include "hw/i2c/smbus_eeprom.h"
>  #include "hw/block/flash.h"
>  #include "hw/mips/mips.h"
> +#include "hw/mips/bootloader.h"
>  #include "hw/mips/cpudevs.h"
>  #include "hw/pci/pci.h"
>  #include "qemu/log.h"
> @@ -185,30 +186,9 @@ static void write_bootloader(CPUMIPSState *env, uint8_t *base,
>      /* Second part of the bootloader */
>      p = (uint32_t *)(base + 0x040);
>  
> -    /* lui a0, 0 */
> -    stl_p(p++, 0x3c040000);
> -    /* ori a0, a0, 2 */
> -    stl_p(p++, 0x34840002);
> -    /* lui a1, high(ENVP_VADDR) */
> -    stl_p(p++, 0x3c050000 | ((ENVP_VADDR >> 16) & 0xffff));
> -    /* ori a1, a0, low(ENVP_VADDR) */
> -    stl_p(p++, 0x34a50000 | (ENVP_VADDR & 0xffff));
> -    /* lui a2, high(ENVP_VADDR + 8) */
> -    stl_p(p++, 0x3c060000 | (((ENVP_VADDR + 8) >> 16) & 0xffff));
> -    /* ori a2, a2, low(ENVP_VADDR + 8) */
> -    stl_p(p++, 0x34c60000 | ((ENVP_VADDR + 8) & 0xffff));
> -    /* lui a3, high(env->ram_size) */
> -    stl_p(p++, 0x3c070000 | (loaderparams.ram_size >> 16));
> -    /* ori a3, a3, low(env->ram_size) */
> -    stl_p(p++, 0x34e70000 | (loaderparams.ram_size & 0xffff));
> -    /* lui ra, high(kernel_addr) */
> -    stl_p(p++, 0x3c1f0000 | ((kernel_addr >> 16) & 0xffff));
> -    /* ori ra, ra, low(kernel_addr) */
> -    stl_p(p++, 0x37ff0000 | (kernel_addr & 0xffff));
> -    /* jr ra */
> -    stl_p(p++, 0x03e00008);
> -    /* nop */
> -    stl_p(p++, 0x00000000);
> +    bl_gen_jump_kernel(&p, ENVP_VADDR - 64, 2, ENVP_VADDR,

Where do you get $sp from?

> +                       ENVP_VADDR + 8, loaderparams.ram_size,
> +                       kernel_addr);
>  }
>  
>  static void main_cpu_reset(void *opaque)
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

I'll keep that comment.

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
> +    } else {
> +        a0 = 2;
> +    }
> +    bl_gen_jump_kernel(&p, ENVP_VADDR - 64, a0, ENVP_VADDR,
> +                       ENVP_VADDR + 8, loaderparams.ram_low_size,
> +                       kernel_entry);

OK.

>  
>      /* YAMON subroutines */
>      p = (uint32_t *) (base + 0x800);
> 

