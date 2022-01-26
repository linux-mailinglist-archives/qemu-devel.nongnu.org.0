Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC83E49D10E
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 18:42:18 +0100 (CET)
Received: from localhost ([::1]:41784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCmJF-0000JX-RY
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 12:42:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.maniak@linux.intel.com>)
 id 1nCltj-00079o-1B; Wed, 26 Jan 2022 12:15:55 -0500
Received: from mga11.intel.com ([192.55.52.93]:54264)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.maniak@linux.intel.com>)
 id 1nCltf-00021M-7Y; Wed, 26 Jan 2022 12:15:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643217351; x=1674753351;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qN736Zn5OLxqMuq1eNgFhpgES4u2/8EfjyqcsnVsjg8=;
 b=NMUTbm0RNBtjuy2ibuNzG3l7bdsyDbE9Y2T9UtC6RMNggFe+5qprv4E3
 1025JgLFvd35s07dFF8iQu4laOrAyJJB3KsxIX/WaaoX8st0GaDks4t+a
 HArix2J1nfnmYCK+Xqswl+VIimHx8Kks9Sv6gsgIb7ffeBJQCxOSHMsq5
 RN8wznm609j06/jdKWJz087fGxTRTirNzoZ8hOgxSJSI/pduOu+vEyy0w
 5ysHiMX+h7xu847YnlvtOesL6YKzzDRgjOghDNnvErdgp7HeTNWXbEou1
 4ByZ0eEGhJdK/R/gS6iCpmvHUUNMZ9DNjPrjHjqOS6Qt1D/7oDQIdVhYz A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10238"; a="244199434"
X-IronPort-AV: E=Sophos;i="5.88,318,1635231600"; d="scan'208";a="244199434"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 09:13:30 -0800
X-IronPort-AV: E=Sophos;i="5.88,318,1635231600"; d="scan'208";a="535254342"
Received: from lmaniak-dev.igk.intel.com ([10.55.249.72])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 09:13:27 -0800
From: Lukasz Maniak <lukasz.maniak@linux.intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 13/15] hw/nvme: Add support for the Virtualization
 Management command
Date: Wed, 26 Jan 2022 18:11:18 +0100
Message-Id: <20220126171120.2939152-14-lukasz.maniak@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220126171120.2939152-1-lukasz.maniak@linux.intel.com>
References: <20220126171120.2939152-1-lukasz.maniak@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=192.55.52.93;
 envelope-from=lukasz.maniak@linux.intel.com; helo=mga11.intel.com
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.155,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_HI=-5,
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
 Lukasz Maniak <lukasz.maniak@linux.intel.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Keith Busch <kbusch@kernel.org>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Łukasz Gieryk <lukasz.gieryk@linux.intel.com>

With the new command one can:
 - assign flexible resources (queues, interrupts) to primary and
   secondary controllers,
 - toggle the online/offline state of given controller.

Signed-off-by: Łukasz Gieryk <lukasz.gieryk@linux.intel.com>
---
 hw/nvme/ctrl.c       | 257 ++++++++++++++++++++++++++++++++++++++++++-
 hw/nvme/nvme.h       |  20 ++++
 hw/nvme/trace-events |   3 +
 include/block/nvme.h |  17 +++
 4 files changed, 295 insertions(+), 2 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 551c8795f2..624db2f9c6 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -188,6 +188,7 @@
 #include "qemu/error-report.h"
 #include "qemu/log.h"
 #include "qemu/units.h"
+#include "qemu/range.h"
 #include "qapi/error.h"
 #include "qapi/visitor.h"
 #include "sysemu/sysemu.h"
@@ -259,6 +260,7 @@ static const uint32_t nvme_cse_acs[256] = {
     [NVME_ADM_CMD_GET_FEATURES]     = NVME_CMD_EFF_CSUPP,
     [NVME_ADM_CMD_ASYNC_EV_REQ]     = NVME_CMD_EFF_CSUPP,
     [NVME_ADM_CMD_NS_ATTACHMENT]    = NVME_CMD_EFF_CSUPP | NVME_CMD_EFF_NIC,
+    [NVME_ADM_CMD_VIRT_MNGMT]       = NVME_CMD_EFF_CSUPP,
     [NVME_ADM_CMD_FORMAT_NVM]       = NVME_CMD_EFF_CSUPP | NVME_CMD_EFF_LBCC,
 };
 
@@ -290,6 +292,7 @@ static const uint32_t nvme_cse_iocs_zoned[256] = {
 };
 
 static void nvme_process_sq(void *opaque);
