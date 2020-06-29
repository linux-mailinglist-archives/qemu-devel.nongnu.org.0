Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4091920D09C
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Jun 2020 20:28:55 +0200 (CEST)
Received: from localhost ([::1]:54922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jpyWU-00022S-5d
	for lists+qemu-devel@lfdr.de; Mon, 29 Jun 2020 14:28:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1jpyUg-0008MA-T4; Mon, 29 Jun 2020 14:27:02 -0400
Received: from charlie.dont.surf ([128.199.63.193]:45912)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1jpyUd-0000bx-VX; Mon, 29 Jun 2020 14:27:02 -0400
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by charlie.dont.surf (Postfix) with ESMTPSA id 45DEBBF7F2;
 Mon, 29 Jun 2020 18:26:55 +0000 (UTC)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-block@nongnu.org
Subject: [PATCH 06/17] hw/block/nvme: add support for the get log page command
Date: Mon, 29 Jun 2020 20:26:31 +0200
Message-Id: <20200629182642.1170387-7-its@irrelevant.dk>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200629182642.1170387-1-its@irrelevant.dk>
References: <20200629182642.1170387-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=128.199.63.193; envelope-from=its@irrelevant.dk;
 helo=charlie.dont.surf
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/29 14:26:53
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Kevin Wolf <kwolf@redhat.com>, Klaus Jensen <k.jensen@samsung.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Keith Busch <kbusch@kernel.org>,
 Maxim Levitsky <mlevitsk@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Add support for the Get Log Page command and basic implementations of
the mandatory Error Information, SMART / Health Information and Firmware
Slot Information log pages.

In violation of the specification, the SMART / Health Information log
page does not persist information over the lifetime of the controller
because the device has no place to store such persistent state.

Note that the LPA field in the Identify Controller data structure
intentionally has bit 0 cleared because there is no namespace specific
information in the SMART / Health information log page.

Required for compliance with NVMe revision 1.3d. See NVM Express 1.3d,
Section 5.14 ("Get Log Page command").

Signed-off-by: Klaus Jensen <klaus.jensen@cnexlabs.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Acked-by: Keith Busch <kbusch@kernel.org>
---
 hw/block/nvme.c       | 141 +++++++++++++++++++++++++++++++++++++++++-
 hw/block/nvme.h       |   2 +
 hw/block/trace-events |   2 +
 include/block/nvme.h  |   4 ++
 4 files changed, 148 insertions(+), 1 deletion(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index f8e91a6965ed..fe5d052ab159 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -592,6 +592,141 @@ static uint16_t nvme_create_sq(NvmeCtrl *n, NvmeCmd *cmd)
     return NVME_SUCCESS;
 }
 
+static uint16_t nvme_smart_info(NvmeCtrl *n, NvmeCmd *cmd, uint32_t buf_len,
+                                uint64_t off, NvmeRequest *req)
+{
+    uint64_t prp1 = le64_to_cpu(cmd->dptr.prp1);
+    uint64_t prp2 = le64_to_cpu(cmd->dptr.prp2);
+    uint32_t nsid = le32_to_cpu(cmd->nsid);
+
+    uint32_t trans_len;
+    time_t current_ms;
+    uint64_t units_read = 0, units_written = 0;
+    uint64_t read_commands = 0, write_commands = 0;
+    NvmeSmartLog smart;
+    BlockAcctStats *s;
+
+    if (nsid && nsid != 0xffffffff) {
+        return NVME_INVALID_FIELD | NVME_DNR;
+    }
+
+    s = blk_get_stats(n->conf.blk);
+
+    units_read = s->nr_bytes[BLOCK_ACCT_READ] >> BDRV_SECTOR_BITS;
+    units_written = s->nr_bytes[BLOCK_ACCT_WRITE] >> BDRV_SECTOR_BITS;
+    read_commands = s->nr_ops[BLOCK_ACCT_READ];
+    write_commands = s->nr_ops[BLOCK_ACCT_WRITE];
+
+    if (off > sizeof(smart)) {
+        return NVME_INVALID_FIELD | NVME_DNR;
+    }
+
+    trans_len = MIN(sizeof(smart) - off, buf_len);
+
+    memset(&smart, 0x0, sizeof(smart));
+
+    smart.data_units_read[0] = cpu_to_le64(units_read / 1000);
+    smart.data_units_written[0] = cpu_to_le64(units_written / 1000);
+    smart.host_read_commands[0] = cpu_to_le64(read_commands);
+    smart.host_write_commands[0] = cpu_to_le64(write_commands);
+
+    smart.temperature[0] = n->temperature & 0xff;
+    smart.temperature[1] = (n->temperature >> 8) & 0xff;
+
+    if ((n->temperature >= n->features.temp_thresh_hi) ||
+        (n->temperature <= n->features.temp_thresh_low)) {
+        smart.critical_warning |= NVME_SMART_TEMPERATURE;
+    }
+
+    current_ms = qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL);
+    smart.power_on_hours[0] =
+        cpu_to_le64((((current_ms - n->starttime_ms) / 1000) / 60) / 60);
+
+    return nvme_dma_read_prp(n, (uint8_t *) &smart + off, trans_len, prp1,
+                             prp2);
+}
+
+static uint16_t nvme_fw_log_info(NvmeCtrl *n, NvmeCmd *cmd, uint32_t buf_len,
+                                 uint64_t off, NvmeRequest *req)
+{
+    uint32_t trans_len;
+    uint64_t prp1 = le64_to_cpu(cmd->dptr.prp1);
+    uint64_t prp2 = le64_to_cpu(cmd->dptr.prp2);
+    NvmeFwSlotInfoLog fw_log = {
+        .afi = 0x1,
+    };
+
+    strpadcpy((char *)&fw_log.frs1, sizeof(fw_log.frs1), "1.0", ' ');
+
+    if (off > sizeof(fw_log)) {
+        return NVME_INVALID_FIELD | NVME_DNR;
+    }
+
+    trans_len = MIN(sizeof(fw_log) - off, buf_len);
+
+    return nvme_dma_read_prp(n, (uint8_t *) &fw_log + off, trans_len, prp1,
+                             prp2);
+}
+
+static uint16_t nvme_error_info(NvmeCtrl *n, NvmeCmd *cmd, uint32_t buf_len,
+                                uint64_t off, NvmeRequest *req)
+{
+    uint32_t trans_len;
+    uint64_t prp1 = le64_to_cpu(cmd->dptr.prp1);
+    uint64_t prp2 = le64_to_cpu(cmd->dptr.prp2);
+    NvmeErrorLog errlog;
+
+    if (off > sizeof(errlog)) {
+        return NVME_INVALID_FIELD | NVME_DNR;
+    }
+
+    memset(&errlog, 0x0, sizeof(errlog));
+
+    trans_len = MIN(sizeof(errlog) - off, buf_len);
+
+    return nvme_dma_read_prp(n, (uint8_t *)&errlog, trans_len, prp1, prp2);
+}
+
+static uint16_t nvme_get_log(NvmeCtrl *n, NvmeCmd *cmd, NvmeRequest *req)
+{
+    uint32_t dw10 = le32_to_cpu(cmd->cdw10);
+    uint32_t dw11 = le32_to_cpu(cmd->cdw11);
+    uint32_t dw12 = le32_to_cpu(cmd->cdw12);
+    uint32_t dw13 = le32_to_cpu(cmd->cdw13);
+    uint8_t  lid = dw10 & 0xff;
+    uint8_t  lsp = (dw10 >> 8) & 0xf;
+    uint8_t  rae = (dw10 >> 15) & 0x1;
+    uint32_t numdl, numdu;
+    uint64_t off, lpol, lpou;
+    size_t   len;
+
+    numdl = (dw10 >> 16);
+    numdu = (dw11 & 0xffff);
+    lpol = dw12;
+    lpou = dw13;
+
+    len = (((numdu << 16) | numdl) + 1) << 2;
+    off = (lpou << 32ULL) | lpol;
+
+    if (off & 0x3) {
+        return NVME_INVALID_FIELD | NVME_DNR;
+    }
+
+    trace_pci_nvme_get_log(nvme_cid(req), lid, lsp, rae, len, off);
+
+    switch (lid) {
+    case NVME_LOG_ERROR_INFO:
+        return nvme_error_info(n, cmd, len, off, req);
+    case NVME_LOG_SMART_INFO:
+        return nvme_smart_info(n, cmd, len, off, req);
+    case NVME_LOG_FW_SLOT_INFO:
+        return nvme_fw_log_info(n, cmd, len, off, req);
+    default:
+        trace_pci_nvme_err_invalid_log_page(nvme_cid(req), lid);
+        return NVME_INVALID_FIELD | NVME_DNR;
+    }
+}
+
 static void nvme_free_cq(NvmeCQueue *cq, NvmeCtrl *n)
 {
     n->cq[cq->cqid] = NULL;
@@ -946,6 +1081,8 @@ static uint16_t nvme_admin_cmd(NvmeCtrl *n, NvmeCmd *cmd, NvmeRequest *req)
         return nvme_del_sq(n, cmd);
     case NVME_ADM_CMD_CREATE_SQ:
         return nvme_create_sq(n, cmd);
+    case NVME_ADM_CMD_GET_LOG_PAGE:
+        return nvme_get_log(n, cmd, req);
     case NVME_ADM_CMD_DELETE_CQ:
         return nvme_del_cq(n, cmd);
     case NVME_ADM_CMD_CREATE_CQ:
@@ -1497,7 +1634,9 @@ static void nvme_init_state(NvmeCtrl *n)
     n->namespaces = g_new0(NvmeNamespace, n->num_namespaces);
     n->sq = g_new0(NvmeSQueue *, n->params.max_ioqpairs + 1);
     n->cq = g_new0(NvmeCQueue *, n->params.max_ioqpairs + 1);
+    n->temperature = NVME_TEMPERATURE;
     n->features.temp_thresh_hi = NVME_TEMPERATURE_WARNING;
+    n->starttime_ms = qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL);
 }
 
 static void nvme_init_blk(NvmeCtrl *n, Error **errp)
