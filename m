Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 140AA67F10E
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 23:19:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLX4L-0003qD-0a; Fri, 27 Jan 2023 17:19:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLX4I-0003ps-Uo
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 17:19:34 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLX4H-0003CU-3k
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 17:19:34 -0500
Received: by mail-pl1-x62e.google.com with SMTP id jl3so6361926plb.8
 for <qemu-devel@nongnu.org>; Fri, 27 Jan 2023 14:19:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2F0G/KYZ18cB3iNKPz0P3iOhR9Epfc6t0GxL0CsPIEo=;
 b=ah1h6zUX7Ig8OzT0bhI+tRViLelxk3Hx2gbF4XcnBlhTxwrVUsQLyyXX+u9bj+QnPd
 EzdhwSJAuxdgrDonDze5+bUBwqa5wlLNvpOGbpRF08UjG+U2aFM53iH72F9itLCVAsVZ
 37ckuS4q+m3VfYxYhHmxs4n20U7saX34ycY72BwYSjsnhw8C4nPk1ufA3uKEyPKZmqdP
 cjgT32mWJ8rMVIYlzzOY4B29glEElVLXyUgs8zus5I8p3+9HAFx7VrGf3eGXUVBJ/7z+
 9be3UxzBxBZgMvvF3XewsN/XxbrpM8CQgszBnWBwjmjbhSPAKHVUjjfdKf0sZHauSqYN
 4kqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2F0G/KYZ18cB3iNKPz0P3iOhR9Epfc6t0GxL0CsPIEo=;
 b=XeGj16T9vaJL4pPrUyGonv+LsFmM2OJAGJI05obFAyqyVO/IBNl7PlYUaC7ORvQL10
 r5VL/WDIJGvvnLP3AA82U9vxIFbAkrwdgoyUp7B1qAcn5ovevSqB8NneHiUoqRlGhiat
 cOcLXV/fglz+miBALN8090zOWz2gLjJtQ7bwi7Y/cmjnodQ6ueouKEqV7ip7tnyH+OXM
 1PYMVzEU2CmxKOIQcSl0cg648MDbX6NxkAsSt+xTo6A4oxT15c3wvNps+FMGkaN4Fxfh
 WjtmWdPP7dOC3LcU8CRQiUn16asNibTFXWfThseeHqtNl9McKdM8dWVfaAJlf3y2rALe
 QVCQ==
X-Gm-Message-State: AFqh2kod88nwJkv48MYs7Jl0LyGCJFToUvy7aaMULHhmk1PFDyQVVyMg
 yWiM3HrStxYNQS+Vqakdt+JXrA==
X-Google-Smtp-Source: AMrXdXtkSb76iuI4yLfek+BJ7WDwNji/pgUKtHI00AbsKbAiF40o7jToP7zdzwMk+N0GR4PLLG2eIA==
X-Received: by 2002:a17:903:124c:b0:194:d664:be3a with SMTP id
 u12-20020a170903124c00b00194d664be3amr37843329plh.16.1674857971443; 
 Fri, 27 Jan 2023 14:19:31 -0800 (PST)
Received: from [192.168.50.174] (rrcs-173-197-98-118.west.biz.rr.com.
 [173.197.98.118]) by smtp.gmail.com with ESMTPSA id
 e7-20020a170902744700b001948ff5cc32sm3323606plt.215.2023.01.27.14.19.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Jan 2023 14:19:30 -0800 (PST)
Message-ID: <ec1ca676-8dcc-e18b-4f86-0cb6238c0816@linaro.org>
Date: Fri, 27 Jan 2023 12:19:27 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH 06/16] target/arm/kvm-rme: Initialize vCPU
Content-Language: en-US
To: Jean-Philippe Brucker <jean-philippe@linaro.org>, peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, pbonzini@redhat.com,
 eblake@redhat.com, armbru@redhat.com, berrange@redhat.com,
 eduardo@habkost.net, alex.bennee@linaro.org
References: <20230127150727.612594-1-jean-philippe@linaro.org>
 <20230127150727.612594-7-jean-philippe@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230127150727.612594-7-jean-philippe@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 1/27/23 05:07, Jean-Philippe Brucker wrote:
