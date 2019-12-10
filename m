Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 458F1118A49
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Dec 2019 15:00:47 +0100 (CET)
Received: from localhost ([::1]:57134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ieg4D-000175-Tk
	for lists+qemu-devel@lfdr.de; Tue, 10 Dec 2019 09:00:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47113)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1ieg2g-00008r-Jt
 for qemu-devel@nongnu.org; Tue, 10 Dec 2019 08:59:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1ieg2f-0002rJ-Mf
 for qemu-devel@nongnu.org; Tue, 10 Dec 2019 08:59:10 -0500
Received: from 2.mo68.mail-out.ovh.net ([46.105.52.162]:52345)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1ieg2f-0002pX-H3
 for qemu-devel@nongnu.org; Tue, 10 Dec 2019 08:59:09 -0500
Received: from player728.ha.ovh.net (unknown [10.108.57.14])
 by mo68.mail-out.ovh.net (Postfix) with ESMTP id 0FFE914E23C
 for <qemu-devel@nongnu.org>; Tue, 10 Dec 2019 14:59:05 +0100 (CET)
Received: from kaod.org (lfbn-1-2229-223.w90-76.abo.wanadoo.fr [90.76.50.223])
 (Authenticated sender: clg@kaod.org)
 by player728.ha.ovh.net (Postfix) with ESMTPSA id D159BD0AC39E;
 Tue, 10 Dec 2019 13:58:59 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: [PATCH 1/2] ppc/pnv: Loop on the whole hierarchy to populate the DT
 with the XSCOM nodes
Date: Tue, 10 Dec 2019 14:58:44 +0100
Message-Id: <20191210135845.19773-2-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191210135845.19773-1-clg@kaod.org>
References: <20191210135845.19773-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 11865014695531875302
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrudelfedgheelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpledtrdejiedrhedtrddvvdefnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejvdekrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghenucevlhhushhtvghrufhiiigvpedt
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 46.105.52.162
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

Some PnvXScomInterface objects lie a bit deeper (PnvPBCQState) than
the first layer, so we need to loop on the whole object hierarchy to
catch them.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/ppc/pnv_xscom.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/hw/ppc/pnv_xscom.c b/hw/ppc/pnv_xscom.c
index bed41840845e..006d87e970d9 100644
--- a/hw/ppc/pnv_xscom.c
+++ b/hw/ppc/pnv_xscom.c
@@ -326,7 +326,12 @@ int pnv_dt_xscom(PnvChip *chip, void *fdt, int root_=
offset)
     args.fdt =3D fdt;
     args.xscom_offset =3D xscom_offset;
=20
-    object_child_foreach(OBJECT(chip), xscom_dt_child, &args);
+    /*
+     * Loop on the whole object hierarchy to catch all
+     * PnvXScomInterface objects which can lie a bit deeper the first
+     * layer.
+     */
+    object_child_foreach_recursive(OBJECT(chip), xscom_dt_child, &args);
     return 0;
 }
=20
--=20
2.21.0


