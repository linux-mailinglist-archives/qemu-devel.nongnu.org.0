Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B79DC6E4A4C
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Apr 2023 15:47:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poPCV-0006Ln-RB; Mon, 17 Apr 2023 09:47:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <you.chen@intel.com>)
 id 1poKPb-0001CM-86
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 04:40:35 -0400
Received: from mga14.intel.com ([192.55.52.115])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <you.chen@intel.com>)
 id 1poKPX-0003jU-HY
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 04:40:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681720831; x=1713256831;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XJT7PrES2py6TL0IgVV6+zDrhUZ3bUm6yHq68nPuY+c=;
 b=V9VZ3WW+B4VQu8mJqmS1po+Ln/lnlvJJO4yCbZrSyv3SufR6c0j+5JmW
 6MCBuXsQJNtrzrXwzDZWmeKrE8gw0bgeqXAlPCdjyAeoWrRgXh2tZB6iF
 DHLJCFjOe/XhRiQmgIU2Jg1jsuoQvIxdrTFTOoQzs3+RzpnMjghHLLg7z
 BJf+wgMWUC5Ac+0OsVeAcJOz/oSBH7JaYeQNb6yhuFu9H9mq9yFruF1cP
 SaQj0vniOa8n60hsf7EOC+ZOhmmhH9PrRP1Ag0+K3/F2nMBBy0vhUrbyr
 SDvAlQfvF7C/r+uHzdg8cMQBFBQfy/6jfVmMdsFLqVrKHo+h/NWWxboSz g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10682"; a="344838021"
X-IronPort-AV: E=Sophos;i="5.99,203,1677571200"; d="scan'208";a="344838021"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2023 01:40:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10682"; a="684086683"
X-IronPort-AV: E=Sophos;i="5.99,203,1677571200"; d="scan'208";a="684086683"
Received: from unknown (HELO inspur05.sh.intel.com) ([10.112.227.25])
 by orsmga007.jf.intel.com with ESMTP; 17 Apr 2023 01:40:25 -0700
From: "you.chen" <you.chen@intel.com>
To: qemu-devel@nongnu.org
Cc: "you.chen" <you.chen@intel.com>, "dennis . wu" <dennis.wu@intel.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>
Subject: [PATCH v2 2/2] migration: add support for qatzip compression when
 doing live migration
Date: Mon, 17 Apr 2023 16:39:35 +0800
Message-Id: <20230417083935.415782-3-you.chen@intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20230417083935.415782-1-you.chen@intel.com>
References: <20230417083935.415782-1-you.chen@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.115; envelope-from=you.chen@intel.com;
 helo=mga14.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 17 Apr 2023 09:47:05 -0400
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

Add config and logics to use qatzip for page compression, in order to support qatzip compression better, we collect multipe pages together to do qatzip compression for best performance.
And we use compile option CONFIG_QATZIP to determine whether should qatzip related code be compiled or not.

Co-developed-by: dennis.wu <dennis.wu@intel.com>
Signed-off-by: you.chen <you.chen@intel.com>
---
 migration/migration-hmp-cmds.c |   4 +
 migration/migration.c          |  22 ++
 migration/migration.h          |   1 +
 migration/qemu-file.c          |  15 +-
 migration/qemu-file.h          |   5 +
 migration/ram.c                | 675 +++++++++++++++++++++++++++++----
 qapi/migration.json            |   8 +-
 7 files changed, 658 insertions(+), 72 deletions(-)

diff --git a/migration/migration-hmp-cmds.c b/migration/migration-hmp-cmds.c
index 72519ea99f..2608f67469 100644
--- a/migration/migration-hmp-cmds.c
+++ b/migration/migration-hmp-cmds.c
@@ -479,6 +479,10 @@ void hmp_migrate_set_parameter(Monitor *mon, const QDict *qdict)
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
diff --git a/migration/migration.c b/migration/migration.c
index ae2025d9d8..15ab6ecf57 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -962,6 +962,8 @@ MigrationParameters *qmp_query_migrate_parameters(Error **errp)
     params->compress_level = s->parameters.compress_level;
     params->has_compress_threads = true;
     params->compress_threads = s->parameters.compress_threads;
+    params->has_compress_with_qat = true;
+    params->compress_with_qat = s->parameters.compress_with_qat;
     params->has_compress_wait_thread = true;
     params->compress_wait_thread = s->parameters.compress_wait_thread;
     params->has_decompress_threads = true;
