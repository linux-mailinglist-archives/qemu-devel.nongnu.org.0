Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 070B5FE307
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Nov 2019 17:43:15 +0100 (CET)
Received: from localhost ([::1]:41710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iVegi-00023H-6x
	for lists+qemu-devel@lfdr.de; Fri, 15 Nov 2019 11:43:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52470)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iVeQI-0000rp-OR
 for qemu-devel@nongnu.org; Fri, 15 Nov 2019 11:26:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iVeQH-00016z-Fa
 for qemu-devel@nongnu.org; Fri, 15 Nov 2019 11:26:14 -0500
Received: from 6.mo1.mail-out.ovh.net ([46.105.43.205]:57991)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iVeQH-00016N-9d
 for qemu-devel@nongnu.org; Fri, 15 Nov 2019 11:26:13 -0500
Received: from player787.ha.ovh.net (unknown [10.108.54.97])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id BDE3A1962CE
 for <qemu-devel@nongnu.org>; Fri, 15 Nov 2019 17:26:11 +0100 (CET)
Received: from kaod.org (lfbn-1-2229-223.w90-76.abo.wanadoo.fr [90.76.50.223])
 (Authenticated sender: clg@kaod.org)
 by player787.ha.ovh.net (Postfix) with ESMTPSA id 51AF5C444C6B;
 Fri, 15 Nov 2019 16:26:06 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: [PATCH for-5.0 v5 15/23] ppc/xive: Use the XiveFabric and
 XivePresenter interfaces
Date: Fri, 15 Nov 2019 17:24:28 +0100
Message-Id: <20191115162436.30548-16-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191115162436.30548-1-clg@kaod.org>
References: <20191115162436.30548-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 15105917575338298342
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrudefhedgkeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdqfffguegfifdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpledtrdejiedrhedtrddvvdefnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejkeejrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghenucevlhhushhtvghrufhiiigvpedv
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 46.105.43.205
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

Now that the machines have handlers implementing the XiveFabric and
XivePresenter interfaces, remove xive_presenter_match() and make use
of the 'match_nvt' handler of the machine.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/intc/xive.c | 48 +++++++++++++++++-------------------------------
 1 file changed, 17 insertions(+), 31 deletions(-)

diff --git a/hw/intc/xive.c b/hw/intc/xive.c
index 1c9e58f8deac..ab62bda85788 100644
--- a/hw/intc/xive.c
+++ b/hw/intc/xive.c
@@ -1423,30 +1423,6 @@ int xive_presenter_tctx_match(XivePresenter *xptr,=
 XiveTCTX *tctx,
     return -1;
 }
=20
-static bool xive_presenter_match(XiveRouter *xrtr, uint8_t format,
-                                 uint8_t nvt_blk, uint32_t nvt_idx,
-                                 bool cam_ignore, uint8_t priority,
-                                 uint32_t logic_serv, XiveTCTXMatch *mat=
ch)
-{
-    XivePresenter *xptr =3D XIVE_PRESENTER(xrtr);
-    XivePresenterClass *xpc =3D XIVE_PRESENTER_GET_CLASS(xptr);
-    int count;
-
-    count =3D xpc->match_nvt(xptr, format, nvt_blk, nvt_idx, cam_ignore,
-                           priority, logic_serv, match);
-    if (count < 0) {
-        return false;
-    }
-
-    if (!match->tctx) {
-        qemu_log_mask(LOG_UNIMP, "XIVE: NVT %x/%x is not dispatched\n",
-                      nvt_blk, nvt_idx);
-        return false;
-    }
-
-    return true;
-}
-
 /*
  * This is our simple Xive Presenter Engine model. It is merged in the
  * Router as it does not require an extra object.
@@ -1462,22 +1438,32 @@ static bool xive_presenter_match(XiveRouter *xrtr=
, uint8_t format,
  *
  * The parameters represent what is sent on the PowerBus
  */
-static bool xive_presenter_notify(XiveRouter *xrtr, uint8_t format,
+static bool xive_presenter_notify(uint8_t format,
                                   uint8_t nvt_blk, uint32_t nvt_idx,
                                   bool cam_ignore, uint8_t priority,
                                   uint32_t logic_serv)
 {
+    XiveFabric *xfb =3D XIVE_FABRIC(qdev_get_machine());
+    XiveFabricClass *xfc =3D XIVE_FABRIC_GET_CLASS(xfb);
     XiveTCTXMatch match =3D { .tctx =3D NULL, .ring =3D 0 };
-    bool found;
+    int count;
=20
-    found =3D xive_presenter_match(xrtr, format, nvt_blk, nvt_idx, cam_i=
gnore,
-                                 priority, logic_serv, &match);
-    if (found) {
+    /*
+     * Ask the machine to scan the interrupt controllers for a match
+     */
+    count =3D xfc->match_nvt(xfb, format, nvt_blk, nvt_idx, cam_ignore,
+                           priority, logic_serv, &match);
+    if (count < 0) {
+        return false;
+    }
+
+    /* handle CPU exception delivery */
+    if (count) {
         ipb_update(&match.tctx->regs[match.ring], priority);
         xive_tctx_notify(match.tctx, match.ring);
     }
=20
-    return found;
+    return count;
 }
=20
 /*
@@ -1590,7 +1576,7 @@ static void xive_router_end_notify(XiveRouter *xrtr=
, uint8_t end_blk,
         return;
     }
=20
-    found =3D xive_presenter_notify(xrtr, format, nvt_blk, nvt_idx,
+    found =3D xive_presenter_notify(format, nvt_blk, nvt_idx,
                           xive_get_field32(END_W7_F0_IGNORE, end.w7),
                           priority,
                           xive_get_field32(END_W7_F1_LOG_SERVER_ID, end.=
w7));
--=20
2.21.0


