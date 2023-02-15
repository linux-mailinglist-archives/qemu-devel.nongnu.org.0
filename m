Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A7669749D
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 03:58:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pS7zx-0001Wy-Mn; Tue, 14 Feb 2023 21:58:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1pS7zu-0001Wc-Pk
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 21:58:18 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1pS7zq-0002j7-GB
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 21:58:18 -0500
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.55])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4PGjPb75bvznW8D;
 Wed, 15 Feb 2023 10:55:47 +0800 (CST)
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.6; Wed, 15 Feb 2023 10:58:08 +0800
Message-ID: <c2acfe99-ff74-8a09-5bba-2263a253a842@huawei.com>
Date: Wed, 15 Feb 2023 10:58:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH RESEND 03/18] softmmu: Fix CPUSTATE.nr_cores' calculation
To: Zhao Liu <zhao1.liu@linux.intel.com>, Eduardo Habkost
 <eduardo@habkost.net>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>, "Michael S .
 Tsirkin" <mst@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>, Markus
 Armbruster <armbru@redhat.com>
CC: <qemu-devel@nongnu.org>, Zhenyu Wang <zhenyu.z.wang@intel.com>, Dapeng Mi
 <dapeng1.mi@intel.com>, Zhuocheng Ding <zhuocheng.ding@intel.com>,
 Robert Hoo
 <robert.hu@linux.intel.com>, Xiaoyao Li <xiaoyao.li@intel.com>, Like Xu
 <like.xu.linux@gmail.com>, Zhao Liu <zhao1.liu@intel.com>
References: <20230213093625.158170-1-zhao1.liu@linux.intel.com>
 <20230213093625.158170-4-zhao1.liu@linux.intel.com>
In-Reply-To: <20230213093625.158170-4-zhao1.liu@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=wangyanan55@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.35,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Reply-to:  "wangyanan (Y)" <wangyanan55@huawei.com>
From:  "wangyanan (Y)" via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Zhao,

