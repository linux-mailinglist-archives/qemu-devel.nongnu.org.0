Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB305420AA
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 03:49:10 +0200 (CEST)
Received: from localhost ([::1]:41736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nykom-0000VS-V6
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 21:49:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fanjinhao21s@ict.ac.cn>)
 id 1nykdj-00023P-P4
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 21:37:43 -0400
Received: from smtp84.cstnet.cn ([159.226.251.84]:44644 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fanjinhao21s@ict.ac.cn>) id 1nykdf-0002ds-JO
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 21:37:43 -0400
Received: from localhost.localdomain (unknown [159.226.43.7])
 by APP-05 (Coremail) with SMTP id zQCowABHaX5F_Z9ii+lgAA--.9773S3;
 Wed, 08 Jun 2022 09:37:19 +0800 (CST)
From: Jinhao Fan <fanjinhao21s@ict.ac.cn>
To: qemu-devel@nongnu.org
Cc: its@irrelevant.dk, kbusch@kernel.org, Jinhao Fan <fanjinhao21s@ict.ac.cn>
Subject: [PATCH 1/2] hw/nvme: Implement shadow doorbell buffer support
Date: Wed,  8 Jun 2022 09:36:58 +0800
Message-Id: <20220608013659.472500-2-fanjinhao21s@ict.ac.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220608013659.472500-1-fanjinhao21s@ict.ac.cn>
References: <20220608013659.472500-1-fanjinhao21s@ict.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowABHaX5F_Z9ii+lgAA--.9773S3
X-Coremail-Antispam: 1UD129KBjvJXoWxKrW7Aw17CFy3ArWfCw4Durg_yoWfuF4kpF
 Z0qr9IyanaqF17Xw4kJrZxX3Z8uws3ZryjkwsxKw12kan7Ary8uFWDKa4UAr45uF4vgr4F
 vrsavFsxXF4xX3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBS14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
 x26xkF7I0E14v26r1Y6r1xM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
 Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84
 ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr0_Cr1U
 M2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjx
 v20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1l
 F7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkIecxEwVAFwVWkMxAIw2
 8IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4l
 x2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrw
 CI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI
 42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z2
 80aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfUFeHqUUUUU
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
X-Mailman-Approved-At: Tue, 07 Jun 2022 21:47:26 -0400
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

Implement Doorbel Buffer Config command (Section 5.7 in NVMe Spec 1.3)
and Shadow Doorbel buffer & EventIdx buffer handling logic (Section 7.13
in NVMe Spec 1.3). For queues created before the Doorbell Buffer Config
command, the nvme_dbbuf_config function tries to associate each existing
SQ and CQ with its Shadow Doorbel buffer and EventIdx buffer address.
Queues created after the Doorbell Buffer Config command will have the
doorbell buffers associated with them when they are initialized.

In nvme_process_sq and nvme_post_cqe, proactively check for Shadow
Doorbell buffer changes instead of wait for doorbell register changes.
This reduces the number of MMIOs.

Signed-off-by: Jinhao Fan <fanjinhao21s@ict.ac.cn>
---
 hw/nvme/ctrl.c       | 95 ++++++++++++++++++++++++++++++++++++++++++--
 hw/nvme/nvme.h       |  8 ++++
 include/block/nvme.h |  2 +
 3 files changed, 102 insertions(+), 3 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 03760ddeae..d3f6c432df 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -223,6 +223,7 @@ static const uint32_t nvme_cse_acs[256] = {
     [NVME_ADM_CMD_GET_FEATURES]     = NVME_CMD_EFF_CSUPP,
     [NVME_ADM_CMD_ASYNC_EV_REQ]     = NVME_CMD_EFF_CSUPP,
     [NVME_ADM_CMD_NS_ATTACHMENT]    = NVME_CMD_EFF_CSUPP | NVME_CMD_EFF_NIC,
+    [NVME_ADM_CMD_DBBUF_CONFIG]     = NVME_CMD_EFF_CSUPP,
     [NVME_ADM_CMD_FORMAT_NVM]       = NVME_CMD_EFF_CSUPP | NVME_CMD_EFF_LBCC,
 };
 
