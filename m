Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D0D1D18E1
	for <lists+qemu-devel@lfdr.de>; Wed, 13 May 2020 17:13:15 +0200 (CEST)
Received: from localhost ([::1]:50698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jYt4M-0005DK-SI
	for lists+qemu-devel@lfdr.de; Wed, 13 May 2020 11:13:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1jYt38-0003RK-PJ
 for qemu-devel@nongnu.org; Wed, 13 May 2020 11:11:58 -0400
Received: from 8.mo7.mail-out.ovh.net ([46.105.77.114]:39213)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1jYt37-0005Nx-Mc
 for qemu-devel@nongnu.org; Wed, 13 May 2020 11:11:58 -0400
Received: from player791.ha.ovh.net (unknown [10.108.35.240])
 by mo7.mail-out.ovh.net (Postfix) with ESMTP id 96E1A163B35
 for <qemu-devel@nongnu.org>; Wed, 13 May 2020 17:11:55 +0200 (CEST)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player791.ha.ovh.net (Postfix) with ESMTPSA id 3AA531244BC7B;
 Wed, 13 May 2020 15:11:50 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: [PATCH 4/9] ppc/xive2: Introduce a presenter matching routine
Date: Wed, 13 May 2020 17:11:04 +0200
Message-Id: <20200513151109.453530-5-clg@kaod.org>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200513151109.453530-1-clg@kaod.org>
References: <20200513151109.453530-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 1025413341232532454
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduhedrleeggdekgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepgfeitedvfedugeehvdevjeduiefhieetffejteejueekhffggfevudegudegudfgnecukfhppedtrddtrddtrddtpdekvddrieegrddvhedtrddujedtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeeluddrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhg
Received-SPF: pass client-ip=46.105.77.114; envelope-from=clg@kaod.org;
 helo=8.mo7.mail-out.ovh.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/13 11:11:55
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
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
 include/hw/ppc/xive2.h |  9 +++++
 hw/intc/xive2.c        | 87 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 96 insertions(+)

diff --git a/include/hw/ppc/xive2.h b/include/hw/ppc/xive2.h
index cb15487efdb6..4aefca4d96f1 100644
--- a/include/hw/ppc/xive2.h
+++ b/include/hw/ppc/xive2.h
@@ -60,6 +60,15 @@ int xive2_router_write_nvp(Xive2Router *xrtr, uint8_t nvt_blk, uint32_t nvt_idx,
 
 void xive2_router_notify(XiveNotifier *xn, uint32_t lisn);
 
+/*
+ * XIVE2 Presenter (POWER10)
+ */
+
+int xive2_presenter_tctx_match(XivePresenter *xptr, XiveTCTX *tctx,
+                                uint8_t format,
+                                uint8_t nvt_blk, uint32_t nvt_idx,
+                                bool cam_ignore, uint32_t logic_serv);
+
 /*
  * XIVE2 END ESBs  (POWER10)
  */
diff --git a/hw/intc/xive2.c b/hw/intc/xive2.c
index 15ea04cf1822..1ce9d995e990 100644
--- a/hw/intc/xive2.c
+++ b/hw/intc/xive2.c
@@ -20,6 +20,11 @@
 #include "hw/ppc/xive2.h"
 #include "hw/ppc/xive2_regs.h"
 
+static inline uint32_t xive_tctx_word2(uint8_t *ring)
+{
+    return *((uint32_t *) &ring[TM_WORD2]);
+}
+
 static uint8_t priority_to_ipb(uint8_t priority)
 {
     return priority > XIVE_PRIORITY_MAX ?
@@ -212,6 +217,88 @@ static int xive2_router_get_block_id(Xive2Router *xrtr)
    return xrc->get_block_id(xrtr);
 }
 
+/*
+ * Encode the HW CAM line with 7bit or 8bit thread id. The thread id
+ * width and block id width is configurable at the IC level.
+ *
+ *    chipid << 19 | 0000000 0 0001 threadid (7Bit)
+ *    chipid << 24 | 0000 0000 0000 0001 threadid (8Bit)
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
+                                uint8_t format,
+                                uint8_t nvt_blk, uint32_t nvt_idx,
+                                bool cam_ignore, uint32_t logic_serv)
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
+             return -1;
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
2.25.4


