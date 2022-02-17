Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 629344BA79C
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 19:00:04 +0100 (CET)
Received: from localhost ([::1]:46678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKl4V-0005FK-FG
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 13:00:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.maniak@linux.intel.com>)
 id 1nKksE-00021s-Me; Thu, 17 Feb 2022 12:47:22 -0500
Received: from mga12.intel.com ([192.55.52.136]:31716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.maniak@linux.intel.com>)
 id 1nKksC-0007He-2H; Thu, 17 Feb 2022 12:47:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645120040; x=1676656040;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=S79o7Jvt5mjL3uNyzvuo5bQCDm94+L9bzz0CdkO/r/4=;
 b=CQ4Mu9XKqFkumScyMbe5GB2uYye+ZNntCZwa7sxOZEto3jOVCYi5LDFr
 9gHLZU9JEGDNh0XBcBCgtcCzIXritZNXAHDA3X9dYI6F5fIaFdIGGpyZl
 DSIadwz3aCdzm37mpPx3Q1rhUvix+AiCpIWeijLkW7R2FX18PpSTGaEuy
 R933O+s0DMc+JTY6CknpJyr6x903c1sS258WWTnuoOjxX3sTAXOJDHFfG
 C7utpxQGj4AMuvH5qGHSR3yMd7DixcPwT839n9P7sxACXbSokC5paTmK3
 HbDQWrDN2B7gX9bRLjMZ+oF2x/ofyzPWlH7LIPTrfo7JBcuFbaWw3eMv/ w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10261"; a="230894079"
X-IronPort-AV: E=Sophos;i="5.88,376,1635231600"; d="scan'208";a="230894079"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 09:47:04 -0800
X-IronPort-AV: E=Sophos;i="5.88,376,1635231600"; d="scan'208";a="545746135"
Received: from lmaniak-dev.igk.intel.com ([10.55.249.72])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 09:47:01 -0800
From: Lukasz Maniak <lukasz.maniak@linux.intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 07/15] hw/nvme: Add support for Secondary Controller List
Date: Thu, 17 Feb 2022 18:44:56 +0100
Message-Id: <20220217174504.1051716-8-lukasz.maniak@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220217174504.1051716-1-lukasz.maniak@linux.intel.com>
References: <20220217174504.1051716-1-lukasz.maniak@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=192.55.52.136;
 envelope-from=lukasz.maniak@linux.intel.com; helo=mga12.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_NONE=0.001,
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
 qemu-block@nongnu.org,
 =?UTF-8?q?=C5=81ukasz=20Gieryk?= <lukasz.gieryk@linux.intel.com>,
 Lukasz Maniak <lukasz.maniak@linux.intel.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Keith Busch <kbusch@kernel.org>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce handling for Secondary Controller List (Identify command with
CNS value of 15h).

Secondary controller ids are unique in the subsystem, hence they are
reserved by it upon initialization of the primary controller to the
number of sriov_max_vfs.

ID reservation requires the addition of an intermediate controller slot
state, so the reserved controller has the address 0xFFFF.
A secondary controller is in the reserved state when it has no virtual
function assigned, but its primary controller is realized.
Secondary controller reservations are released to NULL when its primary
controller is unregistered.

Signed-off-by: Lukasz Maniak <lukasz.maniak@linux.intel.com>
---
 hw/nvme/ctrl.c       | 35 +++++++++++++++++++++
 hw/nvme/ns.c         |  2 +-
 hw/nvme/nvme.h       | 18 +++++++++++
 hw/nvme/subsys.c     | 75 ++++++++++++++++++++++++++++++++++++++------
 hw/nvme/trace-events |  1 +
 include/block/nvme.h | 20 ++++++++++++
 6 files changed, 141 insertions(+), 10 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 0bd55948ce1..05acd681656 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -4705,6 +4705,29 @@ static uint16_t nvme_identify_pri_ctrl_cap(NvmeCtrl *n, NvmeRequest *req)
                     sizeof(NvmePriCtrlCap), req);
 }
 
