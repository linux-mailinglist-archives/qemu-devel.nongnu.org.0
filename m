Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71093292551
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Oct 2020 12:17:47 +0200 (CEST)
Received: from localhost ([::1]:48534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kUSEb-000648-VP
	for lists+qemu-devel@lfdr.de; Mon, 19 Oct 2020 06:17:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kUSCO-0005Me-5P
 for qemu-devel@nongnu.org; Mon, 19 Oct 2020 06:15:28 -0400
Received: from mx2.suse.de ([195.135.220.15]:35482)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kUSCK-0005lJ-BZ
 for qemu-devel@nongnu.org; Mon, 19 Oct 2020 06:15:27 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8B523AEC1;
 Mon, 19 Oct 2020 10:15:22 +0000 (UTC)
Subject: Re: [PATCH v3 2/3] accel/tcg: split tcg_start_vcpu_thread
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20201015143217.29337-1-cfontana@suse.de>
 <20201015143217.29337-3-cfontana@suse.de>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <42370695-710d-6c9a-c9c6-c9dddc272cd5@suse.de>
Date: Mon, 19 Oct 2020 12:15:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201015143217.29337-3-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/18 16:52:59
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x (no timestamps) [generic]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all,

is this one ok now in your view?

Thanks,

Claudio

On 10/15/20 4:32 PM, Claudio Fontana wrote:
> after the initial split into 3 tcg variants, we proceed to also
> split tcg_start_vcpu_thread.
> 
> We actually split it in 2 this time, since the icount variant
> just uses the round robin function.
> 
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> ---
>  accel/tcg/tcg-all.c         |  5 ++++
>  accel/tcg/tcg-cpus-icount.c |  2 +-
>  accel/tcg/tcg-cpus-mttcg.c  | 29 +++++++++++++++++--
>  accel/tcg/tcg-cpus-mttcg.h  | 21 --------------
>  accel/tcg/tcg-cpus-rr.c     | 39 +++++++++++++++++++++++--
>  accel/tcg/tcg-cpus-rr.h     |  3 +-
>  accel/tcg/tcg-cpus.c        | 58 -------------------------------------
>  accel/tcg/tcg-cpus.h        |  1 -
>  8 files changed, 71 insertions(+), 87 deletions(-)
>  delete mode 100644 accel/tcg/tcg-cpus-mttcg.h
> 
> diff --git a/accel/tcg/tcg-all.c b/accel/tcg/tcg-all.c
> index e42a028043..1ac0b76515 100644
> --- a/accel/tcg/tcg-all.c
> +++ b/accel/tcg/tcg-all.c
> @@ -105,6 +105,11 @@ static int tcg_init(MachineState *ms)
>      tcg_exec_init(s->tb_size * 1024 * 1024);
>      mttcg_enabled = s->mttcg_enabled;
>  
> +    /*
> +     * Initialize TCG regions
> +     */
> +    tcg_region_init();
> +
>      if (mttcg_enabled) {
>          cpus_register_accel(&tcg_cpus_mttcg);
>      } else if (icount_enabled()) {
> diff --git a/accel/tcg/tcg-cpus-icount.c b/accel/tcg/tcg-cpus-icount.c
> index d3af3afb6d..82dbe2cacf 100644
> --- a/accel/tcg/tcg-cpus-icount.c
> +++ b/accel/tcg/tcg-cpus-icount.c
> @@ -138,7 +138,7 @@ static void icount_handle_interrupt(CPUState *cpu, int mask)
>  }
>  
>  const CpusAccel tcg_cpus_icount = {
> -    .create_vcpu_thread = tcg_start_vcpu_thread,
> +    .create_vcpu_thread = rr_start_vcpu_thread,
>      .kick_vcpu_thread = qemu_cpu_kick_rr_cpus,
>  
>      .handle_interrupt = icount_handle_interrupt,
> diff --git a/accel/tcg/tcg-cpus-mttcg.c b/accel/tcg/tcg-cpus-mttcg.c
> index dac724fc85..f2b892a380 100644
> --- a/accel/tcg/tcg-cpus-mttcg.c
> +++ b/accel/tcg/tcg-cpus-mttcg.c
> @@ -33,7 +33,6 @@
>  #include "hw/boards.h"
>  
>  #include "tcg-cpus.h"
> -#include "tcg-cpus-mttcg.h"
>  
>  /*
>   * In the multi-threaded case each vCPU has its own thread. The TLS
> @@ -41,7 +40,7 @@
>   * current CPUState for a given thread.
>   */
>  
> -void *tcg_cpu_thread_fn(void *arg)
> +static void *tcg_cpu_thread_fn(void *arg)
>  {
>      CPUState *cpu = arg;
>  
> @@ -109,8 +108,32 @@ static void mttcg_kick_vcpu_thread(CPUState *cpu)
>      cpu_exit(cpu);
>  }
>  
> +static void mttcg_start_vcpu_thread(CPUState *cpu)
> +{
> +    char thread_name[VCPU_THREAD_NAME_SIZE];
> +
> +    g_assert(tcg_enabled());
> +
> +    parallel_cpus = (current_machine->smp.max_cpus > 1);
> +
> +    cpu->thread = g_malloc0(sizeof(QemuThread));
> +    cpu->halt_cond = g_malloc0(sizeof(QemuCond));
> +    qemu_cond_init(cpu->halt_cond);
> +
> +    /* create a thread per vCPU with TCG (MTTCG) */
> +    snprintf(thread_name, VCPU_THREAD_NAME_SIZE, "CPU %d/TCG",
> +             cpu->cpu_index);
> +
> +    qemu_thread_create(cpu->thread, thread_name, tcg_cpu_thread_fn,
> +                       cpu, QEMU_THREAD_JOINABLE);
> +
> +#ifdef _WIN32
> +    cpu->hThread = qemu_thread_get_handle(cpu->thread);
> +#endif
> +}
> +
>  const CpusAccel tcg_cpus_mttcg = {
> -    .create_vcpu_thread = tcg_start_vcpu_thread,
> +    .create_vcpu_thread = mttcg_start_vcpu_thread,
>      .kick_vcpu_thread = mttcg_kick_vcpu_thread,
>  
>      .handle_interrupt = tcg_handle_interrupt,
> diff --git a/accel/tcg/tcg-cpus-mttcg.h b/accel/tcg/tcg-cpus-mttcg.h
> deleted file mode 100644
> index d1bd771f49..0000000000
> --- a/accel/tcg/tcg-cpus-mttcg.h
> +++ /dev/null
> @@ -1,21 +0,0 @@
> -/*
> - * QEMU TCG Multi Threaded vCPUs implementation
> - *
> - * Copyright 2020 SUSE LLC
> - *
> - * This work is licensed under the terms of the GNU GPL, version 2 or later.
> - * See the COPYING file in the top-level directory.
> - */
> -
> -#ifndef TCG_CPUS_MTTCG_H
> -#define TCG_CPUS_MTTCG_H
> -
> -/*
> - * In the multi-threaded case each vCPU has its own thread. The TLS
> - * variable current_cpu can be used deep in the code to find the
> - * current CPUState for a given thread.
> - */
> -
> -void *tcg_cpu_thread_fn(void *arg);
> -
> -#endif /* TCG_CPUS_MTTCG_H */
> diff --git a/accel/tcg/tcg-cpus-rr.c b/accel/tcg/tcg-cpus-rr.c
> index ad50a3765f..f3b262bec7 100644
> --- a/accel/tcg/tcg-cpus-rr.c
> +++ b/accel/tcg/tcg-cpus-rr.c
> @@ -144,7 +144,7 @@ static void deal_with_unplugged_cpus(void)
>   * elsewhere.
>   */
>  
> -void *tcg_rr_cpu_thread_fn(void *arg)
> +static void *tcg_rr_cpu_thread_fn(void *arg)
>  {
>      CPUState *cpu = arg;
>  
> @@ -262,8 +262,43 @@ void *tcg_rr_cpu_thread_fn(void *arg)
>      return NULL;
>  }
>  
> +void rr_start_vcpu_thread(CPUState *cpu)
> +{
> +    char thread_name[VCPU_THREAD_NAME_SIZE];
> +    static QemuCond *single_tcg_halt_cond;
> +    static QemuThread *single_tcg_cpu_thread;
> +
> +    g_assert(tcg_enabled());
> +    parallel_cpus = false;
> +
> +    if (!single_tcg_cpu_thread) {
> +        cpu->thread = g_malloc0(sizeof(QemuThread));
> +        cpu->halt_cond = g_malloc0(sizeof(QemuCond));
> +        qemu_cond_init(cpu->halt_cond);
> +
> +        /* share a single thread for all cpus with TCG */
> +        snprintf(thread_name, VCPU_THREAD_NAME_SIZE, "ALL CPUs/TCG");
> +        qemu_thread_create(cpu->thread, thread_name,
> +                           tcg_rr_cpu_thread_fn,
> +                           cpu, QEMU_THREAD_JOINABLE);
> +
> +        single_tcg_halt_cond = cpu->halt_cond;
> +        single_tcg_cpu_thread = cpu->thread;
> +#ifdef _WIN32
> +        cpu->hThread = qemu_thread_get_handle(cpu->thread);
> +#endif
> +    } else {
> +        /* we share the thread */
> +        cpu->thread = single_tcg_cpu_thread;
> +        cpu->halt_cond = single_tcg_halt_cond;
> +        cpu->thread_id = first_cpu->thread_id;
> +        cpu->can_do_io = 1;
> +        cpu->created = true;
> +    }
> +}
> +
>  const CpusAccel tcg_cpus_rr = {
> -    .create_vcpu_thread = tcg_start_vcpu_thread,
> +    .create_vcpu_thread = rr_start_vcpu_thread,
>      .kick_vcpu_thread = qemu_cpu_kick_rr_cpus,
>  
>      .handle_interrupt = tcg_handle_interrupt,
> diff --git a/accel/tcg/tcg-cpus-rr.h b/accel/tcg/tcg-cpus-rr.h
> index 1936fd16ab..2e5943eda9 100644
> --- a/accel/tcg/tcg-cpus-rr.h
> +++ b/accel/tcg/tcg-cpus-rr.h
> @@ -15,6 +15,7 @@
>  /* Kick all RR vCPUs. */
>  void qemu_cpu_kick_rr_cpus(CPUState *unused);
>  
> -void *tcg_rr_cpu_thread_fn(void *arg);
> +/* start the round robin vcpu thread */
> +void rr_start_vcpu_thread(CPUState *cpu);
>  
>  #endif /* TCG_CPUS_RR_H */
> diff --git a/accel/tcg/tcg-cpus.c b/accel/tcg/tcg-cpus.c
> index f2b9bbf99e..86fd09545a 100644
> --- a/accel/tcg/tcg-cpus.c
> +++ b/accel/tcg/tcg-cpus.c
> @@ -35,67 +35,9 @@
>  #include "hw/boards.h"
>  
>  #include "tcg-cpus.h"
> -#include "tcg-cpus-mttcg.h"
> -#include "tcg-cpus-rr.h"
>  
>  /* common functionality among all TCG variants */
>  
> -void tcg_start_vcpu_thread(CPUState *cpu)
> -{
> -    char thread_name[VCPU_THREAD_NAME_SIZE];
> -    static QemuCond *single_tcg_halt_cond;
> -    static QemuThread *single_tcg_cpu_thread;
> -    static int tcg_region_inited;
> -
> -    assert(tcg_enabled());
> -    /*
> -     * Initialize TCG regions--once. Now is a good time, because:
> -     * (1) TCG's init context, prologue and target globals have been set up.
> -     * (2) qemu_tcg_mttcg_enabled() works now (TCG init code runs before the
> -     *     -accel flag is processed, so the check doesn't work then).
> -     */
> -    if (!tcg_region_inited) {
> -        tcg_region_inited = 1;
> -        tcg_region_init();
> -        parallel_cpus = qemu_tcg_mttcg_enabled() && current_machine->smp.max_cpus > 1;
> -    }
> -
> -    if (qemu_tcg_mttcg_enabled() || !single_tcg_cpu_thread) {
> -        cpu->thread = g_malloc0(sizeof(QemuThread));
> -        cpu->halt_cond = g_malloc0(sizeof(QemuCond));
> -        qemu_cond_init(cpu->halt_cond);
> -
> -        if (qemu_tcg_mttcg_enabled()) {
> -            /* create a thread per vCPU with TCG (MTTCG) */
> -            snprintf(thread_name, VCPU_THREAD_NAME_SIZE, "CPU %d/TCG",
> -                 cpu->cpu_index);
> -
> -            qemu_thread_create(cpu->thread, thread_name, tcg_cpu_thread_fn,
> -                               cpu, QEMU_THREAD_JOINABLE);
> -
> -        } else {
> -            /* share a single thread for all cpus with TCG */
> -            snprintf(thread_name, VCPU_THREAD_NAME_SIZE, "ALL CPUs/TCG");
> -            qemu_thread_create(cpu->thread, thread_name,
> -                               tcg_rr_cpu_thread_fn,
> -                               cpu, QEMU_THREAD_JOINABLE);
> -
> -            single_tcg_halt_cond = cpu->halt_cond;
> -            single_tcg_cpu_thread = cpu->thread;
> -        }
> -#ifdef _WIN32
> -        cpu->hThread = qemu_thread_get_handle(cpu->thread);
> -#endif
> -    } else {
> -        /* For non-MTTCG cases we share the thread */
> -        cpu->thread = single_tcg_cpu_thread;
> -        cpu->halt_cond = single_tcg_halt_cond;
> -        cpu->thread_id = first_cpu->thread_id;
> -        cpu->can_do_io = 1;
> -        cpu->created = true;
> -    }
> -}
> -
>  void qemu_tcg_destroy_vcpu(CPUState *cpu)
>  {
>      cpu_thread_signal_destroyed(cpu);
> diff --git a/accel/tcg/tcg-cpus.h b/accel/tcg/tcg-cpus.h
> index 279ba72e1f..b7ca954e13 100644
> --- a/accel/tcg/tcg-cpus.h
> +++ b/accel/tcg/tcg-cpus.h
> @@ -18,7 +18,6 @@ extern const CpusAccel tcg_cpus_mttcg;
>  extern const CpusAccel tcg_cpus_icount;
>  extern const CpusAccel tcg_cpus_rr;
>  
> -void tcg_start_vcpu_thread(CPUState *cpu);
>  void qemu_tcg_destroy_vcpu(CPUState *cpu);
>  int tcg_cpu_exec(CPUState *cpu);
>  void tcg_handle_interrupt(CPUState *cpu, int mask);
> 


