Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B1513139A8
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 17:40:02 +0100 (CET)
Received: from localhost ([::1]:58848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l99Zv-00042y-O1
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 11:39:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l94ka-0001yi-44
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 06:30:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l94kP-0002RR-74
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 06:30:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612783827;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yc5g1VS7wdhZq/cGxyQhXZtjOQfWi4uMaZthHjR1GTU=;
 b=UGo2HxLkm5FD0mVJU7m8i1bFyokgqbU1dL5nZ0/2C5qyR2mMUC2vgtJMAMsXGpIYg0pOE2
 pmeKI6MOiPOnKDVGJI1v4ylcDBfR4ueoEQ/VVJ7emxP3QHsXm+d1RHlq8eXs6Sl4Mrfgvm
 wt6x5eOHJGc/mvXTZ7BNpBLTsGiNG2A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-237-CX-kTAg0PWm6_7vguh1Wfw-1; Mon, 08 Feb 2021 06:30:25 -0500
X-MC-Unique: CX-kTAg0PWm6_7vguh1Wfw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C7F5F804036;
 Mon,  8 Feb 2021 11:30:23 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-115-22.ams2.redhat.com
 [10.36.115.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DCBDE1002388;
 Mon,  8 Feb 2021 11:30:21 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, andrey.gruzdev@virtuozzo.com, berrange@redhat.com,
 gaojinhao@huawei.com, armbru@redhat.com, mst@redhat.com, philmd@redhat.com,
 wainersm@redhat.com, s.reiter@proxmox.com
Subject: [PULL 13/27] migration: Add blocker information
Date: Mon,  8 Feb 2021 11:29:04 +0000
Message-Id: <20210208112918.185058-14-dgilbert@redhat.com>
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


