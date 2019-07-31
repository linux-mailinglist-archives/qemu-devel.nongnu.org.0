Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A6AF7C4B2
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Jul 2019 16:19:46 +0200 (CEST)
Received: from localhost ([::1]:41308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hspSD-0003mQ-L0
	for lists+qemu-devel@lfdr.de; Wed, 31 Jul 2019 10:19:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34533)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <clg@kaod.org>) id 1hspMd-00010k-Hg
 for qemu-devel@nongnu.org; Wed, 31 Jul 2019 10:14:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1hspMc-0002G2-1Z
 for qemu-devel@nongnu.org; Wed, 31 Jul 2019 10:13:59 -0400
Received: from 7.mo1.mail-out.ovh.net ([87.98.158.110]:34390)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1hspMb-0002FH-SU
 for qemu-devel@nongnu.org; Wed, 31 Jul 2019 10:13:57 -0400
Received: from player715.ha.ovh.net (unknown [10.109.143.225])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id 160B5189119
 for <qemu-devel@nongnu.org>; Wed, 31 Jul 2019 16:13:55 +0200 (CEST)
Received: from kaod.org (lfbn-1-2240-157.w90-76.abo.wanadoo.fr [90.76.60.157])
 (Authenticated sender: clg@kaod.org)
 by player715.ha.ovh.net (Postfix) with ESMTPSA id 9F722850BB5D;
 Wed, 31 Jul 2019 14:13:49 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Date: Wed, 31 Jul 2019 16:12:26 +0200
Message-Id: <20190731141233.1340-12-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190731141233.1340-1-clg@kaod.org>
References: <20190731141233.1340-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 11683181858492746726
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduvddrleehgdejvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 87.98.158.110
Subject: [Qemu-devel] [PATCH v3 11/18] ppc/xive: Synthesize interrupt from
 the saved IPB in the NVT
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

When an interrupt can not be presented to a vCPU, the XIVE presenter
updates the Interrupt Pending Buffer of the XIVE NVT if backlog is
activated in the END.

Later, when the same vCPU is dispatched, its context is pushed in the
thread context registers and the VO bit is set in the CAM line word to
activate the context. The HW grabs the associated NVT to pull the
pending bits, and merges them with the IPB of the TIMA. If interrupts
were missed while the vCPU was not dispatched, these are synthesized
in this sequence.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/ppc/xive.h      |  5 ---
 include/hw/ppc/xive_regs.h | 22 +++++++++++++
 hw/intc/xive.c             | 67 +++++++++++++++++++++++++++++++++-----
 3 files changed, 81 insertions(+), 13 deletions(-)

diff --git a/include/hw/ppc/xive.h b/include/hw/ppc/xive.h
index 4233773bae11..e16c3b63fc44 100644
--- a/include/hw/ppc/xive.h
+++ b/include/hw/ppc/xive.h
@@ -470,11 +470,6 @@ void xive_tctx_pic_print_info(XiveTCTX *tctx, Monito=
r *mon);
 Object *xive_tctx_create(Object *cpu, XiveRouter *xrtr, Error **errp);
 void xive_tctx_ipb_update(XiveTCTX *tctx, uint8_t ring, uint8_t ipb);
=20
-static inline uint32_t xive_nvt_cam_line(uint8_t nvt_blk, uint32_t nvt_i=
dx)
-{
-    return (nvt_blk << 19) | nvt_idx;
-}
-
 /*
  * KVM XIVE device helpers
  */
