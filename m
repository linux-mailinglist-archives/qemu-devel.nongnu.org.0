Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E9CB68D1
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Sep 2019 19:17:53 +0200 (CEST)
Received: from localhost ([::1]:33204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iAdaS-0004rj-22
	for lists+qemu-devel@lfdr.de; Wed, 18 Sep 2019 13:17:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56169)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iAcW6-0005iZ-LU
 for qemu-devel@nongnu.org; Wed, 18 Sep 2019 12:09:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iAcW5-00046E-J6
 for qemu-devel@nongnu.org; Wed, 18 Sep 2019 12:09:18 -0400
Received: from 2.mo6.mail-out.ovh.net ([46.105.76.65]:41404)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iAcW5-00045F-E1
 for qemu-devel@nongnu.org; Wed, 18 Sep 2019 12:09:17 -0400
Received: from player799.ha.ovh.net (unknown [10.108.42.75])
 by mo6.mail-out.ovh.net (Postfix) with ESMTP id 032B81E18FE
 for <qemu-devel@nongnu.org>; Wed, 18 Sep 2019 18:09:15 +0200 (CEST)
Received: from kaod.org (lfbn-1-2240-157.w90-76.abo.wanadoo.fr [90.76.60.157])
 (Authenticated sender: clg@kaod.org)
 by player799.ha.ovh.net (Postfix) with ESMTPSA id C18559F0EB7B;
 Wed, 18 Sep 2019 16:09:09 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Date: Wed, 18 Sep 2019 18:06:45 +0200
Message-Id: <20190918160645.25126-26-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190918160645.25126-1-clg@kaod.org>
References: <20190918160645.25126-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 6245085311069555686
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrudekgdeljecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.76.65
Subject: [Qemu-devel] [PATCH v4 25/25] ppc/pnv: Use the EAS trigger bit when
 triggering an interrupt from PSI
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

and replace the cpu_physical_memory_write() by a address_space_stq_be().

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/ppc/pnv_psi.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/hw/ppc/pnv_psi.c b/hw/ppc/pnv_psi.c
index 88ba8e7b9b0a..3b0f4b02f9bf 100644
--- a/hw/ppc/pnv_psi.c
+++ b/hw/ppc/pnv_psi.c
@@ -660,10 +660,19 @@ static void pnv_psi_notify(XiveNotifier *xf, uint32=
_t srcno)
=20
     uint32_t offset =3D
         (psi->regs[PSIHB_REG(PSIHB9_IVT_OFFSET)] >> PSIHB9_IVT_OFF_SHIFT=
);
-    uint64_t lisn =3D cpu_to_be64(offset + srcno);
+    uint64_t data =3D XIVE_TRIGGER_EAS | offset | srcno;
+    MemTxResult result;
=20
-    if (valid) {
-        cpu_physical_memory_write(notify_addr, &lisn, sizeof(lisn));
+    if (!valid) {
+        return;
+    }
+
+    address_space_stq_be(&address_space_memory, notify_addr, data,
+                         MEMTXATTRS_UNSPECIFIED, &result);
+    if (result !=3D MEMTX_OK) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: trigger failed @%"
+                      HWADDR_PRIx "\n", __func__, notif_port);
+        return;
     }
 }
=20
--=20
2.21.0