+static void nvme_ctrl_reset(NvmeCtrl *n, NvmeResetType rst);
 
 static uint16_t nvme_sqid(NvmeRequest *req)
 {
@@ -5541,6 +5544,167 @@ out:
     return status;
 }
 
+static void nvme_get_virt_res_num(NvmeCtrl *n, uint8_t rt, int *num_total,
+                                  int *num_prim, int *num_sec)
+{
+    *num_total = le32_to_cpu(rt ?
+                             n->pri_ctrl_cap.vifrt : n->pri_ctrl_cap.vqfrt);
+    *num_prim = le16_to_cpu(rt ?
+                            n->pri_ctrl_cap.virfap : n->pri_ctrl_cap.vqrfap);
+    *num_sec = le16_to_cpu(rt ? n->pri_ctrl_cap.virfa : n->pri_ctrl_cap.vqrfa);
+}
+
+static uint16_t nvme_assign_virt_res_to_prim(NvmeCtrl *n, NvmeRequest *req,
+                                             uint16_t cntlid, uint8_t rt,
+                                             int nr)
+{
+    int num_total, num_prim, num_sec;
+
+    if (cntlid != n->cntlid) {
+        return NVME_INVALID_CTRL_ID | NVME_DNR;
+    }
+
+    nvme_get_virt_res_num(n, rt, &num_total, &num_prim, &num_sec);
+
+    if (nr > num_total) {
+        return NVME_INVALID_NUM_RESOURCES | NVME_DNR;
+    }
+
+    if (nr > num_total - num_sec) {
+        return NVME_INVALID_RESOURCE_ID | NVME_DNR;
+    }
+
+    if (rt) {
+        n->next_pri_ctrl_cap.virfap = cpu_to_le16(nr);
+    } else {
+        n->next_pri_ctrl_cap.vqrfap = cpu_to_le16(nr);
+    }
+
+    req->cqe.result = cpu_to_le32(nr);
+    return req->status;
+}
+
+static void nvme_update_virt_res(NvmeCtrl *n, NvmeSecCtrlEntry *sctrl,
+                                 uint8_t rt, int nr)
+{
+    int prev_nr, prev_total;
+
+    if (rt) {
+        prev_nr = le16_to_cpu(sctrl->nvi);
+        prev_total = le32_to_cpu(n->pri_ctrl_cap.virfa);
+        sctrl->nvi = cpu_to_le16(nr);
+        n->pri_ctrl_cap.virfa = cpu_to_le32(prev_total + nr - prev_nr);
+    } else {
+        prev_nr = le16_to_cpu(sctrl->nvq);
+        prev_total = le32_to_cpu(n->pri_ctrl_cap.vqrfa);
+        sctrl->nvq = cpu_to_le16(nr);
+        n->pri_ctrl_cap.vqrfa = cpu_to_le32(prev_total + nr - prev_nr);
+    }
+}
+
+static uint16_t nvme_assign_virt_res_to_sec(NvmeCtrl *n, NvmeRequest *req,
+                                            uint16_t cntlid, uint8_t rt, int nr)
+{
+    int num_total, num_prim, num_sec, num_free, diff, limit;
+    NvmeSecCtrlEntry *sctrl;
+
+    sctrl = nvme_sctrl_for_cntlid(n, cntlid);
+    if (!sctrl) {
+        return NVME_INVALID_CTRL_ID | NVME_DNR;
+    }
+
+    if (sctrl->scs) {
+        return NVME_INVALID_SEC_CTRL_STATE | NVME_DNR;
+    }
+
+    limit = le16_to_cpu(rt ? n->pri_ctrl_cap.vifrsm : n->pri_ctrl_cap.vqfrsm);
+    if (nr > limit) {
+        return NVME_INVALID_NUM_RESOURCES | NVME_DNR;
+    }
+
+    nvme_get_virt_res_num(n, rt, &num_total, &num_prim, &num_sec);
+    num_free = num_total - num_prim - num_sec;
+    diff = nr - le16_to_cpu(rt ? sctrl->nvi : sctrl->nvq);
+
+    if (diff > num_free) {
+        return NVME_INVALID_RESOURCE_ID | NVME_DNR;
+    }
+
+    nvme_update_virt_res(n, sctrl, rt, nr);
+    req->cqe.result = cpu_to_le32(nr);
+
+    return req->status;
+}
+
+static uint16_t nvme_virt_set_state(NvmeCtrl *n, uint16_t cntlid, bool online)
+{
+    NvmeCtrl *sn = NULL;
+    NvmeSecCtrlEntry *sctrl;
+    int vf_index;
+
+    sctrl = nvme_sctrl_for_cntlid(n, cntlid);
+    if (!sctrl) {
+        return NVME_INVALID_CTRL_ID | NVME_DNR;
+    }
+
+    if (!pci_is_vf(&n->parent_obj)) {
+        vf_index = le16_to_cpu(sctrl->vfn) - 1;
+        sn = NVME(pcie_sriov_get_vf_at_index(&n->parent_obj, vf_index));
+    }
+
+    if (online) {
+        if (!sctrl->nvi || (le16_to_cpu(sctrl->nvq) < 2) || !sn) {
+            return NVME_INVALID_SEC_CTRL_STATE | NVME_DNR;
+        }
+
+        if (!sctrl->scs) {
+            sctrl->scs = 0x1;
+            nvme_ctrl_reset(sn, NVME_RESET_FUNCTION);
+        }
+    } else {
+        nvme_update_virt_res(n, sctrl, NVME_VIRT_RES_INTERRUPT, 0);
+        nvme_update_virt_res(n, sctrl, NVME_VIRT_RES_QUEUE, 0);
+
+        if (sctrl->scs) {
+            sctrl->scs = 0x0;
+            if (sn) {
+                nvme_ctrl_reset(sn, NVME_RESET_FUNCTION);
+            }
+        }
+    }
+
+    return NVME_SUCCESS;
+}
+
+static uint16_t nvme_virt_mngmt(NvmeCtrl *n, NvmeRequest *req)
+{
+    uint32_t dw10 = le32_to_cpu(req->cmd.cdw10);
+    uint32_t dw11 = le32_to_cpu(req->cmd.cdw11);
+    uint8_t act = dw10 & 0xf;
+    uint8_t rt = (dw10 >> 8) & 0x7;
+    uint16_t cntlid = (dw10 >> 16) & 0xffff;
+    int nr = dw11 & 0xffff;
+
+    trace_pci_nvme_virt_mngmt(nvme_cid(req), act, cntlid, rt ? "VI" : "VQ", nr);
+
+    if (rt != NVME_VIRT_RES_QUEUE && rt != NVME_VIRT_RES_INTERRUPT) {
+        return NVME_INVALID_RESOURCE_ID | NVME_DNR;
+    }
+
+    switch (act) {
+    case NVME_VIRT_MNGMT_ACTION_SEC_ASSIGN:
+        return nvme_assign_virt_res_to_sec(n, req, cntlid, rt, nr);
+    case NVME_VIRT_MNGMT_ACTION_PRM_ALLOC:
+        return nvme_assign_virt_res_to_prim(n, req, cntlid, rt, nr);
+    case NVME_VIRT_MNGMT_ACTION_SEC_ONLINE:
+        return nvme_virt_set_state(n, cntlid, true);
+    case NVME_VIRT_MNGMT_ACTION_SEC_OFFLINE:
+        return nvme_virt_set_state(n, cntlid, false);
+    default:
+        return NVME_INVALID_FIELD | NVME_DNR;
+    }
+}
+
 static uint16_t nvme_admin_cmd(NvmeCtrl *n, NvmeRequest *req)
 {
     trace_pci_nvme_admin_cmd(nvme_cid(req), nvme_sqid(req), req->cmd.opcode,
@@ -5583,6 +5747,8 @@ static uint16_t nvme_admin_cmd(NvmeCtrl *n, NvmeRequest *req)
         return nvme_aer(n, req);
     case NVME_ADM_CMD_NS_ATTACHMENT:
         return nvme_ns_attachment(n, req);
+    case NVME_ADM_CMD_VIRT_MNGMT:
+        return nvme_virt_mngmt(n, req);
     case NVME_ADM_CMD_FORMAT_NVM:
         return nvme_format(n, req);
     default:
@@ -5644,9 +5810,33 @@ static void nvme_update_msixcap_ts(PCIDevice *pci_dev, uint32_t table_size)
                          table_size - 1);
 }
 
