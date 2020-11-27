Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B3D2C61D1
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 10:36:18 +0100 (CET)
Received: from localhost ([::1]:41100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiaAr-0007ZR-IZ
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 04:36:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jinzeyu@huawei.com>)
 id 1kia77-0002ya-2T
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 04:32:26 -0500
Received: from szxga03-in.huawei.com ([45.249.212.189]:2182)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jinzeyu@huawei.com>)
 id 1kia73-0006rr-H2
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 04:32:24 -0500
Received: from DGGEMM406-HUB.china.huawei.com (unknown [172.30.72.53])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Cj8XP1RhKz4xBQ;
 Fri, 27 Nov 2020 17:31:49 +0800 (CST)
Received: from dggemi758-chm.china.huawei.com (10.1.198.144) by
 DGGEMM406-HUB.china.huawei.com (10.3.20.214) with Microsoft SMTP Server (TLS)
 id 14.3.487.0; Fri, 27 Nov 2020 17:32:17 +0800
Received: from localhost (10.174.187.211) by dggemi758-chm.china.huawei.com
 (10.1.198.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1913.5; Fri, 27
 Nov 2020 17:32:17 +0800
From: Zeyu Jin <jinzeyu@huawei.com>
To: <quintela@redhat.com>, <dgilbert@redhat.com>
Subject: [PATCH v2 4/6] migration: Add zstd support in multi-thread compression
Date: Fri, 27 Nov 2020 17:32:15 +0800
Message-ID: <20201127093215.2659-1-jinzeyu@huawei.com>
X-Mailer: git-send-email 2.28.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.187.211]
X-ClientProxiedBy: dggemi702-chm.china.huawei.com (10.3.20.101) To
 dggemi758-chm.china.huawei.com (10.1.198.144)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.189; envelope-from=jinzeyu@huawei.com;
 helo=szxga03-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Ying Fang <fangying1@huawei.com>, qemu-devel@nongnu.org,
 Zeyu Jin <jinzeyu@huawei.com>, zhang.zhanghailiang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch enables zstd option in multi-thread compression.

Signed-off-by: Zeyu Jin <jinzeyu@huawei.com>
Signed-off-by: Ying Fang <fangying1@huawei.com>
---
 hw/core/qdev-properties-system.c |   2 +-
 migration/ram.c                  | 128 ++++++++++++++++++++++++++++++-
 qapi/migration.json              |   2 +-
 3 files changed, 129 insertions(+), 3 deletions(-)

