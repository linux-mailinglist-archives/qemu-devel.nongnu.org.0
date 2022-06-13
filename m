Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C53C547F7E
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 08:27:59 +0200 (CEST)
Received: from localhost ([::1]:59972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0dYM-0008JC-0Q
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 02:27:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1o0dOE-0000O8-HH
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 02:17:35 -0400
Received: from mga03.intel.com ([134.134.136.65]:32802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1o0dO7-0005Vn-DL
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 02:17:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655101043; x=1686637043;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=G1zy6HmWRUDuak6diXLvKP8K5XiF2nvpwOl/f8NnAH4=;
 b=YxJpKH7NKW4KniLFTbsG9BsxHiWRHOeA9AC5vkSJFHrQcN/Kh11S4orR
 ZdpqTplB2ByXMhXlS0jtr6eOBDhLKNaX/46p4Lm5nXszV35P63VuFOkZo
 ptAeeSjwnsCj6DwfI8haaw92FN8ErqY1ah8a4oJRdjS3DyZitobzXubFS
 8vRJC/+BXnCnnr6GnDefqaMSy5i8/pJtIPpU5G2+/BUwm5v/PdWl5rINk
 s1AO/WWpmgTFYt7nXI2ljWyiJ9tdUGNjTajf1zz+8c3LYgISl46ZKgO0d
 Pc3EYe3nOIzxdUEjqHd7UMXAESBoaWtCVtROTmM3OXVrWaNZGCKx6Z0xi w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10376"; a="279229906"
X-IronPort-AV: E=Sophos;i="5.91,296,1647327600"; d="scan'208";a="279229906"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2022 23:17:16 -0700
X-IronPort-AV: E=Sophos;i="5.91,296,1647327600"; d="scan'208";a="910205018"
Received: from duan-server-s2600bt.bj.intel.com ([10.240.192.123])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2022 23:17:13 -0700
From: Zhenzhong Duan <zhenzhong.duan@intel.com>
To: eric.auger@redhat.com
Cc: qemu-devel@nongnu.org, mst@redhat.com, jean-philippe@linaro.org,
 pbonzini@redhat.com, yu.c.zhang@intel.com, chuanxiao.dong@intel.com,
 tina.zhang@intel.com
Subject: [PATCH 1/3] virtio-iommu: Add bypass mode support to assigned device
Date: Mon, 13 Jun 2022 14:10:08 +0800
Message-Id: <20220613061010.2674054-2-zhenzhong.duan@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220613061010.2674054-1-zhenzhong.duan@intel.com>
References: <20220613061010.2674054-1-zhenzhong.duan@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.65;
 envelope-from=zhenzhong.duan@intel.com; helo=mga03.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Currently assigned devices can not work in virtio-iommu bypass mode.
Guest driver fails to probe the device due to DMA failure. And the
reason is because of lacking GPA -> HPA mappings when VM is created.

Add a root container memory region to hold both bypass memory region
and iommu memory region, so the switch between them is supported
just like the implementation in virtual VT-d.

Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
---
 hw/virtio/trace-events           |   1 +
 hw/virtio/virtio-iommu.c         | 115 ++++++++++++++++++++++++++++++-
 include/hw/virtio/virtio-iommu.h |   2 +
 3 files changed, 116 insertions(+), 2 deletions(-)

diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
index ab8e095b73fa..20af2e7ebd78 100644
--- a/hw/virtio/trace-events
+++ b/hw/virtio/trace-events
@@ -124,6 +124,7 @@ virtio_iommu_remap(const char *name, uint64_t virt_start, uint64_t virt_end, uin
 virtio_iommu_set_page_size_mask(const char *name, uint64_t old, uint64_t new) "mr=%s old_mask=0x%"PRIx64" new_mask=0x%"PRIx64
 virtio_iommu_notify_flag_add(const char *name) "add notifier to mr %s"
 virtio_iommu_notify_flag_del(const char *name) "del notifier from mr %s"
+virtio_iommu_switch_address_space(uint8_t bus, uint8_t slot, uint8_t fn, bool on) "Device %02x:%02x.%x switching address space (iommu enabled=%d)"
 
 # virtio-mem.c
 virtio_mem_send_response(uint16_t type) "type=%" PRIu16
diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 2597e166f939..ff718107ee02 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -69,6 +69,77 @@ static inline uint16_t virtio_iommu_get_bdf(IOMMUDevice *dev)
     return PCI_BUILD_BDF(pci_bus_num(dev->bus), dev->devfn);
 }
 
+static bool virtio_iommu_device_bypassed(IOMMUDevice *sdev)
+{
+    uint32_t sid;
+    bool bypassed;
+    VirtIOIOMMU *s = sdev->viommu;
+    VirtIOIOMMUEndpoint *ep;
+
+    sid = virtio_iommu_get_bdf(sdev);
+
+    qemu_mutex_lock(&s->mutex);
+    /* need to check bypass before system reset */
+    if (!s->endpoints) {
+        bypassed = s->config.bypass;
+        goto unlock;
+    }
+
+    ep = g_tree_lookup(s->endpoints, GUINT_TO_POINTER(sid));
+    if (!ep || !ep->domain) {
+        bypassed = s->config.bypass;
+    } else {
+        bypassed = ep->domain->bypass;
+    }
+
+unlock:
+    qemu_mutex_unlock(&s->mutex);
+    return bypassed;
+}
+
+/* Return whether the device is using IOMMU translation. */
+static bool virtio_iommu_switch_address_space(IOMMUDevice *sdev)
+{
+    bool use_remapping;
+
+    assert(sdev);
+
+    use_remapping = !virtio_iommu_device_bypassed(sdev);
+
+    trace_virtio_iommu_switch_address_space(pci_bus_num(sdev->bus),
+                                            PCI_SLOT(sdev->devfn),
+                                            PCI_FUNC(sdev->devfn),
+                                            use_remapping);
+
+    /* Turn off first then on the other */
+    if (use_remapping) {
+        memory_region_set_enabled(&sdev->bypass_mr, false);
+        memory_region_set_enabled(MEMORY_REGION(&sdev->iommu_mr), true);
+    } else {
+        memory_region_set_enabled(MEMORY_REGION(&sdev->iommu_mr), false);
+        memory_region_set_enabled(&sdev->bypass_mr, true);
+    }
+
+    return use_remapping;
+}
+
+static void virtio_iommu_switch_address_space_all(VirtIOIOMMU *s)
+{
+    GHashTableIter iter;
+    IOMMUPciBus *iommu_pci_bus;
+    int i;
+
+    g_hash_table_iter_init(&iter, s->as_by_busptr);
+    while (g_hash_table_iter_next(&iter, NULL, (void **)&iommu_pci_bus)) {
+        for (i = 0; i < PCI_DEVFN_MAX; i++) {
+            if (!iommu_pci_bus->pbdev[i]) {
+                continue;
+            }
+            virtio_iommu_switch_address_space(iommu_pci_bus->pbdev[i]);
+        }
+    }
+}
+
 /**
  * The bus number is used for lookup when SID based operations occur.
  * In that case we lazily populate the IOMMUPciBus array from the bus hash
@@ -213,6 +284,7 @@ static gboolean virtio_iommu_notify_map_cb(gpointer key, gpointer value,
 static void virtio_iommu_detach_endpoint_from_domain(VirtIOIOMMUEndpoint *ep)
 {
     VirtIOIOMMUDomain *domain = ep->domain;
+    IOMMUDevice *sdev = container_of(ep->iommu_mr, IOMMUDevice, iommu_mr);
 
     if (!ep->domain) {
         return;
@@ -221,6 +293,7 @@ static void virtio_iommu_detach_endpoint_from_domain(VirtIOIOMMUEndpoint *ep)
                    ep->iommu_mr);
     QLIST_REMOVE(ep, next);
     ep->domain = NULL;
+    virtio_iommu_switch_address_space(sdev);
 }
 
 static VirtIOIOMMUEndpoint *virtio_iommu_get_endpoint(VirtIOIOMMU *s,
@@ -323,12 +396,39 @@ static AddressSpace *virtio_iommu_find_add_as(PCIBus *bus, void *opaque,
 
         trace_virtio_iommu_init_iommu_mr(name);
 
+        memory_region_init(&sdev->root, OBJECT(s), name, UINT64_MAX);
+        address_space_init(&sdev->as, &sdev->root, TYPE_VIRTIO_IOMMU);
+
+        /*
+         * Build the IOMMU disabled container with aliases to the
+         * shared MRs.  Note that aliasing to a shared memory region
+         * could help the memory API to detect same FlatViews so we
+         * can have devices to share the same FlatView when in bypass
+         * mode. (either by not configuring virtio-iommu driver or with
+         * "iommu=pt").  It will greatly reduce the total number of
+         * FlatViews of the system hence VM runs faster.
+         */
+        memory_region_init_alias(&sdev->bypass_mr, OBJECT(s),
+                                 "system", get_system_memory(), 0,
+                                 memory_region_size(get_system_memory()));
+
         memory_region_init_iommu(&sdev->iommu_mr, sizeof(sdev->iommu_mr),
                                  TYPE_VIRTIO_IOMMU_MEMORY_REGION,
                                  OBJECT(s), name,
                                  UINT64_MAX);
-        address_space_init(&sdev->as,
-                           MEMORY_REGION(&sdev->iommu_mr), TYPE_VIRTIO_IOMMU);
+
+        /*
+         * Hook both the containers under the root container, we
+         * switch between iommu & bypass MRs by enable/disable
+         * corresponding sub-containers
+         */
+        memory_region_add_subregion_overlap(&sdev->root, 0,
+                                            MEMORY_REGION(&sdev->iommu_mr),
+                                            0);
+        memory_region_add_subregion_overlap(&sdev->root, 0,
+                                            &sdev->bypass_mr, 0);
+
+        virtio_iommu_switch_address_space(sdev);
         g_free(name);
     }
     return &sdev->as;
@@ -342,6 +442,7 @@ static int virtio_iommu_attach(VirtIOIOMMU *s,
     uint32_t flags = le32_to_cpu(req->flags);
     VirtIOIOMMUDomain *domain;
     VirtIOIOMMUEndpoint *ep;
+    IOMMUDevice *sdev;
 
     trace_virtio_iommu_attach(domain_id, ep_id);
 
@@ -375,6 +476,8 @@ static int virtio_iommu_attach(VirtIOIOMMU *s,
     QLIST_INSERT_HEAD(&domain->endpoint_list, ep, next);
 
     ep->domain = domain;
+    sdev = container_of(ep->iommu_mr, IOMMUDevice, iommu_mr);
+    virtio_iommu_switch_address_space(sdev);
 
     /* Replay domain mappings on the associated memory region */
     g_tree_foreach(domain->mappings, virtio_iommu_notify_map_cb,
@@ -887,6 +990,7 @@ static void virtio_iommu_set_config(VirtIODevice *vdev,
             return;
         }
         dev_config->bypass = in_config->bypass;
+        virtio_iommu_switch_address_space_all(dev);
     }
 
     trace_virtio_iommu_set_config(in_config->bypass);
@@ -1026,6 +1130,8 @@ static void virtio_iommu_system_reset(void *opaque)
      * system reset
      */
     s->config.bypass = s->boot_bypass;
+    virtio_iommu_switch_address_space_all(s);
+
 }
 
 static void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
@@ -1041,6 +1147,11 @@ static void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
                              virtio_iommu_handle_command);
     s->event_vq = virtio_add_queue(vdev, VIOMMU_DEFAULT_QUEUE_SIZE, NULL);
 
+    /*
+     * config.bypass is needed to get initial address space early, such as
+     * in vfio realize
+     */
+    s->config.bypass = s->boot_bypass;
     s->config.page_size_mask = TARGET_PAGE_MASK;
     s->config.input_range.end = UINT64_MAX;
     s->config.domain_range.end = UINT32_MAX;
diff --git a/include/hw/virtio/virtio-iommu.h b/include/hw/virtio/virtio-iommu.h
index 84391f844826..102eeefa731d 100644
--- a/include/hw/virtio/virtio-iommu.h
+++ b/include/hw/virtio/virtio-iommu.h
@@ -37,6 +37,8 @@ typedef struct IOMMUDevice {
     int           devfn;
     IOMMUMemoryRegion  iommu_mr;
     AddressSpace  as;
+    MemoryRegion root;          /* The root container of the device */
+    MemoryRegion bypass_mr;     /* The alias of shared memory MR */
 } IOMMUDevice;
 
 typedef struct IOMMUPciBus {
-- 
2.25.1


