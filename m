Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AED473511FD
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 11:26:29 +0200 (CEST)
Received: from localhost ([::1]:48580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRtau-0002VX-QN
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 05:26:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lRtXD-0006rj-BB
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 05:22:40 -0400
Received: from relay.sw.ru ([185.231.240.75]:49888)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lRtX5-0006Us-6Z
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 05:22:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=virtuozzo.com; s=relay; h=MIME-Version:Message-Id:Date:Subject:From:
 Content-Type; bh=gJXkUTonPtKXDepjvSsGeQ76zv3tjexQliHyYevf2yU=; b=ufzKjGnNuQTE
 EDyYsjGC4CqQsn5mvOxpxHj796UyU83uD445rlIwSFlAtR38oiUkk2FOtzzVnkuMkox7Lbqtsliny
 /jG4mcLsTn+oTFrE+ucWotZXSO2lyNYcGUQJIf4BVj4oI2+r+sdg7NQnBEZaLJXb2RU/cr4jQVIF8
 AObQs=;
Received: from [192.168.15.162] (helo=andrey-MS-7B54.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.94)
 (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lRtX1-000DxR-Ly; Thu, 01 Apr 2021 12:22:27 +0300
From: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: Den Lunev <den@openvz.org>, Eric Blake <eblake@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Subject: [PATCH for-6.0 v1 3/4] migration: Pre-fault memory before starting
 background snasphot
Date: Thu,  1 Apr 2021 12:22:25 +0300
Message-Id: <20210401092226.102804-4-andrey.gruzdev@virtuozzo.com>
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

This commit solves the issue with userfault_fd WP feature that
background snapshot is based on. For any never poluated or discarded
memory page, the UFFDIO_WRITEPROTECT ioctl() would skip updating
PTE for that page, thereby loosing WP setting for it.

So we need to pre-fault pages for each RAM block to be protected
before making a userfault_fd wr-protect ioctl().

Fixes: 278e2f551a095b234de74dca9c214d5502a1f72c (migration: support
  UFFD write fault processing in ram_save_iterate())
Signed-off-by: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Reported-by: David Hildenbrand <david@redhat.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
---
 migration/migration.c |  6 ++++++
 migration/ram.c       | 49 +++++++++++++++++++++++++++++++++++++++++++
 migration/ram.h       |  1 +
 3 files changed, 56 insertions(+)

diff --git a/migration/migration.c b/migration/migration.c
index be4729e7c8..71bce15a1b 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -3827,6 +3827,12 @@ static void *bg_migration_thread(void *opaque)
 
     update_iteration_initial_status(s);
 
+    /*
+     * Prepare for tracking memory writes with UFFD-WP - populate
+     * RAM pages before protecting.
+     */
+    ram_write_tracking_prepare();
+
     qemu_savevm_state_header(s->to_dst_file);
     qemu_savevm_state_setup(s->to_dst_file);
 
diff --git a/migration/ram.c b/migration/ram.c
index 40e78952ad..7e2bc0fdd3 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -1560,6 +1560,55 @@ out:
     return ret;
 }
 
+/*
+ * ram_block_populate_pages: populate memory in the RAM block by reading
+ *   an integer from the beginning of each page.
+ *
+ * Since it's solely used for userfault_fd WP feature, here we just
+ *   hardcode page size to qemu_real_host_page_size.
+ *
+ * @bs: RAM block to populate
+ */
+static void ram_block_populate_pages(RAMBlock *bs)
+{
+    char *ptr = (char *) bs->host;
+
+    for (ram_addr_t offset = 0; offset < bs->used_length;
+            offset += qemu_real_host_page_size) {
+        char tmp = *(ptr + offset);
+
+        /* Don't optimize the read out */
+        asm volatile("" : "+r" (tmp));
+    }
+}
+
+/*
+ * ram_write_tracking_prepare: prepare for UFFD-WP memory tracking
+ */
+void ram_write_tracking_prepare(void)
+{
+    RAMBlock *bs;
+
+    RCU_READ_LOCK_GUARD();
+
+    RAMBLOCK_FOREACH_NOT_IGNORED(bs) {
+        /* Nothing to do with read-only and MMIO-writable regions */
+        if (bs->mr->readonly || bs->mr->rom_device) {
+            continue;
+        }
+
+        /*
+         * Populate pages of the RAM block before enabling userfault_fd
+         * write protection.
+         *
+         * This stage is required since ioctl(UFFDIO_WRITEPROTECT) with
+         * UFFDIO_WRITEPROTECT_MODE_WP mode setting would silently skip
+         * pages with pte_none() entries in page table.
+         */
+        ram_block_populate_pages(bs);
+    }
+}
+
 /*
  * ram_write_tracking_start: start UFFD-WP memory tracking
  *
diff --git a/migration/ram.h b/migration/ram.h
index 6378bb3ebc..4833e9fd5b 100644
--- a/migration/ram.h
+++ b/migration/ram.h
@@ -82,6 +82,7 @@ void colo_incoming_start_dirty_log(void);
 /* Background snapshot */
 bool ram_write_tracking_available(void);
 bool ram_write_tracking_compatible(void);
+void ram_write_tracking_prepare(void);
 int ram_write_tracking_start(void);
 void ram_write_tracking_stop(void);
 
-- 
2.27.0


