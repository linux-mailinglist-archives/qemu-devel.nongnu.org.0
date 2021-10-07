Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98855425957
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 19:24:25 +0200 (CEST)
Received: from localhost ([::1]:56998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYX84-0003Co-D3
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 13:24:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.maniak@linux.intel.com>)
 id 1mYWQW-0001bm-Ly; Thu, 07 Oct 2021 12:39:24 -0400
Received: from mga04.intel.com ([192.55.52.120]:55434)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.maniak@linux.intel.com>)
 id 1mYWQT-0008BP-Dn; Thu, 07 Oct 2021 12:39:24 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10130"; a="225073098"
X-IronPort-AV: E=Sophos;i="5.85,355,1624345200"; d="scan'208";a="225073098"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2021 09:26:13 -0700
X-IronPort-AV: E=Sophos;i="5.85,355,1624345200"; d="scan'208";a="624325943"
Received: from lmaniak-dev.igk.intel.com ([10.55.248.48])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2021 09:26:10 -0700
From: Lukasz Maniak <lukasz.maniak@linux.intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 12/15] hw/nvme: Initialize capability structures for
 primary/secondary controllers
Date: Thu,  7 Oct 2021 18:24:03 +0200
Message-Id: <20211007162406.1920374-13-lukasz.maniak@linux.intel.com>
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org,
 =?UTF-8?q?=C5=81ukasz=20Gieryk?= <lukasz.gieryk@linux.intel.com>,
 Lukasz Maniak <lukasz.maniak@linux.intel.com>,
 Klaus Jensen <its@irrelevant.dk>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Łukasz Gieryk <lukasz.gieryk@linux.intel.com>

With two new properties (sriov_max_vi_per_vf, sriov_max_vq_per_vf) one
can configure the maximum number of virtual queues and interrupts
assignable to a single virtual device. The primary and secondary
controller capability structures are initialized accordingly.

Since the number of available queues (interrupts) now varies between
VF/PF, BAR size calculation is also adjusted.

Signed-off-by: Łukasz Gieryk <lukasz.gieryk@linux.intel.com>
---
 hw/nvme/ctrl.c       | 110 +++++++++++++++++++++++++++++++++++++++----
 hw/nvme/nvme.h       |   2 +
 include/block/nvme.h |   5 ++
 3 files changed, 108 insertions(+), 9 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 425fbf2c73..67c7210d7e 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -36,6 +36,8 @@
  *              zoned.zasl=<N[optional]>, \
  *              zoned.auto_transition=<on|off[optional]>, \
  *              sriov_max_vfs=<N[optional]> \
+ *              sriov_max_vi_per_vf=<N[optional]> \
+ *              sriov_max_vq_per_vf=<N[optional]> \
  *              subsys=<subsys_id>
  *      -device nvme-ns,drive=<drive_id>,bus=<bus_name>,nsid=<nsid>,\
  *              zoned=<true|false[optional]>, \
@@ -113,6 +115,18 @@
  *   enables reporting of both SR-IOV and ARI capabilities by the NVMe device.
  *   Virtual function controllers will not report SR-IOV capability.
  *
+ * - `sriov_max_vi_per_vf`
+ *   Indicates the maximum number of virtual interrupt resources assignable
+ *   to a secondary controller. Must be explicitly set if sriov_max_vfs != 0.
+ *   The parameter affect VFs similarly to how msix_qsize affects PF, i.e.,
+ *   determines the number of interrupts available to all queues (admin, io).
+ *
+ * - `sriov_max_vq_per_vf`
+ *   Indicates the maximum number of virtual queue resources assignable to
+ *   a secondary controller. Must be explicitly set if sriov_max_vfs != 0.
+ *   The parameter affect VFs similarly to how max_ioqpairs affects PF,
+ *   except the number of flexible queues includes the admin queue.
+ *
  * nvme namespace device parameters
  * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  * - `shared`
@@ -184,6 +198,7 @@
 #define NVME_NUM_FW_SLOTS 1
 #define NVME_DEFAULT_MAX_ZA_SIZE (128 * KiB)
 #define NVME_MAX_VFS 127
+#define NVME_VF_RES_GRANULARITY 1
 #define NVME_VF_OFFSET 0x1
 #define NVME_VF_STRIDE 1
 
