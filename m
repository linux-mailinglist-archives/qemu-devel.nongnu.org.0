Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2156936D8E8
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 15:51:32 +0200 (CEST)
Received: from localhost ([::1]:46678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbkbD-0003Oz-4b
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 09:51:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lbkS5-0002RS-Pb
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 09:42:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40046)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lbkS3-0007k9-J1
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 09:42:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619617321;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oas49Noo8YfYbcka38gJiimmf1A/ICKCKQOtj3LMRJo=;
 b=OPnt9S2FTHgCCEy8+8eq8nQ1xYjAed3Cn8Vk2IVrJZyVuLmS2kw1/o7qsPHaZ//pZb8BVB
 8YVofLO3LN4L+d/nsakBUrdsGZ/3ozln61gaB+HHP2JOeqGuPfaFDwIUblPnzOKLOXf6ZA
 hx2MDMUpF6u9h7xGDEJKtZAD38KL4Ew=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-395-7ceyRAh5PCGL81T7NfcSFg-1; Wed, 28 Apr 2021 09:41:59 -0400
X-MC-Unique: 7ceyRAh5PCGL81T7NfcSFg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9BAA48030DD;
 Wed, 28 Apr 2021 13:41:58 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-114-36.ams2.redhat.com [10.36.114.36])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 11AE160C05;
 Wed, 28 Apr 2021 13:41:37 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 07/15] util/mmap-alloc: Pass flags instead of separate
 bools to qemu_ram_mmap()
Date: Wed, 28 Apr 2021 15:37:46 +0200
Message-Id: <20210428133754.10713-8-david@redhat.com>
In-Reply-To: <20210428133754.10713-1-david@redhat.com>
References: <20210428133754.10713-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
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
Cc: Marcel Apfelbaum <mapfelba@redhat.com>,
 Murilo Opsfelder Araujo <muriloo@linux.ibm.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Greg Kurz <groug@kaod.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Nitesh Lal <nilal@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let's pass flags instead of bools to prepare for passing other flags and
update the documentation of qemu_ram_mmap(). Introduce new QEMU_MAP_
flags that abstract the mmap() PROT_ and MAP_ flag handling and simplify
it.

We expose only flags that are currently supported by qemu_ram_mmap().
Maybe, we'll see qemu_mmap() in the future as well that can implement these
flags.

Note: We don't use MAP_ flags as some flags (e.g., MAP_SYNC) are only
defined for some systems and we want to always be able to identify
these flags reliably inside qemu_ram_mmap() -- for example, to properly
warn when some future flags are not available or effective on a system.
Also, this way we can simplify PROT_ handling as well.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
Acked-by: Eduardo Habkost <ehabkost@redhat.com> for memory backend and machine core
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/qemu/mmap-alloc.h | 16 +++++++++-------
 include/qemu/osdep.h      | 18 ++++++++++++++++++
 softmmu/physmem.c         |  8 +++++---
 util/mmap-alloc.c         | 15 ++++++++-------
 util/oslib-posix.c        |  3 ++-
 5 files changed, 42 insertions(+), 18 deletions(-)