+static void nvme_activate_virt_res(NvmeCtrl *n)
+{
+    PCIDevice *pci_dev = &n->parent_obj;
+    NvmePriCtrlCap *cap = &n->pri_ctrl_cap;
+    NvmeSecCtrlEntry *sctrl;
+
+    /* -1 to account for the admin queue */
+    if (pci_is_vf(pci_dev)) {
+        sctrl = nvme_sctrl(n);
+        cap->vqprt = sctrl->nvq;
+        cap->viprt = sctrl->nvi;
+        n->conf_ioqpairs = sctrl->nvq ? le16_to_cpu(sctrl->nvq) - 1 : 0;
+        n->conf_msix_qsize = sctrl->nvi ? le16_to_cpu(sctrl->nvi) : 1;
+    } else {
+        cap->vqrfap = n->next_pri_ctrl_cap.vqrfap;
+        cap->virfap = n->next_pri_ctrl_cap.virfap;
+        n->conf_ioqpairs = le16_to_cpu(cap->vqprt) +
+                           le16_to_cpu(cap->vqrfap) - 1;
+        n->conf_msix_qsize = le16_to_cpu(cap->viprt) +
+                             le16_to_cpu(cap->virfap);
+    }
+}
+
 static void nvme_ctrl_reset(NvmeCtrl *n, NvmeResetType rst)
 {
     PCIDevice *pci_dev = &n->parent_obj;
+    NvmeSecCtrlEntry *sctrl;
     NvmeNamespace *ns;
     int i;
 
@@ -5676,9 +5866,20 @@ static void nvme_ctrl_reset(NvmeCtrl *n, NvmeResetType rst)
         g_free(event);
     }
 
