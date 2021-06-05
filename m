Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4786039CAD3
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Jun 2021 22:07:50 +0200 (CEST)
Received: from localhost ([::1]:58618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpcaD-0006vi-6p
	for lists+qemu-devel@lfdr.de; Sat, 05 Jun 2021 16:07:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpcYw-0005oL-0Q
 for qemu-devel@nongnu.org; Sat, 05 Jun 2021 16:06:30 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:37843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpcYu-0006cQ-F4
 for qemu-devel@nongnu.org; Sat, 05 Jun 2021 16:06:29 -0400
Received: by mail-pg1-x52c.google.com with SMTP id t9so10643962pgn.4
 for <qemu-devel@nongnu.org>; Sat, 05 Jun 2021 13:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=DZoJBOcM9Bnc2FNUh3KhN4JxUvpuH1zV3W6SFsyhlHc=;
 b=qTN5P5hESAKnvN63MIhOcwvcEgMl1QQiHDUcCLIITotD1q2XgVPJB0tRZLy1eaLi5B
 Ey1pAvOSV8uhWzOGen1Sek4wr6bYZ0EoKp5zhvSIJF7c9H1zvVRreTL8RPZtxlntY2yv
 xUwoatyr+B1rfLFFImbBAXEr7EDNaGhGd2jYFvy1xf8hUSNye7qf195XdgDUgvcNXP7X
 qvtvCwxWj/Y6oqJ0tsy8uWgLApQ2rWqkaUgzZ9QAiE8bT6RVQ4sH65573Hk7JdKfw4jf
 sDRR4mbkPF3G+0gGUDCAI+E4DLjHe/Akh1kUWixkLIVCz9nuUHYRY7CnJ2PM/q8I5d4r
 RkBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DZoJBOcM9Bnc2FNUh3KhN4JxUvpuH1zV3W6SFsyhlHc=;
 b=XxWATgRxQAm32Ujna8bi5xLNGpGdElTCoF+zJpw7IV8qVQ8lte+LF2odGwy9MaJF97
 xu/y0CtKdUOwycbp8VDtjq3SgR2uQJsKykZ6dEYn+2c63Wodw4GdNw0Cr5AtskXcUBav
 PgZU4a4XlE/z8Bj0UC3GMKbmH/9hdlpxgTsQ+jrTqxzeRKtxKv1weSeoufI24gltRDN4
 ySN11Ov/W7jQkPN/Vj2NhxUBuR3o5L8zqwFkAA7YpjevSVTtpMEuFnYMlf0bH7qE5vF/
 3vO0p4wATTjwoiPJlPPIDSgHn8O6L0Bjra9MssZkuVFkwG0lvBQhWlEHgU8dqrWnsA20
 YLUA==
X-Gm-Message-State: AOAM530OyAb4Rq8Y5CmTSzlHvXu3sKx2RWJ66gaRQPPvQ/hG1rBbv0ti
 vaEo8o/5RJOQfOH6dlOnz67PsA==
X-Google-Smtp-Source: ABdhPJyiU57RcB3aKV3CVNNfDqCP4UxIJwdSJUl6bg/hOrw9chfS2MGrSOX9DYJDt0eR0eXErxru6Q==
X-Received: by 2002:a05:6a00:b83:b029:2ec:7400:ae59 with SMTP id
 g3-20020a056a000b83b02902ec7400ae59mr10514904pfj.11.1622923586857; 
 Sat, 05 Jun 2021 13:06:26 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 s22sm4872441pfd.94.2021.06.05.13.06.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Jun 2021 13:06:26 -0700 (PDT)
Subject: Re: [PATCH v16 76/99] target/arm: restrict rebuild_hflags_a64 to
 TARGET_AARCH64
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-77-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <408c9eb3-edc2-8675-e47d-be5db44f9766@linaro.org>
Date: Sat, 5 Jun 2021 13:06:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-77-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.59,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/4/21 8:52 AM, Alex Bennée wrote:
> --- a/target/arm/tcg/helper.c
> +++ b/target/arm/tcg/helper.c
> @@ -999,6 +999,8 @@ static CPUARMTBFlags rebuild_hflags_a32(CPUARMState *env, int fp_el,
>       return rebuild_hflags_common_32(env, fp_el, mmu_idx, flags);
>   }
>   
> +#ifdef TARGET_AARCH64
> +
>   static CPUARMTBFlags rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
>                                           ARMMMUIdx mmu_idx)
>   {
> @@ -1122,6 +1124,14 @@ static CPUARMTBFlags rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
>       return rebuild_hflags_common(env, fp_el, mmu_idx, flags);
>   }
>   
> +#else
> +
> +QEMU_ERROR("this should have been optimized away!")
> +CPUARMTBFlags rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
> +                                 ARMMMUIdx mmu_idx);
> +
> +#endif /* TARGET_AARCH64 */
> +
>   static CPUARMTBFlags rebuild_hflags_internal(CPUARMState *env)
>   {
>       int el = arm_current_el(env);
> @@ -1183,6 +1193,7 @@ void HELPER(rebuild_hflags_a32)(CPUARMState *env, int el)
>       env->hflags = rebuild_hflags_a32(env, fp_el, mmu_idx);
>   }
>   
> +#ifdef TARGET_AARCH64
>   void HELPER(rebuild_hflags_a64)(CPUARMState *env, int el)
>   {
>       int fp_el = fp_exception_el(env, el);
> @@ -1190,6 +1201,7 @@ void HELPER(rebuild_hflags_a64)(CPUARMState *env, int el)
>   
>       env->hflags = rebuild_hflags_a64(env, el, fp_el, mmu_idx);
>   }
> +#endif /* TARGET_AARCH64 */

It would be better to move some of this code to helper-a64.c, above multiple 
ifdefs.


r~