diff --git a/include/qemu/mmap-alloc.h b/include/qemu/mmap-alloc.h
index 456ff87df1..90d0eee705 100644
--- a/include/qemu/mmap-alloc.h
+++ b/include/qemu/mmap-alloc.h
@@ -7,18 +7,22 @@ size_t qemu_fd_getpagesize(int fd);
 size_t qemu_mempath_getpagesize(const char *mem_path);
 
 /**
- * qemu_ram_mmap: mmap the specified file or device.
+ * qemu_ram_mmap: mmap anonymous memory, the specified file or device.
+ *
+ * mmap() abstraction to map guest RAM, simplifying flag handling, taking
+ * care of alignment requirements and installing guard pages.
  *
  * Parameters:
  *  @fd: the file or the device to mmap
  *  @size: the number of bytes to be mmaped
  *  @align: if not zero, specify the alignment of the starting mapping address;
  *          otherwise, the alignment in use will be determined by QEMU.
- *  @readonly: true for a read-only mapping, false for read/write.
- *  @shared: map has RAM_SHARED flag.
- *  @is_pmem: map has RAM_PMEM flag.
+ *  @qemu_map_flags: QEMU_MAP_* flags
  *  @map_offset: map starts at offset of map_offset from the start of fd
  *
+ * Internally, MAP_PRIVATE, MAP_ANONYMOUS and MAP_SHARED_VALIDATE are set
+ * implicitly based on other parameters.
+ *
  * Return:
  *  On success, return a pointer to the mapped area.
  *  On failure, return MAP_FAILED.
@@ -26,9 +30,7 @@ size_t qemu_mempath_getpagesize(const char *mem_path);
 void *qemu_ram_mmap(int fd,
                     size_t size,
                     size_t align,
-                    bool readonly,
-                    bool shared,
-                    bool is_pmem,
+                    uint32_t qemu_map_flags,
                     off_t map_offset);
 
 void qemu_ram_munmap(int fd, void *ptr, size_t size);
diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index cb2a07e472..a96d6cb7ac 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -366,6 +366,24 @@ void *qemu_anon_ram_alloc(size_t size, uint64_t *align, bool shared);
 void qemu_vfree(void *ptr);
 void qemu_anon_ram_free(void *ptr, size_t size);
 
+/*
+ * Abstraction of PROT_ and MAP_ flags as passed to mmap(), for example,
+ * consumed by qemu_ram_mmap().
+ */
+
+/* Map PROT_READ instead of PROT_READ | PROT_WRITE. */
+#define QEMU_MAP_READONLY   (1 << 0)
+
+/* Use MAP_SHARED instead of MAP_PRIVATE. */
+#define QEMU_MAP_SHARED     (1 << 1)
+
+/*
+ * Use MAP_SYNC | MAP_SHARED_VALIDATE if supported. Ignored without
+ * QEMU_MAP_SHARED. If mapping fails, warn and fallback to !QEMU_MAP_SYNC.
+ */
+#define QEMU_MAP_SYNC       (1 << 2)
+
+
 #define QEMU_MADV_INVALID -1
 
 #if defined(CONFIG_MADVISE)
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 11b45be271..2e8d1f47f0 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -1533,6 +1533,7 @@ static void *file_ram_alloc(RAMBlock *block,
                             off_t offset,
                             Error **errp)
 {
+    uint32_t qemu_map_flags;
     void *area;
 
     block->page_size = qemu_fd_getpagesize(fd);
@@ -1580,9 +1581,10 @@ static void *file_ram_alloc(RAMBlock *block,
         perror("ftruncate");
     }
 
-    area = qemu_ram_mmap(fd, memory, block->mr->align, readonly,
-                         block->flags & RAM_SHARED, block->flags & RAM_PMEM,
-                         offset);
+    qemu_map_flags = readonly ? QEMU_MAP_READONLY : 0;
+    qemu_map_flags |= (block->flags & RAM_SHARED) ? QEMU_MAP_SHARED : 0;
+    qemu_map_flags |= (block->flags & RAM_PMEM) ? QEMU_MAP_SYNC : 0;
+    area = qemu_ram_mmap(fd, memory, block->mr->align, qemu_map_flags, offset);
     if (area == MAP_FAILED) {
         error_setg_errno(errp, errno,
                          "unable to map backing store for guest RAM");
diff --git a/util/mmap-alloc.c b/util/mmap-alloc.c
index 0e2bd7bc0e..1ddc0e2a1e 100644
--- a/util/mmap-alloc.c
+++ b/util/mmap-alloc.c
@@ -118,9 +118,12 @@ static void *mmap_reserve(size_t size, int fd)
  * Activate memory in a reserved region from the given fd (if any), to make
  * it accessible.
  */
-static void *mmap_activate(void *ptr, size_t size, int fd, bool readonly,
-                           bool shared, bool is_pmem, off_t map_offset)
+static void *mmap_activate(void *ptr, size_t size, int fd,
+                           uint32_t qemu_map_flags, off_t map_offset)
 {
+    const bool readonly = qemu_map_flags & QEMU_MAP_READONLY;
+    const bool shared = qemu_map_flags & QEMU_MAP_SHARED;
+    const bool sync = qemu_map_flags & QEMU_MAP_SYNC;
     const int prot = PROT_READ | (readonly ? 0 : PROT_WRITE);
     int map_sync_flags = 0;
     int flags = MAP_FIXED;
@@ -128,7 +131,7 @@ static void *mmap_activate(void *ptr, size_t size, int fd, bool readonly,
 
     flags |= fd == -1 ? MAP_ANONYMOUS : 0;
     flags |= shared ? MAP_SHARED : MAP_PRIVATE;
-    if (shared && is_pmem) {
+    if (shared && sync) {
         map_sync_flags = MAP_SYNC | MAP_SHARED_VALIDATE;
     }
 
@@ -173,9 +176,7 @@ static inline size_t mmap_guard_pagesize(int fd)
 void *qemu_ram_mmap(int fd,
                     size_t size,
                     size_t align,
-                    bool readonly,
-                    bool shared,
-                    bool is_pmem,
+                    uint32_t qemu_map_flags,
                     off_t map_offset)
 {
     const size_t guard_pagesize = mmap_guard_pagesize(fd);
@@ -199,7 +200,7 @@ void *qemu_ram_mmap(int fd,
 
     offset = QEMU_ALIGN_UP((uintptr_t)guardptr, align) - (uintptr_t)guardptr;
 
-    ptr = mmap_activate(guardptr + offset, size, fd, readonly, shared, is_pmem,
+    ptr = mmap_activate(guardptr + offset, size, fd, qemu_map_flags,
                         map_offset);
     if (ptr == MAP_FAILED) {
         munmap(guardptr, total);
diff --git a/util/oslib-posix.c b/util/oslib-posix.c
index 36820fec16..c12108c6cb 100644
--- a/util/oslib-posix.c
+++ b/util/oslib-posix.c
@@ -229,8 +229,9 @@ void *qemu_memalign(size_t alignment, size_t size)
 /* alloc shared memory pages */
 void *qemu_anon_ram_alloc(size_t size, uint64_t *alignment, bool shared)
 {
+    const uint32_t qemu_map_flags = shared ? QEMU_MAP_SHARED : 0;
     size_t align = QEMU_VMALLOC_ALIGN;
-    void *ptr = qemu_ram_mmap(-1, size, align, false, shared, false, 0);
+    void *ptr = qemu_ram_mmap(-1, size, align, qemu_map_flags, 0);
 
     if (ptr == MAP_FAILED) {
         return NULL;
-- 
2.30.2


