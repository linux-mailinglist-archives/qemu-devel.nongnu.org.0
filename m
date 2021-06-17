Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74ED43AB00A
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 11:45:08 +0200 (CEST)
Received: from localhost ([::1]:50348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltoaB-0007DN-GB
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 05:45:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ltoNR-0002ra-5w
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 05:31:58 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:38899)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ltoNO-0006Cg-Nq
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 05:31:56 -0400
Received: by mail-ed1-x529.google.com with SMTP id t7so3047392edd.5
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 02:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YMm+chGMuEmvwUOD656u7hYjmYt4rPQiwOfC+Eir/mc=;
 b=JYTxUEgSplGZy/0CFjEJzFB97DeABZjD9i05RTj8h9Fp48nOM5QGubUhP2CEsQa8L+
 dGJgzepz8QlCGtMuuPE1RLkkCa0f7fWiAJAnJvhzrpOtx3PcMgLVMKschIdNtCVwsUcT
 E4viKqGYyfYyPLvShQY3zf4PvSGA8rZR7Movuqq7h0uqSKyb/4+jgORPbTuVgVlh2HEj
 sIRKKJf6zmH9axCUL1YVlENoOs8aMcAMQ8er9I9SC7vkI5HSrtsVzXCjk3TxzQypPx9u
 FGnb92DCLqixMg/97khp++vZ89ecYzfiejhV0yevDJY+OHXHkon8jYIWbBR9PQORURJJ
 dzzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=YMm+chGMuEmvwUOD656u7hYjmYt4rPQiwOfC+Eir/mc=;
 b=IW3Ep8g9WiZdmAoI6YIMXgjVEJgsKI8GV8gcFWhxLLJrGqCiFWgbYJ0x4VS6bsDYlH
 6Fju1mpA6II1bqnEn3ALfmpu3MAEJhidTwQlhBx446ILy7JH24OJ+HzgnkHwmu1g1gFw
 mdAEtWQpbtw+ExOEGpQ60e/obUWXOva3AN7GwOBxz7D86BsOiPZNjIxqddGdAEvfJ91l
 Rt+DJM6TMonrZHtFz7nhi0frbwGVCdVZus2KBFwKOGD4XzRx9HIZYeRRZ/dEJvLpkimR
 EqjNHZWjgsyTBVydspFU6QzA4bZ52XzBoYXCc0flqOKWg8PhiRnd57r3NI7UGQl0CSqF
 qNHQ==
X-Gm-Message-State: AOAM530Et4LtnZ5e69MdFr0k33m6G7KAgxystYt8TpASM3058u9ErnPP
 IIZ5k3Koa1GcnlfMRWzxbvya5EhG5BI=
X-Google-Smtp-Source: ABdhPJwKpKHBBIxVYkuKKBiU0frMaLpRGPI/2ucd/5tOauXH9P/4sHqqWJ7gWwafbEvr4W7IXT8guQ==
X-Received: by 2002:a05:6402:4c:: with SMTP id
 f12mr5383635edu.84.1623922311449; 
 Thu, 17 Jun 2021 02:31:51 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m18sm3328140ejx.56.2021.06.17.02.31.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 02:31:50 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 22/45] softmmu/memory: Pass ram_flags to
 memory_region_init_ram_shared_nomigrate()
Date: Thu, 17 Jun 2021 11:31:11 +0200
Message-Id: <20210617093134.900014-23-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210617093134.900014-1-pbonzini@redhat.com>
References: <20210617093134.900014-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x529.google.com
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

Let's forward ram_flags instead, renaming
memory_region_init_ram_shared_nomigrate() into
memory_region_init_ram_flags_nomigrate().

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
Acked-by: Eduardo Habkost <ehabkost@redhat.com> for memory backend and machine core
Signed-off-by: David Hildenbrand <david@redhat.com>
Message-Id: <20210510114328.21835-6-david@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
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
index 8aa69a10d7..b1f8fa1df0 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -940,27 +940,27 @@ void memory_region_init_ram_nomigrate(MemoryRegion *mr,
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
index f777504ac5..5c0ff76c06 100644
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
2.31.1