@@ -6254,6 +6269,7 @@ static const MemoryRegionOps nvme_cmb_ops = {
 static void nvme_check_constraints(NvmeCtrl *n, Error **errp)
 {
     NvmeParams *params = &n->params;
+    int msix_total;
 
     if (params->num_queues) {
         warn_report("num_queues is deprecated; please use max_ioqpairs "
@@ -6324,6 +6340,30 @@ static void nvme_check_constraints(NvmeCtrl *n, Error **errp)
                        NVME_MAX_VFS);
             return;
         }
+
+        if (params->sriov_max_vi_per_vf < 1 ||
+            (params->sriov_max_vi_per_vf - 1) % NVME_VF_RES_GRANULARITY) {
+            error_setg(errp, "sriov_max_vi_per_vf must meet:"
+                       " (X - 1) %% %d == 0 and X >= 1",
+                       NVME_VF_RES_GRANULARITY);
+            return;
+        }
+
+        if (params->sriov_max_vq_per_vf < 2 ||
+            (params->sriov_max_vq_per_vf - 1) % NVME_VF_RES_GRANULARITY) {
+            error_setg(errp, "sriov_max_vq_per_vf must meet:"
+                       " (X - 1) %% %d == 0 and X >= 2",
+                       NVME_VF_RES_GRANULARITY);
+            return;
+        }
+
+        msix_total = params->msix_qsize +
+                     params->sriov_max_vfs * params->sriov_max_vi_per_vf;
+        if (msix_total > PCI_MSIX_FLAGS_QSIZE + 1) {
+            error_setg(errp, "sriov_max_vi_per_vf is too big for max_vfs=%d",
+                       params->sriov_max_vfs);
+            return;
+        }
     }
 }
 
@@ -6332,13 +6372,35 @@ static void nvme_init_state(NvmeCtrl *n)
     NvmePriCtrlCap *cap = &n->pri_ctrl_cap;
     NvmeSecCtrlList *list = &n->sec_ctrl_list;
     NvmeSecCtrlEntry *sctrl;
+    uint8_t max_vfs;
+    uint32_t total_vq, total_vi;
     int i;
 
-    n->max_ioqpairs = n->params.max_ioqpairs;
-    n->conf_ioqpairs = n->max_ioqpairs;
+    if (pci_is_vf(&n->parent_obj)) {
+        sctrl = nvme_sctrl(n);
+
+        max_vfs = 0;
+
+        n->max_ioqpairs = n->params.sriov_max_vq_per_vf - 1;
+        n->conf_ioqpairs = sctrl->nvq ? le16_to_cpu(sctrl->nvq) - 1 : 0;
+
+        n->max_msix_qsize = n->params.sriov_max_vi_per_vf;
+        n->conf_msix_qsize = sctrl->nvi ? le16_to_cpu(sctrl->nvi) : 1;
+    } else {
+        max_vfs = n->params.sriov_max_vfs;
+
+        n->max_ioqpairs = n->params.max_ioqpairs +
+                          max_vfs * n->params.sriov_max_vq_per_vf;
+        n->conf_ioqpairs = n->max_ioqpairs;
+
+        n->max_msix_qsize = n->params.msix_qsize +
+                            max_vfs * n->params.sriov_max_vi_per_vf;
+        n->conf_msix_qsize = n->max_msix_qsize;
+    }
+
+    total_vq = n->params.sriov_max_vq_per_vf * max_vfs;
+    total_vi = n->params.sriov_max_vi_per_vf * max_vfs;
 
-    n->max_msix_qsize = n->params.msix_qsize;
-    n->conf_msix_qsize = n->max_msix_qsize;
     n->sq = g_new0(NvmeSQueue *, n->max_ioqpairs + 1);
     n->cq = g_new0(NvmeCQueue *, n->max_ioqpairs + 1);
     n->temperature = NVME_TEMPERATURE;
@@ -6346,13 +6408,34 @@ static void nvme_init_state(NvmeCtrl *n)
     n->starttime_ms = qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL);
     n->aer_reqs = g_new0(NvmeRequest *, n->params.aerl + 1);
 
