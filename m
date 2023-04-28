Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D746F1EA1
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 21:14:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psTWQ-0004vX-Ag; Fri, 28 Apr 2023 15:12:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1psTWM-0004vB-C6
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 15:12:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1psTWJ-00031q-8f
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 15:12:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682709158;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Wc1FIyuUrIryObKfdag2h/gPhFR3Lnfz5vm7N2t/9ao=;
 b=MZfkWVfjX3VbBH7WkF07uCY0e3dJ2OKvZc1z6U1xx5T+e7tmqLFbnNm9mFCOUtFxCjmhev
 klH7YCHWvXScI42Z6yOp5ya2q9YEsDMDYqLInC4gfj8llg4dnrpbZ6782YmXlEiMuPQJEy
 V5mTVf4YAKLHFS1+DHQ5edDFfMLCNYk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-453-Gs0IEWpNOLS72NxShNMbCw-1; Fri, 28 Apr 2023 15:12:37 -0400
X-MC-Unique: Gs0IEWpNOLS72NxShNMbCw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D7F6E858F09;
 Fri, 28 Apr 2023 19:12:36 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.193.238])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3EA972166B4F;
 Fri, 28 Apr 2023 19:12:35 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Leonardo Bras <leobras@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>,
 Lukas Straub <lukasstraub2@web.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 18/21] ram.c: Move core decompression code into its own file
Date: Fri, 28 Apr 2023 21:12:00 +0200
Message-Id: <20230428191203.39520-19-quintela@redhat.com>
In-Reply-To: <20230428191203.39520-1-quintela@redhat.com>
References: <20230428191203.39520-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
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
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/ram-compress.c | 203 ++++++++++++++++++++++++++++++++++++++
 migration/ram-compress.h |   5 +
 migration/ram.c          | 204 ---------------------------------------
 3 files changed, 208 insertions(+), 204 deletions(-)

diff --git a/migration/ram-compress.c b/migration/ram-compress.c
index d9bc67d075..c25562f12d 100644
--- a/migration/ram-compress.c
+++ b/migration/ram-compress.c
@@ -48,6 +48,24 @@ static QemuThread *compress_threads;
 static QemuMutex comp_done_lock;
 static QemuCond comp_done_cond;
 
+struct DecompressParam {
+    bool done;
+    bool quit;
+    QemuMutex mutex;
+    QemuCond cond;
+    void *des;
+    uint8_t *compbuf;
+    int len;
+    z_stream stream;
+};
+typedef struct DecompressParam DecompressParam;
+
+static QEMUFile *decomp_file;
+static DecompressParam *decomp_param;
+static QemuThread *decompress_threads;
+static QemuMutex decomp_done_lock;
+static QemuCond decomp_done_cond;
+
 static CompressResult do_compress_ram_page(QEMUFile *f, z_stream *stream,
                                            RAMBlock *block, ram_addr_t offset,
                                            uint8_t *source_buf);
@@ -272,3 +290,188 @@ retry:
 
     return pages;
 }
