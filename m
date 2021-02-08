Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A518C3138AB
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 16:59:08 +0100 (CET)
Received: from localhost ([::1]:57328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l98wN-0004GF-My
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 10:59:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l94ju-0001aU-9w
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 06:29:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48036)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l94jp-0002FI-Jy
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 06:29:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612783790;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xcb4G8369t2XeFuLgAX+GndF/xmjtPSZoLxt6aho764=;
 b=RyHzNMFzSGHKgYiy1BVLmgVfQgYyaj38g2KkwIb0RP/OSa/pqWhwy87VPislhtdd5186r3
 3MBlyY9jIZF7fEIyctqb5nsK34DZ2l9wSmSp4ej0FyThsr0bdzebj9nTQam2RD2kZEF69a
 zuXoLEohTsDMZQvfEfF0CSd32doFZYI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-345-VswcF4eUP1ijCeLT95CoAA-1; Mon, 08 Feb 2021 06:29:43 -0500
X-MC-Unique: VswcF4eUP1ijCeLT95CoAA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 07B2BCE648;
 Mon,  8 Feb 2021 11:29:42 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-115-22.ams2.redhat.com
 [10.36.115.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 10DD01002388;
 Mon,  8 Feb 2021 11:29:38 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, andrey.gruzdev@virtuozzo.com, berrange@redhat.com,
 gaojinhao@huawei.com, armbru@redhat.com, mst@redhat.com, philmd@redhat.com,
 wainersm@redhat.com, s.reiter@proxmox.com
Subject: [PULL 04/27] migration: introduce 'background-snapshot' migration
 capability
Date: Mon,  8 Feb 2021 11:28:55 +0000
Message-Id: <20210208112918.185058-5-dgilbert@redhat.com>
In-Reply-To: <20210208112918.185058-1-dgilbert@redhat.com>
References: <20210208112918.185058-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>

Add new capability to 'qapi/migration.json' schema.
Update migrate_caps_check() to validate enabled capability set
against introduced one. Perform checks for required kernel features
and compatibility with guest memory backends.

Signed-off-by: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
Acked-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20210129101407.103458-2-andrey.gruzdev@virtuozzo.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/migration.c | 102 ++++++++++++++++++++++++++++++++++++++++++
 migration/migration.h |   1 +
 migration/ram.c       |  21 +++++++++
 migration/ram.h       |   4 ++
 qapi/migration.json   |   7 ++-
 5 files changed, 134 insertions(+), 1 deletion(-)

diff --git a/migration/migration.c b/migration/migration.c
index 1986cb8573..2262f348af 100644
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
@@ -1089,6 +1122,31 @@ static void fill_source_migration_info(MigrationInfo *info)
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
@@ -1150,6 +1208,39 @@ static bool migrate_caps_check(bool *cap_list,
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
 
@@ -2491,6 +2582,15 @@ bool migrate_use_block_incremental(void)
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
@@ -3784,6 +3884,8 @@ static Property migration_properties[] = {
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
2.29.2


