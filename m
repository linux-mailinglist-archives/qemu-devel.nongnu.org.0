Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A89FD693C7E
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 03:52:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pROxB-0002GD-3o; Sun, 12 Feb 2023 21:52:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pROx9-0002Fy-5K
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 21:52:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pROx7-0006vx-AB
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 21:52:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676256744;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jra5L+q+fwbERxylIBvIFg8T16r+MQ4cEjJ+sgpzLz8=;
 b=Zh9Py343Kk3iUwmMy9Ul5sFcQwX8FlAVP/QbC2ocBllHvnJweZA8hQABPrTSbZMggLwc+Q
 h1RdX7KM+pKXhTq9FpcpXtu3C0Mv7ntSN+fDZR0b9XcB9BpD0cBi+0FND9RY/R8CrbCfS5
 LYJsWLZtYzW+rtKE/gOzxxRu029s3Ng=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-338-E127ma1xNoKHXZLSMvBrIQ-1; Sun, 12 Feb 2023 21:52:23 -0500
X-MC-Unique: E127ma1xNoKHXZLSMvBrIQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 a20-20020a05600c349400b003dfecb98d38so8412698wmq.0
 for <qemu-devel@nongnu.org>; Sun, 12 Feb 2023 18:52:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Jra5L+q+fwbERxylIBvIFg8T16r+MQ4cEjJ+sgpzLz8=;
 b=PA5xNeTAAl2CgyiWCYCl3iWu/L9JwhBKaB9FFKutYxkUAaG/5YuGLfKgWLlUayqPeE
 o4jRjuAQIx2XXs528QNRYbxa+Qjs/WsKwrXJ8PtfbqWmld9jzfwxrWjOBVzm6pRLrtcs
 NoYXptJ0rLBna4D9RsT5by7p03mJndCPCSqPE6SEnpDvtENBGfSFrGhypcX1wkZ5MCjV
 JJhMzB+NECdHAcOou8L6+M4NyhBu4OR2AEE82KxyDN9Wcb5eCfDvvnxcD7/YHw5QpacC
 B+1VuoC5qAIUEqvFobfuYv5JyrO/ma1UB9hgUVGoAd4Na52iZs4zOadJdqf9Xucm5nGA
 4aqQ==
X-Gm-Message-State: AO0yUKWpOeq6Ec6WXB7J82B+f9y6+m9ag2RDDIP1f0UJI87FHSkvd/5r
 p2oqn3CzHG8lQGjFC4ahMjkXwRqZ5yppiZSuOm+zH0GZphhwkAx8ifYtFLAWCACo9hNa61B1dWJ
 ngdZhmo0HjbwchOnUJpWmPDBziEfCzIVLGGFm8GblKWEhMA57cpW4BDJ+bBGkkDNCzNczJBgb
X-Received: by 2002:a5d:4d4c:0:b0:2c5:5917:5c9d with SMTP id
 a12-20020a5d4d4c000000b002c559175c9dmr1156533wru.2.1676256741786; 
 Sun, 12 Feb 2023 18:52:21 -0800 (PST)
X-Google-Smtp-Source: AK7set+UyX+H81SzxeToMJfSQ50YzKjpQ9TCifBCVGCZtFLCor0tg081nOknwUDIH6UM9KreML4ADA==
X-Received: by 2002:a5d:4d4c:0:b0:2c5:5917:5c9d with SMTP id
 a12-20020a5d4d4c000000b002c559175c9dmr1156516wru.2.1676256741444; 
 Sun, 12 Feb 2023 18:52:21 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 s7-20020a5d5107000000b002c556a4f1casm2251790wrt.42.2023.02.12.18.52.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Feb 2023 18:52:20 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Peter Xu <peterx@redhat.com>
Subject: [PULL 17/22] migration: Postpone postcopy preempt channel to be after
 main
Date: Mon, 13 Feb 2023 03:51:45 +0100
Message-Id: <20230213025150.71537-18-quintela@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230213025150.71537-1-quintela@redhat.com>
References: <20230213025150.71537-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Postcopy with preempt-mode enabled needs two channels to communicate.  The
order of channel establishment is not guaranteed.  It can happen that the
dest QEMU got the preempt channel connection request before the main
channel is established, then the migration may make no progress even during
precopy due to the wrong order.

To fix it, create the preempt channel only if we know the main channel is
established.

For a general postcopy migration, we delay it until postcopy_start(),
that's where we already went through some part of precopy on the main
channel.  To make sure dest QEMU has already established the channel, we
wait until we got the first PONG received.  That's something we do at the
start of precopy when postcopy enabled so it's guaranteed to happen sooner
or later.

