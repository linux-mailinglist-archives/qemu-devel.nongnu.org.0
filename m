Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D251E2BBA4C
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Nov 2020 00:45:24 +0100 (CET)
Received: from localhost ([::1]:37864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgG5j-0008D5-SS
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 18:45:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kgG2w-0005wc-Dg
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 18:42:30 -0500
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:54345)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kgG2s-0003oM-43
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 18:42:27 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-450-sByPjo2fMH2LtGZFZB8Ztg-1; Fri, 20 Nov 2020 18:42:21 -0500
X-MC-Unique: sByPjo2fMH2LtGZFZB8Ztg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4B19E107AD30;
 Fri, 20 Nov 2020 23:42:20 +0000 (UTC)
Received: from bahia.redhat.com (ovpn-112-44.ams2.redhat.com [10.36.112.44])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1BBE560BFA;
 Fri, 20 Nov 2020 23:42:18 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.0 6/9] spapr: Make PHB placement functions and
 spapr_pre_plug_phb() return status
Date: Sat, 21 Nov 2020 00:42:05 +0100
Message-Id: <20201120234208.683521-7-groug@kaod.org>
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

Read documentation in "qapi/error.h" and changelog of commit
e3fe3988d785 ("error: Document Error API usage rules") for
rationale.

Signed-off-by: Greg Kurz <groug@kaod.org>
---
 include/hw/ppc/spapr.h |  2 +-
 hw/ppc/spapr.c         | 40 +++++++++++++++++++++++-----------------
 2 files changed, 24 insertions(+), 18 deletions(-)

diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
index 2e89e36cfbdc..b7ced9faebf5 100644
--- a/include/hw/ppc/spapr.h
+++ b/include/hw/ppc/spapr.h
@@ -140,7 +140,7 @@ struct SpaprMachineClass {
     bool pre_5_1_assoc_refpoints;
     bool pre_5_2_numa_associativity;
=20
-    void (*phb_placement)(SpaprMachineState *spapr, uint32_t index,
+    bool (*phb_placement)(SpaprMachineState *spapr, uint32_t index,
                           uint64_t *buid, hwaddr *pio,=20
                           hwaddr *mmio32, hwaddr *mmio64,
                           unsigned n_dma, uint32_t *liobns, hwaddr *nv2gpa=
,
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index cfca033c7b14..81bac59887ab 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -3865,7 +3865,7 @@ int spapr_phb_dt_populate(SpaprDrc *drc, SpaprMachine=
State *spapr,
     return 0;
 }
=20
-static void spapr_phb_pre_plug(HotplugHandler *hotplug_dev, DeviceState *d=
ev,
+static bool spapr_phb_pre_plug(HotplugHandler *hotplug_dev, DeviceState *d=
ev,
                                Error **errp)
 {
     SpaprMachineState *spapr =3D SPAPR_MACHINE(OBJECT(hotplug_dev));
@@ -3875,24 +3875,25 @@ static void spapr_phb_pre_plug(HotplugHandler *hotp=
lug_dev, DeviceState *dev,
=20
     if (dev->hotplugged && !smc->dr_phb_enabled) {
         error_setg(errp, "PHB hotplug not supported for this machine");
-        return;
+        return false;
     }
=20
     if (sphb->index =3D=3D (uint32_t)-1) {
         error_setg(errp, "\"index\" for PAPR PHB is mandatory");
-        return;
+        return false;
     }
=20
     /*
      * This will check that sphb->index doesn't exceed the maximum number =
of
      * PHBs for the current machine type.
      */
-    smc->phb_placement(spapr, sphb->index,
-                       &sphb->buid, &sphb->io_win_addr,
-                       &sphb->mem_win_addr, &sphb->mem64_win_addr,
-                       windows_supported, sphb->dma_liobn,
-                       &sphb->nv2_gpa_win_addr, &sphb->nv2_atsd_win_addr,
-                       errp);
+    return
+        smc->phb_placement(spapr, sphb->index,
+                           &sphb->buid, &sphb->io_win_addr,
+                           &sphb->mem_win_addr, &sphb->mem64_win_addr,
+                           windows_supported, sphb->dma_liobn,
+                           &sphb->nv2_gpa_win_addr, &sphb->nv2_atsd_win_ad=
dr,
+                           errp);
 }
=20
 static void spapr_phb_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
@@ -4130,7 +4131,7 @@ static const CPUArchIdList *spapr_possible_cpu_arch_i=
ds(MachineState *machine)
     return machine->possible_cpus;
 }
=20
-static void spapr_phb_placement(SpaprMachineState *spapr, uint32_t index,
+static bool spapr_phb_placement(SpaprMachineState *spapr, uint32_t index,
                                 uint64_t *buid, hwaddr *pio,
                                 hwaddr *mmio32, hwaddr *mmio64,
                                 unsigned n_dma, uint32_t *liobns,
@@ -4168,7 +4169,7 @@ static void spapr_phb_placement(SpaprMachineState *sp=
apr, uint32_t index,
     if (index >=3D SPAPR_MAX_PHBS) {
         error_setg(errp, "\"index\" for PAPR PHB is too large (max %llu)",
                    SPAPR_MAX_PHBS - 1);
-        return;
+        return false;
     }
=20
     *buid =3D base_buid + index;
@@ -4182,6 +4183,7 @@ static void spapr_phb_placement(SpaprMachineState *sp=
apr, uint32_t index,
=20
     *nv2gpa =3D SPAPR_PCI_NV2RAM64_WIN_BASE + index * SPAPR_PCI_NV2RAM64_W=
IN_SIZE;
     *nv2atsd =3D SPAPR_PCI_NV2ATSD_WIN_BASE + index * SPAPR_PCI_NV2ATSD_WI=
N_SIZE;
+    return true;
 }
=20
 static ICSState *spapr_ics_get(XICSFabric *dev, int irq)
@@ -4561,18 +4563,21 @@ DEFINE_SPAPR_MACHINE(4_1, "4.1", false);
 /*
  * pseries-4.0
  */
-static void phb_placement_4_0(SpaprMachineState *spapr, uint32_t index,
+static bool phb_placement_4_0(SpaprMachineState *spapr, uint32_t index,
                               uint64_t *buid, hwaddr *pio,
                               hwaddr *mmio32, hwaddr *mmio64,
                               unsigned n_dma, uint32_t *liobns,
                               hwaddr *nv2gpa, hwaddr *nv2atsd, Error **err=
p)
 {
-    spapr_phb_placement(spapr, index, buid, pio, mmio32, mmio64, n_dma, li=
obns,
-                        nv2gpa, nv2atsd, errp);
+    if (!spapr_phb_placement(spapr, index, buid, pio, mmio32, mmio64, n_dm=
a,
+                             liobns, nv2gpa, nv2atsd, errp)) {
+        return false;
+    }
+
     *nv2gpa =3D 0;
     *nv2atsd =3D 0;
+    return true;
 }
-
 static void spapr_machine_4_0_class_options(MachineClass *mc)
 {
     SpaprMachineClass *smc =3D SPAPR_MACHINE_CLASS(mc);
@@ -4732,7 +4737,7 @@ DEFINE_SPAPR_MACHINE(2_8, "2.8", false);
  * pseries-2.7
  */
=20
-static void phb_placement_2_7(SpaprMachineState *spapr, uint32_t index,
+static bool phb_placement_2_7(SpaprMachineState *spapr, uint32_t index,
                               uint64_t *buid, hwaddr *pio,
                               hwaddr *mmio32, hwaddr *mmio64,
                               unsigned n_dma, uint32_t *liobns,
@@ -4764,7 +4769,7 @@ static void phb_placement_2_7(SpaprMachineState *spap=
r, uint32_t index,
     if (index > max_index) {
         error_setg(errp, "\"index\" for PAPR PHB is too large (max %u)",
                    max_index);
-        return;
+        return false;
     }
=20
     *buid =3D base_buid + index;
@@ -4783,6 +4788,7 @@ static void phb_placement_2_7(SpaprMachineState *spap=
r, uint32_t index,
=20
     *nv2gpa =3D 0;
     *nv2atsd =3D 0;
+    return true;
 }
=20
 static void spapr_machine_2_7_class_options(MachineClass *mc)
--=20
2.26.2


