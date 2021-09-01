Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D1DB3FD9EC
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 15:05:23 +0200 (CEST)
Received: from localhost ([::1]:54128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLPvd-0002L4-SZ
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 09:05:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mLPor-0004MK-0f
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 08:58:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36378)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mLPoo-0000Gk-6H
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 08:58:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630501096;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=mK9qsAQ7oPjLNlurO2Je2OkSNfn9JHxYJNTbu4Q0qCY=;
 b=a1LYjoSW7J6MGrFhfB9+ZLSd3+lPzF2IGo9EKLnLQeCvoWw7yj29c3Ebav8Jw1Nqn4Hlx0
 yl4hHRXghlk/1zRbFlWY7rq/Au8PiV/jhlDYK2Abyhtp3BEbwkxQsCZ7qXhUYiR5L6ImQw
 z/a5KvVHRgv90TxMKgfR41BocJ0Hms4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-461-xdHo3n3kOReesSkKdkHqoA-1; Wed, 01 Sep 2021 08:58:15 -0400
X-MC-Unique: xdHo3n3kOReesSkKdkHqoA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 04074802928;
 Wed,  1 Sep 2021 12:58:14 +0000 (UTC)
Received: from thuth.com (unknown [10.39.195.16])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E68724EF73;
 Wed,  1 Sep 2021 12:58:07 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Matthew Rosato <mjrosato@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH] s390x: Replace PAGE_SIZE, PAGE_SHIFT and PAGE_MASK
Date: Wed,  1 Sep 2021 14:58:00 +0200
Message-Id: <20210901125800.611183-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The PAGE_SIZE macro is causing trouble on Alpine Linux since it
clashes with a macro from a system header there. We already have
the TARGET_PAGE_SIZE, TARGET_PAGE_MASK and TARGET_PAGE_BITS macros
in QEMU anyway, so let's simply replace the PAGE_SIZE, PAGE_MASK
and PAGE_SHIFT macro with their TARGET_* counterparts.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/572
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/s390x/s390-pci-bus.c         | 10 +++++-----
 hw/s390x/s390-pci-inst.c        |  8 ++++----
 hw/s390x/sclp.c                 |  2 +-
 include/hw/s390x/s390-pci-bus.h |  5 +----
 4 files changed, 11 insertions(+), 14 deletions(-)

diff --git a/hw/s390x/s390-pci-bus.c b/hw/s390x/s390-pci-bus.c
index 7db1c5943f..6c0225c3a0 100644
--- a/hw/s390x/s390-pci-bus.c
+++ b/hw/s390x/s390-pci-bus.c
@@ -330,7 +330,7 @@ static unsigned int calc_sx(dma_addr_t ptr)
 
 static unsigned int calc_px(dma_addr_t ptr)
 {
-    return ((unsigned long) ptr >> PAGE_SHIFT) & ZPCI_PT_MASK;
+    return ((unsigned long) ptr >> TARGET_PAGE_BITS) & ZPCI_PT_MASK;
 }
 
 static uint64_t get_rt_sto(uint64_t entry)
