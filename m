Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A965C6E9640
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 15:50:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppUWY-0003un-Av; Thu, 20 Apr 2023 09:40:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppUWV-0003tI-O9
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 09:40:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppUWO-0005hZ-6G
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 09:40:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681998022;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CDb/Iwd6YqwC07N9+1pDyYMiiCS+XGSRAly6v9UN2Xg=;
 b=GhUtpqQuHip55h5JnmsooWELdJrik1PvQj6uD6+nlkWRoAcnkDuaW02q8dUS3Yp1G7h12+
 Q52MaA1NhSyNmMp0ICaP44zhUa8oDYf352lvK1E7BNqYK3SXGB11hOZ6q1VOKBonFE4dIB
 uuaU02uXR3mVufTffmjjdIum/jaNqjA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-210-WhlVt-nWPFWTlcm-AqS2qg-1; Thu, 20 Apr 2023 09:40:18 -0400
X-MC-Unique: WhlVt-nWPFWTlcm-AqS2qg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 16AF3185A794;
 Thu, 20 Apr 2023 13:40:18 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.171])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 399FF4020BF0;
 Thu, 20 Apr 2023 13:40:15 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 David Hildenbrand <david@redhat.com>, John Snow <jsnow@redhat.com>,
 Fam Zheng <fam@euphon.net>, Hailiang Zhang <zhanghailiang@xfusion.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-block@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Leonardo Bras <leobras@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Eric Blake <eblake@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Subject: [PATCH v2 04/43] migration: Create options.c
Date: Thu, 20 Apr 2023 15:39:23 +0200
Message-Id: <20230420134002.29531-5-quintela@redhat.com>
In-Reply-To: <20230420134002.29531-1-quintela@redhat.com>
References: <20230420134002.29531-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

---

Following David advise:
- looked through the history, capabilities are newer than 2012, so we
  can remove that bit of the header.
- This part is posterior to Anthony.
  Original Author is Orit. Once there,
  I put myself.  Peter Xu also did quite a bit of work here.
  Anyone else wants/needs to be there?  I didn't search too hard
  because nobody asked before to be added.

What do you think?
---
 hw/virtio/virtio-balloon.c     |   1 +
 migration/block-dirty-bitmap.c |   1 +
 migration/block.c              |   1 +
 migration/colo.c               |   1 +
 migration/meson.build          |   1 +
 migration/migration.c          | 109 +----------------------------
 migration/migration.h          |  12 ----
 migration/options.c            | 124 +++++++++++++++++++++++++++++++++
 migration/options.h            |  32 +++++++++
 migration/postcopy-ram.c       |   1 +
 migration/ram.c                |   1 +
 migration/savevm.c             |   1 +
 migration/socket.c             |   1 +
 13 files changed, 166 insertions(+), 120 deletions(-)
 create mode 100644 migration/options.c
 create mode 100644 migration/options.h

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
index b2497bbd32..4b167fa5cf 100644
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
diff --git a/migration/migration.c b/migration/migration.c
index 4bf5df4778..4bcccdd129 100644
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
@@ -2526,56 +2518,11 @@ void qmp_migrate_continue(MigrationStatus state, Error **errp)
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
@@ -2621,33 +2568,6 @@ int migrate_decompress_threads(void)
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
@@ -2666,15 +2586,6 @@ bool migrate_use_multifd(void)
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
@@ -2786,24 +2697,6 @@ bool migrate_use_block_incremental(void)
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
diff --git a/migration/migration.h b/migration/migration.h
index 04e0860b4e..a25fed6ef0 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -449,16 +449,7 @@ MigrationState *migrate_get_current(void);
 
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
@@ -487,9 +478,6 @@ int migrate_compress_threads(void);
 int migrate_compress_wait_thread(void);
 int migrate_decompress_threads(void);
 bool migrate_use_events(void);
-bool migrate_postcopy_blocktime(void);
-bool migrate_background_snapshot(void);
-bool migrate_postcopy_preempt(void);
 
 /* Sending on the return path - generic and then for each message type */
 void migrate_send_rp_shut(MigrationIncomingState *mis,
diff --git a/migration/options.c b/migration/options.c
new file mode 100644
index 0000000000..88a9a45913
--- /dev/null
+++ b/migration/options.c
@@ -0,0 +1,124 @@
+/*
+ * QEMU migration capabilities
+ *
+ * Copyright (c) 2012-2023 Red Hat Inc
+ *
+ * Authors:
+ *   Orit Wasserman <owasserm@redhat.com>
+ *   Juan Quintela <quintela@redhat.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
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
diff --git a/migration/options.h b/migration/options.h
new file mode 100644
index 0000000000..0dfa0af245
--- /dev/null
+++ b/migration/options.h
@@ -0,0 +1,32 @@
+/*
+ * QEMU migration capabilities
+ *
+ * Copyright (c) 2012-2023 Red Hat Inc
+ *
+ * Authors:
+ *   Orit Wasserman <owasserm@redhat.com>
+ *   Juan Quintela <quintela@redhat.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
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
diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
index d7b48dd920..0711500036 100644
--- a/migration/postcopy-ram.c
+++ b/migration/postcopy-ram.c
@@ -37,6 +37,7 @@
 #include "tls.h"
 #include "qemu/userfaultfd.h"
 #include "qemu/mmap-alloc.h"
+#include "options.h"
 
 /* Arbitrary limit on size of each discard command,
  * keeps them around ~200 bytes
diff --git a/migration/ram.c b/migration/ram.c
index 7ad92f8756..4019fb6500 100644
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
-- 
2.39.2


