Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 047B045EDBB
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Nov 2021 13:15:46 +0100 (CET)
Received: from localhost ([::1]:58658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqa8n-0004hN-3P
	for lists+qemu-devel@lfdr.de; Fri, 26 Nov 2021 07:15:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mqZo2-0003Y4-Ok
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 06:54:19 -0500
Received: from 7.mo548.mail-out.ovh.net ([46.105.33.25]:57381)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mqZno-0007VM-T9
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 06:54:12 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.51])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id A658C211DC;
 Fri, 26 Nov 2021 11:54:02 +0000 (UTC)
Received: from kaod.org (37.59.142.105) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Fri, 26 Nov
 2021 12:54:01 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G0060e5c98a7-f949-430d-84f1-9e38a2caae8e,
 B8303126CBA279BD35B7DF0844B381DDFAFB7782) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: <qemu-ppc@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [PATCH v3 17/18] pnv/xive2: Add support for automatic save&restore
Date: Fri, 26 Nov 2021 12:53:48 +0100
Message-ID: <20211126115349.2737605-18-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211126115349.2737605-1-clg@kaod.org>
References: <20211126115349.2737605-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 511ff12f-4c87-4a4e-8909-50594dac6660
X-Ovh-Tracer-Id: 14616995542174894956
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrhedvgdefvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehheefgeejiedtffefteejudevjeeufeeugfdtfeeuleeuteevleeihffhgfdtleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtheenucevlhhushhtvghrufhiiigvpeegnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=46.105.33.25; envelope-from=clg@kaod.org;
 helo=7.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

The XIVE interrupt controller on P10 can automatically save and
restore the state of the interrupt registers under the internal NVP
structure representing the VCPU. This saves a costly store/load in
guest entries and exits.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/intc/pnv_xive2_regs.h    |   3 +
 include/hw/ppc/xive2.h      |   1 +
 include/hw/ppc/xive2_regs.h |  12 ++++
 hw/intc/pnv_xive2.c         |  18 +++++-
 hw/intc/xive2.c             | 126 ++++++++++++++++++++++++++++++++++--
 5 files changed, 154 insertions(+), 6 deletions(-)

diff --git a/hw/intc/pnv_xive2_regs.h b/hw/intc/pnv_xive2_regs.h
index 902220e6be69..3488ae188938 100644
--- a/hw/intc/pnv_xive2_regs.h
+++ b/hw/intc/pnv_xive2_regs.h
@@ -30,6 +30,7 @@
 #define       CQ_XIVE_CAP_VP_INT_PRIO_4_8       2
 #define       CQ_XIVE_CAP_VP_INT_PRIO_8         3
 #define    CQ_XIVE_CAP_BLOCK_ID_WIDTH           PPC_BITMASK(12, 13)
+#define    CQ_XIVE_CAP_VP_SAVE_RESTORE          PPC_BIT(38)
 
 #define    CQ_XIVE_CAP_PHB_PQ_DISABLE           PPC_BIT(56)
 #define    CQ_XIVE_CAP_PHB_ABT                  PPC_BIT(57)
@@ -65,6 +66,8 @@
 #define    CQ_XIVE_CFG_GEN1_TIMA_HYP_BLK0       PPC_BIT(26) /* 0 if bit[25]=0 */
 #define    CQ_XIVE_CFG_GEN1_TIMA_CROWD_DIS      PPC_BIT(27) /* 0 if bit[25]=0 */
 #define    CQ_XIVE_CFG_GEN1_END_ESX             PPC_BIT(28)
+#define    CQ_XIVE_CFG_EN_VP_SAVE_RESTORE       PPC_BIT(38) /* 0 if bit[25]=1 */
+#define    CQ_XIVE_CFG_EN_VP_SAVE_REST_STRICT   PPC_BIT(39) /* 0 if bit[25]=1 */
 
 /* Interrupt Controller Base Address Register - 512 pages (32M) */
 #define X_CQ_IC_BAR                             0x08
