Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B1E7C4A3
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Jul 2019 16:16:49 +0200 (CEST)
Received: from localhost ([::1]:41230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hspPN-00043P-4H
	for lists+qemu-devel@lfdr.de; Wed, 31 Jul 2019 10:16:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34323)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <clg@kaod.org>) id 1hspMF-0008Hd-ME
 for qemu-devel@nongnu.org; Wed, 31 Jul 2019 10:13:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1hspME-0001xc-2t
 for qemu-devel@nongnu.org; Wed, 31 Jul 2019 10:13:35 -0400
Received: from 8.mo179.mail-out.ovh.net ([46.105.75.26]:34968)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1hspMD-0001wn-TP
 for qemu-devel@nongnu.org; Wed, 31 Jul 2019 10:13:34 -0400
Received: from player715.ha.ovh.net (unknown [10.108.42.184])
 by mo179.mail-out.ovh.net (Postfix) with ESMTP id 9A3DD13D1F1
 for <qemu-devel@nongnu.org>; Wed, 31 Jul 2019 16:13:32 +0200 (CEST)
Received: from kaod.org (lfbn-1-2240-157.w90-76.abo.wanadoo.fr [90.76.60.157])
 (Authenticated sender: clg@kaod.org)
 by player715.ha.ovh.net (Postfix) with ESMTPSA id 25645850B9F7;
 Wed, 31 Jul 2019 14:13:26 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Date: Wed, 31 Jul 2019 16:12:22 +0200
Message-Id: <20190731141233.1340-8-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190731141233.1340-1-clg@kaod.org>
References: <20190731141233.1340-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 11676707936904448998
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduvddrleehgdejvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.75.26
Subject: [Qemu-devel] [PATCH v3 07/18] ppc/xive: Extend the TIMA operation
 with a XivePresenter parameter
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

The TIMA operations are performed on behalf of the XIVE IVPE
sub-engine (Presenter) on the thread interrupt context registers. The
current operations the model supports are simple and do not require
access to the controller but more complex operations we will add will
need access to the controller NVT table and to its configuration.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/ppc/xive.h |  7 +++---
 hw/intc/pnv_xive.c    |  4 +--
 hw/intc/xive.c        | 58 ++++++++++++++++++++++++-------------------
 3 files changed, 38 insertions(+), 31 deletions(-)

