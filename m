Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD4B1E2CC0
	for <lists+qemu-devel@lfdr.de>; Tue, 26 May 2020 21:17:33 +0200 (CEST)
Received: from localhost ([::1]:45288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jdf4u-0005cv-BO
	for lists+qemu-devel@lfdr.de; Tue, 26 May 2020 15:17:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1jdf3p-0004lk-Uo
 for qemu-devel@nongnu.org; Tue, 26 May 2020 15:16:25 -0400
Received: from mta-02.yadro.com ([89.207.88.252]:38592 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1jdf3Z-00009W-6L
 for qemu-devel@nongnu.org; Tue, 26 May 2020 15:16:25 -0400
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id AFF6D4AC44;
 Tue, 26 May 2020 19:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 in-reply-to:content-disposition:content-type:content-type
 :mime-version:references:message-id:subject:subject:from:from
 :date:date:received:received:received; s=mta-01; t=1590520561;
 x=1592334962; bh=XBnA6pvONTxXPFeES539xj5oH4GOqLpfQInPcIzMT2Y=; b=
 rVv1rkAFw6BCFekhSlBjHJ2+1ubRDdc7L8eDqpCFCcGeNRkkX7Tm1g+RukV0rVn7
 4z1+jP3607/bHt7FYtudL5BeIVFDw04zI7EHyagNG6neWHCd0A0BvdUit8jqtyYt
 ugBiEtVruv4dy7Vak4WsFK7AvTlm4VPSR14Pc8wiCD4=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ampTV91FXGbb; Tue, 26 May 2020 22:16:01 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id C26B34C164;
 Tue, 26 May 2020 22:15:59 +0300 (MSK)
Received: from localhost (172.17.204.212) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Tue, 26
 May 2020 22:16:01 +0300
Date: Tue, 26 May 2020 22:16:00 +0300
From: Roman Bolshakov <r.bolshakov@yadro.com>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [RFC v3 4/4] cpus: extract out accel-specific code to each accel
Message-ID: <20200526191600.GA4851@SPB-NB-133.local>
References: <20200525145440.29728-1-cfontana@suse.de>
 <20200525145440.29728-5-cfontana@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200525145440.29728-5-cfontana@suse.de>
X-Originating-IP: [172.17.204.212]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-02.corp.yadro.com (172.17.10.102)
Received-SPF: pass client-ip=89.207.88.252; envelope-from=r.bolshakov@yadro.com;
 helo=mta-01.yadro.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/26 15:16:05
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>, haxm-team@intel.com,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-devel@nongnu.org,
 Cameron Esfahani <dirty@apple.com>, Colin Xu <colin.xu@intel.com>,
 Wenchao Wang <wenchao.wang@intel.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, May 25, 2020 at 04:54:40PM +0200, Claudio Fontana wrote:
> each accelerator registers a new "CpusAccelInterface"
> on initialization, providing functions for starting a vcpu,
> kicking a vcpu, and sychronizing state.
> 
> This way the code in cpus.cc is now all general softmmu code,
> nothing (or almost nothing) accelerator-specific anymore.
> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> ---
>  MAINTAINERS                          |   1 +
>  accel/kvm/Makefile.objs              |   2 +
>  accel/kvm/kvm-all.c                  |  15 +-
>  accel/kvm/kvm-cpus-interface.c       |  94 ++++
>  accel/kvm/kvm-cpus-interface.h       |   8 +
>  accel/qtest.c                        |  82 ++++
>  accel/stubs/kvm-stub.c               |   3 +-
>  accel/tcg/Makefile.objs              |   1 +
>  accel/tcg/tcg-all.c                  |  12 +-
>  accel/tcg/tcg-cpus-interface.c       | 523 ++++++++++++++++++++
>  accel/tcg/tcg-cpus-interface.h       |   8 +
>  hw/core/cpu.c                        |   1 +
>  include/sysemu/cpus.h                |  32 ++
>  include/sysemu/hvf.h                 |   1 -
>  include/sysemu/hw_accel.h            |  57 +--
>  include/sysemu/kvm.h                 |   2 +-
>  softmmu/cpus.c                       | 911 +++--------------------------------
>  stubs/Makefile.objs                  |   1 +
>  stubs/cpu-synchronize-state.c        |  15 +
>  target/i386/Makefile.objs            |   7 +-
>  target/i386/hax-all.c                |   6 +-
>  target/i386/hax-cpus-interface.c     |  85 ++++
>  target/i386/hax-cpus-interface.h     |   8 +
>  target/i386/hax-i386.h               |   2 +
>  target/i386/hax-posix.c              |  12 +
>  target/i386/hax-windows.c            |  20 +
>  target/i386/hvf/Makefile.objs        |   2 +-
>  target/i386/hvf/hvf-cpus-interface.c |  92 ++++
>  target/i386/hvf/hvf-cpus-interface.h |   8 +
>  target/i386/hvf/hvf.c                |   5 +-
>  target/i386/whpx-all.c               |   3 +
>  target/i386/whpx-cpus-interface.c    |  96 ++++
>  target/i386/whpx-cpus-interface.h    |   8 +
>  33 files changed, 1220 insertions(+), 903 deletions(-)
>  create mode 100644 accel/kvm/kvm-cpus-interface.c
>  create mode 100644 accel/kvm/kvm-cpus-interface.h
>  create mode 100644 accel/tcg/tcg-cpus-interface.c
>  create mode 100644 accel/tcg/tcg-cpus-interface.h
>  create mode 100644 stubs/cpu-synchronize-state.c
>  create mode 100644 target/i386/hax-cpus-interface.c
>  create mode 100644 target/i386/hax-cpus-interface.h
>  create mode 100644 target/i386/hvf/hvf-cpus-interface.c
>  create mode 100644 target/i386/hvf/hvf-cpus-interface.h
>  create mode 100644 target/i386/whpx-cpus-interface.c
>  create mode 100644 target/i386/whpx-cpus-interface.h

Hi Claudio,

Overall it looks good.

I wonder if the new structure should get singular form, i.e.
softmmu/cpu.c instead of softmmu/cpus.c

Perhaps cpus.c had plural form because it was related to implementation
of multiple CPUs/accels. After the split, each accel got it's own
implementation of accel interface.

"<accel>-cpus-interface.c" contains implementation rather than interface
it's a bit confusing. Perhaps it should be called: "<accel>-cpu.c" or
even "<accel>-accel.c".

By the way, If we use registration for each accel, does it mean that
include/sysemu/<accel>.h and accel stubs are no longer needed in shared
location?

There's an AccelClass in accel/accel.c, I wonder if it should be re-used
for accel CPU registration? I don't know but may be generic the leftover
of cpus.c also belongs to accel/ rather than softmmu/?

>  
> diff --git a/include/sysemu/cpus.h b/include/sysemu/cpus.h
> index 149de000a0..cae22afe4d 100644
> --- a/include/sysemu/cpus.h
> +++ b/include/sysemu/cpus.h
> @@ -4,7 +4,39 @@
>  #include "qemu/timer.h"
>  
>  /* cpus.c */
> +
> +/* CPU execution threads */
> +
> +typedef struct CpusAccelInterface {
> +    void (*create_vcpu_thread)(CPUState *cpu);
> +    void (*kick_vcpu_thread)(CPUState *cpu);
> +
> +    void (*cpu_synchronize_post_reset)(CPUState *cpu);
> +    void (*cpu_synchronize_post_init)(CPUState *cpu);
> +    void (*cpu_synchronize_state)(CPUState *cpu);
> +    void (*cpu_synchronize_pre_loadvm)(CPUState *cpu);
> +} CpusAccelInterface;


I think plural name may be replaced to singular. Interface suffix
doesn't seem to be used in QEMU.

cpu_ and _vcpu are sort meaning the same and may be replaced to generic
cpu_ prefix. There's a CPUState, CPU<Arch>State, and IMO shorter
CPUAccel seems to match the naming. I also don't know if cpu_ prefix
should be kept.

So here's how I see the interface:

typedef struct CPUAccel {
    void (*create_thread)(CPUState *cpu);
    void (*kick_thread)(CPUState *cpu);

    void (*synchronize_post_reset)(CPUState *cpu);
    void (*synchronize_post_init)(CPUState *cpu);
    void (*synchronize_state)(CPUState *cpu);
    void (*synchronize_pre_loadvm)(CPUState *cpu);
} CPUAccel;


> +
> +/* register accel-specific interface */
> +void cpus_register_accel_interface(CpusAccelInterface *i);
> +
> +/* interface available for cpus accelerator threads */
> +
> +/* For temporary buffers for forming a name */
> +#define VCPU_THREAD_NAME_SIZE 16
> +
> +void cpus_kick_thread(CPUState *cpu);

If it's addressing a single CPU should it be singular too, i.e.
cpu_kick_thread?

> +bool cpu_thread_is_idle(CPUState *cpu);
>  bool all_cpu_threads_idle(void);
> +bool cpu_can_run(CPUState *cpu);
> +void qemu_wait_io_event_common(CPUState *cpu);
> +void qemu_wait_io_event(CPUState *cpu);
> +void cpu_thread_signal_created(CPUState *cpu);
> +void cpu_thread_signal_destroyed(CPUState *cpu);
> +void cpu_handle_guest_debug(CPUState *cpu);
> +
> +/* end interface for cpus accelerator threads */
> +
>  bool qemu_in_vcpu_thread(void);
>  void qemu_init_cpu_loop(void);
>  void resume_all_vcpus(void);
> diff --git a/target/i386/hvf/Makefile.objs b/target/i386/hvf/Makefile.objs
> index 927b86bc67..bdbc2c0227 100644
> --- a/target/i386/hvf/Makefile.objs
> +++ b/target/i386/hvf/Makefile.objs
> @@ -1,2 +1,2 @@
> -obj-y += hvf.o
> +obj-y += hvf.o hvf-cpus-interface.o
>  obj-y += x86.o x86_cpuid.o x86_decode.o x86_descr.o x86_emu.o x86_flags.o x86_mmu.o x86hvf.o x86_task.o
> diff --git a/target/i386/hvf/hvf-cpus-interface.c b/target/i386/hvf/hvf-cpus-interface.c
> new file mode 100644
> index 0000000000..54bfe307c1
> --- /dev/null
> +++ b/target/i386/hvf/hvf-cpus-interface.c
> @@ -0,0 +1,92 @@
> +#include "qemu/osdep.h"
> +#include "qemu/error-report.h"
> +#include "qemu/main-loop.h"
> +#include "sysemu/hvf.h"
> +#include "sysemu/runstate.h"
> +#include "sysemu/cpus.h"
> +#include "qemu/guest-random.h"
> +
> +#include "hvf-cpus-interface.h"
> +
> +/*
> + * The HVF-specific vCPU thread function. This one should only run when the host
> + * CPU supports the VMX "unrestricted guest" feature.
> + */
> +static void *hvf_cpu_thread_fn(void *arg)
> +{
> +    CPUState *cpu = arg;
> +
> +    int r;
> +
> +    assert(hvf_enabled());
> +
> +    rcu_register_thread();
> +
> +    qemu_mutex_lock_iothread();
> +    qemu_thread_get_self(cpu->thread);
> +
> +    cpu->thread_id = qemu_get_thread_id();
> +    cpu->can_do_io = 1;
> +    current_cpu = cpu;
> +
> +    hvf_init_vcpu(cpu);
> +
> +    /* signal CPU creation */
> +    cpu_thread_signal_created(cpu);
> +    qemu_guest_random_seed_thread_part2(cpu->random_seed);
> +
> +    do {
> +        if (cpu_can_run(cpu)) {
> +            r = hvf_vcpu_exec(cpu);
> +            if (r == EXCP_DEBUG) {
> +                cpu_handle_guest_debug(cpu);
> +            }
> +        }
> +        qemu_wait_io_event(cpu);
> +    } while (!cpu->unplug || cpu_can_run(cpu));
> +
> +    hvf_vcpu_destroy(cpu);
> +    cpu_thread_signal_destroyed(cpu);
> +    qemu_mutex_unlock_iothread();
> +    rcu_unregister_thread();
> +    return NULL;
> +}
> +
> +static void hvf_kick_vcpu_thread(CPUState *cpu)
> +{
> +    cpus_kick_thread(cpu);


I think we should leave it empty since it's not really implemented for
HVF. Here's a WIP implementation I'm yet to send:

https://github.com/roolebo/qemu/commit/4437a4b8af31b0adaa58375f09e0b8547507f64f#diff-5e6ad1baa140ca4a1743b5a2f1a664b5R970

> +}
> +
> +static void hvf_cpu_synchronize_noop(CPUState *cpu)
> +{
> +}
> +
> +static void hvf_start_vcpu_thread(CPUState *cpu)
> +{
> +    char thread_name[VCPU_THREAD_NAME_SIZE];
> +
> +    /*
> +     * HVF currently does not support TCG, and only runs in
> +     * unrestricted-guest mode.
> +     */
> +    assert(hvf_enabled());
> +
> +    cpu->thread = g_malloc0(sizeof(QemuThread));
> +    cpu->halt_cond = g_malloc0(sizeof(QemuCond));
> +    qemu_cond_init(cpu->halt_cond);
> +
> +    snprintf(thread_name, VCPU_THREAD_NAME_SIZE, "CPU %d/HVF",
> +             cpu->cpu_index);
> +    qemu_thread_create(cpu->thread, thread_name, hvf_cpu_thread_fn,
> +                       cpu, QEMU_THREAD_JOINABLE);
> +}
> +
> +CpusAccelInterface hvf_cpus_interface = {
> +    .create_vcpu_thread = hvf_start_vcpu_thread,

I think it was meant as hvf_create_vcpu_thread.

> +    .kick_vcpu_thread = hvf_kick_vcpu_thread,
> +
> +    .cpu_synchronize_post_reset = hvf_cpu_synchronize_noop,
> +    .cpu_synchronize_post_init = hvf_cpu_synchronize_noop,
> +    .cpu_synchronize_state = hvf_cpu_synchronize_noop,
> +    .cpu_synchronize_pre_loadvm = hvf_cpu_synchronize_noop,

I have tested the RFC with hvf accel and it seems to work although I
expected it fail. The noop functions are the reason of the behaviour. In
some sense it's not equivalent to what it was before but to be fair it's
not possible to use existing hvf_cpu_synchronize_* functions in
target/i386/hvf/hvf.c without breaking hvf.

Here's how it fails. hvf_cpu_synchronize_state() sets dirty flag to mark
that emulator registers in CPUX86State are going to be out of sync with
accel registers. If we bind .cpu_synchronize_state to
hvf_synchronize_state it'd be called from vapic_write() on I/O writes
(from kvmvapic.bin option ROM) to KVM vAPIC page (I/O port 0x7e).

But HVF uses two emulator states CPUX86State and HVFX86EmulatorState
and they may become out-of-sync. That's exactly what happens when an I/O
write to KVM vAPIC is made. The I/O write triggers cpu state
synchronization, so VMCS registers are fetched into CPUX86State and the
vcpu_dirty flag is set. Emulation code then advances RIP in the
macvm_set_rip() by modifying VMCS directly. On the next round of vcpu
run loop it checks if the cpu is dirty (it is) and pushes CPUX86State
into the VMCS, effectively overwriting what was set by macvm_set_rip().

If the RFC isn't expected to be merged for a couple of weeks I can
prepare a series that drops HVFX86EmulatorState. I need the change for
single-stepping support in HVF anyway.

Thanks,
Roman

