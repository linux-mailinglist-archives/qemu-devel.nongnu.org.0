Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 374E83A2C86
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 15:10:09 +0200 (CEST)
Received: from localhost ([::1]:50632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrKRk-0007qE-Au
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 09:10:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jakub.jermar@kernkonzept.com>)
 id 1lrJ9v-0003wy-C2
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 07:47:39 -0400
Received: from tmave.modry.cz ([82.208.58.129]:40044)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jakub.jermar@kernkonzept.com>)
 id 1lrJ9h-0000F7-K3
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 07:47:39 -0400
Received: from 93-153-64-87.customers.tmcz.cz ([93.153.64.87]
 helo=octatonsil.dd1.int.kernkonzept.com)
 by tmave.modry.cz with esmtpa (Exim 4.92.3)
 (envelope-from <jakub.jermar@kernkonzept.com>)
 id 1lrJ94-0007pw-9H; Thu, 10 Jun 2021 13:47:20 +0200
From: =?UTF-8?q?Jakub=20Jerm=C3=A1=C5=99?= <jakub.jermar@kernkonzept.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/nvme: be more careful when deasserting IRQs
Date: Thu, 10 Jun 2021 13:46:24 +0200
Message-Id: <20210610114624.304681-1-jakub.jermar@kernkonzept.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -3.4
Received-SPF: softfail client-ip=82.208.58.129;
 envelope-from=jakub.jermar@kernkonzept.com; helo=tmave.modry.cz
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 10 Jun 2021 09:08:55 -0400
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
Cc: =?UTF-8?q?Jakub=20Jerm=C3=A1=C5=99?= <jakub.jermar@kernkonzept.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

An IRQ vector used by a completion queue cannot be deasserted without
first checking if the same vector does not need to stay asserted for
some other completion queue.

Signed-off-by: Jakub Jermar <jakub.jermar@kernkonzept.com>
---
 hw/nvme/ctrl.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 0bcaf7192f..c0980929eb 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -473,6 +473,21 @@ static void nvme_irq_deassert(NvmeCtrl *n, NvmeCQueue *cq)
     }
 }
 
+/*
+ * Check if the vector used by the cq can be deasserted, i.e. it needn't be
+ * asserted for some other cq.
+ */
+static bool nvme_irq_can_deassert(NvmeCtrl *n, NvmeCQueue *cq)
+{
+    for (unsigned qid = 0; qid < n->params.max_ioqpairs + 1; qid++) {
+        NvmeCQueue *q = n->cq[qid];
+
+        if (q && q->vector == cq->vector && q->head != q->tail)
+            return false;  /* some queue needs this to stay asserted */
+    }
+    return true;
+}
+
 static void nvme_req_clear(NvmeRequest *req)
 {
     req->ns = NULL;
@@ -4089,7 +4104,9 @@ static uint16_t nvme_del_cq(NvmeCtrl *n, NvmeRequest *req)
         trace_pci_nvme_err_invalid_del_cq_notempty(qid);
         return NVME_INVALID_QUEUE_DEL;
     }
-    nvme_irq_deassert(n, cq);
+    if (nvme_irq_can_deassert(n, cq)) {
+        nvme_irq_deassert(n, cq);
+    }
     trace_pci_nvme_del_cq(qid);
     nvme_free_cq(cq, n);
     return NVME_SUCCESS;
@@ -5757,7 +5774,7 @@ static void nvme_process_db(NvmeCtrl *n, hwaddr addr, int val)
             timer_mod(cq->timer, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + 500);
         }
 
-        if (cq->tail == cq->head) {
+        if (nvme_irq_can_deassert(n, cq)) {
             nvme_irq_deassert(n, cq);
         }
     } else {
-- 
2.31.1


