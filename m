Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7174C3468FB
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 20:27:11 +0100 (CET)
Received: from localhost ([::1]:38928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOmgI-00058G-Hy
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 15:27:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lOlsa-0004hx-DK
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 14:35:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47528)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lOlsW-00079S-PZ
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 14:35:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616524542;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=01+6jw7i0EALBzonoL+jxdJx84nUv/ktNnmjbYwPJig=;
 b=Qvc2pc1Ewn9ArHpizJVyjitLe6j0neOnI+2rsFjcbWIEnAqIV7NgxhOv0TfaWuMc3EbBjB
 F8BJM6x4JZw4fXQZXEcN6qUvJNj66FKAjy7Z9l/055piQayKI/SCVa3UKynURNjGNJ/TMs
 aVtqvRuhd0tSXY9E55v5EdUWje9eEIg=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-2-J_Ag8Hl6Ol-FH_mB9Q1m3w-1; Tue, 23 Mar 2021 14:35:40 -0400
X-MC-Unique: J_Ag8Hl6Ol-FH_mB9Q1m3w-1
Received: by mail-qv1-f72.google.com with SMTP id da16so2198838qvb.2
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 11:35:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=bHZZwzjdeZpyi0zpU3TcyXDCyT7N3ba8jmPC8Hjr6bQ=;
 b=GoSOExBuabNlLXcfsDrAxC7cX1ZtCWybUWZq158WRd3xYNQm8yEJlGpap4Caoxulje
 ir7oUewdNjUDVX5FmlIciyUg29necWPtUYZQkBnHrBS4YjXHVeWcZG5b4/U+4mWsAqgj
 ZIimJUcOV6ITw3uMvD5DJDZuxuVLUoPOXDqexQcF2+p6pH0D4ITDcDAD9e9SBeImjrg+
 NAU2abbfQyfui56ZeBqoz4kdJ6z9FbhdMtIOhn4a5hbZ8qOWDBV/GWfCbMNtmoZDMm0A
 OljJzTUXp1P2IwBXBABI5U6WhKGWN9ASN9JOV4BbfJwJH6/4Lotu3UJg6oae4Gm8pv2q
 NIbg==
X-Gm-Message-State: AOAM533ybz0MC1MpLYShe7+f2OlRzsMjI+RlbmuboWfno3FGLNz5GF74
 o2rFOg+Kals/bI3PfPT9BH1FQ60Ad9pLVbhlxPwIMdGQCv1zwvrYi+K481dDdWZv6saPdABOxI6
 Rqet19e4fCDsXIPo=
X-Received: by 2002:ac8:7d93:: with SMTP id c19mr4713234qtd.306.1616524540041; 
 Tue, 23 Mar 2021 11:35:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwgKzFxwFAs2Ak50vF+vEqSEcTOl76/YXpBpQIt77sggOS1ToZk3ISnvE059nBZ2YqnsJm1sA==
X-Received: by 2002:ac8:7d93:: with SMTP id c19mr4713216qtd.306.1616524539788; 
 Tue, 23 Mar 2021 11:35:39 -0700 (PDT)
Received: from xz-x1 (bras-base-toroon474qw-grc-82-174-91-135-175.dsl.bell.ca.
 [174.91.135.175])
 by smtp.gmail.com with ESMTPSA id d84sm13901075qke.53.2021.03.23.11.35.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 11:35:38 -0700 (PDT)
Date: Tue, 23 Mar 2021 14:35:37 -0400
From: Peter Xu <peterx@redhat.com>
To: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Subject: Re: [PATCH v1 1/3] migration: Fix missing qemu_fflush() on buffer
 file in bg_migration_thread
