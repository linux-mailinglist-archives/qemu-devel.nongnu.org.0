Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E60A4C4626
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Oct 2019 05:26:05 +0200 (CEST)
Received: from localhost ([::1]:51096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iFVHA-0002pV-RX
	for lists+qemu-devel@lfdr.de; Tue, 01 Oct 2019 23:26:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59946)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1iFUkq-0001hQ-3K
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 22:52:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1iFUkl-0002vf-JS
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 22:52:39 -0400
Received: from ozlabs.org ([203.11.71.1]:48069)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1iFUkk-0002qf-R4; Tue, 01 Oct 2019 22:52:35 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 46jgf85BxMz9sRh; Wed,  2 Oct 2019 12:52:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1569984736;
 bh=FwPA1UCWDxFC1kFf5rMGk2U3mKvgbSbEKO/0mZf2f+4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YZUi6Dzh+gsfk/MD4zesJ0f+nLU/7q+RliQxQKfhYJ6HmHhhg+trdvCi7IopUldgP
 bWNwbLBl6uxdqjNSLZaXqhMhq928bn/2kZKfk9tFyRWf9eZAAbEbVpYwwuGRZfSlqH
 zLAvIh6HS7p1iuThZT/Wcz/WkalF115dkT8EdIJA=
From: David Gibson <david@gibson.dropbear.id.au>
To: qemu-ppc@nongnu.org,
	clg@kaod.org,
	qemu-devel@nongnu.org
Subject: [PATCH v3 18/34] spapr: Use less cryptic representation of which irq
 backends are supported
Date: Wed,  2 Oct 2019 12:51:52 +1000
Message-Id: <20191002025208.3487-19-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191002025208.3487-1-david@gibson.dropbear.id.au>
References: <20191002025208.3487-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 203.11.71.1
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
Cc: Jason Wang <jasowang@redhat.com>, Riku Voipio <riku.voipio@iki.fi>,
 Laurent Vivier <laurent@vivier.eu>, groug@kaod.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 philmd@redhat.com, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

SpaprIrq::ov5 stores the value for a particular byte in PAPR option vecto=
r
5 which indicates whether XICS, XIVE or both interrupt controllers are
available.  As usual for PAPR, the encoding is kind of overly complicated
and confusing (though to be fair there are some backwards compat things i=
t
has to handle).

