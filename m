Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA65484BE9
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 02:02:19 +0100 (CET)
Received: from localhost ([::1]:54596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4uh1-0002JI-20
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 20:02:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1n4ue3-0007s6-Nm
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 19:59:15 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187]:3439)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1n4udz-0007uv-Ox
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 19:59:15 -0500
Received: from dggpeml500022.china.huawei.com (unknown [172.30.72.53])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4JTB1g48yczccGF;
 Wed,  5 Jan 2022 08:58:31 +0800 (CST)
Received: from dggpeml100016.china.huawei.com (7.185.36.216) by
 dggpeml500022.china.huawei.com (7.185.36.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 5 Jan 2022 08:59:05 +0800
Received: from DESKTOP-27KDQMV.china.huawei.com (10.174.148.223) by
 dggpeml100016.china.huawei.com (7.185.36.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 5 Jan 2022 08:59:04 +0800
To: <stefanha@redhat.com>, <mst@redhat.com>, <jasowang@redhat.com>,
 <sgarzare@redhat.com>
CC: <cohuck@redhat.com>, <pbonzini@redhat.com>, <arei.gonglei@huawei.com>,
 <yechuan@huawei.com>, <huangzhichao@huawei.com>, <qemu-devel@nongnu.org>,
 Longpeng <longpeng2@huawei.com>
Subject: [RFC 01/10] virtio: get class_id and pci device id by the virtio id
Date: Wed, 5 Jan 2022 08:58:51 +0800
Message-ID: <20220105005900.860-2-longpeng2@huawei.com>
X-Mailer: git-send-email 2.25.0.windows.1
In-Reply-To: <20220105005900.860-1-longpeng2@huawei.com>
References: <20220105005900.860-1-longpeng2@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.148.223]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpeml100016.china.huawei.com (7.185.36.216)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187; envelope-from=longpeng2@huawei.com;
 helo=szxga01-in.huawei.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Add helpers to get the "Transitional PCI Device ID" and "class_id" of the
deivce which is specificed by the "Virtio Device ID".

These helpers will be used to build the generic vDPA device later.

Signed-off-by: Longpeng <longpeng2@huawei.com>
---
 hw/virtio/virtio-pci.c | 93 ++++++++++++++++++++++++++++++++++++++++++
 hw/virtio/virtio-pci.h |  4 ++
 2 files changed, 97 insertions(+)

diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index 750aa47ec1..843085c4ea 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -19,6 +19,7 @@
 
 #include "exec/memop.h"
 #include "standard-headers/linux/virtio_pci.h"
+#include "standard-headers/linux/virtio_ids.h"
 #include "hw/boards.h"
 #include "hw/virtio/virtio.h"
 #include "migration/qemu-file-types.h"
@@ -213,6 +214,95 @@ static int virtio_pci_load_queue(DeviceState *d, int n, QEMUFile *f)
     return 0;
 }
 
