Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A02F3918F3
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 15:35:53 +0200 (CEST)
Received: from localhost ([::1]:33526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llthP-00061h-TO
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 09:35:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lltgM-0005KS-Dw
 for qemu-devel@nongnu.org; Wed, 26 May 2021 09:34:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59246)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lltgJ-0000KB-4n
 for qemu-devel@nongnu.org; Wed, 26 May 2021 09:34:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622036081;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fPX+XDJrOBIyHcur6nMF5f+/igISdcaUHL4ugimUHzs=;
 b=Em1yoB/77ivnHPnKjfeZeE4RCx0t2C5jDrl7KeLUdz9lMd20pemLUDbbPb6Y/9iz7Fn2vA
 CWIOZNkw/c2Z9aMoXEv7590aOnMbM7CMQS6Fdx6vQGHcb+apOpVCvFezvIpi4fkCVi8Le6
 alc5sMsK5Q7gdFAsHU2C7Q1WCDeG21o=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-299-SyKKsqxiPwWviUyUi2of_w-1; Wed, 26 May 2021 09:34:39 -0400
X-MC-Unique: SyKKsqxiPwWviUyUi2of_w-1
Received: by mail-wm1-f70.google.com with SMTP id
 q2-20020a05600c2e42b0290192cdd9d918so207196wmf.4
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 06:34:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=fPX+XDJrOBIyHcur6nMF5f+/igISdcaUHL4ugimUHzs=;
 b=na1gZm1dwfR58XL2V64KxQ6zv53x4MWDU/5951kWKZb1dpeWNuWekHqEBhWXTlGLzA
 q2sjPMAEkc7tK/U/iRbLL2EZ9Ng0My5ahjOlgKcYWBSIdN+r+TTKQzLsLVAX2hIZ706u
 GhnPo5vpS698oPNQjyGwWAaWpn7I0who8NFYjw8vA3cQUE3vtG79Ux6RHqR4d7IX8clp
 WkzYQk5xF8EM+hmagxjHqFnexGzyn8wbrGkLa5eXbYTKJ4EwO2+1DUqxj6CXvG+b0pn+
 vkd+tCJ7M2AGzuYiadENFIvcS9LqNM3a9IS+6pN0/a3qyX+6ZkNOT2L9G+qGj3Db+iug
 1lQw==
X-Gm-Message-State: AOAM53046me7tS8L9gjQbWrT3kqtNcXLILAX9c/fauxwOn1PquSRgvMH
 sNH1IF8rnsYbxtime7BmNTFVGXYPRlONafiYoND3MIOH7pw9Yy61Ij1FYQctZ8I3PY8pDE8AQLD
 4Yju0F3jU/pwGgwg=
X-Received: by 2002:a5d:4744:: with SMTP id o4mr31932120wrs.86.1622036077460; 
 Wed, 26 May 2021 06:34:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzPv52x0mZ8Xanj14n8Fdva22Z8VfeWay6qW2xzdRdgjfC3+96ber1k/RJLF+v9idyCr+0k+g==
X-Received: by 2002:a5d:4744:: with SMTP id o4mr31932088wrs.86.1622036077061; 
 Wed, 26 May 2021 06:34:37 -0700 (PDT)
Received: from ?IPv6:2003:d8:2f38:2400:62f4:c5fa:ba13:ac32?
 (p200300d82f38240062f4c5faba13ac32.dip0.t-ipconnect.de.
 [2003:d8:2f38:2400:62f4:c5fa:ba13:ac32])
 by smtp.gmail.com with ESMTPSA id u18sm7395049wmj.15.2021.05.26.06.34.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 May 2021 06:34:36 -0700 (PDT)
Subject: Re: [PATCH v2 02/28] softfloat: Move int_to_float to
 softfloat-parts.c.inc
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210525150706.294968-1-richard.henderson@linaro.org>
 <20210525150706.294968-3-richard.henderson@linaro.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <2d11ded2-c630-fc0a-cfc1-8ceef6686362@redhat.com>
