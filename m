Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C1F821C923
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Jul 2020 13:34:25 +0200 (CEST)
Received: from localhost ([::1]:49646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1juaFU-00076h-O9
	for lists+qemu-devel@lfdr.de; Sun, 12 Jul 2020 07:34:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yi.l.liu@intel.com>)
 id 1jua2Y-0004fs-Vo
 for qemu-devel@nongnu.org; Sun, 12 Jul 2020 07:21:03 -0400
Received: from mga03.intel.com ([134.134.136.65]:51218)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yi.l.liu@intel.com>)
 id 1jua2W-0004uN-TT
 for qemu-devel@nongnu.org; Sun, 12 Jul 2020 07:21:02 -0400
IronPort-SDR: VQXBZ/GmKt0aFJ0rQj6ynuG7/makfp0qpsgIydkq6/c0+8AG9HGAYFFjFsNsYWd9f1hARAMtvz
 gVvvQdeaZFRA==
X-IronPort-AV: E=McAfee;i="6000,8403,9679"; a="148490201"
X-IronPort-AV: E=Sophos;i="5.75,343,1589266800"; d="scan'208";a="148490201"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2020 04:19:54 -0700
IronPort-SDR: da38gnbC0uNLUBmo5tT01QBvNYeC9oGHKUAI2cQLQ4V2/vzSg3Tovr2KIkKu8FBlzqwdy2diks
 vuZCDT/oFMpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,343,1589266800"; d="scan'208";a="307121485"
Received: from jacob-builder.jf.intel.com ([10.7.199.155])
 by fmsmga004.fm.intel.com with ESMTP; 12 Jul 2020 04:19:54 -0700
From: Liu Yi L <yi.l.liu@intel.com>
To: qemu-devel@nongnu.org,
	alex.williamson@redhat.com,
	peterx@redhat.com
Subject: [RFC v8 23/25] intel_iommu: propagate PASID-based iotlb invalidation
 to host
Date: Sun, 12 Jul 2020 04:26:19 -0700
Message-Id: <1594553181-55810-24-git-send-email-yi.l.liu@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1594553181-55810-1-git-send-email-yi.l.liu@intel.com>
References: <1594553181-55810-1-git-send-email-yi.l.liu@intel.com>
Received-SPF: pass client-ip=134.134.136.65; envelope-from=yi.l.liu@intel.com;
 helo=mga03.intel.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/12 07:19:41
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
 Yi Sun <yi.y.sun@linux.intel.com>, Eduardo Habkost <ehabkost@redhat.com>,
 kvm@vger.kernel.org, mst@redhat.com, jun.j.tian@intel.com,
 eric.auger@redhat.com, yi.y.sun@intel.com,
 Jacob Pan <jacob.jun.pan@linux.intel.com>, pbonzini@redhat.com,
 hao.wu@intel.com, jasowang@redhat.com, Richard Henderson <rth@twiddle.net>,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch propagates PASID-based iotlb invalidation to host.

Intel VT-d 3.0 supports nested translation in PASID granular.
Guest SVA support could be implemented by configuring nested
translation on specific PASID. This is also known as dual stage
DMA translation.

Under such configuration, guest owns the GVA->GPA translation
which is configured as first level page table in host side for
a specific pasid, and host owns GPA->HPA translation. As guest
owns first level translation table, piotlb invalidation should
be propagated to host since host IOMMU will cache first level
page table related mappings during DMA address translation.

This patch traps the guest PASID-based iotlb flush and propagate
it to host.

Cc: Kevin Tian <kevin.tian@intel.com>
Cc: Jacob Pan <jacob.jun.pan@linux.intel.com>
Cc: Peter Xu <peterx@redhat.com>
Cc: Yi Sun <yi.y.sun@linux.intel.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Richard Henderson <rth@twiddle.net>
Cc: Eduardo Habkost <ehabkost@redhat.com>
Signed-off-by: Liu Yi L <yi.l.liu@intel.com>
---
rfcv4 (v1) -> rfcv5 (v2):
*) removed the valid check to vtd_pasid_as instance as rfcv5 ensures
   all vtd_pasid_as instances in hash table should be valid.
---
 hw/i386/intel_iommu.c          | 113 +++++++++++++++++++++++++++++++++++++++++
 hw/i386/intel_iommu_internal.h |   7 +++
 2 files changed, 120 insertions(+)

diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index e6364ee..d3c41a6 100644
--- a/hw/i386/intel_iommu.c
+++ b/hw/i386/intel_iommu.c
@@ -3038,16 +3038,129 @@ static bool vtd_process_pasid_desc(IntelIOMMUState *s,
     return true;
 }
 