+
+/* return the size after decompression, or negative value on error */
+static int
+qemu_uncompress_data(z_stream *stream, uint8_t *dest, size_t dest_len,
+                     const uint8_t *source, size_t source_len)
+{
+    int err;
+
+    err = inflateReset(stream);
+    if (err != Z_OK) {
+        return -1;
+    }
+
+    stream->avail_in = source_len;
+    stream->next_in = (uint8_t *)source;
+    stream->avail_out = dest_len;
+    stream->next_out = dest;
+
+    err = inflate(stream, Z_NO_FLUSH);
+    if (err != Z_STREAM_END) {
+        return -1;
+    }
+
+    return stream->total_out;
+}
+
+static void *do_data_decompress(void *opaque)
+{
+    DecompressParam *param = opaque;
+    unsigned long pagesize;
+    uint8_t *des;
+    int len, ret;
+
+    qemu_mutex_lock(&param->mutex);
+    while (!param->quit) {
+        if (param->des) {
+            des = param->des;
+            len = param->len;
+            param->des = 0;
+            qemu_mutex_unlock(&param->mutex);
+
+            pagesize = TARGET_PAGE_SIZE;
+
+            ret = qemu_uncompress_data(&param->stream, des, pagesize,
+                                       param->compbuf, len);
+            if (ret < 0 && migrate_get_current()->decompress_error_check) {
+                error_report("decompress data failed");
+                qemu_file_set_error(decomp_file, ret);
+            }
+
+            qemu_mutex_lock(&decomp_done_lock);
+            param->done = true;
+            qemu_cond_signal(&decomp_done_cond);
+            qemu_mutex_unlock(&decomp_done_lock);
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
+int wait_for_decompress_done(void)
+{
+    int idx, thread_count;
+
+    if (!migrate_compress()) {
+        return 0;
+    }
+
+    thread_count = migrate_decompress_threads();
+    qemu_mutex_lock(&decomp_done_lock);
+    for (idx = 0; idx < thread_count; idx++) {
+        while (!decomp_param[idx].done) {
+            qemu_cond_wait(&decomp_done_cond, &decomp_done_lock);
+        }
+    }
+    qemu_mutex_unlock(&decomp_done_lock);
+    return qemu_file_get_error(decomp_file);
+}
+
+void compress_threads_load_cleanup(void)
+{
+    int i, thread_count;
+
+    if (!migrate_compress()) {
+        return;
+    }
+    thread_count = migrate_decompress_threads();
+    for (i = 0; i < thread_count; i++) {
+        /*
+         * we use it as a indicator which shows if the thread is
+         * properly init'd or not
+         */
+        if (!decomp_param[i].compbuf) {
+            break;
+        }
+
+        qemu_mutex_lock(&decomp_param[i].mutex);
+        decomp_param[i].quit = true;
+        qemu_cond_signal(&decomp_param[i].cond);
+        qemu_mutex_unlock(&decomp_param[i].mutex);
+    }
+    for (i = 0; i < thread_count; i++) {
+        if (!decomp_param[i].compbuf) {
+            break;
+        }
+
+        qemu_thread_join(decompress_threads + i);
+        qemu_mutex_destroy(&decomp_param[i].mutex);
+        qemu_cond_destroy(&decomp_param[i].cond);
+        inflateEnd(&decomp_param[i].stream);
+        g_free(decomp_param[i].compbuf);
+        decomp_param[i].compbuf = NULL;
+    }
+    g_free(decompress_threads);
+    g_free(decomp_param);
+    decompress_threads = NULL;
+    decomp_param = NULL;
+    decomp_file = NULL;
+}
+
+int compress_threads_load_setup(QEMUFile *f)
+{
+    int i, thread_count;
+
+    if (!migrate_compress()) {
+        return 0;
+    }
+
+    thread_count = migrate_decompress_threads();
+    decompress_threads = g_new0(QemuThread, thread_count);
+    decomp_param = g_new0(DecompressParam, thread_count);
+    qemu_mutex_init(&decomp_done_lock);
+    qemu_cond_init(&decomp_done_cond);
+    decomp_file = f;
+    for (i = 0; i < thread_count; i++) {
+        if (inflateInit(&decomp_param[i].stream) != Z_OK) {
+            goto exit;
+        }
+
+        decomp_param[i].compbuf = g_malloc0(compressBound(TARGET_PAGE_SIZE));
+        qemu_mutex_init(&decomp_param[i].mutex);
+        qemu_cond_init(&decomp_param[i].cond);
+        decomp_param[i].done = true;
+        decomp_param[i].quit = false;
+        qemu_thread_create(decompress_threads + i, "decompress",
+                           do_data_decompress, decomp_param + i,
+                           QEMU_THREAD_JOINABLE);
+    }
+    return 0;
+exit:
+    compress_threads_load_cleanup();
+    return -1;
+}
+
+void decompress_data_with_multi_threads(QEMUFile *f, void *host, int len)
+{
+    int idx, thread_count;
+
+    thread_count = migrate_decompress_threads();
+    QEMU_LOCK_GUARD(&decomp_done_lock);
+    while (true) {
+        for (idx = 0; idx < thread_count; idx++) {
+            if (decomp_param[idx].done) {
+                decomp_param[idx].done = false;
+                qemu_mutex_lock(&decomp_param[idx].mutex);
+                qemu_get_buffer(f, decomp_param[idx].compbuf, len);
+                decomp_param[idx].des = host;
+                decomp_param[idx].len = len;
+                qemu_cond_signal(&decomp_param[idx].cond);
+                qemu_mutex_unlock(&decomp_param[idx].mutex);
+                break;
+            }
+        }
+        if (idx < thread_count) {
+            break;
+        } else {
+            qemu_cond_wait(&decomp_done_cond, &decomp_done_lock);
+        }
+    }
+}
diff --git a/migration/ram-compress.h b/migration/ram-compress.h
index 06570a799c..6f7fe2f472 100644
--- a/migration/ram-compress.h
+++ b/migration/ram-compress.h
@@ -62,4 +62,9 @@ void flush_compressed_data(int (send_queued_data(CompressParam *)));
 int compress_page_with_multi_thread(RAMBlock *block, ram_addr_t offset,
                                 int (send_queued_data(CompressParam *)));
 
+int wait_for_decompress_done(void);
+void compress_threads_load_cleanup(void);
+int compress_threads_load_setup(QEMUFile *f);
+void decompress_data_with_multi_threads(QEMUFile *f, void *host, int len);
+
 #endif
diff --git a/migration/ram.c b/migration/ram.c
index e4e50f5363..250cb01099 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -480,24 +480,6 @@ typedef struct MigrationOps MigrationOps;
 
 MigrationOps *migration_ops;
 
-struct DecompressParam {
-    bool done;
-    bool quit;
-    QemuMutex mutex;
-    QemuCond cond;
-    void *des;
-    uint8_t *compbuf;
-    int len;
-    z_stream stream;
-};
-typedef struct DecompressParam DecompressParam;
-
-static QEMUFile *decomp_file;
-static DecompressParam *decomp_param;
-static QemuThread *decompress_threads;
-static QemuMutex decomp_done_lock;
-static QemuCond decomp_done_cond;
-
 static int ram_save_host_page_urgent(PageSearchStatus *pss);
 
 /* NOTE: page is the PFN not real ram_addr_t. */
@@ -3465,192 +3447,6 @@ void ram_handle_compressed(void *host, uint8_t ch, uint64_t size)
     }
 }
 
-/* return the size after decompression, or negative value on error */
-static int
-qemu_uncompress_data(z_stream *stream, uint8_t *dest, size_t dest_len,
-                     const uint8_t *source, size_t source_len)
-{
-    int err;
-
-    err = inflateReset(stream);
-    if (err != Z_OK) {
-        return -1;
-    }
-
-    stream->avail_in = source_len;
-    stream->next_in = (uint8_t *)source;
-    stream->avail_out = dest_len;
-    stream->next_out = dest;
-
-    err = inflate(stream, Z_NO_FLUSH);
-    if (err != Z_STREAM_END) {
-        return -1;
-    }
-
-    return stream->total_out;
-}
-
-static void *do_data_decompress(void *opaque)
-{
-    DecompressParam *param = opaque;
-    unsigned long pagesize;
-    uint8_t *des;
-    int len, ret;
-
-    qemu_mutex_lock(&param->mutex);
-    while (!param->quit) {
-        if (param->des) {
-            des = param->des;
-            len = param->len;
-            param->des = 0;
-            qemu_mutex_unlock(&param->mutex);
-
-            pagesize = TARGET_PAGE_SIZE;
-
-            ret = qemu_uncompress_data(&param->stream, des, pagesize,
-                                       param->compbuf, len);
-            if (ret < 0 && migrate_get_current()->decompress_error_check) {
-                error_report("decompress data failed");
-                qemu_file_set_error(decomp_file, ret);
-            }
-
-            qemu_mutex_lock(&decomp_done_lock);
-            param->done = true;
-            qemu_cond_signal(&decomp_done_cond);
-            qemu_mutex_unlock(&decomp_done_lock);
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
-static int wait_for_decompress_done(void)
-{
-    int idx, thread_count;
-
-    if (!migrate_compress()) {
-        return 0;
-    }
-
-    thread_count = migrate_decompress_threads();
-    qemu_mutex_lock(&decomp_done_lock);
-    for (idx = 0; idx < thread_count; idx++) {
-        while (!decomp_param[idx].done) {
-            qemu_cond_wait(&decomp_done_cond, &decomp_done_lock);
-        }
-    }
-    qemu_mutex_unlock(&decomp_done_lock);
-    return qemu_file_get_error(decomp_file);
-}
-
-static void compress_threads_load_cleanup(void)
-{
-    int i, thread_count;
-
-    if (!migrate_compress()) {
-        return;
-    }
-    thread_count = migrate_decompress_threads();
-    for (i = 0; i < thread_count; i++) {
-        /*
-         * we use it as a indicator which shows if the thread is
-         * properly init'd or not
-         */
-        if (!decomp_param[i].compbuf) {
-            break;
-        }
-
-        qemu_mutex_lock(&decomp_param[i].mutex);
-        decomp_param[i].quit = true;
-        qemu_cond_signal(&decomp_param[i].cond);
-        qemu_mutex_unlock(&decomp_param[i].mutex);
-    }
-    for (i = 0; i < thread_count; i++) {
-        if (!decomp_param[i].compbuf) {
-            break;
-        }
-
-        qemu_thread_join(decompress_threads + i);
-        qemu_mutex_destroy(&decomp_param[i].mutex);
-        qemu_cond_destroy(&decomp_param[i].cond);
-        inflateEnd(&decomp_param[i].stream);
-        g_free(decomp_param[i].compbuf);
-        decomp_param[i].compbuf = NULL;
-    }
-    g_free(decompress_threads);
-    g_free(decomp_param);
-    decompress_threads = NULL;
-    decomp_param = NULL;
-    decomp_file = NULL;
-}
-
-static int compress_threads_load_setup(QEMUFile *f)
-{
-    int i, thread_count;
-
-    if (!migrate_compress()) {
-        return 0;
-    }
-
-    thread_count = migrate_decompress_threads();
-    decompress_threads = g_new0(QemuThread, thread_count);
-    decomp_param = g_new0(DecompressParam, thread_count);
-    qemu_mutex_init(&decomp_done_lock);
-    qemu_cond_init(&decomp_done_cond);
-    decomp_file = f;
-    for (i = 0; i < thread_count; i++) {
-        if (inflateInit(&decomp_param[i].stream) != Z_OK) {
-            goto exit;
-        }
-
-        decomp_param[i].compbuf = g_malloc0(compressBound(TARGET_PAGE_SIZE));
-        qemu_mutex_init(&decomp_param[i].mutex);
-        qemu_cond_init(&decomp_param[i].cond);
-        decomp_param[i].done = true;
-        decomp_param[i].quit = false;
-        qemu_thread_create(decompress_threads + i, "decompress",
-                           do_data_decompress, decomp_param + i,
-                           QEMU_THREAD_JOINABLE);
-    }
-    return 0;
-exit:
-    compress_threads_load_cleanup();
-    return -1;
-}
-
-static void decompress_data_with_multi_threads(QEMUFile *f,
-                                               void *host, int len)
-{
-    int idx, thread_count;
-
-    thread_count = migrate_decompress_threads();
-    QEMU_LOCK_GUARD(&decomp_done_lock);
-    while (true) {
-        for (idx = 0; idx < thread_count; idx++) {
-            if (decomp_param[idx].done) {
-                decomp_param[idx].done = false;
-                qemu_mutex_lock(&decomp_param[idx].mutex);
-                qemu_get_buffer(f, decomp_param[idx].compbuf, len);
-                decomp_param[idx].des = host;
-                decomp_param[idx].len = len;
-                qemu_cond_signal(&decomp_param[idx].cond);
-                qemu_mutex_unlock(&decomp_param[idx].mutex);
-                break;
-            }
-        }
-        if (idx < thread_count) {
-            break;
-        } else {
-            qemu_cond_wait(&decomp_done_cond, &decomp_done_lock);
-        }
-    }
-}
-
 static void colo_init_ram_state(void)
 {
     ram_state_init(&ram_state);
-- 
2.40.0


