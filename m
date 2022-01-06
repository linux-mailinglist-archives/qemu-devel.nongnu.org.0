Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2E5D486D19
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 23:17:18 +0100 (CET)
Received: from localhost ([::1]:41118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5b4Q-0000I1-1z
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 17:17:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1n5b1c-0005Md-43
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 17:14:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20891)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1n5b1X-0006Qm-Ke
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 17:14:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641507259;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M5Ipwjc3dvGMTRkHj1aIocB4X1iuh8YN9du2k/gWd/g=;
 b=IVdNX+pPEiwx38Rs2EGtO8gMVzM5Vm4MhMx9/Vj+1pLbZMcEhAwOakxGTiVQmNcc2M5RWt
 nPE7AQZKCjoncaPL2QsfMemugPXe7rtH1DNc7PdFvGjL7z7mtiNULRu0Z3eJZF8PcJFdYg
 RmX1NUCg+H+28oSViL5UP/RgWhPHc7s=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-141-kLZR5AnxN9OhNF-npEvMGw-1; Thu, 06 Jan 2022 17:14:18 -0500
X-MC-Unique: kLZR5AnxN9OhNF-npEvMGw-1
Received: by mail-ua1-f70.google.com with SMTP id
 w14-20020ab055ce000000b002fedc60272fso2141536uaa.21
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 14:14:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M5Ipwjc3dvGMTRkHj1aIocB4X1iuh8YN9du2k/gWd/g=;
 b=73uilEVAHV21x7zIP3uIN+pk1tSVAXwN8qFXuREK5oWuAisJSTN68LdpDBfq/ukNB+
 qnlBI1QQduyMl2tYLDBVZoztMTdputLvIzQsGYSCvd96auknBujy4OqtFbiAljhYuivT
 /NODVwn+D1Y88RyhXjiqOMgz+XIYDcNRSZJkV7RO6FXDZzrNddbYU1hIDIpCOAEEi1Y8
 gpFXgWhXVEplfiWzgRAGv7OEAAH6blIIn1l+PUx5D7CbGiMBhAaeCi/rvqffuo6bBiqe
 hUdtYDN7AG2eGN2fQkW8/Jgua2gXgbxqaa9a04rea53LJaQv7+PVLwcR7UIEvIbaY2XX
 ZpAg==
X-Gm-Message-State: AOAM532kFZtnEqYNHMpuDncGDjShZglSjtXP7LXSviIcv/xaEcPeowrN
 MtDtsMi1arXIa/BQLt+ZL8iqHFftFpgXs27CGGZDQX0yXafo229OW6kGT8DWkIKVk156WK9P4ri
 iP5NAUuYhMED9Lvg=
X-Received: by 2002:a05:6102:4a5:: with SMTP id
 r5mr18067362vsa.22.1641507257459; 
 Thu, 06 Jan 2022 14:14:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzkzLbRsgWhcFR9UpmyTtDTj4JC6VAil9eVj9YzYjn5qmSu7xrXduxEVRPIS4SDOfT/QKvttg==
X-Received: by 2002:a05:6102:4a5:: with SMTP id
 r5mr18067351vsa.22.1641507257168; 
 Thu, 06 Jan 2022 14:14:17 -0800 (PST)
Received: from LeoBras.redhat.com ([2804:431:c7f1:cc01:fae1:7982:b010:d91])
 by smtp.gmail.com with ESMTPSA id c15sm2098831uaj.13.2022.01.06.14.14.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 14:14:16 -0800 (PST)
From: Leonardo Bras <leobras@redhat.com>
To: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Peter Xu <peterx@redhat.com>
Subject: [PATCH v7 5/5] multifd: Implement zero copy write in multifd
 migration (multifd-zero-copy)
Date: Thu,  6 Jan 2022 19:13:42 -0300
Message-Id: <20220106221341.8779-6-leobras@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220106221341.8779-1-leobras@redhat.com>
References: <20220106221341.8779-1-leobras@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=leobras@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=leobras@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
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
Cc: Leonardo Bras <leobras@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement zero copy on nocomp_send_write(), by making use of QIOChannel
writev + flags & flush interface.

Change multifd_send_sync_main() so it can distinguish each iteration sync from
the setup and the completion, so a flush_zero_copy() can be called
after each iteration in order to make sure all dirty pages are sent
before a new iteration is started.

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
 migration/multifd.c   | 40 +++++++++++++++++++++++++++++++++++-----
 migration/ram.c       | 29 ++++++++++++++++++++++-------
 migration/socket.c    |  5 +++--
 5 files changed, 73 insertions(+), 16 deletions(-)

