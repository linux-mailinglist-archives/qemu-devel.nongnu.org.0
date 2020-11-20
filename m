Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4303D2BBA49
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Nov 2020 00:45:00 +0100 (CET)
Received: from localhost ([::1]:36294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgG5L-0007ZD-A9
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 18:44:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kgG2o-0005os-NR
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 18:42:22 -0500
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:22316)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kgG2m-0003lc-GU
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 18:42:22 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-545-rCgckIQEMPKOzJnqLoTVfQ-1; Fri, 20 Nov 2020 18:42:15 -0500
X-MC-Unique: rCgckIQEMPKOzJnqLoTVfQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4C4118030A8;
 Fri, 20 Nov 2020 23:42:14 +0000 (UTC)
Received: from bahia.redhat.com (ovpn-112-44.ams2.redhat.com [10.36.112.44])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 21C7860BFA;
 Fri, 20 Nov 2020 23:42:12 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.0 2/9] spapr: Do NVDIMM/PC-DIMM device hotplug sanity
 checks at pre-plug only
Date: Sat, 21 Nov 2020 00:42:01 +0100
Message-Id: <20201120234208.683521-3-groug@kaod.org>
In-Reply-To: <20201120234208.683521-1-groug@kaod.org>
References: <20201120234208.683521-1-groug@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
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

Pre-plug of a memory device, be it an NVDIMM or a PC-DIMM, ensures
that the memory slot is available and that addresses don't overlap
with existing memory regions. The corresponding DRCs in the LMB
and PMEM namespaces are thus necessarily attachable at plug time.

Pass &error_abort to spapr_drc_attach() in spapr_add_lmbs() and
spapr_add_nvdimm(). This allows to greatly simplify error handling
on the plug path.

Signed-off-by: Greg Kurz <groug@kaod.org>
---
 include/hw/ppc/spapr_nvdimm.h |  2 +-
 hw/ppc/spapr.c                | 40 ++++++++++++-----------------------
 hw/ppc/spapr_nvdimm.c         | 11 +++++-----
 3 files changed, 20 insertions(+), 33 deletions(-)

diff --git a/include/hw/ppc/spapr_nvdimm.h b/include/hw/ppc/spapr_nvdimm.h
index 344582d2f5f7..73be250e2ac9 100644
--- a/include/hw/ppc/spapr_nvdimm.h
+++ b/include/hw/ppc/spapr_nvdimm.h
@@ -30,6 +30,6 @@ int spapr_pmem_dt_populate(SpaprDrc *drc, SpaprMachineSta=
te *spapr,
 void spapr_dt_persistent_memory(SpaprMachineState *spapr, void *fdt);
 bool spapr_nvdimm_validate(HotplugHandler *hotplug_dev, NVDIMMDevice *nvdi=
mm,
                            uint64_t size, Error **errp);
-bool spapr_add_nvdimm(DeviceState *dev, uint64_t slot, Error **errp);
+void spapr_add_nvdimm(DeviceState *dev, uint64_t slot);
=20
 #endif
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 12a012d9dd09..394d28d9e081 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -3382,8 +3382,8 @@ int spapr_lmb_dt_populate(SpaprDrc *drc, SpaprMachine=
State *spapr,
     return 0;
 }
=20
-static bool spapr_add_lmbs(DeviceState *dev, uint64_t addr_start, uint64_t=
 size,
-                           bool dedicated_hp_event_source, Error **errp)
+static void spapr_add_lmbs(DeviceState *dev, uint64_t addr_start, uint64_t=
 size,
+                           bool dedicated_hp_event_source)
 {
     SpaprDrc *drc;
     uint32_t nr_lmbs =3D size/SPAPR_MEMORY_BLOCK_SIZE;
@@ -3396,15 +3396,12 @@ static bool spapr_add_lmbs(DeviceState *dev, uint64=
_t addr_start, uint64_t size,
                               addr / SPAPR_MEMORY_BLOCK_SIZE);
         g_assert(drc);
=20
-        if (!spapr_drc_attach(drc, dev, errp)) {
-            while (addr > addr_start) {
-                addr -=3D SPAPR_MEMORY_BLOCK_SIZE;
-                drc =3D spapr_drc_by_id(TYPE_SPAPR_DRC_LMB,
-                                      addr / SPAPR_MEMORY_BLOCK_SIZE);
-                spapr_drc_detach(drc);
-            }
-            return false;
-        }
+        /*
+         * memory_device_get_free_addr() provided a range of free addresse=
s
+         * that doesn't overlap with any existing mapping at pre-plug. The
+         * corresponding LMB DRCs are thus assumed to be all attachable.
+         */
+        spapr_drc_attach(drc, dev, &error_abort);
         if (!hotplugged) {
             spapr_drc_reset(drc);
         }
@@ -3425,11 +3422,9 @@ static bool spapr_add_lmbs(DeviceState *dev, uint64_=
t addr_start, uint64_t size,
                                            nr_lmbs);
         }
     }