-    if (!pci_is_vf(pci_dev) && n->params.sriov_max_vfs) {
+    if (n->params.sriov_max_vfs) {
+        if (!pci_is_vf(pci_dev)) {
+            for (i = 0; i < n->sec_ctrl_list.numcntl; i++) {
+                sctrl = &n->sec_ctrl_list.sec[i];
+                nvme_virt_set_state(n, le16_to_cpu(sctrl->scid), false);
+            }
+
+            if (rst != NVME_RESET_CONTROLLER) {
+                pcie_sriov_pf_disable_vfs(pci_dev);
+            }
+        }
+
         if (rst != NVME_RESET_CONTROLLER) {
-            pcie_sriov_pf_disable_vfs(pci_dev);
+            nvme_activate_virt_res(n);
         }
     }
 
@@ -5687,6 +5888,13 @@ static void nvme_ctrl_reset(NvmeCtrl *n, NvmeResetType rst)
     n->qs_created = false;
 
     nvme_update_msixcap_ts(pci_dev, n->conf_msix_qsize);
+
+    if (pci_is_vf(pci_dev)) {
+        sctrl = nvme_sctrl(n);
+        stl_le_p(&n->bar.csts, sctrl->scs ? 0 : NVME_CSTS_FAILED);
+    } else {
+        stl_le_p(&n->bar.csts, 0);
+    }
 }
 
 static void nvme_ctrl_shutdown(NvmeCtrl *n)
@@ -5732,7 +5940,15 @@ static int nvme_start_ctrl(NvmeCtrl *n)
     uint64_t acq = ldq_le_p(&n->bar.acq);
     uint32_t page_bits = NVME_CC_MPS(cc) + 12;
     uint32_t page_size = 1 << page_bits;
+    NvmeSecCtrlEntry *sctrl = nvme_sctrl(n);
 
+    if (pci_is_vf(&n->parent_obj) && !sctrl->scs) {
+        trace_pci_nvme_err_startfail_virt_state(le16_to_cpu(sctrl->nvi),
+                                                le16_to_cpu(sctrl->nvq),
+                                                sctrl->scs ? "ONLINE" :
+                                                             "OFFLINE");
+        return -1;
+    }
     if (unlikely(n->cq[0])) {
         trace_pci_nvme_err_startfail_cq();
         return -1;
@@ -6115,6 +6331,12 @@ static uint64_t nvme_mmio_read(void *opaque, hwaddr addr, unsigned size)
         return 0;
     }
 
