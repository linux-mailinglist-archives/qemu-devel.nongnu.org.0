Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8EB9697E51
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 15:27:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSIkn-0007vc-5M; Wed, 15 Feb 2023 09:27:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pSIkk-0007vN-SM
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 09:27:22 -0500
Received: from mga06b.intel.com ([134.134.136.31] helo=mga06.intel.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pSIki-0004I1-J2
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 09:27:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676471240; x=1708007240;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=XMa+nZ6uQ8MWR66YPoGXdm8oqpjJ1/UmdiQA4mFyBUI=;
 b=U0u+zD9x+LGkIA2tA3qPLWozL9M9OwqvdZ4OJjorT/nFpgqRnqJFfwKQ
 Eq/pZ+ewDPjkc70u6LX4umsSuPfa5tZ0FypzDNLAHp8fcXoMtzr9vQa/h
 T0kaevKvyneHc+XbO5O4LwNcmmiEvRzAfQMkmwambwvye2dvOIF05qq0w
 zmS+hyqoi08CXfR5LnVw4dgHIFGKxfHsvvJPyWwxGuUpkWIcXH4Sf8Xzy
 lAdhli0VSrd8vtIbJIAfpF2cvoufVPte0jNNLo4x9Jx0nQJ0pWx1XQYjP
 gESG0sz6YMe9jJvwGY+ekxytesb2N/VWVDOkxLt4wWELkQ+lVxAW4hKHD w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="393839246"
X-IronPort-AV: E=Sophos;i="5.97,299,1669104000"; d="scan'208";a="393839246"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2023 06:27:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="669625299"
X-IronPort-AV: E=Sophos;i="5.97,299,1669104000"; d="scan'208";a="669625299"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost)
 ([10.239.160.112])
 by orsmga002.jf.intel.com with ESMTP; 15 Feb 2023 06:27:11 -0800
Date: Wed, 15 Feb 2023 22:35:02 +0800
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
Subject: Re: [PATCH RESEND 07/18] i386: Support modules_per_die in
 X86CPUTopoInfo
Message-ID: <Y+ztlncSE5F7s+rI@liuzhao-OptiPlex-7080>
References: <20230213093625.158170-1-zhao1.liu@linux.intel.com>
 <20230213093625.158170-8-zhao1.liu@linux.intel.com>
 <76c14954-2bdb-bf1c-5626-0d585257aca5@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=gb2312
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <76c14954-2bdb-bf1c-5626-0d585257aca5@huawei.com>
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