+typedef struct VirtIOPCIIDInfo {
+    uint16_t vdev_id; /* virtio id */
+    uint16_t pdev_id; /* pci device id */
+    uint16_t class_id;
+} VirtIOPCIIDInfo;
+
+static const VirtIOPCIIDInfo virtio_pci_id_info[] = {
+    {
+        .vdev_id = VIRTIO_ID_NET,
+        .pdev_id = PCI_DEVICE_ID_VIRTIO_NET,
+        .class_id = PCI_CLASS_NETWORK_ETHERNET,
+    },
+    {
+        .vdev_id = VIRTIO_ID_BLOCK,
+        .pdev_id = PCI_DEVICE_ID_VIRTIO_BLOCK,
+        .class_id = PCI_CLASS_STORAGE_SCSI,
+    },
+    {
+        .vdev_id = VIRTIO_ID_CONSOLE,
+        .pdev_id = PCI_DEVICE_ID_VIRTIO_CONSOLE,
+        .class_id = PCI_CLASS_COMMUNICATION_OTHER,
+    },
+    {
+        .vdev_id = VIRTIO_ID_SCSI,
+        .pdev_id = PCI_DEVICE_ID_VIRTIO_SCSI,
+        .class_id = PCI_CLASS_STORAGE_SCSI,
+    },
+    {
+        .vdev_id = VIRTIO_ID_9P,
+        .pdev_id = PCI_DEVICE_ID_VIRTIO_9P,
+        .class_id = PCI_BASE_CLASS_NETWORK,
+    },
+    {
+        .vdev_id = VIRTIO_ID_VSOCK,
+        .pdev_id = PCI_DEVICE_ID_VIRTIO_VSOCK,
+        .class_id = PCI_CLASS_COMMUNICATION_OTHER,
+    },
+    {
+        .vdev_id = VIRTIO_ID_IOMMU,
+        .pdev_id = PCI_DEVICE_ID_VIRTIO_IOMMU,
+        .class_id = PCI_CLASS_OTHERS,
+    },
+    {
+        .vdev_id = VIRTIO_ID_MEM,
+        .pdev_id = PCI_DEVICE_ID_VIRTIO_MEM,
+        .class_id = PCI_CLASS_OTHERS,
+    },
+    {
+        .vdev_id = VIRTIO_ID_PMEM,
+        .pdev_id = PCI_DEVICE_ID_VIRTIO_PMEM,
+        .class_id = PCI_CLASS_OTHERS,
+    },
+    {
+        .vdev_id = VIRTIO_ID_RNG,
+        .pdev_id = PCI_DEVICE_ID_VIRTIO_RNG,
+        .class_id = PCI_CLASS_OTHERS,
+    },
+    {
+        .vdev_id = VIRTIO_ID_BALLOON,
+        .pdev_id = PCI_DEVICE_ID_VIRTIO_BALLOON,
+        .class_id = PCI_CLASS_OTHERS,
+    },
+};
+
+static VirtIOPCIIDInfo virtio_pci_get_id_info(uint16_t vdev_id)
+{
+    VirtIOPCIIDInfo info = {};
+    int i;
+
+    for (i = 0; i < ARRAY_SIZE(virtio_pci_id_info); i++) {
+        if (virtio_pci_id_info[i].vdev_id == vdev_id) {
+            info = virtio_pci_id_info[i];
+            break;
+        }
+    }
+
+    return info;
+}
+
+uint16_t virtio_pci_get_pci_devid(uint16_t device_id)
+{
+    return virtio_pci_get_id_info(device_id).pdev_id;
+}
+
+uint16_t virtio_pci_get_class_id(uint16_t device_id)
+{
+    return virtio_pci_get_id_info(device_id).class_id;
+}
+
 static bool virtio_pci_ioeventfd_enabled(DeviceState *d)
 {
     VirtIOPCIProxy *proxy = to_virtio_pci_proxy(d);
@@ -1674,6 +1764,9 @@ static void virtio_pci_device_plugged(DeviceState *d, Error **errp)
          * is set to PCI_SUBVENDOR_ID_REDHAT_QUMRANET by default.
          */
         pci_set_word(config + PCI_SUBSYSTEM_ID, virtio_bus_get_vdev_id(bus));
+        if (proxy->pdev_id) {
+            pci_config_set_device_id(config, proxy->pdev_id);
+        }
     } else {
         /* pure virtio-1.0 */
         pci_set_word(config + PCI_VENDOR_ID,
diff --git a/hw/virtio/virtio-pci.h b/hw/virtio/virtio-pci.h
index 2446dcd9ae..06aa59436e 100644
--- a/hw/virtio/virtio-pci.h
+++ b/hw/virtio/virtio-pci.h
@@ -146,6 +146,7 @@ struct VirtIOPCIProxy {
     bool disable_modern;
     bool ignore_backend_features;
     OnOffAuto disable_legacy;
+    uint16_t pdev_id;
     uint32_t class_code;
     uint32_t nvectors;
     uint32_t dfselect;
@@ -158,6 +159,9 @@ struct VirtIOPCIProxy {
     VirtioBusState bus;
 };
 
+uint16_t virtio_pci_get_pci_devid(uint16_t device_id);
+uint16_t virtio_pci_get_class_id(uint16_t device_id);
+
 static inline bool virtio_pci_modern(VirtIOPCIProxy *proxy)
 {
     return !proxy->disable_modern;
-- 
2.23.0


