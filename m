Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33DDB36D8F6
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 15:57:06 +0200 (CEST)
Received: from localhost ([::1]:33684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbkgb-0001PH-9M
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 09:57:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lbkSR-0002tE-72
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 09:42:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lbkSN-0007wY-TN
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 09:42:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619617343;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mtqUFDQypjHdqWl50qXJBCDTg9KKK0w5dUrLEYVd6lA=;
 b=WYa6PP7uiqgyk/dZaZCVPTcm42scCxlYiyzSEMw8XABYYTnr8CjBtYlAzSY8bQPU2uyvB+
 28OS4H19yC8KBPwIwkqSrSncLZthaVku1qTyLrbLB3u1Xsv3S8BGg41pPLPcGTeJP2jedb
 T+EAKvHzl4Iy1Xc9AZiS8JPUqLN0YPc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-102-abpZHOEOOQ-sSds0wr3eag-1; Wed, 28 Apr 2021 09:42:21 -0400
X-MC-Unique: abpZHOEOOQ-sSds0wr3eag-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 45E901008062;
 Wed, 28 Apr 2021 13:42:20 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-114-36.ams2.redhat.com [10.36.114.36])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 58F3660CC9;
 Wed, 28 Apr 2021 13:42:13 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 09/15] util/mmap-alloc: Support RAM_NORESERVE via
 MAP_NORESERVE under Linux
Date: Wed, 28 Apr 2021 15:37:48 +0200
Message-Id: <20210428133754.10713-10-david@redhat.com>
In-Reply-To: <20210428133754.10713-1-david@redhat.com>
References: <20210428133754.10713-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
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

Let's support RAM_NORESERVE via MAP_NORESERVE on Linux. The flag has no
effect on most shared mappings - except for hugetlbfs and anonymous memory.

Linux man page:
  "MAP_NORESERVE: Do not reserve swap space for this mapping. When swap
  space is reserved, one has the guarantee that it is possible to modify
  the mapping. When swap space is not reserved one might get SIGSEGV
  upon a write if no physical memory is available. See also the discussion
  of the file /proc/sys/vm/overcommit_memory in proc(5). In kernels before
  2.6, this flag had effect only for private writable mappings."

Note that the "guarantee" part is wrong with memory overcommit in Linux.

Also, in Linux hugetlbfs is treated differently - we configure reservation
of huge pages from the pool, not reservation of swap space (huge pages
cannot be swapped).

The rough behavior is [1]:
a) !Hugetlbfs:

  1) Without MAP_NORESERVE *or* with memory overcommit under Linux
     disabled ("/proc/sys/vm/overcommit_memory == 2"), the following
     accounting/reservation happens:
      For a file backed map
       SHARED or READ-only - 0 cost (the file is the map not swap)
       PRIVATE WRITABLE - size of mapping per instance

      For an anonymous or /dev/zero map
       SHARED   - size of mapping
       PRIVATE READ-only - 0 cost (but of little use)
       PRIVATE WRITABLE - size of mapping per instance

  2) With MAP_NORESERVE, no accounting/reservation happens.

b) Hugetlbfs:

  1) Without MAP_NORESERVE, huge pages are reserved.

  2) With MAP_NORESERVE, no huge pages are reserved.

Note: With "/proc/sys/vm/overcommit_memory == 0", we were already able
to configure it for !hugetlbfs globally; this toggle now allows
configuring it more fine-grained, not for the whole system.

The target use case is virtio-mem, which dynamically exposes memory
inside a large, sparse memory area to the VM.

[1] https://www.kernel.org/doc/Documentation/vm/overcommit-accounting

Reviewed-by: Peter Xu <peterx@redhat.com>
Acked-by: Eduardo Habkost <ehabkost@redhat.com> for memory backend and machine core
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/qemu/osdep.h |  3 ++
 softmmu/physmem.c    |  1 +
 util/mmap-alloc.c    | 69 ++++++++++++++++++++++++++++++++++++++++++--
 3 files changed, 71 insertions(+), 2 deletions(-)

diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index af65b36698..0a7384d15c 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -195,6 +195,9 @@ extern "C" {
 #ifndef MAP_FIXED_NOREPLACE
 #define MAP_FIXED_NOREPLACE 0
 #endif
+#ifndef MAP_NORESERVE
+#define MAP_NORESERVE 0
+#endif
 #ifndef ENOMEDIUM
 #define ENOMEDIUM ENODEV
 #endif
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 1efb1d5193..ccc5985324 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -2230,6 +2230,7 @@ void qemu_ram_remap(ram_addr_t addr, ram_addr_t length)
                 flags = MAP_FIXED;
                 flags |= block->flags & RAM_SHARED ?
                          MAP_SHARED : MAP_PRIVATE;
+                flags |= block->flags & RAM_NORESERVE ? MAP_NORESERVE : 0;
                 if (block->fd >= 0) {
                     area = mmap(vaddr, length, PROT_READ | PROT_WRITE,
                                 flags, block->fd, offset);
diff --git a/util/mmap-alloc.c b/util/mmap-alloc.c
index d0cf4aaee5..838e286ce5 100644
--- a/util/mmap-alloc.c
+++ b/util/mmap-alloc.c
@@ -20,6 +20,7 @@
 #include "qemu/osdep.h"
 #include "qemu/mmap-alloc.h"
 #include "qemu/host-utils.h"
+#include "qemu/cutils.h"
 #include "qemu/error-report.h"
 
 #define HUGETLBFS_MAGIC       0x958458f6
@@ -83,6 +84,70 @@ size_t qemu_mempath_getpagesize(const char *mem_path)
     return qemu_real_host_page_size;
 }
 
+#define OVERCOMMIT_MEMORY_PATH "/proc/sys/vm/overcommit_memory"
+static bool map_noreserve_effective(int fd, uint32_t qemu_map_flags)
+{
+#if defined(__linux__)
+    const bool readonly = qemu_map_flags & QEMU_MAP_READONLY;
+    const bool shared = qemu_map_flags & QEMU_MAP_SHARED;
+    gchar *content = NULL;
+    const char *endptr;
+    unsigned int tmp;
+
+    /*
+     * hugeltb accounting is different than ordinary swap reservation:
+     * a) Hugetlb pages from the pool are reserved for both private and
+     *    shared mappings. For shared mappings, all mappers have to specify
+     *    MAP_NORESERVE.
+     * b) MAP_NORESERVE is not affected by /proc/sys/vm/overcommit_memory.
+     */
+    if (qemu_fd_getpagesize(fd) != qemu_real_host_page_size) {
+        return true;
+    }
+
+    /*
+     * Accountable mappings in the kernel that can be affected by MAP_NORESEVE
+     * are private writable mappings (see mm/mmap.c:accountable_mapping() in
+     * Linux). For all shared or readonly mappings, MAP_NORESERVE is always
+     * implicitly active -- no reservation; this includes shmem. The only
+     * exception is shared anonymous memory, it is accounted like private
+     * anonymous memory.
+     */
+    if (readonly || (shared && fd >= 0)) {
+        return true;
+    }
+
+    /*
+     * MAP_NORESERVE is globally ignored for applicable !hugetlb mappings when
+     * memory overcommit is set to "never". Sparse memory regions aren't really
+     * possible in this system configuration.
+     *
+     * Bail out now instead of silently committing way more memory than
+     * currently desired by the user.
+     */
+    if (g_file_get_contents(OVERCOMMIT_MEMORY_PATH, &content, NULL, NULL) &&
+        !qemu_strtoui(content, &endptr, 0, &tmp) &&
+        (!endptr || *endptr == '\n')) {
+        if (tmp == 2) {
+            error_report("Skipping reservation of swap space is not supported:"
+                         " \"" OVERCOMMIT_MEMORY_PATH "\" is \"2\"");
+            return false;
+        }
+        return true;
+    }
+    /* this interface has been around since Linux 2.6 */
+    error_report("Skipping reservation of swap space is not supported:"
+                 " Could not read: \"" OVERCOMMIT_MEMORY_PATH "\"");
+    return false;
+#endif
+    /*
+     * E.g., FreeBSD used to define MAP_NORESERVE, never implemented it,
+     * and removed it a while ago.
+     */
+    error_report("Skipping reservation of swap space is not supported");
+    return false;
+}
+
 /*
  * Reserve a new memory region of the requested size to be used for mapping
  * from the given fd (if any).
@@ -131,13 +196,13 @@ static void *mmap_activate(void *ptr, size_t size, int fd,
     int flags = MAP_FIXED;
     void *activated_ptr;
 
-    if (noreserve) {
-        error_report("Skipping reservation of swap space is not supported");
+    if (noreserve && !map_noreserve_effective(fd, qemu_map_flags)) {
         return MAP_FAILED;
     }
 
     flags |= fd == -1 ? MAP_ANONYMOUS : 0;
     flags |= shared ? MAP_SHARED : MAP_PRIVATE;
+    flags |= noreserve ? MAP_NORESERVE : 0;
     if (shared && sync) {
         map_sync_flags = MAP_SYNC | MAP_SHARED_VALIDATE;
     }
-- 
2.30.2


