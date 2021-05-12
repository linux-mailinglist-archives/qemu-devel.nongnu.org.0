Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A2137D35C
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 20:19:53 +0200 (CEST)
Received: from localhost ([::1]:60368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgtSa-0006GF-OZ
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 14:19:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lgtPa-0003JZ-92
 for qemu-devel@nongnu.org; Wed, 12 May 2021 14:16:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45172)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lgtPU-0001xG-9i
 for qemu-devel@nongnu.org; Wed, 12 May 2021 14:16:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620843397;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GC251dwXY5DzaSZezHdt8VLNxUlE3lnMe2OThf4pO1k=;
 b=PMutFCQdDA/Br4sFxHLIJF3v6QJcpN0LFbGjYNq57M28ukinLiEmPWYNmiJEaKzNrZGceZ
 lbg0eLdDcIq/U7xoI5lWEia99XY6vM5TNkhNMB6J/mF5Y6qHbCMxMkxvofvpUn/cqhFPxo
 Ab5KCqaOCjOjq8ehhZz6/qIpXPlXxHk=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-13-nORvo0WPOdmjVb7m6h436g-1; Wed, 12 May 2021 14:16:35 -0400
X-MC-Unique: nORvo0WPOdmjVb7m6h436g-1
Received: by mail-ed1-f71.google.com with SMTP id
 o12-20020aa7d3cc0000b02903891695ceabso13304517edr.3
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 11:16:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=GC251dwXY5DzaSZezHdt8VLNxUlE3lnMe2OThf4pO1k=;
 b=QDAHwnHO7aqkM+R0m4VBdjy06iET1Xywy4QHJBp2KTHAfMtk5HPSNl72IjQZxOo7oI
 OABZDuE01XwEMbZJNq1Ec0MUkRPFd3c+g7MeAkCvxpCDta4wxM/WW3RveganO8tiM0dE
 ZPkXLdABhrZ3lSloSuYN8TCbb5azFHUJeA+S+ZHw/iquDKyVfst0c9PtZK7RBqUX6s/B
 sHQiSPdqUlIOgpTyW09aaGlAVPGYLzM+CHCOnku9Iuxa5ruREkbIF49S96Saf0IXSSgj
 exW0DLaCxYsy8jHWyvxmSiVpk9cs7v9yVJiL6bkNA+5sB4W5Qnk6M4+LZYcJyc1YcBYJ
 sBOA==
X-Gm-Message-State: AOAM530mn+3nQb0zl7QHXsgX5Tw+gOI7as9c6y1hB24/n2N1ZfCybb6w
 bRfL35nEmjP483wDIBw8b7dQCvVhR1bCgaZBJ9ryQvZocKyIo+fPIXwTFgDjw0U1bauOtQ3nkmy
 JnCCvHCLIc6+d6MY=
X-Received: by 2002:aa7:cb84:: with SMTP id r4mr44936603edt.187.1620843394409; 
 Wed, 12 May 2021 11:16:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz/okvnmLRZzIGwkqsI9l4pJoBvXO0HoR7X6woNX/7x4oUkW3cSfk8CCVsWVw64xk6/gEEWSw==
X-Received: by 2002:aa7:cb84:: with SMTP id r4mr44936563edt.187.1620843394047; 
 Wed, 12 May 2021 11:16:34 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c65ab.dip0.t-ipconnect.de. [91.12.101.171])
 by smtp.gmail.com with ESMTPSA id f7sm290103ejz.95.2021.05.12.11.16.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 May 2021 11:16:33 -0700 (PDT)
Subject: Re: [PATCH 29/72] softfloat: Move pick_nan to softfloat-parts.c.inc
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210508014802.892561-1-richard.henderson@linaro.org>
 <20210508014802.892561-30-richard.henderson@linaro.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <24f81b2c-ae42-ab34-3b57-08514d32620e@redhat.com>
