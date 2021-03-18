Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0524B340C65
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 19:04:26 +0100 (CET)
Received: from localhost ([::1]:43382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMx0S-0001Zo-VK
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 14:04:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lMwlX-0006ez-1Q
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 13:48:59 -0400
Received: from relay.sw.ru ([185.231.240.75]:58296)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lMwlA-0008Dw-OY
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 13:48:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=virtuozzo.com; s=relay; h=MIME-Version:Message-Id:Date:Subject:From:
 Content-Type; bh=cvJuFppu7SmRAj2F1cKmCQtQ1pGH8gESyB0Znk8qimk=; b=MmMru/V3vCu1
 JwdCcuWS/t4ewlbKLQ07d+JZYrW14WNac8wJ0VtfWTrp4avHpDhsP1KtLl5GN9KC6TIEjbTT1NWT7
 nVtQ6kB/DHh/zylaxp0FeTz40jfumvbgwBupGIPwZOiacQvPDz4RBz4LHOxLQxeanNnu5S6bOhuTR
 w487U=;
Received: from [192.168.15.248] (helo=andrey-MS-7B54.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.94)
 (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lMwkX-003De5-TX; Thu, 18 Mar 2021 20:47:57 +0300
From: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: Den Lunev <den@openvz.org>, Eric Blake <eblake@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Subject: [PATCH 3/3] migration: Pre-fault memory before starting background
 snasphot
Date: Thu, 18 Mar 2021 20:46:11 +0300
Message-Id: <20210318174611.293520-4-andrey.gruzdev@virtuozzo.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210318174611.293520-1-andrey.gruzdev@virtuozzo.com>
References: <20210318174611.293520-1-andrey.gruzdev@virtuozzo.com>
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

Signed-off-by: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
---
 migration/migration.c |  6 +++++
 migration/ram.c       | 51 +++++++++++++++++++++++++++++++++++++++++++
 migration/ram.h       |  1 +
 3 files changed, 58 insertions(+)

diff --git a/migration/migration.c b/migration/migration.c
index 656d6249a6..496e88cbda 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -3872,6 +3872,12 @@ static void *bg_migration_thread(void *opaque)
 
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
index 52537f14ac..825eb80030 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -1560,6 +1560,57 @@ out:
     return ret;
 }
 
+/*
+ * ram_block_populate_pages: populate memory in the RAM block by reading
+ *   an integer from the beginning of each page.
+ *
+ * Since it's solely used for userfault_fd WP feature, here we just
+ *   hardcode page size to TARGET_PAGE_SIZE.
+ *
+ * @bs: RAM block to populate
+ */
+volatile int ram_block_populate_pages__tmp;
+static void ram_block_populate_pages(RAMBlock *bs)
+{
+    ram_addr_t offset = 0;
+    int tmp = 0;
+
+    for (char *ptr = (char *) bs->host; offset < bs->used_length;
+            ptr += TARGET_PAGE_SIZE, offset += TARGET_PAGE_SIZE) {
+        /* Try to do it without memory writes */
+        tmp += *(volatile int *) ptr;
+    }
+    /* Create dependency on 'extern volatile int' to avoid optimizing out */
+    ram_block_populate_pages__tmp += tmp;
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
2.25.1


