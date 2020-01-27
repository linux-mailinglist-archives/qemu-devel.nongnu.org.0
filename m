Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F9E14A676
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jan 2020 15:45:42 +0100 (CET)
Received: from localhost ([::1]:46318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iw5e1-00077r-5o
	for lists+qemu-devel@lfdr.de; Mon, 27 Jan 2020 09:45:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37611)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iw5ao-00039w-6m
 for qemu-devel@nongnu.org; Mon, 27 Jan 2020 09:42:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iw5am-00031a-1H
 for qemu-devel@nongnu.org; Mon, 27 Jan 2020 09:42:22 -0500
Received: from 6.mo179.mail-out.ovh.net ([46.105.56.76]:48102)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iw5al-0002y0-RQ
 for qemu-devel@nongnu.org; Mon, 27 Jan 2020 09:42:19 -0500
Received: from player159.ha.ovh.net (unknown [10.108.54.67])
 by mo179.mail-out.ovh.net (Postfix) with ESMTP id 4676814C5B2
 for <qemu-devel@nongnu.org>; Mon, 27 Jan 2020 15:42:18 +0100 (CET)
Received: from kaod.org (deibp9eh1--blueice1n4.emea.ibm.com [195.212.29.166])
 (Authenticated sender: clg@kaod.org)
 by player159.ha.ovh.net (Postfix) with ESMTPSA id 8D843EA8C5CA;
 Mon, 27 Jan 2020 14:42:12 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: [PATCH 2/3] ppc/pnv: remove useless "core-pir" property alias.
Date: Mon, 27 Jan 2020 15:41:53 +0100
Message-Id: <20200127144154.10170-3-clg@kaod.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200127144154.10170-1-clg@kaod.org>
References: <20200127144154.10170-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 17783026082479311846
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedugedrfedvgdeijecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecukfhppedtrddtrddtrddtpdduleehrddvuddvrddvledrudeiieenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhduheelrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrgh
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.56.76
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
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit 158e17a65e1a ("ppc/pnv: Link "chip" property to PnvCore::chip
pointer") introduced some cleanups of the PnvCore realize handler.
Let's continue by reworking a bit the interface of the PnvCore
handlers for the CPU threads. These changes make the "core-pir"
property alias unused. Remove it.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/ppc/pnv_core.c | 28 +++++++++++++---------------
 1 file changed, 13 insertions(+), 15 deletions(-)

diff --git a/hw/ppc/pnv_core.c b/hw/ppc/pnv_core.c
index 2651044278ed..e69763c7f501 100644
--- a/hw/ppc/pnv_core.c
+++ b/hw/ppc/pnv_core.c
@@ -40,11 +40,11 @@ static const char *pnv_core_cpu_typename(PnvCore *pc)
     return cpu_type;
 }
=20
-static void pnv_core_cpu_reset(PowerPCCPU *cpu, PnvChip *chip)
+static void pnv_core_cpu_reset(PnvCore *pc, PowerPCCPU *cpu)
 {
     CPUState *cs =3D CPU(cpu);
     CPUPPCState *env =3D &cpu->env;
-    PnvChipClass *pcc =3D PNV_CHIP_GET_CLASS(chip);
+    PnvChipClass *pcc =3D PNV_CHIP_GET_CLASS(pc->chip);
=20
     cpu_reset(cs);
=20
@@ -56,7 +56,7 @@ static void pnv_core_cpu_reset(PowerPCCPU *cpu, PnvChip=
 *chip)
     env->nip =3D 0x10;
     env->msr |=3D MSR_HVB; /* Hypervisor mode */
=20
-    pcc->intc_reset(chip, cpu);
+    pcc->intc_reset(pc->chip, cpu);
 }
