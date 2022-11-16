Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2B862C637
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 18:20:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovM3q-0002zw-7W; Wed, 16 Nov 2022 12:18:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <j.granados@samsung.com>)
 id 1ovM3f-0002wn-IF
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 12:18:43 -0500
Received: from mailout1.w1.samsung.com ([210.118.77.11])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <j.granados@samsung.com>)
 id 1ovM3c-0001zH-RR
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 12:18:43 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20221116171838euoutp013b68937d162f1e423b67eb343d9a0195~oID9Mpasq1450314503euoutp01B
 for <qemu-devel@nongnu.org>; Wed, 16 Nov 2022 17:18:38 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20221116171838euoutp013b68937d162f1e423b67eb343d9a0195~oID9Mpasq1450314503euoutp01B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1668619118;
 bh=1EGEjjluFD9XJYT/oyCQ6ZI+ywY0nUZJcIVg5sweWds=;
 h=From:To:CC:Subject:Date:In-Reply-To:References:From;
 b=ModxUmExrjR1l+z3MkOEfqEYRh0SqfDrTYw7tb3gyPP9qsgkE5Pukwq+HEQKk0RX+
 DjEFVqjAVrh5/sOkz62wI+jVgyLUb1TKf5X+C4aVFOUIlbK7LoLEIqvA07Py6yZGnB
 edIq7gu0o2FwqmMObj6Bono2oFqhixpovFYhL2h4=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20221116171837eucas1p29d5b4a7c2059b5ba7e8df96ab74a5b83~oID8Rkalv2771627716eucas1p2M;
 Wed, 16 Nov 2022 17:18:37 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id EB.40.09549.D6B15736; Wed, 16
 Nov 2022 17:18:37 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20221116171836eucas1p1dfaeb8826ca901f20ede7567ec2623e3~oID7oMkjc0514505145eucas1p10;
 Wed, 16 Nov 2022 17:18:36 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20221116171836eusmtrp12dcdd27305ee3429db1fe38c9b64e90f~oID7nqjCB2593625936eusmtrp1D;
 Wed, 16 Nov 2022 17:18:36 +0000 (GMT)
X-AuditID: cbfec7f5-f47ff7000000254d-cd-63751b6d40a2
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id F4.BD.08916.C6B15736; Wed, 16
 Nov 2022 17:18:36 +0000 (GMT)
