Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8940641BB5
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jun 2019 07:55:53 +0200 (CEST)
Received: from localhost ([::1]:56840 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hawEi-0002pL-Nm
	for lists+qemu-devel@lfdr.de; Wed, 12 Jun 2019 01:55:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58502)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dgibson@ozlabs.org>) id 1haw8n-0004XM-4N
 for qemu-devel@nongnu.org; Wed, 12 Jun 2019 01:49:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1haw8k-00073D-SS
 for qemu-devel@nongnu.org; Wed, 12 Jun 2019 01:49:44 -0400
Received: from ozlabs.org ([203.11.71.1]:60309)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1haw8k-000717-7O; Wed, 12 Jun 2019 01:49:42 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 45NwtR4Cf9z9sPC; Wed, 12 Jun 2019 15:49:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1560318575;
 bh=Eb6H0LTkCVq9ttPuBWVZZEAnmYMnVgLWdK92LYFslA8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=e1LtqAbaVQtyJaIiHh4l4yhQDSj6KKWxZlf/cwrYEaxOgy4gHi4nAbQt4IQ5wNiY3
 RsK0QyXPQVm1YR2f7Fj8wjb6VGoutROPtVXndj+ShxcrTz1LNXYtX3RbWVDFYD1yt8
 rrdn4tLB3//gqN0NiSCMdJxrVavpkE+u5quI3HQ0=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Date: Wed, 12 Jun 2019 15:49:24 +1000
Message-Id: <20190612054929.21136-9-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190612054929.21136-1-david@gibson.dropbear.id.au>
References: <20190612054929.21136-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 203.11.71.1
Subject: [Qemu-devel] [PULL 08/13] spapr: Don't use bus number for building
 DRC ids
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
Cc: lvivier@redhat.com, "Michael S . Tsirkin" <mst@redhat.com>, aik@ozlabs.ru,
 qemu-devel@nongnu.org, groug@kaod.org, qemu-ppc@nongnu.org, clg@kaod.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DRC ids are more or less arbitrary, as long as they're consistent.  For
PCI, we notionally build them from the phb's index along with PCI bus
number, slot and function number.

Using bus number is broken, however, because it can change if the guest
re-enumerates the PCI topology for whatever reason (e.g. due to hotplug
of a bridge, which we don't support yet but want to).

Fortunately, there's an alternative.  Bridges are required to have a uniq=
ue
non-zero "chassis number" that we can use instead.  Adjust the code to
use that instead.

This looks like it would introduce a guest visible breaking change, but
in fact it does not because we don't yet ever use non-zero bus numbers.
Both chassis and bus number are always 0 for the root bus, so there's no
change for the existing cases.

Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/ppc/spapr_pci.c | 54 ++++++++++++++++++++++++++++++++++------------
 1 file changed, 40 insertions(+), 14 deletions(-)

diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
index 7352028628..9d99bc0b4c 100644
--- a/hw/ppc/spapr_pci.c
+++ b/hw/ppc/spapr_pci.c
@@ -1221,23 +1221,40 @@ static const char *dt_name_from_class(uint8_t cla=
ss, uint8_t subclass,
  */
=20
 static uint32_t drc_id_from_devfn(SpaprPhbState *phb,
-                                  uint32_t busnr,
-                                  int32_t devfn)
+                                  uint8_t chassis, int32_t devfn)
 {
-    return (phb->index << 16) | (busnr << 8) | devfn;
+    return (phb->index << 16) | (chassis << 8) | devfn;
 }
=20
 static SpaprDrc *drc_from_devfn(SpaprPhbState *phb,
-                                uint32_t busnr, int32_t devfn)
+                                uint8_t chassis, int32_t devfn)
 {
     return spapr_drc_by_id(TYPE_SPAPR_DRC_PCI,
-                           drc_id_from_devfn(phb, busnr, devfn));
+                           drc_id_from_devfn(phb, chassis, devfn));
+}
+
+static uint8_t chassis_from_bus(PCIBus *bus, Error **errp)
+{
+    if (pci_bus_is_root(bus)) {
+        return 0;
+    } else {
+        PCIDevice *bridge =3D pci_bridge_get_device(bus);
+
+        return object_property_get_uint(OBJECT(bridge), "chassis_nr", er=
rp);
+    }
 }
