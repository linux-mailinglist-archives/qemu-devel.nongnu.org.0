Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A32D425910
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 19:14:46 +0200 (CEST)
Received: from localhost ([::1]:54158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYWyj-0007f0-El
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 13:14:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.maniak@linux.intel.com>)
 id 1mYWQP-0001Id-Fw; Thu, 07 Oct 2021 12:39:17 -0400
Received: from mga04.intel.com ([192.55.52.120]:55446)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.maniak@linux.intel.com>)
 id 1mYWQM-0000On-1h; Thu, 07 Oct 2021 12:39:17 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10130"; a="225073011"
X-IronPort-AV: E=Sophos;i="5.85,355,1624345200"; d="scan'208";a="225073011"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2021 09:26:06 -0700
X-IronPort-AV: E=Sophos;i="5.85,355,1624345200"; d="scan'208";a="624325895"
Received: from lmaniak-dev.igk.intel.com ([10.55.248.48])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2021 09:26:05 -0700
From: Lukasz Maniak <lukasz.maniak@linux.intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/15] hw/nvme: Implement the Function Level Reset
Date: Thu,  7 Oct 2021 18:24:00 +0200
Message-Id: <20211007162406.1920374-10-lukasz.maniak@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211007162406.1920374-1-lukasz.maniak@linux.intel.com>
References: <20211007162406.1920374-1-lukasz.maniak@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=192.55.52.120;
 envelope-from=lukasz.maniak@linux.intel.com; helo=mga04.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 07 Oct 2021 13:12:41 -0400
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
Cc: Keith Busch <kbusch@kernel.org>,
 =?UTF-8?q?=C5=81ukasz=20Gieryk?= <lukasz.gieryk@linux.intel.com>,
 Klaus Jensen <its@irrelevant.dk>,
 Lukasz Maniak <lukasz.maniak@linux.intel.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Łukasz Gieryk <lukasz.gieryk@linux.intel.com>

This patch implements the FLR, a feature currently not implemented for
the Nvme device, while listed as a mandatory ("shall") in the 1.4 spec.

The implementation reuses FLR-related building blocks defined for the
pci-bridge module, and follows the same logic:
    - FLR capability is advertised in the PCIE config,
    - custom pci_write_config callback detects a write to the trigger
      register and performs the PCI reset,
    - which, eventually, calls the custom dc->reset handler.

Depending on reset type, parts of the state should (or should not) be
cleared. To distinguish the type of reset, an additional parameter is
passed to the reset function.

This patch also enables advertisement of the Power Management PCI
capability. The main reason behind it is to announce the no_soft_reset=1
bit, to signal SR/IOV support where each VF can be reset individually.

The implementation purposedly ignores writes to the PMCS.PS register,
as even such naïve behavior is enough to correctly handle the D3->D0
transition.

It’s worth to note, that the power state transition back to to D3, with
all the corresponding side effects, wasn't and stil isn't handled
properly.

Signed-off-by: Łukasz Gieryk <lukasz.gieryk@linux.intel.com>
---
 hw/nvme/ctrl.c       | 52 ++++++++++++++++++++++++++++++++++++++++----
 hw/nvme/nvme.h       |  5 +++++
 hw/nvme/trace-events |  1 +
 3 files changed, 54 insertions(+), 4 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 9687a7322c..b04cf5eae9 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -5582,7 +5582,7 @@ static void nvme_process_sq(void *opaque)
     }
 }
 
-static void nvme_ctrl_reset(NvmeCtrl *n)
+static void nvme_ctrl_reset(NvmeCtrl *n, NvmeResetType rst)
 {
     NvmeNamespace *ns;
     int i;
@@ -5614,7 +5614,9 @@ static void nvme_ctrl_reset(NvmeCtrl *n)
     }
 
     if (!pci_is_vf(&n->parent_obj) && n->params.sriov_max_vfs) {
-        pcie_sriov_pf_disable_vfs(&n->parent_obj);
+        if (rst != NVME_RESET_CONTROLLER) {
+            pcie_sriov_pf_disable_vfs(&n->parent_obj);
+        }
     }
 
     n->aer_queued = 0;
@@ -5848,7 +5850,7 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
             }
         } else if (!NVME_CC_EN(data) && NVME_CC_EN(cc)) {
             trace_pci_nvme_mmio_stopped();
-            nvme_ctrl_reset(n);
+            nvme_ctrl_reset(n, NVME_RESET_CONTROLLER);
             cc = 0;
             csts &= ~NVME_CSTS_READY;
         }
@@ -6416,6 +6418,28 @@ static void nvme_init_sriov(NvmeCtrl *n, PCIDevice *pci_dev, uint16_t offset,
                               PCI_BASE_ADDRESS_MEM_TYPE_64, bar_size);
 }
 
