Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3010B68CBAC
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 02:04:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPCKl-0001ur-He; Mon, 06 Feb 2023 19:59:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pPCKU-0001Mr-HL
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 19:59:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pPCKQ-0003za-O3
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 19:59:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675731562;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I8OjNtSNWyZgGwfsVEjlXafCsoXgcTJpHlHHk83LMZg=;
 b=fpdS8GV9wSYWr6S/pmkFkkDp3BKXFi5NVRXb44ukfATc9hNdUILLoTR2pTWybvdHKmBdV2
 EeBuFL37gxISzVfrzkr5KmO3thFD0jq/7AY03K/vLF4f4C7mvc1QfJS7KiVtEWd5gRgXjI
 ka2yaZF8DvaFFD9QcG9wwLU+Cj7LH+0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-256-CKm4hdPcNbyJttxoEQqPtA-1; Mon, 06 Feb 2023 19:59:19 -0500
X-MC-Unique: CKm4hdPcNbyJttxoEQqPtA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 57E4A1875041;
 Tue,  7 Feb 2023 00:59:18 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.29])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E79EC492C3C;
 Tue,  7 Feb 2023 00:59:12 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 John Snow <jsnow@redhat.com>, David Hildenbrand <david@redhat.com>,
 Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-s390x@nongnu.org, Christian Borntraeger <borntraeger@linux.ibm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Juan Quintela <quintela@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Coiby Xu <Coiby.Xu@gmail.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Eduardo Habkost <eduardo@habkost.net>, Yanan Wang <wangyanan55@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Eric Blake <eblake@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 "manish.mishra" <manish.mishra@nutanix.com>, Peter Xu <peterx@redhat.com>
Subject: [PULL 26/30] migration: check magic value for deciding the mapping of
 channels
Date: Tue,  7 Feb 2023 01:56:46 +0100
Message-Id: <20230207005650.1810-27-quintela@redhat.com>
In-Reply-To: <20230207005650.1810-1-quintela@redhat.com>
References: <20230207005650.1810-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: "manish.mishra" <manish.mishra@nutanix.com>

Current logic assumes that channel connections on the destination side are
always established in the same order as the source and the first one will
always be the main channel followed by the multifid or post-copy
preemption channel. This may not be always true, as even if a channel has a
connection established on the source side it can be in the pending state on
the destination side and a newer connection can be established first.
Basically causing out of order mapping of channels on the destination side.
Currently, all channels except post-copy preempt send a magic number, this
patch uses that magic number to decide the type of channel. This logic is
applicable only for precopy(multifd) live migration, as mentioned, the
post-copy preempt channel does not send any magic number. Also, tls live
migrations already does tls handshake before creating other channels, so
this issue is not possible with tls, hence this logic is avoided for tls
live migrations. This patch uses read peek to check the magic number of
channels so that current data/control stream management remains
un-effected.

Reviewed-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Daniel P. Berrange <berrange@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Suggested-by: Daniel P. Berrange <berrange@redhat.com>
Signed-off-by: manish.mishra <manish.mishra@nutanix.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/channel.h      |  5 ++++
 migration/multifd.h      |  2 +-
 migration/postcopy-ram.h |  2 +-
 migration/channel.c      | 45 +++++++++++++++++++++++++++++++++
 migration/migration.c    | 54 ++++++++++++++++++++++++++++------------
 migration/multifd.c      | 19 +++++++-------
 migration/postcopy-ram.c |  5 +---
 7 files changed, 101 insertions(+), 31 deletions(-)

diff --git a/migration/channel.h b/migration/channel.h
index 67a461c28a..5bdb8208a7 100644
--- a/migration/channel.h
+++ b/migration/channel.h
@@ -24,4 +24,9 @@ void migration_channel_connect(MigrationState *s,
                                QIOChannel *ioc,
                                const char *hostname,
                                Error *error_in);
+
+int migration_channel_read_peek(QIOChannel *ioc,
+                                const char *buf,
+                                const size_t buflen,
+                                Error **errp);
 #endif
diff --git a/migration/multifd.h b/migration/multifd.h
index e2802a9ce2..ff3aa2e2e9 100644
--- a/migration/multifd.h
+++ b/migration/multifd.h
@@ -18,7 +18,7 @@ void multifd_save_cleanup(void);
 int multifd_load_setup(Error **errp);
 int multifd_load_cleanup(Error **errp);
 bool multifd_recv_all_channels_created(void);
-bool multifd_recv_new_channel(QIOChannel *ioc, Error **errp);
+void multifd_recv_new_channel(QIOChannel *ioc, Error **errp);
 void multifd_recv_sync_main(void);
 int multifd_send_sync_main(QEMUFile *f);
 int multifd_queue_page(QEMUFile *f, RAMBlock *block, ram_addr_t offset);
