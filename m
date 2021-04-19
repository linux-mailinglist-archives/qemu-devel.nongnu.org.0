Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E284364834
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 18:29:07 +0200 (CEST)
Received: from localhost ([::1]:51746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYWlm-0007Wh-8l
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 12:29:06 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lYWkU-0006Zb-ER
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 12:27:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40399)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lYWkQ-0003vf-BE
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 12:27:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618849661;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=oC5whbFnSn2JK26u1Q1AfzFurYxQU/N/G6i+yedU1PE=;
 b=PHYlEpfClVHbcnaKNCY31GOneRJ8Zbhwo+viGHgi9ZIs4a6lH4wwslWShZ7DZ4h8fPtstm
 F2+8SAHgY3z+gZpYEU2k+KpiMQb4JatrlQmU0RexZ72QbXaJwLREKHrKCF703JVEug+cuD
 NCSUG5KxksqTIR5WtiKZqXKcn+Mr5/4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-491-qlgcuSTIM2uogoxLkCMvFg-1; Mon, 19 Apr 2021 12:27:39 -0400
X-MC-Unique: qlgcuSTIM2uogoxLkCMvFg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 76548107ACCA;
 Mon, 19 Apr 2021 16:27:38 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 606A15D72E;
 Mon, 19 Apr 2021 16:27:34 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id DE3E9113525D; Mon, 19 Apr 2021 18:27:32 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.0] migration: Drop redundant query-migrate result
 @blocked
Date: Mon, 19 Apr 2021 18:27:32 +0200
Message-Id: <20210419162732.766055-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
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
Cc: peter.maydell@linaro.org, dgilbert@redhat.com, peterx@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Result @blocked is true when and only when result @blocked-reasons is
present.  It's always non-empty when present.  @blocked is redundant;
drop.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 qapi/migration.json   |  7 +++----
 migration/migration.c | 29 +++++++++++++----------------
 monitor/hmp-cmds.c    |  2 +-
 3 files changed, 17 insertions(+), 21 deletions(-)

diff --git a/qapi/migration.json b/qapi/migration.json
index 9bf0bc4d25..7a5bdf9a0d 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -224,9 +224,9 @@
 #        only returned if VFIO device is present, migration is supported by all
 #        VFIO devices and status is 'active' or 'completed' (since 5.2)
 #
-# @blocked: True if outgoing migration is blocked (since 6.0)
-#
-# @blocked-reasons: A list of reasons an outgoing migration is blocked (since 6.0)
+# @blocked-reasons: A list of reasons an outgoing migration is blocked.
+#                   Present and non-empty when migration is blocked.
+#                   (since 6.0)
 #
 # Since: 0.14
 ##
@@ -241,7 +241,6 @@
            '*setup-time': 'int',
            '*cpu-throttle-percentage': 'int',
            '*error-desc': 'str',
-           'blocked': 'bool',
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


