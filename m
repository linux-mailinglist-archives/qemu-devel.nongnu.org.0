Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC7D52CFBA
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 11:51:20 +0200 (CEST)
Received: from localhost ([::1]:50862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrcoR-0005kY-VM
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 05:51:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <usama.arif@bytedance.com>)
 id 1nrchB-00009u-Kj
 for qemu-devel@nongnu.org; Thu, 19 May 2022 05:43:49 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:33373)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <usama.arif@bytedance.com>)
 id 1nrch3-0001Ly-R1
 for qemu-devel@nongnu.org; Thu, 19 May 2022 05:43:46 -0400
Received: by mail-wr1-x42b.google.com with SMTP id f2so6375910wrc.0
 for <qemu-devel@nongnu.org>; Thu, 19 May 2022 02:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1l+cWNvV0KOenB4c1sdUECZRnEM1Nw9DvnQ3EwiD1vE=;
 b=Mw7LiqUbaKDdA0CYmzwX390o/VQCq8M7i6IGPO65enLOBygfdKa/D+ok7WmmxyAj4o
 KVk/LdpPlcGc9wYsClWLGNE852wv55MK0NU11O8ZxQ5SPhy5RiMdvuvthI5nxfnWPqgM
 4t3OQrVEoFrcAE4YElWL2nOHPbi0q3y5VPj4hOgAPaPvdAXK9UHh9R/Q8ZBC456fw5r7
 nxo1RIPLNxUK71RR87sTi5xWs4Lk/zNd2rfYP0FIv/Ahj86XtZ3zf1HL7TMcCrgjfu6A
 YoQlaLpsNQcoJtyIBbf1irVettkzFjdu7pbjkQsDWtMPTW3vWMCy0miaWsp3V1AOk+5G
 M1Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1l+cWNvV0KOenB4c1sdUECZRnEM1Nw9DvnQ3EwiD1vE=;
 b=r92Phko39ahqSWLyEA1EIGVZ2Unv2wYUYQEqHhXCMqN4mZM7J1ozFusfotI8Wo0UNR
 MpCr9aPMdVs8F2qPLZdj5IisgFr4Vce0lXrYCwgTExTUijsYrB3tBa4GUWsmJxM/wqK1
 Q/22Cp4uV1fIaAYWNHVYoNIO/LyQp3wF2+oIagHrzNChrW9rEbye/GIDm4EEDPZZypSW
 FGZC5OhZXWuzeK4BTLgfjN2puJe/Xb2wLLr6SiPQif1HEYO9FJhb3xVMSMJevD+xcqcM
 lxynhif7WBWhSxblbfEyhv1Jn2dWn1C1Et3NAPp9RmR2WWKE/3jVDwT5mD67B8iwRBlt
 /adw==
X-Gm-Message-State: AOAM532Vl0EKIPbMA+KbGXII68E06DbE8qXykLvgnxEF/RIf+VKe5pA9
 eiq8tR89UbDTpPHgTcTUVebrKTS6PzR7rg==
X-Google-Smtp-Source: ABdhPJzAscBmANgIEEuFQN3dfeYGbp4svhy5JZ2WEcGFNbP9Q6KxAGmIngQVYA/u+5ts2rHjlPbp7A==
X-Received: by 2002:adf:ec8b:0:b0:20d:483:f271 with SMTP id
 z11-20020adfec8b000000b0020d0483f271mr3309943wrn.555.1652953419467; 
 Thu, 19 May 2022 02:43:39 -0700 (PDT)
Received: from usaari01.cust.communityfibre.co.uk
 ([2a02:6b6a:b497:0:8edd:b6b5:d314:5955])
 by smtp.gmail.com with ESMTPSA id
 r1-20020a05600c434100b003942a244ecesm3525029wme.19.2022.05.19.02.43.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 02:43:39 -0700 (PDT)
From: Usama Arif <usama.arif@bytedance.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com, stefanha@redhat.com, ndragazis@arrikto.com,
 fam.zheng@bytedance.com, liangma@liangbit.com,
 Usama Arif <usama.arif@bytedance.com>
Subject: [RFC 2/2] virtio-vhost-user: add virtio-vhost-user device
Date: Thu, 19 May 2022 10:43:23 +0100
Message-Id: <20220519094323.3109598-3-usama.arif@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220519094323.3109598-1-usama.arif@bytedance.com>
References: <20220519094323.3109598-1-usama.arif@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=usama.arif@bytedance.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The virtio-vhost-user device lets a guest act as a vhost device backend.
It works by tunneling vhost-user protocol messages into a guest.  The
new device syntax is as follows:

  -chardev socket,id=chardev0,path=vhost-user.sock,server=on,wait=off \
  -device virtio-vhost-user-pci,chardev=chardev0

The VIRTIO device specification is here:
https://uarif1.github.io/vvu/v2/virtio-v1.1-cs01

For more information about virtio-vhost-user, see
https://wiki.qemu.org/Features/VirtioVhostUser.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Nikos Dragazis <ndragazis@arrikto.com>
Signed-off-by: Usama Arif <usama.arif@bytedance.com>
---
 hw/virtio/Kconfig                           |    5 +
 hw/virtio/meson.build                       |    2 +
 hw/virtio/trace-events                      |   26 +
 hw/virtio/virtio-pci.c                      |   13 +-
 hw/virtio/virtio-vhost-user-pci.c           |  471 ++++++++
 hw/virtio/virtio-vhost-user.c               | 1066 +++++++++++++++++++
 hw/virtio/virtio.c                          |    7 +-
 include/hw/pci/pci.h                        |    1 +
 include/hw/virtio/virtio-pci.h              |    7 +
 include/hw/virtio/virtio-vhost-user.h       |  126 +++
 include/hw/virtio/virtio.h                  |    2 +
 include/standard-headers/linux/virtio_ids.h |    1 +
 12 files changed, 1717 insertions(+), 10 deletions(-)
 create mode 100644 hw/virtio/virtio-vhost-user-pci.c
 create mode 100644 hw/virtio/virtio-vhost-user.c
 create mode 100644 include/hw/virtio/virtio-vhost-user.h

diff --git a/hw/virtio/Kconfig b/hw/virtio/Kconfig
index e9ecae1f50..813bfc4600 100644
--- a/hw/virtio/Kconfig
+++ b/hw/virtio/Kconfig
@@ -80,3 +80,8 @@ config VHOST_USER_FS
     bool
     default y
     depends on VIRTIO && VHOST_USER
+
+config VIRTIO_VHOST_USER
+    bool
+    default y
+    depends on VIRTIO && VHOST_USER
\ No newline at end of file
diff --git a/hw/virtio/meson.build b/hw/virtio/meson.build
index 7e8877fd64..11ed09d5ff 100644
--- a/hw/virtio/meson.build
+++ b/hw/virtio/meson.build
@@ -29,6 +29,7 @@ virtio_ss.add(when: 'CONFIG_VIRTIO_IOMMU', if_true: files('virtio-iommu.c'))
 virtio_ss.add(when: 'CONFIG_VIRTIO_MEM', if_true: files('virtio-mem.c'))
 virtio_ss.add(when: 'CONFIG_VHOST_USER_I2C', if_true: files('vhost-user-i2c.c'))
 virtio_ss.add(when: 'CONFIG_VHOST_USER_RNG', if_true: files('vhost-user-rng.c'))
+virtio_ss.add(when: 'CONFIG_VIRTIO_VHOST_USER', if_true: files('virtio-vhost-user.c'))
 
 virtio_pci_ss = ss.source_set()
 virtio_pci_ss.add(when: 'CONFIG_VHOST_VSOCK', if_true: files('vhost-vsock-pci.c'))
