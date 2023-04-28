Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 879E36F1EAC
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 21:16:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psTWU-0004yT-MZ; Fri, 28 Apr 2023 15:12:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1psTWS-0004xb-9L
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 15:12:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1psTWP-00032J-Hk
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 15:12:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682709164;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j7m6xS6BNfkAE4RlJClxgal6tXUEhKbApJckK0teoSc=;
 b=FyEYVlKIYmhtIxd97f+6BP34z4S4YALAEqE0efhDEX5bGQUPxQ/Pep8t+x6wpaWLz9fse0
 CAQWUhLFVigaSaHRikUorm6JuS9WCrYBn/E3LSEXZTT5iF8RDGPsUstDT/8LfSeURVPr29
 gQx+S57NWra0amk1MIX8QZBdKI1mOCU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-656-d_t1sN5mP8ymEoMXhtQ9Cg-1; Fri, 28 Apr 2023 15:12:35 -0400
X-MC-Unique: d_t1sN5mP8ymEoMXhtQ9Cg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DBF9D8314E8;
 Fri, 28 Apr 2023 19:12:34 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.193.238])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6B4162166B4F;
 Fri, 28 Apr 2023 19:12:33 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Leonardo Bras <leobras@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>,
 Lukas Straub <lukasstraub2@web.de>
Subject: [PULL 17/21] ram.c: Move core compression code into its own file
Date: Fri, 28 Apr 2023 21:11:59 +0200
Message-Id: <20230428191203.39520-18-quintela@redhat.com>
In-Reply-To: <20230428191203.39520-1-quintela@redhat.com>
References: <20230428191203.39520-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Lukas Straub <lukasstraub2@web.de>

No functional changes intended.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/meson.build    |   5 +-
 migration/ram-compress.c | 274 +++++++++++++++++++++++++++++++++++++++
 migration/ram-compress.h |  65 ++++++++++
 migration/ram.c          | 262 +------------------------------------
 4 files changed, 344 insertions(+), 262 deletions(-)
 create mode 100644 migration/ram-compress.c
 create mode 100644 migration/ram-compress.h