diff --git a/include/hw/ppc/xive_regs.h b/include/hw/ppc/xive_regs.h
index 3fdf1a83b9b6..92ff80d25456 100644
--- a/include/hw/ppc/xive_regs.h
+++ b/include/hw/ppc/xive_regs.h
@@ -232,6 +232,7 @@ typedef struct XiveNVT {
         uint32_t        w2;
         uint32_t        w3;
         uint32_t        w4;
+#define NVT_W4_IPB               PPC_BITMASK32(16, 23)
         uint32_t        w5;
         uint32_t        w6;
         uint32_t        w7;
@@ -248,4 +249,25 @@ typedef struct XiveNVT {
=20
 #define xive_nvt_is_valid(nvt)    (be32_to_cpu((nvt)->w0) & NVT_W0_VALID=
)
=20
+/*
+ * The VP number space in a block is defined by the END_W6_NVT_INDEX
+ * field of the XIVE END
+ */
+#define XIVE_NVT_SHIFT                19
+
+static inline uint32_t xive_nvt_cam_line(uint8_t nvt_blk, uint32_t nvt_i=
dx)
+{
+    return (nvt_blk << XIVE_NVT_SHIFT) | nvt_idx;
+}
+
+static inline uint32_t xive_nvt_idx(uint32_t cam_line)
+{
+    return cam_line & ((1 << XIVE_NVT_SHIFT) - 1);
+}
+
+static inline uint32_t xive_nvt_blk(uint32_t cam_line)
+{
+    return (cam_line >> XIVE_NVT_SHIFT) & 0xf;
+}
+
 #endif /* PPC_XIVE_REGS_H */
diff --git a/hw/intc/xive.c b/hw/intc/xive.c
index 8f6a29ff1f47..9b02ce423d66 100644
--- a/hw/intc/xive.c
+++ b/hw/intc/xive.c
@@ -44,12 +44,6 @@ static uint8_t ipb_to_pipr(uint8_t ibp)
     return ibp ? clz32((uint32_t)ibp << 24) : 0xff;
 }
=20
-static void ipb_update(uint8_t *regs, uint8_t priority)
-{
-    regs[TM_IPB] |=3D priority_to_ipb(priority);
-    regs[TM_PIPR] =3D ipb_to_pipr(regs[TM_IPB]);
-}
-
 static uint8_t exception_mask(uint8_t ring)
 {
     switch (ring) {
@@ -356,6 +350,55 @@ static uint64_t xive_tm_pull_os_ctx(XivePresenter *x=
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
+    uint32_t qw1w2 =3D value;
+    uint8_t nvt_blk =3D xive_nvt_blk(qw1w2);
+    uint32_t nvt_idx =3D xive_nvt_idx(qw1w2);
+    bool vo =3D !!(qw1w2 & TM_QW1W2_VO);
+
+    /* First update the registers */
+    qw1w2 =3D cpu_to_be32(qw1w2);
+    memcpy(&tctx->regs[TM_QW1_OS + TM_WORD2], &qw1w2, 4);
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
@@ -377,6 +420,7 @@ static const XiveTmOp xive_tm_operations[] =3D {
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
@@ -1501,14 +1545,21 @@ static void xive_router_end_notify(XiveRouter *xr=
tr, uint8_t end_blk,
      * - logical server : forward request to IVPE (not supported)
      */
     if (xive_end_is_backlog(&end)) {
+        uint8_t ipb;
+
         if (format =3D=3D 1) {
             qemu_log_mask(LOG_GUEST_ERROR,
                           "XIVE: END %x/%x invalid config: F1 & backlog\=
n",
                           end_blk, end_idx);
             return;
         }
-        /* Record the IPB in the associated NVT structure */
-        ipb_update((uint8_t *) &nvt.w4, priority);
+        /*
+         * Record the IPB in the associated NVT structure for later
+         * use. The presenter will resend the interrupt when the vCPU
+         * is dispatched again on a HW thread.
+         */
+        ipb =3D xive_get_field32(NVT_W4_IPB, nvt.w4) | priority_to_ipb(p=
riority);
+        nvt.w4 =3D xive_set_field32(NVT_W4_IPB, nvt.w4, ipb);
         xive_router_write_nvt(xrtr, nvt_blk, nvt_idx, &nvt, 4);
=20
         /*
--=20
2.21.0


