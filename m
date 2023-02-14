Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8BB3695F58
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 10:35:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRrhH-0008KQ-Pa; Tue, 14 Feb 2023 04:33:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRrhF-0008Jy-7S
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 04:33:57 -0500
Received: from mga17.intel.com ([192.55.52.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRrhC-0001zZ-RC
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 04:33:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676367234; x=1707903234;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=5ZT03HSAl5gZUVLYFHazEWKth7RMon+OCMlMbgTe4+s=;
 b=h9aD+xxyuHU0DaJ9QKC915O85Z6eLRkOimn34ixaqKkyXYCWQ264YPVp
 AYWHZm7DxnzFP5OWhvr0nKHVeLIL4szkrcnB8BL5ipZ2fZ7tTMjGCzP0j
 PuS+RzSNR+q7kDZsNkciw/74PDq//+2wl0aC5iXonGsaWcnDGbdiSzyPo
 zhqWO6bdiWiR1540Xuxdm9bFO+WqSIp02r7bYqloMMI0WGHsPH3wPjrOV
 EOY7yhwhjJmKQhWMO1xfjta9FnF+aHav6P1LuoUAhTMmpLEoUXub72Xqa
 VMU5KD9SRaE/7XzuoGmLG6I9BOTbHBc57n4CpEuMofPaZbJBamKlQGrSR g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="311480099"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; d="scan'208";a="311480099"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2023 01:33:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="699482774"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; d="scan'208";a="699482774"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost)
 ([10.239.160.112])
 by orsmga008.jf.intel.com with ESMTP; 14 Feb 2023 01:33:38 -0800
Date: Tue, 14 Feb 2023 17:41:25 +0800
From: Zhao Liu <zhao1.liu@linux.intel.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Zhenyu Wang <zhenyu.z.wang@intel.com>, Dapeng Mi <dapeng1.mi@intel.com>,
 Zhuocheng Ding <zhuocheng.ding@intel.com>,
 Robert Hoo <robert.hu@linux.intel.com>,
 Sean Christopherson <seanjc@google.com>,
 Like Xu <like.xu.linux@gmail.com>, Zhao Liu <zhao1.liu@intel.com>
Subject: Re: [RFC 09/52] hw/machine: Introduce core type for hybrid topology
Message-ID: <Y+tXRZAUTn6miFvs@liuzhao-OptiPlex-7080>
References: <20230213095035.158240-1-zhao1.liu@linux.intel.com>
 <20230213095035.158240-10-zhao1.liu@linux.intel.com>
 <9995a184-df44-6680-174f-14fc0b5c2425@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9995a184-df44-6680-174f-14fc0b5c2425@linaro.org>
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

On Mon, Feb 13, 2023 at 02:13:40PM +0100, Philippe Mathieu-Daudé wrote:
> Date: Mon, 13 Feb 2023 14:13:40 +0100
> From: Philippe Mathieu-Daudé <philmd@linaro.org>
> Subject: Re: [RFC 09/52] hw/machine: Introduce core type for hybrid topology
> 
> On 13/2/23 10:49, Zhao Liu wrote:
> > From: Zhao Liu <zhao1.liu@intel.com>
> > 
> > Under the hybrid cpu topology, some CPUs care about the core type.
> > For example, Intel's Alder Lake series CPU contains two types of cores:
> > Intel Core and Intel Atom. The type information of these two types is
> > exposed in 1A leaf of CPUID.
> > 
> > Core type should also be part of the hybrid topology, and
> > MachineState.cpu_type cannot provide different type information for
> > different cpus in the same machine, so add a type field for the core
> > level in the hybrid cpu topology.
> > 
> > Additionally, add a helper to get core type information from
> > MachineState. Though core_type is only used in hybrid case, don't
> > use assert since it may be used to initialize some generic fields.
> > 
> > Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> > ---
> >   hw/core/machine-topo.c        | 12 ++++++++++++
> >   include/hw/boards.h           |  3 +++
> >   include/hw/cpu/cpu-topology.h |  2 ++
> >   3 files changed, 17 insertions(+)
> > 
> > diff --git a/hw/core/machine-topo.c b/hw/core/machine-topo.c
> > index b20160479629..e0ec07b53d42 100644
> > --- a/hw/core/machine-topo.c
> > +++ b/hw/core/machine-topo.c
> > @@ -51,6 +51,18 @@ unsigned int machine_topo_get_smp_threads(const MachineState *ms)
> >       return ms->topo.smp.threads;
> >   }
> > +unsigned int machine_topo_get_hybrid_core_type(const MachineState *ms,
> > +                                               unsigned int cluster_id,
> > +                                               unsigned int core_id)
> > +{
> > +    if (!machine_topo_is_smp(ms)) {
> > +        return ms->topo.hybrid.cluster_list[cluster_id]
> > +                       .core_list[core_id].core_type;
> > +    } else {
> > +        return 0;
> 
> Is '0' an invalid type?

My intention is to use 0 as the default type under smp (it can be
regarded as invalid under hybrid, this should depend on the check
of the architecture itself), I'll use a macro instead of hardcode.

> 
> > +    }
> > +}
> 