Date: Wed, 12 May 2021 20:16:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210508014802.892561-30-richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
> At the same time, convert to pointers, rename to parts$N_pick_nan
> and define a macro for parts_pick_nan using QEMU_GENERIC.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   fpu/softfloat.c           | 62 ++++++++++++++++++++++-----------------
>   fpu/softfloat-parts.c.inc | 25 ++++++++++++++++
>   2 files changed, 60 insertions(+), 27 deletions(-)
> 
> diff --git a/fpu/softfloat.c b/fpu/softfloat.c
> index 5b26696078..77efaedeaa 100644
> --- a/fpu/softfloat.c
> +++ b/fpu/softfloat.c
> @@ -713,10 +713,39 @@ static void parts128_return_nan(FloatParts128 *a, float_status *s);
>   
>   #define parts_return_nan(P, S)     PARTS_GENERIC_64_128(return_nan, P)(P, S)
>   
> +static FloatParts64 *parts64_pick_nan(FloatParts64 *a, FloatParts64 *b,
> +                                      float_status *s);
> +static FloatParts128 *parts128_pick_nan(FloatParts128 *a, FloatParts128 *b,
> +                                        float_status *s);
> +
> +#define parts_pick_nan(A, B, S)    PARTS_GENERIC_64_128(pick_nan, A)(A, B, S)
> +
>   /*
>    * Helper functions for softfloat-parts.c.inc, per-size operations.
>    */
>   
> +#define FRAC_GENERIC_64_128(NAME, P) \
> +    QEMU_GENERIC(P, (FloatParts128 *, frac128_##NAME), frac64_##NAME)
> +
> +static int frac64_cmp(FloatParts64 *a, FloatParts64 *b)
> +{
> +    return a->frac == b->frac ? 0 : a->frac < b->frac ? -1 : 1;
> +}
> +
> +static int frac128_cmp(FloatParts128 *a, FloatParts128 *b)
> +{
> +    uint64_t ta = a->frac_hi, tb = b->frac_hi;
> +    if (ta == tb) {
> +        ta = a->frac_lo, tb = b->frac_lo;
> +        if (ta == tb) {
> +            return 0;
> +        }
> +    }
> +    return ta < tb ? -1 : 1;
> +}
> +
> +#define frac_cmp(A, B)  FRAC_GENERIC_64_128(cmp, A)(A, B)
> +
>   static void frac128_shl(FloatParts128 *a, int c)
>   {
>       shift128Left(a->frac_hi, a->frac_lo, c, &a->frac_hi, &a->frac_lo);
> @@ -918,27 +947,6 @@ static FloatParts64 round_canonical(FloatParts64 p, float_status *s,
>       return p;
>   }
>   
> -static FloatParts64 pick_nan(FloatParts64 a, FloatParts64 b, float_status *s)
> -{
> -    if (is_snan(a.cls) || is_snan(b.cls)) {
> -        float_raise(float_flag_invalid, s);
> -    }
> -
> -    if (s->default_nan_mode) {
> -        parts_default_nan(&a, s);
> -    } else {
> -        if (pickNaN(a.cls, b.cls,
> -                    a.frac > b.frac ||
> -                    (a.frac == b.frac && a.sign < b.sign), s)) {
> -            a = b;
> -        }
> -        if (is_snan(a.cls)) {
> -            parts_silence_nan(&a, s);
> -        }
> -    }
> -    return a;
> -}
> -
>   static FloatParts64 pick_nan_muladd(FloatParts64 a, FloatParts64 b, FloatParts64 c,
>                                     bool inf_zero, float_status *s)
>   {
> @@ -1106,7 +1114,7 @@ static FloatParts64 addsub_floats(FloatParts64 a, FloatParts64 b, bool subtract,
>               return a;
>           }
>           if (is_nan(a.cls) || is_nan(b.cls)) {
> -            return pick_nan(a, b, s);
> +            return *parts_pick_nan(&a, &b, s);
>           }
>           if (a.cls == float_class_inf) {
>               if (b.cls == float_class_inf) {
> @@ -1144,7 +1152,7 @@ static FloatParts64 addsub_floats(FloatParts64 a, FloatParts64 b, bool subtract,
>               return a;
>           }
>           if (is_nan(a.cls) || is_nan(b.cls)) {
> -            return pick_nan(a, b, s);
> +            return *parts_pick_nan(&a, &b, s);
>           }
>           if (a.cls == float_class_inf || b.cls == float_class_zero) {
>               return a;
> @@ -1360,7 +1368,7 @@ static FloatParts64 mul_floats(FloatParts64 a, FloatParts64 b, float_status *s)
>       }
>       /* handle all the NaN cases */
>       if (is_nan(a.cls) || is_nan(b.cls)) {
> -        return pick_nan(a, b, s);
> +        return *parts_pick_nan(&a, &b, s);
>       }
>       /* Inf * Zero == NaN */
>       if ((a.cls == float_class_inf && b.cls == float_class_zero) ||
> @@ -1887,7 +1895,7 @@ static FloatParts64 div_floats(FloatParts64 a, FloatParts64 b, float_status *s)
>       }
>       /* handle all the NaN cases */
>       if (is_nan(a.cls) || is_nan(b.cls)) {
> -        return pick_nan(a, b, s);
> +        return *parts_pick_nan(&a, &b, s);
>       }
>       /* 0/0 or Inf/Inf */
>       if (a.cls == b.cls
> @@ -3295,14 +3303,14 @@ static FloatParts64 minmax_floats(FloatParts64 a, FloatParts64 b, bool ismin,
>                * the invalid exception is raised.
>                */
>               if (is_snan(a.cls) || is_snan(b.cls)) {
> -                return pick_nan(a, b, s);
> +                return *parts_pick_nan(&a, &b, s);
>               } else if (is_nan(a.cls) && !is_nan(b.cls)) {
>                   return b;
>               } else if (is_nan(b.cls) && !is_nan(a.cls)) {
>                   return a;
>               }
>           }
> -        return pick_nan(a, b, s);
> +        return *parts_pick_nan(&a, &b, s);
>       } else {
>           int a_exp, b_exp;
>   
> diff --git a/fpu/softfloat-parts.c.inc b/fpu/softfloat-parts.c.inc
> index 2a3075d6fe..11a71650f7 100644
> --- a/fpu/softfloat-parts.c.inc
> +++ b/fpu/softfloat-parts.c.inc
> @@ -35,3 +35,28 @@ static void partsN(return_nan)(FloatPartsN *a, float_status *s)
>           g_assert_not_reached();
>       }
>   }
> +
> +static FloatPartsN *partsN(pick_nan)(FloatPartsN *a, FloatPartsN *b,
> +                                     float_status *s)
> +{
> +    if (is_snan(a->cls) || is_snan(b->cls)) {
> +        float_raise(float_flag_invalid, s);
> +    }
> +
> +    if (s->default_nan_mode) {
> +        parts_default_nan(a, s);
> +    } else {
> +        int cmp = frac_cmp(a, b);
> +        if (cmp == 0) {
> +            cmp = a->sign < b->sign;
> +        }
> +
> +        if (pickNaN(a->cls, b->cls, cmp > 0, s)) {
> +            a = b;
> +        }
> +        if (is_snan(a->cls)) {
> +            parts_silence_nan(a, s);
> +        }
> +    }
> +    return a;
> +}
> 

I find the "*parts_pick_nan(&a, &b, s);" part a little ugly to read, but 
as long as this function isn't inline there isn't much the compiler 
could optimize when passing by value instead, so

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


