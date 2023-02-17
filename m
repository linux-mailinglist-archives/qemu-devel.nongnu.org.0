Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B85CD69A45A
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 04:28:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSrPT-0002KJ-2J; Thu, 16 Feb 2023 22:27:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pSrPR-0002K4-BL
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 22:27:41 -0500
Received: from mga09.intel.com ([134.134.136.24])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pSrPP-0007wn-Iq
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 22:27:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676604459; x=1708140459;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Nob6mw+8h8uZbC1bt23HXFIKtyfta+iinbhlBF12FRQ=;
 b=B7QCVOefwKhy/KWmGPLaG2mjOgkMFcVcJNH71v757wJdfq6WBOGrsavQ
 V9nIx5i7T7FVFVQZAs2lnYZxGvx+2qKtZ5srO6LlnYk1gNZ52LsTyR+Dw
 wIDue5wjVY+A81ZTKcnGCMeFbfHNuzBBIPXT7Yc7GlK7rd+4u3qPhqjQK
 s2SP+4+T8+p/wSEqxa/zpMCMNQh924AZFDw1jkpLHSNbfruUzWowvXlhv
 x7S2u/MS/AOSdFLWjabbzUO9AqXstRXmfIrtZBWWWmV3fFzjw1miPXtJS
 Ws765cUMGf5Pa5JTVfsW+e7xORMs1AaOdLNmV3E534bRb1ocY34k2rd6H w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="333260796"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; d="scan'208";a="333260796"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2023 19:27:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="702828181"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; d="scan'208";a="702828181"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost)
 ([10.239.160.112])
 by orsmga001.jf.intel.com with ESMTP; 16 Feb 2023 19:27:32 -0800
Date: Fri, 17 Feb 2023 11:35:24 +0800
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
Subject: Re: [PATCH RESEND 18/18] i386: Add new property to control L2 cache
 topo in CPUID.04H
Message-ID: <Y+71/BXqsixQMGFV@liuzhao-OptiPlex-7080>
References: <20230213093625.158170-1-zhao1.liu@linux.intel.com>
 <20230213093625.158170-19-zhao1.liu@linux.intel.com>
 <f88368fe-2ef1-2f54-7afe-646ec4d11460@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=gb2312
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f88368fe-2ef1-2f54-7afe-646ec4d11460@huawei.com>
Received-SPF: none client-ip=134.134.136.24;
 envelope-from=zhao1.liu@linux.intel.com; helo=mga09.intel.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1,
 MIME_CHARSET_FARAWAY=2.45, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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

On Thu, Feb 16, 2023 at 09:14:54PM +0800, wangyanan (Y) wrote:
> Date: Thu, 16 Feb 2023 21:14:54 +0800
> From: "wangyanan (Y)" <wangyanan55@huawei.com>
> Subject: Re: [PATCH RESEND 18/18] i386: Add new property to control L2
>  cache topo in CPUID.04H
> 
> ÔÚ 2023/2/13 17:36, Zhao Liu Ð´µÀ:
> > From: Zhao Liu <zhao1.liu@intel.com>
> > 
> > The property x-l2-cache-topo will be used to change the L2 cache
> > topology in CPUID.04H.
> > 
> > Now it allows user to set the L2 cache is shared in core level or
> > cluster level.
> > 
> > If user passes "-cpu x-l2-cache-topo=[core|cluster]" then older L2 cache
> > topology will be overrided by the new topology setting.
> Currently x-l2-cache-topo only defines the share level *globally*.

Yes, will set for all CPUs.

> I'm thinking how we can make the property more powerful so that it
> can specify which CPUs share l2 on core level and which CPUs share
> l2 on cluster level.
> 
> What would Intel's Hybrid CPUs do? Determine the l2 share level
> is core or cluster according to the CPU core type (Atom or Core)?
> While ARM does not have the core type concept but have CPUs
> that l2 is shared on different levels in the same system.

For example, Alderlake's "core" shares 1 L2 per core and every 4 "atom"s
share 1 L2. For this case, we can set the topology as:

cluster0 has 1 "core" and cluster1 has 4 "atom". Then set L2 shared on
cluster level.

