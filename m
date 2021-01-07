Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 946262ED650
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 19:04:06 +0100 (CET)
Received: from localhost ([::1]:47026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxZdl-0008RB-MK
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 13:04:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxZcC-0007fY-5O
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 13:02:28 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:46599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxZc6-0004aI-6S
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 13:02:27 -0500
Received: by mail-ed1-x530.google.com with SMTP id b73so8533261edf.13
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 10:02:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OCGTGUYTbrpYxpy6N+yk8L7761YrfaK62v2oJ5rkRXc=;
 b=l0HvHX1mMxpjonD6nAipyV7YSNvjieW517tkRWgqvSMFToSJ0H2C9aWbLcNtpWa/0e
 ienqfKSU7i1TwpWiPmKzLlRPRGqvq7TW1XHL8RGTznxbLBlwUJl7pWrhV5N71k8/yxBM
 LXRjqS1s3Pq7iNfUx3i9wd/Tw+p0D7ohih8MWx4YR/AcP1P7O/n3kOL09kf4n+1OGoGX
 0hSpBU/Maxmup4aQPqxY+NC6bIY8VaaK/FkoICuihOALssTPisDL+mCr0RuTF0zZ0J7J
 BuJ3b3Q5GN0o7suAia3rf3v1tCV8LJDdUvxHdDJn/C2M5aFW1YKxJVIkMZABQeSHyWsc
 vjvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OCGTGUYTbrpYxpy6N+yk8L7761YrfaK62v2oJ5rkRXc=;
 b=HFgLp+MjB+cFkvldLzJt58CAMZTT8zvXXjQ0RXhY7sABJs+DFKSA+tadM+y9c5smdX
 XOBZ1HbhtToykfYD1rgUVYc5yEsGO7VY0pwyFOSBOFDitVAR36wKB3n84QEHwICILgca
 hyIwY7/toqP1vQzN5GRUusaN+ElXga5/Am+w8Kll/U1SdHoD03cHsBX805hcBOdq0fqo
 WdB2JPU6stsRtSnWxcnC1xzLLhDSoaZEg3fn1e2gexSg/dQQaoSqgOp8OUjTbXPFRSNA
 cmUoZELcj+pO4XNrYIqi3B1O60zGZw6KIjkUrcjkLXCudzPYQqVXfTVvGeXnh9/inQfZ
 Mf8Q==
X-Gm-Message-State: AOAM530Gkj3f5lc7w+zGGydpqXEXXKRXBMspFpnh91rY6SHKwkY/Egyr
 JaucxDnWfxnPAySeHVFfy/A1RPlYP6E6WymhvyYQeA==
X-Google-Smtp-Source: ABdhPJzhuSRkRvEn1NMmn1jn/aQZZbdEbrEP33ZMLIerikWjHomA74AQiCeSTW5IGz7TeqB9qD6I2NglmQZotq/2P3o=
X-Received: by 2002:a50:fd18:: with SMTP id i24mr2600174eds.146.1610042538965; 
 Thu, 07 Jan 2021 10:02:18 -0800 (PST)
MIME-Version: 1.0
References: <20201230172522.33629-1-richard.henderson@linaro.org>
In-Reply-To: <20201230172522.33629-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Jan 2021 18:02:07 +0000
Message-ID: <CAFEAcA_0J5UDcPf29y+9SEzfZdo8mG1toHAfHOMvqM6Kx=uChA@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Fix sve pred_desc decoding
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-stable <qemu-stable@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 30 Dec 2020 at 17:25, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> There was an inconsistency between encoding, which uses
> SIMD_DATA_SHIFT, and decoding which used SIMD_OPRSZ_BITS.
> This happened to be ok, until e2e7168a214, which reduced
> the size of SIMD_OPRSZ_BITS, which lead to truncating all
> predicate vector lengths.
>
> Cc: qemu-stable@nongnu.org
> Buglink: https://bugs.launchpad.net/bugs/1908551
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>
> Ouch.  The patch that exposed this, e2e7168a214, went in near
> the start of the 5.2 devel period, and I never noticed.  I've
> been doing most of my testing vs ArmIE of late, which due to
> lack of a proper sve signal frame restricts RISU to sve128,
> which worked fine with this truncation.  I need to spend some
> time getting FVP working again...
>
>
> r~
>
> ---
>  target/arm/sve_helper.c | 46 ++++++++++++++++++++---------------------
>  1 file changed, 23 insertions(+), 23 deletions(-)
>
> diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
> index 5f037c3a8f..99e4b70d2f 100644
> --- a/target/arm/sve_helper.c
> +++ b/target/arm/sve_helper.c
> @@ -914,7 +914,7 @@ uint32_t HELPER(sve_pfirst)(void *vd, void *vg, uint32_t words)
>
>  uint32_t HELPER(sve_pnext)(void *vd, void *vg, uint32_t pred_desc)
>  {
> -    intptr_t words = extract32(pred_desc, 0, SIMD_OPRSZ_BITS);
> +    intptr_t words = extract32(pred_desc, 0, SIMD_DATA_SHIFT);
>      intptr_t esz = extract32(pred_desc, SIMD_DATA_SHIFT, 2);
>      uint32_t flags = PREDTEST_INIT;
>      uint64_t *d = vd, *g = vg, esz_mask;
> @@ -1867,7 +1867,7 @@ static uint64_t compress_bits(uint64_t x, int n)
>
>  void HELPER(sve_zip_p)(void *vd, void *vn, void *vm, uint32_t pred_desc)
>  {
> -    intptr_t oprsz = extract32(pred_desc, 0, SIMD_OPRSZ_BITS) + 2;
> +    intptr_t oprsz = extract32(pred_desc, 0, SIMD_DATA_SHIFT) + 2;

Why do we not get oprsz by extracting SIMD_OPRSZ_BITS starting at
SIMD_OPRSZ_SHIFT ? (or even by calling simd_oprsz(), which
certainly looks like it ought to be a helper function for
extracting the oprsz...)

If the encoding constants in tcg-gvec-desc.h are right then
"SIMD_DATA_SHIFT bits starting at bit 0" is two fields glued
together (MAXSZ and OPRSZ).

thanks
-- PMM

