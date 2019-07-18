Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8EAB6CDDD
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Jul 2019 14:10:54 +0200 (CEST)
Received: from localhost ([::1]:37346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ho5FN-0006JX-W3
	for lists+qemu-devel@lfdr.de; Thu, 18 Jul 2019 08:10:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59465)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <clg@kaod.org>) id 1ho514-0000WD-0E
 for qemu-devel@nongnu.org; Thu, 18 Jul 2019 07:56:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1ho512-0002im-DC
 for qemu-devel@nongnu.org; Thu, 18 Jul 2019 07:56:05 -0400
Received: from 2.mo178.mail-out.ovh.net ([46.105.39.61]:43525)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1ho512-0002gw-7a
 for qemu-devel@nongnu.org; Thu, 18 Jul 2019 07:56:04 -0400
Received: from player778.ha.ovh.net (unknown [10.108.57.150])
 by mo178.mail-out.ovh.net (Postfix) with ESMTP id ABE0D72364
 for <qemu-devel@nongnu.org>; Thu, 18 Jul 2019 13:56:02 +0200 (CEST)
Received: from kaod.org (lfbn-1-2240-157.w90-76.abo.wanadoo.fr [90.76.60.157])
 (Authenticated sender: clg@kaod.org)
 by player778.ha.ovh.net (Postfix) with ESMTPSA id 47B43801F659;
 Thu, 18 Jul 2019 11:55:57 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Date: Thu, 18 Jul 2019 13:54:19 +0200
Message-Id: <20190718115420.19919-17-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190718115420.19919-1-clg@kaod.org>
References: <20190718115420.19919-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 6796494788646243302
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduvddrieehgdegkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.39.61
Subject: [Qemu-devel] [PATCH v2 16/17] ppc/pnv: Introduce a
 pnv_xive_get_block_id() interface to XiveRouter
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

When PC_TCTXT_CHIPID_OVERRIDE is configured, the PC_TCTXT_CHIPID field
overrides the hardwired chip ID in the Powerbus operations and for CAM
compares. This is typically used in one block-per-chip configurations
to associate a unique block id number to each IC of the system.

The model does support multiple blocks per chip.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/ppc/pnv_xive.h |  3 --
 include/hw/ppc/xive.h     |  2 ++
 hw/intc/pnv_xive.c        | 66 +++++++++++++++++++++------------------
 hw/intc/spapr_xive.c      |  6 ++++
 hw/intc/xive.c            | 10 +++++-
 5 files changed, 53 insertions(+), 34 deletions(-)

