Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4508F628E7C
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 01:36:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oujAz-0001QI-QX; Mon, 14 Nov 2022 18:47:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <j.granados@samsung.com>)
 id 1ouifF-0004ue-RF
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:14:55 -0500
Received: from mailout1.w1.samsung.com ([210.118.77.11])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <j.granados@samsung.com>)
 id 1ouZv1-00082M-RI
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 08:54:47 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20221114135430euoutp01ef2437ac44d6eba16e00125ea5c6f0fa~nd-JvcoPJ1806718067euoutp011
 for <qemu-devel@nongnu.org>; Mon, 14 Nov 2022 13:54:30 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20221114135430euoutp01ef2437ac44d6eba16e00125ea5c6f0fa~nd-JvcoPJ1806718067euoutp011
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1668434070;
 bh=J5neq/3VGBv3J/aVyB/eTxtZGVyl7Zip/hruMvvXq3g=;
 h=From:To:CC:Subject:Date:In-Reply-To:References:From;
 b=tNdX+Ms8851IeRhqyEPRuzjUXKIz1qVAcDfL87EAChk+cRb5AYQRQos88VH+lVdjy
 RwLsr7ubHXt3UgNv4zpHlflmrY5PwTiAuQU1bHFPBUIxCqjaDBs7VCjNds8HWfVM6B
 OLMZv1+xd67tnjnBnc/FHKOA/gZRHWQDrzAI69mA=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20221114135429eucas1p2f5457110590aa9147ddb0e40e2d39576~nd-JnPq3-1384613846eucas1p2L;
 Mon, 14 Nov 2022 13:54:29 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 86.CB.09549.59842736; Mon, 14
 Nov 2022 13:54:29 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20221114135429eucas1p26370f7dd286e514105ae1173bfcc066f~nd-JQMvK11991919919eucas1p2t;
 Mon, 14 Nov 2022 13:54:29 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20221114135429eusmtrp24ad5d89881e54f9b334b030bf6dd2e93~nd-JPlZKD0116501165eusmtrp2H;
 Mon, 14 Nov 2022 13:54:29 +0000 (GMT)
X-AuditID: cbfec7f5-f5dff7000000254d-58-63724895dd51
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id F8.D3.08916.59842736; Mon, 14
 Nov 2022 13:54:29 +0000 (GMT)