diff --git a/include/hw/ppc/xive2.h b/include/hw/ppc/xive2.h
index b08600cbd5ee..88c3e393162d 100644
--- a/include/hw/ppc/xive2.h
+++ b/include/hw/ppc/xive2.h
@@ -30,6 +30,7 @@ OBJECT_DECLARE_TYPE(Xive2Router, Xive2RouterClass, XIVE2_ROUTER);
  */
 
 #define XIVE2_GEN1_TIMA_OS      0x00000001
+#define XIVE2_VP_SAVE_RESTORE   0x00000002
 
 typedef struct Xive2RouterClass {
     SysBusDeviceClass parent;
diff --git a/include/hw/ppc/xive2_regs.h b/include/hw/ppc/xive2_regs.h
index f4827f4c6d54..d214b49bef75 100644
--- a/include/hw/ppc/xive2_regs.h
+++ b/include/hw/ppc/xive2_regs.h
@@ -20,10 +20,13 @@
 #define   TM2_QW0W2_VU           PPC_BIT32(0)
 #define   TM2_QW0W2_LOGIC_SERV   PPC_BITMASK32(4, 31)
 #define   TM2_QW1W2_VO           PPC_BIT32(0)
+#define   TM2_QW1W2_HO           PPC_BIT32(1)
 #define   TM2_QW1W2_OS_CAM       PPC_BITMASK32(4, 31)
 #define   TM2_QW2W2_VP           PPC_BIT32(0)
+#define   TM2_QW2W2_HP           PPC_BIT32(1)
 #define   TM2_QW2W2_POOL_CAM     PPC_BITMASK32(4, 31)
 #define   TM2_QW3W2_VT           PPC_BIT32(0)
+#define   TM2_QW3W2_HT           PPC_BIT32(1)
 #define   TM2_QW3W2_LP           PPC_BIT32(6)
 #define   TM2_QW3W2_LE           PPC_BIT32(7)
 
@@ -137,10 +140,17 @@ void xive2_end_eas_pic_print_info(Xive2End *end, uint32_t end_idx,
 typedef struct Xive2Nvp {
         uint32_t       w0;
 #define NVP2_W0_VALID              PPC_BIT32(0)
+#define NVP2_W0_HW                 PPC_BIT32(7)
 #define NVP2_W0_ESC_END            PPC_BIT32(25) /* 'N' bit 0:ESB  1:END */
         uint32_t       w1;
+#define NVP2_W1_CO                 PPC_BIT32(13)
+#define NVP2_W1_CO_PRIV            PPC_BITMASK32(14, 15)
+#define NVP2_W1_CO_THRID_VALID     PPC_BIT32(16)
+#define NVP2_W1_CO_THRID           PPC_BITMASK32(17, 31)
         uint32_t       w2;
+#define NVP2_W2_CPPR               PPC_BITMASK32(0, 7)
 #define NVP2_W2_IPB                PPC_BITMASK32(8, 15)
+#define NVP2_W2_LSMFB              PPC_BITMASK32(16, 23)
         uint32_t       w3;
         uint32_t       w4;
 #define NVP2_W4_ESC_ESB_BLOCK      PPC_BITMASK32(0, 3)  /* N:0 */
@@ -156,6 +166,8 @@ typedef struct Xive2Nvp {
 } Xive2Nvp;
 
 #define xive2_nvp_is_valid(nvp)    (be32_to_cpu((nvp)->w0) & NVP2_W0_VALID)
+#define xive2_nvp_is_hw(nvp)       (be32_to_cpu((nvp)->w0) & NVP2_W0_HW)
+#define xive2_nvp_is_co(nvp)       (be32_to_cpu((nvp)->w1) & NVP2_W1_CO)
 
 /*
  * The VP number space in a block is defined by the END2_W6_VP_OFFSET
diff --git a/hw/intc/pnv_xive2.c b/hw/intc/pnv_xive2.c
index 2b7d6ccbd097..6f0a63cd3d2f 100644
--- a/hw/intc/pnv_xive2.c
+++ b/hw/intc/pnv_xive2.c
@@ -434,6 +434,10 @@ static uint32_t pnv_xive2_get_config(Xive2Router *xrtr)
         cfg |= XIVE2_GEN1_TIMA_OS;
     }
 
+    if (xive->cq_regs[CQ_XIVE_CFG >> 3] & CQ_XIVE_CFG_EN_VP_SAVE_RESTORE) {
+        cfg |= XIVE2_VP_SAVE_RESTORE;
+    }
+
     return cfg;
 }
 
@@ -1999,9 +2003,21 @@ static void xive2_nvp_pic_print_info(Xive2Nvp *nvp, uint32_t nvp_idx,
         return;
     }
 
-    monitor_printf(mon, "  %08x end:%02x/%04x IPB:%02x\n",
+    monitor_printf(mon, "  %08x end:%02x/%04x IPB:%02x",
                    nvp_idx, eq_blk, eq_idx,
                    xive_get_field32(NVP2_W2_IPB, nvp->w2));
+    /*
+     * When the NVP is HW controlled, more fields are updated
+     */
+    if (xive2_nvp_is_hw(nvp)) {
+        monitor_printf(mon, " CPPR:%02x",
+                       xive_get_field32(NVP2_W2_CPPR, nvp->w2));
+        if (xive2_nvp_is_co(nvp)) {
+            monitor_printf(mon, " CO:%04x",
+                           xive_get_field32(NVP2_W1_CO_THRID, nvp->w1));
+        }
+    }
+    monitor_printf(mon, "\n");
 }
 
 /*
diff --git a/hw/intc/xive2.c b/hw/intc/xive2.c
index 71086c7fbd01..978a0e3972e1 100644
--- a/hw/intc/xive2.c
+++ b/hw/intc/xive2.c
@@ -168,27 +168,92 @@ static void xive2_end_enqueue(Xive2End *end, uint32_t data)
 
 /*
  * XIVE Thread Interrupt Management Area (TIMA) - Gen2 mode
+ *
+ * TIMA Gen2 VP “save & restore” (S&R) indicated by H bit next to V bit
+ *
+ *   - if a context is enabled with the H bit set, the VP context
+ *     information is retrieved from the NVP structure (“check out”)
+ *     and stored back on a context pull (“check in”), the SW receives
+ *     the same context pull information as on P9
+ *
+ *   - the H bit cannot be changed while the V bit is set, i.e. a
+ *     context cannot be set up in the TIMA and then be “pushed” into
+ *     the NVP by changing the H bit while the context is enabled
  */
 
+static void xive2_tctx_save_os_ctx(Xive2Router *xrtr, XiveTCTX *tctx,
+                                   uint8_t nvp_blk, uint32_t nvp_idx)
+{
+    CPUPPCState *env = &POWERPC_CPU(tctx->cs)->env;
+    uint32_t pir = env->spr_cb[SPR_PIR].default_value;
+    Xive2Nvp nvp;
+    uint8_t *regs = &tctx->regs[TM_QW1_OS];
+
+    if (xive2_router_get_nvp(xrtr, nvp_blk, nvp_idx, &nvp)) {
+        qemu_log_mask(LOG_GUEST_ERROR, "XIVE: No NVP %x/%x\n",
+                          nvp_blk, nvp_idx);
+        return;
+    }
+
+    if (!xive2_nvp_is_valid(&nvp)) {
+        qemu_log_mask(LOG_GUEST_ERROR, "XIVE: invalid NVP %x/%x\n",
+                      nvp_blk, nvp_idx);
+        return;
+    }
+
+    if (!xive2_nvp_is_hw(&nvp)) {
+        qemu_log_mask(LOG_GUEST_ERROR, "XIVE: NVP %x/%x is not HW owned\n",
+                      nvp_blk, nvp_idx);
+        return;
+    }
+
+    if (!xive2_nvp_is_co(&nvp)) {
+        qemu_log_mask(LOG_GUEST_ERROR, "XIVE: NVP %x/%x is not checkout\n",
+                      nvp_blk, nvp_idx);
+        return;
+    }
+
+    if (xive_get_field32(NVP2_W1_CO_THRID_VALID, nvp.w1) &&
+        xive_get_field32(NVP2_W1_CO_THRID, nvp.w1) != pir) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "XIVE: NVP %x/%x invalid checkout Thread %x\n",
+                      nvp_blk, nvp_idx, pir);
+        return;
+    }
+
+    nvp.w2 = xive_set_field32(NVP2_W2_IPB, nvp.w2, regs[TM_IPB]);
+    nvp.w2 = xive_set_field32(NVP2_W2_CPPR, nvp.w2, regs[TM_CPPR]);
+    nvp.w2 = xive_set_field32(NVP2_W2_LSMFB, nvp.w2, regs[TM_LSMFB]);
+    xive2_router_write_nvp(xrtr, nvp_blk, nvp_idx, &nvp, 2);
+
+    nvp.w1 = xive_set_field32(NVP2_W1_CO, nvp.w1, 0);
+    /* NVP2_W1_CO_THRID_VALID only set once */
+    nvp.w1 = xive_set_field32(NVP2_W1_CO_THRID, nvp.w1, 0xFFFF);
+    xive2_router_write_nvp(xrtr, nvp_blk, nvp_idx, &nvp, 1);
+}
+
 static void xive2_os_cam_decode(uint32_t cam, uint8_t *nvp_blk,
-                                uint32_t *nvp_idx, bool *vo)
+                                uint32_t *nvp_idx, bool *vo, bool *ho)
 {
     *nvp_blk = xive2_nvp_blk(cam);
     *nvp_idx = xive2_nvp_idx(cam);
     *vo = !!(cam & TM2_QW1W2_VO);
+    *ho = !!(cam & TM2_QW1W2_HO);
 }
 
 uint64_t xive2_tm_pull_os_ctx(XivePresenter *xptr, XiveTCTX *tctx,
                               hwaddr offset, unsigned size)
 {
+    Xive2Router *xrtr = XIVE2_ROUTER(xptr);
     uint32_t qw1w2 = xive_tctx_word2(&tctx->regs[TM_QW1_OS]);
     uint32_t qw1w2_new;
     uint32_t cam = be32_to_cpu(qw1w2);
     uint8_t nvp_blk;
     uint32_t nvp_idx;
     bool vo;
+    bool do_save;
 
-    xive2_os_cam_decode(cam, &nvp_blk, &nvp_idx, &vo);
+    xive2_os_cam_decode(cam, &nvp_blk, &nvp_idx, &vo, &do_save);
 
     if (!vo) {
         qemu_log_mask(LOG_GUEST_ERROR, "XIVE: pulling invalid NVP %x/%x !?\n",
@@ -199,11 +264,54 @@ uint64_t xive2_tm_pull_os_ctx(XivePresenter *xptr, XiveTCTX *tctx,
     qw1w2_new = xive_set_field32(TM2_QW1W2_VO, qw1w2, 0);
     memcpy(&tctx->regs[TM_QW1_OS + TM_WORD2], &qw1w2_new, 4);
 
+    if (xive2_router_get_config(xrtr) & XIVE2_VP_SAVE_RESTORE && do_save) {
+        xive2_tctx_save_os_ctx(xrtr, tctx, nvp_blk, nvp_idx);
+    }
+
     return qw1w2;
 }
 
+static uint8_t xive2_tctx_restore_os_ctx(Xive2Router *xrtr, XiveTCTX *tctx,
+                                        uint8_t nvp_blk, uint32_t nvp_idx,
+                                        Xive2Nvp *nvp)
+{
+    CPUPPCState *env = &POWERPC_CPU(tctx->cs)->env;
+    uint32_t pir = env->spr_cb[SPR_PIR].default_value;
+    uint8_t cppr;
+
+    if (!xive2_nvp_is_hw(nvp)) {
+        qemu_log_mask(LOG_GUEST_ERROR, "XIVE: NVP %x/%x is not HW owned\n",
+                      nvp_blk, nvp_idx);
+        return 0;
+    }
+
+    cppr = xive_get_field32(NVP2_W2_CPPR, nvp->w2);
+    nvp->w2 = xive_set_field32(NVP2_W2_CPPR, nvp->w2, 0);
+    xive2_router_write_nvp(xrtr, nvp_blk, nvp_idx, nvp, 2);
+
+    tctx->regs[TM_QW1_OS + TM_CPPR] = cppr;
+    /* we don't model LSMFB */
+
+    nvp->w1 = xive_set_field32(NVP2_W1_CO, nvp->w1, 1);
+    nvp->w1 = xive_set_field32(NVP2_W1_CO_THRID_VALID, nvp->w1, 1);
+    nvp->w1 = xive_set_field32(NVP2_W1_CO_THRID, nvp->w1, pir);
+
+    /*
+     * Checkout privilege: 0:OS, 1:Pool, 2:Hard
+     *
+     * TODO: we only support OS push/pull
+     */
+    nvp->w1 = xive_set_field32(NVP2_W1_CO_PRIV, nvp->w1, 0);
+
+    xive2_router_write_nvp(xrtr, nvp_blk, nvp_idx, nvp, 1);
+
+    /* return restored CPPR to generate a CPU exception if needed */
+    return cppr;
+}
+
 static void xive2_tctx_need_resend(Xive2Router *xrtr, XiveTCTX *tctx,
-                                   uint8_t nvp_blk, uint32_t nvp_idx)
+                                   uint8_t nvp_blk, uint32_t nvp_idx,
+                                   bool do_restore)
 {
     Xive2Nvp nvp;
     uint8_t ipb;
@@ -225,6 +333,12 @@ static void xive2_tctx_need_resend(Xive2Router *xrtr, XiveTCTX *tctx,
         return;
     }
 
+    /* Automatically restore thread context registers */
+    if (xive2_router_get_config(xrtr) & XIVE2_VP_SAVE_RESTORE &&
+        do_restore) {
+        cppr = xive2_tctx_restore_os_ctx(xrtr, tctx, nvp_blk, nvp_idx, &nvp);
+    }
+
     ipb = xive_get_field32(NVP2_W2_IPB, nvp.w2);
     if (ipb) {
         nvp.w2 = xive_set_field32(NVP2_W2_IPB, nvp.w2, 0);
@@ -248,15 +362,17 @@ void xive2_tm_push_os_ctx(XivePresenter *xptr, XiveTCTX *tctx,
     uint8_t nvp_blk;
     uint32_t nvp_idx;
     bool vo;
+    bool do_restore;
 
-    xive2_os_cam_decode(cam, &nvp_blk, &nvp_idx, &vo);
+    xive2_os_cam_decode(cam, &nvp_blk, &nvp_idx, &vo, &do_restore);
 
     /* First update the thead context */
     memcpy(&tctx->regs[TM_QW1_OS + TM_WORD2], &qw1w2, 4);
 
     /* Check the interrupt pending bits */
     if (vo) {
-        xive2_tctx_need_resend(XIVE2_ROUTER(xptr), tctx, nvp_blk, nvp_idx);
+        xive2_tctx_need_resend(XIVE2_ROUTER(xptr), tctx, nvp_blk, nvp_idx,
+                               do_restore);
     }
 }
 
-- 
2.31.1


