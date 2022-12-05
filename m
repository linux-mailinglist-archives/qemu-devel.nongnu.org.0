Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 001F464250D
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Dec 2022 09:52:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p27CP-000628-V8; Mon, 05 Dec 2022 03:51:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1p27Az-0005k0-7K
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 03:50:20 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1p27Au-00087z-Dm
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 03:50:12 -0500
Received: from kwepemi100025.china.huawei.com (unknown [172.30.72.56])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4NQcZg0WNJzqSsp;
 Mon,  5 Dec 2022 16:45:47 +0800 (CST)
Received: from DESKTOP-27KDQMV.china.huawei.com (10.174.148.223) by
 kwepemi100025.china.huawei.com (7.221.188.158) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 5 Dec 2022 16:49:54 +0800
To: <stefanha@redhat.com>, <mst@redhat.com>, <jasowang@redhat.com>,
 <sgarzare@redhat.com>
CC: <cohuck@redhat.com>, <pbonzini@redhat.com>, <arei.gonglei@huawei.com>,
 <yechuan@huawei.com>, <huangzhichao@huawei.com>, <qemu-devel@nongnu.org>,
 Longpeng <longpeng2@huawei.com>
Subject: [PATCH v10 3/5] vdpa: add vdpa-dev-pci support
Date: Mon, 5 Dec 2022 16:49:41 +0800
Message-ID: <20221205084943.2259-4-longpeng2@huawei.com>
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
Received-SPF: pass client-ip=45.249.212.187; envelope-from=longpeng2@huawei.com;
 helo=szxga01-in.huawei.com
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

Supports vdpa-dev-pci, we can use the device as follow:

-device vhost-vdpa-device-pci,vhostdev=/dev/vhost-vdpa-X

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Signed-off-by: Longpeng <longpeng2@huawei.com>
---
 hw/virtio/meson.build    |   1 +
 hw/virtio/vdpa-dev-pci.c | 102 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 103 insertions(+)
 create mode 100644 hw/virtio/vdpa-dev-pci.c

