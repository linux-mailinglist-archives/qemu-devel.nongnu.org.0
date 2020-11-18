Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A472B7CAE
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 12:31:19 +0100 (CET)
Received: from localhost ([::1]:38130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfLgE-0005Jp-Qo
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 06:31:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1kfLY3-000574-Nk
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 06:22:53 -0500
Received: from relay.sw.ru ([185.231.240.75]:41852 helo=relay3.sw.ru)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1kfLXq-0003Oj-MC
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 06:22:51 -0500
Received: from [192.168.15.76] (helo=andrey-MS-7B54.sw.ru)
 by relay3.sw.ru with esmtp (Exim 4.94)
 (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1kfLXa-009A89-VF; Wed, 18 Nov 2020 14:22:22 +0300
To: qemu-devel@nongnu.org
Cc: Den Lunev <den@openvz.com>, Eric Blake <eblake@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Subject: [PATCH 1/7] Introduce 'track-writes-ram' migration capability.
Date: Wed, 18 Nov 2020 14:22:27 +0300
Message-Id: <20201118112233.264530-2-andrey.gruzdev@virtuozzo.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201118112233.264530-1-andrey.gruzdev@virtuozzo.com>
References: <20201118112233.264530-1-andrey.gruzdev@virtuozzo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=185.231.240.75;
 envelope-from=andrey.gruzdev@virtuozzo.com; helo=relay3.sw.ru
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 06:22:34
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Reply-to: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
From: Andrey Gruzdev via <qemu-devel@nongnu.org>

Signed-off-by: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
---
 migration/migration.c | 96 +++++++++++++++++++++++++++++++++++++++++++
 migration/migration.h |  1 +
 qapi/migration.json   |  7 +++-
 3 files changed, 103 insertions(+), 1 deletion(-)

diff --git a/migration/migration.c b/migration/migration.c
index 87a9b59f83..ff0364dde0 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -56,6 +56,7 @@
 #include "net/announce.h"
 #include "qemu/queue.h"
 #include "multifd.h"
+#include "sysemu/cpus.h"
 
 #ifdef CONFIG_VFIO
 #include "hw/vfio/vfio-common.h"
@@ -1165,6 +1166,91 @@ static bool migrate_caps_check(bool *cap_list,
         }
     }
 
+    if (cap_list[MIGRATION_CAPABILITY_TRACK_WRITES_RAM]) {
+        if (cap_list[MIGRATION_CAPABILITY_POSTCOPY_RAM]) {
+            error_setg(errp,
+                    "Track-writes is not compatible with postcopy-ram");
+            return false;
+        }
+
+        if (cap_list[MIGRATION_CAPABILITY_DIRTY_BITMAPS]) {
+            error_setg(errp,
+                    "Track-writes is not compatible with dirty-bitmaps");
+            return false;
+        }
+
+        if (cap_list[MIGRATION_CAPABILITY_POSTCOPY_BLOCKTIME]) {
+            error_setg(errp,
+                    "Track-writes is not compatible with postcopy-blocktime");
+            return false;
+        }
+
+        if (cap_list[MIGRATION_CAPABILITY_LATE_BLOCK_ACTIVATE]) {
+            error_setg(errp,
+                    "Track-writes is not compatible with late-block-activate");
+            return false;
+        }
+
+        if (cap_list[MIGRATION_CAPABILITY_RETURN_PATH]) {
+            error_setg(errp,
+                    "Track-writes is not compatible with return-path");
+            return false;
+        }
+
+        if (cap_list[MIGRATION_CAPABILITY_MULTIFD]) {
+            error_setg(errp, "Track-writes is not compatible with multifd");
+            return false;
+        }
+
+        if (cap_list[MIGRATION_CAPABILITY_PAUSE_BEFORE_SWITCHOVER]) {
+            error_setg(errp,
+                    "Track-writes is not compatible with pause-before-switchover");
+            return false;
+        }
+
+        if (cap_list[MIGRATION_CAPABILITY_AUTO_CONVERGE]) {
+            error_setg(errp,
+                    "Track-writes is not compatible with auto-converge");
+            return false;
+        }
+
+        if (cap_list[MIGRATION_CAPABILITY_RELEASE_RAM]) {
+            error_setg(errp,
+                    "Track-writes is not compatible with release-ram");
+            return false;
+        }
+
+        if (cap_list[MIGRATION_CAPABILITY_RDMA_PIN_ALL]) {
+            error_setg(errp,
+                    "Track-writes is not compatible with rdma-pin-all");
+            return false;
+        }
+
+        if (cap_list[MIGRATION_CAPABILITY_COMPRESS]) {
+            error_setg(errp,
+                    "Track-writes is not compatible with compression");
+            return false;
+        }
+
+        if (cap_list[MIGRATION_CAPABILITY_XBZRLE]) {
+            error_setg(errp,
+                    "Track-writes is not compatible with XBZLRE");
+            return false;
+        }
+
+        if (cap_list[MIGRATION_CAPABILITY_X_COLO]) {
+            error_setg(errp,
+                    "Track-writes is not compatible with x-colo");
+            return false;
+        }
+
+        if (cap_list[MIGRATION_CAPABILITY_VALIDATE_UUID]) {
+            error_setg(errp,
+                    "Track-writes is not compatible with validate-uuid");
+            return false;
+        }
+    }
+
     return true;
 }
 