@@ -506,7 +506,7 @@ uint16_t s390_guest_io_table_walk(uint64_t g_iota, hwaddr addr,
     int8_t ett = 1;
     uint16_t error = 0;
 
-    entry->iova = addr & PAGE_MASK;
+    entry->iova = addr & TARGET_PAGE_MASK;
     entry->translated_addr = 0;
     entry->perm = IOMMU_RW;
 
@@ -526,7 +526,7 @@ static IOMMUTLBEntry s390_translate_iommu(IOMMUMemoryRegion *mr, hwaddr addr,
 {
     S390PCIIOMMU *iommu = container_of(mr, S390PCIIOMMU, iommu_mr);
     S390IOTLBEntry *entry;
-    uint64_t iova = addr & PAGE_MASK;
+    uint64_t iova = addr & TARGET_PAGE_MASK;
     uint16_t error = 0;
     IOMMUTLBEntry ret = {
         .target_as = &address_space_memory,
@@ -562,7 +562,7 @@ static IOMMUTLBEntry s390_translate_iommu(IOMMUMemoryRegion *mr, hwaddr addr,
         ret.perm = entry->perm;
     } else {
         ret.iova = iova;
-        ret.addr_mask = ~PAGE_MASK;
+        ret.addr_mask = ~TARGET_PAGE_MASK;
         ret.perm = IOMMU_NONE;
     }
 
@@ -868,7 +868,7 @@ static int s390_pci_msix_init(S390PCIBusDevice *pbdev)
 
     name = g_strdup_printf("msix-s390-%04x", pbdev->uid);
     memory_region_init_io(&pbdev->msix_notify_mr, OBJECT(pbdev),
-                          &s390_msi_ctrl_ops, pbdev, name, PAGE_SIZE);
+                          &s390_msi_ctrl_ops, pbdev, name, TARGET_PAGE_SIZE);
     memory_region_add_subregion(&pbdev->iommu->mr,
                                 pbdev->pci_group->zpci_group.msia,
                                 &pbdev->msix_notify_mr);
diff --git a/hw/s390x/s390-pci-inst.c b/hw/s390x/s390-pci-inst.c
index 9ec277d50e..1c8ad91175 100644
--- a/hw/s390x/s390-pci-inst.c
+++ b/hw/s390x/s390-pci-inst.c
@@ -613,7 +613,7 @@ static uint32_t s390_pci_update_iotlb(S390PCIIOMMU *iommu,
             .iova = entry->iova,
             .translated_addr = entry->translated_addr,
             .perm = entry->perm,
-            .addr_mask = ~PAGE_MASK,
+            .addr_mask = ~TARGET_PAGE_MASK,
         },
     };
 
@@ -640,7 +640,7 @@ static uint32_t s390_pci_update_iotlb(S390PCIIOMMU *iommu,
         cache = g_new(S390IOTLBEntry, 1);
         cache->iova = entry->iova;
         cache->translated_addr = entry->translated_addr;
-        cache->len = PAGE_SIZE;
+        cache->len = TARGET_PAGE_SIZE;
         cache->perm = entry->perm;
         g_hash_table_replace(iommu->iotlb, &cache->iova, cache);
         dec_dma_avail(iommu);
@@ -725,8 +725,8 @@ int rpcit_service_call(S390CPU *cpu, uint8_t r1, uint8_t r2, uintptr_t ra)
         while (entry.iova < start && entry.iova < end &&
                (dma_avail > 0 || entry.perm == IOMMU_NONE)) {
             dma_avail = s390_pci_update_iotlb(iommu, &entry);
-            entry.iova += PAGE_SIZE;
-            entry.translated_addr += PAGE_SIZE;
+            entry.iova += TARGET_PAGE_SIZE;
+            entry.translated_addr += TARGET_PAGE_SIZE;
         }
     }
 err:
diff --git a/hw/s390x/sclp.c b/hw/s390x/sclp.c
index edb6e3ea01..89c30a8a91 100644
--- a/hw/s390x/sclp.c
+++ b/hw/s390x/sclp.c
@@ -51,7 +51,7 @@ static bool sccb_verify_boundary(uint64_t sccb_addr, uint16_t sccb_len,
                                  uint32_t code)
 {
     uint64_t sccb_max_addr = sccb_addr + sccb_len - 1;
-    uint64_t sccb_boundary = (sccb_addr & PAGE_MASK) + PAGE_SIZE;
+    uint64_t sccb_boundary = (sccb_addr & TARGET_PAGE_MASK) + TARGET_PAGE_SIZE;
 
     switch (code & SCLP_CMD_CODE_MASK) {
     case SCLP_CMDW_READ_SCP_INFO:
diff --git a/include/hw/s390x/s390-pci-bus.h b/include/hw/s390x/s390-pci-bus.h
index 49ae9f03d3..aa891c178d 100644
--- a/include/hw/s390x/s390-pci-bus.h
+++ b/include/hw/s390x/s390-pci-bus.h
@@ -81,9 +81,6 @@ OBJECT_DECLARE_SIMPLE_TYPE(S390PCIIOMMU, S390_PCI_IOMMU)
 #define ZPCI_SDMA_ADDR 0x100000000ULL
 #define ZPCI_EDMA_ADDR 0x1ffffffffffffffULL
 
-#define PAGE_SHIFT      12
-#define PAGE_SIZE       (1 << PAGE_SHIFT)
-#define PAGE_MASK       (~(PAGE_SIZE-1))
 #define PAGE_DEFAULT_ACC        0
 #define PAGE_DEFAULT_KEY        (PAGE_DEFAULT_ACC << 4)
 
@@ -137,7 +134,7 @@ enum ZpciIoatDtype {
 
 #define ZPCI_TABLE_BITS         11
 #define ZPCI_PT_BITS            8
-#define ZPCI_ST_SHIFT           (ZPCI_PT_BITS + PAGE_SHIFT)
+#define ZPCI_ST_SHIFT           (ZPCI_PT_BITS + TARGET_PAGE_BITS)
 #define ZPCI_RT_SHIFT           (ZPCI_ST_SHIFT + ZPCI_TABLE_BITS)
 
 #define ZPCI_RTE_FLAG_MASK      0x3fffULL
-- 
2.27.0


