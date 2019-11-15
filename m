Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52704FE2EA
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Nov 2019 17:35:56 +0100 (CET)
Received: from localhost ([::1]:41610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iVeZe-000251-Ds
	for lists+qemu-devel@lfdr.de; Fri, 15 Nov 2019 11:35:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52405)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iVeQ7-0000ar-R9
 for qemu-devel@nongnu.org; Fri, 15 Nov 2019 11:26:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iVeQ6-00013M-OC
 for qemu-devel@nongnu.org; Fri, 15 Nov 2019 11:26:03 -0500
Received: from 8.mo2.mail-out.ovh.net ([188.165.52.147]:32809)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iVeQ6-00011v-Ht
 for qemu-devel@nongnu.org; Fri, 15 Nov 2019 11:26:02 -0500
Received: from player787.ha.ovh.net (unknown [10.109.146.173])
 by mo2.mail-out.ovh.net (Postfix) with ESMTP id EE5331B5432
 for <qemu-devel@nongnu.org>; Fri, 15 Nov 2019 17:26:00 +0100 (CET)
Received: from kaod.org (lfbn-1-2229-223.w90-76.abo.wanadoo.fr [90.76.50.223])
 (Authenticated sender: clg@kaod.org)
 by player787.ha.ovh.net (Postfix) with ESMTPSA id 0C1A1C444B8D;
 Fri, 15 Nov 2019 16:25:55 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: [PATCH for-5.0 v5 13/23] ppc/pnv: Implement the XiveFabric interface
Date: Fri, 15 Nov 2019 17:24:26 +0100
Message-Id: <20191115162436.30548-14-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191115162436.30548-1-clg@kaod.org>
References: <20191115162436.30548-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 15102821353968995302
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrudefhedgkeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdqfffguegfifdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpledtrdejiedrhedtrddvvdefnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejkeejrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghenucevlhhushhtvghrufhiiigvpeef
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 188.165.52.147
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

The CAM line matching on the PowerNV machine now scans all chips of
the system and all CPUs of a chip to find a dispatched NVT in the
thread contexts.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/ppc/pnv.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 94c9f536413f..207a5cf2c650 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -1446,6 +1446,35 @@ static void pnv_pic_print_info(InterruptStatsProvi=
der *obj,
     }
 }
=20
+static int pnv_xive_match_nvt(XiveFabric *xfb, uint8_t format,
+                               uint8_t nvt_blk, uint32_t nvt_idx,
+                               bool cam_ignore, uint8_t priority,
+                               uint32_t logic_serv,
+                               XiveTCTXMatch *match)
+{
+    PnvMachineState *pnv =3D PNV_MACHINE(xfb);
+    int total_count =3D 0;
+    int i;
+
+    for (i =3D 0; i < pnv->num_chips; i++) {
+        Pnv9Chip *chip9 =3D PNV9_CHIP(pnv->chips[i]);
+        XivePresenter *xptr =3D XIVE_PRESENTER(&chip9->xive);
+        XivePresenterClass *xpc =3D XIVE_PRESENTER_GET_CLASS(xptr);
+        int count;
+
+        count =3D xpc->match_nvt(xptr, format, nvt_blk, nvt_idx, cam_ign=
ore,
+                               priority, logic_serv, match);
+
+        if (count < 0) {
+            return count;
+        }
+
+        total_count +=3D count;
+    }
+
+    return total_count;
+}
+
 static void pnv_get_num_chips(Object *obj, Visitor *v, const char *name,
                               void *opaque, Error **errp)
 {
@@ -1509,9 +1538,11 @@ static void pnv_machine_power8_class_init(ObjectCl=
ass *oc, void *data)
 static void pnv_machine_power9_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc =3D MACHINE_CLASS(oc);
+    XiveFabricClass *xfc =3D XIVE_FABRIC_CLASS(oc);
=20
     mc->desc =3D "IBM PowerNV (Non-Virtualized) POWER9";
     mc->default_cpu_type =3D POWERPC_CPU_TYPE_NAME("power9_v2.0");
+    xfc->match_nvt =3D pnv_xive_match_nvt;
=20
     mc->alias =3D "powernv";
 }
@@ -1558,6 +1589,10 @@ static const TypeInfo types[] =3D {
         .name          =3D MACHINE_TYPE_NAME("powernv9"),
         .parent        =3D TYPE_PNV_MACHINE,
         .class_init    =3D pnv_machine_power9_class_init,
+        .interfaces =3D (InterfaceInfo[]) {
+            { TYPE_XIVE_FABRIC },
+            { },
+        },
     },
     {
         .name          =3D MACHINE_TYPE_NAME("powernv8"),
--=20
2.21.0