Received: from CAMSVWEXC01.scsc.local (unknown [106.1.227.71]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20221114135429eusmtip2df3732169e73f0a225317759a30b3544~nd-JDuEth1578415784eusmtip2Z;
 Mon, 14 Nov 2022 13:54:29 +0000 (GMT)
Received: from localhost (106.110.32.33) by CAMSVWEXC01.scsc.local
 (2002:6a01:e347::6a01:e347) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 14 Nov 2022 13:54:28 +0000
From: Joel Granados <j.granados@samsung.com>
To: <k.jensen@samsung.com>, <qemu-devel@nongnu.org>, <qemu-block@nongnu.org>
CC: Joel Granados <j.granados@samsung.com>
Subject: [PATCH v2 3/3] nvme: Add physical writes/reads from OCP log
Date: Mon, 14 Nov 2022 14:50:43 +0100
Message-ID: <20221114135043.2958100-4-j.granados@samsung.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221114135043.2958100-1-j.granados@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [106.110.32.33]
X-ClientProxiedBy: CAMSVWEXC02.scsc.local (2002:6a01:e348::6a01:e348) To
 CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrOIsWRmVeSWpSXmKPExsWy7djP87pTPYqSDe6dN7OY9a6dzeJ47w4W
 ByaPJ9c2MwUwRnHZpKTmZJalFunbJXBlPO/tYi64ZFDx+9VV5gbG7SpdjJwcEgImEi8fr2fp
 YuTiEBJYwSix/+UjRgjnC6NE66ZedgjnM6PE04lT2GBadpz6zgqRWM4osW7dJza4qvc9p6D6
 NzNKnG75xwjSwiagI3H+zR1mEFtEwEdixey1TCA2s4CWxI3PR8BqhAVcJH4uvMAKYrMIqEr0
 rl0GVs8rYCsxuXkTC8RqeYm269PB6jkF7CTO/t7CDlEjKHFy5hMWiJnyEs1bZzND2BISB1+8
 YIboVZTYMuc7K4RdK/HgTQ8zyKESAks5JNbcPw9V5CIx61c7VJGwxKvjEAskBGQk/u+czwRh
 Z0vsnLILqr5AYtbJqUDvcwDZ1hJ9Z3Igwo4S3/4tZYII80nceCsIcQ6fxKRt05khwrwSHW1C
 ExhVZiF5YBaSB2YheWABI/MqRvHU0uLc9NRi47zUcr3ixNzi0rx0veT83E2MwLRw+t/xrzsY
 V7z6qHeIkYmD8RCjBAezkgjvPJn8ZCHelMTKqtSi/Pii0pzU4kOM0hwsSuK8bDO0koUE0hNL
 UrNTUwtSi2CyTBycUg1Mc9+w76jfuXvLYakirUlqZrpOKqubfmk46xRwX/eZctj2ju/VNeHr
 vxxr3+VVbqlzZes1sYUNeQ517exb1BJz/ZqXH7mUmruqLXKqoXzQsrbf1099EHq9JdXv87db
 bsFTS1rmLKvYtPx61DJB93W/boscXia3b+ML9Z8xC3+fcAjYXJexev29uz2JNTtm1artjtnO
 5bRnrzS3cavJr/Tkep8zMgxqopFaU6qUIqb/yMn2+7fmpq+4UcGloDcMi+VTI2fLe8x0b3+j
 OYV1SumypCtugraFIQdYPhaayO24s6T8Sf57+9fx69NMFLad+5rSeuRKIFuKbqSepcXvddOX
 WT8Le25Yb/EsfGH7jQkVSizFGYmGWsxFxYkA2XasrXoDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprIIsWRmVeSWpSXmKPExsVy+t/xe7pTPYqSDc4vl7GY9a6dzeJ47w4W
 ByaPJ9c2MwUwRunZFOWXlqQqZOQXl9gqRRtaGOkZWlroGZlY6hkam8daGZkq6dvZpKTmZJal
 FunbJehlPO/tYi64ZFDx+9VV5gbG7SpdjJwcEgImEjtOfWftYuTiEBJYyihxYMstNoiEjMSn
 Kx/ZIWxhiT/Xutggij4yShxacBbK2cwoMf38FWaQKjYBHYnzb+6A2SICPhIrZq9lArGZBbQk
 bnw+wghiCwu4SPxceIEVxGYRUJXoXbsMrJ5XwFZicvMmFoht8hJt16eD1XMK2Emc/b0F7Aoh
 oJot93dB1QtKnJz5hAVivrxE89bZzBC2hMTBFy+YIeYoSmyZ850Vwq6V2PR6PdMERpFZSNpn
 IWmfhaR9ASPzKkaR1NLi3PTcYkO94sTc4tK8dL3k/NxNjMC42Xbs5+YdjPNefdQ7xMjEwXiI
 UYKDWUmEd55MfrIQb0piZVVqUX58UWlOavEhRlOgPycyS4km5wMjN68k3tDMwNTQxMzSwNTS
 zFhJnNezoCNRSCA9sSQ1OzW1ILUIpo+Jg1OqgSn/5uaSxtr9j0xWV3O3/Sl5su24ZEqA+0Gt
 m1f2b/fxEA7et2v99KQnG7Q/F7c3Nd290N1v/W5litT2yhWpymo2fde5fkTe3tTg5njy1wPO
 jgkWm83aTfbuPXfi0N87af8lvfRdQ/82zP2hkVcV/MRk+mrZJ1/z6xUPXG2xSukpuSUgxxLv
 MVHS59PTvYcO7cvpOFX8w0CyQfw45/NVKybkxSrNU/q2+dr/vCf/JevfpjUdehFeLhhfr5E3
 Sb1r/yrmlfeq7a5o8+netpO5qrn6Ats6Nd+TEV0PPXY81zH5JqTVyqxluu9HVla87e+o81fs
 +zy2fDF4ltvHt7KWIZx9+6RehryEd87666qLNJVYijMSDbWYi4oTAak+6iEkAwAA
X-CMS-MailID: 20221114135429eucas1p26370f7dd286e514105ae1173bfcc066f
X-Msg-Generator: CA
X-RootMTR: 20221114135429eucas1p26370f7dd286e514105ae1173bfcc066f
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20221114135429eucas1p26370f7dd286e514105ae1173bfcc066f
References: <20221114135043.2958100-1-j.granados@samsung.com>
 <CGME20221114135429eucas1p26370f7dd286e514105ae1173bfcc066f@eucas1p2.samsung.com>
Received-SPF: pass client-ip=210.118.77.11;
 envelope-from=j.granados@samsung.com; helo=mailout1.w1.samsung.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 14 Nov 2022 18:47:40 -0500
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

In order to evaluate write amplification factor (WAF) within the storage
stack it is important to know the number of bytes written to the
controller. The existing SMART log value of Data Units Written is too
coarse (given in units of 500 Kb) and so we add the SMART health
information extended from the OCP specification (given in units of bytes).

To accomodate different vendor specific specifications like OCP, we add a
multiplexing function (nvme_vendor_specific_log) which will route to the
different log functions based on arguments and log ids. We only return the
OCP extended smart log when the command is 0xC0 and ocp has been turned on
in the args.

Though we add the whole nvme smart log extended structure, we only populate
the physical_media_units_{read,written}, log_page_version and
log_page_uuid.

Signed-off-by: Joel Granados <j.granados@samsung.com>

squash with main

Signed-off-by: Joel Granados <j.granados@samsung.com>
---
 hw/nvme/ctrl.c       | 56 ++++++++++++++++++++++++++++++++++++++++++++
 include/block/nvme.h | 36 ++++++++++++++++++++++++++++
 2 files changed, 92 insertions(+)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 220683201a..5e6a8150a2 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -4455,6 +4455,42 @@ static void nvme_set_blk_stats(NvmeNamespace *ns, struct nvme_stats *stats)
     stats->write_commands += s->nr_ops[BLOCK_ACCT_WRITE];
 }
 
