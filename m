Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 901DD3AB040
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 11:51:33 +0200 (CEST)
Received: from localhost ([::1]:40490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltogO-0002tg-Ku
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 05:51:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ltoNT-0002t8-5R
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 05:31:59 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:40913)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ltoNO-0006CK-MX
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 05:31:58 -0400
Received: by mail-ed1-x52a.google.com with SMTP id t3so3044404edc.7
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 02:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PwhijkT5BerkG5mca/UyRrOW6T6V8fgDmI9azbvgpVw=;
 b=qMdJfx6V9bOaKTvFQ5B+WZCzcOWle9vbgsfQILeMuJ4ztbDnvaOuRnsXXbLNrQ82Ou
 SDHXWOEJmsIJqenSgytEabDWSgKd4bDhgUsronM1NsuKe6ugGz085yx1sD5s7u1bCMmL
 SFoZmB2wKnqFoEmPm5aBpbn9VNO1f0NF5Tb4WmDCUANXodBfQDxpazvF/vjsQ+HZgd4C
 cSzRFSzSSxVt1cNLRSAZQkI3U/aa9t2lDmN8nJ5jODM8WrRakQKWuqg3B3CnY4Yr6p5S
 Q7snob7MTI/XVqkzwkO/pV6hH6/MtkWrE4nZr0H5OHiPm/RXfw8Qw1rp4VdquYo9E19t
 6sxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=PwhijkT5BerkG5mca/UyRrOW6T6V8fgDmI9azbvgpVw=;
 b=ti86r/NES32fiyvehSgawUAFIO/DUgi4n+z0hOwDSHsCWANDZ+zRAmm3s6Ntg/4Gj5
 Va2DTh/Oz4DcBZNW9kwko4963BBmr/Z1EEgEa/lC2YdFUz3kKy4EThMy9uTTR6OgyGc4
 C0tSrWfxrIH4pieGmsHvsqDiA20qW+lFPTOOgPgCSR0ggq6leCsbB5QQDvvkRoraTUuD
 L0/1d6INPbKHN3rHP7ccFW1GzgaacVGx33ws+2t2C8Z7vzY/oO0yNuHAR3ke478MSZe+
 KJUi2FuNVAfztBGtBIFcoyfAGsadojRqNw67Ha5iyOmOqBR9RPUs4pKO5chxGHmKEUgQ
 EZww==
X-Gm-Message-State: AOAM531BxeUhzgUXF4rmUHjb2qP2lQ6mjhAUc9yYykndVpRvdSxRpttk
 n1mLh0byy2FNVsVhbpoyU7upgTyqo0Y=
X-Google-Smtp-Source: ABdhPJyaoQIqgUTb8h+63gkFqpI93kJvfrQfZUZuvysiJgsHx3sqQSqy/CPri6U9Bvxv0twOAHmegQ==
X-Received: by 2002:a05:6402:11cc:: with SMTP id
 j12mr5319112edw.114.1623922310541; 
 Thu, 17 Jun 2021 02:31:50 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m18sm3328140ejx.56.2021.06.17.02.31.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 02:31:50 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 21/45] softmmu/memory: Pass ram_flags to
 qemu_ram_alloc_from_fd()
Date: Thu, 17 Jun 2021 11:31:10 +0200
Message-Id: <20210617093134.900014-22-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210617093134.900014-1-pbonzini@redhat.com>
References: <20210617093134.900014-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52a.google.com
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

Let's pass in ram flags just like we do with qemu_ram_alloc_from_file(),
to clean up and prepare for more flags.

Simplify the documentation of passed ram flags: Looking at our
documentation of RAM_SHARED and RAM_PMEM is sufficient, no need to be
repetitive.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
Acked-by: Eduardo Habkost <ehabkost@redhat.com> for memory backend and machine core
Signed-off-by: David Hildenbrand <david@redhat.com>
Message-Id: <20210510114328.21835-5-david@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 backends/hostmem-memfd.c | 7 ++++---
 hw/misc/ivshmem.c        | 5 ++---
 include/exec/memory.h    | 9 +++------
 include/exec/ram_addr.h  | 6 +-----
 softmmu/memory.c         | 7 +++----
 5 files changed, 13 insertions(+), 21 deletions(-)

diff --git a/backends/hostmem-memfd.c b/backends/hostmem-memfd.c
index da75e27057..3076da146d 100644
--- a/backends/hostmem-memfd.c
+++ b/backends/hostmem-memfd.c
@@ -35,6 +35,7 @@ static void
 memfd_backend_memory_alloc(HostMemoryBackend *backend, Error **errp)
 {
     HostMemoryBackendMemfd *m = MEMORY_BACKEND_MEMFD(backend);
+    uint32_t ram_flags;
     char *name;
     int fd;
 
@@ -52,9 +53,9 @@ memfd_backend_memory_alloc(HostMemoryBackend *backend, Error **errp)
     }
 
     name = host_memory_backend_get_name(backend);