=20
 /*
@@ -162,14 +162,14 @@ static const MemoryRegionOps pnv_core_power9_xscom_=
ops =3D {
     .endianness =3D DEVICE_BIG_ENDIAN,
 };
=20
-static void pnv_core_cpu_realize(PowerPCCPU *cpu, PnvChip *chip, Error *=
*errp)
+static void pnv_core_cpu_realize(PnvCore *pc, PowerPCCPU *cpu, Error **e=
rrp)
 {
     CPUPPCState *env =3D &cpu->env;
     int core_pir;
     int thread_index =3D 0; /* TODO: TCG supports only one thread */
     ppc_spr_t *pir =3D &env->spr_cb[SPR_PIR];
     Error *local_err =3D NULL;
-    PnvChipClass *pcc =3D PNV_CHIP_GET_CLASS(chip);
+    PnvChipClass *pcc =3D PNV_CHIP_GET_CLASS(pc->chip);
=20
     object_property_set_bool(OBJECT(cpu), true, "realized", &local_err);
     if (local_err) {
@@ -177,13 +177,13 @@ static void pnv_core_cpu_realize(PowerPCCPU *cpu, P=
nvChip *chip, Error **errp)
         return;
     }
=20
-    pcc->intc_create(chip, cpu, &local_err);
+    pcc->intc_create(pc->chip, cpu, &local_err);
     if (local_err) {
         error_propagate(errp, local_err);
         return;
     }
=20
-    core_pir =3D object_property_get_uint(OBJECT(cpu), "core-pir", &erro=
r_abort);
+    core_pir =3D object_property_get_uint(OBJECT(pc), "pir", &error_abor=
t);
=20
     /*
      * The PIR of a thread is the core PIR + the thread index. We will
@@ -203,7 +203,7 @@ static void pnv_core_reset(void *dev)
     int i;
=20
     for (i =3D 0; i < cc->nr_threads; i++) {
-        pnv_core_cpu_reset(pc->threads[i], pc->chip);
+        pnv_core_cpu_reset(pc, pc->threads[i]);
     }
 }
=20
@@ -231,8 +231,6 @@ static void pnv_core_realize(DeviceState *dev, Error =
**errp)
=20
         snprintf(name, sizeof(name), "thread[%d]", i);
         object_property_add_child(OBJECT(pc), name, obj, &error_abort);
-        object_property_add_alias(obj, "core-pir", OBJECT(pc),
-                                  "pir", &error_abort);
=20
         cpu->machine_data =3D g_new0(PnvCPUState, 1);
=20
@@ -240,7 +238,7 @@ static void pnv_core_realize(DeviceState *dev, Error =
**errp)
     }
=20
     for (j =3D 0; j < cc->nr_threads; j++) {
-        pnv_core_cpu_realize(pc->threads[j], pc->chip, &local_err);
+        pnv_core_cpu_realize(pc, pc->threads[j], &local_err);
         if (local_err) {
             goto err;
         }
@@ -263,12 +261,12 @@ err:
     error_propagate(errp, local_err);
 }
=20
-static void pnv_core_cpu_unrealize(PowerPCCPU *cpu, PnvChip *chip)
+static void pnv_core_cpu_unrealize(PnvCore *pc, PowerPCCPU *cpu)
 {
     PnvCPUState *pnv_cpu =3D pnv_cpu_state(cpu);
-    PnvChipClass *pcc =3D PNV_CHIP_GET_CLASS(chip);
+    PnvChipClass *pcc =3D PNV_CHIP_GET_CLASS(pc->chip);
=20
-    pcc->intc_destroy(chip, cpu);
+    pcc->intc_destroy(pc->chip, cpu);
     cpu_remove_sync(CPU(cpu));
     cpu->machine_data =3D NULL;
     g_free(pnv_cpu);
@@ -284,7 +282,7 @@ static void pnv_core_unrealize(DeviceState *dev, Erro=
r **errp)
     qemu_unregister_reset(pnv_core_reset, pc);
=20
     for (i =3D 0; i < cc->nr_threads; i++) {
-        pnv_core_cpu_unrealize(pc->threads[i], pc->chip);
+        pnv_core_cpu_unrealize(pc, pc->threads[i]);
     }
     g_free(pc->threads);
 }
--=20
2.21.1