+    if (pci_is_vf(&n->parent_obj) && !nvme_sctrl(n)->scs &&
+        addr != NVME_REG_CSTS) {
+        trace_pci_nvme_err_ignored_mmio_vf_offline(addr, size);
+        return 0;
+    }
+
     /*
      * When PMRWBM bit 1 is set then read from
      * from PMRSTS should ensure prior writes
@@ -6264,6 +6486,12 @@ static void nvme_mmio_write(void *opaque, hwaddr addr, uint64_t data,
 
     trace_pci_nvme_mmio_write(addr, data, size);
 
+    if (pci_is_vf(&n->parent_obj) && !nvme_sctrl(n)->scs &&
+        addr != NVME_REG_CSTS) {
+        trace_pci_nvme_err_ignored_mmio_vf_offline(addr, size);
+        return;
+    }
+
     if (addr < sizeof(n->bar)) {
         nvme_write_bar(n, addr, data, size);
     } else {
@@ -6998,9 +7226,34 @@ static void nvme_pci_reset(DeviceState *qdev)
     nvme_ctrl_reset(n, NVME_RESET_FUNCTION);
 }
 
+static void nvme_sriov_pre_write_ctrl(PCIDevice *dev, uint32_t address,
+                                      uint32_t val, int len)
+{
+    NvmeCtrl *n = NVME(dev);
+    NvmeSecCtrlEntry *sctrl;
+    uint16_t sriov_cap = dev->exp.sriov_cap;
+    uint32_t off = address - sriov_cap;
+    int i, num_vfs;
+
+    if (!sriov_cap) {
+        return;
+    }
+
+    if (range_covers_byte(off, len, PCI_SRIOV_CTRL)) {
+        if (!(val & PCI_SRIOV_CTRL_VFE)) {
+            num_vfs = pci_get_word(dev->config + sriov_cap + PCI_SRIOV_NUM_VF);
+            for (i = 0; i < num_vfs; i++) {
+                sctrl = &n->sec_ctrl_list.sec[i];
+                nvme_virt_set_state(n, le16_to_cpu(sctrl->scid), false);
+            }
+        }
+    }
+}
+
 static void nvme_pci_write_config(PCIDevice *dev, uint32_t address,
                                   uint32_t val, int len)
 {
+    nvme_sriov_pre_write_ctrl(dev, address, val, len);
     pci_default_write_config(dev, address, val, len);
     pcie_cap_flr_write_config(dev, address, val, len);
 }
diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
index bec56b01dd..b9d2ea65af 100644
--- a/hw/nvme/nvme.h
+++ b/hw/nvme/nvme.h
@@ -325,6 +325,7 @@ static inline const char *nvme_adm_opc_str(uint8_t opc)
     case NVME_ADM_CMD_GET_FEATURES:     return "NVME_ADM_CMD_GET_FEATURES";
     case NVME_ADM_CMD_ASYNC_EV_REQ:     return "NVME_ADM_CMD_ASYNC_EV_REQ";
     case NVME_ADM_CMD_NS_ATTACHMENT:    return "NVME_ADM_CMD_NS_ATTACHMENT";
+    case NVME_ADM_CMD_VIRT_MNGMT:       return "NVME_ADM_CMD_VIRT_MNGMT";
     case NVME_ADM_CMD_FORMAT_NVM:       return "NVME_ADM_CMD_FORMAT_NVM";
     default:                            return "NVME_ADM_CMD_UNKNOWN";
     }
@@ -474,6 +475,10 @@ typedef struct NvmeCtrl {
 
     NvmePriCtrlCap  pri_ctrl_cap;
     NvmeSecCtrlList sec_ctrl_list;
+    struct {
+        uint16_t    vqrfap;
+        uint16_t    virfap;
+    } next_pri_ctrl_cap;    /* These override pri_ctrl_cap after reset */
 } NvmeCtrl;
 
 typedef enum NvmeResetType {
@@ -525,6 +530,21 @@ static inline NvmeSecCtrlEntry *nvme_sctrl(NvmeCtrl *n)
     return NULL;
 }
 
+static inline NvmeSecCtrlEntry *nvme_sctrl_for_cntlid(NvmeCtrl *n,
+                                                      uint16_t cntlid)
+{
+    NvmeSecCtrlList *list = &n->sec_ctrl_list;
+    uint8_t i;
+
+    for (i = 0; i < list->numcntl; i++) {
+        if (le16_to_cpu(list->sec[i].scid) == cntlid) {
+            return &list->sec[i];
+        }
+    }
+
+    return NULL;
+}
+
 void nvme_attach_ns(NvmeCtrl *n, NvmeNamespace *ns);
 uint16_t nvme_bounce_data(NvmeCtrl *n, uint8_t *ptr, uint32_t len,
                           NvmeTxDirection dir, NvmeRequest *req);
diff --git a/hw/nvme/trace-events b/hw/nvme/trace-events
index 88678fc21e..aab70cc5bd 100644
--- a/hw/nvme/trace-events
+++ b/hw/nvme/trace-events
@@ -106,6 +106,7 @@ pci_nvme_zd_extension_set(uint32_t zone_idx) "set descriptor extension for zone_
 pci_nvme_clear_ns_close(uint32_t state, uint64_t slba) "zone state=%"PRIu32", slba=%"PRIu64" transitioned to Closed state"
 pci_nvme_clear_ns_reset(uint32_t state, uint64_t slba) "zone state=%"PRIu32", slba=%"PRIu64" transitioned to Empty state"
 pci_nvme_pci_reset(void) "PCI Function Level Reset"
