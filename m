Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 119BB1088F7
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Nov 2019 08:06:09 +0100 (CET)
Received: from localhost ([::1]:40802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iZ8Rj-000851-LD
	for lists+qemu-devel@lfdr.de; Mon, 25 Nov 2019 02:06:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41479)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iZ8Kg-0001xg-1r
 for qemu-devel@nongnu.org; Mon, 25 Nov 2019 01:58:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iZ8Ke-0001Bo-JB
 for qemu-devel@nongnu.org; Mon, 25 Nov 2019 01:58:49 -0500
Received: from 17.mo3.mail-out.ovh.net ([87.98.178.58]:49855)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iZ8Ke-00015y-CH
 for qemu-devel@nongnu.org; Mon, 25 Nov 2019 01:58:48 -0500
Received: from player697.ha.ovh.net (unknown [10.108.54.141])
 by mo3.mail-out.ovh.net (Postfix) with ESMTP id C8CBA233534
 for <qemu-devel@nongnu.org>; Mon, 25 Nov 2019 07:58:38 +0100 (CET)
Received: from kaod.org (lfbn-1-2229-223.w90-76.abo.wanadoo.fr [90.76.50.223])
 (Authenticated sender: clg@kaod.org)
 by player697.ha.ovh.net (Postfix) with ESMTPSA id D84C6C809409;
 Mon, 25 Nov 2019 06:58:31 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: [PATCH v6 01/20] ppc/xive: Introduce a XivePresenter interface
Date: Mon, 25 Nov 2019 07:58:01 +0100
Message-Id: <20191125065820.927-2-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191125065820.927-1-clg@kaod.org>
References: <20191125065820.927-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 8907557115116489702
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrudeitddggeduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdqfffguegfifdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpledtrdejiedrhedtrddvvdefnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrheileejrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghenucevlhhushhtvghrufhiiigvpedt
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 87.98.178.58
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

When the XIVE IVRE sub-engine (XiveRouter) looks for a Notification
Virtual Target (NVT) to notify, it broadcasts a message on the
PowerBUS to find an XIVE IVPE sub-engine (Presenter) with the NVT
dispatched on one of its HW threads, and then forwards the
notification if any response was received.

The current XIVE presenter model is sufficient for the pseries machine
because it has a single interrupt controller device, but the PowerNV
machine can have multiple chips each having its own interrupt
controller. In this case, the XIVE presenter model is too simple and
the CAM line matching should scan all chips of the system.

To start fixing this issue, we first extend the XIVE Router model with
a new XivePresenter QOM interface representing the XIVE IVPE
sub-engine. This interface exposes a 'match_nvt' handler which the
sPAPR and PowerNV XIVE Router models will need to implement to perform
the CAM line matching.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Greg Kurz <groug@kaod.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/ppc/xive.h | 32 ++++++++++++++++++++++++++++++++
 hw/intc/xive.c        | 26 +++++++++++++++++---------
 2 files changed, 49 insertions(+), 9 deletions(-)