+/**
+ * Caller of this function should hold iommu_lock.
+ */
+static void vtd_invalidate_piotlb(IntelIOMMUState *s,
+                                  VTDBus *vtd_bus,
+                                  int devfn,
+                                  struct iommu_cache_invalidate_info *cache)
+{
+    VTDHostIOMMUContext *vtd_dev_icx;
+    HostIOMMUContext *iommu_ctx;
+
+    vtd_dev_icx = vtd_bus->dev_icx[devfn];
+    if (!vtd_dev_icx) {
+        goto out;
+    }
+    iommu_ctx = vtd_dev_icx->iommu_ctx;
+    if (!iommu_ctx) {
+        goto out;
+    }
+    if (host_iommu_ctx_flush_stage1_cache(iommu_ctx, cache)) {
+        error_report("Cache flush failed");
+    }
+out:
+    return;
+}
+
+/**
+ * This function is a loop function for the s->vtd_pasid_as
+ * list with VTDPIOTLBInvInfo as execution filter. It propagates
+ * the piotlb invalidation to host. Caller of this function
+ * should hold iommu_lock.
+ */
+static void vtd_flush_pasid_iotlb(gpointer key, gpointer value,
+                                  gpointer user_data)
+{
+    VTDPIOTLBInvInfo *piotlb_info = user_data;
+    VTDPASIDAddressSpace *vtd_pasid_as = value;
+    VTDPASIDCacheEntry *pc_entry = &vtd_pasid_as->pasid_cache_entry;
+    uint16_t did;
+
+    did = vtd_pe_get_domain_id(&pc_entry->pasid_entry);
+
+    if ((piotlb_info->domain_id == did) &&
+        (piotlb_info->pasid == vtd_pasid_as->pasid)) {
+        vtd_invalidate_piotlb(vtd_pasid_as->iommu_state,
+                              vtd_pasid_as->vtd_bus,
+                              vtd_pasid_as->devfn,
+                              piotlb_info->cache_info);
+    }
+
+    /*
+     * TODO: needs to add QEMU piotlb flush when QEMU piotlb
+     * infrastructure is ready. For now, it is enough for passthru
+     * devices.
+     */
+}
+
 static void vtd_piotlb_pasid_invalidate(IntelIOMMUState *s,
                                         uint16_t domain_id,
                                         uint32_t pasid)
 {
+    VTDPIOTLBInvInfo piotlb_info;
+    struct iommu_cache_invalidate_info *cache_info;
+
+    cache_info = g_malloc0(sizeof(*cache_info));
+
+    cache_info->argsz = sizeof(*cache_info);
+    cache_info->version = IOMMU_CACHE_INVALIDATE_INFO_VERSION_1;
+    cache_info->cache = IOMMU_CACHE_INV_TYPE_IOTLB;
+    cache_info->granularity = IOMMU_INV_GRANU_PASID;
+    cache_info->granu.pasid_info.pasid = pasid;
+    cache_info->granu.pasid_info.flags = IOMMU_INV_PASID_FLAGS_PASID;
+
+    piotlb_info.domain_id = domain_id;
+    piotlb_info.pasid = pasid;
+    piotlb_info.cache_info = cache_info;
+
+    vtd_iommu_lock(s);
+    /*
+     * Here loops all the vtd_pasid_as instances in s->vtd_pasid_as
+     * to find out the affected devices since piotlb invalidation
+     * should check pasid cache per architecture point of view.
+     */
+    g_hash_table_foreach(s->vtd_pasid_as,
+                         vtd_flush_pasid_iotlb, &piotlb_info);
+    vtd_iommu_unlock(s);
+    g_free(cache_info);
 }
 
 static void vtd_piotlb_page_invalidate(IntelIOMMUState *s, uint16_t domain_id,
                                        uint32_t pasid, hwaddr addr, uint8_t am,
                                        bool ih)
 {
+    VTDPIOTLBInvInfo piotlb_info;
+    struct iommu_cache_invalidate_info *cache_info;
+
+    cache_info = g_malloc0(sizeof(*cache_info));
+
+    cache_info->argsz = sizeof(*cache_info);
+    cache_info->version = IOMMU_CACHE_INVALIDATE_INFO_VERSION_1;
+    cache_info->cache = IOMMU_CACHE_INV_TYPE_IOTLB;
+    cache_info->granularity = IOMMU_INV_GRANU_ADDR;
+    cache_info->granu.addr_info.flags = IOMMU_INV_ADDR_FLAGS_PASID;
+    cache_info->granu.addr_info.flags |= ih ? IOMMU_INV_ADDR_FLAGS_LEAF : 0;
+    cache_info->granu.addr_info.pasid = pasid;
+    cache_info->granu.addr_info.addr = addr;
+    cache_info->granu.addr_info.granule_size = 1 << (12 + am);
+    cache_info->granu.addr_info.nb_granules = 1;
+
+    piotlb_info.domain_id = domain_id;
+    piotlb_info.pasid = pasid;
+    piotlb_info.cache_info = cache_info;
+
+    vtd_iommu_lock(s);
+    /*
+     * Here loops all the vtd_pasid_as instances in s->vtd_pasid_as
+     * to find out the affected devices since piotlb invalidation
+     * should check pasid cache per architecture point of view.
+     */
+    g_hash_table_foreach(s->vtd_pasid_as,
+                         vtd_flush_pasid_iotlb, &piotlb_info);
+    vtd_iommu_unlock(s);
+    g_free(cache_info);
 }
 
 static bool vtd_process_piotlb_desc(IntelIOMMUState *s,
diff --git a/hw/i386/intel_iommu_internal.h b/hw/i386/intel_iommu_internal.h
index 118d568..08ff58e 100644
--- a/hw/i386/intel_iommu_internal.h
+++ b/hw/i386/intel_iommu_internal.h
@@ -575,6 +575,13 @@ struct VTDPASIDCacheInfo {
 };
 typedef struct VTDPASIDCacheInfo VTDPASIDCacheInfo;
 
+struct VTDPIOTLBInvInfo {
+    uint16_t domain_id;
+    uint32_t pasid;
+    struct iommu_cache_invalidate_info *cache_info;
+};
+typedef struct VTDPIOTLBInvInfo VTDPIOTLBInvInfo;
+
 /* PASID Table Related Definitions */
 #define VTD_PASID_DIR_BASE_ADDR_MASK  (~0xfffULL)
 #define VTD_PASID_TABLE_BASE_ADDR_MASK (~0xfffULL)
-- 
2.7.4


