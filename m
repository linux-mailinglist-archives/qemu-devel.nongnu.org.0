Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34EAC6CC7B7
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 18:17:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phBz4-0000Dg-96; Tue, 28 Mar 2023 12:15:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1phBz1-0000Cc-UC
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 12:15:39 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1phByz-0007gr-0v
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 12:15:39 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 m6-20020a05600c3b0600b003ee6e324b19so7895582wms.1
 for <qemu-devel@nongnu.org>; Tue, 28 Mar 2023 09:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680020135;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DWKWWkSsnpfRn2+LYEIqq1vAGExKdFNDPfBo77h5+cM=;
 b=XifWTcm1xnu6f9aPouPR7VpIbR1N50dcIM54qN5Mlbel5sTiLdbYCmSrtLw+KEdPPn
 1cF9OK2tzNRfBtBzKhUWKFrzydK8HB4RjTKxG3lRQznlJeHEt9b18xI81tjKIDcLO6Eo
 YZN+JIkHNrswH2apXYp8qCAmDm1e5xx0qqkC15FhCIwF6ikGsN0usjVkw1cSN9SUrgnK
 8eYG+LVZqlmkc8PnWAVpdiGIvfXNjoI6Yim82jOq/aaqYsae+Z9+beMNWCNpH65ymKQM
 Iq0Ggbxz0pC8gHx8Yu7TY2O7CoIbWyEFj/IQVWk10QxRBgFl8Cd+FqnAsOaeBP7S7dNP
 Oebw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680020135;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DWKWWkSsnpfRn2+LYEIqq1vAGExKdFNDPfBo77h5+cM=;
 b=sUbwKFIWzeNWciCAJvDd6PLYD/ErgdFviF5pxfMN4L7PJVp2VoaPNIMxygVG992bAB
 X692AD+RCIXm0yVRVu1OqKdTSOiajlNTsw73kdiRDFcDcl1RUK/8nzBcZjMA8OCQwQei
 5Oh55rcTFXhwD7o2UG72TQQ1iOSnnZtfevTUMf6WqQQSPIEJYRm8iaD8k8QJnmlwEUHZ
 5u6OyfziPZu5qDcxvoqMMfHfsC02f6ZdatX3XK9qq3wznk/pmXgrdng8XCxSYSSM7zAx
 e+Ax3b1Fmiy63fqgaKmmp/7C5yjAeRTC8Zd1ZeGE6nlB0bgjE2ZJMyJaJwtgOSxY/Xr3
 KMeg==
X-Gm-Message-State: AO0yUKX/fSTMgg9t+hXYJF613+gKpuGiTITpYoYNdBSgCGKxAafGnEf9
 Y8rxqDHizUt/bwuSHRnOBZaoFwaoG9HmMjhTKWg=
X-Google-Smtp-Source: AK7set9OcnlChpyZKYyxyXwjedxJze5iXZPnnxbaugRBy5012tIcIyFoZkfRD1TZBGXun9T1yu26jg==
X-Received: by 2002:a05:600c:2199:b0:3ee:3fd7:5f84 with SMTP id
 e25-20020a05600c219900b003ee3fd75f84mr12627963wme.6.1680020135178; 
 Tue, 28 Mar 2023 09:15:35 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.210.212])
 by smtp.gmail.com with ESMTPSA id
 l10-20020a7bc44a000000b003ed246c1d28sm17270217wmi.44.2023.03.28.09.15.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Mar 2023 09:15:34 -0700 (PDT)
Message-ID: <fff8236b-831c-c844-06d4-7eb417367e23@linaro.org>
Date: Tue, 28 Mar 2023 18:15:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH-for-8.0 2/3] softmmu: Restrict cpu_check_watchpoint /
 address_matches to TCG accel
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>, kvm@vger.kernel.org,
 qemu-s390x@nongnu.org, Fabiano Rosas <farosas@suse.de>,
 David Hildenbrand <david@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Greg Kurz <groug@kaod.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Yanan Wang <wangyanan55@huawei.com>, qemu-ppc@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org
References: <20230328160203.13510-1-philmd@linaro.org>
 <20230328160203.13510-3-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230328160203.13510-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 28/3/23 18:02, Philippe Mathieu-Daudé wrote:
