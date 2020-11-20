Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4D62BBA4D
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Nov 2020 00:46:29 +0100 (CET)
Received: from localhost ([::1]:43598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgG6m-00027W-IV
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 18:46:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kgG2o-0005oh-Jg
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 18:42:22 -0500
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:31624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kgG2l-0003lL-LU
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 18:42:22 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-386-3w8wJV-EPi2qEVOJ3GTMAA-1; Fri, 20 Nov 2020 18:42:13 -0500
X-MC-Unique: 3w8wJV-EPi2qEVOJ3GTMAA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C83B1107AD38;
 Fri, 20 Nov 2020 23:42:12 +0000 (UTC)
Received: from bahia.redhat.com (ovpn-112-44.ams2.redhat.com [10.36.112.44])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9800260BFA;
 Fri, 20 Nov 2020 23:42:11 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.0 1/9] spapr: Do PCI device hotplug sanity checks at
 pre-plug only
Date: Sat, 21 Nov 2020 00:42:00 +0100
Message-Id: <20201120234208.683521-2-groug@kaod.org>
In-Reply-To: <20201120234208.683521-1-groug@kaod.org>
References: <20201120234208.683521-1-groug@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=WINDOWS-1252
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-ppc@nongnu.org,
 Greg Kurz <groug@kaod.org>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The PHB acts as the hotplug handler for PCI devices. It does some
sanity checks on DR enablement, PCI bridge chassis numbers and
multifunction. These checks are currently performed at plug time,
but they would best sit in a pre-plug handler in order to error
out as early as possible.

Create a spapr_pci_pre_plug() handler and move all the checking
there. Add a check that the associated DRC doesn't already have
an attached device. This is equivalent to the slot availability
check performed by do_pci_register_device() upon realization of
the PCI device.

This allows to pass &error_abort to spapr_drc_attach() and to end
up with a plug handler that doesn't need to report errors anymore.

Signed-off-by: Greg Kurz <groug@kaod.org>
---
 hw/ppc/spapr_pci.c | 43 +++++++++++++++++++++++++++++++++----------
 1 file changed, 33 insertions(+), 10 deletions(-)

diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
index 88ce87f130a5..2829f298d9c1 100644
--- a/hw/ppc/spapr_pci.c
+++ b/hw/ppc/spapr_pci.c
@@ -1532,8 +1532,8 @@ static bool bridge_has_valid_chassis_nr(Object *bridg=
e, Error **errp)
     return true;
 }
=20
-static void spapr_pci_plug(HotplugHandler *plug_handler,
-                           DeviceState *plugged_dev, Error **errp)
+static void spapr_pci_pre_plug(HotplugHandler *plug_handler,
+                               DeviceState *plugged_dev, Error **errp)
 {
     SpaprPhbState *phb =3D SPAPR_PCI_HOST_BRIDGE(DEVICE(plug_handler));
     PCIDevice *pdev =3D PCI_DEVICE(plugged_dev);
@@ -1542,9 +1542,6 @@ static void spapr_pci_plug(HotplugHandler *plug_handl=
er,
     PCIBus *bus =3D PCI_BUS(qdev_get_parent_bus(DEVICE(pdev)));
     uint32_t slotnr =3D PCI_SLOT(pdev->devfn);
=20
-    /* if DR is disabled we don't need to do anything in the case of
-     * hotplug or coldplug callbacks
-     */
     if (!phb->dr_enabled) {
         /* if this is a hotplug operation initiated by the user
          * we need to let them know it's not enabled
@@ -1552,17 +1549,14 @@ static void spapr_pci_plug(HotplugHandler *plug_han=
dler,
         if (plugged_dev->hotplugged) {
             error_setg(errp, QERR_BUS_NO_HOTPLUG,
                        object_get_typename(OBJECT(phb)));
+            return;
         }
-        return;
     }
=20
-    g_assert(drc);
-
     if (pc->is_bridge) {
         if (!bridge_has_valid_chassis_nr(OBJECT(plugged_dev), errp)) {
             return;
         }
-        spapr_pci_bridge_plug(phb, PCI_BRIDGE(plugged_dev));
     }
=20
     /* Following the QEMU convention used for PCIe multifunction
@@ -1574,13 +1568,41 @@ static void spapr_pci_plug(HotplugHandler *plug_han=
dler,
         error_setg(errp, "PCI: slot %d function 0 already occupied by %s,"
                    " additional functions can no longer be exposed to gues=
t.",
                    slotnr, bus->devices[PCI_DEVFN(slotnr, 0)]->name);
+    }
+
+    if (drc && drc->dev) {
+        error_setg(errp, "PCI: slot %d already occupied by %s", slotnr,
+                   pci_get_function_0(PCI_DEVICE(drc->dev))->name);
         return;
     }
+}
+
+static void spapr_pci_plug(HotplugHandler *plug_handler,
+                           DeviceState *plugged_dev, Error **errp)
+{
+    SpaprPhbState *phb =3D SPAPR_PCI_HOST_BRIDGE(DEVICE(plug_handler));
+    PCIDevice *pdev =3D PCI_DEVICE(plugged_dev);
+    PCIDeviceClass *pc =3D PCI_DEVICE_GET_CLASS(plugged_dev);
+    SpaprDrc *drc =3D drc_from_dev(phb, pdev);
+    uint32_t slotnr =3D PCI_SLOT(pdev->devfn);
=20
-    if (!spapr_drc_attach(drc, DEVICE(pdev), errp)) {
+    /*
+     * If DR is disabled we don't need to do anything in the case of
+     * hotplug or coldplug callbacks.
+     */
+    if (!phb->dr_enabled) {
         return;
     }
=20
+    g_assert(drc);
+
+    if (pc->is_bridge) {
+        spapr_pci_bridge_plug(phb, PCI_BRIDGE(plugged_dev));
+    }
+
+    /* spapr_pci_pre_plug() already checked the DRC is attachable */
+    spapr_drc_attach(drc, DEVICE(pdev), &error_abort);
+
     /* If this is function 0, signal hotplug for all the device functions.
      * Otherwise defer sending the hotplug event.
      */
@@ -2223,6 +2245,7 @@ static void spapr_phb_class_init(ObjectClass *klass, =
void *data)
     /* Supported by TYPE_SPAPR_MACHINE */
     dc->user_creatable =3D true;
     set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
+    hp->pre_plug =3D spapr_pci_pre_plug;
     hp->plug =3D spapr_pci_plug;
     hp->unplug =3D spapr_pci_unplug;
     hp->unplug_request =3D spapr_pci_unplug_request;
--=20
2.26.2


