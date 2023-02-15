Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C681A697458
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 03:34:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pS7bh-00022R-Pj; Tue, 14 Feb 2023 21:33:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pS7bf-00022E-5B
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 21:33:15 -0500
Received: from mga06b.intel.com ([134.134.136.31] helo=mga06.intel.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pS7bd-0001WI-6v
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 21:33:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676428393; x=1707964393;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=MzwOembX5ck1W5jMNoo1qDLkoD7lLsyjHfgeoS+l6K4=;
 b=QL4mWu9g/Hub67d8YKles4P3ol6TkHo1LQsOrdX3Afg3nJxnaw8ZED1Y
 wB7LqfTHkYBYFz8m/gmWQq1daEBGlhsI3EquBPTk5nd4iwnkruT1M0jWC
 nhsrzlkDEmLY2+YXDDEN+IRr2opSeaXhH5FE/qur9egiNPnu0sWKXbzTN
 tsUtrAAkXbdOEzIfTSqp73pDFo7VQMCDFXNnd34jq2k12Hlw6IaHdtsPe
 PgNxjCqDM4JtI1T/Q2dH0KRb92TwnyySRVwEfqd3WLDYNL9j27vssmTe9
 K4Lkh/pNmvZcYxxuMRqnjaM69QDZ3urzg48Vz06rihA6T3ZRcQ91AjVwC w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="393730639"
X-IronPort-AV: E=Sophos;i="5.97,298,1669104000"; d="scan'208";a="393730639"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2023 18:33:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="619266636"
X-IronPort-AV: E=Sophos;i="5.97,298,1669104000"; d="scan'208";a="619266636"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost)
 ([10.239.160.112])
 by orsmga003.jf.intel.com with ESMTP; 14 Feb 2023 18:33:06 -0800
Date: Wed, 15 Feb 2023 10:40:54 +0800
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
Subject: Re: [RFC 09/52] hw/machine: Introduce core type for hybrid topology
Message-ID: <Y+xGNrRKcIdjksbY@liuzhao-OptiPlex-7080>
References: <20230213095035.158240-1-zhao1.liu@linux.intel.com>
 <20230213095035.158240-10-zhao1.liu@linux.intel.com>
 <PH0PR11MB482477081252AE8E0054905FCDA29@PH0PR11MB4824.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PH0PR11MB482477081252AE8E0054905FCDA29@PH0PR11MB4824.namprd11.prod.outlook.com>
Received-SPF: none client-ip=134.134.136.31;
 envelope-from=zhao1.liu@linux.intel.com; helo=mga06.intel.com
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

On Tue, Feb 14, 2023 at 09:14:13AM +0800, Mi, Dapeng1 wrote:
> Date: Tue, 14 Feb 2023 09:14:13 +0800
> From: "Mi, Dapeng1" <dapeng1.mi@intel.com>
> Subject: RE: [RFC 09/52] hw/machine: Introduce core type for hybrid topology
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
> > Subject: [RFC 09/52] hw/machine: Introduce core type for hybrid topology
> > 
> > From: Zhao Liu <zhao1.liu@intel.com>
> > 
> > Under the hybrid cpu topology, some CPUs care about the core type.
> > For example, Intel's Alder Lake series CPU contains two types of cores:
> > Intel Core and Intel Atom. The type information of these two types is exposed in
> > 1A leaf of CPUID.
> > 
> > Core type should also be part of the hybrid topology, and
> > MachineState.cpu_type cannot provide different type information for different
> > cpus in the same machine, so add a type field for the core level in the hybrid cpu
> > topology.
> > 
> > Additionally, add a helper to get core type information from MachineState.
> > Though core_type is only used in hybrid case, don't use assert since it may be
> > used to initialize some generic fields.
> > 
> > Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> > ---
> >  hw/core/machine-topo.c        | 12 ++++++++++++
> >  include/hw/boards.h           |  3 +++
> >  include/hw/cpu/cpu-topology.h |  2 ++
> >  3 files changed, 17 insertions(+)
> > 
> > diff --git a/hw/core/machine-topo.c b/hw/core/machine-topo.c index
> > b20160479629..e0ec07b53d42 100644
> > --- a/hw/core/machine-topo.c
> > +++ b/hw/core/machine-topo.c
> > @@ -51,6 +51,18 @@ unsigned int machine_topo_get_smp_threads(const
> > MachineState *ms)
> >      return ms->topo.smp.threads;
> >  }
> > 
> > +unsigned int machine_topo_get_hybrid_core_type(const MachineState *ms,
> > +                                               unsigned int cluster_id,
> > +                                               unsigned int core_id) {
> > +    if (!machine_topo_is_smp(ms)) {
> > +        return ms->topo.hybrid.cluster_list[cluster_id]
> > +                       .core_list[core_id].core_type;
> > +    } else {
> > +        return 0;
> > +    }
> > +}
> > +
> 
> We'd better not to return the hard-coded '0'. Suggest to define a 'enum'
> data structure to represent the core_type. This makes the code look more intuitively.

Yes. I defined a core type 'enum' in x86 code, Here I can use a macro to
avoid hardcoding.

Zhao

> 
> >  unsigned int machine_topo_get_threads(const MachineState *ms,
> >                                        unsigned int cluster_id,
> >                                        unsigned int core_id) diff --git a/include/hw/boards.h
> > b/include/hw/boards.h index 34b64b012022..78e52af38cb1 100644
> > --- a/include/hw/boards.h
> > +++ b/include/hw/boards.h
> > @@ -484,6 +484,9 @@ unsigned int machine_topo_get_dies(const
> > MachineState *ms);  unsigned int machine_topo_get_clusters(const
> > MachineState *ms);  unsigned int machine_topo_get_smp_cores(const
> > MachineState *ms);  unsigned int machine_topo_get_smp_threads(const
> > MachineState *ms);
> > +unsigned int machine_topo_get_hybrid_core_type(const MachineState *ms,
> > +                                               unsigned int cluster_id,
> > +                                               unsigned int core_id);
> >  unsigned int machine_topo_get_threads(const MachineState *ms,
> >                                        unsigned int cluster_id,
> >                                        unsigned int core_id); diff --git a/include/hw/cpu/cpu-
> > topology.h b/include/hw/cpu/cpu-topology.h index
> > 8268ea3a8569..87d832556229 100644
> > --- a/include/hw/cpu/cpu-topology.h
> > +++ b/include/hw/cpu/cpu-topology.h
> > @@ -45,9 +45,11 @@ typedef struct SmpCpuTopology {
> >  /**
> >   * HybridCore - hybrid core topology defination:
> >   * @threads: the number of threads in one core.
> > + * @core_type: the type of current core.
> >   */
> >  typedef struct HybridCore {
> >      unsigned int threads;
> > +    unsigned int core_type;
> >  } HybridCore;
> > 
> >  /**
> > --
> > 2.34.1
> 

