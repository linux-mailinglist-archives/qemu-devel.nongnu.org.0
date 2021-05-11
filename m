Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90736379FAA
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 08:31:50 +0200 (CEST)
Received: from localhost ([::1]:35500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgLvp-0008Tj-8I
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 02:31:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1lgLrp-0005nH-EZ
 for qemu-devel@nongnu.org; Tue, 11 May 2021 02:27:42 -0400
Received: from mga06.intel.com ([134.134.136.31]:46437)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1lgLrk-0004hV-En
 for qemu-devel@nongnu.org; Tue, 11 May 2021 02:27:40 -0400
IronPort-SDR: Ha/TJ3kRdwTdiwhREuMvfE1cHW6p7iSBYQx/d+rYmObyldjwnkQR1/N9frf6hHeJltVIG38Zhr
 zIxek5mkVJxQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9980"; a="260631476"
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; d="scan'208";a="260631476"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2021 23:27:22 -0700
IronPort-SDR: 0SiQc0KO9t8Bv34/WQAfUuWRFdD6HsWWKPOzS4Ww3G8KZ/vD7ar3VzUuFlgRxNcWaKzj7+21d3
 W7p9+4wAC6jQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; d="scan'208";a="391281010"
Received: from icx-2s.bj.intel.com ([10.240.192.119])
 by orsmga003.jf.intel.com with ESMTP; 10 May 2021 23:27:20 -0700
From: Yang Zhong <yang.zhong@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 01/32] memory: Add RAM_PROTECTED flag to skip IOMMU mappings
Date: Tue, 11 May 2021 14:20:20 +0800
Message-Id: <20210511062051.41948-2-yang.zhong@intel.com>
X-Mailer: git-send-email 2.29.2.334.gfaefdd61ec
In-Reply-To: <20210511062051.41948-1-yang.zhong@intel.com>
References: <20210511062051.41948-1-yang.zhong@intel.com>
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
Cc: yang.zhong@intel.com, pbonzini@redhat.com, kai.huang@intel.com,
 seanjc@google.com
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
 backends/hostmem-memfd.c |  3 ++-
 hw/misc/ivshmem.c        |  4 ++--
 hw/remote/memory.c       |  2 +-
 hw/vfio/common.c         |  1 +
 include/exec/memory.h    | 20 ++++++++++++++++++--
 softmmu/memory.c         | 11 ++++++++---
 softmmu/physmem.c        |  2 +-
 7 files changed, 33 insertions(+), 10 deletions(-)

diff --git a/backends/hostmem-memfd.c b/backends/hostmem-memfd.c
index da75e27057..d95376411c 100644
--- a/backends/hostmem-memfd.c
+++ b/backends/hostmem-memfd.c
@@ -54,7 +54,8 @@ memfd_backend_memory_alloc(HostMemoryBackend *backend, Error **errp)
     name = host_memory_backend_get_name(backend);
     memory_region_init_ram_from_fd(&backend->mr, OBJECT(backend),
                                    name, backend->size,
-                                   backend->share, fd, 0, errp);
+                                   backend->share ? RAM_SHARED : 0,
+                                   fd, 0, errp);
     g_free(name);
 }
 
