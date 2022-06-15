Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9774B54CBCF
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 16:54:10 +0200 (CEST)
Received: from localhost ([::1]:51696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1UPJ-0006Fl-NC
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 10:54:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fanjinhao21s@ict.ac.cn>)
 id 1o1ULb-0001Hx-ND
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 10:50:19 -0400
Received: from smtp84.cstnet.cn ([159.226.251.84]:55976 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fanjinhao21s@ict.ac.cn>) id 1o1ULY-0000X0-SW
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 10:50:19 -0400
Received: from localhost.localdomain (unknown [159.226.43.7])
 by APP-05 (Coremail) with SMTP id zQCowACHjbGX8aliCU+PAw--.59018S4;
 Wed, 15 Jun 2022 22:50:09 +0800 (CST)
From: Jinhao Fan <fanjinhao21s@ict.ac.cn>
To: qemu-devel@nongnu.org
Cc: its@irrelevant.dk, kbusch@kernel.org, Jinhao Fan <fanjinhao21s@ict.ac.cn>
Subject: [PATCH v2 2/2] hw/nvme: Add trace events for shadow doorbell buffer
Date: Wed, 15 Jun 2022 22:49:07 +0800
Message-Id: <20220615144907.3093384-3-fanjinhao21s@ict.ac.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220615144907.3093384-1-fanjinhao21s@ict.ac.cn>
References: <20220615144907.3093384-1-fanjinhao21s@ict.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowACHjbGX8aliCU+PAw--.59018S4
X-Coremail-Antispam: 1UD129KBjvJXoWxXw1kur47Zw4fGFWxXF1kKrg_yoWrZFyrpF
 WaqFnIy34SkFZ2v3s8ArnrJr18Xw4qqry0kwsrtr1xta97ury2vFyxtryrZr15WFs7JrW5
 uas3tr42qr9rXFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9v14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
 x26xkF7I0E14v26r1I6r4UM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
 Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84
 ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AI
 xVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20x
 vE14v26r1j6r18McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xv
 r2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxAIw28IcxkI7VAKI48JMxC20s
 026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_
 JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14
 v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xva
 j40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JV
 W8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUjhL07UUUUU==
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

When shadow doorbell buffer is enabled, doorbell registers are lazily
updated. The actual queue head and tail pointers are stored in Shadow
Doorbell buffers.

Add trace events for updates on the Shadow Doorbell buffers and EventIdx
buffers. Also add trace event for the Doorbell Buffer Config command.

Signed-off-by: Jinhao Fan <fanjinhao21s@ict.ac.cn>
---
 hw/nvme/ctrl.c       | 5 +++++
 hw/nvme/trace-events | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 7be2e43f52..77fa79143d 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -1309,6 +1309,7 @@ static void nvme_update_cq_head(NvmeCQueue *cq)
 {
     pci_dma_read(&cq->ctrl->parent_obj, cq->db_addr, &cq->head,
             sizeof(cq->head));
+    trace_pci_nvme_shadow_doorbell_cq(cq->cqid, cq->head);
 }
 
 static void nvme_post_cqes(void *opaque)
@@ -5827,6 +5828,8 @@ static uint16_t nvme_dbbuf_config(NvmeCtrl *n, const NvmeRequest *req)
         }
     }
 
+    trace_pci_nvme_dbbuf_config(dbs_addr, eis_addr);
+
     return NVME_SUCCESS;
 }
 
@@ -5887,12 +5890,14 @@ static void nvme_update_sq_eventidx(const NvmeSQueue *sq)
 {
     pci_dma_write(&sq->ctrl->parent_obj, sq->ei_addr, &sq->tail,
                   sizeof(sq->tail));
+    trace_pci_nvme_eventidx_sq(sq->sqid, sq->tail);
 }
 
 static void nvme_update_sq_tail(NvmeSQueue *sq)
 {
     pci_dma_read(&sq->ctrl->parent_obj, sq->db_addr, &sq->tail,
                  sizeof(sq->tail));
+    trace_pci_nvme_shadow_doorbell_sq(sq->sqid, sq->tail);
 }
 
 static void nvme_process_sq(void *opaque)
