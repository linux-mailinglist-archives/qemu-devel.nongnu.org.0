Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6EE4382E12
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 15:58:21 +0200 (CEST)
Received: from localhost ([::1]:57456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lidlE-0001Ma-9b
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 09:58:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lidkK-0000Pm-Fo
 for qemu-devel@nongnu.org; Mon, 17 May 2021 09:57:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lidkH-0003Vo-AH
 for qemu-devel@nongnu.org; Mon, 17 May 2021 09:57:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621259839;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DlARMlx+YqhX0UK5hmPM6odQtSKDB3fSHQaE86/eEY4=;
 b=A6TmjfEVkrl4G1YOIhXDWLnGFqi0Oj+GfS+WJgcRhJHykIJvtx0uAstOUnvdElq9hjKDz1
 R5srcREo9Hy7jbXcOMKt0Kf/zfFkIDheaESkObF3A+1rzjhQK2GzWM+NAEdfpSyWX487Od
 UbxO4D80Xj2E5T/853KYEtOtYQrPbPk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-432-wWVOGv4PMMW1Pn1YjMpHyQ-1; Mon, 17 May 2021 09:57:17 -0400
X-MC-Unique: wWVOGv4PMMW1Pn1YjMpHyQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 x7-20020a7bc2070000b0290149dcabfd85so1429214wmi.8
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 06:57:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=DlARMlx+YqhX0UK5hmPM6odQtSKDB3fSHQaE86/eEY4=;
 b=CFE7paTAmYQqXBE7b9QANY0fWo/saonHQc01/bmerSHrkPVBpKCjvP49TQrIwVzU3q
 +Qr791I6s5U/UJ5FNam9HpS/Wgu5t6BJP8Eehqv+gCiJd7ZYAKzcuU1L71e9LLXTpgBM
 SVnhggTzzvlbDWGnUNrp51837K8g5iRJWCj6ESKyz6VctgVwlN1f9Y9iix4Bo+RmXwlC
 9xiNw5fczToAkvOM20/d2h5iN/sJQFH/k3O0AE/JRNGQ/lFGxgTpigARjCfBOgIrkaJ7
 5TlH/3NGCOXvUso1Pao3X1IY882ZS82fqIJSYqDgfCQgK+WmWbW3NDTW+WsLiBDdhoFk
 YKuQ==
X-Gm-Message-State: AOAM531gzg/Kj07RJEMY8RePEo0rcJxb6HcqO38tU/JyPGYLjFu7bt38
 EpReGBNixQEKoVxvfCe5YKxbV6Z2A/Pk1jNQ7oliu+i7UsBTFevQg/EFWjtNhaJTz8AdCuZvBn3
 A4YSpWXogJLeW124=
X-Received: by 2002:a1c:6a0c:: with SMTP id f12mr82068wmc.122.1621259836311;
 Mon, 17 May 2021 06:57:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy85+X8JXO8/IB/AIWeT5thNjxvjWDCIHb5HvVBEw3z7176XLjRtMtWU5/1M7KNQ+Z9aFpxbg==
X-Received: by 2002:a1c:6a0c:: with SMTP id f12mr82036wmc.122.1621259836053;
 Mon, 17 May 2021 06:57:16 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6833.dip0.t-ipconnect.de. [91.12.104.51])
 by smtp.gmail.com with ESMTPSA id
 d3sm17980794wri.75.2021.05.17.06.57.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 May 2021 06:57:15 -0700 (PDT)
Subject: Re: [PATCH v1] softfloat: Silence signaling NaN when converting
 to/from float128
To: qemu-devel@nongnu.org
References: <20210505104952.5632-1-david@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <342fd8ed-2218-8bd6-4e78-8480b4e3680e@redhat.com>
Date: Mon, 17 May 2021 15:57:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210505104952.5632-1-david@redhat.com>
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05.05.21 12:49, David Hildenbrand wrote:
> We forgot to silence the NaN, just as we already do for the other
> conversions.
> 
> Found by comparing the result of running randomly generated FP instructions
> under s390x/tcg and comparing against the result on real HW.
> 
> Unfortunately, test cases like f32_to_f128 cannot be unlocked yet as
> some expected values (with NaN) are wrongly calculated.
> 
> Cc: Aurelien Jarno <aurelien@aurel32.net>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: "Alex Bennée" <alex.bennee@linaro.org>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>   fpu/softfloat.c | 16 ++++++++++++----
>   1 file changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/fpu/softfloat.c b/fpu/softfloat.c
> index 67cfa0fd82..e9f2117a6d 100644
> --- a/fpu/softfloat.c
> +++ b/fpu/softfloat.c
> @@ -4924,7 +4924,9 @@ float128 float32_to_float128(float32 a, float_status *status)
>       aSign = extractFloat32Sign( a );
>       if ( aExp == 0xFF ) {
>           if (aSig) {
> -            return commonNaNToFloat128(float32ToCommonNaN(a, status), status);
> +            float128 res = commonNaNToFloat128(float32ToCommonNaN(a, status),
> +                                               status);
> +            return float128_silence_nan(res, status);
>           }
>           return packFloat128( aSign, 0x7FFF, 0, 0 );
>       }
> @@ -5229,7 +5231,9 @@ float128 float64_to_float128(float64 a, float_status *status)
>       aSign = extractFloat64Sign( a );
>       if ( aExp == 0x7FF ) {
>           if (aSig) {
> -            return commonNaNToFloat128(float64ToCommonNaN(a, status), status);
> +            float128 res = commonNaNToFloat128(float64ToCommonNaN(a, status),
> +                                               status);
> +            return float128_silence_nan(res, status);
>           }
>           return packFloat128( aSign, 0x7FFF, 0, 0 );
>       }
> @@ -6665,7 +6669,9 @@ float32 float128_to_float32(float128 a, float_status *status)
>       aSign = extractFloat128Sign( a );
>       if ( aExp == 0x7FFF ) {
>           if ( aSig0 | aSig1 ) {
> -            return commonNaNToFloat32(float128ToCommonNaN(a, status), status);
> +            float32 res = commonNaNToFloat32(float128ToCommonNaN(a, status),
> +                                             status);
> +            return float32_silence_nan(res, status);
>           }
>           return packFloat32( aSign, 0xFF, 0 );
>       }
> @@ -6699,7 +6705,9 @@ float64 float128_to_float64(float128 a, float_status *status)
>       aSign = extractFloat128Sign( a );
>       if ( aExp == 0x7FFF ) {
>           if ( aSig0 | aSig1 ) {
> -            return commonNaNToFloat64(float128ToCommonNaN(a, status), status);
> +            float64 res = commonNaNToFloat64(float128ToCommonNaN(a, status),
> +                                             status);
> +            return float64_silence_nan(res, status);
>           }
>           return packFloat64( aSign, 0x7FF, 0 );
>       }
> 

This problem is also fixed after Richard's rework:

https://lkml.kernel.org/r/20210508014802.892561-1-richard.henderson@linaro.org

-- 
Thanks,

David / dhildenb


