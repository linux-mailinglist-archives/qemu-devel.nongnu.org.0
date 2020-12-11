Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 244242D6F0C
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 05:18:13 +0100 (CET)
Received: from localhost ([::1]:53388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knZsi-0007Zd-44
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 23:18:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1knZq3-0005X0-Vi; Thu, 10 Dec 2020 23:15:28 -0500
Received: from ozlabs.org ([2401:3900:2:1::2]:46059)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1knZq0-0000VV-Nk; Thu, 10 Dec 2020 23:15:27 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4CscrZ5fsZz9sWb; Fri, 11 Dec 2020 15:15:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1607660110;
 bh=EQ0RM4keCvuyRhFDOSVesL8cPCVi1p1rmqjz0xDso0M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hXxDjlMr+CbD68+oYM8plNse6aGh/JosD+rKYAD3sjXnfPjsP7khklBOkri4Nt+PB
 X2vKFAUamB1FLPNOqqsmVhXzY58a6NaGNSLEkOpYsBoCbfuCoeEDMnSooLqTyA+3E6
 4xfpay1pkihhazbPQSAloqipaySZvTAlLN/+qHzA=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 03/30] spapr: Do PCI device hotplug sanity checks at pre-plug
 only
Date: Fri, 11 Dec 2020 15:14:40 +1100
Message-Id: <20201211041507.425378-4-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201211041507.425378-1-david@gibson.dropbear.id.au>
References: <20201211041507.425378-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Greg Kurz <groug@kaod.org>

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
Message-Id: <20201120234208.683521-2-groug@kaod.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr_pci.c | 43 +++++++++++++++++++++++++++++++++----------
 1 file changed, 33 insertions(+), 10 deletions(-)

diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
index 88ce87f130..2829f298d9 100644
--- a/hw/ppc/spapr_pci.c
+++ b/hw/ppc/spapr_pci.c
@@ -1532,8 +1532,8 @@ static bool bridge_has_valid_chassis_nr(Object *bridge, Error **errp)
     return true;
 }
 
-static void spapr_pci_plug(HotplugHandler *plug_handler,
-                           DeviceState *plugged_dev, Error **errp)
+static void spapr_pci_pre_plug(HotplugHandler *plug_handler,
+                               DeviceState *plugged_dev, Error **errp)
 {
     SpaprPhbState *phb = SPAPR_PCI_HOST_BRIDGE(DEVICE(plug_handler));
     PCIDevice *pdev = PCI_DEVICE(plugged_dev);
@@ -1542,9 +1542,6 @@ static void spapr_pci_plug(HotplugHandler *plug_handler,
     PCIBus *bus = PCI_BUS(qdev_get_parent_bus(DEVICE(pdev)));
     uint32_t slotnr = PCI_SLOT(pdev->devfn);
 
-    /* if DR is disabled we don't need to do anything in the case of
-     * hotplug or coldplug callbacks
-     */
     if (!phb->dr_enabled) {
         /* if this is a hotplug operation initiated by the user
          * we need to let them know it's not enabled
@@ -1552,17 +1549,14 @@ static void spapr_pci_plug(HotplugHandler *plug_handler,
         if (plugged_dev->hotplugged) {
             error_setg(errp, QERR_BUS_NO_HOTPLUG,
                        object_get_typename(OBJECT(phb)));
+            return;
         }
-        return;
     }
 
-    g_assert(drc);
-
     if (pc->is_bridge) {
         if (!bridge_has_valid_chassis_nr(OBJECT(plugged_dev), errp)) {
             return;
         }
-        spapr_pci_bridge_plug(phb, PCI_BRIDGE(plugged_dev));
     }
 
     /* Following the QEMU convention used for PCIe multifunction
@@ -1574,13 +1568,41 @@ static void spapr_pci_plug(HotplugHandler *plug_handler,
         error_setg(errp, "PCI: slot %d function 0 already occupied by %s,"
                    " additional functions can no longer be exposed to guest.",
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
+    SpaprPhbState *phb = SPAPR_PCI_HOST_BRIDGE(DEVICE(plug_handler));
+    PCIDevice *pdev = PCI_DEVICE(plugged_dev);
+    PCIDeviceClass *pc = PCI_DEVICE_GET_CLASS(plugged_dev);
+    SpaprDrc *drc = drc_from_dev(phb, pdev);
+    uint32_t slotnr = PCI_SLOT(pdev->devfn);
 
-    if (!spapr_drc_attach(drc, DEVICE(pdev), errp)) {
+    /*
+     * If DR is disabled we don't need to do anything in the case of
+     * hotplug or coldplug callbacks.
+     */
+    if (!phb->dr_enabled) {
         return;
     }
 
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
@@ -2223,6 +2245,7 @@ static void spapr_phb_class_init(ObjectClass *klass, void *data)
     /* Supported by TYPE_SPAPR_MACHINE */
     dc->user_creatable = true;
     set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
+    hp->pre_plug = spapr_pci_pre_plug;
     hp->plug = spapr_pci_plug;
     hp->unplug = spapr_pci_unplug;
     hp->unplug_request = spapr_pci_unplug_request;
-- 
2.29.2


