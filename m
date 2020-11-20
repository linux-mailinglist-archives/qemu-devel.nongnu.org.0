Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E0C2BB1CF
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 18:55:55 +0100 (CET)
Received: from localhost ([::1]:58010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgAdW-0001n7-LG
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 12:55:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kgAV7-0008Ub-FI
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 12:47:14 -0500
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:28593)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kgAV4-0005A8-EH
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 12:47:13 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-334-D7kk5PBqMCKGEAOnqprtmw-1; Fri, 20 Nov 2020 12:47:03 -0500
X-MC-Unique: D7kk5PBqMCKGEAOnqprtmw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A74B680ED9D;
 Fri, 20 Nov 2020 17:47:00 +0000 (UTC)
Received: from bahia.redhat.com (ovpn-112-44.ams2.redhat.com [10.36.112.44])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7DE865C1D5;
 Fri, 20 Nov 2020 17:46:59 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.0 8/8] spapr: Drop "nr_servers" argument of the sPAPR IC
 dt() operation
Date: Fri, 20 Nov 2020 18:46:46 +0100
Message-Id: <20201120174646.619395-9-groug@kaod.org>
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

This argument isn't used by the backends anymore.

Signed-off-by: Greg Kurz <groug@kaod.org>
---
 include/hw/ppc/spapr_irq.h | 6 ++----
 hw/intc/spapr_xive.c       | 4 ++--
 hw/intc/xics_spapr.c       | 4 ++--
 hw/ppc/spapr.c             | 2 +-
 hw/ppc/spapr_irq.c         | 5 ++---
 5 files changed, 9 insertions(+), 12 deletions(-)

diff --git a/include/hw/ppc/spapr_irq.h b/include/hw/ppc/spapr_irq.h
index 3e1c619d4c06..e2519e4bc596 100644
--- a/include/hw/ppc/spapr_irq.h
+++ b/include/hw/ppc/spapr_irq.h
@@ -61,8 +61,7 @@ struct SpaprInterruptControllerClass {
     /* These methods should only be called on the active intc */
     void (*set_irq)(SpaprInterruptController *intc, int irq, int val);
     void (*print_info)(SpaprInterruptController *intc, Monitor *mon);
-    void (*dt)(SpaprInterruptController *intc, uint32_t nr_servers,
-               void *fdt, uint32_t phandle);
+    void (*dt)(SpaprInterruptController *intc, void *fdt, uint32_t phandle=
);
     int (*post_load)(SpaprInterruptController *intc, int version_id);
 };
=20
@@ -73,8 +72,7 @@ int spapr_irq_cpu_intc_create(struct SpaprMachineState *s=
papr,
 void spapr_irq_cpu_intc_reset(struct SpaprMachineState *spapr, PowerPCCPU =
*cpu);
 void spapr_irq_cpu_intc_destroy(struct SpaprMachineState *spapr, PowerPCCP=
U *cpu);
 void spapr_irq_print_info(struct SpaprMachineState *spapr, Monitor *mon);
-void spapr_irq_dt(struct SpaprMachineState *spapr, uint32_t nr_servers,
-                  void *fdt, uint32_t phandle);
+void spapr_irq_dt(struct SpaprMachineState *spapr, void *fdt, uint32_t pha=
ndle);
=20
 uint32_t spapr_irq_nr_msis(struct SpaprMachineState *spapr);
 int spapr_irq_msi_alloc(struct SpaprMachineState *spapr, uint32_t num, boo=
l align,
diff --git a/hw/intc/spapr_xive.c b/hw/intc/spapr_xive.c
index 8331026fdb12..749cff9bf2b9 100644
--- a/hw/intc/spapr_xive.c
+++ b/hw/intc/spapr_xive.c
@@ -691,8 +691,8 @@ static void spapr_xive_print_info(SpaprInterruptControl=
ler *intc, Monitor *mon)
     spapr_xive_pic_print_info(xive, mon);
 }
=20
-static void spapr_xive_dt(SpaprInterruptController *intc, uint32_t nr_serv=
ers,
-                          void *fdt, uint32_t phandle)
+static void spapr_xive_dt(SpaprInterruptController *intc, void *fdt,
+                          uint32_t phandle)
 {
     SpaprXive *xive =3D SPAPR_XIVE(intc);
     int node;
diff --git a/hw/intc/xics_spapr.c b/hw/intc/xics_spapr.c
index 8810bd93c856..a790b59f1bbc 100644
--- a/hw/intc/xics_spapr.c
+++ b/hw/intc/xics_spapr.c
@@ -312,8 +312,8 @@ static void ics_spapr_realize(DeviceState *dev, Error *=
*errp)
     spapr_register_hypercall(H_IPOLL, h_ipoll);
 }
=20
-static void xics_spapr_dt(SpaprInterruptController *intc, uint32_t nr_serv=
ers,
-                          void *fdt, uint32_t phandle)
+static void xics_spapr_dt(SpaprInterruptController *intc, void *fdt,
+                          uint32_t phandle)
 {
     uint32_t interrupt_server_ranges_prop[] =3D {
         0, cpu_to_be32(ICS_SPAPR(intc)->nr_servers),
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 21de0456446b..595dd1b81ce1 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -1164,7 +1164,7 @@ void *spapr_build_fdt(SpaprMachineState *spapr, bool =
reset, size_t space)
     _FDT(fdt_setprop_cell(fdt, 0, "#size-cells", 2));
=20
     /* /interrupt controller */
-    spapr_irq_dt(spapr, spapr_max_server_number(spapr), fdt, PHANDLE_INTC)=
;
+    spapr_irq_dt(spapr, fdt, PHANDLE_INTC);
=20
     ret =3D spapr_dt_memory(spapr, fdt);
     if (ret < 0) {
diff --git a/hw/ppc/spapr_irq.c b/hw/ppc/spapr_irq.c
index f2897fbc942a..f93476d00a59 100644
--- a/hw/ppc/spapr_irq.c
+++ b/hw/ppc/spapr_irq.c
@@ -271,13 +271,12 @@ void spapr_irq_print_info(SpaprMachineState *spapr, M=
onitor *mon)
     sicc->print_info(spapr->active_intc, mon);
 }
=20
-void spapr_irq_dt(SpaprMachineState *spapr, uint32_t nr_servers,
-                  void *fdt, uint32_t phandle)
+void spapr_irq_dt(SpaprMachineState *spapr, void *fdt, uint32_t phandle)
 {
     SpaprInterruptControllerClass *sicc
         =3D SPAPR_INTC_GET_CLASS(spapr->active_intc);
=20
-    sicc->dt(spapr->active_intc, nr_servers, fdt, phandle);
+    sicc->dt(spapr->active_intc, fdt, phandle);
 }
=20
 uint32_t spapr_irq_nr_msis(SpaprMachineState *spapr)
--=20
2.26.2


