Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 023E8697EEC
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 15:57:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSJCZ-0004jS-0b; Wed, 15 Feb 2023 09:56:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pSJCS-0004jE-He
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 09:56:00 -0500
Received: from mga04.intel.com ([192.55.52.120])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pSJCP-0006nw-8M
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 09:56:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676472957; x=1708008957;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=7gq8bJwG8wddP3CZp5aHOW87MzjGjAjNhaHuv8X5IQs=;
 b=ictbmcwT8JrWYXh//cwNppP2PvoIte7ch94u6AT+XX/CAtg6yI9qVYgG
 H2XslZaM+StRc1KzrXRtX4lj2E8++7IwCyTdg8X2GFg44IzyjxvvoG72W
 9Lwuilf80/mx0R2qsd4LFlCacXWAuGCgghuJmG45FZ/HorNUi6CdmHnbG
 q/dpCn43G6zO7723UarZxhHX3BTBHlTkO/qvGO+KRGQ5h+NwAqHJ51KY9
 6tdCOZjGRSZNh9Rpb7P3hgbmpD+9C2N+nYJZta4lSm1vN2U9oguPLonPg
 CQtA2TsjBLllqeSBa5AdCr9ldXr91r9fQ9wwZ9okrVfQMPM+tlF8p0TOJ g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="330076177"
X-IronPort-AV: E=Sophos;i="5.97,299,1669104000"; d="scan'208";a="330076177"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2023 06:55:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="702055525"
X-IronPort-AV: E=Sophos;i="5.97,299,1669104000"; d="scan'208";a="702055525"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost)
 ([10.239.160.112])
 by orsmga001.jf.intel.com with ESMTP; 15 Feb 2023 06:55:43 -0800
Date: Wed, 15 Feb 2023 23:03:35 +0800
From: Zhao Liu <zhao1.liu@linux.intel.com>
To: "wangyanan (Y)" <wangyanan55@huawei.com>
Cc: qemu-devel@nongnu.org, Zhenyu Wang <zhenyu.z.wang@intel.com>,
 Dapeng Mi <dapeng1.mi@intel.com>,
 Zhuocheng Ding <zhuocheng.ding@intel.com>,
 Robert Hoo <robert.hu@linux.intel.com>, Xiaoyao Li <xiaoyao.li@intel.com>,
 Like Xu <like.xu.linux@gmail.com>, Zhao Liu <zhao1.liu@intel.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH RESEND 10/18] i386: Update APIC ID parsing rule to
 support module level
Message-ID: <Y+z0RxPYGQafkKFz@liuzhao-OptiPlex-7080>
References: <20230213093625.158170-1-zhao1.liu@linux.intel.com>
 <20230213093625.158170-11-zhao1.liu@linux.intel.com>
 <c4607aed-a010-21cc-592a-f17be6a64259@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=gb2312
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c4607aed-a010-21cc-592a-f17be6a64259@huawei.com>
Received-SPF: none client-ip=192.55.52.120;
 envelope-from=zhao1.liu@linux.intel.com; helo=mga04.intel.com
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

On Wed, Feb 15, 2023 at 07:06:32PM +0800, wangyanan (Y) wrote:
> Date: Wed, 15 Feb 2023 19:06:32 +0800
> From: "wangyanan (Y)" <wangyanan55@huawei.com>
> Subject: Re: [PATCH RESEND 10/18] i386: Update APIC ID parsing rule to
>  support module level
> 
> Hi Zhao,
> 
> ÔÚ 2023/2/13 17:36, Zhao Liu Ð´µÀ:
> > From: Zhuocheng Ding <zhuocheng.ding@intel.com>
> > 
> > Add the module level parsing support for APIC ID.
> > 
> > With this support, now the conversion between X86CPUTopoIDs,
> > X86CPUTopoInfo and APIC ID is completed.
> IIUC, contents in patch 6-8 and 10 are all about "Introduce the module-level
> CPU topology support for x86", why do we need gradually do this with kinds
> of temporary things instead of warp them into one patch?

