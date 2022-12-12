Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C579D64A385
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 15:38:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4jvB-0004cI-W4; Mon, 12 Dec 2022 09:36:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p4juT-0004HP-Q3
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 09:36:04 -0500
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p4juR-0003A4-PP
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 09:36:01 -0500
Received: by mail-oi1-x22a.google.com with SMTP id q186so11354556oia.9
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 06:35:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gl6okLhHEnpjhOBaT8jDqJmPQ5x4+bycrjuC86Swg6Y=;
 b=ry/Nzqtp1i2mO9IsbAYEufWmdX6xT7C8hlsRbLGxvkweHJWvKONlfA0HtAobcM5aVF
 voSffUQDOlJ9uAER01D6b8uK1iBK6kje3aSqU3AcWGH4hdkOVDKO4UV7g4WtBmKnRnb4
 pWe5CRwWYyKDwDs34n9Kf6k9y6zR151y3r3Wd8Rm7ZK+nneuq2Lc0BiRN9rII7d9k23T
 8IGSCKWUKjQFT1IoH9VJNRTHvT6x19JuyZnvY82MEuD7UWD7neqBR7mPIEa3t/WqUHO6
 L2/igo4U0KXBoWtlbpIudLJB0pyjR9eBiucGBSZ3YHLrjhjlnCZBCVEN0rYzweN40XsW
 Xvgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gl6okLhHEnpjhOBaT8jDqJmPQ5x4+bycrjuC86Swg6Y=;
 b=VkjfIDkjmTYqXcIj+xd43am+UKBg9JGl/xR5DI0zfShTv04WmgfwUq150IZYekMxc9
 vFU63xei0v3WZpFkCjVd4ztOhUMWblKiimRzJypx43fjqHxkdNgXDzIXyM6gdoirdvMU
 nD/rxvCTZIk+3hqoBn2DJYwdeA2/RxBjk2VlgCt/LnP6ML9Yig27gAsrZXx+QZslvtvM
 F/siBsgQGydFixmeN8WTUweYM2PK3LlE0+/asLqQhYoAM0ivKakgkeEFgkdkvWdwTOtp
 ERJG4qpq/V/JdYW3P0rLiFEPP6wFPaoYAf+nLKGPcqe2/F1hMOa0xSoDNw5Kou3dTrz+
 6xpg==
X-Gm-Message-State: ANoB5pmvjvW18nTfNuovXtJDvS8vNJDPZx7F8CQzZas/FGXivGR7iZsO
 4V5ZDY496BrKixb4QAdyUCX7wg==
X-Google-Smtp-Source: AA0mqf5ocf7FEZlGEQABf0kfc4GyHaihlZlHiY/bo55mA242/XG/j/pqca1dmiLo+WlsATsaMq4mrg==
X-Received: by 2002:aca:c28b:0:b0:35a:1139:3828 with SMTP id
 s133-20020acac28b000000b0035a11393828mr6994847oif.38.1670855753465; 
 Mon, 12 Dec 2022 06:35:53 -0800 (PST)
Received: from ?IPV6:2806:102e:18:2efc:20f0:1d0e:8e1f:fff0?
 ([2806:102e:18:2efc:20f0:1d0e:8e1f:fff0])
 by smtp.gmail.com with ESMTPSA id
 bh4-20020a056808180400b0035a81480ffcsm3599434oib.38.2022.12.12.06.35.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Dec 2022 06:35:52 -0800 (PST)
Message-ID: <bff25f0e-d052-8083-9f43-740fe5179d38@linaro.org>
Date: Mon, 12 Dec 2022 08:35:50 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH-for-8.0 v2 07/11] hw/mips/malta: Use bootloader generator
 API for nanoMIPS CPUs (2/5)
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Dragan Mladjenovic <Dragan.Mladjenovic@syrmia.com>,
 Milica Lazarevic <milica.lazarevic@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Djordje Todorovic <djordje.todorovic@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Bernhard Beschow <shentey@gmail.com>
