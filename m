Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C913E55B94C
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 12:55:08 +0200 (CEST)
Received: from localhost ([::1]:60006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5mOZ-0004c7-Tm
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 06:55:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fanjinhao21s@ict.ac.cn>)
 id 1o5mId-0003oW-7k
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 06:48:59 -0400
Received: from smtp84.cstnet.cn ([159.226.251.84]:57662 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fanjinhao21s@ict.ac.cn>) id 1o5mIY-000156-SZ
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 06:48:57 -0400
Received: from localhost.localdomain (unknown [159.226.43.7])
 by APP-05 (Coremail) with SMTP id zQCowAAXHrIBi7liWdLOBw--.61672S2;
 Mon, 27 Jun 2022 18:48:40 +0800 (CST)
From: Jinhao Fan <fanjinhao21s@ict.ac.cn>
To: qemu-devel@nongnu.org
Cc: its@irrelevant.dk, kbusch@kernel.org, Jinhao Fan <fanjinhao21s@ict.ac.cn>
Subject: [PATCH] hw/nvme: Use ioeventfd to handle doorbell updates
Date: Mon, 27 Jun 2022 18:48:13 +0800
Message-Id: <20220627104813.2173852-1-fanjinhao21s@ict.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowAAXHrIBi7liWdLOBw--.61672S2
X-Coremail-Antispam: 1UD129KBjvJXoW3Jw1kXw4kAr48WFW5Jw4rAFb_yoWxZw1DpF
 Z5WFZ3KFs7XF17urZYqrs7Jwn8u3y8Xr1DCrZxGr1ft3Z3CryxAFW8GFWUAFs8ZFZ7XFW5
 Cr4xtF47G3yxJ3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUyl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j
 6r4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCF04k20xvY0x0EwIxG
 rwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4
 vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IY
 x2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26c
 xKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x02
 67AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfU0iiSUUUUU
X-Originating-IP: [159.226.43.7]
X-CM-SenderInfo: xidqyxpqkd0j0rv6xunwoduhdfq/
Received-SPF: pass client-ip=159.226.251.84;
 envelope-from=fanjinhao21s@ict.ac.cn; helo=cstnet.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Add property "ioeventfd" which is enabled by default. When this is
enabled, updates on the doorbell registers will cause KVM to signal
an event to the QEMU main loop to handle the doorbell updates.
Therefore, instead of letting the vcpu thread run both guest VM and
IO emulation, we now use the main loop thread to do IO emulation and
thus the vcpu thread has more cycles for the guest VM.

Since ioeventfd does not tell us the exact value that is written, it is
only useful when shadow doorbell buffer is enabled, where we check
for the value in the shadow doorbell buffer when we get the doorbell
update event.

IOPS comparison on Linux 5.19-rc2: (Unit: KIOPS)

qd           1   4  16  64
qemu        35 121 176 153
ioeventfd   41 133 258 313

Signed-off-by: Jinhao Fan <fanjinhao21s@ict.ac.cn>
---
 hw/nvme/ctrl.c | 97 +++++++++++++++++++++++++++++++++++++++++++++++++-
 hw/nvme/nvme.h |  5 +++
 2 files changed, 101 insertions(+), 1 deletion(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index c952c34f94..787b89f7d3 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -1374,7 +1374,14 @@ static void nvme_enqueue_req_completion(NvmeCQueue *cq, NvmeRequest *req)
 
     QTAILQ_REMOVE(&req->sq->out_req_list, req, entry);
     QTAILQ_INSERT_TAIL(&cq->req_list, req, entry);
-    timer_mod(cq->timer, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + 500);
+
+    if (req->sq->ioeventfd_enabled) {
+        /* Post CQE directly since we are in main loop thread */
+        nvme_post_cqes(cq);
+    } else {
+        /* Schedule the timer to post CQE later since we are in vcpu thread */
+        timer_mod(cq->timer, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + 500);
+    }
 }
 
 static void nvme_process_aers(void *opaque)
