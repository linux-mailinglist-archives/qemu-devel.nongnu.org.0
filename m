Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F0837F601
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 12:54:57 +0200 (CEST)
Received: from localhost ([::1]:32960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lh8zY-0003uf-8Q
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 06:54:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lh8sX-0000ms-No
 for qemu-devel@nongnu.org; Thu, 13 May 2021 06:47:41 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:34542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lh8sP-00032N-Nz
 for qemu-devel@nongnu.org; Thu, 13 May 2021 06:47:41 -0400
Received: by mail-ej1-x629.google.com with SMTP id a4so39283458ejk.1
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 03:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=P+aUac3NYKfZ4y35rjBCtQwtgg4I/F3klXEtIJtPjUE=;
 b=tAEL5tx7JZuID5plFdM3SVAXXe9yLtOF1URMQsg1SRumVryi/VL0T1h6xA/wIPmnX6
 yEacdfp/d5AHMs40IRpqRDDMyrjvegzhDY9FVgaDtrGfbwxiOtYAMwd8GL0vojcWGkwQ
 LUxaFy129ADRoSQkSfhNLIffWxYsNBqPrmcG6TNWV1QYpSFRkt1g9jrFtt37SbWU8N8a
 T/Y84JZzwq//put+1+PujZe5393TzqYSJ4FP7BLU89AlF4ICDp19xIkdMDS22pnez2zU
 zZl9KTnqnDiMilIush9PexqAMuHGpswTdvozGLG/66A13TMh1z9Yzr25kjYJsFsDEjN6
 N19w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=P+aUac3NYKfZ4y35rjBCtQwtgg4I/F3klXEtIJtPjUE=;
 b=P8caJc6uBli/WCnSQTLv3jprlhVCvQW2LxoaBvqKn4p0SXYskoLiwtRva0W0JGTEok
 Nyz4gdkYQfXT93wMtVVPe+TmL6iqxZ96/Ovs9/WusfgZ1A8esR8RWDbtzJUYIfGwJWoe
 k+91S2+27bEVRt81NQRIMKBs7MqsFuOQnHpauvaOS5KRGPNliKA6eMTXpl336L5eywHV
 Jy8NINMLUCb+JR+NasvJ33mWOXUmHMBx7Fbby3SDnoAmSzN43CNqfHveKELzy4Pj7wj4
 k0x0OkatsvYNlPMXxiUpfhOVrfQNPnUkqv2hJsPoFQPoKAV4tDeX8GUDUdSDr8bH/38K
 6Bxg==
X-Gm-Message-State: AOAM530cSG40mGUgupOgbwk5Sza93YgXRZ4Cum316Zsr5ya5c4DJMLUW
 oaLeQ1qUxZ3kDYDzt2eznT827p67avhZ//nBzgZqKA==
X-Google-Smtp-Source: ABdhPJwcc1DlsKqobtt0WjtYeGAKZ6Iclgg14ZDfc3hI4moaMbjhn7OVe2edIgWAx2WqhxaZ0hwGhSyrXAjo7DOnEnM=
X-Received: by 2002:a17:906:b1cc:: with SMTP id
 bv12mr42425405ejb.407.1620902851961; 
 Thu, 13 May 2021 03:47:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-49-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-49-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 May 2021 11:47:20 +0100
Message-ID: <CAFEAcA_KVJSmphodL=szHvguTpDnCU3BET1+Kn873uoX82zE_A@mail.gmail.com>
Subject: Re: [PATCH v6 48/82] target/arm: Pass separate addend to {U,
 S}DOT helpers
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 30 Apr 2021 at 21:57, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> For SVE, we potentially have a 4th argument coming from the
> movprfx instruction.  Currently we do not optimize movprfx,
> so the problem is not visible.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v4: Fix double addition (zhiwei).
> ---
>  target/arm/helper.h         |  20 +++---
>  target/arm/sve.decode       |   7 ++-
>  target/arm/translate-a64.c  |  15 ++++-
>  target/arm/translate-neon.c |  10 +--
>  target/arm/translate-sve.c  |  13 ++--
>  target/arm/vec_helper.c     | 120 ++++++++++++++++++++----------------
>  6 files changed, 109 insertions(+), 76 deletions(-)

> diff --git a/target/arm/vec_helper.c b/target/arm/vec_helper.c
> index a3d80ecad0..f88e572132 100644
> --- a/target/arm/vec_helper.c
> +++ b/target/arm/vec_helper.c
> @@ -375,71 +375,76 @@ void HELPER(sve2_sqrdmlsh_d)(void *vd, void *vn, void *vm,
>   * All elements are treated equally, no matter where they are.
>   */
>
> -void HELPER(gvec_sdot_b)(void *vd, void *vn, void *vm, uint32_t desc)
> +void HELPER(gvec_sdot_b)(void *vd, void *vn, void *vm, void *va, uint32_t desc)
>  {
>      intptr_t i, opr_sz = simd_oprsz(desc);
> -    uint32_t *d = vd;
> +    int32_t *d = vd, *a = va;

Why the type change ?

>      int8_t *n = vn, *m = vm;
>
>      for (i = 0; i < opr_sz / 4; ++i) {
> -        d[i] += n[i * 4 + 0] * m[i * 4 + 0]
> -              + n[i * 4 + 1] * m[i * 4 + 1]
> -              + n[i * 4 + 2] * m[i * 4 + 2]
> -              + n[i * 4 + 3] * m[i * 4 + 3];
> +        d[i] = (a[i] +
> +                n[i * 4 + 0] * m[i * 4 + 0] +
> +                n[i * 4 + 1] * m[i * 4 + 1] +
> +                n[i * 4 + 2] * m[i * 4 + 2] +
> +                n[i * 4 + 3] * m[i * 4 + 3]);
>      }
>      clear_tail(d, opr_sz, simd_maxsz(desc));
>  }

> -void HELPER(gvec_sdot_h)(void *vd, void *vn, void *vm, uint32_t desc)
> +void HELPER(gvec_sdot_h)(void *vd, void *vn, void *vm, void *va, uint32_t desc)
>  {
>      intptr_t i, opr_sz = simd_oprsz(desc);
> -    uint64_t *d = vd;
> +    int64_t *d = vd, *a = va;

Ditto.

>      int16_t *n = vn, *m = vm;
>
>      for (i = 0; i < opr_sz / 8; ++i) {
> -        d[i] += (int64_t)n[i * 4 + 0] * m[i * 4 + 0]
> -              + (int64_t)n[i * 4 + 1] * m[i * 4 + 1]
> -              + (int64_t)n[i * 4 + 2] * m[i * 4 + 2]
> -              + (int64_t)n[i * 4 + 3] * m[i * 4 + 3];
> +        d[i] = (a[i] +
> +                (int64_t)n[i * 4 + 0] * m[i * 4 + 0] +
> +                (int64_t)n[i * 4 + 1] * m[i * 4 + 1] +
> +                (int64_t)n[i * 4 + 2] * m[i * 4 + 2] +
> +                (int64_t)n[i * 4 + 3] * m[i * 4 + 3]);
>      }
>      clear_tail(d, opr_sz, simd_maxsz(desc));
>  }
>

> -void HELPER(gvec_sdot_idx_b)(void *vd, void *vn, void *vm, uint32_t desc)
> +void HELPER(gvec_sdot_idx_b)(void *vd, void *vn, void *vm,
> +                             void *va, uint32_t desc)
>  {
>      intptr_t i, segend, opr_sz = simd_oprsz(desc), opr_sz_4 = opr_sz / 4;
>      intptr_t index = simd_data(desc);
> -    uint32_t *d = vd;
> +    int32_t *d = vd, *a = va;
>      int8_t *n = vn;
>      int8_t *m_indexed = (int8_t *)vm + H4(index) * 4;

Ditto.

> -void HELPER(gvec_sdot_idx_h)(void *vd, void *vn, void *vm, uint32_t desc)
> +void HELPER(gvec_sdot_idx_h)(void *vd, void *vn, void *vm,
> +                             void *va, uint32_t desc)
>  {
>      intptr_t i, opr_sz = simd_oprsz(desc), opr_sz_8 = opr_sz / 8;
>      intptr_t index = simd_data(desc);
> -    uint64_t *d = vd;
> +    int64_t *d = vd, *a = va;
>      int16_t *n = vn;
>      int16_t *m_indexed = (int16_t *)vm + index * 4;

Ditto.

> @@ -509,30 +518,33 @@ void HELPER(gvec_sdot_idx_h)(void *vd, void *vn, void *vm, uint32_t desc)
>       * Process the entire segment all at once, writing back the results
>       * only after we've consumed all of the inputs.
>       */
> -    for (i = 0; i < opr_sz_8 ; i += 2) {
> -        uint64_t d0, d1;
> +    for (i = 0; i < opr_sz_8; i += 2) {
> +        int64_t d0, d1;

Ditto.

>
> -        d0  = n[i * 4 + 0] * (int64_t)m_indexed[i * 4 + 0];
> +        d0  = a[i + 0];
> +        d0 += n[i * 4 + 0] * (int64_t)m_indexed[i * 4 + 0];
>          d0 += n[i * 4 + 1] * (int64_t)m_indexed[i * 4 + 1];
>          d0 += n[i * 4 + 2] * (int64_t)m_indexed[i * 4 + 2];
>          d0 += n[i * 4 + 3] * (int64_t)m_indexed[i * 4 + 3];
> -        d1  = n[i * 4 + 4] * (int64_t)m_indexed[i * 4 + 0];
> +
> +        d1  = a[i + 1];
> +        d1 += n[i * 4 + 4] * (int64_t)m_indexed[i * 4 + 0];
>          d1 += n[i * 4 + 5] * (int64_t)m_indexed[i * 4 + 1];
>          d1 += n[i * 4 + 6] * (int64_t)m_indexed[i * 4 + 2];
>          d1 += n[i * 4 + 7] * (int64_t)m_indexed[i * 4 + 3];
>
> -        d[i + 0] += d0;
> -        d[i + 1] += d1;
> +        d[i + 0] = d0;
> +        d[i + 1] = d1;
>      }
> -
>      clear_tail(d, opr_sz, simd_maxsz(desc));
>  }

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

