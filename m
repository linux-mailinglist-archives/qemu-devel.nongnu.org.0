Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 913EB4DE194
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 20:04:04 +0100 (CET)
Received: from localhost ([::1]:48900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVHtL-0007En-Ld
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 15:04:03 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.maniak@linux.intel.com>)
 id 1nVHlX-0004AV-Sz; Fri, 18 Mar 2022 14:56:02 -0400
Received: from mga11.intel.com ([192.55.52.93]:7179)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.maniak@linux.intel.com>)
 id 1nVHlT-0006dV-4x; Fri, 18 Mar 2022 14:55:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647629755; x=1679165755;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XlTpKduC37mwO2ZGL/59gKzV95W9OXS4clM8MA9wZmg=;
 b=ivqtCg1eKxWLUSAbnlRLEr1MMfCesLXLzWLS0UhB7kxBJvIQfLtGWGoJ
 R7qEX5AajLxe1Ilwbto8WVsrTs3MpYrP6Nk1xHcxGd7NhHtUwnQ10XL4W
 CnucARbds9wUXlmQWi8zUo7MWkoCeDFjbYDxh5hcneNXJzCy7kgMu1gFR
 NOPRUV96P0w7LKsqIGwZ8sUsz6/a08RkDVy73mwJoSFuMt3GU0z07dZ/G
 /W/xgOY++px0qBSwhxjp9qv34PX4T+kNXgnTOs3rVVTDm+OSletjpf8UZ
 82iPuI7xesU7Kev/m0lmu9XDx156qEXds8VioWWMCB/ylIcouLGJ+vFlo g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10290"; a="254772001"
X-IronPort-AV: E=Sophos;i="5.90,192,1643702400"; d="scan'208";a="254772001"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2022 11:55:52 -0700
X-IronPort-AV: E=Sophos;i="5.90,192,1643702400"; d="scan'208";a="499352547"
Received: from lmaniak-dev.elements.local ([10.55.249.72])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2022 11:55:49 -0700
From: Lukasz Maniak <lukasz.maniak@linux.intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 02/12] hw/nvme: Add support for Primary Controller
 Capabilities
Date: Fri, 18 Mar 2022 19:53:41 +0100
Message-Id: <20220318185352.1667375-2-lukasz.maniak@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220318185352.1667375-1-lukasz.maniak@linux.intel.com>
References: <20220318185352.1667375-1-lukasz.maniak@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=192.55.52.93;
 envelope-from=lukasz.maniak@linux.intel.com; helo=mga11.intel.com
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Lukasz Maniak <lukasz.maniak@linux.intel.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Keith Busch <kbusch@kernel.org>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?=C5=81ukasz=20Gieryk?= <lukasz.gieryk@linux.intel.com>,
 Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implementation of Primary Controller Capabilities data
structure (Identify command with CNS value of 14h).

Currently, the command returns only ID of a primary controller.
Handling of remaining fields are added in subsequent patches
implementing virtualization enhancements.

Signed-off-by: Lukasz Maniak <lukasz.maniak@linux.intel.com>
Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c       | 23 ++++++++++++++++++-----
 hw/nvme/nvme.h       |  2 ++
 hw/nvme/trace-events |  1 +
 include/block/nvme.h | 23 +++++++++++++++++++++++
 4 files changed, 44 insertions(+), 5 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 0e1d8d03c87..ea9d5af3545 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -4799,6 +4799,14 @@ static uint16_t nvme_identify_ctrl_list(NvmeCtrl *n, NvmeRequest *req,
     return nvme_c2h(n, (uint8_t *)list, sizeof(list), req);
 }
 
