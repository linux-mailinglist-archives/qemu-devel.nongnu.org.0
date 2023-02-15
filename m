Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6FFB6976AD
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 07:55:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSBfd-0002hc-UW; Wed, 15 Feb 2023 01:53:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1pSBfb-0002hT-8G
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 01:53:35 -0500
Received: from mga11.intel.com ([192.55.52.93])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1pSBfY-0001Zl-TD
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 01:53:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676444012; x=1707980012;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=843NaJWNaZDkXWQY5W3dnEFjXq9eLgs0LtNR+AkbbuE=;
 b=PY7eyGVOe7HTXJtetJnkNwA1N5e4FnQ8w7q5ymq35aEOrd/SPgQdnrYx
 8WBc2aLc3McUS4YJgu1/0LrYPChZkwpv7/GhmZA+h70wy4kNIAmLiwYTV
 QtxlmEnjX2UZgRnUM9GIxjxP2T6QKiiZ7KmC5GWqPZ6ZYi9HrBpC1v4pg
 k8V2OjGT8m2khWwHdUZUVMmiIQb1INk+WH99Qvh1OlsI57LP+ZA2s9qMx
 YGFjZVihMpHhlR4zANCdmYEJkXsZLH2cR5DX49u3AtcBQ0bZrQo0JvZ0b
 DWblqTndFLzMaxfFF3nz4JcorPiYrL6Jf70T6FdfaCkZwFn2yirCgqH5k w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="329077241"
X-IronPort-AV: E=Sophos;i="5.97,299,1669104000"; d="scan'208";a="329077241"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2023 22:53:22 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="758293252"
X-IronPort-AV: E=Sophos;i="5.97,299,1669104000"; d="scan'208";a="758293252"
Received: from duan-server-s2600bt.bj.intel.com ([10.240.192.143])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2023 22:53:19 -0800
From: Zhenzhong Duan <zhenzhong.duan@intel.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com, peterx@redhat.com, jasowang@redhat.com,
 pbonzini@redhat.com, richard.henderson@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, david@redhat.com, philmd@linaro.org
Subject: [PATCH v2] memory: Optimize replay of guest mapping
Date: Wed, 15 Feb 2023 14:52:38 +0800
Message-Id: <20230215065238.713041-1-zhenzhong.duan@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.93;
 envelope-from=zhenzhong.duan@intel.com; helo=mga11.intel.com
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

Assert when notifier is used to monitor beyond iommu memory region's
address space.

Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
---
v2: Add an assertion per Peter Xu
Tested only on x86 with a net card passed to guest(kvm/tcg), ping/ssh pass.

 hw/i386/intel_iommu.c | 2 +-
 softmmu/memory.c      | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

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
index 9d64efca269b..da7d84661972 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -1900,6 +1900,7 @@ int memory_region_register_iommu_notifier(MemoryRegion *mr,
     iommu_mr = IOMMU_MEMORY_REGION(mr);
     assert(n->notifier_flags != IOMMU_NOTIFIER_NONE);
     assert(n->start <= n->end);
+    assert(n->end <= memory_region_size(mr));
     assert(n->iommu_idx >= 0 &&
            n->iommu_idx < memory_region_iommu_num_indexes(iommu_mr));
 
@@ -1923,7 +1924,6 @@ uint64_t memory_region_iommu_get_min_page_size(IOMMUMemoryRegion *iommu_mr)
 
 void memory_region_iommu_replay(IOMMUMemoryRegion *iommu_mr, IOMMUNotifier *n)
 {
-    MemoryRegion *mr = MEMORY_REGION(iommu_mr);
     IOMMUMemoryRegionClass *imrc = IOMMU_MEMORY_REGION_GET_CLASS(iommu_mr);
     hwaddr addr, granularity;
     IOMMUTLBEntry iotlb;
@@ -1936,7 +1936,7 @@ void memory_region_iommu_replay(IOMMUMemoryRegion *iommu_mr, IOMMUNotifier *n)
 
     granularity = memory_region_iommu_get_min_page_size(iommu_mr);
 
-    for (addr = 0; addr < memory_region_size(mr); addr += granularity) {
+    for (addr = n->start; addr < n->end; addr += granularity) {
         iotlb = imrc->translate(iommu_mr, addr, IOMMU_NONE, n->iommu_idx);
         if (iotlb.perm != IOMMU_NONE) {
             n->notify(n, &iotlb);
-- 
2.25.1


