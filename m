Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F1864A24E
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 14:53:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4jEC-0004sC-NT; Mon, 12 Dec 2022 08:52:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p4jE8-0004rC-6E
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 08:52:16 -0500
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p4jE6-0002p8-HX
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 08:52:15 -0500
Received: by mail-oi1-x22d.google.com with SMTP id e205so11223318oif.11
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 05:52:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TvegxXMKGaD0oyF8QNd9y9/O3p0NO8Lu0Cx0+r4lyGg=;
 b=Ztcc2BqbeR9d1MP59zwsFTELoN9cDoXb+pSOhire1moPqwjWtH9baxbA+opaut/Fmy
 51djaq8R4+gj1lIjZmWQkS0rVNdzR0Ek9I+R4+YdLJLTcG5AtPX7p4QT1Kl9rI7m9Cl7
 5NNCa112iPcMFhmv+Xt5k6Uawzg+4BPi6UxnETJkpfzEPHrPCOWKpxAA0tvDlCITJ/0Y
 OcK3rhxa9fHojCcikdtv8y0qTtRhPCK5rwbM8S6OF3gVsbNuGtgGsZjG4XqW8ADxk7ue
 gW9zvih4hb74xMNDi9vCHmxxqCn4ES/1KMPqkb1EYTDVxRbV78+U/erU5fpJm24QhY19
 j4Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TvegxXMKGaD0oyF8QNd9y9/O3p0NO8Lu0Cx0+r4lyGg=;
 b=EN9wjJ8pA+LeCDv7FTxZEa87Ixp0pNGLIDnQ9IW+yQNQkgvVSJsPJG93xlyE7MnM3A
 yMq0hlAsdzxcLjvz1kjofz3dTGQ2eVNJloyv/xm6scrAhnRoFZzgDikBoXeAKhwtDl/e
 DYLN1zyrqTkppLTDz4mN5nwP54V8qNiv60XMZOIphZGwGi217KD5gE+9Mhvis2pShnuq
 fhox4YP92Dwc8EtPVk1CUx6XjasLiTSs7zMz2JF7i8wYuimSk2I90WsK8RZC593Xipbv
 tFFCgLBTTDCmpd6K6GgXOs7WrVP4HbW4RsN2kFOfNUThJs8sNfU9B6Voqutr/rL1jhee
 p6ow==
X-Gm-Message-State: ANoB5pnTmRkXPBjrX9MvBVE4v4S8NiJGNbI0jX7pWgYpscWi5B0RkemY
 MIFRCTjdmrHV1Xup7EYYWgta4A==
X-Google-Smtp-Source: AA0mqf7ncC7Q1eRYrY/dAQEow2DUIrOor1BjOtNoYFp+TLk1qiFhyTGxJJmLk55MxOfI1iJgli++Rw==
X-Received: by 2002:aca:dac2:0:b0:35b:d7dc:9f25 with SMTP id
 r185-20020acadac2000000b0035bd7dc9f25mr6800075oig.32.1670853133290; 
 Mon, 12 Dec 2022 05:52:13 -0800 (PST)
Received: from ?IPV6:2806:102e:18:2efc:20f0:1d0e:8e1f:fff0?
 ([2806:102e:18:2efc:20f0:1d0e:8e1f:fff0])
 by smtp.gmail.com with ESMTPSA id
 e22-20020a544f16000000b0035aa617156bsm3531229oiy.17.2022.12.12.05.52.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Dec 2022 05:52:12 -0800 (PST)
Message-ID: <55b17519-fae4-814f-91e1-954dcc8debbb@linaro.org>
Date: Mon, 12 Dec 2022 07:52:10 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH-for-8.0 v2 04/11] hw/mips/bootloader: Implement nanoMIPS
 LI (LUI+ORI) opcode generator
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Dragan Mladjenovic <Dragan.Mladjenovic@syrmia.com>,
 Milica Lazarevic <milica.lazarevic@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Djordje Todorovic <djordje.todorovic@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Bernhard Beschow <shentey@gmail.com>
References: <20221211204533.85359-1-philmd@linaro.org>
 <20221211204533.85359-5-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221211204533.85359-5-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22d;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22d.google.com
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
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/mips/bootloader.c | 36 ++++++++++++++++++++++++++++++++++--
>   1 file changed, 34 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

> 
> diff --git a/hw/mips/bootloader.c b/hw/mips/bootloader.c
> index 3e1e73360f..9fc926d83f 100644
> --- a/hw/mips/bootloader.c
> +++ b/hw/mips/bootloader.c
> @@ -132,12 +132,39 @@ static void bl_gen_jalr(void **p, bl_reg rs)
>       bl_gen_r_type(p, 0, rs, 0, BL_REG_RA, 0, 0x09);
>   }
>   
> +static void bl_gen_lui_nm(void **ptr, bl_reg rt, uint32_t imm20)
> +{
> +    uint32_t insn = 0;
> +
> +    assert(extract32(imm20, 0, 20) == imm20);
> +    insn = deposit32(insn, 26, 6, 0b111000);
> +    insn = deposit32(insn, 21, 5, rt);
> +    insn = deposit32(insn, 12, 9, extract32(imm20, 0, 9));
> +    insn = deposit32(insn, 2, 10, extract32(imm20, 9, 10));
> +    insn = deposit32(insn, 0, 1, sextract32(imm20, 19, 1));
> +
> +    st_nm32_p(ptr, insn);
> +}
> +
>   static void bl_gen_lui(void **p, bl_reg rt, uint16_t imm)
>   {
>       /* R6: It's a alias of AUI with RS = 0 */
>       bl_gen_i_type(p, 0x0f, 0, rt, imm);
>   }
>   
> +static void bl_gen_ori_nm(void **ptr, bl_reg rt, bl_reg rs, uint16_t imm12)
> +{
> +    uint32_t insn = 0;
> +
> +    assert(extract32(imm12, 0, 12) == imm12);
> +    insn = deposit32(insn, 26, 6, 0b100000);
> +    insn = deposit32(insn, 21, 5, rt);
> +    insn = deposit32(insn, 16, 5, rs);
> +    insn = deposit32(insn, 0, 12, imm12);
> +
> +    st_nm32_p(ptr, insn);
> +}
> +
>   static void bl_gen_ori(void **p, bl_reg rt, bl_reg rs, uint16_t imm)
>   {
>       bl_gen_i_type(p, 0x0d, rs, rt, imm);
> @@ -178,8 +205,13 @@ static void bl_gen_sd(void **p, bl_reg rt, uint8_t base, uint16_t offset)
>   /* Pseudo instructions */
>   static void bl_gen_li(void **p, bl_reg rt, uint32_t imm)
>   {
> -    bl_gen_lui(p, rt, extract32(imm, 16, 16));
> -    bl_gen_ori(p, rt, rt, extract32(imm, 0, 16));
> +    if (bootcpu_supports_isa(ISA_NANOMIPS32)) {
> +        bl_gen_lui_nm(p, rt, extract32(imm, 12, 20));
> +        bl_gen_ori_nm(p, rt, rt, extract32(imm, 0, 12));
> +    } else {
> +        bl_gen_lui(p, rt, extract32(imm, 16, 16));
> +        bl_gen_ori(p, rt, rt, extract32(imm, 0, 16));
> +    }
>   }
>   
>   static void bl_gen_dli(void **p, bl_reg rt, uint64_t imm)


