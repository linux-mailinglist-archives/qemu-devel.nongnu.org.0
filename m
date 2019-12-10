Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E90118A52
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Dec 2019 15:02:25 +0100 (CET)
Received: from localhost ([::1]:57200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ieg5n-0002f2-Dc
	for lists+qemu-devel@lfdr.de; Tue, 10 Dec 2019 09:02:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47142)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1ieg2l-0000FO-3F
 for qemu-devel@nongnu.org; Tue, 10 Dec 2019 08:59:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1ieg2k-0002sW-37
 for qemu-devel@nongnu.org; Tue, 10 Dec 2019 08:59:14 -0500
Received: from 4.mo7.mail-out.ovh.net ([178.32.122.254]:46582)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1ieg2j-0002ry-TV
 for qemu-devel@nongnu.org; Tue, 10 Dec 2019 08:59:14 -0500
Received: from player728.ha.ovh.net (unknown [10.108.42.66])
 by mo7.mail-out.ovh.net (Postfix) with ESMTP id 709E214269F
 for <qemu-devel@nongnu.org>; Tue, 10 Dec 2019 14:59:11 +0100 (CET)
Received: from kaod.org (lfbn-1-2229-223.w90-76.abo.wanadoo.fr [90.76.50.223])
 (Authenticated sender: clg@kaod.org)
 by player728.ha.ovh.net (Postfix) with ESMTPSA id B6589D0AC469;
 Tue, 10 Dec 2019 13:59:05 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: [PATCH 2/2] ppc/pnv: populate the DT with realized XSCOM devices
Date: Tue, 10 Dec 2019 14:58:45 +0100
Message-Id: <20191210135845.19773-3-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191210135845.19773-1-clg@kaod.org>
References: <20191210135845.19773-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 11866703546555730918
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrudelfedgheekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpledtrdejiedrhedtrddvvdefnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejvdekrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghenucevlhhushhtvghrufhiiigvpedt
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 178.32.122.254
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

Some devices could be initialized in the instance_init handler but not
realized for configuration reasons. Nodes should not be added in the DT
for such devices.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/ppc/pnv_xscom.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/ppc/pnv_xscom.c b/hw/ppc/pnv_xscom.c
index 006d87e970d9..6d3745a49e50 100644
--- a/hw/ppc/pnv_xscom.c
+++ b/hw/ppc/pnv_xscom.c
@@ -272,7 +272,10 @@ static int xscom_dt_child(Object *child, void *opaqu=
e)
         PnvXScomInterface *xd =3D PNV_XSCOM_INTERFACE(child);
         PnvXScomInterfaceClass *xc =3D PNV_XSCOM_INTERFACE_GET_CLASS(xd)=
;
=20
-        if (xc->dt_xscom) {
+        /*
+         * Only "realized" devices should be configured in the DT
+         */
+        if (xc->dt_xscom && DEVICE(child)->realized) {
             _FDT((xc->dt_xscom(xd, args->fdt, args->xscom_offset)));
         }
     }
--=20
2.21.0


