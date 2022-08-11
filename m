Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF8559007F
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 17:43:42 +0200 (CEST)
Received: from localhost ([::1]:49716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMALV-000352-Po
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 11:43:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fanjinhao21s@ict.ac.cn>)
 id 1oMAGV-0003Hj-Oo; Thu, 11 Aug 2022 11:38:31 -0400
Received: from smtp21.cstnet.cn ([159.226.251.21]:49856 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fanjinhao21s@ict.ac.cn>)
 id 1oMAGR-00028h-UH; Thu, 11 Aug 2022 11:38:31 -0400
Received: from localhost.localdomain (unknown [159.226.43.62])
 by APP-01 (Coremail) with SMTP id qwCowAA3GFlSIvViGUPiBw--.35837S6;
 Thu, 11 Aug 2022 23:38:25 +0800 (CST)
From: Jinhao Fan <fanjinhao21s@ict.ac.cn>
To: qemu-devel@nongnu.org
Cc: its@irrelevant.dk, kbusch@kernel.org, stefanha@gmail.com,
 Jinhao Fan <fanjinhao21s@ict.ac.cn>, qemu-block@nongnu.org (open list:nvme)
Subject: [PATCH 4/4] hw/nvme: add MSI-x mask handlers for irqfd
Date: Thu, 11 Aug 2022 23:37:39 +0800
Message-Id: <20220811153739.3079672-5-fanjinhao21s@ict.ac.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220811153739.3079672-1-fanjinhao21s@ict.ac.cn>
References: <20220811153739.3079672-1-fanjinhao21s@ict.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowAA3GFlSIvViGUPiBw--.35837S6
X-Coremail-Antispam: 1UD129KBjvJXoWxKrWDuw1UCF4rAFyDtr15CFg_yoW7GFW7pa
 s7XFZ3WFZ7tFWIganIvrsrJr15Z39YqryUJw43Kw1IkayIkr9IvFW8KF15AFy5GFZxXF1Y
 v3y5tr47WwnxXaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUPj14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
 kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
 z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr
 1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0D
 M2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjx
 v20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWxJVW8Jr1lOx8S6xCaFVCjc4AY6r1j6r4U
 M4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0264kExVAvwVAq07
 x20xyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AK
 xVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrx
 kI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v2
 6r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8Jw
 CI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUnT5lDUUU
 U
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

When irqfd is enabled, we bypass QEMU's irq emulation and let KVM to
directly assert the irq. However, KVM is not aware of the device's MSI-x
masking status. Add MSI-x mask bookkeeping in NVMe emulation and
detach the corresponding irqfd when the certain vector is masked.

Signed-off-by: Jinhao Fan <fanjinhao21s@ict.ac.cn>
---
 hw/nvme/ctrl.c       | 82 ++++++++++++++++++++++++++++++++++++++++++++
 hw/nvme/nvme.h       |  2 ++
 hw/nvme/trace-events |  3 ++
 3 files changed, 87 insertions(+)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 63f988f2f9..ac5460c7c8 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -7478,10 +7478,84 @@ static int nvme_add_pm_capability(PCIDevice *pci_dev, uint8_t offset)
 
     return 0;
 }
+static int nvme_vector_unmask(PCIDevice *pci_dev, unsigned vector,
+                               MSIMessage msg)
+{
+    NvmeCtrl *n = NVME(pci_dev);
+    int ret;
+
+    trace_pci_nvme_irq_unmask(vector, msg.address, msg.data);
+    
+    for (uint32_t i = 0; i < n->params.max_ioqpairs + 1; i++) {
+        NvmeCQueue *cq = n->cq[i];
+        /* 
+         * If this function is called, then irqfd must be available. Therefore,
+         * irqfd must be in use if cq->assert_notifier.initialized is true.
+         */
+        if (cq && cq->vector == vector && cq->assert_notifier.initialized) {
+            if (cq->msg.data != msg.data || cq->msg.address != msg.address) {
+                ret = kvm_irqchip_update_msi_route(kvm_state, cq->virq, msg,
+                                                   pci_dev);
+                if (ret < 0) {
+                    return ret;
+                }
+                kvm_irqchip_commit_routes(kvm_state);
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
+static void nvme_vector_mask(PCIDevice *pci_dev, unsigned vector)
+{
+    NvmeCtrl *n = NVME(pci_dev);
+
+    trace_pci_nvme_irq_mask(vector);
+    
+    for (uint32_t i = 0; i < n->params.max_ioqpairs + 1; i++) {
+        NvmeCQueue *cq = n->cq[i];
+        if (cq && cq->vector == vector && cq->assert_notifier.initialized) {
+            kvm_irqchip_remove_irqfd_notifier_gsi(kvm_state,
+                                                  &cq->assert_notifier,
+                                                  cq->virq);
+        }
+    }
+}
+
+static void nvme_vector_poll(PCIDevice *pci_dev,
+                             unsigned int vector_start,
+                             unsigned int vector_end)
+{
+    NvmeCtrl *n = NVME(pci_dev);
+
+    trace_pci_nvme_irq_poll(vector_start, vector_end);
+
+    for (uint32_t i = 0; i < n->params.max_ioqpairs + 1; i++) {
+        NvmeCQueue *cq = n->cq[i];
+        if (cq && cq->vector >= vector_start && cq->vector <= vector_end 
+            && msix_is_masked(pci_dev, cq->vector) 
+            && cq->assert_notifier.initialized) {
+            if (event_notifier_test_and_clear(&cq->assert_notifier)) {
+                msix_set_pending(pci_dev, i);
+            }
+        }
+    }
+}
 
 static int nvme_init_pci(NvmeCtrl *n, PCIDevice *pci_dev, Error **errp)
 {
     uint8_t *pci_conf = pci_dev->config;
+    bool with_irqfd = msix_enabled(&n->parent_obj) &&
+                      kvm_msi_via_irqfd_enabled();
     uint64_t bar_size;
     unsigned msix_table_offset, msix_pba_offset;
     int ret;
@@ -7534,6 +7608,13 @@ static int nvme_init_pci(NvmeCtrl *n, PCIDevice *pci_dev, Error **errp)
         }
     }
 
+    if (with_irqfd) {
+        msix_set_vector_notifiers(pci_dev,
+                                  nvme_vector_unmask,
+                                  nvme_vector_mask,
+                                  nvme_vector_poll);
+    }
+
     nvme_update_msixcap_ts(pci_dev, n->conf_msix_qsize);
 
     if (n->params.cmb_size_mb) {
@@ -7781,6 +7862,7 @@ static void nvme_exit(PCIDevice *pci_dev)
         pcie_sriov_pf_exit(pci_dev);
     }
 
+    msix_unset_vector_notifiers(pci_dev);
     msix_uninit(pci_dev, &n->bar0, &n->bar0);
     memory_region_del_subregion(&n->bar0, &n->iomem);
 }
diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
index 85fd9cd0e2..707a55ebfc 100644
--- a/hw/nvme/nvme.h
+++ b/hw/nvme/nvme.h
@@ -20,6 +20,7 @@
 
 #include "qemu/uuid.h"
 #include "hw/pci/pci.h"
+#include "hw/pci/msi.h"
 #include "hw/block/block.h"
 
 #include "block/nvme.h"
@@ -401,6 +402,7 @@ typedef struct NvmeCQueue {
     EventNotifier notifier;
     EventNotifier assert_notifier;
     EventNotifier deassert_notifier;
+    MSIMessage  msg;
     bool        first_io_cqe;
     bool        ioeventfd_enabled;
     QTAILQ_HEAD(, NvmeSQueue) sq_list;
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


