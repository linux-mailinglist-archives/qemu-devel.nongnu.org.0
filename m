Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7A4583A45
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 10:22:20 +0200 (CEST)
Received: from localhost ([::1]:35922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGymh-0003sJ-AL
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 04:22:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fanjinhao21s@ict.ac.cn>)
 id 1oGyYu-0006Be-Ie; Thu, 28 Jul 2022 04:08:04 -0400
Received: from smtp21.cstnet.cn ([159.226.251.21]:49818 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fanjinhao21s@ict.ac.cn>)
 id 1oGyYo-0000Rx-7b; Thu, 28 Jul 2022 04:08:04 -0400
Received: from localhost.localdomain (unknown [159.226.43.62])
 by APP-01 (Coremail) with SMTP id qwCowADHDJ3EQ+Ji9E5qAw--.14907S2;
 Thu, 28 Jul 2022 16:07:40 +0800 (CST)
From: Jinhao Fan <fanjinhao21s@ict.ac.cn>
To: qemu-devel@nongnu.org
Cc: its@irrelevant.dk, kbusch@kernel.org, Jinhao Fan <fanjinhao21s@ict.ac.cn>,
 qemu-block@nongnu.org (open list:nvme)
Subject: [PATCH] hw/nvme: Add helper functions for qid-db conversion
Date: Thu, 28 Jul 2022 16:07:10 +0800
Message-Id: <20220728080710.372027-1-fanjinhao21s@ict.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowADHDJ3EQ+Ji9E5qAw--.14907S2
X-Coremail-Antispam: 1UD129KBjvJXoWxuw4kWFWxGr48KF1fCF4xtFb_yoW7ur15pF
 s3XFZIyr4fCF1qqa95JrnrXw15Z397XryUCrnxK3Wakr93Zry8Aay8CFWFkF1fZrykZrWY
 vr48JF13WF47JrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvG14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVWxJr
 0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
 2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
 W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAKzI0EY4vE
 52x082I5MxkIecxEwVAFwVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJV
 W8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF
 1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6x
 IIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAI
 cVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa
 73UjIFyTuYvjTRtGYLUUUUU
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
 hw/nvme/ctrl.c | 61 ++++++++++++++++++++++++++++++++------------------
 1 file changed, 39 insertions(+), 22 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 533ad14e7a..6116c0e660 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -487,6 +487,29 @@ static int nvme_check_cqid(NvmeCtrl *n, uint16_t cqid)
 {
     return cqid < n->conf_ioqpairs + 1 && n->cq[cqid] != NULL ? 0 : -1;
 }
+static inline bool nvme_db_offset_is_cq(NvmeCtrl *n, hwaddr offset)
+{
+    hwaddr stride = 4 << NVME_CAP_DSTRD(ldq_le_p(&n->bar.cap));
+    return (offset / stride) & 1;
+}
+
+static inline uint16_t nvme_db_offset_to_qid(NvmeCtrl *n, hwaddr offset)
+{
+    hwaddr stride = 4 << NVME_CAP_DSTRD(ldq_le_p(&n->bar.cap));
+    return offset / (2 * stride);
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


