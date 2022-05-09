Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2287D51FFA9
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 16:29:28 +0200 (CEST)
Received: from localhost ([::1]:55968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no4O7-0007aG-7f
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 10:29:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.maniak@linux.intel.com>)
 id 1no4Dj-0001FS-Im; Mon, 09 May 2022 10:18:43 -0400
Received: from mga05.intel.com ([192.55.52.43]:24280)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.maniak@linux.intel.com>)
 id 1no4Dh-00019s-Fk; Mon, 09 May 2022 10:18:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652105921; x=1683641921;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bGFBSJAS5HmD35L0DTPo/bmfiwgr/AL24bDqB+Bx+aw=;
 b=Y90WVoqCPLcXm+J+aSIK2bYe0dtrm5wZUaouBcPldiPOJROzZYvC3PCr
 NVW3eHIi63vTPfNqh8RkfG9K9bBZYI3kus5Ac837Dvk+ASLvd8Vj/Lm60
 IdOxUsFsu8MZtzNmcrIhbuPuQyKTYouJ1UD01/BjI1BPmnuf3/0lDiSKj
 dBgvSbBKmBdJMNY271Zu07/R8+p1NgU4ekgY8vOYN8AU4Y7si7KPQVVE0
 WzkkIcdm4OydBnNdRw06Ns0KOKTcGlKXlbTldWInKCe9jVu1oAE5zmBcu
 DItPBjTu21I1FbUu6hLp63gXNhAxR4ksZK7BB9IeF9CUduGeQRb6xvvKd g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10342"; a="355490752"
X-IronPort-AV: E=Sophos;i="5.91,211,1647327600"; d="scan'208";a="355490752"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2022 07:18:39 -0700
X-IronPort-AV: E=Sophos;i="5.91,211,1647327600"; d="scan'208";a="622987239"
Received: from lmaniak-dev.elements.local ([10.55.249.72])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2022 07:18:36 -0700
From: Lukasz Maniak <lukasz.maniak@linux.intel.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, ani@anisinha.ca, armbru@redhat.com, f4bug@amsat.org,
 fam@euphon.net, hreitz@redhat.com, imammedo@redhat.com, its@irrelevant.dk,
 kbusch@kernel.org, k.jensen@samsung.com, kwolf@redhat.com,
 lukasz.gieryk@linux.intel.com, lukasz.maniak@linux.intel.com,
 marcel.apfelbaum@gmail.com, mst@redhat.com, stefanha@redhat.com,
 xypron.glpk@gmx.de
Subject: [PATCH v8 01/12] hw/nvme: Add support for SR-IOV
Date: Mon,  9 May 2022 16:16:09 +0200
Message-Id: <20220509141620.3868733-2-lukasz.maniak@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220509141620.3868733-1-lukasz.maniak@linux.intel.com>
References: <20220509141620.3868733-1-lukasz.maniak@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=192.55.52.43;
 envelope-from=lukasz.maniak@linux.intel.com; helo=mga05.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
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
Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/nvme/ctrl.c           | 85 ++++++++++++++++++++++++++++++++++++++--
 hw/nvme/nvme.h           |  3 +-
 include/hw/pci/pci_ids.h |  1 +
 3 files changed, 85 insertions(+), 4 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 03760ddeae8..0e1d8d03c87 100644
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
@@ -176,6 +184,9 @@
 #define NVME_TEMPERATURE_CRITICAL 0x175
 #define NVME_NUM_FW_SLOTS 1
 #define NVME_DEFAULT_MAX_ZA_SIZE (128 * KiB)
+#define NVME_MAX_VFS 127
+#define NVME_VF_OFFSET 0x1
+#define NVME_VF_STRIDE 1
 
 #define NVME_GUEST_ERR(trace, fmt, ...) \
     do { \
@@ -5886,6 +5897,10 @@ static void nvme_ctrl_reset(NvmeCtrl *n)
         g_free(event);
     }
 
+    if (!pci_is_vf(&n->parent_obj) && n->params.sriov_max_vfs) {
+        pcie_sriov_pf_disable_vfs(&n->parent_obj);
+    }
+
     n->aer_queued = 0;
     n->outstanding_aers = 0;
     n->qs_created = false;