For a postcopy recovery, we delay it to qemu_savevm_state_resume_prepare()
where we'll have round trips of data on bitmap synchronizations, which
means the main channel must have been established.

Signed-off-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/migration.h    |  6 ++++
 migration/postcopy-ram.h |  2 +-
 migration/migration.c    | 72 ++++++++++++++++++++++++++++++----------
 migration/postcopy-ram.c | 17 ++++++++--
 migration/savevm.c       |  6 +++-
 5 files changed, 82 insertions(+), 21 deletions(-)

diff --git a/migration/migration.h b/migration/migration.h
index 4cb1cb6fa8..2da2f8a164 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -116,6 +116,12 @@ struct MigrationIncomingState {
     unsigned int postcopy_channels;
     /* QEMUFile for postcopy only; it'll be handled by a separate thread */
     QEMUFile *postcopy_qemufile_dst;
+    /*
+     * When postcopy_qemufile_dst is properly setup, this sem is posted.
+     * One can wait on this semaphore to wait until the preempt channel is
+     * properly setup.
+     */
+    QemuSemaphore postcopy_qemufile_dst_done;
     /* Postcopy priority thread is used to receive postcopy requested pages */
     QemuThread postcopy_prio_thread;
     bool postcopy_prio_thread_created;
diff --git a/migration/postcopy-ram.h b/migration/postcopy-ram.h
index d5604cbcf1..b4867a32d5 100644
--- a/migration/postcopy-ram.h
+++ b/migration/postcopy-ram.h
@@ -192,6 +192,6 @@ enum PostcopyChannels {
 
 void postcopy_preempt_new_channel(MigrationIncomingState *mis, QEMUFile *file);
 void postcopy_preempt_setup(MigrationState *s);
-int postcopy_preempt_wait_channel(MigrationState *s);
+int postcopy_preempt_establish_channel(MigrationState *s);
 
 #endif
diff --git a/migration/migration.c b/migration/migration.c
index a2e362541d..a5c22e327d 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -235,6 +235,8 @@ void migration_object_init(void)
     qemu_sem_init(&current_incoming->postcopy_pause_sem_dst, 0);
     qemu_sem_init(&current_incoming->postcopy_pause_sem_fault, 0);
     qemu_sem_init(&current_incoming->postcopy_pause_sem_fast_load, 0);
+    qemu_sem_init(&current_incoming->postcopy_qemufile_dst_done, 0);
+
     qemu_mutex_init(&current_incoming->page_request_mutex);
     current_incoming->page_requested = g_tree_new(page_request_addr_cmp);
 
@@ -737,6 +739,31 @@ void migration_fd_process_incoming(QEMUFile *f, Error **errp)
     migration_incoming_process();
 }
 
+/*
+ * Returns true when we want to start a new incoming migration process,
+ * false otherwise.
+ */
+static bool migration_should_start_incoming(bool main_channel)
+{
+    /* Multifd doesn't start unless all channels are established */
+    if (migrate_use_multifd()) {
+        return migration_has_all_channels();
+    }
+
+    /* Preempt channel only starts when the main channel is created */
+    if (migrate_postcopy_preempt()) {
+        return main_channel;
+    }
+
+    /*
+     * For all the rest types of migration, we should only reach here when
+     * it's the main channel that's being created, and we should always
+     * proceed with this channel.
+     */
+    assert(main_channel);
+    return true;
+}
+
 void migration_ioc_process_incoming(QIOChannel *ioc, Error **errp)
 {
     MigrationIncomingState *mis = migration_incoming_get_current();
@@ -798,7 +825,7 @@ void migration_ioc_process_incoming(QIOChannel *ioc, Error **errp)
         }
     }
 
