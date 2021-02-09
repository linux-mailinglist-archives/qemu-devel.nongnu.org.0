Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 453F6315128
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 15:03:17 +0100 (CET)
Received: from localhost ([::1]:46670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Tbo-000324-97
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 09:03:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1l9TQJ-0002ze-Jq
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 08:51:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27092)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1l9TQD-0005a6-H2
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 08:51:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612878676;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DSC+DaYYuNXaSIgv/N4tLqFp76dpt9unEBb9rwztZq8=;
 b=VWdd2HgbxN7Zliu8l/w1tpns+amStjBh8qNJVtzSZSxBlfieuRv74JZa1XsfsOalw3mR6t
 gImNgZxPT9lDKe09rHQjUl2rlf6BeymWcBZbYENXU8E+UnTAHpjoubSTN/F9UW7a9ASx7T
 FT9nPb3iOcjA3Ey2+9aGt+myKQCFe+Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-551-GUswmeVLPOSPxi-k34Qmpw-1; Tue, 09 Feb 2021 08:51:12 -0500
X-MC-Unique: GUswmeVLPOSPxi-k34Qmpw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8C281195D571;
 Tue,  9 Feb 2021 13:51:10 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-113-141.ams2.redhat.com [10.36.113.141])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D31696FEED;
 Tue,  9 Feb 2021 13:50:56 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 7/9] memory: introduce RAM_NORESERVE and wire it up in
 qemu_ram_mmap()
Date: Tue,  9 Feb 2021 14:49:37 +0100
Message-Id: <20210209134939.13083-8-david@redhat.com>
In-Reply-To: <20210209134939.13083-1-david@redhat.com>
References: <20210209134939.13083-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Igor Kotrasinski <i.kotrasinsk@partner.samsung.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Peter Xu <peterx@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Juan Quintela <quintela@redhat.com>,
 David Hildenbrand <david@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Murilo Opsfelder Araujo <muriloo@linux.ibm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Greg Kurz <groug@kaod.org>,
 qemu-s390x@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Cornelia Huck <cohuck@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let's introduce RAM_NORESERVE, allowing mmap'ing with MAP_NORESERVE. The
new flag has the following semantics:

  RAM is mmap-ed with MAP_NORESERVE. When set, reserving swap space (or
  huge pages on Linux) is skipped: will bail out if not supported. When not
  set, the OS might reserve swap space (or huge pages on Linux), depending
  on OS support.

Allow passing it into:
- memory_region_init_ram_nomigrate()
- memory_region_init_resizeable_ram()
- memory_region_init_ram_from_file()

... and teach qemu_ram_mmap() and qemu_anon_ram_alloc() about the flag.
Bail out if the flag is not supported, which is the case right now for
both, POSIX and win32. We will add the POSIX mmap implementation next and
allow specifying RAM_NORESERVE via memory backends.

The target use case is virtio-mem, which dynamically exposes memory
inside a large, sparse memory area to the VM.

