Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E62AC6F09EF
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 18:36:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ps4aW-0005Ex-Ei; Thu, 27 Apr 2023 12:35:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ps4aU-0005Dq-3i
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 12:35:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ps4aS-0006iM-G3
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 12:35:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682613312;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eCwV/ceYtjxUdlYG70aEG2T9pDl6nK0pJPj/PMgOVTw=;
 b=Z9cwwu+Ia27WdzMMrGgqHHI+ZuPIpYhte4urjpET+tTUNMzmzX/gnARV6W6dyTBMgo8C58
 xjBT7ZFlu1Im22ykkl4gu899grQL6S6PE0NyK8kCYd9/xBltfnQ5DC7A5bAYogwXEPGE9z
 aoNybVhcCz9n+FWgv9/fhTUI2PhZq7w=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-600-23VhpWy7NSuGL8GANjJAkA-1; Thu, 27 Apr 2023 12:34:57 -0400
X-MC-Unique: 23VhpWy7NSuGL8GANjJAkA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B63BA1C041A0
 for <qemu-devel@nongnu.org>; Thu, 27 Apr 2023 16:34:56 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.193.238])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EED5410DF8;
 Thu, 27 Apr 2023 16:34:55 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>, Peter Xu <peterx@redhat.com>,
 Leonardo Bras <leobras@redhat.com>
Subject: [PATCH 05/19] migration/rdma: Split the zero page case from
 acct_update_position
Date: Thu, 27 Apr 2023 18:34:35 +0200
Message-Id: <20230427163449.27473-6-quintela@redhat.com>
In-Reply-To: <20230427163449.27473-1-quintela@redhat.com>
References: <20230427163449.27473-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
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

Now that we have atomic counters, we can do it on the place that we
need it, no need to do it inside ram.c.

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/ram.c  | 12 ++++--------
 migration/ram.h  |  2 +-
 migration/rdma.c |  7 +++++--
 3 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index c3981f64e4..c249a1f468 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -2629,17 +2629,13 @@ static int ram_find_and_save_block(RAMState *rs)
     return pages;
 }
 
-void acct_update_position(QEMUFile *f, size_t size, bool zero)
+void acct_update_position(QEMUFile *f, size_t size)
 {
     uint64_t pages = size / TARGET_PAGE_SIZE;
 
-    if (zero) {
-        stat64_add(&mig_stats.zero_pages, pages);
-    } else {
-        stat64_add(&mig_stats.normal_pages, pages);
-        ram_transferred_add(size);
-        qemu_file_credit_transfer(f, size);
-    }
+    stat64_add(&mig_stats.normal_pages, pages);
+    ram_transferred_add(size);
+    qemu_file_credit_transfer(f, size);
 }
 
 static uint64_t ram_bytes_total_with_ignored(void)
diff --git a/migration/ram.h b/migration/ram.h
index 8692de6ba0..3804753ca3 100644
--- a/migration/ram.h
+++ b/migration/ram.h
@@ -53,7 +53,7 @@ void mig_throttle_counter_reset(void);
 
 uint64_t ram_pagesize_summary(void);
 int ram_save_queue_pages(const char *rbname, ram_addr_t start, ram_addr_t len);
-void acct_update_position(QEMUFile *f, size_t size, bool zero);
+void acct_update_position(QEMUFile *f, size_t size);
 void ram_postcopy_migrated_memory_release(MigrationState *ms);
 /* For outgoing discard bitmap */
 void ram_postcopy_send_discard_bitmap(MigrationState *ms);
diff --git a/migration/rdma.c b/migration/rdma.c
index 0af5e944f0..7a9b284c3f 100644
--- a/migration/rdma.c
+++ b/migration/rdma.c
@@ -17,8 +17,10 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "qemu/cutils.h"
+#include "exec/target_page.h"
 #include "rdma.h"
 #include "migration.h"
+#include "migration-stats.h"
 #include "qemu-file.h"
 #include "ram.h"
 #include "qemu/error-report.h"
@@ -2120,7 +2122,8 @@ retry:
                     return -EIO;
                 }
 
-                acct_update_position(f, sge.length, true);
+                stat64_add(&mig_stats.zero_pages,
+                           sge.length / qemu_target_page_size());
 
                 return 1;
             }
@@ -2228,7 +2231,7 @@ retry:
     }
 
     set_bit(chunk, block->transit_bitmap);
-    acct_update_position(f, sge.length, false);
+    acct_update_position(f, sge.length);
     rdma->total_writes++;
 
     return 0;
-- 
2.40.0


