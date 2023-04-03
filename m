Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC1E6D549C
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 00:16:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjSSj-0006w4-Ay; Mon, 03 Apr 2023 18:15:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=450ae5ae2=graf@amazon.de>)
 id 1pjSSg-0006uY-EA
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 18:15:38 -0400
Received: from smtp-fw-2101.amazon.com ([72.21.196.25])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=450ae5ae2=graf@amazon.de>)
 id 1pjSRb-0002mm-Es
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 18:15:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1680560071; x=1712096071;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XNcOIa7s+JHa+2DXNT3AqazmYDFW4ZsbLDHItiKBJ1o=;
 b=KrIXhsFwDhBTdp3plRImpHFaudZJ3976f49GNOco1d0Ie6NDdKNrG0dt
 STOXIUlhaf2ZTYocvf1W8BF4mt8kC2+/YVgyqaZp4wnh2wLKeXjPQtRx/
 kk5pQ9erbMUoBnbtMlDrr2z/DsXbdsVuYkhmJEkZA3ko55VhWpe5Zy7/V g=;
X-IronPort-AV: E=Sophos;i="5.98,315,1673913600"; d="scan'208";a="310102642"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-pdx-2c-m6i4x-e7094f15.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-2101.iad2.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2023 22:14:26 +0000
Received: from EX19MTAUWC002.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan3.pdx.amazon.com [10.236.137.198])
 by email-inbound-relay-pdx-2c-m6i4x-e7094f15.us-west-2.amazon.com (Postfix)
 with ESMTPS id 8B7AF410CC; Mon,  3 Apr 2023 22:14:25 +0000 (UTC)
Received: from EX19D020UWC004.ant.amazon.com (10.13.138.149) by
 EX19MTAUWC002.ant.amazon.com (10.250.64.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Mon, 3 Apr 2023 22:14:25 +0000
Received: from dev-dsk-graf-1a-5ce218e4.eu-west-1.amazon.com (10.253.83.51) by
 EX19D020UWC004.ant.amazon.com (10.13.138.149) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 3 Apr 2023 22:14:23 +0000
From: Alexander Graf <graf@amazon.com>
To: <qemu-devel@nongnu.org>
CC: David Hildenbrand <david@redhat.com>, Markus Armbruster
 <armbru@redhat.com>, Eduardo Habkost <eduardo@habkost.net>, "Daniel P .
 Berrange" <berrange@redhat.com>, Eric Blake <eblake@redhat.com>, "Philippe
 Mathieu-Daude" <philmd@linaro.org>, Peter Xu <peterx@redhat.com>, "Paolo
 Bonzini" <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>, "Stefan
 Hajnoczi" <stefanha@redhat.com>, Ashish Kalra <ashish.kalra@amd.com>, "Tom
 Lendacky" <thomas.lendacky@amd.com>
Subject: [PATCH v5] hostmem-file: add offset option
Date: Mon, 3 Apr 2023 22:14:21 +0000
Message-ID: <20230403221421.60877-1-graf@amazon.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Originating-IP: [10.253.83.51]
X-ClientProxiedBy: EX19D045UWC003.ant.amazon.com (10.13.139.198) To
 EX19D020UWC004.ant.amazon.com (10.13.138.149)
Precedence: Bulk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=72.21.196.25;
 envelope-from=prvs=450ae5ae2=graf@amazon.de; helo=smtp-fw-2101.amazon.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

Add an option for hostmem-file to start the memory object at an offset
into the target file. This is useful if multiple memory objects reside
inside the same target file, such as a device node.

In particular, it's useful to map guest memory directly into /dev/mem
for experimentation.

To make this work consistently, also fix up all places in QEMU that
expect fd offsets to be 0.

Signed-off-by: Alexander Graf <graf@amazon.com>

---

v1 -> v2:

  - add qom documentation
  - propagate offset into truncate, size and alignment checks

v2 -> v3:

  - failed attempt at fixing typo

v3 -> v4:

  - fix typo

v4 -> v5:

  - improve qom doc comment
  - account for fd_offset in more places
---
 backends/hostmem-file.c | 40 +++++++++++++++++++++++++++++++++++++++-
 hw/virtio/vhost-user.c  |  1 +
 include/exec/memory.h   |  2 ++
 include/exec/ram_addr.h |  3 ++-
 include/exec/ramblock.h |  1 +
 qapi/qom.json           |  5 +++++
 qemu-options.hx         |  6 +++++-
 softmmu/memory.c        |  3 ++-
 softmmu/physmem.c       | 17 ++++++++++++-----
 9 files changed, 69 insertions(+), 9 deletions(-)

diff --git a/backends/hostmem-file.c b/backends/hostmem-file.c
index 25141283c4..38ea65bec5 100644
--- a/backends/hostmem-file.c
+++ b/backends/hostmem-file.c
@@ -27,6 +27,7 @@ struct HostMemoryBackendFile {
 
     char *mem_path;
     uint64_t align;
+    uint64_t offset;
     bool discard_data;
     bool is_pmem;
     bool readonly;
@@ -58,7 +59,8 @@ file_backend_memory_alloc(HostMemoryBackend *backend, Error **errp)
     ram_flags |= fb->is_pmem ? RAM_PMEM : 0;
     memory_region_init_ram_from_file(&backend->mr, OBJECT(backend), name,
                                      backend->size, fb->align, ram_flags,
-                                     fb->mem_path, fb->readonly, errp);
+                                     fb->mem_path, fb->offset, fb->readonly,
+                                     errp);
     g_free(name);
 #endif
 }
