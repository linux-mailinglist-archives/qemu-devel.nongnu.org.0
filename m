Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A76764C6E1
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Dec 2022 11:11:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5Oi9-0007iR-Uj; Wed, 14 Dec 2022 05:10:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p5Ohr-0007cA-Dx
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 05:09:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p5Ohe-00015I-GS
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 05:09:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671012561;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k/lpCYBXIRzEJL16dt1SG350wajOBOqN5P7sPMMQaJM=;
 b=CQiLKF9Y7A8yAXFehDv9KGzUUkQ6TjVwJqxTGp6Ot/GxEole9LglG92vCUCNvBpMilX1if
 P25AmDTn84w/VESD06+QEDVVVNiaxrMM5aBBuOPHct1uj/vYh2Wq5OcJhNKq3kCYJ2qQWO
 QxdvpeJoWkIAnu3i71WqIAA7AxYFZA4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-581-_A2g6N8OOaOy7_jJV-0ckA-1; Wed, 14 Dec 2022 05:09:19 -0500
X-MC-Unique: _A2g6N8OOaOy7_jJV-0ckA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DAACB1C0896E;
 Wed, 14 Dec 2022 10:09:18 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BD71F492C14;
 Wed, 14 Dec 2022 10:09:17 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-devel@nongnu.org
Cc: Matthew Rosato <mjrosato@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>
Subject: [PULL 01/23] s390x/pci: coalesce unmap operations
Date: Wed, 14 Dec 2022 11:08:49 +0100
Message-Id: <20221214100911.165291-2-thuth@redhat.com>
In-Reply-To: <20221214100911.165291-1-thuth@redhat.com>
References: <20221214100911.165291-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Matthew Rosato <mjrosato@linux.ibm.com>

Currently, each unmapped page is handled as an individual iommu
region notification.  Attempt to group contiguous unmap operations
into fewer notifications to reduce overhead.

Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
Message-Id: <20221028194758.204007-3-mjrosato@linux.ibm.com>
Reviewed-by: Eric Farman <farman@linux.ibm.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/s390x/s390-pci-inst.c | 51 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/hw/s390x/s390-pci-inst.c b/hw/s390x/s390-pci-inst.c
index 7cc4bcf850..66e764f901 100644
--- a/hw/s390x/s390-pci-inst.c
+++ b/hw/s390x/s390-pci-inst.c
@@ -640,6 +640,8 @@ static uint32_t s390_pci_update_iotlb(S390PCIIOMMU *iommu,
         }
         g_hash_table_remove(iommu->iotlb, &entry->iova);
         inc_dma_avail(iommu);
+        /* Don't notify the iommu yet, maybe we can bundle contiguous unmaps */
+        goto out;
     } else {
         if (cache) {
             if (cache->perm == entry->perm &&
@@ -663,15 +665,44 @@ static uint32_t s390_pci_update_iotlb(S390PCIIOMMU *iommu,
         dec_dma_avail(iommu);
     }
 
+    /*
+     * All associated iotlb entries have already been cleared, trigger the
+     * unmaps.
+     */
     memory_region_notify_iommu(&iommu->iommu_mr, 0, event);
 
 out:
     return iommu->dma_limit ? iommu->dma_limit->avail : 1;
 }
 
+static void s390_pci_batch_unmap(S390PCIIOMMU *iommu, uint64_t iova,
+                                 uint64_t len)
+{
+    uint64_t remain = len, start = iova, end = start + len - 1, mask, size;
+    IOMMUTLBEvent event = {
+        .type = IOMMU_NOTIFIER_UNMAP,
+        .entry = {
+            .target_as = &address_space_memory,
+            .translated_addr = 0,
+            .perm = IOMMU_NONE,
+        },
+    };
+
+    while (remain >= TARGET_PAGE_SIZE) {
+        mask = dma_aligned_pow2_mask(start, end, 64);
+        size = mask + 1;
+        event.entry.iova = start;
+        event.entry.addr_mask = mask;
+        memory_region_notify_iommu(&iommu->iommu_mr, 0, event);
+        start += size;
+        remain -= size;
+    }
+}
+
 int rpcit_service_call(S390CPU *cpu, uint8_t r1, uint8_t r2, uintptr_t ra)
 {
     CPUS390XState *env = &cpu->env;
+    uint64_t iova, coalesce = 0;
     uint32_t fh;
     uint16_t error = 0;
     S390PCIBusDevice *pbdev;
@@ -742,6 +773,21 @@ int rpcit_service_call(S390CPU *cpu, uint8_t r1, uint8_t r2, uintptr_t ra)
             break;
         }
 
+        /*
+         * If this is an unmap of a PTE, let's try to coalesce multiple unmaps
+         * into as few notifier events as possible.
+         */
+        if (entry.perm == IOMMU_NONE && entry.len == TARGET_PAGE_SIZE) {
+            if (coalesce == 0) {
+                iova = entry.iova;
+            }
+            coalesce += entry.len;
+        } else if (coalesce > 0) {
+            /* Unleash the coalesced unmap before processing a new map */
+            s390_pci_batch_unmap(iommu, iova, coalesce);
+            coalesce = 0;
+        }
+
         start += entry.len;
         while (entry.iova < start && entry.iova < end) {
             if (dma_avail > 0 || entry.perm == IOMMU_NONE) {
@@ -759,6 +805,11 @@ int rpcit_service_call(S390CPU *cpu, uint8_t r1, uint8_t r2, uintptr_t ra)
             }
         }
     }
+    if (coalesce) {
+            /* Unleash the coalesced unmap before finishing rpcit */
+            s390_pci_batch_unmap(iommu, iova, coalesce);
+            coalesce = 0;
+    }
     if (again && dma_avail > 0)
         goto retry;
 err:
-- 
2.31.1


