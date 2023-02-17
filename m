Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6213869A600
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 08:20:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSv1K-0007mO-BW; Fri, 17 Feb 2023 02:19:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pSv1G-0007lS-Un
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 02:18:59 -0500
Received: from mga06b.intel.com ([134.134.136.31] helo=mga06.intel.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pSv1D-0003q0-PJ
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 02:18:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676618335; x=1708154335;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=zOhyRzoxiCMGAYKUUVhqX4iKPq2cdttVAVNFuTOTAEk=;
 b=a4NXuujWZcYfCkPfc7jjmqGyjXfewpsqtXeREqSoEh8S+jKlZZi5W05C
 sEWAQDaFmciCB/6hie1Q3RUzvsUIrp/k9wqRGXaxtCsYhMIXYajmGRbe9
 iVJvjo1wrZ+okDQNGItfoWjwbwIlFCbRoQp1y7I6I1+ad/eq3P1Jo2HFP
 DIWZFEJm2nNasmEzP/jVeAIwjSYrlYKBhueeB3ewkq0zBNhY79khTnvZN
 kOsbkwws5+CXH/lhhyzMoj/1rxGjjL0QHQ8+qNOyahloMVEPN5TDQShWU
 IflVnKgld78UpOUupiKWzqVxSyAOegl8O/+1/x36n9vxDaO2pr8zLnqrf A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="394405849"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; d="scan'208";a="394405849"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2023 23:18:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="647989671"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; d="scan'208";a="647989671"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost)
 ([10.239.160.112])
 by orsmga006.jf.intel.com with ESMTP; 16 Feb 2023 23:18:44 -0800
Date: Fri, 17 Feb 2023 15:26:37 +0800
From: Zhao Liu <zhao1.liu@linux.intel.com>
To: "wangyanan (Y)" <wangyanan55@huawei.com>,
 Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>
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
Message-ID: <Y+8sLZLuXBG9Lrzs@liuzhao-OptiPlex-7080>
References: <20230213093625.158170-1-zhao1.liu@linux.intel.com>
 <20230213093625.158170-19-zhao1.liu@linux.intel.com>
 <f88368fe-2ef1-2f54-7afe-646ec4d11460@huawei.com>
 <Y+71/BXqsixQMGFV@liuzhao-OptiPlex-7080>
 <05984e8b-f710-9809-5495-84b0dade686f@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=gb2312
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <05984e8b-f710-9809-5495-84b0dade686f@huawei.com>
Received-SPF: none client-ip=134.134.136.31;
 envelope-from=zhao1.liu@linux.intel.com; helo=mga06.intel.com
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

On Fri, Feb 17, 2023 at 12:07:01PM +0800, wangyanan (Y) wrote:
> Date: Fri, 17 Feb 2023 12:07:01 +0800
> From: "wangyanan (Y)" <wangyanan55@huawei.com>
> Subject: Re: [PATCH RESEND 18/18] i386: Add new property to control L2
>  cache topo in CPUID.04H
> 
> 在 2023/2/17 11:35, Zhao Liu 写道:
> > On Thu, Feb 16, 2023 at 09:14:54PM +0800, wangyanan (Y) wrote:
> > > Date: Thu, 16 Feb 2023 21:14:54 +0800
> > > From: "wangyanan (Y)" <wangyanan55@huawei.com>
> > > Subject: Re: [PATCH RESEND 18/18] i386: Add new property to control L2
> > >   cache topo in CPUID.04H
> > > 
> > > 在 2023/2/13 17:36, Zhao Liu 写道:
> > > > From: Zhao Liu <zhao1.liu@intel.com>
> > > > 
> > > > The property x-l2-cache-topo will be used to change the L2 cache
> > > > topology in CPUID.04H.
> > > > 
> > > > Now it allows user to set the L2 cache is shared in core level or
> > > > cluster level.
> > > > 
> > > > If user passes "-cpu x-l2-cache-topo=[core|cluster]" then older L2 cache
> > > > topology will be overrided by the new topology setting.
> > > Currently x-l2-cache-topo only defines the share level *globally*.
> > Yes, will set for all CPUs.
> > 
> > > I'm thinking how we can make the property more powerful so that it
> > > can specify which CPUs share l2 on core level and which CPUs share
> > > l2 on cluster level.
> > > 
> > > What would Intel's Hybrid CPUs do? Determine the l2 share level
> > > is core or cluster according to the CPU core type (Atom or Core)?
> > > While ARM does not have the core type concept but have CPUs
> > > that l2 is shared on different levels in the same system.
> > For example, Alderlake's "core" shares 1 L2 per core and every 4 "atom"s
> > share 1 L2. For this case, we can set the topology as:
> > 
> > cluster0 has 1 "core" and cluster1 has 4 "atom". Then set L2 shared on
> > cluster level.
> > 
> > Since cluster0 has only 1 "core" type core, then L2 per "core" works.
> > 
> > Not sure if this idea can be applied to arm?
> For a CPU topopoly where we have 2 clusters totally, 2 cores in cluster0
> have their own L1/L2 cache and 2 threads in each core, 4 cores in cluster1
> share one L2 cache and 1 thread in each core. The global way does not
> work well.
> 
> What about defining something general, which looks like -numa config:
> -cache-topo cache=l2, share_level="core", cpus='0-3'
> -cache-topo cache=l2, share_level="cluster", cpus='4-7'

