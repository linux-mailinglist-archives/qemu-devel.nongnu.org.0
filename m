Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A6F5A2AE8
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 17:17:20 +0200 (CEST)
Received: from localhost ([::1]:33246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRb5D-0003S1-4p
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 11:17:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fanjinhao21s@ict.ac.cn>)
 id 1oRb0R-0006L3-AF; Fri, 26 Aug 2022 11:12:24 -0400
Received: from smtp84.cstnet.cn ([159.226.251.84]:40638 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fanjinhao21s@ict.ac.cn>)
 id 1oRb0O-0005Kj-6P; Fri, 26 Aug 2022 11:12:22 -0400
Received: from localhost.localdomain (unknown [159.226.43.62])
 by APP-05 (Coremail) with SMTP id zQCowAB3v4_J4ghjTGF5AA--.15491S4;
 Fri, 26 Aug 2022 23:12:17 +0800 (CST)
From: Jinhao Fan <fanjinhao21s@ict.ac.cn>
To: qemu-devel@nongnu.org
Cc: its@irrelevant.dk, kbusch@kernel.org, stefanha@gmail.com,
 Jinhao Fan <fanjinhao21s@ict.ac.cn>, Klaus Jensen <k.jensen@samsung.com>,
 qemu-block@nongnu.org (open list:nvme)
Subject: [PATCH v2 2/3] hw/nvme: use KVM irqfd when available
Date: Fri, 26 Aug 2022 23:12:04 +0800
Message-Id: <20220826151206.3148942-3-fanjinhao21s@ict.ac.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220826151206.3148942-1-fanjinhao21s@ict.ac.cn>
References: <20220826151206.3148942-1-fanjinhao21s@ict.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowAB3v4_J4ghjTGF5AA--.15491S4
X-Coremail-Antispam: 1UD129KBjvJXoW3JF18trW8XFWUCr18Cw1xKrg_yoW3GFy3pa
 4kGFZ3uFs7JFyxWan0vrsrJrn5u39YqryUJw43K347CF10kr9xAFW8GF1UAF1rGrZ8XF98
 Z398tr4Uu34fXaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUmmb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
 8067AKxVWUXwA2048vs2IY020Ec7CjxVAFwI0_Gr0_Xr1l8cAvFVAK0II2c7xJM28CjxkF
 64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcV
 CY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIE
 c7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I
 8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCF
 s4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7
 CjxVAKzI0EY4vE52x082I5MxkIecxEwVAFwVW5WwCF04k20xvY0x0EwIxGrwCFx2IqxVCF
 s4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r
 1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWU
 JVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r
 1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1U
 YxBIdaVFxhVjvjDU0xZFpf9x07jOcTPUUUUU=
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
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c       | 145 ++++++++++++++++++++++++++++++++++++++++++-
 hw/nvme/nvme.h       |   3 +
 hw/nvme/trace-events |   3 +
 3 files changed, 149 insertions(+), 2 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 51792f3955..396f3f0cdd 100644
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
@@ -1377,8 +1378,115 @@ static void nvme_deassert_notifier_read(EventNotifier *e)
     }
 }
 