But to make our internal code clearer, have SpaprIrq encode more directly
which backends are available as two booleans, and derive the OV5 value fr=
om
that at the point we need it.

Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Greg Kurz <groug@kaod.org>
---
 hw/ppc/spapr.c             | 15 ++++++++++++---
 hw/ppc/spapr_hcall.c       |  6 +++---
 hw/ppc/spapr_irq.c         | 12 ++++++++----
 include/hw/ppc/spapr_irq.h |  3 ++-
 4 files changed, 25 insertions(+), 11 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 43920c140d..514a17ae74 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -1066,19 +1066,28 @@ static void spapr_dt_ov5_platform_support(SpaprMa=
chineState *spapr, void *fdt,
     PowerPCCPU *first_ppc_cpu =3D POWERPC_CPU(first_cpu);
=20
     char val[2 * 4] =3D {
-        23, spapr->irq->ov5, /* Xive mode. */
+        23, 0x00, /* XICS / XIVE mode */
         24, 0x00, /* Hash/Radix, filled in below. */
         25, 0x00, /* Hash options: Segment Tables =3D=3D no, GTSE =3D=3D=
 no. */
         26, 0x40, /* Radix options: GTSE =3D=3D yes. */
     };
=20
+    if (spapr->irq->xics && spapr->irq->xive) {
+        val[1] =3D SPAPR_OV5_XIVE_BOTH;
+    } else if (spapr->irq->xive) {
+        val[1] =3D SPAPR_OV5_XIVE_EXPLOIT;
+    } else {
+        assert(spapr->irq->xics);
+        val[1] =3D SPAPR_OV5_XIVE_LEGACY;
+    }
+
     if (!ppc_check_compat(first_ppc_cpu, CPU_POWERPC_LOGICAL_3_00, 0,
                           first_ppc_cpu->compat_pvr)) {
         /*
          * If we're in a pre POWER9 compat mode then the guest should
          * do hash and use the legacy interrupt mode
          */
-        val[1] =3D 0x00; /* XICS */
+        val[1] =3D SPAPR_OV5_XIVE_LEGACY; /* XICS */
         val[3] =3D 0x00; /* Hash */
     } else if (kvm_enabled()) {
         if (kvmppc_has_cap_mmu_radix() && kvmppc_has_cap_mmu_hash_v3()) =
{
@@ -2767,7 +2776,7 @@ static void spapr_machine_init(MachineState *machin=
e)
     spapr_ovec_set(spapr->ov5, OV5_DRMEM_V2);
=20
     /* advertise XIVE on POWER9 machines */
-    if (spapr->irq->ov5 & (SPAPR_OV5_XIVE_EXPLOIT | SPAPR_OV5_XIVE_BOTH)=
) {
+    if (spapr->irq->xive) {
         spapr_ovec_set(spapr->ov5, OV5_XIVE_EXPLOIT);
     }
=20
diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
index 3d3a67149a..140f05c1c6 100644
--- a/hw/ppc/spapr_hcall.c
+++ b/hw/ppc/spapr_hcall.c
@@ -1784,13 +1784,13 @@ static target_ulong h_client_architecture_support=
(PowerPCCPU *cpu,
      * terminate the boot.
      */
     if (guest_xive) {
-        if (spapr->irq->ov5 =3D=3D SPAPR_OV5_XIVE_LEGACY) {
+        if (!spapr->irq->xive) {
             error_report(
 "Guest requested unavailable interrupt mode (XIVE), try the ic-mode=3Dxi=
ve or ic-mode=3Ddual machine property");
             exit(EXIT_FAILURE);
         }
     } else {
-        if (spapr->irq->ov5 =3D=3D SPAPR_OV5_XIVE_EXPLOIT) {
+        if (!spapr->irq->xics) {
             error_report(
 "Guest requested unavailable interrupt mode (XICS), either don't set the=
 ic-mode machine property or try ic-mode=3Dxics or ic-mode=3Ddual");
             exit(EXIT_FAILURE);
@@ -1804,7 +1804,7 @@ static target_ulong h_client_architecture_support(P=
owerPCCPU *cpu,
      */
     if (!spapr->cas_reboot) {
         spapr->cas_reboot =3D spapr_ovec_test(ov5_updates, OV5_XIVE_EXPL=
OIT)
-            && spapr->irq->ov5 & SPAPR_OV5_XIVE_BOTH;
+            && spapr->irq->xics && spapr->irq->xive;
     }
=20
     spapr_ovec_cleanup(ov5_updates);
diff --git a/hw/ppc/spapr_irq.c b/hw/ppc/spapr_irq.c
index 516bf00a35..3ac67ba0c7 100644
--- a/hw/ppc/spapr_irq.c
+++ b/hw/ppc/spapr_irq.c
@@ -210,7 +210,8 @@ static void spapr_irq_init_kvm_xics(SpaprMachineState=
 *spapr, Error **errp)
 SpaprIrq spapr_irq_xics =3D {
     .nr_xirqs    =3D SPAPR_NR_XIRQS,
     .nr_msis     =3D SPAPR_NR_MSIS,
-    .ov5         =3D SPAPR_OV5_XIVE_LEGACY,
+    .xics        =3D true,
+    .xive        =3D false,
=20
     .init        =3D spapr_irq_init_xics,
     .claim       =3D spapr_irq_claim_xics,
@@ -350,7 +351,8 @@ static void spapr_irq_init_kvm_xive(SpaprMachineState=
 *spapr, Error **errp)
 SpaprIrq spapr_irq_xive =3D {
     .nr_xirqs    =3D SPAPR_NR_XIRQS,
     .nr_msis     =3D SPAPR_NR_MSIS,
-    .ov5         =3D SPAPR_OV5_XIVE_EXPLOIT,
+    .xics        =3D false,
+    .xive        =3D true,
=20
     .init        =3D spapr_irq_init_xive,
     .claim       =3D spapr_irq_claim_xive,
@@ -511,7 +513,8 @@ static void spapr_irq_set_irq_dual(void *opaque, int =
irq, int val)
 SpaprIrq spapr_irq_dual =3D {
     .nr_xirqs    =3D SPAPR_NR_XIRQS,
     .nr_msis     =3D SPAPR_NR_MSIS,
-    .ov5         =3D SPAPR_OV5_XIVE_BOTH,
+    .xics        =3D true,
+    .xive        =3D true,
=20
     .init        =3D spapr_irq_init_dual,
     .claim       =3D spapr_irq_claim_dual,
@@ -754,7 +757,8 @@ int spapr_irq_find(SpaprMachineState *spapr, int num,=
 bool align, Error **errp)
 SpaprIrq spapr_irq_xics_legacy =3D {
     .nr_xirqs    =3D SPAPR_IRQ_XICS_LEGACY_NR_XIRQS,
     .nr_msis     =3D SPAPR_IRQ_XICS_LEGACY_NR_XIRQS,
-    .ov5         =3D SPAPR_OV5_XIVE_LEGACY,
+    .xics        =3D true,
+    .xive        =3D false,
=20
     .init        =3D spapr_irq_init_xics,
     .claim       =3D spapr_irq_claim_xics,
diff --git a/include/hw/ppc/spapr_irq.h b/include/hw/ppc/spapr_irq.h
index ed88b4599a..d3f3b85eb9 100644
--- a/include/hw/ppc/spapr_irq.h
+++ b/include/hw/ppc/spapr_irq.h
@@ -39,7 +39,8 @@ void spapr_irq_msi_free(SpaprMachineState *spapr, int i=
rq, uint32_t num);
 typedef struct SpaprIrq {
     uint32_t    nr_xirqs;
     uint32_t    nr_msis;
-    uint8_t     ov5;
+    bool        xics;
+    bool        xive;
=20
     void (*init)(SpaprMachineState *spapr, Error **errp);
     int (*claim)(SpaprMachineState *spapr, int irq, bool lsi, Error **er=
rp);
--=20
2.21.0