diff --git a/hw/core/qdev-properties-system.c b/hw/core/qdev-properties-system.c
index a582721a7b..b369187bdc 100644
--- a/hw/core/qdev-properties-system.c
+++ b/hw/core/qdev-properties-system.c
@@ -667,7 +667,7 @@ const PropertyInfo qdev_prop_multifd_compression = {
 const PropertyInfo qdev_prop_compress_method = {
     .name = "CompressMethod",
     .description = "multi-thread compression method, "
-                   "zlib",
+                   "zlib/zstd",
     .enum_table = &CompressMethod_lookup,
     .get = qdev_propinfo_get_enum,
     .set = qdev_propinfo_set_enum,
diff --git a/migration/ram.c b/migration/ram.c
index 6f7fab7d4f..2550225d9a 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -57,6 +57,10 @@
 #include "qemu/iov.h"
 #include "multifd.h"
 
+#ifdef CONFIG_ZSTD
+#include <zstd.h>
+#include <zstd_errors.h>
+#endif
 /***********************************************************/
 /* ram save/restore */
 
@@ -424,6 +428,11 @@ struct CompressParam {
     /* for zlib compression */
     z_stream stream;
 
+#ifdef CONFIG_ZSTD
+    ZSTD_CStream *zstd_cs;
+    ZSTD_inBuffer in;
+    ZSTD_outBuffer out;
+#endif
 };
 typedef struct CompressParam CompressParam;
 
@@ -438,6 +447,12 @@ struct DecompressParam {
 
     /* for zlib compression */
     z_stream stream;
+
+#ifdef CONFIG_ZSTD
+    ZSTD_DStream *zstd_ds;
+    ZSTD_inBuffer in;
+    ZSTD_outBuffer out;
+#endif
 };
 typedef struct DecompressParam DecompressParam;
 
@@ -571,6 +586,102 @@ static int zlib_check_len(int len)
     return len < 0 || len > compressBound(TARGET_PAGE_SIZE);
 }
 
+#ifdef CONFIG_ZSTD
+static int zstd_save_setup(CompressParam *param)
+{
+    int res;
+    param->zstd_cs = ZSTD_createCStream();
+    if (!param->zstd_cs) {
+        return -1;
+    }
+    res = ZSTD_initCStream(param->zstd_cs, migrate_compress_level());
+    if (ZSTD_isError(res)) {
+        return -1;
+    }
+    return 0;
+}
+static void zstd_save_cleanup(CompressParam *param)
+{
+    ZSTD_freeCStream(param->zstd_cs);
+    param->zstd_cs = NULL;
+}
+static ssize_t zstd_compress_data(CompressParam *param, size_t size)
+{
+    int ret;
+    uint8_t *dest = NULL;
+    uint8_t *p = param->originbuf;
+    QEMUFile *f = f = param->file;
+    ssize_t blen = qemu_put_compress_start(f, &dest);
+    if (blen < ZSTD_compressBound(size)) {
+        return -1;
+    }
+    param->out.dst = dest;
+    param->out.size = blen;
+    param->out.pos = 0;
+    param->in.src = p;
+    param->in.size = size;
+    param->in.pos = 0;
+    do {
+        ret = ZSTD_compressStream2(param->zstd_cs, &param->out,
+                                   &param->in, ZSTD_e_end);
+    } while (ret > 0 && (param->in.size - param->in.pos > 0)
+            && (param->out.size - param->out.pos > 0));
+    if (ret > 0 && (param->in.size - param->in.pos > 0)) {
+        return -1;
+    }
+    if (ZSTD_isError(ret)) {
+        return -1;
+    }
+    blen = param->out.pos;
+    qemu_put_compress_end(f, blen);
+    return blen + sizeof(int32_t);
+}
+static int zstd_load_setup(DecompressParam *param)
+{
+    int ret;
+    param->zstd_ds = ZSTD_createDStream();
+    if (!param->zstd_ds) {
+        return -1;
+    }
+    ret = ZSTD_initDStream(param->zstd_ds);
+    if (ZSTD_isError(ret)) {
+        return -1;
+    }
+    return 0;
+}
+static void zstd_load_cleanup(DecompressParam *param)
+{
+    ZSTD_freeDStream(param->zstd_ds);
+    param->zstd_ds = NULL;
+}
+static int
+zstd_decompress_data(DecompressParam *param, uint8_t *dest, size_t size)
+{
+    int ret;
+    param->out.dst = dest;
+    param->out.size = size;
+    param->out.pos = 0;
+    param->in.src = param->compbuf;
+    param->in.size = param->len;
+    param->in.pos = 0;
+    do {
+        ret = ZSTD_decompressStream(param->zstd_ds, &param->out, &param->in);
+    } while (ret > 0 && (param->in.size - param->in.pos > 0)
+                    && (param->out.size - param->out.pos > 0));
+    if (ret > 0 && (param->in.size - param->in.pos > 0)) {
+        return -1;
+    }
+    if (ZSTD_isError(ret)) {
+        return -1;
+    }
+    return ret;
+}
+static int zstd_check_len(int len)
+{
+    return len < 0 || len > ZSTD_compressBound(TARGET_PAGE_SIZE);
+}
+#endif
+
 static int set_compress_ops(void)
 {
    compress_ops = g_new0(MigrationCompressOps, 1);
@@ -581,9 +692,16 @@ static int set_compress_ops(void)
         compress_ops->save_cleanup = zlib_save_cleanup;
         compress_ops->compress_data = zlib_compress_data;
         break;
+#ifdef CONFIG_ZSTD
+    case COMPRESS_METHOD_ZSTD:
+        compress_ops->save_setup = zstd_save_setup;
+        compress_ops->save_cleanup = zstd_save_cleanup;
+        compress_ops->compress_data = zstd_compress_data;
+        break;
+#endif
     default:
         return -1;
-    }
+   }
 
     return 0;
 }
@@ -599,6 +717,14 @@ static int set_decompress_ops(void)
         decompress_ops->decompress_data = zlib_decompress_data;
         decompress_ops->check_len = zlib_check_len;
         break;
+#ifdef CONFIG_ZSTD
+    case COMPRESS_METHOD_ZSTD:
+        decompress_ops->load_setup = zstd_load_setup;
+        decompress_ops->load_cleanup = zstd_load_cleanup;
+        decompress_ops->decompress_data = zstd_decompress_data;
+        decompress_ops->check_len = zstd_check_len;
+        break;
+#endif
     default:
         return -1;
    }
diff --git a/qapi/migration.json b/qapi/migration.json
index 2ed6a55b92..883e597ae3 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -536,7 +536,7 @@
 #
 ##
 { 'enum': 'CompressMethod',
-  'data': [ 'zlib' ] }
+  'data': [ 'zlib', { 'name': 'zstd', 'if': 'defined(CONFIG_ZSTD)' } ] }
 
 ##
 # @BitmapMigrationBitmapAlias:
-- 
2.27.0


