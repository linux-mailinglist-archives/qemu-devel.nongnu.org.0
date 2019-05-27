Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C752AF52
	for <lists+qemu-devel@lfdr.de>; Mon, 27 May 2019 09:19:46 +0200 (CEST)
Received: from localhost ([127.0.0.1]:41188 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hV9v7-00060V-Hl
	for lists+qemu-devel@lfdr.de; Mon, 27 May 2019 03:19:45 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45299)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1hV9tS-0005Lv-QN
	for qemu-devel@nongnu.org; Mon, 27 May 2019 03:18:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1hV9tR-0002hZ-Qr
	for qemu-devel@nongnu.org; Mon, 27 May 2019 03:18:02 -0400
Received: from 3.mo4.mail-out.ovh.net ([46.105.57.129]:38439)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1hV9tR-0002gt-Lg
	for qemu-devel@nongnu.org; Mon, 27 May 2019 03:18:01 -0400
Received: from player730.ha.ovh.net (unknown [10.108.35.158])
	by mo4.mail-out.ovh.net (Postfix) with ESMTP id A92CD1EF4C5
	for <qemu-devel@nongnu.org>; Mon, 27 May 2019 09:17:59 +0200 (CEST)
Received: from kaod.org (lfbn-1-10649-41.w90-89.abo.wanadoo.fr [90.89.235.41])
	(Authenticated sender: clg@kaod.org)
	by player730.ha.ovh.net (Postfix) with ESMTPSA id 05364610B40D;
	Mon, 27 May 2019 07:17:54 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Date: Mon, 27 May 2019 09:17:49 +0200
Message-Id: <20190527071749.31499-1-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 10315213475625995238
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduuddruddvuddgudduiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.57.129
Subject: [Qemu-devel] [PATCH] ppc/pnv: introduce new skiboot platform
 properties
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Newer skiboots (after 6.3) support QEMU platforms that have
characteristics closer to real OpenPOWER systems. The CPU type is used
to define the BMC drivers: Aspeed AST2400 for POWER8 processors and
AST2500 for POWER9s.

Advertise the new platform property names, "qemu,powernv8" and
"qemu,powernv9", using the CPU type chosen for the QEMU PowerNV
machine. Also, advertise the original platform name "qemu,powernv" in
case of POWER8 processors for compatibility with older skiboots.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/ppc/pnv.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index dfb4ea5742c1..1f22cbf833a8 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -450,7 +450,8 @@ static void pnv_dt_power_mgt(void *fdt)
=20
 static void *pnv_dt_create(MachineState *machine)
 {
-    const char plat_compat[] =3D "qemu,powernv\0ibm,powernv";
+    const char plat_compat8[] =3D "qemu,powernv8\0qemu,powernv\0ibm,powe=
rnv";
+    const char plat_compat9[] =3D "qemu,powernv9\0ibm,powernv";
     PnvMachineState *pnv =3D PNV_MACHINE(machine);
     void *fdt;
     char *buf;
@@ -465,8 +466,14 @@ static void *pnv_dt_create(MachineState *machine)
     _FDT((fdt_setprop_cell(fdt, 0, "#size-cells", 0x2)));
     _FDT((fdt_setprop_string(fdt, 0, "model",
                              "IBM PowerNV (emulated by qemu)")));
-    _FDT((fdt_setprop(fdt, 0, "compatible", plat_compat,
-                      sizeof(plat_compat))));
+    if (pnv_is_power9(pnv)) {
+        _FDT((fdt_setprop(fdt, 0, "compatible", plat_compat9,
+                          sizeof(plat_compat9))));
+    } else {
+        _FDT((fdt_setprop(fdt, 0, "compatible", plat_compat8,
+                          sizeof(plat_compat8))));
+    }
+
=20
     buf =3D  qemu_uuid_unparse_strdup(&qemu_uuid);
     _FDT((fdt_setprop_string(fdt, 0, "vm,uuid", buf)));
--=20
2.21.0


