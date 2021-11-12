Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81A1344E1A3
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Nov 2021 06:43:31 +0100 (CET)
Received: from localhost ([::1]:48840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlPLW-0000uP-I1
	for lists+qemu-devel@lfdr.de; Fri, 12 Nov 2021 00:43:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1mlPHk-0006ML-VF
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 00:39:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1mlPHi-0005Pd-QQ
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 00:39:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636695574;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Di6e+XbnhT+3f4Rk7palBJBHX+/WcDESeDqZeBd5oiU=;
 b=W1R5Z/MDr7Wa+u4O1ONHBMRbbeaGc2Bp5zG95M5dzVN0il44pu+EMNExA52bZrmh7Kkz9O
 6QLfp7KCI6MpZfv3ux0PFR3VzVGd/8abNkE0/crz8JPW3920MRcdd8QvOY1WpJ0oxFov3j
 TONq7wmoJAZMurGjnDm3GPxXaqzoSMo=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-124-tg-CaVQiOGyZlPHTj8wneg-1; Fri, 12 Nov 2021 00:39:31 -0500
X-MC-Unique: tg-CaVQiOGyZlPHTj8wneg-1
Received: by mail-ua1-f70.google.com with SMTP id
 h8-20020ab07c68000000b002d147c67fabso2990696uax.20
 for <qemu-devel@nongnu.org>; Thu, 11 Nov 2021 21:39:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Di6e+XbnhT+3f4Rk7palBJBHX+/WcDESeDqZeBd5oiU=;
 b=PCbcL7z7tJNPM5BGhu4OV1zYDJMEpAirEXz2ddnOCJkIzxTfd0U+XjnwfXQmFTBj5B
 QmROPzqzFUnYwy/eIckkPlxDNCcdaSGMh9HXdNaBhdpak95E9S3F4bLnKtuJk6jUld4J
 AiBmCu9/CPbqBGeDaGASn5qkTpc0IMfdfmDn2jl3Ppz6oj/DWXR0+gIbF6l2REDgtYWS
 Cys58Dtj3XJJ1JqoE/6MZ2MupytItPygtxakGk8UufHIbRFRwjh/Na0XK7mT5njx34Jc
 /K/+HHG1pFZvfJi++moUlmaEbSFncYrmHavmVSnao5AGSdAWm9MGZeZeqZiHQo9fC7nY
 e51Q==
X-Gm-Message-State: AOAM533KsutJNg/uYDFpW5YGRP+gM9kRYAwZkf7xymp+SGWdsVW1/jXK
 r1BiWojrzBThwtqTLT+cekzNuqzUE1y6NrnWJNceTvZPPkwP5lNqgYp2qtILyGTbvN8Am8QMSCw
 ClF6LfalWrEqyYto=
X-Received: by 2002:a05:6122:894:: with SMTP id
 20mr19540947vkf.9.1636695570660; 
 Thu, 11 Nov 2021 21:39:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxv6NBp+yZU3Faugmuw4ZMb5ZHLrIMe+sQE75hPrs4dRcJdbxktkuuQixnWDtTvZV5D/OP6rA==
X-Received: by 2002:a05:6122:894:: with SMTP id
 20mr19540918vkf.9.1636695570493; 
 Thu, 11 Nov 2021 21:39:30 -0800 (PST)
Received: from LeoBras.redhat.com ([2804:431:c7f0:7e14:3b94:fb27:f0ad:a824])
 by smtp.gmail.com with ESMTPSA id r2sm1465280vsk.28.2021.11.11.21.39.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Nov 2021 21:39:30 -0800 (PST)
From: Leonardo Bras <leobras@redhat.com>
To: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>
Subject: [PATCH v5 6/6] multifd: Implement zerocopy write in multifd migration
 (multifd-zerocopy)
Date: Fri, 12 Nov 2021 02:10:41 -0300
Message-Id: <20211112051040.923746-7-leobras@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211112051040.923746-1-leobras@redhat.com>
References: <20211112051040.923746-1-leobras@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=leobras@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=leobras@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Leonardo Bras <leobras@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement zerocopy on nocomp_send_write(), by making use of QIOChannel
zerocopy interface.

Change multifd_send_sync_main() so it can distinguish each iteration sync from
the setup and the completion, so a flush_zerocopy() can be called
at the after each iteration in order to make sure all dirty pages are sent
before a new iteration is started.

Also make it return -1 if flush_zerocopy() fails, in order to cancel
the migration process, and avoid resuming the guest in the target host
without receiving all current RAM.

This will work fine on RAM migration because the RAM pages are not usually freed,
and there is no problem on changing the pages content between async_send() and
the actual sending of the buffer, because this change will dirty the page and
cause it to be re-sent on a next iteration anyway.

Given a lot of locked memory may be needed in order to use multid migration
with zerocopy enabled, make it optional by creating a new migration parameter
"zerocopy" on qapi, so low-privileged users can still perform multifd
migrations.

Signed-off-by: Leonardo Bras <leobras@redhat.com>
---
 migration/multifd.h |  4 +++-
 migration/multifd.c | 37 ++++++++++++++++++++++++++++++++-----
 migration/ram.c     | 29 ++++++++++++++++++++++-------
 migration/socket.c  |  9 +++++++--
 4 files changed, 64 insertions(+), 15 deletions(-)

diff --git a/migration/multifd.h b/migration/multifd.h
index 15c50ca0b2..37941c1872 100644
--- a/migration/multifd.h
+++ b/migration/multifd.h
@@ -22,7 +22,7 @@ int multifd_load_cleanup(Error **errp);
 bool multifd_recv_all_channels_created(void);
 bool multifd_recv_new_channel(QIOChannel *ioc, Error **errp);
 void multifd_recv_sync_main(void);
-void multifd_send_sync_main(QEMUFile *f);
+int multifd_send_sync_main(QEMUFile *f, bool sync);
 int multifd_queue_page(QEMUFile *f, RAMBlock *block, ram_addr_t offset);
 
 /* Multifd Compression flags */
@@ -97,6 +97,8 @@ typedef struct {
     uint32_t packet_len;
     /* pointer to the packet */
     MultiFDPacket_t *packet;
+    /* multifd flags for sending ram */
+    int write_flags;
     /* multifd flags for each packet */
     uint32_t flags;
     /* size of the next packet that contains pages */
diff --git a/migration/multifd.c b/migration/multifd.c
index 3d9dc8cb58..816078df60 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -105,7 +105,8 @@ static int nocomp_send_prepare(MultiFDSendParams *p, uint32_t used,
  */
 static int nocomp_send_write(MultiFDSendParams *p, uint32_t used, Error **errp)
 {
-    return qio_channel_writev_all(p->c, p->pages->iov, used, errp);
+    return qio_channel_writev_all_flags(p->c, p->pages->iov, used,
+                                        p->write_flags, errp);
 }
 
 /**
@@ -578,19 +579,27 @@ void multifd_save_cleanup(void)
     multifd_send_state = NULL;
 }
 
-void multifd_send_sync_main(QEMUFile *f)
+int multifd_send_sync_main(QEMUFile *f, bool sync)
 {
     int i;
+    bool flush_zerocopy;
 
     if (!migrate_use_multifd()) {
-        return;
+        return 0;
     }
     if (multifd_send_state->pages->used) {
         if (multifd_send_pages(f) < 0) {
             error_report("%s: multifd_send_pages fail", __func__);
-            return;
+            return 0;
         }
     }
+
+    /*
+     * When using zerocopy, it's necessary to flush after each iteration to make
+     * sure pages from earlier iterations don't end up replacing newer pages.
+     */
+    flush_zerocopy = sync && migrate_use_zerocopy();
+
     for (i = 0; i < migrate_multifd_channels(); i++) {
         MultiFDSendParams *p = &multifd_send_state->params[i];
 
@@ -601,7 +610,7 @@ void multifd_send_sync_main(QEMUFile *f)
         if (p->quit) {
             error_report("%s: channel %d has already quit", __func__, i);
             qemu_mutex_unlock(&p->mutex);
-            return;
+            return 0;
         }
 
         p->packet_num = multifd_send_state->packet_num++;
@@ -612,6 +621,17 @@ void multifd_send_sync_main(QEMUFile *f)
         ram_counters.transferred += p->packet_len;
         qemu_mutex_unlock(&p->mutex);
         qemu_sem_post(&p->sem);
+
+        if (flush_zerocopy) {
+            int ret;
+            Error *err = NULL;
+
+            ret = qio_channel_flush_zerocopy(p->c, &err);
+            if (ret < 0) {
+                error_report_err(err);
+                return -1;
+            }
+        }
     }
     for (i = 0; i < migrate_multifd_channels(); i++) {
         MultiFDSendParams *p = &multifd_send_state->params[i];
@@ -620,6 +640,8 @@ void multifd_send_sync_main(QEMUFile *f)
         qemu_sem_wait(&p->sem_sync);
     }
     trace_multifd_send_sync_main(multifd_send_state->packet_num);
+
+    return 0;
 }
 
 static void *multifd_send_thread(void *opaque)
@@ -853,6 +875,10 @@ static void multifd_new_send_channel_async(QIOTask *task, gpointer opaque)
         goto cleanup;
     }
 
+    if (migrate_use_zerocopy()) {
+        p->write_flags = QIO_CHANNEL_WRITE_FLAG_ZEROCOPY;
+    }
+
     p->c = QIO_CHANNEL(sioc);
     qio_channel_set_delay(p->c, false);
     p->running = true;
@@ -918,6 +944,7 @@ int multifd_save_setup(Error **errp)
         p->packet->version = cpu_to_be32(MULTIFD_VERSION);
         p->name = g_strdup_printf("multifdsend_%d", i);
         p->tls_hostname = g_strdup(s->hostname);
+        p->write_flags = 0;
         socket_send_channel_create(multifd_new_send_channel_async, p);
     }
 
