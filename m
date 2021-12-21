Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F1DD47C19F
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 15:36:28 +0100 (CET)
Received: from localhost ([::1]:58392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzgFf-0003YN-Bm
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 09:36:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.maniak@linux.intel.com>)
 id 1mzgE5-0000TW-Ly; Tue, 21 Dec 2021 09:34:49 -0500
Received: from mga17.intel.com ([192.55.52.151]:6387)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.maniak@linux.intel.com>)
 id 1mzgE3-0002Pf-K9; Tue, 21 Dec 2021 09:34:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640097287; x=1671633287;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bv7crI+TEZlV0R4WGdApS1sj1TM3wmISgS7dJLpahRs=;
 b=gxrNEhFJpsrqJFXfCL13Pbs8zQb97iBhBsd0oCBq8HSV44q6oc8uNf1M
 NUdiOCNVrf6RP4Lv+FRr2MSivu46mat073uFS1HEdejQjJCMWvD7yyJFO
 +2z+/0MGxMjRPTiTVXR6Sc+oH8ohSMMWY4NA06pvl7kT9EexsIOjkYsxQ
 pymCOkllyod1VgEHpggz8oRIETHPU8x3JRMfdHxt5VieLDEKFCtiUmHXf
 2GqvI/zcVOeJ0j8BM89X15hBO8IUWAbXMtOJrNS5ZN8fseL6V5JT+DiTX
 o1RInJYDf/gqFSUpwTku8dLnQQMZ3a2f9UuH9m9RxnNcIsQlxBRZT5Vsu w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10204"; a="221079268"
X-IronPort-AV: E=Sophos;i="5.88,223,1635231600"; d="scan'208";a="221079268"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2021 06:34:46 -0800
X-IronPort-AV: E=Sophos;i="5.88,223,1635231600"; d="scan'208";a="484429255"
Received: from lmaniak-dev.igk.intel.com ([10.55.249.72])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2021 06:34:41 -0800
From: Lukasz Maniak <lukasz.maniak@linux.intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 05/15] hw/nvme: Add support for SR-IOV
Date: Tue, 21 Dec 2021 15:32:36 +0100
Message-Id: <20211221143246.2052050-6-lukasz.maniak@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211221143246.2052050-1-lukasz.maniak@linux.intel.com>
References: <20211221143246.2052050-1-lukasz.maniak@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=192.55.52.151;
 envelope-from=lukasz.maniak@linux.intel.com; helo=mga17.intel.com
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
Cc: qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?=C5=81ukasz=20Gieryk?= <lukasz.gieryk@linux.intel.com>,
 Lukasz Maniak <lukasz.maniak@linux.intel.com>, Keith Busch <kbusch@kernel.org>,
 Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch implements initial support for Single Root I/O Virtualization
on an NVMe device.

Essentially, it allows to define the maximum number of virtual functions
supported by the NVMe controller via sriov_max_vfs parameter.

Passing a non-zero value to sriov_max_vfs triggers reporting of SR-IOV
capability by a physical controller and ARI capability by both the
physical and virtual function devices.

NVMe controllers created via virtual functions mirror functionally
the physical controller, which may not entirely be the case, thus
consideration would be needed on the way to limit the capabilities of
the VF.

NVMe subsystem is required for the use of SR-IOV.

Signed-off-by: Lukasz Maniak <lukasz.maniak@linux.intel.com>
---
 hw/nvme/ctrl.c           | 84 ++++++++++++++++++++++++++++++++++++++--
 hw/nvme/nvme.h           |  3 +-
 include/hw/pci/pci_ids.h |  1 +
 3 files changed, 84 insertions(+), 4 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 5f573c417b..159635c1af 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -35,6 +35,7 @@
  *              mdts=<N[optional]>,vsl=<N[optional]>, \
  *              zoned.zasl=<N[optional]>, \
  *              zoned.auto_transition=<on|off[optional]>, \
+ *              sriov_max_vfs=<N[optional]> \
  *              subsys=<subsys_id>
  *      -device nvme-ns,drive=<drive_id>,bus=<bus_name>,nsid=<nsid>,\
  *              zoned=<true|false[optional]>, \
@@ -106,6 +107,12 @@
  *   transitioned to zone state closed for resource management purposes.
  *   Defaults to 'on'.
  *
+ * - `sriov_max_vfs`
+ *   Indicates the maximum number of PCIe virtual functions supported
+ *   by the controller. The default value is 0. Specifying a non-zero value
+ *   enables reporting of both SR-IOV and ARI capabilities by the NVMe device.
+ *   Virtual function controllers will not report SR-IOV capability.
+ *
  * nvme namespace device parameters
  * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  * - `shared`
