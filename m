Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2921520004
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 16:38:42 +0200 (CEST)
Received: from localhost ([::1]:54128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no4X3-0000YJ-UX
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 10:38:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.maniak@linux.intel.com>)
 id 1no4EC-0002A4-39; Mon, 09 May 2022 10:19:13 -0400
Received: from mga05.intel.com ([192.55.52.43]:24288)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.maniak@linux.intel.com>)
 id 1no4E8-0001AQ-OR; Mon, 09 May 2022 10:19:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652105949; x=1683641949;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=78XCk5qOeBZhlvyfR2l423+JkhyyMUzrK6aWrqqyhV8=;
 b=ajHRN+AzErHXSBcGTWx6ak5S9/eXrG26skPXrPd7v7dW4vO7BQt/SbC4
 iIAvagt5NXoo8T40f0tLvjKiVjAERNmbmeaKPHP7152APXp4ufLH7KU2a
 jkrfh3fCP4OtRQixmmKm+gDFOI8vGARDMBEVsUnfQl3cTQUryFP5XWfTi
 vrgMr0mlHjarxBQp/RoeAEgFkxHOD1PVwhEcnd0ZcNYvwCacfkY5AiL5f
 LxmyjHQbH8L4Wa1HvQQw0bbj37d9foFTHkltsbE9yokob9f7lWaJHOkpj
 XHKOiC2d83xJkjBhUE61U13KEXfUtxUpxMg1RrnZiydpL9mYd0MUY+4uY g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10342"; a="355490872"
X-IronPort-AV: E=Sophos;i="5.91,211,1647327600"; d="scan'208";a="355490872"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2022 07:19:07 -0700
X-IronPort-AV: E=Sophos;i="5.91,211,1647327600"; d="scan'208";a="622987331"
Received: from lmaniak-dev.elements.local ([10.55.249.72])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2022 07:19:04 -0700
From: Lukasz Maniak <lukasz.maniak@linux.intel.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, ani@anisinha.ca, armbru@redhat.com, f4bug@amsat.org,
 fam@euphon.net, hreitz@redhat.com, imammedo@redhat.com, its@irrelevant.dk,
 kbusch@kernel.org, k.jensen@samsung.com, kwolf@redhat.com,
 lukasz.gieryk@linux.intel.com, lukasz.maniak@linux.intel.com,
 marcel.apfelbaum@gmail.com, mst@redhat.com, stefanha@redhat.com,
 xypron.glpk@gmx.de
Subject: [PATCH v8 08/12] hw/nvme: Initialize capability structures for
 primary/secondary controllers
Date: Mon,  9 May 2022 16:16:16 +0200
Message-Id: <20220509141620.3868733-9-lukasz.maniak@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220509141620.3868733-1-lukasz.maniak@linux.intel.com>
References: <20220509141620.3868733-1-lukasz.maniak@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Łukasz Gieryk <lukasz.gieryk@linux.intel.com>

With four new properties:
 - sriov_v{i,q}_flexible,
 - sriov_max_v{i,q}_per_vf,
one can configure the number of available flexible resources, as well as
the limits. The primary and secondary controller capability structures
are initialized accordingly.

Since the number of available queues (interrupts) now varies between
VF/PF, BAR size calculation is also adjusted.

Signed-off-by: Łukasz Gieryk <lukasz.gieryk@linux.intel.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c       | 141 ++++++++++++++++++++++++++++++++++++++++---
 hw/nvme/nvme.h       |   4 ++
 include/block/nvme.h |   5 ++
 3 files changed, 143 insertions(+), 7 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index f0554a07c40..011231ab5a6 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -36,6 +36,10 @@
  *              zoned.zasl=<N[optional]>, \
  *              zoned.auto_transition=<on|off[optional]>, \
  *              sriov_max_vfs=<N[optional]> \
+ *              sriov_vq_flexible=<N[optional]> \
+ *              sriov_vi_flexible=<N[optional]> \
+ *              sriov_max_vi_per_vf=<N[optional]> \
+ *              sriov_max_vq_per_vf=<N[optional]> \
  *              subsys=<subsys_id>
  *      -device nvme-ns,drive=<drive_id>,bus=<bus_name>,nsid=<nsid>,\
  *              zoned=<true|false[optional]>, \