References: <20221211204533.85359-1-philmd@linaro.org>
 <20221211204533.85359-8-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221211204533.85359-8-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22a;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22a.google.com
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
> Part 2/5: Convert PCI0 MEM0 BAR setup
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/mips/malta.c | 35 ++++++-----------------------------
>   1 file changed, 6 insertions(+), 29 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

> 
> diff --git a/hw/mips/malta.c b/hw/mips/malta.c
> index 30ca4e0000..3e80a12221 100644
> --- a/hw/mips/malta.c
> +++ b/hw/mips/malta.c
> @@ -687,7 +687,6 @@ static void write_bootloader_nanomips(uint8_t *base, uint64_t run_addr,
>        * Load BAR registers as done by YAMON:
>        *
>        *  - set up PCI0 I/O BARs from 0x18000000 to 0x181fffff
> -     *  - set up PCI0 MEM0 at 0x10000000, size 0x8000000
>        *
>        */
>       stw_p(p++, 0xe040); stw_p(p++, 0x0681);
> @@ -723,20 +722,6 @@ static void write_bootloader_nanomips(uint8_t *base, uint64_t run_addr,
>       stw_p(p++, 0xe020); stw_p(p++, 0x0001);
>                                   /* lui t0, %hi(0x80000000)      */
>   
> -    /* 0x58 corresponds to GT_PCI0M0LD                          */
> -    stw_p(p++, 0x8422); stw_p(p++, 0x9058);
> -                                /* sw t0, 0x58(t1)              */
> -
> -    stw_p(p++, 0xe020); stw_p(p++, 0x07e0);
> -                                /* lui t0, %hi(0x3f000000)      */
> -
> -    /* 0x60 corresponds to GT_PCI0M0HD                          */
> -    stw_p(p++, 0x8422); stw_p(p++, 0x9060);
> -                                /* sw t0, 0x60(t1)              */
> -
> -    stw_p(p++, 0xe020); stw_p(p++, 0x0821);
> -                                /* lui t0, %hi(0xc1000000)      */
> -
>   #else
>   #define cpu_to_gt32 cpu_to_be32
>   
> @@ -767,24 +752,16 @@ static void write_bootloader_nanomips(uint8_t *base, uint64_t run_addr,
>   
>       stw_p(p++, 0x0020); stw_p(p++, 0x0080);
>                                   /* addiu[32] t0, $0, 0x80       */
> -
> -    /* 0x58 corresponds to GT_PCI0M0LD                          */
> -    stw_p(p++, 0x8422); stw_p(p++, 0x9058);
> -                                /* sw t0, 0x58(t1)              */
> -
> -    stw_p(p++, 0x0020); stw_p(p++, 0x003f);
> -                                /* addiu[32] t0, $0, 0x3f       */
> -
> -    /* 0x60 corresponds to GT_PCI0M0HD                          */
> -    stw_p(p++, 0x8422); stw_p(p++, 0x9060);
> -                                /* sw t0, 0x60(t1)              */
> -
> -    stw_p(p++, 0x0020); stw_p(p++, 0x00c1);
> -                                /* addiu[32] t0, $0, 0xc1       */
>   #endif
>       v = p;
>   
>       /* setup PCI0 mem windows */
> +    bl_gen_write_u32(&v, /* GT_PCI0M0LD */
> +                     cpu_mips_phys_to_kseg1(NULL, 0x1be00000 + 0x58),
> +                     cpu_to_gt32(0x10000000 << 3));
> +    bl_gen_write_u32(&v, /* GT_PCI0M0HD */
> +                     cpu_mips_phys_to_kseg1(NULL, 0x1be00000 + 0x60),
> +                     cpu_to_gt32(0x07e00000 << 3));
>       bl_gen_write_u32(&v, /* GT_PCI0M1LD */
>                        cpu_mips_phys_to_kseg1(NULL, 0x1be00000 + 0x80),
>                        cpu_to_gt32(0x18200000 << 3));


