Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8AF4A57BB
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 08:28:01 +0100 (CET)
Received: from localhost ([::1]:50964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEna4-0001iF-1s
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 02:28:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1nEmgA-0003DX-BD
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 01:30:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1nEmg6-0006dH-MZ
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 01:30:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643697009;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9AmGAz4qTlgfGRFAixOe2SM28q3/GkCDL2jrBc1WW8c=;
 b=YUyfVux6W5CeSP5yTuVRWpW89PulUV5edz2l6V3WcSM11rZ32RM1z4zPf+DW1qlRbrSWCc
 9CK4CrL4A3eZCQFe3gCXLrmgFo15pb3+SXYasC+L0kB/Ms7kdUgCFH2PI92mhvdg9102du
 nAzFpAcmwNt2QZ4Db3RTVJRg7gAwdS0=
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-376-CmCledQVNOe-RtyAEFef1Q-1; Tue, 01 Feb 2022 01:30:09 -0500
X-MC-Unique: CmCledQVNOe-RtyAEFef1Q-1
Received: by mail-oo1-f72.google.com with SMTP id
 e14-20020a056820060e00b002edda9f237bso5654471oow.22
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 22:30:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9AmGAz4qTlgfGRFAixOe2SM28q3/GkCDL2jrBc1WW8c=;
 b=HvM+GAYJw/NXLrFhmosEdAduaixc09eClDtPQiirDCnU+pezBZzgXq67Oj7wpEd6vW
 uhmPmC38qFj3R745mg7VworE17L81Mi8AqjXkZ4ahudLEtkc5PEcL+HQkfjX9/adJyBc
 BjWDwZT77zJ31zAExhe3X31X8sbw8hXDCYgaVVxg1ekmF9UyAj4oGGzY6Bm5W2O+tnGI
 zEb8BHB3WNZZX2cUeuQOeYr1YCXG3/WSZjL/v0zeZqy8UeoaHkhxDWxETc/OQrG3l0KD
 UIGVXBkU8E1rOGc5nbxwt2yAh2cYC45E/LJu+BCrwdewHatURWKTgXzr3wUbOd1GYB3v
 oEGg==
X-Gm-Message-State: AOAM532oWazdO72dis7ETF0K3QbeVYYQS3Zdw11cCNMCuGOeUrNfKYEm
 3ZQRUWRZ3LgRYzaFVq3bV4EjahgxW3dxS8oZwYOLiCM7PFS1+wNzU5ePE4O2OnwXAe3aXYwi38/
 ubgD0AyDqnotOlMI=
X-Received: by 2002:a9d:7341:: with SMTP id l1mr9328093otk.36.1643697008190;
 Mon, 31 Jan 2022 22:30:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwPXx64vx07YOTrMOjj7oaY/VtW4YwuLvzw3N5kUQlXqdw+HU6TPGIRCLb0+5vwnR9+VXA2lA==
X-Received: by 2002:a9d:7341:: with SMTP id l1mr9328080otk.36.1643697007988;
 Mon, 31 Jan 2022 22:30:07 -0800 (PST)
Received: from LeoBras.redhat.com ([2804:431:c7f1:95e9:6da1:67bd:fdc3:e12e])
 by smtp.gmail.com with ESMTPSA id l14sm14424720ooq.12.2022.01.31.22.30.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 22:30:07 -0800 (PST)
From: Leonardo Bras <leobras@redhat.com>
To: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Fam Zheng <fam@euphon.net>, Peter Xu <peterx@redhat.com>
Subject: [PATCH v8 5/5] multifd: Implement zero copy write in multifd
 migration (multifd-zero-copy)
Date: Tue,  1 Feb 2022 03:29:03 -0300
Message-Id: <20220201062901.428838-6-leobras@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220201062901.428838-1-leobras@redhat.com>
References: <20220201062901.428838-1-leobras@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=leobras@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=leobras@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.081,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Leonardo Bras <leobras@redhat.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement zero copy send on nocomp_send_write(), by making use of QIOChannel
writev + flags & flush interface.

Change multifd_send_sync_main() so flush_zero_copy() can be called
after each iteration in order to make sure all dirty pages are sent before
a new iteration is started. It will also flush at the beginning and at the
end of migration.

Also make it return -1 if flush_zero_copy() fails, in order to cancel
the migration process, and avoid resuming the guest in the target host
without receiving all current RAM.

This will work fine on RAM migration because the RAM pages are not usually freed,
and there is no problem on changing the pages content between writev_zero_copy() and
the actual sending of the buffer, because this change will dirty the page and
cause it to be re-sent on a next iteration anyway.

A lot of locked memory may be needed in order to use multid migration
with zero-copy enabled, so disabling the feature should be necessary for
low-privileged users trying to perform multifd migrations.

Signed-off-by: Leonardo Bras <leobras@redhat.com>
---
 migration/multifd.h   |  4 +++-
 migration/migration.c | 11 ++++++++++-
 migration/multifd.c   | 41 +++++++++++++++++++++++++++++++++++------
 migration/ram.c       | 29 ++++++++++++++++++++++-------
 migration/socket.c    |  5 +++--
 5 files changed, 73 insertions(+), 17 deletions(-)

diff --git a/migration/multifd.h b/migration/multifd.h
index 4dda900a0b..7ec688fb4f 100644
--- a/migration/multifd.h
+++ b/migration/multifd.h
@@ -22,7 +22,7 @@ int multifd_load_cleanup(Error **errp);
 bool multifd_recv_all_channels_created(void);
 bool multifd_recv_new_channel(QIOChannel *ioc, Error **errp);
 void multifd_recv_sync_main(void);
-void multifd_send_sync_main(QEMUFile *f);
+int multifd_send_sync_main(QEMUFile *f);
 int multifd_queue_page(QEMUFile *f, RAMBlock *block, ram_addr_t offset);
 
 /* Multifd Compression flags */
@@ -96,6 +96,8 @@ typedef struct {
     uint32_t packet_len;
     /* pointer to the packet */
     MultiFDPacket_t *packet;
+    /* multifd flags for sending ram */
+    int write_flags;
     /* multifd flags for each packet */
     uint32_t flags;
     /* size of the next packet that contains pages */
diff --git a/migration/migration.c b/migration/migration.c
index 3e0a25bb5b..1450fd0370 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1479,7 +1479,16 @@ static bool migrate_params_check(MigrationParameters *params, Error **errp)
         error_prepend(errp, "Invalid mapping given for block-bitmap-mapping: ");
         return false;
     }
-
+#ifdef CONFIG_LINUX
+    if (params->zero_copy_send &&
+        (!migrate_use_multifd() ||
+         params->multifd_compression != MULTIFD_COMPRESSION_NONE ||
+         (params->tls_creds && *params->tls_creds))) {
+        error_setg(errp,
+                   "Zero copy only available for non-compressed non-TLS multifd migration");
+        return false;
+    }
+#endif
     return true;
 }
 
