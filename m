Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4F55A2B0B
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 17:23:39 +0200 (CEST)
Received: from localhost ([::1]:41436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRbBI-0001MM-Bl
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 11:23:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fanjinhao21s@ict.ac.cn>)
 id 1oRb0O-0006Gn-ET; Fri, 26 Aug 2022 11:12:20 -0400
Received: from smtp84.cstnet.cn ([159.226.251.84]:40600 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fanjinhao21s@ict.ac.cn>)
 id 1oRb0L-0005K5-Rx; Fri, 26 Aug 2022 11:12:20 -0400
Received: from localhost.localdomain (unknown [159.226.43.62])
 by APP-05 (Coremail) with SMTP id zQCowAB3v4_J4ghjTGF5AA--.15491S3;
 Fri, 26 Aug 2022 23:12:15 +0800 (CST)
From: Jinhao Fan <fanjinhao21s@ict.ac.cn>
To: qemu-devel@nongnu.org
Cc: its@irrelevant.dk, kbusch@kernel.org, stefanha@gmail.com,
 Jinhao Fan <fanjinhao21s@ict.ac.cn>, Klaus Jensen <k.jensen@samsung.com>,
 qemu-block@nongnu.org (open list:nvme)
Subject: [PATCH v2 1/3] hw/nvme: support irq(de)assertion with eventfd
Date: Fri, 26 Aug 2022 23:12:03 +0800
Message-Id: <20220826151206.3148942-2-fanjinhao21s@ict.ac.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220826151206.3148942-1-fanjinhao21s@ict.ac.cn>
References: <20220826151206.3148942-1-fanjinhao21s@ict.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowAB3v4_J4ghjTGF5AA--.15491S3
X-Coremail-Antispam: 1UD129KBjvJXoW3Gr4fAF13Cry7Kw18tF1kZrb_yoWxZFWkpa
 4kWrZa9Fs7Gr18Wa1YqanrJr1ru3yrJryDArsxt34xJrn3Cry3AFWUGF1UtFy5XrZ5Xry5
 Z3yYqF47u348JaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUPv14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
 x26xkF7I0E14v26r1Y6r1xM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
 Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84
 ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AI
 xVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20x
 vE14v26r1j6r18McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xv
 r2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0Ew4C26cxK6c8Ij28Icw
 CY02Avz4vE14v_XrWl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2Iq
 xVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r
 1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY
 6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUCVW8JwCI42IY6I8E87Iv67
 AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuY
 vjTRtl1yDUUUU
X-Originating-IP: [159.226.43.62]
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

When the new option 'irq-eventfd' is turned on, the IO emulation code
signals an eventfd when it want to (de)assert an irq. The main loop
eventfd handler does the actual irq (de)assertion.  This paves the way
for iothread support since QEMU's interrupt emulation is not thread
safe.

Asserting and deasseting irq with eventfd has some performance
implications. For small queue depth it increases request latency but
for large queue depth it effectively coalesces irqs.

Comparision (KIOPS):

QD            1   4  16  64
QEMU         38 123 210 329
irq-eventfd  32 106 240 364

Signed-off-by: Jinhao Fan <fanjinhao21s@ict.ac.cn>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c | 120 ++++++++++++++++++++++++++++++++++++++++++-------
 hw/nvme/nvme.h |   3 ++
 2 files changed, 106 insertions(+), 17 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 87aeba0564..51792f3955 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -526,34 +526,57 @@ static void nvme_irq_check(NvmeCtrl *n)
     }
 }
 
