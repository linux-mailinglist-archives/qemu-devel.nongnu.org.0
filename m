Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D7747C1B0
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 15:42:03 +0100 (CET)
Received: from localhost ([::1]:46976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzgL4-0006ZQ-MY
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 09:42:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.maniak@linux.intel.com>)
 id 1mzgEZ-0001V4-Jo; Tue, 21 Dec 2021 09:35:19 -0500
Received: from mga07.intel.com ([134.134.136.100]:43276)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.maniak@linux.intel.com>)
 id 1mzgET-0002TM-J9; Tue, 21 Dec 2021 09:35:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640097313; x=1671633313;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gZqMxjoAdXJWO1Ku6mvclRhDRE6wgb79MZeEF9MiDag=;
 b=Ipuej4UrjjuDQdE/olSaVg8v+g4TR5MG/OU5AgfnyZX28egy4lPjDm2C
 BgtYPeBJ5LM+f6k6mxpg730ugFQ/YEN+92Njs4ujVNdSuGu6P4GUv4uv9
 xDDwfzQfBQNwMx694Tri330Zi0zgqiN/TuW/YkDxatdb8cRgZc8vFZr/h
 W5E/8BDiF4zKLuuLKCW14zHslCXOXiwHAJlQben9rbwXfW+bl8TuN75RZ
 k5KUuSf0pLJw1oKtgqEXAT+enlqWnkZun01b2b2BrGXqHjDg/odY7O2rc
 McjRGI1EXhJcBk/+xrM9i7ceECLopXgO2cbzWXryJUmj0niWYwuJS3Hhp g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10204"; a="303773000"
X-IronPort-AV: E=Sophos;i="5.88,223,1635231600"; d="scan'208";a="303773000"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2021 06:35:12 -0800
X-IronPort-AV: E=Sophos;i="5.88,223,1635231600"; d="scan'208";a="484429351"
Received: from lmaniak-dev.igk.intel.com ([10.55.249.72])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2021 06:35:08 -0800
From: Lukasz Maniak <lukasz.maniak@linux.intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 09/15] hw/nvme: Make max_ioqpairs and msix_qsize
 configurable in runtime
Date: Tue, 21 Dec 2021 15:32:40 +0100
Message-Id: <20211221143246.2052050-10-lukasz.maniak@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211221143246.2052050-1-lukasz.maniak@linux.intel.com>
References: <20211221143246.2052050-1-lukasz.maniak@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=134.134.136.100;
 envelope-from=lukasz.maniak@linux.intel.com; helo=mga07.intel.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: Klaus Jensen <its@irrelevant.dk>, Keith Busch <kbusch@kernel.org>,
 Lukasz Maniak <lukasz.maniak@linux.intel.com>, qemu-block@nongnu.org,
 =?UTF-8?q?=C5=81ukasz=20Gieryk?= <lukasz.gieryk@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Łukasz Gieryk <lukasz.gieryk@linux.intel.com>

The NVMe device defines two properties: max_ioqpairs, msix_qsize. Having
them as constants is problematic for SR-IOV support.

SR-IOV introduces virtual resources (queues, interrupts) that can be
assigned to PF and its dependent VFs. Each device, following a reset,
should work with the configured number of queues. A single constant is
no longer sufficient to hold the whole state.

This patch tries to solve the problem by introducing additional
variables in NvmeCtrl’s state. The variables for, e.g., managing queues
are therefore organized as:
 - n->params.max_ioqpairs – no changes, constant set by the user
 - n->(mutable_state) – (not a part of this patch) user-configurable,
                        specifies number of queues available _after_
                        reset
 - n->conf_ioqpairs - (new) used in all the places instead of the ‘old’
                      n->params.max_ioqpairs; initialized in realize()
                      and updated during reset() to reflect user’s
                      changes to the mutable state

Since the number of available i/o queues and interrupts can change in
runtime, buffers for sq/cqs and the MSIX-related structures are
allocated big enough to handle the limits, to completely avoid the
complicated reallocation. A helper function (nvme_update_msixcap_ts)
updates the corresponding capability register, to signal configuration
changes.

