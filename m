Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E26103D0A26
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 09:58:22 +0200 (CEST)
Received: from localhost ([::1]:43950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m677W-00065U-01
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 03:58:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.gao@intel.com>)
 id 1m673y-0003Dk-Kn
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 03:54:42 -0400
Received: from mga18.intel.com ([134.134.136.126]:5838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.gao@intel.com>)
 id 1m673v-000756-Qk
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 03:54:42 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10051"; a="198662547"
X-IronPort-AV: E=Sophos;i="5.84,257,1620716400"; d="scan'208";a="198662547"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2021 00:54:28 -0700
X-IronPort-AV: E=Sophos;i="5.84,257,1620716400"; d="scan'208";a="501192859"
Received: from hyperv-sh4.sh.intel.com ([10.239.48.98])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2021 00:54:26 -0700
From: Chao Gao <chao.gao@intel.com>
To: mst@redhat.com,
	pbonzini@redhat.com
Subject: [PATCH] vhost: use large iotlb entry if no IOMMU translation is needed
Date: Wed, 21 Jul 2021 15:54:02 +0800
Message-Id: <20210721075402.203711-1-chao.gao@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.126; envelope-from=chao.gao@intel.com;
 helo=mga18.intel.com
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
Cc: qemu-devel@nongnu.org, Chao Gao <chao.gao@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If guest enables IOMMU_PLATFORM for virtio-net, severe network
performance drop is observed even if there is no IOMMU. And disabling
vhost can mitigate the perf issue. Finally, we found the culprit is
frequent iotlb misses: kernel vhost-net has 2048 entries and each
entry is 4K (qemu uses 4K for i386 if no IOMMU); vhost-net can cache
translations for up to 8M (i.e. 4K*2048) IOVAs. If guest uses >8M
memory for DMA, there are some iotlb misses.

If there is no IOMMU or IOMMU is disabled or IOMMU works in pass-thru
mode, we can optimistically use large, unaligned iotlb entries instead
of 4K-aligned entries to reduce iotlb pressure. Actually, vhost-net
in kernel supports unaligned iotlb entry. The alignment requirement is
imposed by address_space_get_iotlb_entry() and flatview_do_translate().

Introduce IOMMUTLBEntryUnaligned which has a @len field to specify the
iotlb size to abstract a generic iotlb entry: aligned (original
IOMMUTLBEntry) and unaligned entry. flatview_do_translate() now
returns a magic value in @page_mask_out if no IOMMU translation is
needed. Then, address_space_get_iotbl_entry() can accordingly return a
page-aligned iotlb entry or the whole memory region section where the
iova resides as a large iotlb entry.

Signed-off-by: Chao Gao <chao.gao@intel.com>
---
 hw/virtio/vhost.c     |  6 +++---
 include/exec/memory.h | 16 ++++++++++++++--
 softmmu/physmem.c     | 37 +++++++++++++++++++++++++++++--------
 3 files changed, 46 insertions(+), 13 deletions(-)

diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index e8f85a5d2d..6745caa129 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -1010,7 +1010,7 @@ static int vhost_memory_region_lookup(struct vhost_dev *hdev,
 
 int vhost_device_iotlb_miss(struct vhost_dev *dev, uint64_t iova, int write)
 {
-    IOMMUTLBEntry iotlb;
+    IOMMUTLBEntryUnaligned iotlb;
     uint64_t uaddr, len;
     int ret = -EFAULT;
 
@@ -1031,8 +1031,8 @@ int vhost_device_iotlb_miss(struct vhost_dev *dev, uint64_t iova, int write)
             goto out;
         }
 
-        len = MIN(iotlb.addr_mask + 1, len);
-        iova = iova & ~iotlb.addr_mask;
+        len = MIN(iotlb.len, len);
+        iova = iotlb.iova;
 
         ret = vhost_backend_update_device_iotlb(dev, iova, uaddr,
                                                 len, iotlb.perm);
diff --git a/include/exec/memory.h b/include/exec/memory.h
index c3d417d317..3f04e8fe88 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -94,6 +94,7 @@ struct MemoryRegionSection {
 };
 
 typedef struct IOMMUTLBEntry IOMMUTLBEntry;
+typedef struct IOMMUTLBEntryUnaligned IOMMUTLBEntryUnaligned;
 
 /* See address_space_translate: bit 0 is read, bit 1 is write.  */
 typedef enum {
@@ -113,6 +114,15 @@ struct IOMMUTLBEntry {
     IOMMUAccessFlags perm;
 };
 
+/* IOMMUTLBEntryUnaligned may be not page-aligned */
+struct IOMMUTLBEntryUnaligned {
+    AddressSpace    *target_as;
+    hwaddr           iova;
+    hwaddr           translated_addr;
+    hwaddr           len;
+    IOMMUAccessFlags perm;
+};
+
 /*
  * Bitmap for different IOMMUNotifier capabilities. Each notifier can
  * register with one or multiple IOMMU Notifier capability bit(s).
@@ -2653,8 +2663,10 @@ void address_space_cache_destroy(MemoryRegionCache *cache);
 /* address_space_get_iotlb_entry: translate an address into an IOTLB
  * entry. Should be called from an RCU critical section.
  */
-IOMMUTLBEntry address_space_get_iotlb_entry(AddressSpace *as, hwaddr addr,
-                                            bool is_write, MemTxAttrs attrs);
+IOMMUTLBEntryUnaligned address_space_get_iotlb_entry(AddressSpace *as,
+                                                     hwaddr addr,
+                                                     bool is_write,
+                                                     MemTxAttrs attrs);
 
 /* address_space_translate: translate an address range into an address space
  * into a MemoryRegion and an address range into that section.  Should be
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 3c1912a1a0..469963f754 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -143,6 +143,8 @@ typedef struct subpage_t {
 
 #define PHYS_SECTION_UNASSIGNED 0
 
+#define PAGE_MASK_NOT_BEHIND_IOMMU ((hwaddr)-1)
+
 static void io_mem_init(void);
 static void memory_map_init(void);
 static void tcg_log_global_after_sync(MemoryListener *listener);
@@ -470,7 +472,9 @@ unassigned:
  * @page_mask_out: page mask for the translated address. This
  *            should only be meaningful for IOMMU translated
  *            addresses, since there may be huge pages that this bit
- *            would tell. It can be @NULL if we don't care about it.
+ *            would tell. If the returned memory region section isn't
+ *            behind an IOMMU, PAGE_MASK_NOT_BEHIND_IOMMU is return.
+ *            It can be @NULL if we don't care about it.
  * @is_write: whether the translation operation is for write
  * @is_mmio: whether this can be MMIO, set true if it can
  * @target_as: the address space targeted by the IOMMU
@@ -508,16 +512,18 @@ static MemoryRegionSection flatview_do_translate(FlatView *fv,
                                              target_as, attrs);
     }
     if (page_mask_out) {
-        /* Not behind an IOMMU, use default page size. */
-        *page_mask_out = ~TARGET_PAGE_MASK;
+        /* return a magic value if not behind an IOMMU */
+        *page_mask_out = PAGE_MASK_NOT_BEHIND_IOMMU;
     }
 
     return *section;
 }
 
 /* Called from RCU critical section */
-IOMMUTLBEntry address_space_get_iotlb_entry(AddressSpace *as, hwaddr addr,
-                                            bool is_write, MemTxAttrs attrs)
+IOMMUTLBEntryUnaligned address_space_get_iotlb_entry(AddressSpace *as,
+                                                     hwaddr addr,
+                                                     bool is_write,
+                                                     MemTxAttrs attrs)
 {
     MemoryRegionSection section;
     hwaddr xlat, page_mask;
@@ -535,21 +541,36 @@ IOMMUTLBEntry address_space_get_iotlb_entry(AddressSpace *as, hwaddr addr,
         goto iotlb_fail;
     }
 
+    /*
+     * If the section isn't behind an IOMMU, return the whole section as an
+     * IOMMU TLB entry.
+     */
+    if (page_mask == PAGE_MASK_NOT_BEHIND_IOMMU) {
+        return (IOMMUTLBEntryUnaligned) {
+            .target_as = as,
+            .iova = section.offset_within_address_space,
+            .translated_addr = section.offset_within_address_space,
+            .len = section.size,
+            /* IOTLBs are for DMAs, and DMA only allows on RAMs. */
+            .perm = IOMMU_RW,
+        };
+    }
+
     /* Convert memory region offset into address space offset */
     xlat += section.offset_within_address_space -
         section.offset_within_region;
 
-    return (IOMMUTLBEntry) {
+    return (IOMMUTLBEntryUnaligned) {
         .target_as = as,
         .iova = addr & ~page_mask,
         .translated_addr = xlat & ~page_mask,
-        .addr_mask = page_mask,
+        .len = page_mask + 1,
         /* IOTLBs are for DMAs, and DMA only allows on RAMs. */
         .perm = IOMMU_RW,
     };
 
 iotlb_fail:
-    return (IOMMUTLBEntry) {0};
+    return (IOMMUTLBEntryUnaligned) {0};
 }
 
 /* Called from RCU critical section */
-- 
2.25.1