diff --git a/include/hw/ppc/xive.h b/include/hw/ppc/xive.h
index 165134ce52a5..ba43a4a129d9 100644
--- a/include/hw/ppc/xive.h
+++ b/include/hw/ppc/xive.h
@@ -464,9 +464,10 @@ typedef struct XiveENDSource {
 #define XIVE_TM_USER_PAGE       0x3
=20
 extern const MemoryRegionOps xive_tm_ops;
-void xive_tctx_tm_write(XiveTCTX *tctx, hwaddr offset, uint64_t value,
-                        unsigned size);
-uint64_t xive_tctx_tm_read(XiveTCTX *tctx, hwaddr offset, unsigned size)=
;
+void xive_tctx_tm_write(XivePresenter *xptr, XiveTCTX *tctx, hwaddr offs=
et,
+                        uint64_t value, unsigned size);
+uint64_t xive_tctx_tm_read(XivePresenter *xptr, XiveTCTX *tctx, hwaddr o=
ffset,
+                           unsigned size);
=20
 void xive_tctx_pic_print_info(XiveTCTX *tctx, Monitor *mon);
 Object *xive_tctx_create(Object *cpu, XiveRouter *xrtr, Error **errp);
diff --git a/hw/intc/pnv_xive.c b/hw/intc/pnv_xive.c
index 183798b81496..6f53a2abbb6a 100644
--- a/hw/intc/pnv_xive.c
+++ b/hw/intc/pnv_xive.c
@@ -1444,7 +1444,7 @@ static void xive_tm_indirect_write(void *opaque, hw=
addr offset,
 {
     XiveTCTX *tctx =3D pnv_xive_get_indirect_tctx(PNV_XIVE(opaque));
=20
-    xive_tctx_tm_write(tctx, offset, value, size);
+    xive_tctx_tm_write(XIVE_PRESENTER(opaque), tctx, offset, value, size=
);
 }
=20
 static uint64_t xive_tm_indirect_read(void *opaque, hwaddr offset,
@@ -1452,7 +1452,7 @@ static uint64_t xive_tm_indirect_read(void *opaque,=
 hwaddr offset,
 {
     XiveTCTX *tctx =3D pnv_xive_get_indirect_tctx(PNV_XIVE(opaque));
=20
-    return xive_tctx_tm_read(tctx, offset, size);
+    return xive_tctx_tm_read(XIVE_PRESENTER(opaque), tctx, offset, size)=
;
 }
=20
 static const MemoryRegionOps xive_tm_indirect_ops =3D {
diff --git a/hw/intc/xive.c b/hw/intc/xive.c
index bec0c878705c..9ca015969143 100644
--- a/hw/intc/xive.c
+++ b/hw/intc/xive.c
@@ -141,19 +141,20 @@ static inline uint32_t xive_tctx_word2(uint8_t *rin=
g)
  * XIVE Thread Interrupt Management Area (TIMA)
  */
=20
-static void xive_tm_set_hv_cppr(XiveTCTX *tctx, hwaddr offset,
-                                uint64_t value, unsigned size)
+static void xive_tm_set_hv_cppr(XivePresenter *xptr, XiveTCTX *tctx,
+                                hwaddr offset, uint64_t value, unsigned =
size)
 {
     xive_tctx_set_cppr(tctx, TM_QW3_HV_PHYS, value & 0xff);
 }
=20
-static uint64_t xive_tm_ack_hv_reg(XiveTCTX *tctx, hwaddr offset, unsign=
ed size)
+static uint64_t xive_tm_ack_hv_reg(XivePresenter *xptr, XiveTCTX *tctx,
+                                   hwaddr offset, unsigned size)
 {
     return xive_tctx_accept(tctx, TM_QW3_HV_PHYS);
 }
=20
-static uint64_t xive_tm_pull_pool_ctx(XiveTCTX *tctx, hwaddr offset,
-                                      unsigned size)
+static uint64_t xive_tm_pull_pool_ctx(XivePresenter *xptr, XiveTCTX *tct=
x,
+                                      hwaddr offset, unsigned size)
 {
     uint32_t qw2w2_prev =3D xive_tctx_word2(&tctx->regs[TM_QW2_HV_POOL])=
;
     uint32_t qw2w2;
@@ -163,13 +164,14 @@ static uint64_t xive_tm_pull_pool_ctx(XiveTCTX *tct=
x, hwaddr offset,
     return qw2w2;
 }
=20
-static void xive_tm_vt_push(XiveTCTX *tctx, hwaddr offset,
+static void xive_tm_vt_push(XivePresenter *xptr, XiveTCTX *tctx, hwaddr =
offset,
                             uint64_t value, unsigned size)
 {
     tctx->regs[TM_QW3_HV_PHYS + TM_WORD2] =3D value & 0xff;
 }
=20
-static uint64_t xive_tm_vt_poll(XiveTCTX *tctx, hwaddr offset, unsigned =
size)
+static uint64_t xive_tm_vt_poll(XivePresenter *xptr, XiveTCTX *tctx,
+                                hwaddr offset, unsigned size)
 {
     return tctx->regs[TM_QW3_HV_PHYS + TM_WORD2] & 0xff;
 }
@@ -312,13 +314,14 @@ static uint64_t xive_tm_raw_read(XiveTCTX *tctx, hw=
addr offset, unsigned size)
  * state changes (side effects) in addition to setting/returning the
  * interrupt management area context of the processor thread.
  */
-static uint64_t xive_tm_ack_os_reg(XiveTCTX *tctx, hwaddr offset, unsign=
ed size)
+static uint64_t xive_tm_ack_os_reg(XivePresenter *xptr, XiveTCTX *tctx,
+                                   hwaddr offset, unsigned size)
 {
     return xive_tctx_accept(tctx, TM_QW1_OS);
 }
=20
-static void xive_tm_set_os_cppr(XiveTCTX *tctx, hwaddr offset,
-                                uint64_t value, unsigned size)
+static void xive_tm_set_os_cppr(XivePresenter *xptr, XiveTCTX *tctx,
+                                hwaddr offset, uint64_t value, unsigned =
size)
 {
     xive_tctx_set_cppr(tctx, TM_QW1_OS, value & 0xff);
 }
@@ -327,15 +330,15 @@ static void xive_tm_set_os_cppr(XiveTCTX *tctx, hwa=
ddr offset,
  * Adjust the IPB to allow a CPU to process event queues of other
  * priorities during one physical interrupt cycle.
  */
-static void xive_tm_set_os_pending(XiveTCTX *tctx, hwaddr offset,
-                                   uint64_t value, unsigned size)
+static void xive_tm_set_os_pending(XivePresenter *xptr, XiveTCTX *tctx,
+                                   hwaddr offset, uint64_t value, unsign=
ed size)
 {
     ipb_update(&tctx->regs[TM_QW1_OS], value & 0xff);
     xive_tctx_notify(tctx, TM_QW1_OS);
 }
=20
-static uint64_t xive_tm_pull_os_ctx(XiveTCTX *tctx, hwaddr offset,
-                                    unsigned size)
+static uint64_t xive_tm_pull_os_ctx(XivePresenter *xptr, XiveTCTX *tctx,
+                                    hwaddr offset, unsigned size)
 {
     uint32_t qw1w2_prev =3D xive_tctx_word2(&tctx->regs[TM_QW1_OS]);
     uint32_t qw1w2;
@@ -353,9 +356,11 @@ typedef struct XiveTmOp {
     uint8_t  page_offset;
     uint32_t op_offset;
     unsigned size;
-    void     (*write_handler)(XiveTCTX *tctx, hwaddr offset, uint64_t va=
lue,
-                              unsigned size);
-    uint64_t (*read_handler)(XiveTCTX *tctx, hwaddr offset, unsigned siz=
e);
+    void     (*write_handler)(XivePresenter *xptr, XiveTCTX *tctx,
+                              hwaddr offset,
+                              uint64_t value, unsigned size);
+    uint64_t (*read_handler)(XivePresenter *xptr, XiveTCTX *tctx, hwaddr=
 offset,
+                             unsigned size);
 } XiveTmOp;
=20
 static const XiveTmOp xive_tm_operations[] =3D {
@@ -401,8 +406,8 @@ static const XiveTmOp *xive_tm_find_op(hwaddr offset,=
 unsigned size, bool write)
 /*
  * TIMA MMIO handlers
  */
-void xive_tctx_tm_write(XiveTCTX *tctx, hwaddr offset, uint64_t value,
-                        unsigned size)
+void xive_tctx_tm_write(XivePresenter *xptr, XiveTCTX *tctx, hwaddr offs=
et,
+                        uint64_t value, unsigned size)
 {
     const XiveTmOp *xto;
=20
@@ -419,7 +424,7 @@ void xive_tctx_tm_write(XiveTCTX *tctx, hwaddr offset=
, uint64_t value,
             qemu_log_mask(LOG_GUEST_ERROR, "XIVE: invalid write access a=
t TIMA "
                           "@%"HWADDR_PRIx"\n", offset);
         } else {
-            xto->write_handler(tctx, offset, value, size);
+            xto->write_handler(xptr, tctx, offset, value, size);
         }
         return;
     }
@@ -429,7 +434,7 @@ void xive_tctx_tm_write(XiveTCTX *tctx, hwaddr offset=
, uint64_t value,
      */
     xto =3D xive_tm_find_op(offset, size, true);
     if (xto) {
-        xto->write_handler(tctx, offset, value, size);
+        xto->write_handler(xptr, tctx, offset, value, size);
         return;
     }
=20
@@ -439,7 +444,8 @@ void xive_tctx_tm_write(XiveTCTX *tctx, hwaddr offset=
, uint64_t value,
     xive_tm_raw_write(tctx, offset, value, size);
 }
=20
-uint64_t xive_tctx_tm_read(XiveTCTX *tctx, hwaddr offset, unsigned size)
+uint64_t xive_tctx_tm_read(XivePresenter *xptr, XiveTCTX *tctx, hwaddr o=
ffset,
+                           unsigned size)
 {
     const XiveTmOp *xto;
=20
@@ -457,7 +463,7 @@ uint64_t xive_tctx_tm_read(XiveTCTX *tctx, hwaddr off=
set, unsigned size)
                           "@%"HWADDR_PRIx"\n", offset);
             return -1;
         }
-        return xto->read_handler(tctx, offset, size);
+        return xto->read_handler(xptr, tctx, offset, size);
     }
=20
     /*
@@ -465,7 +471,7 @@ uint64_t xive_tctx_tm_read(XiveTCTX *tctx, hwaddr off=
set, unsigned size)
      */
     xto =3D xive_tm_find_op(offset, size, false);
     if (xto) {
-        return xto->read_handler(tctx, offset, size);
+        return xto->read_handler(xptr, tctx, offset, size);
     }
=20
     /*
@@ -479,14 +485,14 @@ static void xive_tm_write(void *opaque, hwaddr offs=
et,
 {
     XiveTCTX *tctx =3D xive_router_get_tctx(XIVE_ROUTER(opaque), current=
_cpu);
=20
-    xive_tctx_tm_write(tctx, offset, value, size);
+    xive_tctx_tm_write(XIVE_PRESENTER(opaque), tctx, offset, value, size=
);
 }
=20
 static uint64_t xive_tm_read(void *opaque, hwaddr offset, unsigned size)
 {
     XiveTCTX *tctx =3D xive_router_get_tctx(XIVE_ROUTER(opaque), current=
_cpu);
=20
-    return xive_tctx_tm_read(tctx, offset, size);
+    return xive_tctx_tm_read(XIVE_PRESENTER(opaque), tctx, offset, size)=
;
 }
=20
 const MemoryRegionOps xive_tm_ops =3D {
--=20
2.21.0


