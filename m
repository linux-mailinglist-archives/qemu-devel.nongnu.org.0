Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 646DC64250A
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Dec 2022 09:52:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p27BS-0005lL-I7; Mon, 05 Dec 2022 03:50:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1p27Ay-0005jw-6Z
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 03:50:15 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1p27Av-00087q-4M
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 03:50:11 -0500
Received: from kwepemi100025.china.huawei.com (unknown [172.30.72.57])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4NQcfV3jz8zFqqc;
 Mon,  5 Dec 2022 16:49:06 +0800 (CST)
Received: from DESKTOP-27KDQMV.china.huawei.com (10.174.148.223) by
 kwepemi100025.china.huawei.com (7.221.188.158) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 5 Dec 2022 16:49:52 +0800
To: <stefanha@redhat.com>, <mst@redhat.com>, <jasowang@redhat.com>,
 <sgarzare@redhat.com>
CC: <cohuck@redhat.com>, <pbonzini@redhat.com>, <arei.gonglei@huawei.com>,
 <yechuan@huawei.com>, <huangzhichao@huawei.com>, <qemu-devel@nongnu.org>,
 Longpeng <longpeng2@huawei.com>
Subject: [PATCH v10 1/5] virtio: get class_id and pci device id by the virtio
 id
Date: Mon, 5 Dec 2022 16:49:39 +0800
Message-ID: <20221205084943.2259-2-longpeng2@huawei.com>
X-Mailer: git-send-email 2.25.0.windows.1
In-Reply-To: <20221205084943.2259-1-longpeng2@huawei.com>
References: <20221205084943.2259-1-longpeng2@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.148.223]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemi100025.china.huawei.com (7.221.188.158)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188; envelope-from=longpeng2@huawei.com;
 helo=szxga02-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  "Longpeng(Mike)" <longpeng2@huawei.com>
From:  "Longpeng(Mike)" via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Longpeng <longpeng2@huawei.com>

Add helpers to get the "Transitional PCI Device ID" and "class_id"
of the device specified by the "Virtio Device ID".

These helpers will be used to build the generic vDPA device later.

Acked-by: Jason Wang <jasowang@redhat.com>
Signed-off-by: Longpeng <longpeng2@huawei.com>
---
 hw/virtio/virtio-pci.c         | 88 ++++++++++++++++++++++++++++++++++
 include/hw/virtio/virtio-pci.h |  5 ++
 2 files changed, 93 insertions(+)

diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index a1c9dfa7bb..a602f670ca 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -19,6 +19,7 @@
 
 #include "exec/memop.h"
 #include "standard-headers/linux/virtio_pci.h"
+#include "standard-headers/linux/virtio_ids.h"
 #include "hw/boards.h"
 #include "hw/virtio/virtio.h"
 #include "migration/qemu-file-types.h"
@@ -224,6 +225,90 @@ static int virtio_pci_load_queue(DeviceState *d, int n, QEMUFile *f)
     return 0;
 }
 
