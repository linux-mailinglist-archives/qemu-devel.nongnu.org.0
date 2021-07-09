Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F463C22A7
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 13:16:27 +0200 (CEST)
Received: from localhost ([::1]:51938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1oUc-0008P9-Fw
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 07:16:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1m1oSZ-0005h4-7V
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 07:14:19 -0400
Received: from mga06.intel.com ([134.134.136.31]:37159)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1m1oSW-0004zM-FL
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 07:14:18 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10039"; a="270800761"
X-IronPort-AV: E=Sophos;i="5.84,226,1620716400"; d="scan'208";a="270800761"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2021 04:14:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,226,1620716400"; d="scan'208";a="428730129"
Received: from icx-2s.bj.intel.com ([10.240.192.119])
 by orsmga002.jf.intel.com with ESMTP; 09 Jul 2021 04:14:09 -0700
From: Yang Zhong <yang.zhong@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 01/33] memory: Add RAM_PROTECTED flag to skip IOMMU mappings
Date: Fri,  9 Jul 2021 19:09:23 +0800
Message-Id: <20210709110955.73256-2-yang.zhong@intel.com>
X-Mailer: git-send-email 2.29.2.334.gfaefdd61ec
In-Reply-To: <20210709110955.73256-1-yang.zhong@intel.com>
References: <20210709110955.73256-1-yang.zhong@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.31; envelope-from=yang.zhong@intel.com;
 helo=mga06.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: yang.zhong@intel.com, seanjc@google.com, kai.huang@intel.com,
 jarkko@kernel.org, pbonzini@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Sean Christopherson <sean.j.christopherson@intel.com>

Add a new RAMBlock flag to denote "protected" memory, i.e. memory that
looks and acts like RAM but is inaccessible via normal mechanisms,
including DMA.  Use the flag to skip protected memory regions when
mapping RAM for DMA in VFIO.

Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
Signed-off-by: Yang Zhong <yang.zhong@intel.com>

v1-->v2:
   - Unified the "share" and "protected" arguments with ram_flags in the
     memory_region_init_ram_from_fd()(Paolo).
---
 hw/vfio/common.c      |  1 +
 include/exec/memory.h | 15 ++++++++++++++-
 softmmu/memory.c      |  5 +++++
 softmmu/physmem.c     |  3 ++-
 4 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index ae5654fcdb..5bc5d29358 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -538,6 +538,7 @@ static bool vfio_listener_skipped_section(MemoryRegionSection *section)
 {
     return (!memory_region_is_ram(section->mr) &&
             !memory_region_is_iommu(section->mr)) ||
+           memory_region_is_protected(section->mr) ||
            /*
             * Sizing an enabled 64-bit BAR can cause spurious mappings to
             * addresses in the upper part of the 64-bit address space.  These
diff --git a/include/exec/memory.h b/include/exec/memory.h
index b116f7c64e..811f3dc897 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -162,6 +162,9 @@ typedef struct IOMMUTLBEvent {
  */
 #define RAM_NORESERVE (1 << 7)
 
+/* RAM that isn't accessible through normal means. */
+#define RAM_PROTECTED (1 << 8)
+
 static inline void iommu_notifier_init(IOMMUNotifier *n, IOMMUNotify fn,
                                        IOMMUNotifierFlag flags,
                                        hwaddr start, hwaddr end,
@@ -1040,7 +1043,7 @@ void memory_region_init_ram_from_file(MemoryRegion *mr,
  * @name: the name of the region.
  * @size: size of the region.
  * @ram_flags: RamBlock flags. Supported flags: RAM_SHARED, RAM_PMEM,
- *             RAM_NORESERVE.
+ *             RAM_NORESERVE, RAM_PROTECTED.
  * @fd: the fd to mmap.
  * @offset: offset within the file referenced by fd
  * @errp: pointer to Error*, to store an error if it happens.
@@ -1341,6 +1344,16 @@ static inline bool memory_region_is_romd(MemoryRegion *mr)
     return mr->rom_device && mr->romd_mode;
 }
 
+/**
+ * memory_region_is_protected: check whether a memory region is protected
+ *
+ * Returns %true if a memory region is protected RAM and cannot be accessed
+ * via standard mechanisms, e.g. DMA.
+ *
+ * @mr: the memory region being queried
+ */
+bool memory_region_is_protected(MemoryRegion *mr);
+
 /**
  * memory_region_get_iommu: check whether a memory region is an iommu
  *
diff --git a/softmmu/memory.c b/softmmu/memory.c
index f0161515e9..1dab97e50a 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -1807,6 +1807,11 @@ bool memory_region_is_ram_device(MemoryRegion *mr)
     return mr->ram_device;
 }
 
+bool memory_region_is_protected(MemoryRegion *mr)
+{
+    return mr->ram && (mr->ram_block->flags & RAM_PROTECTED);
+}
+
 uint8_t memory_region_get_dirty_log_mask(MemoryRegion *mr)
 {
     uint8_t mask = mr->dirty_log_mask;
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 9b171c9dbe..6345d7d0de 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -2052,7 +2052,8 @@ RAMBlock *qemu_ram_alloc_from_fd(ram_addr_t size, MemoryRegion *mr,
     int64_t file_size, file_align;
 
     /* Just support these ram flags by now. */
-    assert((ram_flags & ~(RAM_SHARED | RAM_PMEM | RAM_NORESERVE)) == 0);
+    assert((ram_flags & ~(RAM_SHARED | RAM_PMEM | RAM_NORESERVE |
+                          RAM_PROTECTED)) == 0);
 
     if (xen_enabled()) {
         error_setg(errp, "-mem-path not supported with Xen");
-- 
2.29.2.334.gfaefdd61ec


