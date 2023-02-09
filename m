Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 182CA69149A
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 00:36:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQGRj-0000ny-KT; Thu, 09 Feb 2023 18:35:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pQGRY-0000f3-Jd
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 18:35:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pQGRW-0006ub-FS
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 18:35:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675985705;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HIGquDGecZVqlPAzTK4Da5XIicRI3uO45jZdci3i9h8=;
 b=ZM9xUJER/9CaGqHrnQ8usbgAHjzmJDQ/DhZlwFdWG9IUWGd9kjPUbMebx8XgNIDOwLZlaO
 2FcMJrFinPEkF3hevQlbKgS+U/pAs1iPJMRheOSnBABb6/35gHlzQg3bbIz1PfYE1/bPMG
 XnGHcItpONIx04FA5x/eNQhSwIgqdKw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-260-9BmWknK7P5eqfSKElB68Yg-1; Thu, 09 Feb 2023 18:35:02 -0500
X-MC-Unique: 9BmWknK7P5eqfSKElB68Yg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 81E28101471A;
 Thu,  9 Feb 2023 23:35:01 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.29])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7D9CF175AD;
 Thu,  9 Feb 2023 23:34:59 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Peter Xu <peterx@redhat.com>
Subject: [PULL 14/17] migration: Rework multi-channel checks on URI
Date: Fri, 10 Feb 2023 00:34:23 +0100
Message-Id: <20230209233426.37811-15-quintela@redhat.com>
In-Reply-To: <20230209233426.37811-1-quintela@redhat.com>
References: <20230209233426.37811-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Peter Xu <peterx@redhat.com>

The whole idea of multi-channel checks was not properly done, IMHO.

Currently we check multi-channel in a lot of places, but actually that's
not needed because we only need to check it right after we get the URI and
that should be it.

If the URI check succeeded, we should never need to check it again because
we must have it.  If it check fails, we should fail immediately on either
the qmp_migrate or qmp_migrate_incoming, instead of failingg it later after
the connection established.

Neither should we fail any set capabiliities like what we used to do here:

5ad15e8614 ("migration: allow enabling mutilfd for specific protocol only", 2021-10-19)

Because logically the URI will only be set later after the capability is
set, so it doesn't make a lot of sense to check the URI type when setting
the capability, because we're checking the cap with an old URI passed in,
and that may not even be the URI we're going to use later.

This patch mostly reverted all such checks for before, dropping the
variable migrate_allow_multi_channels and helpers.  Instead, add a common
helper to check URI for multi-channels for either qmp_migrate and
qmp_migrate_incoming and that should do all the proper checks.  The failure
will only trigger with the "migrate" or "migrate_incoming" command, or when
user specified "-incoming xxx" where "xxx" is not "defer".

Signed-off-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/migration.h    |  3 ---
 migration/migration.c    | 49 +++++++++++++++++++++-------------------
 migration/multifd.c      | 12 ++--------
 migration/postcopy-ram.c |  6 -----
 4 files changed, 28 insertions(+), 42 deletions(-)

diff --git a/migration/migration.h b/migration/migration.h
index 66511ce532..c351872360 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -474,7 +474,4 @@ void migration_cancel(const Error *error);
 void populate_vfio_info(MigrationInfo *info);
 void postcopy_temp_page_reset(PostcopyTmpPage *tmp_page);
 
-bool migrate_multi_channels_is_allowed(void);
-void migrate_protocol_allow_multi_channels(bool allow);
-
 #endif
diff --git a/migration/migration.c b/migration/migration.c
index 7a14aa98d8..f242d657e8 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -184,16 +184,27 @@ static int migration_maybe_pause(MigrationState *s,
                                  int new_state);
 static void migrate_fd_cancel(MigrationState *s);
 
-static bool migrate_allow_multi_channels = true;
+static bool migration_needs_multiple_sockets(void)
+{
+    return migrate_use_multifd() || migrate_postcopy_preempt();
+}
 
-void migrate_protocol_allow_multi_channels(bool allow)
+static bool uri_supports_multi_channels(const char *uri)
 {
-    migrate_allow_multi_channels = allow;
+    return strstart(uri, "tcp:", NULL) || strstart(uri, "unix:", NULL) ||
+           strstart(uri, "vsock:", NULL);
 }
 
-bool migrate_multi_channels_is_allowed(void)
+static bool
+migration_channels_and_uri_compatible(const char *uri, Error **errp)
 {
-    return migrate_allow_multi_channels;
+    if (migration_needs_multiple_sockets() &&
+        !uri_supports_multi_channels(uri)) {
+        error_setg(errp, "Migration requires multi-channel URIs (e.g. tcp)");
+        return false;
+    }
+
+    return true;
 }
 
 static gint page_request_addr_cmp(gconstpointer ap, gconstpointer bp)