-    if (migration_has_all_channels()) {
+    if (migration_should_start_incoming(default_channel)) {
         /* If it's a recovery, we're done */
         if (postcopy_try_recover()) {
             return;
@@ -3159,6 +3186,13 @@ static int await_return_path_close_on_source(MigrationState *ms)
     return ms->rp_state.error;
 }
 
+static inline void
+migration_wait_main_channel(MigrationState *ms)
+{
+    /* Wait until one PONG message received */
+    qemu_sem_wait(&ms->rp_state.rp_pong_acks);
+}
+
 /*
  * Switch from normal iteration to postcopy
  * Returns non-0 on error
@@ -3173,9 +3207,12 @@ static int postcopy_start(MigrationState *ms)
     bool restart_block = false;
     int cur_state = MIGRATION_STATUS_ACTIVE;
 
-    if (postcopy_preempt_wait_channel(ms)) {
-        migrate_set_state(&ms->state, ms->state, MIGRATION_STATUS_FAILED);
-        return -1;
+    if (migrate_postcopy_preempt()) {
+        migration_wait_main_channel(ms);
+        if (postcopy_preempt_establish_channel(ms)) {
+            migrate_set_state(&ms->state, ms->state, MIGRATION_STATUS_FAILED);
+            return -1;
+        }
     }
 
     if (!migrate_pause_before_switchover()) {
@@ -3586,6 +3623,20 @@ static int postcopy_do_resume(MigrationState *s)
         return ret;
     }
 
+    /*
+     * If preempt is enabled, re-establish the preempt channel.  Note that
+     * we do it after resume prepare to make sure the main channel will be
+     * created before the preempt channel.  E.g. with weak network, the
+     * dest QEMU may get messed up with the preempt and main channels on
+     * the order of connection setup.  This guarantees the correct order.
+     */
+    ret = postcopy_preempt_establish_channel(s);
+    if (ret) {
+        error_report("%s: postcopy_preempt_establish_channel(): %d",
+                     __func__, ret);
+        return ret;
+    }
+
     /*
      * Last handshake with destination on the resume (destination will
      * switch to postcopy-active afterwards)
@@ -3647,14 +3698,6 @@ static MigThrError postcopy_pause(MigrationState *s)
         if (s->state == MIGRATION_STATUS_POSTCOPY_RECOVER) {
             /* Woken up by a recover procedure. Give it a shot */
 
-            if (postcopy_preempt_wait_channel(s)) {
-                /*
-                 * Preempt enabled, and new channel create failed; loop
-                 * back to wait for another recovery.
-                 */
-                continue;
-            }
-
             /*
              * Firstly, let's wake up the return path now, with a new
              * return path channel.
@@ -4347,11 +4390,6 @@ void migrate_fd_connect(MigrationState *s, Error *error_in)
         }
     }
 
-    /* This needs to be done before resuming a postcopy */
-    if (migrate_postcopy_preempt()) {
-        postcopy_preempt_setup(s);
-    }
-
     if (resume) {
         /* Wakeup the main migration thread to do the recovery */
         migrate_set_state(&s->state, MIGRATION_STATUS_POSTCOPY_PAUSED,
diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
index de6d4a3fd4..f54f44d899 100644
--- a/migration/postcopy-ram.c
+++ b/migration/postcopy-ram.c
@@ -1197,6 +1197,11 @@ int postcopy_ram_incoming_setup(MigrationIncomingState *mis)
     }
 
     if (migrate_postcopy_preempt()) {
+        /*
+         * The preempt channel is established in asynchronous way.  Wait
+         * for its completion.
+         */
+        qemu_sem_wait(&mis->postcopy_qemufile_dst_done);
         /*
          * This thread needs to be created after the temp pages because
          * it'll fetch RAM_CHANNEL_POSTCOPY PostcopyTmpPage immediately.
@@ -1544,6 +1549,7 @@ void postcopy_preempt_new_channel(MigrationIncomingState *mis, QEMUFile *file)
      */
     qemu_file_set_blocking(file, true);
     mis->postcopy_qemufile_dst = file;
+    qemu_sem_post(&mis->postcopy_qemufile_dst_done);
     trace_postcopy_preempt_new_channel();
 }
 
@@ -1612,14 +1618,21 @@ out:
     postcopy_preempt_send_channel_done(s, ioc, local_err);
 }
 
-/* Returns 0 if channel established, -1 for error. */
-int postcopy_preempt_wait_channel(MigrationState *s)
+/*
+ * This function will kick off an async task to establish the preempt
+ * channel, and wait until the connection setup completed.  Returns 0 if
+ * channel established, -1 for error.
+ */
+int postcopy_preempt_establish_channel(MigrationState *s)
 {
     /* If preempt not enabled, no need to wait */
     if (!migrate_postcopy_preempt()) {
         return 0;
     }
 
+    /* Kick off async task to establish preempt channel */
+    postcopy_preempt_setup(s);
+
     /*
      * We need the postcopy preempt channel to be established before
      * starting doing anything.
diff --git a/migration/savevm.c b/migration/savevm.c
index ce181e21e1..b5e6962bb6 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -2200,7 +2200,11 @@ static int loadvm_postcopy_handle_resume(MigrationIncomingState *mis)
     qemu_sem_post(&mis->postcopy_pause_sem_fault);
 
     if (migrate_postcopy_preempt()) {
-        /* The channel should already be setup again; make sure of it */
+        /*
+         * The preempt channel will be created in async manner, now let's
+         * wait for it and make sure it's created.
+         */
+        qemu_sem_wait(&mis->postcopy_qemufile_dst_done);
         assert(mis->postcopy_qemufile_dst);
         /* Kick the fast ram load thread too */
         qemu_sem_post(&mis->postcopy_pause_sem_fast_load);
-- 
2.39.1


