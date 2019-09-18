Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F61B69C6
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Sep 2019 19:42:50 +0200 (CEST)
Received: from localhost ([::1]:33480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iAdya-0003SW-D1
	for lists+qemu-devel@lfdr.de; Wed, 18 Sep 2019 13:42:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56087)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iAcVu-0005UA-Sy
 for qemu-devel@nongnu.org; Wed, 18 Sep 2019 12:09:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iAcVt-0003zf-RO
 for qemu-devel@nongnu.org; Wed, 18 Sep 2019 12:09:06 -0400
Received: from 7.mo173.mail-out.ovh.net ([46.105.44.159]:52825)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iAcVt-0003z1-MC
 for qemu-devel@nongnu.org; Wed, 18 Sep 2019 12:09:05 -0400
Received: from player799.ha.ovh.net (unknown [10.109.146.213])
 by mo173.mail-out.ovh.net (Postfix) with ESMTP id 53BF1119FEF
 for <qemu-devel@nongnu.org>; Wed, 18 Sep 2019 18:09:04 +0200 (CEST)
Received: from kaod.org (lfbn-1-2240-157.w90-76.abo.wanadoo.fr [90.76.60.157])
 (Authenticated sender: clg@kaod.org)
 by player799.ha.ovh.net (Postfix) with ESMTPSA id D12DE9F0EB16;
 Wed, 18 Sep 2019 16:08:58 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Date: Wed, 18 Sep 2019 18:06:43 +0200
Message-Id: <20190918160645.25126-24-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190918160645.25126-1-clg@kaod.org>
References: <20190918160645.25126-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 6241989086273965030
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrudekgdeliecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.44.159
Subject: [Qemu-devel] [PATCH v4 23/25] ppc/xive: Check V bit in
 TM_PULL_POOL_CTX
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

A context should be 'valid' when pulled from the thread interrupt
context registers.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/intc/xive.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/intc/xive.c b/hw/intc/xive.c
index cdc4ea8b0e51..07b7c3586c12 100644
--- a/hw/intc/xive.c
+++ b/hw/intc/xive.c
@@ -362,6 +362,11 @@ static uint64_t xive_tm_pull_os_ctx(XivePresenter *x=
ptr, XiveTCTX *tctx,
=20
     xive_os_cam_decode(cam, &nvt_blk, &nvt_idx, &vo);
=20
+    if (!vo) {
+        qemu_log_mask(LOG_GUEST_ERROR, "XIVE: pulling invalid NVT %x/%x =
!?\n",
+                      nvt_blk, nvt_idx);
+    }
+
     /* Invalidate CAM line */
     qw1w2_new =3D xive_set_field32(TM_QW1W2_VO, qw1w2, 0);
     memcpy(&tctx->regs[TM_QW1_OS + TM_WORD2], &qw1w2_new, 4);
--=20
2.21.0


