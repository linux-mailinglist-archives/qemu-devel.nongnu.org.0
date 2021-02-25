Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE77324EEA
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 12:15:55 +0100 (CET)
Received: from localhost ([::1]:47598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFEcc-0004qb-7U
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 06:15:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lFEKn-0003E8-5s
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 05:57:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48341)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lFEKj-0006g9-NJ
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 05:57:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614250645;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GySNHxbDf9VrBli/oPMX9DteOU2bEwougHpQP+1tWA4=;
 b=ZLre/6pb+q9Ut5dSVIToQ5aWTiz8iSkUs625i1d5LZT6Z4Ovu7opAg2GtvTmS8CNGiAnyp
 iZJVWJqqJEjnVxynFgORu9BOjFFFwsHtzx+AThN6JNctIXn/sB0WEFoNN63Zn3daDLel6+
 82STng7bbSJr2CnEWp2VtYSGDqVPuf0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-408-u1WyCivSMeimRQIQHPk-kg-1; Thu, 25 Feb 2021 05:57:23 -0500
X-MC-Unique: u1WyCivSMeimRQIQHPk-kg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 62F41C296;
 Thu, 25 Feb 2021 10:57:21 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-112-150.ams2.redhat.com [10.36.112.150])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0CF9E5D9D7;
 Thu, 25 Feb 2021 10:57:15 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, mst@redhat.com,
 alex.williamson@redhat.com, jacob.jun.pan@linux.intel.com,
 yi.l.liu@intel.com
Subject: [RFC v8 23/28] hw/arm/smmuv3: Fill the IOTLBEntry leaf field on NH_VA
 invalidation
Date: Thu, 25 Feb 2021 11:52:28 +0100
Message-Id: <20210225105233.650545-24-eric.auger@redhat.com>
In-Reply-To: <20210225105233.650545-1-eric.auger@redhat.com>
References: <20210225105233.650545-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eric.auger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: jean-philippe@linaro.org, tnowicki@marvell.com, maz@kernel.org,
 jiangkunkun@huawei.com, zhangfei.gao@foxmail.com, peterx@redhat.com,
 shameerali.kolothum.thodi@huawei.com, yuzenghui@huawei.com,
 zhangfei.gao@linaro.org, will@kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let's propagate the leaf attribute throughout the invalidation path.
This hint is used to reduce the scope of the invalidations to the
last level of translation. Not enforcing it induces large performance
penalties in nested mode.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/smmuv3.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index d5a935004b..24d77175bf 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -799,7 +799,7 @@ epilogue:
 static void smmuv3_notify_iova(IOMMUMemoryRegion *mr,
                                IOMMUNotifier *n,
                                int asid, dma_addr_t iova,
-                               uint8_t tg, uint64_t num_pages)
+                               uint8_t tg, uint64_t num_pages, bool leaf)
 {
     SMMUDevice *sdev = container_of(mr, SMMUDevice, iommu);
     IOMMUTLBEvent event = {};
@@ -834,6 +834,7 @@ static void smmuv3_notify_iova(IOMMUMemoryRegion *mr,
     event.entry.perm = IOMMU_NONE;
     event.entry.flags = IOMMU_INV_FLAGS_ARCHID;
     event.entry.arch_id = asid;
+    event.entry.leaf = leaf;
 
     memory_region_notify_iommu_one(n, &event);
 }
@@ -863,7 +864,7 @@ static void smmuv3_notify_asid(IOMMUMemoryRegion *mr,
 
 /* invalidate an asid/iova range tuple in all mr's */
 static void smmuv3_inv_notifiers_iova(SMMUState *s, int asid, dma_addr_t iova,
-                                      uint8_t tg, uint64_t num_pages)
+                                      uint8_t tg, uint64_t num_pages, bool leaf)
 {
     SMMUDevice *sdev;
 
@@ -875,7 +876,7 @@ static void smmuv3_inv_notifiers_iova(SMMUState *s, int asid, dma_addr_t iova,
                                         tg, num_pages);
 
         IOMMU_NOTIFIER_FOREACH(n, mr) {
-            smmuv3_notify_iova(mr, n, asid, iova, tg, num_pages);
+            smmuv3_notify_iova(mr, n, asid, iova, tg, num_pages, leaf);
         }
     }
 }
@@ -913,7 +914,7 @@ static void smmuv3_s1_range_inval(SMMUState *s, Cmd *cmd)
         count = mask + 1;
 
         trace_smmuv3_s1_range_inval(vmid, asid, addr, tg, count, ttl, leaf);
-        smmuv3_inv_notifiers_iova(s, asid, addr, tg, count);
+        smmuv3_inv_notifiers_iova(s, asid, addr, tg, count, leaf);
         smmu_iotlb_inv_iova(s, asid, addr, tg, count, ttl);
 
         num_pages -= count;
-- 
2.26.2


