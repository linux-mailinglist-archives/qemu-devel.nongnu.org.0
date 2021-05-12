Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6769E37D38D
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 20:29:51 +0200 (CEST)
Received: from localhost ([::1]:49988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgtcE-0001pG-9Z
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 14:29:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lgtQt-00056F-20
 for qemu-devel@nongnu.org; Wed, 12 May 2021 14:18:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27358)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lgtQr-0002lh-5x
 for qemu-devel@nongnu.org; Wed, 12 May 2021 14:18:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620843484;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/7NcXz555jLGDeOFv4TUHJUgFt9mi2DyCHniPDNHK0o=;
 b=ThR8wMOn5BNAygh5pFbk10lMHUYaAwHd2GkW/BU92x0S3hdd/O58onnsUOodPFqGAYyeME
 fTlNv7ZBve3oNbmMF8emsuF49EWZ+QKFrKBpFygbpcPT7EaPuH0S46SxAuKV248XsFM/2s
 Fs+YeEfV04B+BmuOZy9USgOOOh8GvVQ=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-524-JUoi3n5zM8WkaOAYfxjHBQ-1; Wed, 12 May 2021 14:18:02 -0400
X-MC-Unique: JUoi3n5zM8WkaOAYfxjHBQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 bm3-20020a0564020b03b0290387c8b79486so13256024edb.20
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 11:18:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=/7NcXz555jLGDeOFv4TUHJUgFt9mi2DyCHniPDNHK0o=;
 b=keWLJ80l24+uYkJ77BwfyW0KnN19f2IJ7pVrTTZtOyMyqRwN6JLCyfA6rw/s/RRUIA
 u33XeUh/zIqBdG1YdhQua3SIsHn1v4B863LhI5FPZe0OddFOil9rwSExbyJ8ruaCM7wG
 /HKVCwCOv6MlgzxPrzl/Q9pk0cKuVtqsxIvrH5a4zhf4zY1BqoouOLpr6msnFYEYeilU
 cSWQARIiFbWYMtYL7Bu8gIB3PZfbj2+NZ/qo9OmFTGAeIeXqpurhymVBWrrdxLsw/5gq
 7nX93ZOyO5KLEcBW0pmQkA1jQvpu8VyD93AdMHGkrHHUX1RG8+FzDv3Pmq0snA5t4NJr
 IZcA==
X-Gm-Message-State: AOAM5320RTSRC0e/lznYt4Tu8Vo6ODf9QKWQkUt0cas1TxSVfgS+j2wR
 oUAeA/w91TwD7KSbtFh7BkCwgLtW9Cxj9o68E0RbrWhUfurS4pfEmKfS5eVsB9hBtvsmHwhnW7S
 HhkYk8ZoaIY/48ck=
X-Received: by 2002:a17:906:9bc2:: with SMTP id
 de2mr8196933ejc.340.1620843481415; 
 Wed, 12 May 2021 11:18:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxX4Ly2HkzGNvBFD6JgIGA0GLTKjzO+GaTxq2tgRwEfV2g1dFGj6MdwrrCci/iq0PFURPqRrQ==
X-Received: by 2002:a17:906:9bc2:: with SMTP id
 de2mr8196915ejc.340.1620843481189; 
 Wed, 12 May 2021 11:18:01 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c65ab.dip0.t-ipconnect.de. [91.12.101.171])
 by smtp.gmail.com with ESMTPSA id y10sm280628ejh.105.2021.05.12.11.18.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 May 2021 11:18:00 -0700 (PDT)
Subject: Re: [PATCH 30/72] softfloat: Move pick_nan_muladd to
 softfloat-parts.c.inc
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210508014802.892561-1-richard.henderson@linaro.org>
 <20210508014802.892561-31-richard.henderson@linaro.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <15c4ae34-4e1d-bede-a0ca-8e8aed49a9ed@redhat.com>
