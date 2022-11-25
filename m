Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F5E6386CF
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Nov 2022 10:53:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyVNQ-0000Dn-Gp; Fri, 25 Nov 2022 04:52:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <j.granados@samsung.com>)
 id 1oyVNM-0000CL-68
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 04:52:04 -0500
Received: from mailout1.w1.samsung.com ([210.118.77.11])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <j.granados@samsung.com>)
 id 1oyVNI-0002kR-Qp
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 04:52:03 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20221125095154euoutp016f118f489490c67e778c28640dedfbb6~qyxe7F5Sv0742107421euoutp016
 for <qemu-devel@nongnu.org>; Fri, 25 Nov 2022 09:51:54 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20221125095154euoutp016f118f489490c67e778c28640dedfbb6~qyxe7F5Sv0742107421euoutp016
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1669369914;
 bh=wXbFK6qJqgls1lzy4NyHeze5Dq3/dieLSy85EthRmsk=;
 h=From:To:CC:Subject:Date:In-Reply-To:References:From;
 b=ivb5/nXbewQcwBUGJpX6srUJMNKn5g6R/+fAV1RvNsHXDmr7V0a0L4iW0lrazyIDK
 dBfEwtr1CL+wN+uxFgE9UjhI1tU99Z/N0oDBizv0wGjBQqNHnDF2ycV5PR4Sx5+eVy
 hFOemBRhzKIizGjG6Efv4C1Z6+r22qo67sOu07Wg=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20221125095154eucas1p2bbfaf7d79700cdac02fdd91b111dc8ca~qyxeuZxpX0898908989eucas1p2Y;
 Fri, 25 Nov 2022 09:51:54 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 77.B8.10112.A3090836; Fri, 25
 Nov 2022 09:51:54 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20221125095154eucas1p235a3d40d20f0eb3628ea9ab46bd8cf6e~qyxebr6X30873008730eucas1p2u;
 Fri, 25 Nov 2022 09:51:54 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20221125095154eusmtrp1a088efa6833094d9f6180320fbd9a891~qyxebCy5n2190621906eusmtrp1I;
 Fri, 25 Nov 2022 09:51:54 +0000 (GMT)
X-AuditID: cbfec7f4-d09ff70000002780-f3-6380903a8b80
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 96.72.09026.A3090836; Fri, 25
 Nov 2022 09:51:54 +0000 (GMT)
