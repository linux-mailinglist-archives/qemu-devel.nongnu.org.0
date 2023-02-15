Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A59E26976E5
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 08:04:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSBot-0004em-EM; Wed, 15 Feb 2023 02:03:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pSBoq-0004eL-2A
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 02:03:08 -0500
Received: from mga06b.intel.com ([134.134.136.31] helo=mga06.intel.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pSBon-0006Mb-Jo
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 02:03:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676444585; x=1707980585;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=JckFGbbDHGjxPasaVeTsLtfN3M3y3SE/9jZ/VVody80=;
 b=By6/UNHPCqjoImplfyoOE0ZIrYkwK2XF7HDmOAIRxgHFu9sbNwd8cLG5
 VbJ9Dx0uufienMLtQRgxuMEE2YTG+e6PDR7NLZyIU89o6xT5KsIO4yU4/
 JSGPfUhqAFOsyJRD223R9M9p7Xn9pDQ216uqxwEu5zZXhjWAXHMG53oM7
 e9EuPFwhn56EQSS10AqfafT/vR+28AuAN9DQr0OuFLlwfWQNWslrg58xk
 oNceOUXP5aVyZJ/5u8zqOHIz8ZGNDa1Uo3s2vbdkiw/sLEk8p+n4Z6baJ
 0v+7obQrYEQI1O3LQVsDWLzDV7IHvMtByUIqvubCceXmSi2WKjoF0S03j w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="393764054"
X-IronPort-AV: E=Sophos;i="5.97,299,1669104000"; d="scan'208";a="393764054"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2023 23:03:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="843464631"
X-IronPort-AV: E=Sophos;i="5.97,299,1669104000"; d="scan'208";a="843464631"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost)
 ([10.239.160.112])
 by orsmga005.jf.intel.com with ESMTP; 14 Feb 2023 23:02:58 -0800
Date: Wed, 15 Feb 2023 15:10:46 +0800
From: Zhao Liu <zhao1.liu@linux.intel.com>
To: "wangyanan (Y)" <wangyanan55@huawei.com>
Cc: Zhao Liu <zhao1.liu@linux.intel.com>,
 Eduardo Habkost <eduardo@habkost.net>,
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
Subject: Re: [PATCH RESEND 05/18] i386/cpu: Consolidate the use of topo_info
 in cpu_x86_cpuid()
Message-ID: <Y+yFdu4oW4bMLYVg@liuzhao-OptiPlex-7080>
References: <20230213093625.158170-1-zhao1.liu@linux.intel.com>
 <20230213093625.158170-6-zhao1.liu@linux.intel.com>
 <2110e5ec-68b0-185d-70dc-c2ea478a5b2c@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=gb2312
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2110e5ec-68b0-185d-70dc-c2ea478a5b2c@huawei.com>
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

