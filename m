Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B57BA47C1B1
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 15:42:04 +0100 (CET)
Received: from localhost ([::1]:47050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzgL5-0006ci-L8
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 09:42:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.maniak@linux.intel.com>)
 id 1mzgET-0001Gx-47; Tue, 21 Dec 2021 09:35:13 -0500
Received: from mga04.intel.com ([192.55.52.120]:6486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.maniak@linux.intel.com>)
 id 1mzgEP-0002Sy-Et; Tue, 21 Dec 2021 09:35:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640097309; x=1671633309;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3ojbDBB6USVQQnx1otuxYqNl9qkpL/TyPC5tF6zujT4=;
 b=H0Z9A7lGI3hyyXSpL8Zd1k6eqBD+HrqVzXdQGp/vWhQwokVP6MwSsAVr
 8uHVCCm6O4JktarJSDpqu/8b2G8XrI6qR9s6KG6lchgxGf/iWDm908hdP
 dDj5ZVWVblQoSSjkeWgGLsNurST7pYCTTE9f9ezPWUM00Dr0Fzbp6+2kx
 h9sIaHry0Sxjj3l9hrisB/1ohvBbdfm0GZVP3tHNDFNGpEEPScKr0IcVE
 Xh/p9RIZWSIzhzogS9Gk0/Mp4mhXRTmAkjT0ncOsjw3yaYbVUF0RY+zpG
 koLCRADzBwMLiLTmGdKejUMHQrilip7DBg8CdmSjVaiSCo58nIBtOAkM4 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10204"; a="239150877"
X-IronPort-AV: E=Sophos;i="5.88,223,1635231600"; d="scan'208";a="239150877"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2021 06:35:02 -0800
X-IronPort-AV: E=Sophos;i="5.88,223,1635231600"; d="scan'208";a="484429306"
Received: from lmaniak-dev.igk.intel.com ([10.55.249.72])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2021 06:34:55 -0800
From: Lukasz Maniak <lukasz.maniak@linux.intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 07/15] hw/nvme: Add support for Secondary Controller List
Date: Tue, 21 Dec 2021 15:32:38 +0100
Message-Id: <20211221143246.2052050-8-lukasz.maniak@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211221143246.2052050-1-lukasz.maniak@linux.intel.com>
References: <20211221143246.2052050-1-lukasz.maniak@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=192.55.52.120;
 envelope-from=lukasz.maniak@linux.intel.com; helo=mga04.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
 Lukasz Maniak <lukasz.maniak@linux.intel.com>, Keith Busch <kbusch@kernel.org>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
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
index 651e1f2fa2..eaca12df57 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -4550,6 +4550,29 @@ static uint16_t nvme_identify_pri_ctrl_cap(NvmeCtrl *n, NvmeRequest *req)
     return nvme_c2h(n, (uint8_t *)&n->pri_ctrl_cap, sizeof(NvmePriCtrlCap), req);
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
@@ -4770,6 +4793,8 @@ static uint16_t nvme_identify(NvmeCtrl *n, NvmeRequest *req)
         return nvme_identify_ctrl_list(n, req, false);
     case NVME_ID_CNS_PRIMARY_CTRL_CAP:
         return nvme_identify_pri_ctrl_cap(n, req);
+    case NVME_ID_CNS_SECONDARY_CTRL_LIST:
+        return nvme_identify_sec_ctrl_list(n, req);
     case NVME_ID_CNS_CS_NS:
         return nvme_identify_ns_csi(n, req, true);
     case NVME_ID_CNS_CS_NS_PRESENT:
@@ -6321,6 +6346,9 @@ static void nvme_check_constraints(NvmeCtrl *n, Error **errp)
 static void nvme_init_state(NvmeCtrl *n)
 {
     NvmePriCtrlCap *cap = &n->pri_ctrl_cap;
+    NvmeSecCtrlList *list = &n->sec_ctrl_list;
+    NvmeSecCtrlEntry *sctrl;
+    int i;
 
     /* add one to max_ioqpairs to account for the admin queue pair */
     n->reg_size = pow2ceil(sizeof(NvmeBar) +
@@ -6332,6 +6360,13 @@ static void nvme_init_state(NvmeCtrl *n)
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
index 8b5f98c761..e7a54ac572 100644
--- a/hw/nvme/ns.c
+++ b/hw/nvme/ns.c
@@ -511,7 +511,7 @@ static void nvme_ns_realize(DeviceState *dev, Error **errp)
             for (i = 0; i < ARRAY_SIZE(subsys->ctrls); i++) {
                 NvmeCtrl *ctrl = subsys->ctrls[i];
 
-                if (ctrl) {
+                if (ctrl && ctrl != SUBSYS_SLOT_RSVD) {
                     nvme_attach_ns(ctrl, ns);
                 }
             }
diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
index 81deb45dfb..2157a7b95f 100644
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
 
@@ -463,6 +468,7 @@ typedef struct NvmeCtrl {
     } features;
 
     NvmePriCtrlCap  pri_ctrl_cap;
+    NvmeSecCtrlList sec_ctrl_list;
 } NvmeCtrl;
 
 static inline NvmeNamespace *nvme_ns(NvmeCtrl *n, uint32_t nsid)
@@ -497,6 +503,18 @@ static inline uint16_t nvme_cid(NvmeRequest *req)
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
 uint16_t nvme_bounce_data(NvmeCtrl *n, uint8_t *ptr, uint32_t len,
                           NvmeTxDirection dir, NvmeRequest *req);
diff --git a/hw/nvme/subsys.c b/hw/nvme/subsys.c
index fb58d63950..f445ca86c2 100644
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
index 1014ebceb6..dd2aac3418 100644
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
index f69bd1d14f..96595ea8f1 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -1018,6 +1018,7 @@ enum NvmeIdCns {
     NVME_ID_CNS_NS_ATTACHED_CTRL_LIST = 0x12,
     NVME_ID_CNS_CTRL_LIST             = 0x13,
     NVME_ID_CNS_PRIMARY_CTRL_CAP      = 0x14,
+    NVME_ID_CNS_SECONDARY_CTRL_LIST   = 0x15,
     NVME_ID_CNS_CS_NS_PRESENT_LIST    = 0x1a,
     NVME_ID_CNS_CS_NS_PRESENT         = 0x1b,
     NVME_ID_CNS_IO_COMMAND_SET        = 0x1c,
@@ -1487,6 +1488,23 @@ typedef struct QEMU_PACKED NvmePriCtrlCap {
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
@@ -1520,5 +1538,7 @@ static inline void _nvme_check_size(void)
     QEMU_BUILD_BUG_ON(sizeof(NvmeZoneDescr) != 64);
     QEMU_BUILD_BUG_ON(sizeof(NvmeDifTuple) != 8);
     QEMU_BUILD_BUG_ON(sizeof(NvmePriCtrlCap) != 4096);
+    QEMU_BUILD_BUG_ON(sizeof(NvmeSecCtrlEntry) != 32);
+    QEMU_BUILD_BUG_ON(sizeof(NvmeSecCtrlList) != 4096);
 }
 #endif
-- 
2.25.1