@@ -1304,6 +1305,12 @@ static inline void nvme_blk_write(BlockBackend *blk, int64_t offset,
     }
 }
 
+static void nvme_update_cq_head(NvmeCQueue *cq)
+{
+    pci_dma_read(&cq->ctrl->parent_obj, cq->db_addr, &cq->head,
+            sizeof(cq->head));
+}
+
 static void nvme_post_cqes(void *opaque)
 {
     NvmeCQueue *cq = opaque;
@@ -1316,6 +1323,10 @@ static void nvme_post_cqes(void *opaque)
         NvmeSQueue *sq;
         hwaddr addr;
 
+        if (cq->cqid && n->dbbuf_enabled) {
+            nvme_update_cq_head(cq);
+        }
+
         if (nvme_cq_full(cq)) {
             break;
         }
@@ -4237,6 +4248,7 @@ static uint16_t nvme_del_sq(NvmeCtrl *n, NvmeRequest *req)
 static void nvme_init_sq(NvmeSQueue *sq, NvmeCtrl *n, uint64_t dma_addr,
                          uint16_t sqid, uint16_t cqid, uint16_t size)
 {
+    uint32_t stride = 4 << NVME_CAP_DSTRD(n->bar.cap);
     int i;
     NvmeCQueue *cq;
 
@@ -4256,6 +4268,11 @@ static void nvme_init_sq(NvmeSQueue *sq, NvmeCtrl *n, uint64_t dma_addr,
     }
     sq->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, nvme_process_sq, sq);
 
+    if (sqid && n->dbbuf_dbs && n->dbbuf_eis) {
+        sq->db_addr = n->dbbuf_dbs + 2 * sqid * stride;
+        sq->ei_addr = n->dbbuf_eis + 2 * sqid * stride;
+    }
+
     assert(n->cq[cqid]);
     cq = n->cq[cqid];
     QTAILQ_INSERT_TAIL(&(cq->sq_list), sq, entry);
@@ -4599,6 +4616,7 @@ static void nvme_init_cq(NvmeCQueue *cq, NvmeCtrl *n, uint64_t dma_addr,
                          uint16_t cqid, uint16_t vector, uint16_t size,
                          uint16_t irq_enabled)
 {
+    uint32_t stride = 4 << NVME_CAP_DSTRD(n->bar.cap);
     int ret;
 
     if (msix_enabled(&n->parent_obj)) {
@@ -4615,6 +4633,10 @@ static void nvme_init_cq(NvmeCQueue *cq, NvmeCtrl *n, uint64_t dma_addr,
     cq->head = cq->tail = 0;
     QTAILQ_INIT(&cq->req_list);
     QTAILQ_INIT(&cq->sq_list);
+    if (cqid && n->dbbuf_dbs && n->dbbuf_eis) {
+        cq->db_addr = n->dbbuf_dbs + (2 * cqid + 1) * stride;
+        cq->ei_addr = n->dbbuf_eis + (2 * cqid + 1) * stride;
+    }
     n->cq[cqid] = cq;
     cq->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, nvme_post_cqes, cq);
 }
@@ -5767,6 +5789,43 @@ out:
     return status;
 }
 
+static uint16_t nvme_dbbuf_config(NvmeCtrl *n, const NvmeRequest *req)
+{
+    uint32_t stride = 4 << NVME_CAP_DSTRD(n->bar.cap);
+    uint64_t dbs_addr = le64_to_cpu(req->cmd.dptr.prp1);
+    uint64_t eis_addr = le64_to_cpu(req->cmd.dptr.prp2);
+    int i;
+
+    /* Address should be page aligned */
+    if (dbs_addr & (n->page_size - 1) || eis_addr & (n->page_size - 1)) {
+        return NVME_INVALID_FIELD | NVME_DNR;
+    }
+
+    /* Save shadow buffer base addr for use during queue creation */
+    n->dbbuf_dbs = dbs_addr;
+    n->dbbuf_eis = eis_addr;
+    n->dbbuf_enabled = true;
+
+    for (i = 1; i < n->params.max_ioqpairs + 1; i++) {
+        NvmeSQueue *sq = n->sq[i];
+        NvmeCQueue *cq = n->cq[i];
+
+        if (sq) {
+            /* Submission queue tail pointer location, 2 * QID * stride */
+            sq->db_addr = dbs_addr + 2 * i * stride;
+            sq->ei_addr = eis_addr + 2 * i * stride;
+        }
+
+        if (cq) {
+            /* Completion queue head pointer location, (2 * QID + 1) * stride */
+            cq->db_addr = dbs_addr + (2 * i + 1) * stride;
+            cq->ei_addr = eis_addr + (2 * i + 1) * stride;
+        }
+    }
+
+    return NVME_SUCCESS;
+}
+
 static uint16_t nvme_admin_cmd(NvmeCtrl *n, NvmeRequest *req)
 {
     trace_pci_nvme_admin_cmd(nvme_cid(req), nvme_sqid(req), req->cmd.opcode,
@@ -5809,6 +5868,8 @@ static uint16_t nvme_admin_cmd(NvmeCtrl *n, NvmeRequest *req)
         return nvme_aer(n, req);
     case NVME_ADM_CMD_NS_ATTACHMENT:
         return nvme_ns_attachment(n, req);
+    case NVME_ADM_CMD_DBBUF_CONFIG:
+        return nvme_dbbuf_config(n, req);
     case NVME_ADM_CMD_FORMAT_NVM:
         return nvme_format(n, req);
     default:
@@ -5818,6 +5879,18 @@ static uint16_t nvme_admin_cmd(NvmeCtrl *n, NvmeRequest *req)
     return NVME_INVALID_OPCODE | NVME_DNR;
 }
 
+static void nvme_update_sq_eventidx(const NvmeSQueue *sq)
+{
+    pci_dma_write(&sq->ctrl->parent_obj, sq->ei_addr, &sq->tail,
+                  sizeof(sq->tail));
+}
+
+static void nvme_update_sq_tail(NvmeSQueue *sq)
+{
+    pci_dma_read(&sq->ctrl->parent_obj, sq->db_addr, &sq->tail,
+                 sizeof(sq->tail));
+}
+
 static void nvme_process_sq(void *opaque)
 {
     NvmeSQueue *sq = opaque;
@@ -5829,6 +5902,10 @@ static void nvme_process_sq(void *opaque)
     NvmeCmd cmd;
     NvmeRequest *req;
 
+    if (sq->sqid && n->dbbuf_enabled) {
+        nvme_update_sq_tail(sq);
+    }
+
     while (!(nvme_sq_empty(sq) || QTAILQ_EMPTY(&sq->req_list))) {
         addr = sq->dma_addr + sq->head * n->sqe_size;
         if (nvme_addr_read(n, addr, (void *)&cmd, sizeof(cmd))) {
@@ -5852,6 +5929,11 @@ static void nvme_process_sq(void *opaque)
             req->status = status;
             nvme_enqueue_req_completion(cq, req);
         }
+
+        if (sq->sqid && n->dbbuf_enabled) {
+            nvme_update_sq_eventidx(sq);
+            nvme_update_sq_tail(sq);
+        }
     }
 }
 
@@ -5889,6 +5971,9 @@ static void nvme_ctrl_reset(NvmeCtrl *n)
     n->aer_queued = 0;
     n->outstanding_aers = 0;
     n->qs_created = false;
+    n->dbbuf_dbs = 0;
+    n->dbbuf_eis = 0;
+    n->dbbuf_enabled = false;
 }
 
 static void nvme_ctrl_shutdown(NvmeCtrl *n)
@@ -6397,7 +6482,9 @@ static void nvme_process_db(NvmeCtrl *n, hwaddr addr, int val)
         trace_pci_nvme_mmio_doorbell_cq(cq->cqid, new_head);
 
         start_sqs = nvme_cq_full(cq) ? 1 : 0;
-        cq->head = new_head;
+        if (!cq->cqid || !n->dbbuf_enabled) {
+            cq->head = new_head;
+        }
         if (start_sqs) {
             NvmeSQueue *sq;
             QTAILQ_FOREACH(sq, &cq->sq_list, entry) {
@@ -6454,7 +6541,9 @@ static void nvme_process_db(NvmeCtrl *n, hwaddr addr, int val)
 
         trace_pci_nvme_mmio_doorbell_sq(sq->sqid, new_tail);
 
-        sq->tail = new_tail;
+        if (!sq->sqid || !n->dbbuf_enabled) {
+            sq->tail = new_tail;
+        }
         timer_mod(sq->timer, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + 500);
     }
 }
@@ -6733,7 +6822,7 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
 
     id->mdts = n->params.mdts;
     id->ver = cpu_to_le32(NVME_SPEC_VER);
-    id->oacs = cpu_to_le16(NVME_OACS_NS_MGMT | NVME_OACS_FORMAT);
+    id->oacs = cpu_to_le16(NVME_OACS_NS_MGMT | NVME_OACS_FORMAT | NVME_OACS_DBBUF);
     id->cntrltype = 0x1;
 
     /*
diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
index 6773819325..4452e4b1bf 100644
--- a/hw/nvme/nvme.h
+++ b/hw/nvme/nvme.h
@@ -334,6 +334,7 @@ static inline const char *nvme_adm_opc_str(uint8_t opc)
     case NVME_ADM_CMD_GET_FEATURES:     return "NVME_ADM_CMD_GET_FEATURES";
     case NVME_ADM_CMD_ASYNC_EV_REQ:     return "NVME_ADM_CMD_ASYNC_EV_REQ";
     case NVME_ADM_CMD_NS_ATTACHMENT:    return "NVME_ADM_CMD_NS_ATTACHMENT";
+    case NVME_ADM_CMD_DBBUF_CONFIG:     return "NVME_ADM_CMD_DBBUF_CONFIG";
     case NVME_ADM_CMD_FORMAT_NVM:       return "NVME_ADM_CMD_FORMAT_NVM";
     default:                            return "NVME_ADM_CMD_UNKNOWN";
     }
@@ -365,6 +366,8 @@ typedef struct NvmeSQueue {
     uint32_t    tail;
     uint32_t    size;
     uint64_t    dma_addr;
+    uint64_t    db_addr;
+    uint64_t    ei_addr;
     QEMUTimer   *timer;
     NvmeRequest *io_req;
     QTAILQ_HEAD(, NvmeRequest) req_list;
@@ -382,6 +385,8 @@ typedef struct NvmeCQueue {
     uint32_t    vector;
     uint32_t    size;
     uint64_t    dma_addr;
+    uint64_t    db_addr;
+    uint64_t    ei_addr;
     QEMUTimer   *timer;
     QTAILQ_HEAD(, NvmeSQueue) sq_list;
     QTAILQ_HEAD(, NvmeRequest) req_list;
@@ -432,6 +437,9 @@ typedef struct NvmeCtrl {
     uint64_t    starttime_ms;
     uint16_t    temperature;
     uint8_t     smart_critical_warning;
+    uint64_t    dbbuf_dbs;
+    uint64_t    dbbuf_eis;
+    bool        dbbuf_enabled;
 
     struct {
         MemoryRegion mem;
diff --git a/include/block/nvme.h b/include/block/nvme.h
index 3737351cc8..5b522d7b0e 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -595,6 +595,7 @@ enum NvmeAdminCommands {
     NVME_ADM_CMD_ACTIVATE_FW    = 0x10,
     NVME_ADM_CMD_DOWNLOAD_FW    = 0x11,
     NVME_ADM_CMD_NS_ATTACHMENT  = 0x15,
+    NVME_ADM_CMD_DBBUF_CONFIG   = 0x7c,
     NVME_ADM_CMD_FORMAT_NVM     = 0x80,
     NVME_ADM_CMD_SECURITY_SEND  = 0x81,
     NVME_ADM_CMD_SECURITY_RECV  = 0x82,
@@ -1134,6 +1135,7 @@ enum NvmeIdCtrlOacs {
     NVME_OACS_FORMAT    = 1 << 1,
     NVME_OACS_FW        = 1 << 2,
     NVME_OACS_NS_MGMT   = 1 << 3,
+    NVME_OACS_DBBUF     = 1 << 8,
 };
 
 enum NvmeIdCtrlOncs {
-- 
2.25.1


