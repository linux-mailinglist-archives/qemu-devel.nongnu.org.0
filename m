Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B8DD590057
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 17:41:59 +0200 (CEST)
Received: from localhost ([::1]:45252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMAJq-0008Hg-JZ
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 11:41:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fanjinhao21s@ict.ac.cn>)
 id 1oMAGV-0003F8-29; Thu, 11 Aug 2022 11:38:31 -0400
Received: from smtp21.cstnet.cn ([159.226.251.21]:49848 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fanjinhao21s@ict.ac.cn>)
 id 1oMAGR-000286-BN; Thu, 11 Aug 2022 11:38:30 -0400
Received: from localhost.localdomain (unknown [159.226.43.62])
 by APP-01 (Coremail) with SMTP id qwCowAA3GFlSIvViGUPiBw--.35837S4;
 Thu, 11 Aug 2022 23:38:17 +0800 (CST)
From: Jinhao Fan <fanjinhao21s@ict.ac.cn>
To: qemu-devel@nongnu.org
Cc: its@irrelevant.dk, kbusch@kernel.org, stefanha@gmail.com,
 Jinhao Fan <fanjinhao21s@ict.ac.cn>, qemu-block@nongnu.org (open list:nvme)
Subject: [PATCH 2/4] hw/nvme: add option to (de)assert irq with eventfd
Date: Thu, 11 Aug 2022 23:37:37 +0800
Message-Id: <20220811153739.3079672-3-fanjinhao21s@ict.ac.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220811153739.3079672-1-fanjinhao21s@ict.ac.cn>
References: <20220811153739.3079672-1-fanjinhao21s@ict.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowAA3GFlSIvViGUPiBw--.35837S4
X-Coremail-Antispam: 1UD129KBjvJXoW3Jr4Duw13Gw15Cry8Xr43Jrb_yoWxJw4Upa
 ykWrZY9Fs7Kw1xWa1YvFsrZr1ru3yrXrWDArsxt34UJwn3Cry7AFWUGFyUtFWfXrZ5Xry5
 Zr4jqF4Uu348JaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBC14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
 x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
 Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84
 ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AI
 xVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20x
 vE14v26r1j6r18McIj6I8E87Iv67AKxVWxJVW8Jr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
 Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0264kExVAvwVAq07x20x
 yl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWU
 JVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7V
 AKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42
 IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUU8nYDUUUU
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
---
 hw/nvme/ctrl.c | 89 ++++++++++++++++++++++++++++++++++++++++++++++++--
 hw/nvme/nvme.h |  4 +++
 2 files changed, 90 insertions(+), 3 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index bd3350d7e0..8a1c5ce3e1 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -1338,6 +1338,54 @@ static void nvme_update_cq_head(NvmeCQueue *cq)
     trace_pci_nvme_shadow_doorbell_cq(cq->cqid, cq->head);
 }
 
+static void nvme_assert_notifier_read(EventNotifier *e)
+{
+    NvmeCQueue *cq = container_of(e, NvmeCQueue, assert_notifier);
+    if (event_notifier_test_and_clear(e)) {
+        nvme_irq_assert(cq->ctrl, cq);
+    }
+}
+
+static void nvme_deassert_notifier_read(EventNotifier *e)
+{
+    NvmeCQueue *cq = container_of(e, NvmeCQueue, deassert_notifier);
+    if (event_notifier_test_and_clear(e)) {
+        nvme_irq_deassert(cq->ctrl, cq);
+    }
+}
+
+static void nvme_init_irq_notifier(NvmeCtrl *n, NvmeCQueue *cq)
+{
+    int ret;
+
+    ret = event_notifier_init(&cq->assert_notifier, 0);
+    if (ret < 0) {
+        goto fail_assert_handler;
+    }
+
+    event_notifier_set_handler(&cq->assert_notifier,
+                                nvme_assert_notifier_read);
+
+    if (!msix_enabled(&n->parent_obj)) {
+        ret = event_notifier_init(&cq->deassert_notifier, 0);
+        if (ret < 0) {
+            goto fail_deassert_handler;
+        }
+
+        event_notifier_set_handler(&cq->deassert_notifier,
+                                   nvme_deassert_notifier_read);
+    }
+
+    return;
+
+fail_deassert_handler:
+    event_notifier_set_handler(&cq->deassert_notifier, NULL);
+    event_notifier_cleanup(&cq->deassert_notifier);
+fail_assert_handler:
+    event_notifier_set_handler(&cq->assert_notifier, NULL);
+    event_notifier_cleanup(&cq->assert_notifier);
+}
+
 static void nvme_post_cqes(void *opaque)
 {
     NvmeCQueue *cq = opaque;
@@ -1382,7 +1430,23 @@ static void nvme_post_cqes(void *opaque)
                 n->cq_pending++;
             }
 