=20
 static SpaprDrc *drc_from_dev(SpaprPhbState *phb, PCIDevice *dev)
 {
-    uint32_t busnr =3D pci_bus_num(PCI_BUS(qdev_get_parent_bus(DEVICE(de=
v))));
-    return drc_from_devfn(phb, busnr, dev->devfn);
+    Error *local_err =3D NULL;
+    uint8_t chassis =3D chassis_from_bus(pci_get_bus(dev), &local_err);
+
+    if (local_err) {
+        error_report_err(local_err);
+        return NULL;
+    }
+
+    return drc_from_devfn(phb, chassis, dev->devfn);
 }
=20
 static void add_drcs(SpaprPhbState *phb)
@@ -1516,14 +1533,19 @@ static void spapr_pci_plug(HotplugHandler *plug_h=
andler,
         spapr_drc_reset(drc);
     } else if (PCI_FUNC(pdev->devfn) =3D=3D 0) {
         int i;
+        uint8_t chassis =3D chassis_from_bus(pci_get_bus(pdev), &local_e=
rr);
+
+        if (local_err) {
+            error_propagate(errp, local_err);
+            return;
+        }
=20
         for (i =3D 0; i < 8; i++) {
             SpaprDrc *func_drc;
             SpaprDrcClass *func_drck;
             SpaprDREntitySense state;
=20
-            func_drc =3D drc_from_devfn(phb, pci_bus_num(bus),
-                                      PCI_DEVFN(slotnr, i));
+            func_drc =3D drc_from_devfn(phb, chassis, PCI_DEVFN(slotnr, =
i));
             func_drck =3D SPAPR_DR_CONNECTOR_GET_CLASS(func_drc);
             state =3D func_drck->dr_entity_sense(func_drc);
=20
@@ -1571,18 +1593,23 @@ static void spapr_pci_unplug_request(HotplugHandl=
er *plug_handler,
     g_assert(drc->dev =3D=3D plugged_dev);
=20
     if (!spapr_drc_unplug_requested(drc)) {
-        PCIBus *bus =3D PCI_BUS(qdev_get_parent_bus(DEVICE(pdev)));
         uint32_t slotnr =3D PCI_SLOT(pdev->devfn);
         SpaprDrc *func_drc;
         SpaprDrcClass *func_drck;
         SpaprDREntitySense state;
         int i;
+        Error *local_err =3D NULL;
+        uint8_t chassis =3D chassis_from_bus(pci_get_bus(pdev), &local_e=
rr);
+
+        if (local_err) {
+            error_propagate(errp, local_err);
+            return;
+        }
=20
         /* ensure any other present functions are pending unplug */
         if (PCI_FUNC(pdev->devfn) =3D=3D 0) {
             for (i =3D 1; i < 8; i++) {
-                func_drc =3D drc_from_devfn(phb, pci_bus_num(bus),
-                                          PCI_DEVFN(slotnr, i));
+                func_drc =3D drc_from_devfn(phb, chassis, PCI_DEVFN(slot=
nr, i));
                 func_drck =3D SPAPR_DR_CONNECTOR_GET_CLASS(func_drc);
                 state =3D func_drck->dr_entity_sense(func_drc);
                 if (state =3D=3D SPAPR_DR_ENTITY_SENSE_PRESENT
@@ -1603,8 +1630,7 @@ static void spapr_pci_unplug_request(HotplugHandler=
 *plug_handler,
          */
         if (PCI_FUNC(pdev->devfn) =3D=3D 0) {
             for (i =3D 7; i >=3D 0; i--) {
-                func_drc =3D drc_from_devfn(phb, pci_bus_num(bus),
-                                          PCI_DEVFN(slotnr, i));
+                func_drc =3D drc_from_devfn(phb, chassis, PCI_DEVFN(slot=
nr, i));
                 func_drck =3D SPAPR_DR_CONNECTOR_GET_CLASS(func_drc);
                 state =3D func_drck->dr_entity_sense(func_drc);
                 if (state =3D=3D SPAPR_DR_ENTITY_SENSE_PRESENT) {
--=20
2.21.0


