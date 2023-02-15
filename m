Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E04C6697E4E
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 15:26:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSIje-0006PN-N4; Wed, 15 Feb 2023 09:26:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pSIjc-0006OO-Lu
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 09:26:12 -0500
Received: from mga05.intel.com ([192.55.52.43])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pSIja-00043p-LL
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 09:26:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676471170; x=1708007170;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=KKk2yfW0i1ptkmRz/kYm4BlgxRSzzUUEYAifLTMI2XM=;
 b=gSDWEaJiKmMBUJjpAaPg5cB8Y6+28QM015xLNQbPqHUQB8WMViOq8onO
 4/8SqaJinTK+gO6OsCoBOV4GcMG5XxgGsJ6D7vPclLj7mgRtopWJlhMM4
 dLsRHuwZCAPEkcH1gcZyDk2mwY+KHnrEB8opSU/PTSbYU9sCIKB4TKfml
 xilFzp9tzSjH+Q1qoNCXMtvNucg4s73FzOzDQPMhUWkw1eHz9uEYQB0iT
 2wBir8q49wsK5zWjVfMC8XHT+LC67ztW/De+VbJRv+rPi6KkMspEcWswu
 VhNpcf3mCioi53cPJTQcxipG9IlNX0EmYFrEVlufgFhtyKbe9oZfk+t/R Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="417656084"
X-IronPort-AV: E=Sophos;i="5.97,299,1669104000"; d="scan'208";a="417656084"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2023 06:26:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="812467245"
X-IronPort-AV: E=Sophos;i="5.97,299,1669104000"; d="scan'208";a="812467245"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost)
 ([10.239.160.112])
 by fmsmga001.fm.intel.com with ESMTP; 15 Feb 2023 06:26:03 -0800
Date: Wed, 15 Feb 2023 22:33:55 +0800
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
Subject: Re: [PATCH RESEND 04/18] i386/cpu: Fix number of addressable IDs in
 CPUID.04H
Message-ID: <Y+ztU4N/IM7ulGoT@liuzhao-OptiPlex-7080>
References: <20230213093625.158170-1-zhao1.liu@linux.intel.com>
 <20230213093625.158170-5-zhao1.liu@linux.intel.com>
 <86bf0351-ffcc-3b7d-05f3-a1fe0a4f204a@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=gb2312
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <86bf0351-ffcc-3b7d-05f3-a1fe0a4f204a@huawei.com>
Received-SPF: none client-ip=192.55.52.43;
 envelope-from=zhao1.liu@linux.intel.com; helo=mga05.intel.com
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

On Wed, Feb 15, 2023 at 06:11:23PM +0800, wangyanan (Y) wrote:
> Date: Wed, 15 Feb 2023 18:11:23 +0800
> From: "wangyanan (Y)" <wangyanan55@huawei.com>
> Subject: Re: [PATCH RESEND 04/18] i386/cpu: Fix number of addressable IDs
>  in CPUID.04H
> 
> Hi Zhao,
> 
> ÔÚ 2023/2/13 17:36, Zhao Liu Ð´µÀ:
> > From: Zhao Liu <zhao1.liu@intel.com>
> > 
> > For i-cache and d-cache, the maximum IDs for CPUs sharing cache (
> > CPUID.04H.00H:EAX[bits 25:14] and CPUID.04H.01H:EAX[bits 25:14]) are
> > both 0, and this means i-cache and d-cache are shared in the SMT level.
> > This is correct if there's single thread per core, but is wrong for the
> > hyper threading case (one core contains multiple threads) since the
> > i-cache and d-cache are shared in the core level other than SMT level.
> > 
> > Therefore, in order to be compatible with both multi-threaded and
> > single-threaded situations, we should set i-cache and d-cache be shared
> > at the core level by default.
> > 
> > Refer to the fixes of cache_info_passthrough ([1], [2]) and SDM, the
> > CPUID.04H:EAX[bits 25:14] and CPUID.04H:EAX[bits 31:26] should use the
> > nearest power-of-2 integer.
> > 
> > The nearest power-of-2 integer can be caculated by pow2ceil() or by
> > using APIC ID offset (like L3 topology using 1 << die_offset [3]).
> > 
> > But in fact, CPUID.04H:EAX[bits 25:14] and CPUID.04H:EAX[bits 31:26]
> > are associated with APIC ID. For example, in linux kernel, the field
> > "num_threads_sharing" (Bits 25 - 14) is parsed with APIC ID. And for
> > another example, on Alder Lake P, the CPUID.04H:EAX[bits 31:26] is not
> > matched with actual core numbers and it's caculated by:
> > "(1 << (pkg_offset - core_offset)) - 1".
> > 
> > Therefore the offset of APIC ID should be preferred to caculate nearest
> > power-of-2 integer for CPUID.04H:EAX[bits 25:14] and CPUID.04H:EAX[bits
> > 31:26]:
> > 1. d/i cache is shared in a core, 1 << core_offset should be used
> >     instand of "1" in encode_cache_cpuid4() for CPUID.04H.00H:EAX[bits
> >     25:14] and CPUID.04H.01H:EAX[bits 25:14].
> > 2. L2 cache is supposed to be shared in a core as for now, thereby
> >     1 << core_offset should also be used instand of "cs->nr_threads" in
> >     encode_cache_cpuid4() for CPUID.04H.02H:EAX[bits 25:14].
> > 3. Similarly, the value for CPUID.04H:EAX[bits 31:26] should also be
> >     replaced by the offsets upper SMT level in APIC ID.
> > 
> > And since [1] and [2] are good enough to make cache_into_passthrough
> > work well, its "pow2ceil()" uses are enough so that they're no need to
> > be replaced by APIC ID offset way.
> If you uniformly tweak these two places with APIC ID offset too, then
> you can also use the more spec-compliant helpers
> (e.g max_processor_ids_for_cache and max_core_ids_in_pkg) here in
> future patch #18. Would be it best to uniform the code?

