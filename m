Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6346D590052
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 17:41:34 +0200 (CEST)
Received: from localhost ([::1]:44670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMAJR-0007q2-AA
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 11:41:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fanjinhao21s@ict.ac.cn>)
 id 1oMAGS-00036m-4H; Thu, 11 Aug 2022 11:38:28 -0400
Received: from smtp21.cstnet.cn ([159.226.251.21]:49836 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fanjinhao21s@ict.ac.cn>)
 id 1oMAGO-00026A-VV; Thu, 11 Aug 2022 11:38:27 -0400
Received: from localhost.localdomain (unknown [159.226.43.62])
 by APP-01 (Coremail) with SMTP id qwCowAA3GFlSIvViGUPiBw--.35837S3;
 Thu, 11 Aug 2022 23:38:13 +0800 (CST)
From: Jinhao Fan <fanjinhao21s@ict.ac.cn>
To: qemu-devel@nongnu.org
Cc: its@irrelevant.dk, kbusch@kernel.org, stefanha@gmail.com,
 Jinhao Fan <fanjinhao21s@ict.ac.cn>, qemu-block@nongnu.org (open list:nvme)
Subject: [PATCH 1/4] hw/nvme: avoid unnecessary call to irq (de)assertion
 functions
Date: Thu, 11 Aug 2022 23:37:36 +0800
Message-Id: <20220811153739.3079672-2-fanjinhao21s@ict.ac.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220811153739.3079672-1-fanjinhao21s@ict.ac.cn>
References: <20220811153739.3079672-1-fanjinhao21s@ict.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowAA3GFlSIvViGUPiBw--.35837S3
X-Coremail-Antispam: 1UD129KBjvJXoW7Cw1xKw15uF4fZFy8KryDKFg_yoW8Kr1kpa
 93W3WSkrWxWry2gw17ta47Xw1rXw4fZr1DArs3ta4xJwn3Ary5JFWrGryxGF9xZFZ7XrW5
 ArZ3JF4xu3WrX37anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBC14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
 x26xkF7I0E14v26r1Y6r1xM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
 Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84
 ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AI
 xVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20x
 vE14v26r1j6r18McIj6I8E87Iv67AKxVWxJVW8Jr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
 Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0264kExVAvwVAq07x20x
 yl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWU
 JVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7V
 AKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UMIIF0xvE42xK8VAvwI8IcIk0rVW8JVW3JwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42
 IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUnLvtDUUUU
X-Originating-IP: [159.226.43.62]
X-CM-SenderInfo: xidqyxpqkd0j0rv6xunwoduhdfq/
Received-SPF: pass client-ip=159.226.251.21;
 envelope-from=fanjinhao21s@ict.ac.cn; helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

nvme_irq_assert() only does useful work when cq->irq_enabled is true.
nvme_irq_deassert() only works for pin-based interrupts. Avoid calls
into these functions if we are sure they will not do useful work.

This will be most useful when we use eventfd to send interrupts. We
can avoid the unnecessary overhead of signalling eventfd.

Signed-off-by: Jinhao Fan <fanjinhao21s@ict.ac.cn>
---
 hw/nvme/ctrl.c | 40 ++++++++++++++++++++++------------------
 1 file changed, 22 insertions(+), 18 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 87aeba0564..bd3350d7e0 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -1377,11 +1377,13 @@ static void nvme_post_cqes(void *opaque)
         QTAILQ_INSERT_TAIL(&sq->req_list, req, entry);
     }
     if (cq->tail != cq->head) {
-        if (cq->irq_enabled && !pending) {
-            n->cq_pending++;
-        }
+        if (cq->irq_enabled) {
+            if (!pending) {
+                n->cq_pending++;
+            }
 
-        nvme_irq_assert(n, cq);
+            nvme_irq_assert(n, cq);
+        }
     }
 }
 
@@ -4244,12 +4246,11 @@ static void nvme_cq_notifier(EventNotifier *e)
 
     nvme_update_cq_head(cq);
 
-    if (cq->tail == cq->head) {
-        if (cq->irq_enabled) {
-            n->cq_pending--;
+    if (cq->irq_enabled && cq->tail == cq->head) {
+        n->cq_pending--;
+        if (!msix_enabled(&n->parent_obj)) {
+            nvme_irq_deassert(n, cq);
         }
-
-        nvme_irq_deassert(n, cq);
     }
 
     nvme_post_cqes(cq);
@@ -4730,11 +4731,15 @@ static uint16_t nvme_del_cq(NvmeCtrl *n, NvmeRequest *req)
         return NVME_INVALID_QUEUE_DEL;
     }
 
-    if (cq->irq_enabled && cq->tail != cq->head) {
-        n->cq_pending--;
-    }
+    if (cq->irq_enabled) {
+        if (cq->tail != cq->head) {
+            n->cq_pending--;
+        }
 
-    nvme_irq_deassert(n, cq);
+        if (!msix_enabled(&n->parent_obj)) {
+            nvme_irq_deassert(n, cq);
+        }
+    }
     trace_pci_nvme_del_cq(qid);
     nvme_free_cq(cq, n);
     return NVME_SUCCESS;
@@ -6918,12 +6923,11 @@ static void nvme_process_db(NvmeCtrl *n, hwaddr addr, int val)
             timer_mod(cq->timer, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + 500);
         }
 
-        if (cq->tail == cq->head) {
-            if (cq->irq_enabled) {
-                n->cq_pending--;
+        if (cq->irq_enabled && cq->tail == cq->head) {
+            n->cq_pending--;
+            if (!msix_enabled(&n->parent_obj)) {
+                nvme_irq_deassert(n, cq);
             }
-
-            nvme_irq_deassert(n, cq);
         }
     } else {
         /* Submission queue doorbell write */
-- 
2.25.1