+static int nvme_kvm_vector_use(NvmeCtrl *n, NvmeCQueue *cq, uint32_t vector)
+{
+    KVMRouteChange c = kvm_irqchip_begin_route_changes(kvm_state);
+    int ret;
+
+    ret = kvm_irqchip_add_msi_route(&c, vector, &n->parent_obj);
+    if (ret < 0) {
+        return ret;
+    }
+
+    kvm_irqchip_commit_route_changes(&c);
+
+    cq->virq = ret;
+
+    return 0;
+}
+
+static int nvme_kvm_vector_unmask(PCIDevice *pci_dev, unsigned vector,
+                                  MSIMessage msg)
+{
+    NvmeCtrl *n = NVME(pci_dev);
+    int ret;
+
+    trace_pci_nvme_irq_unmask(vector, msg.address, msg.data);
+
+    for (uint32_t i = 1; i <= n->params.max_ioqpairs; i++) {
+        NvmeCQueue *cq = n->cq[i];
+
+        if (!cq) {
+            continue;
+        }
+
+        if (cq->vector == vector) {
+            if (cq->msg.data != msg.data || cq->msg.address != msg.address) {
+                ret = kvm_irqchip_update_msi_route(kvm_state, cq->virq, msg,
+                                                   pci_dev);
+                if (ret < 0) {
+                    return ret;
+                }
+
+                kvm_irqchip_commit_routes(kvm_state);
+
+                cq->msg = msg;
+            }
+
+            ret = kvm_irqchip_add_irqfd_notifier_gsi(kvm_state,
+                                                     &cq->assert_notifier,
+                                                     NULL, cq->virq);
+            if (ret < 0) {
+                return ret;
+            }
+        }
+    }
+
+    return 0;
+}
+
+static void nvme_kvm_vector_mask(PCIDevice *pci_dev, unsigned vector)
+{
+    NvmeCtrl *n = NVME(pci_dev);
+
+    trace_pci_nvme_irq_mask(vector);
+
+    for (uint32_t i = 1; i <= n->params.max_ioqpairs; i++) {
+        NvmeCQueue *cq = n->cq[i];
+
+        if (!cq) {
+            continue;
+        }
+
+        if (cq->vector == vector) {
+            kvm_irqchip_remove_irqfd_notifier_gsi(kvm_state,
+                                                  &cq->assert_notifier,
+                                                  cq->virq);
+        }
+    }
+}
+
+static void nvme_kvm_vector_poll(PCIDevice *pci_dev, unsigned int vector_start,
+                                 unsigned int vector_end)
+{
+    NvmeCtrl *n = NVME(pci_dev);
+
+    trace_pci_nvme_irq_poll(vector_start, vector_end);
+
+    for (uint32_t i = 1; i <= n->params.max_ioqpairs; i++) {
+        NvmeCQueue *cq = n->cq[i];
+
+        if (!cq) {
+            continue;
+        }
+
+        if (!msix_is_masked(pci_dev, cq->vector)) {
+            continue;
+        }
+
+        if (cq->vector >= vector_start && cq->vector <= vector_end) {
+            if (event_notifier_test_and_clear(&cq->assert_notifier)) {
+                msix_set_pending(pci_dev, i);
+            }
+        }
+    }
+}
+
+
 static void nvme_init_irq_notifier(NvmeCtrl *n, NvmeCQueue *cq)
 {
+    bool with_irqfd = msix_enabled(&n->parent_obj) &&
+                      kvm_msi_via_irqfd_enabled();
     int ret;
 
     ret = event_notifier_init(&cq->assert_notifier, 0);
@@ -1386,12 +1494,27 @@ static void nvme_init_irq_notifier(NvmeCtrl *n, NvmeCQueue *cq)
         return;
     }
 