@@ -125,6 +127,36 @@ static void file_memory_backend_set_align(Object *o, Visitor *v,
     fb->align = val;
 }
 
+static void file_memory_backend_get_offset(Object *o, Visitor *v,
+                                          const char *name, void *opaque,
+                                          Error **errp)
+{
+    HostMemoryBackendFile *fb = MEMORY_BACKEND_FILE(o);
+    uint64_t val = fb->offset;
+
+    visit_type_size(v, name, &val, errp);
+}
+
+static void file_memory_backend_set_offset(Object *o, Visitor *v,
+                                          const char *name, void *opaque,
+                                          Error **errp)
+{
+    HostMemoryBackend *backend = MEMORY_BACKEND(o);
+    HostMemoryBackendFile *fb = MEMORY_BACKEND_FILE(o);
+    uint64_t val;
+
+    if (host_memory_backend_mr_inited(backend)) {
+        error_setg(errp, "cannot change property '%s' of %s", name,
+                   object_get_typename(o));
+        return;
+    }
+
+    if (!visit_type_size(v, name, &val, errp)) {
+        return;
+    }
+    fb->offset = val;
+}
+
 #ifdef CONFIG_LIBPMEM
 static bool file_memory_backend_get_pmem(Object *o, Error **errp)
 {
@@ -197,6 +229,12 @@ file_backend_class_init(ObjectClass *oc, void *data)
         file_memory_backend_get_align,
         file_memory_backend_set_align,
         NULL, NULL);
+    object_class_property_add(oc, "offset", "int",
+        file_memory_backend_get_offset,
+        file_memory_backend_set_offset,
+        NULL, NULL);
+    object_class_property_set_description(oc, "offset",
+        "Offset into the target file (ex: 1G)");
 #ifdef CONFIG_LIBPMEM
     object_class_property_add_bool(oc, "pmem",
         file_memory_backend_get_pmem, file_memory_backend_set_pmem);
diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index e5285df4ba..39dc803b03 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -483,6 +483,7 @@ static MemoryRegion *vhost_user_get_mr_data(uint64_t addr, ram_addr_t *offset,
     assert((uintptr_t)addr == addr);
     mr = memory_region_from_host((void *)(uintptr_t)addr, offset);
     *fd = memory_region_get_fd(mr);
+    *offset += mr->ram_block->fd_offset;
 
     return mr;
 }
