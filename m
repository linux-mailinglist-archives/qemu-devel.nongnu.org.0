Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3376059006A
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 17:43:35 +0200 (CEST)
Received: from localhost ([::1]:49322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMALO-0002nh-3A
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 11:43:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fanjinhao21s@ict.ac.cn>)
 id 1oMAGS-00036x-6u; Thu, 11 Aug 2022 11:38:28 -0400
Received: from smtp21.cstnet.cn ([159.226.251.21]:49842 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fanjinhao21s@ict.ac.cn>)
 id 1oMAGP-00027h-0T; Thu, 11 Aug 2022 11:38:27 -0400
Received: from localhost.localdomain (unknown [159.226.43.62])
 by APP-01 (Coremail) with SMTP id qwCowAA3GFlSIvViGUPiBw--.35837S5;
 Thu, 11 Aug 2022 23:38:20 +0800 (CST)
From: Jinhao Fan <fanjinhao21s@ict.ac.cn>
To: qemu-devel@nongnu.org
Cc: its@irrelevant.dk, kbusch@kernel.org, stefanha@gmail.com,
 Jinhao Fan <fanjinhao21s@ict.ac.cn>, qemu-block@nongnu.org (open list:nvme)
Subject: [PATCH 3/4] hw/nvme: use irqfd to send interrupts
Date: Thu, 11 Aug 2022 23:37:38 +0800
Message-Id: <20220811153739.3079672-4-fanjinhao21s@ict.ac.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220811153739.3079672-1-fanjinhao21s@ict.ac.cn>
References: <20220811153739.3079672-1-fanjinhao21s@ict.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowAA3GFlSIvViGUPiBw--.35837S5
X-Coremail-Antispam: 1UD129KBjvJXoWxCw43AF17Kw1xJr4kuF1UGFg_yoWrXr48pa
 4kGrZ5CF4vy34xWa1avrsrAr1ru3y8tryUJ3ySkry7Arn5Kr9xArW8CF1UtFy8Jr98XFy5
 ZrsFqr4Uua45XaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBC14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JrWl82xGYIkIc2
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
 IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUUdb1DUUUU
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

Use KVM's irqfd to send interrupts when possible. This approach is
thread safe. Moreover, it does not have the inter-thread communication
overhead of plain event notifiers since handler callback are called
in the same system call as irqfd write.

Signed-off-by: Jinhao Fan <fanjinhao21s@ict.ac.cn>
---
 hw/nvme/ctrl.c | 50 ++++++++++++++++++++++++++++++++++++++++++++++++--
 hw/nvme/nvme.h |  1 +
 2 files changed, 49 insertions(+), 2 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 8a1c5ce3e1..63f988f2f9 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -192,6 +192,7 @@
 #include "qapi/error.h"
 #include "qapi/visitor.h"
 #include "sysemu/sysemu.h"
+#include "sysemu/kvm.h"
 #include "sysemu/block-backend.h"
 #include "sysemu/hostmem.h"
 #include "hw/pci/msix.h"
@@ -1354,8 +1355,26 @@ static void nvme_deassert_notifier_read(EventNotifier *e)
     }
 }
 
+static int nvme_kvm_msix_vector_use(NvmeCtrl *n,
+                                    NvmeCQueue *cq,
+                                    uint32_t vector)
+{
+    int ret;
+
+    KVMRouteChange c = kvm_irqchip_begin_route_changes(kvm_state);
+    ret = kvm_irqchip_add_msi_route(&c, vector, &n->parent_obj);
+    if (ret < 0) {
+        return ret;
+    }
+    kvm_irqchip_commit_route_changes(&c);
+    cq->virq = ret;
+    return 0;
+}
+
 static void nvme_init_irq_notifier(NvmeCtrl *n, NvmeCQueue *cq)
 {
+    bool with_irqfd = msix_enabled(&n->parent_obj) &&
+                      kvm_msi_via_irqfd_enabled();
     int ret;
 
     ret = event_notifier_init(&cq->assert_notifier, 0);
@@ -1363,8 +1382,21 @@ static void nvme_init_irq_notifier(NvmeCtrl *n, NvmeCQueue *cq)
         goto fail_assert_handler;
     }
 
-    event_notifier_set_handler(&cq->assert_notifier,
-                                nvme_assert_notifier_read);
+    if (with_irqfd) {
+        ret = nvme_kvm_msix_vector_use(n, cq, cq->vector);
+        if (ret < 0) {
+            goto fail_assert_handler;
+        }
+        ret = kvm_irqchip_add_irqfd_notifier_gsi(kvm_state,
+                                                 &cq->assert_notifier, NULL, 
+                                                 cq->virq);
+        if (ret < 0) {
+            goto fail_kvm;
+         }
+    } else {
+        event_notifier_set_handler(&cq->assert_notifier,
+                                   nvme_assert_notifier_read);
+    }
 
     if (!msix_enabled(&n->parent_obj)) {
         ret = event_notifier_init(&cq->deassert_notifier, 0);
@@ -1381,6 +1413,12 @@ static void nvme_init_irq_notifier(NvmeCtrl *n, NvmeCQueue *cq)
 fail_deassert_handler:
     event_notifier_set_handler(&cq->deassert_notifier, NULL);
     event_notifier_cleanup(&cq->deassert_notifier);
+    if (with_irqfd) {
+        kvm_irqchip_remove_irqfd_notifier_gsi(kvm_state, &cq->assert_notifier,
+                                              cq->virq);
+fail_kvm:
+        kvm_irqchip_release_virq(kvm_state, cq->virq);
+    }
 fail_assert_handler:
     event_notifier_set_handler(&cq->assert_notifier, NULL);
     event_notifier_cleanup(&cq->assert_notifier);
@@ -4764,6 +4802,8 @@ static uint16_t nvme_get_log(NvmeCtrl *n, NvmeRequest *req)
 
 static void nvme_free_cq(NvmeCQueue *cq, NvmeCtrl *n)
 {
+    bool with_irqfd = msix_enabled(&n->parent_obj) &&
+                      kvm_msi_via_irqfd_enabled();
     uint16_t offset = (cq->cqid << 3) + (1 << 2);
 
     n->cq[cq->cqid] = NULL;
@@ -4775,6 +4815,12 @@ static void nvme_free_cq(NvmeCQueue *cq, NvmeCtrl *n)
         event_notifier_cleanup(&cq->notifier);
     }
     if (cq->assert_notifier.initialized) {
+        if (with_irqfd) {
+            kvm_irqchip_remove_irqfd_notifier_gsi(kvm_state,
+                                                  &cq->assert_notifier, 
+                                                  cq->virq);
+            kvm_irqchip_release_virq(kvm_state, cq->virq);
+        }
         event_notifier_set_handler(&cq->assert_notifier, NULL);
         event_notifier_cleanup(&cq->assert_notifier);
     }
diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
index 759d0ecd7c..85fd9cd0e2 100644
--- a/hw/nvme/nvme.h
+++ b/hw/nvme/nvme.h
@@ -396,6 +396,7 @@ typedef struct NvmeCQueue {
     uint64_t    dma_addr;
     uint64_t    db_addr;
     uint64_t    ei_addr;
+    int         virq;
     QEMUTimer   *timer;
     EventNotifier notifier;
     EventNotifier assert_notifier;
-- 
2.25.1


