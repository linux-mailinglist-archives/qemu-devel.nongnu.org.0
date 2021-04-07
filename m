Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 505093573C5
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 20:00:05 +0200 (CEST)
Received: from localhost ([::1]:35064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUCTE-0001l6-0E
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 14:00:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lUCNt-0002Ie-AG
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 13:54:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lUCNr-0005XX-8P
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 13:54:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617818070;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1Fvg4XJbhkURkN0ZGS3cdPHZEZSLnyf8pMDA1DK8gXg=;
 b=ijOCldrr1vezFHlEeAe0LYNpseZNdhL7pVnroGAedUKhD89KAAX1NblscPffjjympfdYgr
 P1+lO8FyPJGj8KSUR2uwcp8wZ2Fkx6UR05n9rN3Fy4Xm66CbV7PqJUkUOlE5F92oVSzFOL
 sJCfnjl/dHaI5jXrpdo6hHvdCTrZ+o0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-544-E_A3y3WnMRecP7bYWBItxg-1; Wed, 07 Apr 2021 13:54:26 -0400
X-MC-Unique: E_A3y3WnMRecP7bYWBItxg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 75A5F1922961;
 Wed,  7 Apr 2021 17:54:25 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-115-14.ams2.redhat.com
 [10.36.115.14])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9D1D410013D7;
 Wed,  7 Apr 2021 17:54:24 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, andrey.gruzdev@virtuozzo.com,
 huangy81@chinatelecom.cn
Subject: [PULL 5/6] migration: Rename 'bs' to 'block' in background snapshot
 code
Date: Wed,  7 Apr 2021 18:54:15 +0100
Message-Id: <20210407175416.201555-6-dgilbert@redhat.com>
In-Reply-To: <20210407175416.201555-1-dgilbert@redhat.com>
References: <20210407175416.201555-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>

Rename 'bs' to commonly used 'block' in migration/ram.c background
snapshot code.

Signed-off-by: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Reported-by: David Hildenbrand <david@redhat.com>
Message-Id: <20210401092226.102804-5-andrey.gruzdev@virtuozzo.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
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
2.31.1


