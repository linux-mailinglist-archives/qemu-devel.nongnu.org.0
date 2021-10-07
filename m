Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9110D425949
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 19:21:28 +0200 (CEST)
Received: from localhost ([::1]:45546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYX5D-0003vt-I1
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 13:21:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.maniak@linux.intel.com>)
 id 1mYWQP-0001JB-Mv; Thu, 07 Oct 2021 12:39:17 -0400
Received: from mga04.intel.com ([192.55.52.120]:55444)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.maniak@linux.intel.com>)
 id 1mYWQN-00007p-2i; Thu, 07 Oct 2021 12:39:17 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10130"; a="225073031"
X-IronPort-AV: E=Sophos;i="5.85,355,1624345200"; d="scan'208";a="225073031"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2021 09:26:08 -0700
X-IronPort-AV: E=Sophos;i="5.85,355,1624345200"; d="scan'208";a="624325909"
Received: from lmaniak-dev.igk.intel.com ([10.55.248.48])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2021 09:26:07 -0700
From: Lukasz Maniak <lukasz.maniak@linux.intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/15] hw/nvme: Make max_ioqpairs and msix_qsize configurable
 in runtime
Date: Thu,  7 Oct 2021 18:24:01 +0200
Message-Id: <20211007162406.1920374-11-lukasz.maniak@linux.intel.com>
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

The Nvme device defines two properties: max_ioqpairs, msix_qsize. Having
them as constants is problematic for SR-IOV support.

The SR-IOV feature introduces virtual resources (queues, interrupts)
that can be assigned to PF and its dependent VFs. Each device, following
a reset, should work with the configured number of queues. A single
constant is no longer sufficient to hold the whole state.

This patch tries to solve the problem by introducing additional
variables in NvmeCtrl’s state. The variables for, e.g., managing queues
are therefore organized as:

 - n->params.max_ioqpairs – no changes, constant set by the user.

 - n->max_ioqpairs - (new) value derived from n->params.* in realize();
                     constant through device’s lifetime.

 - n->(mutable_state) – (not a part of this patch) user-configurable,
                        specifies number of queues available _after_
                        reset.

 - n->conf_ioqpairs - (new) used in all the places instead of the ‘old’
                      n->params.max_ioqpairs; initialized in realize()
                      and updated during reset() to reflect user’s
                      changes to the mutable state.

Since the number of available i/o queues and interrupts can change in
runtime, buffers for sq/cqs and the MSIX-related structures are
allocated big enough to handle the limits, to completely avoid the
complicated reallocation. A helper function (nvme_update_msixcap_ts)
updates the corresponding capability register, to signal configuration
changes.

Signed-off-by: Łukasz Gieryk <lukasz.gieryk@linux.intel.com>
---
 hw/nvme/ctrl.c | 62 +++++++++++++++++++++++++++++++++-----------------
 hw/nvme/nvme.h |  4 ++++
 2 files changed, 45 insertions(+), 21 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index b04cf5eae9..5d9166d66f 100644
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
@@ -4382,8 +4381,7 @@ static uint16_t nvme_create_cq(NvmeCtrl *n, NvmeRequest *req)
     trace_pci_nvme_create_cq(prp1, cqid, vector, qsize, qflags,
                              NVME_CQ_FLAGS_IEN(qflags) != 0);
 
-    if (unlikely(!cqid || cqid > n->params.max_ioqpairs ||
-        n->cq[cqid] != NULL)) {
+    if (unlikely(!cqid || cqid > n->conf_ioqpairs || n->cq[cqid] != NULL)) {
         trace_pci_nvme_err_invalid_create_cq_cqid(cqid);
         return NVME_INVALID_QID | NVME_DNR;
     }
@@ -4399,7 +4397,7 @@ static uint16_t nvme_create_cq(NvmeCtrl *n, NvmeRequest *req)
         trace_pci_nvme_err_invalid_create_cq_vector(vector);
         return NVME_INVALID_IRQ_VECTOR | NVME_DNR;
     }
-    if (unlikely(vector >= n->params.msix_qsize)) {
+    if (unlikely(vector >= n->conf_msix_qsize)) {
         trace_pci_nvme_err_invalid_create_cq_vector(vector);
         return NVME_INVALID_IRQ_VECTOR | NVME_DNR;
     }
@@ -4980,13 +4978,12 @@ defaults:
 
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
 
@@ -5141,10 +5138,10 @@ static uint16_t nvme_set_feature(NvmeCtrl *n, NvmeRequest *req)
 
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
@@ -5582,8 +5579,21 @@ static void nvme_process_sq(void *opaque)
     }
 }
 