Date: Wed, 12 May 2021 20:18:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210508014802.892561-31-richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
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
> At the same time, convert to pointers, rename to pick_nan_muladd$N
> and define a macro for pick_nan_muladd using QEMU_GENERIC.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   fpu/softfloat.c           | 53 ++++++++++-----------------------------
>   fpu/softfloat-parts.c.inc | 40 +++++++++++++++++++++++++++++
>   2 files changed, 53 insertions(+), 40 deletions(-)
> 
> diff --git a/fpu/softfloat.c b/fpu/softfloat.c
> index 77efaedeaa..40ee294e35 100644
> --- a/fpu/softfloat.c
> +++ b/fpu/softfloat.c
> @@ -720,6 +720,18 @@ static FloatParts128 *parts128_pick_nan(FloatParts128 *a, FloatParts128 *b,
>   
>   #define parts_pick_nan(A, B, S)    PARTS_GENERIC_64_128(pick_nan, A)(A, B, S)
>   
> +static FloatParts64 *parts64_pick_nan_muladd(FloatParts64 *a, FloatParts64 *b,
> +                                             FloatParts64 *c, float_status *s,
> +                                             int ab_mask, int abc_mask);
> +static FloatParts128 *parts128_pick_nan_muladd(FloatParts128 *a,
> +                                               FloatParts128 *b,
> +                                               FloatParts128 *c,
> +                                               float_status *s,
> +                                               int ab_mask, int abc_mask);
> +
> +#define parts_pick_nan_muladd(A, B, C, S, ABM, ABCM) \
> +    PARTS_GENERIC_64_128(pick_nan_muladd, A)(A, B, C, S, ABM, ABCM)
> +
>   /*
>    * Helper functions for softfloat-parts.c.inc, per-size operations.
>    */
> @@ -947,45 +959,6 @@ static FloatParts64 round_canonical(FloatParts64 p, float_status *s,
>       return p;
>   }
>   
> -static FloatParts64 pick_nan_muladd(FloatParts64 a, FloatParts64 b, FloatParts64 c,
> -                                  bool inf_zero, float_status *s)
> -{
> -    int which;
> -
> -    if (is_snan(a.cls) || is_snan(b.cls) || is_snan(c.cls)) {
> -        float_raise(float_flag_invalid, s);
> -    }
> -
> -    which = pickNaNMulAdd(a.cls, b.cls, c.cls, inf_zero, s);
> -
> -    if (s->default_nan_mode) {
> -        /* Note that this check is after pickNaNMulAdd so that function
> -         * has an opportunity to set the Invalid flag.
> -         */
> -        which = 3;
> -    }
> -
> -    switch (which) {
> -    case 0:
> -        break;
> -    case 1:
> -        a = b;
> -        break;
> -    case 2:
> -        a = c;
> -        break;
> -    case 3:
> -        parts_default_nan(&a, s);
> -        break;
> -    default:
> -        g_assert_not_reached();
> -    }
> -
> -    if (is_snan(a.cls)) {
> -        parts_silence_nan(&a, s);
> -    }
> -    return a;
> -}
>   
>   #define partsN(NAME)   parts64_##NAME
>   #define FloatPartsN    FloatParts64
> @@ -1496,7 +1469,7 @@ static FloatParts64 muladd_floats(FloatParts64 a, FloatParts64 b, FloatParts64 c
>        * off to the target-specific pick-a-NaN routine.
>        */
>       if (unlikely(abc_mask & float_cmask_anynan)) {
> -        return pick_nan_muladd(a, b, c, inf_zero, s);
> +        return *parts_pick_nan_muladd(&a, &b, &c, s, ab_mask, abc_mask);
>       }
>   
>       if (inf_zero) {
> diff --git a/fpu/softfloat-parts.c.inc b/fpu/softfloat-parts.c.inc
> index 11a71650f7..a78d61ea07 100644
> --- a/fpu/softfloat-parts.c.inc
> +++ b/fpu/softfloat-parts.c.inc
> @@ -60,3 +60,43 @@ static FloatPartsN *partsN(pick_nan)(FloatPartsN *a, FloatPartsN *b,
>       }
>       return a;
>   }
> +
> +static FloatPartsN *partsN(pick_nan_muladd)(FloatPartsN *a, FloatPartsN *b,
> +                                            FloatPartsN *c, float_status *s,
> +                                            int ab_mask, int abc_mask)
> +{
> +    int which;
> +
> +    if (unlikely(abc_mask & float_cmask_snan)) {
> +        float_raise(float_flag_invalid, s);
> +    }
> +
> +    which = pickNaNMulAdd(a->cls, b->cls, c->cls,
> +                          ab_mask == float_cmask_infzero, s);
> +
> +    if (s->default_nan_mode || which == 3) {
> +        /*
> +         * Note that this check is after pickNaNMulAdd so that function
> +         * has an opportunity to set the Invalid flag for infzero.
> +         */
> +        parts_default_nan(a, s);
> +        return a;
> +    }
> +
> +    switch (which) {
> +    case 0:
> +        break;
> +    case 1:
> +        a = b;
> +        break;
> +    case 2:
> +        a = c;
> +        break;
> +    default:
> +        g_assert_not_reached();
> +    }
> +    if (is_snan(a->cls)) {
> +        parts_silence_nan(a, s);
> +    }
> +    return a;
> +}
> 

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


