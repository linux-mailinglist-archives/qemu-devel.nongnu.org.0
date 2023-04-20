Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1023A6E8F91
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 12:10:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppREh-0006XC-Ln; Thu, 20 Apr 2023 06:09:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1ppREe-0006W7-RU
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 06:09:53 -0400
Received: from mga14.intel.com ([192.55.52.115])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1ppREc-0007FH-2W
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 06:09:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681985390; x=1713521390;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Nypxwo0ygCFLbPjPSfR8SGsevNrMWdb6/kB0fBNWzcU=;
 b=SZyyNkeWwuDMNZ1nNnOPO9aRwJw9YgMz/4qbs/kzkg1ITRtuCyQE2l7r
 u6JzEuZKJ1jT3R8LS97vdHbYxfiLx2RVVHfrUvs+InJP05cZzrbScnykv
 hmpzj5mmqx8F54cgNt2PLecvIZX7UuHQ19Uhy9P5fklr9MX6tIQFiD9xR
 UE4yNB1un5NHdMQhl7AGsY3Gs53Tln/2IaUgzuy58G7C8BlZ6eHZ9PbE/
 VIVshMurzuKZ8SFambPXSKcuaztcNGLV+YpJnx8FuYKPrt8wNdym7BYLA
 /C3WR/wAhhEtF0bfCWcilLEpBe51EKkg4Kzc6CgSFAkZ5OnU2rcTdGoBD A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="345698973"
X-IronPort-AV: E=Sophos;i="5.99,212,1677571200"; d="scan'208";a="345698973"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2023 03:09:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="722321221"
X-IronPort-AV: E=Sophos;i="5.99,212,1677571200"; d="scan'208";a="722321221"
Received: from duan-server-s2600bt.bj.intel.com ([10.240.192.143])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2023 03:09:44 -0700
From: Zhenzhong Duan <zhenzhong.duan@intel.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com, peterx@redhat.com, jasowang@redhat.com,
 marcel.apfelbaum@gmail.com, pbonzini@redhat.com,
 richard.henderson@linaro.org, eduardo@habkost.net, david@redhat.com,
 philmd@linaro.org, peter.maydell@linaro.org, chao.p.peng@intel.com
Subject: [PATCH v5] memory: Optimize replay of guest mapping
Date: Thu, 20 Apr 2023 17:57:31 +0800
Message-Id: <20230420095731.255895-1-zhenzhong.duan@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.115;
 envelope-from=zhenzhong.duan@intel.com; helo=mga14.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On x86, there are two notifiers registered due to vtd-ir memory
region splitting the entire address space. During replay of the
address space for each notifier, the whole address space is
scanned which is unnecessary. We only need to scan the space
belong to notifier monitored space.

While on x86 IOMMU memory region spans over entire address space,
but on some other platforms(e.g. arm mps3-an547), IOMMU memory
region is only a window in the entire address space. User could
register a notifier with arbitrary scope beyond IOMMU memory
region. Though in current implementation replay is only triggered
by VFIO and dirty page sync with notifiers derived from memory
region section, but this isn't guaranteed in the future.

So, we replay the intersection part of IOMMU memory region and
notifier's scope in memory_region_iommu_replay(). Update doc
comment to match this change.

Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
---
v5: minor wording tweaks per Perter Maydell, add Peter Xu's RB
v4: Update doc comment per Perter Maydell
v3: Fix assert failure on mps3-an547, fix typos in log per Michael
v2: Add an assert per Peter Xu
Tested on x86 with a net card passed to guest(kvm/tcg), ping/ssh pass.
Also did simple bootup test with mps3-an547

 hw/i386/intel_iommu.c |  2 +-
 include/exec/memory.h | 22 ++++++++++++----------
 softmmu/memory.c      |  5 +++--
 3 files changed, 16 insertions(+), 13 deletions(-)

diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index a62896759c78..faade7def867 100644
--- a/hw/i386/intel_iommu.c
+++ b/hw/i386/intel_iommu.c
@@ -3850,7 +3850,7 @@ static void vtd_iommu_replay(IOMMUMemoryRegion *iommu_mr, IOMMUNotifier *n)
                 .domain_id = vtd_get_domain_id(s, &ce, vtd_as->pasid),
             };
 
