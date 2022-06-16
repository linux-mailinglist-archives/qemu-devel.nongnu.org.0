Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB6C54E854
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 19:06:26 +0200 (CEST)
Received: from localhost ([::1]:55992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1swr-00053b-GY
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 13:06:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o1soW-0004tZ-1I
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 12:57:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o1soT-0001wm-UT
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 12:57:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655398664;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=53CquJ0074LeJRzB6QRemNj/ajjpPAn/eII8QVnSUZY=;
 b=Bs7f8OIx2ctMMTr8uBmCZK5jRi2vsPft6bwlocTmviJ1q98dSh+8Kfks0cRbLc5lv9hmJ+
 L4QAZZZD7ivzmlgu6lh8mPcDhTFxSOemToFChM+24P/YsYFTWpKO/hY5sBm2Mt8ER4hlaz
 WJlWWs46x1cT1V558IJ46cl5kDJ1B8Y=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-461-3Xi76nilMuuF1VHKKhOB_A-1; Thu, 16 Jun 2022 12:57:40 -0400
X-MC-Unique: 3Xi76nilMuuF1VHKKhOB_A-1
Received: by mail-wm1-f71.google.com with SMTP id
 k15-20020a7bc40f000000b0039c4b7f7d09so1129858wmi.8
 for <qemu-devel@nongnu.org>; Thu, 16 Jun 2022 09:57:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=53CquJ0074LeJRzB6QRemNj/ajjpPAn/eII8QVnSUZY=;
 b=D5KiG5YnqsbMH4rqlCdfqu61U/MZ47lkmahsDtl/AjI8SMgxcaVMAIXynCUMVj0YTn
 uTKCzOZggVWZMxPefq6FJQZ6aOQ/yWWogAKGXO3GK52dcwvy5lsS6fWN79IwBksuGHEl
 Cy/+FfTLnD/BrEYEuF+EtrbHv+BhsAbBp3yy56tiKX73Tv2nW+6JuojuwTbdRfdxB+w5
 EjFFMotHU/qA5awubv3UC4fOe/1OoQD/Vbs30BdOe5AgiSl/JpgsXdKrL2vNNZ3K+Loa
 gjGkO2YinlFTtfcJcpDT36WD2wVuClgb1c1mAqi2VdkMeoUvuDjOG/AHQ7XzKE/kOg0p
 Ysdw==
X-Gm-Message-State: AJIora+Te81l7N9LBj6S1M/DW3if11XGIf8CfK1edyBQlu1WOV/ZwhYJ
 +G/VP06nDmxUXm+bQMIa10eXQocjGfbEtBxrwt5QJYKic8+cXpBTNzf5D0XCqVHTxVX9Mhibo7k
 h1RyzIp9jwYveGXOzTW10aRWzqTMDu+f/MadIbQJFY/NObXBb7LrW1UlEbM0w
X-Received: by 2002:a5d:6384:0:b0:210:5f39:53af with SMTP id
 p4-20020a5d6384000000b002105f3953afmr5394194wru.346.1655398659308; 
 Thu, 16 Jun 2022 09:57:39 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1u0GCGzfSDIkgr1NmpvarGd8pSolvnOmqOHyiLfhcWp3Q88tXWfJChf2VY6HfSw92xIeoUfNw==
X-Received: by 2002:a5d:6384:0:b0:210:5f39:53af with SMTP id
 p4-20020a5d6384000000b002105f3953afmr5394178wru.346.1655398658998; 
 Thu, 16 Jun 2022 09:57:38 -0700 (PDT)
Received: from redhat.com ([2.53.13.204]) by smtp.gmail.com with ESMTPSA id
 l7-20020a05600c4f0700b00397342e3830sm13193568wmq.0.2022.06.16.09.57.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jun 2022 09:57:38 -0700 (PDT)
Date: Thu, 16 Jun 2022 12:57:36 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Zhenzhong Duan <zhenzhong.duan@intel.com>,
 Eric Auger <eric.auger@redhat.com>
Subject: [PULL 05/10] virtio-iommu: Add bypass mode support to assigned device
Message-ID: <20220616165703.42226-6-mst@redhat.com>
References: <20220616165703.42226-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220616165703.42226-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Zhenzhong Duan <zhenzhong.duan@intel.com>

Currently assigned devices can not work in virtio-iommu bypass mode.
Guest driver fails to probe the device due to DMA failure. And the
reason is because of lacking GPA -> HPA mappings when VM is created.

Add a root container memory region to hold both bypass memory region
and iommu memory region, so the switch between them is supported
just like the implementation in virtual VT-d.

Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
Message-Id: <20220613061010.2674054-2-zhenzhong.duan@intel.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/virtio/virtio-iommu.h |   2 +
 hw/virtio/virtio-iommu.c         | 115 ++++++++++++++++++++++++++++++-
 hw/virtio/trace-events           |   1 +
 3 files changed, 116 insertions(+), 2 deletions(-)

diff --git a/include/hw/virtio/virtio-iommu.h b/include/hw/virtio/virtio-iommu.h
index 84391f8448..102eeefa73 100644
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
diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 2597e166f9..ff718107ee 100644
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
diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
index ab8e095b73..20af2e7ebd 100644
--- a/hw/virtio/trace-events
+++ b/hw/virtio/trace-events
@@ -124,6 +124,7 @@ virtio_iommu_remap(const char *name, uint64_t virt_start, uint64_t virt_end, uin
 virtio_iommu_set_page_size_mask(const char *name, uint64_t old, uint64_t new) "mr=%s old_mask=0x%"PRIx64" new_mask=0x%"PRIx64
 virtio_iommu_notify_flag_add(const char *name) "add notifier to mr %s"
 virtio_iommu_notify_flag_del(const char *name) "del notifier from mr %s"
+virtio_iommu_switch_address_space(uint8_t bus, uint8_t slot, uint8_t fn, bool on) "Device %02x:%02x.%x switching address space (iommu enabled=%d)"
 
 # virtio-mem.c
 virtio_mem_send_response(uint16_t type) "type=%" PRIu16
-- 
MST


