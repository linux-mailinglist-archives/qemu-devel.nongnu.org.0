Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC0C2152A4
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jul 2020 08:21:41 +0200 (CEST)
Received: from localhost ([::1]:32784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jsKVY-0006xb-DM
	for lists+qemu-devel@lfdr.de; Mon, 06 Jul 2020 02:21:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1jsKNZ-0000lA-Bu; Mon, 06 Jul 2020 02:13:25 -0400
Received: from charlie.dont.surf ([128.199.63.193]:58126)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1jsKNV-0000w5-Sr; Mon, 06 Jul 2020 02:13:25 -0400
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by charlie.dont.surf (Postfix) with ESMTPSA id 5ED8ABF851;
 Mon,  6 Jul 2020 06:13:15 +0000 (UTC)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-block@nongnu.org
Subject: [PATCH v3 08/18] hw/block/nvme: add support for the asynchronous
 event request command
Date: Mon,  6 Jul 2020 08:12:53 +0200
Message-Id: <20200706061303.246057-9-its@irrelevant.dk>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200706061303.246057-1-its@irrelevant.dk>
References: <20200706061303.246057-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=128.199.63.193; envelope-from=its@irrelevant.dk;
 helo=charlie.dont.surf
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/06 02:13:11
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Dmitry Fomichev <dmitry.fomichev@wdc.com>,
 Klaus Jensen <k.jensen@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 Keith Busch <kbusch@kernel.org>, Javier Gonzalez <javier.gonz@samsung.com>,
 Maxim Levitsky <mlevitsk@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Add support for the Asynchronous Event Request command. Required for
compliance with NVMe revision 1.3d. See NVM Express 1.3d, Section 5.2
("Asynchronous Event Request command").

Mostly imported from Keith's qemu-nvme tree. Modified with a max number
of queued events (controllable with the aer_max_queued device
parameter). The spec states that the controller *should* retain
events, so we do best effort here.

Signed-off-by: Klaus Jensen <klaus.jensen@cnexlabs.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Acked-by: Keith Busch <kbusch@kernel.org>
Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>
Reviewed-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>
---
 hw/block/nvme.c       | 180 ++++++++++++++++++++++++++++++++++++++++--
 hw/block/nvme.h       |  10 ++-
 hw/block/trace-events |   9 +++
 include/block/nvme.h  |   8 +-
 4 files changed, 198 insertions(+), 9 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 7cb3787638f6..80c7285bc1cf 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -356,6 +356,85 @@ static void nvme_enqueue_req_completion(NvmeCQueue *cq, NvmeRequest *req)
     timer_mod(cq->timer, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + 500);
 }
 
+static void nvme_process_aers(void *opaque)
+{
+    NvmeCtrl *n = opaque;
+    NvmeAsyncEvent *event, *next;
+
+    trace_pci_nvme_process_aers(n->aer_queued);
+
+    QTAILQ_FOREACH_SAFE(event, &n->aer_queue, entry, next) {
+        NvmeRequest *req;
+        NvmeAerResult *result;
+
+        /* can't post cqe if there is nothing to complete */
+        if (!n->outstanding_aers) {
+            trace_pci_nvme_no_outstanding_aers();
+            break;
+        }
+
+        /* ignore if masked (cqe posted, but event not cleared) */
+        if (n->aer_mask & (1 << event->result.event_type)) {
+            trace_pci_nvme_aer_masked(event->result.event_type, n->aer_mask);
+            continue;
+        }
+
+        QTAILQ_REMOVE(&n->aer_queue, event, entry);
+        n->aer_queued--;
+
+        n->aer_mask |= 1 << event->result.event_type;
+        n->outstanding_aers--;
+
+        req = n->aer_reqs[n->outstanding_aers];
+
+        result = (NvmeAerResult *) &req->cqe.result;
+        result->event_type = event->result.event_type;
+        result->event_info = event->result.event_info;
+        result->log_page = event->result.log_page;
+        g_free(event);
+
+        req->status = NVME_SUCCESS;
+
+        trace_pci_nvme_aer_post_cqe(result->event_type, result->event_info,
+                                    result->log_page);
+
+        nvme_enqueue_req_completion(&n->admin_cq, req);
+    }
+}
+
+static void nvme_enqueue_event(NvmeCtrl *n, uint8_t event_type,
+                               uint8_t event_info, uint8_t log_page)
+{
+    NvmeAsyncEvent *event;
+
+    trace_pci_nvme_enqueue_event(event_type, event_info, log_page);
+
+    if (n->aer_queued == n->params.aer_max_queued) {
+        trace_pci_nvme_enqueue_event_noqueue(n->aer_queued);
+        return;
+    }
+
+    event = g_new(NvmeAsyncEvent, 1);
+    event->result = (NvmeAerResult) {
+        .event_type = event_type,
+        .event_info = event_info,
+        .log_page   = log_page,
+    };
+
+    QTAILQ_INSERT_TAIL(&n->aer_queue, event, entry);
+    n->aer_queued++;
+
+    nvme_process_aers(n);
+}
+
+static void nvme_clear_events(NvmeCtrl *n, uint8_t event_type)
+{
+    n->aer_mask &= ~(1 << event_type);
+    if (!QTAILQ_EMPTY(&n->aer_queue)) {
+        nvme_process_aers(n);
+    }
+}
+
 static void nvme_rw_cb(void *opaque, int ret)
 {
     NvmeRequest *req = opaque;
@@ -606,8 +685,9 @@ static uint16_t nvme_create_sq(NvmeCtrl *n, NvmeCmd *cmd)
     return NVME_SUCCESS;
 }
 
