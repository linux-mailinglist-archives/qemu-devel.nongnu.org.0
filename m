Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE6826E95B9
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 15:22:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppUBE-0001rK-Qw; Thu, 20 Apr 2023 09:18:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppUB3-0001b2-Mz
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 09:18:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppUB1-0005jo-Tg
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 09:18:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681996698;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3/qIwzwOLz11lHNsRHqRlaNtXndhl96MSsfSLJn65YM=;
 b=UpbU0J49eRjdUDtUaAtXXbHgNyHFc/0EhfNQsbDf/ws5K1n1CmaDNeRlre9cUnL2KGjZVe
 JLQQmxeGvlSgMMob6tWXfyWNjZUS+sLTLGkmPPDy140A7AW1AixL+EYqnN3D4jQhtpP8DS
 uiLDqdARvokNj8C2zn6ddZEBEdkNFt0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-267-5zMSJf4rPCqlIX6dm4yJ3A-1; Thu, 20 Apr 2023 09:18:17 -0400
X-MC-Unique: 5zMSJf4rPCqlIX6dm4yJ3A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AB94D101A552;
 Thu, 20 Apr 2023 13:18:16 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.171])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E5FD3C16024;
 Thu, 20 Apr 2023 13:18:15 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Subject: [PULL 20/20] migration: Pass migrate_caps_check() the old and new caps
Date: Thu, 20 Apr 2023 15:17:51 +0200
Message-Id: <20230420131751.28534-21-quintela@redhat.com>
In-Reply-To: <20230420131751.28534-1-quintela@redhat.com>
References: <20230420131751.28534-1-quintela@redhat.com>
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

We used to pass the old capabilities array and the new
capabilities as a list.

Signed-off-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 migration/migration.c | 80 +++++++++++++++++--------------------------
 1 file changed, 31 insertions(+), 49 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 0c2376bc7e..7b0d4a9d8f 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1300,30 +1300,20 @@ WriteTrackingSupport migrate_query_write_tracking(void)
 }
 
 /**
- * @migration_caps_check - check capability validity
+ * @migration_caps_check - check capability compatibility
  *
- * @cap_list: old capability list, array of bool
- * @params: new capabilities to be applied soon
+ * @old_caps: old capability list
+ * @new_caps: new capability list
  * @errp: set *errp if the check failed, with reason
  *
  * Returns true if check passed, otherwise false.
  */
