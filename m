Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E07596050AA
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Oct 2022 21:45:20 +0200 (CEST)
Received: from localhost ([::1]:59184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olF0B-0005vA-Vt
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 15:45:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1olEwi-0002Nu-Iv
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 15:41:44 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:37844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1olEwg-0003qK-9F
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 15:41:44 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 c7-20020a05600c0ac700b003c6cad86f38so775573wmr.2
 for <qemu-devel@nongnu.org>; Wed, 19 Oct 2022 12:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Nj3USwErSk/m896uM/JC1D4w0boXXtG4+7JFK6uq91Y=;
 b=XQB3+WmwlQE7ypLo/6eX96b2HF3ka7s6jLwpiVP/+2TkQc1K3I82PljWB8DWRpOt9k
 M5581QDhMZLm3i63tBwN8BdDQgVl1jAO8DiN9B9E/ObOK84qJXHGsVbRsIQFQVS8m6rp
 bmlNVT86YgMfNNA5tXtjy6a8I0YY/ux6VjzYslECqNyP3zKMqPCV1dkfLBCsthyMuSNP
 AH+pa1mcHtMYyOdqVGOcp5nyduff2/spmN82bAMUND6TLgNzgqgiD2mT02+4CqLIs06T
 sCcoPKTjq3I/wpgOOmMvovdHSOa6mLJTL9NSILbU1dHKfEqn8Xgbh/9I8deZrTd5dl3e
 vWcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Nj3USwErSk/m896uM/JC1D4w0boXXtG4+7JFK6uq91Y=;
 b=PNXCfplIPSZWNQngt82YddMTZdYbIljT/OasbRJnk5eQCsG2pBs1SuKyW0uxu9DOUS
 SKgUal4C6B3YiSezTk2TSSBc+eUQJIF6I90OaudDW622TKLooW2Ied9g43QtaPQk9aug
 xMWe/+khRRMXa1XK1XJcQSJgcs+6+zjnJJQZcpM5KP7F85CH+YS1MI+WNO2BltoKzHoK
 uuQ0rYlTm5wD5Z3Dmcsh746WkDBDWBDla3fXEafYigiOyLH52NX8jFiKfeil4UrijKPe
 BjKr++5lBvcpvk8nWFjAohdkRovQPvTj/FWYgkvUrLNMPiVDYEti5dM/piPH6Wkh39dF
 y43w==
X-Gm-Message-State: ACrzQf2ysjRPSsyKRDH+aoeQOZQhIlSjX5ArWeUdtue8lESfWtDVDBQp
 2yQZnaZq8rW9RrZhlhwA+UL4nQ==
X-Google-Smtp-Source: AMsMyM4veLud7yTCYWi6nYcee1gEwj/9VuETu2Z8L8rhbLbYylyMPS0zj804hdSX/IxzhksHeDupow==
X-Received: by 2002:a05:600c:54f2:b0:3c6:bd60:5390 with SMTP id
 jb18-20020a05600c54f200b003c6bd605390mr27488246wmb.206.1666208500057; 
 Wed, 19 Oct 2022 12:41:40 -0700 (PDT)
Received: from [192.168.7.115] (m194-158-70-1.andorpac.ad. [194.158.70.1])
 by smtp.gmail.com with ESMTPSA id
 n15-20020a05600c4f8f00b003a2f2bb72d5sm1158306wmq.45.2022.10.19.12.41.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Oct 2022 12:41:39 -0700 (PDT)
Message-ID: <531e830b-b31c-13f6-e50a-d32abf11c2a6@linaro.org>
Date: Wed, 19 Oct 2022 21:41:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH 2/4] target/i386: introduce function to set rounding mode
 from FPCW or MXCSR bits
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20221019150616.929463-1-pbonzini@redhat.com>
 <20221019150616.929463-3-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221019150616.929463-3-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19/10/22 17:06, Paolo Bonzini wrote:
> VROUND, FSTCW and STMXCSR all have to perform the same conversion from
> x86 rounding modes to softfloat constants.  Since the ISA is consistent
> on the meaning of the two-bit rounding modes, extract the common code
> into a wrapper for set_float_rounding_mode.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   target/i386/ops_sse.h        | 60 +++---------------------------------
>   target/i386/tcg/fpu_helper.c | 60 +++++++++++++-----------------------
>   2 files changed, 25 insertions(+), 95 deletions(-)

> diff --git a/target/i386/tcg/fpu_helper.c b/target/i386/tcg/fpu_helper.c
> index a6a90a1817..6f3741b635 100644
> --- a/target/i386/tcg/fpu_helper.c
> +++ b/target/i386/tcg/fpu_helper.c
> @@ -32,7 +32,8 @@
>   #define ST(n)  (env->fpregs[(env->fpstt + (n)) & 7].d)
>   #define ST1    ST(1)
>   
> -#define FPU_RC_MASK         0xc00
> +#define FPU_RC_SHIFT        10
> +#define FPU_RC_MASK         (3 << FPU_RC_SHIFT)
>   #define FPU_RC_NEAR         0x000
>   #define FPU_RC_DOWN         0x400
>   #define FPU_RC_UP           0x800
> @@ -685,28 +686,26 @@ uint32_t helper_fnstcw(CPUX86State *env)
>       return env->fpuc;
>   }
>   
> +static void set_x86_rounding_mode(unsigned mode, float_status *status)
> +{
> +    static FloatRoundMode x86_round_mode[4] = {

static const, otherwise:

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> +        float_round_nearest_even,
> +        float_round_down,
> +        float_round_up,
> +        float_round_to_zero
> +    };
> +    assert(mode < ARRAY_SIZE(x86_round_mode));
> +    set_float_rounding_mode(x86_round_mode[mode], status);
> +}