-            vtd_page_walk(s, &ce, 0, ~0ULL, &info, vtd_as->pasid);
+            vtd_page_walk(s, &ce, n->start, n->end, &info, vtd_as->pasid);
         }
     } else {
         trace_vtd_replay_ce_invalid(bus_n, PCI_SLOT(vtd_as->devfn),
diff --git a/include/exec/memory.h b/include/exec/memory.h
index 15ade918baa4..c0aedcd903c3 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -425,12 +425,14 @@ struct IOMMUMemoryRegionClass {
      * Called to handle memory_region_iommu_replay().
      *
      * The default implementation of memory_region_iommu_replay() is to
-     * call the IOMMU translate method for every page in the address space
-     * with flag == IOMMU_NONE and then call the notifier if translate
-     * returns a valid mapping. If this method is implemented then it
-     * overrides the default behaviour, and must provide the full semantics
-     * of memory_region_iommu_replay(), by calling @notifier for every
-     * translation present in the IOMMU.
+     * call the IOMMU translate method for every page falling in the
+     * intersection of the IOMMU MemoryRegion and the MemoryRegion which
+     * the notifier was registered for with flag == IOMMU_NONE and then
+     * call the notifier if translate returns a valid mapping. If this
+     * method is implemented then it overrides the default behavior,
+     * and must provide the full semantics of memory_region_iommu_replay(),
+     * by calling @notifier for every translation present in the IOMMU
+     * that is within the MemoryRegion the notifier was registered for.
      *
      * Optional method -- an IOMMU only needs to provide this method
      * if the default is inefficient or produces undesirable side effects.
@@ -1760,9 +1762,10 @@ int memory_region_register_iommu_notifier(MemoryRegion *mr,
                                           IOMMUNotifier *n, Error **errp);
 
 /**
- * memory_region_iommu_replay: replay existing IOMMU translations to
+ * memory_region_iommu_replay: replay existing IOMMU translations in
+ * intersection part of IOMMU memory region and notifier's scope to
  * a notifier with the minimum page granularity returned by
- * mr->iommu_ops->get_page_size().
+ * memory_region_iommu_get_min_page_size().
  *
  * Note: this is not related to record-and-replay functionality.
  *
@@ -1775,8 +1778,7 @@ void memory_region_iommu_replay(IOMMUMemoryRegion *iommu_mr, IOMMUNotifier *n);
  * memory_region_unregister_iommu_notifier: unregister a notifier for
  * changes to IOMMU translation entries.
  *
- * @mr: the memory region which was observed and for which notity_stopped()
- *      needs to be called
+ * @mr: the memory region which was observed.
  * @n: the notifier to be removed.
  */
 void memory_region_unregister_iommu_notifier(MemoryRegion *mr,
diff --git a/softmmu/memory.c b/softmmu/memory.c
index b1a6cae6f583..f7af691991de 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -1925,7 +1925,7 @@ void memory_region_iommu_replay(IOMMUMemoryRegion *iommu_mr, IOMMUNotifier *n)
 {
     MemoryRegion *mr = MEMORY_REGION(iommu_mr);
     IOMMUMemoryRegionClass *imrc = IOMMU_MEMORY_REGION_GET_CLASS(iommu_mr);
-    hwaddr addr, granularity;
+    hwaddr addr, end, granularity;
     IOMMUTLBEntry iotlb;
 
     /* If the IOMMU has its own replay callback, override */
@@ -1935,8 +1935,9 @@ void memory_region_iommu_replay(IOMMUMemoryRegion *iommu_mr, IOMMUNotifier *n)
     }
 
     granularity = memory_region_iommu_get_min_page_size(iommu_mr);
+    end = MIN(n->end, memory_region_size(mr));
 
-    for (addr = 0; addr < memory_region_size(mr); addr += granularity) {
+    for (addr = n->start; addr < end; addr += granularity) {
         iotlb = imrc->translate(iommu_mr, addr, IOMMU_NONE, n->iommu_idx);
         if (iotlb.perm != IOMMU_NONE) {
             n->notify(n, &iotlb);
-- 
2.25.1


