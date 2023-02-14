Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02DAE69578B
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 04:43:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRmDa-0005an-8j; Mon, 13 Feb 2023 22:42:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1pRmDX-0005aP-Gw
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 22:42:55 -0500
Received: from mga05.intel.com ([192.55.52.43])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1pRmDV-00032N-Sv
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 22:42:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676346173; x=1707882173;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZOf2JFSITzrDcOXcY+ZJK4LaY48M4IaCLmb/ZuvYsnQ=;
 b=T7o0DqAQ9tSLUBveMQxS+POzYzdzLLWUKPcNgUcjspIUjyjO1KmT6snP
 RLIw4umD3qqalCjkEQLbo+H6maa74K/7oFsI/9PUKVT5pGPMF0rar790t
 OKAom2wUW7j80oZlN3ihiOp4muRXYMNpX2tU84O8GQVppbZaqnQ04APP2
 lbRHw6YLyPos3A6ALOysCNHjefPj1YXdz002kUSLnov+05M/UJ5jPH5VQ
 Ar21XsLQA6YdhX/sc1GLbaWgR0fCnWDPomnfS/tosxveJYopGSTr0JMfg
 jSpchzOXYla8+zIHr18Pd1SSVSI9XUY0f6vrRNB9I57aTnnetq0Chkc8J g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="417284863"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; d="scan'208";a="417284863"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2023 19:42:50 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="662410558"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; d="scan'208";a="662410558"
Received: from duan-server-s2600bt.bj.intel.com ([10.240.192.143])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2023 19:42:47 -0800
From: Zhenzhong Duan <zhenzhong.duan@intel.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com, peterx@redhat.com, jasowang@redhat.com,
 pbonzini@redhat.com, richard.henderson@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, david@redhat.com, philmd@linaro.org
Subject: [PATCH] memory: Optimize replay of guest mapping
Date: Tue, 14 Feb 2023 11:42:11 +0800
Message-Id: <20230214034211.683203-1-zhenzhong.duan@intel.com>
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
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On x86, there are two notifiers registered due to vtd-ir memory region
splitting the whole address space. During replay of the address space
for each notifier, the whole address space is scanned which is
unnecessory.

We only need to scan the space belong to notifier montiored space.

Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
---
Tested only on x86 with a net card passed to guest, ping/ssh pass.

 hw/i386/intel_iommu.c | 2 +-
 softmmu/memory.c      | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index 98a5c304a7d7..6b1de80e8573 100644
--- a/hw/i386/intel_iommu.c
+++ b/hw/i386/intel_iommu.c
@@ -3831,7 +3831,7 @@ static void vtd_iommu_replay(IOMMUMemoryRegion *iommu_mr, IOMMUNotifier *n)
                 .domain_id = vtd_get_domain_id(s, &ce, vtd_as->pasid),
             };
 
-            vtd_page_walk(s, &ce, 0, ~0ULL, &info, vtd_as->pasid);
+            vtd_page_walk(s, &ce, n->start, n->end, &info, vtd_as->pasid);
         }
     } else {
         trace_vtd_replay_ce_invalid(bus_n, PCI_SLOT(vtd_as->devfn),
diff --git a/softmmu/memory.c b/softmmu/memory.c
index 9d64efca269b..f096716e6e78 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -1923,7 +1923,6 @@ uint64_t memory_region_iommu_get_min_page_size(IOMMUMemoryRegion *iommu_mr)
 
 void memory_region_iommu_replay(IOMMUMemoryRegion *iommu_mr, IOMMUNotifier *n)
 {
-    MemoryRegion *mr = MEMORY_REGION(iommu_mr);
     IOMMUMemoryRegionClass *imrc = IOMMU_MEMORY_REGION_GET_CLASS(iommu_mr);
     hwaddr addr, granularity;
     IOMMUTLBEntry iotlb;
@@ -1936,7 +1935,7 @@ void memory_region_iommu_replay(IOMMUMemoryRegion *iommu_mr, IOMMUNotifier *n)
 
     granularity = memory_region_iommu_get_min_page_size(iommu_mr);
 
-    for (addr = 0; addr < memory_region_size(mr); addr += granularity) {
+    for (addr = n->start; addr < n->end; addr += granularity) {
         iotlb = imrc->translate(iommu_mr, addr, IOMMU_NONE, n->iommu_idx);
         if (iotlb.perm != IOMMU_NONE) {
             n->notify(n, &iotlb);
-- 
2.25.1