On Wed, Feb 15, 2023 at 11:28:25AM +0800, wangyanan (Y) wrote:
> Date: Wed, 15 Feb 2023 11:28:25 +0800
> From: "wangyanan (Y)" <wangyanan55@huawei.com>
> Subject: Re: [PATCH RESEND 05/18] i386/cpu: Consolidate the use of
>  topo_info in cpu_x86_cpuid()
> 
> ÔÚ 2023/2/13 17:36, Zhao Liu Ð´µÀ:
> > From: Zhao Liu <zhao1.liu@intel.com>
> > 
> > In cpu_x86_cpuid(), there are many variables in representing the cpu
> > topology, e.g., topo_info, cs->nr_cores/cs->nr_threads.
> > 
> > Since the names of cs->nr_cores/cs->nr_threads does not accurately
> > represent its meaning, the use of cs->nr_cores/cs->nr_threads is prone
> > to confusion and mistakes.
> > 
> > And the structure X86CPUTopoInfo names its memebers clearly, thus the
> > variable "topo_info" should be preferred.
> > 
> > Suggested-by: Robert Hoo <robert.hu@linux.intel.com>
> > Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> > ---
> >   target/i386/cpu.c | 30 ++++++++++++++++++------------
> >   1 file changed, 18 insertions(+), 12 deletions(-)
> > 
> > diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> > index 7833505092d8..4cda84eb96f1 100644
> > --- a/target/i386/cpu.c
> > +++ b/target/i386/cpu.c
> > @@ -5215,11 +5215,15 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
> >       uint32_t limit;
> >       uint32_t signature[3];
> >       X86CPUTopoInfo topo_info;
> > +    uint32_t cpus_per_pkg;
> >       topo_info.dies_per_pkg = env->nr_dies;
> >       topo_info.cores_per_die = cs->nr_cores / env->nr_dies;
> >       topo_info.threads_per_core = cs->nr_threads;
> > +    cpus_per_pkg = topo_info.dies_per_pkg * topo_info.cores_per_die *
> > +                   topo_info.threads_per_core;
> > +
> >       /* Calculate & apply limits for different index ranges */
> >       if (index >= 0xC0000000) {
> >           limit = env->cpuid_xlevel2;
> > @@ -5255,8 +5259,8 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
> >               *ecx |= CPUID_EXT_OSXSAVE;
> >           }
> >           *edx = env->features[FEAT_1_EDX];
> > -        if (cs->nr_cores * cs->nr_threads > 1) {
> > -            *ebx |= (cs->nr_cores * cs->nr_threads) << 16;
> > +        if (cpus_per_pkg > 1) {
> > +            *ebx |= cpus_per_pkg << 16;
> >               *edx |= CPUID_HT;
> >           }
> >           if (!cpu->enable_pmu) {
> > @@ -5293,10 +5297,12 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
> >                */
> >               if (*eax & 31) {
> >                   int host_vcpus_per_cache = 1 + ((*eax & 0x3FFC000) >> 14);
> > -                int vcpus_per_socket = cs->nr_cores * cs->nr_threads;
> > -                if (cs->nr_cores > 1) {
> > +                int vcpus_per_socket = cpus_per_pkg;
> Would it make sense to directly use cpus_per_pkg here
> > +                int cores_per_socket = topo_info.cores_per_die *
> > +                                       topo_info.dies_per_pkg;
> There are other places in cpu_x86_cpuid where cs->nr_cores is used
> separately, why not make a global "cores_per_pkg" like cpus_per_pkg
> and also tweak the other places?

Yeah, good idea.

> > +                if (cores_per_socket > 1) {
> >                       *eax &= ~0xFC000000;
> > -                    *eax |= (pow2ceil(cs->nr_cores) - 1) << 26;
> > +                    *eax |= (pow2ceil(cores_per_socket) - 1) << 26;
> >                   }
> >                   if (host_vcpus_per_cache > vcpus_per_socket) {
> >                       *eax &= ~0x3FFC000;
> > @@ -5436,12 +5442,12 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
> >           switch (count) {
> >           case 0:
> >               *eax = apicid_core_offset(&topo_info);
> > -            *ebx = cs->nr_threads;
> > +            *ebx = topo_info.threads_per_core;
> There are many other places in cpu_x86_cpuid where cs->nr_threads
> is used separately, such as encode_cache_cpuid4(***), should we
> replace them all?

In a previous patch [1], I replaced the use of cs->nr_threads/nr_cores in
the call of encode_cache_cpuid4().

The cleanest way is to pass topo_info to encode_cache_cpuid4(), but this
involves the modification of the interface format and the use of the
cache topo level, so I included it in a follow-up patch [2].

[1]: [PATCH RESEND 04/18] i386/cpu: Fix number of addressable IDs in
     CPUID.04,
     https://lists.gnu.org/archive/html/qemu-devel/2023-02/msg03188.html
[2]: [PATCH RESEND 15/18] i386: Use CPUCacheInfo.share_level to encode
     CPUID[4].EAX[bits 25:14],
     https://lists.gnu.org/archive/html/qemu-devel/2023-02/msg03199.html

> >               *ecx |= CPUID_TOPOLOGY_LEVEL_SMT;
> >               break;
> >           case 1:
> >               *eax = apicid_pkg_offset(&topo_info);
> > -            *ebx = cs->nr_cores * cs->nr_threads;
> > +            *ebx = cpus_per_pkg;
> >               *ecx |= CPUID_TOPOLOGY_LEVEL_CORE;
> >               break;
> >           default:
> > @@ -5472,7 +5478,7 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
> >           switch (count) {
> >           case 0:
> >               *eax = apicid_core_offset(&topo_info);
> > -            *ebx = cs->nr_threads;
> > +            *ebx = topo_info.threads_per_core;
> >               *ecx |= CPUID_TOPOLOGY_LEVEL_SMT;
> >               break;
> >           case 1:
> > @@ -5482,7 +5488,7 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
> >               break;
> >           case 2:
> >               *eax = apicid_pkg_offset(&topo_info);
> > -            *ebx = cs->nr_cores * cs->nr_threads;
> > +            *ebx = cpus_per_pkg;
> >               *ecx |= CPUID_TOPOLOGY_LEVEL_DIE;
> >               break;
> >           default:
> > @@ -5707,7 +5713,7 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
> >            * discards multiple thread information if it is set.
> >            * So don't set it here for Intel to make Linux guests happy.
> >            */
> > -        if (cs->nr_cores * cs->nr_threads > 1) {
> > +        if (cpus_per_pkg > 1) {
> >               if (env->cpuid_vendor1 != CPUID_VENDOR_INTEL_1 ||
> >                   env->cpuid_vendor2 != CPUID_VENDOR_INTEL_2 ||
> >                   env->cpuid_vendor3 != CPUID_VENDOR_INTEL_3) {
> > @@ -5769,7 +5775,7 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
> >                *eax |= (cpu_x86_virtual_addr_width(env) << 8);
> >           }
> >           *ebx = env->features[FEAT_8000_0008_EBX];
> > -        if (cs->nr_cores * cs->nr_threads > 1) {
> > +        if (cpus_per_pkg > 1) {
> >               /*
> >                * Bits 15:12 is "The number of bits in the initial
> >                * Core::X86::Apic::ApicId[ApicId] value that indicate
> > @@ -5777,7 +5783,7 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
> >                * Bits 7:0 is "The number of threads in the package is NC+1"
> >                */
> >               *ecx = (apicid_pkg_offset(&topo_info) << 12) |
> > -                   ((cs->nr_cores * cs->nr_threads) - 1);
> > +                   (cpus_per_pkg - 1);
> >           } else {
> >               *ecx = 0;
> >           }
> Thanks,
> Yanan