-static uint16_t nvme_smart_info(NvmeCtrl *n, NvmeCmd *cmd, uint32_t buf_len,
-                                uint64_t off, NvmeRequest *req)
+static uint16_t nvme_smart_info(NvmeCtrl *n, NvmeCmd *cmd, uint8_t rae,
+                                uint32_t buf_len, uint64_t off,
+                                NvmeRequest *req)
 {
     uint64_t prp1 = le64_to_cpu(cmd->dptr.prp1);
     uint64_t prp2 = le64_to_cpu(cmd->dptr.prp2);
@@ -655,6 +735,10 @@ static uint16_t nvme_smart_info(NvmeCtrl *n, NvmeCmd *cmd, uint32_t buf_len,
     smart.power_on_hours[0] =
         cpu_to_le64((((current_ms - n->starttime_ms) / 1000) / 60) / 60);
 
+    if (!rae) {
+        nvme_clear_events(n, NVME_AER_TYPE_SMART);
+    }
+
     return nvme_dma_read_prp(n, (uint8_t *) &smart + off, trans_len, prp1,
                              prp2);
 }
@@ -681,14 +765,19 @@ static uint16_t nvme_fw_log_info(NvmeCtrl *n, NvmeCmd *cmd, uint32_t buf_len,
                              prp2);
 }
 
-static uint16_t nvme_error_info(NvmeCtrl *n, NvmeCmd *cmd, uint32_t buf_len,
-                                uint64_t off, NvmeRequest *req)
+static uint16_t nvme_error_info(NvmeCtrl *n, NvmeCmd *cmd, uint8_t rae,
+                                uint32_t buf_len, uint64_t off,
+                                NvmeRequest *req)
 {
     uint32_t trans_len;
     uint64_t prp1 = le64_to_cpu(cmd->dptr.prp1);
     uint64_t prp2 = le64_to_cpu(cmd->dptr.prp2);
     NvmeErrorLog errlog;
 
+    if (!rae) {
+        nvme_clear_events(n, NVME_AER_TYPE_ERROR);
+    }
+
     if (off > sizeof(errlog)) {
         return NVME_INVALID_FIELD | NVME_DNR;
     }
@@ -729,9 +818,9 @@ static uint16_t nvme_get_log(NvmeCtrl *n, NvmeCmd *cmd, NvmeRequest *req)
 
     switch (lid) {
     case NVME_LOG_ERROR_INFO:
-        return nvme_error_info(n, cmd, len, off, req);
+        return nvme_error_info(n, cmd, rae, len, off, req);
     case NVME_LOG_SMART_INFO:
-        return nvme_smart_info(n, cmd, len, off, req);
+        return nvme_smart_info(n, cmd, rae, len, off, req);
     case NVME_LOG_FW_SLOT_INFO:
         return nvme_fw_log_info(n, cmd, len, off, req);
     default:
@@ -1013,6 +1102,9 @@ static uint16_t nvme_get_feature(NvmeCtrl *n, NvmeCmd *cmd, NvmeRequest *req)
             ((n->params.max_ioqpairs - 1) << 16);
         trace_pci_nvme_getfeat_numq(result);
         break;
+    case NVME_ASYNCHRONOUS_EVENT_CONF:
+        result = n->features.async_config;
+        break;
     case NVME_TIMESTAMP:
         return nvme_get_feature_timestamp(n, cmd);
     default:
@@ -1064,6 +1156,14 @@ static uint16_t nvme_set_feature(NvmeCtrl *n, NvmeCmd *cmd, NvmeRequest *req)
             return NVME_INVALID_FIELD | NVME_DNR;
         }
 
+        if (((n->temperature >= n->features.temp_thresh_hi) ||
+            (n->temperature <= n->features.temp_thresh_low)) &&
+            NVME_AEC_SMART(n->features.async_config) & NVME_SMART_TEMPERATURE) {
+            nvme_enqueue_event(n, NVME_AER_TYPE_SMART,
+                               NVME_AER_INFO_SMART_TEMP_THRESH,
+                               NVME_LOG_SMART_INFO);
+        }
+
         break;
     case NVME_VOLATILE_WRITE_CACHE:
         blk_set_enable_write_cache(n->conf.blk, dw11 & 1);
@@ -1076,6 +1176,9 @@ static uint16_t nvme_set_feature(NvmeCtrl *n, NvmeCmd *cmd, NvmeRequest *req)
         req->cqe.result = cpu_to_le32((n->params.max_ioqpairs - 1) |
                                       ((n->params.max_ioqpairs - 1) << 16));
         break;
+    case NVME_ASYNCHRONOUS_EVENT_CONF:
+        n->features.async_config = dw11;
+        break;
     case NVME_TIMESTAMP:
         return nvme_set_feature_timestamp(n, cmd);
     default:
@@ -1085,6 +1188,25 @@ static uint16_t nvme_set_feature(NvmeCtrl *n, NvmeCmd *cmd, NvmeRequest *req)
     return NVME_SUCCESS;
 }
 
