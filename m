Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B4D136EBF4
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 16:06:16 +0200 (CEST)
Received: from localhost ([::1]:33484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc7J1-0006pf-BX
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 10:06:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lc7HY-0005rh-Rv
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 10:04:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46525)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lc7HQ-0007Rr-FI
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 10:04:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619705074;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=BaO1TlaHM3QCCt5c1jYluyDXymMwDmdbLjVFtOcWswc=;
 b=blvmzII8jhMbL+mUPskeiLeL8L9KhXsmUzMC/6u8LD7FwAUihBkN29W9DEvQbcV2qOBhk+
 4Qmi6Os88flVe/zW0SvC8nD18gGfhoMB+C8gaTOL4+5D8Go54Cm1Nv1udBZ2mlFjYNWsfK
 pvF5/t05unSiQ3PlO9Wzi4iUIxGCt1c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-380-jIgybuDRMt-cg-pORwbqcw-1; Thu, 29 Apr 2021 10:04:31 -0400
X-MC-Unique: jIgybuDRMt-cg-pORwbqcw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6DB7A80DDEF;
 Thu, 29 Apr 2021 14:04:30 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B057F5C1A3;
 Thu, 29 Apr 2021 14:04:25 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 40FDC113525D; Thu, 29 Apr 2021 16:04:24 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3] migration: Drop redundant query-migrate result @blocked
Date: Thu, 29 Apr 2021 16:04:24 +0200
Message-Id: <20210429140424.2802929-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
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
Cc: peter.maydell@linaro.org, berrange@redhat.com, dgilbert@redhat.com,
 peterx@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Result @blocked is redundant.  Unfortunately, we realized this too
close to the release to risk dropping it, so we deprecated it
instead, in commit e11ce6c06.

Since it was deprecated from the start, we can delete it without
the customary grace period.  Do so.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
v3: We picked the alternative "[PATCH] migration: Deprecate redundant
    query-migrate result @blocked" for 6.0 (commit e11ce6c065).  v3 is
    v2 squashed into a clean revert that commit.  I kept the R-bys for
    v1 and v2.

v2: Commit message improved.

 qapi/migration.json   |  6 ------
 migration/migration.c | 29 +++++++++++++----------------
 monitor/hmp-cmds.c    |  2 +-
 3 files changed, 14 insertions(+), 23 deletions(-)

diff --git a/qapi/migration.json b/qapi/migration.json
index 0b17cce46b..7a5bdf9a0d 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -228,11 +228,6 @@
 #                   Present and non-empty when migration is blocked.
 #                   (since 6.0)
 #
-# @blocked: True if outgoing migration is blocked (since 6.0)
-#
-# Features:
-# @deprecated: Member @blocked is deprecated.  Use @blocked-reasons instead.
-#
 # Since: 0.14
 ##
 { 'struct': 'MigrationInfo',
@@ -246,7 +241,6 @@
            '*setup-time': 'int',
            '*cpu-throttle-percentage': 'int',
            '*error-desc': 'str',
-           'blocked': { 'type': 'bool', 'features': [ 'deprecated' ] },
            '*blocked-reasons': ['str'],
            '*postcopy-blocktime' : 'uint32',
            '*postcopy-vcpu-blocktime': ['uint32'],
diff --git a/migration/migration.c b/migration/migration.c
index 8ca034136b..fdadee290e 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1073,27 +1073,24 @@ static void populate_vfio_info(MigrationInfo *info)
 static void fill_source_migration_info(MigrationInfo *info)
 {
     MigrationState *s = migrate_get_current();
+    GSList *cur_blocker = migration_blockers;
 
-    info->blocked = migration_is_blocked(NULL);
-    info->has_blocked_reasons = info->blocked;
     info->blocked_reasons = NULL;
-    if (info->blocked) {
-        GSList *cur_blocker = migration_blockers;
 
-        /*
-         * There are two types of reasons a migration might be blocked;
-         * a) devices marked in VMState as non-migratable, and
-         * b) Explicit migration blockers
-         * We need to add both of them here.
-         */
-        qemu_savevm_non_migratable_list(&info->blocked_reasons);
+    /*
+     * There are two types of reasons a migration might be blocked;
+     * a) devices marked in VMState as non-migratable, and
+     * b) Explicit migration blockers
+     * We need to add both of them here.
+     */
+    qemu_savevm_non_migratable_list(&info->blocked_reasons);
 
-        while (cur_blocker) {
-            QAPI_LIST_PREPEND(info->blocked_reasons,
-                              g_strdup(error_get_pretty(cur_blocker->data)));
-            cur_blocker = g_slist_next(cur_blocker);
-        }
+    while (cur_blocker) {
+        QAPI_LIST_PREPEND(info->blocked_reasons,
+                          g_strdup(error_get_pretty(cur_blocker->data)));
+        cur_blocker = g_slist_next(cur_blocker);
     }
+    info->has_blocked_reasons = info->blocked_reasons != NULL;
 
     switch (s->state) {
     case MIGRATION_STATUS_NONE:
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 0ad5b77477..d9bef63373 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -224,7 +224,7 @@ void hmp_info_migrate(Monitor *mon, const QDict *qdict)
 
     migration_global_dump(mon);
 
-    if (info->blocked) {
+    if (info->blocked_reasons) {
         strList *reasons = info->blocked_reasons;
         monitor_printf(mon, "Outgoing migration blocked:\n");
         while (reasons) {
-- 
2.26.3


