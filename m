Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C4E698EE0
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 09:40:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSZn7-0005aJ-8C; Thu, 16 Feb 2023 03:38:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1pSZmy-0005a4-SI
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 03:38:48 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1pSZmv-00054w-HX
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 03:38:48 -0500
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.57])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4PHSyG5HwBzrRtp;
 Thu, 16 Feb 2023 16:38:14 +0800 (CST)
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.6; Thu, 16 Feb 2023 16:38:39 +0800
Message-ID: <6fb117f7-4d7e-326d-d0e4-0a77ef65e179@huawei.com>
Date: Thu, 16 Feb 2023 16:38:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [RFC 08/52] machine: Add helpers to get cpu topology info from
 MachineState.topo
To: Zhao Liu <zhao1.liu@linux.intel.com>
CC: <qemu-devel@nongnu.org>, Zhenyu Wang <zhenyu.z.wang@intel.com>, Dapeng Mi
 <dapeng1.mi@intel.com>, Zhuocheng Ding <zhuocheng.ding@intel.com>,
 Robert Hoo
 <robert.hu@linux.intel.com>, Sean Christopherson <seanjc@google.com>, Like Xu
 <like.xu.linux@gmail.com>, Zhao Liu <zhao1.liu@intel.com>, Eduardo Habkost
 <eduardo@habkost.net>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>, "Michael S .
 Tsirkin" <mst@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>, Markus
 Armbruster <armbru@redhat.com>
References: <20230213095035.158240-1-zhao1.liu@linux.intel.com>
 <20230213095035.158240-9-zhao1.liu@linux.intel.com>
In-Reply-To: <20230213095035.158240-9-zhao1.liu@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=wangyanan55@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.257,
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