diff --git a/migration/meson.build b/migration/meson.build
index da1897fadf..2090af8e85 100644
--- a/migration/meson.build
+++ b/migration/meson.build
@@ -38,4 +38,7 @@ endif
 softmmu_ss.add(when: zstd, if_true: files('multifd-zstd.c'))
 
 specific_ss.add(when: 'CONFIG_SOFTMMU',
-                if_true: files('dirtyrate.c', 'ram.c', 'target.c'))
+                if_true: files('dirtyrate.c',
+                               'ram.c',
+                               'ram-compress.c',
+                               'target.c'))
diff --git a/migration/ram-compress.c b/migration/ram-compress.c
new file mode 100644
index 0000000000..d9bc67d075
--- /dev/null
+++ b/migration/ram-compress.c
@@ -0,0 +1,274 @@
+/*
+ * QEMU System Emulator
+ *
+ * Copyright (c) 2003-2008 Fabrice Bellard
+ * Copyright (c) 2011-2015 Red Hat Inc
+ *
+ * Authors:
+ *  Juan Quintela <quintela@redhat.com>
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/cutils.h"
+
+#include "ram-compress.h"
+
+#include "qemu/error-report.h"
+#include "migration.h"
+#include "options.h"
+#include "io/channel-null.h"
+#include "exec/ram_addr.h"
+
+CompressionStats compression_counters;
+
+static CompressParam *comp_param;
+static QemuThread *compress_threads;
+/* comp_done_cond is used to wake up the migration thread when
+ * one of the compression threads has finished the compression.
+ * comp_done_lock is used to co-work with comp_done_cond.
+ */
+static QemuMutex comp_done_lock;
+static QemuCond comp_done_cond;
+
+static CompressResult do_compress_ram_page(QEMUFile *f, z_stream *stream,
+                                           RAMBlock *block, ram_addr_t offset,
+                                           uint8_t *source_buf);
+
+static void *do_data_compress(void *opaque)
+{
+    CompressParam *param = opaque;
+    RAMBlock *block;
+    ram_addr_t offset;
+    CompressResult result;
+
+    qemu_mutex_lock(&param->mutex);
+    while (!param->quit) {
+        if (param->trigger) {
+            block = param->block;
+            offset = param->offset;
+            param->trigger = false;
+            qemu_mutex_unlock(&param->mutex);
+
+            result = do_compress_ram_page(param->file, &param->stream,
+                                          block, offset, param->originbuf);
+
+            qemu_mutex_lock(&comp_done_lock);
+            param->done = true;
+            param->result = result;
+            qemu_cond_signal(&comp_done_cond);
+            qemu_mutex_unlock(&comp_done_lock);
+
+            qemu_mutex_lock(&param->mutex);
+        } else {
+            qemu_cond_wait(&param->cond, &param->mutex);
+        }
+    }
+    qemu_mutex_unlock(&param->mutex);
+
+    return NULL;
+}
+
+void compress_threads_save_cleanup(void)
+{
+    int i, thread_count;
+
+    if (!migrate_compress() || !comp_param) {
+        return;
+    }
+
+    thread_count = migrate_compress_threads();
+    for (i = 0; i < thread_count; i++) {
+        /*
+         * we use it as a indicator which shows if the thread is
+         * properly init'd or not
+         */
+        if (!comp_param[i].file) {
+            break;
+        }
+
+        qemu_mutex_lock(&comp_param[i].mutex);
+        comp_param[i].quit = true;
+        qemu_cond_signal(&comp_param[i].cond);
+        qemu_mutex_unlock(&comp_param[i].mutex);
+
+        qemu_thread_join(compress_threads + i);
+        qemu_mutex_destroy(&comp_param[i].mutex);
+        qemu_cond_destroy(&comp_param[i].cond);
+        deflateEnd(&comp_param[i].stream);
+        g_free(comp_param[i].originbuf);
+        qemu_fclose(comp_param[i].file);
+        comp_param[i].file = NULL;
+    }
+    qemu_mutex_destroy(&comp_done_lock);
+    qemu_cond_destroy(&comp_done_cond);
+    g_free(compress_threads);
+    g_free(comp_param);
+    compress_threads = NULL;
+    comp_param = NULL;
+}
+
+int compress_threads_save_setup(void)
+{
+    int i, thread_count;
+
+    if (!migrate_compress()) {
+        return 0;
+    }
+    thread_count = migrate_compress_threads();
+    compress_threads = g_new0(QemuThread, thread_count);
+    comp_param = g_new0(CompressParam, thread_count);
+    qemu_cond_init(&comp_done_cond);
+    qemu_mutex_init(&comp_done_lock);
+    for (i = 0; i < thread_count; i++) {
+        comp_param[i].originbuf = g_try_malloc(TARGET_PAGE_SIZE);
+        if (!comp_param[i].originbuf) {
+            goto exit;
+        }
+
+        if (deflateInit(&comp_param[i].stream,
+                        migrate_compress_level()) != Z_OK) {
+            g_free(comp_param[i].originbuf);
+            goto exit;
+        }
+
+        /* comp_param[i].file is just used as a dummy buffer to save data,
+         * set its ops to empty.
+         */
+        comp_param[i].file = qemu_file_new_output(
+            QIO_CHANNEL(qio_channel_null_new()));
+        comp_param[i].done = true;
+        comp_param[i].quit = false;
+        qemu_mutex_init(&comp_param[i].mutex);
+        qemu_cond_init(&comp_param[i].cond);
+        qemu_thread_create(compress_threads + i, "compress",
+                           do_data_compress, comp_param + i,
+                           QEMU_THREAD_JOINABLE);
+    }
+    return 0;
+
+exit:
+    compress_threads_save_cleanup();
+    return -1;
+}
+
+static CompressResult do_compress_ram_page(QEMUFile *f, z_stream *stream,
+                                           RAMBlock *block, ram_addr_t offset,
+                                           uint8_t *source_buf)
+{
+    uint8_t *p = block->host + offset;
+    int ret;
+
+    if (buffer_is_zero(p, TARGET_PAGE_SIZE)) {
+        return RES_ZEROPAGE;
+    }
+
+    /*
+     * copy it to a internal buffer to avoid it being modified by VM
+     * so that we can catch up the error during compression and
+     * decompression
+     */
+    memcpy(source_buf, p, TARGET_PAGE_SIZE);
+    ret = qemu_put_compression_data(f, stream, source_buf, TARGET_PAGE_SIZE);
+    if (ret < 0) {
+        qemu_file_set_error(migrate_get_current()->to_dst_file, ret);
+        error_report("compressed data failed!");
+        return RES_NONE;
+    }
+    return RES_COMPRESS;
+}
+
+static inline void compress_reset_result(CompressParam *param)
+{
+    param->result = RES_NONE;
+    param->block = NULL;
+    param->offset = 0;
+}
+
+void flush_compressed_data(int (send_queued_data(CompressParam *)))
+{
+    int idx, thread_count;
+
+    thread_count = migrate_compress_threads();
+
+    qemu_mutex_lock(&comp_done_lock);
+    for (idx = 0; idx < thread_count; idx++) {
+        while (!comp_param[idx].done) {
+            qemu_cond_wait(&comp_done_cond, &comp_done_lock);
+        }
+    }
+    qemu_mutex_unlock(&comp_done_lock);
+
+    for (idx = 0; idx < thread_count; idx++) {
+        qemu_mutex_lock(&comp_param[idx].mutex);
+        if (!comp_param[idx].quit) {
+            CompressParam *param = &comp_param[idx];
+            send_queued_data(param);
+            compress_reset_result(param);
+        }
+        qemu_mutex_unlock(&comp_param[idx].mutex);
+    }
+}
+
+static inline void set_compress_params(CompressParam *param, RAMBlock *block,
+                                       ram_addr_t offset)
+{
+    param->block = block;
+    param->offset = offset;
+    param->trigger = true;
+}
+
+int compress_page_with_multi_thread(RAMBlock *block, ram_addr_t offset,
+                                int (send_queued_data(CompressParam *)))
+{
+    int idx, thread_count, pages = -1;
+    bool wait = migrate_compress_wait_thread();
+
+    thread_count = migrate_compress_threads();
+    qemu_mutex_lock(&comp_done_lock);
+retry:
+    for (idx = 0; idx < thread_count; idx++) {
+        if (comp_param[idx].done) {
+            CompressParam *param = &comp_param[idx];
+            qemu_mutex_lock(&param->mutex);
+            param->done = false;
+            send_queued_data(param);
+            compress_reset_result(param);
+            set_compress_params(param, block, offset);
+
+            qemu_cond_signal(&param->cond);
+            qemu_mutex_unlock(&param->mutex);
+            pages = 1;
+            break;
+        }
+    }
+
+    /*
+     * wait for the free thread if the user specifies 'compress-wait-thread',
+     * otherwise we will post the page out in the main thread as normal page.
+     */
+    if (pages < 0 && wait) {
+        qemu_cond_wait(&comp_done_cond, &comp_done_lock);
+        goto retry;
+    }
+    qemu_mutex_unlock(&comp_done_lock);
+
+    return pages;
+}
diff --git a/migration/ram-compress.h b/migration/ram-compress.h
new file mode 100644
index 0000000000..06570a799c
--- /dev/null
+++ b/migration/ram-compress.h
@@ -0,0 +1,65 @@
+/*
+ * QEMU System Emulator
+ *
+ * Copyright (c) 2003-2008 Fabrice Bellard
+ * Copyright (c) 2011-2015 Red Hat Inc
+ *
+ * Authors:
+ *  Juan Quintela <quintela@redhat.com>
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+
+#ifndef QEMU_MIGRATION_COMPRESS_H
+#define QEMU_MIGRATION_COMPRESS_H
+
+#include "qemu-file.h"
+
+enum CompressResult {
+    RES_NONE = 0,
+    RES_ZEROPAGE = 1,
+    RES_COMPRESS = 2
+};
+typedef enum CompressResult CompressResult;
+
+struct CompressParam {
+    bool done;
+    bool quit;
+    bool trigger;
+    CompressResult result;
+    QEMUFile *file;
+    QemuMutex mutex;
+    QemuCond cond;
+    RAMBlock *block;
+    ram_addr_t offset;
+
+    /* internally used fields */
+    z_stream stream;
+    uint8_t *originbuf;
+};
+typedef struct CompressParam CompressParam;
+
+void compress_threads_save_cleanup(void);
+int compress_threads_save_setup(void);
+
+void flush_compressed_data(int (send_queued_data(CompressParam *)));
+int compress_page_with_multi_thread(RAMBlock *block, ram_addr_t offset,
+                                int (send_queued_data(CompressParam *)));
+
+#endif
diff --git a/migration/ram.c b/migration/ram.c
index 3671912b58..e4e50f5363 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -32,8 +32,8 @@
 #include "qemu/bitmap.h"
 #include "qemu/madvise.h"
 #include "qemu/main-loop.h"
