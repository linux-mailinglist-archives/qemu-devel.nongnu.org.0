Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F9437A349
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 11:18:03 +0200 (CEST)
Received: from localhost ([::1]:42900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgOWh-0002h2-1h
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 05:18:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgNts-0006vl-7s
 for qemu-devel@nongnu.org; Tue, 11 May 2021 04:37:56 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:35427)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgNtq-00065c-84
 for qemu-devel@nongnu.org; Tue, 11 May 2021 04:37:55 -0400
Received: by mail-ej1-x62a.google.com with SMTP id m12so28569528eja.2
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 01:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=l1bl/sxawYntukRgrlubRtqJpmBHcGwA0ZwD8+RoYc0=;
 b=dIXfMiHadfnLTvnr6GOLlx23lTLT+yqEKFvHMZq+7MjNgo4mJxgMjMKdHwbSz03Odm
 HZ6+hl1NHG0Lh9kpXk7bDlzYi2pP0yVpBZrSxeBIfr10bryArCKPVeZ0OVoTLEcT+CUz
 c49kTr38NAU6IBembefHsfxSS4zp9XRaK/e1hfnmfcDHmsIw2vjozsIIfFMtN6Aq4Uzr
 hYNlCFLe2U0qkN7+fPmczoo6qWQ9O0R0BZC8SKQrL8C55Vs75Cv8osM1E/ulG2PdsvzB
 dlcY2wf9uxfdViBKVceFJIICQ/IUb5RFVycYLMB1YTqYkyQdq0Qe+kDrjHlgGXSswuCd
 2wdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=l1bl/sxawYntukRgrlubRtqJpmBHcGwA0ZwD8+RoYc0=;
 b=YQCcjHVMo/8LXcBWurt56sXdEKkcvXxasar6iZskSkZ65IMf30mwJHP0J70J/Wf5Dz
 tYK9eqlu8Zom1W0Kbsdqb9Cb3PaX7VWwusKD/brQ45EA9uacEjzXoV8No43RTduCaTzI
 6U653nuVeJ3hjuW4pE0lnXNbgDPlAYph0ivn4MexwB+e3s9x3qjujT4bbrOmirymrAAA
 SKpJRvXlJ/6NDjv3tlmkeabr8iQWywiLmdDk5fQw3akXBZ85My9CdUUE1m4SRMsWAcMq
 ILMmAb7tLUXCJPDdnjV08Mm6vMlU4U7QmZDOhpEPKq/N+e5gR8NbUiStLtR+H88Zph3l
 O1Dw==
X-Gm-Message-State: AOAM5329GeN+TSIARPbhPnj8uLXlqwDPiLZhCTLvY2/cYzP0/rOpRyZH
 gfQxLelGFMNUBSJh1loXIqy0wi1ddAwLdx2oCUZbOQ==
X-Google-Smtp-Source: ABdhPJwpX82o4yNnoR566Ml1TGiy6JnKOBmUnTYhDrB7FNlTWERS4sy8LKkQF8B2R1LOOeUeRjLHz2RolcaEU1Te3Vk=
X-Received: by 2002:a17:906:11cc:: with SMTP id
 o12mr30658795eja.85.1620722272332; 
 Tue, 11 May 2021 01:37:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-6-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-6-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 May 2021 09:36:39 +0100
Message-ID: <CAFEAcA8wrDyEMTvHR97BinJZm+CozffMWkefAmywU6t2fBbLjQ@mail.gmail.com>
Subject: Re: [PATCH v6 05/82] target/arm: Split out saturating/rounding shifts
 from neon
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
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

