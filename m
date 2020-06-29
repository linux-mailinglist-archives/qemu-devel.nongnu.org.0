Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FAC420D0A3
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Jun 2020 20:33:41 +0200 (CEST)
Received: from localhost ([::1]:40526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jpyb5-0007ue-S4
	for lists+qemu-devel@lfdr.de; Mon, 29 Jun 2020 14:33:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1jpyUe-0008H3-9X; Mon, 29 Jun 2020 14:27:00 -0400
Received: from charlie.dont.surf ([128.199.63.193]:45838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1jpyUb-0000Zt-5H; Mon, 29 Jun 2020 14:27:00 -0400
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by charlie.dont.surf (Postfix) with ESMTPSA id 964DDBF7EC;
 Mon, 29 Jun 2020 18:26:54 +0000 (UTC)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-block@nongnu.org
Subject: [PATCH 04/17] hw/block/nvme: add temperature threshold feature
Date: Mon, 29 Jun 2020 20:26:29 +0200
Message-Id: <20200629182642.1170387-5-its@irrelevant.dk>
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

It might seem weird to implement this feature for an emulated device,
but it is mandatory to support and the feature is useful for testing
asynchronous event request support, which will be added in a later
patch.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Acked-by: Keith Busch <kbusch@kernel.org>
Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>
---
 hw/block/nvme.c      | 48 ++++++++++++++++++++++++++++++++++++++++++++
 hw/block/nvme.h      |  1 +
 include/block/nvme.h |  8 +++++++-
 3 files changed, 56 insertions(+), 1 deletion(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index b7037a7d3504..5ca50646369e 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -59,6 +59,9 @@
 #define NVME_DB_SIZE  4
 #define NVME_CMB_BIR 2
 #define NVME_PMR_BIR 2
+#define NVME_TEMPERATURE 0x143
+#define NVME_TEMPERATURE_WARNING 0x157
+#define NVME_TEMPERATURE_CRITICAL 0x175
 
 #define NVME_GUEST_ERR(trace, fmt, ...) \
     do { \
@@ -827,9 +830,31 @@ static uint16_t nvme_get_feature_timestamp(NvmeCtrl *n, NvmeCmd *cmd)
 static uint16_t nvme_get_feature(NvmeCtrl *n, NvmeCmd *cmd, NvmeRequest *req)
 {
     uint32_t dw10 = le32_to_cpu(cmd->cdw10);
+    uint32_t dw11 = le32_to_cpu(cmd->cdw11);
     uint32_t result;
 
     switch (dw10) {
+    case NVME_TEMPERATURE_THRESHOLD:
+        result = 0;
+
+        /*
+         * The controller only implements the Composite Temperature sensor, so
+         * return 0 for all other sensors.
+         */
+        if (NVME_TEMP_TMPSEL(dw11) != NVME_TEMP_TMPSEL_COMPOSITE) {
+            break;
+        }
+
+        switch (NVME_TEMP_THSEL(dw11)) {
+        case NVME_TEMP_THSEL_OVER:
+            result = cpu_to_le16(n->features.temp_thresh_hi);
+            break;
+        case NVME_TEMP_THSEL_UNDER:
+            result = cpu_to_le16(n->features.temp_thresh_low);
+            break;
+        }
+
+        break;
     case NVME_VOLATILE_WRITE_CACHE:
         result = blk_enable_write_cache(n->conf.blk);
         trace_pci_nvme_getfeat_vwcache(result ? "enabled" : "disabled");
@@ -874,6 +899,23 @@ static uint16_t nvme_set_feature(NvmeCtrl *n, NvmeCmd *cmd, NvmeRequest *req)
     uint32_t dw11 = le32_to_cpu(cmd->cdw11);
 
     switch (dw10) {
+    case NVME_TEMPERATURE_THRESHOLD:
+        if (NVME_TEMP_TMPSEL(dw11) != NVME_TEMP_TMPSEL_COMPOSITE) {
+            break;
+        }
+
+        switch (NVME_TEMP_THSEL(dw11)) {
+        case NVME_TEMP_THSEL_OVER:
+            n->features.temp_thresh_hi = NVME_TEMP_TMPTH(dw11);
+            break;
+        case NVME_TEMP_THSEL_UNDER:
+            n->features.temp_thresh_low = NVME_TEMP_TMPTH(dw11);
+            break;
+        default:
+            return NVME_INVALID_FIELD | NVME_DNR;
+        }
+
+        break;
     case NVME_VOLATILE_WRITE_CACHE:
         blk_set_enable_write_cache(n->conf.blk, dw11 & 1);
         break;
@@ -1454,6 +1496,7 @@ static void nvme_init_state(NvmeCtrl *n)
     n->namespaces = g_new0(NvmeNamespace, n->num_namespaces);
     n->sq = g_new0(NvmeSQueue *, n->params.max_ioqpairs + 1);
     n->cq = g_new0(NvmeCQueue *, n->params.max_ioqpairs + 1);
+    n->features.temp_thresh_hi = NVME_TEMPERATURE_WARNING;
 }
 
 static void nvme_init_blk(NvmeCtrl *n, Error **errp)
@@ -1611,6 +1654,11 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
     id->acl = 3;
     id->frmw = 7 << 1;
     id->lpa = 1 << 0;
+
+    /* recommended default value (~70 C) */
+    id->wctemp = cpu_to_le16(NVME_TEMPERATURE_WARNING);
+    id->cctemp = cpu_to_le16(NVME_TEMPERATURE_CRITICAL);
+
     id->sqes = (0x6 << 4) | 0x6;
     id->cqes = (0x4 << 4) | 0x4;
     id->nn = cpu_to_le32(n->num_namespaces);
diff --git a/hw/block/nvme.h b/hw/block/nvme.h
index 1bf5c80ed843..3acde10e1d2a 100644
--- a/hw/block/nvme.h
+++ b/hw/block/nvme.h
@@ -107,6 +107,7 @@ typedef struct NvmeCtrl {
     NvmeSQueue      admin_sq;
     NvmeCQueue      admin_cq;
     NvmeIdCtrl      id_ctrl;
+    NvmeFeatureVal  features;
 } NvmeCtrl;
 
 /* calculate the number of LBAs that the namespace can accomodate */
diff --git a/include/block/nvme.h b/include/block/nvme.h
index 6d1fa6ff2228..bb651d0cbf5a 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -860,7 +860,13 @@ enum NvmeIdCtrlOncs {
 typedef struct NvmeFeatureVal {
     uint32_t    arbitration;
     uint32_t    power_mgmt;
-    uint32_t    temp_thresh;
+    union {
+        struct {
+            uint16_t temp_thresh_hi;
+            uint16_t temp_thresh_low;
+        };
+        uint32_t temp_thresh;
+    };
     uint32_t    err_rec;
     uint32_t    volatile_wc;
     uint32_t    num_queues;
-- 
2.27.0


