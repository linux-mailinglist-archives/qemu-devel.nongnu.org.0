Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6C52C89F3
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 17:54:59 +0100 (CET)
Received: from localhost ([::1]:41262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjmS2-0007n1-BE
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 11:54:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kjmQM-0005tu-Rg
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 11:53:14 -0500
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:32170)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kjmQL-0004qz-95
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 11:53:14 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-221-IPu3jbgfN366TLEnNUoM9w-1; Mon, 30 Nov 2020 11:53:06 -0500
X-MC-Unique: IPu3jbgfN366TLEnNUoM9w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4E0721006C9E;
 Mon, 30 Nov 2020 16:53:05 +0000 (UTC)
Received: from bahia.redhat.com (ovpn-112-87.ams2.redhat.com [10.36.112.87])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5088760C64;
 Mon, 30 Nov 2020 16:53:04 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: [PATCH for-6.0 v2 3/3] spapr/xive: Fix the "ibm,
 xive-lisn-ranges" property
Date: Mon, 30 Nov 2020 17:52:58 +0100
Message-Id: <20201130165258.744611-4-groug@kaod.org>
In-Reply-To: <20201130165258.744611-1-groug@kaod.org>
References: <20201130165258.744611-1-groug@kaod.org>
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The dt() callback of the sPAPR IC class has a "nr_servers"
argument which is used by both XIVE and XICS to setup the
"interrupt-controller" node in the DT.

The machine currently passes spapr_max_server_number() to
spapr_irq_dt(). This is perfectly fine to populate the range
of vCPU ids in the "ibm,interrupt-server-ranges" property
for XICS. However, this doesn't makes sense for XIVE's
"ibm,xive-lisn-ranges" property which really expects the
maximum number of vCPUs instead.

Add a new "max_cpus" argument to spapr_irq_dt() and the
dt() handler to convey the maximum number of vCPUs. Have
the latest machine type to pass smp.max_cpus and sPAPR XIVE
to use that for "ibm,xive-lisn-ranges". Older machine types
go on with the previous behavior since this is guest visible.

Signed-off-by: Greg Kurz <groug@kaod.org>
---
 include/hw/ppc/spapr_irq.h | 4 ++--
 hw/intc/spapr_xive.c       | 3 ++-
 hw/intc/xics_spapr.c       | 3 ++-
 hw/ppc/spapr.c             | 3 ++-
 hw/ppc/spapr_irq.c         | 8 ++++++--
 5 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/include/hw/ppc/spapr_irq.h b/include/hw/ppc/spapr_irq.h
index 2e53fc9e6cbb..1edf4851afa4 100644
--- a/include/hw/ppc/spapr_irq.h
+++ b/include/hw/ppc/spapr_irq.h
@@ -63,7 +63,7 @@ struct SpaprInterruptControllerClass {
     void (*set_irq)(SpaprInterruptController *intc, int irq, int val);
     void (*print_info)(SpaprInterruptController *intc, Monitor *mon);
     void (*dt)(SpaprInterruptController *intc, uint32_t max_vcpu_ids,
-               void *fdt, uint32_t phandle);
+               uint32_t max_cpus, void *fdt, uint32_t phandle);
     int (*post_load)(SpaprInterruptController *intc, int version_id);
 };
=20
@@ -75,7 +75,7 @@ void spapr_irq_cpu_intc_reset(struct SpaprMachineState *s=
papr, PowerPCCPU *cpu);
 void spapr_irq_cpu_intc_destroy(struct SpaprMachineState *spapr, PowerPCCP=
U *cpu);
 void spapr_irq_print_info(struct SpaprMachineState *spapr, Monitor *mon);
 void spapr_irq_dt(struct SpaprMachineState *spapr, uint32_t max_vcpu_ids,
-                  void *fdt, uint32_t phandle);
+                  uint32_t max_cpus, void *fdt, uint32_t phandle);
=20
 uint32_t spapr_irq_nr_msis(struct SpaprMachineState *spapr);
 int spapr_irq_msi_alloc(struct SpaprMachineState *spapr, uint32_t num, boo=
l align,
diff --git a/hw/intc/spapr_xive.c b/hw/intc/spapr_xive.c
index d0a0ca822367..f9a563cd0a9b 100644
--- a/hw/intc/spapr_xive.c
+++ b/hw/intc/spapr_xive.c
@@ -670,6 +670,7 @@ static void spapr_xive_print_info(SpaprInterruptControl=
ler *intc, Monitor *mon)
 }
