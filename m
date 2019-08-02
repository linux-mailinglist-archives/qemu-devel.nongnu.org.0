Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C205E7FD04
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Aug 2019 17:08:27 +0200 (CEST)
Received: from localhost ([::1]:35575 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1htZAQ-0001JY-Ve
	for lists+qemu-devel@lfdr.de; Fri, 02 Aug 2019 11:08:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47160)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <jfreimann@redhat.com>) id 1htZ8a-0005Jf-Hq
 for qemu-devel@nongnu.org; Fri, 02 Aug 2019 11:06:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jfreimann@redhat.com>) id 1htZ8Z-0005NK-CZ
 for qemu-devel@nongnu.org; Fri, 02 Aug 2019 11:06:32 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47696)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jfreimann@redhat.com>)
 id 1htZ8Z-0005N4-54
 for qemu-devel@nongnu.org; Fri, 02 Aug 2019 11:06:31 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 7D233C027339
 for <qemu-devel@nongnu.org>; Fri,  2 Aug 2019 15:06:30 +0000 (UTC)
Received: from localhost (dhcp-192-195.str.redhat.com [10.33.192.195])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C7301600C8;
 Fri,  2 Aug 2019 15:06:23 +0000 (UTC)
From: Jens Freimann <jfreimann@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri,  2 Aug 2019 17:05:59 +0200
Message-Id: <20190802150605.5880-4-jfreimann@redhat.com>
In-Reply-To: <20190802150605.5880-1-jfreimann@redhat.com>
References: <20190802150605.5880-1-jfreimann@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Fri, 02 Aug 2019 15:06:30 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 3/9] vfio: unplug failover primary device
 before migration
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
Cc: pkrempa@redhat.com, berrange@redhat.com, ehabkost@redhat.com,
 mst@redhat.com, aadam@redhat.com, laine@redhat.com, ailan@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As usual block all vfio-pci devices from being migrated, but make an
exception for failover primary devices. This is achieved by setting
unmigratable to 0 but also add a migration blocker for all vfio-pci
devices except failover primary devices. These will be unplugged before
migration happens by the migration handler of the corresponding
virtio-net standby device.

Signed-off-by: Jens Freimann <jfreimann@redhat.com>
---
 hw/vfio/pci.c | 24 +++++++++++++++++++++++-
 hw/vfio/pci.h |  1 +
 2 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index d6ae9bd4ac..398d26669b 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -35,6 +35,9 @@
 #include "pci.h"
 #include "trace.h"
 #include "qapi/error.h"
+#include "migration/blocker.h"
+#include "qemu/option.h"
+#include "qemu/option_int.h"
=20
 #define TYPE_VFIO_PCI "vfio-pci"
 #define PCI_VFIO(obj)    OBJECT_CHECK(VFIOPCIDevice, obj, TYPE_VFIO_PCI)
@@ -2693,6 +2696,12 @@ static void vfio_unregister_req_notifier(VFIOPCIDe=
vice *vdev)
     vdev->req_enabled =3D false;
 }
=20
+static int has_standby_arg(void *opaque, const char *name,
+                           const char *value, Error **errp)
+{
+    return strcmp(name, "standby") =3D=3D 0;
+}
+
 static void vfio_realize(PCIDevice *pdev, Error **errp)
 {
     VFIOPCIDevice *vdev =3D PCI_VFIO(pdev);
@@ -2706,6 +2715,19 @@ static void vfio_realize(PCIDevice *pdev, Error **=
errp)
     int i, ret;
     bool is_mdev;
=20
+    if (qemu_opt_foreach(pdev->qdev.opts, has_standby_arg,
+                         (void *) pdev->qdev.opts, &err) =3D=3D 0) {
+        error_setg(&vdev->migration_blocker,
+                "VFIO device doesn't support migration");
+        ret =3D migrate_add_blocker(vdev->migration_blocker, &err);
+        if (err) {
+            error_propagate(errp, err);
+            error_free(vdev->migration_blocker);
+        }
+    } else {
+        pdev->qdev.allow_unplug_during_migration =3D true;
+    }
+
     if (!vdev->vbasedev.sysfsdev) {
         if (!(~vdev->host.domain || ~vdev->host.bus ||
               ~vdev->host.slot || ~vdev->host.function)) {
@@ -3148,7 +3170,7 @@ static Property vfio_pci_dev_properties[] =3D {
=20
 static const VMStateDescription vfio_pci_vmstate =3D {
     .name =3D "vfio-pci",
-    .unmigratable =3D 1,
+    .unmigratable =3D 0,
 };
=20
 static void vfio_pci_dev_class_init(ObjectClass *klass, void *data)
diff --git a/hw/vfio/pci.h b/hw/vfio/pci.h
index 27d58fc55b..0f6f8cb395 100644
--- a/hw/vfio/pci.h
+++ b/hw/vfio/pci.h
@@ -169,6 +169,7 @@ typedef struct VFIOPCIDevice {
     bool no_vfio_ioeventfd;
     bool enable_ramfb;
     VFIODisplay *dpy;
+    Error *migration_blocker;
 } VFIOPCIDevice;
=20
 uint32_t vfio_pci_read_config(PCIDevice *pdev, uint32_t addr, int len);
--=20
2.21.0


