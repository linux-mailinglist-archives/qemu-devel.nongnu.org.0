Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 332F72BB1CA
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 18:53:28 +0100 (CET)
Received: from localhost ([::1]:50674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgAb9-00072o-4e
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 12:53:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kgAV4-0008UL-MY
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 12:47:14 -0500
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:40289)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kgAV2-00058v-Hm
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 12:47:10 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-46-uCgy60zVPv-0a9BOzGv59A-1; Fri, 20 Nov 2020 12:46:58 -0500
X-MC-Unique: uCgy60zVPv-0a9BOzGv59A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B1B318030A2;
 Fri, 20 Nov 2020 17:46:57 +0000 (UTC)
Received: from bahia.redhat.com (ovpn-112-44.ams2.redhat.com [10.36.112.44])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 894D85C1D5;
 Fri, 20 Nov 2020 17:46:56 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.0 6/8] spapr/xics: Add "nr-servers" property
Date: Fri, 20 Nov 2020 18:46:44 +0100
Message-Id: <20201120174646.619395-7-groug@kaod.org>
In-Reply-To: <20201120174646.619395-1-groug@kaod.org>
References: <20201120174646.619395-1-groug@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
Cc: Greg Kurz <groug@kaod.org>, qemu-ppc@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The sPAPR ICS device exposes the range of vCPU ids it can handle in
the "ibm,interrupt-server-ranges" FDT property. The highest vCPU
id, ie. spapr_max_server_number(), is obtained from the machine
through the "nr_servers" argument of the generic spapr_irq_dt() call.

We want to drop the "nr_servers" argument from the API because it
doesn't make sense for the sPAPR XIVE device actually.

On POWER9, we also pass the highest vCPU id to the KVM XICS-on-XIVE
device, in order to optimize resource allocation in the HW.

This is enough motivation to introduce an "nr-servers" property
and to use it for both purposes.

Signed-off-by: Greg Kurz <groug@kaod.org>
---
 include/hw/ppc/spapr.h      |  4 ++--
 include/hw/ppc/xics_spapr.h | 21 +++++++++++++++++---
 hw/intc/xics_kvm.c          |  2 +-
 hw/intc/xics_spapr.c        | 38 ++++++++++++++++++++++++-------------
 hw/ppc/spapr.c              |  5 +++--
 hw/ppc/spapr_irq.c          |  7 +++++--
 6 files changed, 54 insertions(+), 23 deletions(-)

diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
index 2e89e36cfbdc..b76c84a2f884 100644
--- a/include/hw/ppc/spapr.h
+++ b/include/hw/ppc/spapr.h
@@ -10,7 +10,7 @@
 #include "hw/ppc/spapr_irq.h"
 #include "qom/object.h"
 #include "hw/ppc/spapr_xive.h"  /* For SpaprXive */
-#include "hw/ppc/xics.h"        /* For ICSState */
+#include "hw/ppc/xics_spapr.h"  /* For IcsSpaprState */
 #include "hw/ppc/spapr_tpm_proxy.h"
=20
 struct SpaprVioBus;
