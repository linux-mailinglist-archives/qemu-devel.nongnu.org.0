Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C264150EB5D
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 23:57:15 +0200 (CEST)
Received: from localhost ([::1]:60794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nj6hm-0006gl-Sq
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 17:57:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1nj6cn-00064u-5V
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 17:52:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1nj6cl-000175-4K
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 17:52:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650923522;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Qb6tF6CJQjonKv1oVyihDvSgZidXotakUOfZADwTqiE=;
 b=LLF55KoQolC9eeQVeui9FrUJjX/GoU16+nHYzsTgqYjqpF13HjJxC22fvXNRXHGfGOeZfM
 ImHRcNqQ6Mq3kfsPwasHOU4ihwADV6Or3f6dtKeUSgv2P9POgFIJk8An9CjenUjUzLMPHr
 1kK2tYdw4i6Lv35gbd/txS8+G6WHKrc=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-588-DR5Bk8cFMD6pG4gsh74qdw-1; Mon, 25 Apr 2022 17:52:01 -0400
X-MC-Unique: DR5Bk8cFMD6pG4gsh74qdw-1
Received: by mail-oi1-f200.google.com with SMTP id
 f2-20020aca3802000000b0032303e77135so5061152oia.2
 for <qemu-devel@nongnu.org>; Mon, 25 Apr 2022 14:52:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Qb6tF6CJQjonKv1oVyihDvSgZidXotakUOfZADwTqiE=;
 b=nguDQn6JIOqR+7bem3ft369nI6AcOV5nYqT3TATPKggJmpsUfXyAJcXEvEw+JckfOF
 eYRGt1+lXZnlQiRoRy9sJ2DzPEqthyZtH4Fz4VMVydP0E/IlDzo/15JAOmYJnc0hjrfX
 SBm2H6Pm3OArBCdavUxKcevf9VEhFWjL4TPzUy4oOrMCFAs9EgqD9ZAS4PJAKizrcjZw
 no8/fwbthj87xodegrCTyx5Dm+ymmJAZ4B3mJj8XHm9yD4f48PGChVjcTECwBh1RFD+S
 ZstgskaqWvShd4yLoyNdAEeDUDiY92a/+5maAF0eTyPPMoDpGhVX7SMMWMdhswHykHFr
 cEGA==
X-Gm-Message-State: AOAM530VzjEhvoJYwsJ2jT3KUriXKtAkhGt6p3op5hPx3FTYQ7ghCsCs
 4pTE3kqw8AUyZSlf5fAEgg+eAUeusMmG1iqnJ1RYSQRjnyDjmg+x+DoERUVBASWIskRhtYhuNLM
 yViG/wiQ5nfxnNA0=
X-Received: by 2002:a05:6870:15d3:b0:e5:bae5:4db with SMTP id
 k19-20020a05687015d300b000e5bae504dbmr12307640oad.245.1650923520379; 
 Mon, 25 Apr 2022 14:52:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJySMZDNszJ3W99uhJa1xpaleIH+A4RDFW1jCK8CNx4HCawMJIqJAOnUPBmXseI9OzT7W+e2mA==
X-Received: by 2002:a05:6870:15d3:b0:e5:bae5:4db with SMTP id
 k19-20020a05687015d300b000e5bae504dbmr12307629oad.245.1650923520198; 
 Mon, 25 Apr 2022 14:52:00 -0700 (PDT)
Received: from LeoBras.redhat.com ([2804:431:c7f0:2ba0:92e8:26c9:ce7e:f03e])
 by smtp.gmail.com with ESMTPSA id
 q7-20020a056870e60700b000e686d13878sm156807oag.18.2022.04.25.14.51.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Apr 2022 14:51:59 -0700 (PDT)
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
Subject: [PATCH v9 7/7] multifd: Implement zero copy write in multifd
 migration (multifd-zero-copy)
Date: Mon, 25 Apr 2022 18:50:56 -0300
Message-Id: <20220425215055.611825-8-leobras@redhat.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220425215055.611825-1-leobras@redhat.com>
References: <20220425215055.611825-1-leobras@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=leobras@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

A lot of locked memory may be needed in order to use multifd migration
with zero-copy enabled, so disabling the feature should be necessary for
low-privileged users trying to perform multifd migrations.

Signed-off-by: Leonardo Bras <leobras@redhat.com>
---
 migration/multifd.h   |  2 ++
 migration/migration.c | 11 ++++++++++-
 migration/multifd.c   | 34 ++++++++++++++++++++++++++++++----
 migration/socket.c    |  5 +++--
 4 files changed, 45 insertions(+), 7 deletions(-)

diff --git a/migration/multifd.h b/migration/multifd.h
index bcf5992945..4d8d89e5e5 100644
--- a/migration/multifd.h
+++ b/migration/multifd.h
@@ -92,6 +92,8 @@ typedef struct {
     uint32_t packet_len;
     /* pointer to the packet */
     MultiFDPacket_t *packet;
+    /* multifd flags for sending ram */
+    int write_flags;
     /* multifd flags for each packet */
     uint32_t flags;
     /* size of the next packet that contains pages */
diff --git a/migration/migration.c b/migration/migration.c
index 4b6df2eb5e..31739b2af9 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1497,7 +1497,16 @@ static bool migrate_params_check(MigrationParameters *params, Error **errp)
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
index 6c940aaa98..e37cc6e0d9 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -569,6 +569,7 @@ void multifd_save_cleanup(void)
 int multifd_send_sync_main(QEMUFile *f)
 {
     int i;
+    bool flush_zero_copy;
 
     if (!migrate_use_multifd()) {
         return 0;
@@ -579,6 +580,14 @@ int multifd_send_sync_main(QEMUFile *f)
             return -1;
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
 
@@ -600,6 +609,17 @@ int multifd_send_sync_main(QEMUFile *f)
         ram_counters.transferred += p->packet_len;
         qemu_mutex_unlock(&p->mutex);
         qemu_sem_post(&p->sem);
+
+        if (flush_zero_copy && p->c) {
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
@@ -688,10 +708,9 @@ static void *multifd_send_thread(void *opaque)
                 p->iov[0].iov_base = p->packet;
             }
 
-            ret = qio_channel_writev_all(p->c, p->iov + iov_offset,
-                                         p->iovs_num - iov_offset,
-                                         &local_err);
-
+            ret = qio_channel_writev_full_all(p->c, p->iov + iov_offset,
+                                              p->iovs_num - iov_offset, NULL,
+                                              0, p->write_flags, &local_err);
             if (ret != 0) {
                 break;
             }
@@ -920,6 +939,13 @@ int multifd_save_setup(Error **errp)
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
 
diff --git a/migration/socket.c b/migration/socket.c
index 3754d8f72c..4fd5e85f50 100644
--- a/migration/socket.c
+++ b/migration/socket.c
@@ -79,8 +79,9 @@ static void socket_outgoing_migration(QIOTask *task,
 
     trace_migration_socket_outgoing_connected(data->hostname);
 
-    if (migrate_use_zero_copy_send()) {
-        error_setg(&err, "Zero copy send not available in migration");
+    if (migrate_use_zero_copy_send() &&
+        !qio_channel_has_feature(sioc, QIO_CHANNEL_FEATURE_WRITE_ZERO_COPY)) {
+        error_setg(&err, "Zero copy send feature not detected in host kernel");
     }
 
 out:
-- 
2.36.0


