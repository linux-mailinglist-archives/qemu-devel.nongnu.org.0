Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B7A3438616
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Oct 2021 03:05:13 +0200 (CEST)
Received: from localhost ([::1]:36408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1meRwm-0003Vz-31
	for lists+qemu-devel@lfdr.de; Sat, 23 Oct 2021 21:05:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1meRuF-00028P-Sp
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 21:02:35 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:40726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1meRuE-0001lI-0f
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 21:02:35 -0400
Received: by mail-pl1-x62b.google.com with SMTP id v20so5395819plo.7
 for <qemu-devel@nongnu.org>; Sat, 23 Oct 2021 18:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2xkUT+s8A27BqLb5fmw99h+6Ac/1H6gC0donM3S0jIE=;
 b=rWcGI5EXK0ihi24zsq8mNlHyvP4F1OGIMR+rDzKzLMby6fk+JomkMpifduL9kN+12y
 VZqt46JYb1itnJ86JlTHC0YMhpPJmrkcb+rhyfyASiQ1SUyqfMkWAScsooFinN/wMAra
 fiJE7HB9DggIdLSAggH/hdyJ7mNaTloDzJXsKK5b7F7TKX4Ku8ndFn6dmo3/6JnWrgyK
 +MSGhxlviyrHID3TMo/FE8BCb9V4d6fsOpVuBSn2Rj/hXnJQQlUz1DCT2hkFBK1iQptO
 74wcG5+S6loSdN1dWtjUR56NHec/+UoEhEXgy+tGRGAN2mw2jV/jtz4Y9sVfwHW/1Tzv
 EwYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2xkUT+s8A27BqLb5fmw99h+6Ac/1H6gC0donM3S0jIE=;
 b=JFODvhLLFWv4PMvE8Vb20VuyJN9uJxxsJMBDeG8V5HtxJuntSqDuT5cI4soDN+stnk
 xTVzoMyUrQXhW0e6xdcGurZg1dHL/e1fNgxQoCPWxjLw/DN0S+mUVLGGAnpr/nDDPoRW
 yvZ6LYBHIwj6+YMR0Bke32HKkOMx2jOgCmnaUVCMDaSZUd16xQ6raE1XcQAxSdZHtC/6
 JdejWLziXDESKpTdXmSX0kLjlicNWskzLyNLZ5elWL5BdZAoDtuz6V3oWbh01IwfHLZF
 N6i+JreiAOb1llpbt9aPdd5hqVvbutvtS6lphJ2SChPOgLDVA4/yBYc4VsSVzUOAgSww
 zDag==
X-Gm-Message-State: AOAM530n09plws8JQFD2HTHvG0gtGOAaAHqHXCR1pmM65BoOj4Uk+VOf
 QR+7bWFMpYPto+ekbrkKDXxspQ==
X-Google-Smtp-Source: ABdhPJxY11GFxv/F+DVxAjZWTEW1amLe1OaMNFrsHrE+R8ADuIGHlI0fAeUsmUvyKL0CXMuvjLBsRw==
X-Received: by 2002:a17:902:c443:b0:13f:5507:bdc7 with SMTP id
 m3-20020a170902c44300b0013f5507bdc7mr8657373plm.50.1635037352324; 
 Sat, 23 Oct 2021 18:02:32 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id l11sm16798982pjg.22.2021.10.23.18.02.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Oct 2021 18:02:31 -0700 (PDT)
Subject: Re: [PATCH 05/33] target/mips: Have check_msa_access() return a
 boolean
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211023214803.522078-1-f4bug@amsat.org>
 <20211023214803.522078-6-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <74244c26-78e6-da58-6a84-b0538567d8e8@linaro.org>
Date: Sat, 23 Oct 2021 18:02:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211023214803.522078-6-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.781,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Luis Pires <luis.pires@eldorado.org.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/23/21 2:47 PM, Philippe Mathieu-Daudé wrote:
> Have check_msa_access() return a boolean value so we can
> return early if MSA is not enabled.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   target/mips/tcg/msa_translate.c | 20 +++++++++++++-------
>   1 file changed, 13 insertions(+), 7 deletions(-)
> 
> diff --git a/target/mips/tcg/msa_translate.c b/target/mips/tcg/msa_translate.c
> index 3ef912da6b8..9e0a08fe335 100644
> --- a/target/mips/tcg/msa_translate.c
> +++ b/target/mips/tcg/msa_translate.c
> @@ -293,19 +293,19 @@ void msa_translate_init(void)
>       }
>   }
>   
> -static inline int check_msa_access(DisasContext *ctx)
> +static inline bool check_msa_access(DisasContext *ctx)
>   {
>       if (unlikely((ctx->hflags & MIPS_HFLAG_FPU) &&
>                    !(ctx->hflags & MIPS_HFLAG_F64))) {
>           gen_reserved_instruction(ctx);
> -        return 0;
> +        return false;
>       }
>   
>       if (unlikely(!(ctx->hflags & MIPS_HFLAG_MSA))) {
>           generate_exception_end(ctx, EXCP_MSADIS);
> -        return 0;
> +        return false;
>       }

When we return false, we have raised an exception.

> @@ -354,7 +354,9 @@ static bool gen_msa_BxZ_V(DisasContext *ctx, int wt, int s16, TCGCond cond)
>   {
>       TCGv_i64 t0;
>   
> -    check_msa_access(ctx);
> +    if (!check_msa_access(ctx)) {
> +        return false;
> +    }

... which means that here we should return true, meaning that we have recognized the 
instruction and emitted some code for it.  In this case: we have recognized that the 
instruction is valid but not enabled.

Otherwise, we will return to decode_opc and (eventually) emit another 
gen_reserved_instruction.


r~

