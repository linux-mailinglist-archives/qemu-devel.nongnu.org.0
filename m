Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC2F2B4F24
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 19:23:36 +0100 (CET)
Received: from localhost ([::1]:52394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kejA7-0001HH-GV
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 13:23:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1kej32-00011D-Rg
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 13:16:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38271)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1kej30-0001K1-LV
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 13:16:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605550573;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZTDjrvRtD1VnqM9B+mmeDZvd0qJzAXWpZeRWrOAq88s=;
 b=T1PH09SA/YWUCo5VHEG0fXODtix9aAiUGZD2OugX7O1Je0aSD6vGMRTUqWumnR8ZszNc8M
 nlndVgM+fXUN3ICKklX/M152gVu+UkZU+mqohm9EW+mJkDrFQjnDW3/j0vyL6FaSECGm2c
 F0fLqCZl/Ld6x1/1Fl59e0GDx4UnKdk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-172-G4ej49cONqO3Eatj6jfN5A-1; Mon, 16 Nov 2020 13:16:12 -0500
X-MC-Unique: G4ej49cONqO3Eatj6jfN5A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4D23E6D241;
 Mon, 16 Nov 2020 18:16:10 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-113-230.ams2.redhat.com [10.36.113.230])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 71F1E5C1CF;
 Mon, 16 Nov 2020 18:15:49 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, alex.williamson@redhat.com
Subject: [RFC v7 11/26] vfio: Introduce helpers to DMA map/unmap a RAM section
Date: Mon, 16 Nov 2020 19:13:34 +0100
Message-Id: <20201116181349.11908-12-eric.auger@redhat.com>
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
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eric.auger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 04:46:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Let's introduce two helpers that allow to DMA map/unmap a RAM
section. Those helpers will be called for nested stage setup in
another call site. Also the vfio_listener_region_add/del()
structure may be clearer.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v5 -> v6:
- add Error **
---
 hw/vfio/common.c     | 199 +++++++++++++++++++++++++------------------
 hw/vfio/trace-events |   4 +-
 2 files changed, 119 insertions(+), 84 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 18e8aa0d56..a9e3c77863 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -664,13 +664,126 @@ hostwin_from_range(VFIOContainer *container, hwaddr iova, hwaddr end)
     return NULL;
 }
 
