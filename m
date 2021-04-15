Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C97E7360F3D
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 17:46:09 +0200 (CEST)
Received: from localhost ([::1]:60256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lX4C0-0007Vo-UI
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 11:46:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lX4A8-0006cX-UI
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 11:44:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lX4A6-0000pk-W7
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 11:44:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618501449;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=+ns3NAAsr16HdYduoGQoswyx4i5qgT4aYsLq+FqKH00=;
 b=NM6C+D5Edx0dxti+m73qK281tUNWe92wWgjcMGA1RbEGZe/cMw6FSDXebKSW8LbVdPPlTG
 Lp3dH8lygHIIsOD18xkeO9I5TcOcGbevfySTjFvO/IdGpBQ0Fq+lzXaWHlh79GNUb5z7Ob
 LxRgH2F3Z+IKLhQNReE+0spDpGcUAx8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-196-Z1E7vTtKOru0qYAB2bDGhA-1; Thu, 15 Apr 2021 11:44:07 -0400
X-MC-Unique: Z1E7vTtKOru0qYAB2bDGhA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D153A881282
 for <qemu-devel@nongnu.org>; Thu, 15 Apr 2021 15:44:06 +0000 (UTC)
Received: from vitty.brq.redhat.com (unknown [10.40.194.222])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AD47919706;
 Thu, 15 Apr 2021 15:44:03 +0000 (UTC)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC] migration: warn about non-migratable configurations
 unless '--no-migration' was specified
Date: Thu, 15 Apr 2021 17:44:02 +0200
Message-Id: <20210415154402.28424-1-vkuznets@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When a migration blocker is added nothing is reported to the user,
inability to migrate such guest may come as a late surprise. As a bare
minimum, we can print a warning. To not pollute the output for those, who
have no intention to migrate their guests, introduce '--no-migration'
option which both block the migration and eliminates warning from

Suggested-by: Eduardo Habkost <ehabkost@redhat.com>
Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
---
 include/qapi/qmp/qerror.h |  3 +++
 include/sysemu/sysemu.h   |  1 +
 migration/migration.c     | 18 +++++++++++++++++-
 qemu-options.hx           |  7 +++++++
 softmmu/globals.c         |  1 +
 softmmu/vl.c              |  3 +++
 6 files changed, 32 insertions(+), 1 deletion(-)

diff --git a/include/qapi/qmp/qerror.h b/include/qapi/qmp/qerror.h
index 596fce0c54e7..2e1563c72f83 100644
--- a/include/qapi/qmp/qerror.h
+++ b/include/qapi/qmp/qerror.h
@@ -50,6 +50,9 @@
 #define QERR_MISSING_PARAMETER \
     "Parameter '%s' is missing"
 
+#define QERR_NO_MIGRATION \
+    "Guest is not migratable ('--no-migration' used)"
+
 #define QERR_PERMISSION_DENIED \
     "Insufficient permission to perform this operation"
 
diff --git a/include/sysemu/sysemu.h b/include/sysemu/sysemu.h
index 8fae667172ac..c65cd5d5a336 100644
--- a/include/sysemu/sysemu.h
+++ b/include/sysemu/sysemu.h
@@ -9,6 +9,7 @@
 /* vl.c */
 
 extern int only_migratable;
+extern int no_migration;
 extern const char *qemu_name;
 extern QemuUUID qemu_uuid;
 extern bool qemu_uuid_set;
diff --git a/migration/migration.c b/migration/migration.c
index ca8b97baa5ac..29a8480ced54 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1077,7 +1077,9 @@ static void fill_source_migration_info(MigrationInfo *info)
     info->blocked = migration_is_blocked(NULL);
     info->has_blocked_reasons = info->blocked;
     info->blocked_reasons = NULL;
-    if (info->blocked) {
+    if (no_migration) {
+        QAPI_LIST_PREPEND(info->blocked_reasons, g_strdup(QERR_NO_MIGRATION));
+    } else if (info->blocked) {
         GSList *cur_blocker = migration_blockers;
 
         /*
@@ -2048,6 +2050,10 @@ void migrate_init(MigrationState *s)
 
 int migrate_add_blocker(Error *reason, Error **errp)
 {
+    if (!no_migration) {
+        warn_report("Guest won't be migratable: %s", error_get_pretty(reason));
+    }
+
     if (only_migratable) {
         error_propagate_prepend(errp, error_copy(reason),
                                 "disallowing migration blocker "
@@ -2155,6 +2161,11 @@ bool migration_is_blocked(Error **errp)
         return true;
     }
 
+    if (no_migration) {
+        error_setg(errp, QERR_NO_MIGRATION);
+        return true;
+    }
+
     if (migration_blockers) {
         error_propagate(errp, error_copy(migration_blockers->data));
         return true;
@@ -2198,6 +2209,11 @@ static bool migrate_prepare(MigrationState *s, bool blk, bool blk_inc,
         return true;
     }
 
+    if (no_migration) {
+        error_setg(errp, QERR_NO_MIGRATION);
+        return false;
+    }
+
     if (migration_is_running(s->state)) {
         error_setg(errp, QERR_MIGRATION_ACTIVE);
         return false;
diff --git a/qemu-options.hx b/qemu-options.hx
index fd21002bd61d..3443130273e9 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -4234,6 +4234,13 @@ SRST
     an unmigratable state.
 ERST
 
+DEF("no-migration", 0, QEMU_OPTION_no_migration, \
+    "-no-migration     disallow migration\n", QEMU_ARCH_ALL)
+SRST
+``-no-migration``
+    Disallow migration. Don't warn about non-migratable configurations.
+ERST
+
 DEF("nodefaults", 0, QEMU_OPTION_nodefaults, \
     "-nodefaults     don't create default devices\n", QEMU_ARCH_ALL)
 SRST
diff --git a/softmmu/globals.c b/softmmu/globals.c
index 7d0fc811835a..bb0d892df307 100644
--- a/softmmu/globals.c
+++ b/softmmu/globals.c
@@ -59,6 +59,7 @@ int boot_menu;
 bool boot_strict;
 uint8_t *boot_splash_filedata;
 int only_migratable; /* turn it off unless user states otherwise */
+int no_migration;
 int icount_align_option;
 
 /* The bytes in qemu_uuid are in the order specified by RFC4122, _not_ in the
diff --git a/softmmu/vl.c b/softmmu/vl.c
index aadb52613888..9a6535e594c3 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -3339,6 +3339,9 @@ void qemu_init(int argc, char **argv, char **envp)
             case QEMU_OPTION_only_migratable:
                 only_migratable = 1;
                 break;
+            case QEMU_OPTION_no_migration:
+                no_migration = 1;
+                break;
             case QEMU_OPTION_nodefaults:
                 has_defaults = 0;
                 break;
-- 
2.30.2