Date: Wed, 26 May 2021 15:34:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210525150706.294968-3-richard.henderson@linaro.org>
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
> Rename to parts$N_sint_to_float.
> Reimplement int{32,64}_to_float128 with FloatParts128.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   fpu/softfloat.c           | 136 +++++++++++---------------------------
>   fpu/softfloat-parts.c.inc |  32 +++++++++
>   2 files changed, 70 insertions(+), 98 deletions(-)
> 
> diff --git a/fpu/softfloat.c b/fpu/softfloat.c
> index 3181678ea9..6404a2997f 100644
> --- a/fpu/softfloat.c
> +++ b/fpu/softfloat.c
> @@ -849,6 +849,14 @@ static uint64_t parts128_float_to_uint(FloatParts128 *p, FloatRoundMode rmode,
>   #define parts_float_to_uint(P, R, Z, M, S) \
>       PARTS_GENERIC_64_128(float_to_uint, P)(P, R, Z, M, S)
>   
> +static void parts64_sint_to_float(FloatParts64 *p, int64_t a,
> +                                  int scale, float_status *s);
> +static void parts128_sint_to_float(FloatParts128 *p, int64_t a,
> +                                   int scale, float_status *s);
> +
> +#define parts_sint_to_float(P, I, Z, S) \
> +    PARTS_GENERIC_64_128(sint_to_float, P)(P, I, Z, S)
> +
>   /*
>    * Helper functions for softfloat-parts.c.inc, per-size operations.
>    */
> @@ -2940,42 +2948,15 @@ uint64_t bfloat16_to_uint64_round_to_zero(bfloat16 a, float_status *s)
>   }
>   
>   /*
> - * Integer to float conversions
> - *
> - * Returns the result of converting the two's complement integer `a'
> - * to the floating-point format. The conversion is performed according
> - * to the IEC/IEEE Standard for Binary Floating-Point Arithmetic.
> + * Signed integer to floating-point conversions
>    */
>   
> -static FloatParts64 int_to_float(int64_t a, int scale, float_status *status)
> -{
> -    FloatParts64 r = { .sign = false };
> -
> -    if (a == 0) {
> -        r.cls = float_class_zero;
> -    } else {
> -        uint64_t f = a;
> -        int shift;
> -
> -        r.cls = float_class_normal;
> -        if (a < 0) {
> -            f = -f;
> -            r.sign = true;
> -        }
> -        shift = clz64(f);
> -        scale = MIN(MAX(scale, -0x10000), 0x10000);
> -
> -        r.exp = DECOMPOSED_BINARY_POINT - shift + scale;
> -        r.frac = f << shift;
> -    }
> -
> -    return r;
> -}
> -
>   float16 int64_to_float16_scalbn(int64_t a, int scale, float_status *status)
>   {
> -    FloatParts64 pa = int_to_float(a, scale, status);
> -    return float16_round_pack_canonical(&pa, status);
> +    FloatParts64 p;
> +
> +    parts_sint_to_float(&p, a, scale, status);
> +    return float16_round_pack_canonical(&p, status);
>   }
>   
>   float16 int32_to_float16_scalbn(int32_t a, int scale, float_status *status)
> @@ -3010,8 +2991,10 @@ float16 int8_to_float16(int8_t a, float_status *status)
>   
>   float32 int64_to_float32_scalbn(int64_t a, int scale, float_status *status)
>   {
> -    FloatParts64 pa = int_to_float(a, scale, status);
> -    return float32_round_pack_canonical(&pa, status);
> +    FloatParts64 p;
> +
> +    parts64_sint_to_float(&p, a, scale, status);
> +    return float32_round_pack_canonical(&p, status);
>   }
>   
>   float32 int32_to_float32_scalbn(int32_t a, int scale, float_status *status)
> @@ -3041,8 +3024,10 @@ float32 int16_to_float32(int16_t a, float_status *status)
>   
>   float64 int64_to_float64_scalbn(int64_t a, int scale, float_status *status)
>   {
> -    FloatParts64 pa = int_to_float(a, scale, status);
> -    return float64_round_pack_canonical(&pa, status);
> +    FloatParts64 p;
> +
> +    parts_sint_to_float(&p, a, scale, status);
> +    return float64_round_pack_canonical(&p, status);
>   }
>   
>   float64 int32_to_float64_scalbn(int32_t a, int scale, float_status *status)
> @@ -3070,15 +3055,12 @@ float64 int16_to_float64(int16_t a, float_status *status)
>       return int64_to_float64_scalbn(a, 0, status);
>   }
>   
> -/*
> - * Returns the result of converting the two's complement integer `a'
> - * to the bfloat16 format.
> - */
> -
>   bfloat16 int64_to_bfloat16_scalbn(int64_t a, int scale, float_status *status)
>   {
> -    FloatParts64 pa = int_to_float(a, scale, status);
> -    return bfloat16_round_pack_canonical(&pa, status);
> +    FloatParts64 p;
> +
> +    parts_sint_to_float(&p, a, scale, status);
> +    return bfloat16_round_pack_canonical(&p, status);
>   }
>   
>   bfloat16 int32_to_bfloat16_scalbn(int32_t a, int scale, float_status *status)
> @@ -3106,6 +3088,19 @@ bfloat16 int16_to_bfloat16(int16_t a, float_status *status)
>       return int64_to_bfloat16_scalbn(a, 0, status);
>   }
>   
> +float128 int64_to_float128(int64_t a, float_status *status)
> +{
> +    FloatParts128 p;
> +
> +    parts_sint_to_float(&p, a, 0, status);
> +    return float128_round_pack_canonical(&p, status);
> +}
> +
> +float128 int32_to_float128(int32_t a, float_status *status)
> +{
> +    return int64_to_float128(a, status);
> +}
> +
>   /*
>    * Unsigned Integer to float conversions
>    *
> @@ -4956,28 +4951,6 @@ floatx80 int32_to_floatx80(int32_t a, float_status *status)
>   
>   }
>   
> -/*----------------------------------------------------------------------------
> -| Returns the result of converting the 32-bit two's complement integer `a' to
> -| the quadruple-precision floating-point format.  The conversion is performed
> -| according to the IEC/IEEE Standard for Binary Floating-Point Arithmetic.
> -*----------------------------------------------------------------------------*/
> -
> -float128 int32_to_float128(int32_t a, float_status *status)
> -{
> -    bool zSign;
> -    uint32_t absA;
> -    int8_t shiftCount;
> -    uint64_t zSig0;
> -
> -    if ( a == 0 ) return packFloat128( 0, 0, 0, 0 );
> -    zSign = ( a < 0 );
> -    absA = zSign ? - a : a;
> -    shiftCount = clz32(absA) + 17;
> -    zSig0 = absA;
> -    return packFloat128( zSign, 0x402E - shiftCount, zSig0<<shiftCount, 0 );
> -
> -}
> -
>   /*----------------------------------------------------------------------------
>   | Returns the result of converting the 64-bit two's complement integer `a'
>   | to the extended double-precision floating-point format.  The conversion
> @@ -4999,39 +4972,6 @@ floatx80 int64_to_floatx80(int64_t a, float_status *status)
>   
>   }
>   
> -/*----------------------------------------------------------------------------
> -| Returns the result of converting the 64-bit two's complement integer `a' to
> -| the quadruple-precision floating-point format.  The conversion is performed
> -| according to the IEC/IEEE Standard for Binary Floating-Point Arithmetic.
> -*----------------------------------------------------------------------------*/
> -
> -float128 int64_to_float128(int64_t a, float_status *status)
> -{
> -    bool zSign;
> -    uint64_t absA;
> -    int8_t shiftCount;
> -    int32_t zExp;
> -    uint64_t zSig0, zSig1;
> -
> -    if ( a == 0 ) return packFloat128( 0, 0, 0, 0 );
> -    zSign = ( a < 0 );
> -    absA = zSign ? - a : a;
> -    shiftCount = clz64(absA) + 49;
> -    zExp = 0x406E - shiftCount;
> -    if ( 64 <= shiftCount ) {
> -        zSig1 = 0;
> -        zSig0 = absA;
> -        shiftCount -= 64;
> -    }
> -    else {
> -        zSig1 = absA;
> -        zSig0 = 0;
> -    }
> -    shortShift128Left( zSig0, zSig1, shiftCount, &zSig0, &zSig1 );
> -    return packFloat128( zSign, zExp, zSig0, zSig1 );
> -
> -}
> -
>   /*----------------------------------------------------------------------------
>   | Returns the result of converting the 64-bit unsigned integer `a'
>   | to the quadruple-precision floating-point format.  The conversion is performed
> diff --git a/fpu/softfloat-parts.c.inc b/fpu/softfloat-parts.c.inc
> index c6e327547f..8102de1307 100644
> --- a/fpu/softfloat-parts.c.inc
> +++ b/fpu/softfloat-parts.c.inc
> @@ -881,3 +881,35 @@ static uint64_t partsN(float_to_uint)(FloatPartsN *p, FloatRoundMode rmode,
>       float_raise(flags, s);
>       return r;
>   }
> +
> +/*
> + * Integer to float conversions
> + *
> + * Returns the result of converting the two's complement integer `a'
> + * to the floating-point format. The conversion is performed according
> + * to the IEC/IEEE Standard for Binary Floating-Point Arithmetic.
> + */
> +static void partsN(sint_to_float)(FloatPartsN *p, int64_t a,
> +                                  int scale, float_status *s)
> +{
> +    uint64_t f = a;
> +    int shift;
> +
> +    memset(p, 0, sizeof(*p));
> +
> +    if (a == 0) {
> +        p->cls = float_class_zero;
> +        return;
> +    }
> +
> +    p->cls = float_class_normal;
> +    if (a < 0) {
> +        f = -f;
> +        p->sign = true;
> +    }
> +    shift = clz64(f);
> +    scale = MIN(MAX(scale, -0x10000), 0x10000);
> +
> +    p->exp = DECOMPOSED_BINARY_POINT - shift + scale;
> +    p->frac_hi = f << shift;
> +}
> 

LGTM

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