diff --git a/migration/postcopy-ram.h b/migration/postcopy-ram.h
index 6147bf7d1d..25881c4127 100644
--- a/migration/postcopy-ram.h
+++ b/migration/postcopy-ram.h
@@ -190,7 +190,7 @@ enum PostcopyChannels {
     RAM_CHANNEL_MAX,
 };
 
-bool postcopy_preempt_new_channel(MigrationIncomingState *mis, QEMUFile *file);
+void postcopy_preempt_new_channel(MigrationIncomingState *mis, QEMUFile *file);
 int postcopy_preempt_setup(MigrationState *s, Error **errp);
 int postcopy_preempt_wait_channel(MigrationState *s);
 
diff --git a/migration/channel.c b/migration/channel.c
index 1b0815039f..ca3319a309 100644
--- a/migration/channel.c
+++ b/migration/channel.c
@@ -92,3 +92,48 @@ void migration_channel_connect(MigrationState *s,
     migrate_fd_connect(s, error);
     error_free(error);
 }
+
+
+/**
+ * @migration_channel_read_peek - Peek at migration channel, without
+ *     actually removing it from channel buffer.
+ *
+ * @ioc: the channel object
+ * @buf: the memory region to read data into
+ * @buflen: the number of bytes to read in @buf
+ * @errp: pointer to a NULL-initialized error object
+ *
+ * Returns 0 if successful, returns -1 and sets @errp if fails.
+ */
+int migration_channel_read_peek(QIOChannel *ioc,
+                                const char *buf,
+                                const size_t buflen,
+                                Error **errp)
+{
+    ssize_t len = 0;
+    struct iovec iov = { .iov_base = (char *)buf, .iov_len = buflen };
+
+    while (true) {
+        len = qio_channel_readv_full(ioc, &iov, 1, NULL, NULL,
+                                     QIO_CHANNEL_READ_FLAG_MSG_PEEK, errp);
+
+        if (len <= 0 && len != QIO_CHANNEL_ERR_BLOCK) {
+            error_setg(errp,
+                       "Failed to peek at channel");
+            return -1;
+        }
+
+        if (len == buflen) {
+            break;
+        }
+
+        /* 1ms sleep. */
+        if (qemu_in_coroutine()) {
+            qemu_co_sleep_ns(QEMU_CLOCK_REALTIME, 1000000);
+        } else {
+            g_usleep(1000);
+        }
+    }
+
+    return 0;
+}
diff --git a/migration/migration.c b/migration/migration.c
index 4f4d798d3e..66c74f8e17 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -31,6 +31,7 @@
 #include "migration.h"
 #include "savevm.h"
 #include "qemu-file.h"
+#include "channel.h"
 #include "migration/vmstate.h"
 #include "block/block.h"
 #include "qapi/error.h"
