Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63998616871
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 17:21:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqGMI-0005fj-CL; Wed, 02 Nov 2022 12:12:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqGLs-0004CJ-6e
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:12:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqGLe-0004OV-In
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:12:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667405533;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IfL6SHmg5dVVmYdI1zEg58udLmK7Hd47WwrnWpDNWrs=;
 b=KRPBsZ9lb1iBFHLXEbPPzmzn5d/yyZk0dIa0/WJQqlyKs1bYo10u9UQSZPV1ZHPdR1SfsT
 +/8AXbBNRlcmMDn6dIQINxAN0LuvwEfYH7gEZkwvsv4t2ATFbZvIFyQ6efaCTRLayMNhvZ
 bRJl6VMjP/pahjphETve1AxD+QooOhY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-392-qHF67suUNRKjl2GZae9yVw-1; Wed, 02 Nov 2022 12:12:12 -0400
X-MC-Unique: qHF67suUNRKjl2GZae9yVw-1
Received: by mail-wm1-f72.google.com with SMTP id
 i128-20020a1c3b86000000b003cf4ff1b917so8104659wma.2
 for <qemu-devel@nongnu.org>; Wed, 02 Nov 2022 09:12:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IfL6SHmg5dVVmYdI1zEg58udLmK7Hd47WwrnWpDNWrs=;
 b=WKcE+WXOurtB7c/8ZkSDIWaZ6Fl+LGFkuUN2+HvM3X5034kz52qU3MlMm+mQFb5tMV
 OjJ5Xd2J1I1IHvRc0R6qkFA0dDt+a/l13eKj9HY/xOjS+/QNNXTyQP+OS2XvhRPJUUU4
 Mmm/0vbswXocHMnLzZjuVWi69CTLVB52YD7wnt1YxVifoVgDn3opyc6DO0TZlfNHDEkW
 1cl6mfuSgL/IcFpB2+GI2mMqZATz1aPB1ravNIgHzRkqXDtAbEZMHThATmeXKlFi1E7+
 DIUJMxz6UFVyIQmsIWTEGnvvJ1d5amas5CpOATrzcTvSc4/nqJDc4eugUPt0LUHFLVwG
 kKhQ==
X-Gm-Message-State: ACrzQf1FGzAowsYmQ0NhkoIQa8uWf9F6eOmxOJedwAlJN5e3ZSD3XYoP
 /0WirJNGYmvvtX4Gq9hMj9w8azZXkIkM4H8/uX8ovPW2yLW1/6d/PjT+dpOZQ5v1qlDib0diNAQ
 /aNs9LdL9mbPQeCfFeqD+sFYSsF3pBD8d6D22m0fJixTMxT9yY5mp5g8KaoOc
X-Received: by 2002:adf:b304:0:b0:236:debd:f6ef with SMTP id
 j4-20020adfb304000000b00236debdf6efmr7570104wrd.213.1667405531080; 
 Wed, 02 Nov 2022 09:12:11 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4uYLZ2016qiffwHkpDwuQeBMF07vvSGToHiAXm+o5ZravhwWMev2Nn9BYXcp4DuT3ZO1qwuA==
X-Received: by 2002:adf:b304:0:b0:236:debd:f6ef with SMTP id
 j4-20020adfb304000000b00236debdf6efmr7570060wrd.213.1667405530672; 
 Wed, 02 Nov 2022 09:12:10 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 e7-20020adff347000000b00226dba960b4sm13325858wrp.3.2022.11.02.09.12.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 09:12:10 -0700 (PDT)
Date: Wed, 2 Nov 2022 12:12:08 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Cindy Lu <lulu@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL v2 78/82] vfio: move implement of vfio_get_xlat_addr() to
 memory.c
Message-ID: <20221102160336.616599-79-mst@redhat.com>
References: <20221102160336.616599-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221102160336.616599-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
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

From: Cindy Lu <lulu@redhat.com>

- Move the implement vfio_get_xlat_addr to softmmu/memory.c, and
  change the name to memory_get_xlat_addr(). So we can use this
  function on other devices, such as vDPA device.
- Add a new function vfio_get_xlat_addr in vfio/common.c, and it will check
  whether the memory is backed by a discard manager. then device can
  have its own warning.

Signed-off-by: Cindy Lu <lulu@redhat.com>
Message-Id: <20221031031020.1405111-2-lulu@redhat.com>
Acked-by: Alex Williamson <alex.williamson@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/exec/memory.h |  4 +++
 hw/vfio/common.c      | 66 +++------------------------------------
 softmmu/memory.c      | 72 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 81 insertions(+), 61 deletions(-)

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
 
diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 6b5d8c0bf6..130e5d1dc7 100644
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
MST