> Both cpu_check_watchpoint() and cpu_watchpoint_address_matches()
> are specific to TCG system emulation. Declare them in "tcg-cpu-ops.h"
> to be sure accessing them from non-TCG code is a compilation error.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/hw/core/cpu.h         | 37 ------------------------------
>   include/hw/core/tcg-cpu-ops.h | 43 +++++++++++++++++++++++++++++++++++
>   2 files changed, 43 insertions(+), 37 deletions(-)
> 
> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> index 821e937020..ce312745d5 100644
> --- a/include/hw/core/cpu.h
> +++ b/include/hw/core/cpu.h
> @@ -970,17 +970,6 @@ static inline void cpu_watchpoint_remove_by_ref(CPUState *cpu,
>   static inline void cpu_watchpoint_remove_all(CPUState *cpu, int mask)
>   {
>   }
> -
> -static inline void cpu_check_watchpoint(CPUState *cpu, vaddr addr, vaddr len,
> -                                        MemTxAttrs atr, int fl, uintptr_t ra)
> -{
> -}
> -
> -static inline int cpu_watchpoint_address_matches(CPUState *cpu,
> -                                                 vaddr addr, vaddr len)
> -{
> -    return 0;
> -}
>   #else
>   int cpu_watchpoint_insert(CPUState *cpu, vaddr addr, vaddr len,
>                             int flags, CPUWatchpoint **watchpoint);
> @@ -988,32 +977,6 @@ int cpu_watchpoint_remove(CPUState *cpu, vaddr addr,
>                             vaddr len, int flags);
>   void cpu_watchpoint_remove_by_ref(CPUState *cpu, CPUWatchpoint *watchpoint);
>   void cpu_watchpoint_remove_all(CPUState *cpu, int mask);
> -
> -/**
> - * cpu_check_watchpoint:
> - * @cpu: cpu context
> - * @addr: guest virtual address
> - * @len: access length
> - * @attrs: memory access attributes
> - * @flags: watchpoint access type
> - * @ra: unwind return address
> - *
> - * Check for a watchpoint hit in [addr, addr+len) of the type
> - * specified by @flags.  Exit via exception with a hit.
> - */
> -void cpu_check_watchpoint(CPUState *cpu, vaddr addr, vaddr len,
> -                          MemTxAttrs attrs, int flags, uintptr_t ra);
> -
> -/**
> - * cpu_watchpoint_address_matches:
> - * @cpu: cpu context
> - * @addr: guest virtual address
> - * @len: access length
> - *
> - * Return the watchpoint flags that apply to [addr, addr+len).
> - * If no watchpoint is registered for the range, the result is 0.
> - */
> -int cpu_watchpoint_address_matches(CPUState *cpu, vaddr addr, vaddr len);
>   #endif
>   
>   /**
> diff --git a/include/hw/core/tcg-cpu-ops.h b/include/hw/core/tcg-cpu-ops.h
> index 20e3c0ffbb..0ae08df47e 100644
> --- a/include/hw/core/tcg-cpu-ops.h
> +++ b/include/hw/core/tcg-cpu-ops.h
> @@ -175,4 +175,47 @@ struct TCGCPUOps {
>   
>   };
>   
> +#if defined(CONFIG_USER_ONLY)
> +
> +static inline void cpu_check_watchpoint(CPUState *cpu, vaddr addr, vaddr len,
> +                                        MemTxAttrs atr, int fl, uintptr_t ra)
> +{
> +}
> +
> +static inline int cpu_watchpoint_address_matches(CPUState *cpu,
> +                                                 vaddr addr, vaddr len)
> +{
> +    return 0;
> +}
> +
> +#else
> +
> +/**
> + * cpu_check_watchpoint:
> + * @cpu: cpu context
> + * @addr: guest virtual address
> + * @len: access length
> + * @attrs: memory access attributes
> + * @flags: watchpoint access type
> + * @ra: unwind return address
> + *
> + * Check for a watchpoint hit in [addr, addr+len) of the type
> + * specified by @flags.  Exit via exception with a hit.
> + */
> +void cpu_check_watchpoint(CPUState *cpu, vaddr addr, vaddr len,
> +                          MemTxAttrs attrs, int flags, uintptr_t ra);
> +
> +/**
> + * cpu_watchpoint_address_matches:
> + * @cpu: cpu context
> + * @addr: guest virtual address
> + * @len: access length
> + *
> + * Return the watchpoint flags that apply to [addr, addr+len).
> + * If no watchpoint is registered for the range, the result is 0.
> + */
> +int cpu_watchpoint_address_matches(CPUState *cpu, vaddr addr, vaddr len);
> +
> +#endif
> +
>   #endif /* TCG_CPU_OPS_H */

This hunk is missing:

-- >8 --
diff --git a/target/arm/tcg/mte_helper.c b/target/arm/tcg/mte_helper.c
index fee3c7eb96..22802b659d 100644
--- a/target/arm/tcg/mte_helper.c
+++ b/target/arm/tcg/mte_helper.c
@@ -29,2 +29,3 @@
  #include "qemu/guest-random.h"
+#include "hw/core/tcg-cpu-ops.h"

diff --git a/target/arm/tcg/sve_helper.c b/target/arm/tcg/sve_helper.c
index 9a8951afa4..ace2d88f8d 100644
--- a/target/arm/tcg/sve_helper.c
+++ b/target/arm/tcg/sve_helper.c
@@ -29,3 +29,3 @@
  #include "sve_ldst_internal.h"
-
+#include "hw/core/tcg-cpu-ops.h"

diff --git a/target/s390x/tcg/mem_helper.c b/target/s390x/tcg/mem_helper.c
index b93dbd3dad..1e7f72a2f2 100644
--- a/target/s390x/tcg/mem_helper.c
+++ b/target/s390x/tcg/mem_helper.c
@@ -30,2 +30,3 @@
  #include "qemu/atomic128.h"
+#include "hw/core/tcg-cpu-ops.h"
  #include "trace.h"
---

