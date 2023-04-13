Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8AEE6E0C2E
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Apr 2023 13:12:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmusQ-0001OX-V8; Thu, 13 Apr 2023 07:12:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1pmusN-0001O0-VE
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 07:12:28 -0400
Received: from mga03.intel.com ([134.134.136.65])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1pmusL-0003d2-1k
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 07:12:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681384345; x=1712920345;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uDRw/5tKMmWlFUbbtkcAmcMIP72IJWNu8FG74PCmeL8=;
 b=ZRUkSz2s2rHIL9Mbsmo9/9bSaQjQdL4SRKhIyzkkNh80NqUed9jcoww1
 AHOvoG9fmpp/5On7IUdTz0W5axzYPnpU16TLxEGCsmzmdGYrF+A2LF6ga
 wnDwvrXnRZoSqGGFpgEi0dXOk447V6anzrooo/SS0/w+eIw35BUcqqOD+
 4kO/b/lW6gjxFTXqcAd5SKH3CeKGbUPKKDhcwFQ+CcAa4CyceraE28YIU
 KMnpRiBlNoWlWCzdr6Er5aNEYh7Et5tgmmipFSx8Ikoxxl3a2341ZIJbW
 0dfXm0RPV/GvOpelrjsRSM9jayZrITcLUTiVThVO1dCZaPFeRQq/kpjny A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="346839208"
X-IronPort-AV: E=Sophos;i="5.99,341,1677571200"; d="scan'208";a="346839208"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2023 04:12:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="800778098"
X-IronPort-AV: E=Sophos;i="5.99,341,1677571200"; d="scan'208";a="800778098"
Received: from duan-server-s2600bt.bj.intel.com ([10.240.192.143])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2023 04:11:57 -0700
From: Zhenzhong Duan <zhenzhong.duan@intel.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com, peterx@redhat.com, jasowang@redhat.com,
 marcel.apfelbaum@gmail.com, pbonzini@redhat.com,
 richard.henderson@linaro.org, eduardo@habkost.net, david@redhat.com,
 philmd@linaro.org, peter.maydell@linaro.org
Subject: [PATCH v3] memory: Optimize replay of guest mapping
Date: Thu, 13 Apr 2023 19:00:19 +0800
Message-Id: <20230413110019.48922-1-zhenzhong.duan@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.65;
 envelope-from=zhenzhong.duan@intel.com; helo=mga03.intel.com
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

On x86, there are two notifiers registered due to vtd-ir memory
region splitting the entire address space. During replay of the
address space for each notifier, the whole address space is
scanned which is unnecessary. We only need to scan the space
belong to notifier monitored space.

While on x86 IOMMU memory region spans over entire address space,
but on some other platforms(e.g. arm mps3-an547), IOMMU memory
region is only a window in the whole address space. user could
register a notifier with arbitrary scope beyond IOMMU memory
region. Though in current implementation replay is only triggered
by VFIO and dirty page sync with notifiers derived from memory
region section, but this isn't guaranteed in the future.

So, we replay the intersection part of IOMMU memory region and
IOMMU notifier in memory_region_iommu_replay().

Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
---
v3: Fix assert failure on mps3-an547
v2: Add an assert per Peter
Tested on x86 with a net card passed to guest(kvm/tcg), ping/ssh pass.
Also did simple bootup test with mps3-an547

 hw/i386/intel_iommu.c | 2 +-
 softmmu/memory.c      | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

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


