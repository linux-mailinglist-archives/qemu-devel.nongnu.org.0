Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F7C3511FA
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 11:25:55 +0200 (CEST)
Received: from localhost ([::1]:47884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRtaM-0002DE-Aa
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 05:25:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lRtX8-0006qX-O4
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 05:22:39 -0400
Received: from relay.sw.ru ([185.231.240.75]:49894)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lRtX5-0006Ut-6k
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 05:22:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=virtuozzo.com; s=relay; h=MIME-Version:Message-Id:Date:Subject:From:
 Content-Type; bh=McC5C32Zg767HvLvApGCciGf9axYsg3x1uHo0LehNds=; b=qUJnFm1GErX1
 62tcR3A7I8pMMpvwlDiEwUFgxteTeUQA1TTvo54X30nmp93GKfBNQiBSahMUCfeRewHhHC9jtCQtT
 vBqz+BwAT6uP0lQE9MKjeG+QnSVAXPq7xfvmPhAOJT7m6aPIZEZldf3rUiHYPOxhl9qlm6vet5s9W
 4F+DU=;
Received: from [192.168.15.162] (helo=andrey-MS-7B54.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.94)
 (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lRtX1-000DxR-PZ; Thu, 01 Apr 2021 12:22:27 +0300
From: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: Den Lunev <den@openvz.org>, Eric Blake <eblake@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Subject: [PATCH for-6.0 v1 4/4] migration: Rename 'bs' to 'block' in
 background snapshot code
Date: Thu,  1 Apr 2021 12:22:26 +0300
Message-Id: <20210401092226.102804-5-andrey.gruzdev@virtuozzo.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210401092226.102804-1-andrey.gruzdev@virtuozzo.com>
References: <20210401092226.102804-1-andrey.gruzdev@virtuozzo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=185.231.240.75;
 envelope-from=andrey.gruzdev@virtuozzo.com; helo=relay.sw.ru
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rename 'bs' to commonly used 'block' in migration/ram.c background
snapshot code.

Signed-off-by: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Reported-by: David Hildenbrand <david@redhat.com>
---
 migration/ram.c | 86 +++++++++++++++++++++++++------------------------
 1 file changed, 44 insertions(+), 42 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 7e2bc0fdd3..4682f3625c 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -1455,7 +1455,7 @@ static RAMBlock *poll_fault_page(RAMState *rs, ram_addr_t *offset)
 {
     struct uffd_msg uffd_msg;
     void *page_address;
-    RAMBlock *bs;
+    RAMBlock *block;
     int res;
 
     if (!migrate_background_snapshot()) {
@@ -1468,9 +1468,9 @@ static RAMBlock *poll_fault_page(RAMState *rs, ram_addr_t *offset)
     }
 
     page_address = (void *)(uintptr_t) uffd_msg.arg.pagefault.address;
-    bs = qemu_ram_block_from_host(page_address, false, offset);
-    assert(bs && (bs->flags & RAM_UF_WRITEPROTECT) != 0);
-    return bs;
+    block = qemu_ram_block_from_host(page_address, false, offset);
+    assert(block && (block->flags & RAM_UF_WRITEPROTECT) != 0);
+    return block;
 }
 
 /**
@@ -1526,7 +1526,7 @@ bool ram_write_tracking_compatible(void)
 {
     const uint64_t uffd_ioctls_mask = BIT(_UFFDIO_WRITEPROTECT);
     int uffd_fd;
-    RAMBlock *bs;
+    RAMBlock *block;
     bool ret = false;
 
     /* Open UFFD file descriptor */
@@ -1537,15 +1537,15 @@ bool ram_write_tracking_compatible(void)
 
     RCU_READ_LOCK_GUARD();
 
-    RAMBLOCK_FOREACH_NOT_IGNORED(bs) {
+    RAMBLOCK_FOREACH_NOT_IGNORED(block) {
         uint64_t uffd_ioctls;
 
         /* Nothing to do with read-only and MMIO-writable regions */
-        if (bs->mr->readonly || bs->mr->rom_device) {
+        if (block->mr->readonly || block->mr->rom_device) {
             continue;
         }
         /* Try to register block memory via UFFD-IO to track writes */
-        if (uffd_register_memory(uffd_fd, bs->host, bs->max_length,
+        if (uffd_register_memory(uffd_fd, block->host, block->max_length,
                 UFFDIO_REGISTER_MODE_WP, &uffd_ioctls)) {
             goto out;
         }
@@ -1567,13 +1567,13 @@ out:
  * Since it's solely used for userfault_fd WP feature, here we just
  *   hardcode page size to qemu_real_host_page_size.
  *
- * @bs: RAM block to populate
+ * @block: RAM block to populate
  */
-static void ram_block_populate_pages(RAMBlock *bs)
+static void ram_block_populate_pages(RAMBlock *block)
 {
-    char *ptr = (char *) bs->host;
+    char *ptr = (char *) block->host;
 
-    for (ram_addr_t offset = 0; offset < bs->used_length;
+    for (ram_addr_t offset = 0; offset < block->used_length;
             offset += qemu_real_host_page_size) {
         char tmp = *(ptr + offset);
 
@@ -1587,13 +1587,13 @@ static void ram_block_populate_pages(RAMBlock *bs)
  */
 void ram_write_tracking_prepare(void)
 {
-    RAMBlock *bs;
+    RAMBlock *block;
 
     RCU_READ_LOCK_GUARD();
 
-    RAMBLOCK_FOREACH_NOT_IGNORED(bs) {
+    RAMBLOCK_FOREACH_NOT_IGNORED(block) {
         /* Nothing to do with read-only and MMIO-writable regions */
-        if (bs->mr->readonly || bs->mr->rom_device) {
+        if (block->mr->readonly || block->mr->rom_device) {
             continue;
         }
 
@@ -1605,7 +1605,7 @@ void ram_write_tracking_prepare(void)
          * UFFDIO_WRITEPROTECT_MODE_WP mode setting would silently skip
          * pages with pte_none() entries in page table.
          */
-        ram_block_populate_pages(bs);
+        ram_block_populate_pages(block);
     }
 }
 
@@ -1618,7 +1618,7 @@ int ram_write_tracking_start(void)
 {
     int uffd_fd;
     RAMState *rs = ram_state;
-    RAMBlock *bs;
+    RAMBlock *block;
 
     /* Open UFFD file descriptor */
     uffd_fd = uffd_create_fd(UFFD_FEATURE_PAGEFAULT_FLAG_WP, true);
@@ -1629,27 +1629,27 @@ int ram_write_tracking_start(void)
 
     RCU_READ_LOCK_GUARD();
 
-    RAMBLOCK_FOREACH_NOT_IGNORED(bs) {
+    RAMBLOCK_FOREACH_NOT_IGNORED(block) {
         /* Nothing to do with read-only and MMIO-writable regions */
-        if (bs->mr->readonly || bs->mr->rom_device) {
+        if (block->mr->readonly || block->mr->rom_device) {
             continue;
         }
 
         /* Register block memory with UFFD to track writes */
-        if (uffd_register_memory(rs->uffdio_fd, bs->host,
-                bs->max_length, UFFDIO_REGISTER_MODE_WP, NULL)) {
+        if (uffd_register_memory(rs->uffdio_fd, block->host,
+                block->max_length, UFFDIO_REGISTER_MODE_WP, NULL)) {
             goto fail;
         }
         /* Apply UFFD write protection to the block memory range */
-        if (uffd_change_protection(rs->uffdio_fd, bs->host,
-                bs->max_length, true, false)) {
+        if (uffd_change_protection(rs->uffdio_fd, block->host,
+                block->max_length, true, false)) {
             goto fail;
         }
-        bs->flags |= RAM_UF_WRITEPROTECT;
-        memory_region_ref(bs->mr);
+        block->flags |= RAM_UF_WRITEPROTECT;
+        memory_region_ref(block->mr);
 
-        trace_ram_write_tracking_ramblock_start(bs->idstr, bs->page_size,
-                bs->host, bs->max_length);
+        trace_ram_write_tracking_ramblock_start(block->idstr, block->page_size,
+                block->host, block->max_length);
     }
 
     return 0;
@@ -1657,19 +1657,20 @@ int ram_write_tracking_start(void)
 fail:
     error_report("ram_write_tracking_start() failed: restoring initial memory state");
 
-    RAMBLOCK_FOREACH_NOT_IGNORED(bs) {
-        if ((bs->flags & RAM_UF_WRITEPROTECT) == 0) {
+    RAMBLOCK_FOREACH_NOT_IGNORED(block) {
+        if ((block->flags & RAM_UF_WRITEPROTECT) == 0) {
             continue;
         }
         /*
          * In case some memory block failed to be write-protected
          * remove protection and unregister all succeeded RAM blocks
          */
-        uffd_change_protection(rs->uffdio_fd, bs->host, bs->max_length, false, false);
-        uffd_unregister_memory(rs->uffdio_fd, bs->host, bs->max_length);
+        uffd_change_protection(rs->uffdio_fd, block->host, block->max_length,
+                false, false);
+        uffd_unregister_memory(rs->uffdio_fd, block->host, block->max_length);
         /* Cleanup flags and remove reference */
-        bs->flags &= ~RAM_UF_WRITEPROTECT;
-        memory_region_unref(bs->mr);
+        block->flags &= ~RAM_UF_WRITEPROTECT;
+        memory_region_unref(block->mr);
     }
 
     uffd_close_fd(uffd_fd);
@@ -1683,24 +1684,25 @@ fail:
 void ram_write_tracking_stop(void)
 {
     RAMState *rs = ram_state;
-    RAMBlock *bs;
+    RAMBlock *block;
 
     RCU_READ_LOCK_GUARD();
 
-    RAMBLOCK_FOREACH_NOT_IGNORED(bs) {
-        if ((bs->flags & RAM_UF_WRITEPROTECT) == 0) {
+    RAMBLOCK_FOREACH_NOT_IGNORED(block) {
+        if ((block->flags & RAM_UF_WRITEPROTECT) == 0) {
             continue;
         }
         /* Remove protection and unregister all affected RAM blocks */
-        uffd_change_protection(rs->uffdio_fd, bs->host, bs->max_length, false, false);
-        uffd_unregister_memory(rs->uffdio_fd, bs->host, bs->max_length);
+        uffd_change_protection(rs->uffdio_fd, block->host, block->max_length,
+                false, false);
+        uffd_unregister_memory(rs->uffdio_fd, block->host, block->max_length);
 
-        trace_ram_write_tracking_ramblock_stop(bs->idstr, bs->page_size,
-                bs->host, bs->max_length);
+        trace_ram_write_tracking_ramblock_stop(block->idstr, block->page_size,
+                block->host, block->max_length);
 
         /* Cleanup flags and remove reference */
-        bs->flags &= ~RAM_UF_WRITEPROTECT;
-        memory_region_unref(bs->mr);
+        block->flags &= ~RAM_UF_WRITEPROTECT;
+        memory_region_unref(block->mr);
     }
 
     /* Finally close UFFD file descriptor */
-- 
2.27.0


