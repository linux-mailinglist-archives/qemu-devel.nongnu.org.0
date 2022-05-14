Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CACDC526E01
	for <lists+qemu-devel@lfdr.de>; Sat, 14 May 2022 06:10:24 +0200 (CEST)
Received: from localhost ([::1]:41134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npj6l-0007W4-VI
	for lists+qemu-devel@lfdr.de; Sat, 14 May 2022 00:10:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1npj2J-00021Y-Mh
 for qemu-devel@nongnu.org; Sat, 14 May 2022 00:05:48 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:3814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1npj2G-0001V4-Uw
 for qemu-devel@nongnu.org; Sat, 14 May 2022 00:05:46 -0400
Received: from kwepemi500025.china.huawei.com (unknown [172.30.72.55])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4L0X336CkLzhYvS;
 Sat, 14 May 2022 12:04:47 +0800 (CST)
Received: from DESKTOP-27KDQMV.china.huawei.com (10.174.148.223) by
 kwepemi500025.china.huawei.com (7.221.188.170) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Sat, 14 May 2022 12:05:30 +0800
To: <stefanha@redhat.com>, <mst@redhat.com>, <jasowang@redhat.com>,
 <sgarzare@redhat.com>
CC: <cohuck@redhat.com>, <pbonzini@redhat.com>, <arei.gonglei@huawei.com>,
 <yechuan@huawei.com>, <huangzhichao@huawei.com>, <qemu-devel@nongnu.org>,
 <longpeng2@huawei.com>
Subject: [PATCH v6 2/4] virtio: get class_id and pci device id by the virtio id
Date: Sat, 14 May 2022 12:05:22 +0800
Message-ID: <20220514040524.1929-3-longpeng2@huawei.com>
X-Mailer: git-send-email 2.25.0.windows.1
In-Reply-To: <20220514040524.1929-1-longpeng2@huawei.com>
References: <20220514040524.1929-1-longpeng2@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.148.223]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemi500025.china.huawei.com (7.221.188.170)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188; envelope-from=longpeng2@huawei.com;
 helo=szxga02-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-to:  "Longpeng(Mike)" <longpeng2@huawei.com>
From:  "Longpeng(Mike)" via <qemu-devel@nongnu.org>

From: Longpeng <longpeng2@huawei.com>

Add helpers to get the "Transitional PCI Device ID" and "class_id"
of the device specified by the "Virtio Device ID".

These helpers will be used to build the generic vDPA device later.

Signed-off-by: Longpeng <longpeng2@huawei.com>
---
 hw/virtio/virtio-pci.c | 101 +++++++++++++++++++++++++++++++++++++++++
 hw/virtio/virtio-pci.h |   5 ++
 2 files changed, 106 insertions(+)

diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index 7cf1231c1c..204388b967 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -19,6 +19,7 @@
 
 #include "exec/memop.h"
 #include "standard-headers/linux/virtio_pci.h"
+#include "standard-headers/linux/virtio_ids.h"
 #include "hw/boards.h"
 #include "hw/virtio/virtio.h"
 #include "migration/qemu-file-types.h"
@@ -212,6 +213,103 @@ static int virtio_pci_load_queue(DeviceState *d, int n, QEMUFile *f)
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
+#define VIRTIO_TRANS_DEV_ID_INFO(name, class)       \
+    {                                               \
+        .vdev_id = VIRTIO_ID_##name,                \
+        .trans_devid = PCI_DEVICE_ID_VIRTIO_##name, \
+        .class_id = class,                          \
+    }
+
+#define VIRTIO_MODERN_DEV_ID_NFO(name, class)       \
+    {                                               \
+        .vdev_id = VIRTIO_ID_##name,                \
+        .class_id = class,                          \
+    }
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
@@ -1675,6 +1773,9 @@ static void virtio_pci_device_plugged(DeviceState *d, Error **errp)
          * is set to PCI_SUBVENDOR_ID_REDHAT_QUMRANET by default.
          */
         pci_set_word(config + PCI_SUBSYSTEM_ID, virtio_bus_get_vdev_id(bus));
+        if (proxy->trans_devid) {
+            pci_config_set_device_id(config, proxy->trans_devid);
+        }
     } else {
         /* pure virtio-1.0 */
         pci_set_word(config + PCI_VENDOR_ID,
diff --git a/hw/virtio/virtio-pci.h b/hw/virtio/virtio-pci.h
index 2446dcd9ae..f08665cd1b 100644
--- a/hw/virtio/virtio-pci.h
+++ b/hw/virtio/virtio-pci.h
@@ -146,6 +146,8 @@ struct VirtIOPCIProxy {
     bool disable_modern;
     bool ignore_backend_features;
     OnOffAuto disable_legacy;
+    /* Transitional device id */
+    uint16_t trans_devid;
     uint32_t class_code;
     uint32_t nvectors;
     uint32_t dfselect;
@@ -158,6 +160,9 @@ struct VirtIOPCIProxy {
     VirtioBusState bus;
 };
 
+uint16_t virtio_pci_get_trans_devid(uint16_t device_id);
+uint16_t virtio_pci_get_class_id(uint16_t device_id);
+
 static inline bool virtio_pci_modern(VirtIOPCIProxy *proxy)
 {
     return !proxy->disable_modern;
-- 
2.23.0


