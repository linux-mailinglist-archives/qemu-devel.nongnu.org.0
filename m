Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 326506B4F24
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 18:40:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pagiT-0004cV-Fm; Fri, 10 Mar 2023 12:39:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pagiR-0004c4-UB
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 12:39:39 -0500
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pagiP-00076t-VN
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 12:39:39 -0500
Received: by mail-pg1-x532.google.com with SMTP id bn17so3486297pgb.10
 for <qemu-devel@nongnu.org>; Fri, 10 Mar 2023 09:39:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678469976;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2q+OleUgkTS8FkdfeEVa+H+oWb4zIZt8kqU0s5+Pi0E=;
 b=fl2FDg4eEmq4si2YA+uPMslW3OdQGHBmhZHXqodHKXHgQdXCqB9ctxMZCRbaCi8FGE
 RgMRpAN+JEyWA4bidSJU8UWZmNCgvPNSFhR3YFWthZ9+fBsce4rwOmYe2Pf0rqtUv+nf
 2qmjzk+rI3PURy44mn179XkjuwvTPq+IXEwvLVBW4W6UgIqirJn3sypBtx8Fq61YMRTJ
 /1bMvHqJVZ2RgjVifqZGxI/9fi+6fzPdkbAgIwqJP/s2O7dlIrWohFsuLcHiO5IhK9dN
 09lU0B/YiNRgt8PQb4jKXpoVhItg6qWvEmfmm9Vn5JKLsk94JhZN/2598djSwwqqeum3
 icAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678469976;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2q+OleUgkTS8FkdfeEVa+H+oWb4zIZt8kqU0s5+Pi0E=;
 b=8FHQfJqYybCQ9RVk1CZ5sBGGk0clV41b4HKAeC+WqPNNASAyVHlCD4vN6WoAOBeJHy
 vJQt2T9h38ZLvlMFRO5CjI0Ov2F1bPc7sDZ6dl6p3WnKMNh7GlK5RoWil3mVSnsC8ucA
 aDVyvezxBTjaowZ+WZf5DyBeg2CYxMPLlyq3cw2GML9lJADH+CByCYNnSwYA3FX9Jiug
 bwfFuqgH2jdGNET3OT2lK0liREC1KvavBlqQU5h9EiHoUMyP7xfTK5ObY6vhTs1KwZmC
 i+EunTfV6ttDgD/88a4nWRyAszq8xM1ICEoGtB9D/qcjVlcXyiWl6SARbaZCO35BGxXo
 gJzQ==
X-Gm-Message-State: AO0yUKWYb5s1oMvCzX090rgOeUgFsf/DFvD4W5Ykf1PoFDZT7WqGLhBC
 OMgT2YWzWeLpfKyODrMLOi5+tw==
X-Google-Smtp-Source: AK7set9hbfvUlT7hfDtLop55JRbzuROxhhwka5yN1L+HNmglBhLjzEY/ogNj+BJHvaMqQ/ToLTRlmA==
X-Received: by 2002:aa7:9901:0:b0:5a8:482f:c32e with SMTP id
 z1-20020aa79901000000b005a8482fc32emr25747811pff.27.1678469976277; 
 Fri, 10 Mar 2023 09:39:36 -0800 (PST)
Received: from ?IPV6:2602:ae:154a:9f01:cc1c:ced1:1ec5:bd62?
 ([2602:ae:154a:9f01:cc1c:ced1:1ec5:bd62])
 by smtp.gmail.com with ESMTPSA id
 a6-20020aa78646000000b005a8ae0c52cfsm116989pfo.16.2023.03.10.09.39.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Mar 2023 09:39:35 -0800 (PST)
Message-ID: <97cbb69d-eae9-e7e9-cabd-afdba875aed8@linaro.org>
Date: Fri, 10 Mar 2023 09:39:33 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 07/11] tcg: Clear plugin_mem_cbs on TB exit
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org,
 Peter Xu <peterx@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, Peter Maydell <peter.maydell@linaro.org>,
 Cleber Rosa <crosa@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Beraldo Leal <bleal@redhat.com>
References: <20230310103123.2118519-1-alex.bennee@linaro.org>
 <20230310103123.2118519-8-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230310103123.2118519-8-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
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

On 3/10/23 02:31, Alex Bennée wrote:
> From: Richard Henderson <richard.henderson@linaro.org>
> 
> Do this in cpu_tb_exec (normal exit) and cpu_loop_exit (exception),
> adjacent to where we reset can_do_io.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1381
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> Message-Id: <20230301024737.1210851-2-richard.henderson@linaro.org>
> [AJB: use plugin_gen_disable_mem_helpers()]
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

This is missing Emilio's comment to remove the two existing calls to 
qemu_plugin_disable_mem_helpers which become duplicate with this change.


r~

> ---
>   accel/tcg/cpu-exec-common.c | 3 +++
>   accel/tcg/cpu-exec.c        | 4 ++--
>   2 files changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/accel/tcg/cpu-exec-common.c b/accel/tcg/cpu-exec-common.c
> index c7bc8c6efa..e5847e9731 100644
> --- a/accel/tcg/cpu-exec-common.c
> +++ b/accel/tcg/cpu-exec-common.c
> @@ -21,6 +21,7 @@
>   #include "sysemu/cpus.h"
>   #include "sysemu/tcg.h"
>   #include "exec/exec-all.h"
> +#include "exec/plugin-gen.h"
>   
>   bool tcg_allowed;
>   
> @@ -65,6 +66,8 @@ void cpu_loop_exit(CPUState *cpu)
>   {
>       /* Undo the setting in cpu_tb_exec.  */
>       cpu->can_do_io = 1;
> +    /* Undo any setting in generated code. */
> +    plugin_gen_disable_mem_helpers();
>       siglongjmp(cpu->jmp_env, 1);
>   }
>   
> diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
> index 56aaf58b9d..e8a48dbd93 100644
> --- a/accel/tcg/cpu-exec.c
> +++ b/accel/tcg/cpu-exec.c
> @@ -39,6 +39,7 @@
>   #include "exec/replay-core.h"
>   #include "sysemu/tcg.h"
>   #include "exec/helper-proto.h"
> +#include "exec/plugin-gen.h"
>   #include "tb-jmp-cache.h"
>   #include "tb-hash.h"
>   #include "tb-context.h"
> @@ -459,6 +460,7 @@ cpu_tb_exec(CPUState *cpu, TranslationBlock *itb, int *tb_exit)
>       qemu_thread_jit_execute();
>       ret = tcg_qemu_tb_exec(env, tb_ptr);
>       cpu->can_do_io = 1;
> +    plugin_gen_disable_mem_helpers();
>       /*
>        * TODO: Delay swapping back to the read-write region of the TB
>        * until we actually need to modify the TB.  The read-only copy,
> @@ -526,7 +528,6 @@ static void cpu_exec_exit(CPUState *cpu)
>       if (cc->tcg_ops->cpu_exec_exit) {
>           cc->tcg_ops->cpu_exec_exit(cpu);
>       }
> -    QEMU_PLUGIN_ASSERT(cpu->plugin_mem_cbs == NULL);
>   }
>   
>   void cpu_exec_step_atomic(CPUState *cpu)
> @@ -1004,7 +1005,6 @@ cpu_exec_loop(CPUState *cpu, SyncClocks *sc)
>   
>               cpu_loop_exec_tb(cpu, tb, pc, &last_tb, &tb_exit);
>   
> -            QEMU_PLUGIN_ASSERT(cpu->plugin_mem_cbs == NULL);
>               /* Try to align the host and virtual clocks
>                  if the guest is in advance */
>               align_clocks(sc, cpu);


