Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CFC6453684
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 16:58:10 +0100 (CET)
Received: from localhost ([::1]:47642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mn0qX-0004rV-Dq
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 10:58:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.gieryk@linux.intel.com>)
 id 1mn0ln-0005yJ-Tz; Tue, 16 Nov 2021 10:53:16 -0500
Received: from mga04.intel.com ([192.55.52.120]:64391)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.gieryk@linux.intel.com>)
 id 1mn0lm-0007fn-0i; Tue, 16 Nov 2021 10:53:15 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10169"; a="232438880"
X-IronPort-AV: E=Sophos;i="5.87,239,1631602800"; d="scan'208";a="232438880"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2021 07:53:09 -0800
X-IronPort-AV: E=Sophos;i="5.87,239,1631602800"; d="scan'208";a="454494405"
Received: from lgieryk-lnx.igk.intel.com ([172.22.230.153])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2021 07:53:06 -0800
From: =?UTF-8?q?=C5=81ukasz=20Gieryk?= <lukasz.gieryk@linux.intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 06/15] hw/nvme: Add support for Primary Controller
 Capabilities
Date: Tue, 16 Nov 2021 16:34:37 +0100
Message-Id: <20211116153446.317143-7-lukasz.gieryk@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211116153446.317143-1-lukasz.gieryk@linux.intel.com>
References: <20211116153446.317143-1-lukasz.gieryk@linux.intel.com>
MIME-Version: 1.0
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=192.55.52.120;
 envelope-from=lukasz.gieryk@linux.intel.com; helo=mga04.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org,
 =?UTF-8?q?=C5=81ukasz=20Gieryk?= <lukasz.gieryk@linux.intel.com>,
 Lukasz Maniak <lukasz.maniak@linux.intel.com>,
 Klaus Jensen <its@irrelevant.dk>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Klaus Jensen <k.jensen@samsung.com>,
 Keith Busch <kbusch@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Lukasz Maniak <lukasz.maniak@linux.intel.com>

Implementation of Primary Controller Capabilities data
structure (Identify command with CNS value of 14h).

Currently, the command returns only ID of a primary controller.
Handling of remaining fields are added in subsequent patches
implementing virtualization enhancements.

Signed-off-by: Lukasz Maniak <lukasz.maniak@linux.intel.com>
Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c       | 22 +++++++++++++++++-----
 hw/nvme/nvme.h       |  2 ++
 hw/nvme/trace-events |  1 +
 include/block/nvme.h | 23 +++++++++++++++++++++++
 4 files changed, 43 insertions(+), 5 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 04de63f30e..44734a74f9 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -4538,6 +4538,13 @@ static uint16_t nvme_identify_ctrl_list(NvmeCtrl *n, NvmeRequest *req,
     return nvme_c2h(n, (uint8_t *)list, sizeof(list), req);
 }
 
+static uint16_t nvme_identify_pri_ctrl_cap(NvmeCtrl *n, NvmeRequest *req)
+{
+    trace_pci_nvme_identify_pri_ctrl_cap(le16_to_cpu(n->pri_ctrl_cap.cntlid));
+
+    return nvme_c2h(n, (uint8_t *)&n->pri_ctrl_cap, sizeof(NvmePriCtrlCap), req);
+}
+
 static uint16_t nvme_identify_ns_csi(NvmeCtrl *n, NvmeRequest *req,
                                      bool active)
 {
@@ -4756,6 +4763,8 @@ static uint16_t nvme_identify(NvmeCtrl *n, NvmeRequest *req)
         return nvme_identify_ctrl_list(n, req, true);
     case NVME_ID_CNS_CTRL_LIST:
         return nvme_identify_ctrl_list(n, req, false);
+    case NVME_ID_CNS_PRIMARY_CTRL_CAP:
+        return nvme_identify_pri_ctrl_cap(n, req);
     case NVME_ID_CNS_CS_NS:
         return nvme_identify_ns_csi(n, req, true);
     case NVME_ID_CNS_CS_NS_PRESENT:
@@ -6306,6 +6315,8 @@ static void nvme_check_constraints(NvmeCtrl *n, Error **errp)
 
 static void nvme_init_state(NvmeCtrl *n)
 {
+    NvmePriCtrlCap *cap = &n->pri_ctrl_cap;
+
     /* add one to max_ioqpairs to account for the admin queue pair */
     n->reg_size = pow2ceil(sizeof(NvmeBar) +
                            2 * (n->params.max_ioqpairs + 1) * NVME_DB_SIZE);
@@ -6315,6 +6326,8 @@ static void nvme_init_state(NvmeCtrl *n)
     n->features.temp_thresh_hi = NVME_TEMPERATURE_WARNING;
     n->starttime_ms = qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL);
     n->aer_reqs = g_new0(NvmeRequest *, n->params.aerl + 1);
+
+    cap->cntlid = cpu_to_le16(n->cntlid);
 }
 
 static void nvme_init_cmb(NvmeCtrl *n, PCIDevice *pci_dev)