diff --git a/hw/virtio/meson.build b/hw/virtio/meson.build
index 54d6d29af7..559b80cb28 100644
--- a/hw/virtio/meson.build
+++ b/hw/virtio/meson.build
@@ -57,6 +57,7 @@ virtio_pci_ss.add(when: 'CONFIG_VIRTIO_SERIAL', if_true: files('virtio-serial-pc
 virtio_pci_ss.add(when: 'CONFIG_VIRTIO_PMEM', if_true: files('virtio-pmem-pci.c'))
 virtio_pci_ss.add(when: 'CONFIG_VIRTIO_IOMMU', if_true: files('virtio-iommu-pci.c'))
 virtio_pci_ss.add(when: 'CONFIG_VIRTIO_MEM', if_true: files('virtio-mem-pci.c'))
+virtio_pci_ss.add(when: 'CONFIG_VHOST_VDPA_DEV', if_true: files('vdpa-dev-pci.c'))
 
 virtio_ss.add_all(when: 'CONFIG_VIRTIO_PCI', if_true: virtio_pci_ss)
 
diff --git a/hw/virtio/vdpa-dev-pci.c b/hw/virtio/vdpa-dev-pci.c
new file mode 100644
index 0000000000..5446e6b393
--- /dev/null
+++ b/hw/virtio/vdpa-dev-pci.c
@@ -0,0 +1,102 @@
+/*
+ * Vhost Vdpa Device PCI Bindings
+ *
+ * Copyright (c) Huawei Technologies Co., Ltd. 2022. All Rights Reserved.
+ *
+ * Authors:
+ *   Longpeng <longpeng2@huawei.com>
+ *
+ * Largely based on the "vhost-user-blk-pci.c" and "vhost-user-blk.c"
+ * implemented by:
+ *   Changpeng Liu <changpeng.liu@intel.com>
+ *
+ * This work is licensed under the terms of the GNU LGPL, version 2 or later.
+ * See the COPYING.LIB file in the top-level directory.
+ */
+#include "qemu/osdep.h"
+#include <sys/ioctl.h>
+#include <linux/vhost.h>
+#include "hw/virtio/virtio.h"
+#include "hw/virtio/vdpa-dev.h"
+#include "hw/pci/pci.h"
+#include "hw/qdev-properties.h"
+#include "qapi/error.h"
+#include "qemu/error-report.h"
+#include "qemu/module.h"
+#include "hw/virtio/virtio-pci.h"
+#include "qom/object.h"
+
+
+typedef struct VhostVdpaDevicePCI VhostVdpaDevicePCI;
+
+#define TYPE_VHOST_VDPA_DEVICE_PCI "vhost-vdpa-device-pci-base"
+DECLARE_INSTANCE_CHECKER(VhostVdpaDevicePCI, VHOST_VDPA_DEVICE_PCI,
+                         TYPE_VHOST_VDPA_DEVICE_PCI)
+
+struct VhostVdpaDevicePCI {
+    VirtIOPCIProxy parent_obj;
+    VhostVdpaDevice vdev;
+};
+
+static void vhost_vdpa_device_pci_instance_init(Object *obj)
+{
+    VhostVdpaDevicePCI *dev = VHOST_VDPA_DEVICE_PCI(obj);
+
+    virtio_instance_init_common(obj, &dev->vdev, sizeof(dev->vdev),
+                                TYPE_VHOST_VDPA_DEVICE);
+    object_property_add_alias(obj, "bootindex", OBJECT(&dev->vdev),
+                              "bootindex");
+}
+
+static Property vhost_vdpa_device_pci_properties[] = {
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static int vhost_vdpa_device_pci_post_init(VhostVdpaDevice *v, Error **errp)
+{
+    VhostVdpaDevicePCI *dev = container_of(v, VhostVdpaDevicePCI, vdev);
+    VirtIOPCIProxy *vpci_dev = &dev->parent_obj;
+
+    vpci_dev->class_code = virtio_pci_get_class_id(v->vdev_id);
+    vpci_dev->trans_devid = virtio_pci_get_trans_devid(v->vdev_id);
+    /* one for config vector */
+    vpci_dev->nvectors = v->num_queues + 1;
+
+    return 0;
+}
+
+static void
+vhost_vdpa_device_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
+{
+    VhostVdpaDevicePCI *dev = VHOST_VDPA_DEVICE_PCI(vpci_dev);
+
+    dev->vdev.post_init = vhost_vdpa_device_pci_post_init;
+    qdev_realize(DEVICE(&dev->vdev), BUS(&vpci_dev->bus), errp);
+}
+
+static void vhost_vdpa_device_pci_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    VirtioPCIClass *k = VIRTIO_PCI_CLASS(klass);
+
+    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
+    device_class_set_props(dc, vhost_vdpa_device_pci_properties);
+    k->realize = vhost_vdpa_device_pci_realize;
+}
+
+static const VirtioPCIDeviceTypeInfo vhost_vdpa_device_pci_info = {
+    .base_name               = TYPE_VHOST_VDPA_DEVICE_PCI,
+    .generic_name            = "vhost-vdpa-device-pci",
+    .transitional_name       = "vhost-vdpa-device-pci-transitional",
+    .non_transitional_name   = "vhost-vdpa-device-pci-non-transitional",
+    .instance_size  = sizeof(VhostVdpaDevicePCI),
+    .instance_init  = vhost_vdpa_device_pci_instance_init,
+    .class_init     = vhost_vdpa_device_pci_class_init,
+};
+
+static void vhost_vdpa_device_pci_register(void)
+{
+    virtio_pci_types_register(&vhost_vdpa_device_pci_info);
+}
+
+type_init(vhost_vdpa_device_pci_register);
-- 
2.23.0


