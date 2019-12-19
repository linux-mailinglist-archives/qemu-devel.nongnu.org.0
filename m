Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F06FD1268DE
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Dec 2019 19:22:44 +0100 (CET)
Received: from localhost ([::1]:46324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ii0Rf-00034w-PB
	for lists+qemu-devel@lfdr.de; Thu, 19 Dec 2019 13:22:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42021)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1ii0IB-0000vM-LD
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 13:12:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1ii0IA-0005EL-EI
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 13:12:55 -0500
Received: from 8.mo173.mail-out.ovh.net ([46.105.46.122]:55382)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1ii0IA-00057M-6O
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 13:12:54 -0500
Received: from player734.ha.ovh.net (unknown [10.108.1.121])
 by mo173.mail-out.ovh.net (Postfix) with ESMTP id 989CD1225FF
 for <qemu-devel@nongnu.org>; Thu, 19 Dec 2019 19:12:52 +0100 (CET)
Received: from kaod.org (lfbn-tou-1-1227-223.w90-76.abo.wanadoo.fr
 [90.76.50.223]) (Authenticated sender: clg@kaod.org)
 by player734.ha.ovh.net (Postfix) with ESMTPSA id B8384D6D63C4;
 Thu, 19 Dec 2019 18:12:46 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: [PATCH v2 08/13] xive: Use the XIVE fabric link under the XIVE router
Date: Thu, 19 Dec 2019 19:11:50 +0100
Message-Id: <20191219181155.32530-9-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191219181155.32530-1-clg@kaod.org>
References: <20191219181155.32530-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 13665047171326970854
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrvdduuddguddtkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecukfhppedtrddtrddtrddtpdeltddrjeeirdehtddrvddvfeenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeefgedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgnecuvehluhhsthgvrhfuihiivgepfe
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 46.105.46.122
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

From: Greg Kurz <groug@kaod.org>

Now that the spapr and pnv machines do set the "xive-fabric" link, the
use of the XIVE fabric pointer becomes mandatory. This is checked with
an assert() in a new realize hook. Since the XIVE router is realized at
machine init for the all the machine's life time, no risk to abort an
already running guest (ie. not a hotplug path).

This gets rid of a qdev_get_machine() call.

Signed-off-by: Greg Kurz <groug@kaod.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/intc/xive.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/hw/intc/xive.c b/hw/intc/xive.c
index 6df89b06da38..12a362b681a6 100644
--- a/hw/intc/xive.c
+++ b/hw/intc/xive.c
@@ -1378,6 +1378,13 @@ static int xive_router_get_block_id(XiveRouter *xr=
tr)
    return xrc->get_block_id(xrtr);
 }
=20
+static void xive_router_realize(DeviceState *dev, Error **errp)
+{
+    XiveRouter *xrtr =3D XIVE_ROUTER(dev);
+
+    assert(xrtr->xfb);
+}
+
 /*
  * Encode the HW CAM line in the block group mode format :
  *
@@ -1470,12 +1477,11 @@ int xive_presenter_tctx_match(XivePresenter *xptr=
, XiveTCTX *tctx,
  *
  * The parameters represent what is sent on the PowerBus
  */
-static bool xive_presenter_notify(uint8_t format,
+static bool xive_presenter_notify(XiveFabric *xfb, uint8_t format,
                                   uint8_t nvt_blk, uint32_t nvt_idx,
                                   bool cam_ignore, uint8_t priority,
                                   uint32_t logic_serv)
 {
-    XiveFabric *xfb =3D XIVE_FABRIC(qdev_get_machine());
     XiveFabricClass *xfc =3D XIVE_FABRIC_GET_CLASS(xfb);
     XiveTCTXMatch match =3D { .tctx =3D NULL, .ring =3D 0 };
     int count;
@@ -1607,7 +1613,7 @@ static void xive_router_end_notify(XiveRouter *xrtr=
, uint8_t end_blk,
         return;
     }
=20
-    found =3D xive_presenter_notify(format, nvt_blk, nvt_idx,
+    found =3D xive_presenter_notify(xrtr->xfb, format, nvt_blk, nvt_idx,
                           xive_get_field32(END_W7_F0_IGNORE, end.w7),
                           priority,
                           xive_get_field32(END_W7_F1_LOG_SERVER_ID, end.=
w7));
@@ -1727,6 +1733,8 @@ static void xive_router_class_init(ObjectClass *kla=
ss, void *data)
=20
     dc->desc    =3D "XIVE Router Engine";
     dc->props   =3D xive_router_properties;
+    /* Parent is SysBusDeviceClass. No need to call its realize hook */
+    dc->realize =3D xive_router_realize;
     xnc->notify =3D xive_router_notify;
 }
=20
--=20
2.21.0