Message-ID: <20210323183537.GH6486@xz-x1>
References: <20210319145249.425189-1-andrey.gruzdev@virtuozzo.com>
 <20210319145249.425189-2-andrey.gruzdev@virtuozzo.com>
 <20210322201716.GG16645@xz-x1>
 <2fb49f83-e31c-8c93-50b7-833026b06518@virtuozzo.com>
 <20210323145457.GC6486@xz-x1>
 <9311f31b-298f-d235-45bd-0ed9d66f9468@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <9311f31b-298f-d235-45bd-0ed9d66f9468@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="8t9RHnE3ZwKMSgU+"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Den Lunev <den@openvz.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--8t9RHnE3ZwKMSgU+
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, Mar 23, 2021 at 08:21:43PM +0300, Andrey Gruzdev wrote:
> > For the long term I think we'd better have a helper:
> > 
> >          qemu_put_qio_channel_buffer(QEMUFile *file, QIOChannelBuffer *bioc)
> > 
> > So as to hide this flush operation, which is tricky. We'll have two users so
> > far:
> > 
> >          bg_migration_completion
> >          colo_do_checkpoint_transaction
> > 
> > IMHO it'll be nicer if you'd do it in this patch altogether!
> > 
> > Thanks,
> > 
> Sorry, can't get the idea, what's wrong with the fix.

I'm fine with the fix, but I've got one patch attached just to show what I
meant, so without any testing for sure..

Looks more complicated than I thought, but again I think we should hide that
buffer flush into another helper to avoid overlooking it.

Thanks,

-- 
Peter Xu

--8t9RHnE3ZwKMSgU+
Content-Type: text/plain; charset=utf-8
Content-Disposition: attachment;
	filename="0001-migration-Introduce-qemu_put_qio_channel_buffer.patch"

From f3004948e2498fb9ac4646a6a5225c58ea3f1623 Mon Sep 17 00:00:00 2001
From: Peter Xu <peterx@redhat.com>
Date: Tue, 23 Mar 2021 14:30:24 -0400
Subject: [PATCH] migration: Introduce qemu_put_qio_channel_buffer()

Meanwhile use it in background snapshot code, so as to dump one QEMUFile buffer
(which is created by QIOChannelBuffer) into another QEMUFile.

Similar thing should be able to be applied to colo_do_checkpoint_transaction()
too.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/migration.c         | 16 +++++++++-------
 migration/migration.h         |  1 -
 migration/qemu-file-channel.c | 14 ++++++++++++++
 migration/qemu-file-channel.h |  2 ++
 migration/qemu-file.c         |  4 ++++
 migration/qemu-file.h         |  1 +
 6 files changed, 30 insertions(+), 8 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index a5ddf43559e..9d73c236b16 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -3243,8 +3243,9 @@ fail:
  *   RAM has been saved. The caller 'breaks' the loop when this returns.
  *
  * @s: Current migration state
+ * @vmstates: The QEMUFile* buffer that contains all the device vmstates
  */
