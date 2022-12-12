Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D1764A39F
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 15:43:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4jwT-0005Jb-NI; Mon, 12 Dec 2022 09:38:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p4jwO-0005B0-OG
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 09:38:02 -0500
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p4jwN-0003O1-6E
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 09:38:00 -0500
Received: by mail-oi1-x22f.google.com with SMTP id r130so6909051oih.2
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 06:37:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QAWupxWnOf5U5IF7321hFXEEFqyWghNSKCPzdfwQi0Y=;
 b=PRe7Kelz/q/uxf2YSzAx/wMKobK7i7WAs2d0OG8/PnmmloU/CMaCIL7jCU140+gC4I
 gO8PZpolY8CkCd8pfD9zH/TJDDpufWuU3W2vviqsWu8jPO9iThtwAkI0XnwLj16J1eMt
 GA9Sb+J9lP5W2pD4jGkthuiJNqXRyBq8PJib7DMWMTQh3ADTrQWq5DpmntSkwMqcmzx+
 QZTQ4rdnBKeAVDBn4G1s2C4FXNZUS3u+jFyoUy4ml42wNJoYBPDmzPQRlUI2q7VD5KZc
 Wl+5of5/9Qqd0oHOD390oZPoZg0EsptJ+o5Xppej5MjfzglOmjZZeb3+OlWiqYW3CS4c
 wGcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QAWupxWnOf5U5IF7321hFXEEFqyWghNSKCPzdfwQi0Y=;
 b=PAoatVFZsxTnjIzX3ilhFix6H5OByJAsEzw9aNHQhRBiu9v7HBwApHZGH6oBf7ihuI
 mQrPXfAgWGggJP8hZhMxIiibVga1H6jjWuv2VpIVuGC3q2W6HlzkEsm/nVnoVwYK6JU4
 e6NUv+c7ghTXxR+nDJJWA28Q9DietAoJMgWDrjfgJ/Si9xDS6S0OQdmsSZxElYiSGH5S
 POroP279ct8C2Tusp12KfjmCqjmgKXTUXJ2bLizvZeEzpmVOTWUGLPYa+aRe0mX4HVim
 ub1zgH0cGIRj03HE3OinNH3XVo1jcxZ76nstfps3y2f8Y8H9y6EexqfU06/+9Cmyzxcy
 oCHw==
X-Gm-Message-State: ANoB5pnpnFer0KQx0yMUkGeNXtyVHoKRVNLcA1zXQ4sNrnY5hvBwSWd1
 4mTG3wZFTTweGBtZvpEfqaFv4w==
X-Google-Smtp-Source: AA0mqf56bQ5bcAU9DpRaYVI6LhQi+OPnus1CU1i+/U+bNmrPHwXHea1L8xBv0NlykX58eCx5KsKQUQ==
X-Received: by 2002:a54:480b:0:b0:35e:8ab3:f213 with SMTP id
 j11-20020a54480b000000b0035e8ab3f213mr2240965oij.37.1670855877823; 
 Mon, 12 Dec 2022 06:37:57 -0800 (PST)
Received: from ?IPV6:2806:102e:18:2efc:20f0:1d0e:8e1f:fff0?
 ([2806:102e:18:2efc:20f0:1d0e:8e1f:fff0])
 by smtp.gmail.com with ESMTPSA id
 e22-20020a544f16000000b0035aa617156bsm3574705oiy.17.2022.12.12.06.37.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Dec 2022 06:37:57 -0800 (PST)
Message-ID: <ba8c1f63-08cd-e073-3a6e-45f806658d67@linaro.org>
Date: Mon, 12 Dec 2022 08:37:54 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH-for-8.0 v2 08/11] hw/mips/malta: Use bootloader generator
 API for nanoMIPS CPUs (3/5)
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Dragan Mladjenovic <Dragan.Mladjenovic@syrmia.com>,
 Milica Lazarevic <milica.lazarevic@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Djordje Todorovic <djordje.todorovic@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Bernhard Beschow <shentey@gmail.com>
