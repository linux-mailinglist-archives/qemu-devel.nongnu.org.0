Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A95549D123
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 18:49:01 +0100 (CET)
Received: from localhost ([::1]:56302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCmPj-00038E-Ht
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 12:48:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.maniak@linux.intel.com>)
 id 1nCltf-000729-2o; Wed, 26 Jan 2022 12:15:51 -0500
Received: from mga11.intel.com ([192.55.52.93]:54272)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.maniak@linux.intel.com>)
 id 1nCltc-00021Y-Fz; Wed, 26 Jan 2022 12:15:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643217348; x=1674753348;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=++/U40AClLS6Ig92ojhVrMylTl5BQMD72q0EpgxpSww=;
 b=SOzkaiVWZkwZwcO3Imfct35Q5AfN+xXQiuF27gnQjRyewBbufpaATxT3
 kE78ZQaKuqkOWeqPYuHgcHPTT3yKZn3MLfryXhD2Lvl4PdBI21Ns3HBJj
 E55aNZfeTLKBMlmaH0XCtUfeX/9U+CaS2B3EQl8CysAXLdnMtWZMg5LoM
 OCENBcqlyAOcUkhHWVWYsxQf21RmPoFYqsM/n6FibrxI0DD1WCWL5D9ct
 QcEz6/n601JF2VeaBPaWKJCu/5LC2fBu7HHk0YjkobgRXzRYjKQPD29LX
 Spp9q7KxOTuAihRkAZZuUEZXwTaEW4aRUuIzfYcb4YdHlbZRxsxQEudDf g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10238"; a="244199416"
X-IronPort-AV: E=Sophos;i="5.88,318,1635231600"; d="scan'208";a="244199416"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 09:13:27 -0800
X-IronPort-AV: E=Sophos;i="5.88,318,1635231600"; d="scan'208";a="535254303"
Received: from lmaniak-dev.igk.intel.com ([10.55.249.72])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 09:13:24 -0800
From: Lukasz Maniak <lukasz.maniak@linux.intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 12/15] hw/nvme: Initialize capability structures for
 primary/secondary controllers
Date: Wed, 26 Jan 2022 18:11:17 +0100
Message-Id: <20220126171120.2939152-13-lukasz.maniak@linux.intel.com>
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

With four new properties:
 - sriov_v{i,q}_flexible,
 - sriov_max_v{i,q}_per_vf,
one can configure the number of available flexible resources, as well as
the limits. The primary and secondary controller capability structures
are initialized accordingly.

Since the number of available queues (interrupts) now varies between
VF/PF, BAR size calculation is also adjusted.

Signed-off-by: Łukasz Gieryk <lukasz.gieryk@linux.intel.com>
---
 hw/nvme/ctrl.c       | 142 ++++++++++++++++++++++++++++++++++++++++---
 hw/nvme/nvme.h       |   4 ++
 include/block/nvme.h |   5 ++
 3 files changed, 144 insertions(+), 7 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index e101cb7d7c..551c8795f2 100644
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
@@ -184,6 +211,7 @@
 #define NVME_NUM_FW_SLOTS 1
 #define NVME_DEFAULT_MAX_ZA_SIZE (128 * KiB)
 #define NVME_MAX_VFS 127
+#define NVME_VF_RES_GRANULARITY 1
 #define NVME_VF_OFFSET 0x1
 #define NVME_VF_STRIDE 1
 
@@ -6359,6 +6387,54 @@ static void nvme_check_constraints(NvmeCtrl *n, Error **errp)
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
+            error_setg(errp, "sriov_vq_flexible - max_ioqpairs (PF-private"
+                       " queue resources) must be greater than or equal to 2");
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
+            error_setg(errp, "sriov_vi_flexible - msix_qsize (PF-private"
+                       " interrupt resources) must be greater than or equal"
+                       " to 1");
+            return;
+        }
+
+        if (params->sriov_max_vi_per_vf &&
+            (params->sriov_max_vi_per_vf - 1) % NVME_VF_RES_GRANULARITY) {
+            error_setg(errp, "sriov_max_vi_per_vf must meet:"
+                       " (X - 1) %% %d == 0 and X >= 1",
+                       NVME_VF_RES_GRANULARITY);
+            return;
+        }
+
+        if (params->sriov_max_vq_per_vf &&
+            (params->sriov_max_vq_per_vf < 2 ||
+             (params->sriov_max_vq_per_vf - 1) % NVME_VF_RES_GRANULARITY)) {
+            error_setg(errp, "sriov_max_vq_per_vf must meet:"
+                       " (X - 1) %% %d == 0 and X >= 2",
+                       NVME_VF_RES_GRANULARITY);
+            return;
+        }
     }
 }
 
@@ -6367,10 +6443,19 @@ static void nvme_init_state(NvmeCtrl *n)
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
@@ -6379,14 +6464,41 @@ static void nvme_init_state(NvmeCtrl *n)
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
+                        cap->vqfrt / n->params.sriov_max_vfs;
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
+                        cap->vifrt / n->params.sriov_max_vfs;
+    }
 }
 
 static void nvme_init_cmb(NvmeCtrl *n, PCIDevice *pci_dev)
@@ -6459,11 +6571,14 @@ static uint64_t nvme_bar_size(unsigned total_queues, unsigned total_irqs,
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
@@ -6561,7 +6676,7 @@ static int nvme_init_pci(NvmeCtrl *n, PCIDevice *pci_dev, Error **errp)
     }
 
     if (!pci_is_vf(pci_dev) && n->params.sriov_max_vfs) {
-        nvme_init_sriov(n, pci_dev, 0x120, bar_size);
+        nvme_init_sriov(n, pci_dev, 0x120);
     }
 
     return 0;
@@ -6585,6 +6700,7 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
     NvmeIdCtrl *id = &n->id_ctrl;
     uint8_t *pci_conf = pci_dev->config;
     uint64_t cap = ldq_le_p(&n->bar.cap);
+    NvmeSecCtrlEntry *sctrl = nvme_sctrl(n);
 
     id->vid = cpu_to_le16(pci_get_word(pci_conf + PCI_VENDOR_ID));
     id->ssvid = cpu_to_le16(pci_get_word(pci_conf + PCI_SUBSYSTEM_VENDOR_ID));
@@ -6676,6 +6792,10 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
 
     stl_le_p(&n->bar.vs, NVME_SPEC_VER);
     n->bar.intmc = n->bar.intms = 0;
+
+    if (pci_is_vf(&n->parent_obj) && !sctrl->scs) {
+        stl_le_p(&n->bar.csts, NVME_CSTS_FAILED);
+    }
 }
 
 static int nvme_init_subsys(NvmeCtrl *n, Error **errp)
@@ -6816,6 +6936,14 @@ static Property nvme_props[] = {
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
index 1401ac3904..bec56b01dd 100644
--- a/hw/nvme/nvme.h
+++ b/hw/nvme/nvme.h
@@ -397,6 +397,10 @@ typedef struct NvmeParams {
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
index 96595ea8f1..26672d0a31 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -1488,6 +1488,11 @@ typedef struct QEMU_PACKED NvmePriCtrlCap {
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


