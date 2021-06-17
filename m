Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB6F3AB0D5
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 12:02:42 +0200 (CEST)
Received: from localhost ([::1]:46056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltorB-0000Yv-6e
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 06:02:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ltoNT-0002tH-5u
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 05:31:59 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:35400)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ltoNP-0006Ez-TH
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 05:31:58 -0400
Received: by mail-ed1-x52c.google.com with SMTP id df12so568094edb.2
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 02:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HN1jSml8xGVKMU1qgeTlmdidtub7pA6wErpj5PAwFrg=;
 b=lscF1YrDLgTMq3vchBgYRukwJnaobz/s255t3OutpJB54pIyB04DayVOG3dSiLNvsA
 mdH/JylVXd4wOd6dDWh2kd+dI4x9CPPJdeK/I9iTl8tA+Bllf/pAi+CYR42Z3fAlbmqA
 CCnNgyTdajiqGx0dfvkeS5YdKF5xcjy4BNd2CoNlp9JRhrZZfKUvzSAm4RRqo/i8pkE4
 RcF2Z0BO/yedV0taIpUBzu8d7MTHJRH72/bAMeQSNpYBXLD3mrpOW4C1IZZia8D3TD7p
 UWuDcBy+TWe+sQ7QArrXLX12I5Pyyu0VwFdhLfDxUUqrBgQqLbklWInkPXwQ4T4vo3O2
 OQqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=HN1jSml8xGVKMU1qgeTlmdidtub7pA6wErpj5PAwFrg=;
 b=dOnRZ0gmAsRMDAGJPNUsTgyc+FKbW6t70XsShasj/hC2/dsd5aMnIejKuEjmWnV2Cv
 sHJV8XSPYMV8pjTm8Uc3wL8qJ79VT4nCVYhKHy+hyWbr2SgAVHiZ93mz4Ou4yN7wVX0p
 pLgNwH2t36aubZaayc1XfC7JbglQa9OSPdNzQyoCQwJfIqqIX9zBrVh7jzjcJpHcP9CF
 uVTGQ2IlMI71JVXipzB+1PjXb1uDMX7qa8SgoqPOBaO7V+d7zsu48Dte7vlq4Pz5hpYV
 5rDdpDLYZor8T1zeLq/V3LB3FCAoWMmccnhuKKswam4iCPQ+SL+m/IqJIFkHMnNwHeNT
 CXAw==
X-Gm-Message-State: AOAM533Vk1M4wmuZN82Nz77jnh0gGnuVrOdQuNd3OQAQlPweWiUx8mvH
 B/4UY7XWG/EY/IG7ds02+jB63VLjCwY=
X-Google-Smtp-Source: ABdhPJy29aTen37dr5PjDU+WOD6BndHpJtkDJNQXj7/JVromZ5ZXqya4y31SUl+lhS+IFU1t0wMrBg==
X-Received: by 2002:a05:6402:31ba:: with SMTP id
 dj26mr5177991edb.71.1623922314635; 
 Thu, 17 Jun 2021 02:31:54 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m18sm3328140ejx.56.2021.06.17.02.31.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 02:31:54 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 26/45] util/mmap-alloc: Support RAM_NORESERVE via MAP_NORESERVE
 under Linux
Date: Thu, 17 Jun 2021 11:31:15 +0200
Message-Id: <20210617093134.900014-27-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210617093134.900014-1-pbonzini@redhat.com>
References: <20210617093134.900014-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Hildenbrand <david@redhat.com>

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
Message-Id: <20210510114328.21835-10-david@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/qemu/osdep.h |  3 ++
 softmmu/physmem.c    |  1 +
 util/mmap-alloc.c    | 69 ++++++++++++++++++++++++++++++++++++++++++--
 3 files changed, 71 insertions(+), 2 deletions(-)

diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index c2c7fe5c47..0a54bf7be8 100644
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
index 11ea8e19a6..9b171c9dbe 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -2251,6 +2251,7 @@ void qemu_ram_remap(ram_addr_t addr, ram_addr_t length)
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
2.31.1



