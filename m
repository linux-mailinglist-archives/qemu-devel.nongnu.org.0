Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F36493788F7
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 13:49:46 +0200 (CEST)
Received: from localhost ([::1]:55754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg4Py-0000V5-2P
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 07:49:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lg4Kb-0000Kv-EF
 for qemu-devel@nongnu.org; Mon, 10 May 2021 07:44:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lg4KY-0003h6-1i
 for qemu-devel@nongnu.org; Mon, 10 May 2021 07:44:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620647049;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=icjc+emxQgamcTnGwGmD5ldPMwyUSfjztoslpNOGJKk=;
 b=CCNiGAu5CrdSrGIV17v++bj3NTuwcmtpzoFF6ByUKXKUWgtnhkMQu0GfV7luvUgsRUUDdr
 GqURMA9kbrteKm8tlcGw/BRBeoGZkmMLuEAdz7qoTELQYPyybIA+lJwrjyXhNNd5FybmaZ
 rg05zw3tyIWVwwJGes0YfBOOd8YevhA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-370-yljr25nYNlSy7gi8Vhe3Gw-1; Mon, 10 May 2021 07:44:07 -0400
X-MC-Unique: yljr25nYNlSy7gi8Vhe3Gw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 12781107ACC7
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 11:44:07 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-114-137.ams2.redhat.com [10.36.114.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AB3821037F20;
 Mon, 10 May 2021 11:44:05 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 05/15] softmmu/memory: Pass ram_flags to
 memory_region_init_ram_shared_nomigrate()
Date: Mon, 10 May 2021 13:43:18 +0200
Message-Id: <20210510114328.21835-6-david@redhat.com>
In-Reply-To: <20210510114328.21835-1-david@redhat.com>
References: <20210510114328.21835-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let's forward ram_flags instead, renaming
memory_region_init_ram_shared_nomigrate() into
memory_region_init_ram_flags_nomigrate().

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
Acked-by: Eduardo Habkost <ehabkost@redhat.com> for memory backend and machine core
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 backends/hostmem-ram.c                        |  6 +++--
 hw/m68k/next-cube.c                           |  4 ++--
 include/exec/memory.h                         | 24 +++++++++----------
 .../memory-region-housekeeping.cocci          |  8 +++----
 softmmu/memory.c                              | 18 +++++++-------
 5 files changed, 31 insertions(+), 29 deletions(-)

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
index de951ffe5d..e0d4a94f9d 100644
--- a/hw/m68k/next-cube.c
+++ b/hw/m68k/next-cube.c
@@ -984,8 +984,8 @@ static void next_cube_init(MachineState *machine)
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
index 8ad280e532..10179c6695 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -928,27 +928,27 @@ void memory_region_init_ram_nomigrate(MemoryRegion *mr,
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
-                                             Object *owner,
-                                             const char *name,
-                                             uint64_t size,
-                                             bool share,
-                                             Error **errp);
+void memory_region_init_ram_flags_nomigrate(MemoryRegion *mr,
+                                            Object *owner,
+                                            const char *name,
+                                            uint64_t size,
+                                            uint32_t ram_flags,
+                                            Error **errp);
 
 /**
  * memory_region_init_resizeable_ram:  Initialize memory region with resizeable
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
index 7501c5e767..27b17a7c99 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -1531,22 +1531,22 @@ void memory_region_init_ram_nomigrate(MemoryRegion *mr,
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
+    mr->ram_block = qemu_ram_alloc(size, ram_flags & RAM_SHARED, mr, &err);
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
 
-- 
2.30.2