Hi Yanan, here it may be necessary to check whether the cpu index set
in "cpus" is reasonable through the specific cpu topology.

For example, core0 has 2 CPUs: cpu0 and cpu1, and core1 has 2 CPUs: cpu2
and cpu3, then set l2 as:

-cache-topo cache=l2, share_level="core", cpus='0-2'
-cache-topo cache=l2, share_level="core", cpus='3'

Whether this command is legal depends on the meaning we give to the
parameter "cpu":
1. If "cpu" means all cpus share the cache set in this command, then
this command should fail since cpu2 and cpu3 are in a core.

2. If "cpu" means the affected cpus, then this command should find the
cores they belong to according to the cpu topology, and set L2 for those
cores. This command may return success.

What about removing share_level and ask "cpu" to mean all the sharing
cpus to avoid checking the cpu topology?

Then the above example should be:

-cache-topo cache=l2, cpus='0-1'
-cache-topo cache=l2, cpus='2-3'

This decouples cpu topology and cache topology completely and very
simple. In this way, determining the cache by specifying the shared cpu
is similar to that in x86 CPUID.04H.

But the price of simplicity is we may build a cache topology that doesn't
match the reality.

But if the cache topology must be set based on the cpu topology, another
way is consider specifying the cache when setting the topology
structure, which can be based on @Daniel's format [1]:

  -object cpu-socket,id=sock0,cache=l3
  -object cpu-die,id=die0,parent=sock0
  -object cpu-cluster,id=cluster0,parent=die0
  -object cpu-cluster,id=cluster1,parent=die0,cache=l2
  -object x86-cpu-model-core,id=cpu0,parent=cluster0,threads=2,cache=l1i,lid,l2
  -object x86-cpu-model-atom,id=cpu1,parent=cluster1,cache=l1i,lid
  -object x86-cpu-model-atom,id=cpu2,parent=cluster1,cache=l1i,l1d

Then from this command, cpu0 has a l2, and cpu1 and cpu2 shares a l2
(the l2 is inserted in cluster1).

This whole process is like when designing or building a CPU, the user
decides where to insert the caches. The advantage is that it is easier
to verify the rationality and is intuitive. But complicated.

(Also CC @Daniel for comments).

[1]: https://lists.gnu.org/archive/html/qemu-devel/2023-02/msg03320.html

Thanks,
Zhao

