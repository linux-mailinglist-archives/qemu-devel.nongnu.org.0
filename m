Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 401516888F7
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 22:26:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNh4y-0007wz-5g; Thu, 02 Feb 2023 16:25:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pNh4v-0007us-CX
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 16:25:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pNh4s-0006xb-Ve
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 16:25:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675373105;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=73NhITnuVIADntU3VpCk6Dk6NqVm0yacGgBI6y6WjOU=;
 b=bnNYWcvphhLnpAuUkjICoQySNR8kBG11IfHiWej6bWC9XnHkPeJa6fgSuvc1pWO8OEm/g2
 Q6fPZ02albYfXccqIEOR5FCxRZ/8vgVBd8i/GOlSKLNMBhv7DFMMkcQWhLIK2AFp2fYCEa
 AJHMazabaHb3EfUGnCoSDc3qM+prkf8=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-205-9goP_VURPN2FhIvWdghE7g-1; Thu, 02 Feb 2023 16:25:04 -0500
X-MC-Unique: 9goP_VURPN2FhIvWdghE7g-1
Received: by mail-qv1-f71.google.com with SMTP id
 ng1-20020a0562143bc100b004bb706b3a27so1679700qvb.20
 for <qemu-devel@nongnu.org>; Thu, 02 Feb 2023 13:25:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=73NhITnuVIADntU3VpCk6Dk6NqVm0yacGgBI6y6WjOU=;
 b=lqRUjbOj6t69z2/RfQ7IGyr+dgjDYdDBuIz48J3zfnpZekamMwW4foO25T7QvBUiC2
 m6n8rFBwwlyHnlZV47b4meDC5UYYbEom5YaWKC//q2TxZGc+CNNfC0yr3Llyoh+67pxI
 grypRcbT7VwprYmpRyw8bMNKzv0qToyH3g0iSiK0CQXRumfjqThBIHMwtBoG5LcQHWlE
 mQm7JJcX68vzpZycqlJewujksOHoqQA1uRDaqi1HELg3bAdx3LiZjPCJChXCYUqKXUV+
 2XDPP1NqgL3E6gW9ytLkRrEEyUcGVnePZXnQdiD/WfJsCHT77LcmsmspkX2yWWsOfjz+
 iTOA==
X-Gm-Message-State: AO0yUKWCCxEtqoFzT93qY9O94WmOkoLT7ckdyabStSG9bqcI+fakR7hh
 tp5e6rt3zfGLaBg9SbGE6YWR7J9BNTlUzwqreHuH4BEi6T34194QRKBIszRGRIVGY8naOYpG7hH
 7qErSBHBdGyFtt789BNexNAWK5tRsxUny4LcXPJKNOxdWXJLVZZ/bTebP4z666LZK
X-Received: by 2002:a0c:ed22:0:b0:537:785c:db02 with SMTP id
 u2-20020a0ced22000000b00537785cdb02mr13429419qvq.0.1675373103103; 
 Thu, 02 Feb 2023 13:25:03 -0800 (PST)
X-Google-Smtp-Source: AK7set/4SlyHw6daorkyoMk2Zsdzg5cO0xN7YVeS9pa/YiyWmclWH/O3oGD+iO8Z+ugY0P85+cHfww==
X-Received: by 2002:a0c:ed22:0:b0:537:785c:db02 with SMTP id
 u2-20020a0ced22000000b00537785cdb02mr13429359qvq.0.1675373102579; 
 Thu, 02 Feb 2023 13:25:02 -0800 (PST)
Received: from x1n.redhat.com
 (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca. [70.30.145.63])
 by smtp.gmail.com with ESMTPSA id
 l12-20020a05620a210c00b00725fd2aabd3sm508645qkl.1.2023.02.02.13.25.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Feb 2023 13:25:01 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: Manish Mishra <manish.mishra@nutanix.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Subject: [PATCH v2 1/3] migration: Rework multi-channel checks on URI
Date: Thu,  2 Feb 2023 16:24:56 -0500
Message-Id: <20230202212458.726496-2-peterx@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20230202212458.726496-1-peterx@redhat.com>
References: <20230202212458.726496-1-peterx@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
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

With that, make postcopy_preempt_setup() as simple as creating the channel.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/migration.c    | 56 +++++++++++++++++++---------------------
 migration/migration.h    |  3 ---
 migration/multifd.c      | 12 ++-------
 migration/postcopy-ram.c | 14 +---------
 migration/postcopy-ram.h |  2 +-
 5 files changed, 31 insertions(+), 56 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index f4f7d207f0..ef7fceb5d7 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -182,16 +182,26 @@ static int migration_maybe_pause(MigrationState *s,
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
+        strstart(uri, "vsock:", NULL);
 }
 