@@ -4195,10 +4202,74 @@ static uint16_t nvme_io_cmd(NvmeCtrl *n, NvmeRequest *req)
     return NVME_INVALID_OPCODE | NVME_DNR;
 }
 
+static void nvme_cq_notifier(EventNotifier *e)
+{
+    NvmeCQueue *cq = container_of(e, NvmeCQueue, notifier);
+    NvmeCtrl *n = cq->ctrl;
+
+    event_notifier_test_and_clear(&cq->notifier);
+
+    nvme_update_cq_head(cq);
+
+    if (cq->tail == cq->head) {
+        if (cq->irq_enabled) {
+            n->cq_pending--;
+        }
+
+        nvme_irq_deassert(n, cq);
+    }
+
+    nvme_post_cqes(cq);
+}
+
+static int nvme_init_cq_ioeventfd(NvmeCQueue *cq)
+{
+    NvmeCtrl *n = cq->ctrl;
+    uint16_t offset = (cq->cqid << 3) + (1 << 2);
+    int ret;
+
+    if ((ret = event_notifier_init(&cq->notifier, 0))) {
+        return ret;
+    }
+
+    event_notifier_set_handler(&cq->notifier, nvme_cq_notifier);
+    memory_region_add_eventfd(&n->iomem,
+                              0x1000 + offset, 4, false, 0, &cq->notifier);
+    
+    return 0;
+}
+
+static void nvme_sq_notifier(EventNotifier *e)
+{
+    NvmeSQueue *sq = container_of(e, NvmeSQueue, notifier);
+
+    event_notifier_test_and_clear(&sq->notifier);
+
+    nvme_process_sq(sq);
+}
+
+static int nvme_init_sq_ioeventfd(NvmeSQueue *sq)
+{
+    NvmeCtrl *n = sq->ctrl;
+    uint16_t offset = sq->sqid << 3;
+    int ret;
+
+    if ((ret = event_notifier_init(&sq->notifier, 0))) {
+        return ret;
+    }
+
+    event_notifier_set_handler(&sq->notifier, nvme_sq_notifier);
+    memory_region_add_eventfd(&n->iomem,
+                              0x1000 + offset, 4, false, 0, &sq->notifier);
+
+    return 0;
+}
+
 static void nvme_free_sq(NvmeSQueue *sq, NvmeCtrl *n)
 {
     n->sq[sq->sqid] = NULL;
     timer_free(sq->timer);
+    event_notifier_cleanup(&sq->notifier);
     g_free(sq->io_req);
     if (sq->sqid) {
         g_free(sq);
@@ -4250,6 +4321,7 @@ static void nvme_init_sq(NvmeSQueue *sq, NvmeCtrl *n, uint64_t dma_addr,
                          uint16_t sqid, uint16_t cqid, uint16_t size)
 {
     int i;
+    int ret;
     NvmeCQueue *cq;
 
     sq->ctrl = n;
@@ -4271,6 +4343,11 @@ static void nvme_init_sq(NvmeSQueue *sq, NvmeCtrl *n, uint64_t dma_addr,
     if (n->dbbuf_enabled) {
         sq->db_addr = n->dbbuf_dbs + (sqid << 3);
         sq->ei_addr = n->dbbuf_eis + (sqid << 3);
+            
+        if (n->params.ioeventfd && sq->sqid != 0) {
+            ret = nvme_init_sq_ioeventfd(sq);
+            sq->ioeventfd_enabled = ret == 0;
+        }
     }
 
     assert(n->cq[cqid]);
@@ -4577,6 +4654,7 @@ static void nvme_free_cq(NvmeCQueue *cq, NvmeCtrl *n)
 {
     n->cq[cq->cqid] = NULL;
     timer_free(cq->timer);
+    event_notifier_cleanup(&cq->notifier);
     if (msix_enabled(&n->parent_obj)) {
         msix_vector_unuse(&n->parent_obj, cq->vector);
     }
@@ -4635,6 +4713,11 @@ static void nvme_init_cq(NvmeCQueue *cq, NvmeCtrl *n, uint64_t dma_addr,
     if (n->dbbuf_enabled) {
         cq->db_addr = n->dbbuf_dbs + (cqid << 3) + (1 << 2);
         cq->ei_addr = n->dbbuf_eis + (cqid << 3) + (1 << 2);
+
+        if (n->params.ioeventfd && cqid != 0) {
+            ret = nvme_init_cq_ioeventfd(cq);
+            cq->ioeventfd_enabled = ret == 0;
+        }
     }
     n->cq[cqid] = cq;
     cq->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, nvme_post_cqes, cq);
@@ -5793,6 +5876,7 @@ static uint16_t nvme_dbbuf_config(NvmeCtrl *n, const NvmeRequest *req)
     uint64_t dbs_addr = le64_to_cpu(req->cmd.dptr.prp1);
     uint64_t eis_addr = le64_to_cpu(req->cmd.dptr.prp2);
     int i;
+    int ret;
 
     /* Address should be page aligned */
     if (dbs_addr & (n->page_size - 1) || eis_addr & (n->page_size - 1)) {
@@ -5818,6 +5902,11 @@ static uint16_t nvme_dbbuf_config(NvmeCtrl *n, const NvmeRequest *req)
             sq->ei_addr = eis_addr + (i << 3);
             pci_dma_write(&n->parent_obj, sq->db_addr, &sq->tail,
                     sizeof(sq->tail));
+            
+            if (n->params.ioeventfd && sq->sqid != 0) {
+                ret = nvme_init_sq_ioeventfd(sq);
+                sq->ioeventfd_enabled = ret == 0;
+            }
         }
 
         if (cq) {
@@ -5826,6 +5915,11 @@ static uint16_t nvme_dbbuf_config(NvmeCtrl *n, const NvmeRequest *req)
             cq->ei_addr = eis_addr + (i << 3) + (1 << 2);
             pci_dma_write(&n->parent_obj, cq->db_addr, &cq->head,
                     sizeof(cq->head));
+            
+            if (n->params.ioeventfd && cq->cqid != 0) {
+                ret = nvme_init_cq_ioeventfd(cq);
+                cq->ioeventfd_enabled = ret == 0;
+            }
         }
     }
 
@@ -7040,6 +7134,7 @@ static Property nvme_props[] = {
     DEFINE_PROP_UINT8("zoned.zasl", NvmeCtrl, params.zasl, 0),
     DEFINE_PROP_BOOL("zoned.auto_transition", NvmeCtrl,
                      params.auto_transition_zones, true),
+    DEFINE_PROP_BOOL("ioeventfd", NvmeCtrl, params.ioeventfd, true),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
index 4452e4b1bf..2a9beea0c8 100644
--- a/hw/nvme/nvme.h
+++ b/hw/nvme/nvme.h
@@ -369,6 +369,8 @@ typedef struct NvmeSQueue {
     uint64_t    db_addr;
     uint64_t    ei_addr;
     QEMUTimer   *timer;
+    EventNotifier notifier;
+    bool        ioeventfd_enabled;
     NvmeRequest *io_req;
     QTAILQ_HEAD(, NvmeRequest) req_list;
     QTAILQ_HEAD(, NvmeRequest) out_req_list;
@@ -388,6 +390,8 @@ typedef struct NvmeCQueue {
     uint64_t    db_addr;
     uint64_t    ei_addr;
     QEMUTimer   *timer;
+    EventNotifier notifier;
+    bool        ioeventfd_enabled;
     QTAILQ_HEAD(, NvmeSQueue) sq_list;
     QTAILQ_HEAD(, NvmeRequest) req_list;
 } NvmeCQueue;
@@ -410,6 +414,7 @@ typedef struct NvmeParams {
     uint8_t  zasl;
     bool     auto_transition_zones;
     bool     legacy_cmb;
+    bool     ioeventfd;
 } NvmeParams;
 
 typedef struct NvmeCtrl {
-- 
2.25.1


