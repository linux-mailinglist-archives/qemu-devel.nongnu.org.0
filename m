Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 807EF697F03
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 16:00:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSJGq-0007ss-Nw; Wed, 15 Feb 2023 10:00:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pSJGp-0007si-Bp
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 10:00:31 -0500
Received: from mga11.intel.com ([192.55.52.93])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pSJGm-0004MJ-S3
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 10:00:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676473229; x=1708009229;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=33D6dJpo689j2I1eMVf2LCcDuCQo869kML0KpNfIp7Q=;
 b=Ib4Asqk7uliNdI3ydwJC70BR452aJUqbxjr/Hw7VCNH8J6pftzYaVfKK
 yaLVXKu93UBm0G9pEZ9TkNx8ADgrm66WKn1znn0+pqA+lTcNjovnLgP0j
 QXQyj+XNxTrCeLuyWgmrdEronSQCvwPeABTcWXLexq4M5QIox7+lZo/Dj
 JLrEB0+AECACEZtZgG56jAhtTBc6c6ovNiHu1pX0xOvqxCTzD+H8VEK8m
 9WYFg9+j1qWxHOMiJY1na7uqJ+oPJOsyWOc/9Yd2AhnwKMPy6w2DaBq8e
 ewckMTguwykkyGUOZ+mo45dTjSak/FZmP8sBZXUFTANBbA2lnPiNycFG0 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="329165489"
X-IronPort-AV: E=Sophos;i="5.97,299,1669104000"; d="scan'208";a="329165489"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2023 07:00:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="793517698"
X-IronPort-AV: E=Sophos;i="5.97,299,1669104000"; d="scan'208";a="793517698"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost)
 ([10.239.160.112])
 by orsmga004.jf.intel.com with ESMTP; 15 Feb 2023 07:00:04 -0800
Date: Wed, 15 Feb 2023 23:07:56 +0800
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
Subject: Re: [PATCH RESEND 14/18] i386: Add cache topology info in CPUCacheInfo
Message-ID: <Y+z1TFqM8rTR0331@liuzhao-OptiPlex-7080>
References: <20230213093625.158170-1-zhao1.liu@linux.intel.com>
 <20230213093625.158170-15-zhao1.liu@linux.intel.com>
 <964b18ef-d147-ba17-a5a5-2aff55467018@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=gb2312
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <964b18ef-d147-ba17-a5a5-2aff55467018@huawei.com>
Received-SPF: none client-ip=192.55.52.93;
 envelope-from=zhao1.liu@linux.intel.com; helo=mga11.intel.com
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