Received: from CAMSVWEXC01.scsc.local (unknown [106.1.227.71]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20221116171836eusmtip15feac4e1bda89bb2d54dd48ca003f727~oID7dBd_32230422304eusmtip14;
 Wed, 16 Nov 2022 17:18:36 +0000 (GMT)
Received: from localhost (106.110.32.33) by CAMSVWEXC01.scsc.local
 (2002:6a01:e347::6a01:e347) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 16 Nov 2022 17:18:35 +0000
From: Joel Granados <j.granados@samsung.com>
To: <qemu-block@nongnu.org>, <qemu-devel@nongnu.org>, <k.jensen@samsung.com>
CC: Joel Granados <j.granados@samsung.com>
Subject: [PATCH v3 2/2] nvme: Add physical writes/reads from OCP log
Date: Wed, 16 Nov 2022 18:14:55 +0100
Message-ID: <20221116171455.3401086-3-j.granados@samsung.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221116171455.3401086-1-j.granados@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [106.110.32.33]
X-ClientProxiedBy: CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347) To
 CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrGIsWRmVeSWpSXmKPExsWy7djPc7q50qXJBi0zmS1mvWtnszjeu4PF
 gcnjybXNTAGMUVw2Kak5mWWpRfp2CVwZi05NZy9YZ13R37WXvYHxpU4XIyeHhICJxIFHTxi7
 GLk4hARWMEr0frzKBpIQEvjCKPHlZSRE4jOjxKW9W1hhOpZ++scOkVjOKHFz32xmuKqWHROg
 nM2MEtce9zCDtLAJ6Eicf3MHzBYR8JG4+HoqC4jNLKAlcePzEUYQW1jAReLY5aVgNouAqsSf
 Aw/A6nkFbCXuTjnPBrFaXqLt+nSwGk4BO4lvWx5C1QhKnJz5BGqmvETz1tnMELaExMEXL5gh
 ehUltsz5DvVCrcTaY2fAXpAQWMkh8axhFhNEwkXiz9nz7BC2sMSr41ugbBmJ05N7WCDsbImd
 U3ZBDS2QmHVyKtBxHEC2tUTfmRyIsKPEwrbp7BBhPokbbwUhzuGTmLRtOjNEmFeio01oAqPK
 LCQPzELywCwkDyxgZF7FKJ5aWpybnlpsnJdarlecmFtcmpeul5yfu4kRmBRO/zv+dQfjilcf
 9Q4xMnEwHmKU4GBWEuHNn1ySLMSbklhZlVqUH19UmpNafIhRmoNFSZyXbYZWspBAemJJanZq
 akFqEUyWiYNTqoHJuPKz+gLTeRGTLUsPSG09Ufglyk2+m8Xlrk3/IYWp2zdaRIvY3l6TfKJt
 nsmj6KS4sOdNa3JW/vFx4d9We9gp/durszUmS6U4mGL3iixJXOIp/9Ex2oZrglfengNRX5xY
 1n7hKDlmM8mVVVG2YaVp/ZRTDX1s5ilPrZeemfG5YPb+JanfDSpUFrops+gvTOCWz/vJZr83
 dmvvQ/3844wLVYQlsl+o6ysLqKY9cIxsmr10rtFGnt8+Ek+/lM9oV3s0U+Phv2NaN7k+56gm
 Vf5oXpwdclLfspf1Rd6GN5NLbv9KF9cqv1fhsk+4vr/Pg+WkE9v/dyKdhoJTHNs/Hv7P9Jvz
 oeqd4ylbJNNKjiqxFGckGmoxFxUnAgAht/pYeQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupnkeLIzCtJLcpLzFFi42I5/e/4Xd0c6dJkg4ZvEhaz3rWzWRzv3cHi
 wOTx5NpmpgDGKD2bovzSklSFjPziElulaEMLIz1DSws9IxNLPUNj81grI1MlfTublNSczLLU
 In27BL2MRaemsxess67o79rL3sD4UqeLkZNDQsBEYumnf+xdjFwcQgJLGSUezJzPDJGQkfh0
 5SM7hC0s8edaFxuILSTwkVHi8gVriIbNjBLN7w6AJdgEdCTOv7kD1iwi4CNx8fVUFhCbWUBL
 4sbnI4wgtrCAi8Sxy0vBbBYBVYk/Bx6A1fMK2ErcnXKeDWKZvETb9elgNZwCdhLftjwEquEA
 WmYrceFeKUS5oMTJmU+gxstLNG+dzQxhS0gcfPEC6n5FiS1zvrNC2LUSr+7vZpzAKDILSfss
 JO2zkLQvYGRexSiSWlqcm55bbKhXnJhbXJqXrpecn7uJERgz24793LyDcd6rj3qHGJk4GA8x
 SnAwK4nw5k8uSRbiTUmsrEotyo8vKs1JLT7EaAr05kRmKdHkfGDU5pXEG5oZmBqamFkamFqa
 GSuJ83oWdCQKCaQnlqRmp6YWpBbB9DFxcEo1MO3YO+WZKXfVhn9fxO9HCB//E1938bWSQ8zt
 Ow9Ufp1gPz2zxmPO3rxmnhXKRysPLfSwanj7b/rzZwd4ExTiV2ToVLDuzFqs/iNz7Rr9oNtK
 6XKWc7rkRBn2+9i83h4vG3DzQanF4bWXeFYVFT7KXt7zWCFnc837W2cUGxv2Xz/4lHHRmz35
 EeIyrXd/s1m5LkucpdcW0vLp0pZtuUds/BT2Hpojdt7+W/elI5eSrvueuHSh/cKp/eqRH26/
 /LPq6twZkwMO87x/8bHMr/W4una9QYDJkqzja27yHNLl33ct/9Tr+6wMFY/M1YxnsGSuNT7U
 rtLzvXz6uYYLc3/6i23c6Hu8PEb5v5ao1CetWrY3SizFGYmGWsxFxYkAGK+/JSIDAAA=
