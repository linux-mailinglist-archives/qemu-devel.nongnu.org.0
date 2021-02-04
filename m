Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB8330F9AE
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 18:30:08 +0100 (CET)
Received: from localhost ([::1]:46420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7iSF-0000ar-Bh
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 12:30:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l7hhE-0002ZH-Jm
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 11:41:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32361)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l7hhC-0005Ko-R8
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 11:41:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612456889;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yc5g1VS7wdhZq/cGxyQhXZtjOQfWi4uMaZthHjR1GTU=;
 b=GnOmMTnlmi5vdW4mg+WpBSbouw3IC4t0Vxl4bjvemEod+UR6yAgZpWcLaFjSg/0WJ8O8Ou
 wEk2MVix+LkloCOVJWVX2RjWjM/tJmEKb6DmOeAMhByzkxgGn4GdbpDqNIhANdVj9Y+fOc
 mTDMakU1uu46yymO1qm2WWIOeYCjbew=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-265-rzh1E29yNb67F4vNh4nMAg-1; Thu, 04 Feb 2021 11:41:27 -0500
X-MC-Unique: rzh1E29yNb67F4vNh4nMAg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B3E3480402C;
 Thu,  4 Feb 2021 16:41:26 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-114-21.ams2.redhat.com
 [10.36.114.21])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 150ED1A38C;
 Thu,  4 Feb 2021 16:41:23 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, andrey.gruzdev@virtuozzo.com, berrange@redhat.com,
 gaojinhao@huawei.com, armbru@redhat.com, mst@redhat.com, philmd@redhat.com,
 wainersm@redhat.com
Subject: [PULL 14/27] migration: Add blocker information
Date: Thu,  4 Feb 2021 16:39:46 +0000
Message-Id: <20210204163959.377618-15-dgilbert@redhat.com>
In-Reply-To: <20210204163959.377618-1-dgilbert@redhat.com>
References: <20210204163959.377618-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

Modify query-migrate so that it has a flag indicating if outbound
migration is blocked, and if it is a list of reasons.

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Message-Id: <20210202135522.127380-2-dgilbert@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/migration.c | 25 +++++++++++++++++++++++--
 migration/savevm.c    | 13 +++++++++++++
 migration/savevm.h    |  1 +
 qapi/migration.json   |  6 ++++++
 4 files changed, 43 insertions(+), 2 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 38efaeee94..a5ddf43559 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -174,6 +174,8 @@ INITIALIZE_MIGRATE_CAPS_SET(check_caps_background_snapshot,
 static MigrationState *current_migration;
 static MigrationIncomingState *current_incoming;
 
+static GSList *migration_blockers;
+
 static bool migration_object_check(MigrationState *ms, Error **errp);
 static int migration_maybe_pause(MigrationState *s,
                                  int *current_active_state,
@@ -1074,6 +1076,27 @@ static void fill_source_migration_info(MigrationInfo *info)
 {
     MigrationState *s = migrate_get_current();
 
+    info->blocked = migration_is_blocked(NULL);
+    info->has_blocked_reasons = info->blocked;
+    info->blocked_reasons = NULL;
+    if (info->blocked) {
+        GSList *cur_blocker = migration_blockers;
+
+        /*
+         * There are two types of reasons a migration might be blocked;
+         * a) devices marked in VMState as non-migratable, and
+         * b) Explicit migration blockers
+         * We need to add both of them here.
+         */
+        qemu_savevm_non_migratable_list(&info->blocked_reasons);
+
+        while (cur_blocker) {
+            QAPI_LIST_PREPEND(info->blocked_reasons,
+                              g_strdup(error_get_pretty(cur_blocker->data)));
+            cur_blocker = g_slist_next(cur_blocker);
+        }
+    }
+
     switch (s->state) {
     case MIGRATION_STATUS_NONE:
         /* no migration has happened ever */
@@ -2025,8 +2048,6 @@ void migrate_init(MigrationState *s)
     s->threshold_size = 0;
 }
 
-static GSList *migration_blockers;
-
 int migrate_add_blocker(Error *reason, Error **errp)
 {
     if (only_migratable) {
diff --git a/migration/savevm.c b/migration/savevm.c
index d5bf53388f..1178c6ca90 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -1154,6 +1154,19 @@ bool qemu_savevm_state_blocked(Error **errp)
     return false;
 }
 
+void qemu_savevm_non_migratable_list(strList **reasons)
+{
+    SaveStateEntry *se;
+
+    QTAILQ_FOREACH(se, &savevm_state.handlers, entry) {
+        if (se->vmsd && se->vmsd->unmigratable) {
+            QAPI_LIST_PREPEND(*reasons,
+                              g_strdup_printf("non-migratable device: %s",
+                                              se->idstr));
+        }
+    }
+}
+
 void qemu_savevm_state_header(QEMUFile *f)
 {
     trace_savevm_state_header();
diff --git a/migration/savevm.h b/migration/savevm.h
index aaee2528ed..6461342cb4 100644
--- a/migration/savevm.h
+++ b/migration/savevm.h
@@ -30,6 +30,7 @@
 #define QEMU_VM_SECTION_FOOTER       0x7e
 
 bool qemu_savevm_state_blocked(Error **errp);
+void qemu_savevm_non_migratable_list(strList **reasons);
 void qemu_savevm_state_setup(QEMUFile *f);
 bool qemu_savevm_state_guest_unplug_pending(void);
 int qemu_savevm_state_resume_prepare(MigrationState *s);
diff --git a/qapi/migration.json b/qapi/migration.json
index 797f9edbc2..076d2d5634 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -224,6 +224,10 @@
 #        only returned if VFIO device is present, migration is supported by all
 #        VFIO devices and status is 'active' or 'completed' (since 5.2)
 #
+# @blocked: True if outgoing migration is blocked (since 6.0)
+#
+# @blocked-reasons: A list of reasons an outgoing migration is blocked (since 6.0)
+#
 # Since: 0.14
 ##
 { 'struct': 'MigrationInfo',
@@ -237,6 +241,8 @@
            '*setup-time': 'int',
            '*cpu-throttle-percentage': 'int',
            '*error-desc': 'str',
+           'blocked': 'bool',
+           '*blocked-reasons': ['str'],
            '*postcopy-blocktime' : 'uint32',
            '*postcopy-vcpu-blocktime': ['uint32'],
            '*compression': 'CompressionStats',
-- 
2.29.2


