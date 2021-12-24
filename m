Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 761C147EE84
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Dec 2021 12:17:59 +0100 (CET)
Received: from localhost ([::1]:46970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0iaE-0000zo-Jc
	for lists+qemu-devel@lfdr.de; Fri, 24 Dec 2021 06:17:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nikita.lapshin@virtuozzo.com>)
 id 1n0iUO-00018W-IG
 for qemu-devel@nongnu.org; Fri, 24 Dec 2021 06:11:57 -0500
Received: from relay.sw.ru ([185.231.240.75]:48180)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nikita.lapshin@virtuozzo.com>)
 id 1n0iUL-0003OP-OD
 for qemu-devel@nongnu.org; Fri, 24 Dec 2021 06:11:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=virtuozzo.com; s=relay; h=MIME-Version:Message-Id:Date:Subject:From:
 Content-Type; bh=BCZPOz7PNvWKMmFA73SNdrDpoTzMi0IKzZ/uQSMBGGc=; b=efuiodMQD5EQ
 bv2+/SZNPv8WVruP/XBiYTQlfPHKot8Vbq6iOXkOeehXQwprIJRCbGPV2BU7LLvRgNsFXnWDqMWb3
 GMnbj0GeYJ2kGoiroOyLq/7P6w8qsn22NnpSON9cX6EaZIgBQ+jLOpshRnDdjX/qvXG9TAfa98022
 iaGzc=;
Received: from [10.94.3.117] (helo=nun.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.94.2)
 (envelope-from <nikita.lapshin@virtuozzo.com>)
 id 1n0iUH-004OwN-2L; Fri, 24 Dec 2021 14:11:49 +0300
From: Nikita Lapshin <nikita.lapshin@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: quintela@redhat.com, dgilbert@redhat.com, eblake@redhat.com,
 armbru@redhat.com, eduardo@habkost.net, crosa@redhat.com, kwolf@redhat.com,
 hreitz@redhat.com, nikita.lapshin@virtuozzo.com, vsementsov@virtuozzo.com,
 den@virtuozzo.com
Subject: [PATCH 4/6] migration: Add ram-only capability
Date: Fri, 24 Dec 2021 14:11:46 +0300
Message-Id: <20211224111148.345438-5-nikita.lapshin@virtuozzo.com>
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

If this capability is enabled migration stream
will have RAM section only.

Signed-off-by: Nikita Lapshin <nikita.lapshin@virtuozzo.com>
---
 migration/migration.c | 20 +++++++++++++++++++-
 migration/migration.h |  1 +
 migration/savevm.c    | 11 ++++++++++-
 qapi/migration.json   |  7 +++++--
 4 files changed, 35 insertions(+), 4 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 006447d00a..4d7ef9d8dc 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1257,6 +1257,14 @@ static bool migrate_caps_check(bool *cap_list,
         return false;
     }
 
+    if (cap_list[MIGRATION_CAPABILITY_NO_RAM] &&
+        cap_list[MIGRATION_CAPABILITY_RAM_ONLY]) {
+        error_setg(errp, "ram-only and no-ram aren't "
+                         "compatible with each other");
+
+        return false;
+    }
+
     return true;
 }
 
@@ -2619,6 +2627,15 @@ bool migrate_no_ram(void)
     return s->enabled_capabilities[MIGRATION_CAPABILITY_NO_RAM];
 }
 
+bool migrate_ram_only(void)
+{
+    MigrationState *s;
+
+    s = migrate_get_current();
+
+    return s->enabled_capabilities[MIGRATION_CAPABILITY_RAM_ONLY];
+}
+
 /* migration thread support */
 /*
  * Something bad happened to the RP stream, mark an error
@@ -3973,7 +3990,8 @@ static void *bg_migration_thread(void *opaque)
      * save their state to channel-buffer along with devices.
      */
     cpu_synchronize_all_states();
-    if (qemu_savevm_state_complete_precopy_non_iterable(fb, false, false)) {
+    if (!migrate_ram_only() &&
+        qemu_savevm_state_complete_precopy_non_iterable(fb, false, false)) {
         goto fail;
     }
     /*
diff --git a/migration/migration.h b/migration/migration.h
index 43f7bf8eba..d5a077e00d 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -359,6 +359,7 @@ bool migrate_use_events(void);
 bool migrate_postcopy_blocktime(void);
 bool migrate_background_snapshot(void);
 bool migrate_no_ram(void);
+bool migrate_ram_only(void);
 
 /* Sending on the return path - generic and then for each message type */
 void migrate_send_rp_shut(MigrationIncomingState *mis,
diff --git a/migration/savevm.c b/migration/savevm.c
index ba644083ab..e41ca76000 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -249,6 +249,7 @@ typedef struct SaveStateEntry {
     void *opaque;
     CompatEntry *compat;
     int is_iterable;
+    bool is_ram;
 } SaveStateEntry;
 
 typedef struct SaveState {
@@ -802,6 +803,10 @@ int register_savevm_live(const char *idstr,
         se->is_iterable = 1;
     }
 
+    if (!strcmp("ram", idstr)) {
+        se->is_ram = true;
+    }
+
     pstrcat(se->idstr, sizeof(se->idstr), idstr);
 
     if (instance_id == VMSTATE_INSTANCE_ID_ANY) {
@@ -949,6 +954,10 @@ static bool should_skip(SaveStateEntry *se)
         return true;
     }
 
+    if (migrate_ram_only() && !se->is_ram) {
+        return true;
+    }
+
     return false;
 }
 
@@ -1486,7 +1495,7 @@ int qemu_savevm_state_complete_precopy(QEMUFile *f, bool iterable_only,
         }
     }
 
-    if (iterable_only) {
+    if (iterable_only || migrate_ram_only()) {
         goto flush;
     }
 
diff --git a/qapi/migration.json b/qapi/migration.json
index d53956852c..626fc59d14 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -454,6 +454,8 @@
 #
 # @no-ram: If enabled, migration stream won't contain any ram in it. (since 7.0)
 #
+# @ram-only: If enabled, only RAM sections will be sent. (since 7.0)
+#
 # Features:
 # @unstable: Members @x-colo and @x-ignore-shared are experimental.
 #
@@ -467,7 +469,7 @@
            'block', 'return-path', 'pause-before-switchover', 'multifd',
            'dirty-bitmaps', 'postcopy-blocktime', 'late-block-activate',
            { 'name': 'x-ignore-shared', 'features': [ 'unstable' ] },
-           'validate-uuid', 'background-snapshot', 'no-ram'] }
+           'validate-uuid', 'background-snapshot', 'no-ram', 'ram-only'] }
 ##
 # @MigrationCapabilityStatus:
 #
@@ -521,7 +523,8 @@
 #       {"state": true, "capability": "events"},
 #       {"state": false, "capability": "postcopy-ram"},
 #       {"state": false, "capability": "x-colo"},
-#       {"state": false, "capability": "no-ram"}
+#       {"state": false, "capability": "no-ram"},
+#       {"state": false, "capability": "ram-only"}
 #    ]}
 #
 ##
-- 
2.27.0


