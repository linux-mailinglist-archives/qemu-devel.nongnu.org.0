Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E5F31513A
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 15:09:09 +0100 (CET)
Received: from localhost ([::1]:56936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9ThU-00081e-9G
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 09:09:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1l9TQ0-0002oB-PE
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 08:51:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39386)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1l9TPy-0005UR-JW
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 08:51:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612878661;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=53s9yP4lYRthBOpBWNhmIiqPLupUiRmbgD5MW0TbNXA=;
 b=dzLs3RG5C/lR34OkZPfdjN7Ppn527pnD3oVG6elQOsQkCno4XSMUDPQTnotUgoJ9QdVXIM
 SMbnWf4qYzoAG5EGsr812+jVawpfqOJ3OkNG7EFV+JI+M3IxN6GJpHn2KPv3TprTc2IjN2
 zKZQivmCZI1MZ0hQS0umecEsWdOVKZc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-474-vMDOHkDJP_C9BEEKKpoFbw-1; Tue, 09 Feb 2021 08:50:58 -0500
X-MC-Unique: vMDOHkDJP_C9BEEKKpoFbw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 842781005501;
 Tue,  9 Feb 2021 13:50:56 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-113-141.ams2.redhat.com [10.36.113.141])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A75316F971;
 Tue,  9 Feb 2021 13:50:49 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 6/9] softmmu/memory: pass ram_flags into
 memory_region_init_ram_shared_nomigrate()
Date: Tue,  9 Feb 2021 14:49:36 +0100
Message-Id: <20210209134939.13083-7-david@redhat.com>
In-Reply-To: <20210209134939.13083-1-david@redhat.com>
References: <20210209134939.13083-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
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
Cc: Juan Quintela <quintela@redhat.com>,
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
 Igor Kotrasinski <i.kotrasinsk@partner.samsung.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let's forward ram_flags instead, renaming
memory_region_init_ram_shared_nomigrate() into
memory_region_init_ram_flags_nomigrate(). Forward flags to
qemu_ram_alloc() and qemu_ram_alloc_internal().

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 backends/hostmem-ram.c                        |  6 +++--
 hw/m68k/next-cube.c                           |  4 ++--
 include/exec/memory.h                         | 24 +++++++++----------
 include/exec/ram_addr.h                       |  2 +-
 .../memory-region-housekeeping.cocci          |  8 +++----
 softmmu/memory.c                              | 20 ++++++++--------
 softmmu/physmem.c                             | 24 ++++++++-----------
 7 files changed, 43 insertions(+), 45 deletions(-)

diff --git a/backends/hostmem-ram.c b/backends/hostmem-ram.c
index 5cc53e76c9..741e701062 100644
--- a/backends/hostmem-ram.c
+++ b/backends/hostmem-ram.c
@@ -19,6 +19,7 @@
 static void
 ram_backend_memory_alloc(HostMemoryBackend *backend, Error **errp)
 {
+    uint32_t ram_flags;
     char *name;
 
     if (!backend->size) {
@@ -27,8 +28,9 @@ ram_backend_memory_alloc(HostMemoryBackend *backend, Error **errp)
     }
 
     name = host_memory_backend_get_name(backend);
-    memory_region_init_ram_shared_nomigrate(&backend->mr, OBJECT(backend), name,
-                           backend->size, backend->share, errp);
+    ram_flags = backend->share ? RAM_SHARED : 0;
+    memory_region_init_ram_flags_nomigrate(&backend->mr, OBJECT(backend), name,
+                                           backend->size, ram_flags, errp);
     g_free(name);
 }
 
diff --git a/hw/m68k/next-cube.c b/hw/m68k/next-cube.c
index 92b45d760f..59ccae0d5e 100644
--- a/hw/m68k/next-cube.c
+++ b/hw/m68k/next-cube.c
@@ -986,8 +986,8 @@ static void next_cube_init(MachineState *machine)
     sysbus_mmio_map(SYS_BUS_DEVICE(pcdev), 1, 0x02100000);
 
     /* BMAP memory */
-    memory_region_init_ram_shared_nomigrate(bmapm1, NULL, "next.bmapmem", 64,
-                                            true, &error_fatal);
+    memory_region_init_ram_flags_nomigrate(bmapm1, NULL, "next.bmapmem", 64,
+                                           RAM_SHARED, &error_fatal);
     memory_region_add_subregion(sysmem, 0x020c0000, bmapm1);
     /* The Rev_2.5_v66.bin firmware accesses it at 0x820c0020, too */
     memory_region_init_alias(bmapm2, NULL, "next.bmapmem2", bmapm1, 0x0, 64);
