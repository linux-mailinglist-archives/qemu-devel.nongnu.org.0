Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50CF7553FCC
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 02:57:05 +0200 (CEST)
Received: from localhost ([::1]:56558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3og4-0003LK-DT
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 20:57:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1o3oCt-0004Bm-Kq
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 20:26:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1o3oCn-0006G5-Ti
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 20:26:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655857609;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c9pnYF28Ia3mYFtH/EZLUVD9A6oRUhaSNku4YZJ6x1g=;
 b=CbZXm77K/TqhOTUNdDRm5O5a4T6Cook0Jp2U6toPIdgb1BAEnFELe+gt41BDgI5hMK80DN
 jnPQtEQDV3ddBpcergrAkJ76LXS3ISPmzNFsZPX9TgjRV7GtAyM68LXKImubeE8JI/p1aD
 XKih/yU8ZDKVXyvaRHE9r3SqtzAiWC4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-617-IJfRjYaDOgS_obsei9In7w-1; Tue, 21 Jun 2022 20:26:46 -0400
X-MC-Unique: IJfRjYaDOgS_obsei9In7w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B81CA811E76;
 Wed, 22 Jun 2022 00:26:42 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DFA6D141510D;
 Wed, 22 Jun 2022 00:26:40 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Hailiang Zhang <zhanghailiang@xfusion.com>, Eric Blake <eblake@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Fam Zheng <fam@euphon.net>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-block@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Subject: [PULL 25/25] migration: remove the QEMUFileOps abstraction
Date: Wed, 22 Jun 2022 02:25:47 +0200
Message-Id: <20220622002547.64784-26-quintela@redhat.com>
In-Reply-To: <20220622002547.64784-1-quintela@redhat.com>
References: <20220622002547.64784-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

From: Daniel P. Berrangé <berrange@redhat.com>

Now that all QEMUFile callbacks are removed, the entire concept can be
deleted.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/qemu-file-channel.h | 32 ---------------------
 migration/qemu-file.h         |  7 ++---
 migration/channel.c           |  4 +--
 migration/colo.c              |  5 ++--
 migration/migration.c         |  7 ++---
 migration/qemu-file-channel.c | 53 -----------------------------------
 migration/qemu-file.c         | 20 ++++++-------
 migration/ram.c               |  3 +-
 migration/rdma.c              |  5 ++--
 migration/savevm.c            | 11 ++++----
 tests/unit/test-vmstate.c     |  5 ++--
 migration/meson.build         |  1 -
 12 files changed, 27 insertions(+), 126 deletions(-)
 delete mode 100644 migration/qemu-file-channel.h
 delete mode 100644 migration/qemu-file-channel.c

diff --git a/migration/qemu-file-channel.h b/migration/qemu-file-channel.h
deleted file mode 100644
index 0028a09eb6..0000000000
--- a/migration/qemu-file-channel.h
+++ /dev/null
@@ -1,32 +0,0 @@
-/*
- * QEMUFile backend for QIOChannel objects
- *
- * Copyright (c) 2015-2016 Red Hat, Inc
- *
- * Permission is hereby granted, free of charge, to any person obtaining a copy
- * of this software and associated documentation files (the "Software"), to deal
- * in the Software without restriction, including without limitation the rights
- * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
- * copies of the Software, and to permit persons to whom the Software is
- * furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
- * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
- * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
- * THE SOFTWARE.
- */
-
-#ifndef QEMU_FILE_CHANNEL_H
-#define QEMU_FILE_CHANNEL_H
-
-#include "io/channel.h"
-
-QEMUFile *qemu_fopen_channel_input(QIOChannel *ioc);
-QEMUFile *qemu_fopen_channel_output(QIOChannel *ioc);
-#endif
diff --git a/migration/qemu-file.h b/migration/qemu-file.h
index fe8f9766d1..96e72d8bd8 100644
--- a/migration/qemu-file.h
+++ b/migration/qemu-file.h
@@ -55,9 +55,6 @@ typedef size_t (QEMURamSaveFunc)(QEMUFile *f,
                                  size_t size,
                                  uint64_t *bytes_sent);
 
-typedef struct QEMUFileOps {
-} QEMUFileOps;
-
 typedef struct QEMUFileHooks {
     QEMURamHookFunc *before_ram_iterate;
     QEMURamHookFunc *after_ram_iterate;
@@ -65,8 +62,8 @@ typedef struct QEMUFileHooks {
     QEMURamSaveFunc *save_page;
 } QEMUFileHooks;
 
-QEMUFile *qemu_file_new_input(QIOChannel *ioc, const QEMUFileOps *ops);
-QEMUFile *qemu_file_new_output(QIOChannel *ioc, const QEMUFileOps *ops);
+QEMUFile *qemu_file_new_input(QIOChannel *ioc);
+QEMUFile *qemu_file_new_output(QIOChannel *ioc);
 void qemu_file_set_hooks(QEMUFile *f, const QEMUFileHooks *hooks);
 int qemu_fclose(QEMUFile *f);
 
diff --git a/migration/channel.c b/migration/channel.c
index a162d00fea..90087d8986 100644
--- a/migration/channel.c
+++ b/migration/channel.c
@@ -14,7 +14,7 @@
 #include "channel.h"
 #include "tls.h"
 #include "migration.h"
-#include "qemu-file-channel.h"
+#include "qemu-file.h"
 #include "trace.h"
 #include "qapi/error.h"
 #include "io/channel-tls.h"
@@ -85,7 +85,7 @@ void migration_channel_connect(MigrationState *s,
                 return;
             }
         } else {
-            QEMUFile *f = qemu_fopen_channel_output(ioc);
+            QEMUFile *f = qemu_file_new_output(ioc);
 
             migration_ioc_register_yank(ioc);
 
diff --git a/migration/colo.c b/migration/colo.c
index 5f7071b3cd..2b71722fd6 100644
--- a/migration/colo.c
+++ b/migration/colo.c
@@ -14,7 +14,6 @@
 #include "sysemu/sysemu.h"
 #include "qapi/error.h"
 #include "qapi/qapi-commands-migration.h"
-#include "qemu-file-channel.h"
 #include "migration.h"
 #include "qemu-file.h"
 #include "savevm.h"
@@ -559,7 +558,7 @@ static void colo_process_checkpoint(MigrationState *s)
         goto out;
     }
     bioc = qio_channel_buffer_new(COLO_BUFFER_BASE_SIZE);
-    fb = qemu_fopen_channel_output(QIO_CHANNEL(bioc));
+    fb = qemu_file_new_output(QIO_CHANNEL(bioc));
     object_unref(OBJECT(bioc));
 
     qemu_mutex_lock_iothread();
@@ -873,7 +872,7 @@ void *colo_process_incoming_thread(void *opaque)
     colo_incoming_start_dirty_log();
 
     bioc = qio_channel_buffer_new(COLO_BUFFER_BASE_SIZE);
-    fb = qemu_fopen_channel_input(QIO_CHANNEL(bioc));
+    fb = qemu_file_new_input(QIO_CHANNEL(bioc));
     object_unref(OBJECT(bioc));
 
     qemu_mutex_lock_iothread();
diff --git a/migration/migration.c b/migration/migration.c
index e07d9359c6..4aa8e0446b 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -30,7 +30,6 @@
 #include "migration/misc.h"
 #include "migration.h"
 #include "savevm.h"
-#include "qemu-file-channel.h"
 #include "qemu-file.h"
 #include "migration/vmstate.h"
 #include "block/block.h"
@@ -723,7 +722,7 @@ void migration_ioc_process_incoming(QIOChannel *ioc, Error **errp)
 
     if (!mis->from_src_file) {
         /* The first connection (multifd may have multiple) */
-        QEMUFile *f = qemu_fopen_channel_input(ioc);
+        QEMUFile *f = qemu_file_new_input(ioc);
 
         if (!migration_incoming_setup(f, errp)) {
             return;
@@ -3070,7 +3069,7 @@ static int postcopy_start(MigrationState *ms)
      */
     bioc = qio_channel_buffer_new(4096);
     qio_channel_set_name(QIO_CHANNEL(bioc), "migration-postcopy-buffer");
-    fb = qemu_fopen_channel_output(QIO_CHANNEL(bioc));
+    fb = qemu_file_new_output(QIO_CHANNEL(bioc));
     object_unref(OBJECT(bioc));
 
     /*
@@ -3960,7 +3959,7 @@ static void *bg_migration_thread(void *opaque)
      */
     s->bioc = qio_channel_buffer_new(512 * 1024);
     qio_channel_set_name(QIO_CHANNEL(s->bioc), "vmstate-buffer");
-    fb = qemu_fopen_channel_output(QIO_CHANNEL(s->bioc));
+    fb = qemu_file_new_output(QIO_CHANNEL(s->bioc));
     object_unref(OBJECT(s->bioc));
 
     update_iteration_initial_status(s);
diff --git a/migration/qemu-file-channel.c b/migration/qemu-file-channel.c
deleted file mode 100644
index 51717c1137..0000000000
--- a/migration/qemu-file-channel.c
+++ /dev/null
@@ -1,53 +0,0 @@
-/*
- * QEMUFile backend for QIOChannel objects
- *
- * Copyright (c) 2015-2016 Red Hat, Inc
- *
- * Permission is hereby granted, free of charge, to any person obtaining a copy
- * of this software and associated documentation files (the "Software"), to deal
- * in the Software without restriction, including without limitation the rights
- * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
- * copies of the Software, and to permit persons to whom the Software is
- * furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
- * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
- * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
- * THE SOFTWARE.
- */
-
-#include "qemu/osdep.h"
-#include "qemu-file-channel.h"
-#include "qemu-file.h"
-#include "io/channel-socket.h"
-#include "io/channel-tls.h"
-#include "qemu/iov.h"
-#include "qemu/yank.h"
-#include "yank_functions.h"
-
-
-static const QEMUFileOps channel_input_ops = {
-};
-
-
-static const QEMUFileOps channel_output_ops = {
-};
-
-
-QEMUFile *qemu_fopen_channel_input(QIOChannel *ioc)
-{
-    object_ref(OBJECT(ioc));
-    return qemu_file_new_input(ioc, &channel_input_ops);
-}
-
-QEMUFile *qemu_fopen_channel_output(QIOChannel *ioc)
-{
-    object_ref(OBJECT(ioc));
-    return qemu_file_new_output(ioc, &channel_output_ops);
-}
diff --git a/migration/qemu-file.c b/migration/qemu-file.c
index cea9a0de7d..3a380a6072 100644
--- a/migration/qemu-file.c
+++ b/migration/qemu-file.c
@@ -35,7 +35,6 @@
 #define MAX_IOV_SIZE MIN_CONST(IOV_MAX, 64)
 
 struct QEMUFile {
-    const QEMUFileOps *ops;
     const QEMUFileHooks *hooks;
     QIOChannel *ioc;
     bool is_writable;
@@ -107,16 +106,14 @@ bool qemu_file_mode_is_not_valid(const char *mode)
     return false;
 }
 
-static QEMUFile *qemu_file_new_impl(QIOChannel *ioc,
-                                    const QEMUFileOps *ops,
-                                    bool is_writable)
+static QEMUFile *qemu_file_new_impl(QIOChannel *ioc, bool is_writable)
 {
     QEMUFile *f;
 
     f = g_new0(QEMUFile, 1);
 
+    object_ref(ioc);
     f->ioc = ioc;
-    f->ops = ops;
     f->is_writable = is_writable;
 
     return f;
@@ -128,21 +125,19 @@ static QEMUFile *qemu_file_new_impl(QIOChannel *ioc,
  */
 QEMUFile *qemu_file_get_return_path(QEMUFile *f)
 {
-    object_ref(f->ioc);
-    return qemu_file_new_impl(f->ioc, f->ops, !f->is_writable);
+    return qemu_file_new_impl(f->ioc, !f->is_writable);
 }
 
-QEMUFile *qemu_file_new_output(QIOChannel *ioc, const QEMUFileOps *ops)
+QEMUFile *qemu_file_new_output(QIOChannel *ioc)
 {
-    return qemu_file_new_impl(ioc, ops, true);
+    return qemu_file_new_impl(ioc, true);
 }
 
-QEMUFile *qemu_file_new_input(QIOChannel *ioc, const QEMUFileOps *ops)
+QEMUFile *qemu_file_new_input(QIOChannel *ioc)
 {
-    return qemu_file_new_impl(ioc, ops, false);
+    return qemu_file_new_impl(ioc, false);
 }
 
-
 void qemu_file_set_hooks(QEMUFile *f, const QEMUFileHooks *hooks)
 {
     f->hooks = hooks;
@@ -238,6 +233,7 @@ static void qemu_iovec_release_ram(QEMUFile *f)
     memset(f->may_free, 0, sizeof(f->may_free));
 }
 
+
 /**
  * Flushes QEMUFile buffer
  *
diff --git a/migration/ram.c b/migration/ram.c
index bf321e1e72..01f9cc1d72 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -38,7 +38,6 @@
 #include "migration.h"
 #include "migration/register.h"
 #include "migration/misc.h"
-#include "migration/qemu-file-channel.h"
 #include "qemu-file.h"
 #include "postcopy-ram.h"
 #include "page_cache.h"
@@ -569,7 +568,7 @@ static int compress_threads_save_setup(void)
         /* comp_param[i].file is just used as a dummy buffer to save data,
          * set its ops to empty.
          */
-        comp_param[i].file = qemu_fopen_channel_output(
+        comp_param[i].file = qemu_file_new_output(
             QIO_CHANNEL(qio_channel_null_new()));
         comp_param[i].done = true;
         comp_param[i].quit = false;
diff --git a/migration/rdma.c b/migration/rdma.c
index 26a0cbbf40..94a55dd95b 100644
--- a/migration/rdma.c
+++ b/migration/rdma.c
@@ -21,7 +21,6 @@
 #include "migration.h"
 #include "qemu-file.h"
 #include "ram.h"
-#include "qemu-file-channel.h"
 #include "qemu/error-report.h"
 #include "qemu/main-loop.h"
 #include "qemu/module.h"
@@ -4052,12 +4051,12 @@ static QEMUFile *qemu_fopen_rdma(RDMAContext *rdma, const char *mode)
     rioc = QIO_CHANNEL_RDMA(object_new(TYPE_QIO_CHANNEL_RDMA));
 
     if (mode[0] == 'w') {
-        rioc->file = qemu_fopen_channel_output(QIO_CHANNEL(rioc));
+        rioc->file = qemu_file_new_output(QIO_CHANNEL(rioc));
         rioc->rdmaout = rdma;
         rioc->rdmain = rdma->return_path;
         qemu_file_set_hooks(rioc->file, &rdma_write_hooks);
     } else {
-        rioc->file = qemu_fopen_channel_input(QIO_CHANNEL(rioc));
+        rioc->file = qemu_file_new_input(QIO_CHANNEL(rioc));
         rioc->rdmain = rdma;
         rioc->rdmaout = rdma->return_path;
         qemu_file_set_hooks(rioc->file, &rdma_read_hooks);
diff --git a/migration/savevm.c b/migration/savevm.c
index 24a50376dc..e8a1b96fcd 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -37,7 +37,6 @@
 #include "migration/global_state.h"
 #include "migration/channel-block.h"
 #include "ram.h"
-#include "qemu-file-channel.h"
 #include "qemu-file.h"
 #include "savevm.h"
 #include "postcopy-ram.h"
@@ -134,9 +133,9 @@ static struct mig_cmd_args {
 static QEMUFile *qemu_fopen_bdrv(BlockDriverState *bs, int is_writable)
 {
     if (is_writable) {
-        return qemu_fopen_channel_output(QIO_CHANNEL(qio_channel_block_new(bs)));
+        return qemu_file_new_output(QIO_CHANNEL(qio_channel_block_new(bs)));
     } else {
-        return qemu_fopen_channel_input(QIO_CHANNEL(qio_channel_block_new(bs)));
+        return qemu_file_new_input(QIO_CHANNEL(qio_channel_block_new(bs)));
     }
 }
 
@@ -2159,7 +2158,7 @@ static int loadvm_handle_cmd_packaged(MigrationIncomingState *mis)
     bioc->usage += length;
     trace_loadvm_handle_cmd_packaged_received(ret);
 
-    QEMUFile *packf = qemu_fopen_channel_input(QIO_CHANNEL(bioc));
+    QEMUFile *packf = qemu_file_new_input(QIO_CHANNEL(bioc));
 
     ret = qemu_loadvm_state_main(packf, mis);
     trace_loadvm_handle_cmd_packaged_main(ret);
@@ -2917,7 +2916,7 @@ void qmp_xen_save_devices_state(const char *filename, bool has_live, bool live,
         goto the_end;
     }
     qio_channel_set_name(QIO_CHANNEL(ioc), "migration-xen-save-state");
-    f = qemu_fopen_channel_output(QIO_CHANNEL(ioc));
+    f = qemu_file_new_output(QIO_CHANNEL(ioc));
     object_unref(OBJECT(ioc));
     ret = qemu_save_device_state(f);
     if (ret < 0 || qemu_fclose(f) < 0) {
@@ -2964,7 +2963,7 @@ void qmp_xen_load_devices_state(const char *filename, Error **errp)
         return;
     }
     qio_channel_set_name(QIO_CHANNEL(ioc), "migration-xen-load-state");
-    f = qemu_fopen_channel_input(QIO_CHANNEL(ioc));
+    f = qemu_file_new_input(QIO_CHANNEL(ioc));
     object_unref(OBJECT(ioc));
 
     ret = qemu_loadvm_state(f);
diff --git a/tests/unit/test-vmstate.c b/tests/unit/test-vmstate.c
index 6a417bb102..72077b5780 100644
--- a/tests/unit/test-vmstate.c
+++ b/tests/unit/test-vmstate.c
@@ -28,7 +28,6 @@
 #include "migration/vmstate.h"
 #include "migration/qemu-file-types.h"
 #include "../migration/qemu-file.h"
-#include "../migration/qemu-file-channel.h"
 #include "../migration/savevm.h"
 #include "qemu/coroutine.h"
 #include "qemu/module.h"
@@ -52,9 +51,9 @@ static QEMUFile *open_test_file(bool write)
     }
     ioc = QIO_CHANNEL(qio_channel_file_new_fd(fd));
     if (write) {
-        f = qemu_fopen_channel_output(ioc);
+        f = qemu_file_new_output(ioc);
     } else {
-        f = qemu_fopen_channel_input(ioc);
+        f = qemu_file_new_input(ioc);
     }
     object_unref(OBJECT(ioc));
     return f;
diff --git a/migration/meson.build b/migration/meson.build
index 8d309f5849..690487cf1a 100644
--- a/migration/meson.build
+++ b/migration/meson.build
@@ -4,7 +4,6 @@ migration_files = files(
   'xbzrle.c',
   'vmstate-types.c',
   'vmstate.c',
-  'qemu-file-channel.c',
   'qemu-file.c',
   'yank_functions.c',
 )
-- 
2.35.3


