Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A819530CBAF
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 20:33:02 +0100 (CET)
Received: from localhost ([::1]:47744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l71Q5-00016A-Nq
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 14:33:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1l71O8-0008It-AX
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 14:31:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30352)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1l71O3-0001Eg-1T
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 14:30:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612294253;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z59hLLCQ4rkkrK+fxH5Wh2TWFkuJh5NzDFruH+EBRy0=;
 b=VHodZPHaea9SdBSJGXCFygCqVBJxu8N9y4EcSP9xv/3eLTQZwx3rEKlZCoG88j8Cf7rAO8
 PRjFEUj71J3rVO7vKfFPR5bgSDQ+eUX7KoVmfC4eLNGUjZaE7B7IPRqZd6XQtdGpzl6hrb
 eJwgd+IUYAnfpG/VmQBZyYJAQ1DXff4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-489-5-nuaSpvMzCQ0YckTfpVKw-1; Tue, 02 Feb 2021 14:30:48 -0500
X-MC-Unique: 5-nuaSpvMzCQ0YckTfpVKw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E1ED4106BAF7;
 Tue,  2 Feb 2021 19:30:24 +0000 (UTC)
Received: from localhost (ovpn-3-197.rdu2.redhat.com [10.22.3.197])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B916A7B150;
 Tue,  2 Feb 2021 19:30:23 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 1/3] memory: add readonly support to
 memory_region_init_ram_from_file()
Date: Tue,  2 Feb 2021 14:30:18 -0500
Message-Id: <20210202193020.4107711-2-ehabkost@redhat.com>
In-Reply-To: <20210202193020.4107711-1-ehabkost@redhat.com>
References: <20210202193020.4107711-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
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
Cc: Igor Mammedov <imammedo@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Hajnoczi <stefanha@redhat.com>

There is currently no way to open(O_RDONLY) and mmap(PROT_READ) when
creating a memory region from a file. This functionality is needed since
the underlying host file may not allow writing.

Add a bool readonly argument to memory_region_init_ram_from_file() and
the APIs it calls.

Extend memory_region_init_ram_from_file() rather than introducing a
memory_region_init_rom_from_file() API so that callers can easily make a
choice between read/write and read-only at runtime without calling
different APIs.

No new RAMBlock flag is introduced for read-only because it's unclear
whether RAMBlocks need to know that they are read-only. Pass a bool
readonly argument instead.

Both of these design decisions can be changed in the future. It just
seemed like the simplest approach to me.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Liam Merwick <liam.merwick@oracle.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20210104171320.575838-2-stefanha@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 include/exec/memory.h     |  2 ++
 include/exec/ram_addr.h   |  5 +++--
 include/qemu/mmap-alloc.h |  2 ++
 backends/hostmem-file.c   |  2 +-
 softmmu/memory.c          |  7 +++++--
 softmmu/physmem.c         | 18 +++++++++++-------
 util/mmap-alloc.c         | 10 ++++++----
 util/oslib-posix.c        |  2 +-
 8 files changed, 31 insertions(+), 17 deletions(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 521d9901d7c..c6ce74fb790 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -966,6 +966,7 @@ void memory_region_init_resizeable_ram(MemoryRegion *mr,
  *             - RAM_PMEM: the memory is persistent memory
  *             Other bits are ignored now.
  * @path: the path in which to allocate the RAM.
+ * @readonly: true to open @path for reading, false for read/write.
  * @errp: pointer to Error*, to store an error if it happens.
  *
  * Note that this function does not do anything to cause the data in the
@@ -978,6 +979,7 @@ void memory_region_init_ram_from_file(MemoryRegion *mr,
                                       uint64_t align,
                                       uint32_t ram_flags,
                                       const char *path,
+                                      bool readonly,
                                       Error **errp);
 
 /**
diff --git a/include/exec/ram_addr.h b/include/exec/ram_addr.h
index c6d2ef1d07e..40b16609abc 100644
--- a/include/exec/ram_addr.h
+++ b/include/exec/ram_addr.h
@@ -110,6 +110,7 @@ long qemu_maxrampagesize(void);
  *              - RAM_PMEM: the backend @mem_path or @fd is persistent memory
  *              Other bits are ignored.
  *  @mem_path or @fd: specify the backing file or device
+ *  @readonly: true to open @path for reading, false for read/write.
  *  @errp: pointer to Error*, to store an error if it happens
  *
  * Return:
@@ -118,9 +119,9 @@ long qemu_maxrampagesize(void);
  */
 RAMBlock *qemu_ram_alloc_from_file(ram_addr_t size, MemoryRegion *mr,
                                    uint32_t ram_flags, const char *mem_path,
-                                   Error **errp);
+                                   bool readonly, Error **errp);
 RAMBlock *qemu_ram_alloc_from_fd(ram_addr_t size, MemoryRegion *mr,
-                                 uint32_t ram_flags, int fd,
+                                 uint32_t ram_flags, int fd, bool readonly,
                                  Error **errp);
 
 RAMBlock *qemu_ram_alloc_from_ptr(ram_addr_t size, void *host,
diff --git a/include/qemu/mmap-alloc.h b/include/qemu/mmap-alloc.h
index e786266b923..8b7a5c70f37 100644
--- a/include/qemu/mmap-alloc.h
+++ b/include/qemu/mmap-alloc.h
@@ -14,6 +14,7 @@ size_t qemu_mempath_getpagesize(const char *mem_path);
  *  @size: the number of bytes to be mmaped
  *  @align: if not zero, specify the alignment of the starting mapping address;
  *          otherwise, the alignment in use will be determined by QEMU.
+ *  @readonly: true for a read-only mapping, false for read/write.
  *  @shared: map has RAM_SHARED flag.
  *  @is_pmem: map has RAM_PMEM flag.
  *
@@ -24,6 +25,7 @@ size_t qemu_mempath_getpagesize(const char *mem_path);
 void *qemu_ram_mmap(int fd,
                     size_t size,
                     size_t align,
+                    bool readonly,
                     bool shared,
                     bool is_pmem);
 
diff --git a/backends/hostmem-file.c b/backends/hostmem-file.c
index 40e1e5b3e3b..e8276921244 100644
--- a/backends/hostmem-file.c
+++ b/backends/hostmem-file.c
@@ -56,7 +56,7 @@ file_backend_memory_alloc(HostMemoryBackend *backend, Error **errp)
                                      backend->size, fb->align,
                                      (backend->share ? RAM_SHARED : 0) |
                                      (fb->is_pmem ? RAM_PMEM : 0),
-                                     fb->mem_path, errp);
+                                     fb->mem_path, false, errp);
     g_free(name);
 #endif
 }
