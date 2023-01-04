Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F97565DBD8
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 19:06:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pD88O-0005tM-SS; Wed, 04 Jan 2023 13:05:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pD88J-0005re-Kw
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 13:04:59 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pD88F-0007lL-Qf
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 13:04:59 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 z9-20020a17090a468900b00226b6e7aeeaso2316159pjf.1
 for <qemu-devel@nongnu.org>; Wed, 04 Jan 2023 10:04:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AThbpssYHlCmnGTBjDIJImTaIg1A/fqvD3+4hldarYU=;
 b=pSNBmVVf5B/sGMy2Bpu86K6bHzGeQV1UspQd2yhxoUNyZr4HOtsfgVxyoDvMKdY0Ir
 cgK7Q016tivxLD6dKPanXscpCVx+SbnT4DzCu7+F244lO93mUzOF8tOHNprxC+d06+LB
 cO0c//goiu3RenjmJuHOHwl5t3lTTC3jEQ2/dCyrMxGBG/7sdHwX3KR9/0j5614Op917
 tgOtvGWb7OD1Yq3ldnCxjvMVLIAzvMLczIsS+ZVlX9xLvs1iRXhwLIshP5ZrOvQ1n1qV
 +iaCsOxwCJ42m/rVK/91NWctdFyctTTYluRZKoJw75/J3CKWQSSCMYAsfoykPVqCfquW
 iaxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AThbpssYHlCmnGTBjDIJImTaIg1A/fqvD3+4hldarYU=;
 b=LdSTJwyaQRpRs/wSTsui6Xx7rZzhvi6kaMoBOBLLqR4vIO7jSlUbWcqY9z4thwpzl6
 3z8+Nw6XlY7GB7X6iP1VgFdTFBs5squ+VHci4ykj5sIxjQVC86eeuBiPMp6+r4xw3P+E
 TYRMj2eDLVOzigpNrPFWjN+Nr9fY8rdXAr6XItjEuHfmjEhwvqBF/5+LGwcHTUbxE6Di
 EQJdE3dOGbjE4EHCdTdpwXNxFoap1KzoKJhpTMdTjhowebAcH8cx32ymkNxqKXoY90uW
 kl1hJHuQK+8DOY33RObT6qhU1FRjhV4crdwiy2NQjl5NUmv9NmUnLI54wVLI77AlGr7x
 tH0Q==
X-Gm-Message-State: AFqh2kpE3oYLz0RqA9aw18QkGfajK6NuSq/AzGkshlWpvgRZF7+4eDPG
 0CylDJ/pi9jgegg7pfD3bVwJPg==
X-Google-Smtp-Source: AMrXdXvTQG5WJLGLIh5bvX+OMbK9OG9Ocm7S4Y5FnXgSQPcojfMfZG/Pln6sN1BbUXwgAZzBd1zhWA==
X-Received: by 2002:a17:902:dad0:b0:189:5f5c:da1e with SMTP id
 q16-20020a170902dad000b001895f5cda1emr77817618plx.27.1672855489572; 
 Wed, 04 Jan 2023 10:04:49 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:92be:ce91:1417:6686?
 ([2602:47:d48c:8101:92be:ce91:1417:6686])
 by smtp.gmail.com with ESMTPSA id
 n16-20020a170902d2d000b00176b84eb29asm24454757plc.301.2023.01.04.10.04.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jan 2023 10:04:49 -0800 (PST)
Message-ID: <51da8243-885d-a98e-deb6-746383da1d7d@linaro.org>
Date: Wed, 4 Jan 2023 10:04:47 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 4/4] target/m68k: fix FPSR quotient byte for frem
 instruction
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, laurent@vivier.eu,
 qemu-devel@nongnu.org
References: <20230104134554.138012-1-mark.cave-ayland@ilande.co.uk>
 <20230104134554.138012-5-mark.cave-ayland@ilande.co.uk>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230104134554.138012-5-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.708,
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

On 1/4/23 05:45, Mark Cave-Ayland wrote:
> The FPSR quotient byte should be set to the value of the quotient and not the
> result. Manually calculate the quotient in the frem helper in round to nearest
> even mode (note this is different from the quotient calculated internally for
> fmod), and use it to set the quotient byte accordingly.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Fixes: https://gitlab.com/qemu-project/qemu/-/issues/1314
> Reviewed-by: Laurent Vivier <laurent@vivier.eu>
> ---
>   target/m68k/fpu_helper.c | 14 +++++++++++---
>   1 file changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/target/m68k/fpu_helper.c b/target/m68k/fpu_helper.c
> index 5fd094a33c..56f7400140 100644
> --- a/target/m68k/fpu_helper.c
> +++ b/target/m68k/fpu_helper.c
> @@ -538,17 +538,25 @@ void HELPER(fmod)(CPUM68KState *env, FPReg *res, FPReg *val0, FPReg *val1)
>   
>   void HELPER(frem)(CPUM68KState *env, FPReg *res, FPReg *val0, FPReg *val1)
>   {
> +    float_status fp_status;
> +    FPReg fp_quot;
>       uint32_t quotient;
>       int sign;
>   
> +    /* Calculate quotient directly using round to nearest mode */
> +    set_float_rounding_mode(float_round_nearest_even, &fp_status);
> +    set_floatx80_rounding_precision(
> +        get_floatx80_rounding_precision(&env->fp_status), &fp_status);
> +    fp_quot.d = floatx80_div(val1->d, val0->d, &fp_status);
> +
>       res->d = floatx80_rem(val1->d, val0->d, &env->fp_status);
>   
> -    if (floatx80_is_any_nan(res->d)) {
> +    if (floatx80_is_any_nan(fp_quot.d)) {

I think you should leave this line unchanged, and move the div afterward.
I also think you should completely initialize the local fp_status = { }.

With that,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

