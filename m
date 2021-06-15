Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7893A81AC
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 16:02:57 +0200 (CEST)
Received: from localhost ([::1]:51566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt9ea-0003ws-Gh
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 10:02:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lt9Ho-00064L-SG
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 09:39:25 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:45873)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lt9Hk-0002pb-87
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 09:39:21 -0400
Received: by mail-ej1-x633.google.com with SMTP id k7so22629752ejv.12
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 06:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Bp5DsEozRLdC1rdlEukZgjqBm7Ifa5wIv6NCq/QVsYM=;
 b=FmiebxdmEXJZfLOFYc6XA/dKy/Ov+HcI3u0U7OUCLMgrmJppOhcfx249GWJZ4WTFVk
 KriEJ/v18PJgM6S71xLwEQ/3mTjp72CKdxRod82bYkJeY/1qrNvWO6sSBQy4JY+Gomuf
 DJ2uRZmTdklICbFjKOeXYhDKTfy1AZNNiHmHM6VIn6NbkcBLvoUHDVlcTJvEhwntTZSi
 UvgB/wJTJnuPr3lE/n04h2f6AfzXQDbqibCxwGTSgqDaU9twYjVwSeEws8slTf9p5NDk
 3NwChbfbZ849cWrGy2gVAP2zJKEEBTYLR+0D55QEviOwoATqj61pRDicYVaeUOcqF6ve
 y71w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Bp5DsEozRLdC1rdlEukZgjqBm7Ifa5wIv6NCq/QVsYM=;
 b=MPGIqJNsM3VZ21uC/YjknfSycFdUg1LDeTlnP1k4waLVgAIUdrdnaMKHWuCW8OntcS
 9QLgJhyGPdRo8ugyQlTYJ6xypOY1/VAd5JRGP/Fzc5lsZ/n3FHgTvbdZVF0vAihYBH7D
 ZYcuni2iIhdXtbdt2nKWCVfk4Q3iUa6VmNKKweeYingVih1ScajuByYt5olHdyYQ3YGq
 V49OzMgSY3AqtjX33+c/KDp065olPlQRcAHliuNqnngoj+0cFBwdjdx/8D/+ElMT+ex8
 9AL7JMlnU1EUALCbKsgWtKjpbIvCBflOTkJ3M5l8tSwsvCtAAHqYdyTWvnlC5yVlDEkf
 FgIQ==
X-Gm-Message-State: AOAM53298LKiUyd9ndGoOshqPEq+4QjU0UALAEGOvqVsPSpkbfBN2DWP
 SKdzqJ8TgaW1+cbCCwY2LaXOFefzLjU=
X-Google-Smtp-Source: ABdhPJwjK5/ojiIXLOnUA8Hyswvb5cz469w9Mnbuo6Na+NQXmwXcIO9thkcGtBuJ2H3eqGQ3ux3B0g==
X-Received: by 2002:a17:906:d15a:: with SMTP id
 br26mr21369843ejb.232.1623764359003; 
 Tue, 15 Jun 2021 06:39:19 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id r17sm11843769edt.33.2021.06.15.06.39.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 06:39:18 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 23/33] softmmu/memory: Pass ram_flags to qemu_ram_alloc() and
 qemu_ram_alloc_internal()
Date: Tue, 15 Jun 2021 15:38:45 +0200
Message-Id: <20210615133855.775687-24-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210615133855.775687-1-pbonzini@redhat.com>
References: <20210615133855.775687-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x633.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
index 2f106d0680..f7adf544df 100644
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



