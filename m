Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5938D6E779B
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Apr 2023 12:43:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pp5Fr-0000xy-SJ; Wed, 19 Apr 2023 06:41:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1pp5Fp-0000xa-DX
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 06:41:37 -0400
Received: from mga05.intel.com ([192.55.52.43])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1pp5Fm-0005FD-F1
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 06:41:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681900894; x=1713436894;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dbR9N8KvQguZFppT/f+4kSx1JJuXFg8MeWhH4HZG2Ls=;
 b=R1SqOAYclavSL6qyqFbpf2KgCcC84je32KmT++Sq1VuAsrGxNlPQRH+x
 jdCr4dQrPcvbQItHi0qKCMcWb2F6Zy49aKWw4xTiBUT+BosTbEYbe3KA5
 11jtdnzwOm05ELO18loN+vkRgxWX0b1qbNHwEKb+5nsGKcqa2TT7dAc0d
 AA2e0xkGZnVanVi8CivBJvmCuPwNtQeRULq/uVBcd0Hs9atywfIQ6/5UQ
 0Ses8BUoauyfqafSHBT1uQPaMacjGaEgUMVtCUgIGqWu4zKApX/u28DIe
 JvMgx8a6pC9M8r9NjhPG07J9hZDD7eyqRJB2mktYpV0sOqUNPTpbWqZs9 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="431690844"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="431690844"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 03:41:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="815591304"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="815591304"
Received: from duan-server-s2600bt.bj.intel.com ([10.240.192.143])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 03:41:24 -0700
From: Zhenzhong Duan <zhenzhong.duan@intel.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com, peterx@redhat.com, jasowang@redhat.com,
 marcel.apfelbaum@gmail.com, pbonzini@redhat.com,
 richard.henderson@linaro.org, eduardo@habkost.net, david@redhat.com,
 philmd@linaro.org, peter.maydell@linaro.org, chao.p.peng@intel.com
Subject: [PATCH v4] memory: Optimize replay of guest mapping
Date: Wed, 19 Apr 2023 18:29:40 +0800
Message-Id: <20230419102940.185968-1-zhenzhong.duan@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.43;
 envelope-from=zhenzhong.duan@intel.com; helo=mga05.intel.com
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
---
v4: Update doc comment per Perter Maydell
v3: Fix assert failure on mps3-an547, fix typos in log per Michael
v2: Add an assert per Peter Xu
Tested on x86 with a net card passed to guest(kvm/tcg), ping/ssh pass.
Also did simple bootup test with mps3-an547

 hw/i386/intel_iommu.c |  2 +-
 include/exec/memory.h | 13 +++++++------
 softmmu/memory.c      |  5 +++--
 3 files changed, 11 insertions(+), 9 deletions(-)

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
index 15ade918baa4..61da32d8a428 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -425,12 +425,13 @@ struct IOMMUMemoryRegionClass {
      * Called to handle memory_region_iommu_replay().
      *
      * The default implementation of memory_region_iommu_replay() is to
-     * call the IOMMU translate method for every page in the address space
+     * call the IOMMU translate method for every page falling in the
+     * intersection part of IOMMU memory region and notifier's scope
      * with flag == IOMMU_NONE and then call the notifier if translate
      * returns a valid mapping. If this method is implemented then it
      * overrides the default behaviour, and must provide the full semantics
      * of memory_region_iommu_replay(), by calling @notifier for every
-     * translation present in the IOMMU.
+     * translation present in the intersection part.
      *
      * Optional method -- an IOMMU only needs to provide this method
      * if the default is inefficient or produces undesirable side effects.
@@ -1760,9 +1761,10 @@ int memory_region_register_iommu_notifier(MemoryRegion *mr,
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
@@ -1775,8 +1777,7 @@ void memory_region_iommu_replay(IOMMUMemoryRegion *iommu_mr, IOMMUNotifier *n);
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


