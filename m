Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EFA85A0AC0
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 09:53:34 +0200 (CEST)
Received: from localhost ([::1]:48356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oR7gD-0003M9-Gq
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 03:53:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fanjinhao21s@ict.ac.cn>)
 id 1oR7b4-0006xq-FO; Thu, 25 Aug 2022 03:48:14 -0400
Received: from smtp84.cstnet.cn ([159.226.251.84]:57316 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fanjinhao21s@ict.ac.cn>)
 id 1oR7b1-0001BF-1V; Thu, 25 Aug 2022 03:48:14 -0400
Received: from localhost.localdomain (unknown [159.226.43.62])
 by APP-05 (Coremail) with SMTP id zQCowAAX+ookKQdjLzYIAA--.1273S4;
 Thu, 25 Aug 2022 15:47:59 +0800 (CST)
From: Jinhao Fan <fanjinhao21s@ict.ac.cn>
To: qemu-devel@nongnu.org
Cc: its@irrelevant.dk, kbusch@kernel.org, stefanha@gmail.com,
 Jinhao Fan <fanjinhao21s@ict.ac.cn>, qemu-block@nongnu.org (open list:nvme)
Subject: [PATCH v2 2/3] hw/nvme: use KVM irqfd when available
Date: Thu, 25 Aug 2022 15:47:45 +0800
Message-Id: <20220825074746.2047420-3-fanjinhao21s@ict.ac.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220825074746.2047420-1-fanjinhao21s@ict.ac.cn>
References: <20220825074746.2047420-1-fanjinhao21s@ict.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowAAX+ookKQdjLzYIAA--.1273S4
X-Coremail-Antispam: 1UD129KBjvJXoWxCw43AF17KF43ZFy3XF1xGrg_yoWrXr48pa
 4kGrZ5CF4vya4xWa1avrsrAr1ru3yrtryUJ3ySkry7Arn5Kr9xArW8AF1UtFy8Jr98XFy5
 ZwsFqr4Uua4UXaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUPm14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
 x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
 Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
 8EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
 0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
 IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
 Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0264kExVAvwVAq07x20x
 ylc2xSY4AK67AK6r4xMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I
 3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxV
 WUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8I
 cVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aV
 AFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZE
 Xa7sRE189DUUUUU==
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
index 6ecf6fafd9..74075f782f 100644
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
@@ -1377,8 +1378,26 @@ static void nvme_deassert_notifier_read(EventNotifier *e)
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
@@ -1386,8 +1405,21 @@ static void nvme_init_irq_notifier(NvmeCtrl *n, NvmeCQueue *cq)
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
@@ -1404,6 +1436,12 @@ static void nvme_init_irq_notifier(NvmeCtrl *n, NvmeCQueue *cq)
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
@@ -4783,6 +4821,8 @@ static uint16_t nvme_get_log(NvmeCtrl *n, NvmeRequest *req)
 
 static void nvme_free_cq(NvmeCQueue *cq, NvmeCtrl *n)
 {
+    bool with_irqfd = msix_enabled(&n->parent_obj) &&
+                      kvm_msi_via_irqfd_enabled();
     uint16_t offset = (cq->cqid << 3) + (1 << 2);
 
     n->cq[cq->cqid] = NULL;
@@ -4794,6 +4834,12 @@ static void nvme_free_cq(NvmeCQueue *cq, NvmeCtrl *n)
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


