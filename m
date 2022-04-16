Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFFAE503548
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Apr 2022 10:41:41 +0200 (CEST)
Received: from localhost ([::1]:39018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nfdzw-0003zf-HY
	for lists+qemu-devel@lfdr.de; Sat, 16 Apr 2022 04:41:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenxiang66@hisilicon.com>)
 id 1nfdyB-0003C7-HT
 for qemu-devel@nongnu.org; Sat, 16 Apr 2022 04:39:51 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:3934)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenxiang66@hisilicon.com>)
 id 1nfdy8-0007JO-VI
 for qemu-devel@nongnu.org; Sat, 16 Apr 2022 04:39:51 -0400
Received: from kwepemi500016.china.huawei.com (unknown [172.30.72.56])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4KgRT80Kh4zgYsl;
 Sat, 16 Apr 2022 16:39:40 +0800 (CST)
Received: from localhost.localdomain (10.69.192.58) by
 kwepemi500016.china.huawei.com (7.221.188.220) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Sat, 16 Apr 2022 16:39:41 +0800
To: <eric.auger@redhat.com>, <pbonzini@redhat.com>, <peterx@redhat.com>,
 <david@redhat.com>, <f4bug@amsat.org>
CC: <linuxarm@huawei.com>, <qemu-devel@nongnu.org>, Xiang Chen
 <chenxiang66@hisilicon.com>
Subject: [PATCH] softmmu/memory: Skip translation size instead of fixed
 granularity if translate() successfully
Date: Sat, 16 Apr 2022 16:34:01 +0800
Message-ID: <1650098041-127062-1-git-send-email-chenxiang66@hisilicon.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.58]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500016.china.huawei.com (7.221.188.220)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=chenxiang66@hisilicon.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-to:  chenxiang <chenxiang66@hisilicon.com>
From:  chenxiang via <qemu-devel@nongnu.org>

From: Xiang Chen <chenxiang66@hisilicon.com>

Currently memory_region_iommu_replay() does full page table walk with
fixed granularity (page size) no matter translate() succeeds or not.
Actually if translate() successfully, we can skip translation size
(iotlb.addr_mask + 1) instead of fixed granularity.

 Signed-off-by: Xiang Chen <chenxiang66@hisilicon.com>
---
 softmmu/memory.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/softmmu/memory.c b/softmmu/memory.c
index bfa5d5178c..ccfa19cf71 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -1924,7 +1924,7 @@ void memory_region_iommu_replay(IOMMUMemoryRegion *iommu_mr, IOMMUNotifier *n)
 {
     MemoryRegion *mr = MEMORY_REGION(iommu_mr);
     IOMMUMemoryRegionClass *imrc = IOMMU_MEMORY_REGION_GET_CLASS(iommu_mr);
-    hwaddr addr, granularity;
+    hwaddr addr, granularity, def_granu;
     IOMMUTLBEntry iotlb;
 
     /* If the IOMMU has its own replay callback, override */
@@ -1933,12 +1933,15 @@ void memory_region_iommu_replay(IOMMUMemoryRegion *iommu_mr, IOMMUNotifier *n)
         return;
     }
 
-    granularity = memory_region_iommu_get_min_page_size(iommu_mr);
+    def_granu = memory_region_iommu_get_min_page_size(iommu_mr);
 
     for (addr = 0; addr < memory_region_size(mr); addr += granularity) {
         iotlb = imrc->translate(iommu_mr, addr, IOMMU_NONE, n->iommu_idx);
         if (iotlb.perm != IOMMU_NONE) {
             n->notify(n, &iotlb);
+            granularity = iotlb.addr_mask + 1;
+        } else {
+            granularity = def_granu;
         }
 
         /* if (2^64 - MR size) < granularity, it's possible to get an
-- 
2.33.0