+static uint16_t nvme_identify_pri_ctrl_cap(NvmeCtrl *n, NvmeRequest *req)
+{
+    trace_pci_nvme_identify_pri_ctrl_cap(le16_to_cpu(n->pri_ctrl_cap.cntlid));
+
+    return nvme_c2h(n, (uint8_t *)&n->pri_ctrl_cap,
+                    sizeof(NvmePriCtrlCap), req);
+}
+
 static uint16_t nvme_identify_ns_csi(NvmeCtrl *n, NvmeRequest *req,
                                      bool active)
 {
@@ -5018,6 +5026,8 @@ static uint16_t nvme_identify(NvmeCtrl *n, NvmeRequest *req)
         return nvme_identify_ctrl_list(n, req, true);
     case NVME_ID_CNS_CTRL_LIST:
         return nvme_identify_ctrl_list(n, req, false);
+    case NVME_ID_CNS_PRIMARY_CTRL_CAP:
+        return nvme_identify_pri_ctrl_cap(n, req);
     case NVME_ID_CNS_CS_NS:
         return nvme_identify_ns_csi(n, req, true);
     case NVME_ID_CNS_CS_NS_PRESENT:
@@ -6609,6 +6619,8 @@ static void nvme_check_constraints(NvmeCtrl *n, Error **errp)
 
 static void nvme_init_state(NvmeCtrl *n)
 {
+    NvmePriCtrlCap *cap = &n->pri_ctrl_cap;
+
     /* add one to max_ioqpairs to account for the admin queue pair */
     n->reg_size = pow2ceil(sizeof(NvmeBar) +
                            2 * (n->params.max_ioqpairs + 1) * NVME_DB_SIZE);
@@ -6618,6 +6630,8 @@ static void nvme_init_state(NvmeCtrl *n)
     n->features.temp_thresh_hi = NVME_TEMPERATURE_WARNING;
     n->starttime_ms = qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL);
     n->aer_reqs = g_new0(NvmeRequest *, n->params.aerl + 1);
+
+    cap->cntlid = cpu_to_le16(n->cntlid);
 }
 
 static void nvme_init_cmb(NvmeCtrl *n, PCIDevice *pci_dev)
@@ -6919,15 +6933,14 @@ static void nvme_realize(PCIDevice *pci_dev, Error **errp)
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
index 89ca6e96401..e58bab841e2 100644
--- a/hw/nvme/nvme.h
+++ b/hw/nvme/nvme.h
@@ -477,6 +477,8 @@ typedef struct NvmeCtrl {
         uint32_t                async_config;
         NvmeHostBehaviorSupport hbs;
     } features;
+
+    NvmePriCtrlCap  pri_ctrl_cap;
 } NvmeCtrl;
 
 static inline NvmeNamespace *nvme_ns(NvmeCtrl *n, uint32_t nsid)
diff --git a/hw/nvme/trace-events b/hw/nvme/trace-events
index ff1b4589692..1834b17cf21 100644
--- a/hw/nvme/trace-events
+++ b/hw/nvme/trace-events
@@ -56,6 +56,7 @@ pci_nvme_identify_ctrl(void) "identify controller"
 pci_nvme_identify_ctrl_csi(uint8_t csi) "identify controller, csi=0x%"PRIx8""
 pci_nvme_identify_ns(uint32_t ns) "nsid %"PRIu32""
 pci_nvme_identify_ctrl_list(uint8_t cns, uint16_t cntid) "cns 0x%"PRIx8" cntid %"PRIu16""
+pci_nvme_identify_pri_ctrl_cap(uint16_t cntlid) "identify primary controller capabilities cntlid=%"PRIu16""
 pci_nvme_identify_ns_csi(uint32_t ns, uint8_t csi) "nsid=%"PRIu32", csi=0x%"PRIx8""
 pci_nvme_identify_nslist(uint32_t ns) "nsid %"PRIu32""
 pci_nvme_identify_nslist_csi(uint16_t ns, uint8_t csi) "nsid=%"PRIu16", csi=0x%"PRIx8""
diff --git a/include/block/nvme.h b/include/block/nvme.h
index 3737351cc81..524a04fb94e 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -1033,6 +1033,7 @@ enum NvmeIdCns {
     NVME_ID_CNS_NS_PRESENT            = 0x11,
     NVME_ID_CNS_NS_ATTACHED_CTRL_LIST = 0x12,
     NVME_ID_CNS_CTRL_LIST             = 0x13,
+    NVME_ID_CNS_PRIMARY_CTRL_CAP      = 0x14,
     NVME_ID_CNS_CS_NS_PRESENT_LIST    = 0x1a,
     NVME_ID_CNS_CS_NS_PRESENT         = 0x1b,
     NVME_ID_CNS_IO_COMMAND_SET        = 0x1c,
@@ -1553,6 +1554,27 @@ typedef enum NvmeZoneState {
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
@@ -1588,5 +1610,6 @@ static inline void _nvme_check_size(void)
     QEMU_BUILD_BUG_ON(sizeof(NvmeIdNsDescr) != 4);
     QEMU_BUILD_BUG_ON(sizeof(NvmeZoneDescr) != 64);
     QEMU_BUILD_BUG_ON(sizeof(NvmeDifTuple) != 16);
+    QEMU_BUILD_BUG_ON(sizeof(NvmePriCtrlCap) != 4096);
 }
 #endif
-- 
2.25.1


