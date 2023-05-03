Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 256916F5324
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 10:30:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu7r1-0003aa-My; Wed, 03 May 2023 04:28:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu7r0-0003YO-3m
 for qemu-devel@nongnu.org; Wed, 03 May 2023 04:28:50 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu7qy-0007dN-5s
 for qemu-devel@nongnu.org; Wed, 03 May 2023 04:28:49 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-3f178da21afso32256955e9.1
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 01:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683102526; x=1685694526;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/3gkMG6k/UaA/jYBoorQDzviip1XHMYSxpe0ebwQOl4=;
 b=mSh3URQJRU4IFSVcp3U7HrxgS2Z5iYmbORJX/dnNzOLrxyxC1JDlubWKu56WnCCb/R
 QnszRG8rD6Up4dJ05srgt9DP3L9aJE3MaVSPMiOkiKcgAI6l+TJqPthnBsueMwA8Rq+M
 /2DC3LVgWiv9WcO7wD5SfGhqMZT8F2KFp3I0O4G0Hs/8kzB1btzsTc1a1bv1f+T4y3RV
 EzkNe7l6vQgPMLOjJFUb3R4RyZaBP6oK1N7MDAJEn5AX6VSOW9LopSwy0ZLE9PooT2Aa
 9V4mH6DSmXiGtsyoITGNuYZPPREZcb3mQHoccjE4owQ9mztzIDkJu/bqW0/Bs5ynNx9v
 +eBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683102526; x=1685694526;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/3gkMG6k/UaA/jYBoorQDzviip1XHMYSxpe0ebwQOl4=;
 b=DGc51mleEWWFSk+rMV947nyKN5+dk7uDgIlI4d1DjmHYMGzfaptdNrUnIBN8QAng0X
 UV0arAjX1PFycRDzu1NnDClnjFZuZbfAWhlEIS0AwKgW7ltAEh5KhVH8HWAL2exFd79a
 pXx0CMqsDdycBuMdinYI7ZIUzH4poyBVof86XVEUeC6pjmLNXGu8niteHUGlPLZ8UX7C
 EuSbYzRIxjOx5SkwA6ifcQaQPANrOSi2MHDXH7DjZAB7KX7dI0mpqXu47Lmi2URjtJJB
 W5bPXAdamh7mlk/vShDmvp2dZoJa7ZDs4IgcMxNhGe4p9IGc37FSvUJvNGyLnvXNhdUy
 FzHA==
X-Gm-Message-State: AC+VfDxvB7ERjYL6Nuk6yLOpqlRugxhTggmKLd6DWq9qLtMG1wYlDiwh
 gA+C0d9zysrKuRgCJVNEpinqDg==
X-Google-Smtp-Source: ACHHUZ7Rj7YDaQZ7sBI8YlIhkovlzGAVziol+YoJ1If/3w6E+W0Lf+Hc0RXAefXZ5YWA6BuqbQCCOg==
X-Received: by 2002:a5d:6249:0:b0:306:4544:ca3e with SMTP id
 m9-20020a5d6249000000b003064544ca3emr354046wrv.19.1683102526535; 
 Wed, 03 May 2023 01:28:46 -0700 (PDT)
Received: from ?IPV6:2a02:c7c:74db:8d00:c01d:9d74:b630:9087?
 ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 u7-20020a5d5147000000b002cde25fba30sm33233880wrt.1.2023.05.03.01.28.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 May 2023 01:28:45 -0700 (PDT)
Message-ID: <a8b66b75-c698-6247-0cfe-c9438df570b8@linaro.org>
Date: Wed, 3 May 2023 09:28:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v11 02/14] accel: collecting TB execution count
Content-Language: en-US
To: Fei Wu <fei2.wu@intel.com>, alex.bennee@linaro.org, qemu-devel@nongnu.org
Cc: "Vanderson M. do Rosario" <vandersonmr2@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20230421132421.1617479-1-fei2.wu@intel.com>
 <20230421132421.1617479-3-fei2.wu@intel.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230421132421.1617479-3-fei2.wu@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 4/21/23 14:24, Fei Wu wrote:
> From: "Vanderson M. do Rosario" <vandersonmr2@gmail.com>
> 
> If a TB has a TBS (TBStatistics) with the TB_EXEC_STATS
> enabled, then we instrument the start code of this TB
> to atomically count the number of times it is executed.
> We count both the number of "normal" executions and atomic
> executions of a TB.
> 
> The execution count of the TB is stored in its respective
> TBS.
> 
> All TBStatistics are created by default with the flags from
> default_tbstats_flag.
> 
> Signed-off-by: Vanderson M. do Rosario <vandersonmr2@gmail.com>
> Message-Id: <20190829173437.5926-3-vandersonmr2@gmail.com>
> [AJB: Fix author]
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   accel/tcg/cpu-exec.c      |  6 ++++++
>   accel/tcg/tb-stats.c      |  6 ++++++
>   accel/tcg/tcg-runtime.c   |  8 ++++++++
>   accel/tcg/tcg-runtime.h   |  2 ++
>   accel/tcg/translate-all.c |  7 +++++--
>   accel/tcg/translator.c    | 10 ++++++++++
>   include/exec/gen-icount.h |  1 +
>   include/exec/tb-stats.h   | 18 ++++++++++++++++++
>   8 files changed, 56 insertions(+), 2 deletions(-)
> 
> diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
> index c815f2dbfd..d89f9fe493 100644
> --- a/accel/tcg/cpu-exec.c
> +++ b/accel/tcg/cpu-exec.c
> @@ -25,6 +25,7 @@
>   #include "trace.h"
>   #include "disas/disas.h"
>   #include "exec/exec-all.h"
> +#include "exec/tb-stats.h"
>   #include "tcg/tcg.h"
>   #include "qemu/atomic.h"
>   #include "qemu/rcu.h"
> @@ -564,7 +565,12 @@ void cpu_exec_step_atomic(CPUState *cpu)
>               mmap_unlock();
>           }
>   
> +        if (tb_stats_enabled(tb, TB_EXEC_STATS)) {
> +            tb->tb_stats->executions.atomic++;
> +        }

The write is protected by the exclusive lock, but the read might be accessible from the 
monitor, iiuc.  Which means you should use atomic_set(), for non-tearable write after 
non-atomic increment.

> @@ -148,3 +149,10 @@ void HELPER(exit_atomic)(CPUArchState *env)
>   {
>       cpu_loop_exit_atomic(env_cpu(env), GETPC());
>   }
> +
> +void HELPER(inc_exec_freq)(void *ptr)
> +{
> +    TBStatistics *stats = (TBStatistics *) ptr;
> +    tcg_debug_assert(stats);
> +    qatomic_inc(&stats->executions.normal);
> +}

Ug.  Do we really need an atomic update?

If we have multiple threads executing through the same TB, we'll get significant slow-down 
at the cost of not missing increments.  If we allow a non-atomic update, we'll get much 
less slow-down at the cost of missing a few increments.  But this is statistical only, so 
how much does it really matter?


r~