Since cluster0 has only 1 "core" type core, then L2 per "core" works.

Not sure if this idea can be applied to arm?

> 
> Thanks,
> Yanan
> > Here we expose to user "cluster" instead of "module", to be consistent
> > with "cluster-id" naming.
> > 
> > Since CPUID.04H is used by intel CPUs, this property is available on
> > intel CPUs as for now.
> > 
> > When necessary, it can be extended to CPUID.8000001DH for amd CPUs.
> > 
> > Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> > ---
> >   target/i386/cpu.c | 33 ++++++++++++++++++++++++++++++++-
> >   target/i386/cpu.h |  2 ++
> >   2 files changed, 34 insertions(+), 1 deletion(-)
> > 
> > diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> > index 5816dc99b1d4..cf84c720a431 100644
> > --- a/target/i386/cpu.c
> > +++ b/target/i386/cpu.c
> > @@ -240,12 +240,15 @@ static uint32_t max_processor_ids_for_cache(CPUCacheInfo *cache,
> >       case CORE:
> >           num_ids = 1 << apicid_core_offset(topo_info);
> >           break;
> > +    case MODULE:
> > +        num_ids = 1 << apicid_module_offset(topo_info);
> > +        break;
> >       case DIE:
> >           num_ids = 1 << apicid_die_offset(topo_info);
> >           break;
> >       default:
> >           /*
> > -         * Currently there is no use case for SMT, MODULE and PACKAGE, so use
> > +         * Currently there is no use case for SMT and PACKAGE, so use
> >            * assert directly to facilitate debugging.
> >            */
> >           g_assert_not_reached();
> > @@ -6633,6 +6636,33 @@ static void x86_cpu_realizefn(DeviceState *dev, Error **errp)
> >           env->cache_info_amd.l3_cache = &legacy_l3_cache;
> >       }
> > +    if (cpu->l2_cache_topo_level) {
> > +        /*
> > +         * FIXME: Currently only supports changing CPUID[4] (for intel), and
> > +         * will support changing CPUID[0x8000001D] when necessary.
> > +         */
> > +        if (!IS_INTEL_CPU(env)) {
> > +            error_setg(errp, "only intel cpus supports x-l2-cache-topo");
> > +            return;
> > +        }
> > +
> > +        if (!strcmp(cpu->l2_cache_topo_level, "core")) {
> > +            env->cache_info_cpuid4.l2_cache->share_level = CORE;
> > +        } else if (!strcmp(cpu->l2_cache_topo_level, "cluster")) {
> > +            /*
> > +             * We expose to users "cluster" instead of "module", to be
> > +             * consistent with "cluster-id" naming.
> > +             */
> > +            env->cache_info_cpuid4.l2_cache->share_level = MODULE;
> > +        } else {
> > +            error_setg(errp,
> > +                       "x-l2-cache-topo doesn't support '%s', "
> > +                       "and it only supports 'core' or 'cluster'",
> > +                       cpu->l2_cache_topo_level);
> > +            return;
> > +        }
> > +    }
> > +
> >   #ifndef CONFIG_USER_ONLY
> >       MachineState *ms = MACHINE(qdev_get_machine());
> >       qemu_register_reset(x86_cpu_machine_reset_cb, cpu);
> > @@ -7135,6 +7165,7 @@ static Property x86_cpu_properties[] = {
> >                        false),
> >       DEFINE_PROP_BOOL("x-intel-pt-auto-level", X86CPU, intel_pt_auto_level,
> >                        true),
> > +    DEFINE_PROP_STRING("x-l2-cache-topo", X86CPU, l2_cache_topo_level),
> >       DEFINE_PROP_END_OF_LIST()
> >   };
> > diff --git a/target/i386/cpu.h b/target/i386/cpu.h
> > index 5a955431f759..aa7e96c586c7 100644
> > --- a/target/i386/cpu.h
> > +++ b/target/i386/cpu.h
> > @@ -1987,6 +1987,8 @@ struct ArchCPU {
> >       int32_t thread_id;
> >       int32_t hv_max_vps;
> > +
> > +    char *l2_cache_topo_level;
> >   };
> 

