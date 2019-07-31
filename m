Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BDA37C4B5
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Jul 2019 16:19:55 +0200 (CEST)
Received: from localhost ([::1]:41311 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hspSM-0004H8-By
	for lists+qemu-devel@lfdr.de; Wed, 31 Jul 2019 10:19:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34740)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <clg@kaod.org>) id 1hspN5-0001k0-Nn
 for qemu-devel@nongnu.org; Wed, 31 Jul 2019 10:14:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1hspN4-0002Zs-Im
 for qemu-devel@nongnu.org; Wed, 31 Jul 2019 10:14:27 -0400
Received: from 3.mo4.mail-out.ovh.net ([46.105.57.129]:35009)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1hspN4-0002ZK-D0
 for qemu-devel@nongnu.org; Wed, 31 Jul 2019 10:14:26 -0400
Received: from player715.ha.ovh.net (unknown [10.108.35.124])
 by mo4.mail-out.ovh.net (Postfix) with ESMTP id 0000F200132
 for <qemu-devel@nongnu.org>; Wed, 31 Jul 2019 16:14:24 +0200 (CEST)
Received: from kaod.org (lfbn-1-2240-157.w90-76.abo.wanadoo.fr [90.76.60.157])
 (Authenticated sender: clg@kaod.org)
 by player715.ha.ovh.net (Postfix) with ESMTPSA id 7AA28850BD40;
 Wed, 31 Jul 2019 14:14:19 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Date: Wed, 31 Jul 2019 16:12:31 +0200
Message-Id: <20190731141233.1340-17-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190731141233.1340-1-clg@kaod.org>
References: <20190731141233.1340-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 11691344633080220646
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduvddrleehgdejvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.57.129
Subject: [Qemu-devel] [PATCH v3 16/18] ppc/pnv: Extend XivePresenter with a
 get_block_id() handler
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

When doing CAM line compares, fetch the block id from the interrupt
controller which can have set the PC_TCTXT_CHIPID field.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/ppc/xive.h | 1 +
 hw/intc/pnv_xive.c    | 6 ++++++
 hw/intc/spapr_xive.c  | 6 ++++++
 hw/intc/xive.c        | 8 +++++---
 4 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/include/hw/ppc/xive.h b/include/hw/ppc/xive.h
index e16c3b63fc44..d68fb6eea46e 100644
--- a/include/hw/ppc/xive.h
+++ b/include/hw/ppc/xive.h
@@ -391,6 +391,7 @@ typedef struct XivePresenterClass {
                      uint8_t nvt_blk, uint32_t nvt_idx,
                      bool cam_ignore, uint8_t priority,
                      uint32_t logic_serv, XiveTCTXMatch *match);
+    uint8_t (*get_block_id)(XivePresenter *xptr);
 } XivePresenterClass;
=20
 int xive_presenter_tctx_match(XivePresenter *xptr, XiveTCTX *tctx,
diff --git a/hw/intc/pnv_xive.c b/hw/intc/pnv_xive.c
index 6b7078aa4fde..8e3ba23788f7 100644
--- a/hw/intc/pnv_xive.c
+++ b/hw/intc/pnv_xive.c
@@ -460,6 +460,11 @@ static int pnv_xive_match_nvt(XivePresenter *xptr, u=
int8_t format,
     return count;
 }
=20
+static uint8_t pnv_xive_get_block_id(XivePresenter *xptr)
+{
+    return pnv_xive_block_id(PNV_XIVE(xptr));
+}
+
 /*
  * The TIMA MMIO space is shared among the chips and to identify the
  * chip from which the access is being done, we extract the chip id
@@ -1918,6 +1923,7 @@ static void pnv_xive_class_init(ObjectClass *klass,=
 void *data)
=20
     xnc->notify =3D pnv_xive_notify;
     xpc->match_nvt  =3D pnv_xive_match_nvt;
+    xpc->get_block_id =3D pnv_xive_get_block_id;
 };
=20
 static const TypeInfo pnv_xive_info =3D {
diff --git a/hw/intc/spapr_xive.c b/hw/intc/spapr_xive.c
index 4abb099d341c..26fc815d3931 100644
--- a/hw/intc/spapr_xive.c
+++ b/hw/intc/spapr_xive.c
@@ -479,6 +479,11 @@ static int spapr_xive_match_nvt(XivePresenter *xptr,=
 uint8_t format,
     return count;
 }
=20
+static uint8_t spapr_xive_get_block_id(XivePresenter *xrtr)
+{
+    return SPAPR_XIVE_BLOCK_ID;
+}
+
 static const VMStateDescription vmstate_spapr_xive_end =3D {
     .name =3D TYPE_SPAPR_XIVE "/end",
     .version_id =3D 1,
@@ -570,6 +575,7 @@ static void spapr_xive_class_init(ObjectClass *klass,=
 void *data)
     xrc->write_nvt =3D spapr_xive_write_nvt;
=20
     xpc->match_nvt  =3D spapr_xive_match_nvt;
+    xpc->get_block_id =3D spapr_xive_get_block_id;
 }
=20
 static const TypeInfo spapr_xive_info =3D {
diff --git a/hw/intc/xive.c b/hw/intc/xive.c
index 9b02ce423d66..e79439f6b940 100644
--- a/hw/intc/xive.c
+++ b/hw/intc/xive.c
@@ -1305,12 +1305,14 @@ int xive_router_write_nvt(XiveRouter *xrtr, uint8=
_t nvt_blk, uint32_t nvt_idx,
  *
  *   chip << 19 | 0000000 0 0001 thread (7Bit)
  */
-static uint32_t xive_tctx_hw_cam_line(XiveTCTX *tctx)
+static uint32_t xive_tctx_hw_cam_line(XivePresenter *xptr, XiveTCTX *tct=
x)
 {
     CPUPPCState *env =3D &POWERPC_CPU(tctx->cs)->env;
     uint32_t pir =3D env->spr_cb[SPR_PIR].default_value;
+    XivePresenterClass *xpc =3D XIVE_PRESENTER_GET_CLASS(xptr);
+    uint8_t blk =3D xpc->get_block_id(xptr);
=20
-    return xive_nvt_cam_line((pir >> 8) & 0xf, 1 << 7 | (pir & 0x7f));
+    return xive_nvt_cam_line(blk, 1 << 7 | (pir & 0x7f));
 }
=20
 /*
@@ -1347,7 +1349,7 @@ int xive_presenter_tctx_match(XivePresenter *xptr, =
XiveTCTX *tctx,
=20
         /* PHYS ring */
         if ((be32_to_cpu(qw3w2) & TM_QW3W2_VT) &&
-            cam =3D=3D xive_tctx_hw_cam_line(tctx)) {
+            cam =3D=3D xive_tctx_hw_cam_line(xptr, tctx)) {
             return TM_QW3_HV_PHYS;
         }
=20
--=20
2.21.0