Signed-off-by: Łukasz Gieryk <lukasz.gieryk@linux.intel.com>
---
 hw/nvme/ctrl.c | 52 ++++++++++++++++++++++++++++++++++----------------
 hw/nvme/nvme.h |  2 ++
 2 files changed, 38 insertions(+), 16 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 9e83b4dd76..de463450b6 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -416,12 +416,12 @@ static bool nvme_nsid_valid(NvmeCtrl *n, uint32_t nsid)
 
 static int nvme_check_sqid(NvmeCtrl *n, uint16_t sqid)
 {
-    return sqid < n->params.max_ioqpairs + 1 && n->sq[sqid] != NULL ? 0 : -1;
+    return sqid < n->conf_ioqpairs + 1 && n->sq[sqid] != NULL ? 0 : -1;
 }
 
 static int nvme_check_cqid(NvmeCtrl *n, uint16_t cqid)
 {
-    return cqid < n->params.max_ioqpairs + 1 && n->cq[cqid] != NULL ? 0 : -1;
+    return cqid < n->conf_ioqpairs + 1 && n->cq[cqid] != NULL ? 0 : -1;
 }
 
 static void nvme_inc_cq_tail(NvmeCQueue *cq)
@@ -4034,8 +4034,7 @@ static uint16_t nvme_create_sq(NvmeCtrl *n, NvmeRequest *req)
         trace_pci_nvme_err_invalid_create_sq_cqid(cqid);
         return NVME_INVALID_CQID | NVME_DNR;
     }
-    if (unlikely(!sqid || sqid > n->params.max_ioqpairs ||
-        n->sq[sqid] != NULL)) {
+    if (unlikely(!sqid || sqid > n->conf_ioqpairs || n->sq[sqid] != NULL)) {
         trace_pci_nvme_err_invalid_create_sq_sqid(sqid);
         return NVME_INVALID_QID | NVME_DNR;
     }
@@ -4387,8 +4386,7 @@ static uint16_t nvme_create_cq(NvmeCtrl *n, NvmeRequest *req)
     trace_pci_nvme_create_cq(prp1, cqid, vector, qsize, qflags,
                              NVME_CQ_FLAGS_IEN(qflags) != 0);
 
-    if (unlikely(!cqid || cqid > n->params.max_ioqpairs ||
-        n->cq[cqid] != NULL)) {
+    if (unlikely(!cqid || cqid > n->conf_ioqpairs || n->cq[cqid] != NULL)) {
         trace_pci_nvme_err_invalid_create_cq_cqid(cqid);
         return NVME_INVALID_QID | NVME_DNR;
     }
@@ -4404,7 +4402,7 @@ static uint16_t nvme_create_cq(NvmeCtrl *n, NvmeRequest *req)
         trace_pci_nvme_err_invalid_create_cq_vector(vector);
         return NVME_INVALID_IRQ_VECTOR | NVME_DNR;
     }
-    if (unlikely(vector >= n->params.msix_qsize)) {
+    if (unlikely(vector >= n->conf_msix_qsize)) {
         trace_pci_nvme_err_invalid_create_cq_vector(vector);
         return NVME_INVALID_IRQ_VECTOR | NVME_DNR;
     }
@@ -5000,13 +4998,12 @@ defaults:
 
         break;
     case NVME_NUMBER_OF_QUEUES:
-        result = (n->params.max_ioqpairs - 1) |
-            ((n->params.max_ioqpairs - 1) << 16);
+        result = (n->conf_ioqpairs - 1) | ((n->conf_ioqpairs - 1) << 16);
         trace_pci_nvme_getfeat_numq(result);
         break;
     case NVME_INTERRUPT_VECTOR_CONF:
         iv = dw11 & 0xffff;
-        if (iv >= n->params.max_ioqpairs + 1) {
+        if (iv >= n->conf_ioqpairs + 1) {
             return NVME_INVALID_FIELD | NVME_DNR;
         }
 
@@ -5161,10 +5158,10 @@ static uint16_t nvme_set_feature(NvmeCtrl *n, NvmeRequest *req)
 
         trace_pci_nvme_setfeat_numq((dw11 & 0xffff) + 1,
                                     ((dw11 >> 16) & 0xffff) + 1,
-                                    n->params.max_ioqpairs,
-                                    n->params.max_ioqpairs);
-        req->cqe.result = cpu_to_le32((n->params.max_ioqpairs - 1) |
-                                      ((n->params.max_ioqpairs - 1) << 16));
+                                    n->conf_ioqpairs,
+                                    n->conf_ioqpairs);
+        req->cqe.result = cpu_to_le32((n->conf_ioqpairs - 1) |
+                                      ((n->conf_ioqpairs - 1) << 16));
         break;
     case NVME_ASYNCHRONOUS_EVENT_CONF:
         n->features.async_config = dw11;
@@ -5602,8 +5599,24 @@ static void nvme_process_sq(void *opaque)
     }
 }
 
