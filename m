Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 140ED68F8D5
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 21:29:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPr3L-0003SQ-QT; Wed, 08 Feb 2023 15:28:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pPr3J-0003QP-7u
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 15:28:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.145.221.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pPr3G-000495-FI
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 15:28:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675888100;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XMhNYhoIW4dKVouk/RH4lce42AUOJCI51X2hRP83pA8=;
 b=aonFWssPD7QxOhn0SmV+0Ax1KrZ3uduJCIEIgwoWPbNIQXTp0DrDLm1mPu/VMET7NQF/VF
 IJlkUVUp7h0OxKZ5zup8ggH784W/jbgzcApeIQfXsNyhy6wbFfsRiUfoBDjMrp1hw4/Mbo
 oIEZ18uRbIMU1zZNikNAmifOYJ2gJcQ=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-2-gDtjvFojMdCBcwHV2UAvHw-1; Wed, 08 Feb 2023 15:28:19 -0500
X-MC-Unique: gDtjvFojMdCBcwHV2UAvHw-1
Received: by mail-qv1-f72.google.com with SMTP id
 j19-20020a056214033300b0056c11dfb0ddso2934920qvu.19
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 12:28:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XMhNYhoIW4dKVouk/RH4lce42AUOJCI51X2hRP83pA8=;
 b=WCSEKLCNs7ZWXHLWqbSAA1dPmIn8eyj3KJxzBjlivsG25D8pdPT6ovNb6o+MLagDpv
 qi1C7+TpGqkJQPcohaAF90JxbARHxO/QgaDJisBnYrPjSOwZaYqy7wCP0zEy1tCW1pRi
 0ijoAoGQM4XsSuamiRLJ9vv+qJ5yZu/3ZsDSZk120fL5NxmrH3O7T5FkRjBYqwosD/sz
 gqL8gW5TObEOhIksdOV4kIteToX4RueB+CriBnZiOoZ5zYKwun5lGVdNIoBKCGD0MfRL
 aQA5qomO4zCs+Z631IqgkpS37mMgvmV4OLOCXKGSP35mGJwvl5+46MPns6XFh2nmFZat
 2u+g==
X-Gm-Message-State: AO0yUKXVGBL6Ph1DQ7Z6Q779cautTYwNcejDUxObTh0KIJ8XQpk6pU0x
 H3YSPibFaoCSRzDpIWiA8O2s70QuajQM0jD+KFh7dmItnyq2iCcnoKzWH82luHiQ7/IzEeIBEOc
 uAPAZJ/TTiLA8y209ZWvh6dTRuConNaOfvf2AHKfwFWNTagSZAPFtZcOmKomkjZaSQJgTlg==
X-Received: by 2002:a05:622a:1744:b0:3b8:5dfe:c3dc with SMTP id
 l4-20020a05622a174400b003b85dfec3dcmr16848297qtk.3.1675888098256; 
 Wed, 08 Feb 2023 12:28:18 -0800 (PST)
X-Google-Smtp-Source: AK7set+BEQBwN3s63/RBDsyi71y9bzny/uR8YQXte+Gyp/0MSDLFfbeTc5mGWnaJT9+yl3ZlVNLwYA==
X-Received: by 2002:a05:622a:1744:b0:3b8:5dfe:c3dc with SMTP id
 l4-20020a05622a174400b003b85dfec3dcmr16848229qtk.3.1675888097732; 
 Wed, 08 Feb 2023 12:28:17 -0800 (PST)
Received: from x1n.redhat.com
 (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca. [70.30.145.63])
 by smtp.gmail.com with ESMTPSA id
 g4-20020a37e204000000b0070d11191e91sm12287144qki.44.2023.02.08.12.28.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Feb 2023 12:28:16 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>, peterx@redhat.com,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Manish Mishra <manish.mishra@nutanix.com>
Subject: [PATCH v3 1/4] migration: Rework multi-channel checks on URI
Date: Wed,  8 Feb 2023 15:28:10 -0500
Message-Id: <20230208202813.1363225-2-peterx@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20230208202813.1363225-1-peterx@redhat.com>
References: <20230208202813.1363225-1-peterx@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: permerror client-ip=216.145.221.124;
 envelope-from=peterx@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_FAIL=0.001,
 SPF_HELO_NONE=0.001 autolearn=no autolearn_force=no
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

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/migration.c    | 49 +++++++++++++++++++++-------------------
 migration/migration.h    |  3 ---
 migration/multifd.c      | 12 ++--------
 migration/postcopy-ram.c |  6 -----
 4 files changed, 28 insertions(+), 42 deletions(-)

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
index b7ad7002e0..a1141bf5dd 100644
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
@@ -918,10 +918,6 @@ int multifd_save_setup(Error **errp)
     if (!migrate_use_multifd()) {
         return 0;
     }
-    if (!migrate_multi_channels_is_allowed()) {
-        error_setg(errp, "multifd is not supported by current protocol");
-        return -1;
-    }
 
     thread_count = migrate_multifd_channels();
     multifd_send_state = g_malloc0(sizeof(*multifd_send_state));
@@ -1026,7 +1022,7 @@ int multifd_load_cleanup(Error **errp)
 {
     int i;
 
-    if (!migrate_use_multifd() || !migrate_multi_channels_is_allowed()) {
+    if (!migrate_use_multifd()) {
         return 0;
     }
     multifd_recv_terminate_threads(NULL);
@@ -1180,10 +1176,6 @@ int multifd_load_setup(Error **errp)
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
2.37.3