-static bool migrate_caps_check(bool *cap_list,
-                               MigrationCapabilityStatusList *params,
-                               Error **errp)
+static bool migrate_caps_check(bool *old_caps, bool *new_caps, Error **errp)
 {
-    MigrationCapabilityStatusList *cap;
-    bool old_postcopy_cap;
     MigrationIncomingState *mis = migration_incoming_get_current();
 
-    old_postcopy_cap = cap_list[MIGRATION_CAPABILITY_POSTCOPY_RAM];
-
-    for (cap = params; cap; cap = cap->next) {
-        cap_list[cap->value->capability] = cap->value->state;
-    }
-
 #ifndef CONFIG_LIVE_BLOCK_MIGRATION
-    if (cap_list[MIGRATION_CAPABILITY_BLOCK]) {
+    if (new_caps[MIGRATION_CAPABILITY_BLOCK]) {
         error_setg(errp, "QEMU compiled without old-style (blk/-b, inc/-i) "
                    "block migration");
         error_append_hint(errp, "Use drive_mirror+NBD instead.\n");
@@ -1332,7 +1322,7 @@ static bool migrate_caps_check(bool *cap_list,
 #endif
 
 #ifndef CONFIG_REPLICATION
-    if (cap_list[MIGRATION_CAPABILITY_X_COLO]) {
+    if (new_caps[MIGRATION_CAPABILITY_X_COLO]) {
         error_setg(errp, "QEMU compiled without replication module"
                    " can't enable COLO");
         error_append_hint(errp, "Please enable replication before COLO.\n");
@@ -1340,12 +1330,13 @@ static bool migrate_caps_check(bool *cap_list,
     }
 #endif
 
-    if (cap_list[MIGRATION_CAPABILITY_POSTCOPY_RAM]) {
+    if (new_caps[MIGRATION_CAPABILITY_POSTCOPY_RAM]) {
         /* This check is reasonably expensive, so only when it's being
          * set the first time, also it's only the destination that needs
          * special support.
          */
-        if (!old_postcopy_cap && runstate_check(RUN_STATE_INMIGRATE) &&
+        if (!old_caps[MIGRATION_CAPABILITY_POSTCOPY_RAM] &&
+            runstate_check(RUN_STATE_INMIGRATE) &&
             !postcopy_ram_supported_by_host(mis)) {
             /* postcopy_ram_supported_by_host will have emitted a more
              * detailed message
@@ -1354,13 +1345,13 @@ static bool migrate_caps_check(bool *cap_list,
             return false;
         }
 
-        if (cap_list[MIGRATION_CAPABILITY_X_IGNORE_SHARED]) {
+        if (new_caps[MIGRATION_CAPABILITY_X_IGNORE_SHARED]) {
             error_setg(errp, "Postcopy is not compatible with ignore-shared");
             return false;
         }
     }
 
-    if (cap_list[MIGRATION_CAPABILITY_BACKGROUND_SNAPSHOT]) {
+    if (new_caps[MIGRATION_CAPABILITY_BACKGROUND_SNAPSHOT]) {
         WriteTrackingSupport wt_support;
         int idx;
         /*
@@ -1384,7 +1375,7 @@ static bool migrate_caps_check(bool *cap_list,
          */
         for (idx = 0; idx < check_caps_background_snapshot.size; idx++) {
             int incomp_cap = check_caps_background_snapshot.caps[idx];
-            if (cap_list[incomp_cap]) {
+            if (new_caps[incomp_cap]) {
                 error_setg(errp,
                         "Background-snapshot is not compatible with %s",
                         MigrationCapability_str(incomp_cap));
@@ -1394,10 +1385,10 @@ static bool migrate_caps_check(bool *cap_list,
     }
 
 #ifdef CONFIG_LINUX
-    if (cap_list[MIGRATION_CAPABILITY_ZERO_COPY_SEND] &&
-        (!cap_list[MIGRATION_CAPABILITY_MULTIFD] ||
-         cap_list[MIGRATION_CAPABILITY_COMPRESS] ||
-         cap_list[MIGRATION_CAPABILITY_XBZRLE] ||
+    if (new_caps[MIGRATION_CAPABILITY_ZERO_COPY_SEND] &&
+        (!new_caps[MIGRATION_CAPABILITY_MULTIFD] ||
+         new_caps[MIGRATION_CAPABILITY_COMPRESS] ||
+         new_caps[MIGRATION_CAPABILITY_XBZRLE] ||
          migrate_multifd_compression() ||
          migrate_use_tls())) {
         error_setg(errp,
@@ -1405,15 +1396,15 @@ static bool migrate_caps_check(bool *cap_list,
         return false;
     }
 #else
-    if (cap_list[MIGRATION_CAPABILITY_ZERO_COPY_SEND]) {
+    if (new_caps[MIGRATION_CAPABILITY_ZERO_COPY_SEND]) {
         error_setg(errp,
                    "Zero copy currently only available on Linux");
         return false;
     }
 #endif
 
-    if (cap_list[MIGRATION_CAPABILITY_POSTCOPY_PREEMPT]) {
-        if (!cap_list[MIGRATION_CAPABILITY_POSTCOPY_RAM]) {
+    if (new_caps[MIGRATION_CAPABILITY_POSTCOPY_PREEMPT]) {
+        if (!new_caps[MIGRATION_CAPABILITY_POSTCOPY_RAM]) {
             error_setg(errp, "Postcopy preempt requires postcopy-ram");
             return false;
         }
@@ -1424,14 +1415,14 @@ static bool migrate_caps_check(bool *cap_list,
          * different compression channels, which is not compatible with the
          * preempt assumptions on channel assignments.
          */
-        if (cap_list[MIGRATION_CAPABILITY_COMPRESS]) {
+        if (new_caps[MIGRATION_CAPABILITY_COMPRESS]) {
             error_setg(errp, "Postcopy preempt not compatible with compress");
             return false;
         }
     }
 
-    if (cap_list[MIGRATION_CAPABILITY_MULTIFD]) {
-        if (cap_list[MIGRATION_CAPABILITY_COMPRESS]) {
+    if (new_caps[MIGRATION_CAPABILITY_MULTIFD]) {
+        if (new_caps[MIGRATION_CAPABILITY_COMPRESS]) {
             error_setg(errp, "Multifd is not compatible with compress");
             return false;
         }
@@ -1487,15 +1478,19 @@ void qmp_migrate_set_capabilities(MigrationCapabilityStatusList *params,
 {
     MigrationState *s = migrate_get_current();
     MigrationCapabilityStatusList *cap;
-    bool cap_list[MIGRATION_CAPABILITY__MAX];
+    bool new_caps[MIGRATION_CAPABILITY__MAX];
 
     if (migration_is_running(s->state)) {
         error_setg(errp, QERR_MIGRATION_ACTIVE);
         return;
     }
 
-    memcpy(cap_list, s->capabilities, sizeof(cap_list));
-    if (!migrate_caps_check(cap_list, params, errp)) {
+    memcpy(new_caps, s->capabilities, sizeof(new_caps));
+    for (cap = params; cap; cap = cap->next) {
+        new_caps[cap->value->capability] = cap->value->state;
+    }
+
+    if (!migrate_caps_check(s->capabilities, new_caps, errp)) {
         return;
     }
 
@@ -4635,27 +4630,14 @@ static void migration_instance_init(Object *obj)
  */
 static bool migration_object_check(MigrationState *ms, Error **errp)
 {
-    MigrationCapabilityStatusList *head = NULL;
     /* Assuming all off */
-    bool cap_list[MIGRATION_CAPABILITY__MAX] = { 0 }, ret;
-    int i;
+    bool old_caps[MIGRATION_CAPABILITY__MAX] = { 0 };
 
     if (!migrate_params_check(&ms->parameters, errp)) {
         return false;
     }
 
-    for (i = 0; i < MIGRATION_CAPABILITY__MAX; i++) {
-        if (ms->capabilities[i]) {
-            QAPI_LIST_PREPEND(head, migrate_cap_add(i, true));
-        }
-    }
-
-    ret = migrate_caps_check(cap_list, head, errp);
-
-    /* It works with head == NULL */
-    qapi_free_MigrationCapabilityStatusList(head);
-
-    return ret;
+    return migrate_caps_check(old_caps, ms->capabilities, errp);
 }
 
 static const TypeInfo migration_type = {
-- 
2.39.2