+static uint16_t nvme_identify_sec_ctrl_list(NvmeCtrl *n, NvmeRequest *req)
+{
+    NvmeIdentify *c = (NvmeIdentify *)&req->cmd;
+    uint16_t pri_ctrl_id = le16_to_cpu(n->pri_ctrl_cap.cntlid);
+    uint16_t min_id = le16_to_cpu(c->ctrlid);
+    uint8_t num_sec_ctrl = n->sec_ctrl_list.numcntl;
+    NvmeSecCtrlList list = {0};
+    uint8_t i;
+
+    for (i = 0; i < num_sec_ctrl; i++) {
+        if (n->sec_ctrl_list.sec[i].scid >= min_id) {
+            list.numcntl = num_sec_ctrl - i;
+            memcpy(&list.sec, n->sec_ctrl_list.sec + i,
+                   list.numcntl * sizeof(NvmeSecCtrlEntry));
+            break;
+        }
+    }
+
+    trace_pci_nvme_identify_sec_ctrl_list(pri_ctrl_id, list.numcntl);
+
+    return nvme_c2h(n, (uint8_t *)&list, sizeof(list), req);
+}
+
 static uint16_t nvme_identify_ns_csi(NvmeCtrl *n, NvmeRequest *req,
                                      bool active)
 {
@@ -4925,6 +4948,8 @@ static uint16_t nvme_identify(NvmeCtrl *n, NvmeRequest *req)
         return nvme_identify_ctrl_list(n, req, false);
     case NVME_ID_CNS_PRIMARY_CTRL_CAP:
         return nvme_identify_pri_ctrl_cap(n, req);
+    case NVME_ID_CNS_SECONDARY_CTRL_LIST:
+        return nvme_identify_sec_ctrl_list(n, req);
     case NVME_ID_CNS_CS_NS:
         return nvme_identify_ns_csi(n, req, true);
     case NVME_ID_CNS_CS_NS_PRESENT:
@@ -6476,6 +6501,9 @@ static void nvme_check_constraints(NvmeCtrl *n, Error **errp)
 static void nvme_init_state(NvmeCtrl *n)
 {
     NvmePriCtrlCap *cap = &n->pri_ctrl_cap;
+    NvmeSecCtrlList *list = &n->sec_ctrl_list;
+    NvmeSecCtrlEntry *sctrl;
+    int i;
 
     /* add one to max_ioqpairs to account for the admin queue pair */
     n->reg_size = pow2ceil(sizeof(NvmeBar) +
@@ -6487,6 +6515,13 @@ static void nvme_init_state(NvmeCtrl *n)
     n->starttime_ms = qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL);
     n->aer_reqs = g_new0(NvmeRequest *, n->params.aerl + 1);
 
+    list->numcntl = cpu_to_le16(n->params.sriov_max_vfs);
+    for (i = 0; i < n->params.sriov_max_vfs; i++) {
+        sctrl = &list->sec[i];
+        sctrl->pcid = cpu_to_le16(n->cntlid);
+        sctrl->vfn = cpu_to_le16(i + 1);
+    }
+
     cap->cntlid = cpu_to_le16(n->cntlid);
 }
 
diff --git a/hw/nvme/ns.c b/hw/nvme/ns.c
index ee673f1a5be..d42fba117f1 100644
--- a/hw/nvme/ns.c
+++ b/hw/nvme/ns.c
@@ -567,7 +567,7 @@ static void nvme_ns_realize(DeviceState *dev, Error **errp)
             for (i = 0; i < ARRAY_SIZE(subsys->ctrls); i++) {
                 NvmeCtrl *ctrl = subsys->ctrls[i];
 
-                if (ctrl) {
+                if (ctrl && ctrl != SUBSYS_SLOT_RSVD) {
                     nvme_attach_ns(ctrl, ns);
                 }
             }
diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
index 2db48eb25c9..f4494e5236f 100644
--- a/hw/nvme/nvme.h
+++ b/hw/nvme/nvme.h
@@ -43,6 +43,7 @@ typedef struct NvmeBus {
 #define TYPE_NVME_SUBSYS "nvme-subsys"
 #define NVME_SUBSYS(obj) \
     OBJECT_CHECK(NvmeSubsystem, (obj), TYPE_NVME_SUBSYS)
+#define SUBSYS_SLOT_RSVD (void *)0xFFFF
 
 typedef struct NvmeSubsystem {
     DeviceState parent_obj;
@@ -67,6 +68,10 @@ static inline NvmeCtrl *nvme_subsys_ctrl(NvmeSubsystem *subsys,
         return NULL;
     }
 
+    if (subsys->ctrls[cntlid] == SUBSYS_SLOT_RSVD) {
+        return NULL;
+    }
+
     return subsys->ctrls[cntlid];
 }
 
@@ -473,6 +478,7 @@ typedef struct NvmeCtrl {
     } features;
 
     NvmePriCtrlCap  pri_ctrl_cap;
+    NvmeSecCtrlList sec_ctrl_list;
 } NvmeCtrl;
 
 static inline NvmeNamespace *nvme_ns(NvmeCtrl *n, uint32_t nsid)
@@ -507,6 +513,18 @@ static inline uint16_t nvme_cid(NvmeRequest *req)
     return le16_to_cpu(req->cqe.cid);
 }
 
+static inline NvmeSecCtrlEntry *nvme_sctrl(NvmeCtrl *n)
+{
+    PCIDevice *pci_dev = &n->parent_obj;
+    NvmeCtrl *pf = NVME(pcie_sriov_get_pf(pci_dev));
+
+    if (pci_is_vf(pci_dev)) {
+        return &pf->sec_ctrl_list.sec[pcie_sriov_vf_number(pci_dev)];
+    }
+
+    return NULL;
+}
+
 void nvme_attach_ns(NvmeCtrl *n, NvmeNamespace *ns);
 uint16_t nvme_bounce_data(NvmeCtrl *n, void *ptr, uint32_t len,
                           NvmeTxDirection dir, NvmeRequest *req);
diff --git a/hw/nvme/subsys.c b/hw/nvme/subsys.c
index fb58d639504..f445ca86c25 100644
--- a/hw/nvme/subsys.c
+++ b/hw/nvme/subsys.c
@@ -11,20 +11,71 @@
 
 #include "nvme.h"
 
-int nvme_subsys_register_ctrl(NvmeCtrl *n, Error **errp)
+static int nvme_subsys_reserve_cntlids(NvmeCtrl *n, int start, int num)
 {
     NvmeSubsystem *subsys = n->subsys;
-    int cntlid, nsid;
+    NvmeSecCtrlList *list = &n->sec_ctrl_list;
+    NvmeSecCtrlEntry *sctrl;
+    int i, cnt = 0;
+
+    for (i = start; i < ARRAY_SIZE(subsys->ctrls) && cnt < num; i++) {
+        if (!subsys->ctrls[i]) {
+            sctrl = &list->sec[cnt];
+            sctrl->scid = cpu_to_le16(i);
+            subsys->ctrls[i] = SUBSYS_SLOT_RSVD;
+            cnt++;
+        }
+    }
+
+    return cnt;
+}
 
-    for (cntlid = 0; cntlid < ARRAY_SIZE(subsys->ctrls); cntlid++) {
-        if (!subsys->ctrls[cntlid]) {
-            break;
+static void nvme_subsys_unreserve_cntlids(NvmeCtrl *n)
+{
+    NvmeSubsystem *subsys = n->subsys;
+    NvmeSecCtrlList *list = &n->sec_ctrl_list;
+    NvmeSecCtrlEntry *sctrl;
+    int i, cntlid;
+
+    for (i = 0; i < n->params.sriov_max_vfs; i++) {
+        sctrl = &list->sec[i];
+        cntlid = le16_to_cpu(sctrl->scid);
+
+        if (cntlid) {
+            assert(subsys->ctrls[cntlid] == SUBSYS_SLOT_RSVD);
+            subsys->ctrls[cntlid] = NULL;
+            sctrl->scid = 0;
         }
     }
+}
+
+int nvme_subsys_register_ctrl(NvmeCtrl *n, Error **errp)
+{
+    NvmeSubsystem *subsys = n->subsys;
+    NvmeSecCtrlEntry *sctrl = nvme_sctrl(n);
+    int cntlid, nsid, num_rsvd, num_vfs = n->params.sriov_max_vfs;
+
+    if (pci_is_vf(&n->parent_obj)) {
+        cntlid = le16_to_cpu(sctrl->scid);
+    } else {
+        for (cntlid = 0; cntlid < ARRAY_SIZE(subsys->ctrls); cntlid++) {
+            if (!subsys->ctrls[cntlid]) {
+                break;
+            }
+        }
 
-    if (cntlid == ARRAY_SIZE(subsys->ctrls)) {
-        error_setg(errp, "no more free controller id");
-        return -1;
+        if (cntlid == ARRAY_SIZE(subsys->ctrls)) {
+            error_setg(errp, "no more free controller id");
+            return -1;
+        }
+
+        num_rsvd = nvme_subsys_reserve_cntlids(n, cntlid + 1, num_vfs);
+        if (num_rsvd != num_vfs) {
+            nvme_subsys_unreserve_cntlids(n);
+            error_setg(errp,
+                       "no more free controller ids for secondary controllers");
+            return -1;
+        }
     }
 
     subsys->ctrls[cntlid] = n;
@@ -41,7 +92,13 @@ int nvme_subsys_register_ctrl(NvmeCtrl *n, Error **errp)
 
 void nvme_subsys_unregister_ctrl(NvmeSubsystem *subsys, NvmeCtrl *n)
 {
-    subsys->ctrls[n->cntlid] = NULL;
+    if (pci_is_vf(&n->parent_obj)) {
+        subsys->ctrls[n->cntlid] = SUBSYS_SLOT_RSVD;
+    } else {
+        subsys->ctrls[n->cntlid] = NULL;
+        nvme_subsys_unreserve_cntlids(n);
+    }
+
     n->cntlid = -1;
 }
 
diff --git a/hw/nvme/trace-events b/hw/nvme/trace-events
index bfc09dddc62..12afb8478a4 100644
--- a/hw/nvme/trace-events
+++ b/hw/nvme/trace-events
@@ -53,6 +53,7 @@ pci_nvme_identify_ctrl_csi(uint8_t csi) "identify controller, csi=0x%"PRIx8""
 pci_nvme_identify_ns(uint32_t ns) "nsid %"PRIu32""
 pci_nvme_identify_ctrl_list(uint8_t cns, uint16_t cntid) "cns 0x%"PRIx8" cntid %"PRIu16""
 pci_nvme_identify_pri_ctrl_cap(uint16_t cntlid) "identify primary controller capabilities cntlid=%"PRIu16""
+pci_nvme_identify_sec_ctrl_list(uint16_t cntlid, uint8_t numcntl) "identify secondary controller list cntlid=%"PRIu16" numcntl=%"PRIu8""
 pci_nvme_identify_ns_csi(uint32_t ns, uint8_t csi) "nsid=%"PRIu32", csi=0x%"PRIx8""
 pci_nvme_identify_nslist(uint32_t ns) "nsid %"PRIu32""
 pci_nvme_identify_nslist_csi(uint16_t ns, uint8_t csi) "nsid=%"PRIu16", csi=0x%"PRIx8""
diff --git a/include/block/nvme.h b/include/block/nvme.h
index 73666cc900a..fde4ddfceec 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -1020,6 +1020,7 @@ enum NvmeIdCns {
     NVME_ID_CNS_NS_ATTACHED_CTRL_LIST = 0x12,
     NVME_ID_CNS_CTRL_LIST             = 0x13,
     NVME_ID_CNS_PRIMARY_CTRL_CAP      = 0x14,
+    NVME_ID_CNS_SECONDARY_CTRL_LIST   = 0x15,
     NVME_ID_CNS_CS_NS_PRESENT_LIST    = 0x1a,
     NVME_ID_CNS_CS_NS_PRESENT         = 0x1b,
     NVME_ID_CNS_IO_COMMAND_SET        = 0x1c,
@@ -1525,6 +1526,23 @@ typedef struct QEMU_PACKED NvmePriCtrlCap {
     uint8_t     rsvd80[4016];
 } NvmePriCtrlCap;
 
+typedef struct QEMU_PACKED NvmeSecCtrlEntry {
+    uint16_t    scid;
+    uint16_t    pcid;
+    uint8_t     scs;
+    uint8_t     rsvd5[3];
+    uint16_t    vfn;
+    uint16_t    nvq;
+    uint16_t    nvi;
+    uint8_t     rsvd14[18];
+} NvmeSecCtrlEntry;
+
+typedef struct QEMU_PACKED NvmeSecCtrlList {
+    uint8_t             numcntl;
+    uint8_t             rsvd1[31];
+    NvmeSecCtrlEntry    sec[127];
+} NvmeSecCtrlList;
+
 static inline void _nvme_check_size(void)
 {
     QEMU_BUILD_BUG_ON(sizeof(NvmeBar) != 4096);
@@ -1558,5 +1576,7 @@ static inline void _nvme_check_size(void)
     QEMU_BUILD_BUG_ON(sizeof(NvmeZoneDescr) != 64);
     QEMU_BUILD_BUG_ON(sizeof(NvmeDifTuple) != 8);
     QEMU_BUILD_BUG_ON(sizeof(NvmePriCtrlCap) != 4096);
+    QEMU_BUILD_BUG_ON(sizeof(NvmeSecCtrlEntry) != 32);
+    QEMU_BUILD_BUG_ON(sizeof(NvmeSecCtrlList) != 4096);
 }
 #endif
-- 
2.25.1


