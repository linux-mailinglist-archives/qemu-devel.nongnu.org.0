Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C785B56C6EA
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Jul 2022 06:37:00 +0200 (CEST)
Received: from localhost ([::1]:58648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oA2DC-00082F-CL
	for lists+qemu-devel@lfdr.de; Sat, 09 Jul 2022 00:36:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fanjinhao21s@ict.ac.cn>)
 id 1oA2Bs-0007Ff-QA
 for qemu-devel@nongnu.org; Sat, 09 Jul 2022 00:35:36 -0400
Received: from smtp84.cstnet.cn ([159.226.251.84]:51528 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fanjinhao21s@ict.ac.cn>) id 1oA2Bm-0000L4-Mx
 for qemu-devel@nongnu.org; Sat, 09 Jul 2022 00:35:34 -0400
Received: from localhost.localdomain (unknown [159.226.43.7])
 by APP-05 (Coremail) with SMTP id zQCowADX3bF_BcliyN_yCw--.15975S2;
 Sat, 09 Jul 2022 12:35:19 +0800 (CST)
From: Jinhao Fan <fanjinhao21s@ict.ac.cn>
To: qemu-devel@nongnu.org
Cc: its@irrelevant.dk, kbusch@kernel.org, Jinhao Fan <fanjinhao21s@ict.ac.cn>
Subject: [RFC] hw/nvme: Use irqfd to send interrupts
Date: Sat,  9 Jul 2022 12:35:03 +0800
Message-Id: <20220709043503.2228736-1-fanjinhao21s@ict.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowADX3bF_BcliyN_yCw--.15975S2
X-Coremail-Antispam: 1UD129KBjvJXoWxCF45Zw4xAFWDXFWrXFWfAFb_yoWrGFykpa
 y7Ga93CrWkC34xWrsIqwnrCwn8u3yvqrnrAay3K34xXr1rCr9xArWkKF1UJFy5WrZ8XFW5
 Z395tF1Uua1jqaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUyC14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j
 6r4UM28EF7xvwVC2z280aVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr
 0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
 6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
 0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxAIw28IcxkI7VAK
 I48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7
 xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xII
 jxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw2
 0EY4v20xvaj40_WFyUJVCq3wCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF
 7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0JUywZ7UUUUU=
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

Use irqfd to directly notify KVM to inject interrupts. This is done by
registering a virtual IRQ(virq) in KVM and associate the virq with an
irqfd, so that KVM can directly inject the interrupt when it receives
notification from the irqfd. This approach is supposed to improve 
performance because it bypasses QEMU's MSI interrupt emulation logic.

However, I did not see an obvious improvement of the emulation KIOPS:

QD      1   4  16  64 
QEMU   38 123 210 329
irqfd  40 129 219 328

I found this problem quite hard to diagnose since irqfd's workflow
involves both QEMU and the in-kernel KVM. 

Could you help me figure out the following questions:

1. How much performance improvement can I expect from using irqfd?
2. How can I debug this kind of cross QEMU-KVM problems?

Signed-off-by: Jinhao Fan <fanjinhao21s@ict.ac.cn>
---
 hw/nvme/ctrl.c | 67 ++++++++++++++++++++++++++++++++++++++++++++++++-
 hw/nvme/nvme.h |  3 +++
 2 files changed, 68 insertions(+), 1 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 4b75c5f549..59768c4586 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -159,6 +159,7 @@
 #include "sysemu/sysemu.h"
 #include "sysemu/block-backend.h"
 #include "sysemu/hostmem.h"
+#include "sysemu/kvm.h"
 #include "hw/pci/msix.h"
 #include "migration/vmstate.h"
 
@@ -484,12 +485,70 @@ static void nvme_irq_check(NvmeCtrl *n)
     }
 }
 
+static int nvme_kvm_msix_vector_use(NvmeCtrl *n,
+                                    NvmeCQueue *cq,
+                                    int vector)
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
+static int nvme_init_cq_irqfd(NvmeCQueue *cq)
+{
+    int ret;
+    
+    ret = nvme_kvm_msix_vector_use(cq->ctrl, cq, (int)cq->vector);
+    if (ret < 0) {
+        goto fail;
+    }
+
+    ret = event_notifier_init(&cq->irq_notifier, 0);
+    if (ret < 0) {
+        goto fail_notifier;
+    }
+
+    ret = kvm_irqchip_add_irqfd_notifier_gsi(kvm_state, &cq->irq_notifier,
+                                              NULL, cq->virq);
+    if (ret < 0) {
+        goto fail_kvm;
+    }
+
+    return 0;
+                        
+fail_kvm:
+    event_notifier_cleanup(&cq->irq_notifier);
+fail_notifier:
+    kvm_irqchip_release_virq(kvm_state, cq->virq);
+fail:
+    return ret;
+}
+
 static void nvme_irq_assert(NvmeCtrl *n, NvmeCQueue *cq)
 {
     if (cq->irq_enabled) {
         if (msix_enabled(&(n->parent_obj))) {
+            /* Initialize CQ irqfd */
+            if (!cq->irqfd_enabled && n->params.ioeventfd && cq->cqid != 0) {
+                int ret = nvme_init_cq_irqfd(cq);
+                if (ret == 0) {
+                    cq->irqfd_enabled = true;
+                }
+            }
+
             trace_pci_nvme_irq_msix(cq->vector);
-            msix_notify(&(n->parent_obj), cq->vector);
+            if (cq->irqfd_enabled) {
+                event_notifier_set(&cq->irq_notifier);
+            } else {
+                msix_notify(&(n->parent_obj), cq->vector);
+            }
         } else {
             trace_pci_nvme_irq_pin();
             assert(cq->vector < 32);
@@ -4670,6 +4729,12 @@ static void nvme_free_cq(NvmeCQueue *cq, NvmeCtrl *n)
         event_notifier_cleanup(&cq->notifier);
     }
     if (msix_enabled(&n->parent_obj)) {
+        if (cq->irqfd_enabled) {
+            kvm_irqchip_remove_irqfd_notifier_gsi(kvm_state, &cq->irq_notifier,
+                                                  cq->virq);
+            kvm_irqchip_release_virq(kvm_state, cq->virq);
+            event_notifier_cleanup(&cq->irq_notifier);
+        }
         msix_vector_unuse(&n->parent_obj, cq->vector);
     }
     if (cq->cqid) {
diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
index 2a9beea0c8..84e5b00fe3 100644
--- a/hw/nvme/nvme.h
+++ b/hw/nvme/nvme.h
@@ -391,7 +391,10 @@ typedef struct NvmeCQueue {
     uint64_t    ei_addr;
     QEMUTimer   *timer;
     EventNotifier notifier;
+    EventNotifier irq_notifier;
+    int         virq;
     bool        ioeventfd_enabled;
+    bool        irqfd_enabled;
     QTAILQ_HEAD(, NvmeSQueue) sq_list;
     QTAILQ_HEAD(, NvmeRequest) req_list;
 } NvmeCQueue;
-- 
2.25.1


