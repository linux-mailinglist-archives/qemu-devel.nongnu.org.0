Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA912329F19
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 13:46:38 +0100 (CET)
Received: from localhost ([::1]:49518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH4Q9-0004w7-VT
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 07:46:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yi.l.liu@intel.com>)
 id 1lH4KN-0007yG-6p
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 07:40:40 -0500
Received: from mga05.intel.com ([192.55.52.43]:62468)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yi.l.liu@intel.com>)
 id 1lH4KJ-0002nT-06
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 07:40:38 -0500
IronPort-SDR: vFD+s7bc6oYoYuIM3Z76C+1Zd+wi6CheJrn/2q7j1kcy7iBltCsBJlKsJQ5bFQOy4x3PXObnJI
 PtMn2Z0xMZTg==
X-IronPort-AV: E=McAfee;i="6000,8403,9910"; a="271803148"
X-IronPort-AV: E=Sophos;i="5.81,216,1610438400"; d="scan'208";a="271803148"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2021 04:40:34 -0800
IronPort-SDR: rHU0mce7zstuwz1Y1ABS5BsyShYeeUjL+9tn9noC+QPyO+ink+XTrg7VGXIqz2m1+3+v4451UZ
 neROB2MyF8HA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,216,1610438400"; d="scan'208";a="427472996"
Received: from yiliu-dev.bj.intel.com (HELO dual-ub.bj.intel.com)
 ([10.238.156.135])
 by fmsmga004.fm.intel.com with ESMTP; 02 Mar 2021 04:40:29 -0800
From: Liu Yi L <yi.l.liu@intel.com>
To: qemu-devel@nongnu.org, alex.williamson@redhat.com, peterx@redhat.com,
 jasowang@redhat.com
Subject: [RFC v11 14/25] intel_iommu: sync IOMMU nesting cap info for assigned
 devices
Date: Wed,  3 Mar 2021 04:38:16 +0800
Message-Id: <20210302203827.437645-15-yi.l.liu@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210302203827.437645-1-yi.l.liu@intel.com>
References: <20210302203827.437645-1-yi.l.liu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.43; envelope-from=yi.l.liu@intel.com;
 helo=mga05.intel.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DATE_IN_FUTURE_06_12=1.947,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Lingshan.Zhu@intel.com, hao.wu@intel.com, Richard Henderson <rth@twiddle.net>,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For assigned devices, Intel vIOMMU which wants to build DMA protection
based on physical IOMMU nesting paging should check the IOMMU nesting
support in host side. The host will return IOMMU nesting cap info to
user-space (e.g. VFIO returns IOMMU nesting cap info for nesting type
IOMMU). vIOMMU needs to check:
a) IOMMU model
b) 1st-level page table supports
c) address width
d) pasid support

This patch syncs the IOMMU nesting cap info when PCIe device (VFIO case)
sets HostIOMMUContext to vIOMMU. If the host IOMMU nesting support is not
compatible, vIOMMU should return failure to PCIe device.

Cc: Kevin Tian <kevin.tian@intel.com>
Cc: Jacob Pan <jacob.jun.pan@linux.intel.com>
Cc: Peter Xu <peterx@redhat.com>
Cc: Yi Sun <yi.y.sun@linux.intel.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Richard Henderson <rth@twiddle.net>
Signed-off-by: Liu Yi L <yi.l.liu@intel.com>
---
 hw/i386/intel_iommu.c          | 105 +++++++++++++++++++++++++++++++++
 hw/i386/intel_iommu_internal.h |  18 ++++++
 include/hw/i386/intel_iommu.h  |   4 ++
 3 files changed, 127 insertions(+)

diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index 8419fd2818..203c898fa4 100644
--- a/hw/i386/intel_iommu.c
+++ b/hw/i386/intel_iommu.c
@@ -3494,6 +3494,82 @@ static int vtd_dev_get_iommu_attr(PCIBus *bus, void *opaque, int32_t devfn,
     return ret;
 }
 
