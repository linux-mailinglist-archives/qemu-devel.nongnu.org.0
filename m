Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B2BA46E5E7
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Dec 2021 10:47:04 +0100 (CET)
Received: from localhost ([::1]:36182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvG11-0002rA-DO
	for lists+qemu-devel@lfdr.de; Thu, 09 Dec 2021 04:47:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1mvFub-0000vE-Qt
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 04:40:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21717)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1mvFuZ-0008OG-T9
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 04:40:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639042822;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lA323sJLUVxjAwZPCVNpDBJnVeKk+Zs9yrOAfD/pO4o=;
 b=IeSRtqf6CD149t62y21fQaH93LbGaRLAjDjNLPil6Vj9UyIN0DDCrzljjQHbIFfkQCnnX7
 QEKkfppemKqgsN3FmVIkdhefhYskmrg0Y2ns8R1YtdHHYwfzMsn9gwwl32nhnLStWvagHP
 8/hPU72zygYmjXkJUp745K1ZbY+o/x8=
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-258-DXfGgoQvNmmX07zy3MWGHA-1; Thu, 09 Dec 2021 04:40:19 -0500
X-MC-Unique: DXfGgoQvNmmX07zy3MWGHA-1
Received: by mail-vk1-f197.google.com with SMTP id
 x5-20020a056122118500b002efcd7b7990so2939767vkn.15
 for <qemu-devel@nongnu.org>; Thu, 09 Dec 2021 01:40:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lA323sJLUVxjAwZPCVNpDBJnVeKk+Zs9yrOAfD/pO4o=;
 b=GObWmRGrGT0Mcs2d9VRSjw4/P7e3h6idkdysbHwhjA4W2zETf3DyNHXABLAZpt7nDu
 VAel2e7GK1tHqY6RdOTUR2oDQTBWUIp0OF+6iBvYVwKG78w1T/3CSQ2+pegqIrZtk2xn
 Ml6nRnBpMtZdApojoRH+TJWaq8BU4UfA2FbTEgRO1MKewPUPn/OqifDXGCDAftNEAt3r
 KQtaSirG9iXKbXf+CsGTIQLVivWmhVFJG5At+fIrCuxRGFw0gcuxxvZXNXBrX5YhTKwG
 bMsfHWC5gQfDupxuOelT8t6i39mHCar179X3Uf9T7CKvFrp/JachZE/Ai4yepJXRvsQz
 /QPA==
X-Gm-Message-State: AOAM531gz+XOZBIqlpN2RYuIXCaOU6kiD9ztJslbLbqDQ0euX5ND4d6t
 RhKopMKsv/IQ3RKSoUjTGQlbDRhSit/0kZv3diaGUs7eriNEdrZSFIoy3DuvYKLQB1JKLTqx/3q
 KZdEjCK/XJhj+rng=
X-Received: by 2002:a67:f88e:: with SMTP id h14mr6055452vso.37.1639042819240; 
 Thu, 09 Dec 2021 01:40:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwguOL5PbzBRX8WmXzUevHjtwMTKFVwcfHzU/yQDfYwVaRrf/N5LY05/xVx57auDLMKiWmMtw==
X-Received: by 2002:a67:f88e:: with SMTP id h14mr6055413vso.37.1639042818985; 
 Thu, 09 Dec 2021 01:40:18 -0800 (PST)
Received: from LeoBras.redhat.com ([2804:431:c7f0:dadb:5bd9:f52:7a4a:a8af])
 by smtp.gmail.com with ESMTPSA id s22sm3460215vkm.28.2021.12.09.01.40.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Dec 2021 01:40:18 -0800 (PST)
From: Leonardo Bras <leobras@redhat.com>
To: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>
Subject: [PATCH v6 6/6] multifd: Implement zero copy write in multifd
 migration (multifd-zero-copy)
Date: Thu,  9 Dec 2021 06:39:24 -0300
Message-Id: <20211209093923.1293701-7-leobras@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211209093923.1293701-1-leobras@redhat.com>
References: <20211209093923.1293701-1-leobras@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=leobras@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=leobras@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.618,
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

Implement zero copy on nocomp_send_write(), by making use of QIOChannel
zero copy interface.

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
diff --git a/migration/migration.c b/migration/migration.c
index 8e50f7508a..4e154ff901 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1468,7 +1468,16 @@ static bool migrate_params_check(MigrationParameters *params, Error **errp)
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
index b32b756147..4c718cddf7 100644
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
@@ -578,19 +579,28 @@ void multifd_save_cleanup(void)
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
     if (multifd_send_state->pages->used) {
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
 
@@ -601,7 +611,7 @@ void multifd_send_sync_main(QEMUFile *f)
         if (p->quit) {
             error_report("%s: channel %d has already quit", __func__, i);
             qemu_mutex_unlock(&p->mutex);
-            return;
+            return 0;
         }
 
         p->packet_num = multifd_send_state->packet_num++;
@@ -612,6 +622,17 @@ void multifd_send_sync_main(QEMUFile *f)
         ram_counters.transferred += p->packet_len;
         qemu_mutex_unlock(&p->mutex);
         qemu_sem_post(&p->sem);
+
+        if (flush_zero_copy) {
+            int ret;
+            Error *err = NULL;
+
+            ret = qio_channel_flush_zero_copy(p->c, &err);
+            if (ret < 0) {
+                error_report_err(err);
+                return -1;
+            }
+        }
     }
     for (i = 0; i < migrate_multifd_channels(); i++) {
         MultiFDSendParams *p = &multifd_send_state->params[i];
@@ -620,6 +641,8 @@ void multifd_send_sync_main(QEMUFile *f)
         qemu_sem_wait(&p->sem_sync);
     }
     trace_multifd_send_sync_main(multifd_send_state->packet_num);
+
+    return 0;
 }
 
 static void *multifd_send_thread(void *opaque)
@@ -917,6 +940,13 @@ int multifd_save_setup(Error **errp)
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
2.33.1


