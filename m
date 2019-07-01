Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13ED742C2D
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jun 2019 18:27:33 +0200 (CEST)
Received: from localhost ([::1]:33678 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hb65z-0007O6-Pn
	for lists+qemu-devel@lfdr.de; Wed, 12 Jun 2019 12:27:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51351)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <clg@kaod.org>) id 1hb62m-00060b-4R
 for qemu-devel@nongnu.org; Wed, 12 Jun 2019 12:24:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1hb62l-0007ZQ-6p
 for qemu-devel@nongnu.org; Wed, 12 Jun 2019 12:24:12 -0400
Received: from 9.mo173.mail-out.ovh.net ([46.105.72.44]:46209)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1hb62l-0007Wu-00
 for qemu-devel@nongnu.org; Wed, 12 Jun 2019 12:24:11 -0400
Received: from player691.ha.ovh.net (unknown [10.108.42.142])
 by mo173.mail-out.ovh.net (Postfix) with ESMTP id 17E1710D825
 for <qemu-devel@nongnu.org>; Wed, 12 Jun 2019 18:24:07 +0200 (CEST)
Received: from kaod.org (lfbn-1-10649-41.w90-89.abo.wanadoo.fr [90.89.235.41])
 (Authenticated sender: clg@kaod.org)
 by player691.ha.ovh.net (Postfix) with ESMTPSA id 044B36DB934D;
 Wed, 12 Jun 2019 16:24:02 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Date: Wed, 12 Jun 2019 18:23:57 +0200
Message-Id: <20190612162357.29566-1-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 2821223695458733030
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduuddrudehjedguddthecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.72.44
Subject: [Qemu-devel] [PATCH] ppc/pnv: fix StoreEOI activation
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The firmware (skiboot) of the PowerNV machines can configure the XIVE
interrupt controller to activate StoreEOI on the ESB pages of the
interrupts. This feature lets software do an EOI with a store instead
of a load. It is not activated today on P9 for rare race condition
issues but it should be on future processors.

Nevertheless, QEMU has a model for StoreEOI which can be used today by
experimental firmwares. But, the use of object_property_set_int() in
the PnvXive model is incorrect and crashes QEMU. Replace it with a
direct access to the ESB flags of the XiveSource object modeling the
internal sources of the interrupt controller.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/intc/pnv_xive.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/intc/pnv_xive.c b/hw/intc/pnv_xive.c
index bb0877cbdf3b..12c91adcd27e 100644
--- a/hw/intc/pnv_xive.c
+++ b/hw/intc/pnv_xive.c
@@ -780,8 +780,7 @@ static void pnv_xive_ic_reg_write(void *opaque, hwadd=
r offset,
          * support recently though)
          */
         if (val & (VC_SBC_CONF_CPLX_CIST | VC_SBC_CONF_CIST_BOTH)) {
-            object_property_set_int(OBJECT(&xive->ipi_source),
-                                    XIVE_SRC_STORE_EOI, "flags", &error_=
fatal);
+            xive->ipi_source.esb_flags |=3D XIVE_SRC_STORE_EOI;
         }
         break;
=20
--=20
2.21.0