References: <20221211204533.85359-1-philmd@linaro.org>
 <20221211204533.85359-9-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221211204533.85359-9-philmd@linaro.org>
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
> Part 3/5: Convert PCI0 I/O BAR setup
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>


Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

> ---
>   hw/mips/malta.c | 40 ++++++++--------------------------------
>   1 file changed, 8 insertions(+), 32 deletions(-)
> 
> diff --git a/hw/mips/malta.c b/hw/mips/malta.c
> index 3e80a12221..16161b1b03 100644
> --- a/hw/mips/malta.c
> +++ b/hw/mips/malta.c
> @@ -685,9 +685,6 @@ static void write_bootloader_nanomips(uint8_t *base, uint64_t run_addr,
>   
>       /*
>        * Load BAR registers as done by YAMON:
> -     *
> -     *  - set up PCI0 I/O BARs from 0x18000000 to 0x181fffff
> -     *
>        */
>       stw_p(p++, 0xe040); stw_p(p++, 0x0681);
>                                   /* lui t1, %hi(0xb4000000)      */
> @@ -707,21 +704,6 @@ static void write_bootloader_nanomips(uint8_t *base, uint64_t run_addr,
>   
>       stw_p(p++, 0xe020); stw_p(p++, 0x0801);
>                                   /* lui t0, %hi(0xc0000000)      */
> -
> -    /* 0x48 corresponds to GT_PCI0IOLD                          */
> -    stw_p(p++, 0x8422); stw_p(p++, 0x9048);
> -                                /* sw t0, 0x48(t1)              */
> -
> -    stw_p(p++, 0xe020); stw_p(p++, 0x0800);
> -                                /* lui t0, %hi(0x40000000)      */
> -
> -    /* 0x50 corresponds to GT_PCI0IOHD                          */
> -    stw_p(p++, 0x8422); stw_p(p++, 0x9050);
> -                                /* sw t0, 0x50(t1)              */
> -
> -    stw_p(p++, 0xe020); stw_p(p++, 0x0001);
> -                                /* lui t0, %hi(0x80000000)      */
> -
>   #else
>   #define cpu_to_gt32 cpu_to_be32
>   
> @@ -738,23 +720,17 @@ static void write_bootloader_nanomips(uint8_t *base, uint64_t run_addr,
>   
>       stw_p(p++, 0x0020); stw_p(p++, 0x00c0);
>                                   /* addiu[32] t0, $0, 0xc0       */
> -
> -    /* 0x48 corresponds to GT_PCI0IOLD                          */
> -    stw_p(p++, 0x8422); stw_p(p++, 0x9048);
> -                                /* sw t0, 0x48(t1)              */
> -
> -    stw_p(p++, 0x0020); stw_p(p++, 0x0040);
> -                                /* addiu[32] t0, $0, 0x40       */
> -
> -    /* 0x50 corresponds to GT_PCI0IOHD                          */
> -    stw_p(p++, 0x8422); stw_p(p++, 0x9050);
> -                                /* sw t0, 0x50(t1)              */
> -
> -    stw_p(p++, 0x0020); stw_p(p++, 0x0080);
> -                                /* addiu[32] t0, $0, 0x80       */
>   #endif
>       v = p;
>   
> +    /* setup PCI0 io window to 0x18000000-0x181fffff */
> +    bl_gen_write_u32(&v, /* GT_PCI0IOLD */
> +                     cpu_mips_phys_to_kseg1(NULL, 0x1be00000 + 0x48),
> +                     cpu_to_gt32(0x18000000 << 3));
> +    bl_gen_write_u32(&v, /* GT_PCI0IOHD */
> +                     cpu_mips_phys_to_kseg1(NULL, 0x1be00000 + 0x50),
> +                     cpu_to_gt32(0x08000000 << 3));
> +
>       /* setup PCI0 mem windows */
>       bl_gen_write_u32(&v, /* GT_PCI0M0LD */
>                        cpu_mips_phys_to_kseg1(NULL, 0x1be00000 + 0x58),