-            nvme_irq_assert(n, cq);
+            if (unlikely(cq->first_io_cqe)) {
+                /*
+                 * Initilize event notifier when first cqe is posted. For irqfd 
+                 * support we need to register the MSI message in KVM. We
+                 * can not do this registration at CQ creation time because
+                 * Linux's NVMe driver changes the MSI message after CQ creation.
+                 */
+                cq->first_io_cqe = false;
+
+                nvme_init_irq_notifier(n, cq);
+            }
+
+            if (cq->assert_notifier.initialized) {
+                event_notifier_set(&cq->assert_notifier);
+            } else {
+                nvme_irq_assert(n, cq);
+            }
         }
     }
 }
@@ -4249,7 +4313,11 @@ static void nvme_cq_notifier(EventNotifier *e)
     if (cq->irq_enabled && cq->tail == cq->head) {
         n->cq_pending--;
         if (!msix_enabled(&n->parent_obj)) {
-            nvme_irq_deassert(n, cq);
+            if (cq->deassert_notifier.initialized) {
+                event_notifier_set(&cq->deassert_notifier);
+            } else {
+                nvme_irq_deassert(n, cq);
+            }
         }
     }
 
@@ -4706,6 +4774,14 @@ static void nvme_free_cq(NvmeCQueue *cq, NvmeCtrl *n)
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
@@ -4737,6 +4813,7 @@ static uint16_t nvme_del_cq(NvmeCtrl *n, NvmeRequest *req)
         }
 
         if (!msix_enabled(&n->parent_obj)) {
+            /* Do not use eventfd since this is always called in main loop */
             nvme_irq_deassert(n, cq);
         }
     }
@@ -4777,6 +4854,7 @@ static void nvme_init_cq(NvmeCQueue *cq, NvmeCtrl *n, uint64_t dma_addr,
     }
     n->cq[cqid] = cq;
     cq->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, nvme_post_cqes, cq);
+    cq->first_io_cqe = cqid != 0;
 }
 
 static uint16_t nvme_create_cq(NvmeCtrl *n, NvmeRequest *req)
@@ -6926,7 +7004,11 @@ static void nvme_process_db(NvmeCtrl *n, hwaddr addr, int val)
         if (cq->irq_enabled && cq->tail == cq->head) {
             n->cq_pending--;
             if (!msix_enabled(&n->parent_obj)) {
-                nvme_irq_deassert(n, cq);
+                if (cq->deassert_notifier.initialized) {
+                    event_notifier_set(&cq->deassert_notifier);
+                } else {
+                    nvme_irq_deassert(n, cq);
+                }
             }
         }
     } else {
@@ -7675,6 +7757,7 @@ static Property nvme_props[] = {
     DEFINE_PROP_BOOL("use-intel-id", NvmeCtrl, params.use_intel_id, false),
     DEFINE_PROP_BOOL("legacy-cmb", NvmeCtrl, params.legacy_cmb, false),
     DEFINE_PROP_BOOL("ioeventfd", NvmeCtrl, params.ioeventfd, false),
+    DEFINE_PROP_BOOL("irq-eventfd", NvmeCtrl, params.irq_eventfd, false),
     DEFINE_PROP_UINT8("zoned.zasl", NvmeCtrl, params.zasl, 0),
     DEFINE_PROP_BOOL("zoned.auto_transition", NvmeCtrl,
                      params.auto_transition_zones, true),
diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
index 79f5c281c2..759d0ecd7c 100644
--- a/hw/nvme/nvme.h
+++ b/hw/nvme/nvme.h
@@ -398,6 +398,9 @@ typedef struct NvmeCQueue {
     uint64_t    ei_addr;
     QEMUTimer   *timer;
     EventNotifier notifier;
+    EventNotifier assert_notifier;
+    EventNotifier deassert_notifier;
+    bool        first_io_cqe;
     bool        ioeventfd_enabled;
     QTAILQ_HEAD(, NvmeSQueue) sq_list;
     QTAILQ_HEAD(, NvmeRequest) req_list;
@@ -422,6 +425,7 @@ typedef struct NvmeParams {
     bool     auto_transition_zones;
     bool     legacy_cmb;
     bool     ioeventfd;
+    bool     irq_eventfd;
     uint8_t  sriov_max_vfs;
     uint16_t sriov_vq_flexible;
     uint16_t sriov_vi_flexible;
-- 
2.25.1


