Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 297F969744E
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 03:22:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pS7QI-000702-Iu; Tue, 14 Feb 2023 21:21:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pS7QF-0006y8-Qm
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 21:21:27 -0500
Received: from mga11.intel.com ([192.55.52.93])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pS7QC-0000Dr-V5
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 21:21:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676427684; x=1707963684;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=bbRyX5p05+Njpn7QG3x/edhFuVU9huCkvd3osXzPhq4=;
 b=LeNbQt2iqXAfllVmGJJAe9X7wZyqZsErK+kTKFiOHZCqek0Jx1VP7lLb
 QEVd746srsGbnABu16JrWdsxmJh0bGxZYmtD7AT+UlBJHYM+tTb5uz88T
 AugraEmDVhFFU2Ii5CztEp/zHgHeenTN9xqGTj6Fip/SWR/wBjbMLllD6
 XSJp/GxF2sgCBgmH0bYAlmpfqyf/dpg/UDREOHIfsw1tQRjK0kNOAvnAV
 fne1ahj91k5/914BuJRMoNIjMSO/QolqAEbfXiG5qCbufR2YXTaaB+QE+
 gkmnsV3eOH8UZiW6uW2e6FQS/EF31L+2JN4etp1j+08dKA9IuWgZ6/Ugw Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="329042858"
X-IronPort-AV: E=Sophos;i="5.97,298,1669104000"; d="scan'208";a="329042858"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2023 18:21:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="701861662"
X-IronPort-AV: E=Sophos;i="5.97,298,1669104000"; d="scan'208";a="701861662"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost)
 ([10.239.160.112])
 by orsmga001.jf.intel.com with ESMTP; 14 Feb 2023 18:21:17 -0800
Date: Wed, 15 Feb 2023 10:29:06 +0800
From: Zhao Liu <zhao1.liu@linux.intel.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
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
 Sunil Muthuswamy <sunilmut@microsoft.com>
Subject: Re: [RFC 04/52] i386/WHPX: Fix error message when fail to set
 ProcessorCount
Message-ID: <Y+xDci0jZ72RREgh@liuzhao-OptiPlex-7080>
References: <20230213095035.158240-1-zhao1.liu@linux.intel.com>
 <20230213095035.158240-5-zhao1.liu@linux.intel.com>
 <Y+o9/45iHAn2+eUv@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y+o9/45iHAn2+eUv@redhat.com>
Received-SPF: none client-ip=192.55.52.93;
 envelope-from=zhao1.liu@linux.intel.com; helo=mga11.intel.com
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

On Mon, Feb 13, 2023 at 01:41:19PM +0000, Daniel P. Berrangé wrote:
> Date: Mon, 13 Feb 2023 13:41:19 +0000
> From: "Daniel P. Berrangé" <berrange@redhat.com>
> Subject: Re: [RFC 04/52] i386/WHPX: Fix error message when fail to set
>  ProcessorCount
> 
> On Mon, Feb 13, 2023 at 05:49:47PM +0800, Zhao Liu wrote:
> > From: Zhao Liu <zhao1.liu@intel.com>
> > 
> > 003f230 (machine: Tweak the order of topology members in struct
> > CpuTopology) changes the meaning of MachineState.smp.cores from "the
> > number of cores in one package" to "the number of cores in one die"
> > and doesn't fix other uses of MachineState.smp.cores. And because of
> > the introduction of cluster, now smp.cores just means "the number of
> > cores in one cluster". This clearly does not fit the semantics here.
> > 
> > And before this error message, WHvSetPartitionProperty() is called to
> > set prop.ProcessorCount.
> > 
> > So the error message should show the prop.ProcessorCount other than
> > "cores per cluster" or "cores per package".
> > 
> > Cc: Sunil Muthuswamy <sunilmut@microsoft.com>
> > Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> > ---
> >  target/i386/whpx/whpx-all.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> This patch and the 3 patches before it all look like basic bug
> fixes to current code, not really part of the new hybrid topology
> feature work.
> 
> As such I'd suggest sending these first four patches as a separate
> series, so the bug fixes can be merged fairly quickly. I expect the
> rest of the hybrid topology series is going to take a long time to
> get agreement on, so no need to delay the easy bug fixes.

Yes, I'll split out the first four. Thanks!

Zhao

> 
> > 
> > diff --git a/target/i386/whpx/whpx-all.c b/target/i386/whpx/whpx-all.c
> > index e738d83e8191..fc349f887e47 100644
> > --- a/target/i386/whpx/whpx-all.c
> > +++ b/target/i386/whpx/whpx-all.c
> > @@ -2613,8 +2613,8 @@ static int whpx_accel_init(MachineState *ms)
> >          sizeof(WHV_PARTITION_PROPERTY));
> >  
> >      if (FAILED(hr)) {
> > -        error_report("WHPX: Failed to set partition core count to %d,"
> > -                     " hr=%08lx", ms->smp.cores, hr);
> > +        error_report("WHPX: Failed to set partition processor count to %d,"
> > +                     " hr=%08lx", prop.ProcessorCount, hr);
> >          ret = -EINVAL;
> >          goto error;
> >      }
> > -- 
> > 2.34.1
> > 
> > 
> 
> With regards,
> Daniel
> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
> 