diff --git a/include/hw/ppc/pnv_xive.h b/include/hw/ppc/pnv_xive.h
index 4fdaa9247d65..f4c7caad40ee 100644
--- a/include/hw/ppc/pnv_xive.h
+++ b/include/hw/ppc/pnv_xive.h
@@ -72,9 +72,6 @@ typedef struct PnvXive {
     /* Interrupt controller registers */
     uint64_t      regs[0x300];
=20
-    /* Can be configured by FW */
-    uint32_t      tctx_chipid;
-
     /*
      * Virtual Structure Descriptor tables : EAT, SBE, ENDT, NVTT, IRQ
      * These are in a SRAM protected by ECC.
diff --git a/include/hw/ppc/xive.h b/include/hw/ppc/xive.h
index 251a8f2de10e..8828dd1eb06c 100644
--- a/include/hw/ppc/xive.h
+++ b/include/hw/ppc/xive.h
@@ -355,6 +355,7 @@ typedef struct XiveRouterClass {
     int (*write_nvt)(XiveRouter *xrtr, uint8_t nvt_blk, uint32_t nvt_idx=
,
                      XiveNVT *nvt, uint8_t word_number);
     XiveTCTX *(*get_tctx)(XiveRouter *xrtr, CPUState *cs);
+    uint8_t (*get_block_id)(XiveRouter *xrtr);
 } XiveRouterClass;
=20
 int xive_router_get_eas(XiveRouter *xrtr, uint8_t eas_blk, uint32_t eas_=
idx,
@@ -368,6 +369,7 @@ int xive_router_get_nvt(XiveRouter *xrtr, uint8_t nvt=
_blk, uint32_t nvt_idx,
 int xive_router_write_nvt(XiveRouter *xrtr, uint8_t nvt_blk, uint32_t nv=
t_idx,
                           XiveNVT *nvt, uint8_t word_number);
 XiveTCTX *xive_router_get_tctx(XiveRouter *xrtr, CPUState *cs);
+uint8_t xive_router_get_block_id(XiveRouter *xrtr);
 void xive_router_notify(XiveNotifier *xn, uint32_t lisn);
=20
 /*
diff --git a/hw/intc/pnv_xive.c b/hw/intc/pnv_xive.c
index 403e8c8ca5b4..c1501a6b5bce 100644
--- a/hw/intc/pnv_xive.c
+++ b/hw/intc/pnv_xive.c
@@ -83,6 +83,23 @@ static inline uint64_t SETFIELD(uint64_t mask, uint64_=
t word,
     return (word & ~mask) | ((value << ctz64(mask)) & mask);
 }
=20
+/*
+ * When PC_TCTXT_CHIPID_OVERRIDE is configured, the PC_TCTXT_CHIPID
+ * field overrides the hardwired chip ID in the Powerbus operations
+ * and for CAM compares
+ */
+static uint8_t pnv_xive_block_id(PnvXive *xive)
+{
+    uint8_t blk =3D xive->chip->chip_id;
+    uint64_t cfg_val =3D xive->regs[PC_TCTXT_CFG >> 3];
+
+    if (cfg_val & PC_TCTXT_CHIPID_OVERRIDE) {
+        blk =3D GETFIELD(PC_TCTXT_CHIPID, cfg_val);
+    }
+
+    return blk;
+}
+
 /*
  * Remote access to controllers. HW uses MMIOs. For now, a simple scan
  * of the chips is good enough.
@@ -98,7 +115,7 @@ static PnvXive *pnv_xive_get_ic(uint8_t blk)
         Pnv9Chip *chip9 =3D PNV9_CHIP(pnv->chips[i]);
         PnvXive *xive =3D &chip9->xive;
=20
-        if (xive->chip->chip_id =3D=3D blk) {
+        if (pnv_xive_block_id(xive) =3D=3D blk) {
             return xive;
         }
     }
@@ -384,6 +401,11 @@ static XiveTCTX *pnv_xive_get_tctx(XiveRouter *xrtr,=
 CPUState *cs)
     return tctx;
 }
=20
+static uint8_t pnv_xive_get_block_id(XiveRouter *xrtr)
+{
+    return pnv_xive_block_id(PNV_XIVE(xrtr));
+}
+
 /*
  * The internal sources (IPIs) of the interrupt controller have no
  * knowledge of the XIVE chip on which they reside. Encode the block
@@ -394,7 +416,7 @@ static XiveTCTX *pnv_xive_get_tctx(XiveRouter *xrtr, =
CPUState *cs)
 static void pnv_xive_notify(XiveNotifier *xn, uint32_t srcno)
 {
     PnvXive *xive =3D PNV_XIVE(xn);
-    uint8_t blk =3D xive->chip->chip_id;
+    uint8_t blk =3D pnv_xive_block_id(xive);
=20
     xive_router_notify(xn, XIVE_SRCNO(blk, srcno));
 }
@@ -758,21 +780,9 @@ static void pnv_xive_ic_reg_write(void *opaque, hwad=
dr offset,
     case PC_TCTXT_CFG:
         /*
          * TODO: block group support
-         *
-         * PC_TCTXT_CFG_BLKGRP_EN
-         * PC_TCTXT_CFG_HARD_CHIPID_BLK :
-         *   Moves the chipid into block field for hardwired CAM compare=
s.
-         *   Block offset value is adjusted to 0b0..01 & ThrdId
-         *
-         *   Will require changes in xive_presenter_tctx_match(). I am
-         *   not sure how to handle that yet.
          */
-
-        /* Overrides hardwired chip ID with the chip ID field */
-        if (val & PC_TCTXT_CHIPID_OVERRIDE) {
-            xive->tctx_chipid =3D GETFIELD(PC_TCTXT_CHIPID, val);
-        }
         break;
+
     case PC_TCTXT_TRACK:
         /*
          * PC_TCTXT_TRACK_EN:
@@ -1555,7 +1565,8 @@ static void xive_nvt_pic_print_info(XiveNVT *nvt, u=
int32_t nvt_idx,
 void pnv_xive_pic_print_info(PnvXive *xive, Monitor *mon)
 {
     XiveRouter *xrtr =3D XIVE_ROUTER(xive);
-    uint8_t blk =3D xive->chip->chip_id;
+    uint8_t blk =3D pnv_xive_block_id(xive);
+    uint8_t chip_id =3D xive->chip->chip_id;
     uint32_t srcno0 =3D XIVE_SRCNO(blk, 0);
     uint32_t nr_ipis =3D pnv_xive_nr_ipis(xive, blk);
     XiveEAS eas;
@@ -1563,12 +1574,12 @@ void pnv_xive_pic_print_info(PnvXive *xive, Monit=
or *mon)
     XiveNVT nvt;
     int i;
=20
-    monitor_printf(mon, "XIVE[%x] Source %08x .. %08x\n", blk, srcno0,
-                   srcno0 + nr_ipis - 1);
+    monitor_printf(mon, "XIVE[%x] #%d Source %08x .. %08x\n", chip_id, b=
lk,
+                   srcno0, srcno0 + nr_ipis - 1);
     xive_source_pic_print_info(&xive->ipi_source, srcno0, mon);
=20
-    monitor_printf(mon, "XIVE[%x] EAT %08x .. %08x\n", blk, srcno0,
-                   srcno0 + nr_ipis - 1);
+    monitor_printf(mon, "XIVE[%x] #%d EAT %08x .. %08x\n", chip_id, blk,
+                   srcno0, srcno0 + nr_ipis - 1);
     for (i =3D 0; i < nr_ipis; i++) {
         if (xive_router_get_eas(xrtr, blk, i, &eas)) {
             break;
@@ -1578,20 +1589,20 @@ void pnv_xive_pic_print_info(PnvXive *xive, Monit=
or *mon)
         }
     }
=20
-    monitor_printf(mon, "XIVE[%x] ENDT\n", blk);
+    monitor_printf(mon, "XIVE[%x] #%d ENDT\n", chip_id, blk);
     i =3D 0;
     while (!xive_router_get_end(xrtr, blk, i, &end)) {
         xive_end_pic_print_info(&end, i++, mon);
     }
=20
-    monitor_printf(mon, "XIVE[%x] END Escalation EAT\n", blk);
+    monitor_printf(mon, "XIVE[%x] #%d END Escalation EAT\n", chip_id, bl=
k);
     i =3D 0;
     while (!xive_router_get_end(xrtr, blk, i, &end)) {
         xive_end_eas_pic_print_info(&end, i++, mon);
     }
=20
-    monitor_printf(mon, "XIVE[%x] NVTT %08x .. %08x\n", blk, 0,
-                   XIVE_NVT_COUNT - 1);
+    monitor_printf(mon, "XIVE[%x] #%d NVTT %08x .. %08x\n", chip_id, blk=
,
+                   0, XIVE_NVT_COUNT - 1);
     for (i =3D 0; i < XIVE_NVT_COUNT; i +=3D XIVE_NVT_PER_PAGE) {
         while (!xive_router_get_nvt(xrtr, blk, i, &nvt)) {
             xive_nvt_pic_print_info(&nvt, i++, mon);
@@ -1605,12 +1616,6 @@ static void pnv_xive_reset(void *dev)
     XiveSource *xsrc =3D &xive->ipi_source;
     XiveENDSource *end_xsrc =3D &xive->end_source;
=20
-    /*
-     * Use the PnvChip id to identify the XIVE interrupt controller.
-     * It can be overriden by configuration at runtime.
-     */
-    xive->tctx_chipid =3D xive->chip->chip_id;
-
     /* Default page size (Should be changed at runtime to 64k) */
     xive->ic_shift =3D xive->vc_shift =3D xive->pc_shift =3D 12;
=20
@@ -1803,6 +1808,7 @@ static void pnv_xive_class_init(ObjectClass *klass,=
 void *data)
     xrc->get_nvt =3D pnv_xive_get_nvt;
     xrc->write_nvt =3D pnv_xive_write_nvt;
     xrc->get_tctx =3D pnv_xive_get_tctx;
+    xrc->get_block_id =3D pnv_xive_get_block_id;
=20
     xnc->notify =3D pnv_xive_notify;
 };