On Wed, Feb 15, 2023 at 06:38:31PM +0800, wangyanan (Y) wrote:
> Date: Wed, 15 Feb 2023 18:38:31 +0800
> From: "wangyanan (Y)" <wangyanan55@huawei.com>
> Subject: Re: [PATCH RESEND 07/18] i386: Support modules_per_die in
>  X86CPUTopoInfo
> 
> ÔÚ 2023/2/13 17:36, Zhao Liu Ð´µÀ:
> > From: Zhuocheng Ding <zhuocheng.ding@intel.com>
> > 
> > Support module level in i386 cpu topology structure "X86CPUTopoInfo".
> > 
> > Before updating APIC ID parsing rule with module level, the
> > apicid_core_width() temporarily combines the core and module levels
> > together.
> > 
> > At present, we don't expose module level in CPUID.1FH because currently
> > linux (v6.2-rc6) doesn't support module level. And exposing module and
> > die levels at the same time in CPUID.1FH will cause linux to calculate
> > the wrong die_id. The module level should be exposed until the real
> > machine has the module level in CPUID.1FH.
> > 
> > In addition, update topology structure in test-x86-apicid.c.
> > 
> > Signed-off-by: Zhuocheng Ding <zhuocheng.ding@intel.com>
> > Co-developed-by: Zhao Liu <zhao1.liu@intel.com>
> > Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> > ---
> >   hw/i386/x86.c                |  3 ++-
> >   include/hw/i386/topology.h   | 13 ++++++++---
> >   target/i386/cpu.c            | 17 ++++++++------
> >   tests/unit/test-x86-apicid.c | 45 +++++++++++++++++++-----------------
> >   4 files changed, 46 insertions(+), 32 deletions(-)
> > 
> > diff --git a/hw/i386/x86.c b/hw/i386/x86.c
> > index ae1bb562d6e2..1c069ff56ae7 100644
> > --- a/hw/i386/x86.c
> > +++ b/hw/i386/x86.c
> > @@ -71,7 +71,8 @@ inline void init_topo_info(X86CPUTopoInfo *topo_info,
> >       MachineState *ms = MACHINE(x86ms);
> >       topo_info->dies_per_pkg = ms->smp.dies;
> > -    topo_info->cores_per_die = ms->smp.cores;
> > +    topo_info->modules_per_die = ms->smp.clusters;
> > +    topo_info->cores_per_module = ms->smp.cores;
> >       topo_info->threads_per_core = ms->smp.threads;
> >   }
> > diff --git a/include/hw/i386/topology.h b/include/hw/i386/topology.h
> > index 81573f6cfde0..bbb00dc4aad8 100644
> > --- a/include/hw/i386/topology.h
> > +++ b/include/hw/i386/topology.h
> > @@ -54,7 +54,8 @@ typedef struct X86CPUTopoIDs {
> >   typedef struct X86CPUTopoInfo {
> >       unsigned dies_per_pkg;
> > -    unsigned cores_per_die;
> > +    unsigned modules_per_die;
> > +    unsigned cores_per_module;
> >       unsigned threads_per_core;
> >   } X86CPUTopoInfo;
> > @@ -78,7 +79,12 @@ static inline unsigned apicid_smt_width(X86CPUTopoInfo *topo_info)
> >    */
> >   static inline unsigned apicid_core_width(X86CPUTopoInfo *topo_info)
> >   {
> > -    return apicid_bitwidth_for_count(topo_info->cores_per_die);
> > +    /*
> > +     * TODO: Will separate module info from core_width when update
> > +     * APIC ID with module level.
> > +     */
> > +    return apicid_bitwidth_for_count(topo_info->cores_per_module *
> > +                                     topo_info->modules_per_die);
> >   }
> >   /* Bit width of the Die_ID field */
> > @@ -128,7 +134,8 @@ static inline void x86_topo_ids_from_idx(X86CPUTopoInfo *topo_info,
> >                                            X86CPUTopoIDs *topo_ids)
> >   {
> >       unsigned nr_dies = topo_info->dies_per_pkg;
> > -    unsigned nr_cores = topo_info->cores_per_die;
> > +    unsigned nr_cores = topo_info->cores_per_module *
> > +                        topo_info->modules_per_die;
> >       unsigned nr_threads = topo_info->threads_per_core;
> >       topo_ids->pkg_id = cpu_index / (nr_dies * nr_cores * nr_threads);
> > diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> > index 61ec9a7499b8..6f3d114c7d12 100644
> > --- a/target/i386/cpu.c
> > +++ b/target/i386/cpu.c
> > @@ -336,7 +336,9 @@ static void encode_cache_cpuid8000001d(CPUCacheInfo *cache,
> >       /* L3 is shared among multiple cores */
> >       if (cache->level == 3) {
> > -        l3_threads = topo_info->cores_per_die * topo_info->threads_per_core;
> > +        l3_threads = topo_info->modules_per_die *
> > +                     topo_info->cores_per_module *
> > +                     topo_info->threads_per_core;
> >           *eax |= (l3_threads - 1) << 14;
> >       } else {
> >           *eax |= ((topo_info->threads_per_core - 1) << 14);
> > @@ -5218,11 +5220,12 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
> >       uint32_t cpus_per_pkg;
> >       topo_info.dies_per_pkg = env->nr_dies;
> > -    topo_info.cores_per_die = cs->nr_cores / env->nr_dies;
> > +    topo_info.modules_per_die = env->nr_modules;
> > +    topo_info.cores_per_module = cs->nr_cores / env->nr_dies / env->nr_modules;
> >       topo_info.threads_per_core = cs->nr_threads;
> > -    cpus_per_pkg = topo_info.dies_per_pkg * topo_info.cores_per_die *
> > -                   topo_info.threads_per_core;
> > +    cpus_per_pkg = topo_info.dies_per_pkg * topo_info.modules_per_die *
> > +                   topo_info.cores_per_module * topo_info.threads_per_core;
> >       /* Calculate & apply limits for different index ranges */
> >       if (index >= 0xC0000000) {
> > @@ -5298,8 +5301,8 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
> >               if (*eax & 31) {
> >                   int host_vcpus_per_cache = 1 + ((*eax & 0x3FFC000) >> 14);
> >                   int vcpus_per_socket = cpus_per_pkg;
> > -                int cores_per_socket = topo_info.cores_per_die *
> > -                                       topo_info.dies_per_pkg;
> > +                int cores_per_socket = cpus_per_pkg /
> > +                                       topo_info.threads_per_core;
> As mentioned in patch 5, cores_per_socket can be function-global.

Yeah, got it.

> >                   if (cores_per_socket > 1) {
> >                       *eax &= ~0xFC000000;
> >                       *eax |= (pow2ceil(cores_per_socket) - 1) << 26;
> > @@ -5483,7 +5486,7 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
> >               break;
> >           case 1:
> >               *eax = apicid_die_offset(&topo_info);
> > -            *ebx = topo_info.cores_per_die * topo_info.threads_per_core;
> > +            *ebx = cpus_per_pkg / topo_info.dies_per_pkg;
> >               *ecx |= CPUID_TOPOLOGY_LEVEL_CORE;
> >               break;
> >           case 2:
> > diff --git a/tests/unit/test-x86-apicid.c b/tests/unit/test-x86-apicid.c
> > index 2b104f86d7c2..f21b8a5d95c2 100644
> > --- a/tests/unit/test-x86-apicid.c
> > +++ b/tests/unit/test-x86-apicid.c
> > @@ -30,13 +30,16 @@ static void test_topo_bits(void)
> >   {
> >       X86CPUTopoInfo topo_info = {0};
> > -    /* simple tests for 1 thread per core, 1 core per die, 1 die per package */
> > -    topo_info = (X86CPUTopoInfo) {1, 1, 1};
> > +    /*
> > +     * simple tests for 1 thread per core, 1 core per module,
> > +     *                  1 module per die, 1 die per package
> > +     */
> > +    topo_info = (X86CPUTopoInfo) {1, 1, 1, 1};
> >       g_assert_cmpuint(apicid_smt_width(&topo_info), ==, 0);
> >       g_assert_cmpuint(apicid_core_width(&topo_info), ==, 0);
> >       g_assert_cmpuint(apicid_die_width(&topo_info), ==, 0);
> > -    topo_info = (X86CPUTopoInfo) {1, 1, 1};
> > +    topo_info = (X86CPUTopoInfo) {1, 1, 1, 1};
> >       g_assert_cmpuint(x86_apicid_from_cpu_idx(&topo_info, 0), ==, 0);
> >       g_assert_cmpuint(x86_apicid_from_cpu_idx(&topo_info, 1), ==, 1);
> >       g_assert_cmpuint(x86_apicid_from_cpu_idx(&topo_info, 2), ==, 2);
> > @@ -45,39 +48,39 @@ static void test_topo_bits(void)
> >       /* Test field width calculation for multiple values
> >        */
> > -    topo_info = (X86CPUTopoInfo) {1, 1, 2};
> > +    topo_info = (X86CPUTopoInfo) {1, 1, 1, 2};
> >       g_assert_cmpuint(apicid_smt_width(&topo_info), ==, 1);
> > -    topo_info = (X86CPUTopoInfo) {1, 1, 3};
> > +    topo_info = (X86CPUTopoInfo) {1, 1, 1, 3};
> >       g_assert_cmpuint(apicid_smt_width(&topo_info), ==, 2);
> > -    topo_info = (X86CPUTopoInfo) {1, 1, 4};
> > +    topo_info = (X86CPUTopoInfo) {1, 1, 1, 4};
> >       g_assert_cmpuint(apicid_smt_width(&topo_info), ==, 2);
> > -    topo_info = (X86CPUTopoInfo) {1, 1, 14};
> > +    topo_info = (X86CPUTopoInfo) {1, 1, 1, 14};
> >       g_assert_cmpuint(apicid_smt_width(&topo_info), ==, 4);
> > -    topo_info = (X86CPUTopoInfo) {1, 1, 15};
> > +    topo_info = (X86CPUTopoInfo) {1, 1, 1, 15};
> >       g_assert_cmpuint(apicid_smt_width(&topo_info), ==, 4);
> > -    topo_info = (X86CPUTopoInfo) {1, 1, 16};
> > +    topo_info = (X86CPUTopoInfo) {1, 1, 1, 16};
> >       g_assert_cmpuint(apicid_smt_width(&topo_info), ==, 4);
> > -    topo_info = (X86CPUTopoInfo) {1, 1, 17};
> > +    topo_info = (X86CPUTopoInfo) {1, 1, 1, 17};
> >       g_assert_cmpuint(apicid_smt_width(&topo_info), ==, 5);
> > -    topo_info = (X86CPUTopoInfo) {1, 30, 2};
> > +    topo_info = (X86CPUTopoInfo) {1, 1, 30, 2};
> >       g_assert_cmpuint(apicid_core_width(&topo_info), ==, 5);
> > -    topo_info = (X86CPUTopoInfo) {1, 31, 2};
> > +    topo_info = (X86CPUTopoInfo) {1, 1, 31, 2};
> >       g_assert_cmpuint(apicid_core_width(&topo_info), ==, 5);
> > -    topo_info = (X86CPUTopoInfo) {1, 32, 2};
> > +    topo_info = (X86CPUTopoInfo) {1, 1, 32, 2};
> >       g_assert_cmpuint(apicid_core_width(&topo_info), ==, 5);
> > -    topo_info = (X86CPUTopoInfo) {1, 33, 2};
> > +    topo_info = (X86CPUTopoInfo) {1, 1, 33, 2};
> >       g_assert_cmpuint(apicid_core_width(&topo_info), ==, 6);
> > -    topo_info = (X86CPUTopoInfo) {1, 30, 2};
> > +    topo_info = (X86CPUTopoInfo) {1, 1, 30, 2};
> >       g_assert_cmpuint(apicid_die_width(&topo_info), ==, 0);
> > -    topo_info = (X86CPUTopoInfo) {2, 30, 2};
> > +    topo_info = (X86CPUTopoInfo) {2, 1, 30, 2};
> >       g_assert_cmpuint(apicid_die_width(&topo_info), ==, 1);
> > -    topo_info = (X86CPUTopoInfo) {3, 30, 2};
> > +    topo_info = (X86CPUTopoInfo) {3, 1, 30, 2};
> >       g_assert_cmpuint(apicid_die_width(&topo_info), ==, 2);
> > -    topo_info = (X86CPUTopoInfo) {4, 30, 2};
> > +    topo_info = (X86CPUTopoInfo) {4, 1, 30, 2};
> >       g_assert_cmpuint(apicid_die_width(&topo_info), ==, 2);
> >       /* build a weird topology and see if IDs are calculated correctly
> > @@ -85,18 +88,18 @@ static void test_topo_bits(void)
> >       /* This will use 2 bits for thread ID and 3 bits for core ID
> >        */
> > -    topo_info = (X86CPUTopoInfo) {1, 6, 3};
> > +    topo_info = (X86CPUTopoInfo) {1, 1, 6, 3};
> >       g_assert_cmpuint(apicid_smt_width(&topo_info), ==, 2);
> >       g_assert_cmpuint(apicid_core_offset(&topo_info), ==, 2);
> >       g_assert_cmpuint(apicid_die_offset(&topo_info), ==, 5);
> >       g_assert_cmpuint(apicid_pkg_offset(&topo_info), ==, 5);
> > -    topo_info = (X86CPUTopoInfo) {1, 6, 3};
> > +    topo_info = (X86CPUTopoInfo) {1, 1, 6, 3};
> >       g_assert_cmpuint(x86_apicid_from_cpu_idx(&topo_info, 0), ==, 0);
> >       g_assert_cmpuint(x86_apicid_from_cpu_idx(&topo_info, 1), ==, 1);
> >       g_assert_cmpuint(x86_apicid_from_cpu_idx(&topo_info, 2), ==, 2);
> > -    topo_info = (X86CPUTopoInfo) {1, 6, 3};
> > +    topo_info = (X86CPUTopoInfo) {1, 1, 6, 3};
> >       g_assert_cmpuint(x86_apicid_from_cpu_idx(&topo_info, 1 * 3 + 0), ==,
> >                        (1 << 2) | 0);
> >       g_assert_cmpuint(x86_apicid_from_cpu_idx(&topo_info, 1 * 3 + 1), ==,
> 

