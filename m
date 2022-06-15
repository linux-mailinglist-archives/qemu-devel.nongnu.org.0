Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E0A54CE91
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 18:24:27 +0200 (CEST)
Received: from localhost ([::1]:34776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1Vof-00085q-UR
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 12:24:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1o1VLx-0004Us-EW
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 11:54:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1o1VLu-0007PI-8j
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 11:54:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655308481;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lvdkZMbxpHFXIESQrqoamL2Qi9LEU5mCxPzO2AqFVeE=;
 b=N+WqoL24BAuI01Y+E0LS1P65DQtS4GvMxTao8+zgttvEIx0rC337jtPeh4ohw6pvTEDYz8
 6Vd2ODe6oKRfKGrY2hj8CNVHDmbMTmU7US8nNNkHfhD9ttGZ9XrNKG419WrQxa0v8jn80r
 ZEeuL3GqZTIeWlz4YaaSN1urlQHwrCs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-26-PrN3pmXbMDmYivE6hsB6lA-1; Wed, 15 Jun 2022 11:54:37 -0400
X-MC-Unique: PrN3pmXbMDmYivE6hsB6lA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A8E0285A584;
 Wed, 15 Jun 2022 15:54:36 +0000 (UTC)
Received: from localhost (unknown [10.39.192.100])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 239F340CFD0A;
 Wed, 15 Jun 2022 15:54:35 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Jagannathan Raman <jag.raman@oracle.com>,
 Aarushi Mehta <mehta.aaru20@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 <qemu-block@nongnu.org>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, virtio-fs@redhat.com,
 Hanna Reitz <hreitz@redhat.com>, David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Eric Blake <eblake@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Peter Xu <peterx@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Bandan Das <bsd@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Julia Suvorova <jusual@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 John G Johnson <john.g.johnson@oracle.com>
Subject: [PULL 15/18] vfio-user: handle device interrupts
Date: Wed, 15 Jun 2022 16:51:26 +0100
Message-Id: <20220615155129.1025811-16-stefanha@redhat.com>
In-Reply-To: <20220615155129.1025811-1-stefanha@redhat.com>
References: <20220615155129.1025811-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Jagannathan Raman <jag.raman@oracle.com>

Forward remote device's interrupts to the guest

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Message-id: 9523479eaafe050677f4de2af5dd0df18c27cfd9.1655151679.git.jag.raman@oracle.com
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 MAINTAINERS                       |   1 +
 include/hw/pci/msi.h              |   1 +
 include/hw/pci/msix.h             |   1 +
 include/hw/pci/pci.h              |  13 +++
 include/hw/remote/vfio-user-obj.h |   6 ++
 hw/pci/msi.c                      |  49 +++++++--
 hw/pci/msix.c                     |  35 ++++++-
 hw/pci/pci.c                      |  13 +++
 hw/remote/machine.c               |  16 ++-
 hw/remote/vfio-user-obj.c         | 167 ++++++++++++++++++++++++++++++
 stubs/vfio-user-obj.c             |   6 ++
 hw/remote/trace-events            |   1 +
 stubs/meson.build                 |   1 +
 13 files changed, 298 insertions(+), 12 deletions(-)
 create mode 100644 include/hw/remote/vfio-user-obj.h
 create mode 100644 stubs/vfio-user-obj.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 563259101b..aaa649a50d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3644,6 +3644,7 @@ F: hw/remote/iohub.c
 F: include/hw/remote/iohub.h
 F: subprojects/libvfio-user
 F: hw/remote/vfio-user-obj.c
+F: include/hw/remote/vfio-user-obj.h
 F: hw/remote/iommu.c
 F: include/hw/remote/iommu.h
 
diff --git a/include/hw/pci/msi.h b/include/hw/pci/msi.h
index 4087688486..58aa576215 100644
--- a/include/hw/pci/msi.h
+++ b/include/hw/pci/msi.h
@@ -43,6 +43,7 @@ void msi_notify(PCIDevice *dev, unsigned int vector);
 void msi_send_message(PCIDevice *dev, MSIMessage msg);
 void msi_write_config(PCIDevice *dev, uint32_t addr, uint32_t val, int len);
 unsigned int msi_nr_vectors_allocated(const PCIDevice *dev);
+void msi_set_mask(PCIDevice *dev, int vector, bool mask, Error **errp);
 
 static inline bool msi_present(const PCIDevice *dev)
 {
diff --git a/include/hw/pci/msix.h b/include/hw/pci/msix.h
index 4c4a60c739..4f1cda0ebe 100644
--- a/include/hw/pci/msix.h
+++ b/include/hw/pci/msix.h
@@ -36,6 +36,7 @@ void msix_clr_pending(PCIDevice *dev, int vector);
 int msix_vector_use(PCIDevice *dev, unsigned vector);
 void msix_vector_unuse(PCIDevice *dev, unsigned vector);
 void msix_unuse_all_vectors(PCIDevice *dev);
+void msix_set_mask(PCIDevice *dev, int vector, bool mask, Error **errp);
 
 void msix_notify(PCIDevice *dev, unsigned vector);
 
diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index 44dacfa224..b54b6ef88f 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -16,6 +16,7 @@ extern bool pci_available;
 #define PCI_SLOT(devfn)         (((devfn) >> 3) & 0x1f)
 #define PCI_FUNC(devfn)         ((devfn) & 0x07)
 #define PCI_BUILD_BDF(bus, devfn)     ((bus << 8) | (devfn))
+#define PCI_BDF_TO_DEVFN(x)     ((x) & 0xff)
 #define PCI_BUS_MAX             256
 #define PCI_DEVFN_MAX           256
 #define PCI_SLOT_MAX            32
@@ -127,6 +128,10 @@ typedef void PCIMapIORegionFunc(PCIDevice *pci_dev, int region_num,
                                 pcibus_t addr, pcibus_t size, int type);
 typedef void PCIUnregisterFunc(PCIDevice *pci_dev);
 
+typedef void MSITriggerFunc(PCIDevice *dev, MSIMessage msg);
+typedef MSIMessage MSIPrepareMessageFunc(PCIDevice *dev, unsigned vector);
+typedef MSIMessage MSIxPrepareMessageFunc(PCIDevice *dev, unsigned vector);
+
 typedef struct PCIIORegion {
     pcibus_t addr; /* current PCI mapping address. -1 means not mapped */
 #define PCI_BAR_UNMAPPED (~(pcibus_t)0)
@@ -329,6 +334,14 @@ struct PCIDevice {
     /* Space to store MSIX table & pending bit array */
     uint8_t *msix_table;
     uint8_t *msix_pba;
+
+    /* May be used by INTx or MSI during interrupt notification */
+    void *irq_opaque;
+
+    MSITriggerFunc *msi_trigger;
+    MSIPrepareMessageFunc *msi_prepare_message;
+    MSIxPrepareMessageFunc *msix_prepare_message;
+
     /* MemoryRegion container for msix exclusive BAR setup */
     MemoryRegion msix_exclusive_bar;
     /* Memory Regions for MSIX table and pending bit entries. */
diff --git a/include/hw/remote/vfio-user-obj.h b/include/hw/remote/vfio-user-obj.h
new file mode 100644
index 0000000000..87ab78b875
--- /dev/null
+++ b/include/hw/remote/vfio-user-obj.h
@@ -0,0 +1,6 @@
+#ifndef VFIO_USER_OBJ_H
+#define VFIO_USER_OBJ_H
+
+void vfu_object_set_bus_irq(PCIBus *pci_bus);
+
+#endif
diff --git a/hw/pci/msi.c b/hw/pci/msi.c
index 47d2b0f33c..5c471b9616 100644
--- a/hw/pci/msi.c
+++ b/hw/pci/msi.c
@@ -134,7 +134,7 @@ void msi_set_message(PCIDevice *dev, MSIMessage msg)
     pci_set_word(dev->config + msi_data_off(dev, msi64bit), msg.data);
 }
 
-MSIMessage msi_get_message(PCIDevice *dev, unsigned int vector)
+static MSIMessage msi_prepare_message(PCIDevice *dev, unsigned int vector)
 {
     uint16_t flags = pci_get_word(dev->config + msi_flags_off(dev));
     bool msi64bit = flags & PCI_MSI_FLAGS_64BIT;
@@ -159,6 +159,11 @@ MSIMessage msi_get_message(PCIDevice *dev, unsigned int vector)
     return msg;
 }
 
+MSIMessage msi_get_message(PCIDevice *dev, unsigned int vector)
+{
+    return dev->msi_prepare_message(dev, vector);
+}
+
 bool msi_enabled(const PCIDevice *dev)
 {
     return msi_present(dev) &&
@@ -241,6 +246,8 @@ int msi_init(struct PCIDevice *dev, uint8_t offset,
                      0xffffffff >> (PCI_MSI_VECTORS_MAX - nr_vectors));
     }
 
+    dev->msi_prepare_message = msi_prepare_message;
+
     return 0;
 }
 
@@ -256,6 +263,7 @@ void msi_uninit(struct PCIDevice *dev)
     cap_size = msi_cap_sizeof(flags);
     pci_del_capability(dev, PCI_CAP_ID_MSI, cap_size);
     dev->cap_present &= ~QEMU_PCI_CAP_MSI;
+    dev->msi_prepare_message = NULL;
 
     MSI_DEV_PRINTF(dev, "uninit\n");
 }
@@ -307,6 +315,39 @@ bool msi_is_masked(const PCIDevice *dev, unsigned int vector)
     return mask & (1U << vector);
 }
 