+static uint16_t nvme_aer(NvmeCtrl *n, NvmeCmd *cmd, NvmeRequest *req)
+{
+    trace_pci_nvme_aer(nvme_cid(req));
+
+    if (n->outstanding_aers > n->params.aerl) {
+        trace_pci_nvme_aer_aerl_exceeded();
+        return NVME_AER_LIMIT_EXCEEDED;
+    }
+
+    n->aer_reqs[n->outstanding_aers] = req;
+    n->outstanding_aers++;
+
+    if (!QTAILQ_EMPTY(&n->aer_queue)) {
+        nvme_process_aers(n);
+    }
+
+    return NVME_NO_COMPLETE;
+}
+
 static uint16_t nvme_admin_cmd(NvmeCtrl *n, NvmeCmd *cmd, NvmeRequest *req)
 {
     trace_pci_nvme_admin_cmd(nvme_cid(req), nvme_sqid(req), cmd->opcode);
@@ -1108,6 +1230,8 @@ static uint16_t nvme_admin_cmd(NvmeCtrl *n, NvmeCmd *cmd, NvmeRequest *req)
         return nvme_set_feature(n, cmd, req);
     case NVME_ADM_CMD_GET_FEATURES:
         return nvme_get_feature(n, cmd, req);
+    case NVME_ADM_CMD_ASYNC_EV_REQ:
+        return nvme_aer(n, cmd, req);
     default:
         trace_pci_nvme_err_invalid_admin_opc(cmd->opcode);
         return NVME_INVALID_OPCODE | NVME_DNR;
@@ -1162,6 +1286,15 @@ static void nvme_clear_ctrl(NvmeCtrl *n)
         }
     }
 
+    while (!QTAILQ_EMPTY(&n->aer_queue)) {
+        NvmeAsyncEvent *event = QTAILQ_FIRST(&n->aer_queue);
+        QTAILQ_REMOVE(&n->aer_queue, event, entry);
+        g_free(event);
+    }
+
+    n->aer_queued = 0;
+    n->outstanding_aers = 0;
+
     blk_flush(n->conf.blk);
     n->bar.cc = 0;
 }
@@ -1258,6 +1391,8 @@ static int nvme_start_ctrl(NvmeCtrl *n)
 
     nvme_set_timestamp(n, 0ULL);
 
+    QTAILQ_INIT(&n->aer_queue);
+
     return 0;
 }
 
@@ -1479,6 +1614,13 @@ static void nvme_process_db(NvmeCtrl *n, hwaddr addr, int val)
                            "completion queue doorbell write"
                            " for nonexistent queue,"
                            " sqid=%"PRIu32", ignoring", qid);
+
+            if (n->outstanding_aers) {
+                nvme_enqueue_event(n, NVME_AER_TYPE_ERROR,
+                                   NVME_AER_INFO_ERR_INVALID_DB_REGISTER,
+                                   NVME_LOG_ERROR_INFO);
+            }
+
             return;
         }
 