On Fri, 30 Apr 2021 at 21:30, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Split these operations out into a header that can be shared
> between neon and sve.  The "sat" pointer acts both as a boolean
> for control of saturating behavior and controls the difference
> in behavior between neon and sve -- QC bit or no QC bit.
>
> Widen the shift operand in the new helpers, as the SVE2 insns treat
> the whole input element as significant.  For the neon uses, truncate
> the shift to int8_t while passing the parameter.
>
> Implement right-shift rounding as
>
>     tmp = src >> (shift - 1);
>     dst = (tmp >> 1) + (tmp & 1);
>
> This is the same number of instructions as the current
>
>     tmp = 1 << (shift - 1);
>     dst = (src + tmp) >> shift;
>
> without any possibility of intermediate overflow.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v2: Widen the shift operand (laurent desnouges)
> ---
>  target/arm/vec_internal.h | 138 +++++++++++
>  target/arm/neon_helper.c  | 507 +++++++-------------------------------
>  2 files changed, 221 insertions(+), 424 deletions(-)
>
> diff --git a/target/arm/vec_internal.h b/target/arm/vec_internal.h
> index e3eb3e7a6b..0102547a10 100644
> --- a/target/arm/vec_internal.h
> +++ b/target/arm/vec_internal.h
> @@ -30,4 +30,142 @@ static inline void clear_tail(void *vd, uintptr_t opr_sz, uintptr_t max_sz)
>      }
>  }
>
> +static inline int32_t do_sqrshl_bhs(int32_t src, int32_t shift, int bits,
> +                                    bool round, uint32_t *sat)
> +{
> +    if (shift <= -bits) {
> +        /* Rounding the sign bit always produces 0. */
> +        if (round) {
> +            return 0;
> +        }
> +        return src >> 31;
> +    } else if (shift < 0) {
> +        if (round) {
> +            src >>= -shift - 1;
> +            return (src >> 1) + (src & 1);
> +        }
> +        return src >> -shift;
> +    } else if (shift < bits) {
> +        int32_t val = src << shift;
> +        if (bits == 32) {
> +            if (!sat || val >> shift == src) {
> +                return val;
> +            }
> +        } else {
> +            int32_t extval = sextract32(val, 0, bits);
> +            if (!sat || val == extval) {
> +                return extval;
> +            }
> +        }
> +    } else if (!sat || src == 0) {
> +        return 0;
> +    }
> +
> +    *sat = 1;
> +    return (1u << (bits - 1)) - (src >= 0);
> +}
> +
> +static inline uint32_t do_uqrshl_bhs(uint32_t src, int32_t shift, int bits,
> +                                     bool round, uint32_t *sat)
> +{
> +    if (shift <= -(bits + round)) {
> +        return 0;
> +    } else if (shift < 0) {
> +        if (round) {
> +            src >>= -shift - 1;
> +            return (src >> 1) + (src & 1);
> +        }
> +        return src >> -shift;
> +    } else if (shift < bits) {
> +        uint32_t val = src << shift;
> +        if (bits == 32) {
> +            if (!sat || val >> shift == src) {
> +                return val;
> +            }
> +        } else {
> +            uint32_t extval = extract32(val, 0, bits);
> +            if (!sat || val == extval) {
> +                return extval;
> +            }
> +        }
> +    } else if (!sat || src == 0) {
> +        return 0;
> +    }
> +
> +    *sat = 1;
> +    return MAKE_64BIT_MASK(0, bits);
> +}
> +
> +static inline int32_t do_suqrshl_bhs(int32_t src, int32_t shift, int bits,
> +                                     bool round, uint32_t *sat)
> +{
> +    if (src < 0) {
> +        *sat = 1;

Shouldn't this check whether sat is NULL ?

> +        return 0;
> +    }
> +    return do_uqrshl_bhs(src, shift, bits, round, sat);
> +}
> +
> +static inline int64_t do_sqrshl_d(int64_t src, int64_t shift,
> +                                  bool round, uint32_t *sat)
> +{
> +    if (shift <= -64) {
> +        /* Rounding the sign bit always produces 0. */
> +        if (round) {
> +            return 0;
> +        }
> +        return src >> 63;
> +    } else if (shift < 0) {
> +        if (round) {
> +            src >>= -shift - 1;
> +            return (src >> 1) + (src & 1);
> +        }
> +        return src >> -shift;
> +    } else if (shift < 64) {
> +        int64_t val = src << shift;
> +        if (!sat || val >> shift == src) {
> +            return val;
> +        }
> +    } else if (!sat || src == 0) {
> +        return 0;
> +    }
> +
> +    *sat = 1;
> +    return src < 0 ? INT64_MIN : INT64_MAX;
> +}
> +
> +static inline uint64_t do_uqrshl_d(uint64_t src, int64_t shift,
> +                                   bool round, uint32_t *sat)
> +{
> +    if (shift <= -(64 + round)) {
> +        return 0;
> +    } else if (shift < 0) {
> +        if (round) {
> +            src >>= -shift - 1;
> +            return (src >> 1) + (src & 1);
> +        }
> +        return src >> -shift;
> +    } else if (shift < 64) {
> +        uint64_t val = src << shift;
> +        if (!sat || val >> shift == src) {
> +            return val;
> +        }
> +    } else if (!sat || src == 0) {
> +        return 0;
> +    }
> +
> +    *sat = 1;
> +    return UINT64_MAX;
> +}
> +
> +static inline int64_t do_suqrshl_d(int64_t src, int64_t shift,
> +                                   bool round, uint32_t *sat)
> +{
> +    if (src < 0) {
> +        *sat = 1;

Missing NULL check again.

> +        return 0;
> +    }
> +    return do_uqrshl_d(src, shift, round, sat);
> +}

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