@@ -160,6 +167,7 @@
 #include "sysemu/block-backend.h"
 #include "sysemu/hostmem.h"
 #include "hw/pci/msix.h"
+#include "hw/pci/pcie_sriov.h"
 #include "migration/vmstate.h"
 
 #include "nvme.h"
@@ -175,6 +183,9 @@
 #define NVME_TEMPERATURE_CRITICAL 0x175
 #define NVME_NUM_FW_SLOTS 1
 #define NVME_DEFAULT_MAX_ZA_SIZE (128 * KiB)
+#define NVME_MAX_VFS 127
+#define NVME_VF_OFFSET 0x1
+#define NVME_VF_STRIDE 1
 
 #define NVME_GUEST_ERR(trace, fmt, ...) \
     do { \
@@ -5588,6 +5599,10 @@ static void nvme_ctrl_reset(NvmeCtrl *n)
         g_free(event);
     }
 
+    if (!pci_is_vf(&n->parent_obj) && n->params.sriov_max_vfs) {
+        pcie_sriov_pf_disable_vfs(&n->parent_obj);
+    }
+
     n->aer_queued = 0;
     n->outstanding_aers = 0;
     n->qs_created = false;
@@ -6269,6 +6284,29 @@ static void nvme_check_constraints(NvmeCtrl *n, Error **errp)
         error_setg(errp, "vsl must be non-zero");
         return;
     }
+
+    if (params->sriov_max_vfs) {
+        if (!n->subsys) {
+            error_setg(errp, "subsystem is required for the use of SR-IOV");
+            return;
+        }
+
+        if (params->sriov_max_vfs > NVME_MAX_VFS) {
+            error_setg(errp, "sriov_max_vfs must be between 0 and %d",
+                       NVME_MAX_VFS);
+            return;
+        }
+
+        if (params->cmb_size_mb) {
+            error_setg(errp, "CMB is not supported with SR-IOV");
+            return;
+        }
+
+        if (n->pmr.dev) {
+            error_setg(errp, "PMR is not supported with SR-IOV");
+            return;
+        }
+    }
 }
 
 static void nvme_init_state(NvmeCtrl *n)
@@ -6326,6 +6364,20 @@ static void nvme_init_pmr(NvmeCtrl *n, PCIDevice *pci_dev)
     memory_region_set_enabled(&n->pmr.dev->mr, false);
 }
 
+static void nvme_init_sriov(NvmeCtrl *n, PCIDevice *pci_dev, uint16_t offset,
+                            uint64_t bar_size)
+{
+    uint16_t vf_dev_id = n->params.use_intel_id ?
+                         PCI_DEVICE_ID_INTEL_NVME : PCI_DEVICE_ID_REDHAT_NVME;
+
+    pcie_sriov_pf_init(pci_dev, offset, "nvme", vf_dev_id,
+                       n->params.sriov_max_vfs, n->params.sriov_max_vfs,
+                       NVME_VF_OFFSET, NVME_VF_STRIDE);
+
+    pcie_sriov_pf_init_vf_bar(pci_dev, 0, PCI_BASE_ADDRESS_SPACE_MEMORY |
+                              PCI_BASE_ADDRESS_MEM_TYPE_64, bar_size);
+}
+
 static int nvme_init_pci(NvmeCtrl *n, PCIDevice *pci_dev, Error **errp)
 {
     uint8_t *pci_conf = pci_dev->config;
@@ -6340,7 +6392,7 @@ static int nvme_init_pci(NvmeCtrl *n, PCIDevice *pci_dev, Error **errp)
 
     if (n->params.use_intel_id) {
         pci_config_set_vendor_id(pci_conf, PCI_VENDOR_ID_INTEL);
-        pci_config_set_device_id(pci_conf, 0x5845);
+        pci_config_set_device_id(pci_conf, PCI_DEVICE_ID_INTEL_NVME);
     } else {
         pci_config_set_vendor_id(pci_conf, PCI_VENDOR_ID_REDHAT);
         pci_config_set_device_id(pci_conf, PCI_DEVICE_ID_REDHAT_NVME);
@@ -6348,6 +6400,9 @@ static int nvme_init_pci(NvmeCtrl *n, PCIDevice *pci_dev, Error **errp)
 
     pci_config_set_class(pci_conf, PCI_CLASS_STORAGE_EXPRESS);
     pcie_endpoint_cap_init(pci_dev, 0x80);
+    if (n->params.sriov_max_vfs) {
+        pcie_ari_init(pci_dev, 0x100, 1);
+    }
 
     bar_size = QEMU_ALIGN_UP(n->reg_size, 4 * KiB);
     msix_table_offset = bar_size;
@@ -6366,8 +6421,12 @@ static int nvme_init_pci(NvmeCtrl *n, PCIDevice *pci_dev, Error **errp)
                           n->reg_size);
     memory_region_add_subregion(&n->bar0, 0, &n->iomem);
 
-    pci_register_bar(pci_dev, 0, PCI_BASE_ADDRESS_SPACE_MEMORY |
-                     PCI_BASE_ADDRESS_MEM_TYPE_64, &n->bar0);
+    if (pci_is_vf(pci_dev)) {
+        pcie_sriov_vf_register_bar(pci_dev, 0, &n->bar0);
+    } else {
+        pci_register_bar(pci_dev, 0, PCI_BASE_ADDRESS_SPACE_MEMORY |
+                         PCI_BASE_ADDRESS_MEM_TYPE_64, &n->bar0);
+    }
     ret = msix_init(pci_dev, n->params.msix_qsize,
                     &n->bar0, 0, msix_table_offset,
                     &n->bar0, 0, msix_pba_offset, 0, &err);
@@ -6388,6 +6447,10 @@ static int nvme_init_pci(NvmeCtrl *n, PCIDevice *pci_dev, Error **errp)
         nvme_init_pmr(n, pci_dev);
     }
 
