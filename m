Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E986974EB
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 04:29:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pS8U9-0002c1-S5; Tue, 14 Feb 2023 22:29:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pS8U6-0002be-Nn
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 22:29:31 -0500
Received: from mga17.intel.com ([192.55.52.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pS8U4-0001Ty-0p
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 22:29:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676431768; x=1707967768;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=4ma4q7GpNis8AqswoIW6ow8yrUDobKF2hzma8lK4ri0=;
 b=MVnlwCaSls94JEmIViX5tPvSzhHoG7xZA7Thqdl+nWeD6cp4eyrCwAdB
 /E9bGfKhs30Xr4d92MN7GI6DZs7fovjDy937ReKiENuUA4vU9BiTs5MlR
 4FsynV5OOLYwVB6fMsBkqhonEg575MOCNR+79QENl4giBOdamqrjdm7tl
 ILXWi0tMkVYwuNDG5SpTzA15tx7glXUyW1euB2V7rnf3AMOnyM4eiHqoW
 Xiju5stiU+vNw+mz8z5VlwsWZgFmou6udclJftDZTXsNjtDfb5aReFq3S
 nig7N/xKTo5RdoKyadvcvdQAl5eL5/2ybeSN61cF4mSVSnqmyBwPXHMlb Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="311701211"
X-IronPort-AV: E=Sophos;i="5.97,298,1669104000"; d="scan'208";a="311701211"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2023 19:29:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="669447469"
X-IronPort-AV: E=Sophos;i="5.97,298,1669104000"; d="scan'208";a="669447469"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost)
 ([10.239.160.112])
 by orsmga002.jf.intel.com with ESMTP; 14 Feb 2023 19:29:21 -0800
Date: Wed, 15 Feb 2023 11:37:09 +0800
From: Zhao Liu <zhao1.liu@linux.intel.com>
To: "wangyanan (Y)" <wangyanan55@huawei.com>
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Zhenyu Wang <zhenyu.z.wang@intel.com>, Dapeng Mi <dapeng1.mi@intel.com>,
 Zhuocheng Ding <zhuocheng.ding@intel.com>,
 Robert Hoo <robert.hu@linux.intel.com>, Xiaoyao Li <xiaoyao.li@intel.com>,
 Like Xu <like.xu.linux@gmail.com>, Zhao Liu <zhao1.liu@intel.com>
Subject: Re: [PATCH RESEND 03/18] softmmu: Fix CPUSTATE.nr_cores' calculation
Message-ID: <Y+xTZXyjRKuAsri0@liuzhao-OptiPlex-7080>
References: <20230213093625.158170-1-zhao1.liu@linux.intel.com>
 <20230213093625.158170-4-zhao1.liu@linux.intel.com>
 <c2acfe99-ff74-8a09-5bba-2263a253a842@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=gb2312
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c2acfe99-ff74-8a09-5bba-2263a253a842@huawei.com>
Received-SPF: none client-ip=192.55.52.151;
 envelope-from=zhao1.liu@linux.intel.com; helo=mga17.intel.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1,
 MIME_CHARSET_FARAWAY=2.45, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

On Wed, Feb 15, 2023 at 10:58:07AM +0800, wangyanan (Y) wrote:
> Date: Wed, 15 Feb 2023 10:58:07 +0800
> From: "wangyanan (Y)" <wangyanan55@huawei.com>
> Subject: Re: [PATCH RESEND 03/18] softmmu: Fix CPUSTATE.nr_cores'
>  calculation
> 
> Hi Zhao,
> 
> ÔÚ 2023/2/13 17:36, Zhao Liu Ð´µÀ:
> > From: Zhuocheng Ding <zhuocheng.ding@intel.com>
> > 
> > >From CPUState.nr_cores' comment, it represents "number of cores within
> > this CPU package".
> > 
> > After 003f230 (machine: Tweak the order of topology members in struct
> > CpuTopology), the meaning of smp.cores changed to "the number of cores
> > in one die", but this commit missed to change CPUState.nr_cores'
> > caculation, so that CPUState.nr_cores became wrong and now it
> > misses to consider numbers of clusters and dies.
> > 
> > At present, only i386 is using CPUState.nr_cores.
> > 
> > But as for i386, which supports die level, the uses of CPUState.nr_cores
> > are very confusing:
> > 
> > Early uses are based on the meaning of "cores per package" (before die
> > is introduced into i386), and later uses are based on "cores per die"
> > (after die's introduction).
> > 
> > This difference is due to that commit a94e142 (target/i386: Add CPUID.1F
> > generation support for multi-dies PCMachine) misunderstood that
> > CPUState.nr_cores means "cores per die" when caculated
> > CPUID.1FH.01H:EBX. After that, the changes in i386 all followed this
> > wrong understanding.
> > 
> > With the influence of 003f230 and a94e142, for i386 currently the result
> > of CPUState.nr_cores is "cores per die", thus the original uses of
> > CPUState.cores based on the meaning of "cores per package" are wrong
> > when mutiple dies exist:
> > 1. In cpu_x86_cpuid() of target/i386/cpu.c, CPUID.01H:EBX[bits 23:16] is
> >     incorrect because it expects "cpus per package" but now the
> >     result is "cpus per die".
> > 2. In cpu_x86_cpuid() of target/i386/cpu.c, for all leaves of CPUID.04H:
> >     EAX[bits 31:26] is incorrect because they expect "cpus per package"
> >     but now the result is "cpus per die". The error not only impacts the
> >     EAX caculation in cache_info_passthrough case, but also impacts other
> >     cases of setting cache topology for Intel CPU according to cpu
> >     topology (specifically, the incoming parameter "num_cores" expects
> >     "cores per package" in encode_cache_cpuid4()).
> > 3. In cpu_x86_cpuid() of target/i386/cpu.c, CPUID.0BH.01H:EBX[bits
> >     15:00] is incorrect because the EBX of 0BH.01H (core level) expects
> >     "cpus per package", which may be different with 1FH.01H (The reason
> >     is 1FH can support more levels. For QEMU, 1FH also supports die,
> >     1FH.01H:EBX[bits 15:00] expects "cpus per die").
> > 4. In cpu_x86_cpuid() of target/i386/cpu.c, when CPUID.80000001H is
> >     caculated, here "cpus per package" is expected to be checked, but in
> >     fact, now it checks "cpus per die". Though "cpus per die" also works
> >     for this code logic, this isn't consistent with AMD's APM.
> > 5. In cpu_x86_cpuid() of target/i386/cpu.c, CPUID.80000008H:ECX expects
> >     "cpus per package" but it obtains "cpus per die".
> > 6. In simulate_rdmsr() of target/i386/hvf/x86_emu.c, in
> >     kvm_rdmsr_core_thread_count() of target/i386/kvm/kvm.c, and in
> >     helper_rdmsr() of target/i386/tcg/sysemu/misc_helper.c,
> >     MSR_CORE_THREAD_COUNT expects "cpus per package" and "cores per
> >     package", but in these functions, it obtains "cpus per die" and
> >     "cores per die".
> > 
> > On the other hand, these uses are correct now (they are added in/after
> > a94e142):
> > 1. In cpu_x86_cpuid() of target/i386/cpu.c, topo_info.cores_per_die
> >     meets the actual meaning of CPUState.nr_cores ("cores per die").
> > 2. In cpu_x86_cpuid() of target/i386/cpu.c, vcpus_per_socket (in CPUID.
> >     04H's caculation) considers number of dies, so it's correct.
> > 3. In cpu_x86_cpuid() of target/i386/cpu.c, CPUID.1FH.01H:EBX[bits
> >     15:00] needs "cpus per die" and it gets the correct result, and
> >     CPUID.1FH.02H:EBX[bits 15:00] gets correct "cpus per package".
> > 
> > When CPUState.nr_cores is correctly changed to "cores per package" again
> > , the above errors will be fixed without extra work, but the "currently"
> > correct cases will go wrong and need special handling to pass correct
> > "cpus/cores per die" they want.
> > 
> > Thus in this patch, we fix CPUState.nr_cores' caculation to fit the
> > original meaning "cores per package", as well as changing caculation of
> > topo_info.cores_per_die, vcpus_per_socket and CPUID.1FH.
> > 
> > In addition, in the nr_threads' comment, specify it represents the
> > number of threads in the "core" to avoid confusion.
> > 
> > Fixes: a94e142 (target/i386: Add CPUID.1F generation support for multi-dies PCMachine)
> > Fixes: 003f230 (machine: Tweak the order of topology members in struct CpuTopology)
> > Signed-off-by: Zhuocheng Ding <zhuocheng.ding@intel.com>
> > Co-developed-by: Zhao Liu <zhao1.liu@intel.com>
> > Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> > ---
> >   include/hw/core/cpu.h | 2 +-
> >   softmmu/cpus.c        | 2 +-
> >   target/i386/cpu.c     | 9 ++++-----
> >   3 files changed, 6 insertions(+), 7 deletions(-)
> > 
> > diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> > index 2417597236bc..5253e4e839bb 100644
> > --- a/include/hw/core/cpu.h
> > +++ b/include/hw/core/cpu.h
> > @@ -274,7 +274,7 @@ struct qemu_work_item;
> >    *   QOM parent.
> >    * @tcg_cflags: Pre-computed cflags for this cpu.
> >    * @nr_cores: Number of cores within this CPU package.
> > - * @nr_threads: Number of threads within this CPU.
> > + * @nr_threads: Number of threads within this CPU core.
> >    * @running: #true if CPU is currently running (lockless).
> >    * @has_waiter: #true if a CPU is currently waiting for the cpu_exec_end;
> >    * valid under cpu_list_lock.
> > diff --git a/softmmu/cpus.c b/softmmu/cpus.c
> > index 9cbc8172b5f2..9996e6a3b295 100644
> > --- a/softmmu/cpus.c
> > +++ b/softmmu/cpus.c
> > @@ -630,7 +630,7 @@ void qemu_init_vcpu(CPUState *cpu)
> >   {
> >       MachineState *ms = MACHINE(qdev_get_machine());
> > -    cpu->nr_cores = ms->smp.cores;
> > +    cpu->nr_cores = ms->smp.dies * ms->smp.clusters * ms->smp.cores;
> >       cpu->nr_threads =  ms->smp.threads;
> >       cpu->stopped = true;
> >       cpu->random_seed = qemu_guest_random_seed_thread_part1();
> > diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> > index 4d2b8d0444df..29afec12c281 100644
> > --- a/target/i386/cpu.c
> > +++ b/target/i386/cpu.c
> > @@ -5218,7 +5218,7 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
> >       X86CPUTopoInfo topo_info;
> >       topo_info.dies_per_pkg = env->nr_dies;
> > -    topo_info.cores_per_die = cs->nr_cores;
> > +    topo_info.cores_per_die = cs->nr_cores / env->nr_dies;
> Is it better to also add a description for env->nr_dies in X86CPUState,
> like "/* Number of dies within this CPU package */", for less confusion?

Yeah, thanks. I'll add this comment.

> >       topo_info.threads_per_core = cs->nr_threads;
> >       /* Calculate & apply limits for different index ranges */
> > @@ -5294,8 +5294,7 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
> >                */
> >               if (*eax & 31) {
> >                   int host_vcpus_per_cache = 1 + ((*eax & 0x3FFC000) >> 14);
> > -                int vcpus_per_socket = env->nr_dies * cs->nr_cores *
> > -                                       cs->nr_threads;
> > +                int vcpus_per_socket = cs->nr_cores * cs->nr_threads;
> >                   if (cs->nr_cores > 1) {
> >                       *eax &= ~0xFC000000;
> >                       *eax |= (pow2ceil(cs->nr_cores) - 1) << 26;
> > @@ -5468,12 +5467,12 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
> >               break;
> >           case 1:
> >               *eax = apicid_die_offset(&topo_info);
> > -            *ebx = cs->nr_cores * cs->nr_threads;
> > +            *ebx = topo_info.cores_per_die * topo_info.threads_per_core;
> >               *ecx |= CPUID_TOPOLOGY_LEVEL_CORE;
> >               break;
> >           case 2:
> >               *eax = apicid_pkg_offset(&topo_info);
> > -            *ebx = env->nr_dies * cs->nr_cores * cs->nr_threads;
> > +            *ebx = cs->nr_cores * cs->nr_threads;
> >               *ecx |= CPUID_TOPOLOGY_LEVEL_DIE;
> >               break;
> >           default:
> Otherwise:
> Reviewed-by: Yanan Wang <wangyanan55@huawei.com>
> 
> Thanks,
> Yanan
> 

