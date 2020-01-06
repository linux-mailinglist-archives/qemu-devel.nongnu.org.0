Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF8A1314D3
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jan 2020 16:32:06 +0100 (CET)
Received: from localhost ([::1]:53578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ioUMN-0003eO-HQ
	for lists+qemu-devel@lfdr.de; Mon, 06 Jan 2020 10:32:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49617)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1ioTot-0000gm-K4
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 09:57:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1ioTos-0000px-FJ
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 09:57:27 -0500
Received: from 10.mo177.mail-out.ovh.net ([46.105.73.133]:49494)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1ioTos-0000o9-8t
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 09:57:26 -0500
Received: from player731.ha.ovh.net (unknown [10.109.143.136])
 by mo177.mail-out.ovh.net (Postfix) with ESMTP id 2457911D0E6
 for <qemu-devel@nongnu.org>; Mon,  6 Jan 2020 15:57:24 +0100 (CET)
Received: from kaod.org (deibp9eh1--blueice1n4.emea.ibm.com [195.212.29.166])
 (Authenticated sender: clg@kaod.org)
 by player731.ha.ovh.net (Postfix) with ESMTPSA id F1A87DB3A677;
 Mon,  6 Jan 2020 14:57:17 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: [PATCH v3 05/12] xive: Use the XIVE fabric link under the XIVE router
Date: Mon,  6 Jan 2020 15:56:38 +0100
Message-Id: <20200106145645.4539-6-clg@kaod.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200106145645.4539-1-clg@kaod.org>
References: <20200106145645.4539-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 5391934658024213478
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrvdehtddgjeduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpudelhedrvdduvddrvdelrdduieeinecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejfedurdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghenucevlhhushhtvghrufhiiigvpedu
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 46.105.73.133
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
2.21.1


