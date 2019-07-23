Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA44B71485
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Jul 2019 11:02:14 +0200 (CEST)
Received: from localhost ([::1]:40303 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hpqgX-0000ep-MB
	for lists+qemu-devel@lfdr.de; Tue, 23 Jul 2019 05:02:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39843)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <clg@kaod.org>) id 1hpqgF-00005X-1Y
 for qemu-devel@nongnu.org; Tue, 23 Jul 2019 05:01:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1hpqgD-0006mg-VT
 for qemu-devel@nongnu.org; Tue, 23 Jul 2019 05:01:54 -0400
Received: from 7.mo4.mail-out.ovh.net ([178.33.253.54]:49087)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1hpqgD-0006lI-Jd
 for qemu-devel@nongnu.org; Tue, 23 Jul 2019 05:01:53 -0400
Received: from player739.ha.ovh.net (unknown [10.108.35.59])
 by mo4.mail-out.ovh.net (Postfix) with ESMTP id 530151FF3B6
 for <qemu-devel@nongnu.org>; Tue, 23 Jul 2019 11:01:50 +0200 (CEST)
Received: from kaod.org (lfbn-1-2240-157.w90-76.abo.wanadoo.fr [90.76.60.157])
 (Authenticated sender: clg@kaod.org)
 by player739.ha.ovh.net (Postfix) with ESMTPSA id 3294A854F968;
 Tue, 23 Jul 2019 09:01:43 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Date: Tue, 23 Jul 2019 11:01:38 +0200
Message-Id: <20190723090138.30623-1-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 14770962354676009958
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduvddrjeekgddutdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 178.33.253.54
Subject: [Qemu-devel] [PATCH] ppc/pnv: Generate phandle for the
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
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Devices such as the BT or serial devices require a valid
"interrupt-parent" phandle in the device tree and it is currently
empty (0x0). It was not a problem until now but since OpenFirmare
started using a recent libdft (>=3D 1.4.7), petitboot fails to boot the
system image with error :

   dtc_resize: fdt_open_into returned FDT_ERR_BADMAGIC

Provide a phandle for the LPC bus.

Suggested-by: Greg Kurz <groug@kaod.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/ppc/pnv.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 36f57479a1f5..2deceecdccb5 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -431,9 +431,14 @@ static void pnv_dt_isa(PnvMachineState *pnv, void *f=
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


