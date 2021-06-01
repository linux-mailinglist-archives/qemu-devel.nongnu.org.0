Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7685397BBB
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 23:28:57 +0200 (CEST)
Received: from localhost ([::1]:52120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loBwW-0004jO-FA
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 17:28:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1loBvI-0003YM-Rx
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 17:27:40 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:40837)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1loBvB-0007mg-K7
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 17:27:40 -0400
Received: by mail-pg1-x52d.google.com with SMTP id j12so436303pgh.7
 for <qemu-devel@nongnu.org>; Tue, 01 Jun 2021 14:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=nxkuFkd8rC221LRzht6yYE9goXLTGYG2T/OW+TscteI=;
 b=HYBpOJxYi46fGpK0WfULJ/dfLIVrQrNSR6yHIqwLJp4h6Iz93KNfY3i9eUEsnzQRN8
 lHpDkBE5NM4eUEjOWOd7SsXGqGfwrNv6u9u9v5msx6Ecw8XYpxQfM+7FBF+vmpebL/4W
 POMjuhISTwICNiZTBuCfbqSIxsTkCztbvqZneb9/0g+uVnu7NUfdP6tD+gM+V1J4a4Rh
 om07J5KXUL7jdH5ZoeDjT0s3h9xktJHwW2R65dSbMGK67P47jDcOI/gmxfn1+I8XbxoV
 pu8hc+ZSuRKGHz8fkjoKytOd+7+zUd3Fd7gmr04pYmr4cbO5AfrMKc2FDHCsYXMAVoIH
 b2pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nxkuFkd8rC221LRzht6yYE9goXLTGYG2T/OW+TscteI=;
 b=MEZZlKalU+3nXWvwsBxwbr3g/5pMtFBEp2evPQsueil2KaHD4bzXG8fHefJ26byuvn
 SDLv9rjucxy1ufnC+A52jfnaEcig/21bSOrjYVXd18Pcwrewt8XT5Z0ULXvkpsT7/9Zp
 V2/gxtuBnX23DX1vvELSiR0yDlEV8C3Ev5KL4/A6L0sv4kANUJEKTmJzbbau/iqqZpQu
 FvO0qXYTZLxpkNDc9f1LnjeLh+KV1NKu0UzYub3zK+CmxGjOJ0TkBxQsmJymZQAH0adL
 mEQUWlMk/yDqs5bBvV3OzOVu92jdMZhFkVNpNPd1stE+yaPcjDdfweAi7J6o/fw2EWxC
 /Dpg==
X-Gm-Message-State: AOAM532t5wApYiyCTj87HDo6Pzg8fQWGnIpZm4wf29cmHQfyNzNXZ3Zo
 7O1+BPX7msgPrjJz2724BozC4g==
X-Google-Smtp-Source: ABdhPJzprePihZjm7qwAAMz0TPKSR7qXUr7+z9Lgxl6J6ave2nKLIodJLmdl4iEXWtGP9q91oFDB6Q==
X-Received: by 2002:a05:6a00:124d:b029:2e9:e07c:f290 with SMTP id
 u13-20020a056a00124db02902e9e07cf290mr9530582pfi.25.1622582851905; 
 Tue, 01 Jun 2021 14:27:31 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 j2sm2771018pji.34.2021.06.01.14.27.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Jun 2021 14:27:31 -0700 (PDT)
Subject: Re: [PATCH v2 01/26] s390x/tcg: Fix FP CONVERT TO (LOGICAL) FIXED NaN
 handling
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20210517142739.38597-1-david@redhat.com>
 <20210517142739.38597-2-david@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <731bc385-463c-47e5-0841-f9bed4b48933@linaro.org>
Date: Tue, 1 Jun 2021 14:27:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210517142739.38597-2-david@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.613,
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
> @@ -634,6 +664,9 @@ uint64_t HELPER(clfxb)(CPUS390XState *env, uint64_t h, uint64_t l, uint32_t m34)
>  
>      s390_restore_bfp_rounding_mode(env, old_mode);
>      handle_exceptions(env, xxc_from_m34(m34), GETPC());
> +    if (float128_is_any_nan(make_float128(h, l))) {
> +        return 0;
> +    }

I wonder if handle_exceptions should return s390_exc.
Then you can test

   exc = handle_exceptions(...);
   if (unlikely(exc & S390_IEEE_MASK_INVALID)) {
     ret = 0;
   }
   return ret;



> +++ b/target/s390x/vec_fpu_helper.c
> @@ -326,6 +326,9 @@ void HELPER(gvec_vcdlg64s)(void *v1, const void *v2, CPUS390XState *env,
>   
>   static uint64_t vcgd64(uint64_t a, float_status *s)
>   {
> +    if (float64_is_any_nan(a)) {
> +        return INT64_MIN;
> +    }
>       return float64_to_int64(a, s);
>   }
>   
> @@ -349,6 +352,9 @@ void HELPER(gvec_vcgd64s)(void *v1, const void *v2, CPUS390XState *env,
>   
>   static uint64_t vclgd64(uint64_t a, float_status *s)
>   {
> +    if (float64_is_any_nan(a)) {
> +        return 0;
> +    }
>       return float64_to_uint64(a, s);
>   }

You do still need to raise invalid, as far as I can see.


r~

