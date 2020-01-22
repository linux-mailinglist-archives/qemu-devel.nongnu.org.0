Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 351FD1455E0
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jan 2020 14:26:24 +0100 (CET)
Received: from localhost ([::1]:42040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iuG1V-0000d1-89
	for lists+qemu-devel@lfdr.de; Wed, 22 Jan 2020 08:26:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51913)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iuFyw-0006mk-Mb
 for qemu-devel@nongnu.org; Wed, 22 Jan 2020 08:23:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iuFyv-0002Ma-Fh
 for qemu-devel@nongnu.org; Wed, 22 Jan 2020 08:23:42 -0500
Received: from relay.sw.ru ([185.231.240.75]:42290)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1iuFys-0002Hz-Mk; Wed, 22 Jan 2020 08:23:38 -0500
Received: from vovaso.qa.sw.ru ([10.94.3.0] helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.3)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1iuFyk-00057B-F8; Wed, 22 Jan 2020 16:23:30 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 6/7] migration: handle to_src_file on target only for ram
 postcopy
Date: Wed, 22 Jan 2020 16:23:27 +0300
Message-Id: <20200122132328.31156-7-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200122132328.31156-1-vsementsov@virtuozzo.com>
References: <20200122132328.31156-1-vsementsov@virtuozzo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 185.231.240.75
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
Cc: kwolf@redhat.com, fam@euphon.net, vsementsov@virtuozzo.com,
 quintela@redhat.com, dgilbert@redhat.com, mreitz@redhat.com,
 stefanha@redhat.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If only bitmaps postcopy migration enabled and not ram, this assertion
will fire, as we don't have to_src_file for bitmaps postcopy migration.

migrate_postcopy_ram() accesses migrations state, which may be freed in
main thread, so, we should ref/unref it in postcopy incoming thread.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 migration/savevm.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/migration/savevm.c b/migration/savevm.c
index adfdca26ac..143755389e 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -1832,6 +1832,9 @@ static void *postcopy_ram_listen_thread(void *opaque)
     MigrationIncomingState *mis = migration_incoming_get_current();
     QEMUFile *f = mis->from_src_file;
     int load_res;
+    MigrationState *migr = migrate_get_current();
+
+    object_ref(OBJECT(migr));
 
     migrate_set_state(&mis->state, MIGRATION_STATUS_ACTIVE,
                                    MIGRATION_STATUS_POSTCOPY_ACTIVE);
@@ -1898,6 +1901,8 @@ static void *postcopy_ram_listen_thread(void *opaque)
     mis->have_listen_thread = false;
     postcopy_state_set(POSTCOPY_INCOMING_END);
 
+    object_unref(OBJECT(migr));
+
     return NULL;
 }
 
@@ -2457,12 +2462,14 @@ static bool postcopy_pause_incoming(MigrationIncomingState *mis)
     qemu_fclose(mis->from_src_file);
     mis->from_src_file = NULL;
 
-    assert(mis->to_src_file);
-    qemu_file_shutdown(mis->to_src_file);
-    qemu_mutex_lock(&mis->rp_mutex);
-    qemu_fclose(mis->to_src_file);
-    mis->to_src_file = NULL;
-    qemu_mutex_unlock(&mis->rp_mutex);
+    if (migrate_postcopy_ram()) {
+        assert(mis->to_src_file);
+        qemu_file_shutdown(mis->to_src_file);
+        qemu_mutex_lock(&mis->rp_mutex);
+        qemu_fclose(mis->to_src_file);
+        mis->to_src_file = NULL;
+        qemu_mutex_unlock(&mis->rp_mutex);
+    }
 
     migrate_set_state(&mis->state, MIGRATION_STATUS_POSTCOPY_ACTIVE,
                       MIGRATION_STATUS_POSTCOPY_PAUSED);
-- 
2.21.0