-    list->numcntl = cpu_to_le16(n->params.sriov_max_vfs);
-    for (i = 0; i < n->params.sriov_max_vfs; i++) {
+    list->numcntl = cpu_to_le16(max_vfs);
+    for (i = 0; i < max_vfs; i++) {
         sctrl = &list->sec[i];
         sctrl->pcid = cpu_to_le16(n->cntlid);
     }
 
     cap->cntlid = cpu_to_le16(n->cntlid);
+    cap->crt = NVME_CRT_VQ | NVME_CRT_VI;
+
+    cap->vqfrt = cpu_to_le32(total_vq);
+    cap->vqrfap = cpu_to_le32(total_vq);
+    if (pci_is_vf(&n->parent_obj)) {
+        cap->vqprt = cpu_to_le16(n->conf_ioqpairs + 1);
+    } else {
+        cap->vqprt = cpu_to_le16(n->params.max_ioqpairs + 1);
+        cap->vqfrsm = cpu_to_le16(n->params.sriov_max_vq_per_vf);
+        cap->vqgran = cpu_to_le16(NVME_VF_RES_GRANULARITY);
+    }
+
+    cap->vifrt = cpu_to_le32(total_vi);
+    cap->virfap = cpu_to_le32(total_vi);
+    if (pci_is_vf(&n->parent_obj)) {
+        cap->viprt = cpu_to_le16(n->conf_msix_qsize);
+    } else {
+        cap->viprt = cpu_to_le16(n->params.msix_qsize);
+        cap->vifrsm = cpu_to_le16(n->params.sriov_max_vi_per_vf);
+        cap->vigran = cpu_to_le16(NVME_VF_RES_GRANULARITY);
+    }
 }
 
 static void nvme_init_cmb(NvmeCtrl *n, PCIDevice *pci_dev)
@@ -6448,11 +6531,13 @@ static void nvme_update_vfs(PCIDevice *pci_dev, uint16_t prev_num_vfs,
     }
 }
 
-static void nvme_init_sriov(NvmeCtrl *n, PCIDevice *pci_dev, uint16_t offset,
-                            uint64_t bar_size)
+static void nvme_init_sriov(NvmeCtrl *n, PCIDevice *pci_dev, uint16_t offset)
 {
     uint16_t vf_dev_id = n->params.use_intel_id ?
                          PCI_DEVICE_ID_INTEL_NVME : PCI_DEVICE_ID_REDHAT_NVME;
+    uint64_t bar_size = nvme_bar_size(n->params.sriov_max_vq_per_vf,
+                                      n->params.sriov_max_vi_per_vf,
+                                      NULL, NULL);
 
     pcie_sriov_pf_init(pci_dev, offset, "nvme", vf_dev_id,
                        n->params.sriov_max_vfs, n->params.sriov_max_vfs,
@@ -6550,7 +6635,7 @@ static int nvme_init_pci(NvmeCtrl *n, PCIDevice *pci_dev, Error **errp)
     }
 
     if (!pci_is_vf(pci_dev) && n->params.sriov_max_vfs) {
-        nvme_init_sriov(n, pci_dev, 0x120, bar_size);
+        nvme_init_sriov(n, pci_dev, 0x120);
     }
 
     return 0;
@@ -6574,6 +6659,7 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
     NvmeIdCtrl *id = &n->id_ctrl;
     uint8_t *pci_conf = pci_dev->config;
     uint64_t cap = ldq_le_p(&n->bar.cap);
+    NvmeSecCtrlEntry *sctrl = nvme_sctrl(n);
 
     id->vid = cpu_to_le16(pci_get_word(pci_conf + PCI_VENDOR_ID));
     id->ssvid = cpu_to_le16(pci_get_word(pci_conf + PCI_SUBSYSTEM_VENDOR_ID));
@@ -6665,6 +6751,10 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
 
     stl_le_p(&n->bar.vs, NVME_SPEC_VER);
     n->bar.intmc = n->bar.intms = 0;
+
+    if (pci_is_vf(&n->parent_obj) && !sctrl->scs) {
+        stl_le_p(&n->bar.csts, NVME_CSTS_FAILED);
+    }
 }
 
 static int nvme_init_subsys(NvmeCtrl *n, Error **errp)
@@ -6804,6 +6894,8 @@ static Property nvme_props[] = {
     DEFINE_PROP_BOOL("zoned.auto_transition", NvmeCtrl,
                      params.auto_transition_zones, true),
     DEFINE_PROP_UINT8("sriov_max_vfs", NvmeCtrl, params.sriov_max_vfs, 0),
+    DEFINE_PROP_UINT8("sriov_max_vi_per_vf", NvmeCtrl, params.sriov_max_vi_per_vf, 0),
+    DEFINE_PROP_UINT8("sriov_max_vq_per_vf", NvmeCtrl, params.sriov_max_vq_per_vf, 0),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
index a8eded4713..43609c979a 100644
--- a/hw/nvme/nvme.h
+++ b/hw/nvme/nvme.h
@@ -393,6 +393,8 @@ typedef struct NvmeParams {
     bool     auto_transition_zones;
     bool     legacy_cmb;
     uint8_t  sriov_max_vfs;
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


