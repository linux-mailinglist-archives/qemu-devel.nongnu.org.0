Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC0361E309
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Nov 2022 16:33:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orhdM-0005v0-5x; Sun, 06 Nov 2022 10:32:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1orhdK-0005uh-HX
 for qemu-devel@nongnu.org; Sun, 06 Nov 2022 10:32:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1orhdH-0000x4-QL
 for qemu-devel@nongnu.org; Sun, 06 Nov 2022 10:32:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667748743;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XVjB/U2WspMJZBRYHArHBEfP1lalAn0AwwelXFXYKSk=;
 b=gkcDVsYWRQUoUVTpdBSRbhUgESb5FYsq+lmQTtN0cr4JUpXS+jCEjzkVY8XRtoKS8KcwIB
 J+Bpl4MkQ9uuT7SXN7r8sN9vkmUO5hVQ06pWKzcJDXRk4AU7/0/2hfEergwGIgfxx9Xf89
 UNCb8XrK76ayPpbc+qQjy+x4fjhqTwQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-358-WUGuD4lWM6WHzLa101tf7w-1; Sun, 06 Nov 2022 10:32:20 -0500
X-MC-Unique: WUGuD4lWM6WHzLa101tf7w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CF380101A528;
 Sun,  6 Nov 2022 15:32:19 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.36])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 64EBE40C6EC4;
 Sun,  6 Nov 2022 15:32:18 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-devel@nongnu.org
Cc: Matthew Rosato <mjrosato@linux.ibm.com>,
 Niklas Schnelle <schnelle@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>
Subject: [PULL 10/12] s390x/pci: RPCIT second pass when mappings exhausted
Date: Sun,  6 Nov 2022 16:31:54 +0100
Message-Id: <20221106153156.620150-11-thuth@redhat.com>
In-Reply-To: <20221106153156.620150-1-thuth@redhat.com>
References: <20221106153156.620150-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Matthew Rosato <mjrosato@linux.ibm.com>

If we encounter a new mapping while the number of available DMA entries
in vfio is 0, we are currently skipping that mapping which is a problem
if we manage to free up DMA space after that within the same RPCIT --
we will return to the guest with CC0 and have not mapped everything
within the specified range.  This issue was uncovered while testing
changes to the s390 linux kernel iommu/dma code, where a different
usage pattern was employed (new mappings start at the end of the
aperture and work back towards the front, making us far more likely
to encounter new mappings before invalidated mappings during a
global refresh).

Fix this by tracking whether any mappings were skipped due to vfio
DMA limit hitting 0; when this occurs, we still continue the range
and unmap/map anything we can - then we must re-run the range again
to pickup anything that was missed.  This must occur in a loop until
all requests are satisfied (success) or we detect that we are still
unable to complete all mappings (return ZPCI_RPCIT_ST_INSUFF_RES).

Link: https://lore.kernel.org/linux-s390/20221019144435.369902-1-schnelle@linux.ibm.com/
Fixes: 37fa32de70 ("s390x/pci: Honor DMA limits set by vfio")
Reported-by: Niklas Schnelle <schnelle@linux.ibm.com>
Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
Message-Id: <20221028194758.204007-2-mjrosato@linux.ibm.com>
Reviewed-by: Eric Farman <farman@linux.ibm.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/s390x/s390-pci-inst.c | 29 ++++++++++++++++++++++-------
 1 file changed, 22 insertions(+), 7 deletions(-)

diff --git a/hw/s390x/s390-pci-inst.c b/hw/s390x/s390-pci-inst.c
index 20a9bcc7af..7cc4bcf850 100644
--- a/hw/s390x/s390-pci-inst.c
+++ b/hw/s390x/s390-pci-inst.c
@@ -677,8 +677,9 @@ int rpcit_service_call(S390CPU *cpu, uint8_t r1, uint8_t r2, uintptr_t ra)
     S390PCIBusDevice *pbdev;
     S390PCIIOMMU *iommu;
     S390IOTLBEntry entry;
-    hwaddr start, end;
+    hwaddr start, end, sstart;
     uint32_t dma_avail;
+    bool again;
 
     if (env->psw.mask & PSW_MASK_PSTATE) {
         s390_program_interrupt(env, PGM_PRIVILEGED, ra);
@@ -691,7 +692,7 @@ int rpcit_service_call(S390CPU *cpu, uint8_t r1, uint8_t r2, uintptr_t ra)
     }
 
     fh = env->regs[r1] >> 32;
-    start = env->regs[r2];
+    sstart = start = env->regs[r2];
     end = start + env->regs[r2 + 1];
 
     pbdev = s390_pci_find_dev_by_fh(s390_get_phb(), fh);
@@ -732,6 +733,9 @@ int rpcit_service_call(S390CPU *cpu, uint8_t r1, uint8_t r2, uintptr_t ra)
         goto err;
     }
 
+ retry:
+    start = sstart;
+    again = false;
     while (start < end) {
         error = s390_guest_io_table_walk(iommu->g_iota, start, &entry);
         if (error) {
@@ -739,13 +743,24 @@ int rpcit_service_call(S390CPU *cpu, uint8_t r1, uint8_t r2, uintptr_t ra)
         }
 
         start += entry.len;
-        while (entry.iova < start && entry.iova < end &&
-               (dma_avail > 0 || entry.perm == IOMMU_NONE)) {
-            dma_avail = s390_pci_update_iotlb(iommu, &entry);
-            entry.iova += TARGET_PAGE_SIZE;
-            entry.translated_addr += TARGET_PAGE_SIZE;
+        while (entry.iova < start && entry.iova < end) {
+            if (dma_avail > 0 || entry.perm == IOMMU_NONE) {
+                dma_avail = s390_pci_update_iotlb(iommu, &entry);
+                entry.iova += TARGET_PAGE_SIZE;
+                entry.translated_addr += TARGET_PAGE_SIZE;
+            } else {
+                /*
+                 * We are unable to make a new mapping at this time, continue
+                 * on and hopefully free up more space.  Then attempt another
+                 * pass.
+                 */
+                again = true;
+                break;
+            }
         }
     }
+    if (again && dma_avail > 0)
+        goto retry;
 err:
     if (error) {
         pbdev->state = ZPCI_FS_ERROR;
-- 
2.31.1


