Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 181CC39A694
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 19:02:18 +0200 (CEST)
Received: from localhost ([::1]:57004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loqjZ-0002Cu-3m
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 13:02:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1loqiV-0001SM-PE
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 13:01:11 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:44594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1loqiO-0006Bt-LM
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 13:01:11 -0400
Received: by mail-pl1-x62f.google.com with SMTP id h12so3194313plf.11
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 10:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rTl7BQMZjsSniP7gZvpG1KzynmEjvjwSmF11YmO1UXU=;
 b=odr8Zxncqh0G7JKWtRBmNfu3UvIeMKBaXj2JoNulaya0AClpulJUYnRgXEq6bF32yc
 W6vOBUkH63jzuzDvgTmO+ugWc5bOGZfV65++S7Xp75g5//60AxpmbQ7OXby+QHKzdZyo
 NtC8Txy42SEJFQw+2J9sxWlKl9RtjJ2VDzgQqewAVJlAJhqD4Pc1L32j84tyNaDCq6rP
 odyMMzCsKOsjcOtSAI+4IJFR5+DchOwtLmuOWG/2h5xoAu0Qm7Olj2VHqn9kDgvpgVq6
 qLcdZ8+8eyltOThh4IZYVge+d9a1AAOAqCMlNJKrFsTBnrqPwSI1a9K0q56ru6yUg2fZ
 m8ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rTl7BQMZjsSniP7gZvpG1KzynmEjvjwSmF11YmO1UXU=;
 b=ovb0K9oTcnbo6UoVYzY7Xv9JmmuqTGax4BNJycUcidLc2co+9cdasArY3y1b8JunA0
 lwSMi9krb8UEOvVOZZ8R+gkSOkLx5k2RgPMC6KeOYFOCgFwbJQDLmFUGyjujtmlb4qaB
 9hJxhSfR2Jc4FpVBWYDHmmKi5d8GfL+YvS8DLe36f7aSdZCSTFs8imlIZ6VXTaFE5qGc
 JbCV0gem7SVlx8egEqOtvHvIa5EWskl/IPZzQK/TZryuc5n8rB/MdkL3umBD/0HUKRRt
 9zkC/p1MTFVGnUhZspN1T1DggrhOTuYfUHzjMCpLtzKEzPAm+ivk7Y+M54AuBxYMnE2h
 Nl2w==
X-Gm-Message-State: AOAM531juXAKzsv8zKwgXUZLy4szhxKaz/iQ6xBKzBVZU0LpGWNBH/o6
 3+6Cmd4l00snEo9pyxxc6SW5NA==
X-Google-Smtp-Source: ABdhPJzFeA/y7NGZgd60aQ8eeaJb/j2beL6Q1yNuNE7SJgKxGIPYCwkgYTY4jsrXE0NcSoQYUod8dw==
X-Received: by 2002:a17:902:8493:b029:107:15c:271d with SMTP id
 c19-20020a1709028493b0290107015c271dmr448336plo.68.1622739662733; 
 Thu, 03 Jun 2021 10:01:02 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 13sm2773537pfz.91.2021.06.03.10.01.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Jun 2021 10:01:02 -0700 (PDT)
Subject: Re: [PATCH v2 23/26] softfloat: Implement
 float128_(min|minnum|minnummag|max|maxnum|maxnummag)
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20210517142739.38597-1-david@redhat.com>
 <20210517142739.38597-24-david@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1cd84e91-8665-5685-bd4d-6cb93ccdf718@linaro.org>
Date: Thu, 3 Jun 2021 10:01:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210517142739.38597-24-david@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.603,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/17/21 7:27 AM, David Hildenbrand wrote:
> With Richard's softfloat rework, the float128 implementation is
> straight-forward. Unfortuantely, we don't have any tests we can simply
> adjust/unlock.
> 
> Cc: Aurelien Jarno <aurelien@aurel32.net>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: "Alex Bennée" <alex.bennee@linaro.org>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: David Hildenbrand <david@redhat.com>

Queueing this into my softfloat rework.  Thanks,


r~

> ---
>   fpu/softfloat.c         | 17 +++++++++++++++++
>   include/fpu/softfloat.h |  6 ++++++
>   2 files changed, 23 insertions(+)
> 
> diff --git a/fpu/softfloat.c b/fpu/softfloat.c
> index 7376b3470c..bfe5a6b975 100644
> --- a/fpu/softfloat.c
> +++ b/fpu/softfloat.c
> @@ -3893,6 +3893,22 @@ static float64 float64_minmax(float64 a, float64 b, float_status *s, int flags)
>       return which ? b : a;
>   }
>   
> +static float128 float128_minmax(float128 a, float128 b, float_status *s,
> +                                int flags)
> +{
> +    FloatParts128 pa, pb;
> +    int which;
> +
> +    float128_unpack_canonical(&pa, a, s);
> +    float128_unpack_canonical(&pb, b, s);
> +    which = parts_minmax(&pa, &pb, s, flags, &float64_params);
> +    if (unlikely(which < 0)) {
> +        /* Some sort of nan, need to repack default and silenced nans. */
> +        return float128_round_pack_canonical(&pa, s);
> +    }
> +    return which ? b : a;
> +}
> +
>   #define MINMAX_1(type, name, flags) \
>       type type##_##name(type a, type b, float_status *s) \
>       { return type##_minmax(a, b, s, flags); }
> @@ -3909,6 +3925,7 @@ MINMAX_2(float16)
>   MINMAX_2(bfloat16)
>   MINMAX_2(float32)
>   MINMAX_2(float64)
> +MINMAX_2(float128)
>   
>   #undef MINMAX_1
>   #undef MINMAX_2
> diff --git a/include/fpu/softfloat.h b/include/fpu/softfloat.h
> index 94f7841b9f..ec7dca0960 100644
> --- a/include/fpu/softfloat.h
> +++ b/include/fpu/softfloat.h
> @@ -1204,6 +1204,12 @@ float128 float128_rem(float128, float128, float_status *status);
>   float128 float128_sqrt(float128, float_status *status);
>   FloatRelation float128_compare(float128, float128, float_status *status);
>   FloatRelation float128_compare_quiet(float128, float128, float_status *status);
> +float128 float128_min(float128, float128, float_status *status);
> +float128 float128_max(float128, float128, float_status *status);
> +float128 float128_minnum(float128, float128, float_status *status);
> +float128 float128_maxnum(float128, float128, float_status *status);
> +float128 float128_minnummag(float128, float128, float_status *status);
> +float128 float128_maxnummag(float128, float128, float_status *status);
>   bool float128_is_quiet_nan(float128, float_status *status);
>   bool float128_is_signaling_nan(float128, float_status *status);
>   float128 float128_silence_nan(float128, float_status *status);
> 


