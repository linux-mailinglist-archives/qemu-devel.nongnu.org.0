Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA6BE28D644
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Oct 2020 23:44:56 +0200 (CEST)
Received: from localhost ([::1]:55084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kSS6J-0007Wh-SM
	for lists+qemu-devel@lfdr.de; Tue, 13 Oct 2020 17:44:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=5487bf209=dmitry.fomichev@wdc.com>)
 id 1kSS3w-0005WG-Tk; Tue, 13 Oct 2020 17:42:28 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:45635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=5487bf209=dmitry.fomichev@wdc.com>)
 id 1kSS3u-0001mO-4a; Tue, 13 Oct 2020 17:42:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1602625346; x=1634161346;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=arJwAnMe+oHKbPPXbn2bBhhukcRGt46N6Mp5iO7GAYU=;
 b=RfaH+b0niZdJGZC2r1KN88B6CTaJnP/allsBNWsf723CutTi2zzeegVX
 P5F4Dbz7zA8iW8j2ssAi19ffAN2fhpS6Xi61U69+NFLZZ1jYn9P3bU7Su
 fKe9ZT1bnmtF3KC/s/3MfEnNlQZ60th1iMzGln5vtaT3URh5FIMG1xslg
 Udl+h6usYNPcr/0XlkLuemhn2n+PKetNh5kr1IjOv0q0/sN/YEoIsu/7e
 xh/Ju5nUsr3hVz4aDGiWLMAKAnDqJ+Gq0OH3GxhBjs8k0q4ssw3X9d7Pp
 nFjr253CykMjMOEktCaAF20uRqGAIa4TaFtrY8Pt1FSunAaYo9KHOaj7d A==;
IronPort-SDR: l9uN31mqx9CGUmOyXV/Q8i3y0g54r5r2b8DwDsa3a6SAEZflLs0B7YiWXTwsKSKXR7os6WJqoX
 nvaJhVKvvenlsL/E9+Eh9k2OKdjljdZ8BqnNKZfm2N4aOY5V2O0K6kj71yBeBdchg+5cL6oEn6
 /ou+CqBWQrgGpQYz+d/SG7PuApPC0Sa2ciUL0j0vHfvS7iwBjjIM4xpGDa6/21a9yQjJh4Pgyv
 bJu92JrdVCkil7zflbDr+u5u7fgIwhFpGt/zKs0IUntN6lvbUlPKZh+rcZQiuVmpl/s+Q2UV91
 E5w=
X-IronPort-AV: E=Sophos;i="5.77,371,1596470400"; d="scan'208";a="154185921"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 14 Oct 2020 05:42:21 +0800
IronPort-SDR: ncfT4/Qfohjm/KGNDbqa83POmjj4KNYYSmbxyLUo6/wlqXfJHTpeSrMX0KwOGZXtvKl1wdA6vE
 gs5jv9WgcCSR/b9jVz7mqv2BpWPhv5wjE2WiFMiDAFc2NEmhLiGQvF55fG7VK1f8SuHVqNMQHa
 AIm9trH4ZckJj36qM4okrMovEVvOt0htP8oilMj5sEyFFMDI4dAfoP0x8aJz3Me3+3axNnRjxV
 xWFQtKVfhtEtKbOBVhQtwZJqDIGZ4DncgLdWXFd0mbl3wffKyMTDCj4BO/WCpS/DuPAajqcBvO
 gPFbJdKtld8dPB4WUPEOZGFL
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2020 14:28:55 -0700
IronPort-SDR: vA0T1cos6PXGBIfNjg4aSFRmZ+lK96FQyeWjSLtlgDZHMSeXj7o4JJk29THHVnEU0Bd2WPRolS
 pWafd6oKG4bQPTBxMkfyJoPHCNKSml1I0Ew3QpICQWrgedyHpc/VqkZjJk6nqV51KZ/pK8RdiV
 7HOn/xsH2aZRSAYH1K/0ceSuV3nH+526ibCdAi2GJ0VUdgklStLtFiYA0zYgQt/08UzA1kvkpV
 lcYMu3O6Ym1OdYNZIRsI29TX+IXJDalIgDgb9akIcKIP1L98QJRn0rNE7IHBcwljhfuKvNbp3z
 nTY=
WDCIronportException: Internal
Received: from unknown (HELO redsun50.ssa.fujisawa.hgst.com) ([10.149.66.24])
 by uls-op-cesaip02.wdc.com with ESMTP; 13 Oct 2020 14:42:19 -0700
From: Dmitry Fomichev <dmitry.fomichev@wdc.com>
To: Keith Busch <kbusch@kernel.org>, Klaus Jensen <k.jensen@samsung.com>,
 Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Maxim Levitsky <mlevitsk@redhat.com>, Fam Zheng <fam@euphon.net>
