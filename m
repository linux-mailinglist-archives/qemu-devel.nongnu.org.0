Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A851737D278
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 20:12:30 +0200 (CEST)
Received: from localhost ([::1]:44216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgtLR-0003aT-AA
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 14:12:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lgtJb-00024o-VC
 for qemu-devel@nongnu.org; Wed, 12 May 2021 14:10:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60696)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lgtJY-0006d7-2T
 for qemu-devel@nongnu.org; Wed, 12 May 2021 14:10:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620843029;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8CK8fkxTiAUjb3kTQuvjHGy00mbkY7hALcRRcxVTQb4=;
 b=ECGVUW8UIzY5At23uf982hh0Yh4vsXVQaPT3UCCetKTQbWpjBMqbMtT8wuS05viH9QqfgG
 DjVoE0DhEfUHfCL7WLFA33/MRgWLI+jAtIcgj7t4XTBRQJcCYnuopSHzRLsbE3gjAKn3Vm
 rNMKUJ1hZ3lBhlFWnZdHSFZFQL8F39w=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-273-K7kIR5_eM0KwgeEYMQU-VQ-1; Wed, 12 May 2021 14:10:28 -0400
X-MC-Unique: K7kIR5_eM0KwgeEYMQU-VQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 i19-20020a05640242d3b0290388cea34ed3so13262496edc.15
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 11:10:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=8CK8fkxTiAUjb3kTQuvjHGy00mbkY7hALcRRcxVTQb4=;
 b=YE9DC5bMfALpoZ0Y4WIKRCs3I8j9ABzQhXvO9sLQzE6tMaZztciiWi0e01jDHR5Paa
 IjwaQ3zOStBMlSHU4WVGAjn1j9RB1F8nRIAwateq0OfxP9RCpeCgNEOTw1aD9otBjaTx
 Z9TODmJGXb6DaoD5/QQNR7ybhJ4KsFUcsBnJ5Wz9ekg6XeFEKoZng3ySkXQ4QylzdUyS
 ndTf5OgtJABfxSYVkYCesrMr3BJOggidB/YJLILjZr0nxjarKznRq9El2mE6VIVgxMDO
 ieMgy1a+Z0nUD9L69aF7R7L7d5i4Q/8buwt0GbUWC3tr+ihfPYBMpnaXu+JfrKNcY0Mv
 odbw==
X-Gm-Message-State: AOAM5312QzNvENQ1UBL4bmOaF5cSsE0qHOZw9AhC/DJ3BfFqtLYt7U2x
 GwKaaKQhi8OrHoiPM7MmHd6+YTvOaMmsJKOt1sKAlkwtsl8CzkgUt6LtqukHer+b9BM9nI/wEtj
 ZXthb61UNm25Cjkw=
X-Received: by 2002:a17:906:a055:: with SMTP id
 bg21mr38764147ejb.554.1620843026878; 
 Wed, 12 May 2021 11:10:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy0ERRkkc2WkeBB12I5LMakbjAJcl9GkgDbdRpYyKNh4nBrU44/DjtTu3D2e3vs6n4oowxqDA==
X-Received: by 2002:a17:906:a055:: with SMTP id
 bg21mr38764126ejb.554.1620843026525; 
 Wed, 12 May 2021 11:10:26 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c65ab.dip0.t-ipconnect.de. [91.12.101.171])
 by smtp.gmail.com with ESMTPSA id g11sm404996edt.85.2021.05.12.11.10.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 May 2021 11:10:26 -0700 (PDT)
Subject: Re: [PATCH 28/72] softfloat: Move return_nan to softfloat-parts.c.inc
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210508014802.892561-1-richard.henderson@linaro.org>
 <20210508014802.892561-29-richard.henderson@linaro.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <760af95e-5924-92ea-fa7c-40e3eeda8b3f@redhat.com>
