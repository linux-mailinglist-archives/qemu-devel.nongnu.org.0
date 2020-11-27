Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B2452C61D0
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 10:36:09 +0100 (CET)
Received: from localhost ([::1]:40454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiaAi-0007J0-GB
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 04:36:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jinzeyu@huawei.com>)
 id 1kia6s-0002fE-Ba
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 04:32:10 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188]:2121)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jinzeyu@huawei.com>)
 id 1kia6p-0006mb-Bz
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 04:32:10 -0500
Received: from DGGEMM401-HUB.china.huawei.com (unknown [172.30.72.57])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Cj8XG0cmfz4yrh;
 Fri, 27 Nov 2020 17:31:42 +0800 (CST)
Received: from dggemi758-chm.china.huawei.com (10.1.198.144) by
 DGGEMM401-HUB.china.huawei.com (10.3.20.209) with Microsoft SMTP Server (TLS)
 id 14.3.487.0; Fri, 27 Nov 2020 17:32:03 +0800
Received: from localhost (10.174.187.211) by dggemi758-chm.china.huawei.com
 (10.1.198.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1913.5; Fri, 27
 Nov 2020 17:32:03 +0800
From: Zeyu Jin <jinzeyu@huawei.com>
To: <quintela@redhat.com>, <dgilbert@redhat.com>
Subject: [PATCH v2 3/6] migration: Add multi-thread compress ops
Date: Fri, 27 Nov 2020 17:32:02 +0800
Message-ID: <20201127093202.2607-1-jinzeyu@huawei.com>
X-Mailer: git-send-email 2.28.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.187.211]
X-ClientProxiedBy: dggemi702-chm.china.huawei.com (10.3.20.101) To
 dggemi758-chm.china.huawei.com (10.1.198.144)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188; envelope-from=jinzeyu@huawei.com;
 helo=szxga02-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org, Zeyu Jin <jinzeyu@huawei.com>,
 zhang.zhanghailiang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add the MigrationCompressOps and MigrationDecompressOps structures to make
the compression method configurable for multi-thread compression migration.

Signed-off-by: Zeyu Jin <jinzeyu@huawei.com>
Signed-off-by: Ying Fang <fangying1@huawei.com
---
 migration/migration.c |   9 ++
 migration/migration.h |   1 +
 migration/ram.c       | 273 +++++++++++++++++++++++++++++-------------
 3 files changed, 203 insertions(+), 80 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index bfbe48cc74..c11f137a8d 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -2356,6 +2356,15 @@ int migrate_decompress_threads(void)
     return s->parameters.decompress_threads;
 }
 
