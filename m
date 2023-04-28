Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC3F6F1EB3
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 21:18:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psTW7-0004f0-Vp; Fri, 28 Apr 2023 15:12:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1psTVt-0004VV-Ti
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 15:12:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1psTVs-0002u4-6B
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 15:12:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682709131;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vSCB6KT7M6hoNQV4Q2mURuJbWzf3pyiKoUhw7b9R8Xc=;
 b=a2acTRzT17+4RfY9WsPzQ4qO650d0WQBro3njiqAvK8bnSymGK5LA62/KP1K7wXD6ztWVL
 E6cCoYIwW3KUJUOacexI7iOEX7Lp0ysSZhjzuQJ6Ajveyr7vWCLMfGgR3E5OBzB+UJCvi7
 4z6EFO7lAk36qWdxULLf3KGfXrCZooY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-13-yapo_36qPxe5g4LYr2T02g-1; Fri, 28 Apr 2023 15:12:09 -0400
X-MC-Unique: yapo_36qPxe5g4LYr2T02g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2224F1C06916;
 Fri, 28 Apr 2023 19:12:09 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.193.238])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8F84B2166B4F;
 Fri, 28 Apr 2023 19:12:07 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Leonardo Bras <leobras@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>,
 Lukas Straub <lukasstraub2@web.de>
Subject: [PULL 02/21] migration: Move ram_stats to its own file
 migration-stats.[ch]
Date: Fri, 28 Apr 2023 21:11:44 +0200
Message-Id: <20230428191203.39520-3-quintela@redhat.com>
In-Reply-To: <20230428191203.39520-1-quintela@redhat.com>
References: <20230428191203.39520-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
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

There is already include/qemu/stats.h, so stats.h was a bad idea.
We want this file to not depend on anything else, we will move all the
migration counters/stats to this struct.

Signed-off-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Lukas Straub <lukasstraub2@web.de>
---
 migration/meson.build       |  1 +
 migration/migration-stats.c | 17 +++++++++++++++
 migration/migration-stats.h | 41 +++++++++++++++++++++++++++++++++++++
 migration/migration.c       |  1 +
 migration/multifd.c         |  1 +
 migration/ram.c             |  3 +--
 migration/ram.h             | 23 ---------------------
 migration/savevm.c          |  1 +
 8 files changed, 63 insertions(+), 25 deletions(-)
 create mode 100644 migration/migration-stats.c
 create mode 100644 migration/migration-stats.h

