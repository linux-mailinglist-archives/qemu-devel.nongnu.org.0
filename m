Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5564E3FEECD
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 15:37:44 +0200 (CEST)
Received: from localhost ([::1]:44502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLmuV-0007ly-EY
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 09:37:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mLmTY-0006Rx-R3
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 09:09:52 -0400
Received: from 1.mo52.mail-out.ovh.net ([178.32.96.117]:57483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mLmTP-0001ts-Ev
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 09:09:52 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.48])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id 5A334295F3C;
 Thu,  2 Sep 2021 15:09:34 +0200 (CEST)
Received: from kaod.org (37.59.142.101) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Thu, 2 Sep
 2021 15:09:32 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G00440870221-4fd5-48d0-aea0-001163a166b7,
 0F69C8711EE098B745CC44F7BEC1CAFBB1DDDEDC) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
Subject: [PATCH v2 04/20] ppc/xive2: Introduce a presenter matching routine
Date: Thu, 2 Sep 2021 15:09:12 +0200
Message-ID: <20210902130928.528803-5-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210902130928.528803-1-clg@kaod.org>
References: <20210902130928.528803-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG5EX1.mxp5.local (172.16.2.41) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 11eabdd9-f3d2-4eba-aae1-e1146acb85eb
X-Ovh-Tracer-Id: 14775184480637914019
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddruddvhedgiedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfgggtgfhisehtkeertdertdejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepheehfeegjeeitdfffeetjeduveejueefuefgtdefueelueetveeliefhhffgtdelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=178.32.96.117; envelope-from=clg@kaod.org;
 helo=1.mo52.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The VP space is larger in XIVE2 (P10), 24 bits instead of 19bits on
XIVE (P9), and the CAM line can use a 7bits or 8bits thread id.

For now, we only use 7bits thread ids, same as P9, but because of the
change of the size of the VP space, the CAM matching routine is
different between P9 and P10. It is easier to duplicate the whole
routine than to add extra handlers in xive_presenter_tctx_match() used
for P9.

We might come with a better solution later on, after we have added
some more support for the XIVE2 controller.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---

 v2: fixed alignment
 
 include/hw/ppc/xive2.h |  9 +++++
 hw/intc/xive2.c        | 82 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 91 insertions(+)

diff --git a/include/hw/ppc/xive2.h b/include/hw/ppc/xive2.h
index a3cd02520475..e881c039d9c0 100644
--- a/include/hw/ppc/xive2.h
+++ b/include/hw/ppc/xive2.h
@@ -55,6 +55,15 @@ int xive2_router_write_nvp(Xive2Router *xrtr, uint8_t nvp_blk, uint32_t nvp_idx,
 
 void xive2_router_notify(XiveNotifier *xn, uint32_t lisn);
 
+/*
+ * XIVE2 Presenter (POWER10)
+ */
+
+int xive2_presenter_tctx_match(XivePresenter *xptr, XiveTCTX *tctx,
+                               uint8_t format,
+                               uint8_t nvt_blk, uint32_t nvt_idx,
+                               bool cam_ignore, uint32_t logic_serv);
+
 /*
  * XIVE2 END ESBs  (POWER10)
  */
diff --git a/hw/intc/xive2.c b/hw/intc/xive2.c
index e4aa614f3cc8..9e186bbb6cd9 100644
--- a/hw/intc/xive2.c
+++ b/hw/intc/xive2.c
@@ -209,6 +209,88 @@ static int xive2_router_get_block_id(Xive2Router *xrtr)
    return xrc->get_block_id(xrtr);
 }
 
+/*
+ * Encode the HW CAM line with 7bit or 8bit thread id. The thread id
+ * width and block id width is configurable at the IC level.
+ *
+ *    chipid << 24 | 0000 0000 0000 0000 1 threadid (7Bit)
+ *    chipid << 24 | 0000 0000 0000 0001 threadid   (8Bit)
+ */
+static uint32_t xive2_tctx_hw_cam_line(XivePresenter *xptr, XiveTCTX *tctx)
+{
+    Xive2Router *xrtr = XIVE2_ROUTER(xptr);
+    CPUPPCState *env = &POWERPC_CPU(tctx->cs)->env;
+    uint32_t pir = env->spr_cb[SPR_PIR].default_value;
+    uint8_t blk = xive2_router_get_block_id(xrtr);
+    uint8_t tid_shift = 7;
+    uint8_t tid_mask = (1 << tid_shift) - 1;
+
+    return xive2_nvp_cam_line(blk, 1 << tid_shift | (pir & tid_mask));
+}
+
+/*
+ * The thread context register words are in big-endian format.
+ */
+int xive2_presenter_tctx_match(XivePresenter *xptr, XiveTCTX *tctx,
+                               uint8_t format,
+                               uint8_t nvt_blk, uint32_t nvt_idx,
+                               bool cam_ignore, uint32_t logic_serv)
+{
+    uint32_t cam =   xive2_nvp_cam_line(nvt_blk, nvt_idx);
+    uint32_t qw3w2 = xive_tctx_word2(&tctx->regs[TM_QW3_HV_PHYS]);
+    uint32_t qw2w2 = xive_tctx_word2(&tctx->regs[TM_QW2_HV_POOL]);
+    uint32_t qw1w2 = xive_tctx_word2(&tctx->regs[TM_QW1_OS]);
+    uint32_t qw0w2 = xive_tctx_word2(&tctx->regs[TM_QW0_USER]);
+
+    /*
+     * TODO (PowerNV): ignore mode. The low order bits of the NVT
+     * identifier are ignored in the "CAM" match.
+     */
+
+    if (format == 0) {
+        if (cam_ignore == true) {
+            /*
+             * F=0 & i=1: Logical server notification (bits ignored at
+             * the end of the NVT identifier)
+             */
+            qemu_log_mask(LOG_UNIMP, "XIVE: no support for LS NVT %x/%x\n",
+                          nvt_blk, nvt_idx);
+            return -1;
+        }
+
+        /* F=0 & i=0: Specific NVT notification */
+
+        /* PHYS ring */
+        if ((be32_to_cpu(qw3w2) & TM2_QW3W2_VT) &&
+            cam == xive2_tctx_hw_cam_line(xptr, tctx)) {
+            return TM_QW3_HV_PHYS;
+        }
+
+        /* HV POOL ring */
+        if ((be32_to_cpu(qw2w2) & TM2_QW2W2_VP) &&
+            cam == xive_get_field32(TM2_QW2W2_POOL_CAM, qw2w2)) {
+            return TM_QW2_HV_POOL;
+        }
+
+        /* OS ring */
+        if ((be32_to_cpu(qw1w2) & TM2_QW1W2_VO) &&
+            cam == xive_get_field32(TM2_QW1W2_OS_CAM, qw1w2)) {
+            return TM_QW1_OS;
+        }
+    } else {
+        /* F=1 : User level Event-Based Branch (EBB) notification */
+
+        /* USER ring */
+        if  ((be32_to_cpu(qw1w2) & TM2_QW1W2_VO) &&
+             (cam == xive_get_field32(TM2_QW1W2_OS_CAM, qw1w2)) &&
+             (be32_to_cpu(qw0w2) & TM2_QW0W2_VU) &&
+             (logic_serv == xive_get_field32(TM2_QW0W2_LOGIC_SERV, qw0w2))) {
+            return TM_QW0_USER;
+        }
+    }
+    return -1;
+}
+
 static void xive2_router_realize(DeviceState *dev, Error **errp)
 {
     Xive2Router *xrtr = XIVE2_ROUTER(dev);
-- 
2.31.1