=20
 static void spapr_xive_dt(SpaprInterruptController *intc, uint32_t max_vcp=
u_ids,
+                          uint32_t max_cpus,
                           void *fdt, uint32_t phandle)
 {
     SpaprXive *xive =3D SPAPR_XIVE(intc);
@@ -678,7 +679,7 @@ static void spapr_xive_dt(SpaprInterruptController *int=
c, uint32_t max_vcpu_ids,
     /* Interrupt number ranges for the IPIs */
     uint32_t lisn_ranges[] =3D {
         cpu_to_be32(SPAPR_IRQ_IPI),
-        cpu_to_be32(SPAPR_IRQ_IPI + max_vcpu_ids),
+        cpu_to_be32(SPAPR_IRQ_IPI + max_cpus),
     };
     /*
      * EQ size - the sizes of pages supported by the system 4K, 64K,
diff --git a/hw/intc/xics_spapr.c b/hw/intc/xics_spapr.c
index 8f753a858cc2..d9f887dfd303 100644
--- a/hw/intc/xics_spapr.c
+++ b/hw/intc/xics_spapr.c
@@ -309,7 +309,8 @@ static void ics_spapr_realize(DeviceState *dev, Error *=
*errp)
 }
=20
 static void xics_spapr_dt(SpaprInterruptController *intc, uint32_t max_vcp=
u_ids,
-                          void *fdt, uint32_t phandle)
+                          uint32_t max_cpus, void *fdt,
+                          uint32_t phandle)
 {
     uint32_t interrupt_server_ranges_prop[] =3D {
         0, cpu_to_be32(max_vcpu_ids),
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 227a926dfd48..be3b4b9119b7 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -1164,7 +1164,8 @@ void *spapr_build_fdt(SpaprMachineState *spapr, bool =
reset, size_t space)
     _FDT(fdt_setprop_cell(fdt, 0, "#size-cells", 2));
=20
     /* /interrupt controller */
-    spapr_irq_dt(spapr, spapr_max_vcpu_ids(spapr), fdt, PHANDLE_INTC);
+    spapr_irq_dt(spapr, spapr_max_vcpu_ids(spapr), machine->smp.max_cpus,
+                 fdt, PHANDLE_INTC);
=20
     ret =3D spapr_dt_memory(spapr, fdt);
     if (ret < 0) {
diff --git a/hw/ppc/spapr_irq.c b/hw/ppc/spapr_irq.c
index 4d9ecd5d0af8..e1fd777aff62 100644
--- a/hw/ppc/spapr_irq.c
+++ b/hw/ppc/spapr_irq.c
@@ -272,12 +272,16 @@ void spapr_irq_print_info(SpaprMachineState *spapr, M=
onitor *mon)
 }
=20
 void spapr_irq_dt(SpaprMachineState *spapr, uint32_t max_vcpu_ids,
-                  void *fdt, uint32_t phandle)
+                  uint32_t max_cpus, void *fdt, uint32_t phandle)
 {
     SpaprInterruptControllerClass *sicc
         =3D SPAPR_INTC_GET_CLASS(spapr->active_intc);
=20
-    sicc->dt(spapr->active_intc, max_vcpu_ids, fdt, phandle);
+    /* For older machine types in case they have an unusual VSMT setting *=
/
+    if (SPAPR_MACHINE_GET_CLASS(spapr)->pre_6_0_xive_max_cpus) {
+        max_cpus =3D spapr_max_vcpu_ids(spapr);
+    }
+    sicc->dt(spapr->active_intc, max_vcpu_ids, max_cpus, fdt, phandle);
 }
=20
 uint32_t spapr_irq_nr_msis(SpaprMachineState *spapr)
--=20
2.26.2