@@ -1489,6 +1631,13 @@ static void nvme_process_db(NvmeCtrl *n, hwaddr addr, int val)
                            " beyond queue size, sqid=%"PRIu32","
                            " new_head=%"PRIu16", ignoring",
                            qid, new_head);
+
+            if (n->outstanding_aers) {
+                nvme_enqueue_event(n, NVME_AER_TYPE_ERROR,
+                                   NVME_AER_INFO_ERR_INVALID_DB_VALUE,
+                                   NVME_LOG_ERROR_INFO);
+            }
+
             return;
         }
 
@@ -1519,6 +1668,13 @@ static void nvme_process_db(NvmeCtrl *n, hwaddr addr, int val)
                            "submission queue doorbell write"
                            " for nonexistent queue,"
                            " sqid=%"PRIu32", ignoring", qid);
+
+            if (n->outstanding_aers) {
+                nvme_enqueue_event(n, NVME_AER_TYPE_ERROR,
+                                   NVME_AER_INFO_ERR_INVALID_DB_REGISTER,
+                                   NVME_LOG_ERROR_INFO);
+            }
+
             return;
         }
 
@@ -1529,6 +1685,13 @@ static void nvme_process_db(NvmeCtrl *n, hwaddr addr, int val)
                            " beyond queue size, sqid=%"PRIu32","
                            " new_tail=%"PRIu16", ignoring",
                            qid, new_tail);
+
+            if (n->outstanding_aers) {
+                nvme_enqueue_event(n, NVME_AER_TYPE_ERROR,
+                                   NVME_AER_INFO_ERR_INVALID_DB_VALUE,
+                                   NVME_LOG_ERROR_INFO);
+            }
+
             return;
         }
 
@@ -1650,6 +1813,7 @@ static void nvme_init_state(NvmeCtrl *n)
     n->temperature = NVME_TEMPERATURE;
     n->features.temp_thresh_hi = NVME_TEMPERATURE_WARNING;
     n->starttime_ms = qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL);
+    n->aer_reqs = g_new0(NvmeRequest *, n->params.aerl + 1);
 }
 
 static void nvme_init_blk(NvmeCtrl *n, Error **errp)
@@ -1805,6 +1969,7 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
      * inconsequential.
      */
     id->acl = 3;
+    id->aerl = n->params.aerl;
     id->frmw = (NVME_NUM_FW_SLOTS << 1) | NVME_FRMW_SLOT1_RO;
     id->lpa = NVME_LPA_EXTENDED;
 
@@ -1879,6 +2044,7 @@ static void nvme_exit(PCIDevice *pci_dev)
     g_free(n->namespaces);
     g_free(n->cq);
     g_free(n->sq);