Received: from CAMSVWEXC02.scsc.local (unknown [106.1.227.72]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20221125095153eusmtip2977e870ee276a2a919f27e7bd0b72b23~qyxeQ_H7f1176011760eusmtip2T;
 Fri, 25 Nov 2022 09:51:53 +0000 (GMT)
Received: from localhost (106.110.32.33) by CAMSVWEXC02.scsc.local
 (2002:6a01:e348::6a01:e348) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 25 Nov 2022 09:51:53 +0000
From: Joel Granados <j.granados@samsung.com>
To: <k.jensen@samsung.com>, <qemu-devel@nongnu.org>, <qemu-block@nongnu.org>
CC: Joel Granados <j.granados@samsung.com>
Subject: [PATCH v4 2/2] nvme: Add physical writes/reads from OCP log
Date: Fri, 25 Nov 2022 10:48:08 +0100
Message-ID: <20221125094808.1856024-3-j.granados@samsung.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221125094808.1856024-1-j.granados@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [106.110.32.33]
X-ClientProxiedBy: CAMSVWEXC02.scsc.local (2002:6a01:e348::6a01:e348) To
 CAMSVWEXC02.scsc.local (2002:6a01:e348::6a01:e348)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrMIsWRmVeSWpSXmKPExsWy7djP87pWExqSDbYdlbCY9a6dzeJ47w4W
 ByaPJ9c2MwUwRnHZpKTmZJalFunbJXBlbD5wmK1gq03FlLcODYyHdbsYOTgkBEwkNj0y6WLk
 4hASWMEocXTpLxYI5wujRM/s2YwQzmdGic+75rJ2MXKCdcx6cJAdIrGcUWLnrsdgCbCqJTcy
 IBKbGSUmT9nMDJJgE9CROP/mDpgtIuAjsWL2WiYQm1lAS+LG5yOMILawgIvEw/7jYDaLgKrE
 qRcv2EHu4xWwlVi0VhZisbxE2/XpYCWcAnYS92bMZgexeQUEJU7OfMICMVJeonnrbGYIW0Li
 4IsXzBC9ihJb5nyHeqBWYm/zAbAHJASWckg0XrwElXCR2N/0GMoWlnh1fAs7hC0jcXpyDwuE
 nS2xc8ouqKEFErNOTmWDhKO1RN+ZHIiwo0TH982MEGE+iRtvBSHO4ZOYtG06M0SYV6KjTWgC
 o8osJA/MQvLALCQPLGBkXsUonlpanJueWmyUl1quV5yYW1yal66XnJ+7iRGYDk7/O/5lB+Py
 Vx/1DjEycTAeYpTgYFYS4RWxa0gW4k1JrKxKLcqPLyrNSS0+xCjNwaIkzss2QytZSCA9sSQ1
 OzW1ILUIJsvEwSnVwCSvHD7PNaSy5ulqKcPz79ImhjP7FE2QDZXZstRM6asZ+0cOYbeP9lwl
 YguT50vUR1XLNPiJ9E8y+qt+wKdg+a2lShuEGHuetzVfVC9Lz99W6XZ+9grHSR9DG/nusjmE
 RVroNXy6t96I23iX5D2nNa5TV/RZn9/9tmH9Qa7IOfOSO3uaVrnEFVnu9NI7dnaFPq9Y0p/b
 B3v23trEyXC9OkDgi/G821877Uq/B3+8Ws2713rdwcM/Np9e9W+O0bFlAkelXmvPlkytkHze
 F/xN4E3k9NptFStXiO5Ic+Jt/rG1Z/bVBWyfA9cUW1fVOS575vpmW1Z8eqSBa/9717ufll7o
 WdQ+K/3D0QfOjUbrwpRYijMSDbWYi4oTAYjV3P92AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupnkeLIzCtJLcpLzFFi42I5/e/4PV2rCQ3JBv9nsFrMetfOZnG8dweL
 A5PHk2ubmQIYo/RsivJLS1IVMvKLS2yVog0tjPQMLS30jEws9QyNzWOtjEyV9O1sUlJzMstS
 i/TtEvQyNh84zFaw1aZiyluHBsbDul2MnBwSAiYSsx4cZO9i5OIQEljKKLHgwkcmiISMxKcr
 H9khbGGJP9e62CCKPgIVdU6F6tjMKLH+zU9GkCo2AR2J82/uMIPYIgI+EitmrwWbxCygJXHj
 8xGwGmEBF4mH/cfBbBYBVYlTL14ADeLg4BWwlVi0VhZimbxE2/XpYCWcAnYS92bMBjtCCKjk
 xcmtYHFeAUGJkzOfsECMl5do3jqbGcKWkDj44gUzxBxFiS1zvrNC2LUSna9Os01gFJmFpH0W
 kvZZSNoXMDKvYhRJLS3OTc8tNtIrTswtLs1L10vOz93ECIyZbcd+btnBuPLVR71DjEwcjIcY
 JTiYlUR4RewakoV4UxIrq1KL8uOLSnNSiw8xmgK9OZFZSjQ5Hxi1eSXxhmYGpoYmZpYGppZm
 xkrivJ4FHYlCAumJJanZqakFqUUwfUwcnFINTO35qRK5TySSZZ6dqy0+PGclt+9K3/JyDiam
 R8fFZjwLUX2ht/RswlX5nxpRHzKE0pm+K6w8lfF/dr7LwlNKJ4oWtztdfnXSwPPZzSCDQt9j
 qdzP2M2lEy4y7X4mEu/3usR/m7TPI/drIVxKS7MMNuqnKgS8DFh6p2HW3L0cvsd4Tx0td56j
 YxHw+cDT62cs119uWdv5pCvrhKtpzr42XfGuu90nttiULX9vaP/504b7vjzTl9/VYg9z5RE8
 bqZ3WHmy7IeWXbWv3gQv7OH5trhvk6YAQ+GBBjbx5tkLG/KKD9VM2fByvqboi7KtfLNkbp5N
 bU7c430y9sGW3RdCkwNPeVpXVzlN/Tu7UKdPSImlOCPRUIu5qDgRAL9mLRAiAwAA
X-CMS-MailID: 20221125095154eucas1p235a3d40d20f0eb3628ea9ab46bd8cf6e
X-Msg-Generator: CA
X-RootMTR: 20221125095154eucas1p235a3d40d20f0eb3628ea9ab46bd8cf6e
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20221125095154eucas1p235a3d40d20f0eb3628ea9ab46bd8cf6e
References: <20221125094808.1856024-1-j.granados@samsung.com>
 <CGME20221125095154eucas1p235a3d40d20f0eb3628ea9ab46bd8cf6e@eucas1p2.samsung.com>
Received-SPF: pass client-ip=210.118.77.11;
 envelope-from=j.granados@samsung.com; helo=mailout1.w1.samsung.com
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 hw/nvme/ctrl.c               | 59 ++++++++++++++++++++++++++++++++++++
 hw/nvme/nvme.h               |  1 +
 include/block/nvme.h         | 36 ++++++++++++++++++++++
 4 files changed, 103 insertions(+)

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
index bf291f7ffe..264d9cb220 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -4455,6 +4455,45 @@ static void nvme_set_blk_stats(NvmeNamespace *ns, struct nvme_stats *stats)
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
+    smart_l.physical_media_units_written[0] = cpu_to_le64(stats.units_written);
+    smart_l.physical_media_units_read[0] = cpu_to_le64(stats.units_read);
+    smart_l.log_page_version = 0x0003;
+
+    static const uint8_t guid[16] = {
+        0xC5, 0xAF, 0x10, 0x28, 0xEA, 0xBF, 0xF2, 0xA4,
+        0x9C, 0x4F, 0x6F, 0x7C, 0xC9, 0x14, 0xD5, 0xAF
+    };
+    memcpy(smart_l.log_page_guid, guid, sizeof(smart_l.log_page_guid));
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
@@ -4642,6 +4681,23 @@ static uint16_t nvme_cmd_effects(NvmeCtrl *n, uint8_t csi, uint32_t buf_len,
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
@@ -4683,6 +4739,8 @@ static uint16_t nvme_get_log(NvmeCtrl *n, NvmeRequest *req)
         return nvme_error_info(n, rae, len, off, req);
     case NVME_LOG_SMART_INFO:
         return nvme_smart_info(n, rae, len, off, req);
+    case NVME_LOG_VENDOR_START...NVME_LOG_VENDOR_END:
+        return nvme_vendor_specific_log(n, rae, len, off, req, lid);
     case NVME_LOG_FW_SLOT_INFO:
         return nvme_fw_log_info(n, len, off, req);
     case NVME_LOG_CHANGED_NSLIST:
@@ -7685,6 +7743,7 @@ static Property nvme_props[] = {
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
index 8027b7126b..fc020abced 100644
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
+    uint64_t    log_page_guid[2];
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