@@ -1654,7 +1793,7 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
      */
     id->acl = 3;
     id->frmw = (NVME_NUM_FW_SLOTS << 1) | NVME_FRMW_SLOT1_RO;
-    id->lpa = 1 << 0;
+    id->lpa = NVME_LPA_EXTENDED;
 
     /* recommended default value (~70 C) */
     id->wctemp = cpu_to_le16(NVME_TEMPERATURE_WARNING);
diff --git a/hw/block/nvme.h b/hw/block/nvme.h
index 3acde10e1d2a..3ddbc3722d7c 100644
--- a/hw/block/nvme.h
+++ b/hw/block/nvme.h
@@ -98,6 +98,8 @@ typedef struct NvmeCtrl {
     uint32_t    irq_status;
     uint64_t    host_timestamp;                 /* Timestamp sent by the host */
     uint64_t    timestamp_set_qemu_clock_ms;    /* QEMU clock time */
+    uint64_t    starttime_ms;
+    uint16_t    temperature;
 
     HostMemoryBackend *pmrdev;
 
diff --git a/hw/block/trace-events b/hw/block/trace-events
index c40c0d2e4b28..3330d74e48db 100644
--- a/hw/block/trace-events
+++ b/hw/block/trace-events
@@ -45,6 +45,7 @@ pci_nvme_del_cq(uint16_t cqid) "deleted completion queue, cqid=%"PRIu16""
 pci_nvme_identify_ctrl(void) "identify controller"
 pci_nvme_identify_ns(uint32_t ns) "nsid %"PRIu32""
 pci_nvme_identify_nslist(uint32_t ns) "nsid %"PRIu32""
+pci_nvme_get_log(uint16_t cid, uint8_t lid, uint8_t lsp, uint8_t rae, uint32_t len, uint64_t off) "cid %"PRIu16" lid 0x%"PRIx8" lsp 0x%"PRIx8" rae 0x%"PRIx8" len %"PRIu32" off %"PRIu64""
 pci_nvme_getfeat_vwcache(const char* result) "get feature volatile write cache, result=%s"
 pci_nvme_getfeat_numq(int result) "get feature number of queues, result=%d"
 pci_nvme_setfeat_numq(int reqcq, int reqsq, int gotcq, int gotsq) "requested cq_count=%d sq_count=%d, responding with cq_count=%d sq_count=%d"
@@ -94,6 +95,7 @@ pci_nvme_err_invalid_create_cq_qflags(uint16_t qflags) "failed creating completi
 pci_nvme_err_invalid_identify_cns(uint16_t cns) "identify, invalid cns=0x%"PRIx16""
 pci_nvme_err_invalid_getfeat(int dw10) "invalid get features, dw10=0x%"PRIx32""
 pci_nvme_err_invalid_setfeat(uint32_t dw10) "invalid set features, dw10=0x%"PRIx32""
+pci_nvme_err_invalid_log_page(uint16_t cid, uint16_t lid) "cid %"PRIu16" lid 0x%"PRIx16""
 pci_nvme_err_startfail_cq(void) "nvme_start_ctrl failed because there are non-admin completion queues"
 pci_nvme_err_startfail_sq(void) "nvme_start_ctrl failed because there are non-admin submission queues"
 pci_nvme_err_startfail_nbarasq(void) "nvme_start_ctrl failed because the admin submission queue address is null"
diff --git a/include/block/nvme.h b/include/block/nvme.h
index 003b15af9cd9..1339f0491d27 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -846,6 +846,10 @@ enum NvmeIdCtrlFrmw {
     NVME_FRMW_SLOT1_RO = 1 << 0,
 };
 
+enum NvmeIdCtrlLpa {
+    NVME_LPA_EXTENDED = 1 << 2,
+};
+
 #define NVME_CTRL_SQES_MIN(sqes) ((sqes) & 0xf)
 #define NVME_CTRL_SQES_MAX(sqes) (((sqes) >> 4) & 0xf)
 #define NVME_CTRL_CQES_MIN(cqes) ((cqes) & 0xf)
-- 
2.27.0


