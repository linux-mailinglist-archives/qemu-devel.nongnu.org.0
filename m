Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 620723918FB
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 15:37:27 +0200 (CEST)
Received: from localhost ([::1]:36640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lltiw-0008FM-Ft
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 09:37:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1llti9-0007Wb-21
 for qemu-devel@nongnu.org; Wed, 26 May 2021 09:36:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1llti7-0001h0-38
 for qemu-devel@nongnu.org; Wed, 26 May 2021 09:36:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622036194;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TAqDTLYAFry01vJMILM0vfCoJm887klNyNgJU7lGEok=;
 b=V5f/3uS9mTUcSKc3MdZHBmW84TCPyVQhBpyMEiCgnz67sQGK7VftMT1TKBLzZZQys7s+uQ
 cEzpsJkuSvdswMocHHbuQzJod0MGfTZEYD3N32KTfbqQtNWeLcYofYjHYEFtLQIHDzxoaY
 TgBrbhnd7J8FFPZKHQnW0xVwTI/ftyw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-455-Tf2bkhKGPXmvqFgd6yHnrA-1; Wed, 26 May 2021 09:36:31 -0400
X-MC-Unique: Tf2bkhKGPXmvqFgd6yHnrA-1
Received: by mail-wr1-f69.google.com with SMTP id
 h22-20020adfa4d60000b029011244156c68so396815wrb.13
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 06:36:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=TAqDTLYAFry01vJMILM0vfCoJm887klNyNgJU7lGEok=;
 b=dFmvG01120VThUar3wkT3QNwwtOw1s9/67RmZSzPiFnHGX/cGrqcsP7BCBRJ89A/ML
 INmlTEPmjvWTSFR/tQNcOe7Tda0n0KohmWWh31keFXVzYUmGS/aFC0BlriSPHZLu/ycO
 vfDc37/SwNMCtEK82OyXFHg7mu4t1IZTjcoPLFQK4Jv1SGHYJABgD+IKQ8609SNtXeid
 LWmQs0eUuCMnlXS1A5C3VVBo5XR44uidlPYqHNSuHOIBYr06NVsgy6y5iPkhdRWUpWOD
 HmbHeNK2rN8H06kCGiteQav9suA8E/YmuGDGptR6vQjjqsvz7amsbE9s3ukJPD7acoNq
 5ZAw==
X-Gm-Message-State: AOAM532vCp4HcphUmsaIuOEE4szRGI5FLmRa8kBAeCSfLo87VwIi6Fkg
 rKG/7+qU+xpG1A/nklgHcszd418dpn8QxrbqQZw/ccnVFdnB/O4BXWQBYVDYjhg+cUU9OPdL4sZ
 3NuYF8RFpFe3xx+g=
X-Received: by 2002:a05:600c:4f8b:: with SMTP id
 n11mr29121759wmq.180.1622036189818; 
 Wed, 26 May 2021 06:36:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwWKN1RqT1J+G6ashXB3z4unN9xG8rRzEeKvjrTH9jxS1zTvplrAHeZAfIsLy/VWvrnRzVIBA==
X-Received: by 2002:a05:600c:4f8b:: with SMTP id
 n11mr29121725wmq.180.1622036189438; 
 Wed, 26 May 2021 06:36:29 -0700 (PDT)
Received: from ?IPv6:2003:d8:2f38:2400:62f4:c5fa:ba13:ac32?
 (p200300d82f38240062f4c5faba13ac32.dip0.t-ipconnect.de.
 [2003:d8:2f38:2400:62f4:c5fa:ba13:ac32])
 by smtp.gmail.com with ESMTPSA id v3sm20607879wrr.19.2021.05.26.06.36.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 May 2021 06:36:29 -0700 (PDT)
Subject: Re: [PATCH v2 03/28] softfloat: Move uint_to_float to
 softfloat-parts.c.inc
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210525150706.294968-1-richard.henderson@linaro.org>
 <20210525150706.294968-4-richard.henderson@linaro.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <0e64bd09-0662-38a9-d29a-67db76afdc99@redhat.com>
Date: Wed, 26 May 2021 15:36:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210525150706.294968-4-richard.henderson@linaro.org>
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
> Rename to parts$N_uint_to_float.
> Reimplement uint64_to_float128 with FloatParts128.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   fpu/softfloat.c           | 83 ++++++++++++++++-----------------------
>   fpu/softfloat-parts.c.inc | 23 +++++++++++
>   2 files changed, 56 insertions(+), 50 deletions(-)
> 
> diff --git a/fpu/softfloat.c b/fpu/softfloat.c
> index 6404a2997f..db14bd09aa 100644
> --- a/fpu/softfloat.c
> +++ b/fpu/softfloat.c
> @@ -857,6 +857,14 @@ static void parts128_sint_to_float(FloatParts128 *p, int64_t a,
>   #define parts_sint_to_float(P, I, Z, S) \
>       PARTS_GENERIC_64_128(sint_to_float, P)(P, I, Z, S)
>   
> +static void parts64_uint_to_float(FloatParts64 *p, uint64_t a,
> +                                  int scale, float_status *s);
> +static void parts128_uint_to_float(FloatParts128 *p, uint64_t a,
> +                                   int scale, float_status *s);
> +
> +#define parts_uint_to_float(P, I, Z, S) \
> +    PARTS_GENERIC_64_128(uint_to_float, P)(P, I, Z, S)
> +
>   /*
>    * Helper functions for softfloat-parts.c.inc, per-size operations.
>    */
> @@ -3102,35 +3110,15 @@ float128 int32_to_float128(int32_t a, float_status *status)
>   }
>   
>   /*
> - * Unsigned Integer to float conversions
> - *
> - * Returns the result of converting the unsigned integer `a' to the
> - * floating-point format. The conversion is performed according to the
> - * IEC/IEEE Standard for Binary Floating-Point Arithmetic.
> + * Unsigned Integer to floating-point conversions
>    */
>   
> -static FloatParts64 uint_to_float(uint64_t a, int scale, float_status *status)
> -{
> -    FloatParts64 r = { .sign = false };
> -    int shift;
> -
> -    if (a == 0) {
> -        r.cls = float_class_zero;
> -    } else {
> -        scale = MIN(MAX(scale, -0x10000), 0x10000);
> -        shift = clz64(a);
> -        r.cls = float_class_normal;
> -        r.exp = DECOMPOSED_BINARY_POINT - shift + scale;
> -        r.frac = a << shift;
> -    }
> -
> -    return r;
> -}
> -
>   float16 uint64_to_float16_scalbn(uint64_t a, int scale, float_status *status)
>   {
> -    FloatParts64 pa = uint_to_float(a, scale, status);
> -    return float16_round_pack_canonical(&pa, status);
> +    FloatParts64 p;
> +
> +    parts_uint_to_float(&p, a, scale, status);
> +    return float16_round_pack_canonical(&p, status);
>   }
>   
>   float16 uint32_to_float16_scalbn(uint32_t a, int scale, float_status *status)
> @@ -3165,8 +3153,10 @@ float16 uint8_to_float16(uint8_t a, float_status *status)
>   
>   float32 uint64_to_float32_scalbn(uint64_t a, int scale, float_status *status)
>   {
> -    FloatParts64 pa = uint_to_float(a, scale, status);
> -    return float32_round_pack_canonical(&pa, status);
> +    FloatParts64 p;
> +
> +    parts_uint_to_float(&p, a, scale, status);
> +    return float32_round_pack_canonical(&p, status);
>   }
>   
>   float32 uint32_to_float32_scalbn(uint32_t a, int scale, float_status *status)
> @@ -3196,8 +3186,10 @@ float32 uint16_to_float32(uint16_t a, float_status *status)
>   
>   float64 uint64_to_float64_scalbn(uint64_t a, int scale, float_status *status)
>   {
> -    FloatParts64 pa = uint_to_float(a, scale, status);
> -    return float64_round_pack_canonical(&pa, status);
> +    FloatParts64 p;
> +
> +    parts_uint_to_float(&p, a, scale, status);
> +    return float64_round_pack_canonical(&p, status);
>   }
>   
>   float64 uint32_to_float64_scalbn(uint32_t a, int scale, float_status *status)
> @@ -3225,15 +3217,12 @@ float64 uint16_to_float64(uint16_t a, float_status *status)
>       return uint64_to_float64_scalbn(a, 0, status);
>   }
>   
> -/*
> - * Returns the result of converting the unsigned integer `a' to the
> - * bfloat16 format.
> - */
> -
>   bfloat16 uint64_to_bfloat16_scalbn(uint64_t a, int scale, float_status *status)
>   {
> -    FloatParts64 pa = uint_to_float(a, scale, status);
> -    return bfloat16_round_pack_canonical(&pa, status);
> +    FloatParts64 p;
> +
> +    parts_uint_to_float(&p, a, scale, status);
> +    return bfloat16_round_pack_canonical(&p, status);
>   }
>   
>   bfloat16 uint32_to_bfloat16_scalbn(uint32_t a, int scale, float_status *status)
> @@ -3261,6 +3250,14 @@ bfloat16 uint16_to_bfloat16(uint16_t a, float_status *status)
>       return uint64_to_bfloat16_scalbn(a, 0, status);
>   }
>   
> +float128 uint64_to_float128(uint64_t a, float_status *status)
> +{
> +    FloatParts128 p;
> +
> +    parts_uint_to_float(&p, a, 0, status);
> +    return float128_round_pack_canonical(&p, status);
> +}
> +
>   /* Float Min/Max */
>   /* min() and max() functions. These can't be implemented as
>    * 'compare and pick one input' because that would mishandle
> @@ -4972,20 +4969,6 @@ floatx80 int64_to_floatx80(int64_t a, float_status *status)
>   
>   }
>   
> -/*----------------------------------------------------------------------------
> -| Returns the result of converting the 64-bit unsigned integer `a'
> -| to the quadruple-precision floating-point format.  The conversion is performed
> -| according to the IEC/IEEE Standard for Binary Floating-Point Arithmetic.
> -*----------------------------------------------------------------------------*/
> -
> -float128 uint64_to_float128(uint64_t a, float_status *status)
> -{
> -    if (a == 0) {
> -        return float128_zero;
> -    }
> -    return normalizeRoundAndPackFloat128(0, 0x406E, 0, a, status);
> -}
> -
>   /*----------------------------------------------------------------------------
>   | Returns the result of converting the single-precision floating-point value
>   | `a' to the extended double-precision floating-point format.  The conversion
> diff --git a/fpu/softfloat-parts.c.inc b/fpu/softfloat-parts.c.inc
> index 8102de1307..f3c4f8c8d2 100644
> --- a/fpu/softfloat-parts.c.inc
> +++ b/fpu/softfloat-parts.c.inc
> @@ -913,3 +913,26 @@ static void partsN(sint_to_float)(FloatPartsN *p, int64_t a,
>       p->exp = DECOMPOSED_BINARY_POINT - shift + scale;
>       p->frac_hi = f << shift;
>   }
> +
> +/*
> + * Unsigned Integer to float conversions
> + *
> + * Returns the result of converting the unsigned integer `a' to the
> + * floating-point format. The conversion is performed according to the
> + * IEC/IEEE Standard for Binary Floating-Point Arithmetic.
> + */
> +static void partsN(uint_to_float)(FloatPartsN *p, uint64_t a,
> +                                  int scale, float_status *status)
> +{
> +    memset(p, 0, sizeof(*p));
> +
> +    if (a == 0) {
> +        p->cls = float_class_zero;
> +    } else {
> +        int shift = clz64(a);
> +        scale = MIN(MAX(scale, -0x10000), 0x10000);
> +        p->cls = float_class_normal;
> +        p->exp = DECOMPOSED_BINARY_POINT - shift + scale;
> +        p->frac_hi = a << shift;
> +    }
> +}
> 

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


