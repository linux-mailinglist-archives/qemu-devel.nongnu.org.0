Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC94B378A15
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 13:53:51 +0200 (CEST)
Received: from localhost ([::1]:41728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg4Tt-0001gn-Bw
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 07:53:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lg4Kp-000114-Vp
 for qemu-devel@nongnu.org; Mon, 10 May 2021 07:44:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43140)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lg4Kk-0003oO-Co
 for qemu-devel@nongnu.org; Mon, 10 May 2021 07:44:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620647061;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q2F8mEtNzYBTc3ymYIrkQAbL3REHUpl9fC94XbEh4NI=;
 b=MGO48WP7FrIfcAwNW/GjQwvy29H5Rls5n1rzSABkEJX7s/vNfZoX7Lz2F5xbku+yK47nA7
 SRxEepW8Hx2FJiZ1eLy2mK2KPQzPv2ayNv4t+6OpWwm9DFnynaGUsz1PR3q53aKeUv4bcC
 fhQndEvSk20dhAlgGmcbEfeSM5hbKEU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-236-kmfSM5InMGWqbDGA1FB3Wg-1; Mon, 10 May 2021 07:44:19 -0400
X-MC-Unique: kmfSM5InMGWqbDGA1FB3Wg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EB38F801B16
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 11:44:18 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-114-137.ams2.redhat.com [10.36.114.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 094A5100EBAF;
 Mon, 10 May 2021 11:44:13 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 08/15] memory: Introduce RAM_NORESERVE and wire it up in
 qemu_ram_mmap()
Date: Mon, 10 May 2021 13:43:21 +0200
Message-Id: <20210510114328.21835-9-david@redhat.com>
In-Reply-To: <20210510114328.21835-1-david@redhat.com>
References: <20210510114328.21835-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let's introduce RAM_NORESERVE, allowing mmap'ing with MAP_NORESERVE. The
new flag has the following semantics:

"
RAM is mmap-ed with MAP_NORESERVE. When set, reserving swap space (or huge
pages if applicable) is skipped: will bail out if not supported. When not
set, the OS will do the reservation, if supported for the memory type.
"

Allow passing it into:
- memory_region_init_ram_nomigrate()
- memory_region_init_resizeable_ram()
- memory_region_init_ram_from_file()

... and teach qemu_ram_mmap() and qemu_anon_ram_alloc() about the flag.
Bail out if the flag is not supported, which is the case right now for
both, POSIX and win32. We will add Linux support next and allow specifying
RAM_NORESERVE via memory backends.

The target use case is virtio-mem, which dynamically exposes memory
inside a large, sparse memory area to the VM.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
Acked-by: Eduardo Habkost <ehabkost@redhat.com> for memory backend and machine core
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/exec/cpu-common.h |  1 +
 include/exec/memory.h     | 15 ++++++++++++---
 include/exec/ram_addr.h   |  3 ++-
 include/qemu/osdep.h      |  9 ++++++++-
 migration/ram.c           |  3 +--
 softmmu/physmem.c         | 15 ++++++++++++---
 util/mmap-alloc.c         |  7 +++++++
 util/oslib-posix.c        |  6 ++++--
 util/oslib-win32.c        | 13 ++++++++++++-
 9 files changed, 59 insertions(+), 13 deletions(-)

diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
index 5a0a2d93e0..38a47ad4ac 100644
--- a/include/exec/cpu-common.h
+++ b/include/exec/cpu-common.h
@@ -58,6 +58,7 @@ void *qemu_ram_get_host_addr(RAMBlock *rb);
 ram_addr_t qemu_ram_get_offset(RAMBlock *rb);
 ram_addr_t qemu_ram_get_used_length(RAMBlock *rb);
 bool qemu_ram_is_shared(RAMBlock *rb);
+bool qemu_ram_is_noreserve(RAMBlock *rb);
 bool qemu_ram_is_uf_zeroable(RAMBlock *rb);
 void qemu_ram_set_uf_zeroable(RAMBlock *rb);
 bool qemu_ram_is_migratable(RAMBlock *rb);