diff --git a/include/exec/memory.h b/include/exec/memory.h
index 15ade918ba..3b7295fbe2 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -1318,6 +1318,7 @@ void memory_region_init_resizeable_ram(MemoryRegion *mr,
  * @ram_flags: RamBlock flags. Supported flags: RAM_SHARED, RAM_PMEM,
  *             RAM_NORESERVE,
  * @path: the path in which to allocate the RAM.
+ * @offset: offset within the file referenced by path
  * @readonly: true to open @path for reading, false for read/write.
  * @errp: pointer to Error*, to store an error if it happens.
  *
@@ -1331,6 +1332,7 @@ void memory_region_init_ram_from_file(MemoryRegion *mr,
                                       uint64_t align,
                                       uint32_t ram_flags,
                                       const char *path,
+                                      ram_addr_t offset,
                                       bool readonly,
                                       Error **errp);
 
diff --git a/include/exec/ram_addr.h b/include/exec/ram_addr.h
index f4fb6a2111..90a8269290 100644
--- a/include/exec/ram_addr.h
+++ b/include/exec/ram_addr.h
@@ -110,6 +110,7 @@ long qemu_maxrampagesize(void);
  *  @ram_flags: RamBlock flags. Supported flags: RAM_SHARED, RAM_PMEM,
  *              RAM_NORESERVE.
  *  @mem_path or @fd: specify the backing file or device
+ *  @offset: Offset into target file
  *  @readonly: true to open @path for reading, false for read/write.
  *  @errp: pointer to Error*, to store an error if it happens
  *
@@ -119,7 +120,7 @@ long qemu_maxrampagesize(void);
  */
 RAMBlock *qemu_ram_alloc_from_file(ram_addr_t size, MemoryRegion *mr,
                                    uint32_t ram_flags, const char *mem_path,
-                                   bool readonly, Error **errp);
+                                   off_t offset, bool readonly, Error **errp);
 RAMBlock *qemu_ram_alloc_from_fd(ram_addr_t size, MemoryRegion *mr,
                                  uint32_t ram_flags, int fd, off_t offset,
                                  bool readonly, Error **errp);
