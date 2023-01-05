Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C6565F65E
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 23:05:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDYLx-00036n-P2; Thu, 05 Jan 2023 17:04:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDYLp-00035m-FP
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 17:04:41 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDYLn-0004nI-JE
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 17:04:41 -0500
Received: by mail-wm1-x334.google.com with SMTP id g10so15239697wmo.1
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 14:04:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fjgVVYudIJ550ZRM5Cqm+vmq3JL93yoAWQUyMy4dGuQ=;
 b=ekD5XS9/dCumrZVfoJMuxC9j/Wzb4iW5GVovZJs5+z6dN5ZfJnSwoipqRgabFjFqow
 PcF+8eAXN0GiWAtm0kw5WXIVg1FC456Vyn5AaRSUuowo9fdP2NAFnFZxYgwVGTGoiEIu
 QcWldE4R3GumTCxD7uhvcHDcvxYq0NLSCcvjZniKpQ6T3EX9q/R9LcauWRqGTE8HH5ne
 fbqiY90djhFa5cdwoyAqRBLG6gKKgger2bSDDdiUvdsjOXHmTi3mhVjkFmcYjoR/hxEv
 lAljtdvSKpyNGnchhpAHJYg80hotiDaYsBJafk/A7TG3hO+KhVIdyarD/q8fLqgOL0jv
 tuHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fjgVVYudIJ550ZRM5Cqm+vmq3JL93yoAWQUyMy4dGuQ=;
 b=cUxGSctzqOadKA08Q99JAlVdLLq9F9TZk4l3SssQzWrQuZx5uOliKEded0sZKR9Luc
 TTv5kwf/XaaWwk+9qQCi3zZ+LEOFs3jCcxYHdC9GE18plLuTBb5Na8pDGZu7t82ZME8I
 7X/+uR174asJtKrlOeqhB3aYpbrhM1mC8ySfh8Dj+HQ9EI9B+67584k215SjqTHaIi/I
 aEX+jzs0cT8w6STP0V+20T96U8F00TQLP14AO3OkVgigujY5yOjf43gAvgaOREyuIJR4
 E6idZncS4IPsw0K2KHil+O0BvuXe7vhcSmkAy4b/BEMaPOAEAUAxasjkHnJLnSfa3y9R
 CNkg==
X-Gm-Message-State: AFqh2krm382su6lY7S0s0I9HdumhaKuz5jQLT9hwsSOdlPsEpq7gnt2M
 gy0g9G1hUuz6ItHRqro4O0ihqg==
X-Google-Smtp-Source: AMrXdXsXBJj1TvlSUjbzqLtgAO7dMoTPuiZGn4hRmnJPfbOnEgAzxCOzNugvFn5QB8K3Pbovk2TfOA==
X-Received: by 2002:a05:600c:4fcf:b0:3cf:68f8:790b with SMTP id
 o15-20020a05600c4fcf00b003cf68f8790bmr38611038wmq.11.1672956277435; 
 Thu, 05 Jan 2023 14:04:37 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 fm14-20020a05600c0c0e00b003d208eb17ecsm3846033wmb.26.2023.01.05.14.04.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jan 2023 14:04:36 -0800 (PST)
Message-ID: <c154778b-ed95-5d73-4533-2301820b05a1@linaro.org>
Date: Thu, 5 Jan 2023 23:04:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [RFC PATCH 11/40] target/arm: Copy features from ARMCPUClass
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, berrange@redhat.com, eduardo@habkost.net,
 armbru@redhat.com, ajones@ventanamicro.com, alex.bennee@linaro.org
References: <20230103181646.55711-1-richard.henderson@linaro.org>
 <20230103181646.55711-12-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230103181646.55711-12-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.939,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 3/1/23 19:16, Richard Henderson wrote:
> Create a features member in ARMCPUClass and copy to the instance in
> arm_cpu_init.  Settings of this value will come in a future patch.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/cpu-qom.h | 18 ++++++++++++++++++
>   target/arm/cpu.c     |  1 +
>   2 files changed, 19 insertions(+)
> 
> diff --git a/target/arm/cpu-qom.h b/target/arm/cpu-qom.h
> index 5509ef9d85..ac58cc3a87 100644
> --- a/target/arm/cpu-qom.h
> +++ b/target/arm/cpu-qom.h
> @@ -74,8 +74,26 @@ struct ARMCPUClass {
>   
>       /* 'compatible' string for this CPU for Linux device trees */
>       const char *dtb_compatible;
> +
> +    /* Internal CPU feature flags.  */
> +    uint64_t features;
>   };
>   
> +static inline int arm_class_feature(ARMCPUClass *acc, int feature)
> +{
> +    return (acc->features & (1ULL << feature)) != 0;
> +}
> +
> +static inline void set_class_feature(ARMCPUClass *acc, int feature)
> +{
> +    acc->features |= 1ULL << feature;
> +}
> +
> +static inline void unset_class_feature(ARMCPUClass *acc, int feature)
> +{
> +    acc->features &= ~(1ULL << feature);
> +}

These helpers are not used until patch #19 "target/arm: Move most cpu
initialization to the class".

>   void register_cp_regs_for_features(ARMCPU *cpu);
>   void init_cpreg_list(ARMCPU *cpu);
>   
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 1bc45b2b25..d64b86b6a5 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -1191,6 +1191,7 @@ static void arm_cpu_initfn(Object *obj)
>       QLIST_INIT(&cpu->el_change_hooks);
>   
>       cpu->dtb_compatible = acc->dtb_compatible;
> +    cpu->env.features = acc->features;
>   
>   #ifdef CONFIG_USER_ONLY
>   # ifdef TARGET_AARCH64


