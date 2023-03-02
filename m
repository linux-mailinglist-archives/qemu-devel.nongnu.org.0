Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E136A8700
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 17:41:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXltD-0006MZ-Vs; Thu, 02 Mar 2023 11:34:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pXlsy-00069B-8q
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 11:34:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pXlsv-0007Dm-Mi
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 11:34:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677774864;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qoLMfG0mBfkTQYAlT1OQhRtfwATsz+ClZSA35K5jxOI=;
 b=QvQxBxt36SxIkKJYRjQI1TiRMO6nfW33+s77pdJFuZzbJJt0nHDQ0LuQgVFDTCLlyLHJhy
 eTRmKfs5pksshabVJVoT3jPcKSnnXAyXaDOgyH9jM3hqEjyJSfQEcvwXJ+UJmEQwNxdwLy
 nzRFNUl7li8GraYFUyWNiagSSBO+tNI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-364-0_wFJEGnOjyIJULEOpkv4Q-1; Thu, 02 Mar 2023 11:34:23 -0500
X-MC-Unique: 0_wFJEGnOjyIJULEOpkv4Q-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 120071C3626C;
 Thu,  2 Mar 2023 16:34:23 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ED557492B01;
 Thu,  2 Mar 2023 16:34:20 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 John Snow <jsnow@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-block@nongnu.org,
 Hailiang Zhang <zhanghailiang@xfusion.com>, Fam Zheng <fam@euphon.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>
Subject: [PATCH 04/43] migration: create options.c
Date: Thu,  2 Mar 2023 17:33:31 +0100
Message-Id: <20230302163410.11399-5-quintela@redhat.com>
In-Reply-To: <20230302163410.11399-1-quintela@redhat.com>
References: <20230302163410.11399-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

We move there all capabilities helpers from migration.c.

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/migration.h          |  12 ----
 migration/options.h            |  34 +++++++++
 hw/virtio/virtio-balloon.c     |   1 +
 migration/block-dirty-bitmap.c |   1 +
 migration/block.c              |   1 +
 migration/colo.c               |   1 +
 migration/migration.c          | 109 +---------------------------
 migration/options.c            | 126 +++++++++++++++++++++++++++++++++
 migration/postcopy-ram.c       |   1 +
 migration/ram.c                |   1 +
 migration/savevm.c             |   1 +
 migration/socket.c             |   1 +
 migration/meson.build          |   1 +
 13 files changed, 170 insertions(+), 120 deletions(-)
 create mode 100644 migration/options.h
 create mode 100644 migration/options.c

diff --git a/migration/migration.h b/migration/migration.h
index b07efaf259..68851e485d 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -410,16 +410,7 @@ MigrationState *migrate_get_current(void);
 
 bool migrate_postcopy(void);
 
-bool migrate_release_ram(void);
-bool migrate_postcopy_ram(void);
-bool migrate_zero_blocks(void);
-bool migrate_dirty_bitmaps(void);
-bool migrate_ignore_shared(void);
-bool migrate_validate_uuid(void);
-
-bool migrate_auto_converge(void);
 bool migrate_use_multifd(void);
-bool migrate_pause_before_switchover(void);
 int migrate_multifd_channels(void);
 MultiFDCompression migrate_multifd_compression(void);
 int migrate_multifd_zlib_level(void);
@@ -448,9 +439,6 @@ int migrate_compress_threads(void);
 int migrate_compress_wait_thread(void);
 int migrate_decompress_threads(void);
 bool migrate_use_events(void);
