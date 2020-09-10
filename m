Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE9AB26450E
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Sep 2020 13:05:56 +0200 (CEST)
Received: from localhost ([::1]:53822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kGKOp-0004k3-Oy
	for lists+qemu-devel@lfdr.de; Thu, 10 Sep 2020 07:05:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yi.l.liu@intel.com>)
 id 1kGKFH-0005DE-GP
 for qemu-devel@nongnu.org; Thu, 10 Sep 2020 06:56:03 -0400
Received: from mga03.intel.com ([134.134.136.65]:26688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yi.l.liu@intel.com>)
 id 1kGKFF-0005xR-3r
 for qemu-devel@nongnu.org; Thu, 10 Sep 2020 06:56:03 -0400
IronPort-SDR: Doxa+vq1tEdFtuQeJCC1eCHPxHpbTI4mFAl/RCx0+HgngPGuLOKmkIzaddIiAUYjTHSHWdj00B
 fwpi1OWreITA==
X-IronPort-AV: E=McAfee;i="6000,8403,9739"; a="158545510"
X-IronPort-AV: E=Sophos;i="5.76,412,1592895600"; d="scan'208";a="158545510"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2020 03:54:40 -0700
IronPort-SDR: awgJgjM+1XkfwqXBKrDB0Iu8nuDSuJs2USH2TwyXEXMUuDlXJdJ+pPyZq/USKot8tUrfBZaWi+
 UkUgXqRS5vmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,412,1592895600"; d="scan'208";a="334140088"
Received: from jacob-builder.jf.intel.com ([10.7.199.155])
 by orsmga008.jf.intel.com with ESMTP; 10 Sep 2020 03:54:40 -0700
From: Liu Yi L <yi.l.liu@intel.com>
To: qemu-devel@nongnu.org, alex.williamson@redhat.com, peterx@redhat.com,
 jasowang@redhat.com
Subject: [RFC v10 18/25] intel_iommu: bind/unbind guest page table to host
Date: Thu, 10 Sep 2020 03:56:31 -0700
Message-Id: <1599735398-6829-19-git-send-email-yi.l.liu@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1599735398-6829-1-git-send-email-yi.l.liu@intel.com>
References: <1599735398-6829-1-git-send-email-yi.l.liu@intel.com>
Received-SPF: pass client-ip=134.134.136.65; envelope-from=yi.l.liu@intel.com;
 helo=mga03.intel.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/10 06:54:39
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: jean-philippe@linaro.org, kevin.tian@intel.com, yi.l.liu@intel.com,
 Yi Sun <yi.y.sun@linux.intel.com>, kvm@vger.kernel.org, mst@redhat.com,
 jun.j.tian@intel.com, eric.auger@redhat.com, yi.y.sun@intel.com,
 Jacob Pan <jacob.jun.pan@linux.intel.com>, pbonzini@redhat.com,
 hao.wu@intel.com, Richard Henderson <rth@twiddle.net>,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch captures the guest PASID table entry modifications and
propagates the changes to host to setup dual stage DMA translation.
The guest page table is configured as 1st level page table (GVA->GPA)
whose translation result would further go through host VT-d 2nd
level page table(GPA->HPA) under nested translation mode. This is the
key part of vSVA support, and also a key to support IOVA over 1st-
level page table for Intel VT-d in virtualization environment.

Cc: Kevin Tian <kevin.tian@intel.com>
Cc: Jacob Pan <jacob.jun.pan@linux.intel.com>
Cc: Peter Xu <peterx@redhat.com>
Cc: Yi Sun <yi.y.sun@linux.intel.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Richard Henderson <rth@twiddle.net>
Signed-off-by: Liu Yi L <yi.l.liu@intel.com>
---
 hw/i386/intel_iommu.c          | 101 +++++++++++++++++++++++++++++++++++++++--
 hw/i386/intel_iommu_internal.h |  18 ++++++++
 2 files changed, 114 insertions(+), 5 deletions(-)

diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index af17b36..4f6b80f 100644
--- a/hw/i386/intel_iommu.c
+++ b/hw/i386/intel_iommu.c
@@ -41,6 +41,7 @@
 #include "migration/vmstate.h"
 #include "trace.h"
 #include "qemu/jhash.h"
+#include <linux/iommu.h>
 
 /* context entry operations */
 #define VTD_CE_GET_RID2PASID(ce) \