+static void nvme_update_msixcap_ts(PCIDevice *pci_dev, uint32_t table_size)
+{
+    uint8_t *config;
+
+    if (!msix_present(pci_dev)) {
+        return;
+    }
+
+    assert(table_size > 0 && table_size <= pci_dev->msix_entries_nr);
+
+    config = pci_dev->config + pci_dev->msix_cap;
+    pci_set_word_by_mask(config + PCI_MSIX_FLAGS, PCI_MSIX_FLAGS_QSIZE,
+                         table_size - 1);
+}
+
 static void nvme_ctrl_reset(NvmeCtrl *n, NvmeResetType rst)
 {
+    PCIDevice *pci_dev = &n->parent_obj;
     NvmeNamespace *ns;
     int i;
 
@@ -5633,15 +5646,17 @@ static void nvme_ctrl_reset(NvmeCtrl *n, NvmeResetType rst)
         g_free(event);
     }
 
-    if (!pci_is_vf(&n->parent_obj) && n->params.sriov_max_vfs) {
+    if (!pci_is_vf(pci_dev) && n->params.sriov_max_vfs) {
         if (rst != NVME_RESET_CONTROLLER) {
-            pcie_sriov_pf_disable_vfs(&n->parent_obj);
+            pcie_sriov_pf_disable_vfs(pci_dev);
         }
     }
 
     n->aer_queued = 0;
     n->outstanding_aers = 0;
     n->qs_created = false;
+
+    nvme_update_msixcap_ts(pci_dev, n->conf_msix_qsize);
 }
 
 static void nvme_ctrl_shutdown(NvmeCtrl *n)
@@ -6352,6 +6367,9 @@ static void nvme_init_state(NvmeCtrl *n)
     NvmeSecCtrlEntry *sctrl;
     int i;
 
+    n->conf_ioqpairs = n->params.max_ioqpairs;
+    n->conf_msix_qsize = n->params.msix_qsize;
+
     /* add one to max_ioqpairs to account for the admin queue pair */
     n->reg_size = pow2ceil(sizeof(NvmeBar) +
                            2 * (n->params.max_ioqpairs + 1) * NVME_DB_SIZE);
@@ -6513,6 +6531,8 @@ static int nvme_init_pci(NvmeCtrl *n, PCIDevice *pci_dev, Error **errp)
         }
     }
 
+    nvme_update_msixcap_ts(pci_dev, n->conf_msix_qsize);
+
     if (n->params.cmb_size_mb) {
         nvme_init_cmb(n, pci_dev);
     }
diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
index 6713493380..927890b490 100644
--- a/hw/nvme/nvme.h
+++ b/hw/nvme/nvme.h
@@ -424,6 +424,8 @@ typedef struct NvmeCtrl {
     uint64_t    starttime_ms;
     uint16_t    temperature;
     uint8_t     smart_critical_warning;
+    uint32_t    conf_msix_qsize;
+    uint32_t    conf_ioqpairs;
 
     struct {
         MemoryRegion mem;
-- 
2.25.1