在 2023/2/13 17:36, Zhao Liu 写道:
> From: Zhuocheng Ding <zhuocheng.ding@intel.com>
>
> >From CPUState.nr_cores' comment, it represents "number of cores within
> this CPU package".
>
> After 003f230 (machine: Tweak the order of topology members in struct
> CpuTopology), the meaning of smp.cores changed to "the number of cores
> in one die", but this commit missed to change CPUState.nr_cores'
> caculation, so that CPUState.nr_cores became wrong and now it
> misses to consider numbers of clusters and dies.
>
> At present, only i386 is using CPUState.nr_cores.
>
> But as for i386, which supports die level, the uses of CPUState.nr_cores
> are very confusing:
>
> Early uses are based on the meaning of "cores per package" (before die
> is introduced into i386), and later uses are based on "cores per die"
> (after die's introduction).
>
> This difference is due to that commit a94e142 (target/i386: Add CPUID.1F
> generation support for multi-dies PCMachine) misunderstood that
> CPUState.nr_cores means "cores per die" when caculated
> CPUID.1FH.01H:EBX. After that, the changes in i386 all followed this
> wrong understanding.
>
> With the influence of 003f230 and a94e142, for i386 currently the result
> of CPUState.nr_cores is "cores per die", thus the original uses of
> CPUState.cores based on the meaning of "cores per package" are wrong
> when mutiple dies exist:
> 1. In cpu_x86_cpuid() of target/i386/cpu.c, CPUID.01H:EBX[bits 23:16] is
>     incorrect because it expects "cpus per package" but now the
>     result is "cpus per die".
> 2. In cpu_x86_cpuid() of target/i386/cpu.c, for all leaves of CPUID.04H:
>     EAX[bits 31:26] is incorrect because they expect "cpus per package"
>     but now the result is "cpus per die". The error not only impacts the
>     EAX caculation in cache_info_passthrough case, but also impacts other
>     cases of setting cache topology for Intel CPU according to cpu
>     topology (specifically, the incoming parameter "num_cores" expects
>     "cores per package" in encode_cache_cpuid4()).
> 3. In cpu_x86_cpuid() of target/i386/cpu.c, CPUID.0BH.01H:EBX[bits
>     15:00] is incorrect because the EBX of 0BH.01H (core level) expects
>     "cpus per package", which may be different with 1FH.01H (The reason
>     is 1FH can support more levels. For QEMU, 1FH also supports die,
>     1FH.01H:EBX[bits 15:00] expects "cpus per die").
> 4. In cpu_x86_cpuid() of target/i386/cpu.c, when CPUID.80000001H is
>     caculated, here "cpus per package" is expected to be checked, but in
>     fact, now it checks "cpus per die". Though "cpus per die" also works
>     for this code logic, this isn't consistent with AMD's APM.
> 5. In cpu_x86_cpuid() of target/i386/cpu.c, CPUID.80000008H:ECX expects
>     "cpus per package" but it obtains "cpus per die".
> 6. In simulate_rdmsr() of target/i386/hvf/x86_emu.c, in
>     kvm_rdmsr_core_thread_count() of target/i386/kvm/kvm.c, and in
>     helper_rdmsr() of target/i386/tcg/sysemu/misc_helper.c,
>     MSR_CORE_THREAD_COUNT expects "cpus per package" and "cores per
>     package", but in these functions, it obtains "cpus per die" and
>     "cores per die".
>
> On the other hand, these uses are correct now (they are added in/after
> a94e142):
> 1. In cpu_x86_cpuid() of target/i386/cpu.c, topo_info.cores_per_die
>     meets the actual meaning of CPUState.nr_cores ("cores per die").
> 2. In cpu_x86_cpuid() of target/i386/cpu.c, vcpus_per_socket (in CPUID.
>     04H's caculation) considers number of dies, so it's correct.
> 3. In cpu_x86_cpuid() of target/i386/cpu.c, CPUID.1FH.01H:EBX[bits
>     15:00] needs "cpus per die" and it gets the correct result, and
>     CPUID.1FH.02H:EBX[bits 15:00] gets correct "cpus per package".
>
> When CPUState.nr_cores is correctly changed to "cores per package" again
> , the above errors will be fixed without extra work, but the "currently"
> correct cases will go wrong and need special handling to pass correct
> "cpus/cores per die" they want.
>
> Thus in this patch, we fix CPUState.nr_cores' caculation to fit the
> original meaning "cores per package", as well as changing caculation of
> topo_info.cores_per_die, vcpus_per_socket and CPUID.1FH.
>
> In addition, in the nr_threads' comment, specify it represents the
> number of threads in the "core" to avoid confusion.
>
> Fixes: a94e142 (target/i386: Add CPUID.1F generation support for multi-dies PCMachine)
> Fixes: 003f230 (machine: Tweak the order of topology members in struct CpuTopology)
> Signed-off-by: Zhuocheng Ding <zhuocheng.ding@intel.com>
> Co-developed-by: Zhao Liu <zhao1.liu@intel.com>
> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> ---
>   include/hw/core/cpu.h | 2 +-
>   softmmu/cpus.c        | 2 +-
>   target/i386/cpu.c     | 9 ++++-----
>   3 files changed, 6 insertions(+), 7 deletions(-)
>
> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> index 2417597236bc..5253e4e839bb 100644
> --- a/include/hw/core/cpu.h
> +++ b/include/hw/core/cpu.h
> @@ -274,7 +274,7 @@ struct qemu_work_item;
>    *   QOM parent.
>    * @tcg_cflags: Pre-computed cflags for this cpu.
>    * @nr_cores: Number of cores within this CPU package.
> - * @nr_threads: Number of threads within this CPU.
> + * @nr_threads: Number of threads within this CPU core.
>    * @running: #true if CPU is currently running (lockless).
>    * @has_waiter: #true if a CPU is currently waiting for the cpu_exec_end;
>    * valid under cpu_list_lock.
> diff --git a/softmmu/cpus.c b/softmmu/cpus.c
> index 9cbc8172b5f2..9996e6a3b295 100644
> --- a/softmmu/cpus.c
> +++ b/softmmu/cpus.c
> @@ -630,7 +630,7 @@ void qemu_init_vcpu(CPUState *cpu)
>   {
>       MachineState *ms = MACHINE(qdev_get_machine());
>   
> -    cpu->nr_cores = ms->smp.cores;
> +    cpu->nr_cores = ms->smp.dies * ms->smp.clusters * ms->smp.cores;
>       cpu->nr_threads =  ms->smp.threads;
>       cpu->stopped = true;
>       cpu->random_seed = qemu_guest_random_seed_thread_part1();
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index 4d2b8d0444df..29afec12c281 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -5218,7 +5218,7 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
>       X86CPUTopoInfo topo_info;
>   
>       topo_info.dies_per_pkg = env->nr_dies;
> -    topo_info.cores_per_die = cs->nr_cores;
> +    topo_info.cores_per_die = cs->nr_cores / env->nr_dies;
Is it better to also add a description for env->nr_dies in X86CPUState,
like "/* Number of dies within this CPU package */", for less confusion?
>       topo_info.threads_per_core = cs->nr_threads;
>   
>       /* Calculate & apply limits for different index ranges */
> @@ -5294,8 +5294,7 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
>                */
>               if (*eax & 31) {
>                   int host_vcpus_per_cache = 1 + ((*eax & 0x3FFC000) >> 14);
> -                int vcpus_per_socket = env->nr_dies * cs->nr_cores *
> -                                       cs->nr_threads;
> +                int vcpus_per_socket = cs->nr_cores * cs->nr_threads;
>                   if (cs->nr_cores > 1) {
>                       *eax &= ~0xFC000000;
>                       *eax |= (pow2ceil(cs->nr_cores) - 1) << 26;
> @@ -5468,12 +5467,12 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
>               break;
>           case 1:
>               *eax = apicid_die_offset(&topo_info);
> -            *ebx = cs->nr_cores * cs->nr_threads;
> +            *ebx = topo_info.cores_per_die * topo_info.threads_per_core;
>               *ecx |= CPUID_TOPOLOGY_LEVEL_CORE;
>               break;
>           case 2:
>               *eax = apicid_pkg_offset(&topo_info);
> -            *ebx = env->nr_dies * cs->nr_cores * cs->nr_threads;
> +            *ebx = cs->nr_cores * cs->nr_threads;
>               *ecx |= CPUID_TOPOLOGY_LEVEL_DIE;
>               break;
>           default:
Otherwise:
Reviewed-by: Yanan Wang <wangyanan55@huawei.com>

Thanks,
Yanan


