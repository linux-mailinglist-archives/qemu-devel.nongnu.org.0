Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D113E873C
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Aug 2021 02:27:11 +0200 (CEST)
Received: from localhost ([::1]:53898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDc5O-0002LH-5A
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 20:27:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mDc4W-0001Vl-Jj
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 20:26:16 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:43920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mDc4U-0004hG-KY
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 20:26:16 -0400
Received: by mail-pl1-x631.google.com with SMTP id e19so336105pla.10
 for <qemu-devel@nongnu.org>; Tue, 10 Aug 2021 17:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=O68pW7jeH3R0EXUuT7k+CCgSu+pie81MRDIRI9I7kkI=;
 b=N9G2cWAjAMFgINat+T6tBcaRRXvvUza5W6LIevZ2dDb25Sl9GKQv3Xu7AJLLW31E86
 rEt7AdMmZGSRA4xyPpSXQ29eiaGIgEeFYZYRVi74BOs3vy6cUHYm9/1Qx/CSYkiVyc/e
 /On4i6tUbljlUUs4y7jC4im/AIAB91gQzc9V+yKxiKyA3A5M5dMLQsYTw+iwtnxJeyur
 bt1QoKiW8Du5bwoZ+TYjyvFFoRSAitWcpwVKZFs45BUJtvxq8/YlqFl4ANx7kMlzRCiV
 UAar1r1B0UXhelkKg7UY+ZaEk1C14g611h4E8eCGcbmJdawkJBn3tXGicTUiEodj7vc2
 j0DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=O68pW7jeH3R0EXUuT7k+CCgSu+pie81MRDIRI9I7kkI=;
 b=poaKgGOzwhvsljFqeAnLpGKyieAg1Cl4Ia5WTdPCS+ZpGlhW8SqMJy2Kxjq9KVTJ9k
 ftHHx5fwf707gZrbV7wFVE/D4jpleaqjnWE7f9K/ZNAgD3SnK2niyMyz5kXjQmgnxxEi
 OJHJ6oU9lgElIVrC84qZLetLCx862csJ6L2fCP8vYfx7unV8fg6PHPtahlrEUyoqE+op
 f7ejCE584iBjX7VmL1eVxpawtsE5sPdhgX71fOHOHCEb1O5S/ahS8TXfqW5W39haYTbX
 x6/5MCPOeiMrVsY0GTu/0ZVZ3HK4D1iujtN0teRTdoVfgciGDWKoQ9xaEB9mAIQA/ZmB
 zGcA==
X-Gm-Message-State: AOAM533Q4qE7mViiNbwCyri94+/kl5AlaSG0PMYTuM3dod4qazdrf2iN
 kgCbCXdqxkR1qYI+DmC/aV/UCw==
X-Google-Smtp-Source: ABdhPJzlUbEb1k+XSQTR9rB126x+GTGl0jirHy8po9/N5nYQ3/Zx2NILcxIUhU9CxtgHaTZIodOckQ==
X-Received: by 2002:a17:90a:6c45:: with SMTP id
 x63mr7580754pjj.0.1628641572995; 
 Tue, 10 Aug 2021 17:26:12 -0700 (PDT)
Received: from [192.168.6.169] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id 128sm662326pfe.55.2021.08.10.17.26.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Aug 2021 17:26:11 -0700 (PDT)
Subject: Re: [PATCH 04/19] target/ppc: PMU Book3s basic insns count for
 pseries TCG
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
References: <20210809131057.1694145-1-danielhb413@gmail.com>
 <20210809131057.1694145-5-danielhb413@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <58346b1b-733f-402e-6a7c-b6266cd6007b@linaro.org>
Date: Tue, 10 Aug 2021 14:26:06 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210809131057.1694145-5-danielhb413@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: clg@kaod.org, david@gibson.dropbear.id.au, qemu-ppc@nongnu.org,
 gustavo.romero@linaro.org, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/9/21 3:10 AM, Daniel Henrique Barboza wrote:
> The PMCC (PMC Control) bit in the MMCR0 register controls whether the
> counters PMC5 and PMC6 are being part of the performance monitor
> facility in a specific time. If PMCC allows it, PMC5 and PMC6 will
> always be used to measure instructions completed and cycles,
> respectively.
> 
> This patch adds the barebones of the Book3s PMU logic by enabling
> instruction counting, using the icount framework, using the performance
> monitor counters 5 and 6. The overall logic goes as follows:
> 
> - a helper is added to control the PMU state on each MMCR0 write. This
> allows for the PMU to start/stop as quick as possible;
> 
> - only PMC5 and PMC6 are being set. PMC6 (cycles) is default to 4*insns
> (for cycles per instruction) for now;
> 
> - the intended usage is to freeze the counters by setting MMCR0_FC, do
> any additional setting via MMCR1 (not implemented yet) and setting
> initial counter values,  and enable the PMU by zeroing MMCR0_FC. Software
> must freeze counters to read the results - on the fly reading of the PMCs
> will return the starting value of each one.
> 
> Since there will be more PMU exclusive code to be added next, let's also
> put the PMU logic in its own helper to keep all in the same place. The
> code is also repetitive and not really extensible to add more PMCs, but
> we'll handle this in the next patches.
> 
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>   target/ppc/cpu.h               |  4 ++
>   target/ppc/cpu_init.c          |  4 +-
>   target/ppc/helper.h            |  1 +
>   target/ppc/meson.build         |  1 +
>   target/ppc/pmu_book3s_helper.c | 78 ++++++++++++++++++++++++++++++++++
>   target/ppc/translate.c         | 14 ++++--
>   6 files changed, 97 insertions(+), 5 deletions(-)
>   create mode 100644 target/ppc/pmu_book3s_helper.c
> 
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index 4d96015f81..229abfe7ee 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -1175,6 +1175,10 @@ struct CPUPPCState {
>       uint32_t tm_vscr;
>       uint64_t tm_dscr;
>       uint64_t tm_tar;
> +
> +    /* PMU registers icount state */
> +    uint64_t pmc5_base_icount;
> +    uint64_t pmc6_base_icount;
>   };
>   
>   #define SET_FIT_PERIOD(a_, b_, c_, d_)          \
> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index 71062809c8..fce89ee994 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -6822,7 +6822,7 @@ static void register_book3s_pmu_sup_sprs(CPUPPCState *env)
>       spr_register_kvm(env, SPR_POWER_MMCR0, "MMCR0",
>                        SPR_NOACCESS, SPR_NOACCESS,
>                        &spr_read_pmu_generic, &spr_write_pmu_generic,
> -                     KVM_REG_PPC_MMCR0, 0x00000000);
> +                     KVM_REG_PPC_MMCR0, 0x80000000);
>       spr_register_kvm(env, SPR_POWER_MMCR1, "MMCR1",
>                        SPR_NOACCESS, SPR_NOACCESS,
>                        &spr_read_pmu_generic, &spr_write_pmu_generic,
> @@ -6870,7 +6870,7 @@ static void register_book3s_pmu_user_sprs(CPUPPCState *env)
>       spr_register(env, SPR_POWER_UMMCR0, "UMMCR0",
>                    &spr_read_pmu_ureg, &spr_write_pmu_ureg,
>                    &spr_read_ureg, &spr_write_ureg,
> -                 0x00000000);
> +                 0x80000000);
>       spr_register(env, SPR_POWER_UMMCR1, "UMMCR1",
>                    &spr_read_pmu_ureg, &spr_write_pmu_ureg,
>                    &spr_read_ureg, &spr_write_ureg,
> diff --git a/target/ppc/helper.h b/target/ppc/helper.h
> index 4076aa281e..5122632784 100644
> --- a/target/ppc/helper.h
> +++ b/target/ppc/helper.h
> @@ -20,6 +20,7 @@ DEF_HELPER_1(rfscv, void, env)
>   DEF_HELPER_1(hrfid, void, env)
>   DEF_HELPER_2(store_lpcr, void, env, tl)
>   DEF_HELPER_2(store_pcr, void, env, tl)
> +DEF_HELPER_2(store_mmcr0, void, env, tl)
>   #endif
>   DEF_HELPER_1(check_tlb_flush_local, void, env)
>   DEF_HELPER_1(check_tlb_flush_global, void, env)
> diff --git a/target/ppc/meson.build b/target/ppc/meson.build
> index b85f295703..bf252ca3ac 100644
> --- a/target/ppc/meson.build
> +++ b/target/ppc/meson.build
> @@ -14,6 +14,7 @@ ppc_ss.add(when: 'CONFIG_TCG', if_true: files(
>     'int_helper.c',
>     'mem_helper.c',
>     'misc_helper.c',
> +  'pmu_book3s_helper.c',
>     'timebase_helper.c',
>     'translate.c',
>   ))
> diff --git a/target/ppc/pmu_book3s_helper.c b/target/ppc/pmu_book3s_helper.c
> new file mode 100644
> index 0000000000..fe16fcfce0
> --- /dev/null
> +++ b/target/ppc/pmu_book3s_helper.c
> @@ -0,0 +1,78 @@
> +/*
> + * PowerPC Book3s PMU emulation helpers for QEMU TCG
> + *
> + *  Copyright IBM Corp. 2021
> + *
> + * Authors:
> + *  Daniel Henrique Barboza      <danielhb413@gmail.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "cpu.h"
> +#include "exec/exec-all.h"
> +#include "exec/helper-proto.h"
> +#include "qemu/error-report.h"
> +#include "qemu/main-loop.h"
> +
> +static uint64_t get_insns(void)
> +{
> +    return (uint64_t)icount_get_raw();
> +}

So... this will just abort for user-only, which I suppose is fair since you won't be 
setting the other control bits there.

But I don't know what it will do if !icount_enabled().  Certainly not provide you with any 
meaningful value.  Given that icount affects all TCG translation, and is only enabled from 
the qemu command-line, do you really want to rely on that for a niche feature?

> +/* PMC5 always count instructions */
> +static void freeze_PMC5_value(CPUPPCState *env)
> +{
> +    uint64_t insns = get_insns() - env->pmc5_base_icount;
> +
> +    env->spr[SPR_POWER_PMC5] += insns;
> +    env->pmc5_base_icount += insns;
> +}
> +
> +/* PMC6 always count cycles */
> +static void freeze_PMC6_value(CPUPPCState *env)
> +{
> +    uint64_t insns = get_insns() - env->pmc6_base_icount;
> +
> +    env->spr[SPR_POWER_PMC6] += get_cycles(insns);
> +    env->pmc6_base_icount += insns;
> +}
...
> +            freeze_PMC5_value(env);
> +            freeze_PMC6_value(env);

Why would you read get_insns() for PMC5 and 6 separately?


r~

