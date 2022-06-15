Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CFFC54CBC1
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 16:52:16 +0200 (CEST)
Received: from localhost ([::1]:47636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1UNT-0003Zr-Ld
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 10:52:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fanjinhao21s@ict.ac.cn>)
 id 1o1ULd-0001L8-C3
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 10:50:21 -0400
Received: from smtp84.cstnet.cn ([159.226.251.84]:55978 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fanjinhao21s@ict.ac.cn>) id 1o1ULY-0000Wz-SX
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 10:50:21 -0400
Received: from localhost.localdomain (unknown [159.226.43.7])
 by APP-05 (Coremail) with SMTP id zQCowACHjbGX8aliCU+PAw--.59018S3;
 Wed, 15 Jun 2022 22:50:08 +0800 (CST)
From: Jinhao Fan <fanjinhao21s@ict.ac.cn>
To: qemu-devel@nongnu.org
Cc: its@irrelevant.dk, kbusch@kernel.org, Jinhao Fan <fanjinhao21s@ict.ac.cn>
Subject: [PATCH v2 1/2] hw/nvme: Implement shadow doorbell buffer support
Date: Wed, 15 Jun 2022 22:49:06 +0800
Message-Id: <20220615144907.3093384-2-fanjinhao21s@ict.ac.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220615144907.3093384-1-fanjinhao21s@ict.ac.cn>
References: <20220615144907.3093384-1-fanjinhao21s@ict.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowACHjbGX8aliCU+PAw--.59018S3
X-Coremail-Antispam: 1UD129KBjvJXoW3KrW8uF4fCFyrAr1ktF4rAFb_yoWDZFWxpF
 Z0qr9Iy39aqF17Xr4kJrZxX3Z8uws3ZFyjkwsxKw12yan3Ary8uFWDKFyUAr4UuFWvgr4F
 vrsavFsxXF4xX3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9v14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
 x26xkF7I0E14v26r1Y6r1xM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
 Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84
 ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AI
 xVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20x
 vE14v26r1j6r18McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xv
 r2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxAIw28IcxkI7VAKI48JMxC20s
 026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_
 JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14
 v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xva
 j40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JV
 W8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbjg47UUUUU==
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

In nvme_process_db(), update the shadow doorbell buffer value with
the doorbell register value if it is the admin queue. This is a hack
since hosts like Linux NVMe driver and SPDK do not use shadow
doorbell buffer for the admin queue. Copying the doorbell register
value to the shadow doorbell buffer allows us to support these hosts
as well as spec-compliant hosts that use shadow doorbell buffer for
the admin queue.

Signed-off-by: Jinhao Fan <fanjinhao21s@ict.ac.cn>
---
 hw/nvme/ctrl.c       | 112 ++++++++++++++++++++++++++++++++++++++++++-
 hw/nvme/nvme.h       |   8 ++++
 include/block/nvme.h |   2 +
 3 files changed, 121 insertions(+), 1 deletion(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 03760ddeae..7be2e43f52 100644
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
 
+    if (n->dbbuf_enabled) {
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
+    if (n->dbbuf_enabled) {
+        cq->db_addr = n->dbbuf_dbs + (2 * cqid + 1) * stride;
+        cq->ei_addr = n->dbbuf_eis + (2 * cqid + 1) * stride;
+    }
     n->cq[cqid] = cq;
     cq->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, nvme_post_cqes, cq);
 }
