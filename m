Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CECC4485ADF
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 22:42:24 +0100 (CET)
Received: from localhost ([::1]:39026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5E35-0007kR-UC
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 16:42:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5Dxx-0000dV-08
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 16:37:05 -0500
Received: from [2607:f8b0:4864:20::52e] (port=33386
 helo=mail-pg1-x52e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5Dxv-0002aw-83
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 16:37:04 -0500
Received: by mail-pg1-x52e.google.com with SMTP id i30so359875pgl.0
 for <qemu-devel@nongnu.org>; Wed, 05 Jan 2022 13:36:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7y6hmTrh+XpilH0JWrpkMEsCEa2s5PTiIKnfllY9V+w=;
 b=ef1mPGoiYNO9bFzHSdxkYWIA4OJvvdX+WlAqJ3S/pZ17k1gAJY/xEftfAw/jokvXVl
 f/g8KUxBfwLdQEtA8Fsn0mfS4H8yVSxLs2Hc/n61DxgQniR7DfJURYCVnGcK11vZ9qoF
 q4wioe8nPcgqy90aZQumTxwzZ8NuFFRKwn4LR4WC8j/ab/6/ZAm/GAbov3slaVyENPiz
 Hv2JvWb+VWqweOHiOw4OponRNQMQwuiZIswk0dnHjRKyCkdRG1sqlVTLrcFINBjGs01i
 CstWoBJtIBhXYcQxZAqEqnEoetLD2rV9KZfxjY/+4YAQhZvikB6Hm4lJjDiRpOjOffej
 DOdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7y6hmTrh+XpilH0JWrpkMEsCEa2s5PTiIKnfllY9V+w=;
 b=YC1XvPjY83xIbT11V3kaWnzzl5u0kGGaWd833uYDVwDHGYnm0Fefy8Jh0eABSFzIxq
 KN9xLj1LpcomzhESPOoIz5Eyjq5hqHQm7iqntddkAFHXbWw7X7psSr1WDRGLjw4WUCBK
 fz8I/1BUaaFxl/s8c1rmdX+jh5KZNSZqajvqfYegxAcF8ukXT4GrhGnxSTjO9kdp7HSO
 xbR5lxXOb9TQoGMOuRsC/YLiNF9CVvkmunk8u5SprsP6oxV3zzU9u/IGiTXTMP1u59d+
 Ken0LzS7pD1insrsWV9z+fCYARoGhv2GgK8E2IZeIjnQ4JsFbYLaZqNrVBagxVsmcZIg
 tFMA==
X-Gm-Message-State: AOAM5336AcvtTR6AzKQJXER4UObW2EJGIu2mDu/cpsiQzwY61JbL19sX
 2rbZDhpy5RqENqiH2Fs8XAHUUQ==
X-Google-Smtp-Source: ABdhPJyJiWi/3oUbChjBti2/dNa8FFbEZUcSL4GV891fgGqCN7Z1FryDrxNwAE1UbtMDk5fFFtFtKA==
X-Received: by 2002:a05:6a00:2189:b0:4bc:3def:b662 with SMTP id
 h9-20020a056a00218900b004bc3defb662mr32971770pfi.5.1641418617023; 
 Wed, 05 Jan 2022 13:36:57 -0800 (PST)
Received: from [192.168.1.13] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id t126sm4538pgc.61.2022.01.05.13.36.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Jan 2022 13:36:56 -0800 (PST)
Subject: Re: [PATCH v2] hw/arm/virt: KVM: Enable PAuth when supported by the
 host
To: Marc Zyngier <maz@kernel.org>, qemu-devel@nongnu.org
References: <20220103180507.2190429-1-maz@kernel.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c5bedb8e-55e3-877f-31aa-92d59e5aba34@linaro.org>
Date: Wed, 5 Jan 2022 13:36:55 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220103180507.2190429-1-maz@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.057,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 kvm@vger.kernel.org, Eric Auger <eric.auger@redhat.com>,
 kernel-team@android.com, kvmarm@lists.cs.columbia.edu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/3/22 10:05 AM, Marc Zyngier wrote:
> -        /*
> -         * KVM does not support modifications to this feature.
> -         * We have not registered the cpu properties when KVM
> -         * is in use, so the user will not be able to set them.
> -         */
> -        if (!kvm_enabled()) {
> -            arm_cpu_pauth_finalize(cpu, &local_err);
> -            if (local_err != NULL) {
> +	arm_cpu_pauth_finalize(cpu, &local_err);
> +	if (local_err != NULL) {
>                   error_propagate(errp, local_err);
>                   return;
> -            }
> -        }
> +	}

Looks like the indentation is off?

> +static bool kvm_arm_pauth_supported(void)
> +{
> +    return (kvm_check_extension(kvm_state, KVM_CAP_ARM_PTRAUTH_ADDRESS) &&
> +            kvm_check_extension(kvm_state, KVM_CAP_ARM_PTRAUTH_GENERIC));
> +}

Do we really need to have them both set to play the game?  Given that the only thing that 
happens is that we disable whatever host support exists, can we have "pauth enabled" mean 
whatever subset the host has?


> @@ -521,6 +527,17 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
>        */
>       struct kvm_vcpu_init init = { .target = -1, };
>   
> +    /*
> +     * Ask for Pointer Authentication if supported. We can't play the
> +     * SVE trick of synthetising the ID reg as KVM won't tell us

synthesizing

> +     * whether we have the architected or IMPDEF version of PAuth, so
> +     * we have to use the actual ID regs.
> +     */
> +    if (kvm_arm_pauth_supported()) {
> +        init.features[0] |= (1 << KVM_ARM_VCPU_PTRAUTH_ADDRESS |
> +			     1 << KVM_ARM_VCPU_PTRAUTH_GENERIC);

Align the two 1's.

Otherwise, it looks good.


r~

