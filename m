Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A9258859B
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Aug 2022 04:01:46 +0200 (CEST)
Received: from localhost ([::1]:40166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJ3hh-0001Cc-G7
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 22:01:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fanjinhao21s@ict.ac.cn>)
 id 1oJ3fI-0007zU-DK; Tue, 02 Aug 2022 21:59:16 -0400
Received: from smtp21.cstnet.cn ([159.226.251.21]:53072 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fanjinhao21s@ict.ac.cn>)
 id 1oJ3fF-0006E5-Ok; Tue, 02 Aug 2022 21:59:16 -0400
Received: from localhost.localdomain (unknown [159.226.43.62])
 by APP-01 (Coremail) with SMTP id qwCowAD311hT1uliQhXABQ--.47541S2;
 Wed, 03 Aug 2022 09:58:49 +0800 (CST)
From: Jinhao Fan <fanjinhao21s@ict.ac.cn>
To: qemu-devel@nongnu.org
Cc: its@irrelevant.dk, kbusch@kernel.org, Jinhao Fan <fanjinhao21s@ict.ac.cn>,
 qemu-block@nongnu.org (open list:nvme)
Subject: [PATCH v2] hw/nvme: Add helper functions for qid-db conversion
Date: Wed,  3 Aug 2022 09:58:36 +0800
Message-Id: <20220803015836.3590335-1-fanjinhao21s@ict.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowAD311hT1uliQhXABQ--.47541S2
X-Coremail-Antispam: 1UD129KBjvJXoWxtr1UKFy8XF1fJFyUKF43GFg_yoW7uF4rpF
 s5XFZIyr4fAF1qqa95JrnrJw15Z397XryUCrnxK3Wakr93Zry8Aay8CFWfKF1fZrykZrWY
 vr48JF13WF47JrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUv014x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr
 0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
 6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
 0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0Ew4C26cxK
 6c8Ij28IcwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F4
 0E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1l
 IxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxV
 AFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rWUJVWrZr1UMIIF0xvEx4A2jsIE14v2
 6r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7VUU
 6RRtUUUUU==
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

With the introduction of shadow doorbell and ioeventfd, we need to do
frequent conversion between qid and its doorbell offset. The original
hard-coded calculation is confusing and error-prone. Add several helper
functions to do this task.

Signed-off-by: Jinhao Fan <fanjinhao21s@ict.ac.cn>
---
Changes since v1:
 - Use left shifts instead of divisions

 hw/nvme/ctrl.c | 61 ++++++++++++++++++++++++++++++++------------------
 1 file changed, 39 insertions(+), 22 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 533ad14e7a..4312e880e1 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -487,6 +487,29 @@ static int nvme_check_cqid(NvmeCtrl *n, uint16_t cqid)
 {
     return cqid < n->conf_ioqpairs + 1 && n->cq[cqid] != NULL ? 0 : -1;
 }
