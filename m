Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE50664A3D6
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 15:59:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4kGA-0003ze-Tw; Mon, 12 Dec 2022 09:58:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p4kFw-0003xm-9S
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 09:58:13 -0500
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p4kFu-00016U-AU
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 09:58:12 -0500
Received: by mail-oi1-x22f.google.com with SMTP id s187so11411015oie.10
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 06:58:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6XJ4GKZnAKC1EMalteasXakLHOmADHJEEJUAvR+2a4g=;
 b=W0X4wfJFLEU3qanXGzN/E1KDyFoXEEnL+djpDqh1pqdpE1WZhtBY4SVHOB2KMMl9LN
 XSvaj8Q01GNNCz5QmNBXHvXq0GipMljSp8+XG1eGnTfIqrRFMEVK5WlwtgMQlyFqz0Sv
 NkEfLiz5c7LsL2pUv48s/fEzUge/IQj2/XyUM7TS2u0XEFqCegtIVv1Aq/wbmBaU7x+h
 Xil2wP9/E9q8bzBb9np/IEyd2J4oWqZbhE7rNpkJ23psjKZ4c8Kc2Fh8eIC6kznQIiDS
 CkzhZOiJfxEULQSQ26RE0dJggakaBb6f/nssZXIl4MBdtZYkL6vmFbpU/z7eY2foZzWg
 BraA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6XJ4GKZnAKC1EMalteasXakLHOmADHJEEJUAvR+2a4g=;
 b=h01vQDZs2oTDnJQJlF3uto5EXLHl6N+WfTo/NkMlZuuPhNRSZgb3M675xWMTeViWFZ
 FCPCBE9ZZjoS5fRSyjUzAZR2vqYr+IL1gPjq5nlrSrLmGcwHkWel0DrWeGDVVcBr/oH8
 t6mSDxs3TIV0k5J/izbBbDNvwD7fWNOjGnZjJMRyfWFTNdH4HBsLqUarz7YTzFYbeRV9
 mysZrzEJV8jve4KR4Wc6yKXQcc+1wYd0IWluzn5kVPjTyv63HvoDZVIdhnMolyYwRIoY
 ddZpUwxA57ROw9sFGaSpV1LTqvP5rGDW2GlI9vprNIeTQd0P85POoYoj/Xoa2qgzP2Mr
 Jj0Q==
X-Gm-Message-State: ANoB5pmDuEYdrbSQMard1NCprNGQvA35lePHS/Gdx3GTkq3s2xh35vlK
 CrS0cIPrMvK8pxNUHvm1KkWQmQ==
X-Google-Smtp-Source: AA0mqf5EGktIA9NATEt0k0NB2qafdnkr7cqVQ26lwOrNd8lwWPLk30dYN9qs8v2VpaNGLjGjYP0wMQ==
X-Received: by 2002:a05:6808:491:b0:35e:8855:1f2f with SMTP id
 z17-20020a056808049100b0035e88551f2fmr2269186oid.31.1670857088945; 
 Mon, 12 Dec 2022 06:58:08 -0800 (PST)
Received: from ?IPV6:2806:102e:18:2efc:20f0:1d0e:8e1f:fff0?
 ([2806:102e:18:2efc:20f0:1d0e:8e1f:fff0])
 by smtp.gmail.com with ESMTPSA id
 y4-20020a056808060400b0035b451d80afsm3570910oih.58.2022.12.12.06.58.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Dec 2022 06:58:08 -0800 (PST)
Message-ID: <74513204-aea8-e804-dd85-6361456cff01@linaro.org>
Date: Mon, 12 Dec 2022 08:58:05 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH-for-8.0 v2 11/11] hw/mips/malta: Merge common BL code as
 bl_setup_gt64120_jump_kernel()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Dragan Mladjenovic <Dragan.Mladjenovic@syrmia.com>,
 Milica Lazarevic <milica.lazarevic@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Djordje Todorovic <djordje.todorovic@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Bernhard Beschow <shentey@gmail.com>
References: <20221211204533.85359-1-philmd@linaro.org>
 <20221211204533.85359-12-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221211204533.85359-12-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22f;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 12/11/22 14:45, Philippe Mathieu-Daudé wrote:
> Merge common code shared between write_bootloader() and
> write_bootloader_nanomips() into bl_setup_gt64120_jump_kernel().
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