+CompressMethod migrate_compress_method(void)
+{
+    MigrationState *s;
+
+    s = migrate_get_current();
+
+    return s->parameters.compress_method;
+}
+
 bool migrate_dirty_bitmaps(void)
 {
     MigrationState *s;
diff --git a/migration/migration.h b/migration/migration.h
index d096b77f74..e22b2ef840 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -339,6 +339,7 @@ int migrate_compress_level(void);
 int migrate_compress_threads(void);
 int migrate_compress_wait_thread(void);
 int migrate_decompress_threads(void);
+CompressMethod migrate_compress_method(void);
 bool migrate_use_events(void);
 bool migrate_postcopy_blocktime(void);
 
diff --git a/migration/ram.c b/migration/ram.c
index 1818a56314..6f7fab7d4f 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -419,8 +419,11 @@ struct CompressParam {
     ram_addr_t offset;
 
     /* internally used fields */
-    z_stream stream;
     uint8_t *originbuf;
+
+    /* for zlib compression */
+    z_stream stream;
+
 };
 typedef struct CompressParam CompressParam;
 
@@ -432,12 +435,29 @@ struct DecompressParam {
     void *des;
     uint8_t *compbuf;
     int len;
+
+    /* for zlib compression */
     z_stream stream;
 };
 typedef struct DecompressParam DecompressParam;
 
+typedef struct {
+    int (*save_setup)(CompressParam *param);
+    void (*save_cleanup)(CompressParam *param);
+    ssize_t (*compress_data)(CompressParam *param, size_t size);
+} MigrationCompressOps;
+
+typedef struct {
+    int (*load_setup)(DecompressParam *param);
+    void (*load_cleanup)(DecompressParam *param);
+    int (*decompress_data)(DecompressParam *param, uint8_t *dest, size_t size);
+    int (*check_len)(int len);
+} MigrationDecompressOps;
+
 static CompressParam *comp_param;
 static QemuThread *compress_threads;
+static MigrationCompressOps *compress_ops;
+static MigrationDecompressOps *decompress_ops;
 /* comp_done_cond is used to wake up the migration thread when
  * one of the compression threads has finished the compression.
  * comp_done_lock is used to co-work with comp_done_cond.
@@ -455,6 +475,157 @@ static QemuCond decomp_done_cond;
 
 static bool do_compress_ram_page(CompressParam *param, RAMBlock *block);
 
+static int zlib_save_setup(CompressParam *param)
+{
+    if (deflateInit(&param->stream,
+                    migrate_compress_level()) != Z_OK) {
+        return -1;
+    }
+
+    return 0;
+}
+
+static ssize_t zlib_compress_data(CompressParam *param, size_t size)
+{
+    int err;
+    uint8_t *dest = NULL;
+    z_stream *stream = &param->stream;
+    uint8_t *p = param->originbuf;
+    QEMUFile *f = f = param->file;
+    ssize_t blen = qemu_put_compress_start(f, &dest);
+
+    if (blen < compressBound(size)) {
+        return -1;
+    }
+
+    err = deflateReset(stream);
+    if (err != Z_OK) {
+        return -1;
+    }
+
+    stream->avail_in = size;
+    stream->next_in = p;
+    stream->avail_out = blen;
+    stream->next_out = dest;
+
+    err = deflate(stream, Z_FINISH);
+    if (err != Z_STREAM_END) {
+        return -1;
+    }
+
+    blen = stream->next_out - dest;
+    if (blen < 0) {
+        return -1;
+    }
+
+    qemu_put_compress_end(f, blen);
+    return blen + sizeof(int32_t);
+}
+
+static void zlib_save_cleanup(CompressParam *param)
+{
+    deflateEnd(&param->stream);
+}
+
+static int zlib_load_setup(DecompressParam *param)
+{
+    if (inflateInit(&param->stream) != Z_OK) {
+        return -1;
+    }
+
+    return 0;
+}
+
+static int
+zlib_decompress_data(DecompressParam *param, uint8_t *dest, size_t size)
+{
+    int err;
+
+    z_stream *stream = &param->stream;
+
+    err = inflateReset(stream);
+    if (err != Z_OK) {
+        return -1;
+    }
+
+    stream->avail_in = param->len;
+    stream->next_in = param->compbuf;
+    stream->avail_out = size;
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
+static void zlib_load_cleanup(DecompressParam *param)
+{
+    inflateEnd(&param->stream);
+}
+
+static int zlib_check_len(int len)
+{
+    return len < 0 || len > compressBound(TARGET_PAGE_SIZE);
+}
+
+static int set_compress_ops(void)
+{
+   compress_ops = g_new0(MigrationCompressOps, 1);
+
+    switch (migrate_compress_method()) {
+    case COMPRESS_METHOD_ZLIB:
+        compress_ops->save_setup = zlib_save_setup;
+        compress_ops->save_cleanup = zlib_save_cleanup;
+        compress_ops->compress_data = zlib_compress_data;
+        break;
+    default:
+        return -1;
+    }
+
+    return 0;
+}
+
+static int set_decompress_ops(void)
+{
+   decompress_ops = g_new0(MigrationDecompressOps, 1);
+
+    switch (migrate_compress_method()) {
+    case COMPRESS_METHOD_ZLIB:
+        decompress_ops->load_setup = zlib_load_setup;
+        decompress_ops->load_cleanup = zlib_load_cleanup;
+        decompress_ops->decompress_data = zlib_decompress_data;
+        decompress_ops->check_len = zlib_check_len;
+        break;
+    default:
+        return -1;
+   }
+
+   return 0;
+}
+
+static void clean_compress_ops(void)
+{
+    compress_ops->save_setup = NULL;
+    compress_ops->save_cleanup = NULL;
+    compress_ops->compress_data = NULL;
+
+    g_free(compress_ops);
+    compress_ops = NULL;
+}
+
+static void clean_decompress_ops(void)
+{
+    decompress_ops->load_setup = NULL;
+    decompress_ops->load_cleanup = NULL;
+    decompress_ops->decompress_data = NULL;
+
+    g_free(decompress_ops);
+    decompress_ops = NULL;
+}
+
 static void *do_data_compress(void *opaque)
 {
     CompressParam *param = opaque;
@@ -511,7 +682,7 @@ static void compress_threads_save_cleanup(void)
         qemu_thread_join(compress_threads + i);
         qemu_mutex_destroy(&comp_param[i].mutex);
         qemu_cond_destroy(&comp_param[i].cond);
-        deflateEnd(&comp_param[i].stream);
+        compress_ops->save_cleanup(&comp_param[i]);
         g_free(comp_param[i].originbuf);
         qemu_fclose(comp_param[i].file);
         comp_param[i].file = NULL;
@@ -522,6 +693,7 @@ static void compress_threads_save_cleanup(void)
     g_free(comp_param);
     compress_threads = NULL;
     comp_param = NULL;
+    clean_compress_ops();
 }
 
 static int compress_threads_save_setup(void)
@@ -531,6 +703,12 @@ static int compress_threads_save_setup(void)
     if (!migrate_use_compression()) {
         return 0;
     }
+
+    if (set_compress_ops() < 0) {
+        clean_compress_ops();
+        return -1;
+    }
+
     thread_count = migrate_compress_threads();
     compress_threads = g_new0(QemuThread, thread_count);
     comp_param = g_new0(CompressParam, thread_count);
@@ -542,8 +720,7 @@ static int compress_threads_save_setup(void)
             goto exit;
         }
 
-        if (deflateInit(&comp_param[i].stream,
-                        migrate_compress_level()) != Z_OK) {
+        if (compress_ops->save_setup(&comp_param[i]) < 0) {
             g_free(comp_param[i].originbuf);
             goto exit;
         }
@@ -1209,50 +1386,6 @@ static int ram_save_multifd_page(RAMState *rs, RAMBlock *block,
     return 1;
 }
 
-/*
- * Compress size bytes of data start at p and store the compressed
- * data to the buffer of f.
- *
- * Since the file is dummy file with empty_ops, return -1 if f has no space to
- * save the compressed data.
- */
-static ssize_t qemu_put_compression_data(CompressParam *param, size_t size)
-{
-    int err;
-    uint8_t *dest = NULL;
-    z_stream *stream = &param->stream;
-    uint8_t *p = param->originbuf;
-    QEMUFile *f = f = param->file;
-    ssize_t blen = qemu_put_compress_start(f, &dest);
-
-    if (blen < compressBound(size)) {
-        return -1;
-    }
-
-    err = deflateReset(stream);
-    if (err != Z_OK) {
-        return -1;
-    }
-
-    stream->avail_in = size;
-    stream->next_in = p;
-    stream->avail_out = blen;
-    stream->next_out = dest;
-
-    err = deflate(stream, Z_FINISH);
-    if (err != Z_STREAM_END) {
-        return -1;
-    }
-
-    blen = stream->next_out - dest;
-    if (blen < 0) {
-        return -1;
-    }
-
-    qemu_put_compress_end(f, blen);
-    return blen + sizeof(int32_t);
-}
-
 static bool do_compress_ram_page(CompressParam *param, RAMBlock *block)
 {
     RAMState *rs = ram_state;
@@ -1275,7 +1408,7 @@ static bool do_compress_ram_page(CompressParam *param, RAMBlock *block)
      * decompression
      */
     memcpy(param->originbuf, p, TARGET_PAGE_SIZE);
-    ret = qemu_put_compression_data(param, TARGET_PAGE_SIZE);
+    ret = compress_ops->compress_data(param, TARGET_PAGE_SIZE);
     if (ret < 0) {
         qemu_file_set_error(migrate_get_current()->to_dst_file, ret);
         error_report("compressed data failed!");
@@ -2864,32 +2997,6 @@ void ram_handle_compressed(void *host, uint8_t ch, uint64_t size)
     }
 }
 
-/* return the size after decompression, or negative value on error */
-static int
-qemu_uncompress_data(DecompressParam *param, uint8_t *dest, size_t pagesize)
-{
-    int err;
-
-    z_stream *stream = &param->stream;
-
-    err = inflateReset(stream);
-    if (err != Z_OK) {
-        return -1;
-    }
-
-    stream->avail_in = param->len;
-    stream->next_in = param->compbuf;
-    stream->avail_out = pagesize;
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
 static void *do_data_decompress(void *opaque)
 {
     DecompressParam *param = opaque;
@@ -2903,7 +3010,7 @@ static void *do_data_decompress(void *opaque)
             param->des = 0;
             qemu_mutex_unlock(&param->mutex);
 
-            ret = qemu_uncompress_data(param, des, TARGET_PAGE_SIZE);
+            ret = decompress_ops->decompress_data(param, des, TARGET_PAGE_SIZE);
             if (ret < 0 && migrate_get_current()->decompress_error_check) {
                 error_report("decompress data failed");
                 qemu_file_set_error(decomp_file, ret);
@@ -2973,7 +3080,7 @@ static void compress_threads_load_cleanup(void)
         qemu_thread_join(decompress_threads + i);
         qemu_mutex_destroy(&decomp_param[i].mutex);
         qemu_cond_destroy(&decomp_param[i].cond);
-        inflateEnd(&decomp_param[i].stream);
+        decompress_ops->load_cleanup(&decomp_param[i]);
         g_free(decomp_param[i].compbuf);
         decomp_param[i].compbuf = NULL;
     }
@@ -2982,6 +3089,7 @@ static void compress_threads_load_cleanup(void)
     decompress_threads = NULL;
     decomp_param = NULL;
     decomp_file = NULL;
+    clean_decompress_ops();
 }
 
 static int compress_threads_load_setup(QEMUFile *f)
@@ -2992,6 +3100,11 @@ static int compress_threads_load_setup(QEMUFile *f)
         return 0;
     }
 
+    if (set_decompress_ops() < 0) {
+        clean_decompress_ops();
+        return -1;
+    }
+
     thread_count = migrate_decompress_threads();
     decompress_threads = g_new0(QemuThread, thread_count);
     decomp_param = g_new0(DecompressParam, thread_count);
@@ -2999,7 +3112,7 @@ static int compress_threads_load_setup(QEMUFile *f)
     qemu_cond_init(&decomp_done_cond);
     decomp_file = f;
     for (i = 0; i < thread_count; i++) {
-        if (inflateInit(&decomp_param[i].stream) != Z_OK) {
+        if (decompress_ops->load_setup(&decomp_param[i]) < 0) {
             goto exit;
         }
 
@@ -3335,7 +3448,7 @@ static int ram_load_postcopy(QEMUFile *f)
         case RAM_SAVE_FLAG_COMPRESS_PAGE:
             all_zero = false;
             len = qemu_get_be32(f);
-            if (len < 0 || len > compressBound(TARGET_PAGE_SIZE)) {
+            if (decompress_ops->check_len(len)) {
                 error_report("Invalid compressed data length: %d", len);
                 ret = -EINVAL;
                 break;
@@ -3602,7 +3715,7 @@ static int ram_load_precopy(QEMUFile *f)
 
         case RAM_SAVE_FLAG_COMPRESS_PAGE:
             len = qemu_get_be32(f);
-            if (len < 0 || len > compressBound(TARGET_PAGE_SIZE)) {
+            if (decompress_ops->check_len(len)) {
                 error_report("Invalid compressed data length: %d", len);
                 ret = -EINVAL;
                 break;
-- 
2.27.0


