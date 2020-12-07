Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C10C82D1894
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 19:35:07 +0100 (CET)
Received: from localhost ([::1]:48696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmLLh-00059L-OU
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 13:35:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kmL87-0005n5-PW
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 13:20:59 -0500
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643]:46427)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kmL83-0007e6-Nf
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 13:20:58 -0500
Received: by mail-ej1-x643.google.com with SMTP id bo9so20781263ejb.13
 for <qemu-devel@nongnu.org>; Mon, 07 Dec 2020 10:20:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=eo4tALWmTsUFwFiM9EDe0yAn4fvt/rLzZfO2wrNx3Q8=;
 b=fhWR/urSJpTBq1v9tqhyev7KVCm6aV0O1G2S2/xntwOFSSNjmnO2HUltyeMdulveUF
 AOF63aQzClonbnGdfPp/e8pCqNV0Ech6ME8VE4ysZyBU2zGh5Xkcx/E3WGoxbYA0dmWk
 nVvTuQglbiM8CbH2BsmowuRs+zh1EEA1/ryeimGG1+Vb8b1MFb0wEMc/mEJWsy5D8Nhx
 EHXJlkfojmguaqxKzfcLjAE+LC+NqmXOUmErXgNRXUE7bDc0JhzNUzm5BMVf7/kTVtax
 v96NV5sO2V2ebVhZGe8h4JeM44RfYgAZf7CJFN9kgjn+fhRdfKwOg0D/LyEQ+q9wlvFW
 SVtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eo4tALWmTsUFwFiM9EDe0yAn4fvt/rLzZfO2wrNx3Q8=;
 b=ATF9Hfdh4ZtYT4NMOMTx1Y4uthoMdvmCqI1TdZXIO5a3TFLMoMNDdgJY4MDW6QITKR
 UCOJPSakRiKbH/HNDtL2yiYWl51mKVP3iUzF3ET9xNLMIYQ7SMgIJQMMwwssyf7+5VkG
 MWaIpotYXPlZFHLQwwRYMt4yrJhFMfRQ/rHANExrFOXDRUVlpbQHVZTUG8c542tGvoCe
 99Cu5evXFSny82erJb23vjYha/P899WKd3I4CN0TnnToOf4aLcd4abzT8cqC3PmuT5Fc
 jdDlN/JfwHsnJ6Mxyc978ct7N0GoXE1AOfgdeywjyg6sgVT7ThBOlNGwVw18b1gaApb/
 Vy7w==
X-Gm-Message-State: AOAM532gb17MeMEdCcWzcNk6U244hMlJFSzf+xUAtstyhH6Z1oFZuvig
 WhTa57S/XYGLGCrlC0/LiZc=
X-Google-Smtp-Source: ABdhPJylKP411HFoQrWjnNWv9pIfv2nRN4xedGj9zlzLT1ilTkV9L3st5As7zjaYwbMXyRaUHjkaJw==
X-Received: by 2002:a17:906:a982:: with SMTP id
 jr2mr20693792ejb.292.1607365253179; 
 Mon, 07 Dec 2020 10:20:53 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id i18sm12978177edq.79.2020.12.07.10.20.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Dec 2020 10:20:52 -0800 (PST)
Subject: Re: [PATCH 2/5] hw/mips/malta: Make use of bootloader helper
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org
References: <20201207050231.2712-1-jiaxun.yang@flygoat.com>
 <20201207050231.2712-3-jiaxun.yang@flygoat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <c708725a-ee28-0ece-1858-8693a2e434c8@amsat.org>
Date: Mon, 7 Dec 2020 19:20:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201207050231.2712-3-jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::643;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x643.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: chenhuacai@kernel.org, paulburton@kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/7/20 6:02 AM, Jiaxun Yang wrote:
> Use bootloader helper to generate BAR setting code
> and kernel jump.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  hw/mips/malta.c | 108 ++++++++++++------------------------------------
>  1 file changed, 26 insertions(+), 82 deletions(-)
> 
...
> +    /* GT64xxxx is always big endian */
>  #ifdef TARGET_WORDS_BIGENDIAN
> -    stl_p(p++, 0x3c08c100);                  /* lui t0, 0xc100 */
> +#define cpu_to_gt32(x) cpu_to_le32(x)
>  #else
> -    stl_p(p++, 0x340800c1);                  /* ori t0, r0, 0x00c1 */
> +#define cpu_to_gt32(x) cpu_to_be32(x)
>  #endif
> -    stl_p(p++, 0xad280080);                  /* sw t0, 0x0080(t1) */
> -#ifdef TARGET_WORDS_BIGENDIAN
> -    stl_p(p++, 0x3c085e00);                  /* lui t0, 0x5e00 */
> -#else
> -    stl_p(p++, 0x3408005e);                  /* ori t0, r0, 0x005e */
> -#endif
> -    stl_p(p++, 0xad280088);                  /* sw t0, 0x0088(t1) */
> +    /* Load BAR registers as done by YAMON */
> +    /* move GT64120 registers from 0x14000000 to 0x1be00000 */
> +    bl_gen_writel(&p, cpu_to_gt32(0xdf000000), 0xb4000068);

Ideally we'd write as:

    bl_gen_writel(&p, cpu_to_be32(0x1be00000 << 3),
                  cpu_mips_phys_to_kseg1(NULL, 0x14000068));

But I guess this is enough:

    bl_gen_writel(&p, cpu_to_be32(0x1be00000 << 3), 0xb4000068);

No need for cpu_to_gt32().

From a review point of view, it would be easier to split your
patches in 2: first use bl_gen_write_u32/u64, second convert
bl_gen_jump_to_u32 and bl_gen_jump_kernel_u32.

> +
> +    /* setup MEM-to-PCI0 mapping */
> +    /* setup PCI0 io window to 0x18000000-0x181fffff */
> +    bl_gen_writel(&p, cpu_to_gt32(0xc0000000), 0xbbe00048);
> +    bl_gen_writel(&p, cpu_to_gt32(0x40000000), 0xbbe00050);
> +    /* setup PCI0 mem windows */
> +    bl_gen_writel(&p, cpu_to_gt32(0x80000000), 0xbbe00058);
> +    bl_gen_writel(&p, cpu_to_gt32(0x3f000000), 0xbbe00060);
> +    bl_gen_writel(&p, cpu_to_gt32(0xc1000000), 0xbbe00080);
> +    bl_gen_writel(&p, cpu_to_gt32(0x5e000000), 0xbbe00088);
> +#undef cpu_to_gt32
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
> +    bl_gen_jump_kernel(&p, ENVP_ADDR - 64, a0, ENVP_ADDR, (ENVP_ADDR + 8),
> +                        loaderparams.ram_low_size, kernel_entry);
>  
>      /* YAMON subroutines */
>      p = (uint32_t *) (base + 0x800);
> 

