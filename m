Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6D461DC92
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Nov 2022 18:39:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orMr7-0001B2-W8; Sat, 05 Nov 2022 13:21:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orMp7-0007na-QC
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 13:19:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orMp6-0007pq-2c
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 13:19:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667668751;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IfL6SHmg5dVVmYdI1zEg58udLmK7Hd47WwrnWpDNWrs=;
 b=SDURyzLjVeYdwY7IYSTXFSiOlo2tIqTyhh8IjRM8HIFRAXVRNjNoxhZ0viYHMuTUWdnxJt
 spQLQdtSr9hVVDW/5DhGLQjW5+74CVKyGh2lGYYvK7wJipUXiBGunBDySB9WSTyQUqp+Fz
 ZEpkNsQSjL+P+6zeb2sNlGvU+uqT7uA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-423-QImkhriiNCKW6dGeK8tcYg-1; Sat, 05 Nov 2022 13:19:09 -0400
X-MC-Unique: QImkhriiNCKW6dGeK8tcYg-1
Received: by mail-wm1-f70.google.com with SMTP id
 r187-20020a1c44c4000000b003c41e9ae97dso5992532wma.6
 for <qemu-devel@nongnu.org>; Sat, 05 Nov 2022 10:19:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IfL6SHmg5dVVmYdI1zEg58udLmK7Hd47WwrnWpDNWrs=;
 b=YXkaJoqB70ttWtYTQoqPBaVzs6rr42AY+lv9suXSpYaoXb+nSd4N4nxKPIlrCzEXCk
 fwUgjAsFvqaDZnZsHTi1GgeX+wUu62Ug0dWT0sob1VFnfZ0fC7L1i0BBJJ9Dp+8vWjSO
 Uu3fl2oBT/MeVJOh2e1/aiJ+7InkEsV7Uzlp+Wv1T/rXdwAQh7QzuUB/NeNT8Ea1D1aa
 EctenLmhqQo93u6qh2lI5baVeSNfn1tsCDTT0bCmLnZbN0CbLzxm7yLnAIYdNFsXur1L
 S+eck4uGw69djNR64ziIm5IvUvsrEYLsRU7/TQsZwdUvgUdEgduRhpJpqvrnDaD4TQY5
 zKqg==
X-Gm-Message-State: ACrzQf1rY3ida7xed3xf4d9W3X9d4/B74SEUNaZcy9I6JxNB80qjW/5x
 i3fS4mvl0E7POSe2kxN5+YIqvR4LFbNxltAqCtVBxhNTXaiaWjzG2c5H/NkS0QppfF+WM0dRPA3
 IY5FETDP51Vek13b8pTyNxOmA7JdmZrXxrNteHlCEnopgIX140sms2zNa7kxY
X-Received: by 2002:a5d:534b:0:b0:236:73ff:3605 with SMTP id
 t11-20020a5d534b000000b0023673ff3605mr25337481wrv.521.1667668748013; 
 Sat, 05 Nov 2022 10:19:08 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7B/jmSRihqPnncEz257t/Dr9p9GOXTdUVr5p/UY0AIXgm7J9ur2BVM2/XgsO6hzs4D+4R38A==
X-Received: by 2002:a5d:534b:0:b0:236:73ff:3605 with SMTP id
 t11-20020a5d534b000000b0023673ff3605mr25337458wrv.521.1667668747667; 
 Sat, 05 Nov 2022 10:19:07 -0700 (PDT)
Received: from redhat.com ([2.52.152.137]) by smtp.gmail.com with ESMTPSA id
 n4-20020a5d6604000000b002366fb99cdasm2551530wru.50.2022.11.05.10.19.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Nov 2022 10:19:07 -0700 (PDT)
Date: Sat, 5 Nov 2022 13:19:04 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Cindy Lu <lulu@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL v3 75/81] vfio: move implement of vfio_get_xlat_addr() to
 memory.c
Message-ID: <20221105171116.432921-76-mst@redhat.com>
References: <20221105171116.432921-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221105171116.432921-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.045,
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