+static uint16_t nvme_ocp_extended_smart_info(NvmeCtrl *n, uint8_t rae,
+                                             uint32_t buf_len, uint64_t off,
+                                             NvmeRequest *req)
+{
+    NvmeNamespace *ns = NULL;
+    NvmeSmartLogExtended smart_ext = { 0 };
+    struct nvme_stats stats = { 0 };
+    uint32_t trans_len;
+
+    if (off >= sizeof(smart_ext)) {
+        return NVME_INVALID_FIELD | NVME_DNR;
+    }
+
+    // Accumulate all stats from all namespaces
+    for (int i = 1; i <= NVME_MAX_NAMESPACES; i++) {
+        ns = nvme_ns(n, i);
+        if (ns)
+        {
+            nvme_set_blk_stats(ns, &stats);
+        }
+    }
+
+    smart_ext.physical_media_units_written[0] = cpu_to_le32(stats.units_written);
+    smart_ext.physical_media_units_read[0] = cpu_to_le32(stats.units_read);
+    smart_ext.log_page_version = 0x0003;
+    smart_ext.log_page_uuid[0] = 0xA4F2BFEA2810AFC5;
+    smart_ext.log_page_uuid[1] = 0xAFD514C97C6F4F9C;
+
+    if (!rae) {
+        nvme_clear_events(n, NVME_AER_TYPE_SMART);
+    }
+
+    trans_len = MIN(sizeof(smart_ext) - off, buf_len);
+    return nvme_c2h(n, (uint8_t *) &smart_ext + off, trans_len, req);
+}
+
 static uint16_t nvme_smart_info(NvmeCtrl *n, uint8_t rae, uint32_t buf_len,
                                 uint64_t off, NvmeRequest *req)
 {
@@ -4642,6 +4678,24 @@ static uint16_t nvme_cmd_effects(NvmeCtrl *n, uint8_t csi, uint32_t buf_len,
     return nvme_c2h(n, ((uint8_t *)&log) + off, trans_len, req);
 }
 
+static uint16_t nvme_vendor_specific_log(uint8_t lid, NvmeCtrl *n, uint8_t rae,
+                                         uint32_t buf_len, uint64_t off,
+                                         NvmeRequest *req)
+{
+    NvmeSubsystem *subsys = n->subsys;
+    switch (lid) {
+        case NVME_LOG_VENDOR_START:
+            if (subsys->params.ocp) {
+                return nvme_ocp_extended_smart_info(n, rae, buf_len, off, req);
+            }
+            break;
+            /* Add a case for each additional vendor specific log id */
+    }
+
+    trace_pci_nvme_err_invalid_log_page(nvme_cid(req), lid);
+    return NVME_INVALID_FIELD | NVME_DNR;
+}
+
 static uint16_t nvme_get_log(NvmeCtrl *n, NvmeRequest *req)
 {
     NvmeCmd *cmd = &req->cmd;
@@ -4683,6 +4737,8 @@ static uint16_t nvme_get_log(NvmeCtrl *n, NvmeRequest *req)
         return nvme_error_info(n, rae, len, off, req);
     case NVME_LOG_SMART_INFO:
         return nvme_smart_info(n, rae, len, off, req);
+    case NVME_LOG_VENDOR_START...NVME_LOG_VENDOR_END:
+        return nvme_vendor_specific_log(lid, n, rae, len, off, req);
     case NVME_LOG_FW_SLOT_INFO:
         return nvme_fw_log_info(n, len, off, req);
     case NVME_LOG_CHANGED_NSLIST:
diff --git a/include/block/nvme.h b/include/block/nvme.h
index 8027b7126b..2ab0dca529 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -978,6 +978,40 @@ typedef struct QEMU_PACKED NvmeSmartLog {
     uint8_t     reserved2[320];
 } NvmeSmartLog;
 
+typedef struct QEMU_PACKED NvmeSmartLogExtended {
+    uint64_t    physical_media_units_written[2];
+    uint64_t    physical_media_units_read[2];
+    uint64_t    bad_user_blocks;
+    uint64_t    bad_system_nand_blocks;
+    uint64_t    xor_recovery_count;
+    uint64_t    uncorrectable_read_error_count;
+    uint64_t    soft_ecc_error_count;
+    uint64_t    end2end_correction_counts;
+    uint8_t     system_data_percent_used;
+    uint8_t     refresh_counts[7];
+    uint64_t    user_data_erase_counts;
+    uint16_t    thermal_throttling_stat_and_count;
+    uint16_t    dssd_spec_version[3];
+    uint64_t    pcie_correctable_error_count;
+    uint32_t    incomplete_shutdowns;
+    uint32_t    reserved0;
+    uint8_t     percent_free_blocks;
+    uint8_t     reserved1[7];
+    uint16_t    capacity_health;
+    uint8_t     nvme_errata_ver;
+    uint8_t     reserved2[5];
+    uint64_t    unaligned_io;
+    uint64_t    security_ver_num;
+    uint64_t    total_nuse;
+    uint64_t    plp_start_count[2];
+    uint64_t    endurance_estimate[2];
+    uint64_t    pcie_retraining_count;
+    uint64_t    power_state_change_count;
+    uint8_t     reserved3[286];
+    uint16_t    log_page_version;
+    uint64_t    log_page_uuid[2];
+} NvmeSmartLogExtended;
+
 #define NVME_SMART_WARN_MAX     6
 enum NvmeSmartWarn {
     NVME_SMART_SPARE                  = 1 << 0,
@@ -1010,6 +1044,8 @@ enum NvmeLogIdentifier {
     NVME_LOG_FW_SLOT_INFO   = 0x03,
     NVME_LOG_CHANGED_NSLIST = 0x04,
     NVME_LOG_CMD_EFFECTS    = 0x05,
+    NVME_LOG_VENDOR_START   = 0xC0,
+    NVME_LOG_VENDOR_END     = 0xFF,
 };
 
 typedef struct QEMU_PACKED NvmePSD {
-- 
2.30.2


