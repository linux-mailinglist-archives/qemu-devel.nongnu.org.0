Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E457A11A6
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Aug 2019 08:21:43 +0200 (CEST)
Received: from localhost ([::1]:45748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i3DoU-00070e-37
	for lists+qemu-devel@lfdr.de; Thu, 29 Aug 2019 02:21:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35251)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1i3Dc0-0004Cq-EB
 for qemu-devel@nongnu.org; Thu, 29 Aug 2019 02:08:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1i3Dby-0003gF-40
 for qemu-devel@nongnu.org; Thu, 29 Aug 2019 02:08:48 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:38521)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1i3Dbx-0003as-BV; Thu, 29 Aug 2019 02:08:45 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 46JscM5H5gz9sNf; Thu, 29 Aug 2019 16:08:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1567058915;
 bh=8y11MZgfXY7+VmZ3g3xFTdEB71Uc34RR6nte2PjfaoM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hmw+ZMKoUfLX5lch5ENxpiHOpfI14M+CS3UHjizIFLibsZG44mzIgsky56Kx4CINc
 uehIsJ0MIEXeeldkiPBaMKQJXITviFxJE/TSxNA4N6EDrddUO3P3eV8BMwof+fqiR7
 YffCWz2vDNp2L7oXT+B7bFrT2769457G+2q9mT20=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Date: Thu, 29 Aug 2019 16:08:12 +1000
Message-Id: <20190829060827.25731-5-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190829060827.25731-1-david@gibson.dropbear.id.au>
References: <20190829060827.25731-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2401:3900:2:1::2
Subject: [Qemu-devel] [PULL 04/19] ppc/pnv: Generate phandle for the
 "interrupt-parent" property
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
Cc: lvivier@redhat.com, aik@ozlabs.ru, groug@kaod.org, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: C=C3=A9dric Le Goater <clg@kaod.org>

Devices such as the BT or serial devices require a valid
"interrupt-parent" phandle in the device tree and it is currently
empty (0x0). It was not a problem until now but since OpenFirmare
started using a recent libdft (>=3D 1.4.7), petitboot fails to boot the
system image with error :

   dtc_resize: fdt_open_into returned FDT_ERR_BADMAGIC

Provide a phandle for the LPC bus.

Suggested-by: Greg Kurz <groug@kaod.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Message-Id: <20190723090138.30623-1-clg@kaod.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/pnv.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 6ead82aaa7..2077452d6f 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -434,9 +434,14 @@ static void pnv_dt_isa(PnvMachineState *pnv, void *f=
dt)
         .fdt =3D fdt,
         .offset =3D isa_offset,
     };
+    uint32_t phandle;
=20
     _FDT((fdt_setprop(fdt, isa_offset, "primary", NULL, 0)));
=20
+    phandle =3D qemu_fdt_alloc_phandle(fdt);
+    assert(phandle > 0);
+    _FDT((fdt_setprop_cell(fdt, isa_offset, "phandle", phandle)));
+
     /* ISA devices are not necessarily parented to the ISA bus so we
      * can not use object_child_foreach() */
     qbus_walk_children(BUS(pnv->isa_bus), pnv_dt_isa_device, NULL, NULL,=
 NULL,
--=20
2.21.0


