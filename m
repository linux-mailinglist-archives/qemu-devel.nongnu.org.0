Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36EC9608248
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Oct 2022 01:52:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1om1Af-0006PD-Ia; Fri, 21 Oct 2022 19:11:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Clay.Mayers@kioxia.com>)
 id 1om1Ad-0006P3-5s
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 19:11:19 -0400
Received: from usmailhost21.kioxia.com ([12.0.68.226]
 helo=SJSMAIL01.us.kioxia.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <Clay.Mayers@kioxia.com>)
 id 1om1Ab-0005ry-DE
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 19:11:18 -0400
Received: from localhost.localdomain (10.93.83.20) by SJSMAIL01.us.kioxia.com
 (10.90.133.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.32; Fri, 21 Oct
 2022 16:10:51 -0700
From: <clay.mayers@kioxia.com>
To: <qemu-devel@nongnu.org>
CC: Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>, Fam
 Zheng <fam@euphon.net>, =?UTF-8?q?Phlippe=20Mathieu-Daud=C3=A9?=
 <f4bug@amsat.org>
Subject: [PATCH V2 3/4] hw/block/nvme: supply dw1 for aen result
Date: Fri, 21 Oct 2022 16:10:37 -0700
Message-ID: <20221021231038.1042659-4-clay.mayers@kioxia.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20221021231038.1042659-1-clay.mayers@kioxia.com>
References: <20221021231038.1042659-1-clay.mayers@kioxia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.93.83.20]
X-ClientProxiedBy: SJSMAIL01.us.kioxia.com (10.90.133.90) To
 SJSMAIL01.us.kioxia.com (10.90.133.90)
Received-SPF: pass client-ip=12.0.68.226; envelope-from=Clay.Mayers@kioxia.com;
 helo=SJSMAIL01.us.kioxia.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Clay Mayers <clay.mayers@kioxia.com>

cqe.dw1 AEN is sometimes required to convey the NSID of the log page
to read.  This is the case for the zone descriptor changed log
page.

Signed-off-by: Clay Mayers <clay.mayers@kioxia.com>
---
 hw/nvme/ctrl.c       | 19 +++++++++++--------
 hw/nvme/trace-events |  2 +-
 include/block/nvme.h |  4 +++-
 3 files changed, 15 insertions(+), 10 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 5b5ceb90c2..4fb85160cc 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -1445,6 +1445,7 @@ static void nvme_process_aers(void *opaque)
         result->event_type = event->result.event_type;
         result->event_info = event->result.event_info;
         result->log_page = event->result.log_page;
+        req->cqe.dw1 = cpu_to_le32(event->result.nsid);
         g_free(event);
 
         trace_pci_nvme_aer_post_cqe(result->event_type, result->event_info,
@@ -1455,11 +1456,12 @@ static void nvme_process_aers(void *opaque)
 }
 
 static void nvme_enqueue_event(NvmeCtrl *n, uint8_t event_type,
-                               uint8_t event_info, uint8_t log_page)
+                               uint8_t event_info, uint8_t log_page,
+                               uint32_t nsid)
 {
     NvmeAsyncEvent *event;
 
-    trace_pci_nvme_enqueue_event(event_type, event_info, log_page);
+    trace_pci_nvme_enqueue_event(event_type, event_info, log_page, nsid);
 
     if (n->aer_queued == n->params.aer_max_queued) {
         trace_pci_nvme_enqueue_event_noqueue(n->aer_queued);
@@ -1471,6 +1473,7 @@ static void nvme_enqueue_event(NvmeCtrl *n, uint8_t event_type,
         .event_type = event_type,
         .event_info = event_info,
         .log_page   = log_page,
+        .nsid       = nsid,
     };
 
     QTAILQ_INSERT_TAIL(&n->aer_queue, event, entry);
@@ -1505,7 +1508,7 @@ static void nvme_smart_event(NvmeCtrl *n, uint8_t event)
         return;
     }
 
-    nvme_enqueue_event(n, NVME_AER_TYPE_SMART, aer_info, NVME_LOG_SMART_INFO);
+    nvme_enqueue_event(n, NVME_AER_TYPE_SMART, aer_info, NVME_LOG_SMART_INFO, 0);
 }
 
 static void nvme_clear_events(NvmeCtrl *n, uint8_t event_type)
@@ -5830,7 +5833,7 @@ static uint16_t nvme_ns_attachment(NvmeCtrl *n, NvmeRequest *req)
         if (!test_and_set_bit(nsid, ctrl->changed_nsids)) {
             nvme_enqueue_event(ctrl, NVME_AER_TYPE_NOTICE,
                                NVME_AER_INFO_NOTICE_NS_ATTR_CHANGED,
-                               NVME_LOG_CHANGED_NSLIST);
+                               NVME_LOG_CHANGED_NSLIST, 0);
         }
     }
 
@@ -6971,7 +6974,7 @@ static void nvme_process_db(NvmeCtrl *n, hwaddr addr, int val)
             if (n->outstanding_aers) {
                 nvme_enqueue_event(n, NVME_AER_TYPE_ERROR,
                                    NVME_AER_INFO_ERR_INVALID_DB_REGISTER,
-                                   NVME_LOG_ERROR_INFO);
+                                   NVME_LOG_ERROR_INFO, 0);
             }
 
             return;