-    memory_region_init_ram_from_fd(&backend->mr, OBJECT(backend),
-                                   name, backend->size,
-                                   backend->share, fd, 0, errp);
+    ram_flags = backend->share ? RAM_SHARED : 0;
+    memory_region_init_ram_from_fd(&backend->mr, OBJECT(backend), name,
+                                   backend->size, ram_flags, fd, 0, errp);
     g_free(name);
 }
 
diff --git a/hw/misc/ivshmem.c b/hw/misc/ivshmem.c
index a1fa4878be..1ba4a98377 100644
--- a/hw/misc/ivshmem.c
+++ b/hw/misc/ivshmem.c
@@ -493,9 +493,8 @@ static void process_msg_shmem(IVShmemState *s, int fd, Error **errp)
     size = buf.st_size;
 
     /* mmap the region and map into the BAR2 */
-    memory_region_init_ram_from_fd(&s->server_bar2, OBJECT(s),
-                                   "ivshmem.bar2", size, true, fd, 0,
-                                   &local_err);
+    memory_region_init_ram_from_fd(&s->server_bar2, OBJECT(s), "ivshmem.bar2",
+                                   size, RAM_SHARED, fd, 0, &local_err);
     if (local_err) {
         error_propagate(errp, local_err);
         return;
diff --git a/include/exec/memory.h b/include/exec/memory.h
index b114f5454b..8aa69a10d7 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -1005,10 +1005,7 @@ void memory_region_init_resizeable_ram(MemoryRegion *mr,
  * @size: size of the region.
  * @align: alignment of the region base address; if 0, the default alignment
  *         (getpagesize()) will be used.
- * @ram_flags: Memory region features:
- *             - RAM_SHARED: memory must be mmaped with the MAP_SHARED flag
- *             - RAM_PMEM: the memory is persistent memory
- *             Other bits are ignored now.
+ * @ram_flags: RamBlock flags. Supported flags: RAM_SHARED, RAM_PMEM.
  * @path: the path in which to allocate the RAM.
  * @readonly: true to open @path for reading, false for read/write.
  * @errp: pointer to Error*, to store an error if it happens.
@@ -1034,7 +1031,7 @@ void memory_region_init_ram_from_file(MemoryRegion *mr,
  * @owner: the object that tracks the region's reference count
  * @name: the name of the region.
  * @size: size of the region.
- * @share: %true if memory must be mmaped with the MAP_SHARED flag
+ * @ram_flags: RamBlock flags. Supported flags: RAM_SHARED, RAM_PMEM.
  * @fd: the fd to mmap.
  * @offset: offset within the file referenced by fd
  * @errp: pointer to Error*, to store an error if it happens.
@@ -1046,7 +1043,7 @@ void memory_region_init_ram_from_fd(MemoryRegion *mr,
                                     Object *owner,
                                     const char *name,
                                     uint64_t size,
-                                    bool share,
+                                    uint32_t ram_flags,
                                     int fd,
                                     ram_addr_t offset,
                                     Error **errp);
diff --git a/include/exec/ram_addr.h b/include/exec/ram_addr.h
index 3cb9791df3..a7e3378340 100644
--- a/include/exec/ram_addr.h
+++ b/include/exec/ram_addr.h
@@ -104,11 +104,7 @@ long qemu_maxrampagesize(void);
  * Parameters:
  *  @size: the size in bytes of the ram block
  *  @mr: the memory region where the ram block is
- *  @ram_flags: specify the properties of the ram block, which can be one
- *              or bit-or of following values
- *              - RAM_SHARED: mmap the backing file or device with MAP_SHARED
- *              - RAM_PMEM: the backend @mem_path or @fd is persistent memory
- *              Other bits are ignored.
+ *  @ram_flags: RamBlock flags. Supported flags: RAM_SHARED, RAM_PMEM.
  *  @mem_path or @fd: specify the backing file or device
  *  @readonly: true to open @path for reading, false for read/write.
  *  @errp: pointer to Error*, to store an error if it happens
diff --git a/softmmu/memory.c b/softmmu/memory.c
index c19b0be6b1..f777504ac5 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -1609,7 +1609,7 @@ void memory_region_init_ram_from_fd(MemoryRegion *mr,
                                     Object *owner,
                                     const char *name,
                                     uint64_t size,
-                                    bool share,
+                                    uint32_t ram_flags,
                                     int fd,
                                     ram_addr_t offset,
                                     Error **errp)
@@ -1619,9 +1619,8 @@ void memory_region_init_ram_from_fd(MemoryRegion *mr,
     mr->ram = true;
     mr->terminates = true;
     mr->destructor = memory_region_destructor_ram;
-    mr->ram_block = qemu_ram_alloc_from_fd(size, mr,
-                                           share ? RAM_SHARED : 0,
-                                           fd, offset, false, &err);
+    mr->ram_block = qemu_ram_alloc_from_fd(size, mr, ram_flags, fd, offset,
+                                           false, &err);
     if (err) {
         mr->size = int128_zero();
         object_unparent(OBJECT(mr));
-- 
2.31.1