diff --git a/include/exec/ramblock.h b/include/exec/ramblock.h
index adc03df59c..69c6a53902 100644
--- a/include/exec/ramblock.h
+++ b/include/exec/ramblock.h
@@ -40,6 +40,7 @@ struct RAMBlock {
     QLIST_ENTRY(RAMBlock) next;
     QLIST_HEAD(, RAMBlockNotifier) ramblock_notifiers;
     int fd;
+    uint64_t fd_offset;
     size_t page_size;
     /* dirty bitmap used during migration */
     unsigned long *bmap;
diff --git a/qapi/qom.json b/qapi/qom.json
index a877b879b9..f740f74be3 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -635,6 +635,10 @@
 #         specify the required alignment via this option.
 #         0 selects a default alignment (currently the page size). (default: 0)
 #
+# @offset: the offset into the target file that the region starts at. You can
+#          use this option to back multiple regions with a single file. Must be
+#          a multiple of the page size. (default: 0) (since 8.1)
+#
 # @discard-data: if true, the file contents can be destroyed when QEMU exits,
 #                to avoid unnecessarily flushing data to the backing file. Note
 #                that ``discard-data`` is only an optimization, and QEMU might
@@ -655,6 +659,7 @@
 { 'struct': 'MemoryBackendFileProperties',
   'base': 'MemoryBackendProperties',
   'data': { '*align': 'size',
+            '*offset': 'size',
             '*discard-data': 'bool',
             'mem-path': 'str',
             '*pmem': { 'type': 'bool', 'if': 'CONFIG_LIBPMEM' },
diff --git a/qemu-options.hx b/qemu-options.hx
index 59bdf67a2c..fb4eb81af4 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -4859,7 +4859,7 @@ SRST
     they are specified. Note that the 'id' property must be set. These
     objects are placed in the '/objects' path.
 
-    ``-object memory-backend-file,id=id,size=size,mem-path=dir,share=on|off,discard-data=on|off,merge=on|off,dump=on|off,prealloc=on|off,host-nodes=host-nodes,policy=default|preferred|bind|interleave,align=align,readonly=on|off``
+    ``-object memory-backend-file,id=id,size=size,mem-path=dir,share=on|off,discard-data=on|off,merge=on|off,dump=on|off,prealloc=on|off,host-nodes=host-nodes,policy=default|preferred|bind|interleave,align=align,offset=offset,readonly=on|off``
         Creates a memory file backend object, which can be used to back
         the guest RAM with huge pages.
 
@@ -4929,6 +4929,10 @@ SRST
         such cases, users can specify the required alignment via this
         option.
 
+        The ``offset`` option specifies the offset into the target file
+        that the region starts at. You can use this parameter to back
+        multiple regions with a single file.
+
         The ``pmem`` option specifies whether the backing file specified
         by ``mem-path`` is in host persistent memory that can be
         accessed using the SNIA NVM programming model (e.g. Intel
diff --git a/softmmu/memory.c b/softmmu/memory.c
index 5305aca7ca..9f620085a0 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -1601,6 +1601,7 @@ void memory_region_init_ram_from_file(MemoryRegion *mr,
                                       uint64_t align,
                                       uint32_t ram_flags,
                                       const char *path,
+                                      ram_addr_t offset,
                                       bool readonly,
                                       Error **errp)
 {
@@ -1612,7 +1613,7 @@ void memory_region_init_ram_from_file(MemoryRegion *mr,
     mr->destructor = memory_region_destructor_ram;
     mr->align = align;
     mr->ram_block = qemu_ram_alloc_from_file(size, mr, ram_flags, path,
-                                             readonly, &err);
+                                             offset, readonly, &err);
     if (err) {
         mr->size = int128_zero();
         object_unparent(OBJECT(mr));
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 0e0182d9f2..32460d7a3a 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -1369,6 +1369,11 @@ static void *file_ram_alloc(RAMBlock *block,
         error_setg(errp, "alignment 0x%" PRIx64
                    " must be a power of two", block->mr->align);
         return NULL;
+    } else if (offset % block->page_size) {
+        error_setg(errp, "offset 0x%" PRIx64
+                   " must be multiples of page size 0x%zx",
+                   offset, block->page_size);
+        return NULL;
     }
     block->mr->align = MAX(block->page_size, block->mr->align);
 #if defined(__s390x__)
@@ -1400,7 +1405,7 @@ static void *file_ram_alloc(RAMBlock *block,
      * those labels. Therefore, extending the non-empty backend file
      * is disabled as well.
      */
-    if (truncate && ftruncate(fd, memory)) {
+    if (truncate && ftruncate(fd, offset + memory)) {
         perror("ftruncate");
     }
 
@@ -1416,6 +1421,7 @@ static void *file_ram_alloc(RAMBlock *block,
     }
 
     block->fd = fd;
+    block->fd_offset = offset;
     return area;
 }
 #endif
@@ -1889,7 +1895,7 @@ RAMBlock *qemu_ram_alloc_from_fd(ram_addr_t size, MemoryRegion *mr,
 
     size = HOST_PAGE_ALIGN(size);
     file_size = get_file_size(fd);
-    if (file_size > 0 && file_size < size) {
+    if (file_size > offset && file_size < (offset + size)) {
         error_setg(errp, "backing store size 0x%" PRIx64
                    " does not match 'size' option 0x" RAM_ADDR_FMT,
                    file_size, size);
@@ -1929,7 +1935,7 @@ RAMBlock *qemu_ram_alloc_from_fd(ram_addr_t size, MemoryRegion *mr,
 
 RAMBlock *qemu_ram_alloc_from_file(ram_addr_t size, MemoryRegion *mr,
                                    uint32_t ram_flags, const char *mem_path,
-                                   bool readonly, Error **errp)
+                                   off_t offset, bool readonly, Error **errp)
 {
     int fd;
     bool created;
@@ -1941,7 +1947,8 @@ RAMBlock *qemu_ram_alloc_from_file(ram_addr_t size, MemoryRegion *mr,
         return NULL;
     }
 
-    block = qemu_ram_alloc_from_fd(size, mr, ram_flags, fd, 0, readonly, errp);
+    block = qemu_ram_alloc_from_fd(size, mr, ram_flags, fd, offset, readonly,
+                                   errp);
     if (!block) {
         if (created) {
             unlink(mem_path);
@@ -2075,7 +2082,7 @@ void qemu_ram_remap(ram_addr_t addr, ram_addr_t length)
                 flags |= block->flags & RAM_NORESERVE ? MAP_NORESERVE : 0;
                 if (block->fd >= 0) {
                     area = mmap(vaddr, length, PROT_READ | PROT_WRITE,
-                                flags, block->fd, offset);
+                                flags, block->fd, offset + block->fd_offset);
                 } else {
                     flags |= MAP_ANONYMOUS;
                     area = mmap(vaddr, length, PROT_READ | PROT_WRITE,
-- 
2.39.2




Amazon Development Center Germany GmbH
Krausenstr. 38
10117 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
Sitz: Berlin
Ust-ID: DE 289 237 879




