Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D51F0391930
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 15:47:53 +0200 (CEST)
Received: from localhost ([::1]:45204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lltt2-00060k-Gd
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 09:47:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lltrB-0004We-B8
 for qemu-devel@nongnu.org; Wed, 26 May 2021 09:45:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lltr8-0007QD-3R
 for qemu-devel@nongnu.org; Wed, 26 May 2021 09:45:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622036752;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y55ES+Ee2o+qHAo6/jBihReK0sLUFI350h2qs2KANsk=;
 b=LXY40avso+GWugpf7NS09zIVpeSOqZroxgw2ftb2u4gNsGB9NbQEVImW0F24tgPQB8pEdH
 6KTojPdR2cCvlbj4fyjQej68VYfna0mXS5x2y1HO36/OIvODomemIx1HwKw8susVIJuXBY
 2eVZnSM8veLEZ1+ufFAVYSHn9/9pozE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-171-xqCnPQXwODuSvc693WlYRg-1; Wed, 26 May 2021 09:45:50 -0400
X-MC-Unique: xqCnPQXwODuSvc693WlYRg-1
Received: by mail-wm1-f72.google.com with SMTP id
 r1-20020a05600c35c1b029018ec2043223so188209wmq.7
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 06:45:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=Y55ES+Ee2o+qHAo6/jBihReK0sLUFI350h2qs2KANsk=;
 b=sOuc4JxdeEAdUg56+CwCz09buwNImdMYy/24kvTwy2hGDgABjUw/Ikmm1sjqoHMH4x
 XCGJWOMcVAp4oGx0sKLb4ypU7WOoV0N2FnoTyr/l1Y8k1qzG5/IEnzUjoZbBxS6EJIrn
 4RX0smcwO5aaB3S/GocEA250YggKnVhyC06n4YtSAqGE76+a//E9E85fXLyt9ExEACju
 +hTkIeOrg1/kIM8rtY3D4QWXi9cmepsfwDbudjNcVkgq66iyo+RlIrLZ90Y1RsZgYdp+
 miDE9wgJi/2Z3mWsW55HPrOKgW+1YwEFXkmJtgoPK5W6nc7mzLOPsRWSTrmRx6NQRJsW
 Mp/g==
X-Gm-Message-State: AOAM533Ds9z3BukjSEz5QSHFLDImuyVwvMhk3jkXDPVqpbtPVAOqUcyA
 NFuDdWM9l//HzjlpBVK9UXQr43J6Jee0svCVBez/9ref8T52kY6Rlvg5ujNC8BqvRrdAVwwChEn
 hhXp3iUtJinKCugQ=
X-Received: by 2002:a7b:cf15:: with SMTP id l21mr29372565wmg.30.1622036749099; 
 Wed, 26 May 2021 06:45:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyCD+/0KzkHTIIVoYFHIx/jpJj8HEJZ8SU+gUvWJBvIQRzIoqETrgt7wxQDrScZCl3RLamjGA==
X-Received: by 2002:a7b:cf15:: with SMTP id l21mr29372519wmg.30.1622036748579; 
 Wed, 26 May 2021 06:45:48 -0700 (PDT)
Received: from ?IPv6:2003:d8:2f38:2400:62f4:c5fa:ba13:ac32?
 (p200300d82f38240062f4c5faba13ac32.dip0.t-ipconnect.de.
 [2003:d8:2f38:2400:62f4:c5fa:ba13:ac32])
 by smtp.gmail.com with ESMTPSA id h13sm15458550wml.26.2021.05.26.06.45.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 May 2021 06:45:48 -0700 (PDT)
Subject: Re: [PATCH v2 04/28] softfloat: Move minmax_flags to
 softfloat-parts.c.inc
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210525150706.294968-1-richard.henderson@linaro.org>
 <20210525150706.294968-5-richard.henderson@linaro.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <34c1da32-3c06-47a7-a9d8-d9668a63e70d@redhat.com>
Date: Wed, 26 May 2021 15:45:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210525150706.294968-5-richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25.05.21 17:06, Richard Henderson wrote:
> Rename to parts$N_minmax.  Combine 3 bool arguments to a bitmask,
> return a tri-state value to indicate nan vs unchanged operand.
> Introduce ftype_minmax functions as a common optimization point.
> Fold bfloat16 expansions into the same macro as the other types.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   fpu/softfloat.c           | 216 ++++++++++++++++----------------------
>   fpu/softfloat-parts.c.inc |  81 ++++++++++++++
>   2 files changed, 170 insertions(+), 127 deletions(-)
> 
> diff --git a/fpu/softfloat.c b/fpu/softfloat.c
> index db14bd09aa..2dadded0b5 100644
> --- a/fpu/softfloat.c
> +++ b/fpu/softfloat.c
> @@ -482,6 +482,15 @@ enum {
>       float_cmask_anynan  = float_cmask_qnan | float_cmask_snan,
>   };
>   
> +/* Flags for parts_minmax. */
> +enum {
> +    /* Set for minimum; clear for maximum. */
> +    minmax_ismin = 1,
> +    /* Set for the IEEE 754-2008 minNum() and maxNum() operations. */
> +    minmax_isnum = 2,
> +    /* Set for the IEEE 754-2008 minNumMag() and minNumMag() operations. */
> +    minmax_ismag = 4,
> +};
>   
>   /* Simple helpers for checking if, or what kind of, NaN we have */
>   static inline __attribute__((unused)) bool is_nan(FloatClass c)
> @@ -865,6 +874,14 @@ static void parts128_uint_to_float(FloatParts128 *p, uint64_t a,
>   #define parts_uint_to_float(P, I, Z, S) \
>       PARTS_GENERIC_64_128(uint_to_float, P)(P, I, Z, S)
>   
> +static int parts64_minmax(FloatParts64 *a, FloatParts64 *b,
> +                          float_status *s, int flags, const FloatFmt *fmt);
> +static int parts128_minmax(FloatParts128 *a, FloatParts128 *b,
> +                           float_status *s, int flags, const FloatFmt *fmt);
> +
> +#define parts_minmax(A, B, S, Z, F) \
> +    PARTS_GENERIC_64_128(minmax, A)(A, B, S, Z, F)
> +
>   /*
>    * Helper functions for softfloat-parts.c.inc, per-size operations.
>    */
> @@ -3258,145 +3275,90 @@ float128 uint64_to_float128(uint64_t a, float_status *status)
>       return float128_round_pack_canonical(&p, status);
>   }
>   
> -/* Float Min/Max */
> -/* min() and max() functions. These can't be implemented as
> - * 'compare and pick one input' because that would mishandle
> - * NaNs and +0 vs -0.
> - *
> - * minnum() and maxnum() functions. These are similar to the min()
> - * and max() functions but if one of the arguments is a QNaN and
> - * the other is numerical then the numerical argument is returned.
> - * SNaNs will get quietened before being returned.
> - * minnum() and maxnum correspond to the IEEE 754-2008 minNum()
> - * and maxNum() operations. min() and max() are the typical min/max
> - * semantics provided by many CPUs which predate that specification.
> - *
> - * minnummag() and maxnummag() functions correspond to minNumMag()
> - * and minNumMag() from the IEEE-754 2008.
> +/*
> + * Minimum and maximum
>    */
> -static FloatParts64 minmax_floats(FloatParts64 a, FloatParts64 b, bool ismin,
> -                                bool ieee, bool ismag, float_status *s)
> +
> +static float16 float16_minmax(float16 a, float16 b, float_status *s, int flags)
>   {
> -    if (unlikely(is_nan(a.cls) || is_nan(b.cls))) {
> -        if (ieee) {
> -            /* Takes two floating-point values `a' and `b', one of
> -             * which is a NaN, and returns the appropriate NaN
> -             * result. If either `a' or `b' is a signaling NaN,
> -             * the invalid exception is raised.
> -             */
> -            if (is_snan(a.cls) || is_snan(b.cls)) {
> -                return *parts_pick_nan(&a, &b, s);
> -            } else if (is_nan(a.cls) && !is_nan(b.cls)) {
> -                return b;
> -            } else if (is_nan(b.cls) && !is_nan(a.cls)) {
> -                return a;
> -            }
> -        }
> -        return *parts_pick_nan(&a, &b, s);
> -    } else {
> -        int a_exp, b_exp;
> +    FloatParts64 pa, pb;
> +    int which;
>   
> -        switch (a.cls) {
> -        case float_class_normal:
> -            a_exp = a.exp;
> -            break;
> -        case float_class_inf:
> -            a_exp = INT_MAX;
> -            break;
> -        case float_class_zero:
> -            a_exp = INT_MIN;
> -            break;
> -        default:
> -            g_assert_not_reached();
> -            break;
> -        }
> -        switch (b.cls) {
> -        case float_class_normal:
> -            b_exp = b.exp;
> -            break;
> -        case float_class_inf:
> -            b_exp = INT_MAX;
> -            break;
> -        case float_class_zero:
> -            b_exp = INT_MIN;
> -            break;
> -        default:
> -            g_assert_not_reached();
> -            break;
> -        }
> -
> -        if (ismag && (a_exp != b_exp || a.frac != b.frac)) {
> -            bool a_less = a_exp < b_exp;
> -            if (a_exp == b_exp) {
> -                a_less = a.frac < b.frac;
> -            }
> -            return a_less ^ ismin ? b : a;
> -        }
> -
> -        if (a.sign == b.sign) {
> -            bool a_less = a_exp < b_exp;
> -            if (a_exp == b_exp) {
> -                a_less = a.frac < b.frac;
> -            }
> -            return a.sign ^ a_less ^ ismin ? b : a;
> -        } else {
> -            return a.sign ^ ismin ? b : a;
> -        }
> +    float16_unpack_canonical(&pa, a, s);
> +    float16_unpack_canonical(&pb, b, s);
> +    which = parts_minmax(&pa, &pb, s, flags, &float16_params);
> +    if (unlikely(which < 0)) {
> +        /* Some sort of nan, need to repack default and silenced nans. */
> +        return float16_round_pack_canonical(&pa, s);
>       }
> +    return which ? b : a;
>   }
>   
> -#define MINMAX(sz, name, ismin, isiee, ismag)                           \
> -float ## sz float ## sz ## _ ## name(float ## sz a, float ## sz b,      \
> -                                     float_status *s)                   \
> -{                                                                       \
> -    FloatParts64 pa, pb, pr;                                            \
> -    float ## sz ## _unpack_canonical(&pa, a, s);                        \
> -    float ## sz ## _unpack_canonical(&pb, b, s);                        \
> -    pr = minmax_floats(pa, pb, ismin, isiee, ismag, s);                 \
> -    return float ## sz ## _round_pack_canonical(&pr, s);                \
> +static bfloat16 bfloat16_minmax(bfloat16 a, bfloat16 b,
> +                                float_status *s, int flags)
> +{
> +    FloatParts64 pa, pb;
> +    int which;
> +
> +    bfloat16_unpack_canonical(&pa, a, s);
> +    bfloat16_unpack_canonical(&pb, b, s);
> +    which = parts_minmax(&pa, &pb, s, flags, &float16_params);
> +    if (unlikely(which < 0)) {
> +        /* Some sort of nan, need to repack default and silenced nans. */
> +        return bfloat16_round_pack_canonical(&pa, s);
> +    }
> +    return which ? b : a;
>   }
>   
> -MINMAX(16, min, true, false, false)
> -MINMAX(16, minnum, true, true, false)
> -MINMAX(16, minnummag, true, true, true)
> -MINMAX(16, max, false, false, false)
> -MINMAX(16, maxnum, false, true, false)
> -MINMAX(16, maxnummag, false, true, true)
> +static float32 float32_minmax(float32 a, float32 b, float_status *s, int flags)
> +{
> +    FloatParts64 pa, pb;
> +    int which;
>   
> -MINMAX(32, min, true, false, false)
> -MINMAX(32, minnum, true, true, false)
> -MINMAX(32, minnummag, true, true, true)
> -MINMAX(32, max, false, false, false)
> -MINMAX(32, maxnum, false, true, false)
> -MINMAX(32, maxnummag, false, true, true)
> -
> -MINMAX(64, min, true, false, false)
> -MINMAX(64, minnum, true, true, false)
> -MINMAX(64, minnummag, true, true, true)
> -MINMAX(64, max, false, false, false)
> -MINMAX(64, maxnum, false, true, false)
> -MINMAX(64, maxnummag, false, true, true)
> -
> -#undef MINMAX
> -
> -#define BF16_MINMAX(name, ismin, isiee, ismag)                          \
> -bfloat16 bfloat16_ ## name(bfloat16 a, bfloat16 b, float_status *s)     \
> -{                                                                       \
> -    FloatParts64 pa, pb, pr;                                            \
> -    bfloat16_unpack_canonical(&pa, a, s);                               \
> -    bfloat16_unpack_canonical(&pb, b, s);                               \
> -    pr = minmax_floats(pa, pb, ismin, isiee, ismag, s);                 \
> -    return bfloat16_round_pack_canonical(&pr, s);                       \
> +    float32_unpack_canonical(&pa, a, s);
> +    float32_unpack_canonical(&pb, b, s);
> +    which = parts_minmax(&pa, &pb, s, flags, &float32_params);
> +    if (unlikely(which < 0)) {
> +        /* Some sort of nan, need to repack default and silenced nans. */
> +        return float32_round_pack_canonical(&pa, s);
> +    }
> +    return which ? b : a;
>   }
>   
> -BF16_MINMAX(min, true, false, false)
> -BF16_MINMAX(minnum, true, true, false)
> -BF16_MINMAX(minnummag, true, true, true)
> -BF16_MINMAX(max, false, false, false)
> -BF16_MINMAX(maxnum, false, true, false)
> -BF16_MINMAX(maxnummag, false, true, true)
> +static float64 float64_minmax(float64 a, float64 b, float_status *s, int flags)
> +{
> +    FloatParts64 pa, pb;
> +    int which;
>   
> -#undef BF16_MINMAX
> +    float64_unpack_canonical(&pa, a, s);
> +    float64_unpack_canonical(&pb, b, s);
> +    which = parts_minmax(&pa, &pb, s, flags, &float64_params);
> +    if (unlikely(which < 0)) {
> +        /* Some sort of nan, need to repack default and silenced nans. */
> +        return float64_round_pack_canonical(&pa, s);
> +    }
> +    return which ? b : a;
> +}
> +
> +#define MINMAX_1(type, name, flags) \
> +    type type##_##name(type a, type b, float_status *s) \
> +    { return type##_minmax(a, b, s, flags); }
> +
> +#define MINMAX_2(type) \
> +    MINMAX_1(type, max, 0)                                      \
> +    MINMAX_1(type, maxnum, minmax_isnum)                        \
> +    MINMAX_1(type, maxnummag, minmax_isnum | minmax_ismag)      \
> +    MINMAX_1(type, min, minmax_ismin)                           \
> +    MINMAX_1(type, minnum, minmax_ismin | minmax_isnum)         \
> +    MINMAX_1(type, minnummag, minmax_ismin | minmax_isnum | minmax_ismag)
> +
> +MINMAX_2(float16)
> +MINMAX_2(bfloat16)
> +MINMAX_2(float32)
> +MINMAX_2(float64)
> +
> +#undef MINMAX_1
> +#undef MINMAX_2
>   
>   /* Floating point compare */
>   static FloatRelation compare_floats(FloatParts64 a, FloatParts64 b, bool is_quiet,
> diff --git a/fpu/softfloat-parts.c.inc b/fpu/softfloat-parts.c.inc
> index f3c4f8c8d2..d68ab8fee0 100644
> --- a/fpu/softfloat-parts.c.inc
> +++ b/fpu/softfloat-parts.c.inc
> @@ -936,3 +936,84 @@ static void partsN(uint_to_float)(FloatPartsN *p, uint64_t a,
>           p->frac_hi = a << shift;
>       }
>   }
> +
> +/*
> + * Float min/max.
> + *
> + * Return -1 to return the chosen nan in *a;
> + * return 0 to use the a input unchanged; 1 to use the b input unchanged.
> + */
> +static int partsN(minmax)(FloatPartsN *a, FloatPartsN *b,
> +                          float_status *s, int flags, const FloatFmt *fmt)
> +{
> +    int ab_mask = float_cmask(a->cls) | float_cmask(b->cls);
> +    int a_exp, b_exp, cmp;
> +
> +    if (unlikely(ab_mask & float_cmask_anynan)) {
> +        /*
> +         * For minnum/maxnum, if one operand is a QNaN, and the other
> +         * operand is numerical, then return numerical argument.
> +         */
> +        if ((flags & minmax_isnum)
> +            && !(ab_mask & float_cmask_snan)
> +            && (ab_mask & ~float_cmask_qnan)) {
> +            return is_nan(a->cls);
> +        }
> +        *a = *parts_pick_nan(a, b, s);
> +        return -1;
> +    }
> +
> +    a_exp = a->exp;
> +    b_exp = b->exp;
> +
> +    if (unlikely(ab_mask != float_cmask_normal)) {
> +        switch (a->cls) {
> +        case float_class_normal:
> +            break;
> +        case float_class_inf:
> +            a_exp = INT16_MAX;
> +            break;
> +        case float_class_zero:
> +            a_exp = INT16_MIN;
> +            break;
> +        default:
> +            g_assert_not_reached();
> +            break;
> +        }
> +        switch (b->cls) {
> +        case float_class_normal:
> +            break;
> +        case float_class_inf:
> +            b_exp = INT16_MAX;
> +            break;
> +        case float_class_zero:
> +            b_exp = INT16_MIN;
> +            break;
> +        default:
> +            g_assert_not_reached();
> +            break;
> +        }
> +    }
> +
> +    /* Compare magnitudes. */
> +    cmp = a_exp - b_exp;
> +    if (cmp == 0) {
> +        cmp = frac_cmp(a, b);
> +    }
> +
> +    /*
> +     * Take the sign into account.
> +     * For ismag, only do this if the magnitudes are equal.
> +     */
> +    if (!(flags & minmax_ismag) || cmp == 0) {
> +        if (a->sign != b->sign) {
> +            /* For differing signs, the negative operand is less. */
> +            cmp = a->sign ? -1 : 1;
> +        } else if (a->sign) {
> +            /* For two negative operands, invert the magnitude comparison. */
> +            cmp = -cmp;
> +        }
> +    }
> +
> +    return (cmp < 0) ^ !!(flags & minmax_ismin);
> +}
> 

Looks good to me

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