diff --git a/migration/multifd.c b/migration/multifd.c
index 43998ad117..2d68b9cf4f 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -568,19 +568,28 @@ void multifd_save_cleanup(void)
     multifd_send_state = NULL;
 }
 
-void multifd_send_sync_main(QEMUFile *f)
+int multifd_send_sync_main(QEMUFile *f)
 {
     int i;
+    bool flush_zero_copy;
 
     if (!migrate_use_multifd()) {
-        return;
+        return 0;
     }
     if (multifd_send_state->pages->num) {
         if (multifd_send_pages(f) < 0) {
             error_report("%s: multifd_send_pages fail", __func__);
-            return;
+            return 0;
         }
     }
+
+    /*
+     * When using zero-copy, it's necessary to flush after each iteration to
+     * make sure pages from earlier iterations don't end up replacing newer
+     * pages.
+     */
+    flush_zero_copy = migrate_use_zero_copy_send();
+
     for (i = 0; i < migrate_multifd_channels(); i++) {
         MultiFDSendParams *p = &multifd_send_state->params[i];
 
@@ -591,7 +600,7 @@ void multifd_send_sync_main(QEMUFile *f)
         if (p->quit) {
             error_report("%s: channel %d has already quit", __func__, i);
             qemu_mutex_unlock(&p->mutex);
-            return;
+            return 0;
         }
 
         p->packet_num = multifd_send_state->packet_num++;
@@ -602,6 +611,17 @@ void multifd_send_sync_main(QEMUFile *f)
         ram_counters.transferred += p->packet_len;
         qemu_mutex_unlock(&p->mutex);
         qemu_sem_post(&p->sem);
+
+        if (flush_zero_copy) {
+            int ret;
+            Error *err = NULL;
+
+            ret = qio_channel_flush(p->c, &err);
+            if (ret < 0) {
+                error_report_err(err);
+                return -1;
+            }
+        }
     }
     for (i = 0; i < migrate_multifd_channels(); i++) {
         MultiFDSendParams *p = &multifd_send_state->params[i];
@@ -610,6 +630,8 @@ void multifd_send_sync_main(QEMUFile *f)
         qemu_sem_wait(&p->sem_sync);
     }
     trace_multifd_send_sync_main(multifd_send_state->packet_num);
+
+    return 0;
 }
 
 static void *multifd_send_thread(void *opaque)