+
+static bool vtd_check_nesting_info(IntelIOMMUState *s,
+                                   struct iommu_nesting_info *info,
+                                   struct iommu_nesting_info_vtd *vtd)
+{
+    return !((s->aw_bits != info->addr_width) ||
+             ((s->host_cap ^ vtd->cap_reg) & VTD_CAP_MASK & s->host_cap) ||
+             ((s->host_ecap ^ vtd->ecap_reg) & VTD_ECAP_MASK & s->host_ecap) ||
+             (VTD_GET_PSS(s->host_ecap) != (info->pasid_bits - 1)));
+}
+
+/* Caller should hold iommu lock. */
+static bool vtd_sync_nesting_info(IntelIOMMUState *s,
+                                  struct iommu_nesting_info *info)
+{
+    struct iommu_nesting_info_vtd *vtd;
+    uint64_t cap, ecap;
+
+    vtd =  (struct iommu_nesting_info_vtd *) &info->vendor.vtd;
+
+    if (s->cap_finalized) {
+        return vtd_check_nesting_info(s, info, vtd);
+    }
+
+    if (s->aw_bits > info->addr_width) {
+        error_report("User aw-bits: %u > host address width: %u",
+                      s->aw_bits, info->addr_width);
+        return false;
+    }
+
+    cap = s->host_cap & vtd->cap_reg & VTD_CAP_MASK;
+    s->host_cap &= ~VTD_CAP_MASK;
+    s->host_cap |= cap;
+
+    ecap = s->host_ecap & vtd->ecap_reg & VTD_ECAP_MASK;
+    s->host_ecap &= ~VTD_ECAP_MASK;
+    s->host_ecap |= ecap;
+
+    if ((VTD_ECAP_PASID & s->host_ecap) && info->pasid_bits &&
+        (VTD_GET_PSS(s->host_ecap) > (info->pasid_bits - 1))) {
+        s->host_ecap &= ~VTD_ECAP_PSS_MASK;
+        s->host_ecap |= VTD_ECAP_PSS(info->pasid_bits - 1);
+    }
+    return true;
+}
+
+/*
+ * virtual VT-d which wants nested needs to check the host IOMMU
+ * nesting cap info behind the assigned devices. Thus that vIOMMU
+ * could bind guest page table to host.
+ */
+static bool vtd_check_iommu_ctx(IntelIOMMUState *s,
+                                HostIOMMUContext *iommu_ctx)
+{
+    struct iommu_nesting_info *info = iommu_ctx->info;
+    uint32_t minsz, size;
+
+    if (IOMMU_PASID_FORMAT_INTEL_VTD != info->format) {
+        error_report("Format is not compatible for nesting!!!");
+        return false;
+    }
+
+    size = sizeof(struct iommu_nesting_info_vtd);
+    minsz = endof(struct iommu_nesting_info, flags);
+    if (size > (info->argsz - minsz)) {
+        /*
+         * QEMU may have been using new linux-headers/iommu.h than
+         * kernel supports, hence fail it.
+         */
+        error_report("IOMMU nesting cap is not compatible!!!");
+        return false;
+    }
+
+    return vtd_sync_nesting_info(s, info);
+}
+
 static int vtd_dev_set_iommu_context(PCIBus *bus, void *opaque,
                                      int devfn,
                                      HostIOMMUContext *iommu_ctx)
@@ -3508,6 +3584,11 @@ static int vtd_dev_set_iommu_context(PCIBus *bus, void *opaque,
 
     vtd_iommu_lock(s);
 
+    if (!vtd_check_iommu_ctx(s, iommu_ctx)) {
+        vtd_iommu_unlock(s);
+        return -ENOENT;
+    }
+
     vtd_dev_icx = vtd_bus->dev_icx[devfn];
 
     assert(!vtd_dev_icx);
@@ -3760,6 +3841,14 @@ static void vtd_init(IntelIOMMUState *s)
         s->ecap |= VTD_ECAP_SMTS | VTD_ECAP_SRS | VTD_ECAP_SLTS;
     }
 
+    if (!s->cap_finalized) {
+        s->host_cap = s->cap;
+        s->host_ecap = s->ecap;
+    } else {
+        s->cap = s->host_cap;
+        s->ecap = s->host_ecap;
+    }
+
     vtd_reset_caches(s);
 
     /* Define registers with default values and bit semantics */
@@ -3886,6 +3975,12 @@ static bool vtd_decide_config(IntelIOMMUState *s, Error **errp)
     return true;
 }
 
