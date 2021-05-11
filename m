Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F14A437A6F8
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 14:43:27 +0200 (CEST)
Received: from localhost ([::1]:60940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgRjT-0001fC-3P
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 08:43:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgRi4-0008Qj-SZ
 for qemu-devel@nongnu.org; Tue, 11 May 2021 08:42:00 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:43983)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgRi2-0005GV-3H
 for qemu-devel@nongnu.org; Tue, 11 May 2021 08:42:00 -0400
Received: by mail-ed1-x536.google.com with SMTP id s6so22648022edu.10
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 05:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jkVMGHM2OFM3PfvMFosGHx1y7xB7uCorpA1+ExyeYa0=;
 b=NGyFPW6OQbxzVTXbk9LfbxugqDCwo+olqEhtPgNAUCZQGc+IBQtGV1jQkHsRfi+tgs
 YWVwjO3NdZuWtW2NDxsByzTuxpg7imng2HJJLeo/brhH7h+/UL0kypUy/RzGMy2N5Eq2
 67GO+orU9JpwenS3aH/jx1CDQDq9rJKCEHgljVgyaampR4+Q/axwZ9tD41ZP2mu7DR0b
 eu04KWMZ8dV2g4b4KLh3bFF9/9iW8sDxgw23eut8XO/BCel5fOgKRHHSGi2JzqYVNUuw
 8kX267XOimMQ8sDWn1R0RE7MnWme7Ie6BVzSRZ7RB/rZIQZ9M0/AgB3tGjH3Ct/K53Gj
 4gNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jkVMGHM2OFM3PfvMFosGHx1y7xB7uCorpA1+ExyeYa0=;
 b=dRLU2tZ8X7cLoeqLqOf0XxOgDmw9W39XI2Y5+m7mvnkj+54dxRyfOwRtEoaCsj+BDp
 U6gQxjf9II9bDgV4taeIpQVm5IyS9TrzCLRvjs4ESJ23OcA+IspNdtPoDRywvYh2qPym
 csD60m+h9H421Wh+hAsGjN/dYHVRWsUgmNAl0L6iegWwpo47ktF+eYpQzIawSfWmKPuF
 dGoI9nbmhbdVAIzKvUpWeq8bbuwkgdWlnS9K4WwYm4AXM+NpQayP+nNGFpCwVrRrDjPo
 Ag0WWUIcwLGyinXtVCouNdn4vVnqQ2WZnPZFrGk5NamkZPTZJVgsTQN/86MESYMa6vlz
 furw==
X-Gm-Message-State: AOAM533z5lKg6mllzlVNIiJ9S7CvhP+ioQH4D2PtbRVb3DYi/0tvyl5A
 Z3FbwNCn63FU7Fxp/Ib40bCDPZrwfXQmUL1/liRiDA==
X-Google-Smtp-Source: ABdhPJwpEoK2oZx1Gw2nZjYcFPSqZna6VwKU2kNDO2/MI2f+13r5XJtEDP3zq3xpV2Kxp/OO7rWODzigdmvO0haEREk=
X-Received: by 2002:a05:6402:3548:: with SMTP id
 f8mr35584491edd.251.1620736916320; 
 Tue, 11 May 2021 05:41:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-16-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-16-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 May 2021 13:40:44 +0100
Message-ID: <CAFEAcA-K0Bk0t4r87a2w-8Mp_MtsFPpzw4AXPNju=h3mxZ6QOg@mail.gmail.com>
Subject: Re: [PATCH v6 15/82] target/arm: Implement SVE2 bitwise shift left
 long
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 30 Apr 2021 at 21:41, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper-sve.h    |   8 ++
>  target/arm/sve.decode      |   8 ++
>  target/arm/sve_helper.c    |  26 ++++++
>  target/arm/translate-sve.c | 159 +++++++++++++++++++++++++++++++++++++
>  4 files changed, 201 insertions(+)

> diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
> index f30f3722af..73aa670a77 100644
> --- a/target/arm/sve_helper.c
> +++ b/target/arm/sve_helper.c
> @@ -625,6 +625,8 @@ DO_ZPZZ(sve2_sqrshl_zpzz_h, int16_t, H1_2, do_sqrshl_h)
>  DO_ZPZZ(sve2_sqrshl_zpzz_s, int32_t, H1_4, do_sqrshl_s)
>  DO_ZPZZ_D(sve2_sqrshl_zpzz_d, int64_t, do_sqrshl_d)
>
> +#undef do_sqrshl_d
> +
>  #define do_uqrshl_b(n, m) \
>     ({ uint32_t discard; do_uqrshl_bhs(n, (int8_t)m, 8, true, &discard); })
>  #define do_uqrshl_h(n, m) \
> @@ -639,6 +641,8 @@ DO_ZPZZ(sve2_uqrshl_zpzz_h, uint16_t, H1_2, do_uqrshl_h)
>  DO_ZPZZ(sve2_uqrshl_zpzz_s, uint32_t, H1_4, do_uqrshl_s)
>  DO_ZPZZ_D(sve2_uqrshl_zpzz_d, uint64_t, do_uqrshl_d)
>
> +#undef do_uqrshl_d
> +
>  #define DO_HADD_BHS(n, m)  (((int64_t)n + m) >> 1)
>  #define DO_HADD_D(n, m)    ((n >> 1) + (m >> 1) + (n & m & 1))

These undefs look like they should be in some other patch.

> +static void gen_ushll_i64(unsigned vece, TCGv_i64 d, TCGv_i64 n, int imm)
> +{
> +    int halfbits = 4 << vece;
> +    int top = imm & 1;
> +    int shl = (imm >> 1);
> +    int shift;
> +    uint64_t mask;
> +
> +    mask = MAKE_64BIT_MASK(0, halfbits);
> +    mask <<= shl;
> +    mask = dup_const(vece, mask);
> +
> +    shift = shl - top * halfbits;
> +    if (shift < 0) {
> +        tcg_gen_shri_i64(d, n, -shift);
> +    } else {
> +        tcg_gen_shri_i64(d, n, shift);

Should these really both be right-shifts ?

> +    }
> +    tcg_gen_andi_i64(d, d, mask);
> +}

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

