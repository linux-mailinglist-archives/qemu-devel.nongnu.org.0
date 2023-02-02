Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9003F688A17
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 23:57:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNiVE-0000uQ-0K; Thu, 02 Feb 2023 17:56:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=3906e7c96=graf@amazon.de>)
 id 1pNiVA-0000pX-R6
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 17:56:21 -0500
Received: from smtp-fw-80007.amazon.com ([99.78.197.218])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=3906e7c96=graf@amazon.de>)
 id 1pNiV7-0005nl-TG
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 17:56:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1675378578; x=1706914578;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mbVrwpUyO3CVy3+BtGgMlMhdgUsqTZ07GVSHXz1vros=;
 b=HS/yPBEBCzqgKsQeEdUfeliX/dPP77+bfO25B7rSj1SeIgQMmdJoNCLm
 4GLja9a868sk36dszj9v5mCrKvnS5OxWfq/wfRi72iA/skbMMJoQkcZir
 Wz3F3l73gfks7LIjlo9t1QEIqQbe3Zcr3tStMXWTJQZjYL5MYiq9lGydT s=;
X-IronPort-AV: E=Sophos;i="5.97,268,1669075200"; d="scan'208";a="177927177"
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO
 email-inbound-relay-iad-1e-m6i4x-7dc0ecf1.us-east-1.amazon.com)
 ([10.25.36.214]) by smtp-border-fw-80007.pdx80.corp.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2023 22:56:11 +0000
Received: from EX13MTAUWC001.ant.amazon.com
 (iad12-ws-svc-p26-lb9-vlan2.iad.amazon.com [10.40.163.34])
 by email-inbound-relay-iad-1e-m6i4x-7dc0ecf1.us-east-1.amazon.com (Postfix)
 with ESMTPS id 5214182740; Thu,  2 Feb 2023 22:56:07 +0000 (UTC)
Received: from EX19D020UWC004.ant.amazon.com (10.13.138.149) by
 EX13MTAUWC001.ant.amazon.com (10.43.162.135) with Microsoft SMTP Server (TLS)
 id 15.0.1497.45; Thu, 2 Feb 2023 22:56:06 +0000
Received: from dev-dsk-graf-1a-5ce218e4.eu-west-1.amazon.com (10.43.160.120)
 by EX19D020UWC004.ant.amazon.com (10.13.138.149) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1118.24; Thu, 2 Feb 2023 22:56:04 +0000
From: Alexander Graf <graf@amazon.com>
To: <qemu-devel@nongnu.org>
CC: Eduardo Habkost <eduardo@habkost.net>, "Daniel P . Berrange"
 <berrange@redhat.com>, Markus Armbruster <armbru@redhat.com>, Eric Blake
 <eblake@redhat.com>, Philippe Mathieu-Daude <philmd@linaro.org>, Peter Xu
 <peterx@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov
 <imammedo@redhat.com>, David Hildenbrand <david@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Ashish Kalra <ashish.kalra@amd.com>
Subject: [PATCH] hostmem-file: add offset option
Date: Thu, 2 Feb 2023 22:56:03 +0000
Message-ID: <20230202225603.27559-1-graf@amazon.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-Originating-IP: [10.43.160.120]
X-ClientProxiedBy: EX13D39UWA002.ant.amazon.com (10.43.160.20) To
 EX19D020UWC004.ant.amazon.com (10.13.138.149)
Precedence: Bulk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=99.78.197.218;
 envelope-from=prvs=3906e7c96=graf@amazon.de; helo=smtp-fw-80007.amazon.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Signed-off-by: Alexander Graf <graf@amazon.com>
---
 backends/hostmem-file.c | 40 +++++++++++++++++++++++++++++++++++++++-
 include/exec/memory.h   |  2 ++
 include/exec/ram_addr.h |  3 ++-
 qapi/qom.json           |  1 +
 qemu-options.hx         |  6 +++++-
 softmmu/memory.c        |  3 ++-
 softmmu/physmem.c       |  5 +++--
 7 files changed, 54 insertions(+), 6 deletions(-)

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
diff --git a/include/exec/memory.h b/include/exec/memory.h
index 2e602a2fad..bd67198111 100644
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
diff --git a/qapi/qom.json b/qapi/qom.json
index 30e76653ad..d4e16c57a3 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -649,6 +649,7 @@
 { 'struct': 'MemoryBackendFileProperties',
   'base': 'MemoryBackendProperties',
   'data': { '*align': 'size',
+            '*offset': 'size',
             '*discard-data': 'bool',
             'mem-path': 'str',
             '*pmem': { 'type': 'bool', 'if': 'CONFIG_LIBPMEM' },
diff --git a/qemu-options.hx b/qemu-options.hx
index d59d19704b..2f12a9299e 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -4875,7 +4875,7 @@ SRST
     they are specified. Note that the 'id' property must be set. These
     objects are placed in the '/objects' path.
 
-    ``-object memory-backend-file,id=id,size=size,mem-path=dir,share=on|off,discard-data=on|off,merge=on|off,dump=on|off,prealloc=on|off,host-nodes=host-nodes,policy=default|preferred|bind|interleave,align=align,readonly=on|off``
+    ``-object memory-backend-file,id=id,size=size,mem-path=dir,share=on|off,discard-data=on|off,merge=on|off,dump=on|off,prealloc=on|off,host-nodes=host-nodes,policy=default|preferred|bind|interleave,align=align,offset=offset,readonly=on|off``
         Creates a memory file backend object, which can be used to back
         the guest RAM with huge pages.
 
@@ -4945,6 +4945,10 @@ SRST
         such cases, users can specify the required alignment via this
         option.
 
+        The ``offset`` option specifies the offset into the target file
+        that the region starts at. You can use this parameter to overload
+        multiple regions into a single file.
+
         The ``pmem`` option specifies whether the backing file specified
         by ``mem-path`` is in host persistent memory that can be
         accessed using the SNIA NVM programming model (e.g. Intel
diff --git a/softmmu/memory.c b/softmmu/memory.c
index 9d64efca26..c9bdebcdf4 100644
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
index cb998cdf23..d5a6a0553f 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -2114,7 +2114,7 @@ RAMBlock *qemu_ram_alloc_from_fd(ram_addr_t size, MemoryRegion *mr,
 
 RAMBlock *qemu_ram_alloc_from_file(ram_addr_t size, MemoryRegion *mr,
                                    uint32_t ram_flags, const char *mem_path,
-                                   bool readonly, Error **errp)
+                                   off_t offset, bool readonly, Error **errp)
 {
     int fd;
     bool created;
@@ -2126,7 +2126,8 @@ RAMBlock *qemu_ram_alloc_from_file(ram_addr_t size, MemoryRegion *mr,
         return NULL;
     }
 
-    block = qemu_ram_alloc_from_fd(size, mr, ram_flags, fd, 0, readonly, errp);
+    block = qemu_ram_alloc_from_fd(size, mr, ram_flags, fd, offset, readonly,
+                                   errp);
     if (!block) {
         if (created) {
             unlink(mem_path);
-- 
2.38.1




Amazon Development Center Germany GmbH
Krausenstr. 38
10117 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
Sitz: Berlin
Ust-ID: DE 289 237 879