+static void nvme_irq_do_assert(NvmeCtrl *n, NvmeCQueue *cq)
+{
+    if (msix_enabled(&(n->parent_obj))) {
+        trace_pci_nvme_irq_msix(cq->vector);
+        msix_notify(&(n->parent_obj), cq->vector);
+    } else {
+        trace_pci_nvme_irq_pin();
+        assert(cq->vector < 32);
+        n->irq_status |= 1 << cq->vector;
+        nvme_irq_check(n);
+    }
+}
+
 static void nvme_irq_assert(NvmeCtrl *n, NvmeCQueue *cq)
 {
     if (cq->irq_enabled) {
-        if (msix_enabled(&(n->parent_obj))) {
-            trace_pci_nvme_irq_msix(cq->vector);
-            msix_notify(&(n->parent_obj), cq->vector);
+        if (cq->assert_notifier.initialized) {
+            event_notifier_set(&cq->assert_notifier);
         } else {
-            trace_pci_nvme_irq_pin();
-            assert(cq->vector < 32);
-            n->irq_status |= 1 << cq->vector;
-            nvme_irq_check(n);
+            nvme_irq_do_assert(n, cq);
         }
     } else {
         trace_pci_nvme_irq_masked();
     }
 }
 
+static void nvme_irq_do_deassert(NvmeCtrl *n, NvmeCQueue *cq)
+{
+    if (msix_enabled(&(n->parent_obj))) {
+        return;
+    } else {
+        assert(cq->vector < 32);
+        if (!n->cq_pending) {
+            n->irq_status &= ~(1 << cq->vector);
+        }
+        nvme_irq_check(n);
+    }
+}
+
 static void nvme_irq_deassert(NvmeCtrl *n, NvmeCQueue *cq)
 {
     if (cq->irq_enabled) {
-        if (msix_enabled(&(n->parent_obj))) {
-            return;
+        if (cq->deassert_notifier.initialized) {
+            /*
+             * The deassert notifier will only be initilized when MSI-X is NOT
+             * in use. Therefore no need to worry about extra eventfd syscall
+             * for pin-based interrupts.
+             */
+            event_notifier_set(&cq->deassert_notifier);
         } else {
-            assert(cq->vector < 32);
-            if (!n->cq_pending) {
-                n->irq_status &= ~(1 << cq->vector);
-            }
-            nvme_irq_check(n);
+            nvme_irq_do_deassert(n, cq);
         }
     }
 }
@@ -1338,6 +1361,50 @@ static void nvme_update_cq_head(NvmeCQueue *cq)
     trace_pci_nvme_shadow_doorbell_cq(cq->cqid, cq->head);
 }
 
+static void nvme_assert_notifier_read(EventNotifier *e)
+{
+    NvmeCQueue *cq = container_of(e, NvmeCQueue, assert_notifier);
+    if (event_notifier_test_and_clear(e)) {
+        nvme_irq_do_assert(cq->ctrl, cq);
+    }
+}
+
+static void nvme_deassert_notifier_read(EventNotifier *e)
+{
+    NvmeCQueue *cq = container_of(e, NvmeCQueue, deassert_notifier);
+    if (event_notifier_test_and_clear(e)) {
+        nvme_irq_do_deassert(cq->ctrl, cq);
+    }
+}
+
+static void nvme_init_irq_notifier(NvmeCtrl *n, NvmeCQueue *cq)
+{
+    int ret;
+
+    ret = event_notifier_init(&cq->assert_notifier, 0);
+    if (ret < 0) {
+        return;
+    }
+
+    event_notifier_set_handler(&cq->assert_notifier,
+                                nvme_assert_notifier_read);
+
+    if (!msix_enabled(&n->parent_obj)) {
+        ret = event_notifier_init(&cq->deassert_notifier, 0);
+        if (ret < 0) {
+            event_notifier_set_handler(&cq->assert_notifier, NULL);
+            event_notifier_cleanup(&cq->assert_notifier);
+
+            return;
+        }
+
+        event_notifier_set_handler(&cq->deassert_notifier,
+                                   nvme_deassert_notifier_read);
+    }
+
+    return;
+}
+
 static void nvme_post_cqes(void *opaque)
 {
     NvmeCQueue *cq = opaque;
@@ -1377,8 +1444,10 @@ static void nvme_post_cqes(void *opaque)
         QTAILQ_INSERT_TAIL(&sq->req_list, req, entry);
     }
     if (cq->tail != cq->head) {
-        if (cq->irq_enabled && !pending) {
-            n->cq_pending++;
+        if (cq->irq_enabled) {
+            if (!pending) {
+                n->cq_pending++;
+            }
         }
 
         nvme_irq_assert(n, cq);
@@ -4705,6 +4774,14 @@ static void nvme_free_cq(NvmeCQueue *cq, NvmeCtrl *n)
         event_notifier_set_handler(&cq->notifier, NULL);
         event_notifier_cleanup(&cq->notifier);
     }
+    if (cq->assert_notifier.initialized) {
+        event_notifier_set_handler(&cq->assert_notifier, NULL);
+        event_notifier_cleanup(&cq->assert_notifier);
+    }
+    if (cq->deassert_notifier.initialized) {
+        event_notifier_set_handler(&cq->deassert_notifier, NULL);
+        event_notifier_cleanup(&cq->deassert_notifier);
+    }
     if (msix_enabled(&n->parent_obj)) {
         msix_vector_unuse(&n->parent_obj, cq->vector);
     }
@@ -4734,7 +4811,7 @@ static uint16_t nvme_del_cq(NvmeCtrl *n, NvmeRequest *req)
         n->cq_pending--;
     }
 
-    nvme_irq_deassert(n, cq);
+    nvme_irq_do_deassert(n, cq);
     trace_pci_nvme_del_cq(qid);
     nvme_free_cq(cq, n);
     return NVME_SUCCESS;
@@ -4772,6 +4849,14 @@ static void nvme_init_cq(NvmeCQueue *cq, NvmeCtrl *n, uint64_t dma_addr,
     }
     n->cq[cqid] = cq;
     cq->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, nvme_post_cqes, cq);