-bool migrate_postcopy_blocktime(void);
-bool migrate_background_snapshot(void);
-bool migrate_postcopy_preempt(void);
 
 /* Sending on the return path - generic and then for each message type */
 void migrate_send_rp_shut(MigrationIncomingState *mis,
diff --git a/migration/options.h b/migration/options.h
new file mode 100644
index 0000000000..bae032375a
--- /dev/null
+++ b/migration/options.h
@@ -0,0 +1,34 @@
+/*
+ * QEMU migration options
+ *
+ * Copyright IBM, Corp. 2008
+ *
+ * Authors:
+ *  Anthony Liguori   <aliguori@us.ibm.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ *
+ * Contributions after 2012-01-13 are licensed under the terms of the
+ * GNU GPL, version 2 or (at your option) any later version.
+ */
+
+#ifndef QEMU_MIGRATION_OPTIONS_H
+#define QEMU_MIGRATION_OPTIONS_H
+
+/* capabilities */
+
+bool migrate_auto_converge(void);
+bool migrate_background_snapshot(void);
+bool migrate_dirty_bitmaps(void);
+bool migrate_ignore_shared(void);
+bool migrate_late_block_activate(void);
+bool migrate_pause_before_switchover(void);
+bool migrate_postcopy_blocktime(void);
+bool migrate_postcopy_preempt(void);
+bool migrate_postcopy_ram(void);
+bool migrate_release_ram(void);
+bool migrate_validate_uuid(void);
+bool migrate_zero_blocks(void);
+
+#endif
diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
index 746f07c4d2..43092aa634 100644
--- a/hw/virtio/virtio-balloon.c
+++ b/hw/virtio/virtio-balloon.c
@@ -32,6 +32,7 @@
 #include "qemu/error-report.h"
 #include "migration/misc.h"
 #include "migration/migration.h"
+#include "migration/options.h"
 
 #include "hw/virtio/virtio-bus.h"
 #include "hw/virtio/virtio-access.h"
diff --git a/migration/block-dirty-bitmap.c b/migration/block-dirty-bitmap.c
index fe73aa94b1..a6ffae0002 100644
--- a/migration/block-dirty-bitmap.c
+++ b/migration/block-dirty-bitmap.c
@@ -79,6 +79,7 @@
 #include "qapi/qapi-visit-migration.h"
 #include "qapi/clone-visitor.h"
 #include "trace.h"
+#include "options.h"
 
 #define CHUNK_SIZE     (1 << 10)
 
diff --git a/migration/block.c b/migration/block.c
index 426a25bb19..c4fe9fea56 100644
--- a/migration/block.c
+++ b/migration/block.c
@@ -28,6 +28,7 @@
 #include "migration/vmstate.h"
 #include "sysemu/block-backend.h"
 #include "trace.h"
+#include "options.h"
 
 #define BLK_MIG_BLOCK_SIZE           (1ULL << 20)
 #define BDRV_SECTORS_PER_DIRTY_CHUNK (BLK_MIG_BLOCK_SIZE >> BDRV_SECTOR_BITS)
diff --git a/migration/colo.c b/migration/colo.c
index 0716e64689..93b78c9270 100644
--- a/migration/colo.c
+++ b/migration/colo.c
@@ -36,6 +36,7 @@
 #include "sysemu/cpus.h"
 #include "sysemu/runstate.h"
 #include "net/filter.h"
+#include "options.h"
 
 static bool vmstate_loading;
 static Notifier packets_compare_notifier;
diff --git a/migration/migration.c b/migration/migration.c
index e3062530f0..790848ef1c 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -63,6 +63,7 @@
 #include "sysemu/cpus.h"
 #include "yank_functions.h"
 #include "sysemu/qtest.h"
+#include "options.h"
 
 #define MAX_THROTTLE  (128 << 20)      /* Migration transfer speed throttling */
 
@@ -357,15 +358,6 @@ static void migrate_generate_event(int new_state)
     }
 }
 
