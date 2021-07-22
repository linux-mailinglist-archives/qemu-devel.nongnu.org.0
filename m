Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4171F3D2FF4
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 00:49:49 +0200 (CEST)
Received: from localhost ([::1]:41456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6hVk-0001oU-6B
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 18:49:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6hUd-0000Qj-0w
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 18:48:39 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:43584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6hUb-0006IJ-Af
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 18:48:38 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 m2-20020a17090a71c2b0290175cf22899cso1326456pjs.2
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 15:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Vpbc5CbXEMbBaSskTdUu0C0Hw1f8R+ZF5p7fPTDM1zM=;
 b=qGjEo8/zdKysVmSiCkWi8v1FS8YCDLfRKIH7kFfySOjEByW+6hHCqHFKgK1klZZXVH
 mpKyVXuZb5SpZrLxM7+hSXWBqSiXYKx1sHStl1WLK4jwSHCSu8sRC2XLR4AT5OJT6hAF
 AnHMAChoYjYDCqRXfY0+T1keLpbeLqyJZ7yZe1W8x862fmGC5EUwjsE/kE0Tbn93X3wa
 OpeifRsZMIXq8pLSDYJb+avgBDzaG8qtOsqtI3PRBCA3cQ0wAHmFmhbDxcAITulNvqeF
 V5pfByBd+IJKq9jFWqejj91pOa/ZrM84dm9YDQzz7jwgvdAalmEcxHZkIsWKLtprs6c2
 JqFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Vpbc5CbXEMbBaSskTdUu0C0Hw1f8R+ZF5p7fPTDM1zM=;
 b=fg+zL5edRoCHcOSylDWHE8KSzF9eDEhGhZPkkc99iwylV4kNhY3hxdYlMhv9ag7ALB
 jbX6FTHOEl3re/EhioLhQtEdNg5UJ6Kk7BS3f5E87n4cQS669R0BsHhqBh/6yhF4U7+9
 NW0yQvzGPdjrBBZQa7ntZwhOEXtXQIhtwV+ZGKq+uHFV/S8J+bdoQfH7Ew2Op4wqojBT
 g5YZwm6AYDIGeXQ7ItjBzGsSysfYGB7sYD2kqRyWtnfhFq98rb26Qv+nedfvFBFh4G/Q
 9Zmc7U+n5YypZfb74RN1n/TuW/rSFsRw2d5J2eanuLtK7wAkwBWAdX93gC8hSylTFXDc
 wL/g==
X-Gm-Message-State: AOAM532eFectM3TCY2NsbI03DHrVU2lz5GT2+lm5RPbfunnW0D22mMtF
 x3SqC8Ouaoews+keQztOlfLFjQ==
X-Google-Smtp-Source: ABdhPJwz1XZsOTAbkSN8UZWpEL9ZrctbXSI4LYRUxOz7LAXq12qPUo1/s926HQ8EgVN5DDHzlp+Xag==
X-Received: by 2002:a62:7d16:0:b029:32d:cfc4:279c with SMTP id
 y22-20020a627d160000b029032dcfc4279cmr1918585pfc.8.1626994115742; 
 Thu, 22 Jul 2021 15:48:35 -0700 (PDT)
Received: from [192.168.3.43] (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id c23sm16197436pfo.174.2021.07.22.15.48.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jul 2021 15:48:35 -0700 (PDT)
Subject: Re: [PATCH v2 05/22] target/loongarch: Add memory management support
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <1626861198-6133-1-git-send-email-gaosong@loongson.cn>
 <1626861198-6133-6-git-send-email-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5f95af00-67d6-ae9d-580c-57d957f94376@linaro.org>
Date: Thu, 22 Jul 2021 12:48:31 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1626861198-6133-6-git-send-email-gaosong@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.203,
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, chenhuacai@gmail.com,
 philmd@redhat.com, yangxiaojuan@loongson.cn, laurent@vivier.eu,
 maobibo@loongson.cn, alistair.francis@wdc.com, pbonzini@redhat.com,
 alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/20/21 11:53 PM, Song Gao wrote:
> This patch introduces one memory-management-related functions
> - loongarch_cpu_tlb_fill()
> 
> Signed-off-by: Song Gao <gaosong@loongson.cn>
> ---
>   target/loongarch/cpu.c        |   1 +
>   target/loongarch/cpu.h        |   9 ++++
>   target/loongarch/tlb_helper.c | 103 ++++++++++++++++++++++++++++++++++++++++++
>   3 files changed, 113 insertions(+)
>   create mode 100644 target/loongarch/tlb_helper.c
> 
> diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
> index 8eaa778..6269dd9 100644
> --- a/target/loongarch/cpu.c
> +++ b/target/loongarch/cpu.c
> @@ -269,6 +269,7 @@ static struct TCGCPUOps loongarch_tcg_ops = {
>       .initialize = loongarch_tcg_init,
>       .synchronize_from_tb = loongarch_cpu_synchronize_from_tb,
>       .cpu_exec_interrupt = loongarch_cpu_exec_interrupt,
> +    .tlb_fill = loongarch_cpu_tlb_fill,
>   };
>   #endif /* CONFIG_TCG */
>   
> diff --git a/target/loongarch/cpu.h b/target/loongarch/cpu.h
> index 1db8bb5..5c06122 100644
> --- a/target/loongarch/cpu.h
> +++ b/target/loongarch/cpu.h
> @@ -287,4 +287,13 @@ static inline void compute_hflags(CPULoongArchState *env)
>   
>   const char *loongarch_exception_name(int32_t exception);
>   
> +/* tlb_helper.c */
> +bool loongarch_cpu_tlb_fill(CPUState *cs,
> +                            vaddr address,
> +                            int size,
> +                            MMUAccessType access_type,
> +                            int mmu_idx,
> +                            bool probe,
> +                            uintptr_t retaddr);
> +
>   #endif /* LOONGARCH_CPU_H */
> diff --git a/target/loongarch/tlb_helper.c b/target/loongarch/tlb_helper.c
> new file mode 100644
> index 0000000..b59a995
> --- /dev/null
> +++ b/target/loongarch/tlb_helper.c
> @@ -0,0 +1,103 @@
> +/*
> + * LoongArch tlb emulation helpers for qemu.
> + *
> + * Copyright (c) 2021 Loongson Technology Corporation Limited
> + *
> + * SPDX-License-Identifier: LGPL-2.1+
> + */
> +
> +#include "qemu/osdep.h"
> +#include "cpu.h"
> +#include "cpu-csr.h"
> +#include "exec/helper-proto.h"
> +#include "exec/exec-all.h"
> +#include "exec/cpu_ldst.h"
> +#include "exec/log.h"
> +
> +enum {
> +    TLBRET_PE = -7,
> +    TLBRET_XI = -6,
> +    TLBRET_RI = -5,
> +    TLBRET_DIRTY = -4,
> +    TLBRET_INVALID = -3,
> +    TLBRET_NOMATCH = -2,
> +    TLBRET_BADADDR = -1,
> +    TLBRET_MATCH = 0
> +};
> +
> +static void raise_mmu_exception(CPULoongArchState *env, target_ulong address,
> +                                MMUAccessType access_type, int tlb_error)
> +{
> +    CPUState *cs = env_cpu(env);
> +    int exception = 0, error_code = 0;
> +
> +    if (access_type == MMU_INST_FETCH) {
> +        error_code |= INST_INAVAIL;
> +    }
> +
> +    switch (tlb_error) {
> +    default:
> +    case TLBRET_BADADDR:
> +        exception = EXCP_ADE;
> +        break;
> +    case TLBRET_NOMATCH:
> +        /* No TLB match for a mapped address */
> +        if (access_type == MMU_DATA_STORE) {
> +            exception = EXCP_TLBS;
> +        } else {
> +            exception = EXCP_TLBL;
> +        }
> +        error_code |= TLB_NOMATCH;
> +        break;
> +    case TLBRET_INVALID:
> +        /* TLB match with no valid bit */
> +        if (access_type == MMU_DATA_STORE) {
> +            exception = EXCP_TLBS;
> +        } else {
> +            exception = EXCP_TLBL;
> +        }
> +        break;
> +    case TLBRET_DIRTY:
> +        exception = EXCP_TLBM;
> +        break;
> +    case TLBRET_XI:
> +        /* Execute-Inhibit Exception */
> +        exception = EXCP_TLBXI;
> +        break;
> +    case TLBRET_RI:
> +        /* Read-Inhibit Exception */
> +        exception = EXCP_TLBRI;
> +        break;
> +    case TLBRET_PE:
> +        /* Privileged Exception */
> +        exception = EXCP_TLBPE;
> +        break;
> +    }
> +
> +    if (tlb_error == TLBRET_NOMATCH) {
> +        env->CSR_TLBRBADV = address;
> +        env->CSR_TLBREHI = address & (TARGET_PAGE_MASK << 1);
> +        cs->exception_index = exception;
> +        env->error_code = error_code;
> +        return;
> +    }
> +
> +    /* Raise exception */
> +    env->CSR_BADV = address;
> +    cs->exception_index = exception;
> +    env->error_code = error_code;
> +    env->CSR_TLBEHI = address & (TARGET_PAGE_MASK << 1);
> +}
> +
> +bool loongarch_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
> +                       MMUAccessType access_type, int mmu_idx,
> +                       bool probe, uintptr_t retaddr)
> +{
> +    LoongArchCPU *cpu = LOONGARCH_CPU(cs);
> +    CPULoongArchState *env = &cpu->env;
> +    int ret = TLBRET_BADADDR;
> +
> +    /* data access */
> +    raise_mmu_exception(env, address, access_type, ret);
> +    do_raise_exception_err(env, cs->exception_index, env->error_code, retaddr);
> +}

Again, almost all of this does not apply for user-only.

r~

> 