diff --git a/hw/intc/spapr_xive.c b/hw/intc/spapr_xive.c
index ba012c7b0fdc..1c5fb1e0e633 100644
--- a/hw/intc/spapr_xive.c
+++ b/hw/intc/spapr_xive.c
@@ -419,6 +419,11 @@ static XiveTCTX *spapr_xive_get_tctx(XiveRouter *xrt=
r, CPUState *cs)
     return spapr_cpu_state(cpu)->tctx;
 }
=20
+static uint8_t spapr_xive_get_block_id(XiveRouter *xrtr)
+{
+    return SPAPR_XIVE_BLOCK_ID;
+}
+
 static const VMStateDescription vmstate_spapr_xive_end =3D {
     .name =3D TYPE_SPAPR_XIVE "/end",
     .version_id =3D 1,
@@ -508,6 +513,7 @@ static void spapr_xive_class_init(ObjectClass *klass,=
 void *data)
     xrc->get_nvt =3D spapr_xive_get_nvt;
     xrc->write_nvt =3D spapr_xive_write_nvt;
     xrc->get_tctx =3D spapr_xive_get_tctx;
+    xrc->get_block_id =3D spapr_xive_get_block_id;
 }
=20
 static const TypeInfo spapr_xive_info =3D {
diff --git a/hw/intc/xive.c b/hw/intc/xive.c
index bcb22ad7e69a..18371ab60d3a 100644
--- a/hw/intc/xive.c
+++ b/hw/intc/xive.c
@@ -1340,6 +1340,13 @@ XiveTCTX *xive_router_get_tctx(XiveRouter *xrtr, C=
PUState *cs)
     return xrc->get_tctx(xrtr, cs);
 }
=20
+uint8_t xive_router_get_block_id(XiveRouter *xrtr)
+{
+    XiveRouterClass *xrc =3D XIVE_ROUTER_GET_CLASS(xrtr);
+
+    return xrc->get_block_id(xrtr);
+}
+
 /*
  * Encode the HW CAM line in the block group mode format :
  *
@@ -1349,8 +1356,9 @@ static uint32_t xive_tctx_hw_cam_line(XiveTCTX *tct=
x)
 {
     CPUPPCState *env =3D &POWERPC_CPU(tctx->cs)->env;
     uint32_t pir =3D env->spr_cb[SPR_PIR].default_value;
+    uint8_t blk =3D xive_router_get_block_id(XIVE_ROUTER(tctx->xrtr));
=20
-    return xive_nvt_cam_line((pir >> 8) & 0xf, 1 << 7 | (pir & 0x7f));
+    return xive_nvt_cam_line(blk, 1 << 7 | (pir & 0x7f));
 }
=20
 /*
--=20
2.21.0