-static bool migrate_late_block_activate(void)
-{
-    MigrationState *s;
-
-    s = migrate_get_current();
-
-    return s->capabilities[MIGRATION_CAPABILITY_LATE_BLOCK_ACTIVATE];
-}
-
 /*
  * Send a message on the return channel back to the source
  * of the migration.
@@ -2523,56 +2515,11 @@ void qmp_migrate_continue(MigrationStatus state, Error **errp)
     qemu_sem_post(&s->pause_sem);
 }
 
-bool migrate_release_ram(void)
-{
-    MigrationState *s;
-
-    s = migrate_get_current();
-
-    return s->capabilities[MIGRATION_CAPABILITY_RELEASE_RAM];
-}
-
-bool migrate_postcopy_ram(void)
-{
-    MigrationState *s;
-
-    s = migrate_get_current();
-
-    return s->capabilities[MIGRATION_CAPABILITY_POSTCOPY_RAM];
-}
-
 bool migrate_postcopy(void)
 {
     return migrate_postcopy_ram() || migrate_dirty_bitmaps();
 }
 
-bool migrate_auto_converge(void)
-{
-    MigrationState *s;
-
-    s = migrate_get_current();
-
-    return s->capabilities[MIGRATION_CAPABILITY_AUTO_CONVERGE];
-}
-
-bool migrate_zero_blocks(void)
-{
-    MigrationState *s;
-
-    s = migrate_get_current();
-
-    return s->capabilities[MIGRATION_CAPABILITY_ZERO_BLOCKS];
-}
-
-bool migrate_postcopy_blocktime(void)
-{
-    MigrationState *s;
-
-    s = migrate_get_current();
-
-    return s->capabilities[MIGRATION_CAPABILITY_POSTCOPY_BLOCKTIME];
-}
-
 bool migrate_use_compression(void)
 {
     MigrationState *s;
@@ -2618,33 +2565,6 @@ int migrate_decompress_threads(void)
     return s->parameters.decompress_threads;
 }
 
-bool migrate_dirty_bitmaps(void)
-{
-    MigrationState *s;
-
-    s = migrate_get_current();
-
-    return s->capabilities[MIGRATION_CAPABILITY_DIRTY_BITMAPS];
-}
-
-bool migrate_ignore_shared(void)
-{
-    MigrationState *s;
-
-    s = migrate_get_current();
-
-    return s->capabilities[MIGRATION_CAPABILITY_X_IGNORE_SHARED];
-}
-
-bool migrate_validate_uuid(void)
-{
-    MigrationState *s;
-
-    s = migrate_get_current();
-
-    return s->capabilities[MIGRATION_CAPABILITY_VALIDATE_UUID];
-}
-
 bool migrate_use_events(void)
 {
     MigrationState *s;
@@ -2663,15 +2583,6 @@ bool migrate_use_multifd(void)
     return s->capabilities[MIGRATION_CAPABILITY_MULTIFD];
 }
 
-bool migrate_pause_before_switchover(void)
-{
-    MigrationState *s;
-
-    s = migrate_get_current();
-
-    return s->capabilities[MIGRATION_CAPABILITY_PAUSE_BEFORE_SWITCHOVER];
-}
-
 int migrate_multifd_channels(void)
 {
     MigrationState *s;
@@ -2783,24 +2694,6 @@ bool migrate_use_block_incremental(void)
     return s->parameters.block_incremental;
 }
 
-bool migrate_background_snapshot(void)
-{
-    MigrationState *s;
-
-    s = migrate_get_current();
-
-    return s->capabilities[MIGRATION_CAPABILITY_BACKGROUND_SNAPSHOT];
-}
-
-bool migrate_postcopy_preempt(void)
-{
-    MigrationState *s;
-
-    s = migrate_get_current();
-
-    return s->capabilities[MIGRATION_CAPABILITY_POSTCOPY_PREEMPT];
-}
-
 /* migration thread support */
 /*
  * Something bad happened to the RP stream, mark an error
diff --git a/migration/options.c b/migration/options.c
new file mode 100644
index 0000000000..47337a9a29
--- /dev/null
+++ b/migration/options.c
@@ -0,0 +1,126 @@
+/*
+ * QEMU migration capabilities
+ *
+ * Copyright IBM, Corp. 2008
+ *
+ * Authors:
+ *  Anthony Liguori   <aliguori@us.ibm.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ *
+ * Contributions after 2012-01-13 are licensed under the terms of the
+ * GNU GPL, version 2 or (at your option) any later version.
+ */
+
+#include "qemu/osdep.h"
+#include "migration.h"
+#include "options.h"
+
+bool migrate_auto_converge(void)
+{
+    MigrationState *s;
+
+    s = migrate_get_current();
+
+    return s->capabilities[MIGRATION_CAPABILITY_AUTO_CONVERGE];
+}
+
+bool migrate_background_snapshot(void)
+{
+    MigrationState *s;
+
+    s = migrate_get_current();
+
+    return s->capabilities[MIGRATION_CAPABILITY_BACKGROUND_SNAPSHOT];
+}
+
+bool migrate_dirty_bitmaps(void)
+{
+    MigrationState *s;
+
+    s = migrate_get_current();
+
+    return s->capabilities[MIGRATION_CAPABILITY_DIRTY_BITMAPS];
+}
+
+bool migrate_ignore_shared(void)
+{
+    MigrationState *s;
+
+    s = migrate_get_current();
+
+    return s->capabilities[MIGRATION_CAPABILITY_X_IGNORE_SHARED];
+}
+
+bool migrate_late_block_activate(void)
+{
+    MigrationState *s;
+
+    s = migrate_get_current();
+
+    return s->capabilities[MIGRATION_CAPABILITY_LATE_BLOCK_ACTIVATE];
+}
+
+bool migrate_pause_before_switchover(void)
+{
+    MigrationState *s;
+
+    s = migrate_get_current();
+
+    return s->capabilities[MIGRATION_CAPABILITY_PAUSE_BEFORE_SWITCHOVER];
+}
+
+bool migrate_postcopy_blocktime(void)
+{
+    MigrationState *s;
+
+    s = migrate_get_current();
+
+    return s->capabilities[MIGRATION_CAPABILITY_POSTCOPY_BLOCKTIME];
+}
+
+bool migrate_postcopy_preempt(void)
+{
+    MigrationState *s;
+
+    s = migrate_get_current();
+
+    return s->capabilities[MIGRATION_CAPABILITY_POSTCOPY_PREEMPT];
+}
+
+bool migrate_postcopy_ram(void)
+{
+    MigrationState *s;
+
+    s = migrate_get_current();
+
+    return s->capabilities[MIGRATION_CAPABILITY_POSTCOPY_RAM];
+}
+
+bool migrate_release_ram(void)
+{
+    MigrationState *s;
+
+    s = migrate_get_current();
+
+    return s->capabilities[MIGRATION_CAPABILITY_RELEASE_RAM];
+}
+
+bool migrate_validate_uuid(void)
+{
+    MigrationState *s;
+
+    s = migrate_get_current();
+
+    return s->capabilities[MIGRATION_CAPABILITY_VALIDATE_UUID];
+}
+
+bool migrate_zero_blocks(void)
+{
+    MigrationState *s;
+
+    s = migrate_get_current();
+
+    return s->capabilities[MIGRATION_CAPABILITY_ZERO_BLOCKS];
+}
diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
index f54f44d899..ce41670466 100644
--- a/migration/postcopy-ram.c
+++ b/migration/postcopy-ram.c
@@ -36,6 +36,7 @@
 #include "yank_functions.h"
 #include "tls.h"
 #include "qemu/userfaultfd.h"
