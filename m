Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E80F447EE7E
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Dec 2021 12:14:22 +0100 (CET)
Received: from localhost ([::1]:39074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0iWj-0003sV-A7
	for lists+qemu-devel@lfdr.de; Fri, 24 Dec 2021 06:14:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nikita.lapshin@virtuozzo.com>)
 id 1n0iUP-00018Z-Rm
 for qemu-devel@nongnu.org; Fri, 24 Dec 2021 06:11:59 -0500
Received: from relay.sw.ru ([185.231.240.75]:48176)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nikita.lapshin@virtuozzo.com>)
 id 1n0iUM-0003OR-7K
 for qemu-devel@nongnu.org; Fri, 24 Dec 2021 06:11:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=virtuozzo.com; s=relay; h=MIME-Version:Message-Id:Date:Subject:From:
 Content-Type; bh=Yee3Ax2klg8vh7BdC/9EFRNijNMHc9EKU3OOmfpV7Xc=; b=JU+gPCBuBLpu
 Ypmg0/9zs0XS78HZmD1uJjps/QL+jrEqVVuJ5o+r65zIItXIqpGsZ+mGvAEEj3ZNz4bf8J9V5DjjI
 E6OA5JTUxwSADFcDRReEwO54EicjV5nsJUhQpc+oSm3cXxWUb1Qd1u2plY1g5p6gWfLh/dj7OhMZS
 ZYaPs=;
Received: from [10.94.3.117] (helo=nun.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.94.2)
 (envelope-from <nikita.lapshin@virtuozzo.com>)
 id 1n0iUH-004OwN-0C; Fri, 24 Dec 2021 14:11:49 +0300
From: Nikita Lapshin <nikita.lapshin@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: quintela@redhat.com, dgilbert@redhat.com, eblake@redhat.com,
 armbru@redhat.com, eduardo@habkost.net, crosa@redhat.com, kwolf@redhat.com,
 hreitz@redhat.com, nikita.lapshin@virtuozzo.com, vsementsov@virtuozzo.com,
 den@virtuozzo.com
Subject: [PATCH 3/6] migration: Add no-ram capability
Date: Fri, 24 Dec 2021 14:11:45 +0300
Message-Id: <20211224111148.345438-4-nikita.lapshin@virtuozzo.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211224111148.345438-1-nikita.lapshin@virtuozzo.com>
References: <20211224111148.345438-1-nikita.lapshin@virtuozzo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=185.231.240.75;
 envelope-from=nikita.lapshin@virtuozzo.com; helo=relay.sw.ru
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This capability disable RAM section in migration stream.

Signed-off-by: Nikita Lapshin <nikita.lapshin@virtuozzo.com>
---
 migration/migration.c | 9 +++++++++
 migration/migration.h | 1 +
 migration/ram.c       | 6 ++++++
 qapi/migration.json   | 8 +++++---
 4 files changed, 21 insertions(+), 3 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 3de11ae921..006447d00a 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -2610,6 +2610,15 @@ bool migrate_background_snapshot(void)
     return s->enabled_capabilities[MIGRATION_CAPABILITY_BACKGROUND_SNAPSHOT];
 }
 
+bool migrate_no_ram(void)
+{
+    MigrationState *s;
+
+    s = migrate_get_current();
+
+    return s->enabled_capabilities[MIGRATION_CAPABILITY_NO_RAM];
+}
+
 /* migration thread support */
 /*
  * Something bad happened to the RP stream, mark an error
diff --git a/migration/migration.h b/migration/migration.h
index 8130b703eb..43f7bf8eba 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -358,6 +358,7 @@ int migrate_decompress_threads(void);
 bool migrate_use_events(void);
 bool migrate_postcopy_blocktime(void);
 bool migrate_background_snapshot(void);
+bool migrate_no_ram(void);
 
 /* Sending on the return path - generic and then for each message type */
 void migrate_send_rp_shut(MigrationIncomingState *mis,
diff --git a/migration/ram.c b/migration/ram.c
index 57efa67f20..aa3583d0bc 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -4339,6 +4339,11 @@ static int ram_resume_prepare(MigrationState *s, void *opaque)
     return 0;
 }
 
+static bool ram_is_active(void* opaque)
+{
+    return !migrate_no_ram();
+}
+
 static SaveVMHandlers savevm_ram_handlers = {
     .save_setup = ram_save_setup,
     .save_live_iterate = ram_save_iterate,
@@ -4351,6 +4356,7 @@ static SaveVMHandlers savevm_ram_handlers = {
     .load_setup = ram_load_setup,
     .load_cleanup = ram_load_cleanup,
     .resume_prepare = ram_resume_prepare,
+    .is_active = ram_is_active,
 };
 
 static void ram_mig_ram_block_resized(RAMBlockNotifier *n, void *host,
diff --git a/qapi/migration.json b/qapi/migration.json
index bbfd48cf0b..d53956852c 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -452,6 +452,8 @@
 #                       procedure starts. The VM RAM is saved with running VM.
 #                       (since 6.0)
 #
+# @no-ram: If enabled, migration stream won't contain any ram in it. (since 7.0)
+#
 # Features:
 # @unstable: Members @x-colo and @x-ignore-shared are experimental.
 #
@@ -465,8 +467,7 @@
            'block', 'return-path', 'pause-before-switchover', 'multifd',
            'dirty-bitmaps', 'postcopy-blocktime', 'late-block-activate',
            { 'name': 'x-ignore-shared', 'features': [ 'unstable' ] },
-           'validate-uuid', 'background-snapshot'] }
-
+           'validate-uuid', 'background-snapshot', 'no-ram'] }
 ##
 # @MigrationCapabilityStatus:
 #
@@ -519,7 +520,8 @@
 #       {"state": false, "capability": "compress"},
 #       {"state": true, "capability": "events"},
 #       {"state": false, "capability": "postcopy-ram"},
-#       {"state": false, "capability": "x-colo"}
+#       {"state": false, "capability": "x-colo"},
+#       {"state": false, "capability": "no-ram"}
 #    ]}
 #
 ##
-- 
2.27.0


