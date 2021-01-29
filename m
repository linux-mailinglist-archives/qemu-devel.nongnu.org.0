Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC2B3087B4
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 11:17:22 +0100 (CET)
Received: from localhost ([::1]:53688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5Qq9-0005NW-U0
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 05:17:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1l5Qns-0004Vx-7U
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 05:15:00 -0500
Received: from relay.sw.ru ([185.231.240.75]:34770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1l5Qnq-00049x-2d
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 05:15:00 -0500
Received: from [192.168.15.9] (helo=andrey-MS-7B54.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.94)
 (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1l5QnN-0016VN-P0; Fri, 29 Jan 2021 13:14:29 +0300
To: qemu-devel@nongnu.org
Subject: [PATCH v14 1/5] migration: introduce 'background-snapshot' migration
 capability
Date: Fri, 29 Jan 2021 13:14:03 +0300
Message-Id: <20210129101407.103458-2-andrey.gruzdev@virtuozzo.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210129101407.103458-1-andrey.gruzdev@virtuozzo.com>
References: <20210129101407.103458-1-andrey.gruzdev@virtuozzo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=185.231.240.75;
 envelope-from=andrey.gruzdev@virtuozzo.com; helo=relay.sw.ru
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
Cc: Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Den Lunev <den@openvz.org>, Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
From: andrey.gruzdev--- via <qemu-devel@nongnu.org>

Add new capability to 'qapi/migration.json' schema.
Update migrate_caps_check() to validate enabled capability set
against introduced one. Perform checks for required kernel features
and compatibility with guest memory backends.

Signed-off-by: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
Acked-by: Markus Armbruster <armbru@redhat.com>
---
 migration/migration.c | 102 ++++++++++++++++++++++++++++++++++++++++++
 migration/migration.h |   1 +
 migration/ram.c       |  21 +++++++++
 migration/ram.h       |   4 ++
 qapi/migration.json   |   7 ++-
 5 files changed, 134 insertions(+), 1 deletion(-)

diff --git a/migration/migration.c b/migration/migration.c
index d5136419bf..91184ac8e0 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -58,6 +58,7 @@
 #include "qemu/queue.h"
 #include "multifd.h"
 #include "qemu/yank.h"
+#include "sysemu/cpus.h"
 
 #ifdef CONFIG_VFIO
 #include "hw/vfio/vfio-common.h"
@@ -134,6 +135,38 @@ enum mig_rp_message_type {
     MIG_RP_MSG_MAX
 };
 
+/* Migration capabilities set */
+struct MigrateCapsSet {
+    int size;                       /* Capability set size */
+    MigrationCapability caps[];     /* Variadic array of capabilities */
+};
+typedef struct MigrateCapsSet MigrateCapsSet;
+
+/* Define and initialize MigrateCapsSet */
+#define INITIALIZE_MIGRATE_CAPS_SET(_name, ...)   \
+    MigrateCapsSet _name = {    \
+        .size = sizeof((int []) { __VA_ARGS__ }) / sizeof(int), \
+        .caps = { __VA_ARGS__ } \
+    }
+
+/* Background-snapshot compatibility check list */
+static const
+INITIALIZE_MIGRATE_CAPS_SET(check_caps_background_snapshot,
+    MIGRATION_CAPABILITY_POSTCOPY_RAM,
+    MIGRATION_CAPABILITY_DIRTY_BITMAPS,
+    MIGRATION_CAPABILITY_POSTCOPY_BLOCKTIME,
+    MIGRATION_CAPABILITY_LATE_BLOCK_ACTIVATE,
+    MIGRATION_CAPABILITY_RETURN_PATH,
+    MIGRATION_CAPABILITY_MULTIFD,
+    MIGRATION_CAPABILITY_PAUSE_BEFORE_SWITCHOVER,
+    MIGRATION_CAPABILITY_AUTO_CONVERGE,
+    MIGRATION_CAPABILITY_RELEASE_RAM,
+    MIGRATION_CAPABILITY_RDMA_PIN_ALL,
+    MIGRATION_CAPABILITY_COMPRESS,
+    MIGRATION_CAPABILITY_XBZRLE,
+    MIGRATION_CAPABILITY_X_COLO,
+    MIGRATION_CAPABILITY_VALIDATE_UUID);
+
 /* When we add fault tolerance, we could have several
    migrations at once.  For now we don't need to add
    dynamic creation of migration */
@@ -1097,6 +1130,31 @@ static void fill_source_migration_info(MigrationInfo *info)
     info->status = s->state;
 }
 
+typedef enum WriteTrackingSupport {
+    WT_SUPPORT_UNKNOWN = 0,
+    WT_SUPPORT_ABSENT,
+    WT_SUPPORT_AVAILABLE,
+    WT_SUPPORT_COMPATIBLE
+} WriteTrackingSupport;
+
+static
+WriteTrackingSupport migrate_query_write_tracking(void)
+{
+    /* Check if kernel supports required UFFD features */
+    if (!ram_write_tracking_available()) {
+        return WT_SUPPORT_ABSENT;
+    }
+    /*
+     * Check if current memory configuration is
+     * compatible with required UFFD features.
+     */
+    if (!ram_write_tracking_compatible()) {
+        return WT_SUPPORT_AVAILABLE;
+    }
+
+    return WT_SUPPORT_COMPATIBLE;
+}
+
 /**
  * @migration_caps_check - check capability validity
  *
@@ -1158,6 +1216,39 @@ static bool migrate_caps_check(bool *cap_list,
         }
     }
 
+    if (cap_list[MIGRATION_CAPABILITY_BACKGROUND_SNAPSHOT]) {
+        WriteTrackingSupport wt_support;
+        int idx;
+        /*
+         * Check if 'background-snapshot' capability is supported by
+         * host kernel and compatible with guest memory configuration.
+         */
+        wt_support = migrate_query_write_tracking();
+        if (wt_support < WT_SUPPORT_AVAILABLE) {
+            error_setg(errp, "Background-snapshot is not supported by host kernel");
+            return false;
+        }
+        if (wt_support < WT_SUPPORT_COMPATIBLE) {
+            error_setg(errp, "Background-snapshot is not compatible "
+                    "with guest memory configuration");
+            return false;
+        }
+
+        /*
+         * Check if there are any migration capabilities
+         * incompatible with 'background-snapshot'.
+         */
+        for (idx = 0; idx < check_caps_background_snapshot.size; idx++) {
+            int incomp_cap = check_caps_background_snapshot.caps[idx];
+            if (cap_list[incomp_cap]) {
+                error_setg(errp,
+                        "Background-snapshot is not compatible with %s",
+                        MigrationCapability_str(incomp_cap));
+                return false;
+            }
+        }
+    }
+
     return true;
 }
 
