Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D59943311EE
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 16:19:16 +0100 (CET)
Received: from localhost ([::1]:48982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJHf9-0003md-VA
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 10:19:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lJHUR-0007Ob-Nv
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 10:08:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:34649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lJHUP-0001lQ-OX
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 10:08:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615216089;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0bNxAjoblhVsFa7Cr7BGJOrI3UqBRI900v9WI//iqpQ=;
 b=ft68lsTy7tANFZkRPR8Q5qu9CL2O3CoQnHq2Z8Mw96Wtj+f+m9USvqDXnv04mrs17qhdUy
 eMPaxQHJ3ta3XcSQiXPM2r/MmOpS1gE4fJpq2rqM3IJTSZpG86ImqthYSCT3KIfbTqNJsc
 xw2xy8RS+EN0+dbrs4DmZeg4grHXuAY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-344-gAyWJPViPb-THNzsfaIJXQ-1; Mon, 08 Mar 2021 10:08:07 -0500
X-MC-Unique: gAyWJPViPb-THNzsfaIJXQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BD079101962A;
 Mon,  8 Mar 2021 15:08:05 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-113-123.ams2.redhat.com [10.36.113.123])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A25945D9D3;
 Mon,  8 Mar 2021 15:07:48 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 09/12] util/mmap-alloc: Pass flags instead of separate
 bools to qemu_ram_mmap()
Date: Mon,  8 Mar 2021 16:05:57 +0100
Message-Id: <20210308150600.14440-10-david@redhat.com>
In-Reply-To: <20210308150600.14440-1-david@redhat.com>
References: <20210308150600.14440-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
 Cornelia Huck <cohuck@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Greg Kurz <groug@kaod.org>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Igor Kotrasinski <i.kotrasinsk@partner.samsung.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let's introduce a new set of flags that abstract mmap logic and replace
our current set of bools, to prepare for another flag.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/qemu/mmap-alloc.h | 17 +++++++++++------
 softmmu/physmem.c         |  8 +++++---
 util/mmap-alloc.c         | 14 +++++++-------
 util/oslib-posix.c        |  3 ++-
 4 files changed, 25 insertions(+), 17 deletions(-)

diff --git a/include/qemu/mmap-alloc.h b/include/qemu/mmap-alloc.h
index 456ff87df1..55664ea9f3 100644
--- a/include/qemu/mmap-alloc.h
+++ b/include/qemu/mmap-alloc.h
@@ -6,6 +6,15 @@ size_t qemu_fd_getpagesize(int fd);
 
 size_t qemu_mempath_getpagesize(const char *mem_path);
 