diff --git a/include/hw/ppc/xive.h b/include/hw/ppc/xive.h
index fa7adf87feb2..f9aa0fa0dac3 100644
--- a/include/hw/ppc/xive.h
+++ b/include/hw/ppc/xive.h
@@ -367,6 +367,38 @@ int xive_router_write_nvt(XiveRouter *xrtr, uint8_t =
nvt_blk, uint32_t nvt_idx,
 XiveTCTX *xive_router_get_tctx(XiveRouter *xrtr, CPUState *cs);
 void xive_router_notify(XiveNotifier *xn, uint32_t lisn);
=20
+/*
+ * XIVE Presenter
+ */
+
+typedef struct XiveTCTXMatch {
+    XiveTCTX *tctx;
+    uint8_t ring;
+} XiveTCTXMatch;
+
+typedef struct XivePresenter XivePresenter;
+
+#define TYPE_XIVE_PRESENTER "xive-presenter"
+#define XIVE_PRESENTER(obj)                                     \
+    INTERFACE_CHECK(XivePresenter, (obj), TYPE_XIVE_PRESENTER)
+#define XIVE_PRESENTER_CLASS(klass)                                     =
\
+    OBJECT_CLASS_CHECK(XivePresenterClass, (klass), TYPE_XIVE_PRESENTER)
+#define XIVE_PRESENTER_GET_CLASS(obj)                                   =
\
+    OBJECT_GET_CLASS(XivePresenterClass, (obj), TYPE_XIVE_PRESENTER)
+
+typedef struct XivePresenterClass {
+    InterfaceClass parent;
+    int (*match_nvt)(XivePresenter *xptr, uint8_t format,
+                     uint8_t nvt_blk, uint32_t nvt_idx,
+                     bool cam_ignore, uint8_t priority,
+                     uint32_t logic_serv, XiveTCTXMatch *match);
+} XivePresenterClass;
+
+int xive_presenter_tctx_match(XivePresenter *xptr, XiveTCTX *tctx,
+                              uint8_t format,
+                              uint8_t nvt_blk, uint32_t nvt_idx,
+                              bool cam_ignore, uint32_t logic_serv);
+
 /*
  * XIVE END ESBs
  */
diff --git a/hw/intc/xive.c b/hw/intc/xive.c
index 511e1a936347..344bb3f3bc4b 100644
--- a/hw/intc/xive.c
+++ b/hw/intc/xive.c
@@ -1363,9 +1363,10 @@ static uint32_t xive_tctx_hw_cam_line(XiveTCTX *tc=
tx)
 /*
  * The thread context register words are in big-endian format.
  */
-static int xive_presenter_tctx_match(XiveTCTX *tctx, uint8_t format,
-                                     uint8_t nvt_blk, uint32_t nvt_idx,
-                                     bool cam_ignore, uint32_t logic_ser=
v)
+int xive_presenter_tctx_match(XivePresenter *xptr, XiveTCTX *tctx,
+                              uint8_t format,
+                              uint8_t nvt_blk, uint32_t nvt_idx,
+                              bool cam_ignore, uint32_t logic_serv)
 {
     uint32_t cam =3D xive_nvt_cam_line(nvt_blk, nvt_idx);
     uint32_t qw3w2 =3D xive_tctx_word2(&tctx->regs[TM_QW3_HV_PHYS]);
@@ -1422,11 +1423,6 @@ static int xive_presenter_tctx_match(XiveTCTX *tct=
x, uint8_t format,
     return -1;
 }
=20
-typedef struct XiveTCTXMatch {
-    XiveTCTX *tctx;
-    uint8_t ring;
-} XiveTCTXMatch;
-
 static bool xive_presenter_match(XiveRouter *xrtr, uint8_t format,
                                  uint8_t nvt_blk, uint32_t nvt_idx,
                                  bool cam_ignore, uint8_t priority,
@@ -1460,7 +1456,8 @@ static bool xive_presenter_match(XiveRouter *xrtr, =
uint8_t format,
          * Check the thread context CAM lines and record matches. We
          * will handle CPU exception delivery later
          */
-        ring =3D xive_presenter_tctx_match(tctx, format, nvt_blk, nvt_id=
x,
+        ring =3D xive_presenter_tctx_match(XIVE_PRESENTER(xrtr), tctx, f=
ormat,
+                                         nvt_blk, nvt_idx,
                                          cam_ignore, logic_serv);
         /*
          * Save the context and follow on to catch duplicates, that we
@@ -1754,6 +1751,7 @@ static const TypeInfo xive_router_info =3D {
     .class_init    =3D xive_router_class_init,
     .interfaces    =3D (InterfaceInfo[]) {
         { TYPE_XIVE_NOTIFIER },
+        { TYPE_XIVE_PRESENTER },
         { }
     }
 };
@@ -1923,10 +1921,20 @@ static const TypeInfo xive_notifier_info =3D {
     .class_size =3D sizeof(XiveNotifierClass),
 };
=20
+/*
+ * XIVE Presenter
+ */
+static const TypeInfo xive_presenter_info =3D {
+    .name =3D TYPE_XIVE_PRESENTER,
+    .parent =3D TYPE_INTERFACE,
+    .class_size =3D sizeof(XivePresenterClass),
+};
+
 static void xive_register_types(void)
 {
     type_register_static(&xive_source_info);
     type_register_static(&xive_notifier_info);
+    type_register_static(&xive_presenter_info);
     type_register_static(&xive_router_info);
     type_register_static(&xive_end_source_info);
     type_register_static(&xive_tctx_info);
--=20
2.21.0