diff --git a/hw/nvme/trace-events b/hw/nvme/trace-events
index ff1b458969..00ee42f475 100644
--- a/hw/nvme/trace-events
+++ b/hw/nvme/trace-events
@@ -3,6 +3,7 @@ pci_nvme_irq_msix(uint32_t vector) "raising MSI-X IRQ vector %u"
 pci_nvme_irq_pin(void) "pulsing IRQ pin"
 pci_nvme_irq_masked(void) "IRQ is masked"
 pci_nvme_dma_read(uint64_t prp1, uint64_t prp2) "DMA read, prp1=0x%"PRIx64" prp2=0x%"PRIx64""
+pci_nvme_dbbuf_config(uint64_t dbs_addr, uint64_t eis_addr) "dbs_addr=0x%"PRIx64" eis_addr=0x%"PRIx64""
 pci_nvme_map_addr(uint64_t addr, uint64_t len) "addr 0x%"PRIx64" len %"PRIu64""
 pci_nvme_map_addr_cmb(uint64_t addr, uint64_t len) "addr 0x%"PRIx64" len %"PRIu64""
 pci_nvme_map_prp(uint64_t trans_len, uint32_t len, uint64_t prp1, uint64_t prp2, int num_prps) "trans_len %"PRIu64" len %"PRIu32" prp1 0x%"PRIx64" prp2 0x%"PRIx64" num_prps %d"
@@ -81,6 +82,8 @@ pci_nvme_enqueue_event_noqueue(int queued) "queued %d"
 pci_nvme_enqueue_event_masked(uint8_t typ) "type 0x%"PRIx8""
 pci_nvme_no_outstanding_aers(void) "ignoring event; no outstanding AERs"
 pci_nvme_enqueue_req_completion(uint16_t cid, uint16_t cqid, uint32_t dw0, uint32_t dw1, uint16_t status) "cid %"PRIu16" cqid %"PRIu16" dw0 0x%"PRIx32" dw1 0x%"PRIx32" status 0x%"PRIx16""
+pci_nvme_eventidx_cq(uint16_t cqid, uint16_t new_eventidx) "cqid %"PRIu16" new_eventidx %"PRIu16""
+pci_nvme_eventidx_sq(uint16_t sqid, uint16_t new_eventidx) "sqid %"PRIu16" new_eventidx %"PRIu16""
 pci_nvme_mmio_read(uint64_t addr, unsigned size) "addr 0x%"PRIx64" size %d"
 pci_nvme_mmio_write(uint64_t addr, uint64_t data, unsigned size) "addr 0x%"PRIx64" data 0x%"PRIx64" size %d"
 pci_nvme_mmio_doorbell_cq(uint16_t cqid, uint16_t new_head) "cqid %"PRIu16" new_head %"PRIu16""
@@ -97,6 +100,8 @@ pci_nvme_mmio_start_success(void) "setting controller enable bit succeeded"
 pci_nvme_mmio_stopped(void) "cleared controller enable bit"
 pci_nvme_mmio_shutdown_set(void) "shutdown bit set"
 pci_nvme_mmio_shutdown_cleared(void) "shutdown bit cleared"
+pci_nvme_shadow_doorbell_cq(uint16_t cqid, uint16_t new_shadow_doorbell) "cqid %"PRIu16" new_shadow_doorbell %"PRIu16""
+pci_nvme_shadow_doorbell_sq(uint16_t sqid, uint16_t new_shadow_doorbell) "sqid %"PRIu16" new_shadow_doorbell %"PRIu16""
 pci_nvme_open_zone(uint64_t slba, uint32_t zone_idx, int all) "open zone, slba=%"PRIu64", idx=%"PRIu32", all=%"PRIi32""
 pci_nvme_close_zone(uint64_t slba, uint32_t zone_idx, int all) "close zone, slba=%"PRIu64", idx=%"PRIu32", all=%"PRIi32""
 pci_nvme_finish_zone(uint64_t slba, uint32_t zone_idx, int all) "finish zone, slba=%"PRIu64", idx=%"PRIu32", all=%"PRIi32""
-- 
2.25.1


