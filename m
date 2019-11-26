Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E1D5109928
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Nov 2019 07:24:22 +0100 (CET)
Received: from localhost ([::1]:50498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iZUGr-00089P-Kx
	for lists+qemu-devel@lfdr.de; Tue, 26 Nov 2019 01:24:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59763)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1iZU90-0007Ip-5j
 for qemu-devel@nongnu.org; Tue, 26 Nov 2019 01:16:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1iZTvG-0004NR-AL
 for qemu-devel@nongnu.org; Tue, 26 Nov 2019 01:02:03 -0500
Received: from ozlabs.org ([2401:3900:2:1::2]:60757)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1iZTvF-0004KY-W9; Tue, 26 Nov 2019 01:02:02 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 47MYFc6YbKz9sRC; Tue, 26 Nov 2019 17:01:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1574748116;
 bh=u7CAIhmTj0mlhyPuaW0tj6FxYD0XbxolACOl8eimYFs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iUhsoFTXYZrvlRFA1GCFWO2PLyy++9GCRHNK4fJpmRLxzyZydoqB4GyFu8xUlWDZa
 0X6PHTTG5ri/1WzqJKUetm0nGQm2XUJk4bFg+148/M2eilQVeIFdtOlHbJTCJYqWZn
 f64xCBLUZZeyfVjHWNJv8VdCoTrEiGrZzZeTSFiE=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 3/8] vfio/pci: Split vfio_intx_update()
Date: Tue, 26 Nov 2019 17:01:46 +1100
Message-Id: <20191126060151.729845-4-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191126060151.729845-1-david@gibson.dropbear.id.au>
References: <20191126060151.729845-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2401:3900:2:1::2
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
Cc: lvivier@redhat.com, Alexey Kardashevskiy <aik@ozlabs.ru>,
 qemu-devel@nongnu.org, groug@kaod.org,
 Alex Williamson <alex.williamson@redhat.com>, qemu-ppc@nongnu.org,
 clg@kaod.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This splits the vfio_intx_update() function into one part doing the actua=
l
reconnection with the KVM irqchip (vfio_intx_update(), now taking an
argument with the new routing) and vfio_intx_routing_notifier() which
handles calls to the pci device intx routing notifier and calling
vfio_intx_update() when necessary.  This will make adding support for the
irqchip change notifier easier.

Cc: Alex Williamson <alex.williamson@redhat.com>
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>

Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
Tested-by: Alex Williamson <alex.williamson@redhat.com>
Reviewed-by: Alex Williamson <alex.williamson@redhat.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
Acked-by: Alex Williamson <alex.williamson@redhat.com>
---
 hw/vfio/pci.c | 39 ++++++++++++++++++++++-----------------
 1 file changed, 22 insertions(+), 17 deletions(-)

diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 0c55883bba..521289aa7d 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -216,30 +216,18 @@ static void vfio_intx_disable_kvm(VFIOPCIDevice *vd=
ev)
 #endif
 }
=20
-static void vfio_intx_update(PCIDevice *pdev)
+static void vfio_intx_update(VFIOPCIDevice *vdev, PCIINTxRoute *route)
 {
-    VFIOPCIDevice *vdev =3D PCI_VFIO(pdev);
-    PCIINTxRoute route;
     Error *err =3D NULL;
=20
-    if (vdev->interrupt !=3D VFIO_INT_INTx) {
-        return;
-    }
-
-    route =3D pci_device_route_intx_to_irq(&vdev->pdev, vdev->intx.pin);
-
-    if (!pci_intx_route_changed(&vdev->intx.route, &route)) {
-        return; /* Nothing changed */
-    }
-
     trace_vfio_intx_update(vdev->vbasedev.name,
-                           vdev->intx.route.irq, route.irq);
+                           vdev->intx.route.irq, route->irq);
=20
     vfio_intx_disable_kvm(vdev);
=20
-    vdev->intx.route =3D route;
+    vdev->intx.route =3D *route;
=20
-    if (route.mode !=3D PCI_INTX_ENABLED) {
+    if (route->mode !=3D PCI_INTX_ENABLED) {
         return;
     }
=20
@@ -252,6 +240,22 @@ static void vfio_intx_update(PCIDevice *pdev)
     vfio_intx_eoi(&vdev->vbasedev);
 }
=20
+static void vfio_intx_routing_notifier(PCIDevice *pdev)
+{
+    VFIOPCIDevice *vdev =3D PCI_VFIO(pdev);
+    PCIINTxRoute route;
+
+    if (vdev->interrupt !=3D VFIO_INT_INTx) {
+        return;
+    }
+
+    route =3D pci_device_route_intx_to_irq(&vdev->pdev, vdev->intx.pin);
+
+    if (pci_intx_route_changed(&vdev->intx.route, &route)) {
+        vfio_intx_update(vdev, &route);
+    }
+}
+
 static int vfio_intx_enable(VFIOPCIDevice *vdev, Error **errp)
 {
     uint8_t pin =3D vfio_pci_read_config(&vdev->pdev, PCI_INTERRUPT_PIN,=
 1);
@@ -2967,7 +2971,8 @@ static void vfio_realize(PCIDevice *pdev, Error **e=
rrp)
     if (vfio_pci_read_config(&vdev->pdev, PCI_INTERRUPT_PIN, 1)) {
         vdev->intx.mmap_timer =3D timer_new_ms(QEMU_CLOCK_VIRTUAL,
                                                   vfio_intx_mmap_enable,=
 vdev);
-        pci_device_set_intx_routing_notifier(&vdev->pdev, vfio_intx_upda=
te);
+        pci_device_set_intx_routing_notifier(&vdev->pdev,
+                                             vfio_intx_routing_notifier)=
;
         ret =3D vfio_intx_enable(vdev, errp);
         if (ret) {
             goto out_teardown;
--=20
2.23.0