On Wed, Feb 15, 2023 at 08:17:22PM +0800, wangyanan (Y) wrote:
> Date: Wed, 15 Feb 2023 20:17:22 +0800
> From: "wangyanan (Y)" <wangyanan55@huawei.com>
> Subject: Re: [PATCH RESEND 14/18] i386: Add cache topology info in
>  CPUCacheInfo
> 
> Hi Zhao,
> 
> ÔÚ 2023/2/13 17:36, Zhao Liu Ð´µÀ:
> > From: Zhao Liu <zhao1.liu@intel.com>
> > 
> > Currently, by default, the cache topology is encoded as:
> > 1. i/d cache is shared in one core.
> > 2. L2 cache is shared in one core.
> > 3. L3 cache is shared in one die.
> > 
> > This default general setting has caused a misunderstanding, that is, the
> > cache topology is completely equated with a specific cpu topology, such
> > as the connection between L2 cache and core level, and the connection
> > between L3 cache and die level.
> > 
> > In fact, the settings of these topologies depend on the specific
> > platform and are not static. For example, on Alder Lake-P, every
> > four Atom cores share the same L2 cache.
> > 
> > Thus, we should explicitly define the corresponding cache topology for
> > different cache models to increase scalability.
> > 
> > Except legacy_l2_cache_cpuid2 (its default topo level is INVALID),
> It seems like its default topo level is UNKNOWN in this case.
> > explicitly set the corresponding topology level for all other cache
> > models. In order to be compatible with the existing cache topology, set
> > the CORE level for the i/d cache, set the CORE level for L2 cache, and
> > set the DIE level for L3 cache.
> > 
> > The field for CPUID[4].EAX[bits 25:14] or CPUID[0x8000001D].EAX[bits
> > 25:14] will be set based on CPUCacheInfo.share_level.
> > 
> > Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> > ---
> >   target/i386/cpu.c | 19 +++++++++++++++++++
> >   target/i386/cpu.h | 16 ++++++++++++++++
> >   2 files changed, 35 insertions(+)
> > 
> > diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> > index 27bbbc36b11c..364534e84b1b 100644
> > --- a/target/i386/cpu.c
> > +++ b/target/i386/cpu.c
> > @@ -433,6 +433,7 @@ static CPUCacheInfo legacy_l1d_cache = {
> >       .sets = 64,
> >       .partitions = 1,
> >       .no_invd_sharing = true,
> > +    .share_level = CORE,
> >   };
> >   /*FIXME: CPUID leaf 0x80000005 is inconsistent with leaves 2 & 4 */
> > @@ -447,6 +448,7 @@ static CPUCacheInfo legacy_l1d_cache_amd = {
> >       .partitions = 1,
> >       .lines_per_tag = 1,
> >       .no_invd_sharing = true,
> > +    .share_level = CORE,
> >   };
> >   /* L1 instruction cache: */
> > @@ -460,6 +462,7 @@ static CPUCacheInfo legacy_l1i_cache = {
> >       .sets = 64,
> >       .partitions = 1,
> >       .no_invd_sharing = true,
> > +    .share_level = CORE,
> >   };
> >   /*FIXME: CPUID leaf 0x80000005 is inconsistent with leaves 2 & 4 */
> > @@ -474,6 +477,7 @@ static CPUCacheInfo legacy_l1i_cache_amd = {
> >       .partitions = 1,
> >       .lines_per_tag = 1,
> >       .no_invd_sharing = true,
> > +    .share_level = CORE,
> >   };
> >   /* Level 2 unified cache: */
> > @@ -487,6 +491,7 @@ static CPUCacheInfo legacy_l2_cache = {
> >       .sets = 4096,
> >       .partitions = 1,
> >       .no_invd_sharing = true,
> > +    .share_level = CORE,
> >   };
> >   /*FIXME: CPUID leaf 2 descriptor is inconsistent with CPUID leaf 4 */
> > @@ -509,6 +514,7 @@ static CPUCacheInfo legacy_l2_cache_amd = {
> >       .associativity = 16,
> >       .sets = 512,
> >       .partitions = 1,
> > +    .share_level = CORE,
> >   };
> >   /* Level 3 unified cache: */
> > @@ -524,6 +530,7 @@ static CPUCacheInfo legacy_l3_cache = {
> >       .self_init = true,
> >       .inclusive = true,
> >       .complex_indexing = true,
> > +    .share_level = DIE,
> >   };
> >   /* TLB definitions: */
> > @@ -1668,6 +1675,7 @@ static const CPUCaches epyc_cache_info = {
> >           .lines_per_tag = 1,
> >           .self_init = 1,
> >           .no_invd_sharing = true,
> > +        .share_level = CORE,
> >       },
> >       .l1i_cache = &(CPUCacheInfo) {
> >           .type = INSTRUCTION_CACHE,
> > @@ -1680,6 +1688,7 @@ static const CPUCaches epyc_cache_info = {
> >           .lines_per_tag = 1,
> >           .self_init = 1,
> >           .no_invd_sharing = true,
> > +        .share_level = CORE,
> >       },
> >       .l2_cache = &(CPUCacheInfo) {
> >           .type = UNIFIED_CACHE,
> > @@ -1690,6 +1699,7 @@ static const CPUCaches epyc_cache_info = {
> >           .partitions = 1,
> >           .sets = 1024,
> >           .lines_per_tag = 1,
> > +        .share_level = CORE,
> >       },
> >       .l3_cache = &(CPUCacheInfo) {
> >           .type = UNIFIED_CACHE,
> > @@ -1703,6 +1713,7 @@ static const CPUCaches epyc_cache_info = {
> >           .self_init = true,
> >           .inclusive = true,
> >           .complex_indexing = true,
> > +        .share_level = DIE,
> >       },
> >   };
> > @@ -1718,6 +1729,7 @@ static const CPUCaches epyc_rome_cache_info = {
> >           .lines_per_tag = 1,
> >           .self_init = 1,
> >           .no_invd_sharing = true,
> > +        .share_level = CORE,
> >       },
> >       .l1i_cache = &(CPUCacheInfo) {
> >           .type = INSTRUCTION_CACHE,
> > @@ -1730,6 +1742,7 @@ static const CPUCaches epyc_rome_cache_info = {
> >           .lines_per_tag = 1,
> >           .self_init = 1,
> >           .no_invd_sharing = true,
> > +        .share_level = CORE,
> >       },
> >       .l2_cache = &(CPUCacheInfo) {
> >           .type = UNIFIED_CACHE,
> > @@ -1740,6 +1753,7 @@ static const CPUCaches epyc_rome_cache_info = {
> >           .partitions = 1,
> >           .sets = 1024,
> >           .lines_per_tag = 1,
> > +        .share_level = CORE,
> >       },
> >       .l3_cache = &(CPUCacheInfo) {
> >           .type = UNIFIED_CACHE,
> > @@ -1753,6 +1767,7 @@ static const CPUCaches epyc_rome_cache_info = {
> >           .self_init = true,
> >           .inclusive = true,
> >           .complex_indexing = true,
> > +        .share_level = DIE,
> >       },
> >   };
> > @@ -1768,6 +1783,7 @@ static const CPUCaches epyc_milan_cache_info = {
> >           .lines_per_tag = 1,
> >           .self_init = 1,
> >           .no_invd_sharing = true,
> > +        .share_level = CORE,
> >       },
> >       .l1i_cache = &(CPUCacheInfo) {
> >           .type = INSTRUCTION_CACHE,
> > @@ -1780,6 +1796,7 @@ static const CPUCaches epyc_milan_cache_info = {
> >           .lines_per_tag = 1,
> >           .self_init = 1,
> >           .no_invd_sharing = true,
> > +        .share_level = CORE,
> >       },
> >       .l2_cache = &(CPUCacheInfo) {
> >           .type = UNIFIED_CACHE,
> > @@ -1790,6 +1807,7 @@ static const CPUCaches epyc_milan_cache_info = {
> >           .partitions = 1,
> >           .sets = 1024,
> >           .lines_per_tag = 1,
> > +        .share_level = CORE,
> >       },
> >       .l3_cache = &(CPUCacheInfo) {
> >           .type = UNIFIED_CACHE,
> > @@ -1803,6 +1821,7 @@ static const CPUCaches epyc_milan_cache_info = {
> >           .self_init = true,
> >           .inclusive = true,
> >           .complex_indexing = true,
> > +        .share_level = DIE,
> >       },
> >   };
> > diff --git a/target/i386/cpu.h b/target/i386/cpu.h
> > index 8668e74e0c87..5a955431f759 100644
> > --- a/target/i386/cpu.h
> > +++ b/target/i386/cpu.h
> > @@ -1476,6 +1476,15 @@ enum CacheType {
> >       UNIFIED_CACHE
> >   };
> > +enum CPUTopoLevel {
> > +    INVALID = 0,
> Maybe UNKNOWN?

I agree, it's a better name than INVALID.

> > +    SMT,
> > +    CORE,
> > +    MODULE,
> > +    DIE,
> > +    PACKAGE,
> Do we need a prefix like CPU_TOPO_LEVEL_* or shorter CPU_TL_*
> to avoid possible naming conflicts with other micros or enums?
> Not sure..

Yes, adding a prefix for enum is more in line with the QEMU naming
style, I will add it. I support the first name, it looks more clear.

Thanks,
Zhao

> 
> Thanks,
> Yanan
> > +};
> > +
> >   typedef struct CPUCacheInfo {
> >       enum CacheType type;
> >       uint8_t level;
> > @@ -1517,6 +1526,13 @@ typedef struct CPUCacheInfo {
> >        * address bits.  CPUID[4].EDX[bit 2].
> >        */
> >       bool complex_indexing;
> > +
> > +    /*
> > +     * Cache Topology. The level that cache is shared in.
> > +     * Used to encode CPUID[4].EAX[bits 25:14] or
> > +     * CPUID[0x8000001D].EAX[bits 25:14].
> > +     */
> > +    enum CPUTopoLevel share_level;
> >   } CPUCacheInfo;
> 

