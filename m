Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 222874CADED
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 19:51:11 +0100 (CET)
Received: from localhost ([::1]:46998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPU46-0001k3-7c
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 13:51:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nPTkd-0001UR-Ku
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 13:31:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35273)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nPTkb-0000KA-GN
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 13:31:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646245860;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0PbF8YIadBK+ZkjWWRQZ0TnFmDA+2sgn4LnHgGUaaEg=;
 b=MyRp3XQq7XmKAXW2ebFI//aG36CIdX14wxPr67WAey+u3+CUhsLYOb6JpwETbuRd+l8a3j
 J9X3XhtikWsrn6FLX2Uv8rkMZeCm4eITuPL8mbQZusBwzKQpU7nrMKMQyBnxp+KsrwnDEL
 wSsFO2FrAlG+cJ6WJoOBi55eaI6PEQs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-577-lO5QZGZEO6yRlioD319XxQ-1; Wed, 02 Mar 2022 13:30:54 -0500
X-MC-Unique: lO5QZGZEO6yRlioD319XxQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B6BBC19251C0;
 Wed,  2 Mar 2022 18:30:52 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.33.36.30])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2157A1059170;
 Wed,  2 Mar 2022 18:30:50 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, f.ebner@proxmox.com, hreitz@redhat.com,
 jinpu.wang@ionos.com, peter.maydell@linaro.org, peterx@redhat.com,
 s.reiter@proxmox.com
Subject: [PULL 12/18] migration: Add postcopy_thread_create()
Date: Wed,  2 Mar 2022 18:29:30 +0000
Message-Id: <20220302182936.227719-13-dgilbert@redhat.com>
In-Reply-To: <20220302182936.227719-1-dgilbert@redhat.com>
References: <20220302182936.227719-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Xu <peterx@redhat.com>

Postcopy create threads. A common manner is we init a sem and use it to sync
with the thread.  Namely, we have fault_thread_sem and listen_thread_sem and
they're only used for this.

Make it a shared infrastructure so it's easier to create yet another thread.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
Message-Id: <20220301083925.33483-7-peterx@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/migration.h    |  8 +++++---
 migration/postcopy-ram.c | 23 +++++++++++++++++------
 migration/postcopy-ram.h |  4 ++++
 migration/savevm.c       | 12 +++---------
 4 files changed, 29 insertions(+), 18 deletions(-)

diff --git a/migration/migration.h b/migration/migration.h
index 42c7395094..8445e1d14a 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -70,7 +70,11 @@ struct MigrationIncomingState {
     /* A hook to allow cleanup at the end of incoming migration */
     void *transport_data;
     void (*transport_cleanup)(void *data);
-
+    /*
+     * Used to sync thread creations.  Note that we can't create threads in
+     * parallel with this sem.
+     */
+    QemuSemaphore  thread_sync_sem;
     /*
      * Free at the start of the main state load, set as the main thread finishes
      * loading state.
@@ -83,13 +87,11 @@ struct MigrationIncomingState {
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
index 30c3508f44..d08d396c63 100644
--- a/migration/postcopy-ram.c
+++ b/migration/postcopy-ram.c
@@ -78,6 +78,20 @@ int postcopy_notify(enum PostcopyNotifyReason reason, Error **errp)
                                             &pnd);
 }
 
+/*
+ * NOTE: this routine is not thread safe, we can't call it concurrently. But it
+ * should be good enough for migration's purposes.
+ */
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
@@ -902,7 +916,7 @@ static void *postcopy_ram_fault_thread(void *opaque)
     trace_postcopy_ram_fault_thread_entry();
     rcu_register_thread();
     mis->last_rb = NULL; /* last RAMBlock we sent part of */
-    qemu_sem_post(&mis->fault_thread_sem);
+    qemu_sem_post(&mis->thread_sync_sem);
 
     struct pollfd *pfd;
     size_t pfd_len = 2 + mis->postcopy_remote_fds->len;
@@ -1173,11 +1187,8 @@ int postcopy_ram_incoming_setup(MigrationIncomingState *mis)
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
index 0ccd7e5e3f..967ff80547 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -1863,7 +1863,7 @@ static void *postcopy_ram_listen_thread(void *opaque)
 
     migrate_set_state(&mis->state, MIGRATION_STATUS_ACTIVE,
                                    MIGRATION_STATUS_POSTCOPY_ACTIVE);
-    qemu_sem_post(&mis->listen_thread_sem);
+    qemu_sem_post(&mis->thread_sync_sem);
     trace_postcopy_ram_listen_thread_start();
 
     rcu_register_thread();
@@ -1988,14 +1988,8 @@ static int loadvm_postcopy_handle_listen(MigrationIncomingState *mis)
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
2.35.1


