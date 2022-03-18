Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D99224DD4B5
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 07:29:13 +0100 (CET)
Received: from localhost ([::1]:36016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nV66q-0006SD-F1
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 02:29:12 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1nV61a-0004gB-5q; Fri, 18 Mar 2022 02:23:46 -0400
Received: from szxga08-in.huawei.com ([45.249.212.255]:3857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1nV61W-0002EV-E5; Fri, 18 Mar 2022 02:23:45 -0400
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.54])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4KKYqX1Z2tz1GCNS;
 Fri, 18 Mar 2022 14:23:36 +0800 (CST)
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.21; Fri, 18 Mar 2022 14:23:35 +0800
Subject: Re: [PATCH v2 1/3] hw/arm/virt: Fix CPU's default NUMA node ID
To: Gavin Shan <gshan@redhat.com>, <qemu-arm@nongnu.org>
CC: <qemu-devel@nongnu.org>, <imammedo@redhat.com>, <drjones@redhat.com>,
 <peter.maydell@linaro.org>, <richard.henderson@linaro.org>,
 <shan.gavin@gmail.com>, <zhenyzha@redhat.com>
References: <20220303031152.145960-1-gshan@redhat.com>
 <20220303031152.145960-2-gshan@redhat.com>
Message-ID: <e894fe3a-a50e-f47f-773d-d859bc240923@huawei.com>
Date: Fri, 18 Mar 2022 14:23:34 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20220303031152.145960-2-gshan@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme707-chm.china.huawei.com (10.1.199.103) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.255;
 envelope-from=wangyanan55@huawei.com; helo=szxga08-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  "wangyanan (Y)" <wangyanan55@huawei.com>
From:  "wangyanan (Y)" via <qemu-devel@nongnu.org>

Hi Gavin,

On 2022/3/3 11:11, Gavin Shan wrote:
> The default CPU-to-NUMA association is given by mc->get_default_cpu_node_id()
> when it isn't provided explicitly. However, the CPU topology isn't fully
> considered in the default association and it causes CPU topology broken
> warnings on booting Linux guest.
>
> For example, the following warning messages are observed when the Linux guest
> is booted with the following command lines.
>
>    /home/gavin/sandbox/qemu.main/build/qemu-system-aarch64 \
>    -accel kvm -machine virt,gic-version=host               \
>    -cpu host                                               \
>    -smp 6,sockets=2,cores=3,threads=1                      \
>    -m 1024M,slots=16,maxmem=64G                            \
>    -object memory-backend-ram,id=mem0,size=128M            \
>    -object memory-backend-ram,id=mem1,size=128M            \
>    -object memory-backend-ram,id=mem2,size=128M            \
>    -object memory-backend-ram,id=mem3,size=128M            \
>    -object memory-backend-ram,id=mem4,size=128M            \
>    -object memory-backend-ram,id=mem4,size=384M            \
>    -numa node,nodeid=0,memdev=mem0                         \
>    -numa node,nodeid=1,memdev=mem1                         \
>    -numa node,nodeid=2,memdev=mem2                         \
>    -numa node,nodeid=3,memdev=mem3                         \
>    -numa node,nodeid=4,memdev=mem4                         \
>    -numa node,nodeid=5,memdev=mem5
>           :
>    alternatives: patching kernel code
>    BUG: arch topology borken
>    the CLS domain not a subset of the MC domain
>    <the above error log repeats>
>    BUG: arch topology borken
>    the DIE domain not a subset of the NODE domain
>
> With current implementation of mc->get_default_cpu_node_id(), CPU#0 to CPU#5
> are associated with NODE#0 to NODE#5 separately. That's incorrect because
> CPU#0/1/2 should be associated with same NUMA node because they're seated
> in same socket.
>
> This fixes the issue by populating the CPU topology in virt_possible_cpu_arch_ids()
> and considering the socket index when default CPU-to-NUMA association is given
> in virt_possible_cpu_arch_ids(). With this applied, no more CPU topology broken
> warnings are seen from the Linux guest. The 6 CPUs are associated with NODE#0/1,
> but there are no CPUs associated with NODE#2/3/4/5.
It may be better to split this patch into two. One extends 
virt_possible_cpu_arch_ids,
and the other fixes the numa node ID issue.
>
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>   hw/arm/virt.c | 17 ++++++++++++++++-
>   1 file changed, 16 insertions(+), 1 deletion(-)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 46bf7ceddf..dee02b60fc 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -2488,7 +2488,9 @@ virt_cpu_index_to_props(MachineState *ms, unsigned cpu_index)
>   
>   static int64_t virt_get_default_cpu_node_id(const MachineState *ms, int idx)
>   {
> -    return idx % ms->numa_state->num_nodes;
> +    int64_t socket_id = ms->possible_cpus->cpus[idx].props.socket_id;
> +
> +    return socket_id % ms->numa_state->num_nodes;
>   }
>   
>   static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
> @@ -2496,6 +2498,7 @@ static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
>       int n;
>       unsigned int max_cpus = ms->smp.max_cpus;
>       VirtMachineState *vms = VIRT_MACHINE(ms);
> +    MachineClass *mc = MACHINE_GET_CLASS(vms);
>   
>       if (ms->possible_cpus) {
>           assert(ms->possible_cpus->len == max_cpus);
> @@ -2509,6 +2512,18 @@ static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
>           ms->possible_cpus->cpus[n].type = ms->cpu_type;
>           ms->possible_cpus->cpus[n].arch_id =
>               virt_cpu_mp_affinity(vms, n);
> +
> +        ms->possible_cpus->cpus[n].props.has_socket_id = true;
> +        ms->possible_cpus->cpus[n].props.socket_id =
> +            n / (ms->smp.dies * ms->smp.clusters *
> +                ms->smp.cores * ms->smp.threads);
> +        if (mc->smp_props.dies_supported) {
> +            ms->possible_cpus->cpus[n].props.has_die_id = true;
> +            ms->possible_cpus->cpus[n].props.die_id =
> +                n / (ms->smp.clusters * ms->smp.cores * ms->smp.threads);
> +        }
I still don't think we need to consider dies if it's certainly not
supported yet, IOW, we will never come into the if-branch.
We are populating arm-specific topo info instead of the generic,
we can probably uniformly update this part together with other
necessary places when we decide to support dies for arm virt
machine in the future. :)
> +        ms->possible_cpus->cpus[n].props.has_core_id = true;
> +        ms->possible_cpus->cpus[n].props.core_id = n / ms->smp.threads;
>           ms->possible_cpus->cpus[n].props.has_thread_id = true;
>           ms->possible_cpus->cpus[n].props.thread_id = n;
>       }
Maybe we should use the same algorithm in x86_topo_ids_from_idx
to populate the IDs, so that scope of socket-id will be [0, total_sockets),
scope of thread-id is [0, threads_per_core), and so on. Then with a
group of socket/cluster/core/thread-id, we determine a CPU.

Suggestion: For the long term, is it necessary now to add similar topo
info infrastructure for ARM, such as X86CPUTopoInfo, X86CPUTopoIDs,
x86_topo_ids_from_idx?

Thanks,
Yanan

