Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3EC445EDC5
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Nov 2021 13:19:04 +0100 (CET)
Received: from localhost ([::1]:38248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqaBz-0001eP-IM
	for lists+qemu-devel@lfdr.de; Fri, 26 Nov 2021 07:19:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mqZo2-0003Y1-Oe
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 06:54:19 -0500
Received: from smtpout3.mo529.mail-out.ovh.net ([46.105.54.81]:57077)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mqZnm-0007UP-1J
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 06:54:09 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.15])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id DC21CCE26F1E;
 Fri, 26 Nov 2021 12:54:00 +0100 (CET)
Received: from kaod.org (37.59.142.105) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Fri, 26 Nov
 2021 12:54:00 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G006126c8d8b-1f35-46f0-a6d0-ab3911199c7f,
 B8303126CBA279BD35B7DF0844B381DDFAFB7782) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: <qemu-ppc@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [PATCH v3 14/18] ppc/pnv: add XIVE Gen2 TIMA support
Date: Fri, 26 Nov 2021 12:53:45 +0100
Message-ID: <20211126115349.2737605-15-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211126115349.2737605-1-clg@kaod.org>
References: <20211126115349.2737605-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 62706084-e105-40da-9c22-afe7015f993e
X-Ovh-Tracer-Id: 14616432591104936812
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrhedvgdefvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehheefgeejiedtffefteejudevjeeufeeugfdtfeeuleeuteevleeihffhgfdtleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtheenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=46.105.54.81; envelope-from=clg@kaod.org;
 helo=smtpout3.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, Greg Kurz <groug@kaod.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Frederic Barrat <fbarrat@linux.ibm.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Only the CAM line updates done by the hypervisor are specific to
POWER10. Instead of duplicating the TM ops table, we handle these
commands locally under the PowerNV XIVE2 model.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/ppc/xive2.h |  8 ++++
 hw/intc/pnv_xive2.c    | 27 +++++++++++-
 hw/intc/xive2.c        | 95 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 128 insertions(+), 2 deletions(-)

diff --git a/include/hw/ppc/xive2.h b/include/hw/ppc/xive2.h
index 9222b5b36979..cf6211a0ecb9 100644
--- a/include/hw/ppc/xive2.h
+++ b/include/hw/ppc/xive2.h
@@ -87,5 +87,13 @@ typedef struct Xive2EndSource {
     Xive2Router     *xrtr;
 } Xive2EndSource;
 
+/*
+ * XIVE2 Thread Interrupt Management Area (POWER10)
+ */
+
+void xive2_tm_push_os_ctx(XivePresenter *xptr, XiveTCTX *tctx, hwaddr offset,
+                           uint64_t value, unsigned size);
+uint64_t xive2_tm_pull_os_ctx(XivePresenter *xptr, XiveTCTX *tctx,
+                               hwaddr offset, unsigned size);
 
 #endif /* PPC_XIVE2_H */
diff --git a/hw/intc/pnv_xive2.c b/hw/intc/pnv_xive2.c
index cb12cea14fc6..4a2649893232 100644
--- a/hw/intc/pnv_xive2.c
+++ b/hw/intc/pnv_xive2.c
@@ -1610,15 +1610,32 @@ static const MemoryRegionOps pnv_xive2_ic_tm_indirect_ops = {
  * TIMA ops
  */
 
+/*
+ * Special TIMA offsets to handle accesses in a POWER10 way.
+ *
+ * Only the CAM line updates done by the hypervisor should be handled
+ * specifically.
+ */
+#define HV_PAGE_OFFSET         (XIVE_TM_HV_PAGE << TM_SHIFT)
+#define HV_PUSH_OS_CTX_OFFSET  (HV_PAGE_OFFSET | (TM_QW1_OS + TM_WORD2))
+#define HV_PULL_OS_CTX_OFFSET  (HV_PAGE_OFFSET | TM_SPC_PULL_OS_CTX)
+
 static void pnv_xive2_tm_write(void *opaque, hwaddr offset,
                                uint64_t value, unsigned size)
 {
     PowerPCCPU *cpu = POWERPC_CPU(current_cpu);
     PnvXive2 *xive = pnv_xive2_tm_get_xive(cpu);
     XiveTCTX *tctx = XIVE_TCTX(pnv_cpu_state(cpu)->intc);
+    XivePresenter *xptr = XIVE_PRESENTER(xive);
+
+    /* TODO: should we switch the TM ops table instead ? */
+    if (offset == HV_PUSH_OS_CTX_OFFSET) {
+        xive2_tm_push_os_ctx(xptr, tctx, offset, value, size);
+        return;
+    }
 
     /* Other TM ops are the same as XIVE1 */
-    xive_tctx_tm_write(XIVE_PRESENTER(xive), tctx, offset, value, size);
+    xive_tctx_tm_write(xptr, tctx, offset, value, size);
 }
 
 static uint64_t pnv_xive2_tm_read(void *opaque, hwaddr offset, unsigned size)
@@ -1626,9 +1643,15 @@ static uint64_t pnv_xive2_tm_read(void *opaque, hwaddr offset, unsigned size)
     PowerPCCPU *cpu = POWERPC_CPU(current_cpu);
     PnvXive2 *xive = pnv_xive2_tm_get_xive(cpu);
     XiveTCTX *tctx = XIVE_TCTX(pnv_cpu_state(cpu)->intc);
+    XivePresenter *xptr = XIVE_PRESENTER(xive);
+
+    /* TODO: should we switch the TM ops table instead ? */
+    if (offset == HV_PULL_OS_CTX_OFFSET) {
+        return xive2_tm_pull_os_ctx(xptr, tctx, offset, size);
+    }
 
     /* Other TM ops are the same as XIVE1 */
-    return xive_tctx_tm_read(XIVE_PRESENTER(xive), tctx, offset, size);
+    return xive_tctx_tm_read(xptr, tctx, offset, size);
 }
 
 static const MemoryRegionOps pnv_xive2_tm_ops = {
diff --git a/hw/intc/xive2.c b/hw/intc/xive2.c
index 26af08a5de07..e31037e1f030 100644
--- a/hw/intc/xive2.c
+++ b/hw/intc/xive2.c
@@ -158,6 +158,101 @@ static void xive2_end_enqueue(Xive2End *end, uint32_t data)
     }
     end->w1 = xive_set_field32(END2_W1_PAGE_OFF, end->w1, qindex);
 }
