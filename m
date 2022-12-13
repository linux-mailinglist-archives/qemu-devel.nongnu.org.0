Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6AF64BEB3
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 22:44:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5Czo-0000Tx-GB; Tue, 13 Dec 2022 16:39:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1p5CzS-0000G1-NU
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 16:39:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1p5CzQ-0007f7-LK
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 16:39:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670967543;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aaLqkomZXef9Fs5hzdtdAF5w6gy6tt9W28FJzupeb24=;
 b=KOHbOkiiW2so1NnIpzsCOidPdA2lwY/tsuep+BtSnPvO3QTo30zZmPykzNrD8vOfbDdjSZ
 Jcc3fle02xvZS1N2c4od4IZuUbMnQ+fZQFub/bkug/pqSWnJv70fmRFbMhLQGVbdOMMYpW
 ndL+bmfqhNrMDbWXiWo4ms8amnZ1pTY=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-626-xnRZTw79NDW_NnQHli65Rw-1; Tue, 13 Dec 2022 16:39:01 -0500
X-MC-Unique: xnRZTw79NDW_NnQHli65Rw-1
Received: by mail-qv1-f71.google.com with SMTP id
 y11-20020ad457cb000000b004c6fafdde42so15545523qvx.5
 for <qemu-devel@nongnu.org>; Tue, 13 Dec 2022 13:39:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aaLqkomZXef9Fs5hzdtdAF5w6gy6tt9W28FJzupeb24=;
 b=kEs/Gyr71K6DaIxB5WXdegaa8LAcsihXSAAdr/m6/PMlCRFXmIxeCKvF6HRf/d6zKb
 cI8jwiM0ptavKSShBLVLQ7g/NJcmvL5Jzz7+75cqt5fcS2JbXR5b55p8vQ5iYqJ4RmCE
 P0rGRd2MmenG5NRUgcawakS6n5u9BCHBJaGq6UexY+PhVihTBeQskfVzHumgYnldL2Du
 BbwRWLtVIjG+wfoWRiXp2pPWIFvuM/Rl2mOpvLxMADeJxVHJJ0fFuDtrU/go6PuUJGwH
 T31wHkwlOzABZ9No30fLRizJxGNNMoRgu4PC2mNIQvEfYKSw1uSv1qb3sdEz/VviimFf
 QYCA==
X-Gm-Message-State: ANoB5pn8NyiCYSTe+dCXpEwBS1unwWKzkZImUuXFewgaeQAk1gXg9l2Z
 ChSbRxOPbJN1f8PEW29pF1BCKv5qgJShfmERRmbhku4mxZnwLK5bQKMwXb9UaFHq5TJIdlnzosq
 NCkc6Ji5MHvrhs0lvM8otowKgLFVBj2dN4Ul8AE975PJmHQQRQgMqIRJzE9jjWLZF
X-Received: by 2002:a05:622a:408e:b0:3a5:c775:59ec with SMTP id
 cg14-20020a05622a408e00b003a5c77559ecmr32809846qtb.28.1670967540427; 
 Tue, 13 Dec 2022 13:39:00 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5HegN+x6AF97VHt+utlzS98bVXxCilDIHFeR1PD4mZg3584Ce4jXjFrQAbfNPivOojGfoNGA==
X-Received: by 2002:a05:622a:408e:b0:3a5:c775:59ec with SMTP id
 cg14-20020a05622a408e00b003a5c77559ecmr32809816qtb.28.1670967540128; 
 Tue, 13 Dec 2022 13:39:00 -0800 (PST)
Received: from x1n.redhat.com
 (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca. [70.31.27.79])
 by smtp.gmail.com with ESMTPSA id
 j12-20020a05620a288c00b006feb158e5e7sm8607487qkp.70.2022.12.13.13.38.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Dec 2022 13:38:59 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Manish Mishra <manish.mishra@nutanix.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com
Subject: [PATCH 3/5] migration: Rework multi-channel checks on URI
Date: Tue, 13 Dec 2022 16:38:48 -0500
Message-Id: <20221213213850.1481858-4-peterx@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221213213850.1481858-1-peterx@redhat.com>
References: <20221213213850.1481858-1-peterx@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
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
index 35b43d0108..898bc9fe5c 100644
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
@@ -725,11 +738,6 @@ void migration_fd_process_incoming(QEMUFile *f, Error **errp)
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
@@ -1344,15 +1352,6 @@ static bool migrate_caps_check(bool *cap_list,
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
@@ -2428,6 +2427,11 @@ void qmp_migrate(const char *uri, bool has_blk, bool blk,
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
@@ -2440,11 +2444,9 @@ void qmp_migrate(const char *uri, bool has_blk, bool blk,
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
@@ -4291,12 +4293,8 @@ void migrate_fd_connect(MigrationState *s, Error *error_in)
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
index ae4ffd3454..ea8d083a51 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -470,7 +470,4 @@ void migration_cancel(const Error *error);
 void populate_vfio_info(MigrationInfo *info);
 void postcopy_temp_page_reset(PostcopyTmpPage *tmp_page);
 
-bool migrate_multi_channels_is_allowed(void);
-void migrate_protocol_allow_multi_channels(bool allow);
-
 #endif
diff --git a/migration/multifd.c b/migration/multifd.c
index 4f6028997d..15d2540b88 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -517,7 +517,7 @@ void multifd_save_cleanup(void)
 {
     int i;
 
-    if (!migrate_use_multifd() || !migrate_multi_channels_is_allowed()) {
+    if (!migrate_use_multifd()) {
         return;
     }
     multifd_send_terminate_threads(NULL);
@@ -915,10 +915,6 @@ int multifd_save_setup(Error **errp)
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
@@ -1170,10 +1166,6 @@ int multifd_load_setup(Error **errp)
     if (!migrate_use_multifd()) {
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
index f84f783ab4..7872b4fdd3 100644
--- a/migration/postcopy-ram.c
+++ b/migration/postcopy-ram.c
@@ -1632,22 +1632,10 @@ int postcopy_preempt_wait_channel(MigrationState *s)
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


