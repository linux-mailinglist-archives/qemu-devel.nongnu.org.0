Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADFFC6ECAFA
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 13:06:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqtxQ-0006Xk-Ak; Mon, 24 Apr 2023 07:02:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pqtxM-0006W2-H1
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 07:02:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pqtxK-00008g-QB
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 07:02:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682334122;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qTpIH6J0Oeu1R8sR8xhP8NxkFo3ADKWp+t7Ys+B7VIs=;
 b=OVjzexrDpv8aXJDbBwIo2UiZGe6GXXszP5r2KVulUzYGZyylERFHm5F1z2XM9P2tSQp+bm
 zFMJQmHLsoprzDuRoSxbdLXD3zI9hRyGqMFw8JF5fWErqq4Hi6ndLhZ4cjYQiJKQYgaEOs
 iyPdkl8GR1c5A42oEcEJ/8v5b9LoSFg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-258--OwmNNIaM52G5MtnuMf7Yw-1; Mon, 24 Apr 2023 07:02:00 -0400
X-MC-Unique: -OwmNNIaM52G5MtnuMf7Yw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C334A847723
 for <qemu-devel@nongnu.org>; Mon, 24 Apr 2023 11:01:39 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BE3BA492C13;
 Mon, 24 Apr 2023 11:01:38 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Xu <peterx@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Leonardo Bras <leobras@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 15/17] migration/postcopy: Detect file system on dest host
Date: Mon, 24 Apr 2023 13:01:17 +0200
Message-Id: <20230424110119.68520-16-quintela@redhat.com>
In-Reply-To: <20230424110119.68520-1-quintela@redhat.com>
References: <20230424110119.68520-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.172,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Peter Xu <peterx@redhat.com>

Postcopy requires the memory support userfaultfd to work.  Right now we
check it but it's a bit too late (when switching to postcopy migration).

Do that early right at enabling of postcopy.

Note that this is still only a best effort because ramblocks can be
dynamically created.  We can add check in hostmem creations and fail if
postcopy enabled, but maybe that's too aggressive.

Still, we have chance to fail the most obvious where we know there's an
existing unsupported ramblock.

Signed-off-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/postcopy-ram.c | 34 ++++++++++++++++++++++++++++++----
 1 file changed, 30 insertions(+), 4 deletions(-)

diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
index 7d24dac397..d7b48dd920 100644
--- a/migration/postcopy-ram.c
+++ b/migration/postcopy-ram.c
@@ -36,6 +36,7 @@
 #include "yank_functions.h"
 #include "tls.h"
 #include "qemu/userfaultfd.h"
+#include "qemu/mmap-alloc.h"
 
 /* Arbitrary limit on size of each discard command,
  * keeps them around ~200 bytes
@@ -336,11 +337,12 @@ static bool ufd_check_and_apply(int ufd, MigrationIncomingState *mis)
 
 /* Callback from postcopy_ram_supported_by_host block iterator.
  */
-static int test_ramblock_postcopiable(RAMBlock *rb, void *opaque)
+static int test_ramblock_postcopiable(RAMBlock *rb)
 {
     const char *block_name = qemu_ram_get_idstr(rb);
     ram_addr_t length = qemu_ram_get_used_length(rb);
     size_t pagesize = qemu_ram_pagesize(rb);
+    QemuFsType fs;
 
     if (length % pagesize) {
         error_report("Postcopy requires RAM blocks to be a page size multiple,"
@@ -348,6 +350,15 @@ static int test_ramblock_postcopiable(RAMBlock *rb, void *opaque)
                      "page size of 0x%zx", block_name, length, pagesize);
         return 1;
     }
+
+    if (rb->fd >= 0) {
+        fs = qemu_fd_getfs(rb->fd);
+        if (fs != QEMU_FS_TYPE_TMPFS && fs != QEMU_FS_TYPE_HUGETLBFS) {
+            error_report("Host backend files need to be TMPFS or HUGETLBFS only");
+            return 1;
+        }
+    }
+
     return 0;
 }
 
@@ -366,6 +377,7 @@ bool postcopy_ram_supported_by_host(MigrationIncomingState *mis)
     struct uffdio_range range_struct;
     uint64_t feature_mask;
     Error *local_err = NULL;
+    RAMBlock *block;
 
     if (qemu_target_page_size() > pagesize) {
         error_report("Target page size bigger than host page size");
@@ -390,9 +402,23 @@ bool postcopy_ram_supported_by_host(MigrationIncomingState *mis)
         goto out;
     }
 
-    /* We don't support postcopy with shared RAM yet */
-    if (foreach_not_ignored_block(test_ramblock_postcopiable, NULL)) {
-        goto out;
+    /*
+     * We don't support postcopy with some type of ramblocks.
+     *
+     * NOTE: we explicitly ignored ramblock_is_ignored() instead we checked
+     * all possible ramblocks.  This is because this function can be called
+     * when creating the migration object, during the phase RAM_MIGRATABLE
+     * is not even properly set for all the ramblocks.
+     *
+     * A side effect of this is we'll also check against RAM_SHARED
+     * ramblocks even if migrate_ignore_shared() is set (in which case
+     * we'll never migrate RAM_SHARED at all), but normally this shouldn't
+     * affect in reality, or we can revisit.
+     */
+    RAMBLOCK_FOREACH(block) {
+        if (test_ramblock_postcopiable(block)) {
+            goto out;
+        }
     }
 
     /*
-- 
2.39.2


