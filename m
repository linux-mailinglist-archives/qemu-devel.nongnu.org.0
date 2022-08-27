Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 593105A364B
	for <lists+qemu-devel@lfdr.de>; Sat, 27 Aug 2022 11:24:27 +0200 (CEST)
Received: from localhost ([::1]:35176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRs3G-0008Lk-1x
	for lists+qemu-devel@lfdr.de; Sat, 27 Aug 2022 05:24:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fanjinhao21s@ict.ac.cn>)
 id 1oRrsY-0006hU-IN; Sat, 27 Aug 2022 05:13:23 -0400
Received: from smtp21.cstnet.cn ([159.226.251.21]:52608 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fanjinhao21s@ict.ac.cn>)
 id 1oRrsN-0007tH-2i; Sat, 27 Aug 2022 05:13:22 -0400
Received: from localhost.localdomain (unknown [159.226.43.62])
 by APP-01 (Coremail) with SMTP id qwCowAAHR2Eb4AljuYWkAA--.20130S6;
 Sat, 27 Aug 2022 17:13:07 +0800 (CST)
From: Jinhao Fan <fanjinhao21s@ict.ac.cn>
To: qemu-devel@nongnu.org
Cc: its@irrelevant.dk, kbusch@kernel.org, stefanha@gmail.com,
 Jinhao Fan <fanjinhao21s@ict.ac.cn>, qemu-block@nongnu.org (open list:nvme)
Subject: [PATCH v3 4/4] hw/nvme: add polling support
Date: Sat, 27 Aug 2022 17:12:58 +0800
Message-Id: <20220827091258.3589230-5-fanjinhao21s@ict.ac.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220827091258.3589230-1-fanjinhao21s@ict.ac.cn>
References: <20220827091258.3589230-1-fanjinhao21s@ict.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowAAHR2Eb4AljuYWkAA--.20130S6
X-Coremail-Antispam: 1UD129KBjvJXoWxXr17ur1kJF45Jr4Uuw45KFg_yoWruFW8pF
 Z5WrZ5uan7Cay7Xa1YqF17Ar1fZ3ykX34jkFs7JrZ7JFn7KryfAFWUta45JFyrWr95Xw15
 Aa1qqF17Z3yxX3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUPE14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
 kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
 z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr
 1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr0_
 Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6x
 IIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_
 Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0Ew4C26cxK6c
 8Ij28IcwCY02Avz4vE14v_GFWl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_
 Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17
 CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0
 I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I
 8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73
 UjIFyTuYvjfUUVyIUUUUU
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

Add AioContext polling handlers for NVMe SQ and CQ. By employing polling,
the latency of NVMe IO emulation is greatly reduced. The SQ polling
handler checks for updates on the SQ tail shadow doorbell buffer. The CQ
polling handler is an empty function because we procatively polls the CQ
head shadow doorbell buffer when we want to post a cqe. Updates on the
SQ eventidx buffer is stopped during polling to avoid the host doing
unnecessary doorbell buffer writes.

Comparison (KIOPS):

QD        1   4  16  64
QEMU     53 155 245 309
polling 123 165 189 191

Signed-off-by: Jinhao Fan <fanjinhao21s@ict.ac.cn>
---
 hw/nvme/ctrl.c | 74 ++++++++++++++++++++++++++++++++++++++++++++++----
 hw/nvme/nvme.h |  1 +
 2 files changed, 70 insertions(+), 5 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 869565d77b..a7f8a4220e 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -298,6 +298,8 @@ static const uint32_t nvme_cse_iocs_zoned[256] = {
 
 static void nvme_process_sq(void *opaque);
 static void nvme_ctrl_reset(NvmeCtrl *n, NvmeResetType rst);
+static void nvme_update_sq_eventidx(const NvmeSQueue *sq);
+static void nvme_update_sq_tail(NvmeSQueue *sq);
 
 static uint16_t nvme_sqid(NvmeRequest *req)
 {
@@ -4447,6 +4449,21 @@ static void nvme_cq_notifier(EventNotifier *e)
     nvme_post_cqes(cq);
 }
 
+static bool nvme_cq_notifier_aio_poll(void *opaque)
+{
+    /*
+     * We already "poll" the CQ tail shadow doorbell value in nvme_post_cqes(),
+     * so we do not need to check the value here. However, QEMU's AioContext
+     * polling requires us to provide io_poll and io_poll_ready handlers, so
+     * use dummy functions for CQ.
+     */
+    return false;
+}
+
+static void nvme_cq_notifier_aio_poll_ready(EventNotifier *n)
+{
+}
+
 static int nvme_init_cq_ioeventfd(NvmeCQueue *cq)
 {
     NvmeCtrl *n = cq->ctrl;
@@ -4459,8 +4476,10 @@ static int nvme_init_cq_ioeventfd(NvmeCQueue *cq)
     }
 
     if (cq->cqid) {
-        aio_set_event_notifier(n->ctx, &cq->notifier, true, nvme_cq_notifier,
-                               NULL, NULL);
+        aio_set_event_notifier(n->ctx, &cq->notifier, true,
+                               nvme_cq_notifier,
+                               nvme_cq_notifier_aio_poll,
+                               nvme_cq_notifier_aio_poll_ready);
     } else {
         event_notifier_set_handler(&cq->notifier, nvme_cq_notifier);
     }
@@ -4482,6 +4501,44 @@ static void nvme_sq_notifier(EventNotifier *e)
     nvme_process_sq(sq);
 }
 
