Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF3B5B1A7
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Jun 2019 22:49:10 +0200 (CEST)
Received: from localhost ([::1]:46452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hhgl3-0001X5-TO
	for lists+qemu-devel@lfdr.de; Sun, 30 Jun 2019 16:49:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35882)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <clg@kaod.org>) id 1hhgiS-0008Eh-LY
 for qemu-devel@nongnu.org; Sun, 30 Jun 2019 16:46:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1hhgiR-0001sj-IA
 for qemu-devel@nongnu.org; Sun, 30 Jun 2019 16:46:28 -0400
Received: from 5.mo68.mail-out.ovh.net ([46.105.62.179]:49846)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1hhgiR-0001ns-BF
 for qemu-devel@nongnu.org; Sun, 30 Jun 2019 16:46:27 -0400
Received: from player157.ha.ovh.net (unknown [10.108.57.153])
 by mo68.mail-out.ovh.net (Postfix) with ESMTP id 7B6161358FE
 for <qemu-devel@nongnu.org>; Sun, 30 Jun 2019 22:46:21 +0200 (CEST)
Received: from kaod.org (lfbn-1-2240-157.w90-76.abo.wanadoo.fr [90.76.60.157])
 (Authenticated sender: clg@kaod.org)
 by player157.ha.ovh.net (Postfix) with ESMTPSA id 38D7E7575A22;
 Sun, 30 Jun 2019 20:46:14 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Date: Sun, 30 Jun 2019 22:45:52 +0200
Message-Id: <20190630204601.30574-2-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190630204601.30574-1-clg@kaod.org>
References: <20190630204601.30574-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 2277976986789776358
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduvddrvdeggdduheegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.62.179
Subject: [Qemu-devel] [PATCH 01/10] ppc/xive: Force the Physical CAM line
 value to group mode
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
 Greg Kurz <groug@kaod.org>, Suraj Jitindar Singh <sjitindarsingh@gmail.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When an interrupt needs to be delivered, the XIVE interrupt controller
presenter scans the CAM lines of the thread interrupt contexts of the
HW threads of the chip to find a matching vCPU. The interrupt context
is composed of 4 different sets of registers: Physical, HV, OS and
User.

The encoding of the Physical CAM line depends on the mode in which the
interrupt controller is operating: CAM mode or block group mode.
Block group mode being the default configuration today on POWER9 and
the only one available on the next POWER10 generation, enforce this
encoding in the Physical CAM line :

    chip << 19 | 0000000 0 0001 thread (7Bit)

It fits the overall encoding of the NVT ids and simplifies the matching
algorithm in the presenter.

Fixes: d514c48d41fb ("ppc/xive: hardwire the Physical CAM line of the thr=
ead context")
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/intc/xive.c | 21 +++++----------------
 1 file changed, 5 insertions(+), 16 deletions(-)

diff --git a/hw/intc/xive.c b/hw/intc/xive.c
index 6250c0414de8..3b1f9520ae9f 100644
--- a/hw/intc/xive.c
+++ b/hw/intc/xive.c
@@ -1229,27 +1229,16 @@ XiveTCTX *xive_router_get_tctx(XiveRouter *xrtr, =
CPUState *cs)
 }
=20
 /*
- * By default on P9, the HW CAM line (23bits) is hardwired to :
+ * Encode the HW CAM line in the block group mode format :
  *
- *   0x000||0b1||4Bit chip number||7Bit Thread number.
- *
- * When the block grouping is enabled, the CAM line is changed to :
- *
- *   4Bit chip number||0x001||7Bit Thread number.
+ *   chip << 19 | 0000000 0 0001 thread (7Bit)
  */
-static uint32_t hw_cam_line(uint8_t chip_id, uint8_t tid)
-{
-    return 1 << 11 | (chip_id & 0xf) << 7 | (tid & 0x7f);
-}
-
-static bool xive_presenter_tctx_match_hw(XiveTCTX *tctx,
-                                         uint8_t nvt_blk, uint32_t nvt_i=
dx)
+static uint32_t xive_tctx_hw_cam_line(XiveTCTX *tctx)
 {
     CPUPPCState *env =3D &POWERPC_CPU(tctx->cs)->env;
     uint32_t pir =3D env->spr_cb[SPR_PIR].default_value;
=20
-    return hw_cam_line((pir >> 8) & 0xf, pir & 0x7f) =3D=3D
-        hw_cam_line(nvt_blk, nvt_idx);
+    return xive_nvt_cam_line((pir >> 8) & 0xf, 1 << 7 | (pir & 0x7f));
 }
=20
 /*
@@ -1285,7 +1274,7 @@ static int xive_presenter_tctx_match(XiveTCTX *tctx=
, uint8_t format,
=20
         /* PHYS ring */
         if ((be32_to_cpu(qw3w2) & TM_QW3W2_VT) &&
-            xive_presenter_tctx_match_hw(tctx, nvt_blk, nvt_idx)) {
+            cam =3D=3D xive_tctx_hw_cam_line(tctx)) {
             return TM_QW3_HV_PHYS;
         }
=20
--=20
2.21.0