+static void vtd_refresh_capability_reg(IntelIOMMUState *s)
+{
+    vtd_set_quad(s, DMAR_CAP_REG, s->cap);
+    vtd_set_quad(s, DMAR_ECAP_REG, s->ecap);
+}
+
 static int vtd_machine_done_notify_one(Object *child, void *unused)
 {
     IntelIOMMUState *iommu = INTEL_IOMMU_DEVICE(x86_iommu_get_default());
@@ -3899,6 +3994,15 @@ static int vtd_machine_done_notify_one(Object *child, void *unused)
         vtd_panic_require_caching_mode();
     }
 
+    vtd_iommu_lock(iommu);
+    iommu->cap = iommu->host_cap & iommu->cap;
+    iommu->ecap = iommu->host_ecap & iommu->ecap;
+    if (!iommu->cap_finalized) {
+        iommu->cap_finalized = true;
+    }
+
+    vtd_refresh_capability_reg(iommu);
+    vtd_iommu_unlock(iommu);
     return 0;
 }
 
@@ -3929,6 +4033,7 @@ static void vtd_realize(DeviceState *dev, Error **errp)
 
     QLIST_INIT(&s->vtd_as_with_notifiers);
     qemu_mutex_init(&s->iommu_lock);
+    s->cap_finalized = false;
     memset(s->vtd_as_by_bus_num, 0, sizeof(s->vtd_as_by_bus_num));
     memory_region_init_io(&s->csrmem, OBJECT(s), &vtd_mem_ops, s,
                           "intel_iommu", DMAR_REG_SIZE);
diff --git a/hw/i386/intel_iommu_internal.h b/hw/i386/intel_iommu_internal.h
index 445b45c948..af2c7bcd93 100644
--- a/hw/i386/intel_iommu_internal.h
+++ b/hw/i386/intel_iommu_internal.h
@@ -193,6 +193,24 @@
 #define VTD_ECAP_SMTS               (1ULL << 43)
 #define VTD_ECAP_SLTS               (1ULL << 46)
 
+/* 1st level related caps */
+#define VTD_CAP_FL1GP               (1ULL << 56)
+#define VTD_CAP_FL5LP               (1ULL << 60)
+#define VTD_ECAP_PRS                (1ULL << 29)
+#define VTD_ECAP_ERS                (1ULL << 30)
+#define VTD_ECAP_SRS                (1ULL << 31)
+#define VTD_ECAP_EAFS               (1ULL << 34)
+#define VTD_ECAP_PSS(val)           (((val) & 0x1fULL) << 35)
+#define VTD_ECAP_PASID              (1ULL << 40)
+
+#define VTD_GET_PSS(val)            (((val) >> 35) & 0x1f)
+#define VTD_ECAP_PSS_MASK           (0x1fULL << 35)
+
+#define VTD_CAP_MASK                (VTD_CAP_FL1GP | VTD_CAP_FL5LP)
+#define VTD_ECAP_MASK               (VTD_ECAP_PRS | VTD_ECAP_ERS | \
+                                    VTD_ECAP_SRS | VTD_ECAP_EAFS | \
+                                    VTD_ECAP_PASID)
+
 /* CAP_REG */
 /* (offset >> 4) << 24 */
 #define VTD_CAP_FRO                 (DMAR_FRCD_REG_OFFSET << 20)
diff --git a/include/hw/i386/intel_iommu.h b/include/hw/i386/intel_iommu.h
index 28396675ef..d6a90f07f4 100644
--- a/include/hw/i386/intel_iommu.h
+++ b/include/hw/i386/intel_iommu.h
@@ -260,6 +260,9 @@ struct IntelIOMMUState {
     uint64_t cap;                   /* The value of capability reg */
     uint64_t ecap;                  /* The value of extended capability reg */
 
+    uint64_t host_cap;              /* The value of host capability reg */
+    uint64_t host_ecap;             /* The value of host ext-capability reg */
+
     uint32_t context_cache_gen;     /* Should be in [1,MAX] */
     GHashTable *iotlb;              /* IOTLB */
 
@@ -278,6 +281,7 @@ struct IntelIOMMUState {
     uint8_t aw_bits;                /* Host/IOVA address width (in bits) */
     bool dma_drain;                 /* Whether DMA r/w draining enabled */
 
+    bool cap_finalized;             /* Whether VTD capability finalized */
     /*
      * iommu_lock protects below:
      * - per-IOMMU IOTLB caches
-- 
2.25.1