Cc: Juan Quintela <quintela@redhat.com>
Cc: Halil Pasic <pasic@linux.ibm.com>
Cc: Cornelia Huck <cohuck@redhat.com>
Cc: Christian Borntraeger <borntraeger@de.ibm.com>
Cc: Thomas Huth <thuth@redhat.com>
Cc: Stefan Weil <sw@weilnetz.de>
Cc: kvm@vger.kernel.org
Cc: qemu-s390x@nongnu.org
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/exec/cpu-common.h |  1 +
 include/exec/memory.h     | 16 +++++++++++++---
 include/exec/ram_addr.h   |  3 ++-
 include/qemu/mmap-alloc.h |  4 +++-
 include/qemu/osdep.h      |  3 ++-
 include/sysemu/kvm.h      |  3 ++-
 migration/ram.c           |  3 +--
 softmmu/physmem.c         | 23 ++++++++++++++++-------
 target/s390x/kvm.c        |  6 +++++-
 util/mmap-alloc.c         |  9 ++++++++-
 util/oslib-posix.c        |  5 +++--
 util/oslib-win32.c        | 13 ++++++++++++-
 12 files changed, 68 insertions(+), 21 deletions(-)

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
index 7d2db168c7..587d14257c 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -157,6 +157,14 @@ typedef struct IOMMUTLBEvent {
  */
 #define RAM_UF_WRITEPROTECT (1 << 6)
 
+/*
+ * RAM is mmap-ed with MAP_NORESERVE. When set, reserving swap space (or huge
+ * pages Linux) is skipped: will bail out if not supported. When not set, the
+ * OS might reserve swap space (or huge pages on Linux), depending on OS
+ * support.
+ */
+#define RAM_NORESERVE (1 << 7)
+
 static inline void iommu_notifier_init(IOMMUNotifier *n, IOMMUNotify fn,
                                        IOMMUNotifierFlag flags,
                                        hwaddr start, hwaddr end,
@@ -915,7 +923,7 @@ void memory_region_init_ram_nomigrate(MemoryRegion *mr,
  * @name: Region name, becomes part of RAMBlock name used in migration stream
  *        must be unique within any device
  * @size: size of the region.
- * @ram_flags: RamBlock flags. Supported flags: RAM_SHARED.
+ * @ram_flags: RamBlock flags. Supported flags: RAM_SHARED, RAM_NORESERVE.
  * @errp: pointer to Error*, to store an error if it happens.
  *
  * Note that this function does not do anything to cause the data in the
@@ -969,7 +977,8 @@ void memory_region_init_resizeable_ram(MemoryRegion *mr,
  * @size: size of the region.
  * @align: alignment of the region base address; if 0, the default alignment
  *         (getpagesize()) will be used.
- * @ram_flags: RamBlock flags. Supported flags: RAM_SHARED, RAM_PMEM.
+ * @ram_flags: RamBlock flags. Supported flags: RAM_SHARED, RAM_PMEM,
+ *             RAM_NORESERVE,
  * @path: the path in which to allocate the RAM.
  * @readonly: true to open @path for reading, false for read/write.
  * @errp: pointer to Error*, to store an error if it happens.
@@ -995,7 +1004,8 @@ void memory_region_init_ram_from_file(MemoryRegion *mr,
  * @owner: the object that tracks the region's reference count
  * @name: the name of the region.
  * @size: size of the region.
- * @ram_flags: RamBlock flags. Supported flags: RAM_SHARED, RAM_PMEM.
+ * @ram_flags: RamBlock flags. Supported flags: RAM_SHARED, RAM_PMEM,
+ *             RAM_NORESERVE.
  * @fd: the fd to mmap.
  * @errp: pointer to Error*, to store an error if it happens.
  *
diff --git a/include/exec/ram_addr.h b/include/exec/ram_addr.h
index ce9e140c54..1325c7760e 100644
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
diff --git a/include/qemu/mmap-alloc.h b/include/qemu/mmap-alloc.h
index 8b7a5c70f3..a996d9b15a 100644
--- a/include/qemu/mmap-alloc.h
+++ b/include/qemu/mmap-alloc.h
@@ -17,6 +17,7 @@ size_t qemu_mempath_getpagesize(const char *mem_path);
  *  @readonly: true for a read-only mapping, false for read/write.
  *  @shared: map has RAM_SHARED flag.
  *  @is_pmem: map has RAM_PMEM flag.
+ *  @noreserve: map has RAM_NORESERVE flag.
  *
  * Return:
  *  On success, return a pointer to the mapped area.
@@ -27,7 +28,8 @@ void *qemu_ram_mmap(int fd,
                     size_t align,
                     bool readonly,
                     bool shared,
-                    bool is_pmem);
+                    bool is_pmem,
+                    bool noreserve);
 
 void qemu_ram_munmap(int fd, void *ptr, size_t size);
 
diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index ba15be9c56..d6d8ef0999 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -343,7 +343,8 @@ extern int daemon(int, int);
 int qemu_daemon(int nochdir, int noclose);
 void *qemu_try_memalign(size_t alignment, size_t size);
 void *qemu_memalign(size_t alignment, size_t size);
-void *qemu_anon_ram_alloc(size_t size, uint64_t *align, bool shared);
+void *qemu_anon_ram_alloc(size_t size, uint64_t *align, bool shared,
+                          bool noreserve);
 void qemu_vfree(void *ptr);
 void qemu_anon_ram_free(void *ptr, size_t size);
 
diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
index c5546bdecc..4a0a7a4e89 100644
--- a/include/sysemu/kvm.h
+++ b/include/sysemu/kvm.h
@@ -251,7 +251,8 @@ int kvm_on_sigbus(int code, void *addr);
 
 /* interface with exec.c */
 
-void phys_mem_set_alloc(void *(*alloc)(size_t, uint64_t *align, bool shared));
+void phys_mem_set_alloc(void *(*alloc)(size_t, uint64_t *align, bool shared,
+                                       bool noreserve));
 
 /* internal API */
 
diff --git a/migration/ram.c b/migration/ram.c
index 72143da0ac..dd8daad386 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -3322,8 +3322,7 @@ int colo_init_ram_cache(void)
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
index 2243e2a87a..9820d845c0 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -1144,7 +1144,8 @@ static int subpage_register(subpage_t *mmio, uint32_t start, uint32_t end,
                             uint16_t section);
 static subpage_t *subpage_init(FlatView *fv, hwaddr base);
 
-static void *(*phys_mem_alloc)(size_t size, uint64_t *align, bool shared) =
+static void *(*phys_mem_alloc)(size_t size, uint64_t *align, bool shared,
+                               bool noreserve) =
                                qemu_anon_ram_alloc;
 
 /*
@@ -1152,7 +1153,8 @@ static void *(*phys_mem_alloc)(size_t size, uint64_t *align, bool shared) =
  * Accelerators with unusual needs may need this.  Hopefully, we can
  * get rid of it eventually.
  */
-void phys_mem_set_alloc(void *(*alloc)(size_t, uint64_t *align, bool shared))
+void phys_mem_set_alloc(void *(*alloc)(size_t, uint64_t *align,
+                        bool shared, bool noreserve))
 {
     phys_mem_alloc = alloc;
 }
@@ -1593,7 +1595,8 @@ static void *file_ram_alloc(RAMBlock *block,
     }
 
     area = qemu_ram_mmap(fd, memory, block->mr->align, readonly,
-                         block->flags & RAM_SHARED, block->flags & RAM_PMEM);
+                         block->flags & RAM_SHARED, block->flags & RAM_PMEM,
+                         block->flags & RAM_NORESERVE);
     if (area == MAP_FAILED) {
         error_setg_errno(errp, errno,
                          "unable to map backing store for guest RAM");
@@ -1713,6 +1716,11 @@ bool qemu_ram_is_shared(RAMBlock *rb)
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
@@ -1962,7 +1970,8 @@ static void ram_block_add(RAMBlock *new_block, Error **errp)
         } else {
             new_block->host = phys_mem_alloc(new_block->max_length,
                                              &new_block->mr->align,
-                                             qemu_ram_is_shared(new_block));
+                                             qemu_ram_is_shared(new_block),
+                                             qemu_ram_is_noreserve(new_block));
             if (!new_block->host) {
                 error_setg_errno(errp, errno,
                                  "cannot set up guest memory '%s'",
@@ -2033,7 +2042,7 @@ RAMBlock *qemu_ram_alloc_from_fd(ram_addr_t size, MemoryRegion *mr,
     int64_t file_size, file_align;
 
     /* Just support these ram flags by now. */
-    assert((ram_flags & ~(RAM_SHARED | RAM_PMEM)) == 0);
+    assert((ram_flags & ~(RAM_SHARED | RAM_PMEM | RAM_NORESERVE)) == 0);
 
     if (xen_enabled()) {
         error_setg(errp, "-mem-path not supported with Xen");
@@ -2135,7 +2144,7 @@ RAMBlock *qemu_ram_alloc_internal(ram_addr_t size, ram_addr_t max_size,
     RAMBlock *new_block;
     Error *local_err = NULL;
 
-    assert((ram_flags & ~(RAM_SHARED | RAM_RESIZEABLE)) == 0);
+    assert((ram_flags & ~(RAM_SHARED | RAM_RESIZEABLE | RAM_NORESERVE)) == 0);
 
     size = HOST_PAGE_ALIGN(size);
     max_size = HOST_PAGE_ALIGN(max_size);
@@ -2170,7 +2179,7 @@ RAMBlock *qemu_ram_alloc_from_ptr(ram_addr_t size, void *host,
 RAMBlock *qemu_ram_alloc(ram_addr_t size, uint32_t ram_flags,
                          MemoryRegion *mr, Error **errp)
 {
-    assert((ram_flags & ~RAM_SHARED) == 0);
+    assert((ram_flags & ~(RAM_SHARED | RAM_NORESERVE)) == 0);
     return qemu_ram_alloc_internal(size, size, NULL, NULL, ram_flags, mr, errp);
 }
 
diff --git a/target/s390x/kvm.c b/target/s390x/kvm.c
index dc27fa36c9..bd5178bf81 100644
--- a/target/s390x/kvm.c
+++ b/target/s390x/kvm.c
@@ -899,13 +899,17 @@ int kvm_s390_mem_op_pv(S390CPU *cpu, uint64_t offset, void *hostbuf,
  * to grow. We also have to use MAP parameters that avoid
  * read-only mapping of guest pages.
  */
-static void *legacy_s390_alloc(size_t size, uint64_t *align, bool shared)
+static void *legacy_s390_alloc(size_t size, uint64_t *align, bool shared,
+                               bool noreserve)
 {
     static void *mem;
 
     if (mem) {
         /* we only support one allocation, which is enough for initial ram */
         return NULL;
+    } else if (noreserve) {
+        error_report("Skipping reservation of swap space is not supported.");
+        return NULL
     }
 
     mem = mmap((void *) 0x800000000ULL, size,
diff --git a/util/mmap-alloc.c b/util/mmap-alloc.c
index b50dc86a3c..bb99843106 100644
--- a/util/mmap-alloc.c
+++ b/util/mmap-alloc.c
@@ -20,6 +20,7 @@
 #include "qemu/osdep.h"
 #include "qemu/mmap-alloc.h"
 #include "qemu/host-utils.h"
+#include "qemu/error-report.h"
 
 #define HUGETLBFS_MAGIC       0x958458f6
 
@@ -174,12 +175,18 @@ void *qemu_ram_mmap(int fd,
                     size_t align,
                     bool readonly,
                     bool shared,
-                    bool is_pmem)
+                    bool is_pmem,
+                    bool noreserve)
 {
     const size_t guard_pagesize = mmap_guard_pagesize(fd);
     size_t offset, total;
     void *ptr, *guardptr;
 
+    if (noreserve) {
+        error_report("Skipping reservation of swap space is not supported");
+        return MAP_FAILED;
+    }
+
     /*
      * Note: this always allocates at least one extra page of virtual address
      * space, even if size is already aligned.
diff --git a/util/oslib-posix.c b/util/oslib-posix.c
index bf57d3b030..7c9d870723 100644
--- a/util/oslib-posix.c
+++ b/util/oslib-posix.c
@@ -227,10 +227,11 @@ void *qemu_memalign(size_t alignment, size_t size)
 }
 
 /* alloc shared memory pages */
-void *qemu_anon_ram_alloc(size_t size, uint64_t *alignment, bool shared)
+void *qemu_anon_ram_alloc(size_t size, uint64_t *alignment, bool shared,
+                          bool noreserve)
 {
     size_t align = QEMU_VMALLOC_ALIGN;
-    void *ptr = qemu_ram_mmap(-1, size, align, false, shared, false);
+    void *ptr = qemu_ram_mmap(-1, size, align, false, shared, false, noreserve);
 
     if (ptr == MAP_FAILED) {
         return NULL;
diff --git a/util/oslib-win32.c b/util/oslib-win32.c
index f68b8012bb..8cafe44179 100644
--- a/util/oslib-win32.c
+++ b/util/oslib-win32.c
@@ -39,6 +39,7 @@
 #include "trace.h"
 #include "qemu/sockets.h"
 #include "qemu/cutils.h"
+#include "qemu/error-report.h"
 #include <malloc.h>
 
 /* this must come after including "trace.h" */
@@ -77,10 +78,20 @@ static int get_allocation_granularity(void)
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
2.29.2