@@ -664,10 +665,6 @@ static bool migration_incoming_setup(QEMUFile *f, Error **errp)
 {
     MigrationIncomingState *mis = migration_incoming_get_current();
 
-    if (multifd_load_setup(errp) != 0) {
-        return false;
-    }
-
     if (!mis->from_src_file) {
         mis->from_src_file = f;
     }
@@ -734,31 +731,56 @@ void migration_ioc_process_incoming(QIOChannel *ioc, Error **errp)
 {
     MigrationIncomingState *mis = migration_incoming_get_current();
     Error *local_err = NULL;
-    bool start_migration;
     QEMUFile *f;
+    bool default_channel = true;
+    uint32_t channel_magic = 0;
+    int ret = 0;
 
-    if (!mis->from_src_file) {
-        /* The first connection (multifd may have multiple) */
+    if (migrate_use_multifd() && !migrate_postcopy_ram() &&
+        qio_channel_has_feature(ioc, QIO_CHANNEL_FEATURE_READ_MSG_PEEK)) {
+        /*
+         * With multiple channels, it is possible that we receive channels
+         * out of order on destination side, causing incorrect mapping of
+         * source channels on destination side. Check channel MAGIC to
+         * decide type of channel. Please note this is best effort, postcopy
+         * preempt channel does not send any magic number so avoid it for
+         * postcopy live migration. Also tls live migration already does
+         * tls handshake while initializing main channel so with tls this
+         * issue is not possible.
+         */
+        ret = migration_channel_read_peek(ioc, (void *)&channel_magic,
+                                          sizeof(channel_magic), &local_err);
+
+        if (ret != 0) {
+            error_propagate(errp, local_err);
+            return;
+        }
+
+        default_channel = (channel_magic == cpu_to_be32(QEMU_VM_FILE_MAGIC));
+    } else {
+        default_channel = !mis->from_src_file;
+    }
+
+    if (multifd_load_setup(errp) != 0) {
+        error_setg(errp, "Failed to setup multifd channels");
+        return;
+    }
+
+    if (default_channel) {
         f = qemu_file_new_input(ioc);
 
         if (!migration_incoming_setup(f, errp)) {
             return;
         }
-
-        /*
-         * Common migration only needs one channel, so we can start
-         * right now.  Some features need more than one channel, we wait.
-         */
-        start_migration = !migration_needs_multiple_sockets();
     } else {
         /* Multiple connections */
         assert(migration_needs_multiple_sockets());
         if (migrate_use_multifd()) {
-            start_migration = multifd_recv_new_channel(ioc, &local_err);
+            multifd_recv_new_channel(ioc, &local_err);
         } else {
             assert(migrate_postcopy_preempt());
             f = qemu_file_new_input(ioc);
-            start_migration = postcopy_preempt_new_channel(mis, f);
+            postcopy_preempt_new_channel(mis, f);
         }
         if (local_err) {
             error_propagate(errp, local_err);
@@ -766,7 +788,7 @@ void migration_ioc_process_incoming(QIOChannel *ioc, Error **errp)
         }
     }
 
-    if (start_migration) {
+    if (migration_has_all_channels()) {
         /* If it's a recovery, we're done */
         if (postcopy_try_recover()) {
             return;
diff --git a/migration/multifd.c b/migration/multifd.c
index 000ca4d4ec..eeb4fb87ee 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -1164,9 +1164,14 @@ int multifd_load_setup(Error **errp)
     uint32_t page_count = MULTIFD_PACKET_SIZE / qemu_target_page_size();
     uint8_t i;
 
-    if (!migrate_use_multifd()) {
+    /*
+     * Return successfully if multiFD recv state is already initialised
+     * or multiFD is not enabled.
+     */
+    if (multifd_recv_state || !migrate_use_multifd()) {
         return 0;
     }
+
     if (!migrate_multi_channels_is_allowed()) {
         error_setg(errp, "multifd is not supported by current protocol");
         return -1;
@@ -1227,11 +1232,9 @@ bool multifd_recv_all_channels_created(void)
 
 /*
  * Try to receive all multifd channels to get ready for the migration.
- * - Return true and do not set @errp when correctly receiving all channels;
- * - Return false and do not set @errp when correctly receiving the current one;
- * - Return false and set @errp when failing to receive the current channel.
+ * Sets @errp when failing to receive the current channel.
  */
-bool multifd_recv_new_channel(QIOChannel *ioc, Error **errp)
+void multifd_recv_new_channel(QIOChannel *ioc, Error **errp)
 {
     MultiFDRecvParams *p;
     Error *local_err = NULL;
@@ -1244,7 +1247,7 @@ bool multifd_recv_new_channel(QIOChannel *ioc, Error **errp)
                                 "failed to receive packet"
                                 " via multifd channel %d: ",
                                 qatomic_read(&multifd_recv_state->count));
-        return false;
+        return;
     }
     trace_multifd_recv_new_channel(id);
 
@@ -1254,7 +1257,7 @@ bool multifd_recv_new_channel(QIOChannel *ioc, Error **errp)
                    id);
         multifd_recv_terminate_threads(local_err);
         error_propagate(errp, local_err);
-        return false;
+        return;
     }
     p->c = ioc;
     object_ref(OBJECT(ioc));
@@ -1265,6 +1268,4 @@ bool multifd_recv_new_channel(QIOChannel *ioc, Error **errp)
     qemu_thread_create(&p->thread, p->name, multifd_recv_thread, p,
                        QEMU_THREAD_JOINABLE);
     qatomic_inc(&multifd_recv_state->count);
-    return qatomic_read(&multifd_recv_state->count) ==
-           migrate_multifd_channels();
 }
diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
index 0c55df0e52..b98e95dab0 100644
--- a/migration/postcopy-ram.c
+++ b/migration/postcopy-ram.c
@@ -1538,7 +1538,7 @@ void postcopy_unregister_shared_ufd(struct PostCopyFD *pcfd)
     }
 }
 
-bool postcopy_preempt_new_channel(MigrationIncomingState *mis, QEMUFile *file)
+void postcopy_preempt_new_channel(MigrationIncomingState *mis, QEMUFile *file)
 {
     /*
      * The new loading channel has its own threads, so it needs to be
@@ -1547,9 +1547,6 @@ bool postcopy_preempt_new_channel(MigrationIncomingState *mis, QEMUFile *file)
     qemu_file_set_blocking(file, true);
     mis->postcopy_qemufile_dst = file;
     trace_postcopy_preempt_new_channel();
-
-    /* Start the migration immediately */
-    return true;
 }
 
 /*
-- 
2.39.1