+
+    /*
+     * Only enable irq eventfd for IO queues since we always emulate admin
+     * queue in main loop thread.
+     */
+    if (cqid && n->params.irq_eventfd) {
+        nvme_init_irq_notifier(n, cq);
+    }
 }
 
 static uint16_t nvme_create_cq(NvmeCtrl *n, NvmeRequest *req)
@@ -7671,6 +7756,7 @@ static Property nvme_props[] = {
     DEFINE_PROP_BOOL("use-intel-id", NvmeCtrl, params.use_intel_id, false),
     DEFINE_PROP_BOOL("legacy-cmb", NvmeCtrl, params.legacy_cmb, false),
     DEFINE_PROP_BOOL("ioeventfd", NvmeCtrl, params.ioeventfd, false),
+    DEFINE_PROP_BOOL("irq-eventfd", NvmeCtrl, params.irq_eventfd, false),
     DEFINE_PROP_UINT8("zoned.zasl", NvmeCtrl, params.zasl, 0),
     DEFINE_PROP_BOOL("zoned.auto_transition", NvmeCtrl,
                      params.auto_transition_zones, true),
diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
index 79f5c281c2..4850d3e965 100644
--- a/hw/nvme/nvme.h
+++ b/hw/nvme/nvme.h
@@ -398,6 +398,8 @@ typedef struct NvmeCQueue {
     uint64_t    ei_addr;
     QEMUTimer   *timer;
     EventNotifier notifier;
+    EventNotifier assert_notifier;
+    EventNotifier deassert_notifier;
     bool        ioeventfd_enabled;
     QTAILQ_HEAD(, NvmeSQueue) sq_list;
     QTAILQ_HEAD(, NvmeRequest) req_list;
@@ -422,6 +424,7 @@ typedef struct NvmeParams {
     bool     auto_transition_zones;
     bool     legacy_cmb;
     bool     ioeventfd;
+    bool     irq_eventfd;
     uint8_t  sriov_max_vfs;
     uint16_t sriov_vq_flexible;
     uint16_t sriov_vi_flexible;
-- 
2.25.1