@@ -113,6 +117,29 @@
  *   enables reporting of both SR-IOV and ARI capabilities by the NVMe device.
  *   Virtual function controllers will not report SR-IOV capability.
  *
+ *   NOTE: Single Root I/O Virtualization support is experimental.
+ *   All the related parameters may be subject to change.
+ *
+ * - `sriov_vq_flexible`
+ *   Indicates the total number of flexible queue resources assignable to all
+ *   the secondary controllers. Implicitly sets the number of primary
+ *   controller's private resources to `(max_ioqpairs - sriov_vq_flexible)`.
+ *
+ * - `sriov_vi_flexible`
+ *   Indicates the total number of flexible interrupt resources assignable to
+ *   all the secondary controllers. Implicitly sets the number of primary
+ *   controller's private resources to `(msix_qsize - sriov_vi_flexible)`.
+ *
+ * - `sriov_max_vi_per_vf`
+ *   Indicates the maximum number of virtual interrupt resources assignable
+ *   to a secondary controller. The default 0 resolves to
+ *   `(sriov_vi_flexible / sriov_max_vfs)`.
+ *
+ * - `sriov_max_vq_per_vf`
+ *   Indicates the maximum number of virtual queue resources assignable to
+ *   a secondary controller. The default 0 resolves to
+ *   `(sriov_vq_flexible / sriov_max_vfs)`.
+ *
  * nvme namespace device parameters
  * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  * - `shared`
@@ -185,6 +212,7 @@
 #define NVME_NUM_FW_SLOTS 1
 #define NVME_DEFAULT_MAX_ZA_SIZE (128 * KiB)
 #define NVME_MAX_VFS 127
+#define NVME_VF_RES_GRANULARITY 1
 #define NVME_VF_OFFSET 0x1
 #define NVME_VF_STRIDE 1
 
@@ -6656,6 +6684,53 @@ static void nvme_check_constraints(NvmeCtrl *n, Error **errp)
             error_setg(errp, "PMR is not supported with SR-IOV");
             return;
         }
+
+        if (!params->sriov_vq_flexible || !params->sriov_vi_flexible) {
+            error_setg(errp, "both sriov_vq_flexible and sriov_vi_flexible"
+                       " must be set for the use of SR-IOV");
+            return;
+        }
+
+        if (params->sriov_vq_flexible < params->sriov_max_vfs * 2) {
+            error_setg(errp, "sriov_vq_flexible must be greater than or equal"
+                       " to %d (sriov_max_vfs * 2)", params->sriov_max_vfs * 2);
+            return;
+        }
+
+        if (params->max_ioqpairs < params->sriov_vq_flexible + 2) {
+            error_setg(errp, "(max_ioqpairs - sriov_vq_flexible) must be"
+                       " greater than or equal to 2");
+            return;
+        }
+
+        if (params->sriov_vi_flexible < params->sriov_max_vfs) {
+            error_setg(errp, "sriov_vi_flexible must be greater than or equal"
+                       " to %d (sriov_max_vfs)", params->sriov_max_vfs);
+            return;
+        }
+
+        if (params->msix_qsize < params->sriov_vi_flexible + 1) {
+            error_setg(errp, "(msix_qsize - sriov_vi_flexible) must be"
+                       " greater than or equal to 1");
+            return;
+        }
+
+        if (params->sriov_max_vi_per_vf &&
+            (params->sriov_max_vi_per_vf - 1) % NVME_VF_RES_GRANULARITY) {
+            error_setg(errp, "sriov_max_vi_per_vf must meet:"
+                       " (sriov_max_vi_per_vf - 1) %% %d == 0 and"
+                       " sriov_max_vi_per_vf >= 1", NVME_VF_RES_GRANULARITY);
+            return;
+        }
+
+        if (params->sriov_max_vq_per_vf &&
+            (params->sriov_max_vq_per_vf < 2 ||
+             (params->sriov_max_vq_per_vf - 1) % NVME_VF_RES_GRANULARITY)) {
+            error_setg(errp, "sriov_max_vq_per_vf must meet:"
+                       " (sriov_max_vq_per_vf - 1) %% %d == 0 and"
+                       " sriov_max_vq_per_vf >= 2", NVME_VF_RES_GRANULARITY);
+            return;
+        }
     }
 }
 
