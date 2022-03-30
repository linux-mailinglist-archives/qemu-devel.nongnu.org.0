Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5432D4ECF24
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 23:52:40 +0200 (CEST)
Received: from localhost ([::1]:33402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZgF5-0004fC-DZ
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 17:52:39 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nZg2K-00060r-Ur
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:39:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nZg2J-0005GK-03
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:39:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648676366;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hE6sbGR3e5wSAPTOpUg7+HEoCjCHYy/m1agjPPHUXOU=;
 b=Pw33FRKQIkEL5m7lNyRsASBoVqPM49GybtDGek6EG3PzSgWcXl5Cwd8rWSbyYXmUBKlDCc
 jlbwraCCbsIBcag1ooiLUHdZ6l6cENZRu1yMQCgx1gmxPXQslirXqBaByjuEunJnTkeZlv
 W0yp7ujU982rB50cukwdVB88ILjiXiw=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-605-KXcWLX5JOxuhu4LtvGAeiw-1; Wed, 30 Mar 2022 17:39:25 -0400
X-MC-Unique: KXcWLX5JOxuhu4LtvGAeiw-1
Received: by mail-qt1-f199.google.com with SMTP id
 k1-20020ac85fc1000000b002e1c5930386so18445758qta.3
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 14:39:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hE6sbGR3e5wSAPTOpUg7+HEoCjCHYy/m1agjPPHUXOU=;
 b=je3fXkLeKr4TL8mquAm6XLk2ZiCW1Dh9XLBqZt/Bj0RRAEyr+rIjJQL2SztoXno/8s
 mepMh0Q4GnJ5rypJF/HalRc+aSBh5XSWt4x9UwoGLgZh9djkjDty6COQn6It4LGOQ5O9
 zmRMreHGdDWL/ZL3ppKoni4lDeCocBpxzOURPqzjfprmcex2owU+Z5MaMKI9bkun2oJK
 eLOxEVr6yTynoLdROs1o9kZwop0JAEfttSS8Qw/jzaemEB9LKu+AE5SYy5t1/vxHnejw
 /kMjI8kUBIfO7iNcH7UxjMmeDCxwE+7v7g2e48zLzyNFxynAiUad7bGYFlVZKAlaA9zJ
 JRfQ==
X-Gm-Message-State: AOAM532phEwGA4rV/T700jjd2s3IYsmJ76xSfOzsVEzXy6BTIgA8vnp5
 qaDmPcnYJM7rqqb5lc8sm2FJLuisuIKwtM7I4gkfOKrjRPgFyANvDFF8mUMLF3VzYB3n+TlWv9D
 C0UCsu/Dw6nd9Y/bzgnfjDL+8Xt4GJCC/CXUuaXuvWWG9qnraX3ImznHFDlRGwMK5
X-Received: by 2002:a05:6214:2a8d:b0:443:7f75:2aaf with SMTP id
 jr13-20020a0562142a8d00b004437f752aafmr1469407qvb.19.1648676364630; 
 Wed, 30 Mar 2022 14:39:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwxTe4xzdkw7w6eGf6PXKA8cfm+N/2klGp+4IOhi+Xds3hGpBZliBVmvLNqolztK6PtMXF9UA==
X-Received: by 2002:a05:6214:2a8d:b0:443:7f75:2aaf with SMTP id
 jr13-20020a0562142a8d00b004437f752aafmr1469382qvb.19.1648676364317; 
 Wed, 30 Mar 2022 14:39:24 -0700 (PDT)
Received: from localhost.localdomain
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 a23-20020a05620a16d700b0067e98304705sm11306313qkn.89.2022.03.30.14.39.23
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 30 Mar 2022 14:39:23 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 13/19] migration: Enable TLS for preempt channel
Date: Wed, 30 Mar 2022 17:39:02 -0400
Message-Id: <20220330213908.26608-14-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220330213908.26608-1-peterx@redhat.com>
References: <20220330213908.26608-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>, peterx@redhat.com,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch is based on the async preempt channel creation.  It continues
wiring up the new channel with TLS handshake to destionation when enabled.

Note that only the src QEMU needs such operation; the dest QEMU does not
need any change for TLS support due to the fact that all channels are
established synchronously there, so all the TLS magic is already properly
handled by migration_tls_channel_process_incoming().

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/postcopy-ram.c | 60 +++++++++++++++++++++++++++++++++++-----
 migration/trace-events   |  1 +
 2 files changed, 54 insertions(+), 7 deletions(-)

diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
index ab2a50cf45..f5ba176862 100644
--- a/migration/postcopy-ram.c
+++ b/migration/postcopy-ram.c
@@ -36,6 +36,7 @@
 #include "socket.h"
 #include "qemu-file-channel.h"
 #include "yank_functions.h"
+#include "tls.h"
 
 /* Arbitrary limit on size of each discard command,
  * keeps them around ~200 bytes
@@ -1552,15 +1553,15 @@ bool postcopy_preempt_new_channel(MigrationIncomingState *mis, QEMUFile *file)
     return true;
 }
 
+/*
+ * Setup the postcopy preempt channel with the IOC.  If ERROR is specified,
+ * setup the error instead.  This helper will free the ERROR if specified.
+ */
 static void
-postcopy_preempt_send_channel_new(QIOTask *task, gpointer opaque)
+postcopy_preempt_send_channel_done(MigrationState *s,
+                                   QIOChannel *ioc, Error *local_err)
 {
-    MigrationState *s = opaque;
-    QIOChannel *ioc = QIO_CHANNEL(qio_task_get_source(task));
-    Error *local_err = NULL;
-
-    if (qio_task_propagate_error(task, &local_err)) {
-        /* Something wrong happened.. */
+    if (local_err) {
         migrate_set_error(s, local_err);
         error_free(local_err);
     } else {
@@ -1574,6 +1575,51 @@ postcopy_preempt_send_channel_new(QIOTask *task, gpointer opaque)
      * postcopy_qemufile_src to know whether it failed or not.
      */
     qemu_sem_post(&s->postcopy_qemufile_src_sem);
+}
+
+static void
+postcopy_preempt_tls_handshake(QIOTask *task, gpointer opaque)
+{
+    MigrationState *s = opaque;
+    QIOChannel *ioc = QIO_CHANNEL(qio_task_get_source(task));
+    Error *err = NULL;
+
+    qio_task_propagate_error(task, &err);
+    postcopy_preempt_send_channel_done(s, ioc, err);
+    object_unref(OBJECT(ioc));
+}
+
+static void
+postcopy_preempt_send_channel_new(QIOTask *task, gpointer opaque)
+{
+    MigrationState *s = opaque;
+    QIOChannel *ioc = QIO_CHANNEL(qio_task_get_source(task));
+    QIOChannelTLS *tioc;
+    Error *local_err = NULL;
+
+    if (qio_task_propagate_error(task, &local_err)) {
+        assert(local_err);
+        goto out;
+    }
+
+    if (migrate_channel_requires_tls(ioc)) {
+        tioc = migration_tls_client_create(s, ioc, s->hostname, &local_err);
+        if (!tioc) {
+            assert(local_err);
+            goto out;
+        }
+        trace_postcopy_preempt_tls_handshake();
+        qio_channel_set_name(QIO_CHANNEL(tioc), "migration-tls-preempt");
+        qio_channel_tls_handshake(tioc, postcopy_preempt_tls_handshake,
+                                  s, NULL, NULL);
+        /* Setup the channel until TLS handshake finished */
+        object_unref(OBJECT(ioc));
+        return;
+    }
+
+out:
+    /* This handles both good and error cases */
+    postcopy_preempt_send_channel_done(s, ioc, local_err);
     object_unref(OBJECT(ioc));
 }
 
diff --git a/migration/trace-events b/migration/trace-events
index b21d5f371f..00ab2e1b96 100644
--- a/migration/trace-events
+++ b/migration/trace-events
@@ -287,6 +287,7 @@ postcopy_request_shared_page(const char *sharer, const char *rb, uint64_t rb_off
 postcopy_request_shared_page_present(const char *sharer, const char *rb, uint64_t rb_offset) "%s already %s offset 0x%"PRIx64
 postcopy_wake_shared(uint64_t client_addr, const char *rb) "at 0x%"PRIx64" in %s"
 postcopy_page_req_del(void *addr, int count) "resolved page req %p total %d"
+postcopy_preempt_tls_handshake(void) ""
 postcopy_preempt_new_channel(void) ""
 postcopy_preempt_thread_entry(void) ""
 postcopy_preempt_thread_exit(void) ""
-- 
2.32.0


