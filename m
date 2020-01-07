Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B1C9132CE4
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jan 2020 18:22:53 +0100 (CET)
Received: from localhost ([::1]:53870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iosZA-0000MO-2h
	for lists+qemu-devel@lfdr.de; Tue, 07 Jan 2020 12:22:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52879)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iosUr-0002ae-MV
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 12:18:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iosUq-0006Wn-H3
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 12:18:25 -0500
Received: from 9.mo179.mail-out.ovh.net ([46.105.76.148]:37961)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iosUq-0006UU-2I
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 12:18:24 -0500
Received: from player798.ha.ovh.net (unknown [10.108.1.15])
 by mo179.mail-out.ovh.net (Postfix) with ESMTP id 5290F15343B
 for <qemu-devel@nongnu.org>; Tue,  7 Jan 2020 18:18:21 +0100 (CET)
Received: from kaod.org (lfbn-tou-1-1227-223.w90-76.abo.wanadoo.fr
 [90.76.50.223]) (Authenticated sender: clg@kaod.org)
 by player798.ha.ovh.net (Postfix) with ESMTPSA id 62253E1076CB;
 Tue,  7 Jan 2020 17:18:16 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: [PATCH 1/2] ppc/pnv: check return value of blk_pwrite()
Date: Tue,  7 Jan 2020 18:18:08 +0100
Message-Id: <20200107171809.15556-2-clg@kaod.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200107171809.15556-1-clg@kaod.org>
References: <20200107171809.15556-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 13645062448371633126
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrvdehhedgtdeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpledtrdejiedrhedtrddvvdefnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejleekrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghenucevlhhushhtvghrufhiiigvpedt
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 46.105.76.148
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

When updating the PNOR file contents, we should check for a possible
failure of blk_pwrite().

Fixes Coverity issue CID 1412228.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/ppc/pnv_pnor.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/hw/ppc/pnv_pnor.c b/hw/ppc/pnv_pnor.c
index bfb1e92b0392..0e86ae2feae6 100644
--- a/hw/ppc/pnv_pnor.c
+++ b/hw/ppc/pnv_pnor.c
@@ -33,6 +33,7 @@ static uint64_t pnv_pnor_read(void *opaque, hwaddr addr=
, unsigned size)
 static void pnv_pnor_update(PnvPnor *s, int offset, int size)
 {
     int offset_end;
+    int ret;
=20
     if (s->blk) {
         return;
@@ -42,8 +43,11 @@ static void pnv_pnor_update(PnvPnor *s, int offset, in=
t size)
     offset =3D QEMU_ALIGN_DOWN(offset, BDRV_SECTOR_SIZE);
     offset_end =3D QEMU_ALIGN_UP(offset_end, BDRV_SECTOR_SIZE);
=20
-    blk_pwrite(s->blk, offset, s->storage + offset,
-               offset_end - offset, 0);
+    ret =3D blk_pwrite(s->blk, offset, s->storage + offset,
+                     offset_end - offset, 0);
+    if (ret < 0) {
+        error_report("Could not update PNOR: %s", strerror(-ret));
+    }
 }
=20
 static void pnv_pnor_write(void *opaque, hwaddr addr, uint64_t data,
--=20
2.21.1


