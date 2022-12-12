Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0FB64A396
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 15:41:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4jyc-00063v-EZ; Mon, 12 Dec 2022 09:40:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p4jyT-00062d-EE
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 09:40:10 -0500
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p4jyQ-00040O-QQ
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 09:40:09 -0500
Received: by mail-oi1-x229.google.com with SMTP id r11so11355564oie.13
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 06:40:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=quS64DInaPKN2UOVECH1ChB1ou/c1CJk5pgwdFpGbBk=;
 b=jSqwYGDsLjAOS4qucneW4csZLbgNDjPSPUHgjMS05ROserVoXMebc/i7hrtPBy9/XE
 XgzfACiQJoGYe+Y4A8oQHWwKWSfmPa7s/hKwq8WH0w2tbkIxHy1CcOU1kzTfsbBSY6s1
 adHA04vtX/hEAWCCBHdFN4FjGxBHQatyZbzcPWWCptz0H1zPjiGnL/E7Mv0XutyNSE1g
 zE3yuT2XwBPM2cJQY+LaC0hBU3f/3YovnZHV4JYu3bFhWWcur89VQzljkutDpfU2524k
 xJpXMISnJOWecZKzkZehv/6P1LRs9rNrRhJIACs6WePJSHeJ6Xj6xbTkj9SZLVZVl13z
 PM/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=quS64DInaPKN2UOVECH1ChB1ou/c1CJk5pgwdFpGbBk=;
 b=mPw2dOzvHOBYrlxc92eQtLdFWepeiX8CXSJ4ruwH17zI5BtR2dvqEeP8rbTIL1LxXg
 ZcsEEGAO2derL9IrrX9PgPfEK5QKTMBIKY+WD+jSd5xOS4ZsAsnfV/PuziHQM1EUkrvl
 9qUG7H02g2TXBKCAlTbKaG/MO2bEaV2PnW8cqNr9WurtEzX2eWPjYV6bt3u9AS/ynj9h
 uEtFkX5H/wxrBMqXhfuUxyaxT2TR8xep2/VAkMPvcLVznj69tcJg2DH1nXx71/ZSg37Y
 USZUWX4yBu+8VTDtQcskhuWnKLMHYXkAQPoS4nzRFqAqLAWTqlzTgTfWRKjLmBQYun0o
 ifxA==
X-Gm-Message-State: ANoB5pns86337+mScESUFRRHvUvs+jlztz7N4TYQXXzsRzI8zkagD80f
 /2WtCgQOHgnndUEu2/97PGn59Q==
X-Google-Smtp-Source: AA0mqf55+xAaz1NbRHKnIqXHMmkuKDqId1+j0JIDkNQFL674wZK0Wq3Tj6lv14LSEOy14AFOV25UwA==
X-Received: by 2002:aca:1911:0:b0:35e:2553:f006 with SMTP id
 l17-20020aca1911000000b0035e2553f006mr6460362oii.9.1670856005450; 
 Mon, 12 Dec 2022 06:40:05 -0800 (PST)
Received: from ?IPV6:2806:102e:18:2efc:20f0:1d0e:8e1f:fff0?
 ([2806:102e:18:2efc:20f0:1d0e:8e1f:fff0])
 by smtp.gmail.com with ESMTPSA id
 d14-20020a056830044e00b006706e4f6863sm4078433otc.75.2022.12.12.06.40.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Dec 2022 06:40:04 -0800 (PST)
Message-ID: <af9a145d-2eb6-9493-7a02-af6636dd5b5e@linaro.org>
Date: Mon, 12 Dec 2022 08:40:02 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH-for-8.0 v2 09/11] hw/mips/malta: Use bootloader generator
 API for nanoMIPS CPUs (4/5)
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Dragan Mladjenovic <Dragan.Mladjenovic@syrmia.com>,
 Milica Lazarevic <milica.lazarevic@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Djordje Todorovic <djordje.todorovic@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Bernhard Beschow <shentey@gmail.com>
References: <20221211204533.85359-1-philmd@linaro.org>
 <20221211204533.85359-10-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221211204533.85359-10-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::229;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x229.google.com
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
> Part 4/5: Convert GT64120 ISD base address setup
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

> ---
>   hw/mips/malta.c | 40 +++++++---------------------------------
>   1 file changed, 7 insertions(+), 33 deletions(-)
> 
> diff --git a/hw/mips/malta.c b/hw/mips/malta.c
> index 16161b1b03..451908b217 100644
> --- a/hw/mips/malta.c
> +++ b/hw/mips/malta.c
> @@ -683,46 +683,20 @@ static void write_bootloader_nanomips(uint8_t *base, uint64_t run_addr,
>       stw_p(p++, 0x80e7); stw_p(p++, NM_LO(loaderparams.ram_low_size));
>                                   /* ori a3,a3,%lo(loaderparams.ram_low_size) */
>   
> -    /*
> -     * Load BAR registers as done by YAMON:
> -     */
> -    stw_p(p++, 0xe040); stw_p(p++, 0x0681);
> -                                /* lui t1, %hi(0xb4000000)      */
> -
>   #if TARGET_BIG_ENDIAN
>   #define cpu_to_gt32 cpu_to_le32
> -
> -    stw_p(p++, 0xe020); stw_p(p++, 0x0be1);
> -                                /* lui t0, %hi(0xdf000000)      */
> -
> -    /* 0x68 corresponds to GT_ISD (from hw/mips/gt64xxx_pci.c)  */
> -    stw_p(p++, 0x8422); stw_p(p++, 0x9068);
> -                                /* sw t0, 0x68(t1)              */
> -
> -    stw_p(p++, 0xe040); stw_p(p++, 0x077d);
> -                                /* lui t1, %hi(0xbbe00000)      */
> -
> -    stw_p(p++, 0xe020); stw_p(p++, 0x0801);
> -                                /* lui t0, %hi(0xc0000000)      */
>   #else
>   #define cpu_to_gt32 cpu_to_be32
> -
> -    stw_p(p++, 0x0020); stw_p(p++, 0x00df);
> -                                /* addiu[32] t0, $0, 0xdf       */
> -
> -    /* 0x68 corresponds to GT_ISD                               */
> -    stw_p(p++, 0x8422); stw_p(p++, 0x9068);
> -                                /* sw t0, 0x68(t1)              */
> -
> -    /* Use kseg2 remapped address 0x1be00000                    */
> -    stw_p(p++, 0xe040); stw_p(p++, 0x077d);
> -                                /* lui t1, %hi(0xbbe00000)      */
> -
> -    stw_p(p++, 0x0020); stw_p(p++, 0x00c0);
> -                                /* addiu[32] t0, $0, 0xc0       */
>   #endif
>       v = p;
>   
> +    /* setup MEM-to-PCI0 mapping as done by YAMON */
> +
> +    /* move GT64120 registers from 0x14000000 to 0x1be00000 */
> +    bl_gen_write_u32(&v, /* GT_ISD */
> +                     cpu_mips_phys_to_kseg1(NULL, 0x14000000 + 0x68),
> +                     cpu_to_gt32(0x1be00000 << 3));
> +
>       /* setup PCI0 io window to 0x18000000-0x181fffff */
>       bl_gen_write_u32(&v, /* GT_PCI0IOLD */
>                        cpu_mips_phys_to_kseg1(NULL, 0x1be00000 + 0x48),


