Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB18B30C0D4
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 15:09:11 +0100 (CET)
Received: from localhost ([::1]:48500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6wMh-0000G9-0K
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 09:09:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l6w9n-0005aq-NK
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 08:55:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l6w9k-0005Yu-1f
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 08:55:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612274145;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1CoBnH81Tr+i7txWtCWUqs9kKr55/VytW3HZEUxgb5s=;
 b=WyV2naBbvUVnWR2HdgKChMy3WebW1b4qAIpxchr8ovZjlJ01IiGORv/8lqdq4dyNI6swo0
 gP5IOO9HrEbkhgCcwh0kj9NjlwiRmXhwzyHzRUzNkdnqbr5NQDcmonmqCldxq5dvvd4p2t
 3s7gJ9tYk9b1p/smSEszVpgrQR2Qq6A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-385-6Wtzu4D5OM25zwAdn7GrEQ-1; Tue, 02 Feb 2021 08:55:42 -0500
X-MC-Unique: 6Wtzu4D5OM25zwAdn7GrEQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 93EFA107ACE3
 for <qemu-devel@nongnu.org>; Tue,  2 Feb 2021 13:55:41 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-113-83.ams2.redhat.com
 [10.36.113.83])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 26D656EF46;
 Tue,  2 Feb 2021 13:55:39 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, peterx@redhat.com, eblake@redhat.com,
 alex.williamson@redhat.com, laine@redhat.com
Subject: [PATCH 1/2] migration: Add blocker information
Date: Tue,  2 Feb 2021 13:55:21 +0000
Message-Id: <20210202135522.127380-2-dgilbert@redhat.com>
In-Reply-To: <20210202135522.127380-1-dgilbert@redhat.com>
References: <20210202135522.127380-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
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
---
 migration/migration.c | 25 +++++++++++++++++++++++--
 migration/savevm.c    | 13 +++++++++++++
 migration/savevm.h    |  1 +
 qapi/migration.json   |  6 ++++++
 4 files changed, 43 insertions(+), 2 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 1986cb8573..21d7ab1fa4 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -141,6 +141,8 @@ enum mig_rp_message_type {
 static MigrationState *current_migration;
 static MigrationIncomingState *current_incoming;
 
+static GSList *migration_blockers;
+
 static bool migration_object_check(MigrationState *ms, Error **errp);
 static int migration_maybe_pause(MigrationState *s,
                                  int *current_active_state,
@@ -1041,6 +1043,27 @@ static void fill_source_migration_info(MigrationInfo *info)
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
@@ -1934,8 +1957,6 @@ void migrate_init(MigrationState *s)
     s->threshold_size = 0;
 }
 
-static GSList *migration_blockers;
-
 int migrate_add_blocker(Error *reason, Error **errp)
 {
     if (only_migratable) {
diff --git a/migration/savevm.c b/migration/savevm.c
index 4f3b69ecfc..7ddf400ca3 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -1131,6 +1131,19 @@ bool qemu_savevm_state_blocked(Error **errp)
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
index ba64a7e271..ec789b161d 100644
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
index d1d9632c2a..2f9d3d7237 100644
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


