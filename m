Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3982B670B55
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 23:10:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHu9R-000120-Kh; Tue, 17 Jan 2023 17:09:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pHu9P-0000tH-6r
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 17:09:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pHu9N-0007a2-6z
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 17:09:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673993388;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7X9VBKHZSiasDceXYMQp5mjpHt6GeeQjvaxd2veMkQA=;
 b=NpQK+GFcIya7tB3iSNvs3JMFuHJt4wPXqnFDEzVSregdr0SHPbyvZlB+hFSafKvnOKVWsj
 K8R3JjkZJLEYsybGmYeAqEpgUCjQfzZEZ6lW8xzSaAjJv+dRAJsaYwK2xmIyRboQ12eRm0
 8RkoFJFbCkuxwNIa7mMllWahqOE1kL4=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-626-Zyniild0P56PTjKdsbuMjQ-1; Tue, 17 Jan 2023 17:09:44 -0500
X-MC-Unique: Zyniild0P56PTjKdsbuMjQ-1
Received: by mail-qk1-f197.google.com with SMTP id
 x12-20020a05620a258c00b007051ae500a2so23659650qko.15
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 14:09:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7X9VBKHZSiasDceXYMQp5mjpHt6GeeQjvaxd2veMkQA=;
 b=DTQm7Ds6e9YCa42dpXkkVV58fHur2ujFB4rQR9b3wH1hhhtb9iDYjAPUidS8LN48jx
 p1AuraJX8h1HGOA1niFNz3D4xO8wrkuGdlA80Xp8vun7B+h7ik4ouTkJyJMQFmQd312Y
 GaSGE8BZVJqgjFxCvt8khxYh23R041U1icc6gkMlZBF1dDxCAeYkqJJQOuLgDH94SPY1
 ibGiOKcrngE7cw3Hf9mEUwYlR81Kpq4k8CPoGDsurJKoksDV0pO2wwAf7DX/skh7URQi
 yKAJ9zofERNlqFTJyuAVifcLBDJVNBj482u3Yw1wL1laaALyqpCoV6t81X6E41rQYjRa
 5jxQ==
X-Gm-Message-State: AFqh2ko3vfv6kMl2FZcTnVEwoYEDOt3AU4naiuVP989Vs/U/WcUWBSOt
 p+KQsAZ8md/Cdi/bN5zjwFNbhHLVKEwWbWDuETxbaMh8DlRHj+oNDjTRXgA3bXe6he5y9W8SXah
 9tvH4cM4hzjcEHpVZ5OGVSEo8ph+znu6RJgT4DStT2I2PTkqseXi57mj9HHbftYFP
X-Received: by 2002:ac8:46ca:0:b0:3a4:fddd:f8ef with SMTP id
 h10-20020ac846ca000000b003a4fdddf8efmr5335785qto.53.1673993381326; 
 Tue, 17 Jan 2023 14:09:41 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtLm3/2lIyL1Ho0rzAroaYrRvaCab7D2BJmfUeND/i+Cnr8pJsEB6zNlVaci2iK3U+3nStsTQ==
X-Received: by 2002:ac8:46ca:0:b0:3a4:fddd:f8ef with SMTP id
 h10-20020ac846ca000000b003a4fdddf8efmr5335745qto.53.1673993380912; 
 Tue, 17 Jan 2023 14:09:40 -0800 (PST)
Received: from x1n.redhat.com
 (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca. [70.30.145.63])
 by smtp.gmail.com with ESMTPSA id
 bm16-20020a05620a199000b006e16dcf99c8sm21142978qkb.71.2023.01.17.14.09.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 14:09:39 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 James Houghton <jthoughton@google.com>,
 Juan Quintela <quintela@redhat.com>, peterx@redhat.com,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Subject: [PATCH RFC 09/21] ramblock: Add RAM_READONLY
Date: Tue, 17 Jan 2023 17:09:02 -0500
Message-Id: <20230117220914.2062125-10-peterx@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20230117220914.2062125-1-peterx@redhat.com>
References: <20230117220914.2062125-1-peterx@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This allows us to have RAM_READONLY to be set in ram_flags to show that
this ramblock can only be read not write.

We used to pass in readonly boolean along the way for allocating the
ramblock, now let it be together with the rest ramblock flags.

