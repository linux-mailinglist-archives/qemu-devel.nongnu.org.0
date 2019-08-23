Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 752F49B5F8
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Aug 2019 19:59:24 +0200 (CEST)
Received: from localhost ([::1]:60600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i1DqN-0003Cw-FT
	for lists+qemu-devel@lfdr.de; Fri, 23 Aug 2019 13:59:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34523)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1i1DoE-00010r-RP
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 13:57:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1i1DoD-0008Uf-MF
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 13:57:10 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57924)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1i1DoD-0008UI-DY
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 13:57:09 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 9E11C8553A
 for <qemu-devel@nongnu.org>; Fri, 23 Aug 2019 17:57:08 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-117-244.ams2.redhat.com
 [10.36.117.244])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 94BAB261A7;
 Fri, 23 Aug 2019 17:57:07 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org,
	stefanha@redhat.com,
	vgoyal@redhat.com
Date: Fri, 23 Aug 2019 18:56:57 +0100
Message-Id: <20190823175657.12085-3-dgilbert@redhat.com>
In-Reply-To: <20190823175657.12085-1-dgilbert@redhat.com>
References: <20190823175657.12085-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.28]); Fri, 23 Aug 2019 17:57:08 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 2/2] virtio: add vhost-user-fs-pci device
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: virtio-fs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

Add the PCI version of vhost-user-fs.

Launch QEMU like this:

  qemu -chardev socket,path=3D/tmp/vhost-fs.sock,id=3Dchr0
       -device x-vhost-user-fs-pci,tag=3Dmyfs,chardev=3Dchr0

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Sebastien Boeuf <sebastien.boeuf@intel.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 hw/virtio/Makefile.objs       |  1 +
 hw/virtio/vhost-user-fs-pci.c | 85 +++++++++++++++++++++++++++++++++++
 2 files changed, 86 insertions(+)
 create mode 100644 hw/virtio/vhost-user-fs-pci.c

diff --git a/hw/virtio/Makefile.objs b/hw/virtio/Makefile.objs
index 47ffbf22c4..e2f70fbb89 100644
--- a/hw/virtio/Makefile.objs
+++ b/hw/virtio/Makefile.objs
@@ -15,6 +15,7 @@ obj-$(CONFIG_VHOST_USER_FS) +=3D vhost-user-fs.o
 obj-$(call land,$(CONFIG_VIRTIO_CRYPTO),$(CONFIG_VIRTIO_PCI)) +=3D virti=
o-crypto-pci.o
 obj-$(CONFIG_VIRTIO_PMEM) +=3D virtio-pmem.o
 common-obj-$(call land,$(CONFIG_VIRTIO_PMEM),$(CONFIG_VIRTIO_PCI)) +=3D =
virtio-pmem-pci.o
+obj-$(call land,$(CONFIG_VHOST_USER_FS),$(CONFIG_VIRTIO_PCI)) +=3D vhost=
-user-fs-pci.o
 obj-$(CONFIG_VHOST_VSOCK) +=3D vhost-vsock.o
=20
 ifeq ($(CONFIG_VIRTIO_PCI),y)
diff --git a/hw/virtio/vhost-user-fs-pci.c b/hw/virtio/vhost-user-fs-pci.=
c
new file mode 100644
index 0000000000..0e70985094
--- /dev/null
+++ b/hw/virtio/vhost-user-fs-pci.c
@@ -0,0 +1,85 @@
+/*
+ * Vhost-user filesystem virtio device PCI glue
+ *
+ * Copyright 2018-2019 Red Hat, Inc.
+ *
+ * Authors:
+ *  Dr. David Alan Gilbert <dgilbert@redhat.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or
+ * (at your option) any later version.  See the COPYING file in the
+ * top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/qdev-properties.h"
+#include "hw/virtio/vhost-user-fs.h"
+#include "virtio-pci.h"
+
+struct VHostUserFSPCI {
+    VirtIOPCIProxy parent_obj;
+    VHostUserFS vdev;
+};
+
+typedef struct VHostUserFSPCI VHostUserFSPCI;
+
+#define TYPE_VHOST_USER_FS_PCI "vhost-user-fs-pci-base"
+
+#define VHOST_USER_FS_PCI(obj) \
+        OBJECT_CHECK(VHostUserFSPCI, (obj), TYPE_VHOST_USER_FS_PCI)
+
+static Property vhost_user_fs_pci_properties[] =3D {
+    DEFINE_PROP_UINT32("vectors", VirtIOPCIProxy, nvectors,
+                       DEV_NVECTORS_UNSPECIFIED),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void vhost_user_fs_pci_realize(VirtIOPCIProxy *vpci_dev, Error **=
errp)
+{
+    VHostUserFSPCI *dev =3D VHOST_USER_FS_PCI(vpci_dev);
+    DeviceState *vdev =3D DEVICE(&dev->vdev);
+
+    if (vpci_dev->nvectors =3D=3D DEV_NVECTORS_UNSPECIFIED) {
+        vpci_dev->nvectors =3D dev->vdev.conf.num_request_queues + 1;
+    }
+
+    qdev_set_parent_bus(vdev, BUS(&vpci_dev->bus));
+    object_property_set_bool(OBJECT(vdev), true, "realized", errp);
+}
+
+static void vhost_user_fs_pci_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc =3D DEVICE_CLASS(klass);
+    VirtioPCIClass *k =3D VIRTIO_PCI_CLASS(klass);
+    PCIDeviceClass *pcidev_k =3D PCI_DEVICE_CLASS(klass);
+    k->realize =3D vhost_user_fs_pci_realize;
+    set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
+    dc->props =3D vhost_user_fs_pci_properties;
+    pcidev_k->vendor_id =3D PCI_VENDOR_ID_REDHAT_QUMRANET;
+    pcidev_k->device_id =3D 0; /* Set by virtio-pci based on virtio id *=
/
+    pcidev_k->revision =3D 0x00;
+    pcidev_k->class_id =3D PCI_CLASS_STORAGE_OTHER;
+}
+
+static void vhost_user_fs_pci_instance_init(Object *obj)
+{
+    VHostUserFSPCI *dev =3D VHOST_USER_FS_PCI(obj);
+
+    virtio_instance_init_common(obj, &dev->vdev, sizeof(dev->vdev),
+                                TYPE_VHOST_USER_FS);
+}
+
+static const VirtioPCIDeviceTypeInfo vhost_user_fs_pci_info =3D {
+    .base_name             =3D TYPE_VHOST_USER_FS_PCI,
+    .non_transitional_name =3D "x-vhost-user-fs-pci",
+    .instance_size =3D sizeof(VHostUserFSPCI),
+    .instance_init =3D vhost_user_fs_pci_instance_init,
+    .class_init    =3D vhost_user_fs_pci_class_init,
+};
+
+static void vhost_user_fs_pci_register(void)
+{
+    virtio_pci_types_register(&vhost_user_fs_pci_info);
+}
+
+type_init(vhost_user_fs_pci_register);
--=20
2.21.0


