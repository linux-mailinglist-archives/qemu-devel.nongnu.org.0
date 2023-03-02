Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F410A6A86C3
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 17:36:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXltW-00087v-4L; Thu, 02 Mar 2023 11:35:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pXltT-00083C-IV
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 11:34:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pXltR-0007LJ-3q
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 11:34:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677774896;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GPi2HwTpwFxmLV7ZCRjdlgDMSYxUZj5L3Q1NrDvDaFo=;
 b=FoBMwbTTg56W4+gh8qUnHr3wzpYaAlHSCWve0BHSo8haT9kv9ud2S00a7E1TaMFzC2yQok
 1mEyCq7GIPakAuqZm4uHkV/o2rKt3gFpNXerIWpRTxewOX1ovs82cE7Ah4Yv75T+ITLmQn
 IE8MVPuihp/0HtsC3qKKyd2aY9A02Gg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-665-7V0hJeMaNx-CyvaS3b2WFg-1; Thu, 02 Mar 2023 11:34:53 -0500
X-MC-Unique: 7V0hJeMaNx-CyvaS3b2WFg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 985F0889047;
 Thu,  2 Mar 2023 16:34:52 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BE79F492C3E;
 Thu,  2 Mar 2023 16:34:43 +0000 (UTC)
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
Subject: [PATCH 14/43] migration: Move migrate_caps_check() to options.c
Date: Thu,  2 Mar 2023 17:33:41 +0100
Message-Id: <20230302163410.11399-15-quintela@redhat.com>
In-Reply-To: <20230302163410.11399-1-quintela@redhat.com>
References: <20230302163410.11399-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
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

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/options.h   |   4 +
 migration/migration.c | 190 -----------------------------------------
 migration/options.c   | 192 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 196 insertions(+), 190 deletions(-)

diff --git a/migration/options.h b/migration/options.h
index eaa2b6d2cb..2f928eb563 100644
--- a/migration/options.h
+++ b/migration/options.h
@@ -40,4 +40,8 @@ bool migrate_xbzrle(void);
 bool migrate_zero_blocks(void);
 bool migrate_zero_copy_send(void);
 
+/* capabilities helpers */
+
+bool migrate_caps_check(bool *old_caps, bool *new_caps, Error **errp);
+
 #endif
diff --git a/migration/migration.c b/migration/migration.c
index 8424eaf2e2..dd8df53684 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -136,39 +136,6 @@ enum mig_rp_message_type {
     MIG_RP_MSG_MAX
 };
 
-/* Migration capabilities set */
-struct MigrateCapsSet {
-    int size;                       /* Capability set size */
-    MigrationCapability caps[];     /* Variadic array of capabilities */
-};
-typedef struct MigrateCapsSet MigrateCapsSet;
-
-/* Define and initialize MigrateCapsSet */
-#define INITIALIZE_MIGRATE_CAPS_SET(_name, ...)   \
-    MigrateCapsSet _name = {    \
-        .size = sizeof((int []) { __VA_ARGS__ }) / sizeof(int), \
-        .caps = { __VA_ARGS__ } \
-    }
-
-/* Background-snapshot compatibility check list */
-static const
-INITIALIZE_MIGRATE_CAPS_SET(check_caps_background_snapshot,
-    MIGRATION_CAPABILITY_POSTCOPY_RAM,
-    MIGRATION_CAPABILITY_DIRTY_BITMAPS,
-    MIGRATION_CAPABILITY_POSTCOPY_BLOCKTIME,
-    MIGRATION_CAPABILITY_LATE_BLOCK_ACTIVATE,
-    MIGRATION_CAPABILITY_RETURN_PATH,
-    MIGRATION_CAPABILITY_MULTIFD,
-    MIGRATION_CAPABILITY_PAUSE_BEFORE_SWITCHOVER,
-    MIGRATION_CAPABILITY_AUTO_CONVERGE,
-    MIGRATION_CAPABILITY_RELEASE_RAM,
-    MIGRATION_CAPABILITY_RDMA_PIN_ALL,
-    MIGRATION_CAPABILITY_COMPRESS,
-    MIGRATION_CAPABILITY_XBZRLE,
-    MIGRATION_CAPABILITY_X_COLO,
-    MIGRATION_CAPABILITY_VALIDATE_UUID,
-    MIGRATION_CAPABILITY_ZERO_COPY_SEND);
-
 /* When we add fault tolerance, we could have several
    migrations at once.  For now we don't need to add
    dynamic creation of migration */
