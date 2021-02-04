Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFCF830FB1E
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 19:19:53 +0100 (CET)
Received: from localhost ([::1]:55670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7jEO-0005rK-P3
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 13:19:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l7iIT-0007yc-Nv
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 12:20:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l7iIM-0005fA-Lh
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 12:20:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612459192;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VCPycQ3R4gHNei3Z8btmXK5WJxMPUe01jew7dJhsMI0=;
 b=LHjGBOioqJU1cBKC6wTD7+FqVrzLR6zJtuA7kJBL3F/EIN6LMYxrmOToP69WcT1ngwO9i7
 UUbtNWXfdz6ygPowgeu8mIifb7dQ5lJlsTp8MB7S7DSdJedNUIJy1+gKY7w8iQUGL8DJTE
 fGN3Vkt2uv4JQC9Q3bz3u1gzmIA8xWM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-165-f-OPw1YQNMK1UuoTb0JVbw-1; Thu, 04 Feb 2021 12:19:50 -0500
X-MC-Unique: f-OPw1YQNMK1UuoTb0JVbw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C3542835E26;
 Thu,  4 Feb 2021 17:19:49 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-112-221.ams2.redhat.com
 [10.36.112.221])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A031460CFA;
 Thu,  4 Feb 2021 17:19:48 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 20/33] migration: push Error **errp into global_state_store()
Date: Thu,  4 Feb 2021 17:18:54 +0000
Message-Id: <20210204171907.901471-21-berrange@redhat.com>
In-Reply-To: <20210204171907.901471-1-berrange@redhat.com>
References: <20210204171907.901471-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Juan Quintela <quintela@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Hailiang Zhang <zhang.zhanghailiang@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an incremental step in converting vmstate loading code to report
via Error objects instead of printing directly to the console/monitor.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 include/migration/global_state.h | 2 +-
 migration/global_state.c         | 6 +++---
 migration/migration.c            | 8 ++++++--
 migration/savevm.c               | 5 ++---
 4 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/include/migration/global_state.h b/include/migration/global_state.h
index 945eb35d5b..eeade88ef8 100644
--- a/include/migration/global_state.h
+++ b/include/migration/global_state.h
@@ -16,7 +16,7 @@
 #include "qapi/qapi-types-run-state.h"
 
 void register_global_state(void);
-int global_state_store(void);
+int global_state_store(Error **errp);
 void global_state_store_running(void);
 bool global_state_received(void);
 RunState global_state_get_runstate(void);
diff --git a/migration/global_state.c b/migration/global_state.c
index a33947ca32..36fda38aad 100644
--- a/migration/global_state.c
+++ b/migration/global_state.c
@@ -29,13 +29,13 @@ typedef struct {
 
 static GlobalState global_state;
 
-int global_state_store(void)
+int global_state_store(Error **errp)
 {
     if (!runstate_store((char *)global_state.runstate,
                         sizeof(global_state.runstate))) {
-        error_report("runstate name too big: %s", global_state.runstate);
+        error_setg(errp, "runstate name too big: %s", global_state.runstate);
         trace_migrate_state_too_big();
-        return -EINVAL;
+        return -1;
     }
     return 0;
 }
diff --git a/migration/migration.c b/migration/migration.c
index b9cf56e61f..395a1b10f5 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -2811,6 +2811,7 @@ static int postcopy_start(MigrationState *ms)
     int64_t bandwidth = migrate_max_postcopy_bandwidth();
     bool restart_block = false;
     int cur_state = MIGRATION_STATUS_ACTIVE;
+    Error *local_err = NULL;
     if (!migrate_pause_before_switchover()) {
         migrate_set_state(&ms->state, MIGRATION_STATUS_ACTIVE,
                           MIGRATION_STATUS_POSTCOPY_ACTIVE);
@@ -2821,9 +2822,10 @@ static int postcopy_start(MigrationState *ms)
     trace_postcopy_start_set_run();
 
     qemu_system_wakeup_request(QEMU_WAKEUP_REASON_OTHER, NULL);
-    global_state_store();
+    global_state_store(&local_err);
     ret = vm_stop_force_state(RUN_STATE_FINISH_MIGRATE);
     if (ret < 0) {
+        error_report_err(local_err);
         goto fail;
     }
 
@@ -3030,11 +3032,12 @@ static void migration_completion(MigrationState *s)
     int current_active_state = s->state;
 
     if (s->state == MIGRATION_STATUS_ACTIVE) {
+        Error *local_err = NULL;
         qemu_mutex_lock_iothread();
         s->downtime_start = qemu_clock_get_ms(QEMU_CLOCK_REALTIME);
         qemu_system_wakeup_request(QEMU_WAKEUP_REASON_OTHER, NULL);
         s->vm_was_running = runstate_is_running();
-        ret = global_state_store();
+        ret = global_state_store(&local_err);
 
         if (!ret) {
             bool inactivate = !migrate_colo_enabled();
@@ -3055,6 +3058,7 @@ static void migration_completion(MigrationState *s)
         qemu_mutex_unlock_iothread();
 
         if (ret < 0) {
+            error_report_err(local_err);
             goto fail;
         }
     } else if (s->state == MIGRATION_STATUS_POSTCOPY_ACTIVE) {
diff --git a/migration/savevm.c b/migration/savevm.c
index 289a3d55bb..c18b7e6033 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -2828,9 +2828,8 @@ bool save_snapshot(const char *name, bool overwrite, const char *vmstate,
 
     saved_vm_running = runstate_is_running();
 
-    ret = global_state_store();
-    if (ret) {
-        error_setg(errp, "Error saving global state");
+    ret = global_state_store(errp);
+    if (ret < 0) {
         return false;
     }
     vm_stop(RUN_STATE_SAVE_VM);
-- 
2.29.2


