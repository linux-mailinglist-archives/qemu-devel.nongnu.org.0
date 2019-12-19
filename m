Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D960125C05
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Dec 2019 08:34:32 +0100 (CET)
Received: from localhost ([::1]:36790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihqKM-0001C4-R4
	for lists+qemu-devel@lfdr.de; Thu, 19 Dec 2019 02:34:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45070)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1ihqGS-00067u-2K
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 02:30:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1ihqGP-0001PW-WD
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 02:30:27 -0500
Received: from 9.mo69.mail-out.ovh.net ([46.105.56.78]:37374)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1ihqGP-0001DH-N0
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 02:30:25 -0500
Received: from player714.ha.ovh.net (unknown [10.108.16.182])
 by mo69.mail-out.ovh.net (Postfix) with ESMTP id 710B76E5F3
 for <qemu-devel@nongnu.org>; Thu, 19 Dec 2019 08:30:23 +0100 (CET)
Received: from kaod.org (lfbn-tou-1-1227-223.w90-76.abo.wanadoo.fr
 [90.76.50.223]) (Authenticated sender: clg@kaod.org)
 by player714.ha.ovh.net (Postfix) with ESMTPSA id AE67BD671D45;
 Thu, 19 Dec 2019 07:30:17 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: [PATCH 02/10] ppc/pnv: Introduce a "system-memory" property
Date: Thu, 19 Dec 2019 08:29:53 +0100
Message-Id: <20191219073001.26790-3-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191219073001.26790-1-clg@kaod.org>
References: <20191219073001.26790-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 2814468294224350182
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrvddutddguddtkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecukfhppedtrddtrddtrddtpdeltddrjeeirdehtddrvddvfeenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjedugedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 46.105.56.78
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
 Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

and use a link to pass the system memory to the device models that
require it to map/unmap BARs. This replace the use of get_system_memory()

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/ppc/pnv.h      |  2 ++
 include/hw/ppc/pnv_psi.h  |  1 +
 include/hw/ppc/pnv_xive.h |  2 ++
 hw/intc/pnv_xive.c        |  5 ++++-
 hw/ppc/pnv.c              | 31 ++++++++++++++++++++++++-------
 hw/ppc/pnv_psi.c          | 13 ++++++++++---
 6 files changed, 43 insertions(+), 11 deletions(-)

diff --git a/include/hw/ppc/pnv.h b/include/hw/ppc/pnv.h
index f78fd0dd967c..f31180618672 100644
--- a/include/hw/ppc/pnv.h
+++ b/include/hw/ppc/pnv.h
@@ -56,6 +56,8 @@ typedef struct PnvChip {
     AddressSpace xscom_as;
=20
     gchar        *dt_isa_nodename;
+
+    MemoryRegion *system_memory;
 } PnvChip;
=20
 #define TYPE_PNV8_CHIP "pnv8-chip"