@@ -2490,6 +2576,15 @@ bool migrate_use_block_incremental(void)
     return s->parameters.block_incremental;
 }
 
+bool migrate_track_writes_ram(void)
+{
+    MigrationState *s;
+
+    s = migrate_get_current();
+
+    return s->enabled_capabilities[MIGRATION_CAPABILITY_TRACK_WRITES_RAM];
+}
+
 /* migration thread support */
 /*
  * Something bad happened to the RP stream, mark an error
@@ -3783,6 +3878,7 @@ static Property migration_properties[] = {
     DEFINE_PROP_MIG_CAP("x-block", MIGRATION_CAPABILITY_BLOCK),
     DEFINE_PROP_MIG_CAP("x-return-path", MIGRATION_CAPABILITY_RETURN_PATH),
     DEFINE_PROP_MIG_CAP("x-multifd", MIGRATION_CAPABILITY_MULTIFD),
+    DEFINE_PROP_MIG_CAP("x-track-writes-ram", MIGRATION_CAPABILITY_TRACK_WRITES_RAM),
 
     DEFINE_PROP_END_OF_LIST(),
 };
diff --git a/migration/migration.h b/migration/migration.h
index d096b77f74..339ae720e0 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -341,6 +341,7 @@ int migrate_compress_wait_thread(void);
 int migrate_decompress_threads(void);
 bool migrate_use_events(void);
 bool migrate_postcopy_blocktime(void);
+bool migrate_track_writes_ram(void);
 
 /* Sending on the return path - generic and then for each message type */
 void migrate_send_rp_shut(MigrationIncomingState *mis,
diff --git a/qapi/migration.json b/qapi/migration.json
index 3c75820527..03fe0547f1 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -442,6 +442,11 @@
 # @validate-uuid: Send the UUID of the source to allow the destination
 #                 to ensure it is the same. (since 4.2)
 #
+# @track-writes-ram: If enabled, the migration stream will be a snapshot
+#                    of the VM exactly at the point when the migration
+#                    procedure starts. The VM RAM is saved with running VM.
+#                    (since 5.2)
+#
 # Since: 1.2
 ##
 { 'enum': 'MigrationCapability',
@@ -449,7 +454,7 @@
            'compress', 'events', 'postcopy-ram', 'x-colo', 'release-ram',
            'block', 'return-path', 'pause-before-switchover', 'multifd',
            'dirty-bitmaps', 'postcopy-blocktime', 'late-block-activate',
-           'x-ignore-shared', 'validate-uuid' ] }
+           'x-ignore-shared', 'validate-uuid', 'track-writes-ram'] }
 
 ##
 # @MigrationCapabilityStatus:
-- 
2.25.1


