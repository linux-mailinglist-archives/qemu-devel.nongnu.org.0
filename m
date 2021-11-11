Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8A144D83C
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 15:27:48 +0100 (CET)
Received: from localhost ([::1]:45634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlB3M-0005bu-41
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 09:27:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1mlAsH-0001en-BC
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 09:16:21 -0500
Received: from mga09.intel.com ([134.134.136.24]:49703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1mlAsF-0006fS-Cx
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 09:16:21 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10164"; a="232759808"
X-IronPort-AV: E=Sophos;i="5.87,226,1631602800"; d="scan'208";a="232759808"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2021 06:16:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,226,1631602800"; d="scan'208";a="492555963"
Received: from chaop.bj.intel.com ([10.240.192.101])
 by orsmga007.jf.intel.com with ESMTP; 11 Nov 2021 06:16:08 -0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, qemu-devel@nongnu.org
Subject: [RFC PATCH 08/13] hostmem: Add guest private memory to memory backend
Date: Thu, 11 Nov 2021 22:13:47 +0800
Message-Id: <20211111141352.26311-9-chao.p.peng@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211111141352.26311-1-chao.p.peng@linux.intel.com>
References: <20211111141352.26311-1-chao.p.peng@linux.intel.com>
Received-SPF: none client-ip=134.134.136.24;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga09.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Wanpeng Li <wanpengli@tencent.com>, jun.nakajima@intel.com,
 david@redhat.com, "J . Bruce Fields" <bfields@fieldses.org>,
 dave.hansen@intel.com, "H . Peter Anvin" <hpa@zytor.com>,
 Chao Peng <chao.p.peng@linux.intel.com>, ak@linux.intel.com,
 Jonathan Corbet <corbet@lwn.net>, Joerg Roedel <joro@8bytes.org>,
 x86@kernel.org, Hugh Dickins <hughd@google.com>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 luto@kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Jim Mattson <jmattson@google.com>,
 Sean Christopherson <seanjc@google.com>, susie.li@intel.com,
 Jeff Layton <jlayton@kernel.org>, john.ji@intel.com,
 Yu Zhang <yu.c.zhang@linux.intel.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently only memfd is supported.

Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
---
 backends/hostmem-memfd.c | 12 +++++++++---
 backends/hostmem.c       | 24 ++++++++++++++++++++++++
 include/exec/memory.h    |  3 +++
 include/exec/ram_addr.h  |  3 ++-
 include/qemu/memfd.h     |  5 +++++
 include/sysemu/hostmem.h |  1 +
 softmmu/physmem.c        | 33 +++++++++++++++++++--------------
 util/memfd.c             | 32 +++++++++++++++++++++++++-------
 8 files changed, 88 insertions(+), 25 deletions(-)

diff --git a/backends/hostmem-memfd.c b/backends/hostmem-memfd.c
index 3fc85c3db8..ef057586a0 100644
--- a/backends/hostmem-memfd.c
+++ b/backends/hostmem-memfd.c
@@ -36,6 +36,7 @@ memfd_backend_memory_alloc(HostMemoryBackend *backend, Error **errp)
 {
     HostMemoryBackendMemfd *m = MEMORY_BACKEND_MEMFD(backend);
     uint32_t ram_flags;
+    unsigned int seals;
     char *name;
     int fd;
 
@@ -44,10 +45,14 @@ memfd_backend_memory_alloc(HostMemoryBackend *backend, Error **errp)
         return;
     }
 
+    seals = backend->guest_private ? F_SEAL_GUEST : 0;
+
+    if (m->seal) {
+        seals |= F_SEAL_GROW | F_SEAL_SHRINK | F_SEAL_SEAL;
+    }
+
     fd = qemu_memfd_create(TYPE_MEMORY_BACKEND_MEMFD, backend->size,
-                           m->hugetlb, m->hugetlbsize, m->seal ?
-                           F_SEAL_GROW | F_SEAL_SHRINK | F_SEAL_SEAL : 0,
-                           errp);
+                           m->hugetlb, m->hugetlbsize, seals, errp);
     if (fd == -1) {
         return;
     }
@@ -55,6 +60,7 @@ memfd_backend_memory_alloc(HostMemoryBackend *backend, Error **errp)
     name = host_memory_backend_get_name(backend);
     ram_flags = backend->share ? RAM_SHARED : 0;
     ram_flags |= backend->reserve ? 0 : RAM_NORESERVE;
+    ram_flags |= backend->guest_private ? RAM_GUEST_PRIVATE : 0;
     memory_region_init_ram_from_fd(&backend->mr, OBJECT(backend), name,
                                    backend->size, ram_flags, fd, 0, errp);
     g_free(name);
diff --git a/backends/hostmem.c b/backends/hostmem.c
index 4c05862ed5..a90d1be0a0 100644
--- a/backends/hostmem.c
+++ b/backends/hostmem.c
@@ -472,6 +472,23 @@ host_memory_backend_set_use_canonical_path(Object *obj, bool value,
     backend->use_canonical_path = value;
 }
 
+static bool
+host_memory_backend_get_guest_private(Object *obj, Error **errp)
+{
+    HostMemoryBackend *backend = MEMORY_BACKEND(obj);
+
+    return backend->guest_private;
+
+}
+
+static void
+host_memory_backend_set_guest_private(Object *obj, bool value, Error **errp)
+{
+    HostMemoryBackend *backend = MEMORY_BACKEND(obj);
+
+    backend->guest_private = value;
+}
+
 static void
 host_memory_backend_class_init(ObjectClass *oc, void *data)
 {
@@ -542,6 +559,13 @@ host_memory_backend_class_init(ObjectClass *oc, void *data)
     object_class_property_add_bool(oc, "x-use-canonical-path-for-ramblock-id",
         host_memory_backend_get_use_canonical_path,
         host_memory_backend_set_use_canonical_path);
+
+    object_class_property_add_bool(oc, "guest-private",
+                                   host_memory_backend_get_guest_private,
+                                   host_memory_backend_set_guest_private);
+    object_class_property_set_description(oc, "guest-private",
+                                          "Guest private memory");
+
 }
 
 static const TypeInfo host_memory_backend_info = {
diff --git a/include/exec/memory.h b/include/exec/memory.h
index c3d417d317..ae9d3bc574 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -190,6 +190,9 @@ typedef struct IOMMUTLBEvent {
  */
 #define RAM_NORESERVE (1 << 7)
 
+/* RAM is guest private memory that can not be mmap-ed. */
+#define RAM_GUEST_PRIVATE (1 << 8)
+
 static inline void iommu_notifier_init(IOMMUNotifier *n, IOMMUNotify fn,
                                        IOMMUNotifierFlag flags,
                                        hwaddr start, hwaddr end,
diff --git a/include/exec/ram_addr.h b/include/exec/ram_addr.h
index 551876bed0..32768291de 100644
--- a/include/exec/ram_addr.h
+++ b/include/exec/ram_addr.h
@@ -74,7 +74,8 @@ static inline bool clear_bmap_test_and_clear(RAMBlock *rb, uint64_t page)
 
 static inline bool offset_in_ramblock(RAMBlock *b, ram_addr_t offset)
 {
-    return (b && b->host && offset < b->used_length) ? true : false;
+    return (b && (b->flags & RAM_GUEST_PRIVATE || b->host)
+		    && offset < b->used_length) ? true : false;
 }
 
 static inline void *ramblock_ptr(RAMBlock *block, ram_addr_t offset)
diff --git a/include/qemu/memfd.h b/include/qemu/memfd.h
index 975b6bdb77..f021a0730a 100644
--- a/include/qemu/memfd.h
+++ b/include/qemu/memfd.h
@@ -14,6 +14,11 @@
 #define F_SEAL_SHRINK   0x0002  /* prevent file from shrinking */
 #define F_SEAL_GROW     0x0004  /* prevent file from growing */
 #define F_SEAL_WRITE    0x0008  /* prevent writes */
+
+#endif
+
+#ifndef F_SEAL_GUEST
+#define F_SEAL_GUEST    0x0020  /* guest private memory */
 #endif
 
 #ifndef MFD_CLOEXEC
diff --git a/include/sysemu/hostmem.h b/include/sysemu/hostmem.h
index 9ff5c16963..ddf742a69b 100644
--- a/include/sysemu/hostmem.h
+++ b/include/sysemu/hostmem.h
@@ -65,6 +65,7 @@ struct HostMemoryBackend {
     uint64_t size;
     bool merge, dump, use_canonical_path;
     bool prealloc, is_mapped, share, reserve;
+    bool guest_private;
     uint32_t prealloc_threads;
     DECLARE_BITMAP(host_nodes, MAX_NODES + 1);
     HostMemPolicy policy;
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 23e77cb771..f4d6eeaa17 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -1591,15 +1591,19 @@ static void *file_ram_alloc(RAMBlock *block,
         perror("ftruncate");
     }
 
-    qemu_map_flags = readonly ? QEMU_MAP_READONLY : 0;
-    qemu_map_flags |= (block->flags & RAM_SHARED) ? QEMU_MAP_SHARED : 0;
-    qemu_map_flags |= (block->flags & RAM_PMEM) ? QEMU_MAP_SYNC : 0;
-    qemu_map_flags |= (block->flags & RAM_NORESERVE) ? QEMU_MAP_NORESERVE : 0;
-    area = qemu_ram_mmap(fd, memory, block->mr->align, qemu_map_flags, offset);
-    if (area == MAP_FAILED) {
-        error_setg_errno(errp, errno,
-                         "unable to map backing store for guest RAM");
-        return NULL;
+    if (block->flags & RAM_GUEST_PRIVATE) {
+        area = (void*)offset;
+    } else {
+        qemu_map_flags = readonly ? QEMU_MAP_READONLY : 0;
+        qemu_map_flags |= (block->flags & RAM_SHARED) ? QEMU_MAP_SHARED : 0;
+        qemu_map_flags |= (block->flags & RAM_PMEM) ? QEMU_MAP_SYNC : 0;
+        qemu_map_flags |= (block->flags & RAM_NORESERVE) ? QEMU_MAP_NORESERVE : 0;
+        area = qemu_ram_mmap(fd, memory, block->mr->align, qemu_map_flags, offset);
+        if (area == MAP_FAILED) {
+            error_setg_errno(errp, errno,
+                             "unable to map backing store for guest RAM");
+            return NULL;
+        }
     }
 
     block->fd = fd;
@@ -1971,7 +1975,7 @@ static void ram_block_add(RAMBlock *new_block, Error **errp)
     qemu_mutex_lock_ramlist();
     new_block->offset = find_ram_offset(new_block->max_length);
 
-    if (!new_block->host) {
+    if (!new_block->host && !(new_block->flags & RAM_GUEST_PRIVATE)) {
         if (xen_enabled()) {
             xen_ram_alloc(new_block->offset, new_block->max_length,
                           new_block->mr, &err);
@@ -2028,7 +2032,7 @@ static void ram_block_add(RAMBlock *new_block, Error **errp)
                                         new_block->used_length,
                                         DIRTY_CLIENTS_ALL);
 
-    if (new_block->host) {
+    if (new_block->host && !(new_block->flags & RAM_GUEST_PRIVATE)) {
         qemu_ram_setup_dump(new_block->host, new_block->max_length);
         qemu_madvise(new_block->host, new_block->max_length, QEMU_MADV_HUGEPAGE);
         /*
@@ -2055,7 +2059,8 @@ RAMBlock *qemu_ram_alloc_from_fd(ram_addr_t size, MemoryRegion *mr,
     int64_t file_size, file_align;
 
     /* Just support these ram flags by now. */
-    assert((ram_flags & ~(RAM_SHARED | RAM_PMEM | RAM_NORESERVE)) == 0);
+    assert((ram_flags & ~(RAM_SHARED | RAM_PMEM | RAM_NORESERVE |
+                          RAM_GUEST_PRIVATE)) == 0);
 
     if (xen_enabled()) {
         error_setg(errp, "-mem-path not supported with Xen");
@@ -2092,7 +2097,7 @@ RAMBlock *qemu_ram_alloc_from_fd(ram_addr_t size, MemoryRegion *mr,
     new_block->flags = ram_flags;
     new_block->host = file_ram_alloc(new_block, size, fd, readonly,
                                      !file_size, offset, errp);
-    if (!new_block->host) {
+    if (!new_block->host && !(ram_flags & RAM_GUEST_PRIVATE)) {
         g_free(new_block);
         return NULL;
     }
@@ -2392,7 +2397,7 @@ RAMBlock *qemu_ram_block_from_host(void *ptr, bool round_offset,
 
     RAMBLOCK_FOREACH(block) {
         /* This case append when the block is not mapped. */
-        if (block->host == NULL) {
+        if (block->host == NULL && !(block->flags & RAM_GUEST_PRIVATE)) {
             continue;
         }
         if (host - block->host < block->max_length) {
diff --git a/util/memfd.c b/util/memfd.c
index 4a3c07e0be..3b4b88d81e 100644
--- a/util/memfd.c
+++ b/util/memfd.c
@@ -76,14 +76,32 @@ int qemu_memfd_create(const char *name, size_t size, bool hugetlb,
         goto err;
     }
 
-    if (ftruncate(mfd, size) == -1) {
-        error_setg_errno(errp, errno, "failed to resize memfd to %zu", size);
-        goto err;
-    }
 
-    if (seals && fcntl(mfd, F_ADD_SEALS, seals) == -1) {
-        error_setg_errno(errp, errno, "failed to add seals 0x%x", seals);
-        goto err;
+    /*
+     * The call sequence of F_ADD_SEALS and ftruncate matters here.
+     * For SEAL_GUEST, it requires the size to be 0 at the time of setting seal
+     * For SEAL_GROW/SHRINK, ftruncate should be called before setting seal.
+     */
+    if (seals & F_SEAL_GUEST) {
+        if (seals && fcntl(mfd, F_ADD_SEALS, seals) == -1) {
+            error_setg_errno(errp, errno, "failed to add seals 0x%x", seals);
+            goto err;
+        }
+
+        if (ftruncate(mfd, size) == -1) {
+            error_setg_errno(errp, errno, "failed to resize memfd to %zu", size);
+            goto err;
+        }
+    } else {
+        if (ftruncate(mfd, size) == -1) {
+            error_setg_errno(errp, errno, "failed to resize memfd to %zu", size);
+            goto err;
+        }
+
+        if (seals && fcntl(mfd, F_ADD_SEALS, seals) == -1) {
+            error_setg_errno(errp, errno, "failed to add seals 0x%x", seals);
+            goto err;
+        }
     }
 
     return mfd;
-- 
2.17.1


