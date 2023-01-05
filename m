Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 247CC65E4D4
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 05:49:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDIBA-0007LK-V6; Wed, 04 Jan 2023 23:48:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pDIB3-0007L1-F1
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 23:48:29 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pDIB1-0004Mt-Gp
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 23:48:29 -0500
Received: by mail-pj1-x1033.google.com with SMTP id cl14so2214139pjb.2
 for <qemu-devel@nongnu.org>; Wed, 04 Jan 2023 20:48:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4GkHCC8QXORuxqNY5GWhT87y4llPRmtW3jLLrQeoqDM=;
 b=E484vPTIeJGpmSxqJvhRhtaacPR1WQYv2zE5/8eiimfPIqgZjux5fXYBQMjwziyEfa
 Cy/X82DGuvw9aZTQYOU6fZSMnYroOLb8T5wU8Hid4l25xIRrqG1m/CNY1V5I9ey2z+MY
 yf4mnIh4d5QmcaeBktSNHIly7KFB4H/sVznEu17VRMmWouUEVUpwWV5XWXXt3y0tUEDt
 DYrSQpcRAsMdJtc5LD224v44qMiWmh3Jjd8I1NTuxgmR/YXbJwzhZLv5k+RVC3fEXPGm
 8osBJpHRow3E2oxvEcv4dT64G85Bo/0b/qpZmmHE7Ie5ipA84+cmzUpFyvKyG/n3hjH2
 rz1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4GkHCC8QXORuxqNY5GWhT87y4llPRmtW3jLLrQeoqDM=;
 b=kkLlD0ud5k7NKnx7RZFDLvya4n1vvOuljulPJVJs73nbAthHyAx4VKItEU1dZwo5us
 xZrqZGS7PZqwEbP1aISuEZ/Gr1nYYKCZafYGmwStBqV/5coHLPRicXlX6gN5jmVzF7mZ
 8uAFqjRiRjzpq/gce9eXKiy66E7FjgtZNOZqdhoy4VbrUR52UVJyoATl6joAYFx49325
 u4H/mzn5h8AEYQabS2VFAFE6+hxXlN7dMy7sBDhujfyDeNZTi2KwswJWbFlIx8816OZ1
 Ecyq5gW16nm3bfLbXkgKQ68Ex8jc2rRcKPh8KXzqqljHzN57VpK9i0S+wzm8MndTIztp
 flBg==
X-Gm-Message-State: AFqh2kr1U2BbUz24b1WFyk1jdnnb7VWcz1refFK86HKq2aFgV2LKZgXN
 cpJMihZJXywEg4aRFgD0BHWCRw==
X-Google-Smtp-Source: AMrXdXsLYgPAOVwkOs285ugRYbi5XdDJOGRNQh0bQDT6SGJzOug6y3swbMcqstS4Vz73EKMGem/9dw==
X-Received: by 2002:a17:902:bd0a:b0:192:fe0a:11c8 with SMTP id
 p10-20020a170902bd0a00b00192fe0a11c8mr648874pls.46.1672894105677; 
 Wed, 04 Jan 2023 20:48:25 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:5a62:efe5:94a2:1dee?
 ([2602:47:d48c:8101:5a62:efe5:94a2:1dee])
 by smtp.gmail.com with ESMTPSA id
 i18-20020a17090332d200b001897a8b537asm25139962plr.221.2023.01.04.20.48.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jan 2023 20:48:25 -0800 (PST)
Message-ID: <97f2e3db-79f2-c4a2-f48c-70b4617b7e4d@linaro.org>
Date: Wed, 4 Jan 2023 20:48:23 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH 14/27] target/arm: Move regime_using_lpae_format into
 internal.h
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>
References: <20230104215835.24692-1-farosas@suse.de>
 <20230104215835.24692-15-farosas@suse.de>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230104215835.24692-15-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.708,
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

On 1/4/23 13:58, Fabiano Rosas wrote:
> This function is needed by common code (ptw.c), so move it along with
> the other regime_* functions in internal.h. When we enable the build
> without TCG, the tlb_helper.c file will not be present.

Maybe better to just move to ptw.c?


r~

> 
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
>   target/arm/internals.h  | 17 ++++++++++++++---
>   target/arm/tlb_helper.c | 14 --------------
>   2 files changed, 14 insertions(+), 17 deletions(-)
> 
> diff --git a/target/arm/internals.h b/target/arm/internals.h
> index 161e42d50f..3493b5cc88 100644
> --- a/target/arm/internals.h
> +++ b/target/arm/internals.h
> @@ -610,9 +610,6 @@ ARMMMUIdx arm_v7m_mmu_idx_for_secstate_and_priv(CPUARMState *env,
>   /* Return the MMU index for a v7M CPU in the specified security state */
>   ARMMMUIdx arm_v7m_mmu_idx_for_secstate(CPUARMState *env, bool secstate);
>   
> -/* Return true if the translation regime is using LPAE format page tables */
> -bool regime_using_lpae_format(CPUARMState *env, ARMMMUIdx mmu_idx);
> -
>   /*
>    * Return true if the stage 1 translation regime is using LPAE
>    * format page tables
> @@ -777,6 +774,20 @@ static inline uint64_t regime_tcr(CPUARMState *env, ARMMMUIdx mmu_idx)
>       return env->cp15.tcr_el[regime_el(env, mmu_idx)];
>   }
>   
> +/* Return true if the translation regime is using LPAE format page tables */
> +static inline bool regime_using_lpae_format(CPUARMState *env, ARMMMUIdx mmu_idx)
> +{
> +    int el = regime_el(env, mmu_idx);
> +    if (el == 2 || arm_el_is_aa64(env, el)) {
> +        return true;
> +    }
> +    if (arm_feature(env, ARM_FEATURE_LPAE)
> +        && (regime_tcr(env, mmu_idx) & TTBCR_EAE)) {
> +        return true;
> +    }
> +    return false;
> +}
> +
>   /**
>    * arm_num_brps: Return number of implemented breakpoints.
>    * Note that the ID register BRPS field is "number of bps - 1",
> diff --git a/target/arm/tlb_helper.c b/target/arm/tlb_helper.c
> index 0f4f4fc809..31eb77f7df 100644
> --- a/target/arm/tlb_helper.c
> +++ b/target/arm/tlb_helper.c
> @@ -12,20 +12,6 @@
>   #include "exec/helper-proto.h"
>   
>   
> -/* Return true if the translation regime is using LPAE format page tables */
> -bool regime_using_lpae_format(CPUARMState *env, ARMMMUIdx mmu_idx)
> -{
> -    int el = regime_el(env, mmu_idx);
> -    if (el == 2 || arm_el_is_aa64(env, el)) {
> -        return true;
> -    }
> -    if (arm_feature(env, ARM_FEATURE_LPAE)
> -        && (regime_tcr(env, mmu_idx) & TTBCR_EAE)) {
> -        return true;
> -    }
> -    return false;
> -}
> -
>   /*
>    * Returns true if the stage 1 translation regime is using LPAE format page
>    * tables. Used when raising alignment exceptions, whose FSR changes depending