+void msi_set_mask(PCIDevice *dev, int vector, bool mask, Error **errp)
+{
+    ERRP_GUARD();
+    uint16_t flags = pci_get_word(dev->config + msi_flags_off(dev));
+    bool msi64bit = flags & PCI_MSI_FLAGS_64BIT;
+    uint32_t irq_state, vector_mask, pending;
+
+    if (vector > PCI_MSI_VECTORS_MAX) {
+        error_setg(errp, "msi: vector %d not allocated. max vector is %d",
+                   vector, PCI_MSI_VECTORS_MAX);
+        return;
+    }
+
+    vector_mask = (1U << vector);
+
+    irq_state = pci_get_long(dev->config + msi_mask_off(dev, msi64bit));
+
+    if (mask) {
+        irq_state |= vector_mask;
+    } else {
+        irq_state &= ~vector_mask;
+    }
+
+    pci_set_long(dev->config + msi_mask_off(dev, msi64bit), irq_state);
+
+    pending = pci_get_long(dev->config + msi_pending_off(dev, msi64bit));
+    if (!mask && (pending & vector_mask)) {
+        pending &= ~vector_mask;
+        pci_set_long(dev->config + msi_pending_off(dev, msi64bit), pending);
+        msi_notify(dev, vector);
+    }
+}
+
 void msi_notify(PCIDevice *dev, unsigned int vector)
 {
     uint16_t flags = pci_get_word(dev->config + msi_flags_off(dev));
@@ -334,11 +375,7 @@ void msi_notify(PCIDevice *dev, unsigned int vector)
 
 void msi_send_message(PCIDevice *dev, MSIMessage msg)
 {
-    MemTxAttrs attrs = {};
-
-    attrs.requester_id = pci_requester_id(dev);
-    address_space_stl_le(&dev->bus_master_as, msg.address, msg.data,
-                         attrs, NULL);
+    dev->msi_trigger(dev, msg);
 }
 
 /* Normally called by pci_default_write_config(). */
diff --git a/hw/pci/msix.c b/hw/pci/msix.c
index ae9331cd0b..1e381a9813 100644
--- a/hw/pci/msix.c
+++ b/hw/pci/msix.c
@@ -31,7 +31,7 @@
 #define MSIX_ENABLE_MASK (PCI_MSIX_FLAGS_ENABLE >> 8)
 #define MSIX_MASKALL_MASK (PCI_MSIX_FLAGS_MASKALL >> 8)
 
-MSIMessage msix_get_message(PCIDevice *dev, unsigned vector)
+static MSIMessage msix_prepare_message(PCIDevice *dev, unsigned vector)
 {
     uint8_t *table_entry = dev->msix_table + vector * PCI_MSIX_ENTRY_SIZE;
     MSIMessage msg;
@@ -41,6 +41,11 @@ MSIMessage msix_get_message(PCIDevice *dev, unsigned vector)
     return msg;
 }
 
+MSIMessage msix_get_message(PCIDevice *dev, unsigned vector)
+{
+    return dev->msix_prepare_message(dev, vector);
+}
+
 /*
  * Special API for POWER to configure the vectors through
  * a side channel. Should never be used by devices.
@@ -131,6 +136,31 @@ static void msix_handle_mask_update(PCIDevice *dev, int vector, bool was_masked)
     }
 }
 
+void msix_set_mask(PCIDevice *dev, int vector, bool mask, Error **errp)
+{
+    ERRP_GUARD();
+    unsigned offset;
+    bool was_masked;
+
+    if (vector > dev->msix_entries_nr) {
+        error_setg(errp, "msix: vector %d not allocated. max vector is %d",
+                   vector, dev->msix_entries_nr);
+        return;
+    }
+
+    offset = vector * PCI_MSIX_ENTRY_SIZE + PCI_MSIX_ENTRY_VECTOR_CTRL;
+
+    was_masked = msix_is_masked(dev, vector);
+
+    if (mask) {
+        dev->msix_table[offset] |= PCI_MSIX_ENTRY_CTRL_MASKBIT;
+    } else {
+        dev->msix_table[offset] &= ~PCI_MSIX_ENTRY_CTRL_MASKBIT;
+    }
+
+    msix_handle_mask_update(dev, vector, was_masked);
+}
+
 static bool msix_masked(PCIDevice *dev)
 {
     return dev->config[dev->msix_cap + MSIX_CONTROL_OFFSET] & MSIX_MASKALL_MASK;
@@ -344,6 +374,8 @@ int msix_init(struct PCIDevice *dev, unsigned short nentries,
                           "msix-pba", pba_size);
     memory_region_add_subregion(pba_bar, pba_offset, &dev->msix_pba_mmio);
 
+    dev->msix_prepare_message = msix_prepare_message;
+
     return 0;
 }
 
@@ -429,6 +461,7 @@ void msix_uninit(PCIDevice *dev, MemoryRegion *table_bar, MemoryRegion *pba_bar)
     g_free(dev->msix_entry_used);
     dev->msix_entry_used = NULL;
     dev->cap_present &= ~QEMU_PCI_CAP_MSIX;
+    dev->msix_prepare_message = NULL;
 }
 
 void msix_uninit_exclusive_bar(PCIDevice *dev)
diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 6e7015329c..2f450f6a72 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -317,6 +317,15 @@ void pci_device_deassert_intx(PCIDevice *dev)
     }
 }
 
+static void pci_msi_trigger(PCIDevice *dev, MSIMessage msg)
+{
+    MemTxAttrs attrs = {};
+
+    attrs.requester_id = pci_requester_id(dev);
+    address_space_stl_le(&dev->bus_master_as, msg.address, msg.data,
+                         attrs, NULL);
+}
+
 static void pci_reset_regions(PCIDevice *dev)
 {
     int r;
@@ -1212,6 +1221,8 @@ static void pci_qdev_unrealize(DeviceState *dev)
 
     pci_device_deassert_intx(pci_dev);
     do_pci_unregister_device(pci_dev);
+
+    pci_dev->msi_trigger = NULL;
 }
 
 void pci_register_bar(PCIDevice *pci_dev, int region_num,
@@ -2251,6 +2262,8 @@ static void pci_qdev_realize(DeviceState *qdev, Error **errp)
     }
 
     pci_set_power(pci_dev, true);
+
+    pci_dev->msi_trigger = pci_msi_trigger;
 }
 
 PCIDevice *pci_new_multifunction(int devfn, bool multifunction,
diff --git a/hw/remote/machine.c b/hw/remote/machine.c
index 645b54343d..75d550daae 100644
--- a/hw/remote/machine.c
+++ b/hw/remote/machine.c
@@ -23,6 +23,8 @@
 #include "hw/remote/iommu.h"
 #include "hw/qdev-core.h"
 #include "hw/remote/iommu.h"
+#include "hw/remote/vfio-user-obj.h"
+#include "hw/pci/msi.h"
 
 static void remote_machine_init(MachineState *machine)
 {
@@ -54,13 +56,17 @@ static void remote_machine_init(MachineState *machine)
 
     if (s->vfio_user) {
         remote_iommu_setup(pci_host->bus);
+
+        msi_nonbroken = true;
+
+        vfu_object_set_bus_irq(pci_host->bus);
+    } else {
+        remote_iohub_init(&s->iohub);
+
+        pci_bus_irqs(pci_host->bus, remote_iohub_set_irq, remote_iohub_map_irq,
+                     &s->iohub, REMOTE_IOHUB_NB_PIRQS);
     }
 
-    remote_iohub_init(&s->iohub);
-
-    pci_bus_irqs(pci_host->bus, remote_iohub_set_irq, remote_iohub_map_irq,
-                 &s->iohub, REMOTE_IOHUB_NB_PIRQS);
-
     qbus_set_hotplug_handler(BUS(pci_host->bus), OBJECT(s));
 }
 
diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
index dd760a99e2..5ecdec06f6 100644
--- a/hw/remote/vfio-user-obj.c
+++ b/hw/remote/vfio-user-obj.c
@@ -53,6 +53,9 @@
 #include "hw/pci/pci.h"
 #include "qemu/timer.h"
 #include "exec/memory.h"
+#include "hw/pci/msi.h"
+#include "hw/pci/msix.h"
+#include "hw/remote/vfio-user-obj.h"
 
 #define TYPE_VFU_OBJECT "x-vfio-user-server"
 OBJECT_DECLARE_TYPE(VfuObject, VfuObjectClass, VFU_OBJECT)
@@ -96,6 +99,10 @@ struct VfuObject {
     Error *unplug_blocker;
 
     int vfu_poll_fd;
+
+    MSITriggerFunc *default_msi_trigger;
+    MSIPrepareMessageFunc *default_msi_prepare_message;
+    MSIxPrepareMessageFunc *default_msix_prepare_message;
 };
 
 static void vfu_object_init_ctx(VfuObject *o, Error **errp);
@@ -520,6 +527,155 @@ static void vfu_object_register_bars(vfu_ctx_t *vfu_ctx, PCIDevice *pdev)
     }
 }
 
+static int vfu_object_map_irq(PCIDevice *pci_dev, int intx)
+{
+    int pci_bdf = PCI_BUILD_BDF(pci_bus_num(pci_get_bus(pci_dev)),
+                                pci_dev->devfn);
+
+    return pci_bdf;
+}
+
+static void vfu_object_set_irq(void *opaque, int pirq, int level)
+{
+    PCIBus *pci_bus = opaque;
+    PCIDevice *pci_dev = NULL;
+    vfu_ctx_t *vfu_ctx = NULL;
+    int pci_bus_num, devfn;
+
+    if (level) {
+        pci_bus_num = PCI_BUS_NUM(pirq);
+        devfn = PCI_BDF_TO_DEVFN(pirq);
+
+        /*
+         * pci_find_device() performs at O(1) if the device is attached
+         * to the root PCI bus. Whereas, if the device is attached to a
+         * secondary PCI bus (such as when a root port is involved),
+         * finding the parent PCI bus could take O(n)
+         */
+        pci_dev = pci_find_device(pci_bus, pci_bus_num, devfn);
+
+        vfu_ctx = pci_dev->irq_opaque;
+
+        g_assert(vfu_ctx);
+
+        vfu_irq_trigger(vfu_ctx, 0);
+    }
+}
+
+static MSIMessage vfu_object_msi_prepare_msg(PCIDevice *pci_dev,
+                                             unsigned int vector)
+{
+    MSIMessage msg;
+
+    msg.address = 0;
+    msg.data = vector;
+
+    return msg;
+}
+
+static void vfu_object_msi_trigger(PCIDevice *pci_dev, MSIMessage msg)
+{
+    vfu_ctx_t *vfu_ctx = pci_dev->irq_opaque;
+
+    vfu_irq_trigger(vfu_ctx, msg.data);
+}
+
+static void vfu_object_setup_msi_cbs(VfuObject *o)
+{
+    o->default_msi_trigger = o->pci_dev->msi_trigger;
+    o->default_msi_prepare_message = o->pci_dev->msi_prepare_message;
+    o->default_msix_prepare_message = o->pci_dev->msix_prepare_message;
+
+    o->pci_dev->msi_trigger = vfu_object_msi_trigger;
+    o->pci_dev->msi_prepare_message = vfu_object_msi_prepare_msg;
+    o->pci_dev->msix_prepare_message = vfu_object_msi_prepare_msg;
+}
+
+static void vfu_object_restore_msi_cbs(VfuObject *o)
+{
+    o->pci_dev->msi_trigger = o->default_msi_trigger;
+    o->pci_dev->msi_prepare_message = o->default_msi_prepare_message;
+    o->pci_dev->msix_prepare_message = o->default_msix_prepare_message;
+}
+
+static void vfu_msix_irq_state(vfu_ctx_t *vfu_ctx, uint32_t start,
+                               uint32_t count, bool mask)
+{
+    VfuObject *o = vfu_get_private(vfu_ctx);
+    Error *err = NULL;
+    uint32_t vector;
+
+    for (vector = start; vector < count; vector++) {
+        msix_set_mask(o->pci_dev, vector, mask, &err);
+        if (err) {
+            VFU_OBJECT_ERROR(o, "vfu: %s: %s", o->device,
+                             error_get_pretty(err));
+            error_free(err);
+            err = NULL;
+        }
+    }
+}
+
+static void vfu_msi_irq_state(vfu_ctx_t *vfu_ctx, uint32_t start,
+                              uint32_t count, bool mask)
+{
+    VfuObject *o = vfu_get_private(vfu_ctx);
+    Error *err = NULL;
+    uint32_t vector;
+
+    for (vector = start; vector < count; vector++) {
+        msi_set_mask(o->pci_dev, vector, mask, &err);
+        if (err) {
+            VFU_OBJECT_ERROR(o, "vfu: %s: %s", o->device,
+                             error_get_pretty(err));
+            error_free(err);
+            err = NULL;
+        }
+    }
+}
+
+static int vfu_object_setup_irqs(VfuObject *o, PCIDevice *pci_dev)
+{
+    vfu_ctx_t *vfu_ctx = o->vfu_ctx;
+    int ret;
+
+    ret = vfu_setup_device_nr_irqs(vfu_ctx, VFU_DEV_INTX_IRQ, 1);
+    if (ret < 0) {
+        return ret;
+    }
+
+    if (msix_nr_vectors_allocated(pci_dev)) {
+        ret = vfu_setup_device_nr_irqs(vfu_ctx, VFU_DEV_MSIX_IRQ,
+                                       msix_nr_vectors_allocated(pci_dev));
+        vfu_setup_irq_state_callback(vfu_ctx, VFU_DEV_MSIX_IRQ,
+                                     &vfu_msix_irq_state);
+    } else if (msi_nr_vectors_allocated(pci_dev)) {
+        ret = vfu_setup_device_nr_irqs(vfu_ctx, VFU_DEV_MSI_IRQ,
+                                       msi_nr_vectors_allocated(pci_dev));
+        vfu_setup_irq_state_callback(vfu_ctx, VFU_DEV_MSI_IRQ,
+                                     &vfu_msi_irq_state);
+    }
+
+    if (ret < 0) {
+        return ret;
+    }
+
+    vfu_object_setup_msi_cbs(o);
+
+    pci_dev->irq_opaque = vfu_ctx;
+
+    return 0;
+}
+
+void vfu_object_set_bus_irq(PCIBus *pci_bus)
+{
+    int bus_num = pci_bus_num(pci_bus);
+    int max_bdf = PCI_BUILD_BDF(bus_num, PCI_DEVFN_MAX - 1);
+
+    pci_bus_irqs(pci_bus, vfu_object_set_irq, vfu_object_map_irq, pci_bus,
+                 max_bdf);
+}
+
 /*
  * TYPE_VFU_OBJECT depends on the availability of the 'socket' and 'device'
  * properties. It also depends on devices instantiated in QEMU. These
@@ -632,6 +788,13 @@ static void vfu_object_init_ctx(VfuObject *o, Error **errp)
 
     vfu_object_register_bars(o->vfu_ctx, o->pci_dev);
 
+    ret = vfu_object_setup_irqs(o, o->pci_dev);
+    if (ret < 0) {
+        error_setg(errp, "vfu: Failed to setup interrupts for %s",
+                   o->device);
+        goto fail;
+    }
+
     ret = vfu_realize_ctx(o->vfu_ctx);
     if (ret < 0) {
         error_setg(errp, "vfu: Failed to realize device %s- %s",
@@ -657,6 +820,8 @@ fail:
         o->unplug_blocker = NULL;
     }
     if (o->pci_dev) {
+        vfu_object_restore_msi_cbs(o);
+        o->pci_dev->irq_opaque = NULL;
         object_unref(OBJECT(o->pci_dev));
         o->pci_dev = NULL;
     }
@@ -716,6 +881,8 @@ static void vfu_object_finalize(Object *obj)
     }
 
     if (o->pci_dev) {
+        vfu_object_restore_msi_cbs(o);
+        o->pci_dev->irq_opaque = NULL;
         object_unref(OBJECT(o->pci_dev));
         o->pci_dev = NULL;
     }
diff --git a/stubs/vfio-user-obj.c b/stubs/vfio-user-obj.c
new file mode 100644
index 0000000000..79100d768e
--- /dev/null
+++ b/stubs/vfio-user-obj.c
@@ -0,0 +1,6 @@
+#include "qemu/osdep.h"
+#include "hw/remote/vfio-user-obj.h"
+
+void vfu_object_set_bus_irq(PCIBus *pci_bus)
+{
+}
diff --git a/hw/remote/trace-events b/hw/remote/trace-events
index 847d50d88f..c167b3c7a5 100644
--- a/hw/remote/trace-events
+++ b/hw/remote/trace-events
@@ -12,3 +12,4 @@ vfu_dma_unregister(uint64_t gpa) "vfu: unregistering GPA 0x%"PRIx64""
 vfu_bar_register(int i, uint64_t addr, uint64_t size) "vfu: BAR %d: addr 0x%"PRIx64" size 0x%"PRIx64""
 vfu_bar_rw_enter(const char *op, uint64_t addr) "vfu: %s request for BAR address 0x%"PRIx64""
 vfu_bar_rw_exit(const char *op, uint64_t addr) "vfu: Finished %s of BAR address 0x%"PRIx64""
+vfu_interrupt(int pirq) "vfu: sending interrupt to device - PIRQ %d"
diff --git a/stubs/meson.build b/stubs/meson.build
index 6f80fec761..d8f3fd5c44 100644
--- a/stubs/meson.build
+++ b/stubs/meson.build
@@ -60,3 +60,4 @@ if have_system
 else
   stub_ss.add(files('qdev.c'))
 endif
+stub_ss.add(when: 'CONFIG_VFIO_USER_SERVER', if_false: files('vfio-user-obj.c'))
-- 
2.36.1