diff --git a/hw/misc/ivshmem.c b/hw/misc/ivshmem.c
index a1fa4878be..89badb98f6 100644
--- a/hw/misc/ivshmem.c
+++ b/hw/misc/ivshmem.c
@@ -494,8 +494,8 @@ static void process_msg_shmem(IVShmemState *s, int fd, Error **errp)
 
     /* mmap the region and map into the BAR2 */
     memory_region_init_ram_from_fd(&s->server_bar2, OBJECT(s),
-                                   "ivshmem.bar2", size, true, fd, 0,
-                                   &local_err);
+                                   "ivshmem.bar2", size,
+                                   RAM_SHARED, fd, 0, &local_err);
     if (local_err) {
         error_propagate(errp, local_err);
         return;
diff --git a/hw/remote/memory.c b/hw/remote/memory.c
index 2d4174614a..f5fc80ebb4 100644
--- a/hw/remote/memory.c
+++ b/hw/remote/memory.c
@@ -47,7 +47,7 @@ void remote_sysmem_reconfig(MPQemuMsg *msg, Error **errp)
         name = g_strdup_printf("remote-mem-%u", suffix++);
         memory_region_init_ram_from_fd(subregion, NULL,
                                        name, sysmem_info->sizes[region],
-                                       true, msg->fds[region],
+                                       RAM_SHARED, msg->fds[region],
                                        sysmem_info->offsets[region],
                                        errp);
 
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
index 5728a681b2..0cad2495de 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -155,6 +155,9 @@ typedef struct IOMMUTLBEvent {
  */
 #define RAM_UF_WRITEPROTECT (1 << 6)
 
+/* RAM that isn't accessible through normal means. */
+#define RAM_PROTECTED (1 << 7)
+
 static inline void iommu_notifier_init(IOMMUNotifier *n, IOMMUNotify fn,
                                        IOMMUNotifierFlag flags,
                                        hwaddr start, hwaddr end,
@@ -1020,7 +1023,10 @@ void memory_region_init_ram_from_file(MemoryRegion *mr,
  * @owner: the object that tracks the region's reference count
  * @name: the name of the region.
  * @size: size of the region.
- * @share: %true if memory must be mmaped with the MAP_SHARED flag
+ * @ram_flags: Memory region features:
+ *             - RAM_SHARED: memory must be mmaped with the MAP_SHARED flag
+ *             - RAM_PROTECTED: the memory is protected memory
+ *             Other bits are ignored now.
  * @fd: the fd to mmap.
  * @offset: offset within the file referenced by fd
  * @errp: pointer to Error*, to store an error if it happens.
@@ -1032,7 +1038,7 @@ void memory_region_init_ram_from_fd(MemoryRegion *mr,
                                     Object *owner,
                                     const char *name,
                                     uint64_t size,
-                                    bool share,
+                                    uint32_t ram_flags,
                                     int fd,
                                     ram_addr_t offset,
                                     Error **errp);
@@ -1321,6 +1327,16 @@ static inline bool memory_region_is_romd(MemoryRegion *mr)
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
index 3bb533c0bc..f0ba8209ca 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -1609,7 +1609,7 @@ void memory_region_init_ram_from_fd(MemoryRegion *mr,
                                     Object *owner,
                                     const char *name,
                                     uint64_t size,
-                                    bool share,
+                                    uint32_t ram_flags,
                                     int fd,
                                     ram_addr_t offset,
                                     Error **errp)
@@ -1619,9 +1619,9 @@ void memory_region_init_ram_from_fd(MemoryRegion *mr,
     mr->ram = true;
     mr->terminates = true;
     mr->destructor = memory_region_destructor_ram;
-    mr->ram_block = qemu_ram_alloc_from_fd(size, mr,
-                                           share ? RAM_SHARED : 0,
+    mr->ram_block = qemu_ram_alloc_from_fd(size, mr, ram_flags,
                                            fd, offset, false, &err);
+
     if (err) {
         mr->size = int128_zero();
         object_unparent(OBJECT(mr));
@@ -1808,6 +1808,11 @@ bool memory_region_is_ram_device(MemoryRegion *mr)
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
index 5232696571..e601d86d63 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -2019,7 +2019,7 @@ RAMBlock *qemu_ram_alloc_from_fd(ram_addr_t size, MemoryRegion *mr,
     int64_t file_size, file_align;
 
     /* Just support these ram flags by now. */
-    assert((ram_flags & ~(RAM_SHARED | RAM_PMEM)) == 0);
+    assert((ram_flags & ~(RAM_SHARED | RAM_PMEM | RAM_PROTECTED)) == 0);
 
     if (xen_enabled()) {
         error_setg(errp, "-mem-path not supported with Xen");
-- 
2.29.2.334.gfaefdd61ec


