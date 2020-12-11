Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5802D6F1E
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 05:25:59 +0100 (CET)
Received: from localhost ([::1]:45288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kna0E-0007zs-30
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 23:25:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1knZqA-0005ef-FJ; Thu, 10 Dec 2020 23:15:34 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:45783 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1knZq6-0000j1-R8; Thu, 10 Dec 2020 23:15:34 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Cscrb0xFwz9sWg; Fri, 11 Dec 2020 15:15:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1607660111;
 bh=OQC8DXtu1Qm/Hn1u4TG7T1Oemxye5jQb1DbAfIzZWW8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hcICFaHUTJjzIeWfQV3QRIm3QOiLEkAlK+M09+r4BuhByrRtgTWN1ljkoeYtnEr7D
 szjClYncuxW91Qg5WEe+7cUgHfdjE1+Ma8EYGQRM/QcqeD0wO02g76LsFWKj/rt7nz
 Nfg372b1oIOCnupOAIXzs7aUOhoTqmaAhE39mOyI=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 06/30] spapr: Do PHB hoplug sanity check at pre-plug
Date: Fri, 11 Dec 2020 15:14:43 +1100
Message-Id: <20201211041507.425378-7-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201211041507.425378-1-david@gibson.dropbear.id.au>
References: <20201211041507.425378-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
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

We currently detect that a PHB index is already in use at plug time.
But this can be decteted at pre-plug in order to error out earlier.

This allows to pass &error_abort to spapr_drc_attach() and to end
up with a plug handler that doesn't need to report errors anymore.

Signed-off-by: Greg Kurz <groug@kaod.org>
Message-Id: <20201120234208.683521-8-groug@kaod.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 90db845cbb..b270172369 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -3889,6 +3889,7 @@ static bool spapr_phb_pre_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
     SpaprPhbState *sphb = SPAPR_PCI_HOST_BRIDGE(dev);
     SpaprMachineClass *smc = SPAPR_MACHINE_GET_CLASS(spapr);
     const unsigned windows_supported = spapr_phb_windows_supported(sphb);
+    SpaprDrc *drc;
 
     if (dev->hotplugged && !smc->dr_phb_enabled) {
         error_setg(errp, "PHB hotplug not supported for this machine");
@@ -3900,6 +3901,12 @@ static bool spapr_phb_pre_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
         return false;
     }
 
+    drc = spapr_drc_by_id(TYPE_SPAPR_DRC_PHB, sphb->index);
+    if (drc && drc->dev) {
+        error_setg(errp, "PHB %d already attached", sphb->index);
+        return false;
+    }
+
     /*
      * This will check that sphb->index doesn't exceed the maximum number of
      * PHBs for the current machine type.
@@ -3913,8 +3920,7 @@ static bool spapr_phb_pre_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
                            errp);
 }
 
-static void spapr_phb_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
-                           Error **errp)
+static void spapr_phb_plug(HotplugHandler *hotplug_dev, DeviceState *dev)
 {
     SpaprMachineState *spapr = SPAPR_MACHINE(OBJECT(hotplug_dev));
     SpaprMachineClass *smc = SPAPR_MACHINE_GET_CLASS(spapr);
@@ -3930,9 +3936,8 @@ static void spapr_phb_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
     /* hotplug hooks should check it's enabled before getting this far */
     assert(drc);
 
-    if (!spapr_drc_attach(drc, dev, errp)) {
-        return;
-    }
+    /* spapr_phb_pre_plug() already checked the DRC is attachable */
+    spapr_drc_attach(drc, dev, &error_abort);
 
     if (hotplugged) {
         spapr_hotplug_req_add_by_index(drc);
@@ -4000,7 +4005,7 @@ static void spapr_machine_device_plug(HotplugHandler *hotplug_dev,
     } else if (object_dynamic_cast(OBJECT(dev), TYPE_SPAPR_CPU_CORE)) {
         spapr_core_plug(hotplug_dev, dev, errp);
     } else if (object_dynamic_cast(OBJECT(dev), TYPE_SPAPR_PCI_HOST_BRIDGE)) {
-        spapr_phb_plug(hotplug_dev, dev, errp);
+        spapr_phb_plug(hotplug_dev, dev);
     } else if (object_dynamic_cast(OBJECT(dev), TYPE_SPAPR_TPM_PROXY)) {
         spapr_tpm_proxy_plug(hotplug_dev, dev, errp);
     }
-- 
2.29.2


