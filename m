Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B711525C46
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 09:19:58 +0200 (CEST)
Received: from localhost ([::1]:42828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npPae-00061q-Ld
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 03:19:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1npOo5-0007WM-Oh
 for qemu-devel@nongnu.org; Fri, 13 May 2022 02:29:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53331)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1npOo2-0000bS-1r
 for qemu-devel@nongnu.org; Fri, 13 May 2022 02:29:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652423381;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Es7feWJg4I6kHK8R1KijoyhmPfSoP4lE2YnkJIChTpo=;
 b=NX1ajNH/P3Dg6YALfkyW2jQh7YsEB8sYo/Q+aqsoeT2ctjBfhKGSuwQznNEza2kNRt92L5
 G7yT0VFgKc6e2zvXSnJiyC/qQVy9CpxwQwP0Vea2s+PU4m6odlhs6Hn0YXb95oV8I7ODnu
 d4AT6JNqYxBNvUXBu02CwmNrob5gnH8=
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-214-bja0EjdENmOCaJKNAtPQiQ-1; Fri, 13 May 2022 02:29:40 -0400
X-MC-Unique: bja0EjdENmOCaJKNAtPQiQ-1
Received: by mail-oo1-f70.google.com with SMTP id
 h42-20020a4a942d000000b00321739192d0so3837449ooi.8
 for <qemu-devel@nongnu.org>; Thu, 12 May 2022 23:29:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Es7feWJg4I6kHK8R1KijoyhmPfSoP4lE2YnkJIChTpo=;
 b=ZnzszdAjN+uySJv7UdTYsqqHccq/ErirxQluECZNnyP+JlXRrH9AGmLHS+QoqSw3g2
 ogIufwnadJv5iW8kZNCBYavq82bFnxnc1MrrOoF6Zw+FCLMUabqQQAN7TEnDy2ZhdUX5
 9duMSYphz6KXE/vknCe/+jnDb+jHnnAQknKIYY2tzQduZaDMA9zTiMVn9S/Zi/Q250hX
 32FZE1phRjEyTBvYZyMH1VJaN5+qVozc22/uOes9ujMQ/AUJuNKe6/3h2Ye+QFjO0XMK
 5by3Fw6j5z1ToLLNYnrhUld3FBQ+6IydZoDqtoMJggRltWUL3+RyRYOHUosgnpx5Kfdl
 NxQw==
X-Gm-Message-State: AOAM530dtUDQp94vYkDozXjFpKv+7SyzKiyprW9fWvcZ+xEz3spf0M5e
 BOn2PLjnSCi2Iz+nwWeXCaytUbG8HEl7u88KAch75KNz4CV2lKTFfmIUN3FVx3A/xac29fM4U5Z
 mauKV+w9vGexQTTE=
X-Received: by 2002:a05:6870:c59b:b0:f1:231c:c82c with SMTP id
 ba27-20020a056870c59b00b000f1231cc82cmr4173630oab.217.1652423379550; 
 Thu, 12 May 2022 23:29:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwYyXHPUGwhzUFe1Wp32Hx8lmG1PamEZ9SyB817wHwKYydI9iN/VC/LStU3fx2GoCwrNpaXzw==
X-Received: by 2002:a05:6870:c59b:b0:f1:231c:c82c with SMTP id
 ba27-20020a056870c59b00b000f1231cc82cmr4173619oab.217.1652423379347; 
 Thu, 12 May 2022 23:29:39 -0700 (PDT)
Received: from localhost.localdomain ([2804:431:c7f0:55e:b3e6:9ebe:4b75:fe72])
 by smtp.gmail.com with ESMTPSA id
 a14-20020a05680804ce00b00325cda1ffbasm678341oie.57.2022.05.12.23.29.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 23:29:38 -0700 (PDT)
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
Cc: Leonardo Bras <leobras@redhat.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Subject: [PATCH v13 8/8] multifd: Implement zero copy write in multifd
 migration (multifd-zero-copy)
Date: Fri, 13 May 2022 03:28:37 -0300
Message-Id: <20220513062836.965425-9-leobras@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220513062836.965425-1-leobras@redhat.com>
References: <20220513062836.965425-1-leobras@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Reviewed-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
 migration/multifd.h   |  2 ++
 migration/migration.c | 11 ++++++++++-
 migration/multifd.c   | 37 +++++++++++++++++++++++++++++++++++--
 migration/socket.c    |  5 +++--
 4 files changed, 50 insertions(+), 5 deletions(-)

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
index 2541cd2322..9282ab6aa4 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -569,6 +569,7 @@ void multifd_save_cleanup(void)
 int multifd_send_sync_main(QEMUFile *f)
 {
     int i;
+    bool flush_zero_copy;
 
     if (!migrate_use_multifd()) {
         return 0;
@@ -579,6 +580,20 @@ int multifd_send_sync_main(QEMUFile *f)
             return -1;
         }
     }
+
+    /*
+     * When using zero-copy, it's necessary to flush the pages before any of
+     * the pages can be sent again, so we'll make sure the new version of the
+     * pages will always arrive _later_ than the old pages.
+     *
+     * Currently we achieve this by flushing the zero-page requested writes
+     * per ram iteration, but in the future we could potentially optimize it
+     * to be less frequent, e.g. only after we finished one whole scanning of
+     * all the dirty bitmaps.
+     */
+
+    flush_zero_copy = migrate_use_zero_copy_send();
+
     for (i = 0; i < migrate_multifd_channels(); i++) {
         MultiFDSendParams *p = &multifd_send_state->params[i];
 
@@ -600,6 +615,17 @@ int multifd_send_sync_main(QEMUFile *f)
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
@@ -684,8 +710,8 @@ static void *multifd_send_thread(void *opaque)
                 p->iov[0].iov_base = p->packet;
             }
 
-            ret = qio_channel_writev_all(p->c, p->iov, p->iovs_num,
-                                         &local_err);
+            ret = qio_channel_writev_full_all(p->c, p->iov, p->iovs_num, NULL,
+                                              0, p->write_flags, &local_err);
             if (ret != 0) {
                 break;
             }
@@ -913,6 +939,13 @@ int multifd_save_setup(Error **errp)
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
2.36.1


