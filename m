Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C643EE14E7
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Oct 2019 10:59:52 +0200 (CEST)
Received: from localhost ([::1]:57592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iNCUh-00051R-S1
	for lists+qemu-devel@lfdr.de; Wed, 23 Oct 2019 04:59:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48904)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jfreimann@redhat.com>) id 1iNC0z-0003eC-Li
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 04:29:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jfreimann@redhat.com>) id 1iNC0x-00077X-LO
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 04:29:09 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:26579
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jfreimann@redhat.com>)
 id 1iNC0v-00075c-QH
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 04:29:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571819344;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QZS+Bpg3A6NPh7e22P/XIvlyKZUB0+Jeal7rH5qYaGI=;
 b=QL8yn2OyRmsJ2KrCyb6HyIz2jHjCCLZQ78eShe91BGDzF67qaxHB0FIjRIiZoqMfkqZy6b
 MyYxgyLvk+x56TGRaHj/c4NtMJtznOOBTjwAHMToqwE+zS+l23E1n1m1AgTBsN6h6gvZ32
 ZHBFFK9Vydct7q/LqKdoB2jQBR3GL4s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-86-KYC4yDNGM-OqmCJhnCHPTA-1; Wed, 23 Oct 2019 04:29:01 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9C912476;
 Wed, 23 Oct 2019 08:29:00 +0000 (UTC)
Received: from localhost (dhcp-192-217.str.redhat.com [10.33.192.217])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8ADF55C1D4;
 Wed, 23 Oct 2019 08:28:53 +0000 (UTC)
From: Jens Freimann <jfreimann@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 11/11] vfio: unplug failover primary device before migration
Date: Wed, 23 Oct 2019 10:27:11 +0200
Message-Id: <20191023082711.16694-12-jfreimann@redhat.com>
In-Reply-To: <20191023082711.16694-1-jfreimann@redhat.com>
References: <20191023082711.16694-1-jfreimann@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: KYC4yDNGM-OqmCJhnCHPTA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
 mst@redhat.com, aadam@redhat.com, dgilbert@redhat.com,
 alex.williamson@redhat.com, laine@redhat.com, ailan@redhat.com,
 parav@mellanox.com
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
 hw/vfio/pci.c | 26 ++++++++++++++++++++------
 hw/vfio/pci.h |  1 +
 2 files changed, 21 insertions(+), 6 deletions(-)

diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 12fac39804..5dadfec6e8 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -40,6 +40,7 @@
 #include "pci.h"
 #include "trace.h"
 #include "qapi/error.h"
+#include "migration/blocker.h"
=20
 #define TYPE_VFIO_PCI "vfio-pci"
 #define PCI_VFIO(obj)    OBJECT_CHECK(VFIOPCIDevice, obj, TYPE_VFIO_PCI)
@@ -2732,6 +2733,17 @@ static void vfio_realize(PCIDevice *pdev, Error **er=
rp)
         return;
     }
=20
+    if (!pdev->net_failover_pair_id) {
+        error_setg(&vdev->migration_blocker,
+                "VFIO device doesn't support migration");
+        ret =3D migrate_add_blocker(vdev->migration_blocker, &err);
+        if (err) {
+            error_propagate(errp, err);
+            error_free(vdev->migration_blocker);
+            return;
+        }
+    }
+
     vdev->vbasedev.name =3D g_path_get_basename(vdev->vbasedev.sysfsdev);
     vdev->vbasedev.ops =3D &vfio_pci_ops;
     vdev->vbasedev.type =3D VFIO_DEVICE_TYPE_PCI;
@@ -3008,6 +3020,10 @@ out_teardown:
     vfio_bars_exit(vdev);
 error:
     error_prepend(errp, VFIO_MSG_PREFIX, vdev->vbasedev.name);
+    if (vdev->migration_blocker) {
+        migrate_del_blocker(vdev->migration_blocker);
+        error_free(vdev->migration_blocker);
+    }
 }
=20
 static void vfio_instance_finalize(Object *obj)
@@ -3019,6 +3035,10 @@ static void vfio_instance_finalize(Object *obj)
     vfio_bars_finalize(vdev);
     g_free(vdev->emulated_config_bits);
     g_free(vdev->rom);
+    if (vdev->migration_blocker) {
+        migrate_del_blocker(vdev->migration_blocker);
+        error_free(vdev->migration_blocker);
+    }
     /*
      * XXX Leaking igd_opregion is not an oversight, we can't remove the
      * fw_cfg entry therefore leaking this allocation seems like the safes=
t
@@ -3151,11 +3171,6 @@ static Property vfio_pci_dev_properties[] =3D {
     DEFINE_PROP_END_OF_LIST(),
 };
=20
-static const VMStateDescription vfio_pci_vmstate =3D {
-    .name =3D "vfio-pci",
-    .unmigratable =3D 1,
-};
-
 static void vfio_pci_dev_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc =3D DEVICE_CLASS(klass);
@@ -3163,7 +3178,6 @@ static void vfio_pci_dev_class_init(ObjectClass *klas=
s, void *data)
=20
     dc->reset =3D vfio_pci_reset;
     dc->props =3D vfio_pci_dev_properties;
-    dc->vmsd =3D &vfio_pci_vmstate;
     dc->desc =3D "VFIO-based PCI device assignment";
     set_bit(DEVICE_CATEGORY_MISC, dc->categories);
     pdc->realize =3D vfio_realize;
diff --git a/hw/vfio/pci.h b/hw/vfio/pci.h
index 834a90d646..b329d50338 100644
--- a/hw/vfio/pci.h
+++ b/hw/vfio/pci.h
@@ -168,6 +168,7 @@ typedef struct VFIOPCIDevice {
     bool no_vfio_ioeventfd;
     bool enable_ramfb;
     VFIODisplay *dpy;
+    Error *migration_blocker;
 } VFIOPCIDevice;
=20
 uint32_t vfio_pci_read_config(PCIDevice *pdev, uint32_t addr, int len);
--=20
2.21.0