@@ -5767,6 +5789,47 @@ out:
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
+    for (i = 0; i < n->params.max_ioqpairs + 1; i++) {
+        NvmeSQueue *sq = n->sq[i];
+        NvmeCQueue *cq = n->cq[i];
+
+        if (sq) {
+            /* Submission queue tail pointer location, 2 * QID * stride */
+            sq->db_addr = dbs_addr + 2 * i * stride;
+            sq->ei_addr = eis_addr + 2 * i * stride;
+            pci_dma_write(&n->parent_obj, sq->db_addr, &sq->tail,
+                    sizeof(sq->tail));
+        }
+
+        if (cq) {
+            /* Completion queue head pointer location, (2 * QID + 1) * stride */
+            cq->db_addr = dbs_addr + (2 * i + 1) * stride;
+            cq->ei_addr = eis_addr + (2 * i + 1) * stride;
+            pci_dma_write(&n->parent_obj, cq->db_addr, &cq->head,
+                    sizeof(cq->head));
+        }
+    }
+
+    return NVME_SUCCESS;
+}
+
 static uint16_t nvme_admin_cmd(NvmeCtrl *n, NvmeRequest *req)
 {
     trace_pci_nvme_admin_cmd(nvme_cid(req), nvme_sqid(req), req->cmd.opcode,
@@ -5809,6 +5872,8 @@ static uint16_t nvme_admin_cmd(NvmeCtrl *n, NvmeRequest *req)
         return nvme_aer(n, req);
     case NVME_ADM_CMD_NS_ATTACHMENT:
         return nvme_ns_attachment(n, req);
+    case NVME_ADM_CMD_DBBUF_CONFIG:
+        return nvme_dbbuf_config(n, req);
     case NVME_ADM_CMD_FORMAT_NVM:
         return nvme_format(n, req);
     default:
@@ -5818,6 +5883,18 @@ static uint16_t nvme_admin_cmd(NvmeCtrl *n, NvmeRequest *req)
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
@@ -5829,6 +5906,10 @@ static void nvme_process_sq(void *opaque)
     NvmeCmd cmd;
     NvmeRequest *req;
 
+    if (sq->sqid && n->dbbuf_enabled) {
+        nvme_update_sq_tail(sq);
+    }
+
     while (!(nvme_sq_empty(sq) || QTAILQ_EMPTY(&sq->req_list))) {
         addr = sq->dma_addr + sq->head * n->sqe_size;
         if (nvme_addr_read(n, addr, (void *)&cmd, sizeof(cmd))) {
@@ -5852,6 +5933,11 @@ static void nvme_process_sq(void *opaque)
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
 
@@ -5889,6 +5975,9 @@ static void nvme_ctrl_reset(NvmeCtrl *n)
     n->aer_queued = 0;
     n->outstanding_aers = 0;
     n->qs_created = false;
+    n->dbbuf_dbs = 0;
+    n->dbbuf_eis = 0;
+    n->dbbuf_enabled = false;
 }
 
 static void nvme_ctrl_shutdown(NvmeCtrl *n)
@@ -6398,6 +6487,10 @@ static void nvme_process_db(NvmeCtrl *n, hwaddr addr, int val)
 
         start_sqs = nvme_cq_full(cq) ? 1 : 0;
         cq->head = new_head;
+        if (!qid && n->dbbuf_enabled) {
+            pci_dma_write(&n->parent_obj, cq->db_addr, &cq->head,
+                          sizeof(cq->head));
+        }
         if (start_sqs) {
             NvmeSQueue *sq;
             QTAILQ_FOREACH(sq, &cq->sq_list, entry) {
@@ -6455,6 +6548,23 @@ static void nvme_process_db(NvmeCtrl *n, hwaddr addr, int val)
         trace_pci_nvme_mmio_doorbell_sq(sq->sqid, new_tail);
 
         sq->tail = new_tail;
+        if (!qid && n->dbbuf_enabled) {
+            /*
+             * The spec states "the host shall also update the controller's
+             * corresponding doorbell property to match the value of that entry
+             * in the Shadow Doorbell buffer."
+             *
+             * Since this context is currently a VM trap, we can safely enforce
+             * the requirement from the device side in case the host is
+             * misbehaving.
+             *
+             * Note, we shouldn't have to do this, but various drivers
+             * including ones that run on Linux, are not updating Admin Queues,
+             * so we can't trust reading it for an appropriate sq tail.
+             */
+            pci_dma_write(&n->parent_obj, sq->db_addr, &sq->tail,
+                          sizeof(sq->tail));
+        }
         timer_mod(sq->timer, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + 500);
     }
 }
@@ -6733,7 +6843,7 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
 
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


