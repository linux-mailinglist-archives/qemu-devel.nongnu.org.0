Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F14F03AB009
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 11:44:54 +0200 (CEST)
Received: from localhost ([::1]:49324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltoZx-0006Xq-Us
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 05:44:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ltoNT-0002tO-7a
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 05:31:59 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:43613)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ltoNO-0006D8-OC
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 05:31:58 -0400
Received: by mail-ed1-x534.google.com with SMTP id s6so3021678edu.10
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 02:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PxIimyH05wD1zkB/Bar1jOIFqkMaKCn4QuyiOagAX+Q=;
 b=DIqrH/nTvIaI5Twx9PKmofjrN7nRSlVfbIvNKa2UcWNB1cmPiHhA3w2azqpuKwQvGG
 lX0f5TSTOJg4FuOiG2EpGsqY0HhbYIhp4h4J2daK7hr2A+WR58hg5IWJ2CJtCAe4HDx3
 TVFgeAGiu4CnobUMDYkfZHnyHcwmEzdTOJaJ/NRhlVw3yxoxJ6Rh0/jTMl2xon/zQ7E8
 4QcGoF71gc0lAQ3JpEOb7jOZLQjwRn6Xeuj4FNUyvB4zLNizVkEX62c9O+3EI9qnVSkO
 GifkKzwR5rljNCIyn8u7qjVN6RZKDzDM3Nxdnb9D52TEnz265c7ySvzofcConJg5aEth
 DFwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=PxIimyH05wD1zkB/Bar1jOIFqkMaKCn4QuyiOagAX+Q=;
 b=Senougb2xhkWaB5MO1koIH66HU3LhWr4Tlj9V19vS2St/iEkXUOO+YFgjNwuv2wMZU
 aIoVkX+4XhNhev+JrIed56ERlnkSgtuPwewr1H2roYs+FCitClnKo9m8kMkldEOFjrX4
 txSxl1+TjZgEnyiTvxWdhCSLQLMDpDHzxl5uUiHiM14Ydl9f9NU0Dw4bnUT2carNKyJv
 WE3uUbYrAzCPnT371o4UIdSFrbN45aolCjh80a12mEzl2hCbWMBUMtx575rKapgELf+M
 OctxcnxxyIvBi/ye/EnNsOJNMGWkSXEwzZ55ZipfUI0Csg0lRnHSmo0jvo9lxwvoWf/n
 MZOw==
X-Gm-Message-State: AOAM532kPO2iT4jTfwTjOrsH/EImcOStkoygAls+laH4diC0AQPKPqpr
 kbx88UkIBeDoHuM6G86kl5aHW3Lhkg0=
X-Google-Smtp-Source: ABdhPJzAxtMA8GQIgbr98YzyLynZhJjLHz0P05DAgReQTAgHB7mc5ABvFxVQbnRfkXDFZzg98ETeBw==
X-Received: by 2002:a05:6402:6c8:: with SMTP id
 n8mr5200449edy.180.1623922313112; 
 Thu, 17 Jun 2021 02:31:53 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m18sm3328140ejx.56.2021.06.17.02.31.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 02:31:52 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 24/45] util/mmap-alloc: Pass flags instead of separate bools to
 qemu_ram_mmap()
Date: Thu, 17 Jun 2021 11:31:13 +0200
Message-Id: <20210617093134.900014-25-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210617093134.900014-1-pbonzini@redhat.com>
References: <20210617093134.900014-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x534.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Hildenbrand <david@redhat.com>

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
Message-Id: <20210510114328.21835-8-david@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
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
index 18a9e3fb4c..37a38c4af3 100644
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
index f00304e254..a110aa67fd 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -1540,6 +1540,7 @@ static void *file_ram_alloc(RAMBlock *block,
                             off_t offset,
                             Error **errp)
 {
+    uint32_t qemu_map_flags;
     void *area;
 
     block->page_size = qemu_fd_getpagesize(fd);
@@ -1587,9 +1588,10 @@ static void *file_ram_alloc(RAMBlock *block,
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
index 7b4bec1402..0dd7784a88 100644
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
2.31.1



