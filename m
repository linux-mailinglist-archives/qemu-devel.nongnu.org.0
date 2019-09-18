Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7367FB6901
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Sep 2019 19:23:06 +0200 (CEST)
Received: from localhost ([::1]:33248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iAdfU-0000ni-K3
	for lists+qemu-devel@lfdr.de; Wed, 18 Sep 2019 13:23:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55942)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iAcVU-0004wa-Tp
 for qemu-devel@nongnu.org; Wed, 18 Sep 2019 12:08:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iAcVT-0003l1-3R
 for qemu-devel@nongnu.org; Wed, 18 Sep 2019 12:08:40 -0400
Received: from 15.mo6.mail-out.ovh.net ([188.165.39.161]:50603)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iAcVS-0003i6-Ps
 for qemu-devel@nongnu.org; Wed, 18 Sep 2019 12:08:39 -0400
Received: from player799.ha.ovh.net (unknown [10.108.42.174])
 by mo6.mail-out.ovh.net (Postfix) with ESMTP id 592481DDA89
 for <qemu-devel@nongnu.org>; Wed, 18 Sep 2019 18:08:36 +0200 (CEST)
Received: from kaod.org (lfbn-1-2240-157.w90-76.abo.wanadoo.fr [90.76.60.157])
 (Authenticated sender: clg@kaod.org)
 by player799.ha.ovh.net (Postfix) with ESMTPSA id 540D59F0E99C;
 Wed, 18 Sep 2019 16:08:30 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Date: Wed, 18 Sep 2019 18:06:38 +0200
Message-Id: <20190918160645.25126-19-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190918160645.25126-1-clg@kaod.org>
References: <20190918160645.25126-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 6234107785789606886
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrudekgdeljecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 188.165.39.161
Subject: [Qemu-devel] [PATCH v4 18/25] ppc/pnv: Skip empty slots of the XIVE
 NVT table
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
 qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We try to loop on the full table skipping empty indirect pages which
are not necessarily allocated. This is useful to dump the contexts of
the KVM vCPUs.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/intc/pnv_xive.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/hw/intc/pnv_xive.c b/hw/intc/pnv_xive.c
index 782775136288..a986d4ed9364 100644
--- a/hw/intc/pnv_xive.c
+++ b/hw/intc/pnv_xive.c
@@ -1641,6 +1641,12 @@ static const MemoryRegionOps pnv_xive_pc_ops =3D {
     },
 };
=20
+/*
+ * skiboot uses an indirect NVT table with 64k subpages
+ */
+#define XIVE_NVT_COUNT          (1 << XIVE_NVT_SHIFT)
+#define XIVE_NVT_PER_PAGE       (0x10000 / sizeof(XiveNVT))
+
 static void xive_nvt_pic_print_info(XiveNVT *nvt, uint32_t nvt_idx,
                                     Monitor *mon)
 {
@@ -1694,10 +1700,12 @@ void pnv_xive_pic_print_info(PnvXive *xive, Monit=
or *mon)
         xive_end_eas_pic_print_info(&end, i++, mon);
     }
=20
-    monitor_printf(mon, "XIVE[%x] NVTT\n", blk);
-    i =3D 0;
-    while (!xive_router_get_nvt(xrtr, blk, i, &nvt)) {
-        xive_nvt_pic_print_info(&nvt, i++, mon);
+    monitor_printf(mon, "XIVE[%x] NVTT %08x .. %08x\n", blk, 0,
+                   XIVE_NVT_COUNT - 1);
+    for (i =3D 0; i < XIVE_NVT_COUNT; i +=3D XIVE_NVT_PER_PAGE) {
+        while (!xive_router_get_nvt(xrtr, blk, i, &nvt)) {
+            xive_nvt_pic_print_info(&nvt, i++, mon);
+        }
     }
 }
=20
--=20
2.21.0