+/* Map PROT_READ instead of PROT_READ|PROT_WRITE. */
+#define QEMU_RAM_MMAP_READONLY      (1 << 0)
+
+/* Map MAP_SHARED instead of MAP_PRIVATE. */
+#define QEMU_RAM_MMAP_SHARED        (1 << 1)
+
+/* Map MAP_SYNC|MAP_SHARED_VALIDATE if possible, fallback and warn otherwise. */
+#define QEMU_RAM_MMAP_PMEM          (1 << 2)
+
 /**
  * qemu_ram_mmap: mmap the specified file or device.
  *
@@ -14,9 +23,7 @@ size_t qemu_mempath_getpagesize(const char *mem_path);
  *  @size: the number of bytes to be mmaped
  *  @align: if not zero, specify the alignment of the starting mapping address;
  *          otherwise, the alignment in use will be determined by QEMU.
- *  @readonly: true for a read-only mapping, false for read/write.
- *  @shared: map has RAM_SHARED flag.
- *  @is_pmem: map has RAM_PMEM flag.
+ *  @mmap_flags: QEMU_RAM_MMAP_* flags
  *  @map_offset: map starts at offset of map_offset from the start of fd
  *
  * Return:
@@ -26,9 +33,7 @@ size_t qemu_mempath_getpagesize(const char *mem_path);
 void *qemu_ram_mmap(int fd,
                     size_t size,
                     size_t align,
-                    bool readonly,
-                    bool shared,
-                    bool is_pmem,
+                    uint32_t mmap_flags,
                     off_t map_offset);
 
 void qemu_ram_munmap(int fd, void *ptr, size_t size);
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 8f90cb4cd2..ec7a382ccd 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -1533,6 +1533,7 @@ static void *file_ram_alloc(RAMBlock *block,
                             off_t offset,
                             Error **errp)
 {
+    uint32_t mmap_flags;
     void *area;
 
     block->page_size = qemu_fd_getpagesize(fd);
@@ -1580,9 +1581,10 @@ static void *file_ram_alloc(RAMBlock *block,
         perror("ftruncate");
     }
 
-    area = qemu_ram_mmap(fd, memory, block->mr->align, readonly,
-                         block->flags & RAM_SHARED, block->flags & RAM_PMEM,
-                         offset);
+    mmap_flags = readonly ? QEMU_RAM_MMAP_READONLY : 0;
+    mmap_flags |= (block->flags & RAM_SHARED) ? QEMU_RAM_MMAP_SHARED : 0;
+    mmap_flags |= (block->flags & RAM_PMEM) ? QEMU_RAM_MMAP_PMEM : 0;
+    area = qemu_ram_mmap(fd, memory, block->mr->align, mmap_flags, offset);
     if (area == MAP_FAILED) {
         error_setg_errno(errp, errno,
                          "unable to map backing store for guest RAM");
diff --git a/util/mmap-alloc.c b/util/mmap-alloc.c
index 0e2bd7bc0e..bd8f7ab547 100644
--- a/util/mmap-alloc.c
+++ b/util/mmap-alloc.c
@@ -118,9 +118,12 @@ static void *mmap_reserve(size_t size, int fd)
  * Activate memory in a reserved region from the given fd (if any), to make
  * it accessible.
  */
-static void *mmap_activate(void *ptr, size_t size, int fd, bool readonly,
-                           bool shared, bool is_pmem, off_t map_offset)
+static void *mmap_activate(void *ptr, size_t size, int fd, uint32_t mmap_flags,
+                           off_t map_offset)
 {
+    const bool readonly = mmap_flags & QEMU_RAM_MMAP_READONLY;
+    const bool shared = mmap_flags & QEMU_RAM_MMAP_SHARED;
+    const bool is_pmem = mmap_flags & QEMU_RAM_MMAP_PMEM;
     const int prot = PROT_READ | (readonly ? 0 : PROT_WRITE);
     int map_sync_flags = 0;
     int flags = MAP_FIXED;
@@ -173,9 +176,7 @@ static inline size_t mmap_guard_pagesize(int fd)
 void *qemu_ram_mmap(int fd,
                     size_t size,
                     size_t align,
-                    bool readonly,
-                    bool shared,
-                    bool is_pmem,
+                    uint32_t mmap_flags,
                     off_t map_offset)
 {
     const size_t guard_pagesize = mmap_guard_pagesize(fd);
@@ -199,8 +200,7 @@ void *qemu_ram_mmap(int fd,
 
     offset = QEMU_ALIGN_UP((uintptr_t)guardptr, align) - (uintptr_t)guardptr;
 
-    ptr = mmap_activate(guardptr + offset, size, fd, readonly, shared, is_pmem,
-                        map_offset);
+    ptr = mmap_activate(guardptr + offset, size, fd, mmap_flags, map_offset);
     if (ptr == MAP_FAILED) {
         munmap(guardptr, total);
         return MAP_FAILED;
diff --git a/util/oslib-posix.c b/util/oslib-posix.c
index 36820fec16..1d250416f1 100644
--- a/util/oslib-posix.c
+++ b/util/oslib-posix.c
@@ -229,8 +229,9 @@ void *qemu_memalign(size_t alignment, size_t size)
 /* alloc shared memory pages */
 void *qemu_anon_ram_alloc(size_t size, uint64_t *alignment, bool shared)
 {
+    const uint32_t mmap_flags = shared ? QEMU_RAM_MMAP_SHARED : 0;
     size_t align = QEMU_VMALLOC_ALIGN;
-    void *ptr = qemu_ram_mmap(-1, size, align, false, shared, false, 0);
+    void *ptr = qemu_ram_mmap(-1, size, align, mmap_flags, 0);
 
     if (ptr == MAP_FAILED) {
         return NULL;
-- 
2.29.2