> ---
>   hw/mips/malta.c | 155 +++++++++++++++++-------------------------------
>   1 file changed, 56 insertions(+), 99 deletions(-)
> 
> diff --git a/hw/mips/malta.c b/hw/mips/malta.c
> index 876bc26a7f..9cd59c13e4 100644
> --- a/hw/mips/malta.c
> +++ b/hw/mips/malta.c
> @@ -610,11 +610,64 @@ static void network_init(PCIBus *pci_bus)
>       }
>   }
>   
> +static void bl_setup_gt64120_jump_kernel(void **p, uint64_t run_addr,
> +                                         uint64_t kernel_entry)
> +{
> +    /* Bus endianess is always reversed */
> +#if TARGET_BIG_ENDIAN
> +#define cpu_to_gt32 cpu_to_le32
> +#else
> +#define cpu_to_gt32 cpu_to_be32
> +#endif
> +
> +    /* setup MEM-to-PCI0 mapping as done by YAMON */
> +
> +    /* move GT64120 registers from 0x14000000 to 0x1be00000 */
> +    bl_gen_write_u32(p, /* GT_ISD */
> +                     cpu_mips_phys_to_kseg1(NULL, 0x14000000 + 0x68),
> +                     cpu_to_gt32(0x1be00000 << 3));
> +
> +    /* setup PCI0 io window to 0x18000000-0x181fffff */
> +    bl_gen_write_u32(p, /* GT_PCI0IOLD */
> +                     cpu_mips_phys_to_kseg1(NULL, 0x1be00000 + 0x48),
> +                     cpu_to_gt32(0x18000000 << 3));
> +    bl_gen_write_u32(p, /* GT_PCI0IOHD */
> +                     cpu_mips_phys_to_kseg1(NULL, 0x1be00000 + 0x50),
> +                     cpu_to_gt32(0x08000000 << 3));
> +
> +    /* setup PCI0 mem windows */
> +    bl_gen_write_u32(p, /* GT_PCI0M0LD */
> +                     cpu_mips_phys_to_kseg1(NULL, 0x1be00000 + 0x58),
> +                     cpu_to_gt32(0x10000000 << 3));
> +    bl_gen_write_u32(p, /* GT_PCI0M0HD */
> +                     cpu_mips_phys_to_kseg1(NULL, 0x1be00000 + 0x60),
> +                     cpu_to_gt32(0x07e00000 << 3));
> +    bl_gen_write_u32(p, /* GT_PCI0M1LD */
> +                     cpu_mips_phys_to_kseg1(NULL, 0x1be00000 + 0x80),
> +                     cpu_to_gt32(0x18200000 << 3));
> +    bl_gen_write_u32(p, /* GT_PCI0M1HD */
> +                     cpu_mips_phys_to_kseg1(NULL, 0x1be00000 + 0x88),
> +                     cpu_to_gt32(0x0bc00000 << 3));
> +
> +#undef cpu_to_gt32
> +
> +    bl_gen_jump_kernel(p,
> +                       true, ENVP_VADDR - 64,
> +                       /*
> +                        * If semihosting is used, arguments have already
> +                        * been passed, so we preserve $a0.
> +                        */
> +                       !semihosting_get_argc(), 2,
> +                       true, ENVP_VADDR,
> +                       true, ENVP_VADDR + 8,
> +                       true, loaderparams.ram_low_size,
> +                       kernel_entry);
> +}
> +
>   static void write_bootloader_nanomips(uint8_t *base, uint64_t run_addr,
>                                         uint64_t kernel_entry)
>   {
>       uint16_t *p;
> -    void *v;
>   
>       /* Small bootloader */
>       p = (uint16_t *)base;
> @@ -638,55 +691,7 @@ static void write_bootloader_nanomips(uint8_t *base, uint64_t run_addr,
>   
>       /* to_here: */
>   
> -#if TARGET_BIG_ENDIAN
> -#define cpu_to_gt32 cpu_to_le32
> -#else
> -#define cpu_to_gt32 cpu_to_be32
> -#endif
> -    v = p;
> -
> -    /* setup MEM-to-PCI0 mapping as done by YAMON */
> -
> -    /* move GT64120 registers from 0x14000000 to 0x1be00000 */
> -    bl_gen_write_u32(&v, /* GT_ISD */
> -                     cpu_mips_phys_to_kseg1(NULL, 0x14000000 + 0x68),
> -                     cpu_to_gt32(0x1be00000 << 3));
> -
> -    /* setup PCI0 io window to 0x18000000-0x181fffff */
> -    bl_gen_write_u32(&v, /* GT_PCI0IOLD */
> -                     cpu_mips_phys_to_kseg1(NULL, 0x1be00000 + 0x48),
> -                     cpu_to_gt32(0x18000000 << 3));
> -    bl_gen_write_u32(&v, /* GT_PCI0IOHD */
> -                     cpu_mips_phys_to_kseg1(NULL, 0x1be00000 + 0x50),
> -                     cpu_to_gt32(0x08000000 << 3));
> -
> -    /* setup PCI0 mem windows */
> -    bl_gen_write_u32(&v, /* GT_PCI0M0LD */
> -                     cpu_mips_phys_to_kseg1(NULL, 0x1be00000 + 0x58),
> -                     cpu_to_gt32(0x10000000 << 3));
> -    bl_gen_write_u32(&v, /* GT_PCI0M0HD */
> -                     cpu_mips_phys_to_kseg1(NULL, 0x1be00000 + 0x60),
> -                     cpu_to_gt32(0x07e00000 << 3));
> -    bl_gen_write_u32(&v, /* GT_PCI0M1LD */
> -                     cpu_mips_phys_to_kseg1(NULL, 0x1be00000 + 0x80),
> -                     cpu_to_gt32(0x18200000 << 3));
> -    bl_gen_write_u32(&v, /* GT_PCI0M1HD */
> -                     cpu_mips_phys_to_kseg1(NULL, 0x1be00000 + 0x88),
> -                     cpu_to_gt32(0x0bc00000 << 3));
> -
> -#undef cpu_to_gt32
> -
> -    bl_gen_jump_kernel(&v,
> -                       true, ENVP_VADDR - 64,
> -                       /*
> -                        * If semihosting is used, arguments have already been
> -                        * passed, so we preserve $a0.
> -                        */
> -                       !semihosting_get_argc(), 2,
> -                       true, ENVP_VADDR,
> -                       true, ENVP_VADDR + 8,
> -                       true, loaderparams.ram_low_size,
> -                       kernel_entry);
> +    bl_setup_gt64120_jump_kernel((void **)&p, run_addr, kernel_entry);
>   }
>   
>   /*
> @@ -752,55 +757,8 @@ static void write_bootloader(uint8_t *base, uint64_t run_addr,
>        *
>        */
>   
> -    /* Bus endianess is always reversed */
> -#if TARGET_BIG_ENDIAN
> -#define cpu_to_gt32 cpu_to_le32
> -#else
> -#define cpu_to_gt32 cpu_to_be32
> -#endif
>       v = p;
> -
> -    /* move GT64120 registers from 0x14000000 to 0x1be00000 */
> -    bl_gen_write_u32(&v, /* GT_ISD */
> -                     cpu_mips_phys_to_kseg1(NULL, 0x14000000 + 0x68),
> -                     cpu_to_gt32(0x1be00000 << 3));
> -
> -    /* setup MEM-to-PCI0 mapping */
> -    /* setup PCI0 io window to 0x18000000-0x181fffff */
> -    bl_gen_write_u32(&v, /* GT_PCI0IOLD */
> -                     cpu_mips_phys_to_kseg1(NULL, 0x1be00000 + 0x48),
> -                     cpu_to_gt32(0x18000000 << 3));
> -    bl_gen_write_u32(&v, /* GT_PCI0IOHD */
> -                     cpu_mips_phys_to_kseg1(NULL, 0x1be00000 + 0x50),
> -                     cpu_to_gt32(0x08000000 << 3));
> -    /* setup PCI0 mem windows */
> -    bl_gen_write_u32(&v, /* GT_PCI0M0LD */
> -                     cpu_mips_phys_to_kseg1(NULL, 0x1be00000 + 0x58),
> -                     cpu_to_gt32(0x10000000 << 3));
> -    bl_gen_write_u32(&v, /* GT_PCI0M0HD */
> -                     cpu_mips_phys_to_kseg1(NULL, 0x1be00000 + 0x60),
> -                     cpu_to_gt32(0x07e00000 << 3));
> -
> -    bl_gen_write_u32(&v, /* GT_PCI0M1LD */
> -                     cpu_mips_phys_to_kseg1(NULL, 0x1be00000 + 0x80),
> -                     cpu_to_gt32(0x18200000 << 3));
> -    bl_gen_write_u32(&v, /* GT_PCI0M1HD */
> -                     cpu_mips_phys_to_kseg1(NULL, 0x1be00000 + 0x88),
> -                     cpu_to_gt32(0x0bc00000 << 3));
> -
> -#undef cpu_to_gt32
> -
> -    bl_gen_jump_kernel(&v,
> -                       true, ENVP_VADDR - 64,
> -                       /*
> -                        * If semihosting is used, arguments have already been
> -                        * passed, so we preserve $a0.
> -                        */
> -                       !semihosting_get_argc(), 2,
> -                       true, ENVP_VADDR,
> -                       true, ENVP_VADDR + 8,
> -                       true, loaderparams.ram_low_size,
> -                       kernel_entry);
> +    bl_setup_gt64120_jump_kernel(&v, run_addr, kernel_entry);
>       p = v;
>   
>       /* YAMON subroutines */
> @@ -845,7 +803,6 @@ static void write_bootloader(uint8_t *base, uint64_t run_addr,
>       stl_p(p++, 0x00000000);                  /* nop */
>       stl_p(p++, 0x03e00009);                  /* jalr ra */
>       stl_p(p++, 0xa1040000);                  /* sb a0,0(t0) */
> -
>   }
>   
>   static void G_GNUC_PRINTF(3, 4) prom_set(uint32_t *prom_buf, int index,


