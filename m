Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F95037A472
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 12:19:28 +0200 (CEST)
Received: from localhost ([::1]:54760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgPU7-0005bp-4l
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 06:19:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lgPRP-0003hK-3V
 for qemu-devel@nongnu.org; Tue, 11 May 2021 06:16:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34367)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lgPRN-0004X9-Hp
 for qemu-devel@nongnu.org; Tue, 11 May 2021 06:16:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620728196;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=411Hei8yCW/9L68yDGYV+/52o2WqZoCu/aKGWTjUm/4=;
 b=E8YF+yjFx4NeMLCMoMr/16p8gcuzah05cbJIBECOVt7MRzgFZgoUtNea4W+kyrK1dYv0Vi
 hSIjJM81RN5FjFnW2E7RISUmQH38p9vDAPkwhba00zlFiHkgTb6V9H2WTVUisRocupqwaI
 inJwPxffk0b8vwMrFe1k+IGGYLK/erk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-207-6_k2wTDqMc2jW_3RkKYUQQ-1; Tue, 11 May 2021 06:16:35 -0400
X-MC-Unique: 6_k2wTDqMc2jW_3RkKYUQQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 7-20020a05600c2307b02901432673350dso549521wmo.9
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 03:16:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=411Hei8yCW/9L68yDGYV+/52o2WqZoCu/aKGWTjUm/4=;
 b=mAYzNiDnM6qCmc5Wt+K57iqZD5mA2EEusjcO++IIE/MRWBOX6dQOkjqnQMWybwzy0x
 sl8oJJfhyCE2dkhTnEKYNJnKar6/Wrii3yDGQHjAD2h9PSbY86mH9G89RDq/ZJnO/JDY
 c0cz+WxWJkfKlHzlHjaDlOclb7ZSQqKhwuFmCjN3I8NW/0jcBEq/HBCFKplphwTDetGF
 g9uVeJNsGnHAQ6DrhWgzHmdISQ3m+Bx7j8gEkbWFT9QbjkQoZQ7x2GphiujZOtmm7FYX
 P+CFXLAU4dast8ayE6quSgvgrVhdklRrW86wdapowEqJ6l63WK7qw6toDiRTqZbcFzUB
 lIqg==
X-Gm-Message-State: AOAM532ZU6aOE6XaEYv1blHwKdXCrchtPhDzoaMLanBGkjyNqYw3/Ito
 UtDDQUW1hGg3HPLnpcb6D+du472TMjTmfI3QDqLfjhlwRtZvhFc8EblOt40LWTZU1EwVFL2zpbD
 LksjNCklaylww2zw=
X-Received: by 2002:a1c:c5:: with SMTP id 188mr32488952wma.5.1620728193926;
 Tue, 11 May 2021 03:16:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwvt/P7WIoTej/9+AHJRKuzWuEEtX0JnEcLCaU3kzlUvS8I0wtCX6Lwr90F9D6X8tdOD/O1Rg==
X-Received: by 2002:a1c:c5:: with SMTP id 188mr32488920wma.5.1620728193504;
 Tue, 11 May 2021 03:16:33 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6329.dip0.t-ipconnect.de. [91.12.99.41])
 by smtp.gmail.com with ESMTPSA id
 j13sm27140384wrw.93.2021.05.11.03.16.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 May 2021 03:16:33 -0700 (PDT)
Subject: Re: [PATCH 14/72] softfloat: Do not produce a default_nan from
 parts_silence_nan
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210508014802.892561-1-richard.henderson@linaro.org>
 <20210508014802.892561-15-richard.henderson@linaro.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <54481b9a-7080-a071-cf43-5d132637c930@redhat.com>
Date: Tue, 11 May 2021 12:16:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210508014802.892561-15-richard.henderson@linaro.org>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
> Require default_nan_mode to be set instead.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   fpu/softfloat-specialize.c.inc | 11 +++++------
>   1 file changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/fpu/softfloat-specialize.c.inc b/fpu/softfloat-specialize.c.inc
> index 487b29155c..5988830c16 100644
> --- a/fpu/softfloat-specialize.c.inc
> +++ b/fpu/softfloat-specialize.c.inc
> @@ -180,16 +180,15 @@ static FloatParts parts_default_nan(float_status *status)
>   static FloatParts parts_silence_nan(FloatParts a, float_status *status)
>   {
>       g_assert(!no_signaling_nans(status));
> -#if defined(TARGET_HPPA)
> -    a.frac &= ~(1ULL << (DECOMPOSED_BINARY_POINT - 1));
> -    a.frac |= 1ULL << (DECOMPOSED_BINARY_POINT - 2);
> -#else
> +    g_assert(!status->default_nan_mode);
> +
> +    /* The only snan_bit_is_one target without default_nan_mode is HPPA. */
>       if (snan_bit_is_one(status)) {
> -        return parts_default_nan(status);
> +        a.frac &= ~(1ULL << (DECOMPOSED_BINARY_POINT - 1));
> +        a.frac |= 1ULL << (DECOMPOSED_BINARY_POINT - 2);
>       } else {
>           a.frac |= 1ULL << (DECOMPOSED_BINARY_POINT - 1);
>       }
> -#endif
>       a.cls = float_class_qnan;
>       return a;
>   }
> 

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


