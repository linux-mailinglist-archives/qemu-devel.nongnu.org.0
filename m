Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66BB42D657
	for <lists+qemu-devel@lfdr.de>; Wed, 29 May 2019 09:30:07 +0200 (CEST)
Received: from localhost ([127.0.0.1]:48981 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hVt2E-0007od-HB
	for lists+qemu-devel@lfdr.de; Wed, 29 May 2019 03:30:06 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48334)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1hVsQo-0000n5-3z
	for qemu-devel@nongnu.org; Wed, 29 May 2019 02:51:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1hVsQn-00031I-16
	for qemu-devel@nongnu.org; Wed, 29 May 2019 02:51:26 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:56773 helo=ozlabs.org)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1hVsQm-0002rC-M1; Wed, 29 May 2019 02:51:24 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 45DLv726v9z9sPZ; Wed, 29 May 2019 16:50:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1559112627;
	bh=zeNEbEta8kla1fTMD1ODliIetCj1SoUIfL596OlUPyk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jNE9Gce5TEZpFuAjJ5dmqFb7v4J33fY+hy2G+2tmUAZjmidx6iuM63Rh/xL0NK2+P
	/D/wrokd8QIjPzxiDWYYr/MjNYVhLi1ZcNfJFNRDM3vxoK5sXOo5WlMmFcjYQuf2UV
	M2cJrBRPhj2MiouuTRAEAl3RymXOAZKEujO5i/yg=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Date: Wed, 29 May 2019 16:50:16 +1000
Message-Id: <20190529065017.15149-44-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190529065017.15149-1-david@gibson.dropbear.id.au>
References: <20190529065017.15149-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2401:3900:2:1::2
Subject: [Qemu-devel] [PULL 43/44] ppc/pnv: introduce new skiboot platform
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
Cc: lvivier@redhat.com, qemu-devel@nongnu.org, groug@kaod.org,
	qemu-ppc@nongnu.org, clg@kaod.org,
	David Gibson <david@gibson.dropbear.id.au>, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: C=C3=A9dric Le Goater <clg@kaod.org>

Newer skiboots (after 6.3) support QEMU platforms that have
characteristics closer to real OpenPOWER systems. The CPU type is used
to define the BMC drivers: Aspeed AST2400 for POWER8 processors and
AST2500 for POWER9s.

Advertise the new platform property names, "qemu,powernv8" and
"qemu,powernv9", using the CPU type chosen for the QEMU PowerNV
machine. Also, advertise the original platform name "qemu,powernv" in
case of POWER8 processors for compatibility with older skiboots.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Message-Id: <20190527071749.31499-1-clg@kaod.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/pnv.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 31aa20ee25..046f0a83c8 100644
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


