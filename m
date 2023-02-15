Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1F4697451
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 03:24:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pS7Ss-0000A1-5K; Tue, 14 Feb 2023 21:24:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pS7Sq-00009q-Mz
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 21:24:08 -0500
Received: from mga17.intel.com ([192.55.52.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pS7So-0000Tl-I7
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 21:24:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676427846; x=1707963846;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=OdZ9iYpZCfgA1LYRf91YAFEYRSczC6LSDJsAyVKAj+M=;
 b=Q9j3KHPHBq7qtOEXOM3YLvKRL/yCxhDfw+zqJcQ881HeWnM3liG/iFB0
 LS4CBv4WVHpISKpUlDZ8vNiNkkBgdu3KtTeIupf+3YNd+V7HPpallY7cV
 N+dn0xQapQe98btmsTR8koNTxkq53REN2uAxKfQGXZDx3WTyTwwaFmI6y
 fAcK8bfD3sGDDZzhoCuAALBegMXOSYEZCeA6Q7RsCF1rkDbPQ85UXroVe
 4NuR+NvbWbnjKHA8iBH7PHxgAE6Bwdkk1NC8jPrQr0WCp1TsDEjUQeZsn
 NRzhU2GJ7sQaW0JpMQEpehAfPwT2jiEpnLYZHGrNgRQ2a1WoMe0un70YX A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="311692168"
X-IronPort-AV: E=Sophos;i="5.97,298,1669104000"; d="scan'208";a="311692168"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2023 18:24:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="671449706"
X-IronPort-AV: E=Sophos;i="5.97,298,1669104000"; d="scan'208";a="671449706"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost)
 ([10.239.160.112])
 by fmsmga007.fm.intel.com with ESMTP; 14 Feb 2023 18:24:00 -0800
Date: Wed, 15 Feb 2023 10:31:49 +0800
From: Zhao Liu <zhao1.liu@linux.intel.com>
To: "Mi, Dapeng1" <dapeng1.mi@intel.com>
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Philippe =?utf-8?B?TWF0aGlldS1EYXVk77+9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "Wang, Zhenyu Z" <zhenyu.z.wang@intel.com>,
 "Ding, Zhuocheng" <zhuocheng.ding@intel.com>,
 Robert Hoo <robert.hu@linux.intel.com>,
 "Christopherson,, Sean" <seanjc@google.com>,
 Like Xu <like.xu.linux@gmail.com>, "Liu, Zhao1" <zhao1.liu@intel.com>
Subject: Re: [RFC 08/52] machine: Add helpers to get cpu topology info from
 MachineState.topo
Message-ID: <Y+xEFXzZGsW1ScaL@liuzhao-OptiPlex-7080>
References: <20230213095035.158240-1-zhao1.liu@linux.intel.com>
 <20230213095035.158240-9-zhao1.liu@linux.intel.com>
 <PH0PR11MB4824873E281A747152F25AFDCDA29@PH0PR11MB4824.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PH0PR11MB4824873E281A747152F25AFDCDA29@PH0PR11MB4824.namprd11.prod.outlook.com>
Received-SPF: none client-ip=192.55.52.151;
 envelope-from=zhao1.liu@linux.intel.com; helo=mga17.intel.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

On Tue, Feb 14, 2023 at 09:12:11AM +0800, Mi, Dapeng1 wrote:
> Date: Tue, 14 Feb 2023 09:12:11 +0800
> From: "Mi, Dapeng1" <dapeng1.mi@intel.com>
> Subject: RE: [RFC 08/52] machine: Add helpers to get cpu topology info from
>  MachineState.topo
> 
> > From: Zhao Liu <zhao1.liu@linux.intel.com>
> > Sent: Monday, February 13, 2023 5:50 PM
> > To: Eduardo Habkost <eduardo@habkost.net>; Marcel Apfelbaum
> > <marcel.apfelbaum@gmail.com>; Philippe Mathieu-Daud? <philmd@linaro.org>;
> > Yanan Wang <wangyanan55@huawei.com>; Michael S . Tsirkin
> > <mst@redhat.com>; Richard Henderson <richard.henderson@linaro.org>; Paolo
> > Bonzini <pbonzini@redhat.com>; Eric Blake <eblake@redhat.com>; Markus
> > Armbruster <armbru@redhat.com>
> > Cc: qemu-devel@nongnu.org; Wang, Zhenyu Z <zhenyu.z.wang@intel.com>; Mi,
> > Dapeng1 <dapeng1.mi@intel.com>; Ding, Zhuocheng
> > <zhuocheng.ding@intel.com>; Robert Hoo <robert.hu@linux.intel.com>;
> > Christopherson,, Sean <seanjc@google.com>; Like Xu
> > <like.xu.linux@gmail.com>; Liu, Zhao1 <zhao1.liu@intel.com>
> > Subject: [RFC 08/52] machine: Add helpers to get cpu topology info from
> > MachineState.topo
> > 
> > From: Zhao Liu <zhao1.liu@intel.com>
> > 
> > When MachineState.topo is introduced, the topology related structures become
> > complicated. In the general case (hybrid or smp topology), accessing the
> > topology information needs to determine whether it is currently smp or hybrid
> > topology, and then access the corresponding MachineState.topo.smp or
> > MachineState.topo.hybrid.
> > 
> > The best way to do this is to wrap the access to the topology to avoid having to
> > check each time it is accessed.
> > 
> > The following helpers are provided here:
> > 
> > - General interfaces - no need to worry about whether the underlying
> >   topology is smp or hybrid:
> > 
> > * machine_topo_get_cpus()
> > * machine_topo_get_max_cpus()
> > * machine_topo_is_smp()
> > * machine_topo_get_sockets()
> > * machine_topo_get_dies()
> > * machine_topo_get_clusters()
> > * machine_topo_get_threads();
> > * machine_topo_get_cores();
> > * machine_topo_get_threads_by_idx()
> > * machine_topo_get_cores_by_idx()
> > * machine_topo_get_cores_per_socket()
> > * machine_topo_get_threads_per_socket()
> > 
> > - SMP-specific interfaces - provided for the cases that are clearly known to be
> > smp topology:
> > 
> > * machine_topo_get_smp_cores()
> > * machine_topo_get_smp_threads()
> > 
> > Since for hybrid topology, each core may has different threads, if someone
> > wants "cpus per core", the cpu_index is need to target a specific core
> > (machine_topo_get_threads_by_idx()). But for smp, there is no need to be so
> > troublesome, so for this case, we provide smp-specific interfaces.
> > 
> > Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> > ---
> >  hw/core/machine-topo.c | 142
> > +++++++++++++++++++++++++++++++++++++++++
> >  include/hw/boards.h    |  35 ++++++++++
> >  2 files changed, 177 insertions(+)
> > 
> > diff --git a/hw/core/machine-topo.c b/hw/core/machine-topo.c index
> > 7223f73f99b0..b20160479629 100644
> > --- a/hw/core/machine-topo.c
> > +++ b/hw/core/machine-topo.c
> > @@ -21,6 +21,148 @@
> >  #include "hw/boards.h"
> >  #include "qapi/error.h"
> > 
> > +unsigned int machine_topo_get_sockets(const MachineState *ms) {
> > +    return machine_topo_is_smp(ms) ? ms->topo.smp.sockets :
> > +                                     ms->topo.hybrid.sockets; }
> > +
> > +unsigned int machine_topo_get_dies(const MachineState *ms) {
> > +    return machine_topo_is_smp(ms) ? ms->topo.smp.dies :
> > +                                     ms->topo.hybrid.dies; }
> > +
> > +unsigned int machine_topo_get_clusters(const MachineState *ms) {
> > +    return machine_topo_is_smp(ms) ? ms->topo.smp.clusters :
> > +                                     ms->topo.hybrid.clusters; }
> > +
> > +unsigned int machine_topo_get_smp_cores(const MachineState *ms) {
> > +    g_assert(machine_topo_is_smp(ms));
> > +    return ms->topo.smp.cores;
> > +}
> > +
> > +unsigned int machine_topo_get_smp_threads(const MachineState *ms) {
> > +    g_assert(machine_topo_is_smp(ms));
> > +    return ms->topo.smp.threads;
> > +}
> > +
> > +unsigned int machine_topo_get_threads(const MachineState *ms,
> > +                                      unsigned int cluster_id,
> > +                                      unsigned int core_id) {
> > +    if (machine_topo_is_smp(ms)) {
> > +        return ms->topo.smp.threads;
> > +    } else {
> > +        return ms->topo.hybrid.cluster_list[cluster_id]
> > +                   .core_list[core_id].threads;
> > +    }
> > +
> > +    return 0;
> > +}
> > +
> > +unsigned int machine_topo_get_cores(const MachineState *ms,
> > +                                    unsigned int cluster_id) {
> > +    if (machine_topo_is_smp(ms)) {
> > +        return ms->topo.smp.cores;
> > +    } else {
> > +        return ms->topo.hybrid.cluster_list[cluster_id].cores;
> > +    }
> > +}
> > +
> > +unsigned int machine_topo_get_threads_by_idx(const MachineState *ms,
> > +                                             unsigned int cpu_index) {
> > +    unsigned cpus_per_die;
> > +    unsigned tmp_idx;
> > +    HybridCluster *cluster;
> > +    HybridCore *core;
> > +
> > +    if (machine_topo_is_smp(ms)) {
> > +        return ms->topo.smp.threads;
> > +    }
> > +
> > +    cpus_per_die = ms->topo.max_cpus / (ms->topo.hybrid.sockets *
> > +                            ms->topo.hybrid.dies);
> > +    tmp_idx = cpu_index % cpus_per_die;
> > +
> > +    for (int i = 0; i < ms->topo.hybrid.clusters; i++) {
> > +        cluster = &ms->topo.hybrid.cluster_list[i];
> > +
> > +        for (int j = 0; j < cluster->cores; j++) {
> > +            core = &cluster->core_list[j];
> > +
> > +            if (tmp_idx < core->threads) {
> > +                return core->threads;
> > +            } else {
> > +                tmp_idx -= core->threads;
> > +            }
> > +        }
> > +    }
> > +
> > +    return 0;
> > +}
> > +
> > +unsigned int machine_topo_get_cores_by_idx(const MachineState *ms,
> > +                                           unsigned int cpu_index) {
> > +    unsigned cpus_per_die;
> > +    unsigned tmp_idx;
> > +    HybridCluster *cluster;
> > +    HybridCore *core;
> > +
> > +    if (machine_topo_is_smp(ms)) {
> > +        return ms->topo.smp.cores;
> > +    }
> > +
> > +    cpus_per_die = ms->topo.max_cpus / (ms->topo.hybrid.sockets *
> > +                            ms->topo.hybrid.dies);
> > +    tmp_idx = cpu_index % cpus_per_die;
> > +
> > +    for (int i = 0; i < ms->topo.hybrid.clusters; i++) {
> > +        cluster = &ms->topo.hybrid.cluster_list[i];
> > +
> > +        for (int j = 0; j < cluster->cores; j++) {
> > +            core = &cluster->core_list[j];
> > +
> > +            if (tmp_idx < core->threads) {
> > +                return cluster->cores;
> > +            } else {
> > +                tmp_idx -= core->threads;
> > +            }
> > +        }
> > +    }
> > +
> > +    return 0;
> > +}
> > +
> 
> It looks most code of this function is same with previous function. Could we extract
> the same part code and define a low level function?

Yes, I can try it.

Thanks,
Zhao

> 
> > +unsigned int machine_topo_get_cores_per_socket(const MachineState *ms)
> > +{
> > +    unsigned int cores_per_die = 0;
> > +
> > +    if (machine_topo_is_smp(ms)) {
> > +        return ms->topo.smp.cores * ms->topo.smp.clusters * ms->topo.smp.dies;
> > +    }
> > +
> > +    for (int i = 0; i < ms->topo.hybrid.clusters; i++) {
> > +        cores_per_die += ms->topo.hybrid.cluster_list[i].cores;
> > +    }
> > +
> > +    return cores_per_die * ms->topo.hybrid.dies; }
> > +
> > +unsigned int machine_topo_get_threads_per_socket(const MachineState
> > +*ms) {
> > +    unsigned int sockets = machine_topo_is_smp(ms) ? ms->topo.smp.sockets :
> > +                           ms->topo.hybrid.sockets;
> > +    return ms->topo.max_cpus / sockets; }
> > +
> >  /*
> >   * Report information of a machine's supported CPU topology hierarchy.
> >   * Topology members will be ordered from the largest to the smallest diff --git
> > a/include/hw/boards.h b/include/hw/boards.h index
> > 0a61855499e3..34b64b012022 100644
> > --- a/include/hw/boards.h
> > +++ b/include/hw/boards.h
> > @@ -461,4 +461,39 @@ extern const size_t hw_compat_2_2_len;  extern
> > GlobalProperty hw_compat_2_1[];  extern const size_t hw_compat_2_1_len;
> > 
> > +static inline
> > +unsigned int machine_topo_get_cpus(const MachineState *ms) {
> > +    return ms->topo.cpus;
> > +}
> > +
> > +static inline
> > +unsigned int machine_topo_get_max_cpus(const MachineState *ms) {
> > +    return ms->topo.max_cpus;
> > +}
> > +
> > +static inline
> > +bool machine_topo_is_smp(const MachineState *ms) {
> > +    return ms->topo.topo_type == CPU_TOPO_TYPE_SMP; }
> > +
> > +unsigned int machine_topo_get_sockets(const MachineState *ms); unsigned
> > +int machine_topo_get_dies(const MachineState *ms); unsigned int
> > +machine_topo_get_clusters(const MachineState *ms); unsigned int
> > +machine_topo_get_smp_cores(const MachineState *ms); unsigned int
> > +machine_topo_get_smp_threads(const MachineState *ms); unsigned int
> > +machine_topo_get_threads(const MachineState *ms,
> > +                                      unsigned int cluster_id,
> > +                                      unsigned int core_id); unsigned
> > +int machine_topo_get_cores(const MachineState *ms,
> > +                                    unsigned int cluster_id); unsigned
> > +int machine_topo_get_threads_by_idx(const MachineState *ms,
> > +                                             unsigned int cpu_index);
> > +unsigned int machine_topo_get_cores_by_idx(const MachineState *ms,
> > +                                           unsigned int cpu_index);
> > +unsigned int machine_topo_get_cores_per_socket(const MachineState *ms);
> > +unsigned int machine_topo_get_threads_per_socket(const MachineState
> > +*ms);
> > +
> >  #endif
> > --
> > 2.34.1
> 