@@ -6664,10 +6739,19 @@ static void nvme_init_state(NvmeCtrl *n)
     NvmePriCtrlCap *cap = &n->pri_ctrl_cap;
     NvmeSecCtrlList *list = &n->sec_ctrl_list;
     NvmeSecCtrlEntry *sctrl;
+    uint8_t max_vfs;
     int i;
 
-    n->conf_ioqpairs = n->params.max_ioqpairs;
-    n->conf_msix_qsize = n->params.msix_qsize;
+    if (pci_is_vf(&n->parent_obj)) {
+        sctrl = nvme_sctrl(n);
+        max_vfs = 0;
+        n->conf_ioqpairs = sctrl->nvq ? le16_to_cpu(sctrl->nvq) - 1 : 0;
+        n->conf_msix_qsize = sctrl->nvi ? le16_to_cpu(sctrl->nvi) : 1;
+    } else {
+        max_vfs = n->params.sriov_max_vfs;
+        n->conf_ioqpairs = n->params.max_ioqpairs;
+        n->conf_msix_qsize = n->params.msix_qsize;
+    }
 
     n->sq = g_new0(NvmeSQueue *, n->params.max_ioqpairs + 1);
     n->cq = g_new0(NvmeCQueue *, n->params.max_ioqpairs + 1);
@@ -6676,14 +6760,41 @@ static void nvme_init_state(NvmeCtrl *n)
     n->starttime_ms = qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL);
     n->aer_reqs = g_new0(NvmeRequest *, n->params.aerl + 1);
 
-    list->numcntl = cpu_to_le16(n->params.sriov_max_vfs);
-    for (i = 0; i < n->params.sriov_max_vfs; i++) {
+    list->numcntl = cpu_to_le16(max_vfs);
+    for (i = 0; i < max_vfs; i++) {
         sctrl = &list->sec[i];
         sctrl->pcid = cpu_to_le16(n->cntlid);
         sctrl->vfn = cpu_to_le16(i + 1);
     }
 
     cap->cntlid = cpu_to_le16(n->cntlid);
+    cap->crt = NVME_CRT_VQ | NVME_CRT_VI;
+
+    if (pci_is_vf(&n->parent_obj)) {
+        cap->vqprt = cpu_to_le16(1 + n->conf_ioqpairs);
+    } else {
+        cap->vqprt = cpu_to_le16(1 + n->params.max_ioqpairs -
+                                 n->params.sriov_vq_flexible);
+        cap->vqfrt = cpu_to_le32(n->params.sriov_vq_flexible);
+        cap->vqrfap = cap->vqfrt;
+        cap->vqgran = cpu_to_le16(NVME_VF_RES_GRANULARITY);
+        cap->vqfrsm = n->params.sriov_max_vq_per_vf ?
+                        cpu_to_le16(n->params.sriov_max_vq_per_vf) :
+                        cap->vqfrt / MAX(max_vfs, 1);
+    }
+
+    if (pci_is_vf(&n->parent_obj)) {
+        cap->viprt = cpu_to_le16(n->conf_msix_qsize);
+    } else {
+        cap->viprt = cpu_to_le16(n->params.msix_qsize -
+                                 n->params.sriov_vi_flexible);
+        cap->vifrt = cpu_to_le32(n->params.sriov_vi_flexible);
+        cap->virfap = cap->vifrt;
+        cap->vigran = cpu_to_le16(NVME_VF_RES_GRANULARITY);
+        cap->vifrsm = n->params.sriov_max_vi_per_vf ?
+                        cpu_to_le16(n->params.sriov_max_vi_per_vf) :
+                        cap->vifrt / MAX(max_vfs, 1);
+    }
 }
 
 static void nvme_init_cmb(NvmeCtrl *n, PCIDevice *pci_dev)
@@ -6756,11 +6867,14 @@ static uint64_t nvme_bar_size(unsigned total_queues, unsigned total_irqs,
     return bar_size;
 }
 