Patch 6 is about CPUX86State.nr_dies, which is independent from
patch 7, 8, 10.

Patch 7 (X86CPUTopoInfo.modules_per_die), patch 8 (X86CPUTopoIDs.module_id),
and patch 10 (APIC ID parsing rule) are related but have their own
relatively clear little themes, and are gradually completing full
support for module level in apic id.

Patch 7, 8, 10 can be combined into one big patch. This current
splitting way is actually designed to make it easier to review...
But if you think this is not convenient for review, sorry for that,
and I'm willing to merge them together. ;-)

Thanks,
Zhao

> Before support
> for smp.clusters in the CLI for x86, we can ensure that modules_per_dies is
> always 1 so that the code is save in one diff. Or do I miss something?
> 
> Thanks,
> Yanan
> > Signed-off-by: Zhuocheng Ding <zhuocheng.ding@intel.com>
> > Co-developed-by: Zhao Liu <zhao1.liu@intel.com>
> > Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> > ---
> >   hw/i386/x86.c              | 19 ++++++++-----------
> >   include/hw/i386/topology.h | 36 ++++++++++++++++++------------------
> >   2 files changed, 26 insertions(+), 29 deletions(-)
> > 
> > diff --git a/hw/i386/x86.c b/hw/i386/x86.c
> > index b90c6584930a..2a9d080a8e7a 100644
> > --- a/hw/i386/x86.c
> > +++ b/hw/i386/x86.c
> > @@ -311,11 +311,11 @@ void x86_cpu_pre_plug(HotplugHandler *hotplug_dev,
> >       /*
> >        * If APIC ID is not set,
> > -     * set it based on socket/die/core/thread properties.
> > +     * set it based on socket/die/cluster/core/thread properties.
> >        */
> >       if (cpu->apic_id == UNASSIGNED_APIC_ID) {
> > -        int max_socket = (ms->smp.max_cpus - 1) /
> > -                                smp_threads / smp_cores / ms->smp.dies;
> > +        int max_socket = (ms->smp.max_cpus - 1) / smp_threads / smp_cores /
> > +                                ms->smp.clusters / ms->smp.dies;
> >           /*
> >            * die-id was optional in QEMU 4.0 and older, so keep it optional
> > @@ -379,15 +379,12 @@ void x86_cpu_pre_plug(HotplugHandler *hotplug_dev,
> >           x86_topo_ids_from_apicid(cpu->apic_id, &topo_info, &topo_ids);
> > -        /*
> > -         * TODO: Before APIC ID supports module level parsing, there's no need
> > -         * to expose module_id info.
> > -         */
> >           error_setg(errp,
> > -            "Invalid CPU [socket: %u, die: %u, core: %u, thread: %u] with"
> > -            " APIC ID %" PRIu32 ", valid index range 0:%d",
> > -            topo_ids.pkg_id, topo_ids.die_id, topo_ids.core_id, topo_ids.smt_id,
> > -            cpu->apic_id, ms->possible_cpus->len - 1);
> > +            "Invalid CPU [socket: %u, die: %u, module: %u, core: %u, thread: %u]"
> > +            " with APIC ID %" PRIu32 ", valid index range 0:%d",
> > +            topo_ids.pkg_id, topo_ids.die_id, topo_ids.module_id,
> > +            topo_ids.core_id, topo_ids.smt_id, cpu->apic_id,
> > +            ms->possible_cpus->len - 1);
> >           return;
> >       }
> > diff --git a/include/hw/i386/topology.h b/include/hw/i386/topology.h
> > index 5de905dc00d3..3cec97b377f2 100644
> > --- a/include/hw/i386/topology.h
> > +++ b/include/hw/i386/topology.h
> > @@ -79,12 +79,13 @@ static inline unsigned apicid_smt_width(X86CPUTopoInfo *topo_info)
> >   /* Bit width of the Core_ID field */
> >   static inline unsigned apicid_core_width(X86CPUTopoInfo *topo_info)
> >   {
> > -    /*
> > -     * TODO: Will separate module info from core_width when update
> > -     * APIC ID with module level.
> > -     */
> > -    return apicid_bitwidth_for_count(topo_info->cores_per_module *
> > -                                     topo_info->modules_per_die);
> > +    return apicid_bitwidth_for_count(topo_info->cores_per_module);
> > +}
> > +
> > +/* Bit width of the Module_ID (cluster ID) field */
> > +static inline unsigned apicid_module_width(X86CPUTopoInfo *topo_info)
> > +{
> > +    return apicid_bitwidth_for_count(topo_info->modules_per_die);
> >   }
> >   /* Bit width of the Die_ID field */
> > @@ -99,10 +100,16 @@ static inline unsigned apicid_core_offset(X86CPUTopoInfo *topo_info)
> >       return apicid_smt_width(topo_info);
> >   }
> > +/* Bit offset of the Module_ID (cluster ID) field */
> > +static inline unsigned apicid_module_offset(X86CPUTopoInfo *topo_info)
> > +{
> > +    return apicid_core_offset(topo_info) + apicid_core_width(topo_info);
> > +}
> > +
> >   /* Bit offset of the Die_ID field */
> >   static inline unsigned apicid_die_offset(X86CPUTopoInfo *topo_info)
> >   {
> > -    return apicid_core_offset(topo_info) + apicid_core_width(topo_info);
> > +    return apicid_module_offset(topo_info) + apicid_module_width(topo_info);
> >   }
> >   /* Bit offset of the Pkg_ID (socket ID) field */
> > @@ -121,6 +128,7 @@ static inline apic_id_t x86_apicid_from_topo_ids(X86CPUTopoInfo *topo_info,
> >   {
> >       return (topo_ids->pkg_id  << apicid_pkg_offset(topo_info)) |
> >              (topo_ids->die_id  << apicid_die_offset(topo_info)) |
> > +           (topo_ids->module_id << apicid_module_offset(topo_info)) |
> >              (topo_ids->core_id << apicid_core_offset(topo_info)) |
> >              topo_ids->smt_id;
> >   }
> > @@ -138,11 +146,6 @@ static inline void x86_topo_ids_from_idx(X86CPUTopoInfo *topo_info,
> >       unsigned nr_cores = topo_info->cores_per_module;
> >       unsigned nr_threads = topo_info->threads_per_core;
> > -    /*
> > -     * Currently smp for i386 doesn't support "clusters", modules_per_die is
> > -     * only 1. Therefore, the module_id generated from the module topology will
> > -     * not conflict with the module_id generated according to the apicid.
> > -     */
> >       topo_ids->pkg_id = cpu_index / (nr_dies * nr_modules *
> >                          nr_cores * nr_threads);
> >       topo_ids->die_id = cpu_index / (nr_modules * nr_cores *
> > @@ -166,12 +169,9 @@ static inline void x86_topo_ids_from_apicid(apic_id_t apicid,
> >       topo_ids->core_id =
> >               (apicid >> apicid_core_offset(topo_info)) &
> >               ~(0xFFFFFFFFUL << apicid_core_width(topo_info));
> > -    /*
> > -     * TODO: This is the temporary initialization for topo_ids.module_id to
> > -     * avoid "maybe-uninitialized" compilation errors. Will remove when APIC
> > -     * ID supports module level parsing.
> > -     */
> > -    topo_ids->module_id = 0;
> > +    topo_ids->module_id =
> > +            (apicid >> apicid_module_offset(topo_info)) &
> > +            ~(0xFFFFFFFFUL << apicid_module_width(topo_info));
> >       topo_ids->die_id =
> >               (apicid >> apicid_die_offset(topo_info)) &
> >               ~(0xFFFFFFFFUL << apicid_die_width(topo_info));
> 

