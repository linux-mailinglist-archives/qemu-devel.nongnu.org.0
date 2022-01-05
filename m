Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C3BD484BEE
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 02:06:31 +0100 (CET)
Received: from localhost ([::1]:34210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4ul4-0007gg-Hi
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 20:06:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1n4ue3-0007rw-JC
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 19:59:15 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188]:4155)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1n4ue0-0007vB-0H
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 19:59:15 -0500
Received: from dggpeml500023.china.huawei.com (unknown [172.30.72.57])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4JTB190WSGz9s4h;
 Wed,  5 Jan 2022 08:58:05 +0800 (CST)
Received: from dggpeml100016.china.huawei.com (7.185.36.216) by
 dggpeml500023.china.huawei.com (7.185.36.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 5 Jan 2022 08:59:06 +0800
Received: from DESKTOP-27KDQMV.china.huawei.com (10.174.148.223) by
 dggpeml100016.china.huawei.com (7.185.36.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 5 Jan 2022 08:59:06 +0800
To: <stefanha@redhat.com>, <mst@redhat.com>, <jasowang@redhat.com>,
 <sgarzare@redhat.com>
CC: <cohuck@redhat.com>, <pbonzini@redhat.com>, <arei.gonglei@huawei.com>,
 <yechuan@huawei.com>, <huangzhichao@huawei.com>, <qemu-devel@nongnu.org>,
 Longpeng <longpeng2@huawei.com>
Subject: [RFC 04/10] vdpa-dev: implement the instance_init/class_init interface
Date: Wed, 5 Jan 2022 08:58:54 +0800
Message-ID: <20220105005900.860-5-longpeng2@huawei.com>
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
Received-SPF: pass client-ip=45.249.212.188; envelope-from=longpeng2@huawei.com;
 helo=szxga02-in.huawei.com
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

Implements the .instance_init and the .class_init interface.

Signed-off-by: Longpeng <longpeng2@huawei.com>
---
 hw/virtio/vdpa-dev-pci.c     | 80 +++++++++++++++++++++++++++++++++++-
 hw/virtio/vdpa-dev.c         | 68 +++++++++++++++++++++++++++++-
 include/hw/virtio/vdpa-dev.h |  2 +
 3 files changed, 146 insertions(+), 4 deletions(-)

diff --git a/hw/virtio/vdpa-dev-pci.c b/hw/virtio/vdpa-dev-pci.c
index a5a7b528a9..0af54a26d4 100644
--- a/hw/virtio/vdpa-dev-pci.c
+++ b/hw/virtio/vdpa-dev-pci.c
@@ -23,14 +23,90 @@ struct VhostVdpaDevicePCI {
     VhostVdpaDevice vdev;
 };
 
+static uint32_t
+vdpa_dev_pci_get_info(const char *name, uint64_t cmd, Error **errp)
+{
+    int device_fd;
+    uint32_t val;
+    int ret;
+
+    device_fd = qemu_open(name, O_RDWR, errp);
+    if (device_fd == -1) {
+        return (uint32_t)-1;
+    }
+
+    ret = ioctl(device_fd, cmd, &val);
+    if (ret < 0) {
+        error_setg(errp, "vhost-vdpa-device-pci: cmd 0x%lx failed: %s",
+                   cmd, strerror(errno));
+        goto out;
+    }
+
+out:
+    close(device_fd);
+    return val;
+}
+
+static inline uint32_t
+vdpa_dev_pci_get_devid(VhostVdpaDevicePCI *dev, Error **errp)
+{
+    return vdpa_dev_pci_get_info(dev->vdev.vdpa_dev,
+                                 VHOST_VDPA_GET_DEVICE_ID, errp);
+}
+
+static inline uint32_t
+vdpa_dev_pci_get_vectors_num(VhostVdpaDevicePCI *dev, Error **errp)
+{
+    return vdpa_dev_pci_get_info(dev->vdev.vdpa_dev,
+                                 VHOST_VDPA_GET_VECTORS_NUM, errp);
+}
+
 static void vhost_vdpa_device_pci_instance_init(Object *obj)
 {
-    return;
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
+{
+    VhostVdpaDevicePCI *dev = VHOST_VDPA_DEVICE_PCI(vpci_dev);
+    DeviceState *vdev = DEVICE(&dev->vdev);
+    uint32_t devid;
+    uint32_t vectors;
+
+    devid = vdpa_dev_pci_get_devid(dev, errp);
+    if (*errp) {
+        return;
+    }
+
+    vectors = vdpa_dev_pci_get_vectors_num(dev, errp);
+    if (*errp) {
+        return;
+    }
+
+    vpci_dev->class_code = virtio_pci_get_class_id(devid);
+    vpci_dev->pdev_id = virtio_pci_get_pci_devid(devid);
+    vpci_dev->nvectors = vectors;
+    qdev_realize(vdev, BUS(&vpci_dev->bus), errp);
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
index f4f92b90b0..790117fb3b 100644
--- a/hw/virtio/vdpa-dev.c
+++ b/hw/virtio/vdpa-dev.c
@@ -15,16 +15,80 @@
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
+    dc->desc = "VDPA-based generic PCI device assignment";
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
index dd94bd74a2..7a0e6bdcf8 100644
--- a/include/hw/virtio/vdpa-dev.h
+++ b/include/hw/virtio/vdpa-dev.h
@@ -11,6 +11,8 @@ OBJECT_DECLARE_SIMPLE_TYPE(VhostVdpaDevice, VHOST_VDPA_DEVICE)
 
 struct VhostVdpaDevice {
     VirtIODevice parent_obj;
+    char *vdpa_dev;
+    int32_t bootindex;
 };
 
 #endif
-- 
2.23.0