@@ -6988,7 +6991,7 @@ static void nvme_process_db(NvmeCtrl *n, hwaddr addr, int val)
             if (n->outstanding_aers) {
                 nvme_enqueue_event(n, NVME_AER_TYPE_ERROR,
                                    NVME_AER_INFO_ERR_INVALID_DB_VALUE,
-                                   NVME_LOG_ERROR_INFO);
+                                   NVME_LOG_ERROR_INFO, 0);
             }
 
             return;
@@ -7033,7 +7036,7 @@ static void nvme_process_db(NvmeCtrl *n, hwaddr addr, int val)
             if (n->outstanding_aers) {
                 nvme_enqueue_event(n, NVME_AER_TYPE_ERROR,
                                    NVME_AER_INFO_ERR_INVALID_DB_REGISTER,
-                                   NVME_LOG_ERROR_INFO);
+                                   NVME_LOG_ERROR_INFO, 0);
             }
 
             return;
@@ -7050,7 +7053,7 @@ static void nvme_process_db(NvmeCtrl *n, hwaddr addr, int val)
             if (n->outstanding_aers) {
                 nvme_enqueue_event(n, NVME_AER_TYPE_ERROR,
                                    NVME_AER_INFO_ERR_INVALID_DB_VALUE,
-                                   NVME_LOG_ERROR_INFO);
+                                   NVME_LOG_ERROR_INFO, 0);
             }
 
             return;
diff --git a/hw/nvme/trace-events b/hw/nvme/trace-events
index 337927e607..86c01f8762 100644
--- a/hw/nvme/trace-events
+++ b/hw/nvme/trace-events
@@ -80,7 +80,7 @@ pci_nvme_aer_masked(uint8_t type, uint8_t mask) "type 0x%"PRIx8" mask 0x%"PRIx8"
 pci_nvme_aer_post_cqe(uint8_t typ, uint8_t info, uint8_t log_page) "type 0x%"PRIx8" info 0x%"PRIx8" lid 0x%"PRIx8""
 pci_nvme_ns_attachment(uint16_t cid, uint8_t sel) "cid %"PRIu16", sel=0x%"PRIx8""
 pci_nvme_ns_attachment_attach(uint16_t cntlid, uint32_t nsid) "cntlid=0x%"PRIx16", nsid=0x%"PRIx32""
-pci_nvme_enqueue_event(uint8_t typ, uint8_t info, uint8_t log_page) "type 0x%"PRIx8" info 0x%"PRIx8" lid 0x%"PRIx8""
+pci_nvme_enqueue_event(uint8_t typ, uint8_t info, uint8_t log_page, uint32_t nsid) "type 0x%"PRIx8" info 0x%"PRIx8" lid 0x%"PRIx8" nsid %"PRIu32""
 pci_nvme_enqueue_event_noqueue(int queued) "queued %d"
 pci_nvme_enqueue_event_masked(uint8_t typ) "type 0x%"PRIx8""
 pci_nvme_no_outstanding_aers(void) "ignoring event; no outstanding AERs"
diff --git a/include/block/nvme.h b/include/block/nvme.h
index c747cc4948..9467d4b939 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -837,6 +837,7 @@ typedef struct QEMU_PACKED NvmeAerResult {
     uint8_t event_info;
     uint8_t log_page;
     uint8_t resv;
+    uint32_t nsid;
 } NvmeAerResult;
 
 typedef struct QEMU_PACKED NvmeZonedResult {
@@ -1228,6 +1229,7 @@ enum NvmeNsAttachmentOperation {
 #define NVME_AEC_SMART(aec)         (aec & 0xff)
 #define NVME_AEC_NS_ATTR(aec)       ((aec >> 8) & 0x1)
 #define NVME_AEC_FW_ACTIVATION(aec) ((aec >> 9) & 0x1)
+#define NVME_AEC_ZONE_CHANGED(aec)  ((aec >> 27) & 0x1)
 
 #define NVME_ERR_REC_TLER(err_rec)  (err_rec & 0xffff)
 #define NVME_ERR_REC_DULBE(err_rec) (err_rec & 0x10000)
@@ -1627,7 +1629,7 @@ typedef struct QEMU_PACKED NvmeZoneIdList {
 static inline void _nvme_check_size(void)
 {
     QEMU_BUILD_BUG_ON(sizeof(NvmeBar) != 4096);
-    QEMU_BUILD_BUG_ON(sizeof(NvmeAerResult) != 4);
+    QEMU_BUILD_BUG_ON(sizeof(NvmeAerResult) != 8);
     QEMU_BUILD_BUG_ON(sizeof(NvmeZonedResult) != 8);
     QEMU_BUILD_BUG_ON(sizeof(NvmeCqe) != 16);
     QEMU_BUILD_BUG_ON(sizeof(NvmeDsmRange) != 16);
-- 
2.27.0