@@ -493,12 +504,15 @@ static void qemu_start_incoming_migration(const char *uri, Error **errp)
 {
     const char *p = NULL;
 
-    migrate_protocol_allow_multi_channels(false); /* reset it anyway */
+    /* URI is not suitable for migration? */
+    if (!migration_channels_and_uri_compatible(uri, errp)) {
+        return;
+    }
+
     qapi_event_send_migration(MIGRATION_STATUS_SETUP);
     if (strstart(uri, "tcp:", &p) ||
         strstart(uri, "unix:", NULL) ||
         strstart(uri, "vsock:", NULL)) {
-        migrate_protocol_allow_multi_channels(true);
         socket_start_incoming_migration(p ? p : uri, errp);
 #ifdef CONFIG_RDMA
     } else if (strstart(uri, "rdma:", &p)) {
@@ -723,11 +737,6 @@ void migration_fd_process_incoming(QEMUFile *f, Error **errp)
     migration_incoming_process();
 }
 
-static bool migration_needs_multiple_sockets(void)
-{
-    return migrate_use_multifd() || migrate_postcopy_preempt();
-}
-
 void migration_ioc_process_incoming(QIOChannel *ioc, Error **errp)
 {
     MigrationIncomingState *mis = migration_incoming_get_current();
@@ -1378,15 +1387,6 @@ static bool migrate_caps_check(bool *cap_list,
     }
 #endif
 
-
-    /* incoming side only */
-    if (runstate_check(RUN_STATE_INMIGRATE) &&
-        !migrate_multi_channels_is_allowed() &&
-        cap_list[MIGRATION_CAPABILITY_MULTIFD]) {
-        error_setg(errp, "multifd is not supported by current protocol");
-        return false;
-    }
-
     if (cap_list[MIGRATION_CAPABILITY_POSTCOPY_PREEMPT]) {
         if (!cap_list[MIGRATION_CAPABILITY_POSTCOPY_RAM]) {
             error_setg(errp, "Postcopy preempt requires postcopy-ram");
@@ -2471,6 +2471,11 @@ void qmp_migrate(const char *uri, bool has_blk, bool blk,
     MigrationState *s = migrate_get_current();
     const char *p = NULL;
 
+    /* URI is not suitable for migration? */
+    if (!migration_channels_and_uri_compatible(uri, errp)) {
+        return;
+    }
+
     if (!migrate_prepare(s, has_blk && blk, has_inc && inc,
                          has_resume && resume, errp)) {
         /* Error detected, put into errp */
@@ -2483,11 +2488,9 @@ void qmp_migrate(const char *uri, bool has_blk, bool blk,
         }
     }
 
-    migrate_protocol_allow_multi_channels(false);
     if (strstart(uri, "tcp:", &p) ||
         strstart(uri, "unix:", NULL) ||
         strstart(uri, "vsock:", NULL)) {
-        migrate_protocol_allow_multi_channels(true);
         socket_start_outgoing_migration(s, p ? p : uri, &local_err);
 #ifdef CONFIG_RDMA
     } else if (strstart(uri, "rdma:", &p)) {
diff --git a/migration/multifd.c b/migration/multifd.c
index 7aa030fb19..99a59830c8 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -516,7 +516,7 @@ void multifd_save_cleanup(void)
 {
     int i;
 
-    if (!migrate_use_multifd() || !migrate_multi_channels_is_allowed()) {
+    if (!migrate_use_multifd()) {
         return;
     }
     multifd_send_terminate_threads(NULL);
@@ -913,10 +913,6 @@ int multifd_save_setup(Error **errp)
     if (!migrate_use_multifd()) {
         return 0;
     }
-    if (!migrate_multi_channels_is_allowed()) {
-        error_setg(errp, "multifd is not supported by current protocol");
-        return -1;
-    }
 
     thread_count = migrate_multifd_channels();
     multifd_send_state = g_malloc0(sizeof(*multifd_send_state));
@@ -1021,7 +1017,7 @@ int multifd_load_cleanup(Error **errp)
 {
     int i;
 
-    if (!migrate_use_multifd() || !migrate_multi_channels_is_allowed()) {
+    if (!migrate_use_multifd()) {
         return 0;
     }
     multifd_recv_terminate_threads(NULL);
@@ -1172,10 +1168,6 @@ int multifd_load_setup(Error **errp)
         return 0;
     }
 
-    if (!migrate_multi_channels_is_allowed()) {
-        error_setg(errp, "multifd is not supported by current protocol");
-        return -1;
-    }
     thread_count = migrate_multifd_channels();
     multifd_recv_state = g_malloc0(sizeof(*multifd_recv_state));
     multifd_recv_state->params = g_new0(MultiFDRecvParams, thread_count);
diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
index 53299b7a5e..9a9d0ecf49 100644
--- a/migration/postcopy-ram.c
+++ b/migration/postcopy-ram.c
@@ -1635,12 +1635,6 @@ int postcopy_preempt_setup(MigrationState *s, Error **errp)
         return 0;
     }
 
-    if (!migrate_multi_channels_is_allowed()) {
-        error_setg(errp, "Postcopy preempt is not supported as current "
-                   "migration stream does not support multi-channels.");
-        return -1;
-    }
-
     /* Kick an async task to connect */
     socket_send_channel_create(postcopy_preempt_send_channel_new, s);
 
-- 
2.39.1


