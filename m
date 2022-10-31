Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A32C612F3F
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 04:11:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opLCF-0004MC-7L; Sun, 30 Oct 2022 23:10:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1opLCA-0004Lv-TZ
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 23:10:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1opLC9-0001eu-5K
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 23:10:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667185836;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HZ8yOKor55XVFkOWfS2fwDsLvRJh0D3DhkHFOEfNyPQ=;
 b=btCLBa0eAp8Ss9XOQIdaK0k0sxW1hfilRaPCBe17Z0plapaeQeTLOiSLzWDkP225OFuj1E
 OSaL7nv/mEkWU/psyzQwEhNbwsyK9KjGKjDC7Dyrvsy5mfe/1xXvAfxn0R32dbeslvC3Ei
 MXGX5AYw8H6wP2Nei6Ht9g71U8eovMA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-643-1OvxIZlzODaWMefUfdChIw-1; Sun, 30 Oct 2022 23:10:33 -0400
X-MC-Unique: 1OvxIZlzODaWMefUfdChIw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A7F611C05B00;
 Mon, 31 Oct 2022 03:10:32 +0000 (UTC)
Received: from server.redhat.com (ovpn-12-79.pek2.redhat.com [10.72.12.79])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 58A5818EB4;
 Mon, 31 Oct 2022 03:10:28 +0000 (UTC)
From: Cindy Lu <lulu@redhat.com>
To: lulu@redhat.com, alex.williamson@redhat.com, jasowang@redhat.com,
 mst@redhat.com, pbonzini@redhat.com, peterx@redhat.com, david@redhat.com,
 f4bug@amsat.org, sgarzare@redhat.com
Cc: qemu-devel@nongnu.org
Subject: [PATCH v9 1/2] vfio: move implement of vfio_get_xlat_addr() to
 memory.c
Date: Mon, 31 Oct 2022 11:10:19 +0800
Message-Id: <20221031031020.1405111-2-lulu@redhat.com>
In-Reply-To: <20221031031020.1405111-1-lulu@redhat.com>
References: <20221031031020.1405111-1-lulu@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lulu@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.055,
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

- Move the implement vfio_get_xlat_addr to softmmu/memory.c, and
  change the name to memory_get_xlat_addr(). So we can use this
  function on other devices, such as vDPA device.
- Add a new function vfio_get_xlat_addr in vfio/common.c, and it will check
  whether the memory is backed by a discard manager. then device can
  have its own warning.