@@ -230,7 +230,7 @@ struct SpaprMachineState {
     SpaprIrq *irq;
     qemu_irq *qirqs;
     SpaprInterruptController *active_intc;
-    ICSState *ics;
+    IcsSpaprState *ics;
     SpaprXive *xive;
=20
     bool cmd_line_caps[SPAPR_CAP_NUM];
diff --git a/include/hw/ppc/xics_spapr.h b/include/hw/ppc/xics_spapr.h
index de752c0d2c7e..1a483a873b62 100644
--- a/include/hw/ppc/xics_spapr.h
+++ b/include/hw/ppc/xics_spapr.h
@@ -28,12 +28,27 @@
 #define XICS_SPAPR_H
=20
 #include "hw/ppc/spapr.h"
+#include "hw/ppc/xics.h"
 #include "qom/object.h"
=20
+typedef struct IcsSpaprState {
+    /*< private >*/
+    ICPState parent_obj;
+
+    /*
+     * The ICS needs to know the upper limit to vCPU ids it
+     * might be exposed to in order to size the vCPU id range
+     * in "ibm,interrupt-server-ranges" and to optimize HW
+     * resource allocation when using the XICS-on-XIVE KVM
+     * device. It is the purpose of the "nr-servers" property
+     * which *must* be set to a non-null value before realizing
+     * the ICS.
+     */
+    uint32_t nr_servers;
+} IcsSpaprState;
+
 #define TYPE_ICS_SPAPR "ics-spapr"
-/* This is reusing the ICSState typedef from TYPE_ICS */
-DECLARE_INSTANCE_CHECKER(ICSState, ICS_SPAPR,
-                         TYPE_ICS_SPAPR)
+DECLARE_INSTANCE_CHECKER(IcsSpaprState, ICS_SPAPR, TYPE_ICS_SPAPR)
=20
 int xics_kvm_connect(SpaprInterruptController *intc, uint32_t nr_servers,
                      Error **errp);
diff --git a/hw/intc/xics_kvm.c b/hw/intc/xics_kvm.c
index 570d635bcc08..ecbbda0e249b 100644
--- a/hw/intc/xics_kvm.c
+++ b/hw/intc/xics_kvm.c
@@ -350,7 +350,7 @@ void ics_kvm_set_irq(ICSState *ics, int srcno, int val)
 int xics_kvm_connect(SpaprInterruptController *intc, uint32_t nr_servers,
                      Error **errp)
 {
-    ICSState *ics =3D ICS_SPAPR(intc);
+    ICSState *ics =3D ICS(intc);
     int rc;
     CPUState *cs;
     Error *local_err =3D NULL;
diff --git a/hw/intc/xics_spapr.c b/hw/intc/xics_spapr.c
index 8ae4f41459c3..ce147e8980ed 100644
--- a/hw/intc/xics_spapr.c
+++ b/hw/intc/xics_spapr.c
@@ -34,6 +34,7 @@
 #include "hw/ppc/xics.h"
 #include "hw/ppc/xics_spapr.h"
 #include "hw/ppc/fdt.h"
+#include "hw/qdev-properties.h"
 #include "qapi/visitor.h"
=20
 /*
@@ -154,7 +155,7 @@ static void rtas_set_xive(PowerPCCPU *cpu, SpaprMachine=
State *spapr,
                           uint32_t nargs, target_ulong args,
                           uint32_t nret, target_ulong rets)
 {
-    ICSState *ics =3D spapr->ics;
+    ICSState *ics =3D ICS(spapr->ics);
     uint32_t nr, srcno, server, priority;
=20
     CHECK_EMULATED_XICS_RTAS(spapr, rets);
@@ -189,7 +190,7 @@ static void rtas_get_xive(PowerPCCPU *cpu, SpaprMachine=
State *spapr,
                           uint32_t nargs, target_ulong args,
                           uint32_t nret, target_ulong rets)
 {
-    ICSState *ics =3D spapr->ics;
+    ICSState *ics =3D ICS(spapr->ics);
     uint32_t nr, srcno;
=20
     CHECK_EMULATED_XICS_RTAS(spapr, rets);
@@ -221,7 +222,7 @@ static void rtas_int_off(PowerPCCPU *cpu, SpaprMachineS=
tate *spapr,
                          uint32_t nargs, target_ulong args,
                          uint32_t nret, target_ulong rets)
 {
-    ICSState *ics =3D spapr->ics;
+    ICSState *ics =3D ICS(spapr->ics);
     uint32_t nr, srcno;
=20
     CHECK_EMULATED_XICS_RTAS(spapr, rets);
@@ -254,7 +255,7 @@ static void rtas_int_on(PowerPCCPU *cpu, SpaprMachineSt=
ate *spapr,
                         uint32_t nargs, target_ulong args,
                         uint32_t nret, target_ulong rets)
 {
-    ICSState *ics =3D spapr->ics;
+    ICSState *ics =3D ICS(spapr->ics);
     uint32_t nr, srcno;
=20
     CHECK_EMULATED_XICS_RTAS(spapr, rets);
@@ -285,10 +286,13 @@ static void rtas_int_on(PowerPCCPU *cpu, SpaprMachine=
State *spapr,
=20
 static void ics_spapr_realize(DeviceState *dev, Error **errp)
 {
-    ICSState *ics =3D ICS_SPAPR(dev);
-    ICSStateClass *icsc =3D ICS_GET_CLASS(ics);
+    IcsSpaprState *sics =3D ICS_SPAPR(dev);
+    ICSStateClass *icsc =3D ICS_GET_CLASS(dev);
     Error *local_err =3D NULL;
=20
+    /* Set by spapr_irq_init() */
+    g_assert(sics->nr_servers);
+
     icsc->parent_realize(dev, &local_err);
     if (local_err) {
         error_propagate(errp, local_err);
@@ -312,7 +316,7 @@ static void xics_spapr_dt(SpaprInterruptController *int=
c, uint32_t nr_servers,
                           void *fdt, uint32_t phandle)
 {
     uint32_t interrupt_server_ranges_prop[] =3D {
-        0, cpu_to_be32(nr_servers),
+        0, cpu_to_be32(ICS_SPAPR(intc)->nr_servers),
     };
     int node;
=20
@@ -333,7 +337,7 @@ static void xics_spapr_dt(SpaprInterruptController *int=
c, uint32_t nr_servers,
 static int xics_spapr_cpu_intc_create(SpaprInterruptController *intc,
                                        PowerPCCPU *cpu, Error **errp)
 {
-    ICSState *ics =3D ICS_SPAPR(intc);
+    ICSState *ics =3D ICS(intc);
     Object *obj;
     SpaprCpuState *spapr_cpu =3D spapr_cpu_state(cpu);
=20
@@ -364,7 +368,7 @@ static void xics_spapr_cpu_intc_destroy(SpaprInterruptC=
ontroller *intc,
 static int xics_spapr_claim_irq(SpaprInterruptController *intc, int irq,
                                 bool lsi, Error **errp)
 {
-    ICSState *ics =3D ICS_SPAPR(intc);
+    ICSState *ics =3D ICS(intc);
=20
     assert(ics);
     assert(ics_valid_irq(ics, irq));
@@ -380,7 +384,7 @@ static int xics_spapr_claim_irq(SpaprInterruptControlle=
r *intc, int irq,
=20
 static void xics_spapr_free_irq(SpaprInterruptController *intc, int irq)
 {
-    ICSState *ics =3D ICS_SPAPR(intc);
+    ICSState *ics =3D ICS(intc);
     uint32_t srcno =3D irq - ics->offset;
=20
     assert(ics_valid_irq(ics, irq));
@@ -390,7 +394,7 @@ static void xics_spapr_free_irq(SpaprInterruptControlle=
r *intc, int irq)
=20
 static void xics_spapr_set_irq(SpaprInterruptController *intc, int irq, in=
t val)
 {
-    ICSState *ics =3D ICS_SPAPR(intc);
+    ICSState *ics =3D ICS(intc);
     uint32_t srcno =3D irq - ics->offset;
=20
     ics_set_irq(ics, srcno, val);
@@ -398,7 +402,7 @@ static void xics_spapr_set_irq(SpaprInterruptController=
 *intc, int irq, int val)
=20
 static void xics_spapr_print_info(SpaprInterruptController *intc, Monitor =
*mon)
 {
-    ICSState *ics =3D ICS_SPAPR(intc);
+    ICSState *ics =3D ICS(intc);
     CPUState *cs;
=20
     CPU_FOREACH(cs) {
@@ -426,7 +430,8 @@ static int xics_spapr_activate(SpaprInterruptController=
 *intc,
                                uint32_t nr_servers, Error **errp)
 {
     if (kvm_enabled()) {
-        return spapr_irq_init_kvm(xics_kvm_connect, intc, nr_servers, errp=
);
+        return spapr_irq_init_kvm(xics_kvm_connect, intc,
+                                  ICS_SPAPR(intc)->nr_servers, errp);
     }
     return 0;
 }
@@ -438,6 +443,11 @@ static void xics_spapr_deactivate(SpaprInterruptContro=
ller *intc)
     }
 }
=20
+static Property ics_spapr_properties[] =3D {
+    DEFINE_PROP_UINT32("nr-servers", IcsSpaprState, nr_servers, 0),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
 static void ics_spapr_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc =3D DEVICE_CLASS(klass);
@@ -446,6 +456,7 @@ static void ics_spapr_class_init(ObjectClass *klass, vo=
id *data)
=20
     device_class_set_parent_realize(dc, ics_spapr_realize,
                                     &isc->parent_realize);
+    device_class_set_props(dc, ics_spapr_properties);
     sicc->activate =3D xics_spapr_activate;
     sicc->deactivate =3D xics_spapr_deactivate;
     sicc->cpu_intc_create =3D xics_spapr_cpu_intc_create;
@@ -462,6 +473,7 @@ static void ics_spapr_class_init(ObjectClass *klass, vo=
id *data)
 static const TypeInfo ics_spapr_info =3D {
     .name =3D TYPE_ICS_SPAPR,
     .parent =3D TYPE_ICS,
+    .instance_size =3D sizeof(IcsSpaprState),
     .class_init =3D ics_spapr_class_init,
     .interfaces =3D (InterfaceInfo[]) {
         { TYPE_SPAPR_INTC },
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 12a012d9dd09..21de0456446b 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -4218,15 +4218,16 @@ static void spapr_phb_placement(SpaprMachineState *=
spapr, uint32_t index,
 static ICSState *spapr_ics_get(XICSFabric *dev, int irq)
 {
     SpaprMachineState *spapr =3D SPAPR_MACHINE(dev);
+    ICSState *ics =3D ICS(spapr->ics);
=20
-    return ics_valid_irq(spapr->ics, irq) ? spapr->ics : NULL;
+    return ics_valid_irq(ics, irq) ? ics : NULL;
 }
=20
 static void spapr_ics_resend(XICSFabric *dev)
 {
     SpaprMachineState *spapr =3D SPAPR_MACHINE(dev);
=20
-    ics_resend(spapr->ics);
+    ics_resend(ICS(spapr->ics));
 }
=20
 static ICPState *spapr_icp_get(XICSFabric *xi, int vcpu_id)
diff --git a/hw/ppc/spapr_irq.c b/hw/ppc/spapr_irq.c
index 2dacbecfd5fd..be6f4041e433 100644
--- a/hw/ppc/spapr_irq.c
+++ b/hw/ppc/spapr_irq.c
@@ -316,6 +316,9 @@ void spapr_irq_init(SpaprMachineState *spapr, Error **e=
rrp)
         object_property_set_link(obj, ICS_PROP_XICS, OBJECT(spapr),
                                  &error_abort);
         object_property_set_int(obj, "nr-irqs", smc->nr_xirqs, &error_abor=
t);
+        object_property_set_uint(obj, "nr-servers",
+                                 spapr_max_server_number(spapr),
+                                 &error_abort);
         if (!qdev_realize(DEVICE(obj), NULL, errp)) {
             return;
         }
@@ -426,7 +429,7 @@ qemu_irq spapr_qirq(SpaprMachineState *spapr, int irq)
     assert(irq < (smc->nr_xirqs + SPAPR_XIRQ_BASE));
=20
     if (spapr->ics) {
-        assert(ics_valid_irq(spapr->ics, irq));
+        assert(ics_valid_irq(ICS(spapr->ics), irq));
     }
     if (spapr->xive) {
         assert(irq < spapr->xive->nr_irqs);
@@ -556,7 +559,7 @@ static int ics_find_free_block(ICSState *ics, int num, =
int alignnum)
=20
 int spapr_irq_find(SpaprMachineState *spapr, int num, bool align, Error **=
errp)
 {
-    ICSState *ics =3D spapr->ics;
+    ICSState *ics =3D ICS(spapr->ics);
     int first =3D -1;
=20
     assert(ics);
--=20
2.26.2