@@ -6614,15 +6627,14 @@ static void nvme_realize(PCIDevice *pci_dev, Error **errp)
     qbus_init(&n->bus, sizeof(NvmeBus), TYPE_NVME_BUS,
               &pci_dev->qdev, n->parent_obj.qdev.id);
 
-    nvme_init_state(n);
-    if (nvme_init_pci(n, pci_dev, errp)) {
-        return;
-    }
-
     if (nvme_init_subsys(n, errp)) {
         error_propagate(errp, local_err);
         return;
     }
+    nvme_init_state(n);
+    if (nvme_init_pci(n, pci_dev, errp)) {
+        return;
+    }
     nvme_init_ctrl(n, pci_dev);
 
     /* setup a namespace if the controller drive property was given */
diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
index 4c8af34b28..81deb45dfb 100644
--- a/hw/nvme/nvme.h
+++ b/hw/nvme/nvme.h
@@ -461,6 +461,8 @@ typedef struct NvmeCtrl {
         };
         uint32_t    async_config;
     } features;
+
+    NvmePriCtrlCap  pri_ctrl_cap;
 } NvmeCtrl;
 
 static inline NvmeNamespace *nvme_ns(NvmeCtrl *n, uint32_t nsid)
diff --git a/hw/nvme/trace-events b/hw/nvme/trace-events
index ff6cafd520..1014ebceb6 100644
--- a/hw/nvme/trace-events
+++ b/hw/nvme/trace-events
@@ -52,6 +52,7 @@ pci_nvme_identify_ctrl(void) "identify controller"
 pci_nvme_identify_ctrl_csi(uint8_t csi) "identify controller, csi=0x%"PRIx8""
 pci_nvme_identify_ns(uint32_t ns) "nsid %"PRIu32""
 pci_nvme_identify_ctrl_list(uint8_t cns, uint16_t cntid) "cns 0x%"PRIx8" cntid %"PRIu16""
+pci_nvme_identify_pri_ctrl_cap(uint16_t cntlid) "identify primary controller capabilities cntlid=%"PRIu16""
 pci_nvme_identify_ns_csi(uint32_t ns, uint8_t csi) "nsid=%"PRIu32", csi=0x%"PRIx8""
 pci_nvme_identify_nslist(uint32_t ns) "nsid %"PRIu32""
 pci_nvme_identify_nslist_csi(uint16_t ns, uint8_t csi) "nsid=%"PRIu16", csi=0x%"PRIx8""
diff --git a/include/block/nvme.h b/include/block/nvme.h
index e3bd47bf76..f69bd1d14f 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -1017,6 +1017,7 @@ enum NvmeIdCns {
     NVME_ID_CNS_NS_PRESENT            = 0x11,
     NVME_ID_CNS_NS_ATTACHED_CTRL_LIST = 0x12,
     NVME_ID_CNS_CTRL_LIST             = 0x13,
+    NVME_ID_CNS_PRIMARY_CTRL_CAP      = 0x14,
     NVME_ID_CNS_CS_NS_PRESENT_LIST    = 0x1a,
     NVME_ID_CNS_CS_NS_PRESENT         = 0x1b,
     NVME_ID_CNS_IO_COMMAND_SET        = 0x1c,
@@ -1465,6 +1466,27 @@ typedef enum NvmeZoneState {
     NVME_ZONE_STATE_OFFLINE          = 0x0f,
 } NvmeZoneState;
 
+typedef struct QEMU_PACKED NvmePriCtrlCap {
+    uint16_t    cntlid;
+    uint16_t    portid;
+    uint8_t     crt;
+    uint8_t     rsvd5[27];
+    uint32_t    vqfrt;
+    uint32_t    vqrfa;
+    uint16_t    vqrfap;
+    uint16_t    vqprt;
+    uint16_t    vqfrsm;
+    uint16_t    vqgran;
+    uint8_t     rsvd48[16];
+    uint32_t    vifrt;
+    uint32_t    virfa;
+    uint16_t    virfap;
+    uint16_t    viprt;
+    uint16_t    vifrsm;
+    uint16_t    vigran;
+    uint8_t     rsvd80[4016];
+} NvmePriCtrlCap;
+
 static inline void _nvme_check_size(void)
 {
     QEMU_BUILD_BUG_ON(sizeof(NvmeBar) != 4096);
@@ -1497,5 +1519,6 @@ static inline void _nvme_check_size(void)
     QEMU_BUILD_BUG_ON(sizeof(NvmeIdNsDescr) != 4);
     QEMU_BUILD_BUG_ON(sizeof(NvmeZoneDescr) != 64);
     QEMU_BUILD_BUG_ON(sizeof(NvmeDifTuple) != 8);
+    QEMU_BUILD_BUG_ON(sizeof(NvmePriCtrlCap) != 4096);
 }
 #endif
-- 
2.25.1