+static inline bool nvme_db_offset_is_cq(NvmeCtrl *n, hwaddr offset)
+{
+    hwaddr dstride = NVME_CAP_DSTRD(ldq_le_p(&n->bar.cap));
+    return (offset >> (dstride + 2)) & 1;
+}
+
+static inline uint16_t nvme_db_offset_to_qid(NvmeCtrl *n, hwaddr offset)
+{
+    hwaddr dstride = NVME_CAP_DSTRD(ldq_le_p(&n->bar.cap));
+    return offset >> (dstride + 3);
+}
+
+static inline hwaddr nvme_cqid_to_db_offset(NvmeCtrl *n, uint16_t cqid)
+{
+    hwaddr stride = 4 << NVME_CAP_DSTRD(ldq_le_p(&n->bar.cap));
+    return stride * (cqid * 2 + 1);
+}
+
+static inline hwaddr nvme_sqid_to_db_offset(NvmeCtrl *n, uint16_t sqid)
+{
+    hwaddr stride = 4 << NVME_CAP_DSTRD(ldq_le_p(&n->bar.cap));
+    return stride * sqid * 2;
+}
 
 static void nvme_inc_cq_tail(NvmeCQueue *cq)
 {
@@ -4256,7 +4279,7 @@ static void nvme_cq_notifier(EventNotifier *e)
 static int nvme_init_cq_ioeventfd(NvmeCQueue *cq)
 {
     NvmeCtrl *n = cq->ctrl;
-    uint16_t offset = (cq->cqid << 3) + (1 << 2);
+    uint16_t offset = nvme_cqid_to_db_offset(n, cq->cqid);
     int ret;
 
     ret = event_notifier_init(&cq->notifier, 0);
@@ -4283,7 +4306,7 @@ static void nvme_sq_notifier(EventNotifier *e)
 static int nvme_init_sq_ioeventfd(NvmeSQueue *sq)
 {
     NvmeCtrl *n = sq->ctrl;
-    uint16_t offset = sq->sqid << 3;
+    uint16_t offset = nvme_sqid_to_db_offset(n, sq->sqid);
     int ret;
 
     ret = event_notifier_init(&sq->notifier, 0);
@@ -4300,7 +4323,7 @@ static int nvme_init_sq_ioeventfd(NvmeSQueue *sq)
 
 static void nvme_free_sq(NvmeSQueue *sq, NvmeCtrl *n)
 {
-    uint16_t offset = sq->sqid << 3;
+    uint16_t offset = nvme_sqid_to_db_offset(n, sq->sqid);
 
     n->sq[sq->sqid] = NULL;
     timer_free(sq->timer);
@@ -4379,8 +4402,8 @@ static void nvme_init_sq(NvmeSQueue *sq, NvmeCtrl *n, uint64_t dma_addr,
     sq->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, nvme_process_sq, sq);
 
     if (n->dbbuf_enabled) {
-        sq->db_addr = n->dbbuf_dbs + (sqid << 3);
-        sq->ei_addr = n->dbbuf_eis + (sqid << 3);
+        sq->db_addr = n->dbbuf_dbs + nvme_sqid_to_db_offset(n, sqid);
+        sq->ei_addr = n->dbbuf_eis + nvme_sqid_to_db_offset(n, sqid);
 
         if (n->params.ioeventfd && sq->sqid != 0) {
             if (!nvme_init_sq_ioeventfd(sq)) {
@@ -4690,8 +4713,8 @@ static uint16_t nvme_get_log(NvmeCtrl *n, NvmeRequest *req)
 
 static void nvme_free_cq(NvmeCQueue *cq, NvmeCtrl *n)
 {
-    uint16_t offset = (cq->cqid << 3) + (1 << 2);
-
+    uint16_t offset = nvme_cqid_to_db_offset(n, cq->cqid);
+    
     n->cq[cq->cqid] = NULL;
     timer_free(cq->timer);
     if (cq->ioeventfd_enabled) {
@@ -4755,8 +4778,8 @@ static void nvme_init_cq(NvmeCQueue *cq, NvmeCtrl *n, uint64_t dma_addr,
     QTAILQ_INIT(&cq->req_list);
     QTAILQ_INIT(&cq->sq_list);
     if (n->dbbuf_enabled) {
-        cq->db_addr = n->dbbuf_dbs + (cqid << 3) + (1 << 2);
-        cq->ei_addr = n->dbbuf_eis + (cqid << 3) + (1 << 2);
+        cq->db_addr = n->dbbuf_dbs + nvme_cqid_to_db_offset(n, cqid);
+        cq->ei_addr = n->dbbuf_eis + nvme_cqid_to_db_offset(n, cqid);
 
         if (n->params.ioeventfd && cqid != 0) {
             if (!nvme_init_cq_ioeventfd(cq)) {
@@ -6128,13 +6151,8 @@ static uint16_t nvme_dbbuf_config(NvmeCtrl *n, const NvmeRequest *req)
         NvmeCQueue *cq = n->cq[i];
 
         if (sq) {
-            /*
-             * CAP.DSTRD is 0, so offset of ith sq db_addr is (i<<3)
-             * nvme_process_db() uses this hard-coded way to calculate
-             * doorbell offsets. Be consistent with that here.
-             */
-            sq->db_addr = dbs_addr + (i << 3);
-            sq->ei_addr = eis_addr + (i << 3);
+            sq->db_addr = dbs_addr + nvme_sqid_to_db_offset(n, i);
+            sq->ei_addr = eis_addr + nvme_sqid_to_db_offset(n, i);
             pci_dma_write(&n->parent_obj, sq->db_addr, &sq->tail,
                     sizeof(sq->tail));
 
@@ -6146,9 +6164,8 @@ static uint16_t nvme_dbbuf_config(NvmeCtrl *n, const NvmeRequest *req)
         }
 
         if (cq) {
-            /* CAP.DSTRD is 0, so offset of ith cq db_addr is (i<<3)+(1<<2) */
-            cq->db_addr = dbs_addr + (i << 3) + (1 << 2);
-            cq->ei_addr = eis_addr + (i << 3) + (1 << 2);
+            cq->db_addr = dbs_addr + nvme_cqid_to_db_offset(n, i);
+            cq->ei_addr = eis_addr + nvme_cqid_to_db_offset(n, i);
             pci_dma_write(&n->parent_obj, cq->db_addr, &cq->head,
                     sizeof(cq->head));
 
@@ -6843,14 +6860,14 @@ static void nvme_process_db(NvmeCtrl *n, hwaddr addr, int val)
         return;
     }
 
-    if (((addr - 0x1000) >> 2) & 1) {
+    if (nvme_db_offset_is_cq(n, addr - 0x1000)) {
         /* Completion queue doorbell write */
 
         uint16_t new_head = val & 0xffff;
         int start_sqs;
         NvmeCQueue *cq;
 
-        qid = (addr - (0x1000 + (1 << 2))) >> 3;
+        qid = nvme_db_offset_to_qid(n, addr - 0x1000);
         if (unlikely(nvme_check_cqid(n, qid))) {
             NVME_GUEST_ERR(pci_nvme_ub_db_wr_invalid_cq,
                            "completion queue doorbell write"
@@ -6925,7 +6942,7 @@ static void nvme_process_db(NvmeCtrl *n, hwaddr addr, int val)
         uint16_t new_tail = val & 0xffff;
         NvmeSQueue *sq;
 
-        qid = (addr - 0x1000) >> 3;
+        qid = nvme_db_offset_to_qid(n, addr - 0x1000);
         if (unlikely(nvme_check_sqid(n, qid))) {
             NVME_GUEST_ERR(pci_nvme_ub_db_wr_invalid_sq,
                            "submission queue doorbell write"
-- 
2.25.1