-#include "io/channel-null.h"
 #include "xbzrle.h"
+#include "ram-compress.h"
 #include "ram.h"
 #include "migration.h"
 #include "migration-stats.h"
@@ -480,32 +480,6 @@ typedef struct MigrationOps MigrationOps;
 
 MigrationOps *migration_ops;
 
-CompressionStats compression_counters;
-
-enum CompressResult {
-    RES_NONE = 0,
-    RES_ZEROPAGE = 1,
-    RES_COMPRESS = 2
-};
-typedef enum CompressResult CompressResult;
-
-struct CompressParam {
-    bool done;
-    bool quit;
-    bool trigger;
-    CompressResult result;
-    QEMUFile *file;
-    QemuMutex mutex;
-    QemuCond cond;
-    RAMBlock *block;
-    ram_addr_t offset;
-
-    /* internally used fields */
-    z_stream stream;
-    uint8_t *originbuf;
-};
-typedef struct CompressParam CompressParam;
-
 struct DecompressParam {
     bool done;
     bool quit;
@@ -518,15 +492,6 @@ struct DecompressParam {
 };
 typedef struct DecompressParam DecompressParam;
 
-static CompressParam *comp_param;
-static QemuThread *compress_threads;
-/* comp_done_cond is used to wake up the migration thread when
- * one of the compression threads has finished the compression.
- * comp_done_lock is used to co-work with comp_done_cond.
- */
-static QemuMutex comp_done_lock;
-static QemuCond comp_done_cond;
-
 static QEMUFile *decomp_file;
 static DecompressParam *decomp_param;
 static QemuThread *decompress_threads;
@@ -535,10 +500,6 @@ static QemuCond decomp_done_cond;
 
 static int ram_save_host_page_urgent(PageSearchStatus *pss);
 
-static CompressResult do_compress_ram_page(QEMUFile *f, z_stream *stream,
-                                           RAMBlock *block, ram_addr_t offset,
-                                           uint8_t *source_buf);
-
 /* NOTE: page is the PFN not real ram_addr_t. */
 static void pss_init(PageSearchStatus *pss, RAMBlock *rb, ram_addr_t page)
 {
@@ -557,123 +518,6 @@ static bool pss_overlap(PageSearchStatus *pss1, PageSearchStatus *pss2)
         (pss1->host_page_start == pss2->host_page_start);
 }
 
-static void *do_data_compress(void *opaque)
-{
-    CompressParam *param = opaque;
-    RAMBlock *block;
-    ram_addr_t offset;
-    CompressResult result;
-
-    qemu_mutex_lock(&param->mutex);
-    while (!param->quit) {
-        if (param->trigger) {
-            block = param->block;
-            offset = param->offset;
-            param->trigger = false;
-            qemu_mutex_unlock(&param->mutex);
-
-            result = do_compress_ram_page(param->file, &param->stream,
-                                          block, offset, param->originbuf);
-
-            qemu_mutex_lock(&comp_done_lock);
-            param->done = true;
-            param->result = result;
-            qemu_cond_signal(&comp_done_cond);
-            qemu_mutex_unlock(&comp_done_lock);
-
-            qemu_mutex_lock(&param->mutex);
-        } else {
-            qemu_cond_wait(&param->cond, &param->mutex);
-        }
-    }
-    qemu_mutex_unlock(&param->mutex);
-
-    return NULL;
-}
-
-static void compress_threads_save_cleanup(void)
-{
-    int i, thread_count;
-
-    if (!migrate_compress() || !comp_param) {
-        return;
-    }
-
-    thread_count = migrate_compress_threads();
-    for (i = 0; i < thread_count; i++) {
-        /*
-         * we use it as a indicator which shows if the thread is
-         * properly init'd or not
-         */
-        if (!comp_param[i].file) {
-            break;
-        }
-
-        qemu_mutex_lock(&comp_param[i].mutex);
-        comp_param[i].quit = true;
-        qemu_cond_signal(&comp_param[i].cond);
-        qemu_mutex_unlock(&comp_param[i].mutex);
-
-        qemu_thread_join(compress_threads + i);
-        qemu_mutex_destroy(&comp_param[i].mutex);
-        qemu_cond_destroy(&comp_param[i].cond);
-        deflateEnd(&comp_param[i].stream);
-        g_free(comp_param[i].originbuf);
-        qemu_fclose(comp_param[i].file);
-        comp_param[i].file = NULL;
-    }
-    qemu_mutex_destroy(&comp_done_lock);
-    qemu_cond_destroy(&comp_done_cond);
-    g_free(compress_threads);
-    g_free(comp_param);
-    compress_threads = NULL;
-    comp_param = NULL;
-}
-
-static int compress_threads_save_setup(void)
-{
-    int i, thread_count;
-
-    if (!migrate_compress()) {
-        return 0;
-    }
-    thread_count = migrate_compress_threads();
-    compress_threads = g_new0(QemuThread, thread_count);
-    comp_param = g_new0(CompressParam, thread_count);
-    qemu_cond_init(&comp_done_cond);
-    qemu_mutex_init(&comp_done_lock);
-    for (i = 0; i < thread_count; i++) {
-        comp_param[i].originbuf = g_try_malloc(TARGET_PAGE_SIZE);
-        if (!comp_param[i].originbuf) {
-            goto exit;
-        }
-
-        if (deflateInit(&comp_param[i].stream,
-                        migrate_compress_level()) != Z_OK) {
-            g_free(comp_param[i].originbuf);
-            goto exit;
-        }
-
-        /* comp_param[i].file is just used as a dummy buffer to save data,
-         * set its ops to empty.
-         */
-        comp_param[i].file = qemu_file_new_output(
-            QIO_CHANNEL(qio_channel_null_new()));
-        comp_param[i].done = true;
-        comp_param[i].quit = false;
-        qemu_mutex_init(&comp_param[i].mutex);
-        qemu_cond_init(&comp_param[i].cond);
-        qemu_thread_create(compress_threads + i, "compress",
-                           do_data_compress, comp_param + i,
-                           QEMU_THREAD_JOINABLE);
-    }
-    return 0;
-
-exit:
-    compress_threads_save_cleanup();
-    return -1;
-}
-
 /**
  * save_page_header: write page header to wire
  *
@@ -1461,32 +1305,6 @@ static int ram_save_multifd_page(QEMUFile *file, RAMBlock *block,
     return 1;
 }
 
-static CompressResult do_compress_ram_page(QEMUFile *f, z_stream *stream,
-                                           RAMBlock *block, ram_addr_t offset,
-                                           uint8_t *source_buf)
-{
-    uint8_t *p = block->host + offset;
-    int ret;
-
-    if (buffer_is_zero(p, TARGET_PAGE_SIZE)) {
-        return RES_ZEROPAGE;
-    }
-
-    /*
-     * copy it to a internal buffer to avoid it being modified by VM
-     * so that we can catch up the error during compression and
-     * decompression
-     */
-    memcpy(source_buf, p, TARGET_PAGE_SIZE);
-    ret = qemu_put_compression_data(f, stream, source_buf, TARGET_PAGE_SIZE);
-    if (ret < 0) {
-        qemu_file_set_error(migrate_get_current()->to_dst_file, ret);
-        error_report("compressed data failed!");
-        return RES_NONE;
-    }
-    return RES_COMPRESS;
-}
-
 static void
 update_compress_thread_counts(const CompressParam *param, int bytes_xmit)
 {
@@ -1504,13 +1322,6 @@ update_compress_thread_counts(const CompressParam *param, int bytes_xmit)
 
 static bool save_page_use_compression(RAMState *rs);
 
-static inline void compress_reset_result(CompressParam *param)
-{
-    param->result = RES_NONE;
-    param->block = NULL;
-    param->offset = 0;
-}
-
 static int send_queued_data(CompressParam *param)
 {
     PageSearchStatus *pss = &ram_state->pss[RAM_CHANNEL_PRECOPY];
@@ -1545,31 +1356,6 @@ static int send_queued_data(CompressParam *param)
     return len;
 }
 
-static void flush_compressed_data(int (send_queued_data(CompressParam *)))
-{
-    int idx, thread_count;
-
-    thread_count = migrate_compress_threads();
-
-    qemu_mutex_lock(&comp_done_lock);
-    for (idx = 0; idx < thread_count; idx++) {
-        while (!comp_param[idx].done) {
-            qemu_cond_wait(&comp_done_cond, &comp_done_lock);
-        }
-    }
-    qemu_mutex_unlock(&comp_done_lock);
-
-    for (idx = 0; idx < thread_count; idx++) {
-        qemu_mutex_lock(&comp_param[idx].mutex);
-        if (!comp_param[idx].quit) {
-            CompressParam *param = &comp_param[idx];
-            send_queued_data(param);
-            compress_reset_result(param);
-        }
-        qemu_mutex_unlock(&comp_param[idx].mutex);
-    }
-}
-
 static void ram_flush_compressed_data(RAMState *rs)
 {
     if (!save_page_use_compression(rs)) {
@@ -1579,52 +1365,6 @@ static void ram_flush_compressed_data(RAMState *rs)
     flush_compressed_data(send_queued_data);
 }
 
-static inline void set_compress_params(CompressParam *param, RAMBlock *block,
-                                       ram_addr_t offset)
-{
-    param->block = block;
-    param->offset = offset;
-    param->trigger = true;
-}
-
-static int compress_page_with_multi_thread(RAMBlock *block, ram_addr_t offset,
-                                int (send_queued_data(CompressParam *)))
-{
-    int idx, thread_count, pages = -1;
-    bool wait = migrate_compress_wait_thread();
-
-    thread_count = migrate_compress_threads();
-    qemu_mutex_lock(&comp_done_lock);
-retry:
-    for (idx = 0; idx < thread_count; idx++) {
-        if (comp_param[idx].done) {
-            CompressParam *param = &comp_param[idx];
-            qemu_mutex_lock(&param->mutex);
-            param->done = false;
-            send_queued_data(param);
-            compress_reset_result(param);
-            set_compress_params(param, block, offset);
-
-            qemu_cond_signal(&param->cond);
-            qemu_mutex_unlock(&param->mutex);
-            pages = 1;
-            break;
-        }
-    }
-
-    /*
-     * wait for the free thread if the user specifies 'compress-wait-thread',
-     * otherwise we will post the page out in the main thread as normal page.
-     */
-    if (pages < 0 && wait) {
-        qemu_cond_wait(&comp_done_cond, &comp_done_lock);
-        goto retry;
-    }
-    qemu_mutex_unlock(&comp_done_lock);
-
-    return pages;
-}
-
 #define PAGE_ALL_CLEAN 0
 #define PAGE_TRY_AGAIN 1
 #define PAGE_DIRTY_FOUND 2
-- 
2.40.0


