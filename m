Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1812E697F12
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 16:03:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSJJF-0000Mk-B7; Wed, 15 Feb 2023 10:03:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pSJJB-0000Lf-08
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 10:02:59 -0500
Received: from mga04.intel.com ([192.55.52.120])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pSJJ4-0004ry-Cz
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 10:02:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676473370; x=1708009370;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=C+l5FzYe8Er3/SxNlsxKOaQgSF5JOj/UlpwniL09ajw=;
 b=gwG7p632y2cVjGlLHeIkTRAyrlzUs9X7rKpgPD5vbuDZoHle3+Efv/tj
 mgXTRZ64s7GL/D0UatTHoxKGYsV9PlRB6H+8moXwFmx0dl/jCaUoJSkrA
 5DnL4m5Jihx2O3POt9r/XMNdTw+8PWtxi6HOFpk3NYDH7+cDubPE0eoY8
 0mRNGdwVh5S6iS3hwM3rcd9TbrLxrZ34lWk9gLebvuxcXnaEW5bWqP9ZH
 gzjfy3g1rHontLyY+VoI+0D1c6CopgJDJN2SzmPHBAUpawulsIuuQv1/1
 RioXx3cjmNT8JIMXRs7eD8OOZ+9SEA9K6pf+2cpUPM76/araKMpb4zmtm w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="330078593"
X-IronPort-AV: E=Sophos;i="5.97,299,1669104000"; d="scan'208";a="330078593"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2023 07:01:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="662966349"
X-IronPort-AV: E=Sophos;i="5.97,299,1669104000"; d="scan'208";a="662966349"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost)
 ([10.239.160.112])
 by orsmga007.jf.intel.com with ESMTP; 15 Feb 2023 07:01:41 -0800
Date: Wed, 15 Feb 2023 23:09:32 +0800
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
Subject: Re: [PATCH RESEND 16/18] i386: Fix NumSharingCache for
 CPUID[0x8000001D].EAX[bits 25:14]
Message-ID: <Y+z1rC2D+Lf/o6JU@liuzhao-OptiPlex-7080>
References: <20230213093625.158170-1-zhao1.liu@linux.intel.com>
 <20230213093625.158170-17-zhao1.liu@linux.intel.com>
 <691b4f01-4c5d-72a0-457b-8d6ff3231075@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=gb2312
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <691b4f01-4c5d-72a0-457b-8d6ff3231075@huawei.com>
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

On Wed, Feb 15, 2023 at 08:32:39PM +0800, wangyanan (Y) wrote:
> Date: Wed, 15 Feb 2023 20:32:39 +0800
> From: "wangyanan (Y)" <wangyanan55@huawei.com>
> Subject: Re: [PATCH RESEND 16/18] i386: Fix NumSharingCache for
>  CPUID[0x8000001D].EAX[bits 25:14]
> 
> ÔÚ 2023/2/13 17:36, Zhao Liu Ð´µÀ:
> > From: Zhao Liu <zhao1.liu@intel.com>
> > 
> > >From AMD's APM, NumSharingCache (CPUID[0x8000001D].EAX[bits 25:14])
> > means [1]:
> > 
> > The number of logical processors sharing this cache is the value of
> > this field incremented by 1. To determine which logical processors are
> > sharing a cache, determine a Share Id for each processor as follows:
> > 
> > ShareId = LocalApicId >> log2(NumSharingCache+1)
> > 
> > Logical processors with the same ShareId then share a cache. If
> > NumSharingCache+1 is not a power of two, round it up to the next power
> > of two.
> > 
> > >From the description above, the caculation of this feild should be same
> > as CPUID[4].EAX[bits 25:14] for intel cpus. So also use the offsets of
> > APIC ID to caculate this field.
> > 
> > Note: I don't have the hardware available, hope someone can help me to
> > confirm whether this calculation is correct, thanks!
> > 
> > [1]: APM, vol.3, appendix.E.4.15 Function 8000_001Dh--Cache Topology
> >       Information
> > 
> > Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> > ---
> >   target/i386/cpu.c | 10 ++++------
> >   1 file changed, 4 insertions(+), 6 deletions(-)
> > 
> > diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> > index 96ef96860604..d691c02e3c06 100644
> > --- a/target/i386/cpu.c
> > +++ b/target/i386/cpu.c
> > @@ -355,7 +355,7 @@ static void encode_cache_cpuid8000001d(CPUCacheInfo *cache,
> >                                          uint32_t *eax, uint32_t *ebx,
> >                                          uint32_t *ecx, uint32_t *edx)
> >   {
> > -    uint32_t l3_threads;
> > +    uint32_t sharing_apic_ids;
> maybe num_apic_ids or num_ids£¿

Thanks, num is better as a prefix. I would use num_apic_ids.

Zhao

> >       assert(cache->size == cache->line_size * cache->associativity *
> >                             cache->partitions * cache->sets);
> > @@ -364,13 +364,11 @@ static void encode_cache_cpuid8000001d(CPUCacheInfo *cache,
> >       /* L3 is shared among multiple cores */
> >       if (cache->level == 3) {
> > -        l3_threads = topo_info->modules_per_die *
> > -                     topo_info->cores_per_module *
> > -                     topo_info->threads_per_core;
> > -        *eax |= (l3_threads - 1) << 14;
> > +        sharing_apic_ids = 1 << apicid_die_offset(topo_info);
> >       } else {
> > -        *eax |= ((topo_info->threads_per_core - 1) << 14);
> > +        sharing_apic_ids = 1 << apicid_core_offset(topo_info);
> >       }
> > +    *eax |= (sharing_apic_ids - 1) << 14;
> >       assert(cache->line_size > 0);
> >       assert(cache->partitions > 0);
> 

