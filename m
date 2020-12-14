Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A4E2D9274
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 06:11:00 +0100 (CET)
Received: from localhost ([::1]:48648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kog8R-0004rF-At
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 00:10:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kofwX-0005J2-JF; Sun, 13 Dec 2020 23:58:41 -0500
Received: from ozlabs.org ([2401:3900:2:1::2]:60599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kofwU-0004sL-Ds; Sun, 13 Dec 2020 23:58:41 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4CvTfs3MT7z9sWb; Mon, 14 Dec 2020 15:58:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1607921893;
 bh=aEDEWIWdP1SHfIAhW4nIBEp6mHHBQVwYeiucZCW6Wck=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Nx9GHwCADEPDpBMg6B+A4swjI77vy2swXFBvTD2Gqfkc2DHCkcbkvA27c9iTqU24B
 XSyz0BHX5hUNNrO7/pD34tZOfsHyjuOswSbevoX8X7k3DZBixOHrgNph6J966sx7ko
 /xh7hhBw764JecKjqq9caUiTG4w9RCExbyZ5zsrc=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 20/30] spapr: spapr_drc_attach() cannot fail
Date: Mon, 14 Dec 2020 15:57:57 +1100
Message-Id: <20201214045807.41003-21-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201214045807.41003-1-david@gibson.dropbear.id.au>
References: <20201214045807.41003-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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

All users are passing &error_abort already. Document the fact
that spapr_drc_attach() should only be passed a free DRC, which
is supposedly the case if appropriate checking is done earlier.

Signed-off-by: Greg Kurz <groug@kaod.org>
Message-Id: <20201201113728.885700-5-groug@kaod.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr.c             | 6 +++---
 hw/ppc/spapr_drc.c         | 8 ++------
 hw/ppc/spapr_nvdimm.c      | 2 +-
 hw/ppc/spapr_pci.c         | 2 +-
 include/hw/ppc/spapr_drc.h | 8 +++++++-
 5 files changed, 14 insertions(+), 12 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 1f8bd53cb8..dfedded9a8 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -3398,7 +3398,7 @@ static void spapr_add_lmbs(DeviceState *dev, uint64_t addr_start, uint64_t size,
          * that doesn't overlap with any existing mapping at pre-plug. The
          * corresponding LMB DRCs are thus assumed to be all attachable.
          */
-        spapr_drc_attach(drc, dev, &error_abort);
+        spapr_drc_attach(drc, dev);
         if (!hotplugged) {
             spapr_drc_reset(drc);
         }
@@ -3766,7 +3766,7 @@ static void spapr_core_plug(HotplugHandler *hotplug_dev, DeviceState *dev)
          * core being plugged into a free slot. Nothing should already
          * be attached to the corresponding DRC.
          */
-        spapr_drc_attach(drc, dev, &error_abort);
+        spapr_drc_attach(drc, dev);
 
         if (hotplugged) {
             /*
@@ -3931,7 +3931,7 @@ static void spapr_phb_plug(HotplugHandler *hotplug_dev, DeviceState *dev)
     assert(drc);
 
     /* spapr_phb_pre_plug() already checked the DRC is attachable */
-    spapr_drc_attach(drc, dev, &error_abort);
+    spapr_drc_attach(drc, dev);
 
     if (hotplugged) {
         spapr_hotplug_req_add_by_index(drc);
diff --git a/hw/ppc/spapr_drc.c b/hw/ppc/spapr_drc.c
index 77718cde1f..f991cf89a0 100644
--- a/hw/ppc/spapr_drc.c
+++ b/hw/ppc/spapr_drc.c
@@ -369,14 +369,11 @@ static void prop_get_fdt(Object *obj, Visitor *v, const char *name,
     } while (fdt_depth != 0);
 }
 
-bool spapr_drc_attach(SpaprDrc *drc, DeviceState *d, Error **errp)
+void spapr_drc_attach(SpaprDrc *drc, DeviceState *d)
 {
     trace_spapr_drc_attach(spapr_drc_index(drc));
 
-    if (drc->dev) {
-        error_setg(errp, "an attached device is still awaiting release");
-        return false;
-    }
+    g_assert(!drc->dev);
     g_assert((drc->state == SPAPR_DRC_STATE_LOGICAL_UNUSABLE)
              || (drc->state == SPAPR_DRC_STATE_PHYSICAL_POWERON));
 
@@ -386,7 +383,6 @@ bool spapr_drc_attach(SpaprDrc *drc, DeviceState *d, Error **errp)
                              object_get_typename(OBJECT(drc->dev)),
                              (Object **)(&drc->dev),
                              NULL, 0);
-    return true;
 }
 
 static void spapr_drc_release(SpaprDrc *drc)
diff --git a/hw/ppc/spapr_nvdimm.c b/hw/ppc/spapr_nvdimm.c
index 2f1c196e1b..73ee006541 100644
--- a/hw/ppc/spapr_nvdimm.c
+++ b/hw/ppc/spapr_nvdimm.c
@@ -101,7 +101,7 @@ void spapr_add_nvdimm(DeviceState *dev, uint64_t slot)
      * pc_dimm_get_free_slot() provided a free slot at pre-plug. The
      * corresponding DRC is thus assumed to be attachable.
      */
-    spapr_drc_attach(drc, dev, &error_abort);
+    spapr_drc_attach(drc, dev);
 
     if (hotplugged) {
         spapr_hotplug_req_add_by_index(drc);
diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
index 2829f298d9..e946bd5055 100644
--- a/hw/ppc/spapr_pci.c
+++ b/hw/ppc/spapr_pci.c
@@ -1601,7 +1601,7 @@ static void spapr_pci_plug(HotplugHandler *plug_handler,
     }
 
     /* spapr_pci_pre_plug() already checked the DRC is attachable */
-    spapr_drc_attach(drc, DEVICE(pdev), &error_abort);
+    spapr_drc_attach(drc, DEVICE(pdev));
 
     /* If this is function 0, signal hotplug for all the device functions.
      * Otherwise defer sending the hotplug event.
diff --git a/include/hw/ppc/spapr_drc.h b/include/hw/ppc/spapr_drc.h
index 165b281496..def3593adc 100644
--- a/include/hw/ppc/spapr_drc.h
+++ b/include/hw/ppc/spapr_drc.h
@@ -235,7 +235,13 @@ SpaprDrc *spapr_drc_by_index(uint32_t index);
 SpaprDrc *spapr_drc_by_id(const char *type, uint32_t id);
 int spapr_dt_drc(void *fdt, int offset, Object *owner, uint32_t drc_type_mask);
 
-bool spapr_drc_attach(SpaprDrc *drc, DeviceState *d, Error **errp);
+/*
+ * These functions respectively abort if called with a device already
+ * attached or no device attached. In the case of spapr_drc_attach(),
+ * this means that the attachability of the DRC *must* be checked
+ * beforehand (eg. check drc->dev at pre-plug).
+ */
+void spapr_drc_attach(SpaprDrc *drc, DeviceState *d);
 void spapr_drc_detach(SpaprDrc *drc);
 
 /* Returns true if a hot plug/unplug request is pending */
-- 
2.29.2


