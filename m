Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3FC9695C0A
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 09:06:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRqIs-0008Ka-JA; Tue, 14 Feb 2023 03:04:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRqIq-0008KR-1x
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 03:04:40 -0500
Received: from mga03.intel.com ([134.134.136.65])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRqIn-000516-Fd
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 03:04:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676361877; x=1707897877;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=UoMbBDyqQjc07iwlYEjz6YB73rUkUbYLovSK9N5awhY=;
 b=a+tpAF9y6VB+Pj5QdG1hyiKJdvNn27r04E6Uv8B0aEUBCq+ArAw4rMeT
 mwOEagbbP0wnBqi2WLi7zHINHHiOHwZzkrC76RUH3GEJRBp5Be9DGSZFN
 6qn8PweP5vGkj6NxvdYsVHq05KZdrYyNJkALfCOa+UHJWVRW6ciecDsSs
 NRs3DmTtHG8UKq+FO7idtO0vp5xGG0JilHGudVpKAiaeoljkNh1ybd5un
 Ek0gIFCXEf7Y8Uue3f5tvrsemtO1GPz5UxtC5zPz4oN88Pda/QPjObH0w
 bWdLjv57FXPx93IcNAQLR3dcjMy+OmGvyy+5x0F4PdzeQfbmau+XCMjnK g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="333242663"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; d="scan'208";a="333242663"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2023 00:04:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="997991927"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; d="scan'208";a="997991927"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost)
 ([10.239.160.112])
 by fmsmga005.fm.intel.com with ESMTP; 14 Feb 2023 00:04:30 -0800
Date: Tue, 14 Feb 2023 16:12:18 +0800
From: Zhao Liu <zhao1.liu@linux.intel.com>
To: Juan Quintela <quintela@redhat.com>
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Zhenyu Wang <zhenyu.z.wang@intel.com>, Dapeng Mi <dapeng1.mi@intel.com>,
 Zhuocheng Ding <zhuocheng.ding@intel.com>,
 Robert Hoo <robert.hu@linux.intel.com>,
 Sean Christopherson <seanjc@google.com>,
 Like Xu <like.xu.linux@gmail.com>, Zhao Liu <zhao1.liu@intel.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [RFC 15/52] migration/postcopy-ram: Use generic topology name
 and helper
Message-ID: <Y+tCYimcttGlv0rP@liuzhao-OptiPlex-7080>
References: <20230213095035.158240-1-zhao1.liu@linux.intel.com>
 <20230213095035.158240-16-zhao1.liu@linux.intel.com>
 <875yc5naje.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <875yc5naje.fsf@secure.mitica>
Received-SPF: none client-ip=134.134.136.65;
 envelope-from=zhao1.liu@linux.intel.com; helo=mga03.intel.com
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

On Mon, Feb 13, 2023 at 11:07:33AM +0100, Juan Quintela wrote:
> Date: Mon, 13 Feb 2023 11:07:33 +0100
> From: Juan Quintela <quintela@redhat.com>
> Subject: Re: [RFC 15/52] migration/postcopy-ram: Use generic topology name
>  and helper
> 
> Zhao Liu <zhao1.liu@linux.intel.com> wrote:
> > From: Zhao Liu <zhao1.liu@intel.com>
> >
> > As the generic code, here we should respect the different topologies:
> > smp or hybrid.
> >
> > So rename PostcopyBlocktimeContext.smp_cpus_down to
> > PostcopyBlocktimeContext.cpus_down, and also rename other local
> > variables from smp_cpus to cpus_num, to decouple with smp topology.
> >
> > And use generic topology helpers to get topology information.
> >
> > Cc: Juan Quintela <quintela@redhat.com>
> > Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
> > Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> 
> Reviewed-by: Juan Quintela <quintela@redhat.com>
> 
> but if you ever have to rebase.
> 
> > ---
> >  migration/postcopy-ram.c | 24 ++++++++++++------------
> >  1 file changed, 12 insertions(+), 12 deletions(-)
> >
> > diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
> > index 53299b7a5ebd..1e861e313258 100644
> > --- a/migration/postcopy-ram.c
> > +++ b/migration/postcopy-ram.c
> > @@ -122,7 +122,7 @@ typedef struct PostcopyBlocktimeContext {
> >      /* point in time when last page fault was initiated */
> >      uint32_t last_begin;
> >      /* number of vCPU are suspended */
> > -    int smp_cpus_down;
> > +    int cpus_down;
> 
> Put the rename of the variable in a single patch.  Trivial to review.
> 
> > +    unsigned int cpus_num = machine_topo_get_cpus(ms);
> 
> Put the meat in another patch.  I think you call this function in two
> places instead of the old one.
> 

Thanks Juan! On the next send, I'll do the split.

> 
> Later, Juan.
> 