-static void nvme_init_sriov(NvmeCtrl *n, PCIDevice *pci_dev, uint16_t offset,
-                            uint64_t bar_size)
+static void nvme_init_sriov(NvmeCtrl *n, PCIDevice *pci_dev, uint16_t offset)
 {
     uint16_t vf_dev_id = n->params.use_intel_id ?
                          PCI_DEVICE_ID_INTEL_NVME : PCI_DEVICE_ID_REDHAT_NVME;
+    NvmePriCtrlCap *cap = &n->pri_ctrl_cap;
+    uint64_t bar_size = nvme_bar_size(le16_to_cpu(cap->vqfrsm),
+                                      le16_to_cpu(cap->vifrsm),
+                                      NULL, NULL);
 
     pcie_sriov_pf_init(pci_dev, offset, "nvme", vf_dev_id,
                        n->params.sriov_max_vfs, n->params.sriov_max_vfs,
@@ -6858,7 +6972,7 @@ static int nvme_init_pci(NvmeCtrl *n, PCIDevice *pci_dev, Error **errp)
     }
 
     if (!pci_is_vf(pci_dev) && n->params.sriov_max_vfs) {
-        nvme_init_sriov(n, pci_dev, 0x120, bar_size);
+        nvme_init_sriov(n, pci_dev, 0x120);
     }
 
     return 0;
@@ -6882,6 +6996,7 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
     NvmeIdCtrl *id = &n->id_ctrl;
     uint8_t *pci_conf = pci_dev->config;
     uint64_t cap = ldq_le_p(&n->bar.cap);
+    NvmeSecCtrlEntry *sctrl = nvme_sctrl(n);
 
     id->vid = cpu_to_le16(pci_get_word(pci_conf + PCI_VENDOR_ID));
     id->ssvid = cpu_to_le16(pci_get_word(pci_conf + PCI_SUBSYSTEM_VENDOR_ID));
@@ -6974,6 +7089,10 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
 
     stl_le_p(&n->bar.vs, NVME_SPEC_VER);
     n->bar.intmc = n->bar.intms = 0;
+
+    if (pci_is_vf(&n->parent_obj) && !sctrl->scs) {
+        stl_le_p(&n->bar.csts, NVME_CSTS_FAILED);
+    }
 }
 
 static int nvme_init_subsys(NvmeCtrl *n, Error **errp)
@@ -7114,6 +7233,14 @@ static Property nvme_props[] = {
     DEFINE_PROP_BOOL("zoned.auto_transition", NvmeCtrl,
                      params.auto_transition_zones, true),
     DEFINE_PROP_UINT8("sriov_max_vfs", NvmeCtrl, params.sriov_max_vfs, 0),
+    DEFINE_PROP_UINT16("sriov_vq_flexible", NvmeCtrl,
+                       params.sriov_vq_flexible, 0),
+    DEFINE_PROP_UINT16("sriov_vi_flexible", NvmeCtrl,
+                       params.sriov_vi_flexible, 0),
+    DEFINE_PROP_UINT8("sriov_max_vi_per_vf", NvmeCtrl,
+                      params.sriov_max_vi_per_vf, 0),
+    DEFINE_PROP_UINT8("sriov_max_vq_per_vf", NvmeCtrl,
+                      params.sriov_max_vq_per_vf, 0),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
index adde718105b..fb18d1dc667 100644
--- a/hw/nvme/nvme.h
+++ b/hw/nvme/nvme.h
@@ -411,6 +411,10 @@ typedef struct NvmeParams {
     bool     auto_transition_zones;
     bool     legacy_cmb;
     uint8_t  sriov_max_vfs;
+    uint16_t sriov_vq_flexible;
+    uint16_t sriov_vi_flexible;
+    uint8_t  sriov_max_vq_per_vf;
+    uint8_t  sriov_max_vi_per_vf;
 } NvmeParams;
 
 typedef struct NvmeCtrl {
diff --git a/include/block/nvme.h b/include/block/nvme.h
index 94efd32578c..58d08d5c2aa 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -1576,6 +1576,11 @@ typedef struct QEMU_PACKED NvmePriCtrlCap {
     uint8_t     rsvd80[4016];
 } NvmePriCtrlCap;
 
+typedef enum NvmePriCtrlCapCrt {
+    NVME_CRT_VQ             = 1 << 0,
+    NVME_CRT_VI             = 1 << 1,
+} NvmePriCtrlCapCrt;
+
 typedef struct QEMU_PACKED NvmeSecCtrlEntry {
     uint16_t    scid;
     uint16_t    pcid;
-- 
2.25.1


