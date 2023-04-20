Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B86EE6E9403
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 14:15:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppT8O-0003C0-Lc; Thu, 20 Apr 2023 08:11:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppT7g-0001r7-IO
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 08:10:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppT7a-0003ss-7l
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 08:10:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681992641;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=2C8L8yH8KY7vDdGX6K//44/Y7aD9UVL2dYvUB56TnTk=;
 b=V3J57s07e22Y3NdwFo3JqmAl7hrxOTZXlX8R0ZqTkuXxdk4ak81nZFgy5cuHtbtZIpV1l4
 p3DxuJB7189HJAN4/EyvRAnJOZ3L68dN1OZ4xX7kiifi+7qiNy2sIKyFUWUzvLKjBZClVc
 WWFOmL8Oe8AR1AwPkpgSPatGqzOGQ8w=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-173-pD0XNVQCPCCNdhC_LQzfDw-1; Thu, 20 Apr 2023 08:10:40 -0400
X-MC-Unique: pD0XNVQCPCCNdhC_LQzfDw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 358463C0ED71
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 12:10:40 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.171])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4A5BEC16024;
 Thu, 20 Apr 2023 12:10:39 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>, Leonardo Bras <leobras@redhat.com>,
 Peter Xu <peterx@redhat.com>
Subject: [PATCH v3] migration: move migration_global_dump() to
 migration-hmp-cmds.c
Date: Thu, 20 Apr 2023 14:10:38 +0200
Message-Id: <20230420121038.25167-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

It is only used there, so we can make it static.
Once there, remove spice.h that it is not used.

Signed-off-by: Juan Quintela <quintela@redhat.com>

---

fix David Edmonson ui/qemu-spice.h unintended removal
---
 include/migration/misc.h       |  1 -
 migration/migration-hmp-cmds.c | 22 +++++++++++++++++++++-
 migration/migration.c          | 19 -------------------
 3 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/include/migration/misc.h b/include/migration/misc.h
index 8b49841016..5ebe13b4b9 100644
--- a/include/migration/misc.h
+++ b/include/migration/misc.h
@@ -66,7 +66,6 @@ bool migration_has_finished(MigrationState *);
 bool migration_has_failed(MigrationState *);
 /* ...and after the device transmission */
 bool migration_in_postcopy_after_devices(MigrationState *);
-void migration_global_dump(Monitor *mon);
 /* True if incoming migration entered POSTCOPY_INCOMING_DISCARD */
 bool migration_in_incoming_postcopy(void);
 /* True if incoming migration entered POSTCOPY_INCOMING_ADVISE */
diff --git a/migration/migration-hmp-cmds.c b/migration/migration-hmp-cmds.c
index 72519ea99f..71da91967a 100644
--- a/migration/migration-hmp-cmds.c
+++ b/migration/migration-hmp-cmds.c
@@ -15,7 +15,6 @@
 
 #include "qemu/osdep.h"
 #include "block/qapi.h"
-#include "migration/misc.h"
 #include "migration/snapshot.h"
 #include "monitor/hmp.h"
 #include "monitor/monitor.h"
@@ -30,6 +29,27 @@
 #include "qemu/sockets.h"
 #include "sysemu/runstate.h"
 #include "ui/qemu-spice.h"
+#include "sysemu/sysemu.h"
+#include "migration.h"
+
+static void migration_global_dump(Monitor *mon)
+{
+    MigrationState *ms = migrate_get_current();
+
+    monitor_printf(mon, "globals:\n");
+    monitor_printf(mon, "store-global-state: %s\n",
+                   ms->store_global_state ? "on" : "off");
+    monitor_printf(mon, "only-migratable: %s\n",
+                   only_migratable ? "on" : "off");
+    monitor_printf(mon, "send-configuration: %s\n",
+                   ms->send_configuration ? "on" : "off");
+    monitor_printf(mon, "send-section-footer: %s\n",
+                   ms->send_section_footer ? "on" : "off");
+    monitor_printf(mon, "decompress-error-check: %s\n",
+                   ms->decompress_error_check ? "on" : "off");
+    monitor_printf(mon, "clear-bitmap-shift: %u\n",
+                   ms->clear_bitmap_shift);
+}
 
 void hmp_info_migrate(Monitor *mon, const QDict *qdict)
 {
diff --git a/migration/migration.c b/migration/migration.c
index f311bb5f93..fd9f41fe37 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -4429,25 +4429,6 @@ void migrate_fd_connect(MigrationState *s, Error *error_in)
     s->migration_thread_running = true;
 }
 
-void migration_global_dump(Monitor *mon)
-{
-    MigrationState *ms = migrate_get_current();
-
-    monitor_printf(mon, "globals:\n");
-    monitor_printf(mon, "store-global-state: %s\n",
-                   ms->store_global_state ? "on" : "off");
-    monitor_printf(mon, "only-migratable: %s\n",
-                   only_migratable ? "on" : "off");
-    monitor_printf(mon, "send-configuration: %s\n",
-                   ms->send_configuration ? "on" : "off");
-    monitor_printf(mon, "send-section-footer: %s\n",
-                   ms->send_section_footer ? "on" : "off");
-    monitor_printf(mon, "decompress-error-check: %s\n",
-                   ms->decompress_error_check ? "on" : "off");
-    monitor_printf(mon, "clear-bitmap-shift: %u\n",
-                   ms->clear_bitmap_shift);
-}
-
 #define DEFINE_PROP_MIG_CAP(name, x)             \
     DEFINE_PROP_BOOL(name, MigrationState, enabled_capabilities[x], false)
 
-- 
2.39.2