@@ -1233,163 +1200,6 @@ static void fill_source_migration_info(MigrationInfo *info)
     info->status = state;
 }
 
-typedef enum WriteTrackingSupport {
-    WT_SUPPORT_UNKNOWN = 0,
-    WT_SUPPORT_ABSENT,
-    WT_SUPPORT_AVAILABLE,
-    WT_SUPPORT_COMPATIBLE
-} WriteTrackingSupport;
-
-static
-WriteTrackingSupport migrate_query_write_tracking(void)
-{
-    /* Check if kernel supports required UFFD features */
-    if (!ram_write_tracking_available()) {
-        return WT_SUPPORT_ABSENT;
-    }
-    /*
-     * Check if current memory configuration is
-     * compatible with required UFFD features.
-     */
-    if (!ram_write_tracking_compatible()) {
-        return WT_SUPPORT_AVAILABLE;
-    }
-
-    return WT_SUPPORT_COMPATIBLE;
-}
-
-/**
- * @migration_caps_check - check capability compatibility
- *
- * @old_caps: old capability list
- * @new_caps: new capability list
- * @errp: set *errp if the check failed, with reason
- *
- * Returns true if check passed, otherwise false.
- */
-static bool migrate_caps_check(bool *old_caps, bool *new_caps, Error **errp)
-{
-    MigrationIncomingState *mis = migration_incoming_get_current();
-
-#ifndef CONFIG_LIVE_BLOCK_MIGRATION
-    if (new_caps[MIGRATION_CAPABILITY_BLOCK]) {
-        error_setg(errp, "QEMU compiled without old-style (blk/-b, inc/-i) "
-                   "block migration");
-        error_append_hint(errp, "Use drive_mirror+NBD instead.\n");
-        return false;
-    }
-#endif
-
-#ifndef CONFIG_REPLICATION
-    if (new_caps[MIGRATION_CAPABILITY_X_COLO]) {
-        error_setg(errp, "QEMU compiled without replication module"
-                   " can't enable COLO");
-        error_append_hint(errp, "Please enable replication before COLO.\n");
-        return false;
-    }
-#endif
-
-    if (new_caps[MIGRATION_CAPABILITY_POSTCOPY_RAM]) {
-        /* This check is reasonably expensive, so only when it's being
-         * set the first time, also it's only the destination that needs
-         * special support.
-         */
-        if (!old_caps[MIGRATION_CAPABILITY_POSTCOPY_RAM] &&
-            runstate_check(RUN_STATE_INMIGRATE) &&
-            !postcopy_ram_supported_by_host(mis)) {
-            /* postcopy_ram_supported_by_host will have emitted a more
-             * detailed message
-             */
-            error_setg(errp, "Postcopy is not supported");
-            return false;
-        }
-
-        if (new_caps[MIGRATION_CAPABILITY_X_IGNORE_SHARED]) {
-            error_setg(errp, "Postcopy is not compatible with ignore-shared");
-            return false;
-        }
-    }
-
-    if (new_caps[MIGRATION_CAPABILITY_BACKGROUND_SNAPSHOT]) {
-        WriteTrackingSupport wt_support;
-        int idx;
-        /*
-         * Check if 'background-snapshot' capability is supported by
-         * host kernel and compatible with guest memory configuration.
-         */
-        wt_support = migrate_query_write_tracking();
-        if (wt_support < WT_SUPPORT_AVAILABLE) {
-            error_setg(errp, "Background-snapshot is not supported by host kernel");
-            return false;
-        }
-        if (wt_support < WT_SUPPORT_COMPATIBLE) {
-            error_setg(errp, "Background-snapshot is not compatible "
-                    "with guest memory configuration");
-            return false;
-        }
-
-        /*
-         * Check if there are any migration capabilities
-         * incompatible with 'background-snapshot'.
-         */
-        for (idx = 0; idx < check_caps_background_snapshot.size; idx++) {
-            int incomp_cap = check_caps_background_snapshot.caps[idx];
-            if (new_caps[incomp_cap]) {
-                error_setg(errp,
-                        "Background-snapshot is not compatible with %s",
-                        MigrationCapability_str(incomp_cap));
-                return false;
-            }
-        }
-    }
-
-#ifdef CONFIG_LINUX
-    if (new_caps[MIGRATION_CAPABILITY_ZERO_COPY_SEND] &&
-        (!new_caps[MIGRATION_CAPABILITY_MULTIFD] ||
-         new_caps[MIGRATION_CAPABILITY_COMPRESS] ||
-         new_caps[MIGRATION_CAPABILITY_XBZRLE] ||
-         migrate_multifd_compression() ||
-         migrate_use_tls())) {
-        error_setg(errp,
-                   "Zero copy only available for non-compressed non-TLS multifd migration");
-        return false;
-    }
-#else
-    if (new_caps[MIGRATION_CAPABILITY_ZERO_COPY_SEND]) {
-        error_setg(errp,
-                   "Zero copy currently only available on Linux");
-        return false;
-    }
-#endif
-
-    if (new_caps[MIGRATION_CAPABILITY_POSTCOPY_PREEMPT]) {
-        if (!new_caps[MIGRATION_CAPABILITY_POSTCOPY_RAM]) {
-            error_setg(errp, "Postcopy preempt requires postcopy-ram");
-            return false;
-        }
-
-        /*
-         * Preempt mode requires urgent pages to be sent in separate
-         * channel, OTOH compression logic will disorder all pages into
-         * different compression channels, which is not compatible with the
-         * preempt assumptions on channel assignments.
-         */
-        if (new_caps[MIGRATION_CAPABILITY_COMPRESS]) {
-            error_setg(errp, "Postcopy preempt not compatible with compress");
-            return false;
-        }
-    }
-
-    if (new_caps[MIGRATION_CAPABILITY_MULTIFD]) {
-        if (new_caps[MIGRATION_CAPABILITY_COMPRESS]) {
-            error_setg(errp, "Multifd is not compatible with compress");
-            return false;
-        }
-    }
-
-    return true;
-}
-
 static void fill_destination_migration_info(MigrationInfo *info)
 {
     MigrationIncomingState *mis = migration_incoming_get_current();
diff --git a/migration/options.c b/migration/options.c
index ddf23ede6f..2cae0b8f08 100644
--- a/migration/options.c
+++ b/migration/options.c
@@ -14,7 +14,10 @@
  */
 
 #include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "sysemu/runstate.h"
 #include "migration.h"
+#include "ram.h"
 #include "options.h"
 
 bool migrate_auto_converge(void)
@@ -200,3 +203,192 @@ bool migrate_zero_copy_send(void)
 
     return s->capabilities[MIGRATION_CAPABILITY_ZERO_COPY_SEND];
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
+    MIGRATION_CAPABILITY_VALIDATE_UUID,
+    MIGRATION_CAPABILITY_ZERO_COPY_SEND);
+
+/**
+ * @migration_caps_check - check capability compatibility
+ *
+ * @old_caps: old capability list
+ * @new_caps: new capability list
+ * @errp: set *errp if the check failed, with reason
+ *
+ * Returns true if check passed, otherwise false.
+ */
+bool migrate_caps_check(bool *old_caps, bool *new_caps, Error **errp)
+{
+    MigrationIncomingState *mis = migration_incoming_get_current();
+
+#ifndef CONFIG_LIVE_BLOCK_MIGRATION
+    if (new_caps[MIGRATION_CAPABILITY_BLOCK]) {
+        error_setg(errp, "QEMU compiled without old-style (blk/-b, inc/-i) "
+                   "block migration");
+        error_append_hint(errp, "Use drive_mirror+NBD instead.\n");
+        return false;
+    }
+#endif
+
+#ifndef CONFIG_REPLICATION
+    if (new_caps[MIGRATION_CAPABILITY_X_COLO]) {
+        error_setg(errp, "QEMU compiled without replication module"
+                   " can't enable COLO");
+        error_append_hint(errp, "Please enable replication before COLO.\n");
+        return false;
+    }
+#endif
+
+    if (new_caps[MIGRATION_CAPABILITY_POSTCOPY_RAM]) {
+        /* This check is reasonably expensive, so only when it's being
+         * set the first time, also it's only the destination that needs
+         * special support.
+         */
+        if (!old_caps[MIGRATION_CAPABILITY_POSTCOPY_RAM] &&
+            runstate_check(RUN_STATE_INMIGRATE) &&
+            !postcopy_ram_supported_by_host(mis)) {
+            /* postcopy_ram_supported_by_host will have emitted a more
+             * detailed message
+             */
+            error_setg(errp, "Postcopy is not supported");
+            return false;
+        }
+
+        if (new_caps[MIGRATION_CAPABILITY_X_IGNORE_SHARED]) {
+            error_setg(errp, "Postcopy is not compatible with ignore-shared");
+            return false;
+        }
+    }
+
+    if (new_caps[MIGRATION_CAPABILITY_BACKGROUND_SNAPSHOT]) {
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
+            if (new_caps[incomp_cap]) {
+                error_setg(errp,
+                        "Background-snapshot is not compatible with %s",
+                        MigrationCapability_str(incomp_cap));
+                return false;
+            }
+        }
+    }
+
+#ifdef CONFIG_LINUX
+    if (new_caps[MIGRATION_CAPABILITY_ZERO_COPY_SEND] &&
+        (!new_caps[MIGRATION_CAPABILITY_MULTIFD] ||
+         new_caps[MIGRATION_CAPABILITY_COMPRESS] ||
+         new_caps[MIGRATION_CAPABILITY_XBZRLE] ||
+         migrate_multifd_compression() ||
+         migrate_use_tls())) {
+        error_setg(errp,
+                   "Zero copy only available for non-compressed non-TLS multifd migration");
+        return false;
+    }
+#else
+    if (new_caps[MIGRATION_CAPABILITY_ZERO_COPY_SEND]) {
+        error_setg(errp,
+                   "Zero copy currently only available on Linux");
+        return false;
+    }
+#endif
+
+    if (new_caps[MIGRATION_CAPABILITY_POSTCOPY_PREEMPT]) {
+        if (!new_caps[MIGRATION_CAPABILITY_POSTCOPY_RAM]) {
+            error_setg(errp, "Postcopy preempt requires postcopy-ram");
+            return false;
+        }
+
+        /*
+         * Preempt mode requires urgent pages to be sent in separate
+         * channel, OTOH compression logic will disorder all pages into
+         * different compression channels, which is not compatible with the
+         * preempt assumptions on channel assignments.
+         */
+        if (new_caps[MIGRATION_CAPABILITY_COMPRESS]) {
+            error_setg(errp, "Postcopy preempt not compatible with compress");
+            return false;
+        }
+    }
+
+    if (new_caps[MIGRATION_CAPABILITY_MULTIFD]) {
+        if (new_caps[MIGRATION_CAPABILITY_COMPRESS]) {
+            error_setg(errp, "Multifd is not compatible with compress");
+            return false;
+        }
+    }
+
+    return true;
+}
-- 
2.39.2


