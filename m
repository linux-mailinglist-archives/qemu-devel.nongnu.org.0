Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3CEAFE377
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Nov 2019 17:56:51 +0100 (CET)
Received: from localhost ([::1]:41904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iVetu-0001ss-5E
	for lists+qemu-devel@lfdr.de; Fri, 15 Nov 2019 11:56:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52704)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iVeQq-0001hU-2d
 for qemu-devel@nongnu.org; Fri, 15 Nov 2019 11:26:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iVeQo-0001Lh-Pz
 for qemu-devel@nongnu.org; Fri, 15 Nov 2019 11:26:47 -0500
Received: from 6.mo173.mail-out.ovh.net ([46.105.43.93]:36347)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iVeQo-0001KB-3G
 for qemu-devel@nongnu.org; Fri, 15 Nov 2019 11:26:46 -0500
Received: from player787.ha.ovh.net (unknown [10.109.143.210])
 by mo173.mail-out.ovh.net (Postfix) with ESMTP id AA3C111DAB6
 for <qemu-devel@nongnu.org>; Fri, 15 Nov 2019 17:26:44 +0100 (CET)
Received: from kaod.org (lfbn-1-2229-223.w90-76.abo.wanadoo.fr [90.76.50.223])
 (Authenticated sender: clg@kaod.org)
 by player787.ha.ovh.net (Postfix) with ESMTPSA id 3BED8C444E7D;
 Fri, 15 Nov 2019 16:26:39 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: [PATCH for-5.0 v5 21/23] ppc/xive: Synthesize interrupt from the
 saved IPB in the NVT
Date: Fri, 15 Nov 2019 17:24:34 +0100
Message-Id: <20191115162436.30548-22-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191115162436.30548-1-clg@kaod.org>
References: <20191115162436.30548-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 15115206252426333158
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrudefhedgkeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdqfffguegfifdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpledtrdejiedrhedtrddvvdefnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejkeejrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghenucevlhhushhtvghrufhiiigvpeef
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 46.105.43.93
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

When a vCPU is dispatched on a HW thread, its context is pushed in the
thread registers and it is activated by setting the VO bit in the CAM
line word2. The HW grabs the associated NVT, pulls the IPB bits and
merges them with the IPB of the new context. If interrupts were missed
while the vCPU was not dispatched, these are synthesized in this
sequence.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/intc/xive.c | 52 ++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/hw/intc/xive.c b/hw/intc/xive.c
index 840ab2a555e1..ce904b0b5ab4 100644
--- a/hw/intc/xive.c
+++ b/hw/intc/xive.c
@@ -393,6 +393,57 @@ static uint64_t xive_tm_pull_os_ctx(XivePresenter *x=
ptr, XiveTCTX *tctx,
     return qw1w2;
 }
=20
+static void xive_tctx_need_resend(XiveRouter *xrtr, XiveTCTX *tctx,
+                                  uint8_t nvt_blk, uint32_t nvt_idx)
+{
+    XiveNVT nvt;
+    uint8_t ipb;
+
+    /*
+     * Grab the associated NVT to pull the pending bits, and merge
+     * them with the IPB of the thread interrupt context registers
+     */
+    if (xive_router_get_nvt(xrtr, nvt_blk, nvt_idx, &nvt)) {
+        qemu_log_mask(LOG_GUEST_ERROR, "XIVE: invalid NVT %x/%x\n",
+                          nvt_blk, nvt_idx);
+        return;
+    }
+
+    ipb =3D xive_get_field32(NVT_W4_IPB, nvt.w4);
+
+    if (ipb) {
+        /* Reset the NVT value */
+        nvt.w4 =3D xive_set_field32(NVT_W4_IPB, nvt.w4, 0);
+        xive_router_write_nvt(xrtr, nvt_blk, nvt_idx, &nvt, 4);
+
+        /* Merge in current context */
+        xive_tctx_ipb_update(tctx, TM_QW1_OS, ipb);
+    }
+}
+
+/*
+ * Updating the OS CAM line can trigger a resend of interrupt
+ */
+static void xive_tm_push_os_ctx(XivePresenter *xptr, XiveTCTX *tctx,
+                                hwaddr offset, uint64_t value, unsigned =
size)
+{
+    uint32_t cam =3D value;
+    uint32_t qw1w2 =3D cpu_to_be32(cam);
+    uint8_t nvt_blk;
+    uint32_t nvt_idx;
+    bool vo;
+
+    xive_os_cam_decode(cam, &nvt_blk, &nvt_idx, &vo);
+
+    /* First update the registers */
+    xive_tctx_set_os_cam(tctx, qw1w2);
+
+    /* Check the interrupt pending bits */
+    if (vo) {
+        xive_tctx_need_resend(XIVE_ROUTER(xptr), tctx, nvt_blk, nvt_idx)=
;
+    }
+}
+
 /*
  * Define a mapping of "special" operations depending on the TIMA page
  * offset and the size of the operation.
@@ -414,6 +465,7 @@ static const XiveTmOp xive_tm_operations[] =3D {
      * effects
      */
     { XIVE_TM_OS_PAGE, TM_QW1_OS + TM_CPPR,   1, xive_tm_set_os_cppr, NU=
LL },
+    { XIVE_TM_HV_PAGE, TM_QW1_OS + TM_WORD2,     4, xive_tm_push_os_ctx,=
 NULL },
     { XIVE_TM_HV_PAGE, TM_QW3_HV_PHYS + TM_CPPR, 1, xive_tm_set_hv_cppr,=
 NULL },
     { XIVE_TM_HV_PAGE, TM_QW3_HV_PHYS + TM_WORD2, 1, xive_tm_vt_push, NU=
LL },
     { XIVE_TM_HV_PAGE, TM_QW3_HV_PHYS + TM_WORD2, 1, NULL, xive_tm_vt_po=
ll },
--=20
2.21.0


