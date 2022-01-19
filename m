Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 938C4493650
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 09:27:55 +0100 (CET)
Received: from localhost ([::1]:43402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nA6Ju-0008C6-Au
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 03:27:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nA630-0007Ip-9z
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 03:10:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60009)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nA62x-0001LP-Jh
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 03:10:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642579823;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ban/4LXzHGp/g8/SKxR9D6U/gtgCr2d4yvcIU42kzb0=;
 b=EAw7wSbxtQQnzsbp4DTF0VefBB63rqPqdu/wxE60M0dstZ4sxcWklAN225/YADn3OvD3zy
 2uVIUTSGavk0Bu+Xhg3Y5QW5PCuVSI6sbUkH0275bwqbAwmnYZtREwyudoHXYTDwl/q7rO
 PEHojYoGA02ooliGo6HZU8nHhkgHqsw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-672-Po6pliQiOQCVm3LsD9cNCg-1; Wed, 19 Jan 2022 03:10:19 -0500
X-MC-Unique: Po6pliQiOQCVm3LsD9cNCg-1
Received: by mail-wm1-f71.google.com with SMTP id
 n14-20020a7bcbce000000b003488820f0d9so1322902wmi.8
 for <qemu-devel@nongnu.org>; Wed, 19 Jan 2022 00:10:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ban/4LXzHGp/g8/SKxR9D6U/gtgCr2d4yvcIU42kzb0=;
 b=fNtqkMhy9Md8j4mhaJQN7ZxHXO39ejEB4U6vvjdOuWABGmPwXhZgxoZim4RN6OnPdY
 0si0FuUNh4KgW9mp3gvlGksX23Ok3CZEyuX/PinQbyS/Wf9sHEOttKfoFPJhXy03aAGm
 Cco+/y2AHvsEnW42tiPlyJAQRhPLf7B3Xxa+JcdgYW8XG2/IO7Kd1+AIz9CNNzbkDcOv
 vX1I7q4mn7NiwQrrs82ftiPggxbsHOrRry+k9Pns4gl1+kX5zSFzh3bqFumtk6iN4uzC
 4ZmgaUurrK0y7JrwdWYzUZkLyWrxA7rSilXNBiQO6uCcNgQlF7BH4JMPdaZjrYCQxZla
 cWvw==
X-Gm-Message-State: AOAM533EiAylt/wjOgjXQHm9dOVcvQewqcOv/q5FAZl75gl2A45UjLhh
 4jlJvpjVgD1oZTEfUGEd/3Pz3y93dFj0LaYL9PuPadlGAj4PT9dpBYY50jUsRfTeTEQ/KpFXHnU
 E0ktCuL9sCTG83HPhsb0ii5hI73fWHaRbrBU2hrR5PdE5qy4nE6GJ1gbJ53SRhcFq
X-Received: by 2002:a05:6000:2ac:: with SMTP id
 l12mr17834452wry.165.1642579817808; 
 Wed, 19 Jan 2022 00:10:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwHGakgjf7jZce7FiWR+S94mdyMdJvnPKzU2aYWozZKneioJl+JGy9gpoHE/ncATXRsLg22mg==
X-Received: by 2002:a05:6000:2ac:: with SMTP id
 l12mr17834424wry.165.1642579817516; 
 Wed, 19 Jan 2022 00:10:17 -0800 (PST)
Received: from localhost.localdomain ([85.203.46.175])
 by smtp.gmail.com with ESMTPSA id a20sm4351606wmb.27.2022.01.19.00.10.13
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 19 Jan 2022 00:10:17 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC 09/15] migration: Add postcopy_thread_create()
Date: Wed, 19 Jan 2022 16:09:23 +0800
Message-Id: <20220119080929.39485-10-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220119080929.39485-1-peterx@redhat.com>
References: <20220119080929.39485-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Postcopy create threads. A common manner is we init a sem and use it to sync
with the thread.  Namely, we have fault_thread_sem and listen_thread_sem and
they're only used for this.

Make it a shared infrastructure so it's easier to create yet another thread.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/migration.h    |  5 ++---
 migration/postcopy-ram.c | 19 +++++++++++++------
 migration/postcopy-ram.h |  4 ++++
 migration/savevm.c       | 12 +++---------
 4 files changed, 22 insertions(+), 18 deletions(-)