diff --git a/migration/meson.build b/migration/meson.build
index 480ff6854a..da1897fadf 100644
--- a/migration/meson.build
+++ b/migration/meson.build
@@ -19,6 +19,7 @@ softmmu_ss.add(files(
   'fd.c',
   'global_state.c',
   'migration-hmp-cmds.c',
+  'migration-stats.c',
   'migration.c',
   'multifd.c',
   'multifd-zlib.c',
diff --git a/migration/migration-stats.c b/migration/migration-stats.c
new file mode 100644
index 0000000000..b0eb5ae73c
--- /dev/null
+++ b/migration/migration-stats.c
@@ -0,0 +1,17 @@
+/*
+ * Migration stats
+ *
+ * Copyright (c) 2012-2023 Red Hat Inc
+ *
+ * Authors:
+ *  Juan Quintela <quintela@redhat.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/stats64.h"
+#include "migration-stats.h"
+
+RAMStats ram_counters;
diff --git a/migration/migration-stats.h b/migration/migration-stats.h
new file mode 100644
index 0000000000..2edea0c779
--- /dev/null
+++ b/migration/migration-stats.h
@@ -0,0 +1,41 @@
+/*
+ * Migration stats
+ *
+ * Copyright (c) 2012-2023 Red Hat Inc
+ *
+ * Authors:
+ *  Juan Quintela <quintela@redhat.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef QEMU_MIGRATION_STATS_H
+#define QEMU_MIGRATION_STATS_H
+
+#include "qemu/stats64.h"
+
+/*
+ * These are the ram migration statistic counters.  It is loosely
+ * based on MigrationStats.  We change to Stat64 any counter that
+ * needs to be updated using atomic ops (can be accessed by more than
+ * one thread).
+ */
+typedef struct {
+    Stat64 dirty_bytes_last_sync;
+    Stat64 dirty_pages_rate;
+    Stat64 dirty_sync_count;
+    Stat64 dirty_sync_missed_zero_copy;
+    Stat64 downtime_bytes;
+    Stat64 zero_pages;
+    Stat64 multifd_bytes;
+    Stat64 normal_pages;
+    Stat64 postcopy_bytes;
+    Stat64 postcopy_requests;
+    Stat64 precopy_bytes;
+    Stat64 transferred;
+} RAMStats;
+
+extern RAMStats ram_counters;
+
+#endif
diff --git a/migration/migration.c b/migration/migration.c
index abcadbb619..5ecf3dc381 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -29,6 +29,7 @@
 #include "migration/global_state.h"
 #include "migration/misc.h"
 #include "migration.h"
+#include "migration-stats.h"
 #include "savevm.h"
 #include "qemu-file.h"
 #include "channel.h"
diff --git a/migration/multifd.c b/migration/multifd.c
index 6053012ad9..347999f84a 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -19,6 +19,7 @@
 #include "qapi/error.h"
 #include "ram.h"
 #include "migration.h"
+#include "migration-stats.h"
 #include "socket.h"
 #include "tls.h"
 #include "qemu-file.h"
diff --git a/migration/ram.c b/migration/ram.c
index 89be3e3320..a6d5478ef8 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -36,6 +36,7 @@
 #include "xbzrle.h"
 #include "ram.h"
 #include "migration.h"
+#include "migration-stats.h"
 #include "migration/register.h"
 #include "migration/misc.h"
 #include "qemu-file.h"
@@ -460,8 +461,6 @@ uint64_t ram_bytes_remaining(void)
                        0;
 }
 
-RAMStats ram_counters;
-
 void ram_transferred_add(uint64_t bytes)
 {
     if (runstate_is_running()) {
diff --git a/migration/ram.h b/migration/ram.h
index 04b05e1b2c..8692de6ba0 100644
--- a/migration/ram.h
+++ b/migration/ram.h
@@ -32,30 +32,7 @@
 #include "qapi/qapi-types-migration.h"
 #include "exec/cpu-common.h"
 #include "io/channel.h"
-#include "qemu/stats64.h"
 
-/*
- * These are the ram migration statistic counters.  It is loosely
- * based on MigrationStats.  We change to Stat64 any counter that
- * needs to be updated using atomic ops (can be accessed by more than
- * one thread).
- */
-typedef struct {
-    Stat64 dirty_bytes_last_sync;
-    Stat64 dirty_pages_rate;
-    Stat64 dirty_sync_count;
-    Stat64 dirty_sync_missed_zero_copy;
-    Stat64 downtime_bytes;
-    Stat64 zero_pages;
-    Stat64 multifd_bytes;
-    Stat64 normal_pages;
-    Stat64 postcopy_bytes;
-    Stat64 postcopy_requests;
-    Stat64 precopy_bytes;
-    Stat64 transferred;
-} RAMStats;
-
-extern RAMStats ram_counters;
 extern XBZRLECacheStats xbzrle_counters;
 extern CompressionStats compression_counters;
 
diff --git a/migration/savevm.c b/migration/savevm.c
index a9181b444b..8e2efb1a19 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -31,6 +31,7 @@
 #include "net/net.h"
 #include "migration.h"
 #include "migration/snapshot.h"
+#include "migration-stats.h"
 #include "migration/vmstate.h"
 #include "migration/misc.h"
 #include "migration/register.h"
-- 
2.40.0