Subject: [PATCH v6 01/11] hw/block/nvme: Add Commands Supported and Effects log
Date: Wed, 14 Oct 2020 06:42:02 +0900
Message-Id: <20201013214212.2152-2-dmitry.fomichev@wdc.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20201013214212.2152-1-dmitry.fomichev@wdc.com>
References: <20201013214212.2152-1-dmitry.fomichev@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=5487bf209=dmitry.fomichev@wdc.com; helo=esa3.hgst.iphmx.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/13 17:42:19
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Niklas Cassel <niklas.cassel@wdc.com>,
 Damien Le Moal <damien.lemoal@wdc.com>, qemu-block@nongnu.org,
 Dmitry Fomichev <dmitry.fomichev@wdc.com>, qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Matias Bjorling <matias.bjorling@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This log page becomes necessary to implement to allow checking for
Zone Append command support in Zoned Namespace Command Set.

This commit adds the code to report this log page for NVM Command
Set only. The parts that are specific to zoned operation will be
added later in the series.

All incoming admin and i/o commands are now only processed if their
corresponding support bits are set in this log. This provides an
easy way to control what commands to support and what not to
depending on set CC.CSS.

Signed-off-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>
---
 hw/block/nvme-ns.h    |  1 +
 hw/block/nvme.c       | 69 +++++++++++++++++++++++++++++++++++++++----
 hw/block/trace-events |  2 ++
 include/block/nvme.h  | 19 ++++++++++++
 4 files changed, 86 insertions(+), 5 deletions(-)

diff --git a/hw/block/nvme-ns.h b/hw/block/nvme-ns.h
index 83734f4606..ea8c2f785d 100644
--- a/hw/block/nvme-ns.h
+++ b/hw/block/nvme-ns.h
@@ -29,6 +29,7 @@ typedef struct NvmeNamespace {
     int32_t      bootindex;
     int64_t      size;
     NvmeIdNs     id_ns;
+    const uint32_t *iocs;
 
     NvmeNamespaceParams params;
 } NvmeNamespace;
diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 9d30ca69dc..ee0eff98da 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -111,6 +111,25 @@ static const uint32_t nvme_feature_cap[NVME_FID_MAX] = {
     [NVME_TIMESTAMP]                = NVME_FEAT_CAP_CHANGE,
 };
 
+static const uint32_t nvme_cse_acs[256] = {
+    [NVME_ADM_CMD_DELETE_SQ]        = NVME_CMD_EFF_CSUPP,
+    [NVME_ADM_CMD_CREATE_SQ]        = NVME_CMD_EFF_CSUPP,
+    [NVME_ADM_CMD_DELETE_CQ]        = NVME_CMD_EFF_CSUPP,
+    [NVME_ADM_CMD_CREATE_CQ]        = NVME_CMD_EFF_CSUPP,
+    [NVME_ADM_CMD_IDENTIFY]         = NVME_CMD_EFF_CSUPP,
+    [NVME_ADM_CMD_SET_FEATURES]     = NVME_CMD_EFF_CSUPP,
+    [NVME_ADM_CMD_GET_FEATURES]     = NVME_CMD_EFF_CSUPP,
+    [NVME_ADM_CMD_GET_LOG_PAGE]     = NVME_CMD_EFF_CSUPP,
+    [NVME_ADM_CMD_ASYNC_EV_REQ]     = NVME_CMD_EFF_CSUPP,
+};
+
+static const uint32_t nvme_cse_iocs_nvm[256] = {
+    [NVME_CMD_FLUSH]                = NVME_CMD_EFF_CSUPP | NVME_CMD_EFF_LBCC,
+    [NVME_CMD_WRITE_ZEROES]         = NVME_CMD_EFF_CSUPP | NVME_CMD_EFF_LBCC,
+    [NVME_CMD_WRITE]                = NVME_CMD_EFF_CSUPP | NVME_CMD_EFF_LBCC,
+    [NVME_CMD_READ]                 = NVME_CMD_EFF_CSUPP,
+};
+
 static void nvme_process_sq(void *opaque);
 
 static uint16_t nvme_cid(NvmeRequest *req)
@@ -1045,6 +1064,11 @@ static uint16_t nvme_io_cmd(NvmeCtrl *n, NvmeRequest *req)
         return NVME_INVALID_FIELD | NVME_DNR;
     }
 
