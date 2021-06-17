Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89A803AAFFC
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 11:42:39 +0200 (CEST)
Received: from localhost ([::1]:40712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltoXm-0000pm-AO
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 05:42:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ltoNT-0002tP-8d
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 05:31:59 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:44745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ltoNO-0006Cm-OQ
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 05:31:58 -0400
Received: by mail-ed1-x530.google.com with SMTP id u24so3018702edy.11
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 02:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FX5w3RkTBMk4kaoFI+sw3zf8MxzufRUDXXzqaE5j/1g=;
 b=M6amcrEgnFymbylavUYXAl+t871TVZacUnEE3jNnZV+z0SYv5QieKnGOo/GSNv8yYY
 P3o8Hm8uTsoFCK6zqsudB5iU6EI0NQf9HkIfG5INtBA2SbcYOJp1eTzDOR16vLErlMEX
 I9/Ati/itgWy8IivGYwXxdbN1AgtVXfI2y5aFLonEOcPBVHX1dMxokd97/dfqg7+bjvi
 31ULT3+KesE52vdNH0U+szTrGTVAAqdAPgb41VIFlDD7zoMA+X/yzyleyntokebFh5cw
 aYrV1c6gnwoi4ZQULif0vxThw+uAsS3Yr4WBBFLJ6VDqmP0ySvnlodfnt67+xGi0U5VY
 nA4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=FX5w3RkTBMk4kaoFI+sw3zf8MxzufRUDXXzqaE5j/1g=;
 b=oAUWmWpbRL2nwXocDl8oFPLgYKNPeKg+2MAFGh3d2u8y8JLpzMX3sqeXKc2ZP/nN+X
 AadhAHJSenTXn5I+dXyRwaswxy13GgwMVbexBUNgqKzabLf3YDLXUQW+abYWpvkPpcl0
 i/PSvRp5r7L3GF35j3eEFXQikSPaKdT/VH4fS7jZzeFUmPkHF2SVBXzjrz8NUbuxLDoO
 ilqow+w2xqVsKuWVkZoULaIMRFYKzvpRNeevb7FWzrsBC/N0KW4NF0V2WSp5VCADH6p0
 /v/uHfcW1gbmfLjEPrCVvFlUiiT+pINw27LAOoMZrJlkx4VtB3hkP1+SjG2Zu3jS1Wp2
 0dPg==
X-Gm-Message-State: AOAM533qRYk6S4sZWViR07CUjEX1ETmPmOGg2kMpgcd2SRsVl/E3KVdV
 Ex5J7UaNFo92YSM/btP8NPILltsej+E=
X-Google-Smtp-Source: ABdhPJwTozhipwUnHpG4EMQcqX9ZRZK5iu9/TktZIn3WimFQXOIa/Y9XO0h0HsnI7yTValAATBUhog==
X-Received: by 2002:a05:6402:4255:: with SMTP id
 g21mr5251143edb.103.1623922312208; 
 Thu, 17 Jun 2021 02:31:52 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m18sm3328140ejx.56.2021.06.17.02.31.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 02:31:51 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 23/45] softmmu/memory: Pass ram_flags to qemu_ram_alloc() and
 qemu_ram_alloc_internal()
Date: Thu, 17 Jun 2021 11:31:12 +0200
Message-Id: <20210617093134.900014-24-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210617093134.900014-1-pbonzini@redhat.com>
References: <20210617093134.900014-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x530.google.com
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
 Eduardo Habkost <ehabkost@redhat.com>, David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Hildenbrand <david@redhat.com>

Let's pass ram_flags to qemu_ram_alloc() and qemu_ram_alloc_internal(),
preparing for passing additional flags.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Acked-by: Eduardo Habkost <ehabkost@redhat.com> for memory backend and machine core
Signed-off-by: David Hildenbrand <david@redhat.com>
Message-Id: <20210510114328.21835-7-david@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/exec/ram_addr.h |  2 +-
 softmmu/memory.c        |  4 ++--
 softmmu/physmem.c       | 29 ++++++++++++-----------------
 3 files changed, 15 insertions(+), 20 deletions(-)

diff --git a/include/exec/ram_addr.h b/include/exec/ram_addr.h
index a7e3378340..6d4513f8e2 100644
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
diff --git a/softmmu/memory.c b/softmmu/memory.c
index 5c0ff76c06..f0161515e9 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -1546,7 +1546,7 @@ void memory_region_init_ram_flags_nomigrate(MemoryRegion *mr,
     mr->ram = true;
     mr->terminates = true;
     mr->destructor = memory_region_destructor_ram;
-    mr->ram_block = qemu_ram_alloc(size, ram_flags & RAM_SHARED, mr, &err);
+    mr->ram_block = qemu_ram_alloc(size, ram_flags, mr, &err);
     if (err) {
         mr->size = int128_zero();
         object_unparent(OBJECT(mr));
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
index b75d205e8a..f00304e254 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -2128,12 +2128,15 @@ RAMBlock *qemu_ram_alloc_internal(ram_addr_t size, ram_addr_t max_size,
                                   void (*resized)(const char*,
                                                   uint64_t length,
                                                   void *host),
-                                  void *host, bool resizeable, bool share,
+                                  void *host, uint32_t ram_flags,
                                   MemoryRegion *mr, Error **errp)
 {
     RAMBlock *new_block;
     Error *local_err = NULL;
 
+    assert((ram_flags & ~(RAM_SHARED | RAM_RESIZEABLE | RAM_PREALLOC)) == 0);
+    assert(!host ^ (ram_flags & RAM_PREALLOC));
+
     size = HOST_PAGE_ALIGN(size);
     max_size = HOST_PAGE_ALIGN(max_size);
     new_block = g_malloc0(sizeof(*new_block));
@@ -2145,15 +2148,7 @@ RAMBlock *qemu_ram_alloc_internal(ram_addr_t size, ram_addr_t max_size,
     new_block->fd = -1;
     new_block->page_size = qemu_real_host_page_size;
     new_block->host = host;
-    if (host) {
-        new_block->flags |= RAM_PREALLOC;
-    }
-    if (share) {
-        new_block->flags |= RAM_SHARED;
-    }
-    if (resizeable) {
-        new_block->flags |= RAM_RESIZEABLE;
-    }
+    new_block->flags = ram_flags;
     ram_block_add(new_block, &local_err);
     if (local_err) {
         g_free(new_block);
@@ -2166,15 +2161,15 @@ RAMBlock *qemu_ram_alloc_internal(ram_addr_t size, ram_addr_t max_size,
 RAMBlock *qemu_ram_alloc_from_ptr(ram_addr_t size, void *host,
                                    MemoryRegion *mr, Error **errp)
 {
-    return qemu_ram_alloc_internal(size, size, NULL, host, false,
-                                   false, mr, errp);
+    return qemu_ram_alloc_internal(size, size, NULL, host, RAM_PREALLOC, mr,
+                                   errp);
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
@@ -2183,8 +2178,8 @@ RAMBlock *qemu_ram_alloc_resizeable(ram_addr_t size, ram_addr_t maxsz,
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
2.31.1