> If we ever want to support custom share-level for L3/L1, no extra work
> is needed. We can also extend the CLI to support custom cache size, etc..
> 
> If you thinks this a good idea to explore, I can work on it, since I'm
> planing to add support cache topology for ARM.
> 
> Thanks,
> Yanan
> > > Thanks,
> > > Yanan
> > > > Here we expose to user "cluster" instead of "module", to be consistent
> > > > with "cluster-id" naming.
> > > > 
> > > > Since CPUID.04H is used by intel CPUs, this property is available on
> > > > intel CPUs as for now.
> > > > 
> > > > When necessary, it can be extended to CPUID.8000001DH for amd CPUs.
> > > > 
> > > > Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> > > > ---
> > > >    target/i386/cpu.c | 33 ++++++++++++++++++++++++++++++++-
> > > >    target/i386/cpu.h |  2 ++
> > > >    2 files changed, 34 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> > > > index 5816dc99b1d4..cf84c720a431 100644
> > > > --- a/target/i386/cpu.c
> > > > +++ b/target/i386/cpu.c
> > > > @@ -240,12 +240,15 @@ static uint32_t max_processor_ids_for_cache(CPUCacheInfo *cache,
> > > >        case CORE:
> > > >            num_ids = 1 << apicid_core_offset(topo_info);
> > > >            break;
> > > > +    case MODULE:
> > > > +        num_ids = 1 << apicid_module_offset(topo_info);
> > > > +        break;
> > > >        case DIE:
> > > >            num_ids = 1 << apicid_die_offset(topo_info);
> > > >            break;
> > > >        default:
> > > >            /*
> > > > -         * Currently there is no use case for SMT, MODULE and PACKAGE, so use
> > > > +         * Currently there is no use case for SMT and PACKAGE, so use
> > > >             * assert directly to facilitate debugging.
> > > >             */
> > > >            g_assert_not_reached();
> > > > @@ -6633,6 +6636,33 @@ static void x86_cpu_realizefn(DeviceState *dev, Error **errp)
> > > >            env->cache_info_amd.l3_cache = &legacy_l3_cache;
> > > >        }
> > > > +    if (cpu->l2_cache_topo_level) {
> > > > +        /*
> > > > +         * FIXME: Currently only supports changing CPUID[4] (for intel), and
> > > > +         * will support changing CPUID[0x8000001D] when necessary.
> > > > +         */
> > > > +        if (!IS_INTEL_CPU(env)) {
> > > > +            error_setg(errp, "only intel cpus supports x-l2-cache-topo");
> > > > +            return;
> > > > +        }
> > > > +
> > > > +        if (!strcmp(cpu->l2_cache_topo_level, "core")) {
> > > > +            env->cache_info_cpuid4.l2_cache->share_level = CORE;
> > > > +        } else if (!strcmp(cpu->l2_cache_topo_level, "cluster")) {
> > > > +            /*
> > > > +             * We expose to users "cluster" instead of "module", to be
> > > > +             * consistent with "cluster-id" naming.
> > > > +             */
> > > > +            env->cache_info_cpuid4.l2_cache->share_level = MODULE;
> > > > +        } else {
> > > > +            error_setg(errp,
> > > > +                       "x-l2-cache-topo doesn't support '%s', "
> > > > +                       "and it only supports 'core' or 'cluster'",
> > > > +                       cpu->l2_cache_topo_level);
> > > > +            return;
> > > > +        }
> > > > +    }
> > > > +
> > > >    #ifndef CONFIG_USER_ONLY
> > > >        MachineState *ms = MACHINE(qdev_get_machine());
> > > >        qemu_register_reset(x86_cpu_machine_reset_cb, cpu);
> > > > @@ -7135,6 +7165,7 @@ static Property x86_cpu_properties[] = {
> > > >                         false),
> > > >        DEFINE_PROP_BOOL("x-intel-pt-auto-level", X86CPU, intel_pt_auto_level,
> > > >                         true),
> > > > +    DEFINE_PROP_STRING("x-l2-cache-topo", X86CPU, l2_cache_topo_level),
> > > >        DEFINE_PROP_END_OF_LIST()
> > > >    };
> > > > diff --git a/target/i386/cpu.h b/target/i386/cpu.h
> > > > index 5a955431f759..aa7e96c586c7 100644
> > > > --- a/target/i386/cpu.h
> > > > +++ b/target/i386/cpu.h
> > > > @@ -1987,6 +1987,8 @@ struct ArchCPU {
> > > >        int32_t thread_id;
> > > >        int32_t hv_max_vps;
> > > > +
> > > > +    char *l2_cache_topo_level;
> > > >    };
> 

