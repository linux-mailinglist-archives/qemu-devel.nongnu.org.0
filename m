Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D52A52AF1E
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 02:22:19 +0200 (CEST)
Received: from localhost ([::1]:46158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nr7SE-0003RK-0i
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 20:22:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.hu@linux.intel.com>)
 id 1nr7R6-0002h3-I8
 for qemu-devel@nongnu.org; Tue, 17 May 2022 20:21:08 -0400
Received: from mga14.intel.com ([192.55.52.115]:6276)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.hu@linux.intel.com>)
 id 1nr7R1-0007DF-C9
 for qemu-devel@nongnu.org; Tue, 17 May 2022 20:21:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652833263; x=1684369263;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mJL3VY7nc0ImJbrb47iVnpy8jUlCUnwKiVnZPwBrGCg=;
 b=Kv4DFpYtlIe6JlgRzULMutDFLhObpbHnYrXrZSkcaBmcOYs0NLLHNsX8
 8kWYUtzd5F6qsny0F6YRTgTduRyJubuUZGufsjy8zPHlM3ISxhzOP0ZGb
 UIG+ubpN8D82e5wivpOUAocOn0HT3O0GZ2BvDsypSS1eh310X0a0Ahy2V
 TR+9hXsWZ1XaRz4hqLPS8CEEKgka2nPxANorG6ZV+aK+UjxlgXcdqO98o
 PGNrqj9ZIeCR/EC7cVhZ9RvsC8QcFyED+6Vi6lMSHcjD4tPrXbodk7Qjl
 CV5QDshEz/yQj+wjw/L5EOizWNAD4AwraDR/T0K+uY4PkNoGHUdShtq/v g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10350"; a="271525694"
X-IronPort-AV: E=Sophos;i="5.91,233,1647327600"; d="scan'208";a="271525694"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2022 17:20:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,233,1647327600"; d="scan'208";a="638992177"
Received: from sqa-gate.sh.intel.com (HELO robert-ivt.tsp.org)
 ([10.239.48.212])
 by fmsmga004.fm.intel.com with ESMTP; 17 May 2022 17:20:57 -0700
Message-ID: <0be96ded3470de79150112d8c23cad94b1ea8b46.camel@linux.intel.com>
Subject: Re: [PATCH 1/2] acpi/nvdimm: Create _LS{I,R,W} method for NVDIMM
 device
From: Robert Hoo <robert.hu@linux.intel.com>
To: Igor Mammedov <imammedo@redhat.com>
Cc: xiaoguangrong.eric@gmail.com, mst@redhat.com, ani@anisinha.ca, 
 qemu-devel@nongnu.org, dan.j.williams@intel.com, jingqi.liu@intel.com, 
 robert.hu@intel.com
Date: Wed, 18 May 2022 08:20:56 +0800
In-Reply-To: <20220506112319.175028c6@redhat.com>
References: <20220412065753.3216538-1-robert.hu@linux.intel.com>
 <20220412065753.3216538-2-robert.hu@linux.intel.com>
 <20220427163401.20c69375@redhat.com>
 <5ceada8ba94790b07a2d651153001eead0f35705.camel@linux.intel.com>
 <20220503102742.0d5bab41@redhat.com>
 <dc177dd8eb6051ab9ab2752d657188fba83f0773.camel@linux.intel.com>
 <20220505105006.7c1e78cc@redhat.com>
 <e0f2a0ff9c2a35beb5c2ad06b522d8f6c1aaee31.camel@linux.intel.com>
 <20220506112319.175028c6@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-10.el7) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=192.55.52.115;
 envelope-from=robert.hu@linux.intel.com; helo=mga14.intel.com
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 2022-05-06 at 11:23 +0200, Igor Mammedov wrote:
> 
> > 
> > No, sorry, I didn't explain it clear.
> > No extra interface/ABI but these 3 must _LS{I,R,W} nvdimm-sub-
> > device
> > methods. Of course, I'm going to extract 'SystemIO' and
> > 'SystemMemory'
> > operation regions out of NACL to be globally available.
> > 
> > The buffer (BUFF in above patch) will be gone. It is added by my
> > this
> > patch, its mere use is to covert param of _LS{I,R,W} into those of
> > NACL. If I implemented each _LS{I,R,W} on their own, rather than
> > wrap
> > the multi-purpose NACL, no buffer needed, at least I now assume so.
> > And, why declare the 4K buffer global to sub-nvdimm? I now recall
> > that
> > it is because if not each sub-nvdimm device would contain a 4K
> > buff,
> > which will make this SSDT enormously large.
> 
> ok, lets see how it will look like when you are done.

In ASL, can we define package with Arg in? e.g.

Name (PKG1, Package ()
            {
                Arg0,
                Arg1,
                Arg2
            })
But it cannot pass compilation. Any approach to achieve this? if so, we
can still use simpler wrap scheme like v1 and save the 4K buffer.
> 
> > > 
> > > So unless we have to add new host/guest ABI, I'd prefer reusing
> > > existing one and complicate only new _LS{I,R,W} AML without
> > > touching NACL or host side.  
> > 
> > As mentioned above, I assume no new host/guest ABI, just extract
> > 'SystemIO' and 'SystemMemory' operation regions to a higher level
> > scope.
> > >  


