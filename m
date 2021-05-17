Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DCBB382D2D
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 15:18:01 +0200 (CEST)
Received: from localhost ([::1]:46006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lid8C-00057E-Lt
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 09:18:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lid5P-0003V4-DE
 for qemu-devel@nongnu.org; Mon, 17 May 2021 09:15:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lid5B-0000OF-EK
 for qemu-devel@nongnu.org; Mon, 17 May 2021 09:15:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621257289;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9IJWiswmhhWw4iVfwEFSnAGTj8Gpe3TYzIzswufoaBk=;
 b=h0qNII1AVabPKQPTcnw1f8PBqTEbV1qMotftx0B5c1rgMXEfOIHVI9avM6ATyXM7HB30/1
 KkgWuoOt4XD1shpj8eQ1tE/E7lREPfGDdCr6cgB0jfQ5Tljhy/tIjcDpKaGEG1FvdmBE31
 SeIVW9PIwIDNJkpW4ngb9aGF7cNtTKU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-318-lVv-nURtPX-ZjipCHamgKg-1; Mon, 17 May 2021 09:14:47 -0400
X-MC-Unique: lVv-nURtPX-ZjipCHamgKg-1
Received: by mail-wm1-f70.google.com with SMTP id
 n127-20020a1c27850000b02901717a27c785so2291068wmn.9
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 06:14:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:organization:subject
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=9IJWiswmhhWw4iVfwEFSnAGTj8Gpe3TYzIzswufoaBk=;
 b=A4vizpg1Z70j2T0ucnlj8wD4fHGzyX7RJWPt6ZA44Rkyv29ZvIR3YQCX+cN+T4JQlO
 c+BdpAUflUgOWtnXH5fzNmtOqEPIGn2qR/Jw6n+nC5UoxpvYXqi/aHuQgJ7k+C3L0JWa
 H/whPokHJjfTyJRL7yrvkZXdYds6F0+khDRg+5sS9LANAHozNc4Z1Ei4NnRf5wO/XUU0
 mCBje07cO8YoTxHEJ02V2x/9NbzCiMo5OaSnq2vNdlTC7vuYzAXlgSNoCIgFxSWFqm9w
 zXjSyRMW6/PNzadG5jdotnEuICrXJ0OBKMEbbWGZk+us7cukasMlgjsD/ogfo7beT1Xk
 5YWA==
X-Gm-Message-State: AOAM533aua3d1HrD/DrJvo3GhMZStstQbGY2iUJsHSTv+EtfZ68Xnwpy
 IFNhc3VXRr8WvuQ8hD7q1PNCfHPho6BbSd20xPu+G+btfovyQxPacIJXIAX1Jtd/gGFNzm05d4R
 36dugQ8XnA/qcJ5w=
X-Received: by 2002:a5d:6d85:: with SMTP id l5mr72690339wrs.22.1621257285677; 
 Mon, 17 May 2021 06:14:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzZvkzkAe7vKBfNhAONu+B+BPUOCSmDWL2FmG9rXY76diCn+hst9Izft6z7u7u7NwMNeVeEdg==
X-Received: by 2002:a5d:6d85:: with SMTP id l5mr72690296wrs.22.1621257285139; 
 Mon, 17 May 2021 06:14:45 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6833.dip0.t-ipconnect.de. [91.12.104.51])
 by smtp.gmail.com with ESMTPSA id
 c15sm17458257wrd.49.2021.05.17.06.14.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 May 2021 06:14:44 -0700 (PDT)
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210508014802.892561-1-richard.henderson@linaro.org>
 <20210508014802.892561-51-richard.henderson@linaro.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH 50/72] softfloat: Move minmax_flags to
 softfloat-parts.c.inc
Message-ID: <4a35ce8e-941a-b067-89c3-b655061aeb13@redhat.com>
Date: Mon, 17 May 2021 15:14:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210508014802.892561-51-richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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