diff --git a/softmmu/memory.c b/softmmu/memory.c
index 333e1ed7b05..676c298b606 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -1587,15 +1587,18 @@ void memory_region_init_ram_from_file(MemoryRegion *mr,
                                       uint64_t align,
                                       uint32_t ram_flags,
                                       const char *path,
+                                      bool readonly,
                                       Error **errp)
 {
     Error *err = NULL;
     memory_region_init(mr, owner, name, size);
     mr->ram = true;
+    mr->readonly = readonly;
     mr->terminates = true;
     mr->destructor = memory_region_destructor_ram;
     mr->align = align;
-    mr->ram_block = qemu_ram_alloc_from_file(size, mr, ram_flags, path, &err);
+    mr->ram_block = qemu_ram_alloc_from_file(size, mr, ram_flags, path,
+                                             readonly, &err);
     if (err) {
         mr->size = int128_zero();
         object_unparent(OBJECT(mr));
@@ -1618,7 +1621,7 @@ void memory_region_init_ram_from_fd(MemoryRegion *mr,
     mr->destructor = memory_region_destructor_ram;
     mr->ram_block = qemu_ram_alloc_from_fd(size, mr,
                                            share ? RAM_SHARED : 0,
-                                           fd, &err);
+                                           fd, false, &err);
     if (err) {
         mr->size = int128_zero();
         object_unparent(OBJECT(mr));
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index cdcd197656f..60760a3bdc5 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -1398,6 +1398,7 @@ static int64_t get_file_align(int fd)
 
 static int file_ram_open(const char *path,
                          const char *region_name,
+                         bool readonly,
                          bool *created,
                          Error **errp)
 {
@@ -1408,7 +1409,7 @@ static int file_ram_open(const char *path,
 
     *created = false;
     for (;;) {
-        fd = open(path, O_RDWR);
+        fd = open(path, readonly ? O_RDONLY : O_RDWR);
         if (fd >= 0) {
             /* @path names an existing file, use it */
             break;
@@ -1460,6 +1461,7 @@ static int file_ram_open(const char *path,
 static void *file_ram_alloc(RAMBlock *block,
                             ram_addr_t memory,
                             int fd,
+                            bool readonly,
                             bool truncate,
                             Error **errp)
 {
@@ -1510,7 +1512,7 @@ static void *file_ram_alloc(RAMBlock *block,
         perror("ftruncate");
     }
 
-    area = qemu_ram_mmap(fd, memory, block->mr->align,
+    area = qemu_ram_mmap(fd, memory, block->mr->align, readonly,
                          block->flags & RAM_SHARED, block->flags & RAM_PMEM);
     if (area == MAP_FAILED) {
         error_setg_errno(errp, errno,
@@ -1942,7 +1944,7 @@ static void ram_block_add(RAMBlock *new_block, Error **errp, bool shared)
 
 #ifdef CONFIG_POSIX
 RAMBlock *qemu_ram_alloc_from_fd(ram_addr_t size, MemoryRegion *mr,
-                                 uint32_t ram_flags, int fd,
+                                 uint32_t ram_flags, int fd, bool readonly,
                                  Error **errp)
 {
     RAMBlock *new_block;
@@ -1996,7 +1998,8 @@ RAMBlock *qemu_ram_alloc_from_fd(ram_addr_t size, MemoryRegion *mr,
     new_block->used_length = size;
     new_block->max_length = size;
     new_block->flags = ram_flags;
-    new_block->host = file_ram_alloc(new_block, size, fd, !file_size, errp);
+    new_block->host = file_ram_alloc(new_block, size, fd, readonly,
+                                     !file_size, errp);
     if (!new_block->host) {
         g_free(new_block);
         return NULL;
@@ -2015,18 +2018,19 @@ RAMBlock *qemu_ram_alloc_from_fd(ram_addr_t size, MemoryRegion *mr,
 
 RAMBlock *qemu_ram_alloc_from_file(ram_addr_t size, MemoryRegion *mr,
                                    uint32_t ram_flags, const char *mem_path,
-                                   Error **errp)
+                                   bool readonly, Error **errp)
 {
     int fd;
     bool created;
     RAMBlock *block;
 
-    fd = file_ram_open(mem_path, memory_region_name(mr), &created, errp);
+    fd = file_ram_open(mem_path, memory_region_name(mr), readonly, &created,
+                       errp);
     if (fd < 0) {
         return NULL;
     }
 
-    block = qemu_ram_alloc_from_fd(size, mr, ram_flags, fd, errp);
+    block = qemu_ram_alloc_from_fd(size, mr, ram_flags, fd, readonly, errp);
     if (!block) {
         if (created) {
             unlink(mem_path);
diff --git a/util/mmap-alloc.c b/util/mmap-alloc.c
index 27dcccd8ec8..890fda6a354 100644
--- a/util/mmap-alloc.c
+++ b/util/mmap-alloc.c
@@ -85,9 +85,11 @@ size_t qemu_mempath_getpagesize(const char *mem_path)
 void *qemu_ram_mmap(int fd,
                     size_t size,
                     size_t align,
+                    bool readonly,
                     bool shared,
                     bool is_pmem)
 {
+    int prot;
     int flags;
     int map_sync_flags = 0;
     int guardfd;
@@ -146,8 +148,9 @@ void *qemu_ram_mmap(int fd,
 
     offset = QEMU_ALIGN_UP((uintptr_t)guardptr, align) - (uintptr_t)guardptr;
 
-    ptr = mmap(guardptr + offset, size, PROT_READ | PROT_WRITE,
-               flags | map_sync_flags, fd, 0);
+    prot = PROT_READ | (readonly ? 0 : PROT_WRITE);
+
+    ptr = mmap(guardptr + offset, size, prot, flags | map_sync_flags, fd, 0);
 
     if (ptr == MAP_FAILED && map_sync_flags) {
         if (errno == ENOTSUP) {
@@ -171,8 +174,7 @@ void *qemu_ram_mmap(int fd,
          * if map failed with MAP_SHARED_VALIDATE | MAP_SYNC,
          * we will remove these flags to handle compatibility.
          */
-        ptr = mmap(guardptr + offset, size, PROT_READ | PROT_WRITE,
-                   flags, fd, 0);
+        ptr = mmap(guardptr + offset, size, prot, flags, fd, 0);
     }
 
     if (ptr == MAP_FAILED) {
diff --git a/util/oslib-posix.c b/util/oslib-posix.c
index 359c52df123..bf57d3b0307 100644
--- a/util/oslib-posix.c
+++ b/util/oslib-posix.c
@@ -230,7 +230,7 @@ void *qemu_memalign(size_t alignment, size_t size)
 void *qemu_anon_ram_alloc(size_t size, uint64_t *alignment, bool shared)
 {
     size_t align = QEMU_VMALLOC_ALIGN;
-    void *ptr = qemu_ram_mmap(-1, size, align, shared, false);
+    void *ptr = qemu_ram_mmap(-1, size, align, false, shared, false);
 
     if (ptr == MAP_FAILED) {
         return NULL;
-- 
2.28.0