@@ -1678,6 +1680,10 @@ static void migrate_params_test_apply(MigrateSetParameters *params,
         dest->compress_threads = params->compress_threads;
     }
 
+    if (params->has_compress_with_qat) {
+        dest->compress_with_qat = params->compress_with_qat;
+    }
+
     if (params->has_compress_wait_thread) {
         dest->compress_wait_thread = params->compress_wait_thread;
     }
@@ -1775,6 +1781,10 @@ static void migrate_params_apply(MigrateSetParameters *params, Error **errp)
         s->parameters.compress_threads = params->compress_threads;
     }
 
+    if (params->has_compress_with_qat) {
+        s->parameters.compress_with_qat = params->compress_with_qat;
+    }
+
     if (params->has_compress_wait_thread) {
         s->parameters.compress_wait_thread = params->compress_wait_thread;
     }
@@ -2620,6 +2630,15 @@ bool migrate_use_compression(void)
     return s->enabled_capabilities[MIGRATION_CAPABILITY_COMPRESS];
 }
 
+bool migrate_compress_with_qat(void)
+{
+    MigrationState *s;
+
+    s = migrate_get_current();
+
+    return migrate_use_compression() && s->parameters.compress_with_qat;
+}
+
 int migrate_compress_level(void)
 {
     MigrationState *s;
@@ -4451,6 +4470,8 @@ static Property migration_properties[] = {
     DEFINE_PROP_UINT8("x-compress-threads", MigrationState,
                       parameters.compress_threads,
                       DEFAULT_MIGRATE_COMPRESS_THREAD_COUNT),
+    DEFINE_PROP_BOOL("x-compress-with-qat", MigrationState,
+                      parameters.compress_with_qat, false),
     DEFINE_PROP_BOOL("x-compress-wait-thread", MigrationState,
                       parameters.compress_wait_thread, true),
     DEFINE_PROP_UINT8("x-decompress-threads", MigrationState,
@@ -4580,6 +4601,7 @@ static void migration_instance_init(Object *obj)
     params->has_compress_level = true;
     params->has_compress_threads = true;
     params->has_compress_wait_thread = true;
+    params->has_compress_with_qat = true;
     params->has_decompress_threads = true;
     params->has_throttle_trigger_threshold = true;
     params->has_cpu_throttle_initial = true;
diff --git a/migration/migration.h b/migration/migration.h
index 2da2f8a164..fcb5a2f670 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -443,6 +443,7 @@ bool migrate_use_return_path(void);
 uint64_t ram_get_total_transferred_pages(void);
 
 bool migrate_use_compression(void);
+bool migrate_compress_with_qat(void);
 int migrate_compress_level(void);
 int migrate_compress_threads(void);
 int migrate_compress_wait_thread(void);
diff --git a/migration/qemu-file.c b/migration/qemu-file.c
index 102ab3b439..29d288e82e 100644
--- a/migration/qemu-file.c
+++ b/migration/qemu-file.c
@@ -26,12 +26,18 @@
 #include "qemu/madvise.h"
 #include "qemu/error-report.h"
 #include "qemu/iov.h"
+#include "qemu/units.h"
 #include "migration.h"
 #include "qemu-file.h"
 #include "trace.h"
 #include "qapi/error.h"
 
-#define IO_BUF_SIZE 32768
+#ifdef CONFIG_QATZIP
+#define IO_BUF_SIZE (512 * KiB)
+#else
+#define IO_BUF_SIZE (32 * KiB)
+#endif
+
 #define MAX_IOV_SIZE MIN_CONST(IOV_MAX, 64)
 
 struct QEMUFile {
@@ -514,7 +520,7 @@ static int add_to_iovec(QEMUFile *f, const uint8_t *buf, size_t size,
     return 0;
 }
 
-static void add_buf_to_iovec(QEMUFile *f, size_t len)
+void add_buf_to_iovec(QEMUFile *f, size_t len)
 {
     if (!add_to_iovec(f, f->buf + f->buf_index, len, false)) {
         f->buf_index += len;
@@ -524,6 +530,11 @@ static void add_buf_to_iovec(QEMUFile *f, size_t len)
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
index 9d0155a2a1..391e02f197 100644
--- a/migration/qemu-file.h
+++ b/migration/qemu-file.h
@@ -25,6 +25,9 @@
 #ifndef MIGRATION_QEMU_FILE_H
 #define MIGRATION_QEMU_FILE_H
 
+#ifdef CONFIG_QATZIP
+#include <qatzip.h>
+#endif
 #include <zlib.h>
 #include "exec/cpu-common.h"
 #include "io/channel.h"
@@ -108,6 +111,8 @@ bool qemu_file_is_writable(QEMUFile *f);
 
 #include "migration/qemu-file-types.h"
 
+void add_buf_to_iovec(QEMUFile *f, size_t len);
+uint8_t *qemu_get_pos(QEMUFile *f);
 size_t qemu_peek_buffer(QEMUFile *f, uint8_t **buf, size_t size, size_t offset);
 size_t qemu_get_buffer_in_place(QEMUFile *f, uint8_t **buf, size_t size);
 ssize_t qemu_put_compression_data(QEMUFile *f, z_stream *stream,
diff --git a/migration/ram.c b/migration/ram.c
index 96e8a19a58..a9dfca748b 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -117,6 +117,20 @@ static void __attribute__((constructor)) init_cpu_flag(void)
 
 XBZRLECacheStats xbzrle_counters;
 
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
     /* The migration channel used for a specific host page */
@@ -127,6 +141,12 @@ struct PageSearchStatus {
     RAMBlock    *block;
     /* Current page to search from */
     unsigned long page;
+    /*
+     * multi page search from current page
+     * for compress together with qatzip
+     * stream APIs
+     */
+    MultiPageAddr mpa;
     /* Set once we wrap around */
     bool         complete_round;
     /* Whether we're sending a host page */
@@ -506,6 +526,15 @@ struct CompressParam {
     /* internally used fields */
     z_stream stream;
     uint8_t *originbuf;
+
+#ifdef CONFIG_QATZIP
+    /*multi page address for compression*/
+    MultiPageAddr mpa;
+    QzSession_T qzsess;
+    uint8_t *decompbuf;
+    uint8_t *compbuf;
+    /* QzStream_T qzstream; */
+#endif
 };
 typedef struct CompressParam CompressParam;
 
@@ -518,6 +547,15 @@ struct DecompressParam {
     uint8_t *compbuf;
     int len;
     z_stream stream;
+    RAMBlock *block;
+
+#ifdef CONFIG_QATZIP
+    /* decompress multi pages with qzlib*/
+    QzSession_T qzsess;
+    /* QzStream_T qzstream; */
+    uint8_t *decompbuf; /* buffer after decompress */
+    MultiPageAddr mpa;   /* destination */
+#endif
 };
 typedef struct DecompressParam DecompressParam;
 
@@ -541,6 +579,33 @@ static int ram_save_host_page_urgent(PageSearchStatus *pss);
 static bool do_compress_ram_page(QEMUFile *f, z_stream *stream, RAMBlock *block,
                                  ram_addr_t offset, uint8_t *source_buf);
 
+#ifdef CONFIG_QATZIP
+static inline uint64_t multi_page_addr_get_one(MultiPageAddr *mpa, uint64_t idx);
+static inline void multi_page_addr_put_one(MultiPageAddr *mpa,
+                                           uint64_t offset,
+                                           uint64_t pages);
+
+static void pss_find_next_multiple_dirty(PageSearchStatus *pss);
+static bool migration_bitmap_clear_dirty_multiple(RAMState *rs,
+                                    RAMBlock *rb,
+                                    MultiPageAddr *mpa);
+static size_t save_page_header_multiple(RAMBlock *block, QEMUFile *f,
+                            MultiPageAddr *mpa);
+static inline void set_compress_params_multiple(CompressParam *param, RAMBlock *block,
+                        MultiPageAddr *pmpa);
+static bool save_compress_page_multiple(RAMState *rs, RAMBlock *block,
+                        MultiPageAddr *mpa);
+static int ram_save_target_page_multiple(RAMState *rs, PageSearchStatus *pss);
+static int ram_save_host_page_multiple(RAMState *rs, PageSearchStatus *pss);
+static void do_compress_ram_page_multiple(QEMUFile *f, QzSession_T *qzsess,
+                        uint8_t *decompbuf, uint8_t *compbuf,
+                        RAMBlock *block, MultiPageAddr *mpa);
+static bool do_decompress_ram_page_multiple(QzSession_T *qzsess, uint8_t *compbuf,
+        uint8_t *decompbuf, RAMBlock *block, int len, MultiPageAddr *mpa);
+static int qemu_get_multiple(QEMUFile *f, MultiPageAddr *mpa,
+                uint8_t *compbuf, int *pbytes);
+#endif
+
 /* NOTE: page is the PFN not real ram_addr_t. */
 static void pss_init(PageSearchStatus *pss, RAMBlock *rb, ram_addr_t page)
 {
@@ -574,12 +639,21 @@ static void *do_data_compress(void *opaque)
             param->block = NULL;
             qemu_mutex_unlock(&param->mutex);
 
-            zero_page = do_compress_ram_page(param->file, &param->stream,
-                                             block, offset, param->originbuf);
+#ifdef CONFIG_QATZIP
+            if (migrate_compress_with_qat()) {
+                do_compress_ram_page_multiple(param->file, &param->qzsess,
+                    param->decompbuf, param->compbuf, block, &param->mpa);
+            } else {
+#endif
+                zero_page = do_compress_ram_page(param->file,
+                    &param->stream, block, offset, param->originbuf);
+                param->zero_page = zero_page;
+#ifdef CONFIG_QATZIP
+            }
+#endif
 
             qemu_mutex_lock(&comp_done_lock);
             param->done = true;
-            param->zero_page = zero_page;
             qemu_cond_signal(&comp_done_cond);
             qemu_mutex_unlock(&comp_done_lock);
 
@@ -619,8 +693,19 @@ static void compress_threads_save_cleanup(void)
         qemu_thread_join(compress_threads + i);
         qemu_mutex_destroy(&comp_param[i].mutex);
         qemu_cond_destroy(&comp_param[i].cond);
-        deflateEnd(&comp_param[i].stream);
-        g_free(comp_param[i].originbuf);
+#ifdef CONFIG_QATZIP
+        if (migrate_compress_with_qat()) {
+            qzTeardownSession(&comp_param[i].qzsess);
+            qzClose(&comp_param[i].qzsess);
+            qzFree(comp_param[i].compbuf);
+            qzFree(comp_param[i].decompbuf);
+        } else {
+#endif
+            deflateEnd(&comp_param[i].stream);
+            g_free(comp_param[i].originbuf);
+#ifdef CONFIG_QATZIP
+        }
+#endif
         qemu_fclose(comp_param[i].file);
         comp_param[i].file = NULL;
     }
@@ -645,6 +730,9 @@ static int compress_threads_save_setup(void)
     qemu_cond_init(&comp_done_cond);
     qemu_mutex_init(&comp_done_lock);
     for (i = 0; i < thread_count; i++) {
+#ifdef CONFIG_QATZIP
+    if(!migrate_compress_with_qat()) {
+#endif
         comp_param[i].originbuf = g_try_malloc(TARGET_PAGE_SIZE);
         if (!comp_param[i].originbuf) {
             goto exit;
@@ -655,7 +743,35 @@ static int compress_threads_save_setup(void)
             g_free(comp_param[i].originbuf);
             goto exit;
         }
-
+#ifdef CONFIG_QATZIP
+    } else {
+        int ret;
+        QzSessionParams_T sessParam;
+        ret = qzInit(&comp_param[i].qzsess, 1);
+        if (ret != QZ_OK && ret != QZ_DUPLICATE) {
+            error_report("qzInit on comp thread %d failed %d!", i, ret);
+            goto exit;
+        }
+        ret = qzGetDefaults(&sessParam);
+        if (ret != QZ_OK) {
+            error_report("qzGetDefaults, thread %d failed %d!", i, ret);
+            goto exit;
+        }
+        sessParam.comp_lvl = migrate_compress_level();
+        sessParam.direction = QZ_DIR_COMPRESS;
+        ret = qzSetupSession(&comp_param[i].qzsess, &sessParam);
+        if (ret != QZ_OK) {
+            error_report("qzSetupSession, thread %d failed %d!", i, ret);
+            goto exit;
+        }
+        comp_param[i].compbuf = qzMalloc(COMP_BUF_SIZE, 0, PINNED_MEM);
+        comp_param[i].decompbuf = qzMalloc(DECOMP_BUF_SIZE, 0, PINNED_MEM);
+        if (!comp_param[i].compbuf || !comp_param->decompbuf) {
+            error_report("can't allocate from the PINNED memory!");
+            goto exit;
+        }
+    }
+#endif
         /* comp_param[i].file is just used as a dummy buffer to save data,
          * set its ops to empty.
          */
@@ -1550,7 +1666,7 @@ static inline void set_compress_params(CompressParam *param, RAMBlock *block,
     param->offset = offset;
 }
 
-static int compress_page_with_multi_thread(RAMBlock *block, ram_addr_t offset)
+static int compress_page_with_multi_thread(RAMBlock *block, MultiPageAddr *mpa, ram_addr_t offset)
 {
     int idx, thread_count, bytes_xmit = -1, pages = -1;
     bool wait = migrate_compress_wait_thread();
@@ -1565,10 +1681,19 @@ retry:
             bytes_xmit = qemu_put_qemu_file(ms->to_dst_file,
                                             comp_param[idx].file);
             qemu_mutex_lock(&comp_param[idx].mutex);
+#ifdef CONFIG_QATZIP
+        if (migrate_compress_with_qat()) {
+            set_compress_params_multiple(&comp_param[idx], block, mpa);
+            pages = mpa->pages;
+        } else {
+#endif
             set_compress_params(&comp_param[idx], block, offset);
+            pages = 1;
+#ifdef CONFIG_QATZIP
+        }
+#endif
             qemu_cond_signal(&comp_param[idx].cond);
             qemu_mutex_unlock(&comp_param[idx].mutex);
-            pages = 1;
             update_compress_thread_counts(&comp_param[idx], bytes_xmit);
             break;
         }
@@ -1605,8 +1730,20 @@ retry:
  */
 static int find_dirty_block(RAMState *rs, PageSearchStatus *pss)
 {
-    /* Update pss->page for the next dirty bit in ramblock */
-    pss_find_next_dirty(pss);
+#ifdef CONFIG_QATZIP
+    if (migrate_compress_with_qat()) {
+        if(pss->block == pss->last_sent_block) {
+            pss_find_next_multiple_dirty(pss);
+        } else {
+            pss_find_next_dirty(pss);
+        }
+    } else {
+#endif
+        /* Update pss->page for the next dirty bit in ramblock */
+        pss_find_next_dirty(pss);
+#ifdef CONFIG_QATZIP
+    }
+#endif
 
     if (pss->complete_round && pss->block == rs->last_seen_block &&
         pss->page >= rs->last_page) {
@@ -2325,7 +2462,7 @@ static bool save_compress_page(RAMState *rs, PageSearchStatus *pss,
         return false;
     }
 
-    if (compress_page_with_multi_thread(block, offset) > 0) {
+    if (compress_page_with_multi_thread(block, NULL, offset) > 0) {
         return true;
     }
 
@@ -2377,7 +2514,6 @@ static int ram_save_target_page_legacy(RAMState *rs, PageSearchStatus *pss)
     if (migrate_use_multifd() && !migration_in_postcopy()) {
         return ram_save_multifd_page(pss->pss_channel, block, offset);
     }
-
     return ram_save_page(rs, pss);
 }
 
@@ -2485,28 +2621,7 @@ out:
     return ret;
 }
 
-/**
- * ram_save_host_page: save a whole host page
- *
- * Starting at *offset send pages up to the end of the current host
- * page. It's valid for the initial offset to point into the middle of
- * a host page in which case the remainder of the hostpage is sent.
- * Only dirty target pages are sent. Note that the host page size may
- * be a huge page for this block.
- *
- * The saving stops at the boundary of the used_length of the block
- * if the RAMBlock isn't a multiple of the host page size.
- *
- * The caller must be with ram_state.bitmap_mutex held to call this
- * function.  Note that this function can temporarily release the lock, but
- * when the function is returned it'll make sure the lock is still held.
- *
- * Returns the number of pages written or negative on error
- *
- * @rs: current RAM state
- * @pss: data about the page we want to send
- */
-static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss)
+static int ram_save_host_page_single(RAMState *rs, PageSearchStatus *pss)
 {
     bool page_dirty, preempt_active = postcopy_preempt_active();
     int tmppages, pages = 0;
@@ -2568,6 +2683,44 @@ static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss)
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
+ *
+ * The saving stops at the boundary of the used_length of the block
+ * if the RAMBlock isn't a multiple of the host page size.
+ *
+ * The caller must be with ram_state.bitmap_mutex held to call this
+ * function.  Note that this function can temporarily release the lock, but
+ * when the function is returned it'll make sure the lock is still held.
+ *
+ * Returns the number of pages written or negative on error
+ *
+ * @rs: current RAM state
+ * @pss: data about the page we want to send
+ */
+static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss)
+{
+#ifdef CONFIG_QATZIP
+    if (migrate_compress_with_qat()) {
+        if(pss->block == pss->last_sent_block) {
+            return ram_save_host_page_multiple(rs, pss);
+        } else {
+            return ram_save_host_page_single(rs, pss);
+        }
+    } else {
+#endif
+        return ram_save_host_page_single(rs, pss);
+#ifdef CONFIG_QATZIP
+    }
+#endif
+}
+
 /**
  * ram_find_and_save_block: finds a dirty page and sends it to f
  *
@@ -3275,7 +3428,6 @@ static int ram_save_setup(QEMUFile *f, void *opaque)
     WITH_RCU_READ_LOCK_GUARD() {
         qemu_put_be64(f, ram_bytes_total_with_ignored()
                          | RAM_SAVE_FLAG_MEM_SIZE);
-
         RAMBLOCK_FOREACH_MIGRATABLE(block) {
             qemu_put_byte(f, strlen(block->idstr));
             qemu_put_buffer(f, (uint8_t *)block->idstr, strlen(block->idstr));
@@ -3404,7 +3556,6 @@ static int ram_save_iterate(QEMUFile *f, void *opaque)
      * because of RDMA protocol.
      */
     ram_control_after_iterate(f, RAM_CONTROL_ROUND);
-
 out:
     if (ret >= 0
         && migration_is_setup_or_active(migrate_get_current()->state)) {
@@ -3711,21 +3862,27 @@ static void *do_data_decompress(void *opaque)
 
     qemu_mutex_lock(&param->mutex);
     while (!param->quit) {
-        if (param->des) {
+        if (param->block) {
             des = param->des;
             len = param->len;
-            param->des = 0;
             qemu_mutex_unlock(&param->mutex);
-
+#ifdef CONFIG_QATZIP
+        if (migrate_compress_with_qat()) {
+            do_decompress_ram_page_multiple(&param->qzsess, param->compbuf, param->decompbuf,
+                                             param->block, len, &param->mpa);
+        } else {
+#endif
             pagesize = TARGET_PAGE_SIZE;
-
             ret = qemu_uncompress_data(&param->stream, des, pagesize,
                                        param->compbuf, len);
             if (ret < 0 && migrate_get_current()->decompress_error_check) {
                 error_report("decompress data failed");
                 qemu_file_set_error(decomp_file, ret);
             }
-
+#ifdef  CONFIG_QATZIP
+        }
+#endif
+            param->block = NULL;
             qemu_mutex_lock(&decomp_done_lock);
             param->done = true;
             qemu_cond_signal(&decomp_done_cond);
@@ -3790,9 +3947,20 @@ static void compress_threads_load_cleanup(void)
         qemu_thread_join(decompress_threads + i);
         qemu_mutex_destroy(&decomp_param[i].mutex);
         qemu_cond_destroy(&decomp_param[i].cond);
-        inflateEnd(&decomp_param[i].stream);
-        g_free(decomp_param[i].compbuf);
-        decomp_param[i].compbuf = NULL;
+#ifdef CONFIG_QATZIP
+        if (migrate_compress_with_qat()) {
+            qzTeardownSession(&decomp_param[i].qzsess);
+            qzClose(&decomp_param[i].qzsess);
+            qzFree(decomp_param[i].compbuf);
+            qzFree(decomp_param[i].decompbuf);
+        } else {
+#endif
+            inflateEnd(&decomp_param[i].stream);
+            g_free(decomp_param[i].compbuf);
+            decomp_param[i].compbuf = NULL;
+#ifdef CONFIG_QATZIP
+        }
+#endif
     }
     g_free(decompress_threads);
     g_free(decomp_param);
@@ -3816,11 +3984,43 @@ static int compress_threads_load_setup(QEMUFile *f)
     qemu_cond_init(&decomp_done_cond);
     decomp_file = f;
     for (i = 0; i < thread_count; i++) {
-        if (inflateInit(&decomp_param[i].stream) != Z_OK) {
-            goto exit;
+#ifdef CONFIG_QATZIP
+        if (!migrate_compress_with_qat()) {
+#endif
+            if (inflateInit(&decomp_param[i].stream) != Z_OK) {
+                goto exit;
+            }
+            decomp_param[i].compbuf = g_malloc0(compressBound(TARGET_PAGE_SIZE));
+#ifdef CONFIG_QATZIP
+        } else {
+            int ret;
+            QzSessionParams_T sessParam;
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
-
-        decomp_param[i].compbuf = g_malloc0(compressBound(TARGET_PAGE_SIZE));
+#endif
         qemu_mutex_init(&decomp_param[i].mutex);
         qemu_cond_init(&decomp_param[i].cond);
         decomp_param[i].done = true;
@@ -3835,7 +4035,7 @@ exit:
     return -1;
 }
 
-static void decompress_data_with_multi_threads(QEMUFile *f,
+static void decompress_data_with_multi_threads(QEMUFile *f, RAMBlock *block,
                                                void *host, int len)
 {
     int idx, thread_count;
@@ -3847,9 +4047,21 @@ static void decompress_data_with_multi_threads(QEMUFile *f,
             if (decomp_param[idx].done) {
                 decomp_param[idx].done = false;
                 qemu_mutex_lock(&decomp_param[idx].mutex);
-                qemu_get_buffer(f, decomp_param[idx].compbuf, len);
-                decomp_param[idx].des = host;
-                decomp_param[idx].len = len;
+#ifdef CONFIG_QATZIP
+                if (migrate_compress_with_qat()) {
+                    qemu_get_multiple(f,
+                        &decomp_param[idx].mpa,
+                        decomp_param[idx].compbuf,
+                        &decomp_param[idx].len);
+                    decomp_param[idx].block = block;
+                } else {
+#endif
+                    qemu_get_buffer(f, decomp_param[idx].compbuf, len);
+                    decomp_param[idx].des = host;
+                    decomp_param[idx].len = len;
+#ifdef CONFIG_QATZIP
+                }
+#endif
                 qemu_cond_signal(&decomp_param[idx].cond);
                 qemu_mutex_unlock(&decomp_param[idx].mutex);
                 break;
@@ -4042,7 +4254,7 @@ int ram_load_postcopy(QEMUFile *f, int channel)
         void *place_source = NULL;
         RAMBlock *block = NULL;
         uint8_t ch;
-        int len;
+        int len = 0;
 
         addr = qemu_get_be64(f);
 
@@ -4154,14 +4366,16 @@ int ram_load_postcopy(QEMUFile *f, int channel)
             }
             break;
         case RAM_SAVE_FLAG_COMPRESS_PAGE:
-            tmp_page->all_zero = false;
-            len = qemu_get_be32(f);
-            if (len < 0 || len > compressBound(TARGET_PAGE_SIZE)) {
-                error_report("Invalid compressed data length: %d", len);
-                ret = -EINVAL;
-                break;
+            if(!migrate_compress_with_qat()) {
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
@@ -4303,10 +4517,10 @@ static int ram_load_precopy(QEMUFile *f)
             ret = -EINVAL;
             break;
         }
-
+        RAMBlock *block = NULL;
         if (flags & (RAM_SAVE_FLAG_ZERO | RAM_SAVE_FLAG_PAGE |
                      RAM_SAVE_FLAG_COMPRESS_PAGE | RAM_SAVE_FLAG_XBZRLE)) {
-            RAMBlock *block = ram_block_from_stream(mis, f, flags,
+            block = ram_block_from_stream(mis, f, flags,
                                                     RAM_CHANNEL_PRECOPY);
 
             host = host_from_ram_block_offset(block, addr);
@@ -4350,7 +4564,6 @@ static int ram_load_precopy(QEMUFile *f)
             /* Synchronize RAM block list */
             total_ram_bytes = addr;
             while (!ret && total_ram_bytes) {
-                RAMBlock *block;
                 char id[256];
                 ram_addr_t length;
 
@@ -4418,13 +4631,15 @@ static int ram_load_precopy(QEMUFile *f)
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
@@ -4737,3 +4952,325 @@ void ram_mig_init(void)
     register_savevm_live("ram", 0, 4, &savevm_ram_handlers, &ram_state);
     ram_block_notifier_add(&ram_mig_ram_notifier);
 }
+
+#ifdef CONFIG_QATZIP
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
+/**
+ * pss_find_next_multiple_dirty: find next multiple pages of current ramblock
+ *
+ * This function is similar to pss_find_next_dirty, and will update pss->page
+ * to point to the next MULTI_PAGE_NUM dirty page index within the ramblock to migrate,
+ * or the end of ramblock when nothing found.
+ *
+ * @pss: the current page search status
+ */
+static void pss_find_next_multiple_dirty(PageSearchStatus *pss)
+{
+    RAMBlock *rb = pss->block;
+    unsigned long size = rb->used_length >> TARGET_PAGE_BITS;
+    unsigned long *bitmap = rb->bmap;
+    uint64_t end, pages = 0;
+
+    pss->mpa.last_idx = 0;
+    pss->mpa.pages = 0;
+    uint64_t start = pss->page;
+    if (ramblock_is_ignored(rb)) {
+        /* Points directly to the end, so we know no dirty page */
+        pss->page = size;
+        return;
+    }
+
+    /*
+     * If during sending a host page, only look for dirty pages within the
+     * current host page being send.
+     */
+    if (pss->host_page_sending) {
+        assert(pss->host_page_end);
+        size = MIN(size, pss->host_page_end);
+    }
+
+    if (start >= size) {
+        pss->page = size;
+        return;
+    }
+
+    /* from the start pos to search the dirty bitmap*/
+    while ((pss->mpa.pages < MULTI_PAGE_NUM)) {
+        start = find_next_bit(bitmap, size, start);
+        /* if start>= size mean can't find any more*/
+        if (start >= size) {
+            pss->page = size;
+            return;
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
+        if ((pss->mpa.pages + pages) > MULTI_PAGE_NUM) {
+            pages = MULTI_PAGE_NUM - pss->mpa.pages;
+        }
+        multi_page_addr_put_one(&pss->mpa, start, pages);
+        start += pages;
+    }
+    pss->page = start;
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
+    if (compress_page_with_multi_thread(block, mpa, 0) > 0) {
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
+static void
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
+            qemu_file_set_error(migrate_get_current()->to_dst_file, -1);
+            error_report("multi compressed data failed!");
+            return;
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
+        qemu_file_set_error(migrate_get_current()->to_dst_file, rc);
+        error_report("multi compressed data failed!");
+        return;
+    }
+
+    qemu_put_be64(f, dest_size);
+    /* memory copy to the IO buffer */
+    qemu_put_buffer(f, compbuf, dest_size);
+
+    ram_counters.transferred += dest_size;
+    compression_counters.compressed_size += dest_size;
+    compression_counters.pages += mpa->pages;
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
+#endif
diff --git a/qapi/migration.json b/qapi/migration.json
index c84fa10e86..6459927c7a 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -644,6 +644,8 @@
 #                  no compression, 1 means the best compression speed, and 9 means best
 #                  compression ratio which will consume more CPU.
 #
+# @compress-with-qat: compress with qat on and off. (Since 8.1)
+#
 # @compress-threads: Set compression thread count to be used in live migration,
 #                    the compression thread count is an integer between 1 and 255.
 #
@@ -784,7 +786,7 @@
 { 'enum': 'MigrationParameter',
   'data': ['announce-initial', 'announce-max',
            'announce-rounds', 'announce-step',
-           'compress-level', 'compress-threads', 'decompress-threads',
+           'compress-level', 'compress-with-qat', 'compress-threads', 'decompress-threads',
            'compress-wait-thread', 'throttle-trigger-threshold',
            'cpu-throttle-initial', 'cpu-throttle-increment',
            'cpu-throttle-tailslow',
@@ -815,6 +817,8 @@
 #
 # @compress-level: compression level
 #
+# @compress-with-qat: compression with qat (Since 8.1)
+#
 # @compress-threads: compression thread count
 #
 # @compress-wait-thread: Controls behavior when all compression threads are
@@ -954,6 +958,7 @@
             '*announce-rounds': 'size',
             '*announce-step': 'size',
             '*compress-level': 'uint8',
+            '*compress-with-qat': 'bool',
             '*compress-threads': 'uint8',
             '*compress-wait-thread': 'bool',
             '*decompress-threads': 'uint8',
@@ -1152,6 +1157,7 @@
             '*announce-rounds': 'size',
             '*announce-step': 'size',
             '*compress-level': 'uint8',
+            '*compress-with-qat': 'bool',
             '*compress-threads': 'uint8',
             '*compress-wait-thread': 'bool',
             '*decompress-threads': 'uint8',
-- 
2.27.0