+#include "options.h"
 
 /* Arbitrary limit on size of each discard command,
  * keeps them around ~200 bytes
diff --git a/migration/ram.c b/migration/ram.c
index af749b369b..1c786eb8f4 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -57,6 +57,7 @@
 #include "qemu/iov.h"
 #include "multifd.h"
 #include "sysemu/runstate.h"
+#include "options.h"
 
 #include "hw/boards.h" /* for machine_dump_guest_core() */
 
diff --git a/migration/savevm.c b/migration/savevm.c
index 589ef926ab..ebcf571e37 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -67,6 +67,7 @@
 #include "qemu/yank.h"
 #include "yank_functions.h"
 #include "sysemu/qtest.h"
+#include "options.h"
 
 const unsigned int postcopy_ram_discard_version;
 
diff --git a/migration/socket.c b/migration/socket.c
index e6fdf3c5e1..ebf9ac41af 100644
--- a/migration/socket.c
+++ b/migration/socket.c
@@ -27,6 +27,7 @@
 #include "io/net-listener.h"
 #include "trace.h"
 #include "postcopy-ram.h"
+#include "options.h"
 
 struct SocketOutgoingArgs {
     SocketAddress *saddr;
diff --git a/migration/meson.build b/migration/meson.build
index 0d1bb9f96e..480ff6854a 100644
--- a/migration/meson.build
+++ b/migration/meson.build
@@ -22,6 +22,7 @@ softmmu_ss.add(files(
   'migration.c',
   'multifd.c',
   'multifd-zlib.c',
+  'options.c',
   'postcopy-ram.c',
   'savevm.c',
   'socket.c',
-- 
2.39.2


