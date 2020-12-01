Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 994792CA1B2
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 12:45:02 +0100 (CET)
Received: from localhost ([::1]:45388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk45d-000527-MH
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 06:45:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kk3yd-0007HM-Pi
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 06:37:47 -0500
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:41242)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kk3yb-0000q7-4L
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 06:37:47 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-509-xqIY-lvoMLqt_ptSJaOY7g-1; Tue, 01 Dec 2020 06:37:40 -0500
X-MC-Unique: xqIY-lvoMLqt_ptSJaOY7g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 383EA1842141;
 Tue,  1 Dec 2020 11:37:39 +0000 (UTC)
Received: from bahia.redhat.com (ovpn-112-87.ams2.redhat.com [10.36.112.87])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 12E5260BE5;
 Tue,  1 Dec 2020 11:37:37 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.0 v2 4/4] spapr: spapr_drc_attach() cannot fail
Date: Tue,  1 Dec 2020 12:37:28 +0100
Message-Id: <20201201113728.885700-5-groug@kaod.org>
In-Reply-To: <20201201113728.885700-1-groug@kaod.org>
References: <20201201113728.885700-1-groug@kaod.org>
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
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-ppc@nongnu.org,
 Greg Kurz <groug@kaod.org>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All users are passing &error_abort already. Document the fact
that spapr_drc_attach() should only be passed a free DRC, which
is supposedly the case if appropriate checking is done earlier.

Signed-off-by: Greg Kurz <groug@kaod.org>
---
 include/hw/ppc/spapr_drc.h | 8 +++++++-
 hw/ppc/spapr.c             | 6 +++---
 hw/ppc/spapr_drc.c         | 8 ++------
 hw/ppc/spapr_nvdimm.c      | 2 +-
 hw/ppc/spapr_pci.c         | 2 +-
 5 files changed, 14 insertions(+), 12 deletions(-)

diff --git a/include/hw/ppc/spapr_drc.h b/include/hw/ppc/spapr_drc.h
index 165b281496bb..def3593adc8b 100644
--- a/include/hw/ppc/spapr_drc.h
+++ b/include/hw/ppc/spapr_drc.h
@@ -235,7 +235,13 @@ SpaprDrc *spapr_drc_by_index(uint32_t index);
 SpaprDrc *spapr_drc_by_id(const char *type, uint32_t id);
 int spapr_dt_drc(void *fdt, int offset, Object *owner, uint32_t drc_type_m=
ask);
=20
-bool spapr_drc_attach(SpaprDrc *drc, DeviceState *d, Error **errp);
+/*
+ * These functions respectively abort if called with a device already
+ * attached or no device attached. In the case of spapr_drc_attach(),
+ * this means that the attachability of the DRC *must* be checked
+ * beforehand (eg. check drc->dev at pre-plug).
+ */
+void spapr_drc_attach(SpaprDrc *drc, DeviceState *d);
 void spapr_drc_detach(SpaprDrc *drc);
=20
 /* Returns true if a hot plug/unplug request is pending */
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 6707fafdd313..d1dcf3ab2c94 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -3401,7 +3401,7 @@ static void spapr_add_lmbs(DeviceState *dev, uint64_t=
 addr_start, uint64_t size,
          * that doesn't overlap with any existing mapping at pre-plug. The
          * corresponding LMB DRCs are thus assumed to be all attachable.
          */
-        spapr_drc_attach(drc, dev, &error_abort);
+        spapr_drc_attach(drc, dev);
         if (!hotplugged) {
             spapr_drc_reset(drc);
         }
@@ -3769,7 +3769,7 @@ static void spapr_core_plug(HotplugHandler *hotplug_d=
ev, DeviceState *dev)
          * core being plugged into a free slot. Nothing should already
          * be attached to the corresponding DRC.
          */
-        spapr_drc_attach(drc, dev, &error_abort);
+        spapr_drc_attach(drc, dev);
=20
         if (hotplugged) {
             /*
@@ -3934,7 +3934,7 @@ static void spapr_phb_plug(HotplugHandler *hotplug_de=
v, DeviceState *dev)
     assert(drc);
=20
     /* spapr_phb_pre_plug() already checked the DRC is attachable */
-    spapr_drc_attach(drc, dev, &error_abort);
+    spapr_drc_attach(drc, dev);
=20
     if (hotplugged) {
         spapr_hotplug_req_add_by_index(drc);
diff --git a/hw/ppc/spapr_drc.c b/hw/ppc/spapr_drc.c
index 77718cde1ff2..f991cf89a08a 100644
--- a/hw/ppc/spapr_drc.c
+++ b/hw/ppc/spapr_drc.c
@@ -369,14 +369,11 @@ static void prop_get_fdt(Object *obj, Visitor *v, con=
st char *name,
     } while (fdt_depth !=3D 0);
 }
=20
-bool spapr_drc_attach(SpaprDrc *drc, DeviceState *d, Error **errp)
+void spapr_drc_attach(SpaprDrc *drc, DeviceState *d)
 {
     trace_spapr_drc_attach(spapr_drc_index(drc));
=20
-    if (drc->dev) {
-        error_setg(errp, "an attached device is still awaiting release");
-        return false;
-    }
+    g_assert(!drc->dev);
     g_assert((drc->state =3D=3D SPAPR_DRC_STATE_LOGICAL_UNUSABLE)
              || (drc->state =3D=3D SPAPR_DRC_STATE_PHYSICAL_POWERON));
=20
@@ -386,7 +383,6 @@ bool spapr_drc_attach(SpaprDrc *drc, DeviceState *d, Er=
ror **errp)
                              object_get_typename(OBJECT(drc->dev)),
                              (Object **)(&drc->dev),
                              NULL, 0);
-    return true;
 }
=20
 static void spapr_drc_release(SpaprDrc *drc)
diff --git a/hw/ppc/spapr_nvdimm.c b/hw/ppc/spapr_nvdimm.c
index 2f1c196e1b76..73ee006541a6 100644
--- a/hw/ppc/spapr_nvdimm.c
+++ b/hw/ppc/spapr_nvdimm.c
@@ -101,7 +101,7 @@ void spapr_add_nvdimm(DeviceState *dev, uint64_t slot)
      * pc_dimm_get_free_slot() provided a free slot at pre-plug. The
      * corresponding DRC is thus assumed to be attachable.
      */
-    spapr_drc_attach(drc, dev, &error_abort);
+    spapr_drc_attach(drc, dev);
=20
     if (hotplugged) {
         spapr_hotplug_req_add_by_index(drc);
diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
index 2829f298d9c1..e946bd5055cc 100644
--- a/hw/ppc/spapr_pci.c
+++ b/hw/ppc/spapr_pci.c
@@ -1601,7 +1601,7 @@ static void spapr_pci_plug(HotplugHandler *plug_handl=
er,
     }
=20
     /* spapr_pci_pre_plug() already checked the DRC is attachable */
-    spapr_drc_attach(drc, DEVICE(pdev), &error_abort);
+    spapr_drc_attach(drc, DEVICE(pdev));
=20
     /* If this is function 0, signal hotplug for all the device functions.
      * Otherwise defer sending the hotplug event.
--=20
2.26.2