Yes, it makes sense! Will also do that. Thanks!

> 
> Thanks,
> Yanan
> > [1]: efb3934 (x86: cpu: make sure number of addressable IDs for processor cores meets the spec)
> > [2]: d7caf13 (x86: cpu: fixup number of addressable IDs for logical processors sharing cache)
> > [3]: d65af28 (i386: Update new x86_apicid parsing rules with die_offset support)
> > 
> > Fixes: 7e3482f (i386: Helpers to encode cache information consistently)
> > Suggested-by: Robert Hoo <robert.hu@linux.intel.com>
> > Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> > ---
> >   target/i386/cpu.c | 20 +++++++++++++++-----
> >   1 file changed, 15 insertions(+), 5 deletions(-)
> > 
> > diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> > index 29afec12c281..7833505092d8 100644
> > --- a/target/i386/cpu.c
> > +++ b/target/i386/cpu.c
> > @@ -5212,7 +5212,6 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
> >   {
> >       X86CPU *cpu = env_archcpu(env);
> >       CPUState *cs = env_cpu(env);
> > -    uint32_t die_offset;
> >       uint32_t limit;
> >       uint32_t signature[3];
> >       X86CPUTopoInfo topo_info;
> > @@ -5308,27 +5307,38 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
> >               *eax = *ebx = *ecx = *edx = 0;
> >           } else {
> >               *eax = 0;
> > +            int addressable_cores_offset = apicid_pkg_offset(&topo_info) -
> > +                                           apicid_core_offset(&topo_info);
> > +            int core_offset, die_offset;
> > +
> >               switch (count) {
> >               case 0: /* L1 dcache info */
> > +                core_offset = apicid_core_offset(&topo_info);
> >                   encode_cache_cpuid4(env->cache_info_cpuid4.l1d_cache,
> > -                                    1, cs->nr_cores,
> > +                                    (1 << core_offset),
> > +                                    (1 << addressable_cores_offset),
> >                                       eax, ebx, ecx, edx);
> >                   break;
> >               case 1: /* L1 icache info */
> > +                core_offset = apicid_core_offset(&topo_info);
> >                   encode_cache_cpuid4(env->cache_info_cpuid4.l1i_cache,
> > -                                    1, cs->nr_cores,
> > +                                    (1 << core_offset),
> > +                                    (1 << addressable_cores_offset),
> >                                       eax, ebx, ecx, edx);
> >                   break;
> >               case 2: /* L2 cache info */
> > +                core_offset = apicid_core_offset(&topo_info);
> >                   encode_cache_cpuid4(env->cache_info_cpuid4.l2_cache,
> > -                                    cs->nr_threads, cs->nr_cores,
> > +                                    (1 << core_offset),
> > +                                    (1 << addressable_cores_offset),
> >                                       eax, ebx, ecx, edx);
> >                   break;
> >               case 3: /* L3 cache info */
> >                   die_offset = apicid_die_offset(&topo_info);
> >                   if (cpu->enable_l3_cache) {
> >                       encode_cache_cpuid4(env->cache_info_cpuid4.l3_cache,
> > -                                        (1 << die_offset), cs->nr_cores,
> > +                                        (1 << die_offset),
> > +                                        (1 << addressable_cores_offset),
> >                                           eax, ebx, ecx, edx);
> >                       break;
> >                   }
> 

