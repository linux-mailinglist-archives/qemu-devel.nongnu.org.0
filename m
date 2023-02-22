Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BEDE69FDC5
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 22:37:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUwnk-00087w-F1; Wed, 22 Feb 2023 16:37:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUwni-00087T-Pp
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 16:37:22 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUwnh-0005dU-8M
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 16:37:22 -0500
Received: by mail-pl1-x633.google.com with SMTP id z2so10633343plf.12
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 13:37:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=T6UnAIy50X4YtRBVt50hEeqQhRj0NfiDHvi3k0VYj88=;
 b=JtDufyLvRlQOJM+w2f3gTCArLVrhKbIXslrMI/uEcJekIUrvEE9fwVwYTLGxBB11yQ
 sXpmdQ9o3vvJVcMrxKfjBsOFpIT6si7eNAOjvdJvmu26yh6dDQeLNOWrVibGANBzMHnk
 TeocT4QGCLT9WedKAenfvfmIohU/KheipNOcm4fU5lUnOrXliTc5FywhlLE4X1dd4J0u
 QPqV/CHUv7b2WCU1EjmI8cBI84ykPjidEDWFxit17jHtusagZE+jFE63E7X6gyMlMwH3
 VJV9h0CznL4Rdn+g+Ly0VjsOrUnXvXbme9gc9pklIkPESVDpMfJLj2UxpeiX7sSukkCD
 mkxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=T6UnAIy50X4YtRBVt50hEeqQhRj0NfiDHvi3k0VYj88=;
 b=Sy1HXo/+GNostXlYgGwMoxz5hbOvCWJ9+i+VJhN9QxNRzM8/kVe+3e+JCCidaIV7i2
 eoNtX4U2pfX34z4tHTlIX0bBg/H1lTqmANuMQRwqdD3ArryFQDX5YRjdYEV72lfSMnrC
 Mq6qyGJvqjshyzryLZ+koCt/1KzdBHIDTG9lqT/wBnOZ3ra9FCWRUx5rFQvSz+ATRe6l
 eCjfRPGHLnMba32BxhYNzeWLLj99xptbWnsNMt3/98pWzz5Wd4/pVYMGib58wGTFxAmo
 1/VFz/9DQRdVKZvWZilhlU74bjVhRJXiWVyZNgzrrOK5X4U+J9GfFJPU98Q8u+qPYWtt
 LFEg==
X-Gm-Message-State: AO0yUKVm5Bj6WJwP5IjmpDa071FRjxpzQ/phVfBhEoHY5wEaOy4BKAYs
 XHYvXMBz29SHL5Dysg/S9q34Og==
X-Google-Smtp-Source: AK7set+OdHz3WpoVB0Dj4yYx+VYOovnViKfAnp2sZEdafiSQO3/wGjdSJwJRnw5KuKLPw4YFrucysw==
X-Received: by 2002:a17:903:1384:b0:19a:beec:8b56 with SMTP id
 jx4-20020a170903138400b0019abeec8b56mr8862295plb.39.1677101839711; 
 Wed, 22 Feb 2023 13:37:19 -0800 (PST)
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 d8-20020a170902b70800b0019a983f0119sm5399025pls.307.2023.02.22.13.37.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Feb 2023 13:37:19 -0800 (PST)
Message-ID: <989f380e-9d70-a377-9f56-6d42935459c2@linaro.org>
Date: Wed, 22 Feb 2023 11:37:14 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 6/7] target/arm: Implement v8.3 FPAC and FPACCOMBINE
Content-Language: en-US
To: Aaron Lindsay <aaron@os.amperecomputing.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Vincent Dehors <vincent.dehors@smile.fr>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20230222193544.3392713-1-aaron@os.amperecomputing.com>
 <20230222193544.3392713-7-aaron@os.amperecomputing.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230222193544.3392713-7-aaron@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.102,
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

On 2/22/23 09:35, Aaron Lindsay wrote:
> +static G_NORETURN
> +void pauth_fail_exception(CPUARMState *env, bool data, int keynumber, uintptr_t ra)
> +{
> +    int target_el = arm_current_el(env);
> +    if (target_el == 0) {
> +        uint64_t hcr = arm_hcr_el2_eff(env);
> +        if (arm_is_el2_enabled(env) && (hcr & HCR_TGE))
> +            target_el = 2;
> +        else
> +            target_el = 1;
> +    }
> +
> +    raise_exception_ra(env, EXCP_UDEF, syn_pacfail(data, keynumber), target_el, ra);

Use exception_target_el(), no need to check TGE here.

> @@ -406,6 +421,16 @@ static uint64_t pauth_auth(CPUARMState *env, uint64_t ptr, uint64_t modifier,
>           uint64_t xor_mask = MAKE_64BIT_MASK(bot_bit, top_bit - bot_bit + 1) &
>               ~MAKE_64BIT_MASK(55, 1);
>           result = ((ptr ^ pac) & xor_mask) | (ptr & ~xor_mask);
> +        if (cpu_isar_feature(aa64_fpac_combine, env_archcpu(env)) ||
> +                (cpu_isar_feature(aa64_fpac, env_archcpu(env)) &&
> +                 !is_combined)) {

Indentation is off.

> +    int error_code = ((data ? 1 : 0) << 1) | (keynumber);

'? 1 : 0' is not required.


r~

