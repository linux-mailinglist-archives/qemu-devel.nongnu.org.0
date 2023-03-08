Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 561E06B0AE0
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 15:19:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZuc1-0000bR-IT; Wed, 08 Mar 2023 09:17:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dennis.wu@intel.com>)
 id 1pZiBY-0000av-BR
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:01:40 -0500
Received: from mga07.intel.com ([134.134.136.100])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dennis.wu@intel.com>)
 id 1pZiBQ-0008SN-3N
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:01:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678237292; x=1709773292;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2deT8Ewd+YI0qScvv9XmyjeFpY6lSd572CNa4nCL514=;
 b=MbJBwBpgEeZLWyZUm4RDYYpZYgHhiAForTzjjcwulfYJ8MPkHxp639aD
 RC8cyoDP82ZAa5LTxizYFucl6HdIqFW0l2rYlsXGt/vS43FR3Zi3+RwJv
 xNKkcB62XqVm3k0pdds/v9E9hYa3/aVyMisjh9ZrUhK3HRUfbXmEwujnI
 RUnRt37gbqZuAk0+0tqYS8dvHX+KgrO54GAQiWH2ycEN/oWp54bnRTRsc
 NJHJ1XniSkKlZo4NLpK06cJWkvoxdbnbTLuQMSglnt9MmHx6+ZG0/r+Td
 1mcW1O7aX8gQCPrrQSX6kCtR03hddpgMoWll9c2MITGTpSg+inMly4lM2 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="400845514"
X-IronPort-AV: E=Sophos;i="5.98,242,1673942400"; d="scan'208";a="400845514"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 17:01:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="654165068"
X-IronPort-AV: E=Sophos;i="5.98,242,1673942400"; d="scan'208";a="654165068"
Received: from spr-inspur-17-os.sh.intel.com ([10.67.124.219])
 by orsmga006.jf.intel.com with ESMTP; 07 Mar 2023 17:01:07 -0800
From: "dennis.wu" <dennis.wu@intel.com>
To: qemu-devel@nongnu.org
Cc: "dennis.wu" <dennis.wu@intel.com>
Subject: [PATCH] use qatzip to acclerate the live migration
Date: Wed,  8 Mar 2023 08:59:30 +0800
Message-Id: <20230308005930.237169-1-dennis.wu@intel.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.100; envelope-from=dennis.wu@intel.com;
 helo=mga07.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 08 Mar 2023 09:16:58 -0500
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

qatzip https://github.com/intel/QATzip is a project that
supply the zlib like api with the Intel QAT hardware.
compress and decompress performance with small data block
(4kb page) is low with qatzip API. so we compose multiple
pages into a multi page address structure which is a buffer
list, then we compose these pages together and then call
compress and decompress. we also expand the io_buf_size
since qat is fast have have stress to the IO_BUFF.

If there is no QAT hardware, qatzip will fall back to the
software with proper congfiguration. that mean if host server
have the QAT hardware, while destination server don't have QAT,
the live migration still work well.

To use the qatzip, one parameter is added in both host and
destination side:
(qemu) migrate_set_parameter compress-with-qat 1
if you proper eabled the qatzip, then you can benefit from
the QAT accelleration.

Since the compress/decompress offloading to the QAT hardware,
no CPU resource neede (only a periodomic polling need some CPU
resource).

From the performance, with the same threads scale, with QATzip
(HW), the live migration will have 2~4 time of performance.

plan: so far qatzip API support SVM，but no batch APIs and the
requirement is raised. once the batch APIs ready, the perf expect
to reach close to 10x.

Signed-off-by: dennis.wu <dennis.wu@intel.com>

update
---
 meson.build           |   3 +-
 migration/migration.c |  22 ++
 migration/migration.h |   1 +
 migration/qemu-file.c |  13 +-
 migration/qemu-file.h |   3 +
 migration/ram.c       | 771 ++++++++++++++++++++++++++++++++++--------
 monitor/hmp-cmds.c    |   4 +
 qapi/migration.json   |   8 +-
 8 files changed, 687 insertions(+), 138 deletions(-)

diff --git a/meson.build b/meson.build
index 861de93c4f..2c8ecba936 100644
--- a/meson.build
+++ b/meson.build
@@ -464,6 +464,7 @@ if have_system or have_tools
                       method: 'pkg-config', kwargs: static_kwargs)
 endif
 zlib = dependency('zlib', required: true, kwargs: static_kwargs)
+qatzip = dependency('qatzip', required: true, method: 'pkg-config', kwargs: static_kwargs)
 
 libaio = not_found
 if not get_option('linux_aio').auto() or have_block
@@ -3058,7 +3059,7 @@ libmigration = static_library('migration', sources: migration_files + genh,
                               name_suffix: 'fa',
                               build_by_default: false)
 migration = declare_dependency(link_with: libmigration,
-                               dependencies: [zlib, qom, io])
+                               dependencies: [qatzip, zlib, qom, io])
 softmmu_ss.add(migration)
 
 block_ss = block_ss.apply(config_host, strict: false)
diff --git a/migration/migration.c b/migration/migration.c
index 695f0f2900..4a5c5c532e 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -864,6 +864,8 @@ MigrationParameters *qmp_query_migrate_parameters(Error **errp)
     params->compress_level = s->parameters.compress_level;
     params->has_compress_threads = true;
     params->compress_threads = s->parameters.compress_threads;
+    params->has_compress_with_qat = true;
+    params->compress_with_qat = s->parameters.compress_with_qat;
     params->has_compress_wait_thread = true;
     params->compress_wait_thread = s->parameters.compress_wait_thread;
     params->has_decompress_threads = true;
@@ -1500,6 +1502,10 @@ static void migrate_params_test_apply(MigrateSetParameters *params,
         dest->compress_threads = params->compress_threads;
     }
 
+    if (params->has_compress_with_qat) {
+        dest->compress_with_qat = params->compress_with_qat;
+    }
+
     if (params->has_compress_wait_thread) {
         dest->compress_wait_thread = params->compress_wait_thread;
     }
@@ -1597,6 +1603,10 @@ static void migrate_params_apply(MigrateSetParameters *params, Error **errp)
         s->parameters.compress_threads = params->compress_threads;
     }
 
+    if (params->has_compress_with_qat) {
+        s->parameters.compress_with_qat = params->compress_with_qat;
+    }
+
     if (params->has_compress_wait_thread) {
         s->parameters.compress_wait_thread = params->compress_wait_thread;
     }
@@ -2421,6 +2431,15 @@ bool migrate_postcopy_blocktime(void)
     return s->enabled_capabilities[MIGRATION_CAPABILITY_POSTCOPY_BLOCKTIME];
 }
 
