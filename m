Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7B42EB8A9
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 04:51:01 +0100 (CET)
Received: from localhost ([::1]:54504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwzqe-0004Mt-LI
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 22:51:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kwzeq-0005kD-4F; Tue, 05 Jan 2021 22:38:48 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:50205 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kwzek-0006Jq-JR; Tue, 05 Jan 2021 22:38:44 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4D9ZpH0JbDz9sWK; Wed,  6 Jan 2021 14:38:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1609904311;
 bh=kDCPg6lEH6JbcIu/dcWvew1FvKAOlLVHcK88kddP9h8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=m7KLKkCSOC0ww+Yw0QtFD4/r/wEeWMSfMCcc3VUgmOka8Av09oaVu+IJ+aKkNqgfH
 Ct/+bY1m3bzttK5oP3ZHrmN3pY6CYVWp0YqUWO86wBdtS1Ev0bbHx49md4w2G5Ix1N
 f42nBaqOKGi3S6brGtFsKWuKXFmILfKN5iijknbU=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 11/22] spapr: Fix reset of transient DR connectors
Date: Wed,  6 Jan 2021 14:38:05 +1100
Message-Id: <20210106033816.232598-12-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210106033816.232598-1-david@gibson.dropbear.id.au>
References: <20210106033816.232598-1-david@gibson.dropbear.id.au>
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Greg Kurz <groug@kaod.org>

Documentation of object_property_iter_init() clearly stipulates that
"it is forbidden to modify the property list while iterating". But this
is exactly what we do when resetting transient DR connectors during CAS.
The call to spapr_drc_reset() can finalize the hot-unplug sequence of a
PHB or a PCI bridge, both of which will then in turn destroy their PCI
DRCs. This could potentially invalidate the iterator. It is pure luck
that this haven't caused any issues so far.

Change spapr_drc_reset() to return true if it caused a device to be
removed. Restart from scratch in this case. This can potentially
increase the overall DRC reset time, especially with a high maxmem
which generates a lot of LMB DRCs. But this kind of setup is rare,
and so is the use case of rebooting a guest while doing hot-unplug.

Signed-off-by: Greg Kurz <groug@kaod.org>
Message-Id: <20201218103400.689660-3-groug@kaod.org>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Tested-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr_drc.c         | 6 +++++-
 hw/ppc/spapr_hcall.c       | 8 +++++++-
 include/hw/ppc/spapr_drc.h | 3 ++-
 3 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/hw/ppc/spapr_drc.c b/hw/ppc/spapr_drc.c
index 8d62f55066..5b5e2ac58a 100644
--- a/hw/ppc/spapr_drc.c
+++ b/hw/ppc/spapr_drc.c
@@ -417,9 +417,10 @@ void spapr_drc_detach(SpaprDrc *drc)
     spapr_drc_release(drc);
 }
 
-void spapr_drc_reset(SpaprDrc *drc)
+bool spapr_drc_reset(SpaprDrc *drc)
 {
     SpaprDrcClass *drck = SPAPR_DR_CONNECTOR_GET_CLASS(drc);
+    bool unplug_completed = false;
 
     trace_spapr_drc_reset(spapr_drc_index(drc));
 
@@ -428,6 +429,7 @@ void spapr_drc_reset(SpaprDrc *drc)
      */
     if (drc->unplug_requested) {
         spapr_drc_release(drc);
+        unplug_completed = true;
     }
 
     if (drc->dev) {
@@ -444,6 +446,8 @@ void spapr_drc_reset(SpaprDrc *drc)
         drc->ccs_offset = -1;
         drc->ccs_depth = -1;
     }
+
+    return unplug_completed;
 }
 
 static bool spapr_drc_unplug_requested_needed(void *opaque)
diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
index 4e9d50c254..aa22830ac4 100644
--- a/hw/ppc/spapr_hcall.c
+++ b/hw/ppc/spapr_hcall.c
@@ -1639,6 +1639,7 @@ static void spapr_handle_transient_dev_before_cas(SpaprMachineState *spapr)
     ObjectPropertyIterator iter;
 
     drc_container = container_get(object_get_root(), "/dr-connector");
+restart:
     object_property_iter_init(&iter, drc_container);
     while ((prop = object_property_iter_next(&iter))) {
         SpaprDrc *drc;
@@ -1652,8 +1653,13 @@ static void spapr_handle_transient_dev_before_cas(SpaprMachineState *spapr)
 
         /*
          * This will complete any pending plug/unplug requests.
+         * In case of a unplugged PHB or PCI bridge, this will
+         * cause some DRCs to be destroyed and thus potentially
+         * invalidate the iterator.
          */
-        spapr_drc_reset(drc);
+        if (spapr_drc_reset(drc)) {
+            goto restart;
+        }
     }
 
     spapr_clear_pending_hotplug_events(spapr);
diff --git a/include/hw/ppc/spapr_drc.h b/include/hw/ppc/spapr_drc.h
index cff5e707d0..5d80019f82 100644
--- a/include/hw/ppc/spapr_drc.h
+++ b/include/hw/ppc/spapr_drc.h
@@ -224,7 +224,8 @@ static inline bool spapr_drc_hotplugged(DeviceState *dev)
     return dev->hotplugged && !runstate_check(RUN_STATE_INMIGRATE);
 }
 
-void spapr_drc_reset(SpaprDrc *drc);
+/* Returns true if an unplug request completed */
+bool spapr_drc_reset(SpaprDrc *drc);
 
 uint32_t spapr_drc_index(SpaprDrc *drc);
 SpaprDrcType spapr_drc_type(SpaprDrc *drc);
-- 
2.29.2