X-CMS-MailID: 20221116171836eucas1p1dfaeb8826ca901f20ede7567ec2623e3
X-Msg-Generator: CA
X-RootMTR: 20221116171836eucas1p1dfaeb8826ca901f20ede7567ec2623e3
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20221116171836eucas1p1dfaeb8826ca901f20ede7567ec2623e3
References: <20221116171455.3401086-1-j.granados@samsung.com>
 <CGME20221116171836eucas1p1dfaeb8826ca901f20ede7567ec2623e3@eucas1p1.samsung.com>
Received-SPF: pass client-ip=210.118.77.11;
 envelope-from=j.granados@samsung.com; helo=mailout1.w1.samsung.com
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

In order to evaluate write amplification factor (WAF) within the storage
stack it is important to know the number of bytes written to the
controller. The existing SMART log value of Data Units Written is too
coarse (given in units of 500 Kb) and so we add the SMART health
information extended from the OCP specification (given in units of bytes)

We add a controller argument (ocp) that toggles on/off the SMART log
extended structure.  To accommodate different vendor specific specifications
like OCP, we add a multiplexing function (nvme_vendor_specific_log) which
will route to the different log functions based on arguments and log ids.
We only return the OCP extended SMART log when the command is 0xC0 and ocp
has been turned on in the args.

Though we add the whole nvme SMART log extended structure, we only populate
the physical_media_units_{read,written}, log_page_version and
log_page_uuid.

Signed-off-by: Joel Granados <j.granados@samsung.com>
---
 docs/system/devices/nvme.rst |  7 +++++
 hw/nvme/ctrl.c               | 55 ++++++++++++++++++++++++++++++++++++
 hw/nvme/nvme.h               |  1 +
 include/block/nvme.h         | 36 +++++++++++++++++++++++
 4 files changed, 99 insertions(+)

diff --git a/docs/system/devices/nvme.rst b/docs/system/devices/nvme.rst
index 30f841ef62..1cc5e52c00 100644
--- a/docs/system/devices/nvme.rst
+++ b/docs/system/devices/nvme.rst
@@ -53,6 +53,13 @@ parameters.
   Vendor ID. Set this to ``on`` to revert to the unallocated Intel ID
   previously used.
 
+``ocp`` (default: ``off``)
+  The Open Compute Project defines the Datacenter NVMe SSD Specification that
+  sits on top of NVMe. It describes additional commands and NVMe behaviors
+  specific for the Datacenter. When this option is ``on`` OCP features such as
+  the SMART / Health information extended log become available in the
+  controller.
+
 Additional Namespaces
 ---------------------
 
diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index bf291f7ffe..c7215a4ed1 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -4455,6 +4455,41 @@ static void nvme_set_blk_stats(NvmeNamespace *ns, struct nvme_stats *stats)
     stats->write_commands += s->nr_ops[BLOCK_ACCT_WRITE];
 }
 
