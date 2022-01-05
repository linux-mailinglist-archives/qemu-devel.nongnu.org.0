Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 541EF484BF3
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 02:09:22 +0100 (CET)
Received: from localhost ([::1]:40116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4unp-0003V5-2u
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 20:09:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1n4ue3-0007s5-MZ
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 19:59:15 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187]:3440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1n4udz-0007v6-Ov
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 19:59:15 -0500
Received: from dggpeml500024.china.huawei.com (unknown [172.30.72.56])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4JTB1h58JGzccNP;
 Wed,  5 Jan 2022 08:58:32 +0800 (CST)
Received: from dggpeml100016.china.huawei.com (7.185.36.216) by
 dggpeml500024.china.huawei.com (7.185.36.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 5 Jan 2022 08:59:06 +0800
Received: from DESKTOP-27KDQMV.china.huawei.com (10.174.148.223) by
 dggpeml100016.china.huawei.com (7.185.36.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 5 Jan 2022 08:59:05 +0800
To: <stefanha@redhat.com>, <mst@redhat.com>, <jasowang@redhat.com>,
 <sgarzare@redhat.com>
CC: <cohuck@redhat.com>, <pbonzini@redhat.com>, <arei.gonglei@huawei.com>,
 <yechuan@huawei.com>, <huangzhichao@huawei.com>, <qemu-devel@nongnu.org>,
 Longpeng <longpeng2@huawei.com>
Subject: [RFC 03/10] vdpa: add the infrastructure of vdpa-dev
Date: Wed, 5 Jan 2022 08:58:53 +0800
Message-ID: <20220105005900.860-4-longpeng2@huawei.com>
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

Add the infrastructure of vdpa-dev (the generic vDPA device), we
can add a generic vDPA device as follow:
  -device vhost-vdpa-device-pci,vdpa-dev=/dev/vhost-vdpa-X

Signed-off-by: Longpeng <longpeng2@huawei.com>
---
 hw/virtio/Kconfig            |  5 ++++
 hw/virtio/meson.build        |  2 ++
 hw/virtio/vdpa-dev-pci.c     | 51 ++++++++++++++++++++++++++++++++++++
 hw/virtio/vdpa-dev.c         | 41 +++++++++++++++++++++++++++++
 include/hw/virtio/vdpa-dev.h | 16 +++++++++++
 5 files changed, 115 insertions(+)
 create mode 100644 hw/virtio/vdpa-dev-pci.c
 create mode 100644 hw/virtio/vdpa-dev.c
 create mode 100644 include/hw/virtio/vdpa-dev.h

diff --git a/hw/virtio/Kconfig b/hw/virtio/Kconfig
index c144d42f9b..2723283382 100644
--- a/hw/virtio/Kconfig
+++ b/hw/virtio/Kconfig
@@ -68,3 +68,8 @@ config VHOST_USER_RNG
     bool
     default y
     depends on VIRTIO && VHOST_USER
+
+config VHOST_VDPA_DEV
+    bool
+    default y if VIRTIO_PCI
+    depends on VIRTIO && VHOST_VDPA && LINUX
diff --git a/hw/virtio/meson.build b/hw/virtio/meson.build
index 521f7d64a8..8e8943e20b 100644
--- a/hw/virtio/meson.build
+++ b/hw/virtio/meson.build
@@ -29,6 +29,7 @@ virtio_ss.add(when: 'CONFIG_VHOST_USER_I2C', if_true: files('vhost-user-i2c.c'))
 virtio_ss.add(when: ['CONFIG_VIRTIO_PCI', 'CONFIG_VHOST_USER_I2C'], if_true: files('vhost-user-i2c-pci.c'))
 virtio_ss.add(when: 'CONFIG_VHOST_USER_RNG', if_true: files('vhost-user-rng.c'))
 virtio_ss.add(when: ['CONFIG_VHOST_USER_RNG', 'CONFIG_VIRTIO_PCI'], if_true: files('vhost-user-rng-pci.c'))
+virtio_ss.add(when: 'CONFIG_VHOST_VDPA_DEV', if_true: files('vdpa-dev.c'))
 
 virtio_pci_ss = ss.source_set()
 virtio_pci_ss.add(when: 'CONFIG_VHOST_VSOCK', if_true: files('vhost-vsock-pci.c'))
@@ -49,6 +50,7 @@ virtio_pci_ss.add(when: 'CONFIG_VIRTIO_SERIAL', if_true: files('virtio-serial-pc
 virtio_pci_ss.add(when: 'CONFIG_VIRTIO_PMEM', if_true: files('virtio-pmem-pci.c'))
 virtio_pci_ss.add(when: 'CONFIG_VIRTIO_IOMMU', if_true: files('virtio-iommu-pci.c'))
 virtio_pci_ss.add(when: 'CONFIG_VIRTIO_MEM', if_true: files('virtio-mem-pci.c'))
+virtio_pci_ss.add(when: 'CONFIG_VHOST_VDPA_DEV', if_true: files('vdpa-dev-pci.c'))
 
 virtio_ss.add_all(when: 'CONFIG_VIRTIO_PCI', if_true: virtio_pci_ss)
 
diff --git a/hw/virtio/vdpa-dev-pci.c b/hw/virtio/vdpa-dev-pci.c
new file mode 100644
index 0000000000..a5a7b528a9
--- /dev/null
+++ b/hw/virtio/vdpa-dev-pci.c
@@ -0,0 +1,51 @@
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
+#include "virtio-pci.h"
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
+    return;
+}
+
+static void vhost_vdpa_device_pci_class_init(ObjectClass *klass, void *data)
+{
+    return;
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
diff --git a/hw/virtio/vdpa-dev.c b/hw/virtio/vdpa-dev.c
new file mode 100644
index 0000000000..f4f92b90b0
--- /dev/null
+++ b/hw/virtio/vdpa-dev.c
@@ -0,0 +1,41 @@
+#include "qemu/osdep.h"
+#include <sys/ioctl.h>
+#include <linux/vhost.h>
+#include "qapi/error.h"
+#include "qemu/error-report.h"
+#include "qemu/cutils.h"
+#include "hw/qdev-core.h"
+#include "hw/qdev-properties.h"
+#include "hw/qdev-properties-system.h"
+#include "hw/virtio/vhost.h"
+#include "hw/virtio/virtio.h"
+#include "hw/virtio/virtio-bus.h"
+#include "hw/virtio/virtio-access.h"
+#include "hw/virtio/vdpa-dev.h"
+#include "sysemu/sysemu.h"
+#include "sysemu/runstate.h"
+
+static void vhost_vdpa_device_class_init(ObjectClass *klass, void *data)
+{
+    return;
+}
+
+static void vhost_vdpa_device_instance_init(Object *obj)
+{
+    return;
+}
+
+static const TypeInfo vhost_vdpa_device_info = {
+    .name = TYPE_VHOST_VDPA_DEVICE,
+    .parent = TYPE_VIRTIO_DEVICE,
+    .instance_size = sizeof(VhostVdpaDevice),
+    .class_init = vhost_vdpa_device_class_init,
+    .instance_init = vhost_vdpa_device_instance_init,
+};
+
+static void register_vhost_vdpa_device_type(void)
+{
+    type_register_static(&vhost_vdpa_device_info);
+}
+
+type_init(register_vhost_vdpa_device_type);
diff --git a/include/hw/virtio/vdpa-dev.h b/include/hw/virtio/vdpa-dev.h
new file mode 100644
index 0000000000..dd94bd74a2
--- /dev/null
+++ b/include/hw/virtio/vdpa-dev.h
@@ -0,0 +1,16 @@
+#ifndef _VHOST_VDPA_DEVICE_H
+#define _VHOST_VDPA_DEVICE_H
+
+#include "hw/virtio/vhost.h"
+#include "hw/virtio/vhost-vdpa.h"
+#include "qom/object.h"
+
+
+#define TYPE_VHOST_VDPA_DEVICE "vhost-vdpa-device"
+OBJECT_DECLARE_SIMPLE_TYPE(VhostVdpaDevice, VHOST_VDPA_DEVICE)
+
+struct VhostVdpaDevice {
+    VirtIODevice parent_obj;
+};
+
+#endif
-- 
2.23.0


