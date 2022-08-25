Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F385A0AD5
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 09:57:11 +0200 (CEST)
Received: from localhost ([::1]:43230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oR7jh-00070R-S6
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 03:57:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fanjinhao21s@ict.ac.cn>)
 id 1oR7b4-0006y0-HZ; Thu, 25 Aug 2022 03:48:14 -0400
Received: from smtp84.cstnet.cn ([159.226.251.84]:57346 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fanjinhao21s@ict.ac.cn>)
 id 1oR7b1-0001BR-Jl; Thu, 25 Aug 2022 03:48:14 -0400
Received: from localhost.localdomain (unknown [159.226.43.62])
 by APP-05 (Coremail) with SMTP id zQCowAAX+ookKQdjLzYIAA--.1273S5;
 Thu, 25 Aug 2022 15:48:03 +0800 (CST)
From: Jinhao Fan <fanjinhao21s@ict.ac.cn>
To: qemu-devel@nongnu.org
Cc: its@irrelevant.dk, kbusch@kernel.org, stefanha@gmail.com,
 Jinhao Fan <fanjinhao21s@ict.ac.cn>, qemu-block@nongnu.org (open list:nvme)
Subject: [PATCH v2 3/3] hw/nvme: add MSI-x mask handlers for irqfd
Date: Thu, 25 Aug 2022 15:47:46 +0800
Message-Id: <20220825074746.2047420-4-fanjinhao21s@ict.ac.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220825074746.2047420-1-fanjinhao21s@ict.ac.cn>
References: <20220825074746.2047420-1-fanjinhao21s@ict.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowAAX+ookKQdjLzYIAA--.1273S5
X-Coremail-Antispam: 1UD129KBjvJXoWxKrWDuw1UCF4rAFyDtr15CFg_yoW7GFW8pa
 s7JFZagFZ7KFWIganIvrsrJr15Z39YqryUJw43Kw1xWay09r9IvFW8GF15AFy5GFZxXF1Y
 v398tr47WwnxXaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUPm14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JrWl82xGYIkIc2
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
 Xa7sREVbyDUUUUU==
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
index 74075f782f..30bbda7bb5 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -7493,10 +7493,84 @@ static int nvme_add_pm_capability(PCIDevice *pci_dev, uint8_t offset)
 
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
+    for (uint32_t i = 1; i <= n->params.max_ioqpairs; i++) {
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
+    for (uint32_t i = 1; i <= n->params.max_ioqpairs; i++) {
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
+    for (uint32_t i = 1; i <= n->params.max_ioqpairs; i++) {
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
@@ -7549,6 +7623,13 @@ static int nvme_init_pci(NvmeCtrl *n, PCIDevice *pci_dev, Error **errp)
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
@@ -7796,6 +7877,7 @@ static void nvme_exit(PCIDevice *pci_dev)
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