+    if (!(req->ns->iocs[req->cmd.opcode] & NVME_CMD_EFF_CSUPP)) {
+        trace_pci_nvme_err_invalid_opc(req->cmd.opcode);
+        return NVME_INVALID_OPCODE | NVME_DNR;
+    }
+
     switch (req->cmd.opcode) {
     case NVME_CMD_FLUSH:
         return nvme_flush(n, req);
@@ -1054,8 +1078,7 @@ static uint16_t nvme_io_cmd(NvmeCtrl *n, NvmeRequest *req)
     case NVME_CMD_READ:
         return nvme_rw(n, req);
     default:
-        trace_pci_nvme_err_invalid_opc(req->cmd.opcode);
-        return NVME_INVALID_OPCODE | NVME_DNR;
+        assert(false);
     }
 }
 
@@ -1291,6 +1314,35 @@ static uint16_t nvme_error_info(NvmeCtrl *n, uint8_t rae, uint32_t buf_len,
                     DMA_DIRECTION_FROM_DEVICE, req);
 }
 
+static uint16_t nvme_cmd_effects(NvmeCtrl *n, uint32_t buf_len,
+                                 uint64_t off, NvmeRequest *req)
+{
+    NvmeEffectsLog log = {};
+    uint32_t *dst_acs = log.acs, *dst_iocs = log.iocs;
+    uint32_t trans_len;
+    int i;
+
+    trace_pci_nvme_cmd_supp_and_effects_log_read();
+
+    if (off >= sizeof(log)) {
+        trace_pci_nvme_err_invalid_effects_log_offset(off);
+        return NVME_INVALID_FIELD | NVME_DNR;
+    }
+
+    for (i = 0; i < 256; i++) {
+        dst_acs[i] = nvme_cse_acs[i];
+    }
+
+    for (i = 0; i < 256; i++) {
+        dst_iocs[i] = nvme_cse_iocs_nvm[i];
+    }
+
+    trans_len = MIN(sizeof(log) - off, buf_len);
+
+    return nvme_dma(n, ((uint8_t *)&log) + off, trans_len,
+                    DMA_DIRECTION_FROM_DEVICE, req);
+}
+
 static uint16_t nvme_get_log(NvmeCtrl *n, NvmeRequest *req)
 {
     NvmeCmd *cmd = &req->cmd;
@@ -1334,6 +1386,8 @@ static uint16_t nvme_get_log(NvmeCtrl *n, NvmeRequest *req)
         return nvme_smart_info(n, rae, len, off, req);
     case NVME_LOG_FW_SLOT_INFO:
         return nvme_fw_log_info(n, len, off, req);
+    case NVME_LOG_CMD_EFFECTS:
+        return nvme_cmd_effects(n, len, off, req);
     default:
         trace_pci_nvme_err_invalid_log_page(nvme_cid(req), lid);
         return NVME_INVALID_FIELD | NVME_DNR;
@@ -1920,6 +1974,11 @@ static uint16_t nvme_admin_cmd(NvmeCtrl *n, NvmeRequest *req)
     trace_pci_nvme_admin_cmd(nvme_cid(req), nvme_sqid(req), req->cmd.opcode,
                              nvme_adm_opc_str(req->cmd.opcode));
 
+    if (!(nvme_cse_acs[req->cmd.opcode] & NVME_CMD_EFF_CSUPP)) {
+        trace_pci_nvme_err_invalid_admin_opc(req->cmd.opcode);
+        return NVME_INVALID_OPCODE | NVME_DNR;
+    }
+
     switch (req->cmd.opcode) {
     case NVME_ADM_CMD_DELETE_SQ:
         return nvme_del_sq(n, req);
@@ -1942,8 +2001,7 @@ static uint16_t nvme_admin_cmd(NvmeCtrl *n, NvmeRequest *req)
     case NVME_ADM_CMD_ASYNC_EV_REQ:
         return nvme_aer(n, req);
     default:
-        trace_pci_nvme_err_invalid_admin_opc(req->cmd.opcode);
-        return NVME_INVALID_OPCODE | NVME_DNR;
+        assert(false);
     }
 }
 
@@ -2596,6 +2654,7 @@ int nvme_register_namespace(NvmeCtrl *n, NvmeNamespace *ns, Error **errp)
     trace_pci_nvme_register_namespace(nsid);
 
     n->namespaces[nsid - 1] = ns;
+    ns->iocs = nvme_cse_iocs_nvm;
 
     return 0;
 }
@@ -2737,7 +2796,7 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
     id->acl = 3;
     id->aerl = n->params.aerl;
     id->frmw = (NVME_NUM_FW_SLOTS << 1) | NVME_FRMW_SLOT1_RO;