+pci_nvme_virt_mngmt(uint16_t cid, uint16_t act, uint16_t cntlid, const char* rt, uint16_t nr) "cid %"PRIu16", act=0x%"PRIx16", ctrlid=%"PRIu16" %s nr=%"PRIu16""
 
 # error conditions
 pci_nvme_err_mdts(size_t len) "len %zu"
@@ -175,7 +176,9 @@ pci_nvme_err_startfail_asqent_sz_zero(void) "nvme_start_ctrl failed because the
 pci_nvme_err_startfail_acqent_sz_zero(void) "nvme_start_ctrl failed because the admin completion queue size is zero"
 pci_nvme_err_startfail_zasl_too_small(uint32_t zasl, uint32_t pagesz) "nvme_start_ctrl failed because zone append size limit %"PRIu32" is too small, needs to be >= %"PRIu32""
 pci_nvme_err_startfail(void) "setting controller enable bit failed"
+pci_nvme_err_startfail_virt_state(uint16_t vq, uint16_t vi, const char *state) "nvme_start_ctrl failed due to ctrl state: vi=%u vq=%u %s"
 pci_nvme_err_invalid_mgmt_action(uint8_t action) "action=0x%"PRIx8""
+pci_nvme_err_ignored_mmio_vf_offline(uint64_t addr, unsigned size) "addr 0x%"PRIx64" size %d"
 
 # undefined behavior
 pci_nvme_ub_mmiowr_misaligned32(uint64_t offset) "MMIO write not 32-bit aligned, offset=0x%"PRIx64""
diff --git a/include/block/nvme.h b/include/block/nvme.h
index 26672d0a31..6ba242a386 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -595,6 +595,7 @@ enum NvmeAdminCommands {
     NVME_ADM_CMD_ACTIVATE_FW    = 0x10,
     NVME_ADM_CMD_DOWNLOAD_FW    = 0x11,
     NVME_ADM_CMD_NS_ATTACHMENT  = 0x15,
+    NVME_ADM_CMD_VIRT_MNGMT     = 0x1c,
     NVME_ADM_CMD_FORMAT_NVM     = 0x80,
     NVME_ADM_CMD_SECURITY_SEND  = 0x81,
     NVME_ADM_CMD_SECURITY_RECV  = 0x82,
@@ -886,6 +887,10 @@ enum NvmeStatusCodes {
     NVME_NS_PRIVATE             = 0x0119,
     NVME_NS_NOT_ATTACHED        = 0x011a,
     NVME_NS_CTRL_LIST_INVALID   = 0x011c,
+    NVME_INVALID_CTRL_ID        = 0x011f,
+    NVME_INVALID_SEC_CTRL_STATE = 0x0120,
+    NVME_INVALID_NUM_RESOURCES  = 0x0121,
+    NVME_INVALID_RESOURCE_ID    = 0x0122,
     NVME_CONFLICTING_ATTRS      = 0x0180,
     NVME_INVALID_PROT_INFO      = 0x0181,
     NVME_WRITE_TO_RO            = 0x0182,
@@ -1510,6 +1515,18 @@ typedef struct QEMU_PACKED NvmeSecCtrlList {
     NvmeSecCtrlEntry    sec[127];
 } NvmeSecCtrlList;
 
+typedef enum NvmeVirtMngmtAction {
+    NVME_VIRT_MNGMT_ACTION_PRM_ALLOC    = 0x01,
+    NVME_VIRT_MNGMT_ACTION_SEC_OFFLINE  = 0x07,
+    NVME_VIRT_MNGMT_ACTION_SEC_ASSIGN   = 0x08,
+    NVME_VIRT_MNGMT_ACTION_SEC_ONLINE   = 0x09,
+} NvmeVirtMngmtAction;
+
+typedef enum NvmeVirtualResourceType {
+    NVME_VIRT_RES_QUEUE         = 0x00,
+    NVME_VIRT_RES_INTERRUPT     = 0x01,
+} NvmeVirtualResourceType;
+
 static inline void _nvme_check_size(void)
 {
     QEMU_BUILD_BUG_ON(sizeof(NvmeBar) != 4096);
-- 
2.25.1