Date: Wed, 12 May 2021 20:10:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210508014802.892561-29-richard.henderson@linaro.org>
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
> At the same time, convert to pointers, rename to return_nan$N
> and define a macro for return_nan using QEMU_GENERIC.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   fpu/softfloat.c           | 45 ++++++++++++++++++++++-----------------
>   fpu/softfloat-parts.c.inc | 37 ++++++++++++++++++++++++++++++++
>   2 files changed, 62 insertions(+), 20 deletions(-)
>   create mode 100644 fpu/softfloat-parts.c.inc
> 
> diff --git a/fpu/softfloat.c b/fpu/softfloat.c
> index 6d5392aeab..5b26696078 100644
> --- a/fpu/softfloat.c
> +++ b/fpu/softfloat.c
> @@ -708,6 +708,10 @@ static float128 float128_pack_raw(const FloatParts128 *p)
>   #define parts_default_nan(P, S)    PARTS_GENERIC_64_128(default_nan, P)(P, S)
>   #define parts_silence_nan(P, S)    PARTS_GENERIC_64_128(silence_nan, P)(P, S)
>   
> +static void parts64_return_nan(FloatParts64 *a, float_status *s);
> +static void parts128_return_nan(FloatParts128 *a, float_status *s);
> +
> +#define parts_return_nan(P, S)     PARTS_GENERIC_64_128(return_nan, P)(P, S)
>   
>   /*
>    * Helper functions for softfloat-parts.c.inc, per-size operations.
> @@ -914,22 +918,6 @@ static FloatParts64 round_canonical(FloatParts64 p, float_status *s,
>       return p;
>   }
>   
> -static FloatParts64 return_nan(FloatParts64 a, float_status *s)
> -{
> -    g_assert(is_nan(a.cls));
> -    if (is_snan(a.cls)) {
> -        float_raise(float_flag_invalid, s);
> -        if (!s->default_nan_mode) {
> -            parts_silence_nan(&a, s);
> -            return a;
> -        }
> -    } else if (!s->default_nan_mode) {
> -        return a;
> -    }
> -    parts_default_nan(&a, s);
> -    return a;
> -}
> -
>   static FloatParts64 pick_nan(FloatParts64 a, FloatParts64 b, float_status *s)
>   {
>       if (is_snan(a.cls) || is_snan(b.cls)) {
> @@ -991,6 +979,21 @@ static FloatParts64 pick_nan_muladd(FloatParts64 a, FloatParts64 b, FloatParts64
>       return a;
>   }
>   
> +#define partsN(NAME)   parts64_##NAME
> +#define FloatPartsN    FloatParts64
> +
> +#include "softfloat-parts.c.inc"
> +
> +#undef  partsN
> +#undef  FloatPartsN
> +#define partsN(NAME)   parts128_##NAME
> +#define FloatPartsN    FloatParts128
> +
> +#include "softfloat-parts.c.inc"
> +
> +#undef  partsN
> +#undef  FloatPartsN
> +
>   /*
>    * Pack/unpack routines with a specific FloatFmt.
>    */
> @@ -2065,7 +2068,7 @@ static FloatParts64 float_to_float(FloatParts64 a, const FloatFmt *dstf,
>               break;
>           }
>       } else if (is_nan(a.cls)) {
> -        return return_nan(a, s);
> +        parts_return_nan(&a, s);
>       }
>       return a;
>   }
> @@ -2194,7 +2197,8 @@ static FloatParts64 round_to_int(FloatParts64 a, FloatRoundMode rmode,
>       switch (a.cls) {
>       case float_class_qnan:
>       case float_class_snan:
> -        return return_nan(a, s);
> +        parts_return_nan(&a, s);
> +        break;
>   
>       case float_class_zero:
>       case float_class_inf:
> @@ -3590,7 +3594,7 @@ FloatRelation bfloat16_compare_quiet(bfloat16 a, bfloat16 b, float_status *s)
>   static FloatParts64 scalbn_decomposed(FloatParts64 a, int n, float_status *s)
>   {
>       if (unlikely(is_nan(a.cls))) {
> -        return return_nan(a, s);
> +        parts_return_nan(&a, s);
>       }
>       if (a.cls == float_class_normal) {
>           /* The largest float type (even though not supported by FloatParts64)
> @@ -3658,7 +3662,8 @@ static FloatParts64 sqrt_float(FloatParts64 a, float_status *s, const FloatFmt *
>       int bit, last_bit;
>   
>       if (is_nan(a.cls)) {
> -        return return_nan(a, s);
> +        parts_return_nan(&a, s);
> +        return a;
>       }
>       if (a.cls == float_class_zero) {
>           return a;  /* sqrt(+-0) = +-0 */
> diff --git a/fpu/softfloat-parts.c.inc b/fpu/softfloat-parts.c.inc
> new file mode 100644
> index 0000000000..2a3075d6fe
> --- /dev/null
> +++ b/fpu/softfloat-parts.c.inc
> @@ -0,0 +1,37 @@
> +/*
> + * QEMU float support
> + *
> + * The code in this source file is derived from release 2a of the SoftFloat
> + * IEC/IEEE Floating-point Arithmetic Package. Those parts of the code (and
> + * some later contributions) are provided under that license, as detailed below.
> + * It has subsequently been modified by contributors to the QEMU Project,
> + * so some portions are provided under:
> + *  the SoftFloat-2a license
> + *  the BSD license
> + *  GPL-v2-or-later
> + *
> + * Any future contributions to this file after December 1st 2014 will be
> + * taken to be licensed under the Softfloat-2a license unless specifically
> + * indicated otherwise.
> + */
> +
> +static void partsN(return_nan)(FloatPartsN *a, float_status *s)
> +{
> +    switch (a->cls) {
> +    case float_class_snan:
> +        float_raise(float_flag_invalid, s);
> +        if (s->default_nan_mode) {
> +            parts_default_nan(a, s);
> +        } else {
> +            parts_silence_nan(a, s);
> +        }
> +        break;
> +    case float_class_qnan:
> +        if (s->default_nan_mode) {
> +            parts_default_nan(a, s);
> +        }
> +        break;
> +    default:
> +        g_assert_not_reached();
> +    }
> +}
> 

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


