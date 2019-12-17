Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4877512244E
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Dec 2019 06:53:29 +0100 (CET)
Received: from localhost ([::1]:36264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ih5nU-0005Qq-CP
	for lists+qemu-devel@lfdr.de; Tue, 17 Dec 2019 00:53:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36225)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1ih4kr-0003SY-P6
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 23:46:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1ih4kq-0001CP-As
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 23:46:41 -0500
Received: from ozlabs.org ([203.11.71.1]:48053)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1ih4kp-0000AI-Va; Mon, 16 Dec 2019 23:46:40 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 47cQWl2GQnz9sTt; Tue, 17 Dec 2019 15:43:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1576557827;
 bh=BHAjypE4bBeB+KWlgsru+K88rpqi194TxyMC+bbKMsg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iTTyGSHw4+a5aHopO9J5Pb2jNuN0IEqgH8ysm1kmV7JcvhlhlvINvKT2xLTxZjGNN
 26sGCAGR+aItuDgq6XZi3dOBAXLo55WFu508EdGbe9f1NGEfTuaz7uM9ynSBoQzsmC
 ryng1ijmKXCpdD5Wp6fAkFBHX0cLqw2kUKn+j4q8=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 78/88] ppc/pnv: Introduce PnvMachineClass and
 PnvMachineClass::compat
Date: Tue, 17 Dec 2019 15:43:12 +1100
Message-Id: <20191217044322.351838-79-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191217044322.351838-1-david@gibson.dropbear.id.au>
References: <20191217044322.351838-1-david@gibson.dropbear.id.au>
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
Cc: lvivier@redhat.com, aik@ozlabs.ru, qemu-devel@nongnu.org, groug@kaod.org,
 qemu-ppc@nongnu.org, clg@kaod.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Greg Kurz <groug@kaod.org>

The pnv_dt_create() function generates different contents for the
"compatible" property of the root node in the DT, depending on the
CPU type. This is open coded with multiple ifs using pnv_is_powerXX()
helpers.

It seems cleaner to achieve with QOM. Introduce a base class for the
powernv machine and a compat attribute that each child class can use
to provide the value for the "compatible" property.

Signed-off-by: Greg Kurz <groug@kaod.org>
Message-Id: <157623839085.360005.4046508784077843216.stgit@bahia.lan>
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
[dwg: Folded in small fix Greg spotted after posting]
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/pnv.c         | 32 ++++++++++++++++++--------------
 include/hw/ppc/pnv.h | 13 +++++++++++++
 2 files changed, 31 insertions(+), 14 deletions(-)

diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 0be0b6b411..97845e7bde 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -484,9 +484,7 @@ static void pnv_dt_power_mgt(void *fdt)
=20
 static void *pnv_dt_create(MachineState *machine)
 {
-    const char plat_compat8[] =3D "qemu,powernv8\0qemu,powernv\0ibm,powe=
rnv";
-    const char plat_compat9[] =3D "qemu,powernv9\0ibm,powernv";
-    const char plat_compat10[] =3D "qemu,powernv10\0ibm,powernv";
+    PnvMachineClass *pmc =3D PNV_MACHINE_GET_CLASS(machine);
     PnvMachineState *pnv =3D PNV_MACHINE(machine);
     void *fdt;
     char *buf;
@@ -504,17 +502,7 @@ static void *pnv_dt_create(MachineState *machine)
     _FDT((fdt_setprop_cell(fdt, 0, "#size-cells", 0x2)));
     _FDT((fdt_setprop_string(fdt, 0, "model",
                              "IBM PowerNV (emulated by qemu)")));
-    if (pnv_is_power10(pnv)) {
-        _FDT((fdt_setprop(fdt, 0, "compatible", plat_compat10,
-                          sizeof(plat_compat10))));
-    } else if (pnv_is_power9(pnv)) {
-        _FDT((fdt_setprop(fdt, 0, "compatible", plat_compat9,
-                          sizeof(plat_compat9))));
-    } else {
-        _FDT((fdt_setprop(fdt, 0, "compatible", plat_compat8,
-                          sizeof(plat_compat8))));
-    }
-
+    _FDT((fdt_setprop(fdt, 0, "compatible", pmc->compat, pmc->compat_siz=
e)));
=20
     buf =3D  qemu_uuid_unparse_strdup(&qemu_uuid);
     _FDT((fdt_setprop_string(fdt, 0, "vm,uuid", buf)));
@@ -1692,6 +1680,8 @@ static void pnv_machine_power8_class_init(ObjectCla=
ss *oc, void *data)
 {
     MachineClass *mc =3D MACHINE_CLASS(oc);
     XICSFabricClass *xic =3D XICS_FABRIC_CLASS(oc);
+    PnvMachineClass *pmc =3D PNV_MACHINE_CLASS(oc);
+    static const char compat[] =3D "qemu,powernv8\0qemu,powernv\0ibm,pow=
ernv";
=20
     mc->desc =3D "IBM PowerNV (Non-Virtualized) POWER8";
     mc->default_cpu_type =3D POWERPC_CPU_TYPE_NAME("power8_v2.0");
@@ -1699,26 +1689,39 @@ static void pnv_machine_power8_class_init(ObjectC=
lass *oc, void *data)
     xic->icp_get =3D pnv_icp_get;
     xic->ics_get =3D pnv_ics_get;
     xic->ics_resend =3D pnv_ics_resend;
+
+    pmc->compat =3D compat;
+    pmc->compat_size =3D sizeof(compat);
 }
=20
 static void pnv_machine_power9_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc =3D MACHINE_CLASS(oc);
     XiveFabricClass *xfc =3D XIVE_FABRIC_CLASS(oc);
+    PnvMachineClass *pmc =3D PNV_MACHINE_CLASS(oc);
+    static const char compat[] =3D "qemu,powernv9\0ibm,powernv";
=20
     mc->desc =3D "IBM PowerNV (Non-Virtualized) POWER9";
     mc->default_cpu_type =3D POWERPC_CPU_TYPE_NAME("power9_v2.0");
     xfc->match_nvt =3D pnv_match_nvt;
=20
     mc->alias =3D "powernv";
+
+    pmc->compat =3D compat;
+    pmc->compat_size =3D sizeof(compat);
 }
=20
 static void pnv_machine_power10_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc =3D MACHINE_CLASS(oc);
+    PnvMachineClass *pmc =3D PNV_MACHINE_CLASS(oc);
+    static const char compat[] =3D "qemu,powernv10\0ibm,powernv";
=20
     mc->desc =3D "IBM PowerNV (Non-Virtualized) POWER10";
     mc->default_cpu_type =3D POWERPC_CPU_TYPE_NAME("power10_v1.0");
+
+    pmc->compat =3D compat;
+    pmc->compat_size =3D sizeof(compat);
 }
=20
 static void pnv_machine_class_init(ObjectClass *oc, void *data)
@@ -1796,6 +1799,7 @@ static const TypeInfo types[] =3D {
         .instance_size =3D sizeof(PnvMachineState),
         .instance_init =3D pnv_machine_instance_init,
         .class_init    =3D pnv_machine_class_init,
+        .class_size    =3D sizeof(PnvMachineClass),
         .interfaces =3D (InterfaceInfo[]) {
             { TYPE_INTERRUPT_STATS_PROVIDER },
             { },
diff --git a/include/hw/ppc/pnv.h b/include/hw/ppc/pnv.h
index 92f80b1cce..d534746bd4 100644
--- a/include/hw/ppc/pnv.h
+++ b/include/hw/ppc/pnv.h
@@ -185,6 +185,19 @@ PowerPCCPU *pnv_chip_find_cpu(PnvChip *chip, uint32_=
t pir);
 #define TYPE_PNV_MACHINE       MACHINE_TYPE_NAME("powernv")
 #define PNV_MACHINE(obj) \
     OBJECT_CHECK(PnvMachineState, (obj), TYPE_PNV_MACHINE)
+#define PNV_MACHINE_GET_CLASS(obj) \
+    OBJECT_GET_CLASS(PnvMachineClass, obj, TYPE_PNV_MACHINE)
+#define PNV_MACHINE_CLASS(klass) \
+    OBJECT_CLASS_CHECK(PnvMachineClass, klass, TYPE_PNV_MACHINE)
+
+typedef struct PnvMachineClass {
+    /*< private >*/
+    MachineClass parent_class;
+
+    /*< public >*/
+    const char *compat;
+    int compat_size;
+} PnvMachineClass;
=20
 typedef struct PnvMachineState {
     /*< private >*/
--=20
2.23.0