The main purpose of this patch is not for clean up though, it's for caching
mapping information of each ramblock so when we want to mmap() it again for
whatever reason we can have all the information on hand.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 backends/hostmem-file.c |  3 ++-
 include/exec/memory.h   |  4 ++--
 include/exec/ram_addr.h |  5 ++---
 softmmu/memory.c        |  8 +++-----
 softmmu/physmem.c       | 16 +++++++---------
 5 files changed, 16 insertions(+), 20 deletions(-)

diff --git a/backends/hostmem-file.c b/backends/hostmem-file.c
index 25141283c4..1daf00d2da 100644
--- a/backends/hostmem-file.c
+++ b/backends/hostmem-file.c
@@ -56,9 +56,10 @@ file_backend_memory_alloc(HostMemoryBackend *backend, Error **errp)
     ram_flags = backend->share ? RAM_SHARED : 0;
     ram_flags |= backend->reserve ? 0 : RAM_NORESERVE;
     ram_flags |= fb->is_pmem ? RAM_PMEM : 0;
+    ram_flags |= fb->readonly ? RAM_READONLY : 0;
     memory_region_init_ram_from_file(&backend->mr, OBJECT(backend), name,
                                      backend->size, fb->align, ram_flags,
-                                     fb->mem_path, fb->readonly, errp);
+                                     fb->mem_path, errp);
     g_free(name);
 #endif
 }
diff --git a/include/exec/memory.h b/include/exec/memory.h
index c37ffdbcd1..006ba77ede 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -188,6 +188,8 @@ typedef struct IOMMUTLBEvent {
 /* RAM is a persistent kind memory */
 #define RAM_PMEM (1 << 5)
 
+/* RAM is read-only */
+#define RAM_READONLY (1 << 6)
 
 /*
  * UFFDIO_WRITEPROTECT is used on this RAMBlock to
@@ -1292,7 +1294,6 @@ void memory_region_init_resizeable_ram(MemoryRegion *mr,
  * @ram_flags: RamBlock flags. Supported flags: RAM_SHARED, RAM_PMEM,
  *             RAM_NORESERVE,
  * @path: the path in which to allocate the RAM.
- * @readonly: true to open @path for reading, false for read/write.
  * @errp: pointer to Error*, to store an error if it happens.
  *
  * Note that this function does not do anything to cause the data in the
@@ -1305,7 +1306,6 @@ void memory_region_init_ram_from_file(MemoryRegion *mr,
                                       uint64_t align,
                                       uint32_t ram_flags,
                                       const char *path,
-                                      bool readonly,
                                       Error **errp);
 
 /**
diff --git a/include/exec/ram_addr.h b/include/exec/ram_addr.h
index f4fb6a2111..0bf9cfc659 100644
--- a/include/exec/ram_addr.h
+++ b/include/exec/ram_addr.h
@@ -110,7 +110,6 @@ long qemu_maxrampagesize(void);
  *  @ram_flags: RamBlock flags. Supported flags: RAM_SHARED, RAM_PMEM,
  *              RAM_NORESERVE.
  *  @mem_path or @fd: specify the backing file or device
- *  @readonly: true to open @path for reading, false for read/write.
  *  @errp: pointer to Error*, to store an error if it happens
  *
  * Return:
@@ -119,10 +118,10 @@ long qemu_maxrampagesize(void);
  */
 RAMBlock *qemu_ram_alloc_from_file(ram_addr_t size, MemoryRegion *mr,
                                    uint32_t ram_flags, const char *mem_path,
-                                   bool readonly, Error **errp);
+                                   Error **errp);
 RAMBlock *qemu_ram_alloc_from_fd(ram_addr_t size, MemoryRegion *mr,
                                  uint32_t ram_flags, int fd, off_t offset,
-                                 bool readonly, Error **errp);
+                                 Error **errp);
 
 RAMBlock *qemu_ram_alloc_from_ptr(ram_addr_t size, void *host,
                                   MemoryRegion *mr, Error **errp);