+static uint16_t nvme_ocp_extended_smart_info(NvmeCtrl *n, uint8_t rae,
+                                             uint32_t buf_len, uint64_t off,
+                                             NvmeRequest *req)
+{
+    NvmeNamespace *ns = NULL;
+    NvmeSmartLogExtended smart_l = { 0 };
+    struct nvme_stats stats = { 0 };
+    uint32_t trans_len;
+
+    if (off >= sizeof(smart_l)) {
+        return NVME_INVALID_FIELD | NVME_DNR;
+    }
+
+    /* accumulate all stats from all namespaces */
+    for (int i = 1; i <= NVME_MAX_NAMESPACES; i++) {
+        ns = nvme_ns(n, i);
+        if (ns) {
+            nvme_set_blk_stats(ns, &stats);
+        }
+    }
+
+    smart_l.physical_media_units_written[0] = cpu_to_le32(stats.units_written);
+    smart_l.physical_media_units_read[0] = cpu_to_le32(stats.units_read);
+    smart_l.log_page_version = 0x0003;
+    smart_l.log_page_uuid[0] = 0xA4F2BFEA2810AFC5;
+    smart_l.log_page_uuid[1] = 0xAFD514C97C6F4F9C;
+
+    if (!rae) {
+        nvme_clear_events(n, NVME_AER_TYPE_SMART);
+    }
+
+    trans_len = MIN(sizeof(smart_l) - off, buf_len);
+    return nvme_c2h(n, (uint8_t *) &smart_l + off, trans_len, req);
+}
+
 static uint16_t nvme_smart_info(NvmeCtrl *n, uint8_t rae, uint32_t buf_len,
                                 uint64_t off, NvmeRequest *req)
 {
@@ -4642,6 +4677,23 @@ static uint16_t nvme_cmd_effects(NvmeCtrl *n, uint8_t csi, uint32_t buf_len,
     return nvme_c2h(n, ((uint8_t *)&log) + off, trans_len, req);
 }
 
+static uint16_t nvme_vendor_specific_log(NvmeCtrl *n, uint8_t rae,
+                                         uint32_t buf_len, uint64_t off,
+                                         NvmeRequest *req, uint8_t lid)
+{
+    switch (lid) {
+    case 0xc0:
+        if (n->params.ocp) {
+            return nvme_ocp_extended_smart_info(n, rae, buf_len, off, req);
+        }
+        break;
+        /* add a case for each additional vendor specific log id */
+    }
+
+    trace_pci_nvme_err_invalid_log_page(nvme_cid(req), lid);
+    return NVME_INVALID_FIELD | NVME_DNR;
+}
+
 static uint16_t nvme_get_log(NvmeCtrl *n, NvmeRequest *req)
 {
     NvmeCmd *cmd = &req->cmd;
@@ -4683,6 +4735,8 @@ static uint16_t nvme_get_log(NvmeCtrl *n, NvmeRequest *req)
         return nvme_error_info(n, rae, len, off, req);
     case NVME_LOG_SMART_INFO:
         return nvme_smart_info(n, rae, len, off, req);
+    case NVME_LOG_VENDOR_START...NVME_LOG_VENDOR_END:
+        return nvme_vendor_specific_log(n, rae, len, off, req, lid);
     case NVME_LOG_FW_SLOT_INFO:
         return nvme_fw_log_info(n, len, off, req);
     case NVME_LOG_CHANGED_NSLIST:
@@ -7685,6 +7739,7 @@ static Property nvme_props[] = {
                       params.sriov_max_vi_per_vf, 0),
     DEFINE_PROP_UINT8("sriov_max_vq_per_vf", NvmeCtrl,
                       params.sriov_max_vq_per_vf, 0),
+    DEFINE_PROP_BOOL("ocp", NvmeCtrl, params.ocp, false),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
index 79f5c281c2..d7f486f795 100644
--- a/hw/nvme/nvme.h
+++ b/hw/nvme/nvme.h
@@ -427,6 +427,7 @@ typedef struct NvmeParams {
     uint16_t sriov_vi_flexible;
     uint8_t  sriov_max_vq_per_vf;
     uint8_t  sriov_max_vi_per_vf;
+    bool     ocp;
 } NvmeParams;
 
 typedef struct NvmeCtrl {
diff --git a/include/block/nvme.h b/include/block/nvme.h
index 8027b7126b..a9041604d9 100644
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
+    uint32_t    rsvd116;
+    uint8_t     percent_free_blocks;
+    uint8_t     rsvd121[7];
+    uint16_t    capacity_health;
+    uint8_t     nvme_errata_ver;
+    uint8_t     rsvd131[5];
+    uint64_t    unaligned_io;
+    uint64_t    security_ver_num;
+    uint64_t    total_nuse;
+    uint64_t    plp_start_count[2];
+    uint64_t    endurance_estimate[2];
+    uint64_t    pcie_retraining_count;
+    uint64_t    power_state_change_count;
+    uint8_t     rsvd208[286];
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
+    NVME_LOG_VENDOR_START   = 0xc0,
+    NVME_LOG_VENDOR_END     = 0xff,
 };
 
 typedef struct QEMU_PACKED NvmePSD {
-- 
2.30.2