@@ -700,6 +701,16 @@ static inline uint32_t vtd_sm_ce_get_pdt_entry_num(VTDContextEntry *ce)
     return 1U << (VTD_SM_CONTEXT_ENTRY_PDTS(ce->val[0]) + 7);
 }
 
+static inline uint32_t vtd_pe_get_fl_aw(VTDPASIDEntry *pe)
+{
+    return 48 + ((pe->val[2] >> 2) & VTD_SM_PASID_ENTRY_FLPM) * 9;
+}
+
+static inline dma_addr_t vtd_pe_get_flpt_base(VTDPASIDEntry *pe)
+{
+    return pe->val[2] & VTD_SM_PASID_ENTRY_FLPTPTR;
+}
+
 static inline bool vtd_pdire_present(VTDPASIDDirEntry *pdire)
 {
     return pdire->val & 1;
@@ -1861,6 +1872,85 @@ static void vtd_context_global_invalidate(IntelIOMMUState *s)
     vtd_iommu_replay_all(s);
 }
 
+/**
+ * Caller should hold iommu_lock.
+ */
+static int vtd_bind_guest_pasid(IntelIOMMUState *s, VTDBus *vtd_bus,
+                                int devfn, int pasid, VTDPASIDEntry *pe,
+                                VTDPASIDOp op)
+{
+    VTDHostIOMMUContext *vtd_dev_icx;
+    HostIOMMUContext *iommu_ctx;
+    int ret = -1;
+
+    vtd_dev_icx = vtd_bus->dev_icx[devfn];
+    if (!vtd_dev_icx) {
+        /* means no need to go further, e.g. for emulated devices */
+        return 0;
+    }
+
+    iommu_ctx = vtd_dev_icx->iommu_ctx;
+    if (!iommu_ctx) {
+        return -EINVAL;
+    }
+
+    switch (op) {
+    case VTD_PASID_BIND:
+    {
+        struct iommu_gpasid_bind_data *g_bind_data;
+
+        g_bind_data = g_malloc0(sizeof(*g_bind_data));
+
+        g_bind_data->argsz = sizeof(*g_bind_data);
+        g_bind_data->version = IOMMU_GPASID_BIND_VERSION_1;
+        g_bind_data->format = IOMMU_PASID_FORMAT_INTEL_VTD;
+        g_bind_data->gpgd = vtd_pe_get_flpt_base(pe);
+        g_bind_data->addr_width = vtd_pe_get_fl_aw(pe);
+        g_bind_data->hpasid = pasid;
+        g_bind_data->gpasid = pasid;
+        g_bind_data->flags |= IOMMU_SVA_GPASID_VAL;
+        g_bind_data->vendor.vtd.flags =
+                             (VTD_SM_PASID_ENTRY_SRE_BIT(pe->val[2]) ?
+                                            IOMMU_SVA_VTD_GPASID_SRE : 0)
+                           | (VTD_SM_PASID_ENTRY_EAFE_BIT(pe->val[2]) ?
+                                            IOMMU_SVA_VTD_GPASID_EAFE : 0)
+                           | (VTD_SM_PASID_ENTRY_PCD_BIT(pe->val[1]) ?
+                                            IOMMU_SVA_VTD_GPASID_PCD : 0)
+                           | (VTD_SM_PASID_ENTRY_PWT_BIT(pe->val[1]) ?
+                                            IOMMU_SVA_VTD_GPASID_PWT : 0)
+                           | (VTD_SM_PASID_ENTRY_EMTE_BIT(pe->val[1]) ?
+                                            IOMMU_SVA_VTD_GPASID_EMTE : 0)
+                           | (VTD_SM_PASID_ENTRY_CD_BIT(pe->val[1]) ?
+                                            IOMMU_SVA_VTD_GPASID_CD : 0);
+        g_bind_data->vendor.vtd.pat = VTD_SM_PASID_ENTRY_PAT(pe->val[1]);
+        g_bind_data->vendor.vtd.emt = VTD_SM_PASID_ENTRY_EMT(pe->val[1]);
+        ret = host_iommu_ctx_bind_stage1_pgtbl(iommu_ctx, g_bind_data);
+        g_free(g_bind_data);
+        break;
+    }
+    case VTD_PASID_UNBIND:
+    {
+        struct iommu_gpasid_bind_data *g_unbind_data;
+
+        g_unbind_data = g_malloc0(sizeof(*g_unbind_data));
+
+        g_unbind_data->argsz = sizeof(*g_unbind_data);
+        g_unbind_data->version = IOMMU_GPASID_BIND_VERSION_1;
+        g_unbind_data->format = IOMMU_PASID_FORMAT_INTEL_VTD;
+        g_unbind_data->hpasid = pasid;
+        ret = host_iommu_ctx_unbind_stage1_pgtbl(iommu_ctx, g_unbind_data);
+        g_free(g_unbind_data);
+        break;
+    }
+    default:
+        error_report_once("Unknown VTDPASIDOp!!!\n");
+        break;
+    }
+
+
+    return ret;
+}
+
 /* Do a context-cache device-selective invalidation.
  * @func_mask: FM field after shifting
  */
