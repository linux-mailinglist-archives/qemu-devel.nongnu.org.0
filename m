Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C143BF671
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 09:48:40 +0200 (CEST)
Received: from localhost ([::1]:47100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Olz-0003YC-5y
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 03:48:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1m1Okr-00023u-My
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 03:47:29 -0400
Received: from mga01.intel.com ([192.55.52.88]:14875)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1m1Oko-0006zI-Id
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 03:47:29 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10038"; a="231214730"
X-IronPort-AV: E=Sophos;i="5.84,222,1620716400"; d="scan'208";a="231214730"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2021 00:47:19 -0700
X-IronPort-AV: E=Sophos;i="5.84,222,1620716400"; d="scan'208";a="487454243"
Received: from yangzhon-virtual.bj.intel.com (HELO yangzhon-Virtual)
 ([10.238.144.101])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-SHA256;
 08 Jul 2021 00:47:17 -0700
Date: Thu, 8 Jul 2021 15:34:06 +0800
From: Yang Zhong <yang.zhong@intel.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH] remote/memory: Replace share parameter with ram_flags
Message-ID: <20210708073406.GA2802@yangzhon-Virtual>
References: <20210708071216.87862-1-yang.zhong@intel.com>
 <8ea4cb21-e69e-2846-1300-88a9cebf7758@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8ea4cb21-e69e-2846-1300-88a9cebf7758@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Received-SPF: pass client-ip=192.55.52.88; envelope-from=yang.zhong@intel.com;
 helo=mga01.intel.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: yang.zhong@intel.com, pbonzini@redhat.com, philmd@redhat.com,
 qemu-devel@nongnu.org, peterx@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jul 08, 2021 at 09:26:17AM +0200, David Hildenbrand wrote:
> On 08.07.21 09:12, Yang Zhong wrote:
> >The commit(d5015b80) missed the ram_flags to memory_region_init_ram_from_fd()
> >in the hw/remote/memory.c.
> 
> Yes, seems like that call was added just after I crafted my patches:
> 
> Fixes: d5015b801340 ("softmmu/memory: Pass ram_flags to
> qemu_ram_alloc_from_fd()")
> Reviewed-by: David Hildenbrand <david@redhat.com>
>
 
  Thanks David, if there is not any other comments, i will send the new
  version according to your commit info. thanks!

  Yang

 
> Thanks!
> 
> >
> >Signed-off-by: Yang Zhong <yang.zhong@intel.com>
> >---
> >  hw/remote/memory.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> >diff --git a/hw/remote/memory.c b/hw/remote/memory.c
> >index 472ed2a272..6e21ab1a45 100644
> >--- a/hw/remote/memory.c
> >+++ b/hw/remote/memory.c
> >@@ -46,7 +46,7 @@ void remote_sysmem_reconfig(MPQemuMsg *msg, Error **errp)
> >          subregion = g_new(MemoryRegion, 1);
> >          memory_region_init_ram_from_fd(subregion, NULL,
> >                                         name, sysmem_info->sizes[region],
> >-                                       true, msg->fds[region],
> >+                                       RAM_SHARED, msg->fds[region],
> >                                         sysmem_info->offsets[region],
> >                                         errp);
> >
> 
> 
> -- 
> Thanks,
> 
> David / dhildenb