-static void bg_migration_completion(MigrationState *s)
+static void bg_migration_completion(MigrationState *s, QEMUFile *vmstates)
 {
     int current_active_state = s->state;
 
@@ -3262,7 +3263,7 @@ static void bg_migration_completion(MigrationState *s)
          * right after the ram content. The device state has been stored into
          * the temporary buffer before RAM saving started.
          */
-        qemu_put_buffer(s->to_dst_file, s->bioc->data, s->bioc->usage);
+        qemu_put_qio_channel_buffer(s->to_dst_file, vmstates);
         qemu_fflush(s->to_dst_file);
     } else if (s->state == MIGRATION_STATUS_CANCELLING) {
         goto fail;
@@ -3656,7 +3657,6 @@ static MigIterateState bg_migration_iteration_run(MigrationState *s)
 
     res = qemu_savevm_state_iterate(s->to_dst_file, false);
     if (res > 0) {
-        bg_migration_completion(s);
         return MIG_ITERATE_BREAK;
     }
 
@@ -3843,6 +3843,7 @@ static void *bg_migration_thread(void *opaque)
     MigThrError thr_error;
     QEMUFile *fb;
     bool early_fail = true;
+    QIOChannelBuffer *bioc;
 
     rcu_register_thread();
     object_ref(OBJECT(s));
@@ -3859,10 +3860,10 @@ static void *bg_migration_thread(void *opaque)
      * with vCPUs running and, finally, write stashed non-RAM part of
      * the vmstate from the buffer to the migration stream.
      */
-    s->bioc = qio_channel_buffer_new(128 * 1024);
-    qio_channel_set_name(QIO_CHANNEL(s->bioc), "vmstate-buffer");
-    fb = qemu_fopen_channel_output(QIO_CHANNEL(s->bioc));
-    object_unref(OBJECT(s->bioc));
+    bioc = qio_channel_buffer_new(128 * 1024);
+    qio_channel_set_name(QIO_CHANNEL(bioc), "vmstate-buffer");
+    fb = qemu_fopen_channel_output(QIO_CHANNEL(bioc));
+    object_unref(OBJECT(bioc));
 
     update_iteration_initial_status(s);
 
@@ -3935,6 +3936,7 @@ static void *bg_migration_thread(void *opaque)
         if (iter_state == MIG_ITERATE_SKIP) {
             continue;
         } else if (iter_state == MIG_ITERATE_BREAK) {
+            bg_migration_completion(s, fb);
             break;
         }
 
diff --git a/migration/migration.h b/migration/migration.h
index db6708326b1..bdcd74ce084 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -151,7 +151,6 @@ struct MigrationState {
     QEMUBH *vm_start_bh;
     QEMUBH *cleanup_bh;
     QEMUFile *to_dst_file;
-    QIOChannelBuffer *bioc;
     /*
      * Protects to_dst_file pointer.  We need to make sure we won't
      * yield or hang during the critical section, since this lock will
diff --git a/migration/qemu-file-channel.c b/migration/qemu-file-channel.c
index afc3a7f642a..c1bf71510f8 100644
--- a/migration/qemu-file-channel.c
+++ b/migration/qemu-file-channel.c
@@ -26,6 +26,7 @@
 #include "qemu-file-channel.h"
 #include "qemu-file.h"
 #include "io/channel-socket.h"
+#include "io/channel-buffer.h"
 #include "qemu/iov.h"
 #include "qemu/yank.h"
 
@@ -196,3 +197,16 @@ QEMUFile *qemu_fopen_channel_output(QIOChannel *ioc)
     object_ref(OBJECT(ioc));
     return qemu_fopen_ops(ioc, &channel_output_ops);
 }
+
+/*
+ * Splice all the data in `buffer' into `dst'.  Note that `buffer' must points
+ * to a QEMUFile that was created with qemu_fopen_channel_output().
+ */
+void qemu_put_qio_channel_buffer(QEMUFile *dst, QEMUFile *buffer)
+{
+    QIOChannelBuffer *bioc = QIO_CHANNEL_BUFFER(qemu_file_get_opaque(buffer));
+
+    /* Make sure data cached in QEMUFile flushed to QIOChannel buffers */
+    qemu_fflush(buffer);
+    qemu_put_buffer(dst, bioc->data, bioc->usage);
+}
diff --git a/migration/qemu-file-channel.h b/migration/qemu-file-channel.h
index 0028a09eb61..5f165527616 100644
--- a/migration/qemu-file-channel.h
+++ b/migration/qemu-file-channel.h
@@ -29,4 +29,6 @@
 
 QEMUFile *qemu_fopen_channel_input(QIOChannel *ioc);
 QEMUFile *qemu_fopen_channel_output(QIOChannel *ioc);
+void qemu_put_qio_channel_buffer(QEMUFile *dst, QEMUFile *buffer);
+
 #endif
diff --git a/migration/qemu-file.c b/migration/qemu-file.c
index d6e03dbc0e0..317f98fc8f5 100644
--- a/migration/qemu-file.c
+++ b/migration/qemu-file.c
@@ -112,6 +112,10 @@ QEMUFile *qemu_fopen_ops(void *opaque, const QEMUFileOps *ops)
     return f;
 }
 
+void *qemu_file_get_opaque(QEMUFile *f)
+{
+    return f->opaque;
+}
 
 void qemu_file_set_hooks(QEMUFile *f, const QEMUFileHooks *hooks)
 {
diff --git a/migration/qemu-file.h b/migration/qemu-file.h
index a9b6d6ccb7d..30c8ec855ac 100644
--- a/migration/qemu-file.h
+++ b/migration/qemu-file.h
@@ -161,6 +161,7 @@ int qemu_file_shutdown(QEMUFile *f);
 QEMUFile *qemu_file_get_return_path(QEMUFile *f);
 void qemu_fflush(QEMUFile *f);
 void qemu_file_set_blocking(QEMUFile *f, bool block);
+void *qemu_file_get_opaque(QEMUFile *f);
 
 void ram_control_before_iterate(QEMUFile *f, uint64_t flags);
 void ram_control_after_iterate(QEMUFile *f, uint64_t flags);
-- 
2.26.2


--8t9RHnE3ZwKMSgU+--


