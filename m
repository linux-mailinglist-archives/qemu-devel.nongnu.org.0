Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29FF364A3C7
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 15:55:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4kBw-0001T0-IS; Mon, 12 Dec 2022 09:54:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p4kBm-0001QX-H1
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 09:53:54 -0500
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p4kBh-0007sF-GT
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 09:53:50 -0500
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-144bd860fdbso8691167fac.0
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 06:53:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=D8qf712QMEBQOtHE3J3RPU5GJm8N49J2kzHRFFnsTww=;
 b=FiyrT5l+LSzDdYgxG+c5kt6X079W4o7tB8weZqFso6x3DBWXPdUjGhz5xkWn74JT4e
 zlX5tj5HyWwi/xQhpcOFep8DcoX1CrcTEeZ8Aham55h7p3IRgwFkgY0g+coIqKqILhEP
 aT1f2+BATAeiizXGAcRArYnqGO6/58j6ADP3HoMKMryKTqoYC9iciVChKt+1oQuK/nXB
 Evog6SFmKa9coJUhQ2u3UCE8WOczWP2nUwraM0JRa/ynlSEGRVEt9d5taqmOfB0He4xg
 EqXRK59re19VF0pSn/l13l8yMq+D3RsoeHVASNfInsp9kSpVINmBXWkEhDNoEIlntnTC
 9/HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=D8qf712QMEBQOtHE3J3RPU5GJm8N49J2kzHRFFnsTww=;
 b=GjvVJvMjIsYZW9XJ00vDamXiCTmBQeBMtfRXph1aH3FpKgIi8JXYFGafUu9njWYKFX
 b3fgEYbcdaw9VkXrbT8hKYxhhtwdZX5kvlvSzRCPYF8744IqrpE8rfkbnAG2gKZimGrt
 L+fAojpBUhjchMnhLDyZOLTay2PBtcJzfhovaoRvxP4K7pp8hMHbJGz5EqZDwkp+UMjB
 KbmRXNRztb27znlb6oYvHBKfIgXYXLgo0BzYHINv4aTUQzMjebuMeuwaW01VHIK82N6G
 NwAzK0/CN4cwGCEQt5+46KqlrfDxxHe3oUVSakIzNdBhOA3YdaR1K6nWKrnu80yanGam
 fIJQ==
X-Gm-Message-State: ANoB5pn4KqPLQWf0iSVPXF9zpXdCPQwQhgJWr4Dbr5LpciaemomaVdET
 0vmMBa4SHQclD45nnqi4xuIh2Q==
X-Google-Smtp-Source: AA0mqf5f3yIrEj8fqjDxMqTNb4BWA8aRAQcBvURsORHepXiKw5DCzfyqzAGRbL8eP6Cbz8xsywV/vQ==
X-Received: by 2002:a05:6870:c214:b0:144:ceef:e5e7 with SMTP id
 z20-20020a056870c21400b00144ceefe5e7mr8360042oae.48.1670856828109; 
 Mon, 12 Dec 2022 06:53:48 -0800 (PST)
Received: from ?IPV6:2806:102e:18:2efc:20f0:1d0e:8e1f:fff0?
 ([2806:102e:18:2efc:20f0:1d0e:8e1f:fff0])
 by smtp.gmail.com with ESMTPSA id
 e2-20020a056870238200b0013d9bd4ad2esm4722oap.12.2022.12.12.06.53.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Dec 2022 06:53:47 -0800 (PST)
Message-ID: <b04af5d0-888c-f299-428d-4eaf60c69cdf@linaro.org>
Date: Mon, 12 Dec 2022 08:53:44 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH-for-8.0 v2 10/11] hw/mips/malta: Use bootloader generator
 API for nanoMIPS CPUs (5/5)
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Dragan Mladjenovic <Dragan.Mladjenovic@syrmia.com>,
 Milica Lazarevic <milica.lazarevic@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Djordje Todorovic <djordje.todorovic@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Bernhard Beschow <shentey@gmail.com>
References: <20221211204533.85359-1-philmd@linaro.org>
 <20221211204533.85359-11-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221211204533.85359-11-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2d;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2d.google.com
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
> Part 5/5: Convert jumping to kernel
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/mips/malta.c | 68 ++++++++-----------------------------------------
>   1 file changed, 11 insertions(+), 57 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