+    if (!pci_is_vf(pci_dev) && n->params.sriov_max_vfs) {
+        nvme_init_sriov(n, pci_dev, 0x120, bar_size);
+    }
+
     return 0;
 }
 
@@ -6537,6 +6600,15 @@ static void nvme_realize(PCIDevice *pci_dev, Error **errp)
     NvmeCtrl *n = NVME(pci_dev);
     NvmeNamespace *ns;
     Error *local_err = NULL;
+    NvmeCtrl *pn = NVME(pcie_sriov_get_pf(pci_dev));
+
+    if (pci_is_vf(pci_dev)) {
+        /* VFs derive settings from the parent. PF's lifespan exceeds
+         * that of VF's, so it's safe to share params.serial.
+         */
+        memcpy(&n->params, &pn->params, sizeof(NvmeParams));
+        n->subsys = pn->subsys;
+    }
 
     nvme_check_constraints(n, &local_err);
     if (local_err) {
@@ -6601,6 +6673,11 @@ static void nvme_exit(PCIDevice *pci_dev)
     if (n->pmr.dev) {
         host_memory_backend_set_mapped(n->pmr.dev, false);
     }
+
+    if (!pci_is_vf(pci_dev) && n->params.sriov_max_vfs) {
+        pcie_sriov_pf_exit(pci_dev);
+    }
+
     msix_uninit(pci_dev, &n->bar0, &n->bar0);
     memory_region_del_subregion(&n->bar0, &n->iomem);
 }
@@ -6625,6 +6702,7 @@ static Property nvme_props[] = {
     DEFINE_PROP_UINT8("zoned.zasl", NvmeCtrl, params.zasl, 0),
     DEFINE_PROP_BOOL("zoned.auto_transition", NvmeCtrl,
                      params.auto_transition_zones, true),
+    DEFINE_PROP_UINT8("sriov_max_vfs", NvmeCtrl, params.sriov_max_vfs, 0),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
index 83ffabade4..4c8af34b28 100644
--- a/hw/nvme/nvme.h
+++ b/hw/nvme/nvme.h
@@ -24,7 +24,7 @@
 
 #include "block/nvme.h"
 
-#define NVME_MAX_CONTROLLERS 32
+#define NVME_MAX_CONTROLLERS 256
 #define NVME_MAX_NAMESPACES  256
 #define NVME_EUI64_DEFAULT ((uint64_t)0x5254000000000000)
 
@@ -391,6 +391,7 @@ typedef struct NvmeParams {
     uint8_t  zasl;
     bool     auto_transition_zones;
     bool     legacy_cmb;
+    uint8_t  sriov_max_vfs;
 } NvmeParams;
 
 typedef struct NvmeCtrl {
diff --git a/include/hw/pci/pci_ids.h b/include/hw/pci/pci_ids.h
index 11abe22d46..992426768e 100644
--- a/include/hw/pci/pci_ids.h
+++ b/include/hw/pci/pci_ids.h
@@ -237,6 +237,7 @@
 #define PCI_DEVICE_ID_INTEL_82801BA_11   0x244e
 #define PCI_DEVICE_ID_INTEL_82801D       0x24CD
 #define PCI_DEVICE_ID_INTEL_ESB_9        0x25ab
+#define PCI_DEVICE_ID_INTEL_NVME         0x5845
 #define PCI_DEVICE_ID_INTEL_82371SB_0    0x7000
 #define PCI_DEVICE_ID_INTEL_82371SB_1    0x7010
 #define PCI_DEVICE_ID_INTEL_82371SB_2    0x7020
-- 
2.25.1


