Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C1653ADB6A
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 20:43:42 +0200 (CEST)
Received: from localhost ([::1]:57500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lufwT-0007TC-MI
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 14:43:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lufuR-0005R8-AY
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 14:41:35 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:43618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lufuN-0001UM-6R
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 14:41:34 -0400
Received: by mail-pf1-x431.google.com with SMTP id a127so10358295pfa.10
 for <qemu-devel@nongnu.org>; Sat, 19 Jun 2021 11:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YM28EbppjDJ+8GhIZK+sdZpRaNHEeMvWejcvj3FIxhQ=;
 b=UtPUPIyI1ACh87UoC3sPdIOsoRZuykUIponPpvAfbX/7AaAlRw0ZoEr+gG22zrWQEL
 2WRqPZOosQceIocw+mny7Z3mprUe5MWSLCNDXTFQ3h16sOmtJZOTYba5jvw/UG70ggYa
 ZHnqz1S33DlYq3Yp4JKFBQ1NiJvc+KrPBdTwzn1F7wrti4GvqYGnoHRIvkBU9C3F1i3L
 RM6IQSnlkPOkl3oyJz3LNLcEX8dstP+sD6R3jxPj0bijj1szNPIvYu1NF6fBw7K0MVEU
 CuF1LuKRianCVGpI2YODhJx+Gg2MMS9uKNjBWOTAl8bXi3j8KSXbEUsswZV5jwmnnWRP
 7gHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YM28EbppjDJ+8GhIZK+sdZpRaNHEeMvWejcvj3FIxhQ=;
 b=J0eWaAuDX7YfMmqmiRDXjDi/7YaUcCIj1LW+5ANQrE5NeraBTitvFv2x9yg0ufm4c4
 xAUYmRpAOXCPYBmPAwgcyJU9/pH8HL5J8Kritf1sm4i9Z03G73lRHxUpW7bQws6EXoVl
 H/bnQ/8nmldRrt8Z5gnpT1lNPOb0HDEL8zn1ng28VznHe9qkcCAmMZbl/sFAtdhQgUoK
 gm0hH+Zrtb517wX5VPPJisqf3VW019CxcpfHtbqvqJaBEvfDu2E0PvgqkHVOnbVB7Kd4
 b+6h2oUmwOUzL3EvUAd63EVbPWuQqXaHuJVg9N15Vy2lnYR4ZbNweKtyUO6eliU6BgK/
 v1vw==
X-Gm-Message-State: AOAM533Kp00AlV038jcTm7ypQUdmpJecJdcOJAFND2l9zQ3kg4P5czRf
 OmMTNILGfCqB5+eprObtG8n3SA==
X-Google-Smtp-Source: ABdhPJwCrXkFmnj7sTUwq+voolHTMwvRwh0bk4Ee/tKyGAt1Lhmkp/N+ZrRCJQNbUzA0+Vqj8GaEfA==
X-Received: by 2002:a63:1a5b:: with SMTP id a27mr16064737pgm.427.1624128089627; 
 Sat, 19 Jun 2021 11:41:29 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id z16sm11020063pff.203.2021.06.19.11.41.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 19 Jun 2021 11:41:29 -0700 (PDT)
Subject: Re: [PATCH 05/11] target/i386: Use float_flag_inorm_denormal
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
References: <20210527041405.391567-1-richard.henderson@linaro.org>
 <20210527041405.391567-6-richard.henderson@linaro.org>
Message-ID: <b22c5ccd-a730-e5cc-0d45-702610464d64@linaro.org>
Date: Sat, 19 Jun 2021 11:41:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210527041405.391567-6-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.202,
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
Cc: alex.bennee@linaro.org, mmorrell@tachyum.com,
 Eduardo Habkost <ehabkost@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ping.  Cc paolo, ed.

This is the last unreviewed patch in this series, and the one that sparked the work in the 
first place.

r~

On 5/26/21 9:13 PM, Richard Henderson wrote:
> The FSR and MXCSR DE flags have the semantics of the new flag.
> We get to remove a big fixme in update_mxcsr_from_sse_status
> vs float_flag_iflush_denormal.
> 
> Reported-by: Michael Morrell <mmorrell@tachyum.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/i386/tcg/fpu_helper.c | 18 ++++++------------
>   1 file changed, 6 insertions(+), 12 deletions(-)
> 
> diff --git a/target/i386/tcg/fpu_helper.c b/target/i386/tcg/fpu_helper.c
> index c9779a9fe0..edc550de55 100644
> --- a/target/i386/tcg/fpu_helper.c
> +++ b/target/i386/tcg/fpu_helper.c
> @@ -148,7 +148,7 @@ static void merge_exception_flags(CPUX86State *env, uint8_t old_flags)
>                          (new_flags & float_flag_overflow ? FPUS_OE : 0) |
>                          (new_flags & float_flag_underflow ? FPUS_UE : 0) |
>                          (new_flags & float_flag_inexact ? FPUS_PE : 0) |
> -                       (new_flags & float_flag_iflush_denormal ? FPUS_DE : 0)));
> +                       (new_flags & float_flag_inorm_denormal ? FPUS_DE : 0)));
>   }
>   
>   static inline floatx80 helper_fdiv(CPUX86State *env, floatx80 a, floatx80 b)
> @@ -1742,7 +1742,7 @@ void helper_fxtract(CPUX86State *env)
>               int shift = clz64(temp.l.lower);
>               temp.l.lower <<= shift;
>               expdif = 1 - EXPBIAS - shift;
> -            float_raise(float_flag_iflush_denormal, &env->fp_status);
> +            float_raise(float_flag_inorm_denormal, &env->fp_status);
>           } else {
>               expdif = EXPD(temp) - EXPBIAS;
>           }
> @@ -2976,7 +2976,8 @@ void update_mxcsr_status(CPUX86State *env)
>                                 (mxcsr & FPUS_ZE ? float_flag_divbyzero : 0) |
>                                 (mxcsr & FPUS_OE ? float_flag_overflow : 0) |
>                                 (mxcsr & FPUS_UE ? float_flag_underflow : 0) |
> -                              (mxcsr & FPUS_PE ? float_flag_inexact : 0),
> +                              (mxcsr & FPUS_PE ? float_flag_inexact : 0) |
> +                              (mxcsr & FPUS_DE ? float_flag_inorm_denormal : 0),
>                                 &env->sse_status);
>   
>       /* set denormals are zero */
> @@ -2989,20 +2990,13 @@ void update_mxcsr_status(CPUX86State *env)
>   void update_mxcsr_from_sse_status(CPUX86State *env)
>   {
>       uint8_t flags = get_float_exception_flags(&env->sse_status);
> -    /*
> -     * The MXCSR denormal flag has opposite semantics to
> -     * float_flag_iflush_denormal (the softfloat code sets that flag
> -     * only when flushing input denormals to zero, but SSE sets it
> -     * only when not flushing them to zero), so is not converted
> -     * here.
> -     */
>       env->mxcsr |= ((flags & float_flag_invalid ? FPUS_IE : 0) |
>                      (flags & float_flag_divbyzero ? FPUS_ZE : 0) |
>                      (flags & float_flag_overflow ? FPUS_OE : 0) |
>                      (flags & float_flag_underflow ? FPUS_UE : 0) |
>                      (flags & float_flag_inexact ? FPUS_PE : 0) |
> -                   (flags & float_flag_oflush_denormal ? FPUS_UE | FPUS_PE :
> -                    0));
> +                   (flags & float_flag_inorm_denormal ? FPUS_DE : 0) |
> +                   (flags & float_flag_oflush_denormal ? FPUS_UE | FPUS_PE : 0));
>   }
>   
>   void helper_update_mxcsr(CPUX86State *env)
> 