+static int vfio_dma_map_ram_section(VFIOContainer *container,
+                                    MemoryRegionSection *section, Error **err)
+{
+    VFIOHostDMAWindow *hostwin;
+    Int128 llend, llsize;
+    hwaddr iova, end;
+    void *vaddr;
+    int ret;
+
+    assert(memory_region_is_ram(section->mr));
+
+    iova = TARGET_PAGE_ALIGN(section->offset_within_address_space);
+    llend = int128_make64(section->offset_within_address_space);
+    llend = int128_add(llend, section->size);
+    llend = int128_and(llend, int128_exts64(TARGET_PAGE_MASK));
+    end = int128_get64(int128_sub(llend, int128_one()));
+
+    vaddr = memory_region_get_ram_ptr(section->mr) +
+            section->offset_within_region +
+            (iova - section->offset_within_address_space);
+
+    hostwin = hostwin_from_range(container, iova, end);
+    if (!hostwin) {
+        error_setg(err, "Container %p can't map guest IOVA region"
+                   " 0x%"HWADDR_PRIx"..0x%"HWADDR_PRIx, container, iova, end);
+        return -EFAULT;
+    }
+
+    trace_vfio_dma_map_ram(iova, end, vaddr);
+
+    llsize = int128_sub(llend, int128_make64(iova));
+
+    if (memory_region_is_ram_device(section->mr)) {
+        hwaddr pgmask = (1ULL << ctz64(hostwin->iova_pgsizes)) - 1;
+
+        if ((iova & pgmask) || (int128_get64(llsize) & pgmask)) {
+            trace_vfio_listener_region_add_no_dma_map(
+                memory_region_name(section->mr),
+                section->offset_within_address_space,
+                int128_getlo(section->size),
+                pgmask + 1);
+            return 0;
+        }
+    }
+
+    ret = vfio_dma_map(container, iova, int128_get64(llsize),
+                       vaddr, section->readonly);
+    if (ret) {
+        error_setg(err, "vfio_dma_map(%p, 0x%"HWADDR_PRIx", "
+                   "0x%"HWADDR_PRIx", %p) = %d (%m)",
+                   container, iova, int128_get64(llsize), vaddr, ret);
+        if (memory_region_is_ram_device(section->mr)) {
+            /* Allow unexpected mappings not to be fatal for RAM devices */
+            error_report_err(*err);
+            return 0;
+        }
+        return ret;
+    }
+    return 0;
+}
+
+static void vfio_dma_unmap_ram_section(VFIOContainer *container,
+                                       MemoryRegionSection *section)
+{
+    Int128 llend, llsize;
+    hwaddr iova, end;
+    bool try_unmap = true;
+    int ret;
+
+    iova = TARGET_PAGE_ALIGN(section->offset_within_address_space);
+    llend = int128_make64(section->offset_within_address_space);
+    llend = int128_add(llend, section->size);
+    llend = int128_and(llend, int128_exts64(TARGET_PAGE_MASK));
+
+    if (int128_ge(int128_make64(iova), llend)) {
+        return;
+    }
+    end = int128_get64(int128_sub(llend, int128_one()));
+
+    llsize = int128_sub(llend, int128_make64(iova));
+
+    trace_vfio_dma_unmap_ram(iova, end);
+
+    if (memory_region_is_ram_device(section->mr)) {
+        hwaddr pgmask;
+        VFIOHostDMAWindow *hostwin = hostwin_from_range(container, iova, end);
+
+        assert(hostwin); /* or region_add() would have failed */
+
+        pgmask = (1ULL << ctz64(hostwin->iova_pgsizes)) - 1;
+        try_unmap = !((iova & pgmask) || (int128_get64(llsize) & pgmask));
+    }
+
+    if (try_unmap) {
+        if (int128_eq(llsize, int128_2_64())) {
+            /* The unmap ioctl doesn't accept a full 64-bit span. */
+            llsize = int128_rshift(llsize, 1);
+            ret = vfio_dma_unmap(container, iova, int128_get64(llsize), NULL);
+            if (ret) {
+                error_report("vfio_dma_unmap(%p, 0x%"HWADDR_PRIx", "
+                             "0x%"HWADDR_PRIx") = %d (%m)",
+                             container, iova, int128_get64(llsize), ret);
+            }
+            iova += int128_get64(llsize);
+        }
+        ret = vfio_dma_unmap(container, iova, int128_get64(llsize), NULL);
+        if (ret) {
+            error_report("vfio_dma_unmap(%p, 0x%"HWADDR_PRIx", "
+                         "0x%"HWADDR_PRIx") = %d (%m)",
+                         container, iova, int128_get64(llsize), ret);
+        }
+    }
+}
+
 static void vfio_listener_region_add(MemoryListener *listener,
                                      MemoryRegionSection *section)
 {
     VFIOContainer *container = container_of(listener, VFIOContainer, listener);
     hwaddr iova, end;
-    Int128 llend, llsize;
-    void *vaddr;
+    Int128 llend;
     int ret;
     VFIOHostDMAWindow *hostwin;
     Error *err = NULL;
@@ -815,39 +928,7 @@ static void vfio_listener_region_add(MemoryListener *listener,
     }
 
     /* Here we assume that memory_region_is_ram(section->mr)==true */
-
-    vaddr = memory_region_get_ram_ptr(section->mr) +
-            section->offset_within_region +
-            (iova - section->offset_within_address_space);
-
-    trace_vfio_listener_region_add_ram(iova, end, vaddr);
-
-    llsize = int128_sub(llend, int128_make64(iova));
-
-    if (memory_region_is_ram_device(section->mr)) {
-        hwaddr pgmask = (1ULL << ctz64(hostwin->iova_pgsizes)) - 1;
-
-        if ((iova & pgmask) || (int128_get64(llsize) & pgmask)) {
-            trace_vfio_listener_region_add_no_dma_map(
-                memory_region_name(section->mr),
-                section->offset_within_address_space,
-                int128_getlo(section->size),
-                pgmask + 1);
-            return;
-        }
-    }
-
-    ret = vfio_dma_map(container, iova, int128_get64(llsize),
-                       vaddr, section->readonly);
-    if (ret) {
-        error_setg(&err, "vfio_dma_map(%p, 0x%"HWADDR_PRIx", "
-                   "0x%"HWADDR_PRIx", %p) = %d (%m)",
-                   container, iova, int128_get64(llsize), vaddr, ret);
-        if (memory_region_is_ram_device(section->mr)) {
-            /* Allow unexpected mappings not to be fatal for RAM devices */
-            error_report_err(err);
-            return;
-        }
+    if (vfio_dma_map_ram_section(container, section, &err)) {
         goto fail;
     }
 
@@ -881,10 +962,6 @@ static void vfio_listener_region_del(MemoryListener *listener,
                                      MemoryRegionSection *section)
 {
     VFIOContainer *container = container_of(listener, VFIOContainer, listener);
-    hwaddr iova, end;
-    Int128 llend, llsize;
-    int ret;
-    bool try_unmap = true;
 
     if (vfio_listener_skipped_section(section)) {
         trace_vfio_listener_region_del_skip(
@@ -923,49 +1000,7 @@ static void vfio_listener_region_del(MemoryListener *listener,
          */
     }
 
-    iova = TARGET_PAGE_ALIGN(section->offset_within_address_space);
-    llend = int128_make64(section->offset_within_address_space);
-    llend = int128_add(llend, section->size);
-    llend = int128_and(llend, int128_exts64(TARGET_PAGE_MASK));
-
-    if (int128_ge(int128_make64(iova), llend)) {
-        return;
-    }
-    end = int128_get64(int128_sub(llend, int128_one()));
-
-    llsize = int128_sub(llend, int128_make64(iova));
-
-    trace_vfio_listener_region_del(iova, end);
-
-    if (memory_region_is_ram_device(section->mr)) {
-        hwaddr pgmask;
-        VFIOHostDMAWindow *hostwin = hostwin_from_range(container, iova, end);
-
-        assert(hostwin); /* or region_add() would have failed */
-
-        pgmask = (1ULL << ctz64(hostwin->iova_pgsizes)) - 1;
-        try_unmap = !((iova & pgmask) || (int128_get64(llsize) & pgmask));
-    }
-
-    if (try_unmap) {
-        if (int128_eq(llsize, int128_2_64())) {
-            /* The unmap ioctl doesn't accept a full 64-bit span. */
-            llsize = int128_rshift(llsize, 1);
-            ret = vfio_dma_unmap(container, iova, int128_get64(llsize), NULL);
-            if (ret) {
-                error_report("vfio_dma_unmap(%p, 0x%"HWADDR_PRIx", "
-                             "0x%"HWADDR_PRIx") = %d (%m)",
-                             container, iova, int128_get64(llsize), ret);
-            }
-            iova += int128_get64(llsize);
-        }
-        ret = vfio_dma_unmap(container, iova, int128_get64(llsize), NULL);
-        if (ret) {
-            error_report("vfio_dma_unmap(%p, 0x%"HWADDR_PRIx", "
-                         "0x%"HWADDR_PRIx") = %d (%m)",
-                         container, iova, int128_get64(llsize), ret);
-        }
-    }
+    vfio_dma_unmap_ram_section(container, section);
 
     memory_region_unref(section->mr);
 
diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
index c0e75f24b7..fae7026cd7 100644
--- a/hw/vfio/trace-events
+++ b/hw/vfio/trace-events
@@ -99,10 +99,10 @@ vfio_iommu_map_notify(const char *op, uint64_t iova_start, uint64_t iova_end) "i
 vfio_listener_region_add_skip(uint64_t start, uint64_t end) "SKIPPING region_add 0x%"PRIx64" - 0x%"PRIx64
 vfio_spapr_group_attach(int groupfd, int tablefd) "Attached groupfd %d to liobn fd %d"
 vfio_listener_region_add_iommu(uint64_t start, uint64_t end) "region_add [iommu] 0x%"PRIx64" - 0x%"PRIx64
-vfio_listener_region_add_ram(uint64_t iova_start, uint64_t iova_end, void *vaddr) "region_add [ram] 0x%"PRIx64" - 0x%"PRIx64" [%p]"
+vfio_dma_map_ram(uint64_t iova_start, uint64_t iova_end, void *vaddr) "region_add [ram] 0x%"PRIx64" - 0x%"PRIx64" [%p]"
 vfio_listener_region_add_no_dma_map(const char *name, uint64_t iova, uint64_t size, uint64_t page_size) "Region \"%s\" 0x%"PRIx64" size=0x%"PRIx64" is not aligned to 0x%"PRIx64" and cannot be mapped for DMA"
 vfio_listener_region_del_skip(uint64_t start, uint64_t end) "SKIPPING region_del 0x%"PRIx64" - 0x%"PRIx64
-vfio_listener_region_del(uint64_t start, uint64_t end) "region_del 0x%"PRIx64" - 0x%"PRIx64
+vfio_dma_unmap_ram(uint64_t start, uint64_t end) "region_del 0x%"PRIx64" - 0x%"PRIx64
 vfio_disconnect_container(int fd) "close container->fd=%d"
 vfio_put_group(int fd) "close group->fd=%d"
 vfio_get_device(const char * name, unsigned int flags, unsigned int num_regions, unsigned int num_irqs) "Device %s flags: %u, regions: %u, irqs: %u"
-- 
2.21.3