Signed-off-by: Cindy Lu <lulu@redhat.com>
---
 hw/vfio/common.c      | 66 +++------------------------------------
 include/exec/memory.h |  4 +++
 softmmu/memory.c      | 72 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 81 insertions(+), 61 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index ace9562a9b..6bc02b32c8 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -578,45 +578,11 @@ static bool vfio_listener_skipped_section(MemoryRegionSection *section)
 static bool vfio_get_xlat_addr(IOMMUTLBEntry *iotlb, void **vaddr,
                                ram_addr_t *ram_addr, bool *read_only)
 {
-    MemoryRegion *mr;
-    hwaddr xlat;
-    hwaddr len = iotlb->addr_mask + 1;
-    bool writable = iotlb->perm & IOMMU_WO;
-
-    /*
-     * The IOMMU TLB entry we have just covers translation through
-     * this IOMMU to its immediate target.  We need to translate
-     * it the rest of the way through to memory.
-     */
-    mr = address_space_translate(&address_space_memory,
-                                 iotlb->translated_addr,
-                                 &xlat, &len, writable,
-                                 MEMTXATTRS_UNSPECIFIED);
-    if (!memory_region_is_ram(mr)) {
-        error_report("iommu map to non memory area %"HWADDR_PRIx"",
-                     xlat);
-        return false;
-    } else if (memory_region_has_ram_discard_manager(mr)) {
-        RamDiscardManager *rdm = memory_region_get_ram_discard_manager(mr);
-        MemoryRegionSection tmp = {
-            .mr = mr,
-            .offset_within_region = xlat,
-            .size = int128_make64(len),
-        };
-
-        /*
-         * Malicious VMs can map memory into the IOMMU, which is expected
-         * to remain discarded. vfio will pin all pages, populating memory.
-         * Disallow that. vmstate priorities make sure any RamDiscardManager
-         * were already restored before IOMMUs are restored.
-         */
-        if (!ram_discard_manager_is_populated(rdm, &tmp)) {
-            error_report("iommu map to discarded memory (e.g., unplugged via"
-                         " virtio-mem): %"HWADDR_PRIx"",
-                         iotlb->translated_addr);
-            return false;
-        }
+    bool ret, mr_has_discard_manager;
 
+    ret = memory_get_xlat_addr(iotlb, vaddr, ram_addr, read_only,
+                               &mr_has_discard_manager);
+    if (ret && mr_has_discard_manager) {
         /*
          * Malicious VMs might trigger discarding of IOMMU-mapped memory. The
          * pages will remain pinned inside vfio until unmapped, resulting in a
@@ -635,29 +601,7 @@ static bool vfio_get_xlat_addr(IOMMUTLBEntry *iotlb, void **vaddr,
                          " intended via an IOMMU. It's possible to mitigate "
                          " by setting/adjusting RLIMIT_MEMLOCK.");
     }
-
-    /*
-     * Translation truncates length to the IOMMU page size,
-     * check that it did not truncate too much.
-     */
-    if (len & iotlb->addr_mask) {
-        error_report("iommu has granularity incompatible with target AS");
-        return false;
-    }
-
-    if (vaddr) {
-        *vaddr = memory_region_get_ram_ptr(mr) + xlat;
-    }
-
-    if (ram_addr) {
-        *ram_addr = memory_region_get_ram_addr(mr) + xlat;
-    }
-
-    if (read_only) {
-        *read_only = !writable || mr->readonly;
-    }
-
-    return true;
+    return ret;
 }
 
 static void vfio_iommu_map_notify(IOMMUNotifier *n, IOMMUTLBEntry *iotlb)
diff --git a/include/exec/memory.h b/include/exec/memory.h
index bfb1de8eea..d1e79c39dc 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -713,6 +713,10 @@ void ram_discard_manager_register_listener(RamDiscardManager *rdm,
 void ram_discard_manager_unregister_listener(RamDiscardManager *rdm,
                                              RamDiscardListener *rdl);
 
+bool memory_get_xlat_addr(IOMMUTLBEntry *iotlb, void **vaddr,
+                          ram_addr_t *ram_addr, bool *read_only,
+                          bool *mr_has_discard_manager);
+
 typedef struct CoalescedMemoryRange CoalescedMemoryRange;
 typedef struct MemoryRegionIoeventfd MemoryRegionIoeventfd;
 
diff --git a/softmmu/memory.c b/softmmu/memory.c
index 7ba2048836..bc0be3f62c 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -33,6 +33,7 @@
 #include "qemu/accel.h"
 #include "hw/boards.h"
 #include "migration/vmstate.h"
+#include "exec/address-spaces.h"
 
 //#define DEBUG_UNASSIGNED
 
@@ -2121,6 +2122,77 @@ void ram_discard_manager_unregister_listener(RamDiscardManager *rdm,
     rdmc->unregister_listener(rdm, rdl);
 }
 
+/* Called with rcu_read_lock held.  */
+bool memory_get_xlat_addr(IOMMUTLBEntry *iotlb, void **vaddr,
+                          ram_addr_t *ram_addr, bool *read_only,
+                          bool *mr_has_discard_manager)
+{
+    MemoryRegion *mr;
+    hwaddr xlat;
+    hwaddr len = iotlb->addr_mask + 1;
+    bool writable = iotlb->perm & IOMMU_WO;
+
+    if (mr_has_discard_manager) {
+        *mr_has_discard_manager = false;
+    }
+    /*
+     * The IOMMU TLB entry we have just covers translation through
+     * this IOMMU to its immediate target.  We need to translate
+     * it the rest of the way through to memory.
+     */
+    mr = address_space_translate(&address_space_memory, iotlb->translated_addr,
+                                 &xlat, &len, writable, MEMTXATTRS_UNSPECIFIED);
+    if (!memory_region_is_ram(mr)) {
+        error_report("iommu map to non memory area %" HWADDR_PRIx "", xlat);
+        return false;
+    } else if (memory_region_has_ram_discard_manager(mr)) {
+        RamDiscardManager *rdm = memory_region_get_ram_discard_manager(mr);
+        MemoryRegionSection tmp = {
+            .mr = mr,
+            .offset_within_region = xlat,
+            .size = int128_make64(len),
+        };
+        if (mr_has_discard_manager) {
+            *mr_has_discard_manager = true;
+        }
+        /*
+         * Malicious VMs can map memory into the IOMMU, which is expected
+         * to remain discarded. vfio will pin all pages, populating memory.
+         * Disallow that. vmstate priorities make sure any RamDiscardManager
+         * were already restored before IOMMUs are restored.
+         */
+        if (!ram_discard_manager_is_populated(rdm, &tmp)) {
+            error_report("iommu map to discarded memory (e.g., unplugged via"
+                         " virtio-mem): %" HWADDR_PRIx "",
+                         iotlb->translated_addr);
+            return false;
+        }
+    }
+
+    /*
+     * Translation truncates length to the IOMMU page size,
+     * check that it did not truncate too much.
+     */
+    if (len & iotlb->addr_mask) {
+        error_report("iommu has granularity incompatible with target AS");
+        return false;
+    }
+
+    if (vaddr) {
+        *vaddr = memory_region_get_ram_ptr(mr) + xlat;
+    }
+
+    if (ram_addr) {
+        *ram_addr = memory_region_get_ram_addr(mr) + xlat;
+    }
+
+    if (read_only) {
+        *read_only = !writable || mr->readonly;
+    }
+
+    return true;
+}
+
 void memory_region_set_log(MemoryRegion *mr, bool log, unsigned client)
 {
     uint8_t mask = 1 << client;
-- 
2.34.3