+static void nvme_update_msixcap_ts(PCIDevice *pci_dev, uint32_t table_size)
+{
+    uint8_t *config;
+
+    assert(pci_dev->msix_cap);
+    assert(table_size <= pci_dev->msix_entries_nr);
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
 
@@ -5596,12 +5606,12 @@ static void nvme_ctrl_reset(NvmeCtrl *n, NvmeResetType rst)
         nvme_ns_drain(ns);
     }
 
-    for (i = 0; i < n->params.max_ioqpairs + 1; i++) {
+    for (i = 0; i < n->max_ioqpairs + 1; i++) {
         if (n->sq[i] != NULL) {
             nvme_free_sq(n->sq[i], n);
         }
     }
-    for (i = 0; i < n->params.max_ioqpairs + 1; i++) {
+    for (i = 0; i < n->max_ioqpairs + 1; i++) {
         if (n->cq[i] != NULL) {
             nvme_free_cq(n->cq[i], n);
         }
@@ -5613,15 +5623,17 @@ static void nvme_ctrl_reset(NvmeCtrl *n, NvmeResetType rst)
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
@@ -6322,11 +6334,17 @@ static void nvme_init_state(NvmeCtrl *n)
     NvmeSecCtrlEntry *sctrl;
     int i;
 
+    n->max_ioqpairs = n->params.max_ioqpairs;
+    n->conf_ioqpairs = n->max_ioqpairs;
+
+    n->max_msix_qsize = n->params.msix_qsize;
+    n->conf_msix_qsize = n->max_msix_qsize;
+
     /* add one to max_ioqpairs to account for the admin queue pair */
     n->reg_size = pow2ceil(sizeof(NvmeBar) +
                            2 * (n->params.max_ioqpairs + 1) * NVME_DB_SIZE);
-    n->sq = g_new0(NvmeSQueue *, n->params.max_ioqpairs + 1);
-    n->cq = g_new0(NvmeCQueue *, n->params.max_ioqpairs + 1);
+    n->sq = g_new0(NvmeSQueue *, n->max_ioqpairs + 1);
+    n->cq = g_new0(NvmeCQueue *, n->max_ioqpairs + 1);
     n->temperature = NVME_TEMPERATURE;
     n->features.temp_thresh_hi = NVME_TEMPERATURE_WARNING;
     n->starttime_ms = qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL);
@@ -6491,7 +6509,7 @@ static int nvme_init_pci(NvmeCtrl *n, PCIDevice *pci_dev, Error **errp)
         pci_register_bar(pci_dev, 0, PCI_BASE_ADDRESS_SPACE_MEMORY |
                          PCI_BASE_ADDRESS_MEM_TYPE_64, &n->bar0);
     }
-    ret = msix_init(pci_dev, n->params.msix_qsize,
+    ret = msix_init(pci_dev, n->max_msix_qsize,
                     &n->bar0, 0, msix_table_offset,
                     &n->bar0, 0, msix_pba_offset, 0, &err);
     if (ret < 0) {
@@ -6503,6 +6521,8 @@ static int nvme_init_pci(NvmeCtrl *n, PCIDevice *pci_dev, Error **errp)
         }
     }
 
+    nvme_update_msixcap_ts(pci_dev, n->conf_msix_qsize);
+
     if (n->params.cmb_size_mb) {
         nvme_init_cmb(n, pci_dev);
     }
diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
index 9fbb0a70b5..65383e495c 100644
--- a/hw/nvme/nvme.h
+++ b/hw/nvme/nvme.h
@@ -420,6 +420,10 @@ typedef struct NvmeCtrl {
     uint64_t    starttime_ms;
     uint16_t    temperature;
     uint8_t     smart_critical_warning;
+    uint32_t    max_msix_qsize;                 /* Derived from params.msix.qsize */
+    uint32_t    conf_msix_qsize;                /* Configured limit */
+    uint32_t    max_ioqpairs;                   /* Derived from params.max_ioqpairs */
+    uint32_t    conf_ioqpairs;                  /* Configured limit */
 
     struct {
         MemoryRegion mem;
-- 
2.25.1


