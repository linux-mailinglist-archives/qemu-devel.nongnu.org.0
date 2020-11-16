Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3BA02B500F
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 19:42:49 +0100 (CET)
Received: from localhost ([::1]:40350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kejSi-0003yV-NR
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 13:42:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1kej4U-0002Xq-Ad
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 13:17:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33289)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1kej4P-0001mf-Sc
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 13:17:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605550661;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jqLkz2ZGHvI5eDvtyF8AKDSljRxUckpQr4UNY5GLwHs=;
 b=Xt6tu4SvsN8oB67E5LYLQ6wB8yBi6nrPQ2HSNZ636jpxbnDPW6pySm4a1mWmHngppzDLGD
 WhhMmn8F8NTNFh8hmGPLld5oQD8Gu7uIR+e8XoT5+vpG9buYl5rLFHFt4JnOf+6g5mZ4A8
 jusbr9E4wWEYjO+6oMZdb/Yyf3ILkMs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-503-Taw96GqlN0qU6YywEFNEtg-1; Mon, 16 Nov 2020 13:17:39 -0500
X-MC-Unique: Taw96GqlN0qU6YywEFNEtg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6CD15807344;
 Mon, 16 Nov 2020 18:17:37 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-113-230.ams2.redhat.com [10.36.113.230])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5A2EE5C1CF;
 Mon, 16 Nov 2020 18:17:23 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, alex.williamson@redhat.com
Subject: [RFC v7 21/26] hw/arm/smmuv3: Fill the IOTLBEntry leaf field on NH_VA
 invalidation
Date: Mon, 16 Nov 2020 19:13:44 +0100
Message-Id: <20201116181349.11908-22-eric.auger@redhat.com>
In-Reply-To: <20201116181349.11908-1-eric.auger@redhat.com>
References: <20201116181349.11908-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/15 22:35:17
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: peter.maydell@linaro.org, jacob.jun.pan@linux.intel.com,
 jean-philippe@linaro.org, tn@semihalf.com,
 shameerali.kolothum.thodi@huawei.com, nicoleotsuka@gmail.com,
 vivek.gautam@arm.com, yi.l.liu@intel.com, peterx@redhat.com,
 zhangfei.gao@gmail.com, yuzenghui@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let's propagate the leaf attribute throughout the invalidation path.
This hint is used to reduce the scope of the invalidations to the
last level of translation. Not enforcing it induces large performance
penalties in nested mode.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/smmuv3.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 553b785fda..c314f9e4c9 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -798,7 +798,7 @@ epilogue:
 static void smmuv3_notify_iova(IOMMUMemoryRegion *mr,
                                IOMMUNotifier *n,
                                int asid, dma_addr_t iova,
-                               uint8_t tg, uint64_t num_pages)
+                               uint8_t tg, uint64_t num_pages, bool leaf)
 {
     SMMUDevice *sdev = container_of(mr, SMMUDevice, iommu);
     IOMMUTLBEntry entry;
@@ -829,13 +829,13 @@ static void smmuv3_notify_iova(IOMMUMemoryRegion *mr,
     entry.addr_mask = num_pages * (1 << granule) - 1;
     entry.perm = IOMMU_NONE;
     entry.arch_id = asid;
+    entry.leaf = leaf;
 
     memory_region_notify_one(n, &entry);
 }
 
-/* invalidate an asid/iova range tuple in all mr's */
 static void smmuv3_inv_notifiers_iova(SMMUState *s, int asid, dma_addr_t iova,
-                                      uint8_t tg, uint64_t num_pages)
+                                      uint8_t tg, uint64_t num_pages, bool leaf)
 {
     SMMUDevice *sdev;
 
@@ -847,7 +847,7 @@ static void smmuv3_inv_notifiers_iova(SMMUState *s, int asid, dma_addr_t iova,
                                         tg, num_pages);
 
         IOMMU_NOTIFIER_FOREACH(n, mr) {
-            smmuv3_notify_iova(mr, n, asid, iova, tg, num_pages);
+            smmuv3_notify_iova(mr, n, asid, iova, tg, num_pages, leaf);
         }
     }
 }
@@ -874,7 +874,7 @@ static void smmuv3_s1_range_inval(SMMUState *s, Cmd *cmd)
         asid = CMD_ASID(cmd);
     }
     trace_smmuv3_s1_range_inval(vmid, asid, addr, tg, num_pages, ttl, leaf);
-    smmuv3_inv_notifiers_iova(s, asid, addr, tg, num_pages);
+    smmuv3_inv_notifiers_iova(s, asid, addr, tg, num_pages, leaf);
     smmu_iotlb_inv_iova(s, asid, addr, tg, num_pages, ttl);
 }
 
-- 
2.21.3


