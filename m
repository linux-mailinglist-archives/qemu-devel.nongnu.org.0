Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB502F72C
	for <lists+qemu-devel@lfdr.de>; Thu, 30 May 2019 07:44:42 +0200 (CEST)
Received: from localhost ([127.0.0.1]:52912 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hWDrl-0002FM-3T
	for lists+qemu-devel@lfdr.de; Thu, 30 May 2019 01:44:41 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35026)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1hWDm3-0006Yh-GH
	for qemu-devel@nongnu.org; Thu, 30 May 2019 01:38:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1hWDm2-0004DD-5F
	for qemu-devel@nongnu.org; Thu, 30 May 2019 01:38:47 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:53397 helo=ozlabs.org)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1hWDm1-00049Y-Gb; Thu, 30 May 2019 01:38:46 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 45DxFl3nTDz9sB3; Thu, 30 May 2019 15:38:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1559194715;
	bh=ul4JdYiwnI1q/3YRoDI9Ph10fCjLHAG9+CKFUBhvsec=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VjuS5p4c3+Xzn+KvmeGtinh9jHBz5vvWHi38vmqu9V2BH9mbMTmHrscHm+kkryYwO
	URgiOj4th5uzNvu4gblDhDADN9bYLLhdgo6ZdL3tozwn5ihcAQoC4g9NqOa0xbkWX+
	nMGz2UDtVTBNQZGIBMuDO4z5WhxvvkGehwYo6I0Q=
From: David Gibson <david@gibson.dropbear.id.au>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Date: Thu, 30 May 2019 15:38:29 +1000
Message-Id: <20190530053831.22115-7-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190530053831.22115-1-david@gibson.dropbear.id.au>
References: <20190530053831.22115-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 203.11.71.1
Subject: [Qemu-devel] [PATCH v2 6/8] spapr: Don't use bus number for
 building DRC ids
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: mdroth@linux.ibm.com, mst@redhat.com, groug@kaod.org,
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
index 9dd64bd0bd..513b70f9ad 100644
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