+static int nvme_add_pm_capability(PCIDevice *pci_dev, uint8_t offset)
+{
+    Error *err = NULL;
+    int ret;
+
+    ret = pci_add_capability(pci_dev, PCI_CAP_ID_PM, offset,
+                             PCI_PM_SIZEOF, &err);
+    if (err) {
+        error_report_err(err);
+        return ret;
+    }
+
+    pci_set_word(pci_dev->config + offset + PCI_PM_PMC,
+                 PCI_PM_CAP_VER_1_2);
+    pci_set_word(pci_dev->config + offset + PCI_PM_CTRL,
+                 PCI_PM_CTRL_NO_SOFT_RESET);
+    pci_set_word(pci_dev->wmask + offset + PCI_PM_CTRL,
+                 PCI_PM_CTRL_STATE_MASK);
+
+    return 0;
+}
+
 static int nvme_init_pci(NvmeCtrl *n, PCIDevice *pci_dev, Error **errp)
 {
     uint8_t *pci_conf = pci_dev->config;
@@ -6437,7 +6461,9 @@ static int nvme_init_pci(NvmeCtrl *n, PCIDevice *pci_dev, Error **errp)
     }
 
     pci_config_set_class(pci_conf, PCI_CLASS_STORAGE_EXPRESS);
+    nvme_add_pm_capability(pci_dev, 0x60);
     pcie_endpoint_cap_init(pci_dev, 0x80);
+    pcie_cap_flr_init(pci_dev);
     if (n->params.sriov_max_vfs) {
         pcie_ari_init(pci_dev, 0x100, 1);
     }
@@ -6686,7 +6712,7 @@ static void nvme_exit(PCIDevice *pci_dev)
     NvmeNamespace *ns;
     int i;
 
-    nvme_ctrl_reset(n);
+    nvme_ctrl_reset(n, NVME_RESET_FUNCTION);
 
     if (n->subsys) {
         for (i = 1; i <= NVME_MAX_NAMESPACES; i++) {
@@ -6785,6 +6811,22 @@ static void nvme_set_smart_warning(Object *obj, Visitor *v, const char *name,
     }
 }
 
+static void nvme_pci_reset(DeviceState *qdev)
+{
+    PCIDevice *pci_dev = PCI_DEVICE(qdev);
+    NvmeCtrl *n = NVME(pci_dev);
+
+    trace_pci_nvme_pci_reset();
+    nvme_ctrl_reset(n, NVME_RESET_FUNCTION);
+}
+
+static void nvme_pci_write_config(PCIDevice *dev, uint32_t address,
+                                  uint32_t val, int len)
+{
+    pci_default_write_config(dev, address, val, len);
+    pcie_cap_flr_write_config(dev, address, val, len);
+}
+
 static const VMStateDescription nvme_vmstate = {
     .name = "nvme",
     .unmigratable = 1,
@@ -6796,6 +6838,7 @@ static void nvme_class_init(ObjectClass *oc, void *data)
     PCIDeviceClass *pc = PCI_DEVICE_CLASS(oc);
 
     pc->realize = nvme_realize;
+    pc->config_write = nvme_pci_write_config;
     pc->exit = nvme_exit;
     pc->class_id = PCI_CLASS_STORAGE_EXPRESS;
     pc->revision = 2;
@@ -6804,6 +6847,7 @@ static void nvme_class_init(ObjectClass *oc, void *data)
     dc->desc = "Non-Volatile Memory Express";
     device_class_set_props(dc, nvme_props);
     dc->vmsd = &nvme_vmstate;
+    dc->reset = nvme_pci_reset;
 }
 
 static void nvme_instance_init(Object *obj)
diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
index fd229f06f0..9fbb0a70b5 100644
--- a/hw/nvme/nvme.h
+++ b/hw/nvme/nvme.h
@@ -467,6 +467,11 @@ typedef struct NvmeCtrl {
     NvmeSecCtrlList sec_ctrl_list;
 } NvmeCtrl;
 
+typedef enum NvmeResetType {
+    NVME_RESET_FUNCTION   = 0,
+    NVME_RESET_CONTROLLER = 1,
+} NvmeResetType;
+
 static inline NvmeNamespace *nvme_ns(NvmeCtrl *n, uint32_t nsid)
 {
     if (!nsid || nsid > NVME_MAX_NAMESPACES) {
diff --git a/hw/nvme/trace-events b/hw/nvme/trace-events
index dd2aac3418..88678fc21e 100644
--- a/hw/nvme/trace-events
+++ b/hw/nvme/trace-events
@@ -105,6 +105,7 @@ pci_nvme_set_descriptor_extension(uint64_t slba, uint32_t zone_idx) "set zone de
 pci_nvme_zd_extension_set(uint32_t zone_idx) "set descriptor extension for zone_idx=%"PRIu32""
 pci_nvme_clear_ns_close(uint32_t state, uint64_t slba) "zone state=%"PRIu32", slba=%"PRIu64" transitioned to Closed state"
 pci_nvme_clear_ns_reset(uint32_t state, uint64_t slba) "zone state=%"PRIu32", slba=%"PRIu64" transitioned to Empty state"
+pci_nvme_pci_reset(void) "PCI Function Level Reset"
 
 # error conditions
 pci_nvme_err_mdts(size_t len) "len %zu"
-- 
2.25.1