diff --git a/migration/multifd.h b/migration/multifd.h
index e57adc783b..d9fbccdbe2 100644
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
diff --git a/migration/migration.c b/migration/migration.c
index 7bcb800890..76a3313e66 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1476,7 +1476,16 @@ static bool migrate_params_check(MigrationParameters *params, Error **errp)
         error_prepend(errp, "Invalid mapping given for block-bitmap-mapping: ");
         return false;
     }
-
+#ifdef CONFIG_LINUX
+    if (params->zero_copy &&
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
index 677e942747..1b6b7cc1a1 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -104,7 +104,8 @@ static int nocomp_send_prepare(MultiFDSendParams *p, Error **errp)
  */
 static int nocomp_send_write(MultiFDSendParams *p, uint32_t used, Error **errp)
 {
-    return qio_channel_writev_all(p->c, p->pages->iov, used, errp);
+    return qio_channel_writev_full_all_flags(p->c, p->pages->iov, used,
+                                             NULL, 0, p->write_flags, errp);
 }
 
 /**
@@ -582,19 +583,28 @@ void multifd_save_cleanup(void)
     multifd_send_state = NULL;
 }
 
-void multifd_send_sync_main(QEMUFile *f)
+int multifd_send_sync_main(QEMUFile *f, bool sync)
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
+    flush_zero_copy = sync && migrate_use_zero_copy();
+
     for (i = 0; i < migrate_multifd_channels(); i++) {
         MultiFDSendParams *p = &multifd_send_state->params[i];
 
@@ -605,7 +615,7 @@ void multifd_send_sync_main(QEMUFile *f)
         if (p->quit) {
             error_report("%s: channel %d has already quit", __func__, i);
             qemu_mutex_unlock(&p->mutex);
-            return;
+            return 0;
         }
 
         p->packet_num = multifd_send_state->packet_num++;
@@ -616,6 +626,17 @@ void multifd_send_sync_main(QEMUFile *f)
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
@@ -624,6 +645,8 @@ void multifd_send_sync_main(QEMUFile *f)
         qemu_sem_wait(&p->sem_sync);
     }
     trace_multifd_send_sync_main(multifd_send_state->packet_num);
+
+    return 0;
 }
 
 static void *multifd_send_thread(void *opaque)
@@ -919,6 +942,13 @@ int multifd_save_setup(Error **errp)
         p->packet->version = cpu_to_be32(MULTIFD_VERSION);
         p->name = g_strdup_printf("multifdsend_%d", i);
         p->tls_hostname = g_strdup(s->hostname);
+
+        if (migrate_use_zero_copy()) {
+            p->write_flags = QIO_CHANNEL_WRITE_FLAG_ZERO_COPY;
+        } else {
+            p->write_flags = 0;
+        }
+
         socket_send_channel_create(multifd_new_send_channel_async, p);
     }
 
diff --git a/migration/ram.c b/migration/ram.c
index 57efa67f20..a1ae66c50c 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -2987,6 +2987,7 @@ static int ram_save_setup(QEMUFile *f, void *opaque)
 {
     RAMState **rsp = opaque;
     RAMBlock *block;
+    int ret;
 
     if (compress_threads_save_setup()) {
         return -1;
@@ -3021,7 +3022,11 @@ static int ram_save_setup(QEMUFile *f, void *opaque)
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
 
@@ -3130,7 +3135,11 @@ static int ram_save_iterate(QEMUFile *f, void *opaque)
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
@@ -3188,13 +3197,19 @@ static int ram_save_complete(QEMUFile *f, void *opaque)
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
index f7a77aafd3..23b03e6190 100644
--- a/migration/socket.c
+++ b/migration/socket.c
@@ -78,8 +78,9 @@ static void socket_outgoing_migration(QIOTask *task,
         trace_migration_socket_outgoing_connected(data->hostname);
     }
 
-    if (migrate_use_zero_copy()) {
-        error_setg(&err, "Zero copy not available in migration");
+    if (migrate_use_zero_copy() &&
+        !qio_channel_has_feature(sioc, QIO_CHANNEL_FEATURE_WRITE_ZERO_COPY)) {
+        error_setg(&err, "Zero copy feature not detected in host kernel");
     }
 
     migration_channel_connect(data->s, sioc, data->hostname, err);
-- 
2.34.1


