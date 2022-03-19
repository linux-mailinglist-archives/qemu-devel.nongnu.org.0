Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD834DE6AD
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Mar 2022 08:22:46 +0100 (CET)
Received: from localhost ([::1]:52648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVTQD-0004wF-Bl
	for lists+qemu-devel@lfdr.de; Sat, 19 Mar 2022 03:22:45 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1nVTO5-0002FF-1V
 for qemu-devel@nongnu.org; Sat, 19 Mar 2022 03:20:33 -0400
Received: from szxga03-in.huawei.com ([45.249.212.189]:4214)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1nVTO2-0005E8-5Y
 for qemu-devel@nongnu.org; Sat, 19 Mar 2022 03:20:32 -0400
Received: from dggpeml500021.china.huawei.com (unknown [172.30.72.57])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4KLBy417Dsz9spH;
 Sat, 19 Mar 2022 15:16:28 +0800 (CST)
Received: from dggpeml100016.china.huawei.com (7.185.36.216) by
 dggpeml500021.china.huawei.com (7.185.36.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Sat, 19 Mar 2022 15:20:19 +0800
Received: from DESKTOP-27KDQMV.china.huawei.com (10.174.148.223) by
 dggpeml100016.china.huawei.com (7.185.36.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Sat, 19 Mar 2022 15:20:19 +0800
To: <stefanha@redhat.com>, <mst@redhat.com>, <cohuck@redhat.com>,
 <sgarzare@redhat.com>
CC: <pbonzini@redhat.com>, <arei.gonglei@huawei.com>, <yechuan@huawei.com>,
 <huangzhichao@huawei.com>, <qemu-devel@nongnu.org>, Longpeng
 <longpeng2@huawei.com>
Subject: [PATCH v3 04/10] vdpa-dev: implement the instance_init/class_init
 interface
Date: Sat, 19 Mar 2022 15:20:06 +0800
Message-ID: <20220319072012.525-5-longpeng2@huawei.com>
X-Mailer: git-send-email 2.25.0.windows.1
In-Reply-To: <20220319072012.525-1-longpeng2@huawei.com>
References: <20220319072012.525-1-longpeng2@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.148.223]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpeml100016.china.huawei.com (7.185.36.216)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.189; envelope-from=longpeng2@huawei.com;
 helo=szxga03-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Reply-to:  "Longpeng(Mike)" <longpeng2@huawei.com>
From:  "Longpeng(Mike)" via <qemu-devel@nongnu.org>

From: Longpeng <longpeng2@huawei.com>

Implements the .instance_init and the .class_init interface.

Signed-off-by: Longpeng <longpeng2@huawei.com>
---
 hw/virtio/vdpa-dev-pci.c     | 22 +++++++++++-
 hw/virtio/vdpa-dev.c         | 69 ++++++++++++++++++++++++++++++++++--
 include/hw/virtio/vdpa-dev.h |  3 ++
 3 files changed, 91 insertions(+), 3 deletions(-)

diff --git a/hw/virtio/vdpa-dev-pci.c b/hw/virtio/vdpa-dev-pci.c
index 9c0f25a02d..9eb590ce8c 100644
--- a/hw/virtio/vdpa-dev-pci.c
+++ b/hw/virtio/vdpa-dev-pci.c
@@ -38,13 +38,33 @@ struct VhostVdpaDevicePCI {
 };
 
 static void vhost_vdpa_device_pci_instance_init(Object *obj)
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
+static void
+vhost_vdpa_device_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
 {
     return;
 }
 
 static void vhost_vdpa_device_pci_class_init(ObjectClass *klass, void *data)
 {
-    return;
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    VirtioPCIClass *k = VIRTIO_PCI_CLASS(klass);
+
+    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
+    device_class_set_props(dc, vhost_vdpa_device_pci_properties);
+    k->realize = vhost_vdpa_device_pci_realize;
 }
 
 static const VirtioPCIDeviceTypeInfo vhost_vdpa_device_pci_info = {
diff --git a/hw/virtio/vdpa-dev.c b/hw/virtio/vdpa-dev.c
index 5c506ff304..993cbc7d11 100644
--- a/hw/virtio/vdpa-dev.c
+++ b/hw/virtio/vdpa-dev.c
@@ -29,16 +29,81 @@
 #include "sysemu/sysemu.h"
 #include "sysemu/runstate.h"
 
-static void vhost_vdpa_device_class_init(ObjectClass *klass, void *data)
+static void vhost_vdpa_device_realize(DeviceState *dev, Error **errp)
 {
     return;
 }
 
-static void vhost_vdpa_device_instance_init(Object *obj)
+static void vhost_vdpa_device_unrealize(DeviceState *dev)
+{
+    return;
+}
+
+static void
+vhost_vdpa_device_get_config(VirtIODevice *vdev, uint8_t *config)
+{
+    return;
+}
+
+static void
+vhost_vdpa_device_set_config(VirtIODevice *vdev, const uint8_t *config)
 {
     return;
 }
 
+static uint64_t vhost_vdpa_device_get_features(VirtIODevice *vdev,
+                                               uint64_t features,
+                                               Error **errp)
+{
+    return (uint64_t)-1;
+}
+
+static void vhost_vdpa_device_set_status(VirtIODevice *vdev, uint8_t status)
+{
+    return;
+}
+
+static Property vhost_vdpa_device_properties[] = {
+    DEFINE_PROP_STRING("vdpa-dev", VhostVdpaDevice, vdpa_dev),
+    DEFINE_PROP_INT32("vdpa-dev-fd", VhostVdpaDevice, vdpa_dev_fd, -1),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static const VMStateDescription vmstate_vhost_vdpa_device = {
+    .name = "vhost-vdpa-device",
+    .minimum_version_id = 1,
+    .version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_VIRTIO_DEVICE,
+        VMSTATE_END_OF_LIST()
+    },
+};
+
+static void vhost_vdpa_device_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    VirtioDeviceClass *vdc = VIRTIO_DEVICE_CLASS(klass);
+
+    device_class_set_props(dc, vhost_vdpa_device_properties);
+    dc->desc = "VDPA-based generic device assignment";
+    dc->vmsd = &vmstate_vhost_vdpa_device;
+    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
+    vdc->realize = vhost_vdpa_device_realize;
+    vdc->unrealize = vhost_vdpa_device_unrealize;
+    vdc->get_config = vhost_vdpa_device_get_config;
+    vdc->set_config = vhost_vdpa_device_set_config;
+    vdc->get_features = vhost_vdpa_device_get_features;
+    vdc->set_status = vhost_vdpa_device_set_status;
+}
+
+static void vhost_vdpa_device_instance_init(Object *obj)
+{
+    VhostVdpaDevice *s = VHOST_VDPA_DEVICE(obj);
+
+    device_add_bootindex_property(obj, &s->bootindex, "bootindex",
+                                  NULL, DEVICE(obj));
+}
+
 static const TypeInfo vhost_vdpa_device_info = {
     .name = TYPE_VHOST_VDPA_DEVICE,
     .parent = TYPE_VIRTIO_DEVICE,
diff --git a/include/hw/virtio/vdpa-dev.h b/include/hw/virtio/vdpa-dev.h
index bd60367793..476bda0873 100644
--- a/include/hw/virtio/vdpa-dev.h
+++ b/include/hw/virtio/vdpa-dev.h
@@ -25,6 +25,9 @@ OBJECT_DECLARE_SIMPLE_TYPE(VhostVdpaDevice, VHOST_VDPA_DEVICE)
 
 struct VhostVdpaDevice {
     VirtIODevice parent_obj;
+    char *vdpa_dev;
+    int vdpa_dev_fd;
+    int32_t bootindex;
 };
 
 #endif
-- 
2.23.0