diff --git a/include/hw/ppc/pnv_psi.h b/include/hw/ppc/pnv_psi.h
index f0f5b5519767..f85babaff0be 100644
--- a/include/hw/ppc/pnv_psi.h
+++ b/include/hw/ppc/pnv_psi.h
@@ -35,6 +35,7 @@ typedef struct PnvPsi {
=20
     MemoryRegion regs_mr;
     uint64_t bar;
+    MemoryRegion *system_memory;
=20
     /* FSP region not supported */
     /* MemoryRegion fsp_mr; */
diff --git a/include/hw/ppc/pnv_xive.h b/include/hw/ppc/pnv_xive.h
index f4c7caad40ee..4d641db691c8 100644
--- a/include/hw/ppc/pnv_xive.h
+++ b/include/hw/ppc/pnv_xive.h
@@ -30,6 +30,8 @@ typedef struct PnvXive {
     /* Owning chip */
     struct PnvChip *chip;
=20
+    MemoryRegion *system_memory;
+
     /* XSCOM addresses giving access to the controller registers */
     MemoryRegion  xscom_regs;
=20
diff --git a/hw/intc/pnv_xive.c b/hw/intc/pnv_xive.c
index a0a69b98a713..66970a60733b 100644
--- a/hw/intc/pnv_xive.c
+++ b/hw/intc/pnv_xive.c
@@ -853,7 +853,7 @@ static void pnv_xive_ic_reg_write(void *opaque, hwadd=
r offset,
                                   uint64_t val, unsigned size)
 {
     PnvXive *xive =3D PNV_XIVE(opaque);
-    MemoryRegion *sysmem =3D get_system_memory();
+    MemoryRegion *sysmem =3D xive->system_memory;
     uint32_t reg =3D offset >> 3;
     bool is_chip0 =3D xive->chip->chip_id =3D=3D 0;
=20
@@ -1821,6 +1821,7 @@ static void pnv_xive_realize(DeviceState *dev, Erro=
r **errp)
     Error *local_err =3D NULL;
=20
     assert(xive->chip);
+    assert(xive->system_memory);
=20
     /*
      * The XiveSource and XiveENDSource objects are realized with the
@@ -1937,6 +1938,8 @@ static Property pnv_xive_properties[] =3D {
     DEFINE_PROP_UINT64("tm-bar", PnvXive, tm_base, 0),
     /* The PnvChip id identifies the XIVE interrupt controller. */
     DEFINE_PROP_LINK("chip", PnvXive, chip, TYPE_PNV_CHIP, PnvChip *),
+    DEFINE_PROP_LINK("system-memory", PnvXive, system_memory,
+                     TYPE_MEMORY_REGION, MemoryRegion *),
     DEFINE_PROP_END_OF_LIST(),
 };
=20
diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 855254f28263..2f611bfdda46 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -674,6 +674,7 @@ static void pnv_chip_power10_pic_print_info(PnvChip *=
chip, Monitor *mon)
=20
 static void pnv_init(MachineState *machine)
 {
+    MemoryRegion *sysmem =3D get_system_memory();
     PnvMachineState *pnv =3D PNV_MACHINE(machine);
     MachineClass *mc =3D MACHINE_GET_CLASS(machine);
     MemoryRegion *ram;
@@ -692,7 +693,7 @@ static void pnv_init(MachineState *machine)
     ram =3D g_new(MemoryRegion, 1);
     memory_region_allocate_system_memory(ram, NULL, "pnv.ram",
                                          machine->ram_size);
-    memory_region_add_subregion(get_system_memory(), 0, ram);
+    memory_region_add_subregion(sysmem, 0, ram);
=20
     /*
      * Create our simple PNOR device
@@ -790,6 +791,12 @@ static void pnv_init(MachineState *machine)
                                 &error_fatal);
         object_property_set_int(chip, machine->smp.cores,
                                 "nr-cores", &error_fatal);
+        /*
+         * TODO: Only the MMIO range should be of interest for the
+         * controllers
+         */
+        object_property_set_link(chip, OBJECT(sysmem), "system-memory",
+                                 &error_abort);
         object_property_set_bool(chip, true, "realized", &error_fatal);
     }
     g_free(chip_typename);
@@ -1060,6 +1067,8 @@ static void pnv_chip_power8_realize(DeviceState *de=
v, Error **errp)
     /* Processor Service Interface (PSI) Host Bridge */
     object_property_set_int(OBJECT(&chip8->psi), PNV_PSIHB_BASE(chip),
                             "bar", &error_fatal);
+    object_property_set_link(OBJECT(&chip8->psi), OBJECT(chip->system_me=
mory),
+                             "system-memory", &error_abort);
     object_property_set_bool(OBJECT(&chip8->psi), true, "realized", &loc=
al_err);
     if (local_err) {
         error_propagate(errp, local_err);
@@ -1100,7 +1109,7 @@ static void pnv_chip_power8_realize(DeviceState *de=
v, Error **errp)
     pnv_xscom_add_subregion(chip, PNV_XSCOM_OCC_BASE, &chip8->occ.xscom_=
regs);
=20
     /* OCC SRAM model */
-    memory_region_add_subregion(get_system_memory(), PNV_OCC_SENSOR_BASE=
(chip),
+    memory_region_add_subregion(chip->system_memory, PNV_OCC_SENSOR_BASE=
(chip),
                                 &chip8->occ.sram_regs);
=20
     /* HOMER */
@@ -1116,7 +1125,7 @@ static void pnv_chip_power8_realize(DeviceState *de=
v, Error **errp)
     pnv_xscom_add_subregion(chip, PNV_XSCOM_PBA_BASE, &chip8->homer.pba_=
regs);
=20
     /* Homer mmio region */
-    memory_region_add_subregion(get_system_memory(), PNV_HOMER_BASE(chip=
),
+    memory_region_add_subregion(chip->system_memory, PNV_HOMER_BASE(chip=
),
                                 &chip8->homer.regs);
 }
=20
@@ -1280,6 +1289,8 @@ static void pnv_chip_power9_realize(DeviceState *de=
v, Error **errp)
                             "tm-bar", &error_fatal);
     object_property_set_link(OBJECT(&chip9->xive), OBJECT(chip), "chip",
                              &error_abort);
+    object_property_set_link(OBJECT(&chip9->xive), OBJECT(chip->system_m=
emory),
+                             "system-memory", &error_abort);
     object_property_set_bool(OBJECT(&chip9->xive), true, "realized",
                              &local_err);
     if (local_err) {
@@ -1292,6 +1303,8 @@ static void pnv_chip_power9_realize(DeviceState *de=
v, Error **errp)
     /* Processor Service Interface (PSI) Host Bridge */
     object_property_set_int(OBJECT(&chip9->psi), PNV9_PSIHB_BASE(chip),
                             "bar", &error_fatal);
+    object_property_set_link(OBJECT(&chip9->psi), OBJECT(chip->system_me=
mory),
+                             "system-memory", &error_abort);
     object_property_set_bool(OBJECT(&chip9->psi), true, "realized", &loc=
al_err);
     if (local_err) {
         error_propagate(errp, local_err);
@@ -1308,7 +1321,7 @@ static void pnv_chip_power9_realize(DeviceState *de=
v, Error **errp)
         error_propagate(errp, local_err);
         return;
     }
-    memory_region_add_subregion(get_system_memory(), PNV9_LPCM_BASE(chip=
),
+    memory_region_add_subregion(chip->system_memory, PNV9_LPCM_BASE(chip=
),
                                 &chip9->lpc.xscom_regs);
=20
     chip->dt_isa_nodename =3D g_strdup_printf("/lpcm-opb@%" PRIx64 "/lpc=
@0",
@@ -1325,7 +1338,7 @@ static void pnv_chip_power9_realize(DeviceState *de=
v, Error **errp)
     pnv_xscom_add_subregion(chip, PNV9_XSCOM_OCC_BASE, &chip9->occ.xscom=
_regs);
=20
     /* OCC SRAM model */
-    memory_region_add_subregion(get_system_memory(), PNV9_OCC_SENSOR_BAS=
E(chip),
+    memory_region_add_subregion(chip->system_memory, PNV9_OCC_SENSOR_BAS=
E(chip),
                                 &chip9->occ.sram_regs);
=20
     /* HOMER */
@@ -1341,7 +1354,7 @@ static void pnv_chip_power9_realize(DeviceState *de=
v, Error **errp)
     pnv_xscom_add_subregion(chip, PNV9_XSCOM_PBA_BASE, &chip9->homer.pba=
_regs);
=20
     /* Homer mmio region */
-    memory_region_add_subregion(get_system_memory(), PNV9_HOMER_BASE(chi=
p),
+    memory_region_add_subregion(chip->system_memory, PNV9_HOMER_BASE(chi=
p),
                                 &chip9->homer.regs);
 }
=20
@@ -1408,6 +1421,8 @@ static void pnv_chip_power10_realize(DeviceState *d=
ev, Error **errp)
     /* Processor Service Interface (PSI) Host Bridge */
     object_property_set_int(OBJECT(&chip10->psi), PNV10_PSIHB_BASE(chip)=
,
                             "bar", &error_fatal);
+    object_property_set_link(OBJECT(&chip10->psi), OBJECT(chip->system_m=
emory),
+                             "system-memory", &error_abort);
     object_property_set_bool(OBJECT(&chip10->psi), true, "realized",
                              &local_err);
     if (local_err) {
@@ -1426,7 +1441,7 @@ static void pnv_chip_power10_realize(DeviceState *d=
ev, Error **errp)
         error_propagate(errp, local_err);
         return;
     }
-    memory_region_add_subregion(get_system_memory(), PNV10_LPCM_BASE(chi=
p),
+    memory_region_add_subregion(chip->system_memory, PNV10_LPCM_BASE(chi=
p),
                                 &chip10->lpc.xscom_regs);
=20
     chip->dt_isa_nodename =3D g_strdup_printf("/lpcm-opb@%" PRIx64 "/lpc=
@0",
@@ -1570,6 +1585,8 @@ static Property pnv_chip_properties[] =3D {
     DEFINE_PROP_UINT64("ram-size", PnvChip, ram_size, 0),
     DEFINE_PROP_UINT32("nr-cores", PnvChip, nr_cores, 1),
     DEFINE_PROP_UINT64("cores-mask", PnvChip, cores_mask, 0x0),
+    DEFINE_PROP_LINK("system-memory", PnvChip, system_memory,
+                     TYPE_MEMORY_REGION, MemoryRegion *),
     DEFINE_PROP_END_OF_LIST(),
 };
=20
diff --git a/hw/ppc/pnv_psi.c b/hw/ppc/pnv_psi.c
index 75e20d9da08b..28d34e5c193a 100644
--- a/hw/ppc/pnv_psi.c
+++ b/hw/ppc/pnv_psi.c
@@ -126,7 +126,7 @@
 static void pnv_psi_set_bar(PnvPsi *psi, uint64_t bar)
 {
     PnvPsiClass *ppc =3D PNV_PSI_GET_CLASS(psi);
-    MemoryRegion *sysmem =3D get_system_memory();
+    MemoryRegion *sysmem =3D psi->system_memory;
     uint64_t old =3D psi->regs[PSIHB_XSCOM_BAR];
=20
     psi->regs[PSIHB_XSCOM_BAR] =3D bar & (ppc->bar_mask | PSIHB_BAR_EN);
@@ -489,6 +489,8 @@ static void pnv_psi_power8_realize(DeviceState *dev, =
Error **errp)
     Error *err =3D NULL;
     unsigned int i;
=20
+    assert(psi->system_memory);
+
     obj =3D object_property_get_link(OBJECT(dev), "xics", &err);
     if (!obj) {
         error_setg(errp, "%s: required link 'xics' not found: %s",
@@ -562,6 +564,8 @@ static int pnv_psi_dt_xscom(PnvXScomInterface *dev, v=
oid *fdt, int xscom_offset)
 static Property pnv_psi_properties[] =3D {
     DEFINE_PROP_UINT64("bar", PnvPsi, bar, 0),
     DEFINE_PROP_UINT64("fsp-bar", PnvPsi, fsp_bar, 0),
+    DEFINE_PROP_LINK("system-memory", PnvPsi, system_memory,
+                     TYPE_MEMORY_REGION, MemoryRegion *),
     DEFINE_PROP_END_OF_LIST(),
 };
=20
@@ -701,7 +705,7 @@ static void pnv_psi_p9_mmio_write(void *opaque, hwadd=
r addr,
     PnvPsi *psi =3D PNV_PSI(opaque);
     Pnv9Psi *psi9 =3D PNV9_PSI(psi);
     uint32_t reg =3D PSIHB_REG(addr);
-    MemoryRegion *sysmem =3D get_system_memory();
+    MemoryRegion *sysmem =3D psi->system_memory;
=20
     switch (addr) {
     case PSIHB9_CR:
@@ -819,11 +823,12 @@ static void pnv_psi_power9_irq_set(PnvPsi *psi, int=
 irq, bool state)
 static void pnv_psi_power9_reset(void *dev)
 {
     Pnv9Psi *psi =3D PNV9_PSI(dev);
+    MemoryRegion *sysmem =3D PNV_PSI(psi)->system_memory;
=20
     pnv_psi_reset(dev);
=20
     if (memory_region_is_mapped(&psi->source.esb_mmio)) {
-        memory_region_del_subregion(get_system_memory(), &psi->source.es=
b_mmio);
+        memory_region_del_subregion(sysmem, &psi->source.esb_mmio);
     }
 }
=20
@@ -842,6 +847,8 @@ static void pnv_psi_power9_realize(DeviceState *dev, =
Error **errp)
     Error *local_err =3D NULL;
     int i;
=20
+    assert(psi->system_memory);
+
     /* This is the only device with 4k ESB pages */
     object_property_set_int(OBJECT(xsrc), XIVE_ESB_4K, "shift",
                             &error_fatal);
--=20
2.21.0