-    return true;
 }
=20
-static void spapr_memory_plug(HotplugHandler *hotplug_dev, DeviceState *de=
v,
-                              Error **errp)
+static void spapr_memory_plug(HotplugHandler *hotplug_dev, DeviceState *de=
v)
 {
     SpaprMachineState *ms =3D SPAPR_MACHINE(hotplug_dev);
     PCDIMMDevice *dimm =3D PC_DIMM(dev);
@@ -3444,24 +3439,15 @@ static void spapr_memory_plug(HotplugHandler *hotpl=
ug_dev, DeviceState *dev,
     if (!is_nvdimm) {
         addr =3D object_property_get_uint(OBJECT(dimm),
                                         PC_DIMM_ADDR_PROP, &error_abort);
-        if (!spapr_add_lmbs(dev, addr, size,
-                            spapr_ovec_test(ms->ov5_cas, OV5_HP_EVT), errp=
)) {
-            goto out_unplug;
-        }
+        spapr_add_lmbs(dev, addr, size,
+                       spapr_ovec_test(ms->ov5_cas, OV5_HP_EVT));
     } else {
         slot =3D object_property_get_int(OBJECT(dimm),
                                        PC_DIMM_SLOT_PROP, &error_abort);
         /* We should have valid slot number at this point */
         g_assert(slot >=3D 0);
-        if (!spapr_add_nvdimm(dev, slot, errp)) {
-            goto out_unplug;
-        }
+        spapr_add_nvdimm(dev, slot);
     }
-
-    return;
-
-out_unplug:
-    pc_dimm_unplug(dimm, MACHINE(ms));
 }
=20
 static void spapr_memory_pre_plug(HotplugHandler *hotplug_dev, DeviceState=
 *dev,
@@ -4009,7 +3995,7 @@ static void spapr_machine_device_plug(HotplugHandler =
*hotplug_dev,
                                       DeviceState *dev, Error **errp)
 {
     if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
-        spapr_memory_plug(hotplug_dev, dev, errp);
+        spapr_memory_plug(hotplug_dev, dev);
     } else if (object_dynamic_cast(OBJECT(dev), TYPE_SPAPR_CPU_CORE)) {
         spapr_core_plug(hotplug_dev, dev, errp);
     } else if (object_dynamic_cast(OBJECT(dev), TYPE_SPAPR_PCI_HOST_BRIDGE=
)) {
diff --git a/hw/ppc/spapr_nvdimm.c b/hw/ppc/spapr_nvdimm.c
index a833a63b5ed3..2f1c196e1b76 100644
--- a/hw/ppc/spapr_nvdimm.c
+++ b/hw/ppc/spapr_nvdimm.c
@@ -89,7 +89,7 @@ bool spapr_nvdimm_validate(HotplugHandler *hotplug_dev, N=
VDIMMDevice *nvdimm,
 }
=20
=20
-bool spapr_add_nvdimm(DeviceState *dev, uint64_t slot, Error **errp)
+void spapr_add_nvdimm(DeviceState *dev, uint64_t slot)
 {
     SpaprDrc *drc;
     bool hotplugged =3D spapr_drc_hotplugged(dev);
@@ -97,14 +97,15 @@ bool spapr_add_nvdimm(DeviceState *dev, uint64_t slot, =
Error **errp)
     drc =3D spapr_drc_by_id(TYPE_SPAPR_DRC_PMEM, slot);
     g_assert(drc);
=20
-    if (!spapr_drc_attach(drc, dev, errp)) {
-        return false;
-    }
+    /*
+     * pc_dimm_get_free_slot() provided a free slot at pre-plug. The
+     * corresponding DRC is thus assumed to be attachable.
+     */
+    spapr_drc_attach(drc, dev, &error_abort);
=20
     if (hotplugged) {
         spapr_hotplug_req_add_by_index(drc);
     }
-    return true;
 }
=20
 static int spapr_dt_nvdimm(SpaprMachineState *spapr, void *fdt,
--=20
2.26.2