diff --git a/softmmu/memory.c b/softmmu/memory.c
index e05332d07f..2137028773 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -1601,18 +1601,16 @@ void memory_region_init_ram_from_file(MemoryRegion *mr,
                                       uint64_t align,
                                       uint32_t ram_flags,
                                       const char *path,
-                                      bool readonly,
                                       Error **errp)
 {
     Error *err = NULL;
     memory_region_init(mr, owner, name, size);
     mr->ram = true;
-    mr->readonly = readonly;
+    mr->readonly = ram_flags & RAM_READONLY;
     mr->terminates = true;
     mr->destructor = memory_region_destructor_ram;
     mr->align = align;
-    mr->ram_block = qemu_ram_alloc_from_file(size, mr, ram_flags, path,
-                                             readonly, &err);
+    mr->ram_block = qemu_ram_alloc_from_file(size, mr, ram_flags, path, &err);
     if (err) {
         mr->size = int128_zero();
         object_unparent(OBJECT(mr));
@@ -1635,7 +1633,7 @@ void memory_region_init_ram_from_fd(MemoryRegion *mr,
     mr->terminates = true;
     mr->destructor = memory_region_destructor_ram;
     mr->ram_block = qemu_ram_alloc_from_fd(size, mr, ram_flags, fd, offset,
-                                           false, &err);
+                                           &err);
     if (err) {
         mr->size = int128_zero();
         object_unparent(OBJECT(mr));
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index b5be02f1cb..6096eac286 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -1534,7 +1534,6 @@ static int file_ram_open(const char *path,
 
 static void *file_ram_alloc(RAMBlock *block,
                             int fd,
-                            bool readonly,
                             bool truncate,
                             off_t offset,
                             Error **errp)
@@ -1589,7 +1588,7 @@ static void *file_ram_alloc(RAMBlock *block,
         perror("ftruncate");
     }
 
-    qemu_map_flags = readonly ? QEMU_MAP_READONLY : 0;
+    qemu_map_flags = (block->flags & RAM_READONLY) ? QEMU_MAP_READONLY : 0;
     qemu_map_flags |= (block->flags & RAM_SHARED) ? QEMU_MAP_SHARED : 0;
     qemu_map_flags |= (block->flags & RAM_PMEM) ? QEMU_MAP_SYNC : 0;
     qemu_map_flags |= (block->flags & RAM_NORESERVE) ? QEMU_MAP_NORESERVE : 0;
@@ -2057,7 +2056,7 @@ static void ram_block_add(RAMBlock *new_block, Error **errp)
 #ifdef CONFIG_POSIX
 RAMBlock *qemu_ram_alloc_from_fd(ram_addr_t size, MemoryRegion *mr,
                                  uint32_t ram_flags, int fd, off_t offset,
-                                 bool readonly, Error **errp)
+                                 Error **errp)
 {
     RAMBlock *new_block;
     Error *local_err = NULL;
@@ -2065,7 +2064,7 @@ RAMBlock *qemu_ram_alloc_from_fd(ram_addr_t size, MemoryRegion *mr,
 
     /* Just support these ram flags by now. */
     assert((ram_flags & ~(RAM_SHARED | RAM_PMEM | RAM_NORESERVE |
-                          RAM_PROTECTED)) == 0);
+                          RAM_PROTECTED | RAM_READONLY)) == 0);
 
     if (xen_enabled()) {
         error_setg(errp, "-mem-path not supported with Xen");
@@ -2100,8 +2099,7 @@ RAMBlock *qemu_ram_alloc_from_fd(ram_addr_t size, MemoryRegion *mr,
     new_block->used_length = size;
     new_block->max_length = size;
     new_block->flags = ram_flags;
-    new_block->host = file_ram_alloc(new_block, fd, readonly,
-                                     !file_size, offset, errp);
+    new_block->host = file_ram_alloc(new_block, fd, !file_size, offset, errp);
     if (!new_block->host) {
         g_free(new_block);
         return NULL;
@@ -2120,11 +2118,11 @@ RAMBlock *qemu_ram_alloc_from_fd(ram_addr_t size, MemoryRegion *mr,
 
 RAMBlock *qemu_ram_alloc_from_file(ram_addr_t size, MemoryRegion *mr,
                                    uint32_t ram_flags, const char *mem_path,
-                                   bool readonly, Error **errp)
+                                   Error **errp)
 {
     int fd;
-    bool created;
     RAMBlock *block;
+    bool created, readonly = ram_flags & RAM_READONLY;
 
     fd = file_ram_open(mem_path, memory_region_name(mr), readonly, &created,
                        errp);
@@ -2132,7 +2130,7 @@ RAMBlock *qemu_ram_alloc_from_file(ram_addr_t size, MemoryRegion *mr,
         return NULL;
     }
 
-    block = qemu_ram_alloc_from_fd(size, mr, ram_flags, fd, 0, readonly, errp);
+    block = qemu_ram_alloc_from_fd(size, mr, ram_flags, fd, 0, errp);
     if (!block) {
         if (created) {
             unlink(mem_path);
-- 
2.37.3


