Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A31913161E
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jan 2020 17:33:27 +0100 (CET)
Received: from localhost ([::1]:54668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ioVJm-0004p7-LW
	for lists+qemu-devel@lfdr.de; Mon, 06 Jan 2020 11:33:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42835)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1ioVIg-000482-Mb
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 11:32:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1ioVIf-0001Cz-B5
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 11:32:18 -0500
Received: from 4.mo179.mail-out.ovh.net ([46.105.36.149]:38037)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1ioVIf-0001CH-4S
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 11:32:17 -0500
Received: from player690.ha.ovh.net (unknown [10.108.35.159])
 by mo179.mail-out.ovh.net (Postfix) with ESMTP id AEFBE14E665
 for <qemu-devel@nongnu.org>; Mon,  6 Jan 2020 17:32:14 +0100 (CET)
Received: from kaod.org (lfbn-tou-1-1227-223.w90-76.abo.wanadoo.fr
 [90.76.50.223]) (Authenticated sender: clg@kaod.org)
 by player690.ha.ovh.net (Postfix) with ESMTPSA id 31D18DC7A4AE;
 Mon,  6 Jan 2020 16:32:08 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: [PATCH] spapr/xive: remove redundant check in spapr_match_nvt()
Date: Mon,  6 Jan 2020 17:32:07 +0100
Message-Id: <20200106163207.4608-1-clg@kaod.org>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 6993527274445769702
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrvdehtddgleduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffogggtgfesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpledtrdejiedrhedtrddvvdefnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrheiledtrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghenucevlhhushhtvghrufhiiigvpedt
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 46.105.36.149
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

spapr_match_nvt() is a XIVE operation and it used by the machine to
look for a matching target when an event notification is being
delivered. An assert checks that spapr_match_nvt() is called only when
the machine has selected the XIVE interrupt mode but it is redundant
with the XIVE_PRESENTER() dynamic cast.

Apply the cast to spapr->active_intc and remove the assert.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/ppc/spapr.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index e62c89b3dd40..5008b7563173 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -4198,19 +4198,19 @@ static void spapr_pic_print_info(InterruptStatsPr=
ovider *obj,
                    kvm_irqchip_in_kernel() ? "in-kernel" : "emulated");
 }
=20
+/*
+ * This is a XIVE only operation
+ */
 static int spapr_match_nvt(XiveFabric *xfb, uint8_t format,
                            uint8_t nvt_blk, uint32_t nvt_idx,
                            bool cam_ignore, uint8_t priority,
                            uint32_t logic_serv, XiveTCTXMatch *match)
 {
     SpaprMachineState *spapr =3D SPAPR_MACHINE(xfb);
-    XivePresenter *xptr =3D XIVE_PRESENTER(spapr->xive);
+    XivePresenter *xptr =3D XIVE_PRESENTER(spapr->active_intc);
     XivePresenterClass *xpc =3D XIVE_PRESENTER_GET_CLASS(xptr);
     int count;
=20
-    /* This is a XIVE only operation */
-    assert(spapr->active_intc =3D=3D SPAPR_INTC(spapr->xive));
-
     count =3D xpc->match_nvt(xptr, format, nvt_blk, nvt_idx, cam_ignore,
                            priority, logic_serv, match);
     if (count < 0) {
--=20
2.21.1