@@ -668,8 +690,8 @@ static void *multifd_send_thread(void *opaque)
             p->iov[0].iov_len = p->packet_len;
             p->iov[0].iov_base = p->packet;
 
-            ret = qio_channel_writev_all(p->c, p->iov, p->iovs_num,
-                                         &local_err);
+            ret = qio_channel_writev_full_all(p->c, p->iov, p->iovs_num, NULL,
+                                              0, p->write_flags, &local_err);
             if (ret != 0) {
                 break;
             }
@@ -910,6 +932,13 @@ int multifd_save_setup(Error **errp)
         /* We need one extra place for the packet header */
         p->iov = g_new0(struct iovec, page_count + 1);
         p->normal = g_new0(ram_addr_t, page_count);
+
+        if (migrate_use_zero_copy_send()) {
+            p->write_flags = QIO_CHANNEL_WRITE_FLAG_ZERO_COPY;
+        } else {
+            p->write_flags = 0;
+        }
+
         socket_send_channel_create(multifd_new_send_channel_async, p);
     }
 
diff --git a/migration/ram.c b/migration/ram.c
index 91ca743ac8..d8c215e43a 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -2902,6 +2902,7 @@ static int ram_save_setup(QEMUFile *f, void *opaque)
 {
     RAMState **rsp = opaque;
     RAMBlock *block;
+    int ret;
 
     if (compress_threads_save_setup()) {
         return -1;
@@ -2936,7 +2937,11 @@ static int ram_save_setup(QEMUFile *f, void *opaque)
     ram_control_before_iterate(f, RAM_CONTROL_SETUP);
     ram_control_after_iterate(f, RAM_CONTROL_SETUP);
 
-    multifd_send_sync_main(f);
+    ret =  multifd_send_sync_main(f);
+    if (ret < 0) {
+        return ret;
+    }
+
     qemu_put_be64(f, RAM_SAVE_FLAG_EOS);
     qemu_fflush(f);
 
@@ -3045,7 +3050,11 @@ static int ram_save_iterate(QEMUFile *f, void *opaque)
 out:
     if (ret >= 0
         && migration_is_setup_or_active(migrate_get_current()->state)) {
-        multifd_send_sync_main(rs->f);
+        ret = multifd_send_sync_main(rs->f);
+        if (ret < 0) {
+            return ret;
+        }
+
         qemu_put_be64(f, RAM_SAVE_FLAG_EOS);
         qemu_fflush(f);
         ram_transferred_add(8);
@@ -3105,13 +3114,19 @@ static int ram_save_complete(QEMUFile *f, void *opaque)
         ram_control_after_iterate(f, RAM_CONTROL_FINISH);
     }
 
-    if (ret >= 0) {
-        multifd_send_sync_main(rs->f);
-        qemu_put_be64(f, RAM_SAVE_FLAG_EOS);
-        qemu_fflush(f);
+    if (ret < 0) {
+        return ret;
     }
 
-    return ret;
+    ret = multifd_send_sync_main(rs->f);
+    if (ret < 0) {
+        return ret;
+    }
+
+    qemu_put_be64(f, RAM_SAVE_FLAG_EOS);
+    qemu_fflush(f);
+
+    return 0;
 }
 
 static void ram_save_pending(QEMUFile *f, void *opaque, uint64_t max_size,
diff --git a/migration/socket.c b/migration/socket.c
index f586f983b7..c49431425e 100644
--- a/migration/socket.c
+++ b/migration/socket.c
@@ -78,8 +78,9 @@ static void socket_outgoing_migration(QIOTask *task,
         trace_migration_socket_outgoing_connected(data->hostname);
     }
 
-    if (migrate_use_zero_copy_send()) {
-        error_setg(&err, "Zero copy send not available in migration");
+    if (migrate_use_zero_copy_send() &&
+        !qio_channel_has_feature(sioc, QIO_CHANNEL_FEATURE_WRITE_ZERO_COPY)) {
+        error_setg(&err, "Zero copy send feature not detected in host kernel");
     }
 
     migration_channel_connect(data->s, sioc, data->hostname, err);
-- 
2.34.1