diff --git a/migration/ram.c b/migration/ram.c
index 863035d235..0b3ddbffc1 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -2992,6 +2992,7 @@ static int ram_save_setup(QEMUFile *f, void *opaque)
 {
     RAMState **rsp = opaque;
     RAMBlock *block;
+    int ret;
 
     if (compress_threads_save_setup()) {
         return -1;
@@ -3026,7 +3027,11 @@ static int ram_save_setup(QEMUFile *f, void *opaque)
     ram_control_before_iterate(f, RAM_CONTROL_SETUP);
     ram_control_after_iterate(f, RAM_CONTROL_SETUP);
 
-    multifd_send_sync_main(f);
+    ret =  multifd_send_sync_main(f, false);
+    if (ret < 0) {
+        return ret;
+    }
+
     qemu_put_be64(f, RAM_SAVE_FLAG_EOS);
     qemu_fflush(f);
 
@@ -3135,7 +3140,11 @@ static int ram_save_iterate(QEMUFile *f, void *opaque)
 out:
     if (ret >= 0
         && migration_is_setup_or_active(migrate_get_current()->state)) {
-        multifd_send_sync_main(rs->f);
+        ret = multifd_send_sync_main(rs->f, true);
+        if (ret < 0) {
+            return ret;
+        }
+
         qemu_put_be64(f, RAM_SAVE_FLAG_EOS);
         qemu_fflush(f);
         ram_counters.transferred += 8;
@@ -3193,13 +3202,19 @@ static int ram_save_complete(QEMUFile *f, void *opaque)
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
+    ret = multifd_send_sync_main(rs->f, false);
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
index e26e94aa0c..8e40e0a3fd 100644
--- a/migration/socket.c
+++ b/migration/socket.c
@@ -78,8 +78,13 @@ static void socket_outgoing_migration(QIOTask *task,
         trace_migration_socket_outgoing_connected(data->hostname);
     }
 
-    if (migrate_use_zerocopy()) {
-        error_setg(&err, "Zerocopy not available in migration");
+    if (migrate_use_zerocopy() &&
+        (!migrate_use_multifd() ||
+         !qio_channel_has_feature(sioc, QIO_CHANNEL_FEATURE_WRITE_ZEROCOPY) ||
+          migrate_multifd_compression() != MULTIFD_COMPRESSION_NONE ||
+          migrate_use_tls())) {
+        error_setg(&err,
+                   "Zerocopy only available for non-compressed non-TLS multifd migration");
     }
 
     migration_channel_connect(data->s, sioc, data->hostname, err);
-- 
2.33.1