+    g_free(n->aer_reqs);
 
     if (n->params.cmb_size_mb) {
         g_free(n->cmbuf);
@@ -1899,6 +2065,8 @@ static Property nvme_props[] = {
     DEFINE_PROP_UINT32("num_queues", NvmeCtrl, params.num_queues, 0),
     DEFINE_PROP_UINT32("max_ioqpairs", NvmeCtrl, params.max_ioqpairs, 64),
     DEFINE_PROP_UINT16("msix_qsize", NvmeCtrl, params.msix_qsize, 65),
+    DEFINE_PROP_UINT8("aerl", NvmeCtrl, params.aerl, 3),
+    DEFINE_PROP_UINT32("aer_max_queued", NvmeCtrl, params.aer_max_queued, 64),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/block/nvme.h b/hw/block/nvme.h
index 8228978e93de..1837233617bb 100644
--- a/hw/block/nvme.h
+++ b/hw/block/nvme.h
@@ -9,10 +9,12 @@ typedef struct NvmeParams {
     uint32_t max_ioqpairs;
     uint16_t msix_qsize;
     uint32_t cmb_size_mb;
+    uint8_t  aerl;
+    uint32_t aer_max_queued;
 } NvmeParams;
 
 typedef struct NvmeAsyncEvent {
-    QSIMPLEQ_ENTRY(NvmeAsyncEvent) entry;
+    QTAILQ_ENTRY(NvmeAsyncEvent) entry;
     NvmeAerResult result;
 } NvmeAsyncEvent;
 
@@ -94,6 +96,7 @@ typedef struct NvmeCtrl {
     uint32_t    num_namespaces;
     uint32_t    max_q_ents;
     uint64_t    ns_size;
+    uint8_t     outstanding_aers;
     uint8_t     *cmbuf;
     uint32_t    irq_status;
     uint64_t    host_timestamp;                 /* Timestamp sent by the host */
@@ -103,6 +106,11 @@ typedef struct NvmeCtrl {
 
     HostMemoryBackend *pmrdev;
 
+    uint8_t     aer_mask;
+    NvmeRequest **aer_reqs;
+    QTAILQ_HEAD(, NvmeAsyncEvent) aer_queue;
+    int         aer_queued;
+
     NvmeNamespace   *namespaces;
     NvmeSQueue      **sq;
     NvmeCQueue      **cq;
diff --git a/hw/block/trace-events b/hw/block/trace-events
index 3330d74e48db..091af16ca7d7 100644
--- a/hw/block/trace-events
+++ b/hw/block/trace-events
@@ -51,6 +51,15 @@ pci_nvme_getfeat_numq(int result) "get feature number of queues, result=%d"
 pci_nvme_setfeat_numq(int reqcq, int reqsq, int gotcq, int gotsq) "requested cq_count=%d sq_count=%d, responding with cq_count=%d sq_count=%d"
 pci_nvme_setfeat_timestamp(uint64_t ts) "set feature timestamp = 0x%"PRIx64""
 pci_nvme_getfeat_timestamp(uint64_t ts) "get feature timestamp = 0x%"PRIx64""
+pci_nvme_process_aers(int queued) "queued %d"
+pci_nvme_aer(uint16_t cid) "cid %"PRIu16""
+pci_nvme_aer_aerl_exceeded(void) "aerl exceeded"
+pci_nvme_aer_masked(uint8_t type, uint8_t mask) "type 0x%"PRIx8" mask 0x%"PRIx8""
+pci_nvme_aer_post_cqe(uint8_t typ, uint8_t info, uint8_t log_page) "type 0x%"PRIx8" info 0x%"PRIx8" lid 0x%"PRIx8""
+pci_nvme_enqueue_event(uint8_t typ, uint8_t info, uint8_t log_page) "type 0x%"PRIx8" info 0x%"PRIx8" lid 0x%"PRIx8""
+pci_nvme_enqueue_event_noqueue(int queued) "queued %d"
+pci_nvme_enqueue_event_masked(uint8_t typ) "type 0x%"PRIx8""
+pci_nvme_no_outstanding_aers(void) "ignoring event; no outstanding AERs"
 pci_nvme_enqueue_req_completion(uint16_t cid, uint16_t cqid, uint16_t status) "cid %"PRIu16" cqid %"PRIu16" status 0x%"PRIx16""
 pci_nvme_mmio_read(uint64_t addr) "addr 0x%"PRIx64""
 pci_nvme_mmio_write(uint64_t addr, uint64_t data) "addr 0x%"PRIx64" data 0x%"PRIx64""
diff --git a/include/block/nvme.h b/include/block/nvme.h
index 49ce97ae1ab4..2101292ed5e8 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -597,8 +597,8 @@ enum NvmeAsyncEventRequest {
     NVME_AER_TYPE_SMART                     = 1,
     NVME_AER_TYPE_IO_SPECIFIC               = 6,
     NVME_AER_TYPE_VENDOR_SPECIFIC           = 7,
-    NVME_AER_INFO_ERR_INVALID_SQ            = 0,
-    NVME_AER_INFO_ERR_INVALID_DB            = 1,
+    NVME_AER_INFO_ERR_INVALID_DB_REGISTER   = 0,
+    NVME_AER_INFO_ERR_INVALID_DB_VALUE      = 1,
     NVME_AER_INFO_ERR_DIAG_FAIL             = 2,
     NVME_AER_INFO_ERR_PERS_INTERNAL_ERR     = 3,
     NVME_AER_INFO_ERR_TRANS_INTERNAL_ERR    = 4,
@@ -899,6 +899,10 @@ typedef struct NvmeFeatureVal {
 
 #define NVME_TEMP_TMPTH(temp) ((temp >>  0) & 0xffff)
 
+#define NVME_AEC_SMART(aec)         (aec & 0xff)
+#define NVME_AEC_NS_ATTR(aec)       ((aec >> 8) & 0x1)
+#define NVME_AEC_FW_ACTIVATION(aec) ((aec >> 9) & 0x1)
+
 enum NvmeFeatureIds {
     NVME_ARBITRATION                = 0x1,
     NVME_POWER_MANAGEMENT           = 0x2,
-- 
2.27.0


