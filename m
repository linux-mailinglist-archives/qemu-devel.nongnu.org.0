Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 334FFCB77A
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Oct 2019 11:40:51 +0200 (CEST)
Received: from localhost ([::1]:43770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iGK4u-00071t-Hj
	for lists+qemu-devel@lfdr.de; Fri, 04 Oct 2019 05:40:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52202)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1iGK2C-0004ow-LM
 for qemu-devel@nongnu.org; Fri, 04 Oct 2019 05:38:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1iGK2B-0004z4-8j
 for qemu-devel@nongnu.org; Fri, 04 Oct 2019 05:38:00 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:54895 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1iGK2A-0004vX-Bz; Fri, 04 Oct 2019 05:37:59 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 46l4YF0g2Rz9sPv; Fri,  4 Oct 2019 19:37:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1570181873;
 bh=TPqxrfkNIy5265nvIhHCJfABeE50tUf8M1PpxhVu4AY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LNqoPo2amduBREwqVmVqspQN4CjfMMkwoy3N0VcSUdHbn7sRJlcelkzAhXtT+hs1g
 0IP7MIMCvqmNufSyQgMSUQsp55WmaYEvq1D+BzFBG/x9+HTb/v31FkS018nI3PA1Im
 d7HiW+EAm+DTlUAQcwpWOxpWBNHbY0GbNWtcoIEE=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 02/53] ppc/pnv: fix "bmc" node name in DT
Date: Fri,  4 Oct 2019 19:36:56 +1000
Message-Id: <20191004093747.31350-3-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191004093747.31350-1-david@gibson.dropbear.id.au>
References: <20191004093747.31350-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 203.11.71.1
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
Cc: lvivier@redhat.com, aik@ozlabs.ru, qemu-devel@nongnu.org, groug@kaod.org,
 qemu-ppc@nongnu.org, clg@kaod.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: C=C3=A9dric Le Goater <clg@kaod.org>

Fixes the dtc output :

ERROR (node_name_chars): //bmc: Bad character '/' in node name
Warning (avoid_unnecessary_addr_size): /bmc: unnecessary #address-cells/#=
size-cells without "ranges" or child "reg" property

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Message-Id: <20190902092932.20200-1-clg@kaod.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/pnv_bmc.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/hw/ppc/pnv_bmc.c b/hw/ppc/pnv_bmc.c
index e5eb6e5a70..dc5e918cb7 100644
--- a/hw/ppc/pnv_bmc.c
+++ b/hw/ppc/pnv_bmc.c
@@ -77,13 +77,10 @@ void pnv_dt_bmc_sensors(IPMIBmc *bmc, void *fdt)
     const struct ipmi_sdr_compact *sdr;
     uint16_t nextrec;
=20
-    offset =3D fdt_add_subnode(fdt, 0, "/bmc");
+    offset =3D fdt_add_subnode(fdt, 0, "bmc");
     _FDT(offset);
=20
     _FDT((fdt_setprop_string(fdt, offset, "name", "bmc")));
-    _FDT((fdt_setprop_cell(fdt, offset, "#address-cells", 0x1)));
-    _FDT((fdt_setprop_cell(fdt, offset, "#size-cells", 0x0)));
-
     offset =3D fdt_add_subnode(fdt, offset, "sensors");
     _FDT(offset);
=20
--=20
2.21.0