diff --git a/migration/migration.h b/migration/migration.h
index 8bb2931312..35e7f7babe 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -70,7 +70,8 @@ struct MigrationIncomingState {
     /* A hook to allow cleanup at the end of incoming migration */
     void *transport_data;
     void (*transport_cleanup)(void *data);
-
+    /* Used to sync thread creations */
+    QemuSemaphore  thread_sync_sem;
     /*
      * Free at the start of the main state load, set as the main thread finishes
      * loading state.
@@ -83,13 +84,11 @@ struct MigrationIncomingState {
     size_t         largest_page_size;
     bool           have_fault_thread;
     QemuThread     fault_thread;
-    QemuSemaphore  fault_thread_sem;
     /* Set this when we want the fault thread to quit */
     bool           fault_thread_quit;
 
     bool           have_listen_thread;
     QemuThread     listen_thread;
-    QemuSemaphore  listen_thread_sem;
 
     /* For the kernel to send us notifications */
     int       userfault_fd;
diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
index d78e1b9373..88c832eeba 100644
--- a/migration/postcopy-ram.c
+++ b/migration/postcopy-ram.c
@@ -77,6 +77,16 @@ int postcopy_notify(enum PostcopyNotifyReason reason, Error **errp)
                                             &pnd);
 }
 
+void postcopy_thread_create(MigrationIncomingState *mis,
+                            QemuThread *thread, const char *name,
+                            void *(*fn)(void *), int joinable)
+{
+    qemu_sem_init(&mis->thread_sync_sem, 0);
+    qemu_thread_create(thread, name, fn, mis, joinable);
+    qemu_sem_wait(&mis->thread_sync_sem);
+    qemu_sem_destroy(&mis->thread_sync_sem);
+}
+
 /* Postcopy needs to detect accesses to pages that haven't yet been copied
  * across, and efficiently map new pages in, the techniques for doing this
  * are target OS specific.
@@ -901,7 +911,7 @@ static void *postcopy_ram_fault_thread(void *opaque)
     trace_postcopy_ram_fault_thread_entry();
     rcu_register_thread();
     mis->last_rb = NULL; /* last RAMBlock we sent part of */
-    qemu_sem_post(&mis->fault_thread_sem);
+    qemu_sem_post(&mis->thread_sync_sem);
 
     struct pollfd *pfd;
     size_t pfd_len = 2 + mis->postcopy_remote_fds->len;
@@ -1172,11 +1182,8 @@ int postcopy_ram_incoming_setup(MigrationIncomingState *mis)
         return -1;
     }
 
-    qemu_sem_init(&mis->fault_thread_sem, 0);
-    qemu_thread_create(&mis->fault_thread, "postcopy/fault",
-                       postcopy_ram_fault_thread, mis, QEMU_THREAD_JOINABLE);
-    qemu_sem_wait(&mis->fault_thread_sem);
-    qemu_sem_destroy(&mis->fault_thread_sem);
+    postcopy_thread_create(mis, &mis->fault_thread, "postcopy/fault",
+                           postcopy_ram_fault_thread, QEMU_THREAD_JOINABLE);
     mis->have_fault_thread = true;
 
     /* Mark so that we get notified of accesses to unwritten areas */
diff --git a/migration/postcopy-ram.h b/migration/postcopy-ram.h
index 6d2b3cf124..07684c0e1d 100644
--- a/migration/postcopy-ram.h
+++ b/migration/postcopy-ram.h
@@ -135,6 +135,10 @@ void postcopy_remove_notifier(NotifierWithReturn *n);
 /* Call the notifier list set by postcopy_add_start_notifier */
 int postcopy_notify(enum PostcopyNotifyReason reason, Error **errp);
 
+void postcopy_thread_create(MigrationIncomingState *mis,
+                            QemuThread *thread, const char *name,
+                            void *(*fn)(void *), int joinable);
+
 struct PostCopyFD;
 
 /* ufd is a pointer to the struct uffd_msg *TODO: more Portable! */
diff --git a/migration/savevm.c b/migration/savevm.c
index 3b8f565b14..3342b74c24 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -1862,7 +1862,7 @@ static void *postcopy_ram_listen_thread(void *opaque)
 
     migrate_set_state(&mis->state, MIGRATION_STATUS_ACTIVE,
                                    MIGRATION_STATUS_POSTCOPY_ACTIVE);
-    qemu_sem_post(&mis->listen_thread_sem);
+    qemu_sem_post(&mis->thread_sync_sem);
     trace_postcopy_ram_listen_thread_start();
 
     rcu_register_thread();
@@ -1987,14 +1987,8 @@ static int loadvm_postcopy_handle_listen(MigrationIncomingState *mis)
     }
 
     mis->have_listen_thread = true;
-    /* Start up the listening thread and wait for it to signal ready */
-    qemu_sem_init(&mis->listen_thread_sem, 0);
-    qemu_thread_create(&mis->listen_thread, "postcopy/listen",
-                       postcopy_ram_listen_thread, NULL,
-                       QEMU_THREAD_DETACHED);
-    qemu_sem_wait(&mis->listen_thread_sem);
-    qemu_sem_destroy(&mis->listen_thread_sem);
-
+    postcopy_thread_create(mis, &mis->listen_thread, "postcopy/listen",
+                           postcopy_ram_listen_thread, QEMU_THREAD_DETACHED);
     trace_loadvm_postcopy_handle_listen("return");
 
     return 0;
-- 
2.32.0