+
+/*
+ * XIVE Thread Interrupt Management Area (TIMA) - Gen2 mode
+ */
+
+static void xive2_os_cam_decode(uint32_t cam, uint8_t *nvp_blk,
+                                uint32_t *nvp_idx, bool *vo)
+{
+    *nvp_blk = xive2_nvp_blk(cam);
+    *nvp_idx = xive2_nvp_idx(cam);
+    *vo = !!(cam & TM2_QW1W2_VO);
+}
+
+uint64_t xive2_tm_pull_os_ctx(XivePresenter *xptr, XiveTCTX *tctx,
+                              hwaddr offset, unsigned size)
+{
+    uint32_t qw1w2 = xive_tctx_word2(&tctx->regs[TM_QW1_OS]);
+    uint32_t qw1w2_new;
+    uint32_t cam = be32_to_cpu(qw1w2);
+    uint8_t nvp_blk;
+    uint32_t nvp_idx;
+    bool vo;
+
+    xive2_os_cam_decode(cam, &nvp_blk, &nvp_idx, &vo);
+
+    if (!vo) {
+        qemu_log_mask(LOG_GUEST_ERROR, "XIVE: pulling invalid NVP %x/%x !?\n",
+                      nvp_blk, nvp_idx);
+    }
+
+    /* Invalidate CAM line */
+    qw1w2_new = xive_set_field32(TM2_QW1W2_VO, qw1w2, 0);
+    memcpy(&tctx->regs[TM_QW1_OS + TM_WORD2], &qw1w2_new, 4);
+
+    return qw1w2;
+}
+
+static void xive2_tctx_need_resend(Xive2Router *xrtr, XiveTCTX *tctx,
+                                   uint8_t nvp_blk, uint32_t nvp_idx)
+{
+    Xive2Nvp nvp;
+    uint8_t ipb;
+    uint8_t cppr = 0;
+
+    /*
+     * Grab the associated thread interrupt context registers in the
+     * associated NVP
+     */
+    if (xive2_router_get_nvp(xrtr, nvp_blk, nvp_idx, &nvp)) {
+        qemu_log_mask(LOG_GUEST_ERROR, "XIVE: No NVP %x/%x\n",
+                      nvp_blk, nvp_idx);
+        return;
+    }
+
+    if (!xive2_nvp_is_valid(&nvp)) {
+        qemu_log_mask(LOG_GUEST_ERROR, "XIVE: invalid NVP %x/%x\n",
+                      nvp_blk, nvp_idx);
+        return;
+    }
+
+    ipb = xive_get_field32(NVP2_W2_IPB, nvp.w2);
+    if (ipb) {
+        nvp.w2 = xive_set_field32(NVP2_W2_IPB, nvp.w2, 0);
+        xive2_router_write_nvp(xrtr, nvp_blk, nvp_idx, &nvp, 2);
+    }
+
+    /* An IPB or CPPR change can trigger a resend */
+    if (ipb || cppr) {
+        xive_tctx_ipb_update(tctx, TM_QW1_OS, ipb);
+    }
+}
+
+/*
+ * Updating the OS CAM line can trigger a resend of interrupt
+ */
+void xive2_tm_push_os_ctx(XivePresenter *xptr, XiveTCTX *tctx,
+                          hwaddr offset, uint64_t value, unsigned size)
+{
+    uint32_t cam = value;
+    uint32_t qw1w2 = cpu_to_be32(cam);
+    uint8_t nvp_blk;
+    uint32_t nvp_idx;
+    bool vo;
+
+    xive2_os_cam_decode(cam, &nvp_blk, &nvp_idx, &vo);
+
+    /* First update the thead context */
+    memcpy(&tctx->regs[TM_QW1_OS + TM_WORD2], &qw1w2, 4);
+
+    /* Check the interrupt pending bits */
+    if (vo) {
+        xive2_tctx_need_resend(XIVE2_ROUTER(xptr), tctx, nvp_blk, nvp_idx);
+    }
+}
+
 /*
  * XIVE Router (aka. Virtualization Controller or IVRE)
  */
-- 
2.31.1


