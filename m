Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9A839E8E0
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 23:09:03 +0200 (CEST)
Received: from localhost ([::1]:57578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqMUY-0001rq-62
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 17:09:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqMTc-0001Ai-Ol
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 17:08:04 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:42825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqMTb-0001eH-8L
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 17:08:04 -0400
Received: by mail-ed1-x532.google.com with SMTP id i13so22067239edb.9
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 14:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=aRqVz975gmzNM01dmzFhkg7HEIP/5zpNpGydZvFqYyk=;
 b=vMTqAyAZiRM88RKKKPuo6MpViyhAD1VCWaMl42E52QpjkovRga3j7jLNw18mna7Dze
 Cj3/yn8C6dB0D5nFPq5Zf/U8mmMVcpj+ROpkwoTIa2DLm+B1PwTSehjWP7QsOisA7PNV
 p22wQP9mNyOKdALh0x4fyKMRUHivJiN/N+F4OhPTkJXAkq5AA6TInjscaGM+Cqp6QKG0
 5RYuK5ENrz6kIYKgnNNTRDwpojGa1185lMUr31FmJenM4X/claCyCufX2I2Ah4bSOD87
 4vrnQyX7Ee4Xe0KlaHRXoydpFAliYn2Yialf+Y8ycYYnviufZg5+DI2HkQfVEj0OyKxg
 BRuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=aRqVz975gmzNM01dmzFhkg7HEIP/5zpNpGydZvFqYyk=;
 b=qCuwfi+Ha8vaw6q7GzH9UxDRY8vqfeyWSiET4L/v3+JtZPmTGwrkIkyC1nVtDqiavI
 ppbrlkk7G+gJ58KkCLlvzqHS2kEWrzhQaUB5Aso7v/OyaXk22kKoxgDxBD8q8zTo9mlM
 u6/w4OTajGp52uinpYtrO6HLQkzCMGnLXtJcaqxut8w2se3JSQ0A9z3rf1fZWldA5VSp
 jN2ie3BZsOjucvwppZI43sRTLIor7qpsVNLcwD9SHp6vRqtlkQNy7cjHK5MdZrXxvpa9
 RFl8KFLKCIFtfH4I0qwzyr6s9AYvJRDDf5N8Cc2vVHoPVkBPENihYavVsXqsqKGWeih+
 e8Ag==
X-Gm-Message-State: AOAM533ZNSx6kOt3SYuSJralRBuYbjBTmk6ZFkA9utgm5CLiLIfI++CL
 0JlItb5W6cWuqN2MMW3HllsoUscNhXTmYSIymrByhg==
X-Google-Smtp-Source: ABdhPJzSMerdYX7nf3a+nxh78TV+8NLn5+c1DBh4fXz3468RmDxQX0GYRkdzySGCq7o1EGHIVIRboWO71KJIpQil1AY=
X-Received: by 2002:a05:6402:416:: with SMTP id
 q22mr21972172edv.204.1623100081685; 
 Mon, 07 Jun 2021 14:08:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210603214131.629841-1-richard.henderson@linaro.org>
 <20210603214131.629841-26-richard.henderson@linaro.org>
In-Reply-To: <20210603214131.629841-26-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 7 Jun 2021 22:07:28 +0100
Message-ID: <CAFEAcA9Ufm3hkfawYQz45N2ekRxRJhMOzN3+fD-5gtRshQQj5w@mail.gmail.com>
Subject: Re: [PULL 25/29] softfloat: Convert float32_exp2 to FloatParts
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 3 Jun 2021 at 22:58, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Keep the intermediate results in FloatParts instead of
> converting back and forth between float64.  Use muladd
> instead of separate mul+add.
>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  fpu/softfloat.c | 53 +++++++++++++++++++++----------------------------
>  1 file changed, 23 insertions(+), 30 deletions(-)
>
> diff --git a/fpu/softfloat.c b/fpu/softfloat.c
> index c32b1c7113..27306d6a93 100644
> --- a/fpu/softfloat.c
> +++ b/fpu/softfloat.c
> @@ -5210,47 +5210,40 @@ static const float64 float32_exp2_coefficients[15=
] =3D
>
>  float32 float32_exp2(float32 a, float_status *status)
>  {
> -    bool aSign;
> -    int aExp;
> -    uint32_t aSig;
> -    float64 r, x, xn;
> +    FloatParts64 xp, xnp, tp, rp;

Coverity points out that we declare tp here without initializing it...

>      int i;
> -    a =3D float32_squash_input_denormal(a, status);
>
> -    aSig =3D extractFloat32Frac( a );
> -    aExp =3D extractFloat32Exp( a );
> -    aSign =3D extractFloat32Sign( a );
> -
> -    if ( aExp =3D=3D 0xFF) {
> -        if (aSig) {
> -            return propagateFloat32NaN(a, float32_zero, status);
> +    float32_unpack_canonical(&xp, a, status);
> +    if (unlikely(xp.cls !=3D float_class_normal)) {
> +        switch (xp.cls) {
> +        case float_class_snan:
> +        case float_class_qnan:
> +            parts_return_nan(&xp, status);
> +            return float32_round_pack_canonical(&xp, status);
> +        case float_class_inf:
> +            return xp.sign ? float32_zero : a;
> +        case float_class_zero:
> +            return float32_one;
> +        default:
> +            break;
>          }
> -        return (aSign) ? float32_zero : a;
> -    }
> -    if (aExp =3D=3D 0) {
> -        if (aSig =3D=3D 0) return float32_one;
> +        g_assert_not_reached();
>      }
>
>      float_raise(float_flag_inexact, status);
>
> -    /* ******************************* */
> -    /* using float64 for approximation */
> -    /* ******************************* */
> -    x =3D float32_to_float64(a, status);
> -    x =3D float64_mul(x, float64_ln2, status);
> +    float64_unpack_canonical(&xnp, float64_ln2, status);
> +    xp =3D *parts_mul(&xp, &tp, status);

...and then here we pass &tp to parts_mul() which looks at
its various fields. Missing initializer of some sort ?

(CID 1457457)

thanks
-- PMM