+static void nvme_sq_notifier_aio_poll_begin(EventNotifier *n)
+{
+    NvmeSQueue *sq = container_of(n, NvmeSQueue, notifier);
+
+    nvme_update_sq_eventidx(sq);
+
+    /* Stop host doorbell writes by stop updating eventidx */
+    sq->suppress_db = true;
+}
+
+static bool nvme_sq_notifier_aio_poll(void *opaque)
+{
+    EventNotifier *n = opaque;
+    NvmeSQueue *sq = container_of(n, NvmeSQueue, notifier);
+    uint32_t old_tail = sq->tail;
+
+    nvme_update_sq_tail(sq);
+
+    return sq->tail != old_tail;
+}
+
+static void nvme_sq_notifier_aio_poll_ready(EventNotifier *n)
+{
+    NvmeSQueue *sq = container_of(n, NvmeSQueue, notifier);
+
+    nvme_process_sq(sq);
+}
+
+static void nvme_sq_notifier_aio_poll_end(EventNotifier *n)
+{
+    NvmeSQueue *sq = container_of(n, NvmeSQueue, notifier);
+
+    nvme_update_sq_eventidx(sq);
+
+    /* Resume host doorbell writes */
+    sq->suppress_db = false;
+}
+
 static int nvme_init_sq_ioeventfd(NvmeSQueue *sq)
 {
     NvmeCtrl *n = sq->ctrl;
@@ -4494,8 +4551,13 @@ static int nvme_init_sq_ioeventfd(NvmeSQueue *sq)
     }
 
     if (sq->sqid) {
-        aio_set_event_notifier(n->ctx, &sq->notifier, true, nvme_sq_notifier,
-                               NULL, NULL);
+        aio_set_event_notifier(n->ctx, &sq->notifier, true,
+                               nvme_sq_notifier,
+                               nvme_sq_notifier_aio_poll,
+                               nvme_sq_notifier_aio_poll_ready);
+        aio_set_event_notifier_poll(n->ctx, &sq->notifier,
+                                    nvme_sq_notifier_aio_poll_begin,
+                                    nvme_sq_notifier_aio_poll_end);
     } else {
         event_notifier_set_handler(&sq->notifier, nvme_sq_notifier);
     }
@@ -6530,7 +6592,9 @@ static void nvme_process_sq(void *opaque)
         }
 
         if (n->dbbuf_enabled) {
-            nvme_update_sq_eventidx(sq);
+            if (!sq->suppress_db) {
+                nvme_update_sq_eventidx(sq);
+            }
             nvme_update_sq_tail(sq);
         }
     }
diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
index 224b73e6c4..bd486a8e15 100644
--- a/hw/nvme/nvme.h
+++ b/hw/nvme/nvme.h
@@ -380,6 +380,7 @@ typedef struct NvmeSQueue {
     QEMUTimer   *timer;
     EventNotifier notifier;
     bool        ioeventfd_enabled;
+    bool        suppress_db;
     NvmeRequest *io_req;
     QTAILQ_HEAD(, NvmeRequest) req_list;
     QTAILQ_HEAD(, NvmeRequest) out_req_list;
-- 
2.25.1


