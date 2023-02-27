Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B393B6A4AE3
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 20:32:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWjE5-0006S1-78; Mon, 27 Feb 2023 14:31:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWjE3-0006Re-4t
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 14:31:55 -0500
Received: from mail-yw1-x1143.google.com ([2607:f8b0:4864:20::1143])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWjE1-0003Zs-Go
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 14:31:54 -0500
Received: by mail-yw1-x1143.google.com with SMTP id
 00721157ae682-53852143afcso206773207b3.3
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 11:31:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DW0kgRbAGp0oDPZpf9DD03glTKIPhGJIKPEmW/t0ji0=;
 b=FdEjowt89sD7kBJi37JQYoCkk2KE9SRVL9GiCNGWnEPrIrFwumy6B+85OWWCEZ6pcU
 ORodXJryd1CMTVWmZ3P15qwMhVdN2kuHJ0TbEhlBTGaIaA4whCDStZ+akkJiHs3iyL3R
 BHYjsRAIDuxfqqQ7absVcQmjuS2pw0NzqNtqU8h+WwGm4wwxPKq753qmYvtzp6KpxiCW
 d8GjksnNZHerm7OjdzRjZzqk2+GG10xjyXvHG20LcKh52o656lTsgkDWYLsa7/68GCdy
 U6uPIkAItdiWisGgy+hDr1IkjrGhLlmwl2HDaH6HjQ8GtPB8SPJUolnXbl7eUMmKI2xz
 jPxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DW0kgRbAGp0oDPZpf9DD03glTKIPhGJIKPEmW/t0ji0=;
 b=HtwPqm/aGPQlhB2C2XtNSYw69B1xCA9wzcAP8YDNKPAQVH16R0b1JF3ThC+JZxUfD2
 rxl1vPBy/1C6yTURkKjGssipsvGDzgh7tsfwxJmegx8nqf4V1nTsIvadY0fp/u8wYUlg
 u5fX987FIP7lQWh95jqS71k7WdWxyZzSzxN9BGz99YmNx+jXI5YdAN7mTsPcYxRfTXDS
 Qr1pbsDF6fdI/4ai77XbtNrQI9FTHxO3e8t6wIn14Fg4Hrf3r4iur3TTHW1QfwRV83A6
 V1Ucb5I+kM3pQH6Hi1nqsAJPoAgu8TclumiJu+heAkqHzadTHxunP/PmGZQot+OlNpW3
 1OFg==
X-Gm-Message-State: AO0yUKW2Ux6VhkT0eR9HeBkDd/HhxmXM0iSBAqE+7398iIT3Ih+7sHiB
 pjj6L1W/aiAHBtivY28qpfyqdhepTzqbc7AlMUqlLg==
X-Google-Smtp-Source: AK7set/uGq7uA8HtnG2phi/Rd5UFhJ+EhzaZr9z1ICuEwEtIsO6b3dhcNj1UtXGvOwNXe4rgnRo69A==
X-Received: by 2002:a17:902:f98b:b0:19c:ec6c:4b36 with SMTP id
 ky11-20020a170902f98b00b0019cec6c4b36mr8466189plb.66.1677525859800; 
 Mon, 27 Feb 2023 11:24:19 -0800 (PST)
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 jd5-20020a170903260500b0019a7d58e595sm5011490plb.143.2023.02.27.11.24.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Feb 2023 11:24:18 -0800 (PST)
Message-ID: <fe4e7b11-c976-5f4f-87d6-60da1492dec6@linaro.org>
Date: Mon, 27 Feb 2023 09:24:14 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFC PATCH 4/5] target/arm: enable feature ARM_FEATURE_EL2 if EL2
 is supported
Content-Language: en-US
To: Miguel Luis <miguel.luis@oracle.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Haibo Xu <haibo.xu@linaro.org>,
 Andrew Jones <drjones@redhat.com>, Marc Zyngier <maz@kernel.org>
References: <20230227163718.62003-1-miguel.luis@oracle.com>
 <20230227163718.62003-5-miguel.luis@oracle.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230227163718.62003-5-miguel.luis@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1143;
 envelope-from=richard.henderson@linaro.org; helo=mail-yw1-x1143.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
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

On 2/27/23 06:37, Miguel Luis wrote:
> From: Haibo Xu <haibo.xu@linaro.org>
> 
> KVM_CAP_ARM_EL2 must be supported by the cpu to enable ARM_FEATURE_EL2.
> EL2 bits on ID_AA64PFR0 state unsupported on the value 0b0000.
> 
> Ref: https://lore.kernel.org/qemu-devel/b7c2626e6c720ccc43e57197dff3dac72d613640.1616052890.git.haibo.xu@linaro.org/
> 
> Signed-off-by: Haibo Xu <haibo.xu@linaro.org>
> [Miguel Luis: use of ID_AA64PFR0 for cpu features]
> Signed-off-by: Miguel Luis <miguel.luis@oracle.com>
> ---
>   target/arm/cpu.h   |  2 +-
>   target/arm/kvm64.c | 16 ++++++++++++++++
>   2 files changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 9aeed3c848..de2a88b43e 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -3961,7 +3961,7 @@ static inline bool isar_feature_aa64_aa32_el1(const ARMISARegisters *id)
>   
>   static inline bool isar_feature_aa64_aa32_el2(const ARMISARegisters *id)
>   {
> -    return FIELD_EX64(id->id_aa64pfr0, ID_AA64PFR0, EL2) >= 2;
> +    return FIELD_EX64(id->id_aa64pfr0, ID_AA64PFR0, EL2) != 0;
>   }

No, this predicate is testing if EL2 supports AArch32 more.

> @@ -714,6 +723,10 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
>       features |= 1ULL << ARM_FEATURE_PMU;
>       features |= 1ULL << ARM_FEATURE_GENERIC_TIMER;
>   
> +    if (el2_supported) {
> +        features |= 1ULL << ARM_FEATURE_EL2;
> +    }

This is the test you want...

> @@ -881,6 +894,9 @@ int kvm_arch_init_vcpu(CPUState *cs)
>           assert(kvm_arm_sve_supported());
>           cpu->kvm_init_features[0] |= 1 << KVM_ARM_VCPU_SVE;
>       }
> +    if (cpu_isar_feature(aa64_aa32_el2, cpu)) {
> +        cpu->kvm_init_features[0] |= 1 << KVM_ARM_VCPU_HAS_EL2;
> +    }

... here.

While you could add a new isar_feature predicate for EL2 supported in AArch64 mode, the 
feature test is equivalent and good enough, and is more obviously tied to the required KVM 
support.


r~

