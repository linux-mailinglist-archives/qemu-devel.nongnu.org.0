Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6BE35699D
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 12:27:51 +0200 (CEST)
Received: from localhost ([::1]:58744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lU5Pb-0005UG-14
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 06:27:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lU5Iw-0000N9-Qv
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 06:20:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21260)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lU5Iq-0002lS-EV
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 06:20:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617790851;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8tHcG1iLARm+Z6cj4YZZpuAORcWH6iImHa9JOW/M2Jo=;
 b=HdT5TUe4W3+ezFykjZWz4AwX0whI/0kBJcum0tgLBKM7wG57KkirfkHe5WGr1IyukhCHjn
 EYASibozYVkxoPXBtx6ATHGNKi9pQWdByBJSQPvJS+h7GRA44FHa4pXuYBuguhzKflj5A+
 MyOZAjxTatIwy63mSCo0cTc0oiLy9CA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-555-9ZDIZFtrO6CB3bJ1u-Yqjg-1; Wed, 07 Apr 2021 06:20:32 -0400
X-MC-Unique: 9ZDIZFtrO6CB3bJ1u-Yqjg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F2BA883DEA7;
 Wed,  7 Apr 2021 10:20:30 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-115-14.ams2.redhat.com
 [10.36.115.14])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D7B45100F49F;
 Wed,  7 Apr 2021 10:20:29 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, andrey.gruzdev@virtuozzo.com,
 huangy81@chinatelecom.cn
Subject: [PULL 4/6] migration: Pre-fault memory before starting background
 snasphot
Date: Wed,  7 Apr 2021 11:20:19 +0100
Message-Id: <20210407102021.95225-5-dgilbert@redhat.com>
In-Reply-To: <20210407102021.95225-1-dgilbert@redhat.com>
References: <20210407102021.95225-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
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
Message-Id: <20210401092226.102804-4-andrey.gruzdev@virtuozzo.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
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
2.31.1


