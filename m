Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F7112DE12B
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 11:38:21 +0100 (CET)
Received: from localhost ([::1]:60758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqD9Q-0005cM-EY
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 05:38:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kqD5T-0000jH-1N
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 05:34:15 -0500
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:36968)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kqD5R-0001yi-5R
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 05:34:14 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-179-xrFI2bRXO6yBgkg2dL775g-1; Fri, 18 Dec 2020 05:34:08 -0500
X-MC-Unique: xrFI2bRXO6yBgkg2dL775g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1B414801B16;
 Fri, 18 Dec 2020 10:34:07 +0000 (UTC)
Received: from bahia.redhat.com (ovpn-114-254.ams2.redhat.com [10.36.114.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E97A860BE5;
 Fri, 18 Dec 2020 10:34:05 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/6] spapr: Introduce spapr_drc_reset_all()
Date: Fri, 18 Dec 2020 11:33:57 +0100
Message-Id: <20201218103400.689660-4-groug@kaod.org>
In-Reply-To: <20201218103400.689660-1-groug@kaod.org>
References: <20201218103400.689660-1-groug@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=WINDOWS-1252
Received-SPF: softfail client-ip=207.211.30.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb@linux.ibm.com>, qemu-ppc@nongnu.org,
 Greg Kurz <groug@kaod.org>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

No need to expose the way DRCs are traversed outside of spapr_drc.c.

Signed-off-by: Greg Kurz <groug@kaod.org>
---
 include/hw/ppc/spapr_drc.h |  6 ++++++
 hw/ppc/spapr_drc.c         | 31 +++++++++++++++++++++++++++++
 hw/ppc/spapr_hcall.c       | 40 ++++++--------------------------------
 3 files changed, 43 insertions(+), 34 deletions(-)

diff --git a/include/hw/ppc/spapr_drc.h b/include/hw/ppc/spapr_drc.h
index 5d80019f82e2..8982927d5c24 100644
--- a/include/hw/ppc/spapr_drc.h
+++ b/include/hw/ppc/spapr_drc.h
@@ -245,6 +245,12 @@ int spapr_dt_drc(void *fdt, int offset, Object *owner,=
 uint32_t drc_type_mask);
 void spapr_drc_attach(SpaprDrc *drc, DeviceState *d);
 void spapr_drc_detach(SpaprDrc *drc);
=20
+/*
+ * Reset all DRCs, causing pending hot-plug/unplug requests to complete.
+ * Safely handles potential DRC removal (eg. PHBs or PCI bridges).
+ */
+void spapr_drc_reset_all(struct SpaprMachineState *spapr);
+
 static inline bool spapr_drc_unplug_requested(SpaprDrc *drc)
 {
     return drc->unplug_requested;
diff --git a/hw/ppc/spapr_drc.c b/hw/ppc/spapr_drc.c
index 5b5e2ac58a7e..a4d2608017c5 100644
--- a/hw/ppc/spapr_drc.c
+++ b/hw/ppc/spapr_drc.c
@@ -949,6 +949,37 @@ out:
     return ret;
 }
=20
+void spapr_drc_reset_all(SpaprMachineState *spapr)
+{
+    Object *drc_container;
+    ObjectProperty *prop;
+    ObjectPropertyIterator iter;
+
+    drc_container =3D container_get(object_get_root(), DRC_CONTAINER_PATH)=
;
+restart:
+    object_property_iter_init(&iter, drc_container);
+    while ((prop =3D object_property_iter_next(&iter))) {
+        SpaprDrc *drc;
+
+        if (!strstart(prop->type, "link<", NULL)) {
+            continue;
+        }
+        drc =3D SPAPR_DR_CONNECTOR(object_property_get_link(drc_container,
+                                                          prop->name,
+                                                          &error_abort));
+
+        /*
+         * This will complete any pending plug/unplug requests.
+         * In case of a unplugged PHB or PCI bridge, this will
+         * cause some DRCs to be destroyed and thus potentially
+         * invalidate the iterator.
+         */
+        if (spapr_drc_reset(drc)) {
+            goto restart;
+        }
+    }
+}
+
 /*
  * RTAS calls
  */
diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
index aa22830ac4bd..e5dfc1ba7acc 100644
--- a/hw/ppc/spapr_hcall.c
+++ b/hw/ppc/spapr_hcall.c
@@ -1632,39 +1632,6 @@ static uint32_t cas_check_pvr(PowerPCCPU *cpu, uint3=
2_t max_compat,
     return best_compat;
 }
=20
-static void spapr_handle_transient_dev_before_cas(SpaprMachineState *spapr=
)
-{
-    Object *drc_container;
-    ObjectProperty *prop;
-    ObjectPropertyIterator iter;
-
-    drc_container =3D container_get(object_get_root(), "/dr-connector");
-restart:
-    object_property_iter_init(&iter, drc_container);
-    while ((prop =3D object_property_iter_next(&iter))) {
-        SpaprDrc *drc;
-
-        if (!strstart(prop->type, "link<", NULL)) {
-            continue;
-        }
-        drc =3D SPAPR_DR_CONNECTOR(object_property_get_link(drc_container,
-                                                          prop->name,
-                                                          &error_abort));
-
-        /*
-         * This will complete any pending plug/unplug requests.
-         * In case of a unplugged PHB or PCI bridge, this will
-         * cause some DRCs to be destroyed and thus potentially
-         * invalidate the iterator.
-         */
-        if (spapr_drc_reset(drc)) {
-            goto restart;
-        }
-    }
-
-    spapr_clear_pending_hotplug_events(spapr);
-}
-
 target_ulong do_client_architecture_support(PowerPCCPU *cpu,
                                             SpaprMachineState *spapr,
                                             target_ulong vec,
@@ -1822,7 +1789,12 @@ target_ulong do_client_architecture_support(PowerPCC=
PU *cpu,
=20
     spapr_irq_update_active_intc(spapr);
=20
-    spapr_handle_transient_dev_before_cas(spapr);
+    /*
+     * Process all pending hot-plug/unplug requests now. An updated full
+     * rendered FDT will be returned to the guest.
+     */
+    spapr_drc_reset_all(spapr);
+    spapr_clear_pending_hotplug_events(spapr);
=20
     /*
      * If spapr_machine_reset() did not set up a HPT but one is necessary
--=20
2.26.2


