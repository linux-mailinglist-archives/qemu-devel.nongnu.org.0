Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C1B3695C51
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 09:09:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRqNN-0001NN-JE; Tue, 14 Feb 2023 03:09:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRqNF-0001NE-RY
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 03:09:14 -0500
Received: from mga06b.intel.com ([134.134.136.31] helo=mga06.intel.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRqND-0007eg-HC
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 03:09:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676362151; x=1707898151;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Jffyo3e/vhXfF/miu7ck2eHDcWxD8dhoLYfr7gqPfAI=;
 b=XDVmkFeMPOto6DIub4B8+TWXEqdpIg+RgQtl2B34bbeltBjf7hiDc5e3
 aHjyLAuo27QY/QdhfpmNfrEMhk0jzwls7eLjcjdDkgUWTXF61F5UsWzfg
 DoC7SRh/9s7tsXeJTblnnk3WC2fLyUwVj5/RGz4BrEJuCOUYa1clscr6R
 TkuqRqM1dvCQ69HySkigFAzkH+8RZgNkEEuwqq1z5PI+sb4x0nSDMTk5m
 qyFYlo2kF0PmwiLT9aXPY75PlP++9xSj8d2lZkOJeEcFQcsdIZm6lCgAW
 un5qm3Bz/TD+NeY+IQqzPbRdUjLNqhEE2xm5bnXbdeAIoYfJmmm/VpYM2 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="393508334"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; d="scan'208";a="393508334"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2023 00:09:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="843077011"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; d="scan'208";a="843077011"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost)
 ([10.239.160.112])
 by orsmga005.jf.intel.com with ESMTP; 14 Feb 2023 00:09:05 -0800
Date: Tue, 14 Feb 2023 16:16:52 +0800
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
Message-ID: <Y+tDdALJnsuocyDb@liuzhao-OptiPlex-7080>
References: <20230213095035.158240-1-zhao1.liu@linux.intel.com>
 <20230213095035.158240-16-zhao1.liu@linux.intel.com>
 <871qmtna4y.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <871qmtna4y.fsf@secure.mitica>
Received-SPF: none client-ip=134.134.136.31;
 envelope-from=zhao1.liu@linux.intel.com; helo=mga06.intel.com
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

On Mon, Feb 13, 2023 at 11:16:13AM +0100, Juan Quintela wrote:
> Date: Mon, 13 Feb 2023 11:16:13 +0100
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
> I expect that this will go with your other changes through another tree,

Yes, this one is based on my another patch series. It is currently sent
out for preview in advance. I think it may take a long time before the
entire hybrid patchset is accepted. Thanks for your review!

Zhao

> or do you want me to take it through migration thread?
> 
> Later, Juan.
> 