On 08.05.21 03:47, Richard Henderson wrote:
> Rename to parts$N_minmax.  Combine 3 bool arguments to a bitmask,
> return a tri-state value to indicate nan vs unchanged operand.
> Introduce ftype_minmax functions as a common optimization point.
> Fold bfloat16 expansions into the same macro as the other types.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   fpu/softfloat.c           | 216 ++++++++++++++++----------------------
>   fpu/softfloat-parts.c.inc |  69 ++++++++++++
>   2 files changed, 158 insertions(+), 127 deletions(-)
> 
> diff --git a/fpu/softfloat.c b/fpu/softfloat.c
> index 586ea5d67a..4c04e88a3a 100644
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
> +    minmax_ismag = 4 | minmax_isnum
> +};
>   
>   /* Simple helpers for checking if, or what kind of, NaN we have */
>   static inline __attribute__((unused)) bool is_nan(FloatClass c)
> @@ -864,6 +873,14 @@ static void parts128_uint_to_float(FloatParts128 *p, uint64_t a,
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
> @@ -3257,145 +3274,90 @@ float128 uint64_to_float128(uint64_t a, float_status *status)
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
> +    MINMAX_1(type, maxnummag, minmax_ismag)                     \
> +    MINMAX_1(type, min, minmax_ismin)                           \
> +    MINMAX_1(type, minnum, minmax_ismin | minmax_isnum)         \
> +    MINMAX_1(type, minnummag, minmax_ismin | minmax_ismag)
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
> index f3c4f8c8d2..4d91ef0d32 100644
> --- a/fpu/softfloat-parts.c.inc
> +++ b/fpu/softfloat-parts.c.inc
> @@ -936,3 +936,72 @@ static void partsN(uint_to_float)(FloatPartsN *p, uint64_t a,
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
> +    int a_exp, b_exp;
> +    bool a_less;
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
> +            a_exp = INT_MAX;
> +            break;
> +        case float_class_zero:
> +            a_exp = INT_MIN;
> +            break;
> +        default:
> +            g_assert_not_reached();
> +            break;
> +        }
> +        switch (b->cls) {
> +        case float_class_normal:
> +            break;
> +        case float_class_inf:
> +            b_exp = INT_MAX;
> +            break;
> +        case float_class_zero:
> +            b_exp = INT_MIN;
> +            break;
> +        default:
> +            g_assert_not_reached();
> +            break;
> +        }
> +    }
> +
> +    if (a->sign != b->sign && !(flags & minmax_ismag)) {
> +        a_less = a->sign;
> +    } else if (a_exp != b_exp) {
> +        a_less = a_exp < b_exp;
> +    } else {
> +        a_less = frac_cmp(a, b) < 0;
> +    }
> +    return a_less ^ !!(flags & minmax_ismin);
> +}

This patch introduces two issues:

1. Comparing two negative numbers is broken. We have to
invert the a_less result.

2. The check "flags & minmax_ismag" is broken because
"minmax_ismag = 4 | minmax_isnum" and it, therefore,
also triggers for "flags = minmax_isnum"

The following seems to make it work in my tests:


diff --git a/fpu/softfloat-parts.c.inc b/fpu/softfloat-parts.c.inc
index 1bc8db4cf1..d5a73dac00 100644
--- a/fpu/softfloat-parts.c.inc
+++ b/fpu/softfloat-parts.c.inc
@@ -1273,6 +1273,9 @@ static int partsN(minmax)(FloatPartsN *a, FloatPartsN *b,
      } else {
          a_less = frac_cmp(a, b) < 0;
      }
+    if (a->sign && b->sign && !(flags & minmax_ismag)) {
+        a_less = !a_less;
+    }
      return a_less ^ !!(flags & minmax_ismin);
  }
  
diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index bfe5a6b975..649e8c6592 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -435,7 +435,7 @@ enum {
      /* Set for the IEEE 754-2008 minNum() and maxNum() operations. */
      minmax_isnum = 2,
      /* Set for the IEEE 754-2008 minNumMag() and minNumMag() operations. */
-    minmax_ismag = 4 | minmax_isnum
+    minmax_ismag = 4,
  };
  
  /* Simple helpers for checking if, or what kind of, NaN we have */
@@ -3916,10 +3916,10 @@ static float128 float128_minmax(float128 a, float128 b, float_status *s,
  #define MINMAX_2(type) \
      MINMAX_1(type, max, 0)                                      \
      MINMAX_1(type, maxnum, minmax_isnum)                        \
-    MINMAX_1(type, maxnummag, minmax_ismag)                     \
+    MINMAX_1(type, maxnummag, minmax_isnum | minmax_ismag)      \
      MINMAX_1(type, min, minmax_ismin)                           \
      MINMAX_1(type, minnum, minmax_ismin | minmax_isnum)         \
-    MINMAX_1(type, minnummag, minmax_ismin | minmax_ismag)
+    MINMAX_1(type, minnummag, minmax_ismin | minmax_isnum | minmax_ismag)
  
  MINMAX_2(float16)
  MINMAX_2(bfloat16)


-- 
Thanks,

David / dhildenb