-bool migrate_multi_channels_is_allowed(void)
+static bool migration_uri_validate(const char *uri, Error **errp)
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
@@ -491,12 +501,15 @@ static void qemu_start_incoming_migration(const char *uri, Error **errp)
 {
     const char *p = NULL;
 
-    migrate_protocol_allow_multi_channels(false); /* reset it anyway */
+    /* URI is not suitable for migration? */
+    if (!migration_uri_validate(uri, errp)) {
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
@@ -721,11 +734,6 @@ void migration_fd_process_incoming(QEMUFile *f, Error **errp)
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
@@ -1347,15 +1355,6 @@ static bool migrate_caps_check(bool *cap_list,
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
@@ -2440,6 +2439,11 @@ void qmp_migrate(const char *uri, bool has_blk, bool blk,
     MigrationState *s = migrate_get_current();
     const char *p = NULL;
 
+    /* URI is not suitable for migration? */
+    if (!migration_uri_validate(uri, errp)) {
+        return;
+    }
+
     if (!migrate_prepare(s, has_blk && blk, has_inc && inc,
                          has_resume && resume, errp)) {
         /* Error detected, put into errp */
@@ -2452,11 +2456,9 @@ void qmp_migrate(const char *uri, bool has_blk, bool blk,
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
@@ -4309,12 +4311,8 @@ void migrate_fd_connect(MigrationState *s, Error *error_in)
     }
 
     /* This needs to be done before resuming a postcopy */
-    if (postcopy_preempt_setup(s, &local_err)) {
-        error_report_err(local_err);
-        migrate_set_state(&s->state, MIGRATION_STATUS_SETUP,
-                          MIGRATION_STATUS_FAILED);
-        migrate_fd_cleanup(s);
-        return;
+    if (migrate_postcopy_preempt()) {
+        postcopy_preempt_setup(s);
     }
 
     if (resume) {
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
diff --git a/migration/multifd.c b/migration/multifd.c
index eeb4fb87ee..dfe8eda5bf 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -512,7 +512,7 @@ void multifd_save_cleanup(void)
 {
     int i;
 
-    if (!migrate_use_multifd() || !migrate_multi_channels_is_allowed()) {
+    if (!migrate_use_multifd()) {
         return;
     }
     multifd_send_terminate_threads(NULL);
@@ -910,10 +910,6 @@ int multifd_save_setup(Error **errp)
     if (!migrate_use_multifd()) {
         return 0;
     }
-    if (!migrate_multi_channels_is_allowed()) {
-        error_setg(errp, "multifd is not supported by current protocol");
-        return -1;
-    }
 
     thread_count = migrate_multifd_channels();
     multifd_send_state = g_malloc0(sizeof(*multifd_send_state));
@@ -1018,7 +1014,7 @@ int multifd_load_cleanup(Error **errp)
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
index b98e95dab0..e2578dbd21 100644
--- a/migration/postcopy-ram.c
+++ b/migration/postcopy-ram.c
@@ -1631,22 +1631,10 @@ int postcopy_preempt_wait_channel(MigrationState *s)
     return s->postcopy_qemufile_src ? 0 : -1;
 }
 
-int postcopy_preempt_setup(MigrationState *s, Error **errp)
+void postcopy_preempt_setup(MigrationState *s)
 {
-    if (!migrate_postcopy_preempt()) {
-        return 0;
-    }
-
-    if (!migrate_multi_channels_is_allowed()) {
-        error_setg(errp, "Postcopy preempt is not supported as current "
-                   "migration stream does not support multi-channels.");
-        return -1;
-    }
-
     /* Kick an async task to connect */
     socket_send_channel_create(postcopy_preempt_send_channel_new, s);
-
-    return 0;
 }
 
 static void postcopy_pause_ram_fast_load(MigrationIncomingState *mis)
diff --git a/migration/postcopy-ram.h b/migration/postcopy-ram.h
index 25881c4127..d5604cbcf1 100644
--- a/migration/postcopy-ram.h
+++ b/migration/postcopy-ram.h
@@ -191,7 +191,7 @@ enum PostcopyChannels {
 };
 
 void postcopy_preempt_new_channel(MigrationIncomingState *mis, QEMUFile *file);
-int postcopy_preempt_setup(MigrationState *s, Error **errp);
+void postcopy_preempt_setup(MigrationState *s);
 int postcopy_preempt_wait_channel(MigrationState *s);
 
 #endif
-- 
2.37.3