@@ -2489,10 +2579,10 @@ static void vtd_fill_pe_in_cache(IntelIOMMUState *s,
     }
 
     pc_entry->pasid_entry = *pe;
-    /*
-     * TODO:
-     * - send pasid bind to host for passthru devices
-     */
+    vtd_bind_guest_pasid(s, vtd_pasid_as->vtd_bus,
+                         vtd_pasid_as->devfn,
+                         vtd_pasid_as->pasid,
+                         pe, VTD_PASID_BIND);
 }
 
 /**
@@ -2565,10 +2655,11 @@ static gboolean vtd_flush_pasid(gpointer key, gpointer value,
 remove:
     /*
      * TODO:
-     * - send pasid bind to host for passthru devices
      * - when pasid-base-iotlb(piotlb) infrastructure is ready,
      *   should invalidate QEMU piotlb togehter with this change.
      */
+    vtd_bind_guest_pasid(s, vtd_bus, devfn,
+                         pasid, NULL, VTD_PASID_UNBIND);
     return true;
 }
 
diff --git a/hw/i386/intel_iommu_internal.h b/hw/i386/intel_iommu_internal.h
index a57ef3d..51691d0 100644
--- a/hw/i386/intel_iommu_internal.h
+++ b/hw/i386/intel_iommu_internal.h
@@ -536,6 +536,13 @@ typedef struct VTDRootEntry VTDRootEntry;
 #define VTD_SM_CONTEXT_ENTRY_RSVD_VAL0(aw)  (0x1e0ULL | ~VTD_HAW_MASK(aw))
 #define VTD_SM_CONTEXT_ENTRY_RSVD_VAL1      0xffffffffffe00000ULL
 
+enum VTDPASIDOp {
+    VTD_PASID_BIND,
+    VTD_PASID_UNBIND,
+    VTD_OP_NUM
+};
+typedef enum VTDPASIDOp VTDPASIDOp;
+
 typedef enum VTDPCInvType {
     /* force reset all */
     VTD_PASID_CACHE_FORCE_RESET = 0,
@@ -578,6 +585,17 @@ typedef struct VTDPASIDCacheInfo VTDPASIDCacheInfo;
 #define VTD_SM_PASID_ENTRY_AW          7ULL /* Adjusted guest-address-width */
 #define VTD_SM_PASID_ENTRY_DID(val)    ((val) & VTD_DOMAIN_ID_MASK)
 
+#define VTD_SM_PASID_ENTRY_FLPM          3ULL
+#define VTD_SM_PASID_ENTRY_FLPTPTR       (~0xfffULL)
+#define VTD_SM_PASID_ENTRY_SRE_BIT(val)  (!!((val) & 1ULL))
+#define VTD_SM_PASID_ENTRY_EAFE_BIT(val) (!!(((val) >> 7) & 1ULL))
+#define VTD_SM_PASID_ENTRY_PCD_BIT(val)  (!!(((val) >> 31) & 1ULL))
+#define VTD_SM_PASID_ENTRY_PWT_BIT(val)  (!!(((val) >> 30) & 1ULL))
+#define VTD_SM_PASID_ENTRY_EMTE_BIT(val) (!!(((val) >> 26) & 1ULL))
+#define VTD_SM_PASID_ENTRY_CD_BIT(val)   (!!(((val) >> 25) & 1ULL))
+#define VTD_SM_PASID_ENTRY_PAT(val)      (((val) >> 32) & 0xFFFFFFFFULL)
+#define VTD_SM_PASID_ENTRY_EMT(val)      (((val) >> 27) & 0x7ULL)
+
 /* Second Level Page Translation Pointer*/
 #define VTD_SM_PASID_ENTRY_SLPTPTR     (~0xfffULL)
 
-- 
2.7.4