@@ -6567,6 +6582,29 @@ static void nvme_check_constraints(NvmeCtrl *n, Error **errp)
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
@@ -6624,6 +6662,20 @@ static void nvme_init_pmr(NvmeCtrl *n, PCIDevice *pci_dev)
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
@@ -6638,7 +6690,7 @@ static int nvme_init_pci(NvmeCtrl *n, PCIDevice *pci_dev, Error **errp)
 
     if (n->params.use_intel_id) {
         pci_config_set_vendor_id(pci_conf, PCI_VENDOR_ID_INTEL);
-        pci_config_set_device_id(pci_conf, 0x5845);
+        pci_config_set_device_id(pci_conf, PCI_DEVICE_ID_INTEL_NVME);
     } else {
         pci_config_set_vendor_id(pci_conf, PCI_VENDOR_ID_REDHAT);
         pci_config_set_device_id(pci_conf, PCI_DEVICE_ID_REDHAT_NVME);
@@ -6646,6 +6698,9 @@ static int nvme_init_pci(NvmeCtrl *n, PCIDevice *pci_dev, Error **errp)
 
     pci_config_set_class(pci_conf, PCI_CLASS_STORAGE_EXPRESS);
     pcie_endpoint_cap_init(pci_dev, 0x80);
+    if (n->params.sriov_max_vfs) {
+        pcie_ari_init(pci_dev, 0x100, 1);
+    }
 
     bar_size = QEMU_ALIGN_UP(n->reg_size, 4 * KiB);
     msix_table_offset = bar_size;
@@ -6664,8 +6719,12 @@ static int nvme_init_pci(NvmeCtrl *n, PCIDevice *pci_dev, Error **errp)
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
@@ -6686,6 +6745,10 @@ static int nvme_init_pci(NvmeCtrl *n, PCIDevice *pci_dev, Error **errp)
         nvme_init_pmr(n, pci_dev);
     }
 
+    if (!pci_is_vf(pci_dev) && n->params.sriov_max_vfs) {
+        nvme_init_sriov(n, pci_dev, 0x120, bar_size);
+    }
+
     return 0;
 }
 
@@ -6836,6 +6899,16 @@ static void nvme_realize(PCIDevice *pci_dev, Error **errp)
     NvmeCtrl *n = NVME(pci_dev);
     NvmeNamespace *ns;
     Error *local_err = NULL;
+    NvmeCtrl *pn = NVME(pcie_sriov_get_pf(pci_dev));
+
+    if (pci_is_vf(pci_dev)) {
+        /*
+         * VFs derive settings from the parent. PF's lifespan exceeds
+         * that of VF's, so it's safe to share params.serial.
+         */
+        memcpy(&n->params, &pn->params, sizeof(NvmeParams));
+        n->subsys = pn->subsys;
+    }
 
     nvme_check_constraints(n, &local_err);
     if (local_err) {
@@ -6900,6 +6973,11 @@ static void nvme_exit(PCIDevice *pci_dev)
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
@@ -6924,6 +7002,7 @@ static Property nvme_props[] = {
     DEFINE_PROP_UINT8("zoned.zasl", NvmeCtrl, params.zasl, 0),
     DEFINE_PROP_BOOL("zoned.auto_transition", NvmeCtrl,
                      params.auto_transition_zones, true),
+    DEFINE_PROP_UINT8("sriov_max_vfs", NvmeCtrl, params.sriov_max_vfs, 0),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
index 739c8b8f796..89ca6e96401 100644
--- a/hw/nvme/nvme.h
+++ b/hw/nvme/nvme.h
@@ -24,7 +24,7 @@
 
 #include "block/nvme.h"
 
-#define NVME_MAX_CONTROLLERS 32
+#define NVME_MAX_CONTROLLERS 256
 #define NVME_MAX_NAMESPACES  256
 #define NVME_EUI64_DEFAULT ((uint64_t)0x5254000000000000)
 
@@ -405,6 +405,7 @@ typedef struct NvmeParams {
     uint8_t  zasl;
     bool     auto_transition_zones;
     bool     legacy_cmb;
+    uint8_t  sriov_max_vfs;
 } NvmeParams;
 
 typedef struct NvmeCtrl {
diff --git a/include/hw/pci/pci_ids.h b/include/hw/pci/pci_ids.h
index 11abe22d460..992426768e6 100644
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