-    id->lpa = NVME_LPA_NS_SMART | NVME_LPA_EXTENDED;
+    id->lpa = NVME_LPA_NS_SMART | NVME_LPA_CSE | NVME_LPA_EXTENDED;
 
     /* recommended default value (~70 C) */
     id->wctemp = cpu_to_le16(NVME_TEMPERATURE_WARNING);
diff --git a/hw/block/trace-events b/hw/block/trace-events
index fac5995d94..0ae9cb0d35 100644
--- a/hw/block/trace-events
+++ b/hw/block/trace-events
@@ -85,6 +85,7 @@ pci_nvme_mmio_start_success(void) "setting controller enable bit succeeded"
 pci_nvme_mmio_stopped(void) "cleared controller enable bit"
 pci_nvme_mmio_shutdown_set(void) "shutdown bit set"
 pci_nvme_mmio_shutdown_cleared(void) "shutdown bit cleared"
+pci_nvme_cmd_supp_and_effects_log_read(void) "commands supported and effects log read"
 
 # nvme traces for error conditions
 pci_nvme_err_mdts(uint16_t cid, size_t len) "cid %"PRIu16" len %zu"
@@ -104,6 +105,7 @@ pci_nvme_err_invalid_prp(void) "invalid PRP"
 pci_nvme_err_invalid_opc(uint8_t opc) "invalid opcode 0x%"PRIx8""
 pci_nvme_err_invalid_admin_opc(uint8_t opc) "invalid admin opcode 0x%"PRIx8""
 pci_nvme_err_invalid_lba_range(uint64_t start, uint64_t len, uint64_t limit) "Invalid LBA start=%"PRIu64" len=%"PRIu64" limit=%"PRIu64""
+pci_nvme_err_invalid_effects_log_offset(uint64_t ofs) "commands supported and effects log offset must be 0, got %"PRIu64""
 pci_nvme_err_invalid_del_sq(uint16_t qid) "invalid submission queue deletion, sid=%"PRIu16""
 pci_nvme_err_invalid_create_sq_cqid(uint16_t cqid) "failed creating submission queue, invalid cqid=%"PRIu16""
 pci_nvme_err_invalid_create_sq_sqid(uint16_t sqid) "failed creating submission queue, invalid sqid=%"PRIu16""
diff --git a/include/block/nvme.h b/include/block/nvme.h
index 6de2d5aa75..4779495b7d 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -744,10 +744,27 @@ enum NvmeSmartWarn {
     NVME_SMART_FAILED_VOLATILE_MEDIA  = 1 << 4,
 };
 
+typedef struct NvmeEffectsLog {
+    uint32_t    acs[256];
+    uint32_t    iocs[256];
+    uint8_t     resv[2048];
+} NvmeEffectsLog;
+
+enum {
+    NVME_CMD_EFF_CSUPP      = 1 << 0,
+    NVME_CMD_EFF_LBCC       = 1 << 1,
+    NVME_CMD_EFF_NCC        = 1 << 2,
+    NVME_CMD_EFF_NIC        = 1 << 3,
+    NVME_CMD_EFF_CCC        = 1 << 4,
+    NVME_CMD_EFF_CSE_MASK   = 3 << 16,
+    NVME_CMD_EFF_UUID_SEL   = 1 << 19,
+};
+
 enum NvmeLogIdentifier {
     NVME_LOG_ERROR_INFO     = 0x01,
     NVME_LOG_SMART_INFO     = 0x02,
     NVME_LOG_FW_SLOT_INFO   = 0x03,
+    NVME_LOG_CMD_EFFECTS    = 0x05,
 };
 
 typedef struct QEMU_PACKED NvmePSD {
@@ -860,6 +877,7 @@ enum NvmeIdCtrlFrmw {
 
 enum NvmeIdCtrlLpa {
     NVME_LPA_NS_SMART = 1 << 0,
+    NVME_LPA_CSE      = 1 << 1,
     NVME_LPA_EXTENDED = 1 << 2,
 };
 
@@ -1059,6 +1077,7 @@ static inline void _nvme_check_size(void)
     QEMU_BUILD_BUG_ON(sizeof(NvmeErrorLog) != 64);
     QEMU_BUILD_BUG_ON(sizeof(NvmeFwSlotInfoLog) != 512);
     QEMU_BUILD_BUG_ON(sizeof(NvmeSmartLog) != 512);
+    QEMU_BUILD_BUG_ON(sizeof(NvmeEffectsLog) != 4096);
     QEMU_BUILD_BUG_ON(sizeof(NvmeIdCtrl) != 4096);
     QEMU_BUILD_BUG_ON(sizeof(NvmeIdNs) != 4096);
     QEMU_BUILD_BUG_ON(sizeof(NvmeSglDescriptor) != 16);
-- 
2.21.0