+typedef struct VirtIOPCIIDInfo {
+    /* virtio id */
+    uint16_t vdev_id;
+    /* pci device id for the transitional device */
+    uint16_t trans_devid;
+    uint16_t class_id;
+} VirtIOPCIIDInfo;
+
+static const VirtIOPCIIDInfo virtio_pci_id_info[] = {
+    {
+        .vdev_id = VIRTIO_ID_CRYPTO,
+        .class_id = PCI_CLASS_OTHERS,
+    }, {
+        .vdev_id = VIRTIO_ID_FS,
+        .class_id = PCI_CLASS_STORAGE_OTHER,
+    }, {
+        .vdev_id = VIRTIO_ID_NET,
+        .trans_devid = PCI_DEVICE_ID_VIRTIO_NET,
+        .class_id = PCI_CLASS_NETWORK_ETHERNET,
+    }, {
+        .vdev_id = VIRTIO_ID_BLOCK,
+        .trans_devid = PCI_DEVICE_ID_VIRTIO_BLOCK,
+        .class_id = PCI_CLASS_STORAGE_SCSI,
+    }, {
+        .vdev_id = VIRTIO_ID_CONSOLE,
+        .trans_devid = PCI_DEVICE_ID_VIRTIO_CONSOLE,
+        .class_id = PCI_CLASS_COMMUNICATION_OTHER,
+    }, {
+        .vdev_id = VIRTIO_ID_SCSI,
+        .trans_devid = PCI_DEVICE_ID_VIRTIO_SCSI,
+        .class_id = PCI_CLASS_STORAGE_SCSI
+    }, {
+        .vdev_id = VIRTIO_ID_9P,
+        .trans_devid = PCI_DEVICE_ID_VIRTIO_9P,
+        .class_id = PCI_BASE_CLASS_NETWORK,
+    }, {
+        .vdev_id = VIRTIO_ID_BALLOON,
+        .trans_devid = PCI_DEVICE_ID_VIRTIO_BALLOON,
+        .class_id = PCI_CLASS_OTHERS,
+    }, {
+        .vdev_id = VIRTIO_ID_RNG,
+        .trans_devid = PCI_DEVICE_ID_VIRTIO_RNG,
+        .class_id = PCI_CLASS_OTHERS,
+    },
+};
+
+static const VirtIOPCIIDInfo *virtio_pci_get_id_info(uint16_t vdev_id)
+{
+    const VirtIOPCIIDInfo *info = NULL;
+    int i;
+
+    for (i = 0; i < ARRAY_SIZE(virtio_pci_id_info); i++) {
+        if (virtio_pci_id_info[i].vdev_id == vdev_id) {
+            info = &virtio_pci_id_info[i];
+            break;
+        }
+    }
+
+    if (!info) {
+        /* The device id is invalid or not added to the id_info yet. */
+        error_report("Invalid virtio device(id %u)", vdev_id);
+        abort();
+    }
+
+    return info;
+}
+
+/*
+ * Get the Transitional Device ID for the specific device, return
+ * zero if the device is non-transitional.
+ */
+uint16_t virtio_pci_get_trans_devid(uint16_t device_id)
+{
+    return virtio_pci_get_id_info(device_id)->trans_devid;
+}
+
+/*
+ * Get the Class ID for the specific device.
+ */
+uint16_t virtio_pci_get_class_id(uint16_t device_id)
+{
+    return virtio_pci_get_id_info(device_id)->class_id;
+}
+
 static bool virtio_pci_ioeventfd_enabled(DeviceState *d)
 {
     VirtIOPCIProxy *proxy = to_virtio_pci_proxy(d);
@@ -1729,6 +1814,9 @@ static void virtio_pci_device_plugged(DeviceState *d, Error **errp)
          * is set to PCI_SUBVENDOR_ID_REDHAT_QUMRANET by default.
          */
         pci_set_word(config + PCI_SUBSYSTEM_ID, virtio_bus_get_vdev_id(bus));
+        if (proxy->trans_devid) {
+            pci_config_set_device_id(config, proxy->trans_devid);
+        }
     } else {
         /* pure virtio-1.0 */
         pci_set_word(config + PCI_VENDOR_ID,
diff --git a/include/hw/virtio/virtio-pci.h b/include/hw/virtio/virtio-pci.h
index 938799e8f6..24fba1604b 100644
--- a/include/hw/virtio/virtio-pci.h
+++ b/include/hw/virtio/virtio-pci.h
@@ -151,6 +151,8 @@ struct VirtIOPCIProxy {
     bool disable_modern;
     bool ignore_backend_features;
     OnOffAuto disable_legacy;
+    /* Transitional device id */
+    uint16_t trans_devid;
     uint32_t class_code;
     uint32_t nvectors;
     uint32_t dfselect;
@@ -184,6 +186,9 @@ static inline void virtio_pci_disable_modern(VirtIOPCIProxy *proxy)
     proxy->disable_modern = true;
 }
 
+uint16_t virtio_pci_get_trans_devid(uint16_t device_id);
+uint16_t virtio_pci_get_class_id(uint16_t device_id);
+
 /*
  * virtio-input-pci: This extends VirtioPCIProxy.
  */
-- 
2.23.0