diff --git a/include/exec/memory.h b/include/exec/memory.h
index 10179c6695..8d77819bcd 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -155,6 +155,13 @@ typedef struct IOMMUTLBEvent {
  */
 #define RAM_UF_WRITEPROTECT (1 << 6)
 
+/*
+ * RAM is mmap-ed with MAP_NORESERVE. When set, reserving swap space (or huge
+ * pages if applicable) is skipped: will bail out if not supported. When not
+ * set, the OS will do the reservation, if supported for the memory type.
+ */
+#define RAM_NORESERVE (1 << 7)
+
 static inline void iommu_notifier_init(IOMMUNotifier *n, IOMMUNotify fn,
                                        IOMMUNotifierFlag flags,
                                        hwaddr start, hwaddr end,
@@ -937,7 +944,7 @@ void memory_region_init_ram_nomigrate(MemoryRegion *mr,
  * @name: Region name, becomes part of RAMBlock name used in migration stream
  *        must be unique within any device
  * @size: size of the region.
- * @ram_flags: RamBlock flags. Supported flags: RAM_SHARED.
+ * @ram_flags: RamBlock flags. Supported flags: RAM_SHARED, RAM_NORESERVE.
  * @errp: pointer to Error*, to store an error if it happens.
  *
  * Note that this function does not do anything to cause the data in the
@@ -991,7 +998,8 @@ void memory_region_init_resizeable_ram(MemoryRegion *mr,
  * @size: size of the region.
  * @align: alignment of the region base address; if 0, the default alignment
  *         (getpagesize()) will be used.
- * @ram_flags: RamBlock flags. Supported flags: RAM_SHARED, RAM_PMEM.
+ * @ram_flags: RamBlock flags. Supported flags: RAM_SHARED, RAM_PMEM,
+ *             RAM_NORESERVE,
  * @path: the path in which to allocate the RAM.
  * @readonly: true to open @path for reading, false for read/write.
  * @errp: pointer to Error*, to store an error if it happens.
@@ -1017,7 +1025,8 @@ void memory_region_init_ram_from_file(MemoryRegion *mr,
  * @owner: the object that tracks the region's reference count
  * @name: the name of the region.
  * @size: size of the region.
- * @ram_flags: RamBlock flags. Supported flags: RAM_SHARED, RAM_PMEM.
+ * @ram_flags: RamBlock flags. Supported flags: RAM_SHARED, RAM_PMEM,
+ *             RAM_NORESERVE.
  * @fd: the fd to mmap.
  * @offset: offset within the file referenced by fd
  * @errp: pointer to Error*, to store an error if it happens.
diff --git a/include/exec/ram_addr.h b/include/exec/ram_addr.h
index 6d4513f8e2..551876bed0 100644
--- a/include/exec/ram_addr.h
+++ b/include/exec/ram_addr.h
@@ -104,7 +104,8 @@ long qemu_maxrampagesize(void);
  * Parameters:
  *  @size: the size in bytes of the ram block
  *  @mr: the memory region where the ram block is
- *  @ram_flags: RamBlock flags. Supported flags: RAM_SHARED, RAM_PMEM.
+ *  @ram_flags: RamBlock flags. Supported flags: RAM_SHARED, RAM_PMEM,
+ *              RAM_NORESERVE.
  *  @mem_path or @fd: specify the backing file or device
  *  @readonly: true to open @path for reading, false for read/write.
  *  @errp: pointer to Error*, to store an error if it happens
diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index a96d6cb7ac..af65b36698 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -362,7 +362,8 @@ extern "C" {
 int qemu_daemon(int nochdir, int noclose);
 void *qemu_try_memalign(size_t alignment, size_t size);
 void *qemu_memalign(size_t alignment, size_t size);
-void *qemu_anon_ram_alloc(size_t size, uint64_t *align, bool shared);
+void *qemu_anon_ram_alloc(size_t size, uint64_t *align, bool shared,
+                          bool noreserve);
 void qemu_vfree(void *ptr);
 void qemu_anon_ram_free(void *ptr, size_t size);
 
@@ -383,6 +384,12 @@ void qemu_anon_ram_free(void *ptr, size_t size);
  */
 #define QEMU_MAP_SYNC       (1 << 2)
 
+/*
+ * Use MAP_NORESERVE to skip reservation of swap space (or huge pages if
+ * applicable). Bail out if not supported/effective.
+ */
+#define QEMU_MAP_NORESERVE  (1 << 3)
+
 
 #define QEMU_MADV_INVALID -1
 
diff --git a/migration/ram.c b/migration/ram.c
index ace8ad431c..daa29b845a 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -3369,8 +3369,7 @@ int colo_init_ram_cache(void)
     WITH_RCU_READ_LOCK_GUARD() {
         RAMBLOCK_FOREACH_NOT_IGNORED(block) {
             block->colo_cache = qemu_anon_ram_alloc(block->used_length,
-                                                    NULL,
-                                                    false);
+                                                    NULL, false, false);
             if (!block->colo_cache) {
                 error_report("%s: Can't alloc memory for COLO cache of block %s,"
                              "size 0x" RAM_ADDR_FMT, __func__, block->idstr,
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 0138b7c31a..a356c3fc09 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -1581,6 +1581,7 @@ static void *file_ram_alloc(RAMBlock *block,
     qemu_map_flags = readonly ? QEMU_MAP_READONLY : 0;
     qemu_map_flags |= (block->flags & RAM_SHARED) ? QEMU_MAP_SHARED : 0;
     qemu_map_flags |= (block->flags & RAM_PMEM) ? QEMU_MAP_SYNC : 0;
+    qemu_map_flags |= (block->flags & RAM_NORESERVE) ? QEMU_MAP_NORESERVE : 0;
     area = qemu_ram_mmap(fd, memory, block->mr->align, qemu_map_flags, offset);
     if (area == MAP_FAILED) {
         error_setg_errno(errp, errno,
@@ -1701,6 +1702,11 @@ bool qemu_ram_is_shared(RAMBlock *rb)
     return rb->flags & RAM_SHARED;
 }
 
+bool qemu_ram_is_noreserve(RAMBlock *rb)
+{
+    return rb->flags & RAM_NORESERVE;
+}
+
 /* Note: Only set at the start of postcopy */
 bool qemu_ram_is_uf_zeroable(RAMBlock *rb)
 {
@@ -1928,6 +1934,7 @@ static void dirty_memory_extend(ram_addr_t old_ram_size,
 
 static void ram_block_add(RAMBlock *new_block, Error **errp)
 {
+    const bool noreserve = qemu_ram_is_noreserve(new_block);
     const bool shared = qemu_ram_is_shared(new_block);
     RAMBlock *block;
     RAMBlock *last_block = NULL;
@@ -1951,7 +1958,7 @@ static void ram_block_add(RAMBlock *new_block, Error **errp)
         } else {
             new_block->host = qemu_anon_ram_alloc(new_block->max_length,
                                                   &new_block->mr->align,
-                                                  shared);
+                                                  shared, noreserve);
             if (!new_block->host) {
                 error_setg_errno(errp, errno,
                                  "cannot set up guest memory '%s'",
@@ -2022,7 +2029,7 @@ RAMBlock *qemu_ram_alloc_from_fd(ram_addr_t size, MemoryRegion *mr,
     int64_t file_size, file_align;
 
     /* Just support these ram flags by now. */
-    assert((ram_flags & ~(RAM_SHARED | RAM_PMEM)) == 0);
+    assert((ram_flags & ~(RAM_SHARED | RAM_PMEM | RAM_NORESERVE)) == 0);
 
     if (xen_enabled()) {
         error_setg(errp, "-mem-path not supported with Xen");
@@ -2114,6 +2121,8 @@ RAMBlock *qemu_ram_alloc_internal(ram_addr_t size, ram_addr_t max_size,
     Error *local_err = NULL;
 
     assert((ram_flags & ~(RAM_SHARED | RAM_RESIZEABLE | RAM_PREALLOC)) == 0);
+    assert((ram_flags & ~(RAM_SHARED | RAM_RESIZEABLE | RAM_PREALLOC |
+                          RAM_NORESERVE)) == 0);
     assert(!host ^ (ram_flags & RAM_PREALLOC));
 
     size = HOST_PAGE_ALIGN(size);
@@ -2147,7 +2156,7 @@ RAMBlock *qemu_ram_alloc_from_ptr(ram_addr_t size, void *host,
 RAMBlock *qemu_ram_alloc(ram_addr_t size, uint32_t ram_flags,
                          MemoryRegion *mr, Error **errp)
 {
-    assert((ram_flags & ~RAM_SHARED) == 0);
+    assert((ram_flags & ~(RAM_SHARED | RAM_NORESERVE)) == 0);
     return qemu_ram_alloc_internal(size, size, NULL, NULL, ram_flags, mr, errp);
 }
 
diff --git a/util/mmap-alloc.c b/util/mmap-alloc.c
index 1ddc0e2a1e..d0cf4aaee5 100644
--- a/util/mmap-alloc.c
+++ b/util/mmap-alloc.c
@@ -20,6 +20,7 @@
 #include "qemu/osdep.h"
 #include "qemu/mmap-alloc.h"
 #include "qemu/host-utils.h"
+#include "qemu/error-report.h"
 
 #define HUGETLBFS_MAGIC       0x958458f6
 
@@ -121,6 +122,7 @@ static void *mmap_reserve(size_t size, int fd)
 static void *mmap_activate(void *ptr, size_t size, int fd,
                            uint32_t qemu_map_flags, off_t map_offset)
 {
+    const bool noreserve = qemu_map_flags & QEMU_MAP_NORESERVE;
     const bool readonly = qemu_map_flags & QEMU_MAP_READONLY;
     const bool shared = qemu_map_flags & QEMU_MAP_SHARED;
     const bool sync = qemu_map_flags & QEMU_MAP_SYNC;
@@ -129,6 +131,11 @@ static void *mmap_activate(void *ptr, size_t size, int fd,
     int flags = MAP_FIXED;
     void *activated_ptr;
 
+    if (noreserve) {
+        error_report("Skipping reservation of swap space is not supported");
+        return MAP_FAILED;
+    }
+
     flags |= fd == -1 ? MAP_ANONYMOUS : 0;
     flags |= shared ? MAP_SHARED : MAP_PRIVATE;
     if (shared && sync) {
diff --git a/util/oslib-posix.c b/util/oslib-posix.c
index c12108c6cb..5bbdebae0e 100644
--- a/util/oslib-posix.c
+++ b/util/oslib-posix.c
@@ -227,9 +227,11 @@ void *qemu_memalign(size_t alignment, size_t size)
 }
 
 /* alloc shared memory pages */
-void *qemu_anon_ram_alloc(size_t size, uint64_t *alignment, bool shared)
+void *qemu_anon_ram_alloc(size_t size, uint64_t *alignment, bool shared,
+                          bool noreserve)
 {
-    const uint32_t qemu_map_flags = shared ? QEMU_MAP_SHARED : 0;
+    const uint32_t qemu_map_flags = (shared ? QEMU_MAP_SHARED : 0) |
+                                    (noreserve ? QEMU_MAP_NORESERVE : 0);
     size_t align = QEMU_VMALLOC_ALIGN;
     void *ptr = qemu_ram_mmap(-1, size, align, qemu_map_flags, 0);
 
diff --git a/util/oslib-win32.c b/util/oslib-win32.c
index 1fc42ec0e3..2499a031f3 100644
--- a/util/oslib-win32.c
+++ b/util/oslib-win32.c
@@ -38,6 +38,7 @@
 #include "trace.h"
 #include "qemu/sockets.h"
 #include "qemu/cutils.h"
+#include "qemu/error-report.h"
 #include <malloc.h>
 
 /* this must come after including "trace.h" */
@@ -76,10 +77,20 @@ static int get_allocation_granularity(void)
     return system_info.dwAllocationGranularity;
 }
 
-void *qemu_anon_ram_alloc(size_t size, uint64_t *align, bool shared)
+void *qemu_anon_ram_alloc(size_t size, uint64_t *align, bool shared,
+                          bool noreserve)
 {
     void *ptr;
 
+    if (noreserve) {
+        /*
+         * We need a MEM_COMMIT before accessing any memory in a MEM_RESERVE
+         * area; we cannot easily mimic POSIX MAP_NORESERVE semantics.
+         */
+        error_report("Skipping reservation of swap space is not supported.");
+        return NULL;
+    }
+
     ptr = VirtualAlloc(NULL, size, MEM_COMMIT, PAGE_READWRITE);
     trace_qemu_anon_ram_alloc(size, ptr);
 
-- 
2.30.2