> The target code calls kvm_arm_vcpu_init() to mark the vCPU as part of a
> realm. RME support does not use the register lists, because the host can
> only set the boot PC and registers x0-x7. The rest is private to the
> Realm and saved/restored by the RMM.
> 
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---
>   target/arm/cpu.h     |  3 ++
>   target/arm/kvm_arm.h |  1 +
>   target/arm/helper.c  |  8 ++++++
>   target/arm/kvm-rme.c | 10 +++++++
>   target/arm/kvm.c     | 12 ++++++++
>   target/arm/kvm64.c   | 65 ++++++++++++++++++++++++++++++++++++++++++--
>   6 files changed, 97 insertions(+), 2 deletions(-)
> 
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 9aeed3c848..7d8397985f 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -937,6 +937,9 @@ struct ArchCPU {
>       /* KVM steal time */
>       OnOffAuto kvm_steal_time;
>   
> +    /* Realm Management Extension */
> +    bool kvm_rme;
> +
>       /* Uniprocessor system with MP extensions */
>       bool mp_is_up;
>   
> diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
> index 00d3df8cac..e4dc7fbb8d 100644
> --- a/target/arm/kvm_arm.h
> +++ b/target/arm/kvm_arm.h
> @@ -373,6 +373,7 @@ int kvm_arm_rme_init(ConfidentialGuestSupport *cgs, Error **errp);
>   int kvm_arm_rme_vm_type(MachineState *ms);
>   
>   bool kvm_arm_rme_enabled(void);
> +int kvm_arm_rme_vcpu_init(CPUState *cs);
>   
>   #else
>   
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index d8c8223ec3..52360ae2ff 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -126,6 +126,10 @@ bool write_cpustate_to_list(ARMCPU *cpu, bool kvm_sync)
>       int i;
>       bool ok = true;
>   
> +    if (cpu->kvm_rme) {
> +        return ok;
> +    }
> +
>       for (i = 0; i < cpu->cpreg_array_len; i++) {
>           uint32_t regidx = kvm_to_cpreg_id(cpu->cpreg_indexes[i]);
>           const ARMCPRegInfo *ri;
> @@ -171,6 +175,10 @@ bool write_list_to_cpustate(ARMCPU *cpu)
>       int i;
>       bool ok = true;
>   
> +    if (cpu->kvm_rme) {
> +        return ok;
> +    }
> +
>       for (i = 0; i < cpu->cpreg_array_len; i++) {
>           uint32_t regidx = kvm_to_cpreg_id(cpu->cpreg_indexes[i]);
>           uint64_t v = cpu->cpreg_values[i];
> diff --git a/target/arm/kvm-rme.c b/target/arm/kvm-rme.c
> index d7cdca1cbf..3833b187f9 100644
> --- a/target/arm/kvm-rme.c
> +++ b/target/arm/kvm-rme.c
> @@ -118,6 +118,16 @@ int kvm_arm_rme_init(ConfidentialGuestSupport *cgs, Error **errp)
>       return 0;
>   }
>   
> +int kvm_arm_rme_vcpu_init(CPUState *cs)
> +{
> +    ARMCPU *cpu = ARM_CPU(cs);
> +
> +    if (kvm_arm_rme_enabled()) {
> +        cpu->kvm_rme = true;
> +    }
> +    return 0;
> +}
> +
>   int kvm_arm_rme_vm_type(MachineState *ms)
>   {
>       if (cgs_to_rme(ms->cgs)) {
> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index f022c644d2..fcddead4fe 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -449,6 +449,10 @@ int kvm_arm_init_cpreg_list(ARMCPU *cpu)
>       int i, ret, arraylen;
>       CPUState *cs = CPU(cpu);
>   
> +    if (cpu->kvm_rme) {
> +        return 0;
> +    }
> +
>       rl.n = 0;
>       ret = kvm_vcpu_ioctl(cs, KVM_GET_REG_LIST, &rl);
>       if (ret != -E2BIG) {
> @@ -521,6 +525,10 @@ bool write_kvmstate_to_list(ARMCPU *cpu)
>       int i;
>       bool ok = true;
>   
> +    if (cpu->kvm_rme) {
> +        return ok;
> +    }
> +
>       for (i = 0; i < cpu->cpreg_array_len; i++) {
>           struct kvm_one_reg r;
>           uint64_t regidx = cpu->cpreg_indexes[i];
> @@ -557,6 +565,10 @@ bool write_list_to_kvmstate(ARMCPU *cpu, int level)
>       int i;
>       bool ok = true;
>   
> +    if (cpu->kvm_rme) {
> +        return ok;
> +    }

I don't think that simply returning "ok" is best.  We shouldn't be calling this function 
at all with rme enabled.


r~