-    event_notifier_set_handler(&cq->assert_notifier,
-                                nvme_assert_notifier_read);
+    if (with_irqfd) {
+        ret = nvme_kvm_vector_use(n, cq, cq->vector);
+        if (ret < 0) {
+            event_notifier_cleanup(&cq->assert_notifier);
+
+            return;
+        }
+    } else {
+        event_notifier_set_handler(&cq->assert_notifier,
+                                   nvme_assert_notifier_read);
+    }
 
     if (!msix_enabled(&n->parent_obj)) {
         ret = event_notifier_init(&cq->deassert_notifier, 0);
         if (ret < 0) {
+            if (with_irqfd) {
+                kvm_irqchip_remove_irqfd_notifier_gsi(kvm_state,
+                                                      &cq->assert_notifier,
+                                                      cq->virq);
+            }
+
             event_notifier_set_handler(&cq->assert_notifier, NULL);
             event_notifier_cleanup(&cq->assert_notifier);
 
@@ -4764,6 +4887,8 @@ static uint16_t nvme_get_log(NvmeCtrl *n, NvmeRequest *req)
 
 static void nvme_free_cq(NvmeCQueue *cq, NvmeCtrl *n)
 {
+    bool with_irqfd = msix_enabled(&n->parent_obj) &&
+                      kvm_msi_via_irqfd_enabled();
     uint16_t offset = (cq->cqid << 3) + (1 << 2);
 
     n->cq[cq->cqid] = NULL;
@@ -4775,6 +4900,12 @@ static void nvme_free_cq(NvmeCQueue *cq, NvmeCtrl *n)
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
@@ -6528,6 +6659,9 @@ static int nvme_start_ctrl(NvmeCtrl *n)
     uint32_t page_size = 1 << page_bits;
     NvmeSecCtrlEntry *sctrl = nvme_sctrl(n);
 
+    bool with_irqfd = msix_enabled(&n->parent_obj) &&
+                      kvm_msi_via_irqfd_enabled();
+
     if (pci_is_vf(&n->parent_obj) && !sctrl->scs) {
         trace_pci_nvme_err_startfail_virt_state(le16_to_cpu(sctrl->nvi),
                                                 le16_to_cpu(sctrl->nvq),
@@ -6617,6 +6751,12 @@ static int nvme_start_ctrl(NvmeCtrl *n)
 
     nvme_select_iocs(n);
 
+    if (with_irqfd) {
+        return msix_set_vector_notifiers(PCI_DEVICE(n), nvme_kvm_vector_unmask,
+                                         nvme_kvm_vector_mask,
+                                         nvme_kvm_vector_poll);
+    }
+
     return 0;
 }
 
@@ -7734,6 +7874,7 @@ static void nvme_exit(PCIDevice *pci_dev)
         pcie_sriov_pf_exit(pci_dev);
     }
 
+    msix_unset_vector_notifiers(pci_dev);
     msix_uninit(pci_dev, &n->bar0, &n->bar0);
     memory_region_del_subregion(&n->bar0, &n->iomem);
 }
diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
index 4850d3e965..b0b986b024 100644
--- a/hw/nvme/nvme.h
+++ b/hw/nvme/nvme.h
@@ -20,6 +20,7 @@
 
 #include "qemu/uuid.h"
 #include "hw/pci/pci.h"
+#include "hw/pci/msi.h"
 #include "hw/block/block.h"
 
 #include "block/nvme.h"
@@ -396,10 +397,12 @@ typedef struct NvmeCQueue {
     uint64_t    dma_addr;
     uint64_t    db_addr;
     uint64_t    ei_addr;
+    int         virq;
     QEMUTimer   *timer;
     EventNotifier notifier;
     EventNotifier assert_notifier;
     EventNotifier deassert_notifier;
+    MSIMessage  msg;
     bool        ioeventfd_enabled;
     QTAILQ_HEAD(, NvmeSQueue) sq_list;
     QTAILQ_HEAD(, NvmeRequest) req_list;
diff --git a/hw/nvme/trace-events b/hw/nvme/trace-events
index fccb79f489..b11fcf4a65 100644
--- a/hw/nvme/trace-events
+++ b/hw/nvme/trace-events
@@ -2,6 +2,9 @@
 pci_nvme_irq_msix(uint32_t vector) "raising MSI-X IRQ vector %u"
 pci_nvme_irq_pin(void) "pulsing IRQ pin"
 pci_nvme_irq_masked(void) "IRQ is masked"
+pci_nvme_irq_mask(uint32_t vector) "IRQ %u gets masked"
+pci_nvme_irq_unmask(uint32_t vector, uint64_t addr, uint32_t data) "IRQ %u gets unmasked, addr=0x%"PRIx64" data=0x%"PRIu32""
+pci_nvme_irq_poll(uint32_t vector_start, uint32_t vector_end) "IRQ poll, start=0x%"PRIu32" end=0x%"PRIu32""
 pci_nvme_dma_read(uint64_t prp1, uint64_t prp2) "DMA read, prp1=0x%"PRIx64" prp2=0x%"PRIx64""
 pci_nvme_dbbuf_config(uint64_t dbs_addr, uint64_t eis_addr) "dbs_addr=0x%"PRIx64" eis_addr=0x%"PRIx64""
 pci_nvme_map_addr(uint64_t addr, uint64_t len) "addr 0x%"PRIx64" len %"PRIu64""
-- 
2.25.1