在 2023/2/13 17:49, Zhao Liu 写道:
> From: Zhao Liu <zhao1.liu@intel.com>
>
> When MachineState.topo is introduced, the topology related structures
> become complicated. In the general case (hybrid or smp topology),
> accessing the topology information needs to determine whether it is
> currently smp or hybrid topology, and then access the corresponding
> MachineState.topo.smp or MachineState.topo.hybrid.
>
> The best way to do this is to wrap the access to the topology to
> avoid having to check each time it is accessed.
>
> The following helpers are provided here:
>
> - General interfaces - no need to worry about whether the underlying
>    topology is smp or hybrid:
>
> * machine_topo_get_cpus()
> * machine_topo_get_max_cpus()
> * machine_topo_is_smp()
> * machine_topo_get_sockets()
> * machine_topo_get_dies()
> * machine_topo_get_clusters()
> * machine_topo_get_threads();
> * machine_topo_get_cores();
> * machine_topo_get_threads_by_idx()
> * machine_topo_get_cores_by_idx()
> * machine_topo_get_cores_per_socket()
> * machine_topo_get_threads_per_socket()
>
> - SMP-specific interfaces - provided for the cases that are clearly
> known to be smp topology:
>
> * machine_topo_get_smp_cores()
> * machine_topo_get_smp_threads()
>
> Since for hybrid topology, each core may has different threads, if
> someone wants "cpus per core", the cpu_index is need to target a
> specific core (machine_topo_get_threads_by_idx()). But for smp, there is
> no need to be so troublesome, so for this case, we provide smp-specific
> interfaces.
>
> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> ---
>   hw/core/machine-topo.c | 142 +++++++++++++++++++++++++++++++++++++++++
>   include/hw/boards.h    |  35 ++++++++++
>   2 files changed, 177 insertions(+)
>
> diff --git a/hw/core/machine-topo.c b/hw/core/machine-topo.c
> index 7223f73f99b0..b20160479629 100644
> --- a/hw/core/machine-topo.c
> +++ b/hw/core/machine-topo.c
> @@ -21,6 +21,148 @@
>   #include "hw/boards.h"
>   #include "qapi/error.h"
>   
> +unsigned int machine_topo_get_sockets(const MachineState *ms)
> +{
> +    return machine_topo_is_smp(ms) ? ms->topo.smp.sockets :
> +                                     ms->topo.hybrid.sockets;
> +}
> +
> +unsigned int machine_topo_get_dies(const MachineState *ms)
> +{
> +    return machine_topo_is_smp(ms) ? ms->topo.smp.dies :
> +                                     ms->topo.hybrid.dies;
> +}
> +
> +unsigned int machine_topo_get_clusters(const MachineState *ms)
> +{
> +    return machine_topo_is_smp(ms) ? ms->topo.smp.clusters :
> +                                     ms->topo.hybrid.clusters;
> +}
> +
> +unsigned int machine_topo_get_smp_cores(const MachineState *ms)
> +{
> +    g_assert(machine_topo_is_smp(ms));
> +    return ms->topo.smp.cores;
> +}
> +
> +unsigned int machine_topo_get_smp_threads(const MachineState *ms)
> +{
> +    g_assert(machine_topo_is_smp(ms));
> +    return ms->topo.smp.threads;
> +}
> +
> +unsigned int machine_topo_get_threads(const MachineState *ms,
> +                                      unsigned int cluster_id,
> +                                      unsigned int core_id)
> +{
> +    if (machine_topo_is_smp(ms)) {
> +        return ms->topo.smp.threads;
> +    } else {
> +        return ms->topo.hybrid.cluster_list[cluster_id]
> +                   .core_list[core_id].threads;
> +    }
> +
> +    return 0;
> +}
> +
> +unsigned int machine_topo_get_cores(const MachineState *ms,
> +                                    unsigned int cluster_id)
> +{
> +    if (machine_topo_is_smp(ms)) {
> +        return ms->topo.smp.cores;
> +    } else {
> +        return ms->topo.hybrid.cluster_list[cluster_id].cores;
> +    }
> +}
Is it possible to use variadic function so that those two smp specific
helpers can be avoided? It's a bit wired that we have the generic
machine_topo_get_threads but also need machine_topo_get_smp_threads
at the same time.
> +
> +unsigned int machine_topo_get_threads_by_idx(const MachineState *ms,
> +                                             unsigned int cpu_index)
> +{
> +    unsigned cpus_per_die;
> +    unsigned tmp_idx;
> +    HybridCluster *cluster;
> +    HybridCore *core;
> +
> +    if (machine_topo_is_smp(ms)) {
> +        return ms->topo.smp.threads;
> +    }
> +
> +    cpus_per_die = ms->topo.max_cpus / (ms->topo.hybrid.sockets *
> +                            ms->topo.hybrid.dies);
> +    tmp_idx = cpu_index % cpus_per_die;
> +
> +    for (int i = 0; i < ms->topo.hybrid.clusters; i++) {
> +        cluster = &ms->topo.hybrid.cluster_list[i];
> +
> +        for (int j = 0; j < cluster->cores; j++) {
> +            core = &cluster->core_list[j];
> +
> +            if (tmp_idx < core->threads) {
> +                return core->threads;
> +            } else {
> +                tmp_idx -= core->threads;
> +            }
> +        }
> +    }
> +
> +    return 0;
> +}
> +
> +unsigned int machine_topo_get_cores_by_idx(const MachineState *ms,
> +                                           unsigned int cpu_index)
> +{
> +    unsigned cpus_per_die;
> +    unsigned tmp_idx;
> +    HybridCluster *cluster;
> +    HybridCore *core;
> +
> +    if (machine_topo_is_smp(ms)) {
> +        return ms->topo.smp.cores;
> +    }
> +
> +    cpus_per_die = ms->topo.max_cpus / (ms->topo.hybrid.sockets *
> +                            ms->topo.hybrid.dies);
> +    tmp_idx = cpu_index % cpus_per_die;
> +
> +    for (int i = 0; i < ms->topo.hybrid.clusters; i++) {
> +        cluster = &ms->topo.hybrid.cluster_list[i];
> +
> +        for (int j = 0; j < cluster->cores; j++) {
> +            core = &cluster->core_list[j];
> +
> +            if (tmp_idx < core->threads) {
> +                return cluster->cores;
> +            } else {
> +                tmp_idx -= core->threads;
> +            }
> +        }
> +    }
> +
> +    return 0;
> +}
> +
> +unsigned int machine_topo_get_cores_per_socket(const MachineState *ms)
> +{
> +    unsigned int cores_per_die = 0;
> +
> +    if (machine_topo_is_smp(ms)) {
> +        return ms->topo.smp.cores * ms->topo.smp.clusters * ms->topo.smp.dies;
> +    }
> +
> +    for (int i = 0; i < ms->topo.hybrid.clusters; i++) {
> +        cores_per_die += ms->topo.hybrid.cluster_list[i].cores;
> +    }
> +
> +    return cores_per_die * ms->topo.hybrid.dies;
> +}
> +
> +unsigned int machine_topo_get_threads_per_socket(const MachineState *ms)
> +{
> +    unsigned int sockets = machine_topo_is_smp(ms) ? ms->topo.smp.sockets :
> +                           ms->topo.hybrid.sockets;
> +    return ms->topo.max_cpus / sockets;
> +}
> +
>   /*
>    * Report information of a machine's supported CPU topology hierarchy.
>    * Topology members will be ordered from the largest to the smallest
> diff --git a/include/hw/boards.h b/include/hw/boards.h
> index 0a61855499e3..34b64b012022 100644
> --- a/include/hw/boards.h
> +++ b/include/hw/boards.h
> @@ -461,4 +461,39 @@ extern const size_t hw_compat_2_2_len;
>   extern GlobalProperty hw_compat_2_1[];
>   extern const size_t hw_compat_2_1_len;
>   
> +static inline
> +unsigned int machine_topo_get_cpus(const MachineState *ms)
> +{
> +    return ms->topo.cpus;
> +}
> +
> +static inline
> +unsigned int machine_topo_get_max_cpus(const MachineState *ms)
> +{
> +    return ms->topo.max_cpus;
> +}
> +
> +static inline
> +bool machine_topo_is_smp(const MachineState *ms)
> +{
> +    return ms->topo.topo_type == CPU_TOPO_TYPE_SMP;
> +}
> +
> +unsigned int machine_topo_get_sockets(const MachineState *ms);
> +unsigned int machine_topo_get_dies(const MachineState *ms);
> +unsigned int machine_topo_get_clusters(const MachineState *ms);
> +unsigned int machine_topo_get_smp_cores(const MachineState *ms);
> +unsigned int machine_topo_get_smp_threads(const MachineState *ms);
> +unsigned int machine_topo_get_threads(const MachineState *ms,
> +                                      unsigned int cluster_id,
> +                                      unsigned int core_id);
> +unsigned int machine_topo_get_cores(const MachineState *ms,
> +                                    unsigned int cluster_id);
> +unsigned int machine_topo_get_threads_by_idx(const MachineState *ms,
> +                                             unsigned int cpu_index);
> +unsigned int machine_topo_get_cores_by_idx(const MachineState *ms,
> +                                           unsigned int cpu_index);
> +unsigned int machine_topo_get_cores_per_socket(const MachineState *ms);
> +unsigned int machine_topo_get_threads_per_socket(const MachineState *ms);
> +
>   #endif
I think it's necessary to document the ablity for each helper.
For example, at a flance, I cant figure out what 
machine_topo_get_threads_idx
does. Add some something like:
/*
  * Get number of threads within the CPU core where a processor locates,
  * according to the processor index.
  *
  * @param: ...
  */
will be friendly to future users.

Thanks,
Yanan

