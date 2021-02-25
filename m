Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7EA9324EDC
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 12:12:34 +0100 (CET)
Received: from localhost ([::1]:37172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFEZN-0000dI-Sn
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 06:12:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lFEIt-0000H5-Cd
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 05:55:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53345)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lFEIr-0005i4-75
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 05:55:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614250528;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lUBZzkWDykKBjWgfFJUd/iE74sH8LuuC3fN/8YEg73E=;
 b=Kge45EldNlamWDyeUh77e5GZ+s1p51lYWgHraIdwoi/lx02Zg2XfCKLZ4zwWGi3QVEykZV
 f3bl5x/VeO0oy78vLc1jyqWI0BB5TYoXa5eYIhe7IbAr9Kz8kX4ZU8a+uyyggswcadumzC
 9Fm+O2MrnH+RmHv3C9LgU5QdzeRO8aw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-207-47np4wKDO2SYHk_rZpw4lQ-1; Thu, 25 Feb 2021 05:55:26 -0500
X-MC-Unique: 47np4wKDO2SYHk_rZpw4lQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8F0DB18B614C;
 Thu, 25 Feb 2021 10:55:24 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-112-150.ams2.redhat.com [10.36.112.150])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 03A055D9D7;
 Thu, 25 Feb 2021 10:55:18 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, mst@redhat.com,
 alex.williamson@redhat.com, jacob.jun.pan@linux.intel.com,
 yi.l.liu@intel.com
Subject: [RFC v8 13/28] vfio: Introduce helpers to DMA map/unmap a RAM section
Date: Thu, 25 Feb 2021 11:52:18 +0100
Message-Id: <20210225105233.650545-14-eric.auger@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
index 7d3c35a0ed..e02fb2a3ef 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -667,13 +667,126 @@ hostwin_from_range(VFIOContainer *container, hwaddr iova, hwaddr end)
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
@@ -818,39 +931,7 @@ static void vfio_listener_region_add(MemoryListener *listener,
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
 
@@ -884,10 +965,6 @@ static void vfio_listener_region_del(MemoryListener *listener,
                                      MemoryRegionSection *section)
 {
     VFIOContainer *container = container_of(listener, VFIOContainer, listener);
-    hwaddr iova, end;
-    Int128 llend, llsize;
-    int ret;
-    bool try_unmap = true;
 
     if (vfio_listener_skipped_section(section)) {
         trace_vfio_listener_region_del_skip(
@@ -926,49 +1003,7 @@ static void vfio_listener_region_del(MemoryListener *listener,
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
index c17ad82aa4..304c1d8b19 100644
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
 vfio_connect_existing_container(int groupid, int container_fd) "group=%d existing container fd=%d"
 vfio_connect_new_container(int groupid, int container_fd) "group=%d new container fd=%d"
-- 
2.26.2


