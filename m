Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB1F6CDB6
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Jul 2019 13:55:37 +0200 (CEST)
Received: from localhost ([::1]:36758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ho50a-00063w-F6
	for lists+qemu-devel@lfdr.de; Thu, 18 Jul 2019 07:55:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58724)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <clg@kaod.org>) id 1ho4zu-0004KV-6b
 for qemu-devel@nongnu.org; Thu, 18 Jul 2019 07:54:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1ho4zt-0001bz-3i
 for qemu-devel@nongnu.org; Thu, 18 Jul 2019 07:54:54 -0400
Received: from 10.mo179.mail-out.ovh.net ([46.105.79.46]:49812)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1ho4zs-0001aE-UV
 for qemu-devel@nongnu.org; Thu, 18 Jul 2019 07:54:53 -0400
Received: from player778.ha.ovh.net (unknown [10.108.42.228])
 by mo179.mail-out.ovh.net (Postfix) with ESMTP id F0BB5139F42
 for <qemu-devel@nongnu.org>; Thu, 18 Jul 2019 13:54:50 +0200 (CEST)
Received: from kaod.org (lfbn-1-2240-157.w90-76.abo.wanadoo.fr [90.76.60.157])
 (Authenticated sender: clg@kaod.org)
 by player778.ha.ovh.net (Postfix) with ESMTPSA id 52E78801F2B3;
 Thu, 18 Jul 2019 11:54:45 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Date: Thu, 18 Jul 2019 13:54:06 +0200
Message-Id: <20190718115420.19919-4-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190718115420.19919-1-clg@kaod.org>
References: <20190718115420.19919-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 6776228591923858406
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduvddrieehgdegjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.79.46
Subject: [Qemu-devel] [PATCH v2 03/17] ppc/xive: Implement TM_PULL_OS_CTX
 special command
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

When a vCPU is not dispatched anymore on a HW thread, the Hypervisor
(KVM on Linux) invalidates the OS interrupt context of a vCPU with
this special command. It returns the OS CAM line value and resets the
VO bit.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/intc/xive.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/hw/intc/xive.c b/hw/intc/xive.c
index cf77bdb7d34a..592c0b70f197 100644
--- a/hw/intc/xive.c
+++ b/hw/intc/xive.c
@@ -334,6 +334,17 @@ static void xive_tm_set_os_pending(XiveTCTX *tctx, h=
waddr offset,
     xive_tctx_notify(tctx, TM_QW1_OS);
 }
=20
+static uint64_t xive_tm_pull_os_ctx(XiveTCTX *tctx, hwaddr offset,
+                                    unsigned size)
+{
+    uint32_t qw1w2_prev =3D xive_tctx_word2(&tctx->regs[TM_QW1_OS]);
+    uint32_t qw1w2;
+
+    qw1w2 =3D xive_set_field32(TM_QW1W2_VO, qw1w2_prev, 0);
+    memcpy(&tctx->regs[TM_QW1_OS + TM_WORD2], &qw1w2, 4);
+    return qw1w2;
+}
+
 /*
  * Define a mapping of "special" operations depending on the TIMA page
  * offset and the size of the operation.
@@ -360,6 +371,8 @@ static const XiveTmOp xive_tm_operations[] =3D {
     /* MMIOs above 2K : special operations with side effects */
     { XIVE_TM_OS_PAGE, TM_SPC_ACK_OS_REG,     2, NULL, xive_tm_ack_os_re=
g },
     { XIVE_TM_OS_PAGE, TM_SPC_SET_OS_PENDING, 1, xive_tm_set_os_pending,=
 NULL },
+    { XIVE_TM_HV_PAGE, TM_SPC_PULL_OS_CTX,    4, NULL, xive_tm_pull_os_c=
tx },
+    { XIVE_TM_HV_PAGE, TM_SPC_PULL_OS_CTX,    8, NULL, xive_tm_pull_os_c=
tx },
     { XIVE_TM_HV_PAGE, TM_SPC_ACK_HV_REG,     2, NULL, xive_tm_ack_hv_re=
g },
     { XIVE_TM_HV_PAGE, TM_SPC_PULL_POOL_CTX,  4, NULL, xive_tm_pull_pool=
_ctx },
     { XIVE_TM_HV_PAGE, TM_SPC_PULL_POOL_CTX,  8, NULL, xive_tm_pull_pool=
_ctx },
@@ -403,7 +416,7 @@ void xive_tctx_tm_write(XiveTCTX *tctx, hwaddr offset=
, uint64_t value,
     if (offset & 0x800) {
         xto =3D xive_tm_find_op(offset, size, true);
         if (!xto) {
-            qemu_log_mask(LOG_GUEST_ERROR, "XIVE: invalid write access a=
t TIMA"
+            qemu_log_mask(LOG_GUEST_ERROR, "XIVE: invalid write access a=
t TIMA "
                           "@%"HWADDR_PRIx"\n", offset);
         } else {
             xto->write_handler(tctx, offset, value, size);
--=20
2.21.0


