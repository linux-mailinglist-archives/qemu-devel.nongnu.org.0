Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 898C6560F8A
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jun 2022 05:24:07 +0200 (CEST)
Received: from localhost ([::1]:56650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6kmk-0008Jk-Lu
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 23:24:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fanjinhao21s@ict.ac.cn>)
 id 1o6kld-0007eo-D5
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 23:22:57 -0400
Received: from smtp21.cstnet.cn ([159.226.251.21]:47260 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fanjinhao21s@ict.ac.cn>) id 1o6klZ-0006mT-DB
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 23:22:57 -0400
Received: from localhost.localdomain (unknown [159.226.43.7])
 by APP-01 (Coremail) with SMTP id qwCowAB31xT7Fr1i7QskCg--.36741S2;
 Thu, 30 Jun 2022 11:22:40 +0800 (CST)
From: Jinhao Fan <fanjinhao21s@ict.ac.cn>
To: qemu-devel@nongnu.org
Cc: its@irrelevant.dk, kbusch@kernel.org, Jinhao Fan <fanjinhao21s@ict.ac.cn>
Subject: [PATCH v2] hw/nvme: Use ioeventfd to handle doorbell updates
Date: Thu, 30 Jun 2022 11:22:31 +0800
Message-Id: <20220630032231.2881787-1-fanjinhao21s@ict.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowAB31xT7Fr1i7QskCg--.36741S2
X-Coremail-Antispam: 1UD129KBjvJXoW3Jw1kWw43GFy7JFy5GFW5GFg_yoWxCw13pF
 Z5WFZ3KFs7X3W7urZYqrs7Jwn5C3ykXr1DCrZxGr1ft3Z3CryxAFW8GFWUJFn8ZFZ7XFW5
 Cr4xtF47G3yxJ3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUyE14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
 1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
 7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
 1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCF04k20xvY0x0E
 wIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E74
 80Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0
 I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04
 k26cxKx2IYs7xG6rWUJVWrZr1UMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIE
 c7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7VUbrMaUUUUUU==
X-Originating-IP: [159.226.43.7]
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

Changes since v1:
- Return value handling code cleanup

Signed-off-by: Jinhao Fan <fanjinhao21s@ict.ac.cn>
---
 hw/nvme/ctrl.c | 100 ++++++++++++++++++++++++++++++++++++++++++++++++-
 hw/nvme/nvme.h |   5 +++
 2 files changed, 104 insertions(+), 1 deletion(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index c952c34f94..fb5466678a 100644
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
@@ -4195,10 +4202,76 @@ static uint16_t nvme_io_cmd(NvmeCtrl *n, NvmeRequest *req)
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
+    ret = event_notifier_init(&cq->notifier, 0);
+    if (ret < 0) {
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
+    ret = event_notifier_init(&sq->notifier, 0);
+    if (ret < 0) {
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
@@ -4271,6 +4344,12 @@ static void nvme_init_sq(NvmeSQueue *sq, NvmeCtrl *n, uint64_t dma_addr,
     if (n->dbbuf_enabled) {
         sq->db_addr = n->dbbuf_dbs + (sqid << 3);
         sq->ei_addr = n->dbbuf_eis + (sqid << 3);
+            
+        if (n->params.ioeventfd && sq->sqid != 0) {
+            if (!nvme_init_sq_ioeventfd(sq)) {
+                sq->ioeventfd_enabled = true;
+            }
+        }
     }
 
     assert(n->cq[cqid]);
@@ -4577,6 +4656,7 @@ static void nvme_free_cq(NvmeCQueue *cq, NvmeCtrl *n)
 {
     n->cq[cq->cqid] = NULL;
     timer_free(cq->timer);
+    event_notifier_cleanup(&cq->notifier);
     if (msix_enabled(&n->parent_obj)) {
         msix_vector_unuse(&n->parent_obj, cq->vector);
     }
@@ -4635,6 +4715,12 @@ static void nvme_init_cq(NvmeCQueue *cq, NvmeCtrl *n, uint64_t dma_addr,
     if (n->dbbuf_enabled) {
         cq->db_addr = n->dbbuf_dbs + (cqid << 3) + (1 << 2);
         cq->ei_addr = n->dbbuf_eis + (cqid << 3) + (1 << 2);
+
+        if (n->params.ioeventfd && cqid != 0) {
+            if (!nvme_init_cq_ioeventfd(cq)) {
+                cq->ioeventfd_enabled = false;
+            }
+        }
     }
     n->cq[cqid] = cq;
     cq->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, nvme_post_cqes, cq);
@@ -5793,6 +5879,7 @@ static uint16_t nvme_dbbuf_config(NvmeCtrl *n, const NvmeRequest *req)
     uint64_t dbs_addr = le64_to_cpu(req->cmd.dptr.prp1);
     uint64_t eis_addr = le64_to_cpu(req->cmd.dptr.prp2);
     int i;
+    int ret;
 
     /* Address should be page aligned */
     if (dbs_addr & (n->page_size - 1) || eis_addr & (n->page_size - 1)) {
@@ -5818,6 +5905,11 @@ static uint16_t nvme_dbbuf_config(NvmeCtrl *n, const NvmeRequest *req)
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
@@ -5826,6 +5918,11 @@ static uint16_t nvme_dbbuf_config(NvmeCtrl *n, const NvmeRequest *req)
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
 
@@ -7040,6 +7137,7 @@ static Property nvme_props[] = {
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


