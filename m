Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0285F6AD4AE
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 03:30:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZN5H-0006gC-0Q; Mon, 06 Mar 2023 21:29:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZN5F-0006fn-FD
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 21:29:45 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZN5D-0000dW-4E
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 21:29:45 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 u3-20020a17090a450300b00239db6d7d47so10572513pjg.4
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 18:29:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678156181;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Cpp8nWTgpUAR6PW0jAXJ9RhZkzeVpzjoNP/e+jQD9HA=;
 b=Vuoamu7v44R3Di698W+JzygQqv4MiH0QI/aVlJb5oMkBYaE8rE2cUmWg/MyRCB1OmL
 UQd70yF8YruwTrSu4GPCeYxlmtrANKxgib66hQr4IYzBoL648z/Pzj3M1gMz8uqQPuKX
 F6Cv0V4y/lJBrsq2OMhMuhm7hUhUGG+5ZWARBiXNwpcud3bmOIjrOHg0lID3qfSAocyu
 eC+Jifhn5J6S5jHuUzNKRZmkWuLKHPn6avz9KRmRwRag63WFyDNEDdhF7yaiVD6OhPZx
 8sXyO7lJh2zU9SijYlUS/kQAQSO2Pt7LqzAafJD1duvhr26sOyTct/tCCrp8K2Dl4SyG
 Z4+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678156181;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Cpp8nWTgpUAR6PW0jAXJ9RhZkzeVpzjoNP/e+jQD9HA=;
 b=RXkroi+2nvfhzGOa12VajZLpy4rYFFvetgKRCB1DTgNYFU/vxtq4eVczMf5VCla/yw
 SHaV4oFmo0pjkOa7FO8LV9MeRGXRNvzhOvE3CcsqBY98wnNPliQc6Bz1A9qR+IGwk2SZ
 TNTnhNXHfayoCBbhDQdQHCZBrNpm+5Mi5HYG/b0h7X6xqsAJHQvg4BIMY1sY0GVprCwq
 T36vuR3V+ARo42YKsLWz6g0gkFc5uakPZjex75MpLhZkUUiCaJp81NVyfJfuRY5AcP7S
 SOSIYliNkEBbbP6nYw1c48JCINKsn8dLNLVuA12xCvdr04yfYIAOBFf73OdMlpoO5Ksw
 1fww==
X-Gm-Message-State: AO0yUKURW4PgdOqMy8jCHVLCLbCIUHHsT6rfCcJJEDgK4peRF0Yhy4BZ
 vztfNQKucNeuxAPyGv3/cGk9Eg==
X-Google-Smtp-Source: AK7set+C2SamXuokXS+NEDh1L1BTsyxP409LrY8HxHxZAKKRG5wJ4i8HNR767I/4hfpxKiHN/Aa3Rw==
X-Received: by 2002:a17:903:2288:b0:19a:9dab:3438 with SMTP id
 b8-20020a170903228800b0019a9dab3438mr13122711plh.2.1678156181447; 
 Mon, 06 Mar 2023 18:29:41 -0800 (PST)
Received: from ?IPV6:2602:ae:154a:9f01:b1e0:bfd9:8b1a:efeb?
 ([2602:ae:154a:9f01:b1e0:bfd9:8b1a:efeb])
 by smtp.gmail.com with ESMTPSA id
 d6-20020a170902c18600b00199025284b3sm7356791pld.151.2023.03.06.18.29.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 18:29:40 -0800 (PST)
Message-ID: <d867ae79-0347-3f72-2dcc-e176ab809842@linaro.org>
Date: Mon, 6 Mar 2023 18:29:38 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3] target/arm: Add Neoverse-N1 registers
Content-Language: en-US
To: Chen Baozi <chenbaozi@phytium.com.cn>, qemu-devel@nongnu.org
Cc: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
References: <20230307021442.3915728-1-chenbaozi@phytium.com.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230307021442.3915728-1-chenbaozi@phytium.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 3/6/23 18:14, Chen Baozi wrote:
> Add implementation defined registers for neoverse-n1 which
> would be accessed by TF-A. Since there is no DSU in Qemu,
> CPUCFR_EL1.SCU bit is set to 1 to avoid DSU registers definition.
> 
> Signed-off-by: Chen Baozi <chenbaozi@phytium.com.cn>
> Tested-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> ---
>   target/arm/cpu64.c     |  2 ++
>   target/arm/cpu_tcg.c   | 66 ++++++++++++++++++++++++++++++++++++++++++
>   target/arm/internals.h |  2 ++
>   3 files changed, 70 insertions(+)

You really need to base on upstream master, as these files have moved.

> 
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index 4066950da1..a6ae7cafac 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -1094,6 +1094,8 @@ static void aarch64_neoverse_n1_initfn(Object *obj)
>   
>       /* From D5.1 AArch64 PMU register summary */
>       cpu->isar.reset_pmcr_el0 = 0x410c3000;
> +
> +    define_neoverse_n1_cp_reginfo(cpu);
>   }
>   
>   static void aarch64_host_initfn(Object *obj)
> diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
> index df0c45e523..40ec120eb2 100644
> --- a/target/arm/cpu_tcg.c
> +++ b/target/arm/cpu_tcg.c
> @@ -150,6 +150,72 @@ void define_cortex_a72_a57_a53_cp_reginfo(ARMCPU *cpu)
>   {
>       define_arm_cp_regs(cpu, cortex_a72_a57_a53_cp_reginfo);
>   }
> +
> +static const ARMCPRegInfo neoverse_n1_cp_reginfo[] = {

This belongs in target/arm/tcg/cpu64.c, adjacent to or inside aarch64_neoverse_n1_initfn.

You do not want to match the placement of define_cortex_a72_a57_a53_cp_reginfo, because 
that has a more complex usage across aarch64 kvm and tcg, along with arm32 "-cpu max".

> diff --git a/target/arm/internals.h b/target/arm/internals.h
> index 3c7341e774..0c393e971a 100644
> --- a/target/arm/internals.h
> +++ b/target/arm/internals.h
> @@ -1356,8 +1356,10 @@ void arm_cpu_lpa2_finalize(ARMCPU *cpu, Error **errp);
>   
>   #ifdef CONFIG_USER_ONLY
>   static inline void define_cortex_a72_a57_a53_cp_reginfo(ARMCPU *cpu) { }
> +static inline void define_neoverse_n1_cp_reginfo(ARMCPU *cpu) {}
>   #else
>   void define_cortex_a72_a57_a53_cp_reginfo(ARMCPU *cpu);
> +void define_neoverse_n1_cp_reginfo(ARMCPU *cpu);

No need for a public declaration at all.


r~


