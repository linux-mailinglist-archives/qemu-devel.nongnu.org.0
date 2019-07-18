Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E246CDB9
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Jul 2019 13:56:32 +0200 (CEST)
Received: from localhost ([::1]:36814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ho51S-0000Zb-OF
	for lists+qemu-devel@lfdr.de; Thu, 18 Jul 2019 07:56:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59135)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <clg@kaod.org>) id 1ho50X-0006yN-Cp
 for qemu-devel@nongnu.org; Thu, 18 Jul 2019 07:55:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1ho50V-0002DC-Bv
 for qemu-devel@nongnu.org; Thu, 18 Jul 2019 07:55:33 -0400
Received: from 16.mo5.mail-out.ovh.net ([87.98.174.144]:45689)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1ho50V-0002CD-5j
 for qemu-devel@nongnu.org; Thu, 18 Jul 2019 07:55:31 -0400
Received: from player778.ha.ovh.net (unknown [10.109.143.109])
 by mo5.mail-out.ovh.net (Postfix) with ESMTP id 97608240EEA
 for <qemu-devel@nongnu.org>; Thu, 18 Jul 2019 13:55:29 +0200 (CEST)
Received: from kaod.org (lfbn-1-2240-157.w90-76.abo.wanadoo.fr [90.76.60.157])
 (Authenticated sender: clg@kaod.org)
 by player778.ha.ovh.net (Postfix) with ESMTPSA id 16D1B801F502;
 Thu, 18 Jul 2019 11:55:24 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Date: Thu, 18 Jul 2019 13:54:13 +0200
Message-Id: <20190718115420.19919-11-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190718115420.19919-1-clg@kaod.org>
References: <20190718115420.19919-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 6787206114223426534
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduvddrieehgdegkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 87.98.174.144
Subject: [Qemu-devel] [PATCH v2 10/17] ppc/xive: Introduce
 xive_tctx_ipb_update()
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

We will use it to resend missed interrupts when a vCPU context is
pushed a HW thread.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/ppc/xive.h |  1 +
 hw/intc/xive.c        | 15 +++++++++++----
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/include/hw/ppc/xive.h b/include/hw/ppc/xive.h
index 206b23ecfab3..51e3c37b7483 100644
--- a/include/hw/ppc/xive.h
+++ b/include/hw/ppc/xive.h
@@ -418,6 +418,7 @@ uint64_t xive_tctx_tm_read(XiveTCTX *tctx, hwaddr off=
set, unsigned size);
=20
 void xive_tctx_pic_print_info(XiveTCTX *tctx, Monitor *mon);
 Object *xive_tctx_create(Object *cpu, XiveRouter *xrtr, Error **errp);
+void xive_tctx_ipb_update(XiveTCTX *tctx, uint8_t ring, uint8_t ipb);
=20
 static inline uint32_t xive_nvt_cam_line(uint8_t nvt_blk, uint32_t nvt_i=
dx)
 {
diff --git a/hw/intc/xive.c b/hw/intc/xive.c
index 1b0eccb6df40..be66b1fb3261 100644
--- a/hw/intc/xive.c
+++ b/hw/intc/xive.c
@@ -132,6 +132,15 @@ static void xive_tctx_set_cppr(XiveTCTX *tctx, uint8=
_t ring, uint8_t cppr)
     xive_tctx_notify(tctx, ring);
 }
=20
+void xive_tctx_ipb_update(XiveTCTX *tctx, uint8_t ring, uint8_t ipb)
+{
+    uint8_t *regs =3D &tctx->regs[ring];
+
+    regs[TM_IPB] |=3D ipb;
+    regs[TM_PIPR] =3D ipb_to_pipr(regs[TM_IPB]);
+    xive_tctx_notify(tctx, ring);
+}
+
 static inline uint32_t xive_tctx_word2(uint8_t *ring)
 {
     return *((uint32_t *) &ring[TM_WORD2]);
@@ -330,8 +339,7 @@ static void xive_tm_set_os_cppr(XiveTCTX *tctx, hwadd=
r offset,
 static void xive_tm_set_os_pending(XiveTCTX *tctx, hwaddr offset,
                                    uint64_t value, unsigned size)
 {
-    ipb_update(&tctx->regs[TM_QW1_OS], value & 0xff);
-    xive_tctx_notify(tctx, TM_QW1_OS);
+    xive_tctx_ipb_update(tctx, TM_QW1_OS, priority_to_ipb(value & 0xff))=
;
 }
=20
 static uint64_t xive_tm_pull_os_ctx(XiveTCTX *tctx, hwaddr offset,
@@ -1445,8 +1453,7 @@ static bool xive_presenter_notify(XiveRouter *xrtr,=
 uint8_t format,
     found =3D xive_presenter_match(xrtr, format, nvt_blk, nvt_idx, cam_i=
gnore,
                                  priority, logic_serv, &match);
     if (found) {
-        ipb_update(&match.tctx->regs[match.ring], priority);
-        xive_tctx_notify(match.tctx, match.ring);
+        xive_tctx_ipb_update(match.tctx, match.ring, priority_to_ipb(pri=
ority));
     }
=20
     return found;
--=20
2.21.0