diff --git a/include/exec/memory.h b/include/exec/memory.h
index 7b635b334f..7d2db168c7 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -906,27 +906,27 @@ void memory_region_init_ram_nomigrate(MemoryRegion *mr,
                                       Error **errp);
 
 /**
- * memory_region_init_ram_shared_nomigrate:  Initialize RAM memory region.
- *                                           Accesses into the region will
- *                                           modify memory directly.
+ * memory_region_init_ram_flags_nomigrate:  Initialize RAM memory region.
+ *                                          Accesses into the region will
+ *                                          modify memory directly.
  *
  * @mr: the #MemoryRegion to be initialized.
  * @owner: the object that tracks the region's reference count
  * @name: Region name, becomes part of RAMBlock name used in migration stream
  *        must be unique within any device
  * @size: size of the region.
- * @share: allow remapping RAM to different addresses
+ * @ram_flags: RamBlock flags. Supported flags: RAM_SHARED.
  * @errp: pointer to Error*, to store an error if it happens.
  *
- * Note that this function is similar to memory_region_init_ram_nomigrate.
- * The only difference is part of the RAM region can be remapped.
+ * Note that this function does not do anything to cause the data in the
+ * RAM memory region to be migrated; that is the responsibility of the caller.
  */
-void memory_region_init_ram_shared_nomigrate(MemoryRegion *mr,
-                                             struct Object *owner,
-                                             const char *name,
-                                             uint64_t size,
-                                             bool share,
-                                             Error **errp);
+void memory_region_init_ram_flags_nomigrate(MemoryRegion *mr,
+                                            struct Object *owner,
+                                            const char *name,
+                                            uint64_t size,
+                                            uint32_t ram_flags,
+                                            Error **errp);
 
 /**
  * memory_region_init_resizeable_ram:  Initialize memory region with resizeable
diff --git a/include/exec/ram_addr.h b/include/exec/ram_addr.h
index 86fa712134..ce9e140c54 100644
--- a/include/exec/ram_addr.h
+++ b/include/exec/ram_addr.h
@@ -122,7 +122,7 @@ RAMBlock *qemu_ram_alloc_from_fd(ram_addr_t size, MemoryRegion *mr,
 
 RAMBlock *qemu_ram_alloc_from_ptr(ram_addr_t size, void *host,
                                   MemoryRegion *mr, Error **errp);
-RAMBlock *qemu_ram_alloc(ram_addr_t size, bool share, MemoryRegion *mr,
+RAMBlock *qemu_ram_alloc(ram_addr_t size, uint32_t ram_flags, MemoryRegion *mr,
                          Error **errp);
 RAMBlock *qemu_ram_alloc_resizeable(ram_addr_t size, ram_addr_t max_size,
                                     void (*resized)(const char*,
diff --git a/scripts/coccinelle/memory-region-housekeeping.cocci b/scripts/coccinelle/memory-region-housekeeping.cocci
index c768d8140a..29651ebde9 100644
--- a/scripts/coccinelle/memory-region-housekeeping.cocci
+++ b/scripts/coccinelle/memory-region-housekeeping.cocci
@@ -127,8 +127,8 @@ static void device_fn(DeviceState *dev, ...)
 - memory_region_init_rom(E1, NULL, E2, E3, E4);
 + memory_region_init_rom(E1, obj, E2, E3, E4);
 |
-- memory_region_init_ram_shared_nomigrate(E1, NULL, E2, E3, E4, E5);
-+ memory_region_init_ram_shared_nomigrate(E1, obj, E2, E3, E4, E5);
+- memory_region_init_ram_flags_nomigrate(E1, NULL, E2, E3, E4, E5);
++ memory_region_init_ram_flags_nomigrate(E1, obj, E2, E3, E4, E5);
 )
   ...+>
 }
@@ -152,8 +152,8 @@ static void device_fn(DeviceState *dev, ...)
 - memory_region_init_rom(E1, NULL, E2, E3, E4);
 + memory_region_init_rom(E1, OBJECT(dev), E2, E3, E4);
 |
-- memory_region_init_ram_shared_nomigrate(E1, NULL, E2, E3, E4, E5);
-+ memory_region_init_ram_shared_nomigrate(E1, OBJECT(dev), E2, E3, E4, E5);
+- memory_region_init_ram_flags_nomigrate(E1, NULL, E2, E3, E4, E5);
++ memory_region_init_ram_flags_nomigrate(E1, OBJECT(dev), E2, E3, E4, E5);
 )
   ...+>
 }
diff --git a/softmmu/memory.c b/softmmu/memory.c
index 25120ecae7..78c9dd6d5e 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -1532,22 +1532,22 @@ void memory_region_init_ram_nomigrate(MemoryRegion *mr,
                                       uint64_t size,
                                       Error **errp)
 {
-    memory_region_init_ram_shared_nomigrate(mr, owner, name, size, false, errp);
+    memory_region_init_ram_flags_nomigrate(mr, owner, name, size, 0, errp);
 }
 
-void memory_region_init_ram_shared_nomigrate(MemoryRegion *mr,
-                                             Object *owner,
-                                             const char *name,
-                                             uint64_t size,
-                                             bool share,
-                                             Error **errp)
+void memory_region_init_ram_flags_nomigrate(MemoryRegion *mr,
+                                            Object *owner,
+                                            const char *name,
+                                            uint64_t size,
+                                            uint32_t ram_flags,
+                                            Error **errp)
 {
     Error *err = NULL;
     memory_region_init(mr, owner, name, size);
     mr->ram = true;
     mr->terminates = true;
     mr->destructor = memory_region_destructor_ram;
-    mr->ram_block = qemu_ram_alloc(size, share, mr, &err);
+    mr->ram_block = qemu_ram_alloc(size, ram_flags, mr, &err);
     if (err) {
         mr->size = int128_zero();
         object_unparent(OBJECT(mr));
@@ -1682,7 +1682,7 @@ void memory_region_init_rom_nomigrate(MemoryRegion *mr,
                                       uint64_t size,
                                       Error **errp)
 {
-    memory_region_init_ram_shared_nomigrate(mr, owner, name, size, false, errp);
+    memory_region_init_ram_flags_nomigrate(mr, owner, name, size, 0, errp);
     mr->readonly = true;
 }
 
@@ -1702,7 +1702,7 @@ void memory_region_init_rom_device_nomigrate(MemoryRegion *mr,
     mr->terminates = true;
     mr->rom_device = true;
     mr->destructor = memory_region_destructor_ram;
-    mr->ram_block = qemu_ram_alloc(size, false,  mr, &err);
+    mr->ram_block = qemu_ram_alloc(size, 0, mr, &err);
     if (err) {
         mr->size = int128_zero();
         object_unparent(OBJECT(mr));
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 6b6c3be605..2243e2a87a 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -2129,12 +2129,14 @@ RAMBlock *qemu_ram_alloc_internal(ram_addr_t size, ram_addr_t max_size,
                                   void (*resized)(const char*,
                                                   uint64_t length,
                                                   void *host),
-                                  void *host, bool resizeable, bool share,
+                                  void *host, uint32_t ram_flags,
                                   MemoryRegion *mr, Error **errp)
 {
     RAMBlock *new_block;
     Error *local_err = NULL;
 
+    assert((ram_flags & ~(RAM_SHARED | RAM_RESIZEABLE)) == 0);
+
     size = HOST_PAGE_ALIGN(size);
     max_size = HOST_PAGE_ALIGN(max_size);
     new_block = g_malloc0(sizeof(*new_block));
@@ -2146,15 +2148,10 @@ RAMBlock *qemu_ram_alloc_internal(ram_addr_t size, ram_addr_t max_size,
     new_block->fd = -1;
     new_block->page_size = qemu_real_host_page_size;
     new_block->host = host;
+    new_block->flags = ram_flags;
     if (host) {
         new_block->flags |= RAM_PREALLOC;
     }
-    if (share) {
-        new_block->flags |= RAM_SHARED;
-    }
-    if (resizeable) {
-        new_block->flags |= RAM_RESIZEABLE;
-    }
     ram_block_add(new_block, &local_err);
     if (local_err) {
         g_free(new_block);
@@ -2167,15 +2164,14 @@ RAMBlock *qemu_ram_alloc_internal(ram_addr_t size, ram_addr_t max_size,
 RAMBlock *qemu_ram_alloc_from_ptr(ram_addr_t size, void *host,
                                    MemoryRegion *mr, Error **errp)
 {
-    return qemu_ram_alloc_internal(size, size, NULL, host, false,
-                                   false, mr, errp);
+    return qemu_ram_alloc_internal(size, size, NULL, host, 0, mr, errp);
 }
 
-RAMBlock *qemu_ram_alloc(ram_addr_t size, bool share,
+RAMBlock *qemu_ram_alloc(ram_addr_t size, uint32_t ram_flags,
                          MemoryRegion *mr, Error **errp)
 {
-    return qemu_ram_alloc_internal(size, size, NULL, NULL, false,
-                                   share, mr, errp);
+    assert((ram_flags & ~RAM_SHARED) == 0);
+    return qemu_ram_alloc_internal(size, size, NULL, NULL, ram_flags, mr, errp);
 }
 
 RAMBlock *qemu_ram_alloc_resizeable(ram_addr_t size, ram_addr_t maxsz,
@@ -2184,8 +2180,8 @@ RAMBlock *qemu_ram_alloc_resizeable(ram_addr_t size, ram_addr_t maxsz,
                                                      void *host),
                                      MemoryRegion *mr, Error **errp)
 {
-    return qemu_ram_alloc_internal(size, maxsz, resized, NULL, true,
-                                   false, mr, errp);
+    return qemu_ram_alloc_internal(size, maxsz, resized, NULL,
+                                   RAM_RESIZEABLE, mr, errp);
 }
 
 static void reclaim_ramblock(RAMBlock *block)
-- 
2.29.2