@@ -2499,6 +2590,15 @@ bool migrate_use_block_incremental(void)
     return s->parameters.block_incremental;
 }
 
+bool migrate_background_snapshot(void)
+{
+    MigrationState *s;
+
+    s = migrate_get_current();
+
+    return s->enabled_capabilities[MIGRATION_CAPABILITY_BACKGROUND_SNAPSHOT];
+}
+
 /* migration thread support */
 /*
  * Something bad happened to the RP stream, mark an error
@@ -3792,6 +3892,8 @@ static Property migration_properties[] = {
     DEFINE_PROP_MIG_CAP("x-block", MIGRATION_CAPABILITY_BLOCK),
     DEFINE_PROP_MIG_CAP("x-return-path", MIGRATION_CAPABILITY_RETURN_PATH),
     DEFINE_PROP_MIG_CAP("x-multifd", MIGRATION_CAPABILITY_MULTIFD),
+    DEFINE_PROP_MIG_CAP("x-background-snapshot",
+            MIGRATION_CAPABILITY_BACKGROUND_SNAPSHOT),
 
     DEFINE_PROP_END_OF_LIST(),
 };
diff --git a/migration/migration.h b/migration/migration.h
index d096b77f74..f40338cfbf 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -341,6 +341,7 @@ int migrate_compress_wait_thread(void);
 int migrate_decompress_threads(void);
 bool migrate_use_events(void);
 bool migrate_postcopy_blocktime(void);
+bool migrate_background_snapshot(void);
 
 /* Sending on the return path - generic and then for each message type */
 void migrate_send_rp_shut(MigrationIncomingState *mis,
diff --git a/migration/ram.c b/migration/ram.c
index 7811cde643..ae8de17153 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -3788,6 +3788,27 @@ static int ram_resume_prepare(MigrationState *s, void *opaque)
     return 0;
 }
 
+/* ram_write_tracking_available: check if kernel supports required UFFD features
+ *
+ * Returns true if supports, false otherwise
+ */
+bool ram_write_tracking_available(void)
+{
+    /* TODO: implement */
+    return false;
+}
+
+/* ram_write_tracking_compatible: check if guest configuration is
+ *   compatible with 'write-tracking'
+ *
+ * Returns true if compatible, false otherwise
+ */
+bool ram_write_tracking_compatible(void)
+{
+    /* TODO: implement */
+    return false;
+}
+
 static SaveVMHandlers savevm_ram_handlers = {
     .save_setup = ram_save_setup,
     .save_live_iterate = ram_save_iterate,
diff --git a/migration/ram.h b/migration/ram.h
index 011e85414e..1a9ff90304 100644
--- a/migration/ram.h
+++ b/migration/ram.h
@@ -79,4 +79,8 @@ void colo_flush_ram_cache(void);
 void colo_release_ram_cache(void);
 void colo_incoming_start_dirty_log(void);
 
+/* Background snapshot */
+bool ram_write_tracking_available(void);
+bool ram_write_tracking_compatible(void);
+
 #endif
diff --git a/qapi/migration.json b/qapi/migration.json
index d1d9632c2a..6c12b368aa 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -442,6 +442,11 @@
 # @validate-uuid: Send the UUID of the source to allow the destination
 #                 to ensure it is the same. (since 4.2)
 #
+# @background-snapshot: If enabled, the migration stream will be a snapshot
+#                       of the VM exactly at the point when the migration
+#                       procedure starts. The VM RAM is saved with running VM.
+#                       (since 6.0)
+#
 # Since: 1.2
 ##
 { 'enum': 'MigrationCapability',
@@ -449,7 +454,7 @@
            'compress', 'events', 'postcopy-ram', 'x-colo', 'release-ram',
            'block', 'return-path', 'pause-before-switchover', 'multifd',
            'dirty-bitmaps', 'postcopy-blocktime', 'late-block-activate',
-           'x-ignore-shared', 'validate-uuid' ] }
+           'x-ignore-shared', 'validate-uuid', 'background-snapshot'] }
 
 ##
 # @MigrationCapabilityStatus:
-- 
2.25.1