+bool migrate_compress_with_qat(void)
+{
+    MigrationState *s;
+
+    s = migrate_get_current();
+
+    return s->parameters.compress_with_qat;
+}
+
 bool migrate_use_compression(void)
 {
     MigrationState *s;
@@ -4164,6 +4183,8 @@ static Property migration_properties[] = {
     DEFINE_PROP_UINT8("x-compress-threads", MigrationState,
                       parameters.compress_threads,
                       DEFAULT_MIGRATE_COMPRESS_THREAD_COUNT),
+    DEFINE_PROP_BOOL("x-compress-with-qat", MigrationState,
+                      parameters.compress_with_qat, false),
     DEFINE_PROP_BOOL("x-compress-wait-thread", MigrationState,
                       parameters.compress_wait_thread, true),
     DEFINE_PROP_UINT8("x-decompress-threads", MigrationState,
@@ -4284,6 +4305,7 @@ static void migration_instance_init(Object *obj)
     /* Set has_* up only for parameter checks */
     params->has_compress_level = true;
     params->has_compress_threads = true;
+    params->has_compress_with_qat = true;
     params->has_decompress_threads = true;
     params->has_throttle_trigger_threshold = true;
     params->has_cpu_throttle_initial = true;
diff --git a/migration/migration.h b/migration/migration.h
index 2de861df01..ade5506eee 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -388,6 +388,7 @@ bool migrate_use_return_path(void);
 uint64_t ram_get_total_transferred_pages(void);
 
 bool migrate_use_compression(void);
+bool migrate_compress_with_qat(void);
 int migrate_compress_level(void);
 int migrate_compress_threads(void);
 int migrate_compress_wait_thread(void);
diff --git a/migration/qemu-file.c b/migration/qemu-file.c
index 1479cddad9..fd6adf04b4 100644
--- a/migration/qemu-file.c
+++ b/migration/qemu-file.c
@@ -22,6 +22,7 @@
  * THE SOFTWARE.
  */
 #include "qemu/osdep.h"
+#include <qatzip.h>
 #include <zlib.h>
 #include "qemu/madvise.h"
 #include "qemu/error-report.h"
@@ -31,7 +32,8 @@
 #include "trace.h"
 #include "qapi/error.h"
 
-#define IO_BUF_SIZE 32768
+/* with qat hw, the io buffer size need to expand */
+#define IO_BUF_SIZE 524288
 #define MAX_IOV_SIZE MIN_CONST(IOV_MAX, 64)
 
 struct QEMUFile {
@@ -46,6 +48,7 @@ struct QEMUFile {
                     when reading */
     int buf_index;
     int buf_size; /* 0 when writing */
+
     uint8_t buf[IO_BUF_SIZE];
 
     DECLARE_BITMAP(may_free, MAX_IOV_SIZE);
@@ -440,7 +443,8 @@ static int add_to_iovec(QEMUFile *f, const uint8_t *buf, size_t size,
     return 0;
 }
 
-static void add_buf_to_iovec(QEMUFile *f, size_t len)
+/*public the function and use it in other source code*/
+void add_buf_to_iovec(QEMUFile *f, size_t len)
 {
     if (!add_to_iovec(f, f->buf + f->buf_index, len, false)) {
         f->buf_index += len;
@@ -450,6 +454,11 @@ static void add_buf_to_iovec(QEMUFile *f, size_t len)
     }
 }
 
+uint8_t *qemu_get_pos(QEMUFile *f)
+{
+    return f->buf + f->buf_index;
+}
+
 void qemu_put_buffer_async(QEMUFile *f, const uint8_t *buf, size_t size,
                            bool may_free)
 {
diff --git a/migration/qemu-file.h b/migration/qemu-file.h
index 3f36d4dc8c..bd554e2e17 100644
--- a/migration/qemu-file.h
+++ b/migration/qemu-file.h
@@ -25,6 +25,7 @@
 #ifndef MIGRATION_QEMU_FILE_H
 #define MIGRATION_QEMU_FILE_H
 
+#include <qatzip.h>
 #include <zlib.h>
 #include "exec/cpu-common.h"
 #include "io/channel.h"
@@ -137,6 +138,8 @@ bool qemu_file_is_writable(QEMUFile *f);
 
 #include "migration/qemu-file-types.h"
 
+void add_buf_to_iovec(QEMUFile *f, size_t len);
+uint8_t *qemu_get_pos(QEMUFile *f);
 size_t qemu_peek_buffer(QEMUFile *f, uint8_t **buf, size_t size, size_t offset);
 size_t qemu_get_buffer_in_place(QEMUFile *f, uint8_t **buf, size_t size);
 ssize_t qemu_put_compression_data(QEMUFile *f, z_stream *stream,
diff --git a/migration/ram.c b/migration/ram.c
index 3532f64ecb..a1be55a0f0 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -230,7 +230,7 @@ int64_t ramblock_recv_bitmap_send(QEMUFile *file,
                                   const char *block_name)
 {
     RAMBlock *block = qemu_ram_block_by_name(block_name);
-    unsigned long *le_bitmap, nbits;
+    uint64_t *le_bitmap, nbits;
     uint64_t size;
 
     if (!block) {
@@ -406,12 +406,36 @@ static void ram_transferred_add(uint64_t bytes)
     ram_counters.transferred += bytes;
 }
 
+/* define the max page number to compress together */
+#define MULTI_PAGE_NUM 64
+#define COMP_BUF_SIZE (TARGET_PAGE_SIZE *  MULTI_PAGE_NUM * 2)
+#define DECOMP_BUF_SIZE (TARGET_PAGE_SIZE *  MULTI_PAGE_NUM)
+
+typedef struct MultiPageAddr {
+    /* real pages that will compress together */
+    uint64_t pages;
+    /* the last index of the addr*/
+    uint64_t last_idx;
+    /* each address might contain contineous pages*/
+    uint64_t addr[MULTI_PAGE_NUM];
+} MultiPageAddr;
+
 /* used by the search for pages to send */
 struct PageSearchStatus {
     /* Current block being searched */
     RAMBlock    *block;
     /* Current page to search from */
-    unsigned long page;
+    uint64_t page;
+
+    /*
+     * multi page search from current page
+     * for compress together with qatzip
+     * stream APIs
+     */
+    MultiPageAddr mpa;
+    /* first page in block need to send normal*/
+    bool first_page_in_block;
+
     /* Set once we wrap around */
     bool         complete_round;
 };
@@ -429,9 +453,15 @@ struct CompressParam {
     RAMBlock *block;
     ram_addr_t offset;
 
-    /* internally used fields */
     z_stream stream;
     uint8_t *originbuf;
+
+    /*multi page address for compression*/
+    MultiPageAddr mpa;
+    QzSession_T qzsess;
+    uint8_t *decompbuf;
+    uint8_t *compbuf;
+    /* QzStream_T qzstream; */
 };
 typedef struct CompressParam CompressParam;
 
@@ -441,9 +471,16 @@ struct DecompressParam {
     QemuMutex mutex;
     QemuCond cond;
     void *des;
-    uint8_t *compbuf;
     int len;
     z_stream stream;
+
+    /* decompress multi pages with qzlib*/
+    RAMBlock *block;
+    QzSession_T qzsess;
+    /* QzStream_T qzstream; */
+    uint8_t *compbuf; /* buffer to be decompressed */
+    uint8_t *decompbuf; /* buffer after decompress */
+    MultiPageAddr mpa;   /* destination */
 };
 typedef struct DecompressParam DecompressParam;
 
@@ -464,14 +501,54 @@ static QemuThread *decompress_threads;
 static QemuMutex decomp_done_lock;
 static QemuCond decomp_done_cond;
 
-static bool do_compress_ram_page(QEMUFile *f, z_stream *stream, RAMBlock *block,
-                                 ram_addr_t offset, uint8_t *source_buf);
+static inline uint64_t
+multi_page_addr_get_one(MultiPageAddr *mpa, uint64_t idx);
+static inline void
+multi_page_addr_put_one(MultiPageAddr *mpa,
+                                           uint64_t offset,
+                                           uint64_t pages);
+static uint64_t
+migration_bitmap_find_dirty_multiple(RAMState *rs,
+                                     RAMBlock *rb,
+                                     uint64_t start,
+                                     MultiPageAddr *mpa);
+static bool
+migration_bitmap_clear_dirty_multiple(RAMState *rs,
+                                    RAMBlock *rb,
+                                    MultiPageAddr *mpa);
+static size_t
+save_page_header_multiple(RAMBlock *block, QEMUFile *f,
+                            MultiPageAddr *mpa);
+static inline void
+set_compress_params_multiple(CompressParam *param, RAMBlock *block,
+                        MultiPageAddr *pmpa);
+static bool
+save_compress_page_multiple(RAMState *rs, RAMBlock *block,
+                        MultiPageAddr *mpa);
+static int
+ram_save_target_page_multiple(RAMState *rs, PageSearchStatus *pss);
+static int
+ram_save_host_page_multiple(RAMState *rs, PageSearchStatus *pss);
+static bool
+do_compress_ram_page_multiple(QEMUFile *f, QzSession_T *qzsess,
+                        uint8_t *decompbuf, uint8_t *compbuf,
+                        RAMBlock *block, MultiPageAddr *mpa);
+static bool
+do_decompress_ram_page_multiple(QzSession_T *qzsess, uint8_t *compbuf,
+        uint8_t *decompbuf, RAMBlock *block, int len, MultiPageAddr *mpa);
+static int
+qemu_get_multiple(QEMUFile *f, MultiPageAddr *mpa,
+                uint8_t *compbuf, int *pbytes);
+
+static bool do_compress_ram_page(QEMUFile *f, z_stream *stream,
+            RAMBlock *block, ram_addr_t offset, uint8_t *source_buf);
 
 static void *do_data_compress(void *opaque)
 {
     CompressParam *param = opaque;
     RAMBlock *block;
     ram_addr_t offset;
+    MultiPageAddr *mpa;
     bool zero_page;
 
     qemu_mutex_lock(&param->mutex);
@@ -479,15 +556,20 @@ static void *do_data_compress(void *opaque)
         if (param->block) {
             block = param->block;
             offset = param->offset;
+            mpa = &param->mpa;
             param->block = NULL;
             qemu_mutex_unlock(&param->mutex);
-
-            zero_page = do_compress_ram_page(param->file, &param->stream,
-                                             block, offset, param->originbuf);
+            if (migrate_compress_with_qat()) {
+                do_compress_ram_page_multiple(param->file, &param->qzsess,
+                    param->decompbuf, param->compbuf, block, mpa);
+            } else {
+                zero_page = do_compress_ram_page(param->file,
+                    &param->stream, block, offset, param->originbuf);
+                param->zero_page = zero_page;
+            }
 
             qemu_mutex_lock(&comp_done_lock);
             param->done = true;
-            param->zero_page = zero_page;
             qemu_cond_signal(&comp_done_cond);
             qemu_mutex_unlock(&comp_done_lock);
 
@@ -527,8 +609,16 @@ static void compress_threads_save_cleanup(void)
         qemu_thread_join(compress_threads + i);
         qemu_mutex_destroy(&comp_param[i].mutex);
         qemu_cond_destroy(&comp_param[i].cond);
-        deflateEnd(&comp_param[i].stream);
-        g_free(comp_param[i].originbuf);
+        /* call deflateEnd or qzTeardownSession, qzClose */
+        if (migrate_compress_with_qat()) {
+            qzTeardownSession(&comp_param[i].qzsess);
+            qzClose(&comp_param[i].qzsess);
+            qzFree(comp_param[i].compbuf);
+            qzFree(comp_param[i].decompbuf);
+        } else {
+            deflateEnd(&comp_param[i].stream);
+            g_free(comp_param[i].originbuf);
+        }
         qemu_fclose(comp_param[i].file);
         comp_param[i].file = NULL;
     }
@@ -543,6 +633,8 @@ static void compress_threads_save_cleanup(void)
 static int compress_threads_save_setup(void)
 {
     int i, thread_count;
+    QzSessionParams_T sessParam;
+    int ret;
 
     if (!migrate_use_compression()) {
         return 0;
@@ -553,15 +645,41 @@ static int compress_threads_save_setup(void)
     qemu_cond_init(&comp_done_cond);
     qemu_mutex_init(&comp_done_lock);
     for (i = 0; i < thread_count; i++) {
-        comp_param[i].originbuf = g_try_malloc(TARGET_PAGE_SIZE);
-        if (!comp_param[i].originbuf) {
-            goto exit;
-        }
+        if (!migrate_compress_with_qat()) {
+            comp_param[i].originbuf = g_try_malloc(TARGET_PAGE_SIZE);
+            if (!comp_param[i].originbuf) {
+                goto exit;
+            }
 
-        if (deflateInit(&comp_param[i].stream,
-                        migrate_compress_level()) != Z_OK) {
-            g_free(comp_param[i].originbuf);
-            goto exit;
+            if (deflateInit(&comp_param[i].stream,
+                            migrate_compress_level()) != Z_OK) {
+                g_free(comp_param[i].originbuf);
+                goto exit;
+            }
+        } else {
+            ret = qzInit(&comp_param[i].qzsess, 1);
+            if (ret != QZ_OK && ret != QZ_DUPLICATE) {
+                error_report("qzInit on comp thread %d failed %d!", i, ret);
+                goto exit;
+            }
+            ret = qzGetDefaults(&sessParam);
+            if (ret != QZ_OK) {
+                error_report("qzGetDefaults, thread %d failed %d!", i, ret);
+                goto exit;
+            }
+            sessParam.comp_lvl = migrate_compress_level();
+            sessParam.direction = QZ_DIR_COMPRESS;
+            ret = qzSetupSession(&comp_param[i].qzsess, &sessParam);
+            if (ret != QZ_OK) {
+                error_report("qzSetupSession, thread %d failed %d!", i, ret);
+                goto exit;
+            }
+            comp_param[i].compbuf = qzMalloc(COMP_BUF_SIZE, 0, PINNED_MEM);
+            comp_param[i].decompbuf = qzMalloc(DECOMP_BUF_SIZE, 0, PINNED_MEM);
+            if (!comp_param[i].compbuf || !comp_param->decompbuf) {
+                error_report("can't allocate from the PINNED memory!");
+                goto exit;
+            }
         }
 
         /* comp_param[i].file is just used as a dummy buffer to save data,
@@ -603,6 +721,7 @@ static size_t save_page_header(RAMState *rs, QEMUFile *f,  RAMBlock *block,
     if (block == rs->last_sent_block) {
         offset |= RAM_SAVE_FLAG_CONTINUE;
     }
+
     qemu_put_be64(f, offset);
     size = 8;
 
@@ -801,11 +920,11 @@ static int save_xbzrle_page(RAMState *rs, uint8_t **current_data,
  * @start: page where we start the search
  */
 static inline
-unsigned long migration_bitmap_find_dirty(RAMState *rs, RAMBlock *rb,
-                                          unsigned long start)
+uint64_t migration_bitmap_find_dirty(RAMState *rs, RAMBlock *rb,
+                                          uint64_t start)
 {
-    unsigned long size = rb->used_length >> TARGET_PAGE_BITS;
-    unsigned long *bitmap = rb->bmap;
+    uint64_t size = rb->used_length >> TARGET_PAGE_BITS;
+    uint64_t *bitmap = rb->bmap;
 
     if (ramblock_is_ignored(rb)) {
         return size;
@@ -815,7 +934,7 @@ unsigned long migration_bitmap_find_dirty(RAMState *rs, RAMBlock *rb,
 }
 
 static void migration_clear_memory_region_dirty_bitmap(RAMBlock *rb,
-                                                       unsigned long page)
+                                                       uint64_t page)
 {
     uint8_t shift;
     hwaddr size, start;
@@ -829,7 +948,7 @@ static void migration_clear_memory_region_dirty_bitmap(RAMBlock *rb,
      * CLEAR_BITMAP_SHIFT_MIN should always guarantee this... this
      * can make things easier sometimes since then start address
      * of the small chunk will always be 64 pages aligned so the
-     * bitmap will always be aligned to unsigned long. We should
+     * bitmap will always be aligned to uint64_t. We should
      * even be able to remove this restriction but I'm simply
      * keeping it.
      */
@@ -843,12 +962,12 @@ static void migration_clear_memory_region_dirty_bitmap(RAMBlock *rb,
 
 static void
 migration_clear_memory_region_dirty_bitmap_range(RAMBlock *rb,
-                                                 unsigned long start,
-                                                 unsigned long npages)
+                                                 uint64_t start,
+                                                 uint64_t npages)
 {
-    unsigned long i, chunk_pages = 1UL << rb->clear_bmap_shift;
-    unsigned long chunk_start = QEMU_ALIGN_DOWN(start, chunk_pages);
-    unsigned long chunk_end = QEMU_ALIGN_UP(start + npages, chunk_pages);
+    uint64_t i, chunk_pages = 1UL << rb->clear_bmap_shift;
+    uint64_t chunk_start = QEMU_ALIGN_DOWN(start, chunk_pages);
+    uint64_t chunk_end = QEMU_ALIGN_UP(start + npages, chunk_pages);
 
     /*
      * Clear pages from start to start + npages - 1, so the end boundary is
@@ -871,12 +990,12 @@ migration_clear_memory_region_dirty_bitmap_range(RAMBlock *rb,
  * @num: the number of contiguous dirty pages
  */
 static inline
-unsigned long colo_bitmap_find_dirty(RAMState *rs, RAMBlock *rb,
-                                     unsigned long start, unsigned long *num)
+uint64_t colo_bitmap_find_dirty(RAMState *rs, RAMBlock *rb,
+                                     uint64_t start, uint64_t *num)
 {
-    unsigned long size = rb->used_length >> TARGET_PAGE_BITS;
-    unsigned long *bitmap = rb->bmap;
-    unsigned long first, next;
+    uint64_t size = rb->used_length >> TARGET_PAGE_BITS;
+    uint64_t *bitmap = rb->bmap;
+    uint64_t first, next;
 
     *num = 0;
 
@@ -896,7 +1015,7 @@ unsigned long colo_bitmap_find_dirty(RAMState *rs, RAMBlock *rb,
 
 static inline bool migration_bitmap_clear_dirty(RAMState *rs,
                                                 RAMBlock *rb,
-                                                unsigned long page)
+                                                uint64_t page)
 {
     bool ret;
 
@@ -923,8 +1042,8 @@ static void dirty_bitmap_clear_section(MemoryRegionSection *section,
 {
     const hwaddr offset = section->offset_within_region;
     const hwaddr size = int128_get64(section->size);
-    const unsigned long start = offset >> TARGET_PAGE_BITS;
-    const unsigned long npages = size >> TARGET_PAGE_BITS;
+    const uint64_t start = offset >> TARGET_PAGE_BITS;
+    const uint64_t npages = size >> TARGET_PAGE_BITS;
     RAMBlock *rb = section->mr->ram_block;
     uint64_t *cleared_bits = opaque;
 
@@ -1356,8 +1475,8 @@ static int ram_save_multifd_page(RAMState *rs, RAMBlock *block,
     return 1;
 }
 
-static bool do_compress_ram_page(QEMUFile *f, z_stream *stream, RAMBlock *block,
-                                 ram_addr_t offset, uint8_t *source_buf)
+static bool do_compress_ram_page(QEMUFile *f, z_stream *stream,
+                RAMBlock *block, ram_addr_t offset, uint8_t *source_buf)
 {
     RAMState *rs = ram_state;
     uint8_t *p = block->host + offset;
@@ -1367,15 +1486,15 @@ static bool do_compress_ram_page(QEMUFile *f, z_stream *stream, RAMBlock *block,
         return true;
     }
 
+    /* we need to save multi-header*/
     save_page_header(rs, f, block, offset | RAM_SAVE_FLAG_COMPRESS_PAGE);
 
     /*
      * copy it to a internal buffer to avoid it being modified by VM
-     * so that we can catch up the error during compression and
-     * decompression
+     * so that we can catch up the error during compression
      */
     memcpy(source_buf, p, TARGET_PAGE_SIZE);
-    ret = qemu_put_compression_data(f, stream, source_buf, TARGET_PAGE_SIZE);
+    ret = qemu_put_compression_data(f, stream, p, TARGET_PAGE_SIZE);
     if (ret < 0) {
         qemu_file_set_error(migrate_get_current()->to_dst_file, ret);
         error_report("compressed data failed!");
@@ -1440,7 +1559,7 @@ static inline void set_compress_params(CompressParam *param, RAMBlock *block,
 }
 
 static int compress_page_with_multi_thread(RAMState *rs, RAMBlock *block,
-                                           ram_addr_t offset)
+                                    MultiPageAddr *mpa, ram_addr_t offset)
 {
     int idx, thread_count, bytes_xmit = -1, pages = -1;
     bool wait = migrate_compress_wait_thread();
@@ -1453,10 +1572,15 @@ retry:
             comp_param[idx].done = false;
             bytes_xmit = qemu_put_qemu_file(rs->f, comp_param[idx].file);
             qemu_mutex_lock(&comp_param[idx].mutex);
-            set_compress_params(&comp_param[idx], block, offset);
+            if (migrate_compress_with_qat()) {
+                set_compress_params_multiple(&comp_param[idx], block, mpa);
+                pages = mpa->pages;
+            } else {
+                set_compress_params(&comp_param[idx], block, offset);
+                pages = 1;
+            }
             qemu_cond_signal(&comp_param[idx].cond);
             qemu_mutex_unlock(&comp_param[idx].mutex);
-            pages = 1;
             update_compress_thread_counts(&comp_param[idx], bytes_xmit);
             break;
         }
@@ -1487,7 +1611,12 @@ retry:
  */
 static bool find_dirty_block(RAMState *rs, PageSearchStatus *pss, bool *again)
 {
-    pss->page = migration_bitmap_find_dirty(rs, pss->block, pss->page);
+    if (!pss->first_page_in_block && migrate_compress_with_qat()) {
+        pss->page = migration_bitmap_find_dirty_multiple(rs, pss->block,
+                                                    pss->page, &pss->mpa);
+    } else {
+        pss->page = migration_bitmap_find_dirty(rs, pss->block, pss->page);
+    }
     if (pss->complete_round && pss->block == rs->last_seen_block &&
         pss->page >= rs->last_page) {
         /*
@@ -1629,7 +1758,7 @@ static RAMBlock *poll_fault_page(RAMState *rs, ram_addr_t *offset)
  * Returns 0 on success, negative value in case of an error
 */
 static int ram_save_release_protection(RAMState *rs, PageSearchStatus *pss,
-        unsigned long start_page)
+        uint64_t start_page)
 {
     int res = 0;
 
@@ -1910,7 +2039,7 @@ static RAMBlock *poll_fault_page(RAMState *rs, ram_addr_t *offset)
 }
 
 static int ram_save_release_protection(RAMState *rs, PageSearchStatus *pss,
-        unsigned long start_page)
+        uint64_t start_page)
 {
     (void) rs;
     (void) pss;
@@ -2117,7 +2246,7 @@ static bool save_compress_page(RAMState *rs, RAMBlock *block, ram_addr_t offset)
         return false;
     }
 
-    if (compress_page_with_multi_thread(rs, block, offset) > 0) {
+    if (compress_page_with_multi_thread(rs, block, 0, offset) > 0) {
         return true;
     }
 
@@ -2174,30 +2303,14 @@ static int ram_save_target_page(RAMState *rs, PageSearchStatus *pss)
     return ram_save_page(rs, pss);
 }
 
-/**
- * ram_save_host_page: save a whole host page
- *
- * Starting at *offset send pages up to the end of the current host
- * page. It's valid for the initial offset to point into the middle of
- * a host page in which case the remainder of the hostpage is sent.
- * Only dirty target pages are sent. Note that the host page size may
- * be a huge page for this block.
- * The saving stops at the boundary of the used_length of the block
- * if the RAMBlock isn't a multiple of the host page size.
- *
- * Returns the number of pages written or negative on error
- *
- * @rs: current RAM state
- * @pss: data about the page we want to send
- */
-static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss)
+static int ram_save_host_page_single(RAMState *rs, PageSearchStatus *pss)
 {
     int tmppages, pages = 0;
     size_t pagesize_bits =
         qemu_ram_pagesize(pss->block) >> TARGET_PAGE_BITS;
-    unsigned long hostpage_boundary =
+    uint64_t hostpage_boundary =
         QEMU_ALIGN_UP(pss->page + 1, pagesize_bits);
-    unsigned long start_page = pss->page;
+    uint64_t start_page = pss->page;
     int res;
 
     if (ramblock_is_ignored(pss->block)) {
@@ -2233,6 +2346,31 @@ static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss)
     return (res < 0 ? res : pages);
 }
 
+/**
+ * ram_save_host_page: save a whole host page
+ *
+ * Starting at *offset send pages up to the end of the current host
+ * page. It's valid for the initial offset to point into the middle of
+ * a host page in which case the remainder of the hostpage is sent.
+ * Only dirty target pages are sent. Note that the host page size may
+ * be a huge page for this block.
+ * The saving stops at the boundary of the used_length of the block
+ * if the RAMBlock isn't a multiple of the host page size.
+ *
+ * Returns the number of pages written or negative on error
+ *
+ * @rs: current RAM state
+ * @pss: data about the page we want to send
+ */
+static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss)
+{
+    if (!pss->first_page_in_block && migrate_compress_with_qat()) {
+        return ram_save_host_page_multiple(rs, pss);
+    } else {
+        return ram_save_host_page_single(rs, pss);
+    }
+}
+
 /**
  * ram_find_and_save_block: finds a dirty page and sends it to f
  *
@@ -2269,7 +2407,14 @@ static int ram_find_and_save_block(RAMState *rs)
         again = true;
         found = get_queued_page(rs, &pss);
 
+        /* logic start point to handle single and multiple pages */
         if (!found) {
+            /* if first page, should send normal w/o compress*/
+            if (pss.block != rs->last_seen_block) {
+                pss.first_page_in_block = true;
+            } else {
+                pss.first_page_in_block = false;
+            }
             /* priority queue empty, so just search for something dirty */
             found = find_dirty_block(rs, &pss, &again);
         }
@@ -2410,12 +2555,12 @@ void ram_postcopy_migrated_memory_release(MigrationState *ms)
     struct RAMBlock *block;
 
     RAMBLOCK_FOREACH_NOT_IGNORED(block) {
-        unsigned long *bitmap = block->bmap;
-        unsigned long range = block->used_length >> TARGET_PAGE_BITS;
-        unsigned long run_start = find_next_zero_bit(bitmap, range, 0);
+        uint64_t *bitmap = block->bmap;
+        uint64_t range = block->used_length >> TARGET_PAGE_BITS;
+        uint64_t run_start = find_next_zero_bit(bitmap, range, 0);
 
         while (run_start < range) {
-            unsigned long run_end = find_next_bit(bitmap, range, run_start + 1);
+            uint64_t run_end = find_next_bit(bitmap, range, run_start + 1);
             ram_discard_range(block->idstr,
                               ((ram_addr_t)run_start) << TARGET_PAGE_BITS,
                               ((ram_addr_t)(run_end - run_start))
@@ -2435,13 +2580,13 @@ void ram_postcopy_migrated_memory_release(MigrationState *ms)
  */
 static void postcopy_send_discard_bm_ram(MigrationState *ms, RAMBlock *block)
 {
-    unsigned long end = block->used_length >> TARGET_PAGE_BITS;
-    unsigned long current;
-    unsigned long *bitmap = block->bmap;
+    uint64_t end = block->used_length >> TARGET_PAGE_BITS;
+    uint64_t current;
+    uint64_t *bitmap = block->bmap;
 
     for (current = 0; current < end; ) {
-        unsigned long one = find_next_bit(bitmap, end, current);
-        unsigned long zero, discard_length;
+        uint64_t one = find_next_bit(bitmap, end, current);
+        uint64_t zero, discard_length;
 
         if (one >= end) {
             break;
@@ -2513,10 +2658,10 @@ static void postcopy_each_ram_send_discard(MigrationState *ms)
 static void postcopy_chunk_hostpages_pass(MigrationState *ms, RAMBlock *block)
 {
     RAMState *rs = ram_state;
-    unsigned long *bitmap = block->bmap;
-    unsigned int host_ratio = block->page_size / TARGET_PAGE_SIZE;
-    unsigned long pages = block->used_length >> TARGET_PAGE_BITS;
-    unsigned long run_start;
+    uint64_t *bitmap = block->bmap;
+    uint32_t host_ratio = block->page_size / TARGET_PAGE_SIZE;
+    uint64_t pages = block->used_length >> TARGET_PAGE_BITS;
+    uint64_t run_start;
 
     if (block->page_size == TARGET_PAGE_SIZE) {
         /* Easy case - TPS==HPS for a non-huge page RAMBlock */
@@ -2543,8 +2688,8 @@ static void postcopy_chunk_hostpages_pass(MigrationState *ms, RAMBlock *block)
         }
 
         if (!QEMU_IS_ALIGNED(run_start, host_ratio)) {
-            unsigned long page;
-            unsigned long fixup_start_addr = QEMU_ALIGN_DOWN(run_start,
+            uint64_t page;
+            uint64_t fixup_start_addr = QEMU_ALIGN_DOWN(run_start,
                                                              host_ratio);
             run_start = QEMU_ALIGN_UP(run_start, host_ratio);
 
@@ -2715,7 +2860,7 @@ static void ram_list_init_bitmaps(void)
 {
     MigrationState *ms = migrate_get_current();
     RAMBlock *block;
-    unsigned long pages;
+    uint64_t pages;
     uint8_t shift;
 
     /* Skip setting bitmap if there is no RAM */
@@ -2752,7 +2897,7 @@ static void ram_list_init_bitmaps(void)
 
 static void migration_bitmap_clear_discarded_pages(RAMState *rs)
 {
-    unsigned long pages;
+    uint64_t pages;
     RAMBlock *rb;
 
     RCU_READ_LOCK_GUARD();
@@ -2940,7 +3085,6 @@ static int ram_save_setup(QEMUFile *f, void *opaque)
     multifd_send_sync_main(f);
     qemu_put_be64(f, RAM_SAVE_FLAG_EOS);
     qemu_fflush(f);
-
     return 0;
 }
 
@@ -3025,12 +3169,13 @@ static int ram_save_iterate(QEMUFile *f, void *opaque)
              * some iterations
              */
             if ((i & 63) == 0) {
-                uint64_t t1 = (qemu_clock_get_ns(QEMU_CLOCK_REALTIME) - t0) /
-                              1000000;
-                if (t1 > MAX_WAIT) {
-                    trace_ram_save_iterate_big_wait(t1, i);
+                uint64_t t1 = qemu_clock_get_ns(QEMU_CLOCK_REALTIME);
+                uint64_t gap = (t1 - t0) / 1000000;
+                if (gap > MAX_WAIT) {
+                    trace_ram_save_iterate_big_wait(gap, i);
                     break;
                 }
+                t0 = t1; /* orginal logic looks not correct here*/
             }
             i++;
         }
@@ -3146,7 +3291,7 @@ static void ram_save_pending(QEMUFile *f, void *opaque, uint64_t max_size,
 
 static int load_xbzrle(QEMUFile *f, ram_addr_t addr, void *host)
 {
-    unsigned int xh_len;
+    uint32_t xh_len;
     int xh_flags;
     uint8_t *loaded_data;
 
@@ -3317,25 +3462,32 @@ qemu_uncompress_data(z_stream *stream, uint8_t *dest, size_t dest_len,
 static void *do_data_decompress(void *opaque)
 {
     DecompressParam *param = opaque;
-    unsigned long pagesize;
+    uint64_t pagesize;
     uint8_t *des;
     int len, ret;
+    RAMBlock *block;
 
     qemu_mutex_lock(&param->mutex);
     while (!param->quit) {
-        if (param->des) {
+        if (param->block) {
+            block = param->block;
             des = param->des;
             len = param->len;
-            param->des = 0;
+            param->block = NULL;
             qemu_mutex_unlock(&param->mutex);
 
-            pagesize = TARGET_PAGE_SIZE;
-
-            ret = qemu_uncompress_data(&param->stream, des, pagesize,
-                                       param->compbuf, len);
-            if (ret < 0 && migrate_get_current()->decompress_error_check) {
-                error_report("decompress data failed");
-                qemu_file_set_error(decomp_file, ret);
+            if (migrate_compress_with_qat()) {
+                do_decompress_ram_page_multiple(&param->qzsess,
+                    param->compbuf, param->decompbuf,
+                    block, len, &param->mpa);
+            } else {
+                pagesize = TARGET_PAGE_SIZE;
+                ret = qemu_uncompress_data(&param->stream, des, pagesize,
+                                        param->compbuf, len);
+                if (ret < 0 && migrate_get_current()->decompress_error_check) {
+                    error_report("decompress data failed");
+                    qemu_file_set_error(decomp_file, ret);
+                }
             }
 
             qemu_mutex_lock(&decomp_done_lock);
@@ -3402,9 +3554,17 @@ static void compress_threads_load_cleanup(void)
         qemu_thread_join(decompress_threads + i);
         qemu_mutex_destroy(&decomp_param[i].mutex);
         qemu_cond_destroy(&decomp_param[i].cond);
-        inflateEnd(&decomp_param[i].stream);
-        g_free(decomp_param[i].compbuf);
-        decomp_param[i].compbuf = NULL;
+        /* use the qatzip or zlib inflateEnd here */
+        if (migrate_compress_with_qat()) {
+            qzTeardownSession(&decomp_param[i].qzsess);
+            qzClose(&decomp_param[i].qzsess);
+            qzFree(decomp_param[i].compbuf);
+            qzFree(decomp_param[i].decompbuf);
+        } else {
+            inflateEnd(&decomp_param[i].stream);
+            g_free(decomp_param[i].compbuf);
+            decomp_param[i].compbuf = NULL;
+        }
     }
     g_free(decompress_threads);
     g_free(decomp_param);
@@ -3416,6 +3576,8 @@ static void compress_threads_load_cleanup(void)
 static int compress_threads_load_setup(QEMUFile *f)
 {
     int i, thread_count;
+    QzSessionParams_T sessParam;
+    int ret;
 
     if (!migrate_use_compression()) {
         return 0;
@@ -3428,11 +3590,39 @@ static int compress_threads_load_setup(QEMUFile *f)
     qemu_cond_init(&decomp_done_cond);
     decomp_file = f;
     for (i = 0; i < thread_count; i++) {
-        if (inflateInit(&decomp_param[i].stream) != Z_OK) {
-            goto exit;
+        if (!migrate_compress_with_qat()) {
+            if (inflateInit(&decomp_param[i].stream) != Z_OK) {
+                goto exit;
+            }
+            decomp_param[i].compbuf =
+                    g_malloc0(compressBound(TARGET_PAGE_SIZE));
+        } else {
+            /* call inflateInit or qzInit */
+            ret = qzInit(&decomp_param[i].qzsess, 1);
+            if (ret != QZ_OK && ret != QZ_DUPLICATE) {
+                error_report("qzInit, thread %d failed %d!", i, ret);
+                goto exit;
+            }
+            ret = qzGetDefaults(&sessParam);
+            if (ret != QZ_OK) {
+                error_report("qzGetDefaults, thread %d failed %d!", i, ret);
+                goto exit;
+            }
+            sessParam.direction = QZ_DIR_DECOMPRESS;
+            ret = qzSetupSession(&decomp_param[i].qzsess, &sessParam);
+            if (ret != QZ_OK) {
+                error_report("qzSetupSession, thread %d failed %d!", i, ret);
+                goto exit;
+            }
+            decomp_param[i].compbuf = qzMalloc(COMP_BUF_SIZE, 0, PINNED_MEM);
+            decomp_param[i].decompbuf =
+                                    qzMalloc(DECOMP_BUF_SIZE, 0, PINNED_MEM);
+            if (!decomp_param[i].compbuf || !decomp_param[i].decompbuf) {
+                error_report("can't allocate the decompress related buffer!");
+                goto exit;
+            }
         }
 
-        decomp_param[i].compbuf = g_malloc0(compressBound(TARGET_PAGE_SIZE));
         qemu_mutex_init(&decomp_param[i].mutex);
         qemu_cond_init(&decomp_param[i].cond);
         decomp_param[i].done = true;
@@ -3447,11 +3637,10 @@ exit:
     return -1;
 }
 
-static void decompress_data_with_multi_threads(QEMUFile *f,
+static void decompress_data_with_multi_threads(QEMUFile *f, RAMBlock *block,
                                                void *host, int len)
 {
     int idx, thread_count;
-
     thread_count = migrate_decompress_threads();
     QEMU_LOCK_GUARD(&decomp_done_lock);
     while (true) {
@@ -3459,9 +3648,18 @@ static void decompress_data_with_multi_threads(QEMUFile *f,
             if (decomp_param[idx].done) {
                 decomp_param[idx].done = false;
                 qemu_mutex_lock(&decomp_param[idx].mutex);
-                qemu_get_buffer(f, decomp_param[idx].compbuf, len);
-                decomp_param[idx].des = host;
-                decomp_param[idx].len = len;
+                if (migrate_compress_with_qat()) {
+                    qemu_get_multiple(f,
+                        &decomp_param[idx].mpa,
+                        decomp_param[idx].compbuf,
+                        &decomp_param[idx].len);
+                    decomp_param[idx].block = block;
+                } else {
+                    qemu_get_buffer(f, decomp_param[idx].compbuf, len);
+                    decomp_param[idx].des = host;
+                    decomp_param[idx].len = len;
+                    decomp_param[idx].block = block;
+                }
                 qemu_cond_signal(&decomp_param[idx].cond);
                 qemu_mutex_unlock(&decomp_param[idx].mutex);
                 break;
@@ -3521,7 +3719,7 @@ int colo_init_ram_cache(void)
         RAMBlock *block;
 
         RAMBLOCK_FOREACH_NOT_IGNORED(block) {
-            unsigned long pages = block->max_length >> TARGET_PAGE_BITS;
+            uint64_t pages = block->max_length >> TARGET_PAGE_BITS;
             block->bmap = bitmap_new(pages);
         }
     }
@@ -3654,7 +3852,7 @@ static int ram_load_postcopy(QEMUFile *f)
         void *place_source = NULL;
         RAMBlock *block = NULL;
         uint8_t ch;
-        int len;
+        int len = 0;
 
         addr = qemu_get_be64(f);
 
@@ -3766,14 +3964,16 @@ static int ram_load_postcopy(QEMUFile *f)
             }
             break;
         case RAM_SAVE_FLAG_COMPRESS_PAGE:
-            tmp_page->all_zero = false;
-            len = qemu_get_be32(f);
-            if (len < 0 || len > compressBound(TARGET_PAGE_SIZE)) {
-                error_report("Invalid compressed data length: %d", len);
-                ret = -EINVAL;
-                break;
+            if (!migrate_compress_with_qat()) {
+                tmp_page->all_zero = false;
+                len = qemu_get_be32(f);
+                if (len < 0 || len > compressBound(TARGET_PAGE_SIZE)) {
+                    error_report("Invalid compressed data length: %d", len);
+                    ret = -EINVAL;
+                    break;
+                }
             }
-            decompress_data_with_multi_threads(f, page_buffer, len);
+            decompress_data_with_multi_threads(f, block, page_buffer, len);
             break;
 
         case RAM_SAVE_FLAG_EOS:
@@ -3833,7 +4033,7 @@ void colo_flush_ram_cache(void)
     RAMBlock *block = NULL;
     void *dst_host;
     void *src_host;
-    unsigned long offset = 0;
+    uint64_t offset = 0;
 
     memory_global_dirty_log_sync();
     WITH_RCU_READ_LOCK_GUARD() {
@@ -3847,7 +4047,7 @@ void colo_flush_ram_cache(void)
         block = QLIST_FIRST_RCU(&ram_list.blocks);
 
         while (block) {
-            unsigned long num = 0;
+            uint64_t num = 0;
 
             offset = colo_bitmap_find_dirty(ram_state, block, offset, &num);
             if (!offset_in_ramblock(block,
@@ -3856,7 +4056,7 @@ void colo_flush_ram_cache(void)
                 num = 0;
                 block = QLIST_NEXT_RCU(block, next);
             } else {
-                unsigned long i = 0;
+                uint64_t i = 0;
 
                 for (i = 0; i < num; i++) {
                     migration_bitmap_clear_dirty(ram_state, block, offset + i);
@@ -3922,9 +4122,10 @@ static int ram_load_precopy(QEMUFile *f)
             break;
         }
 
+        RAMBlock *block = NULL;
         if (flags & (RAM_SAVE_FLAG_ZERO | RAM_SAVE_FLAG_PAGE |
                      RAM_SAVE_FLAG_COMPRESS_PAGE | RAM_SAVE_FLAG_XBZRLE)) {
-            RAMBlock *block = ram_block_from_stream(mis, f, flags);
+            block = ram_block_from_stream(mis, f, flags);
 
             host = host_from_ram_block_offset(block, addr);
             /*
@@ -4035,13 +4236,15 @@ static int ram_load_precopy(QEMUFile *f)
             break;
 
         case RAM_SAVE_FLAG_COMPRESS_PAGE:
-            len = qemu_get_be32(f);
-            if (len < 0 || len > compressBound(TARGET_PAGE_SIZE)) {
-                error_report("Invalid compressed data length: %d", len);
-                ret = -EINVAL;
-                break;
+            if (!migrate_compress_with_qat()) {
+                len = qemu_get_be32(f);
+                if (len < 0 || len > compressBound(TARGET_PAGE_SIZE)) {
+                    error_report("Invalid compressed data length: %d", len);
+                    ret = -EINVAL;
+                    break;
+                }
             }
-            decompress_data_with_multi_threads(f, host, len);
+            decompress_data_with_multi_threads(f, block, host, len);
             break;
 
         case RAM_SAVE_FLAG_XBZRLE:
@@ -4167,7 +4370,7 @@ int ram_dirty_bitmap_reload(MigrationState *s, RAMBlock *block)
     int ret = -EINVAL;
     /* from_dst_file is always valid because we're within rp_thread */
     QEMUFile *file = s->rp_state.from_dst_file;
-    unsigned long *le_bitmap, nbits = block->used_length >> TARGET_PAGE_BITS;
+    uint64_t *le_bitmap, nbits = block->used_length >> TARGET_PAGE_BITS;
     uint64_t local_size = DIV_ROUND_UP(nbits, 8);
     uint64_t size, end_mark;
 
@@ -4342,3 +4545,303 @@ void ram_mig_init(void)
     register_savevm_live("ram", 0, 4, &savevm_ram_handlers, &ram_state);
     ram_block_notifier_add(&ram_mig_ram_notifier);
 }
+
+static inline uint64_t
+multi_page_addr_get_one(MultiPageAddr *mpa, uint64_t idx)
+{
+    return mpa->addr[idx];
+}
+
+static inline void multi_page_addr_put_one(MultiPageAddr *mpa,
+                                           uint64_t offset,
+                                           uint64_t pages)
+{
+    uint64_t idx = mpa->last_idx;
+    uint64_t *addr = mpa->addr;
+
+    /* The lower TARGET_PAGE_BITS:continuous pages number */
+    addr[idx] = (offset << TARGET_PAGE_BITS) | pages;
+    mpa->last_idx = idx + 1;
+    mpa->pages += pages;
+}
+
+/* find the dirty pages and put into the mpa */
+static uint64_t
+migration_bitmap_find_dirty_multiple(RAMState *rs,
+                                     RAMBlock *rb,
+                                     uint64_t start,
+                                     MultiPageAddr *mpa)
+{
+    uint64_t *bitmap = rb->bmap;
+    uint64_t size = rb->used_length >> TARGET_PAGE_BITS;
+    uint64_t end, pages = 0;
+
+    mpa->last_idx = 0;
+    mpa->pages = 0;
+    if (ramblock_is_ignored(rb)) {
+        return size;
+    }
+
+    if (start >= size) {
+        return size;
+    }
+
+    /* from the start pos to search the dirty bitmap*/
+    while ((mpa->pages < MULTI_PAGE_NUM)) {
+        start = find_next_bit(bitmap, size, start);
+        /* if start>= size mean can't find any more*/
+        if (start >= size) {
+            return size;
+        }
+
+        /*
+         * find the next clean page,
+         * end-start = contineous dirty pages
+         */
+        end = find_next_zero_bit(bitmap, size, start);
+        pages = end - start;
+        /*
+         * if total pages over MULTI_PAGE_NUM
+         * keep last mpa entry pages is:
+         * MULTI_PAGE_NUM - mpa->pages
+         */
+        if ((mpa->pages + pages) > MULTI_PAGE_NUM) {
+            pages = MULTI_PAGE_NUM - mpa->pages;
+        }
+        multi_page_addr_put_one(mpa, start, pages);
+        start += pages;
+    }
+
+    return start;
+}
+
+static bool
+migration_bitmap_clear_dirty_multiple(RAMState *rs,
+                                    RAMBlock *rb,
+                                    MultiPageAddr *mpa)
+{
+    uint64_t start, multi_pages, page, i, j;
+    bool ret = 0;
+
+    for (i = 0; i < mpa->last_idx; i++) {
+        start = multi_page_addr_get_one(mpa, i);
+
+        /* pages number in the lower TARGET_PAGE_BITS bit*/
+        multi_pages = start & (~TARGET_PAGE_MASK);
+        start = start >> TARGET_PAGE_BITS;
+        for (j = 0; j < multi_pages; j++) {
+            page = start + j;
+            migration_clear_memory_region_dirty_bitmap(rb, page);
+
+            ret = test_and_clear_bit(page, rb->bmap);
+            if (ret) {
+                rs->migration_dirty_pages--;
+            }
+        }
+    }
+    return ret;
+}
+
+/* save page header for multiple pages */
+static size_t
+save_page_header_multiple(RAMBlock *block, QEMUFile *f,
+                        MultiPageAddr *mpa)
+{
+    int i, header_bytes;
+    ram_addr_t offset = multi_page_addr_get_one(mpa, 0) & TARGET_PAGE_MASK;
+
+    offset |= (RAM_SAVE_FLAG_COMPRESS_PAGE | RAM_SAVE_FLAG_CONTINUE);
+
+    qemu_put_be64(f, offset);
+    qemu_put_be64(f, mpa->pages);
+    qemu_put_be64(f, mpa->last_idx);
+    for (i = 0; i < mpa->last_idx; i++) {
+        qemu_put_be64(f, mpa->addr[i]);
+    }
+    header_bytes = sizeof(offset) + sizeof(mpa->pages) +
+        sizeof(mpa->last_idx) + mpa->last_idx * sizeof(mpa->addr[0]);
+    return header_bytes;
+}
+
+/* save compress paramters for mpa*/
+static inline void
+set_compress_params_multiple(CompressParam *param, RAMBlock *block,
+                            MultiPageAddr *pmpa)
+{
+    param->block = block;
+    memcpy(&param->mpa, pmpa, sizeof(MultiPageAddr));
+}
+
+/*
+ * try to compress the page before posting it out, return true if the page
+ * has been properly handled by compression, otherwise needs other
+ * paths to handle it
+ */
+static bool
+save_compress_page_multiple(RAMState *rs, RAMBlock *block,
+                        MultiPageAddr *mpa)
+{
+    if (compress_page_with_multi_thread(rs, block, mpa, 0) > 0) {
+        return true;
+    }
+
+    compression_counters.busy++;
+    return false;
+}
+
+/**
+ * ram_save_target_page: save one target page
+ *
+ * Returns the number of pages written
+ *
+ * @rs: current RAM state
+ * @pss: data about the page we want to send
+ */
+static int
+ram_save_target_page_multiple(RAMState *rs, PageSearchStatus *pss)
+{
+    RAMBlock *block = pss->block;
+    MultiPageAddr *mpa = &pss->mpa;
+
+    if (save_compress_page_multiple(rs, block, mpa)) {
+        return mpa->pages;
+    }
+
+    return -1;
+}
+
+static int
+ram_save_host_page_multiple(RAMState *rs, PageSearchStatus *pss)
+{
+    int tmppages, pages = 0;
+    size_t pagesize_bits =
+        qemu_ram_pagesize(pss->block) >> TARGET_PAGE_BITS;
+    uint64_t start_page = pss->page;
+    int res;
+
+    if (ramblock_is_ignored(pss->block)) {
+        error_report("block %s should not be migrated !", pss->block->idstr);
+        return 0;
+    }
+
+    /* Check the pages is dirty and if it is send it */
+    if (migration_bitmap_clear_dirty_multiple(rs, pss->block, &pss->mpa)) {
+        tmppages = ram_save_target_page_multiple(rs, pss);
+        if (tmppages < 0) {
+            return tmppages;
+        }
+
+        pages += tmppages;
+        /*
+         * Allow rate limiting to happen in the middle of huge pages if
+         * something is sent in the current iteration.
+         */
+        if (pagesize_bits > 1 && tmppages > 0) {
+            migration_rate_limit();
+        }
+    }
+
+    res = ram_save_release_protection(rs, pss, start_page);
+    return (res < 0 ? res : pages);
+}
+
+static bool
+do_compress_ram_page_multiple(QEMUFile *f, QzSession_T *qzsess,
+        uint8_t *decompbuf, uint8_t *compbuf,
+        RAMBlock *block, MultiPageAddr *mpa)
+{
+    uint64_t start, multi_pages, i;
+    int rc;
+    uint32_t origin_size = 0, src_size = 0, dest_size = COMP_BUF_SIZE;
+    ram_addr_t offset;
+    uint8_t *base_addr;
+    uint8_t *origbuf = decompbuf;
+
+    save_page_header_multiple(block, f, mpa);
+    /* memory copy to the Pinned memory for the qatzip compress API */
+    for (i = 0; i < mpa->last_idx; i++) {
+        start = multi_page_addr_get_one(mpa, i);
+
+        /* pages number in the lower TARGET_PAGE_BITS bit*/
+        multi_pages = start & (~TARGET_PAGE_MASK);
+        offset = start & TARGET_PAGE_MASK;
+        base_addr = (uint8_t *) host_from_ram_block_offset(block, offset);
+        if (base_addr == NULL) {
+            return false;
+        }
+
+        origin_size = multi_pages * TARGET_PAGE_SIZE;
+        memcpy(origbuf, base_addr, origin_size);
+        origbuf += origin_size;
+        src_size += origin_size;
+    }
+
+    rc = qzCompress(qzsess, decompbuf, &src_size, compbuf, &dest_size, 1);
+    if (rc != QZ_OK) {
+        error_report("ERROR: Compression FAILED: %d!", rc);
+        return false;
+    }
+
+    qemu_put_be64(f, dest_size);
+    /* memory copy to the IO buffer */
+    qemu_put_buffer(f, compbuf, dest_size);
+
+    ram_counters.transferred += dest_size;
+    compression_counters.compressed_size += dest_size;
+    compression_counters.pages += mpa->pages;
+    return true;
+}
+
+static bool
+do_decompress_ram_page_multiple(QzSession_T *qzsess,
+            uint8_t *compbuf, uint8_t *decompbuf,
+            RAMBlock *block, int len, MultiPageAddr *mpa)
+{
+    uint64_t start, multi_pages, i;
+    int rc;
+    ram_addr_t offset;
+    uint8_t *base_addr;
+    int decomp_size = 0;
+    uint32_t src_size = len, dest_size = DECOMP_BUF_SIZE;
+
+    rc = qzDecompress(qzsess, compbuf, &src_size, decompbuf, &dest_size);
+    if (rc != QZ_OK) {
+        error_report("ERROR: Decompress FAILED: %d!", rc);
+        return false;
+    }
+
+    for (i = 0; i < mpa->last_idx; i++) {
+        start = multi_page_addr_get_one(mpa, i);
+        multi_pages = start & (~TARGET_PAGE_MASK);
+        offset = start & TARGET_PAGE_MASK;
+        base_addr = (uint8_t *)host_from_ram_block_offset(block, offset);
+        if (base_addr == NULL) {
+            return false;
+        }
+
+        decomp_size = multi_pages * TARGET_PAGE_SIZE;
+        memcpy(base_addr, decompbuf, decomp_size);
+        decompbuf += decomp_size;
+    }
+
+    return true;
+}
+
+static int
+qemu_get_multiple(QEMUFile *f, MultiPageAddr *mpa,
+                uint8_t *compbuf, int *pbytes)
+{
+    uint64_t bytes;
+    uint64_t i;
+
+    mpa->pages = qemu_get_be64(f);
+    mpa->last_idx = qemu_get_be64(f);
+    mpa->addr[0] = 0;
+    for (i = 0; i < mpa->last_idx; i++) {
+        mpa->addr[i] = qemu_get_be64(f);
+    }
+    bytes = qemu_get_be64(f);
+    qemu_get_buffer(f, compbuf, bytes);
+    *pbytes = bytes;
+    return 0;
+}
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 634968498b..98e530e569 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -1220,6 +1220,10 @@ void hmp_migrate_set_parameter(Monitor *mon, const QDict *qdict)
         p->has_compress_threads = true;
         visit_type_uint8(v, param, &p->compress_threads, &err);
         break;
+    case MIGRATION_PARAMETER_COMPRESS_WITH_QAT:
+        p->has_compress_with_qat = true;
+        visit_type_bool(v, param, &p->compress_with_qat, &err);
+        break;
     case MIGRATION_PARAMETER_COMPRESS_WAIT_THREAD:
         p->has_compress_wait_thread = true;
         visit_type_bool(v, param, &p->compress_wait_thread, &err);
diff --git a/qapi/migration.json b/qapi/migration.json
index 27d7b28158..0585ca59f5 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -629,6 +629,8 @@
 #                  no compression, 1 means the best compression speed, and 9 means best
 #                  compression ratio which will consume more CPU.
 #
+# @compress-with-qat: compress with qat on and off.
+#
 # @compress-threads: Set compression thread count to be used in live migration,
 #                    the compression thread count is an integer between 1 and 255.
 #
@@ -768,7 +770,7 @@
 { 'enum': 'MigrationParameter',
   'data': ['announce-initial', 'announce-max',
            'announce-rounds', 'announce-step',
-           'compress-level', 'compress-threads', 'decompress-threads',
+           'compress-level', 'compress-with-qat', 'compress-threads', 'decompress-threads',
            'compress-wait-thread', 'throttle-trigger-threshold',
            'cpu-throttle-initial', 'cpu-throttle-increment',
            'cpu-throttle-tailslow',
@@ -799,6 +801,8 @@
 #
 # @compress-level: compression level
 #
+# @compress-with-qat: compression with qat
+#
 # @compress-threads: compression thread count
 #
 # @compress-wait-thread: Controls behavior when all compression threads are
@@ -938,6 +942,7 @@
             '*announce-rounds': 'size',
             '*announce-step': 'size',
             '*compress-level': 'uint8',
+            '*compress-with-qat': 'bool',
             '*compress-threads': 'uint8',
             '*compress-wait-thread': 'bool',
             '*decompress-threads': 'uint8',
@@ -1136,6 +1141,7 @@
             '*announce-rounds': 'size',
             '*announce-step': 'size',
             '*compress-level': 'uint8',
+            '*compress-with-qat': 'bool',
             '*compress-threads': 'uint8',
             '*compress-wait-thread': 'bool',
             '*decompress-threads': 'uint8',
-- 
2.39.1