@@ -54,6 +55,7 @@ virtio_pci_ss.add(when: 'CONFIG_VIRTIO_SERIAL', if_true: files('virtio-serial-pc
 virtio_pci_ss.add(when: 'CONFIG_VIRTIO_PMEM', if_true: files('virtio-pmem-pci.c'))
 virtio_pci_ss.add(when: 'CONFIG_VIRTIO_IOMMU', if_true: files('virtio-iommu-pci.c'))
 virtio_pci_ss.add(when: 'CONFIG_VIRTIO_MEM', if_true: files('virtio-mem-pci.c'))
+virtio_pci_ss.add(when: 'CONFIG_VIRTIO_VHOST_USER', if_true: files('virtio-vhost-user-pci.c'))
 
 virtio_ss.add_all(when: 'CONFIG_VIRTIO_PCI', if_true: virtio_pci_ss)
 
diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
index ab8e095b73..9dccf723ad 100644
--- a/hw/virtio/trace-events
+++ b/hw/virtio/trace-events
@@ -85,6 +85,32 @@ virtio_balloon_get_config(uint32_t num_pages, uint32_t actual) "num_pages: %d ac
 virtio_balloon_set_config(uint32_t actual, uint32_t oldactual) "actual: %d oldactual: %d"
 virtio_balloon_to_target(uint64_t target, uint32_t num_pages) "balloon target: 0x%"PRIx64" num_pages: %d"
 
+# hw/virtio/virtio-vhost-user.c
+virtio_vhost_user_m2s_bad_version(void *s, unsigned int version) "s %p version %u"
+virtio_vhost_user_m2s_unexpected_reply(void *s) "s %p"
+virtio_vhost_user_m2s_bad_payload_size(void *s, unsigned int size) "s %p size %u"
+virtio_vhost_user_m2s_bad_request(void *s, unsigned request) "s %p request %u"
+virtio_vhost_user_m2s_request(void *s, unsigned int request) "s %p request %u"
+virtio_vhost_user_m2s_unknown_request(void *s, unsigned int request) "s %p request %u"
+virtio_vhost_user_s2m_bad_version(void *s, unsigned int version) "s %p version %u"
+virtio_vhost_user_s2m_expected_reply(void *s) "s %p"
+virtio_vhost_user_s2m_bad_payload_size(void *s, unsigned int size) "s %p size %u"
+virtio_vhost_user_s2m_bad_request(void *s, unsigned request) "s %p request %u"
+virtio_vhost_user_s2m_request(void *s, unsigned int request) "s %p request %u"
+virtio_vhost_user_s2m_unknown_request(void *s, unsigned int request) "s %p request %u"
+virtio_vhost_user_rxq_empty(void *s) "s %p"
+virtio_vhost_user_tx_done(void *s) "s %p"
+virtio_vhost_user_chr_event(void *s, int event) "s %p event %d"
+virtio_vhost_user_chr_change(void *s) "s %p"
+virtio_vhost_user_conn_state_transition(void *s, int old_state, int event, int new_state) "s %p old_state %d event %d new_state %d"
+virtio_vhost_user_set_config(void *s, unsigned int old_status, unsigned int new_status) "s %p old_status %u new_status %u"
+virtio_vhost_user_doorbell_write(void *s, unsigned int vq_idx, ssize_t nwritten) "s %p vq_idx %u nwritten %zd"
+virtio_vhost_user_notification_read(void *s, uint64_t addr, uint64_t return_val) "s %p addr 0x%"PRIx64" return_val 0x%"PRIx64
+virtio_vhost_user_notification_write(void *s, uint64_t addr, uint64_t val) "s %p addr 0x%"PRIx64" val 0x%"PRIx64
+virtio_vhost_user_guest_notifier_read(int kickfd, uint16_t vector) "kickfd %d vector 0x%"PRIx16
+virtio_vhost_user_memory_region(void *s, uint64_t guest_phys_addr, uint64_t memory_size, uint64_t userspace_addr, uint64_t mmap_offset, void *mmap_addr) "s %p guest_phys_addr 0x%"PRIx64" memory_size 0x%"PRIx64" userspace_addr 0x%"PRIx64" mmap_offset 0x%"PRIx64" mmap_addr %p"
+
+
 # virtio-mmio.c
 virtio_mmio_read(uint64_t offset) "virtio_mmio_read offset 0x%" PRIx64
 virtio_mmio_write_offset(uint64_t offset, uint64_t value) "virtio_mmio_write offset 0x%" PRIx64 " value 0x%" PRIx64
diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index 0566ad7d00..9ad5c56388 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -18,7 +18,6 @@
 #include "qemu/osdep.h"
 
 #include "exec/memop.h"
-#include "standard-headers/linux/virtio_pci.h"
 #include "hw/boards.h"
 #include "hw/virtio/virtio.h"
 #include "migration/qemu-file-types.h"
@@ -222,7 +221,7 @@ static bool virtio_pci_ioeventfd_enabled(DeviceState *d)
 
 #define QEMU_VIRTIO_PCI_QUEUE_MEM_MULT 0x1000
 
-static inline int virtio_pci_queue_mem_mult(struct VirtIOPCIProxy *proxy)
+inline int virtio_pci_queue_mem_mult(struct VirtIOPCIProxy *proxy)
 {
     return (proxy->flags & VIRTIO_PCI_FLAG_PAGE_PER_VQ) ?
         QEMU_VIRTIO_PCI_QUEUE_MEM_MULT : 4;
@@ -1558,11 +1557,11 @@ static void virtio_pci_modern_regions_init(VirtIOPCIProxy *proxy,
                           proxy->notify_pio.size);
 }
 
-static void virtio_pci_modern_region_map(VirtIOPCIProxy *proxy,
-                                         VirtIOPCIRegion *region,
-                                         struct virtio_pci_cap *cap,
-                                         MemoryRegion *mr,
-                                         uint8_t bar)
+void virtio_pci_modern_region_map(VirtIOPCIProxy *proxy,
+                                  VirtIOPCIRegion *region,
+                                  struct virtio_pci_cap *cap,
+                                  MemoryRegion *mr,
+                                  uint8_t bar)
 {
     memory_region_add_subregion(mr, region->offset, &region->mr);
 
diff --git a/hw/virtio/virtio-vhost-user-pci.c b/hw/virtio/virtio-vhost-user-pci.c
new file mode 100644
index 0000000000..b4e0ba735b
--- /dev/null
+++ b/hw/virtio/virtio-vhost-user-pci.c
@@ -0,0 +1,471 @@
+/*
+ * Virtio Vhost-user Device
+ *
+ * Copyright (C) 2017-2018 Red Hat, Inc.
+ *
+ * Authors:
+ *  Stefan Hajnoczi   <stefanha@redhat.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+#include "qemu/osdep.h"
+#include "hw/pci/pci.h"
+#include "hw/virtio/virtio.h"
+#include "hw/virtio/virtio-bus.h"
+#include "hw/virtio/virtio-pci.h"
+#include "hw/virtio/virtio-vhost-user.h"
+#include "qapi/error.h"
+#include "trace.h"
+#include "hw/pci/msix.h"
+
+typedef struct VirtIOVhostUserPCI VirtIOVhostUserPCI;
+
+/*
+ * virtio-vhost-user-pci: This extends VirtioPCIProxy.
+ */
+
+#define TYPE_VIRTIO_VHOST_USER_PCI "virtio-vhost-user-pci-base"
+#define VIRTIO_VHOST_USER_PCI(obj) OBJECT_CHECK(VirtIOVhostUserPCI, \
+    (obj), TYPE_VIRTIO_VHOST_USER_PCI)
+#define VIRTIO_VHOST_USER_PCI_GET_CLASS(obj) \
+        OBJECT_GET_CLASS(VirtioVhostUserPCIClass, obj, \
+        TYPE_VIRTIO_VHOST_USER_PCI)
+#define VIRTIO_VHOST_USER_PCI_CLASS(klass) \
+        OBJECT_CLASS_CHECK(VirtioVhostUserPCIClass, klass, \
+        TYPE_VIRTIO_VHOST_USER_PCI)
+
+struct VirtIOVhostUserPCI {
+    VirtIOPCIProxy parent_obj;
+    VirtIOVhostUser vdev;
+
+    MemoryRegion additional_resources_bar;
+
+    VirtIOPCIRegion doorbells;
+    VirtIOPCIRegion notifications;
+    VirtIOPCIRegion shared_memory;
+};
+
+typedef struct VirtioVhostUserPCIClass {
+    VirtioPCIClass parent_class;
+
+    void (*set_vhost_mem_regions)(VirtIOVhostUserPCI *vvup);
+    void (*delete_vhost_mem_region)(VirtIOVhostUserPCI *vvup, MemoryRegion *mr);
+    void (*cleanup_bar)(VirtIOVhostUserPCI *vvup);
+    void (*register_doorbell)(VirtIOVhostUserPCI *vvup, EventNotifier *e,
+                              uint8_t vq_idx);
+    void (*unregister_doorbell)(VirtIOVhostUserPCI *vvup, EventNotifier *e,
+                                uint8_t vq_idx);
+} VirtioVhostUserPCIClass;
+
+static Property virtio_vhost_user_pci_properties[] = {
+    DEFINE_PROP_UINT32("vectors", VirtIOPCIProxy, nvectors,
+                       DEV_NVECTORS_UNSPECIFIED),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+/*
+ * Handler for the frontend kickfd notifications. Inject an INTx or MSI-X
+ * interrupt to the guest in response to the frontend notification. Use the
+ * appropriate vector in the latter case.
+ */
+void virtio_vhost_user_guest_notifier_read(EventNotifier *n)
+{
+    struct kickfd *kickfd = container_of(n, struct kickfd, guest_notifier);
+    VirtIODevice *vdev = kickfd->vdev;
+    VirtIOVhostUser *vvu = container_of(vdev, struct VirtIOVhostUser,
+        parent_obj);
+    VirtIOVhostUserPCI *vvup = container_of(vvu, struct VirtIOVhostUserPCI,
+        vdev);
+    VirtIOPCIProxy *proxy = &vvup->parent_obj;
+    PCIDevice *pci_dev = &proxy->pci_dev;
+
+    if (event_notifier_test_and_clear(n)) {
+        /*
+         * The ISR status register is used only for INTx interrupts. Thus, we
+         * use it only in this case.
+         */
+        if (!msix_enabled(pci_dev)) {
+            virtio_set_isr(vdev, 0x2);
+        }
+        /*
+         * Send an interrupt, either with INTx or MSI-X mechanism. msix_notify()
+         * already handles the case where the MSI-X vector is NO_VECTOR by not
+         * issuing interrupts. Thus, we don't have to check this case here.
+         */
+        virtio_notify_vector(vdev, kickfd->msi_vector);
+
+        trace_virtio_vhost_user_guest_notifier_read(kickfd->guest_notifier.rfd,
+            kickfd->msi_vector);
+    }
+}
+
+static uint64_t virtio_vhost_user_doorbells_read(void *opaque, hwaddr addr,
+                                                 unsigned size)
+{
+    return 0;
+}
+
+static void virtio_vhost_user_doorbells_write(void *opaque, hwaddr addr,
+                                              uint64_t val, unsigned size)
+{
+    VirtIOVhostUserPCI *vvup = opaque;
+    VirtIOPCIProxy *proxy = &vvup->parent_obj;
+    VirtIOVhostUser *s = &vvup->vdev;
+    unsigned idx = addr / virtio_pci_queue_mem_mult(proxy);
+
+    if (idx < VIRTIO_QUEUE_MAX) {
+        /* We shouldn't reach at this point since we are using ioeventfds. */
+        if (event_notifier_get_fd(&s->callfds[idx]) >= 0) {
+            ssize_t nwritten;
+
+            nwritten = event_notifier_set(&s->callfds[idx]);
+            trace_virtio_vhost_user_doorbell_write(s, idx, nwritten);
+
+        }
+    } else if (idx == VIRTIO_QUEUE_MAX) {
+        /* TODO log doorbell */
+   }
+}
+
+static void vvu_register_doorbell(VirtIOVhostUserPCI *vvup, EventNotifier *e,
+                                  uint8_t vq_idx)
+{
+    VirtIOPCIProxy *proxy = &vvup->parent_obj;
+    hwaddr addr = vq_idx * virtio_pci_queue_mem_mult(proxy);
+
+    /* Register the callfd EventNotifier as ioeventfd */
+    memory_region_add_eventfd(&vvup->doorbells.mr, addr, 2, false, vq_idx, e);
+}
+
+void virtio_vhost_user_register_doorbell(VirtIOVhostUser *s, EventNotifier *e,
+                                         uint8_t vq_idx)
+{
+    VirtIOVhostUserPCI *vvup = container_of(s, struct VirtIOVhostUserPCI, vdev);
+    VirtioVhostUserPCIClass *vvup_class = VIRTIO_VHOST_USER_PCI_GET_CLASS(vvup);
+
+    vvup_class->register_doorbell(vvup, e, vq_idx);
+}
+
+static void vvu_unregister_doorbell(VirtIOVhostUserPCI *vvup, EventNotifier *e,
+                                    uint8_t vq_idx)
+{
+    VirtIOPCIProxy *proxy = &vvup->parent_obj;
+    hwaddr addr = vq_idx * virtio_pci_queue_mem_mult(proxy);
+
+    /* Unregister the callfd EventNotifier */
+    memory_region_del_eventfd(&vvup->doorbells.mr, addr, 2, false, vq_idx, e);
+}
+
+void virtio_vhost_user_unregister_doorbell(VirtIOVhostUser *s, EventNotifier *e,
+                                           uint8_t vq_idx)
+{
+    VirtIOVhostUserPCI *vvup = container_of(s, struct VirtIOVhostUserPCI, vdev);
+    VirtioVhostUserPCIClass *vvup_class = VIRTIO_VHOST_USER_PCI_GET_CLASS(vvup);
+
+    vvup_class->unregister_doorbell(vvup, e, vq_idx);
+}
+
+static uint64_t virtio_vhost_user_notification_read(void *opaque, hwaddr addr,
+                                               unsigned size)
+{
+    VirtIOVhostUserPCI *vvup = opaque;
+    VirtIOVhostUser *s = &vvup->vdev;
+    uint64_t val = 0;
+
+    switch (addr) {
+    case NOTIFICATION_SELECT:
+           val = s->nselect;
+           break;
+    case NOTIFICATION_MSIX_VECTOR:
+            if (s->nselect < ARRAY_SIZE(s->kickfds)) {
+                val = s->kickfds[s->nselect].msi_vector;
+            }
+           break;
+    default:
+           break;
+    }
+
+    trace_virtio_vhost_user_notification_read(s, addr, val);
+
+    return val;
+}
+
+/* Set the MSI vectors for the frontend virtqueue notifications. */
+static void virtio_vhost_user_notification_write(void *opaque, hwaddr addr,
+                                               uint64_t val, unsigned size)
+{
+   /*
+    * MMIO regions are byte-addressable. The value of the `addr` argument is
+    * relative to the starting address of the MMIO region. For example,
+    * `addr = 6` means that the 6th byte of this MMIO region has been written.
+    */
+    VirtIOVhostUserPCI *vvup = opaque;
+    VirtIOPCIProxy *proxy = &vvup->parent_obj;
+    VirtIOVhostUser *s = &vvup->vdev;
+
+    switch (addr) {
+    case NOTIFICATION_SELECT:
+       if (val < VIRTIO_QUEUE_MAX) {
+            s->nselect = val;
+       }
+       break;
+    case NOTIFICATION_MSIX_VECTOR:
+        msix_vector_unuse(&proxy->pci_dev, s->kickfds[s->nselect].msi_vector);
+        if (msix_vector_use(&proxy->pci_dev, val) < 0) {
+            val = VIRTIO_NO_VECTOR;
+        }
+        s->kickfds[s->nselect].msi_vector = val;
+       break;
+    default:
+        break;
+    }
+
+    trace_virtio_vhost_user_notification_write(s, addr, val);
+}
+
+/*
+ * Add the shared memory region as a subregion of the
+ * additional_resources_bar.
+ */
+static void vvu_set_vhost_mem_regions(VirtIOVhostUserPCI *vvup)
+{
+    VirtIOVhostUser *s = &vvup->vdev;
+    VhostUserMemory m = s->read_msg.payload.memory, *memory = &m;
+    hwaddr subregion_offset;
+    uint32_t i;
+
+    /* Start after the notification structure */
+    subregion_offset = vvup->shared_memory.offset;
+
+    for (i = 0; i < memory->nregions; i++) {
+        VirtIOVhostUserMemTableRegion *region = &s->mem_table[i];
+
+        memory_region_init_ram_device_ptr(&region->mr, OBJECT(vvup),
+                "virtio-vhost-user-mem-table-region",
+                region->total_size, region->mmap_addr);
+        memory_region_add_subregion(&vvup->additional_resources_bar,
+                                    subregion_offset, &region->mr);
+
+        subregion_offset += region->total_size;
+    }
+}
+
+void virtio_vhost_user_set_vhost_mem_regions(VirtIOVhostUser *s)
+{
+    VirtIOVhostUserPCI *vvup = container_of(s, struct VirtIOVhostUserPCI, vdev);
+    VirtioVhostUserPCIClass *vvup_class = VIRTIO_VHOST_USER_PCI_GET_CLASS(vvup);
+
+    vvup_class->set_vhost_mem_regions(vvup);
+}
+
+static void vvu_delete_vhost_mem_region(VirtIOVhostUserPCI *vvup,
+    MemoryRegion *mr)
+{
+    memory_region_del_subregion(&vvup->additional_resources_bar, mr);
+    object_unparent(OBJECT(mr));
+}
+
+
+void virtio_vhost_user_delete_vhost_mem_region(VirtIOVhostUser *s,
+    MemoryRegion *mr)
+{
+    VirtIOVhostUserPCI *vvup = container_of(s, struct VirtIOVhostUserPCI, vdev);
+    VirtioVhostUserPCIClass *vvup_class = VIRTIO_VHOST_USER_PCI_GET_CLASS(vvup);
+
+    vvup_class->delete_vhost_mem_region(vvup, mr);
+}
+
+static void virtio_vhost_user_init_bar(VirtIOVhostUserPCI *vvup)
+{
+    /* virtio-pci doesn't use BAR 2 & 3, so we use it */
+    const int bar_index = 2;
+
+    /*
+     * TODO If the BAR is too large the guest won't have address space to map
+     * it!
+     */
+    const uint64_t bar_size = 1ULL << 36;
+
+    memory_region_init(&vvup->additional_resources_bar, OBJECT(vvup),
+                       "virtio-vhost-user", bar_size);
+    pci_register_bar(&vvup->parent_obj.pci_dev, bar_index,
+                     PCI_BASE_ADDRESS_SPACE_MEMORY |
+                     PCI_BASE_ADDRESS_MEM_PREFETCH |
+                     PCI_BASE_ADDRESS_MEM_TYPE_64,
+                     &vvup->additional_resources_bar);
+
+    /*
+     * Initialize the VirtIOPCIRegions for the virtio configuration structures
+     * corresponding to the additional device resource capabilities.
+     * Place the additional device resources in the additional_resources_bar.
+     */
+    VirtIOPCIProxy *proxy = VIRTIO_PCI(vvup);
+
+    vvup->doorbells.offset = 0x0;
+    /* VIRTIO_QUEUE_MAX + 1 for logfd */
+    vvup->doorbells.size = virtio_pci_queue_mem_mult(proxy)
+        * (VIRTIO_QUEUE_MAX + 1);
+    /* TODO Not sure if it is necessary for the size to be aligned */
+    vvup->doorbells.size = QEMU_ALIGN_UP(vvup->doorbells.size, 4096);
+    vvup->doorbells.type = VIRTIO_PCI_CAP_DOORBELL_CFG;
+
+    vvup->notifications.offset = vvup->doorbells.offset + vvup->doorbells.size;
+    vvup->notifications.size = 0x1000;
+    vvup->notifications.type = VIRTIO_PCI_CAP_NOTIFICATION_CFG;
+
+    /* cap.offset and cap.length must be 4096-byte (0x1000) aligned. */
+    vvup->shared_memory.offset = vvup->notifications.offset
+        + vvup->notifications.size;
+    vvup->shared_memory.offset = QEMU_ALIGN_UP(vvup->shared_memory.offset,
+        4096);
+    /* TODO Reconsider the shared memory cap.length later */
+    /*
+     * The size of the shared memory region in the additional resources BAR
+     * doesn't fit into the length field (uint32_t) of the virtio capability
+     * structure. However, we don't need to pass this information to the guest
+     * driver via the shared memory capability because the guest can figure out
+     * the length of the vhost memory regions from the SET_MEM_TABLE vhost-user
+     * messages. Therefore, the size of the shared memory region that we are
+     * declaring here has no meaning and the guest driver shouldn't rely on
+     * this.
+     */
+    vvup->shared_memory.size = 0x1000;
+    vvup->shared_memory.type = VIRTIO_PCI_CAP_SHARED_MEMORY_CFG;
+
+    /*
+     * Initialize the MMIO MemoryRegions for the additional device
+     *resources.
+     */
+
+    const struct MemoryRegionOps doorbell_ops = {
+        .read = virtio_vhost_user_doorbells_read,
+        .write = virtio_vhost_user_doorbells_write,
+        .impl = {
+            .min_access_size = 1,
+            .max_access_size = 4,
+        },
+        .endianness = DEVICE_LITTLE_ENDIAN,
+    };
+
+    const struct MemoryRegionOps notification_ops = {
+        .read = virtio_vhost_user_notification_read,
+        .write = virtio_vhost_user_notification_write,
+        .impl = {
+            .min_access_size = 1,
+            .max_access_size = 4,
+        },
+        .endianness = DEVICE_LITTLE_ENDIAN,
+    };
+
+    memory_region_init_io(&vvup->doorbells.mr, OBJECT(vvup),
+                   &doorbell_ops, vvup, "virtio-vhost-user-doorbell-cfg",
+                   vvup->doorbells.size);
+
+    memory_region_init_io(&vvup->notifications.mr, OBJECT(vvup),
+                    &notification_ops, vvup,
+                    "virtio-vhost-user-notification-cfg",
+                    vvup->notifications.size);
+
+    /*
+     * Register the virtio PCI configuration structures
+     * for the additional device resources. This involves
+     * registering the corresponding MemoryRegions as
+     * subregions of the additional_resources_bar and creating
+     * virtio capabilities.
+     */
+    struct virtio_pci_cap cap = {
+        .cap_len = sizeof cap,
+    };
+    struct virtio_pci_doorbell_cap doorbell = {
+        .cap.cap_len = sizeof doorbell,
+        .doorbell_off_multiplier =
+            cpu_to_le32(virtio_pci_queue_mem_mult(proxy)),
+    };
+    virtio_pci_modern_region_map(proxy, &vvup->doorbells, &doorbell.cap,
+                                 &vvup->additional_resources_bar, bar_index);
+    virtio_pci_modern_region_map(proxy, &vvup->notifications, &cap,
+                                 &vvup->additional_resources_bar, bar_index);
+    virtio_pci_modern_region_map(proxy, &vvup->shared_memory, &cap,
+                                 &vvup->additional_resources_bar, bar_index);
+}
+
+static void vvu_cleanup_bar(VirtIOVhostUserPCI *vvup)
+{
+    memory_region_del_subregion(&vvup->additional_resources_bar,
+                                &vvup->doorbells.mr);
+    memory_region_del_subregion(&vvup->additional_resources_bar,
+                                &vvup->notifications.mr);
+}
+
+void virtio_vhost_user_cleanup_additional_resources(VirtIOVhostUser *s)
+{
+    VirtIOVhostUserPCI *vvup = container_of(s, struct VirtIOVhostUserPCI, vdev);
+    VirtioVhostUserPCIClass *vvup_class = VIRTIO_VHOST_USER_PCI_GET_CLASS(vvup);
+
+    vvup_class->cleanup_bar(vvup);
+}
+
+static void virtio_vhost_user_pci_realize(VirtIOPCIProxy *vpci_dev,
+                                          Error **errp)
+{
+    VirtIOVhostUserPCI *vvup = VIRTIO_VHOST_USER_PCI(vpci_dev);
+    DeviceState *vdev = DEVICE(&vvup->vdev);
+
+    if (vpci_dev->nvectors == DEV_NVECTORS_UNSPECIFIED) {
+        vpci_dev->nvectors = VIRTIO_QUEUE_MAX + 3;
+    }
+
+    virtio_vhost_user_init_bar(vvup);
+
+    qdev_set_parent_bus(vdev, BUS(&vpci_dev->bus), &error_abort);
+    object_property_set_bool(OBJECT(vdev), "realized", true, errp);
+}
+
+static void virtio_vhost_user_pci_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    VirtioPCIClass *k = VIRTIO_PCI_CLASS(klass);
+    PCIDeviceClass *pcidev_k = PCI_DEVICE_CLASS(klass);
+    VirtioVhostUserPCIClass *vvup_class = VIRTIO_VHOST_USER_PCI_CLASS(klass);
+
+    device_class_set_props(dc, virtio_vhost_user_pci_properties);
+    k->realize = virtio_vhost_user_pci_realize;
+    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
+
+    pcidev_k->vendor_id = PCI_VENDOR_ID_REDHAT_QUMRANET;
+    pcidev_k->device_id = PCI_DEVICE_ID_VIRTIO_VHOST_USER;
+    pcidev_k->revision = VIRTIO_PCI_ABI_VERSION;
+    pcidev_k->class_id = PCI_CLASS_OTHERS;
+
+    vvup_class->set_vhost_mem_regions = vvu_set_vhost_mem_regions;
+    vvup_class->delete_vhost_mem_region = vvu_delete_vhost_mem_region;
+    vvup_class->cleanup_bar = vvu_cleanup_bar;
+    vvup_class->register_doorbell = vvu_register_doorbell;
+    vvup_class->unregister_doorbell = vvu_unregister_doorbell;
+}
+
+static void virtio_vhost_user_pci_initfn(Object *obj)
+{
+    VirtIOVhostUserPCI *dev = VIRTIO_VHOST_USER_PCI(obj);
+
+     virtio_instance_init_common(obj, &dev->vdev, sizeof(dev->vdev),
+                                TYPE_VIRTIO_VHOST_USER);
+}
+
+static const VirtioPCIDeviceTypeInfo virtio_vhost_user_pci_info = {
+    .base_name     = TYPE_VIRTIO_VHOST_USER_PCI,
+    .generic_name  = "virtio-vhost-user-pci",
+    .instance_size = sizeof(VirtIOVhostUserPCI),
+    .instance_init = virtio_vhost_user_pci_initfn,
+    .class_size    = sizeof(VirtioVhostUserPCIClass),
+    .class_init    = virtio_vhost_user_pci_class_init,
+};
+
+static void virtio_vhost_user_pci_register_types(void)
+{
+    virtio_pci_types_register(&virtio_vhost_user_pci_info);
+}
+
+type_init(virtio_vhost_user_pci_register_types);
diff --git a/hw/virtio/virtio-vhost-user.c b/hw/virtio/virtio-vhost-user.c
new file mode 100644
index 0000000000..6e4c6ec11c
--- /dev/null
+++ b/hw/virtio/virtio-vhost-user.c
@@ -0,0 +1,1066 @@
+/*
+ * Virtio Vhost-user Device
+ *
+ * Copyright (C) 2017-2018 Red Hat, Inc.
+ *
+ * Authors:
+ *  Stefan Hajnoczi   <stefanha@redhat.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#include "qemu/osdep.h"
+#include "standard-headers/linux/virtio_ids.h"
+#include "qapi/error.h"
+#include "qemu/iov.h"
+#include "qemu/sockets.h"
+#include "hw/virtio/virtio-access.h"
+#include "hw/virtio/virtio-vhost-user.h"
+#include "trace.h"
+#include "qemu/uuid.h"
+
+enum VhostUserProtocolFeature {
+    VHOST_USER_PROTOCOL_F_MQ = 0,
+    VHOST_USER_PROTOCOL_F_LOG_SHMFD = 1,
+    VHOST_USER_PROTOCOL_F_RARP = 2,
+    VHOST_USER_PROTOCOL_F_REPLY_ACK = 3,
+    VHOST_USER_PROTOCOL_F_NET_MTU = 4,
+    VHOST_USER_PROTOCOL_F_BACKEND_REQ = 5,
+    VHOST_USER_PROTOCOL_F_CROSS_ENDIAN = 6,
+    VHOST_USER_PROTOCOL_F_CRYPTO_SESSION = 7,
+    VHOST_USER_PROTOCOL_F_PAGEFAULT = 8,
+    VHOST_USER_PROTOCOL_F_CONFIG = 9,
+    VHOST_USER_PROTOCOL_F_BACKEND_SEND_FD = 10,
+    VHOST_USER_PROTOCOL_F_HOST_NOTIFIER = 11,
+    VHOST_USER_PROTOCOL_F_INFLIGHT_SHMFD = 12,
+    VHOST_USER_PROTOCOL_F_RESET_DEVICE = 13,
+    /* Feature 14 reserved for VHOST_USER_PROTOCOL_F_INBAND_NOTIFICATIONS. */
+    VHOST_USER_PROTOCOL_F_CONFIGURE_MEM_SLOTS = 15,
+    VHOST_USER_PROTOCOL_F_MAX
+};
+
+/* vmstate migration version number */
+#define VIRTIO_VHOST_USER_VM_VERSION    0
+
+/*
+ * Descriptor ring size.  Only one vhost-user protocol message is processed at
+ * a time but later messages can be queued.
+ */
+#define VIRTIO_VHOST_USER_VIRTQUEUE_SIZE 128
+
+/* Protocol features that have been implemented */
+#define SUPPORTED_VHOST_USER_FEATURES \
+    (VHOST_USER_PROTOCOL_F_MQ | VHOST_USER_PROTOCOL_F_REPLY_ACK)
+
+/*
+ * Connection state machine
+ *
+ * The vhost-user frontend might not always be connected and the driver might
+ * not always be ready either.  The device interface has a way to manage
+ * connection establishment:
+ *
+ * The driver indicates readiness with the VIRTIO_VHOST_USER_STATUS_BACKEND_UP
+ * status bit.  The device then begins establishing a connection with the
+ * vhost-user frontend. The VIRTIO_VHOST_USER_STATUS_FRONTEND_UP status bit is
+ * set when connected.
+ *
+ * The driver may decide it wants to disconnect at any time.  Vhost-user
+ * protocol violations and other errors might cause the device to give up on
+ * the connection too.
+ *
+ * This state machine captures all transitions in one place.  This way the
+ * connection management code isn't sprinkled around many locations.
+ */
+typedef enum {
+    CONN_STATE_UNDEFINED,
+    CONN_STATE_INITIAL,     /* !BACKEND_UP + !CHR_OPENED */
+    CONN_STATE_BACKEND_UP,    /* BACKEND_UP + !CHR_OPENED */
+    CONN_STATE_CHR_OPENED,  /* !BACKEND_UP + CHR_OPENED */
+    CONN_STATE_CONNECTED,   /* BACKEND_UP + CHR_OPENED */
+    CONN_STATE_MAX
+} ConnectionState;
+
+typedef enum {
+    /* Driver sets VIRTIO_VHOST_USER_STATUS_BACKEND_UP */
+    CONN_EVENT_BACKEND_UP,
+
+    /* Driver clears VIRTIO_VHOST_USER_STATUS_BACKEND_UP */
+    CONN_EVENT_BACKEND_DOWN,
+
+    /* Socket connected and also each time we update chardev handlers */
+    CONN_EVENT_CHR_OPENED,
+
+    /* Socket disconnected */
+    CONN_EVENT_CHR_CLOSED,
+
+    /* Socket chardev was replaced */
+    CONN_EVENT_CHR_CHANGE,
+
+    /* Socket I/O error */
+    CONN_EVENT_SOCKET_ERROR,
+
+    /* Virtio device reset */
+    CONN_EVENT_DEVICE_RESET,
+
+    /* Vhost-user protocol violation by frontend */
+    CONN_EVENT_FRONTEND_EINVAL,
+
+    /* Vhost-user protocol violation by backend */
+    CONN_EVENT_BACKEND_EINVAL,
+
+    CONN_EVENT_MAX
+} ConnectionEvent;
+
+static void conn_state_transition(VirtIOVhostUser *s, ConnectionEvent evt);
+
+static void virtio_vhost_user_reset_async_state(VirtIOVhostUser *s)
+{
+    s->read_bytes_needed = 0;
+    s->read_ptr = NULL;
+    s->read_done = NULL;
+    s->read_waiting_on_rxq = false;
+    s->read_msg_size = 0;
+
+    s->write_bytes_avail = 0;
+    s->write_ptr = NULL;
+    s->write_done = NULL;
+    if (s->write_watch_tag) {
+        g_source_remove(s->write_watch_tag);
+    }
+    s->write_watch_tag = 0;
+}
+
+static void virtio_vhost_user_chr_event(void *opaque, QEMUChrEvent event)
+{
+    VirtIOVhostUser *s = opaque;
+
+    trace_virtio_vhost_user_chr_event(s, event);
+
+    switch (event) {
+    case CHR_EVENT_OPENED:
+        conn_state_transition(s, CONN_EVENT_CHR_OPENED);
+        break;
+    case CHR_EVENT_CLOSED:
+        conn_state_transition(s, CONN_EVENT_CHR_CLOSED);
+        break;
+    case CHR_EVENT_BREAK:
+    case CHR_EVENT_MUX_IN:
+    case CHR_EVENT_MUX_OUT:
+        /* Ignore */
+        break;
+    }
+}
+
+static int virtio_vhost_user_chr_change(void *opaque)
+{
+    VirtIOVhostUser *s = opaque;
+
+    trace_virtio_vhost_user_chr_change(s);
+
+    if (s->config.status & VIRTIO_VHOST_USER_STATUS_FRONTEND_UP) {
+        conn_state_transition(s, CONN_EVENT_CHR_CHANGE);
+    }
+    return 0;
+}
+
+static int virtio_vhost_user_chr_can_read(void *opaque)
+{
+    VirtIOVhostUser *s = opaque;
+
+    return s->read_bytes_needed;
+}
+
+static void virtio_vhost_user_chr_read(void *opaque,
+                                       const uint8_t *buf, int size)
+{
+    VirtIOVhostUser *s = opaque;
+
+    assert(size <= s->read_bytes_needed);
+
+    memcpy(s->read_ptr, buf, size);
+    s->read_ptr += size;
+    s->read_bytes_needed -= size;
+
+    if (s->read_bytes_needed == 0) {
+        qemu_chr_fe_set_handlers(&s->chr, NULL, NULL,
+                virtio_vhost_user_chr_event,
+                virtio_vhost_user_chr_change,
+                s, NULL, false);
+
+        s->read_done(s);
+    }
+}
+
+/* Start reading from vhost-user socket */
+static void virtio_vhost_user_aio_read(VirtIOVhostUser *s,
+                                       void *buf, size_t len,
+                                       void (*done)(VirtIOVhostUser *s))
+{
+    assert(s->read_bytes_needed == 0);
+
+    s->read_ptr = buf;
+    s->read_bytes_needed = len;
+    s->read_done = done;
+
+    qemu_chr_fe_set_handlers(&s->chr,
+            virtio_vhost_user_chr_can_read,
+            virtio_vhost_user_chr_read,
+            virtio_vhost_user_chr_event,
+            virtio_vhost_user_chr_change,
+            s, NULL, false);
+}
+
+/* Called once with chan=NULL, cond=0 to begin and then called by event loop */
+static gboolean virtio_vhost_user_chr_write(void *do_not_use, GIOCondition cond,
+                                            void *opaque)
+{
+    VirtIOVhostUser *s = opaque;
+    int nwritten;
+    guint tag = s->write_watch_tag;
+
+    nwritten = qemu_chr_fe_write(&s->chr, s->write_ptr, s->write_bytes_avail);
+    if (nwritten < 0) {
+        if (errno == EAGAIN) {
+            nwritten = 0;
+        } else {
+            conn_state_transition(s, CONN_EVENT_SOCKET_ERROR);
+            return G_SOURCE_REMOVE;
+        }
+    }
+
+    s->write_bytes_avail -= nwritten;
+    if (s->write_bytes_avail == 0) {
+        s->write_done(s);
+        return G_SOURCE_REMOVE;
+    }
+
+    if (tag == 0) {
+        tag = qemu_chr_fe_add_watch(&s->chr, G_IO_OUT | G_IO_HUP,
+                                    virtio_vhost_user_chr_write, s);
+        if (!tag) {
+            conn_state_transition(s, CONN_EVENT_SOCKET_ERROR);
+            return G_SOURCE_REMOVE;
+        }
+
+        s->write_watch_tag = tag;
+    }
+
+    return G_SOURCE_CONTINUE;
+}
+
+/* Start writing to vhost-user socket */
+static void virtio_vhost_user_aio_write(VirtIOVhostUser *s,
+                                        void *buf, size_t len,
+                                        void (*done)(VirtIOVhostUser *s))
+{
+    assert(s->write_bytes_avail == 0);
+
+    s->write_ptr = buf;
+    s->write_bytes_avail = len;
+    s->write_done = done;
+
+    virtio_vhost_user_chr_write(NULL, 0, s);
+}
+
+static void virtio_vhost_user_cleanup_kickfds(VirtIOVhostUser *s)
+{
+    size_t i;
+
+    for (i = 0; i < ARRAY_SIZE(s->kickfds); i++) {
+        if (event_notifier_get_fd(&s->kickfds[i].guest_notifier) >= 0) {
+            /* Remove the kickfd from the main event loop */
+            event_notifier_set_handler(&s->kickfds[i].guest_notifier, NULL);
+            close(s->kickfds[i].guest_notifier.rfd);
+            event_notifier_init_fd(&s->kickfds[i].guest_notifier, -1);
+            s->kickfds[i].msi_vector = VIRTIO_NO_VECTOR;
+        }
+    }
+}
+
+static void virtio_vhost_user_cleanup_callfds(VirtIOVhostUser *s)
+{
+    size_t i;
+
+    for (i = 0; i < ARRAY_SIZE(s->callfds); i++) {
+        if (event_notifier_get_fd(&s->callfds[i]) >= 0) {
+            virtio_vhost_user_unregister_doorbell(s, &s->callfds[i], i);
+            close(s->callfds[i].rfd);
+            event_notifier_init_fd(&s->callfds[i], -1);
+        }
+    }
+}
+
+static void virtio_vhost_user_cleanup_mem_table(VirtIOVhostUser *s)
+{
+    int i;
+
+    for (i = 0; i < VHOST_MEMORY_MAX_NREGIONS; i++) {
+        VirtIOVhostUserMemTableRegion *region = &s->mem_table[i];
+
+        if (!region->mmap_addr) {
+            continue;
+        }
+
+        munmap(region->mmap_addr, region->total_size);
+        region->mmap_addr = NULL;
+
+        virtio_vhost_user_delete_vhost_mem_region(s, &region->mr);
+    }
+}
+
+static void conn_action_set_backend_up(VirtIOVhostUser *s)
+{
+    /* Guest-initiated, no need for virtio_notify_config() */
+    s->config.status = VIRTIO_VHOST_USER_STATUS_BACKEND_UP;
+}
+
+static void conn_action_set_backend_down(VirtIOVhostUser *s)
+{
+    /* Guest-initiated, no need for virtio_notify_config() */
+    s->config.status = 0;
+}
+
+static void virtio_vhost_user_hdr_done(VirtIOVhostUser *s);
+
+static void conn_action_connect(VirtIOVhostUser *s)
+{
+    s->config.status = VIRTIO_VHOST_USER_STATUS_BACKEND_UP |
+                       VIRTIO_VHOST_USER_STATUS_FRONTEND_UP;
+    virtio_notify_config(VIRTIO_DEVICE(s));
+
+    /* Begin servicing vhost-user messages */
+    virtio_vhost_user_aio_read(s, &s->read_msg, VHOST_USER_HDR_SIZE,
+                               virtio_vhost_user_hdr_done);
+}
+
+static void conn_action_disconnect_no_notify(VirtIOVhostUser *s)
+{
+    qemu_chr_fe_set_handlers(&s->chr,
+            NULL,
+            NULL,
+            virtio_vhost_user_chr_event,
+            virtio_vhost_user_chr_change,
+            s, NULL, false);
+    qemu_chr_fe_set_open(&s->chr, 0);
+
+    virtio_vhost_user_reset_async_state(s);
+
+    /* TODO drain txq? */
+
+    /*
+     * It is only safe to clean up resources where future accesses have no
+     * guest-visible effects.  Vcpus may still access resources if they haven't
+     * noticed the disconnect event yet.  Callfds are safe since writes to
+     * invalid indices are ignored.  Memory table regions cannot be unmapped
+     * since vring polling may still be running.
+     */
+    virtio_vhost_user_cleanup_kickfds(s);
+    virtio_vhost_user_cleanup_callfds(s);
+
+    s->config.status = 0;
+}
+
+static void conn_action_disconnect(VirtIOVhostUser *s)
+{
+    conn_action_disconnect_no_notify(s);
+    virtio_notify_config(VIRTIO_DEVICE(s));
+}
+
+static const struct {
+    void (*action)(VirtIOVhostUser *s);
+    ConnectionState new_state;
+} conn_state_machine[CONN_STATE_MAX][CONN_EVENT_MAX] = {
+    [CONN_STATE_INITIAL] = {
+        [CONN_EVENT_BACKEND_UP] = {conn_action_set_backend_up,
+                                 CONN_STATE_BACKEND_UP},
+        [CONN_EVENT_CHR_OPENED] = {NULL, CONN_STATE_CHR_OPENED},
+        [CONN_EVENT_CHR_CLOSED] = {NULL, CONN_STATE_INITIAL},
+        [CONN_EVENT_CHR_CHANGE] = {NULL, CONN_STATE_INITIAL},
+        [CONN_EVENT_DEVICE_RESET] = {NULL, CONN_STATE_INITIAL},
+    },
+    [CONN_STATE_BACKEND_UP] = {
+        [CONN_EVENT_BACKEND_DOWN] = {conn_action_set_backend_down,
+                                   CONN_STATE_INITIAL},
+        [CONN_EVENT_CHR_OPENED] = {conn_action_connect, CONN_STATE_CONNECTED},
+        [CONN_EVENT_CHR_CLOSED] = {NULL, CONN_STATE_BACKEND_UP},
+        [CONN_EVENT_CHR_CHANGE] = {NULL, CONN_STATE_BACKEND_UP},
+        [CONN_EVENT_DEVICE_RESET] = {conn_action_set_backend_down,
+                                     CONN_STATE_INITIAL},
+    },
+    [CONN_STATE_CHR_OPENED] = {
+        [CONN_EVENT_BACKEND_UP] = {conn_action_connect, CONN_STATE_CONNECTED},
+        [CONN_EVENT_CHR_OPENED] = {NULL, CONN_STATE_CHR_OPENED},
+        [CONN_EVENT_CHR_CLOSED] = {NULL, CONN_STATE_INITIAL},
+        [CONN_EVENT_CHR_CHANGE] = {NULL, CONN_STATE_CHR_OPENED},
+        [CONN_EVENT_DEVICE_RESET] = {NULL, CONN_STATE_INITIAL},
+    },
+    [CONN_STATE_CONNECTED] = {
+        [CONN_EVENT_BACKEND_DOWN] = {conn_action_disconnect_no_notify,
+                                   CONN_STATE_INITIAL},
+        [CONN_EVENT_CHR_OPENED] = {NULL, CONN_STATE_CONNECTED},
+        [CONN_EVENT_CHR_CLOSED] = {conn_action_disconnect,
+                                   CONN_STATE_INITIAL},
+        [CONN_EVENT_CHR_CHANGE] = {conn_action_disconnect, CONN_STATE_INITIAL},
+        [CONN_EVENT_SOCKET_ERROR] = {conn_action_disconnect,
+                                     CONN_STATE_INITIAL},
+        [CONN_EVENT_DEVICE_RESET] = {conn_action_disconnect_no_notify,
+                                     CONN_STATE_INITIAL},
+        [CONN_EVENT_FRONTEND_EINVAL] = {conn_action_disconnect,
+                                      CONN_STATE_INITIAL},
+        [CONN_EVENT_BACKEND_EINVAL] = {conn_action_disconnect,
+                                     CONN_STATE_INITIAL},
+    },
+};
+
+static void conn_state_transition(VirtIOVhostUser *s, ConnectionEvent evt)
+{
+    ConnectionState old_state = s->conn_state;
+    ConnectionState new_state = conn_state_machine[old_state][evt].new_state;
+
+    trace_virtio_vhost_user_conn_state_transition(s, old_state, evt,
+                                                  new_state);
+    assert(new_state != CONN_STATE_UNDEFINED);
+
+    s->conn_state = new_state;
+
+    if (conn_state_machine[old_state][evt].action) {
+        conn_state_machine[old_state][evt].action(s);
+    }
+}
+
+/*
+ * Frontend-to-backend message processing
+ *
+ * Messages are read from the vhost-user socket into s->read_msg.  They are
+ * then parsed and may be modified.  Finally they are put onto the rxq for the
+ * driver to read.
+ *
+ * Functions with "m2s" in their name handle the frontend-to-backend code path.
+ */
+
+/* Put s->read_msg onto the rxq */
+static void virtio_vhost_user_deliver_m2s(VirtIOVhostUser *s)
+{
+    VirtQueueElement *elem;
+    size_t copied;
+
+    elem = virtqueue_pop(s->rxq, sizeof(*elem));
+    if (!elem) {
+        /* Leave message in s->read_msg and wait for rxq */
+        trace_virtio_vhost_user_rxq_empty(s);
+        s->read_waiting_on_rxq = true;
+        return;
+    }
+
+    s->read_waiting_on_rxq = false;
+
+    copied = iov_from_buf(elem->in_sg, elem->in_num, 0, &s->read_msg,
+                          s->read_msg_size);
+    if (copied != s->read_msg_size) {
+        g_free(elem);
+        virtio_error(VIRTIO_DEVICE(s),
+                     "rxq buffer too small, got %zu, needed %zu",
+                     copied, s->read_msg_size);
+        return;
+    }
+
+    virtqueue_push(s->rxq, elem, copied);
+    g_free(elem);
+
+    virtio_notify(VIRTIO_DEVICE(s), s->rxq);
+
+    /* Next message, please */
+    virtio_vhost_user_aio_read(s, &s->read_msg, VHOST_USER_HDR_SIZE,
+                               virtio_vhost_user_hdr_done);
+}
+
+static void m2s_get_vring_base(VirtIOVhostUser *s)
+{
+    unsigned int vq_idx;
+
+    vq_idx = s->read_msg.payload.state.index;
+
+    if (event_notifier_get_fd(&s->kickfds[vq_idx].guest_notifier) >= 0) {
+        /* Remove the kickfd from the main event loop */
+        event_notifier_set_handler(&s->kickfds[vq_idx].guest_notifier, NULL);
+        close(s->kickfds[vq_idx].guest_notifier.rfd);
+        event_notifier_init_fd(&s->kickfds[vq_idx].guest_notifier, -1);
+    }
+
+    if (event_notifier_get_fd(&s->callfds[vq_idx]) >= 0) {
+        virtio_vhost_user_unregister_doorbell(s, &s->callfds[vq_idx], vq_idx);
+        close(s->callfds[vq_idx].rfd);
+        event_notifier_init_fd(&s->callfds[vq_idx], -1);
+    }
+}
+
+static void m2s_set_vring_kick(VirtIOVhostUser *s)
+{
+    uint8_t vq_idx;
+    int fd;
+
+    vq_idx = s->read_msg.payload.u64 & VHOST_USER_VRING_IDX_MASK;
+
+    if (s->read_msg.payload.u64 & VHOST_USER_VRING_NOFD_MASK) {
+        fd = -1;
+    } else {
+        fd = qemu_chr_fe_get_msgfd(&s->chr);
+
+        /* Must not block when reach max eventfd counter value */
+        qemu_socket_set_nonblock(fd);
+    }
+
+    if (event_notifier_get_fd(&s->kickfds[vq_idx].guest_notifier) >= 0) {
+        /* Remove the kickfd from the main event loop */
+        event_notifier_set_handler(&s->kickfds[vq_idx].guest_notifier, NULL);
+        close(s->kickfds[vq_idx].guest_notifier.rfd);
+        event_notifier_init_fd(&s->kickfds[vq_idx].guest_notifier, -1);
+    }
+
+    /* Initialize the EventNotifier with the received kickfd */
+    event_notifier_init_fd(&s->kickfds[vq_idx].guest_notifier, fd);
+
+    /* Insert the kickfd in the main event loop */
+    if (fd != -1) {
+        event_notifier_set_handler(&s->kickfds[vq_idx].guest_notifier,
+            virtio_vhost_user_guest_notifier_read);
+    }
+}
+
+static void m2s_set_vring_call(VirtIOVhostUser *s)
+{
+    uint8_t vq_idx;
+    int fd;
+
+    vq_idx = s->read_msg.payload.u64 & VHOST_USER_VRING_IDX_MASK;
+
+    /* We should always have a large enough array */
+    QEMU_BUILD_BUG_ON(0xff >= ARRAY_SIZE(s->callfds));
+
+    if (s->read_msg.payload.u64 & VHOST_USER_VRING_NOFD_MASK) {
+        fd = -1;
+    } else {
+        fd = qemu_chr_fe_get_msgfd(&s->chr);
+
+        /* Must not block when reach max eventfd counter value */
+        qemu_socket_set_nonblock(fd);
+    }
+
+    if (event_notifier_get_fd(&s->callfds[vq_idx]) >= 0) {
+        virtio_vhost_user_unregister_doorbell(s, &s->callfds[vq_idx], vq_idx);
+        close(s->callfds[vq_idx].rfd);
+        event_notifier_init_fd(&s->callfds[vq_idx], -1);
+    }
+
+    /* Initialize the EventNotifier with the received callfd */
+    event_notifier_init_fd(&s->callfds[vq_idx], fd);
+
+    /* Register the EventNotifier as an ioeventfd. */
+    if (fd != -1) {
+        virtio_vhost_user_register_doorbell(s, &s->callfds[vq_idx], vq_idx);
+    }
+}
+
+static void m2s_set_mem_table(VirtIOVhostUser *s)
+{
+    VhostUserMemory m = s->read_msg.payload.memory, *memory = &m;
+    int fds[VHOST_MEMORY_MAX_NREGIONS];
+    int num_fds;
+    uint32_t i;
+
+    if (memory->nregions > VHOST_MEMORY_MAX_NREGIONS) {
+        conn_state_transition(s, CONN_EVENT_FRONTEND_EINVAL);
+        return;
+    }
+
+    num_fds = qemu_chr_fe_get_msgfds(&s->chr, fds, ARRAY_SIZE(fds));
+    if (num_fds != memory->nregions) {
+        conn_state_transition(s, CONN_EVENT_FRONTEND_EINVAL);
+        return;
+    }
+
+    virtio_vhost_user_cleanup_mem_table(s);
+
+    for (i = 0; i < memory->nregions; i++) {
+        VhostUserMemoryRegion *input = &memory->regions[i];
+        VirtIOVhostUserMemTableRegion *region = &s->mem_table[i];
+        void *mmap_addr;
+
+        region->total_size = input->mmap_offset + input->memory_size;
+        if (region->total_size < input->mmap_offset ||
+            region->total_size < input->memory_size) {
+            goto err;
+        }
+
+        mmap_addr = mmap(0, region->total_size, PROT_READ | PROT_WRITE,
+                         MAP_SHARED, fds[i], 0);
+        close(fds[i]);
+        fds[i] = -1;
+        if (mmap_addr == MAP_FAILED) {
+            goto err;
+        }
+        region->mmap_addr = mmap_addr;
+
+        trace_virtio_vhost_user_memory_region(s,
+                memory->regions[i].guest_phys_addr,
+                memory->regions[i].memory_size,
+                memory->regions[i].userspace_addr,
+                memory->regions[i].mmap_offset,
+                region->mmap_addr);
+    }
+
+    /*
+     * Export the mmapped vhost memory regions to the guest through PCI
+     * transport
+     */
+    virtio_vhost_user_set_vhost_mem_regions(s);
+
+    return;
+
+err:
+    for (i = 0; i < memory->nregions; i++) {
+        if (fds[i] >= 0) {
+            close(fds[i]);
+        }
+    }
+    conn_state_transition(s, CONN_EVENT_FRONTEND_EINVAL);
+}
+
+static void m2s_set_protocol_features(VirtIOVhostUser *s)
+{
+    /* Only allow features we support too */
+    s->read_msg.payload.u64 &= SUPPORTED_VHOST_USER_FEATURES;
+}
+
+/* Parse s->read_msg from frontend */
+static void virtio_vhost_user_parse_m2s(VirtIOVhostUser *s)
+{
+    uint32_t version = s->read_msg.hdr.flags & VHOST_USER_VERSION_MASK;
+
+    if (version != VHOST_USER_VERSION) {
+        trace_virtio_vhost_user_m2s_bad_version(s, version);
+        conn_state_transition(s, CONN_EVENT_FRONTEND_EINVAL);
+        return;
+    }
+
+    if (s->read_msg.hdr.flags & VHOST_USER_REPLY_MASK) {
+        trace_virtio_vhost_user_m2s_unexpected_reply(s);
+        conn_state_transition(s, CONN_EVENT_FRONTEND_EINVAL);
+        return;
+    }
+
+    if (s->read_msg.hdr.request >= VHOST_USER_MAX) {
+        trace_virtio_vhost_user_m2s_bad_request(s, s->read_msg.hdr.request);
+        conn_state_transition(s, CONN_EVENT_FRONTEND_EINVAL);
+        return;
+    }
+
+    trace_virtio_vhost_user_m2s_request(s, s->read_msg.hdr.request);
+
+    /* Most messages are passed through but a few need to be handled */
+    switch (s->read_msg.hdr.request) {
+    case VHOST_USER_GET_FEATURES:
+        break;
+    case VHOST_USER_SET_FEATURES:
+        break;
+    case VHOST_USER_SET_OWNER:
+        break;
+    case VHOST_USER_RESET_OWNER:
+        break;
+    case VHOST_USER_SET_MEM_TABLE:
+        m2s_set_mem_table(s);
+        break;
+    case VHOST_USER_SET_VRING_NUM:
+        break;
+    case VHOST_USER_SET_VRING_ADDR:
+        break;
+    case VHOST_USER_SET_VRING_BASE:
+        break;
+    case VHOST_USER_GET_VRING_BASE:
+        m2s_get_vring_base(s);
+        break;
+    case VHOST_USER_SET_VRING_KICK:
+        m2s_set_vring_kick(s);
+        break;
+    case VHOST_USER_SET_VRING_CALL:
+        m2s_set_vring_call(s);
+        break;
+    case VHOST_USER_GET_PROTOCOL_FEATURES:
+        break;
+    case VHOST_USER_SET_PROTOCOL_FEATURES:
+        m2s_set_protocol_features(s);
+        break;
+    case VHOST_USER_GET_QUEUE_NUM:
+        break;
+    case VHOST_USER_SET_VRING_ENABLE:
+        break;
+    default:
+        trace_virtio_vhost_user_m2s_unknown_request(s, s->read_msg.hdr.request);
+        conn_state_transition(s, CONN_EVENT_FRONTEND_EINVAL);
+        return;
+    }
+
+    /* Bail if a handler function reset the connection */
+    if (s->conn_state != CONN_STATE_CONNECTED) {
+        return;
+    }
+
+    /* Stash size before we endian-convert s->read_msg */
+    s->read_msg_size = VHOST_USER_HDR_SIZE + s->read_msg.hdr.size;
+
+    /* TODO convert read_msg to little-endian for cross-endian support */
+
+    virtio_vhost_user_deliver_m2s(s);
+}
+
+static void virtio_vhost_user_hdr_done(VirtIOVhostUser *s)
+{
+    if (s->read_msg.hdr.size > VHOST_USER_PAYLOAD_SIZE) {
+        trace_virtio_vhost_user_m2s_bad_payload_size(s, s->read_msg.hdr.size);
+        conn_state_transition(s, CONN_EVENT_FRONTEND_EINVAL);
+        return;
+    }
+
+    /* Clear out unused payload bytes */
+    memset(&s->read_msg.payload, 0, VHOST_USER_PAYLOAD_SIZE);
+
+    if (s->read_msg.hdr.size > 0) {
+        virtio_vhost_user_aio_read(s, &s->read_msg.payload,
+                                   s->read_msg.hdr.size,
+                                   virtio_vhost_user_parse_m2s);
+    } else {
+        virtio_vhost_user_parse_m2s(s);
+    }
+}
+
+static void virtio_vhost_user_rxq(VirtIODevice *vdev, VirtQueue *vq)
+{
+    VirtIOVhostUser *s = VIRTIO_VHOST_USER(vdev);
+
+    if (s->read_waiting_on_rxq) {
+        virtio_vhost_user_deliver_m2s(s);
+    }
+}
+
+/*
+ * Backend-to-frontend message processing
+ *
+ * Messages are read from the txq into s->write_msg.  They are then parsed and
+ * may be modified.  Finally they are written to the vhost-user socket.
+ *
+ * Functions with "s2m" in their name handle the backend-to-frontend code path.
+ */
+
+static void s2m_get_protocol_features(VirtIOVhostUser *s)
+{
+    /* Only allow features we support too */
+    s->write_msg.payload.u64 &= SUPPORTED_VHOST_USER_FEATURES;
+}
+
+static void virtio_vhost_user_tx_done(VirtIOVhostUser *s);
+
+/* Parse s->write_msg from backend */
+static void virtio_vhost_user_parse_s2m(VirtIOVhostUser *s)
+{
+    uint32_t version = s->write_msg.hdr.flags & VHOST_USER_VERSION_MASK;
+
+    if (version != VHOST_USER_VERSION) {
+        trace_virtio_vhost_user_s2m_bad_version(s, version);
+        conn_state_transition(s, CONN_EVENT_BACKEND_EINVAL);
+        return;
+    }
+
+    if (!(s->write_msg.hdr.flags & VHOST_USER_REPLY_MASK)) {
+        trace_virtio_vhost_user_s2m_expected_reply(s);
+        conn_state_transition(s, CONN_EVENT_BACKEND_EINVAL);
+        return;
+    }
+
+    if (s->write_msg.hdr.request >= VHOST_USER_MAX) {
+        trace_virtio_vhost_user_s2m_bad_request(s, s->write_msg.hdr.request);
+        conn_state_transition(s, CONN_EVENT_BACKEND_EINVAL);
+        return;
+    }
+
+    trace_virtio_vhost_user_s2m_request(s, s->write_msg.hdr.request);
+
+    /* Very few messages need to be touched */
+    switch (s->write_msg.hdr.request) {
+    case VHOST_USER_GET_FEATURES:
+        break;
+    case VHOST_USER_SET_FEATURES:
+        break;
+    case VHOST_USER_SET_OWNER:
+        break;
+    case VHOST_USER_RESET_OWNER:
+        break;
+    case VHOST_USER_SET_MEM_TABLE:
+        break;
+    case VHOST_USER_SET_VRING_NUM:
+        break;
+    case VHOST_USER_SET_VRING_ADDR:
+        break;
+    case VHOST_USER_SET_VRING_BASE:
+        break;
+    case VHOST_USER_GET_VRING_BASE:
+        break;
+    case VHOST_USER_SET_VRING_KICK:
+        break;
+    case VHOST_USER_SET_VRING_CALL:
+        break;
+    case VHOST_USER_GET_PROTOCOL_FEATURES:
+        s2m_get_protocol_features(s);
+        break;
+    case VHOST_USER_SET_PROTOCOL_FEATURES:
+        break;
+    case VHOST_USER_GET_QUEUE_NUM:
+        break;
+    case VHOST_USER_SET_VRING_ENABLE:
+        break;
+    default:
+        trace_virtio_vhost_user_s2m_unknown_request(s,
+                                                    s->write_msg.hdr.request);
+        conn_state_transition(s, CONN_EVENT_BACKEND_EINVAL);
+        return;
+    }
+
+    /* Bail if a handler function reset the connection */
+    if (s->conn_state != CONN_STATE_CONNECTED) {
+        return;
+    }
+
+    virtio_vhost_user_aio_write(s, &s->write_msg,
+                                VHOST_USER_HDR_SIZE + s->write_msg.hdr.size,
+                                virtio_vhost_user_tx_done);
+}
+
+static void virtio_vhost_user_txq(VirtIODevice *vdev, VirtQueue *vq)
+{
+    VirtIOVhostUser *s = VIRTIO_VHOST_USER(vdev);
+    VirtQueueElement *elem;
+    size_t msgsize;
+    size_t copied;
+
+    /* If the last message is still being transferred we'll come back later */
+    if (s->write_bytes_avail != 0) {
+        return;
+    }
+
+    elem = virtqueue_pop(s->txq, sizeof(*elem));
+    if (!elem) {
+        return; /* no elements left on virtqueue */
+    }
+
+    msgsize = iov_size(elem->out_sg, elem->out_num);
+    if (msgsize < VHOST_USER_HDR_SIZE || msgsize > sizeof(s->write_msg)) {
+        g_free(elem);
+        virtio_error(VIRTIO_DEVICE(s),
+                     "invalid txq buffer size, got %zu", msgsize);
+        return;
+    }
+
+    /* Clear out unused payload bytes */
+    memset(&s->write_msg.payload, 0, VHOST_USER_PAYLOAD_SIZE);
+
+    copied = iov_to_buf(elem->out_sg, elem->out_num, 0,
+                        &s->write_msg, msgsize);
+    if (copied != VHOST_USER_HDR_SIZE + s->write_msg.hdr.size ||
+        copied != msgsize) {
+        g_free(elem);
+        virtio_error(VIRTIO_DEVICE(s),
+                     "invalid txq buffer size, got %zu", msgsize);
+        return;
+    }
+
+    virtqueue_push(s->txq, elem, copied);
+    g_free(elem);
+
+    virtio_notify(VIRTIO_DEVICE(s), s->txq);
+
+    /* TODO convert from little-endian */
+
+    virtio_vhost_user_parse_s2m(s);
+}
+
+static void virtio_vhost_user_tx_done(VirtIOVhostUser *s)
+{
+    VirtIODevice *vdev = VIRTIO_DEVICE(s);
+    VirtQueue *vq = s->txq;
+
+    trace_virtio_vhost_user_tx_done(s);
+
+    /* Try to process more messages from the driver */
+    virtio_vhost_user_txq(vdev, vq);
+}
+
+static uint64_t
+virtio_vhost_user_get_features(VirtIODevice *vdev,
+                               uint64_t requested_features,
+                               Error **errp)
+{
+    return requested_features;
+}
+
+static void virtio_vhost_user_get_config(VirtIODevice *vdev, uint8_t *config)
+{
+    VirtIOVhostUserConfig *vvuconfig = (VirtIOVhostUserConfig *)config;
+    VirtIOVhostUser *s = VIRTIO_VHOST_USER(vdev);
+
+    virtio_stl_p(vdev, &vvuconfig->status, s->config.status);
+    virtio_stl_p(vdev, &vvuconfig->max_vhost_queues,
+                 s->config.max_vhost_queues);
+    memcpy(vvuconfig->uuid, s->config.uuid, sizeof(vvuconfig->uuid));
+}
+
+static void virtio_vhost_user_set_config(VirtIODevice *vdev,
+                                         const uint8_t *config)
+{
+    VirtIOVhostUserConfig *vvuconfig = (VirtIOVhostUserConfig *)config;
+    VirtIOVhostUser *s = VIRTIO_VHOST_USER(vdev);
+    uint32_t status;
+    bool old_backend_up;
+    bool new_backend_up;
+
+    status = virtio_ldl_p(vdev, &vvuconfig->status);
+    trace_virtio_vhost_user_set_config(s, s->config.status, status);
+    if (status & ~(VIRTIO_VHOST_USER_STATUS_BACKEND_UP |
+                   VIRTIO_VHOST_USER_STATUS_FRONTEND_UP)) {
+        virtio_error(vdev, "undefined virtio-vhost-user status bit set "
+                           "(0x%x)", status);
+        return;
+    }
+
+    old_backend_up = s->config.status & VIRTIO_VHOST_USER_STATUS_BACKEND_UP;
+    new_backend_up = status & VIRTIO_VHOST_USER_STATUS_BACKEND_UP;
+
+    if (!old_backend_up && new_backend_up) {
+        conn_state_transition(s, CONN_EVENT_BACKEND_UP);
+    } else if (old_backend_up && !new_backend_up) {
+        conn_state_transition(s, CONN_EVENT_BACKEND_DOWN);
+    }
+}
+
+static void virtio_vhost_user_reset(VirtIODevice *vdev)
+{
+    VirtIOVhostUser *s = VIRTIO_VHOST_USER(vdev);
+
+    conn_state_transition(s, CONN_EVENT_DEVICE_RESET);
+
+    virtio_vhost_user_reset_async_state(s);
+}
+
+static void virtio_vhost_user_device_realize(DeviceState *dev, Error **errp)
+{
+    VirtIODevice *vdev = VIRTIO_DEVICE(dev);
+    VirtIOVhostUser *s = VIRTIO_VHOST_USER(dev);
+    size_t i;
+
+    if (!qemu_chr_fe_backend_connected(&s->chr)) {
+        error_setg(errp, "Missing chardev");
+        return;
+    }
+
+    for (i = 0; i < ARRAY_SIZE(s->kickfds); i++) {
+        s->kickfds[i].vdev = vdev;
+        event_notifier_init_fd(&s->kickfds[i].guest_notifier, -1);
+        s->kickfds[i].msi_vector = VIRTIO_NO_VECTOR;
+    }
+
+    for (i = 0; i < ARRAY_SIZE(s->callfds); i++) {
+        event_notifier_init_fd(&s->callfds[i], -1);
+    }
+
+    virtio_init(vdev, VIRTIO_ID_VHOST_USER,
+                sizeof(VirtIOVhostUserConfig));
+
+    s->rxq = virtio_add_queue(vdev, VIRTIO_VHOST_USER_VIRTQUEUE_SIZE,
+                                 virtio_vhost_user_rxq);
+    s->txq = virtio_add_queue(vdev, VIRTIO_VHOST_USER_VIRTQUEUE_SIZE,
+
+                                 virtio_vhost_user_txq);
+    /* Each vhost-user queue uses doorbells and a notification resources */
+    s->config.max_vhost_queues = 1024;
+
+    /* Generate a uuid */
+    QemuUUID uuid;
+    qemu_uuid_generate(&uuid);
+    memcpy(s->config.uuid, uuid.data, sizeof(uuid.data));
+
+    virtio_vhost_user_reset_async_state(s);
+
+    s->conn_state = CONN_STATE_INITIAL;
+    qemu_chr_fe_set_handlers(&s->chr, NULL, NULL, virtio_vhost_user_chr_event,
+            virtio_vhost_user_chr_change, s, NULL, false);
+}
+
+static void virtio_vhost_user_device_unrealize(DeviceState *dev)
+{
+    VirtIODevice *vdev = VIRTIO_DEVICE(dev);
+    VirtIOVhostUser *s = VIRTIO_VHOST_USER(vdev);
+
+    qemu_chr_fe_set_handlers(&s->chr, NULL, NULL, NULL,
+                             NULL, NULL, NULL, false);
+    virtio_cleanup(vdev);
+    virtio_vhost_user_cleanup_mem_table(s);
+    virtio_vhost_user_cleanup_kickfds(s);
+    virtio_vhost_user_cleanup_callfds(s);
+    virtio_vhost_user_cleanup_additional_resources(s);
+}
+
+static const VMStateDescription vmstate_virtio_vhost_user_device = {
+    .name = "virtio-vhost-user-device",
+    .version_id = VIRTIO_VHOST_USER_VM_VERSION,
+    .minimum_version_id = VIRTIO_VHOST_USER_VM_VERSION,
+    .fields = (VMStateField[]) {
+        VMSTATE_END_OF_LIST()
+    },
+};
+
+static const VMStateDescription vmstate_virtio_vhost_user = {
+    .name = "virtio-vhost-user",
+    .minimum_version_id = VIRTIO_VHOST_USER_VM_VERSION,
+    .version_id = VIRTIO_VHOST_USER_VM_VERSION,
+    .fields = (VMStateField[]) {
+        VMSTATE_INT32(conn_state, VirtIOVhostUser),
+        VMSTATE_VIRTIO_DEVICE,
+        VMSTATE_END_OF_LIST()
+    },
+};
+
+static Property virtio_vhost_user_properties[] = {
+    DEFINE_PROP_CHR("chardev", VirtIOVhostUser, chr),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void virtio_vhost_user_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    VirtioDeviceClass *vdc = VIRTIO_DEVICE_CLASS(klass);
+
+    device_class_set_props(dc, virtio_vhost_user_properties);
+    dc->vmsd = &vmstate_virtio_vhost_user;
+    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
+    vdc->realize = virtio_vhost_user_device_realize;
+    vdc->unrealize = virtio_vhost_user_device_unrealize;
+    vdc->get_config = virtio_vhost_user_get_config;
+    vdc->set_config = virtio_vhost_user_set_config;
+    vdc->get_features = virtio_vhost_user_get_features;
+    vdc->reset = virtio_vhost_user_reset;
+    vdc->vmsd = &vmstate_virtio_vhost_user_device;
+}
+
+static const TypeInfo virtio_vhost_user_info = {
+    .name = TYPE_VIRTIO_VHOST_USER,
+    .parent = TYPE_VIRTIO_DEVICE,
+    .instance_size = sizeof(VirtIOVhostUser),
+    .class_init = virtio_vhost_user_class_init,
+};
+
+static void virtio_register_types(void)
+{
+    type_register_static(&virtio_vhost_user_info);
+}
+
+type_init(virtio_register_types)
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 5d607aeaa0..89870ddd0b 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -171,7 +171,8 @@ const char *virtio_device_names[] = {
     [VIRTIO_ID_PARAM_SERV] = "virtio-param-serv",
     [VIRTIO_ID_AUDIO_POLICY] = "virtio-audio-pol",
     [VIRTIO_ID_BT] = "virtio-bluetooth",
-    [VIRTIO_ID_GPIO] = "virtio-gpio"
+    [VIRTIO_ID_GPIO] = "virtio-gpio",
+    [VIRTIO_ID_VHOST_USER] = "virtio-vhost-user"
 };
 
 static const char *virtio_id_to_name(uint16_t device_id)
@@ -1937,7 +1938,7 @@ void qemu_put_virtqueue_element(VirtIODevice *vdev, QEMUFile *f,
 }
 
 /* virtio device */
-static void virtio_notify_vector(VirtIODevice *vdev, uint16_t vector)
+void virtio_notify_vector(VirtIODevice *vdev, uint16_t vector)
 {
     BusState *qbus = qdev_get_parent_bus(DEVICE(vdev));
     VirtioBusClass *k = VIRTIO_BUS_GET_CLASS(qbus);
@@ -2454,7 +2455,7 @@ void virtio_del_queue(VirtIODevice *vdev, int n)
     virtio_delete_queue(&vdev->vq[n]);
 }
 
-static void virtio_set_isr(VirtIODevice *vdev, int value)
+void virtio_set_isr(VirtIODevice *vdev, int value)
 {
     uint8_t old = qatomic_read(&vdev->isr);
 
diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index 44dacfa224..9cbeced174 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -86,6 +86,7 @@ extern bool pci_available;
 #define PCI_DEVICE_ID_VIRTIO_PMEM        0x1013
 #define PCI_DEVICE_ID_VIRTIO_IOMMU       0x1014
 #define PCI_DEVICE_ID_VIRTIO_MEM         0x1015
+#define PCI_DEVICE_ID_VIRTIO_VHOST_USER  0x1016
 
 #define PCI_VENDOR_ID_REDHAT             0x1b36
 #define PCI_DEVICE_ID_REDHAT_BRIDGE      0x0001
diff --git a/include/hw/virtio/virtio-pci.h b/include/hw/virtio/virtio-pci.h
index 2446dcd9ae..66147a7446 100644
--- a/include/hw/virtio/virtio-pci.h
+++ b/include/hw/virtio/virtio-pci.h
@@ -18,6 +18,7 @@
 #include "hw/pci/msi.h"
 #include "hw/virtio/virtio-bus.h"
 #include "qom/object.h"
+#include "standard-headers/linux/virtio_pci.h"
 
 
 /* virtio-pci-bus */
@@ -252,4 +253,10 @@ void virtio_pci_types_register(const VirtioPCIDeviceTypeInfo *t);
  */
 unsigned virtio_pci_optimal_num_queues(unsigned fixed_queues);
 
+int virtio_pci_queue_mem_mult(struct VirtIOPCIProxy *proxy);
+void virtio_pci_modern_region_map(VirtIOPCIProxy *proxy,
+                                  VirtIOPCIRegion *region,
+                                  struct virtio_pci_cap *cap,
+                                  MemoryRegion *mr,
+                                  uint8_t bar);
 #endif
diff --git a/include/hw/virtio/virtio-vhost-user.h b/include/hw/virtio/virtio-vhost-user.h
new file mode 100644
index 0000000000..fda64a1c71
--- /dev/null
+++ b/include/hw/virtio/virtio-vhost-user.h
@@ -0,0 +1,126 @@
+/*
+ * Virtio Vhost-user Device
+ *
+ * Copyright (C) 2017 Red Hat, Inc.
+ *
+ * Authors:
+ *  Stefan Hajnoczi   <stefanha@redhat.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#ifndef QEMU_VIRTIO_VHOST_USER_H
+#define QEMU_VIRTIO_VHOST_USER_H
+
+#include "hw/virtio/virtio.h"
+#include "standard-headers/linux/virtio_pci.h"
+#include "hw/virtio/vhost-user.h"
+#include "chardev/char-fe.h"
+
+#define TYPE_VIRTIO_VHOST_USER "virtio-vhost-user-device"
+#define VIRTIO_VHOST_USER(obj) \
+        OBJECT_CHECK(VirtIOVhostUser, (obj), TYPE_VIRTIO_VHOST_USER)
+
+/* Macros for the offsets in virtio notification structure */
+#define NOTIFICATION_SELECT            0
+#define NOTIFICATION_MSIX_VECTOR       2
+
+/* Macros for the additional resources configuration types */
+#define VIRTIO_PCI_CAP_DOORBELL_CFG 6
+#define VIRTIO_PCI_CAP_NOTIFICATION_CFG 7
+#define VIRTIO_PCI_CAP_SHARED_MEMORY_CFG 8
+
+/* The virtio configuration space fields */
+typedef struct {
+    uint32_t status;
+#define VIRTIO_VHOST_USER_STATUS_BACKEND_UP (1 << 0)
+#define VIRTIO_VHOST_USER_STATUS_FRONTEND_UP (1 << 1)
+    uint32_t max_vhost_queues;
+    uint8_t uuid[16];
+} QEMU_PACKED VirtIOVhostUserConfig;
+
+/* Keep track of the mmap for each memory table region */
+typedef struct {
+    MemoryRegion mr;
+    void *mmap_addr;
+    size_t total_size;
+} VirtIOVhostUserMemTableRegion;
+
+struct kickfd {
+    VirtIODevice *vdev;
+    EventNotifier guest_notifier;
+    uint16_t msi_vector;
+};
+
+/* Additional resources configuration structures */
+
+/* Doorbell structure layout */
+struct virtio_pci_doorbell_cap {
+    struct virtio_pci_cap cap;
+    uint32_t doorbell_off_multiplier;
+};
+
+/* Notification structure layout */
+struct virtio_pci_notification_cfg {
+    uint16_t notification_select;              /* read-write */
+    uint16_t notification_msix_vector;         /* read-write */
+};
+
+typedef struct VirtIOVhostUser VirtIOVhostUser;
+struct VirtIOVhostUser {
+    VirtIODevice parent_obj;
+
+    /* The vhost-user socket */
+    CharBackend chr;
+
+    /* notification select */
+    uint16_t nselect;
+    /* Eventfds from VHOST_USER_SET_VRING_KICK along with the MSI-X vectors. */
+    struct kickfd kickfds[VIRTIO_QUEUE_MAX];
+
+    /* Eventfds from VHOST_USER_SET_VRING_CALL */
+    EventNotifier callfds[VIRTIO_QUEUE_MAX];
+
+    /* Mapped memory regions from VHOST_USER_SET_MEM_TABLE */
+    VirtIOVhostUserMemTableRegion mem_table[VHOST_MEMORY_MAX_NREGIONS];
+
+    VirtIOVhostUserConfig config;
+
+    /* Connection establishment state */
+    int conn_state;
+
+    /* Device-to-driver message queue */
+    VirtQueue *rxq;
+
+    /* Driver-to-device message queue */
+    VirtQueue *txq;
+
+    /* Asynchronous read state */
+    int read_bytes_needed;
+    void *read_ptr;
+    void (*read_done)(VirtIOVhostUser *s);
+    VhostUserMsg read_msg;
+    bool read_waiting_on_rxq; /* need rx buffer? */
+    size_t read_msg_size;
+
+    /* Asynchronous write state */
+    int write_bytes_avail;
+    void *write_ptr;
+    void (*write_done)(VirtIOVhostUser *s);
+    VhostUserMsg write_msg;
+    guint write_watch_tag;
+};
+
+void virtio_vhost_user_set_vhost_mem_regions(VirtIOVhostUser *s);
+void virtio_vhost_user_delete_vhost_mem_region(VirtIOVhostUser *s,
+                                               MemoryRegion *mr);
+void virtio_vhost_user_cleanup_additional_resources(VirtIOVhostUser *s);
+void virtio_vhost_user_register_doorbell(VirtIOVhostUser *s, EventNotifier *e,
+                                         uint8_t vq_idx);
+void virtio_vhost_user_unregister_doorbell(VirtIOVhostUser *s, EventNotifier *e,
+                                           uint8_t vq_idx);
+void virtio_vhost_user_guest_notifier_read(EventNotifier *n);
+
+#endif /* QEMU_VIRTIO_VHOST_USER_H */
diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index db1c0ddf6b..68476186c2 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -324,6 +324,8 @@ void virtio_queue_aio_attach_host_notifier_no_poll(VirtQueue *vq, AioContext *ct
 void virtio_queue_aio_detach_host_notifier(VirtQueue *vq, AioContext *ctx);
 VirtQueue *virtio_vector_first_queue(VirtIODevice *vdev, uint16_t vector);
 VirtQueue *virtio_vector_next_queue(VirtQueue *vq);
+void virtio_set_isr(VirtIODevice *vdev, int value);
+void virtio_notify_vector(VirtIODevice *vdev, uint16_t vector);
 
 static inline void virtio_add_feature(uint64_t *features, unsigned int fbit)
 {
diff --git a/include/standard-headers/linux/virtio_ids.h b/include/standard-headers/linux/virtio_ids.h
index 80d76b75bc..6249506ddd 100644
--- a/include/standard-headers/linux/virtio_ids.h
+++ b/include/standard-headers/linux/virtio_ids.h
@@ -68,6 +68,7 @@
 #define VIRTIO_ID_AUDIO_POLICY		39 /* virtio audio policy */
 #define VIRTIO_ID_BT			40 /* virtio bluetooth */
 #define VIRTIO_ID_GPIO			41 /* virtio gpio */
+#define VIRTIO_ID_VHOST_USER		43 /* virtio vhost-user */
 
 /*
  * Virtio Transitional IDs
-- 
2.25.1