> 
> diff --git a/hw/mips/malta.c b/hw/mips/malta.c
> index 451908b217..876bc26a7f 100644
> --- a/hw/mips/malta.c
> +++ b/hw/mips/malta.c
> @@ -619,11 +619,6 @@ static void write_bootloader_nanomips(uint8_t *base, uint64_t run_addr,
>       /* Small bootloader */
>       p = (uint16_t *)base;
>   
> -#define NM_HI1(VAL) (((VAL) >> 16) & 0x1f)
> -#define NM_HI2(VAL) \
> -          (((VAL) & 0xf000) | (((VAL) >> 19) & 0xffc) | (((VAL) >> 31) & 0x1))
> -#define NM_LO(VAL)  ((VAL) & 0xfff)
> -
>       stw_p(p++, 0x2800); stw_p(p++, 0x001c);
>                                   /* bc to_here */
>       stw_p(p++, 0x8000); stw_p(p++, 0xc000);
> @@ -642,46 +637,6 @@ static void write_bootloader_nanomips(uint8_t *base, uint64_t run_addr,
>                                   /* nop */
>   
>       /* to_here: */
> -    if (semihosting_get_argc()) {
> -        /* Preserve a0 content as arguments have been passed    */
> -        stw_p(p++, 0x8000); stw_p(p++, 0xc000);
> -                                /* nop                          */
> -    } else {
> -        stw_p(p++, 0x0080); stw_p(p++, 0x0002);
> -                                /* li a0,2                      */
> -    }
> -
> -    stw_p(p++, 0xe3a0 | NM_HI1(ENVP_VADDR - 64));
> -
> -    stw_p(p++, NM_HI2(ENVP_VADDR - 64));
> -                                /* lui sp,%hi(ENVP_VADDR - 64)   */
> -
> -    stw_p(p++, 0x83bd); stw_p(p++, NM_LO(ENVP_VADDR - 64));
> -                                /* ori sp,sp,%lo(ENVP_VADDR - 64) */
> -
> -    stw_p(p++, 0xe0a0 | NM_HI1(ENVP_VADDR));
> -
> -    stw_p(p++, NM_HI2(ENVP_VADDR));
> -                                /* lui a1,%hi(ENVP_VADDR)        */
> -
> -    stw_p(p++, 0x80a5); stw_p(p++, NM_LO(ENVP_VADDR));
> -                                /* ori a1,a1,%lo(ENVP_VADDR)     */
> -
> -    stw_p(p++, 0xe0c0 | NM_HI1(ENVP_VADDR + 8));
> -
> -    stw_p(p++, NM_HI2(ENVP_VADDR + 8));
> -                                /* lui a2,%hi(ENVP_VADDR + 8)    */
> -
> -    stw_p(p++, 0x80c6); stw_p(p++, NM_LO(ENVP_VADDR + 8));
> -                                /* ori a2,a2,%lo(ENVP_VADDR + 8) */
> -
> -    stw_p(p++, 0xe0e0 | NM_HI1(loaderparams.ram_low_size));
> -
> -    stw_p(p++, NM_HI2(loaderparams.ram_low_size));
> -                                /* lui a3,%hi(loaderparams.ram_low_size) */
> -
> -    stw_p(p++, 0x80e7); stw_p(p++, NM_LO(loaderparams.ram_low_size));
> -                                /* ori a3,a3,%lo(loaderparams.ram_low_size) */
>   
>   #if TARGET_BIG_ENDIAN
>   #define cpu_to_gt32 cpu_to_le32
> @@ -719,20 +674,19 @@ static void write_bootloader_nanomips(uint8_t *base, uint64_t run_addr,
>                        cpu_mips_phys_to_kseg1(NULL, 0x1be00000 + 0x88),
>                        cpu_to_gt32(0x0bc00000 << 3));
>   
> -    p = v;
> -
>   #undef cpu_to_gt32
>   
> -    stw_p(p++, 0xe320 | NM_HI1(kernel_entry));
> -
> -    stw_p(p++, NM_HI2(kernel_entry));
> -                                /* lui t9,%hi(kernel_entry)     */
> -
> -    stw_p(p++, 0x8339); stw_p(p++, NM_LO(kernel_entry));
> -                                /* ori t9,t9,%lo(kernel_entry)  */
> -
> -    stw_p(p++, 0x4bf9); stw_p(p++, 0x0000);
> -                                /* jalrc   t8                   */
> +    bl_gen_jump_kernel(&v,
> +                       true, ENVP_VADDR - 64,
> +                       /*
> +                        * If semihosting is used, arguments have already been
> +                        * passed, so we preserve $a0.
> +                        */
> +                       !semihosting_get_argc(), 2,
> +                       true, ENVP_VADDR,
> +                       true, ENVP_VADDR + 8,
> +                       true, loaderparams.ram_low_size,
> +                       kernel_entry);
>   }
>   
>   /*


