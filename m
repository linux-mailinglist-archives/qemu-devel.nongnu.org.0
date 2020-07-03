Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4863C213465
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jul 2020 08:44:48 +0200 (CEST)
Received: from localhost ([::1]:55018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jrFRH-0003s8-8V
	for lists+qemu-devel@lfdr.de; Fri, 03 Jul 2020 02:44:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1jrFIE-00076Y-74; Fri, 03 Jul 2020 02:35:26 -0400
Received: from charlie.dont.surf ([128.199.63.193]:53086)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1jrFIB-00036k-73; Fri, 03 Jul 2020 02:35:25 -0400
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by charlie.dont.surf (Postfix) with ESMTPSA id 335E2BF803;
 Fri,  3 Jul 2020 06:35:01 +0000 (UTC)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-block@nongnu.org
Subject: [PATCH v2 12/18] hw/block/nvme: support the get/set features select
 and save fields
Date: Fri,  3 Jul 2020 08:34:14 +0200
Message-Id: <20200703063420.2241014-13-its@irrelevant.dk>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200703063420.2241014-1-its@irrelevant.dk>
References: <20200703063420.2241014-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=128.199.63.193; envelope-from=its@irrelevant.dk;
 helo=charlie.dont.surf
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/03 01:42:13
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
Cc: Kevin Wolf <kwolf@redhat.com>, Dmitry Fomichev <Dmitry.Fomichev@wdc.com>,
 Klaus Jensen <k.jensen@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 Keith Busch <kbusch@kernel.org>, Javier Gonzalez <javier.gonz@samsung.com>,
 Maxim Levitsky <mlevitsk@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Since the device does not have any persistent state storage, no
features are "saveable" and setting the Save (SV) field in any Set
Features command will result in a Feature Identifier Not Saveable status
code.

Similarly, if the Select (SEL) field is set to request saved values, the
devices will (as it should) return the default values instead.

Since this also introduces "Supported Capabilities", the nsid field is
now also checked for validity wrt. the feature being get/set'ed.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.c       | 95 +++++++++++++++++++++++++++++++++++++------
 hw/block/nvme.h       |  8 ++++
 hw/block/trace-events |  4 +-
 include/block/nvme.h  | 27 +++++++++++-
 4 files changed, 119 insertions(+), 15 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index affb9a967534..9cff0f45dd7e 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -1055,16 +1055,43 @@ static uint16_t nvme_get_feature(NvmeCtrl *n, NvmeCmd *cmd, NvmeRequest *req)
 {
     uint32_t dw10 = le32_to_cpu(cmd->cdw10);
     uint32_t dw11 = le32_to_cpu(cmd->cdw11);
+    uint32_t nsid = le32_to_cpu(cmd->nsid);
     uint32_t result;
     uint8_t fid = NVME_GETSETFEAT_FID(dw10);
+    NvmeGetFeatureSelect sel = NVME_GETFEAT_SELECT(dw10);
     uint16_t iv;
 
-    trace_pci_nvme_getfeat(nvme_cid(req), fid, dw11);
+    trace_pci_nvme_getfeat(nvme_cid(req), fid, sel, dw11);
 
     if (!nvme_feature_support[fid]) {
         return NVME_INVALID_FIELD | NVME_DNR;
     }
 
+    if (nvme_feature_cap[fid] & NVME_FEAT_CAP_NS) {
+        if (!nsid || nsid > n->num_namespaces) {
+            /*
+             * The Reservation Notification Mask and Reservation Persistence
+             * features require a status code of Invalid Field in Command when
+             * NSID is 0xFFFFFFFF. Since the device does not support those
+             * features we can always return Invalid Namespace or Format as we
+             * should do for all other features.
+             */
+            return NVME_INVALID_NSID | NVME_DNR;
+        }
+    }
+
+    switch (sel) {
+    case NVME_GETFEAT_SELECT_CURRENT:
+        break;
+    case NVME_GETFEAT_SELECT_SAVED:
+        /* no features are saveable by the controller; fallthrough */
+    case NVME_GETFEAT_SELECT_DEFAULT:
+        goto defaults;
+    case NVME_GETFEAT_SELECT_CAP:
+        result = cpu_to_le32(nvme_feature_cap[fid]);
+        goto out;
+    }
+
     switch (fid) {
     case NVME_TEMPERATURE_THRESHOLD:
         result = 0;
@@ -1074,22 +1101,45 @@ static uint16_t nvme_get_feature(NvmeCtrl *n, NvmeCmd *cmd, NvmeRequest *req)
          * return 0 for all other sensors.
          */
         if (NVME_TEMP_TMPSEL(dw11) != NVME_TEMP_TMPSEL_COMPOSITE) {
-            break;
+            goto out;
         }
 
         switch (NVME_TEMP_THSEL(dw11)) {
         case NVME_TEMP_THSEL_OVER:
             result = cpu_to_le16(n->features.temp_thresh_hi);
-            break;
+            goto out;
         case NVME_TEMP_THSEL_UNDER:
             result = cpu_to_le16(n->features.temp_thresh_low);
-            break;
+            goto out;
         }
 
-        break;
+        return NVME_INVALID_FIELD | NVME_DNR;
     case NVME_VOLATILE_WRITE_CACHE:
         result = cpu_to_le32(blk_enable_write_cache(n->conf.blk));
         trace_pci_nvme_getfeat_vwcache(result ? "enabled" : "disabled");
+        goto out;
+    case NVME_ASYNCHRONOUS_EVENT_CONF:
+        result = cpu_to_le32(n->features.async_config);
+        goto out;
+    case NVME_TIMESTAMP:
+        return nvme_get_feature_timestamp(n, cmd);
+    default:
+        break;
+    }
+
+defaults:
+    switch (fid) {
+    case NVME_TEMPERATURE_THRESHOLD:
+        result = 0;
+
+        if (NVME_TEMP_TMPSEL(dw11) != NVME_TEMP_TMPSEL_COMPOSITE) {
+            break;
+        }
+
+        if (NVME_TEMP_THSEL(dw11) == NVME_TEMP_THSEL_OVER) {
+            result = cpu_to_le16(NVME_TEMPERATURE_WARNING);
+        }
+
         break;
     case NVME_NUMBER_OF_QUEUES:
         result = cpu_to_le32((n->params.max_ioqpairs - 1) |
@@ -1109,16 +1159,12 @@ static uint16_t nvme_get_feature(NvmeCtrl *n, NvmeCmd *cmd, NvmeRequest *req)
 
         result = cpu_to_le32(result);
         break;
-    case NVME_ASYNCHRONOUS_EVENT_CONF:
-        result = cpu_to_le32(n->features.async_config);
-        break;
-    case NVME_TIMESTAMP:
-        return nvme_get_feature_timestamp(n, cmd);
     default:
         result = cpu_to_le32(nvme_feature_default[fid]);
         break;
     }
 
+out:
     req->cqe.result = result;
     return NVME_SUCCESS;
 }
@@ -1145,14 +1191,37 @@ static uint16_t nvme_set_feature(NvmeCtrl *n, NvmeCmd *cmd, NvmeRequest *req)
 {
     uint32_t dw10 = le32_to_cpu(cmd->cdw10);
     uint32_t dw11 = le32_to_cpu(cmd->cdw11);
+    uint32_t nsid = le32_to_cpu(cmd->nsid);
     uint8_t fid = NVME_GETSETFEAT_FID(dw10);
+    uint8_t save = NVME_SETFEAT_SAVE(dw10);
 
-    trace_pci_nvme_setfeat(nvme_cid(req), fid, dw11);
+    trace_pci_nvme_setfeat(nvme_cid(req), fid, save, dw11);
+
+    if (save) {
+        return NVME_FID_NOT_SAVEABLE | NVME_DNR;
+    }
 
     if (!nvme_feature_support[fid]) {
         return NVME_INVALID_FIELD | NVME_DNR;
     }
 
+    if (nvme_feature_cap[fid] & NVME_FEAT_CAP_NS) {
+        if (!nsid || (nsid != NVME_NSID_BROADCAST &&
+                      nsid > n->num_namespaces)) {
+            return NVME_INVALID_NSID | NVME_DNR;
+        }
+    } else if (nsid && nsid != NVME_NSID_BROADCAST) {
+        if (nsid > n->num_namespaces) {
+            return NVME_INVALID_NSID | NVME_DNR;
+        }
+
+        return NVME_FEAT_NOT_NS_SPEC | NVME_DNR;
+    }
+
+    if (!(nvme_feature_cap[fid] & NVME_FEAT_CAP_CHANGE)) {
+        return NVME_FEAT_NOT_CHANGEABLE | NVME_DNR;
+    }
+
     switch (fid) {
     case NVME_TEMPERATURE_THRESHOLD:
         if (NVME_TEMP_TMPSEL(dw11) != NVME_TEMP_TMPSEL_COMPOSITE) {
@@ -1997,7 +2066,9 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
     id->sqes = (0x6 << 4) | 0x6;
     id->cqes = (0x4 << 4) | 0x4;
     id->nn = cpu_to_le32(n->num_namespaces);
-    id->oncs = cpu_to_le16(NVME_ONCS_WRITE_ZEROS | NVME_ONCS_TIMESTAMP);
+    id->oncs = cpu_to_le16(NVME_ONCS_WRITE_ZEROS | NVME_ONCS_TIMESTAMP |
+                           NVME_ONCS_FEATURES);
+
     id->psd[0].mp = cpu_to_le16(0x9c4);
     id->psd[0].enlat = cpu_to_le32(0x10);
     id->psd[0].exlat = cpu_to_le32(0x4);
diff --git a/hw/block/nvme.h b/hw/block/nvme.h
index 8ad1e3c89cee..450e4294193a 100644
--- a/hw/block/nvme.h
+++ b/hw/block/nvme.h
@@ -87,6 +87,14 @@ typedef struct NvmeFeatureVal {
     uint32_t    async_config;
 } NvmeFeatureVal;
 
+static const uint32_t nvme_feature_cap[0x100] = {
+    [NVME_TEMPERATURE_THRESHOLD]    = NVME_FEAT_CAP_CHANGE,
+    [NVME_VOLATILE_WRITE_CACHE]     = NVME_FEAT_CAP_CHANGE,
+    [NVME_NUMBER_OF_QUEUES]         = NVME_FEAT_CAP_CHANGE,
+    [NVME_ASYNCHRONOUS_EVENT_CONF]  = NVME_FEAT_CAP_CHANGE,
+    [NVME_TIMESTAMP]                = NVME_FEAT_CAP_CHANGE,
+};
+
 static const uint32_t nvme_feature_default[0x100] = {
     [NVME_ARBITRATION]           = NVME_ARB_AB_NOLIMIT,
 };
diff --git a/hw/block/trace-events b/hw/block/trace-events
index 42e62f4649f8..4a4ef34071df 100644
--- a/hw/block/trace-events
+++ b/hw/block/trace-events
@@ -46,8 +46,8 @@ pci_nvme_identify_ctrl(void) "identify controller"
 pci_nvme_identify_ns(uint32_t ns) "nsid %"PRIu32""
 pci_nvme_identify_nslist(uint32_t ns) "nsid %"PRIu32""
 pci_nvme_get_log(uint16_t cid, uint8_t lid, uint8_t lsp, uint8_t rae, uint32_t len, uint64_t off) "cid %"PRIu16" lid 0x%"PRIx8" lsp 0x%"PRIx8" rae 0x%"PRIx8" len %"PRIu32" off %"PRIu64""
-pci_nvme_getfeat(uint16_t cid, uint8_t fid, uint32_t cdw11) "cid %"PRIu16" fid 0x%"PRIx8" cdw11 0x%"PRIx32""
-pci_nvme_setfeat(uint16_t cid, uint8_t fid, uint32_t cdw11) "cid %"PRIu16" fid 0x%"PRIx8" cdw11 0x%"PRIx32""
+pci_nvme_getfeat(uint16_t cid, uint8_t fid, uint8_t sel, uint32_t cdw11) "cid %"PRIu16" fid 0x%"PRIx8" sel 0x%"PRIx8" cdw11 0x%"PRIx32""
+pci_nvme_setfeat(uint16_t cid, uint8_t fid, uint8_t save, uint32_t cdw11) "cid %"PRIu16" fid 0x%"PRIx8" save 0x%"PRIx8" cdw11 0x%"PRIx32""
 pci_nvme_getfeat_vwcache(const char* result) "get feature volatile write cache, result=%s"
 pci_nvme_getfeat_numq(int result) "get feature number of queues, result=%d"
 pci_nvme_setfeat_numq(int reqcq, int reqsq, int gotcq, int gotsq) "requested cq_count=%d sq_count=%d, responding with cq_count=%d sq_count=%d"
diff --git a/include/block/nvme.h b/include/block/nvme.h
index 406648d4cf94..36f7d76b3926 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -663,7 +663,7 @@ enum NvmeStatusCodes {
     NVME_INVALID_QUEUE_DEL      = 0x010c,
     NVME_FID_NOT_SAVEABLE       = 0x010d,
     NVME_FEAT_NOT_CHANGEABLE    = 0x010e,
-    NVME_FID_NOT_NSID_SPEC      = 0x010f,
+    NVME_FEAT_NOT_NS_SPEC       = 0x010f,
     NVME_FW_REQ_SUSYSTEM_RESET  = 0x0110,
     NVME_CONFLICTING_ATTRS      = 0x0180,
     NVME_INVALID_PROT_INFO      = 0x0181,
@@ -906,9 +906,32 @@ enum NvmeFeatureIds {
     NVME_SOFTWARE_PROGRESS_MARKER   = 0x80
 };
 
+typedef enum NvmeFeatureCap {
+    NVME_FEAT_CAP_SAVE      = 1 << 0,
+    NVME_FEAT_CAP_NS        = 1 << 1,
+    NVME_FEAT_CAP_CHANGE    = 1 << 2,
+} NvmeFeatureCap;
+
+typedef enum NvmeGetFeatureSelect {
+    NVME_GETFEAT_SELECT_CURRENT = 0x0,
+    NVME_GETFEAT_SELECT_DEFAULT = 0x1,
+    NVME_GETFEAT_SELECT_SAVED   = 0x2,
+    NVME_GETFEAT_SELECT_CAP     = 0x3,
+} NvmeGetFeatureSelect;
+
 #define NVME_GETSETFEAT_FID_MASK 0xff
 #define NVME_GETSETFEAT_FID(dw10) (dw10 & NVME_GETSETFEAT_FID_MASK)
 
+#define NVME_GETFEAT_SELECT_SHIFT 8
+#define NVME_GETFEAT_SELECT_MASK  0x7
+#define NVME_GETFEAT_SELECT(dw10) \
+    ((dw10 >> NVME_GETFEAT_SELECT_SHIFT) & NVME_GETFEAT_SELECT_MASK)
+
+#define NVME_SETFEAT_SAVE_SHIFT 31
+#define NVME_SETFEAT_SAVE_MASK  0x1
+#define NVME_SETFEAT_SAVE(dw10) \
+    ((dw10 >> NVME_SETFEAT_SAVE_SHIFT) & NVME_SETFEAT_SAVE_MASK)
+
 typedef struct NvmeRangeType {
     uint8_t     type;
     uint8_t     attributes;
@@ -925,6 +948,8 @@ typedef struct NvmeLBAF {
     uint8_t     rp;
 } NvmeLBAF;
 
+#define NVME_NSID_BROADCAST 0xffffffff
+
 typedef struct NvmeIdNs {
     uint64_t    nsze;
     uint64_t    ncap;
-- 
2.27.0


