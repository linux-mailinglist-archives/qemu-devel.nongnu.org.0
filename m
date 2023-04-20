Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06D8A6E8E8D
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 11:49:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppQu1-0007jF-SG; Thu, 20 Apr 2023 05:48:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1ppQtx-0007Y4-Ma
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 05:48:29 -0400
Received: from mout.web.de ([212.227.15.14])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1ppQtu-00085S-JJ
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 05:48:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1681984102; i=lukasstraub2@web.de;
 bh=dUcsp5TXjJ48yXDmXsxRqZtqur4JwDVKvi45MBfIF38=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=XHtoR46bXAhJIv1Q1xpbC93h5KAYLdVtP0Q04kowSR0u60uK4a63gIStkUkA9M70n
 8zdQid5GbhMLrqnL47J/ApruTg86ZNZ65qrgqqBUNQbbzcoON4hUwwEnfPCga1OZIX
 WuPud+4O3ILlCA2xUYMcz/EMxVNyLSTtSckK9UIk5u1M/wpBTnaeRFeqGTWMAxLgTy
 159YeCjRGqNBiaKBkt2KAxtfhDAe3J4hCrVqPEyn2TQkhIJK0c3wlF2cWFIH374Mcf
 U1mO9B+LN9SOsvHQCM0Be5KR/QE2uwkF0T/ZwuT2ImtcIS07lmPVuovMD5ak2tIxLl
 dGfkLx/dLeVSA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from gecko.fritz.box ([82.207.254.123]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MjPQ6-1qaLEN41Fa-00l0tp; Thu, 20
 Apr 2023 11:48:22 +0200
Date: Thu, 20 Apr 2023 11:48:20 +0200
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Cc: Juan Quintela <quintela@redhat.com>, Peter Xu <peterx@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>, Paolo
 Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2 09/13] ram.c: Move core compression code into its own file
Message-ID: <7b975990410b4e1a073abcc46df3f5cfab30dc05.1681983401.git.lukasstraub2@web.de>
In-Reply-To: <cover.1681983401.git.lukasstraub2@web.de>
References: <cover.1681983401.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/agoQQVyL5ote8N4/DuaQqqZ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:vKhVr5T9Aeih9+r0uqXGu/IzyX5gzD+5xwWKQA2LIXYIGYCaR60
 oRq53eSxi3rvYNkxUlgT0cLCxuR2O34MBp+BY2DfEorgh20iRwZdF9uRMd1Xo5IVWor198H
 hSRq1niLxuVrGiaY0BMmbNI0/J5pz3Hz7y9ANuDovpgesdnLvtrMYoY/VLbtZGEvdNwPMW7
 Re74iCyUX8+cXlR7jtCfA==
UI-OutboundReport: notjunk:1;M01:P0:F4MD+Fvwd3w=;2qv2Ofgcq33C5HGbbZ6IQ/d5aps
 xwGL4LJj+jSAVL3LTv/AlQDKks4Li1aItr63MniuVolEmkgyp7b7NETJ1lEhZ7YKWXTus3Mbe
 G2glXFdaikyMHt4SWGYn+LIvBLuAnoLWc7MikSxB1jFR8PXuH86bvkNNVHO6lkw62JN+CHOqI
 +0TI+MR9sd5eXu4UDazztcsZpWvmV7Ojfzamm2ayR/7yisZc3qTduygkIaXl1/sMs3/LuE8uL
 mYT7SLbbu8EZSC6purPwvrl/x8zy4cMeA9Ds7mElrVeM+pj3aOoT2cPSav09dnn+slgSrgBoY
 vpQzHiy62/6a0MJXj+Mv5r0uulfxHQ6VxeJm6TwHHVWmh/HYIOUEdlL9yF7fPk0UIPhCdEA94
 O3i1exp3nP3GVpQKtTnmZxrNIT22AEGxzO5qZmcmAXUDp//QVAGuuRdvHJz0DXBVAIRb+7Zmt
 t0xap4eJAZxR9o8Ri0HXUqo58FfIQP7QxuxlsdKZSACfZN5dkRcsEXo6Gd5M9+m6D1VX5Jgl6
 v7r6yF2xp0GKA9+mYXSFyA+l8JOtMtoroeuae2pIpyIvIs54G5N5SuyL1dvpTUgUm6tKoOmhR
 eRYU+n4TC7sSkkQx8QSTW3I2T2aqU/4YPiV7DE2wjuWrxtljsHUd6IjEKk3K0VF7U3elbFIpG
 +tmVwgGWSdsc9qnlyZli10/ldoAdDjpjWoF7jZpB1Bk8xk2YyqyTBBdIooorpn93wEMp5b5HU
 cEStzodop5Vh5SAMJz2HOiBTvvTZIfyodVb9y1WhShx+Z0MtnqIFz/qmS27QTLijOGDaHC34I
 6oE9f7++YKJVV7N82IoaFwLzMTfOw1ujkROtlKgDgAwyWFzca9QJT4MRhE+YScrH+HXTPL+5v
 UrbxiY1hOPpnB+9E6O8aaJbdr0GxTR9fnRVTmVlWe86eMnawvu3AIx0C5GxcYi7Mff8rynpoL
 Y4N3AnwQCu9IpsVD8bX25T+uKnk=
Received-SPF: pass client-ip=212.227.15.14; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--Sig_/agoQQVyL5ote8N4/DuaQqqZ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

No functional changes intended.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
---
 migration/meson.build    |   5 +-
 migration/ram-compress.c | 273 +++++++++++++++++++++++++++++++++++++++
 migration/ram-compress.h |  65 ++++++++++
 migration/ram.c          | 256 +-----------------------------------
 4 files changed, 343 insertions(+), 256 deletions(-)
 create mode 100644 migration/ram-compress.c
 create mode 100644 migration/ram-compress.h

diff --git a/migration/meson.build b/migration/meson.build
index 0d1bb9f96e..262e3c9754 100644
--- a/migration/meson.build
+++ b/migration/meson.build
@@ -36,4 +36,7 @@ endif
 softmmu_ss.add(when: zstd, if_true: files('multifd-zstd.c'))

 specific_ss.add(when: 'CONFIG_SOFTMMU',
-                if_true: files('dirtyrate.c', 'ram.c', 'target.c'))
+                if_true: files('dirtyrate.c',
+                               'ram.c',
+                               'ram-compress.c',
+                               'target.c'))
diff --git a/migration/ram-compress.c b/migration/ram-compress.c
new file mode 100644
index 0000000000..77902a1d65
--- /dev/null
+++ b/migration/ram-compress.c
@@ -0,0 +1,273 @@
+/*
+ * QEMU System Emulator
+ *
+ * Copyright (c) 2003-2008 Fabrice Bellard
+ * Copyright (c) 2011-2015 Red Hat Inc
+ *
+ * Authors:
+ *  Juan Quintela <quintela@redhat.com>
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a=
 copy
+ * of this software and associated documentation files (the "Software"), t=
o deal
+ * in the Software without restriction, including without limitation the r=
ights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or se=
ll
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included=
 in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS=
 OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OT=
HER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING=
 FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS =
IN
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
+                                           RAMBlock *block, ram_addr_t off=
set,
+                                           uint8_t *source_buf);
+
+static void *do_data_compress(void *opaque)
+{
+    CompressParam *param =3D opaque;
+    RAMBlock *block;
+    ram_addr_t offset;
+    CompressResult result;
+
+    qemu_mutex_lock(&param->mutex);
+    while (!param->quit) {
+        if (param->trigger) {
+            block =3D param->block;
+            offset =3D param->offset;
+            param->trigger =3D false;
+            qemu_mutex_unlock(&param->mutex);
+
+            result =3D do_compress_ram_page(param->file, &param->stream,
+                                          block, offset, param->originbuf);
+
+            qemu_mutex_lock(&comp_done_lock);
+            param->done =3D true;
+            param->result =3D result;
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
+    if (!migrate_use_compression() || !comp_param) {
+        return;
+    }
+
+    thread_count =3D migrate_compress_threads();
+    for (i =3D 0; i < thread_count; i++) {
+        /*
+         * we use it as a indicator which shows if the thread is
+         * properly init'd or not
+         */
+        if (!comp_param[i].file) {
+            break;
+        }
+
+        qemu_mutex_lock(&comp_param[i].mutex);
+        comp_param[i].quit =3D true;
+        qemu_cond_signal(&comp_param[i].cond);
+        qemu_mutex_unlock(&comp_param[i].mutex);
+
+        qemu_thread_join(compress_threads + i);
+        qemu_mutex_destroy(&comp_param[i].mutex);
+        qemu_cond_destroy(&comp_param[i].cond);
+        deflateEnd(&comp_param[i].stream);
+        g_free(comp_param[i].originbuf);
+        qemu_fclose(comp_param[i].file);
+        comp_param[i].file =3D NULL;
+    }
+    qemu_mutex_destroy(&comp_done_lock);
+    qemu_cond_destroy(&comp_done_cond);
+    g_free(compress_threads);
+    g_free(comp_param);
+    compress_threads =3D NULL;
+    comp_param =3D NULL;
+}
+
+int compress_threads_save_setup(void)
+{
+    int i, thread_count;
+
+    if (!migrate_use_compression()) {
+        return 0;
+    }
+    thread_count =3D migrate_compress_threads();
+    compress_threads =3D g_new0(QemuThread, thread_count);
+    comp_param =3D g_new0(CompressParam, thread_count);
+    qemu_cond_init(&comp_done_cond);
+    qemu_mutex_init(&comp_done_lock);
+    for (i =3D 0; i < thread_count; i++) {
+        comp_param[i].originbuf =3D g_try_malloc(TARGET_PAGE_SIZE);
+        if (!comp_param[i].originbuf) {
+            goto exit;
+        }
+
+        if (deflateInit(&comp_param[i].stream,
+                        migrate_compress_level()) !=3D Z_OK) {
+            g_free(comp_param[i].originbuf);
+            goto exit;
+        }
+
+        /* comp_param[i].file is just used as a dummy buffer to save data,
+         * set its ops to empty.
+         */
+        comp_param[i].file =3D qemu_file_new_output(
+            QIO_CHANNEL(qio_channel_null_new()));
+        comp_param[i].done =3D true;
+        comp_param[i].quit =3D false;
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
+                                           RAMBlock *block, ram_addr_t off=
set,
+                                           uint8_t *source_buf)
+{
+    uint8_t *p =3D block->host + offset;
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
+    ret =3D qemu_put_compression_data(f, stream, source_buf, TARGET_PAGE_S=
IZE);
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
+    param->result =3D RES_NONE;
+    param->block =3D NULL;
+    param->offset =3D 0;
+}
+
+void flush_compressed_data(int (send_queued_data(CompressParam *)))
+{
+    int idx, thread_count;
+
+    thread_count =3D migrate_compress_threads();
+
+    qemu_mutex_lock(&comp_done_lock);
+    for (idx =3D 0; idx < thread_count; idx++) {
+        while (!comp_param[idx].done) {
+            qemu_cond_wait(&comp_done_cond, &comp_done_lock);
+        }
+    }
+    qemu_mutex_unlock(&comp_done_lock);
+
+    for (idx =3D 0; idx < thread_count; idx++) {
+        qemu_mutex_lock(&comp_param[idx].mutex);
+        if (!comp_param[idx].quit) {
+            CompressParam *param =3D &comp_param[idx];
+            send_queued_data(param);
+            compress_reset_result(param);
+        }
+        qemu_mutex_unlock(&comp_param[idx].mutex);
+    }
+}
+
+static inline void set_compress_params(CompressParam *param, RAMBlock *blo=
ck,
+                                       ram_addr_t offset)
+{
+    param->block =3D block;
+    param->offset =3D offset;
+    param->trigger =3D true;
+}
+
+int compress_page_with_multi_thread(RAMBlock *block, ram_addr_t offset,
+                                int (send_queued_data(CompressParam *)))
+{
+    int idx, thread_count, pages =3D -1;
+    bool wait =3D migrate_compress_wait_thread();
+
+    thread_count =3D migrate_compress_threads();
+    qemu_mutex_lock(&comp_done_lock);
+retry:
+    for (idx =3D 0; idx < thread_count; idx++) {
+        if (comp_param[idx].done) {
+            CompressParam *param =3D &comp_param[idx];
+            qemu_mutex_lock(&param->mutex);
+            param->done =3D false;
+            send_queued_data(param);
+            compress_reset_result(param);
+            set_compress_params(param, block, offset);
+
+            qemu_cond_signal(&param->cond);
+            qemu_mutex_unlock(&param->mutex);
+            pages =3D 1;
+            break;
+        }
+    }
+
+    /*
+     * wait for the free thread if the user specifies 'compress-wait-threa=
d',
+     * otherwise we will post the page out in the main thread as normal pa=
ge.
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
+ * Permission is hereby granted, free of charge, to any person obtaining a=
 copy
+ * of this software and associated documentation files (the "Software"), t=
o deal
+ * in the Software without restriction, including without limitation the r=
ights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or se=
ll
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included=
 in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS=
 OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OT=
HER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING=
 FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS =
IN
+ * THE SOFTWARE.
+ */
+
+#ifndef QEMU_MIGRATION_COMPRESS_H
+#define QEMU_MIGRATION_COMPRESS_H
+
+#include "qemu-file.h"
+
+enum CompressResult {
+    RES_NONE =3D 0,
+    RES_ZEROPAGE =3D 1,
+    RES_COMPRESS =3D 2
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
index b95c5c720d..42d6a54132 100644
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
 #include "migration/register.h"
@@ -491,32 +491,6 @@ typedef struct MigrationOps MigrationOps;

 MigrationOps *migration_ops;

-CompressionStats compression_counters;
-
-enum CompressResult {
-    RES_NONE =3D 0,
-    RES_ZEROPAGE =3D 1,
-    RES_COMPRESS =3D 2
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
@@ -529,15 +503,6 @@ struct DecompressParam {
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
@@ -546,10 +511,6 @@ static QemuCond decomp_done_cond;

 static int ram_save_host_page_urgent(PageSearchStatus *pss);

-static CompressResult do_compress_ram_page(QEMUFile *f, z_stream *stream,
-                                           RAMBlock *block, ram_addr_t off=
set,
-                                           uint8_t *source_buf);
-
 /* NOTE: page is the PFN not real ram_addr_t. */
 static void pss_init(PageSearchStatus *pss, RAMBlock *rb, ram_addr_t page)
 {
@@ -568,39 +529,7 @@ static bool pss_overlap(PageSearchStatus *pss1, PageSe=
archStatus *pss2)
         (pss1->host_page_start =3D=3D pss2->host_page_start);
 }

-static void *do_data_compress(void *opaque)
-{
-    CompressParam *param =3D opaque;
-    RAMBlock *block;
-    ram_addr_t offset;
-    CompressResult result;

-    qemu_mutex_lock(&param->mutex);
-    while (!param->quit) {
-        if (param->trigger) {
-            block =3D param->block;
-            offset =3D param->offset;
-            param->trigger =3D false;
-            qemu_mutex_unlock(&param->mutex);
-
-            result =3D do_compress_ram_page(param->file, &param->stream,
-                                          block, offset, param->originbuf);
-
-            qemu_mutex_lock(&comp_done_lock);
-            param->done =3D true;
-            param->result =3D result;
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



@@ -608,44 +537,7 @@ static void *do_data_compress(void *opaque)



-static void compress_threads_save_cleanup(void)
-{
-    int i, thread_count;
-
-    if (!migrate_use_compression() || !comp_param) {
-        return;
-    }
-
-    thread_count =3D migrate_compress_threads();
-    for (i =3D 0; i < thread_count; i++) {
-        /*
-         * we use it as a indicator which shows if the thread is
-         * properly init'd or not
-         */
-        if (!comp_param[i].file) {
-            break;
-        }
-
-        qemu_mutex_lock(&comp_param[i].mutex);
-        comp_param[i].quit =3D true;
-        qemu_cond_signal(&comp_param[i].cond);
-        qemu_mutex_unlock(&comp_param[i].mutex);

-        qemu_thread_join(compress_threads + i);
-        qemu_mutex_destroy(&comp_param[i].mutex);
-        qemu_cond_destroy(&comp_param[i].cond);
-        deflateEnd(&comp_param[i].stream);
-        g_free(comp_param[i].originbuf);
-        qemu_fclose(comp_param[i].file);
-        comp_param[i].file =3D NULL;
-    }
-    qemu_mutex_destroy(&comp_done_lock);
-    qemu_cond_destroy(&comp_done_cond);
-    g_free(compress_threads);
-    g_free(comp_param);
-    compress_threads =3D NULL;
-    comp_param =3D NULL;
-}



@@ -653,49 +545,7 @@ static void compress_threads_save_cleanup(void)



-static int compress_threads_save_setup(void)
-{
-    int i, thread_count;

-    if (!migrate_use_compression()) {
-        return 0;
-    }
-    thread_count =3D migrate_compress_threads();
-    compress_threads =3D g_new0(QemuThread, thread_count);
-    comp_param =3D g_new0(CompressParam, thread_count);
-    qemu_cond_init(&comp_done_cond);
-    qemu_mutex_init(&comp_done_lock);
-    for (i =3D 0; i < thread_count; i++) {
-        comp_param[i].originbuf =3D g_try_malloc(TARGET_PAGE_SIZE);
-        if (!comp_param[i].originbuf) {
-            goto exit;
-        }
-
-        if (deflateInit(&comp_param[i].stream,
-                        migrate_compress_level()) !=3D Z_OK) {
-            g_free(comp_param[i].originbuf);
-            goto exit;
-        }
-
-        /* comp_param[i].file is just used as a dummy buffer to save data,
-         * set its ops to empty.
-         */
-        comp_param[i].file =3D qemu_file_new_output(
-            QIO_CHANNEL(qio_channel_null_new()));
-        comp_param[i].done =3D true;
-        comp_param[i].quit =3D false;
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

 /**
  * save_page_header: write page header to wire
@@ -1484,32 +1334,6 @@ static int ram_save_multifd_page(QEMUFile *file, RAM=
Block *block,
     return 1;
 }

-static CompressResult do_compress_ram_page(QEMUFile *f, z_stream *stream,
-                                           RAMBlock *block, ram_addr_t off=
set,
-                                           uint8_t *source_buf)
-{
-    uint8_t *p =3D block->host + offset;
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
-    ret =3D qemu_put_compression_data(f, stream, source_buf, TARGET_PAGE_S=
IZE);
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
@@ -1527,13 +1351,6 @@ update_compress_thread_counts(const CompressParam *p=
aram, int bytes_xmit)

 static bool save_page_use_compression(RAMState *rs);

-static inline void compress_reset_result(CompressParam *param)
-{
-    param->result =3D RES_NONE;
-    param->block =3D NULL;
-    param->offset =3D 0;
-}
-
 static int send_queued_data(CompressParam *param)
 {
     PageSearchStatus *pss =3D &ram_state->pss[RAM_CHANNEL_PRECOPY];
@@ -1568,31 +1385,6 @@ static int send_queued_data(CompressParam *param)
     return len;
 }

-static void flush_compressed_data(int (send_queued_data(CompressParam *)))
-{
-    int idx, thread_count;
-
-    thread_count =3D migrate_compress_threads();
-
-    qemu_mutex_lock(&comp_done_lock);
-    for (idx =3D 0; idx < thread_count; idx++) {
-        while (!comp_param[idx].done) {
-            qemu_cond_wait(&comp_done_cond, &comp_done_lock);
-        }
-    }
-    qemu_mutex_unlock(&comp_done_lock);
-
-    for (idx =3D 0; idx < thread_count; idx++) {
-        qemu_mutex_lock(&comp_param[idx].mutex);
-        if (!comp_param[idx].quit) {
-            CompressParam *param =3D &comp_param[idx];
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
@@ -1602,52 +1394,6 @@ static void ram_flush_compressed_data(RAMState *rs)
     flush_compressed_data(send_queued_data);
 }

-static inline void set_compress_params(CompressParam *param, RAMBlock *blo=
ck,
-                                       ram_addr_t offset)
-{
-    param->block =3D block;
-    param->offset =3D offset;
-    param->trigger =3D true;
-}
-
-static int compress_page_with_multi_thread(RAMBlock *block, ram_addr_t off=
set,
-                                int (send_queued_data(CompressParam *)))
-{
-    int idx, thread_count, pages =3D -1;
-    bool wait =3D migrate_compress_wait_thread();
-
-    thread_count =3D migrate_compress_threads();
-    qemu_mutex_lock(&comp_done_lock);
-retry:
-    for (idx =3D 0; idx < thread_count; idx++) {
-        if (comp_param[idx].done) {
-            CompressParam *param =3D &comp_param[idx];
-            qemu_mutex_lock(&param->mutex);
-            param->done =3D false;
-            send_queued_data(param);
-            compress_reset_result(param);
-            set_compress_params(param, block, offset);
-
-            qemu_cond_signal(&param->cond);
-            qemu_mutex_unlock(&param->mutex);
-            pages =3D 1;
-            break;
-        }
-    }
-
-    /*
-     * wait for the free thread if the user specifies 'compress-wait-threa=
d',
-     * otherwise we will post the page out in the main thread as normal pa=
ge.
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


--Sig_/agoQQVyL5ote8N4/DuaQqqZ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmRBCmQACgkQNasLKJxd
slhN9Q//ciDxSHYYU4yrh6gbtGEp3mcyok+VPRjtcC3s8RYMTkBA2IYWsXVtUv6C
5JmYyYVoI7xB69B1x0CEhhFLFlAJcgTdS6D224mabEtDvG3yvxI6h7qB64XhXmSi
co4hhOqUPdiGpPE30obmS0s3L4R6VvY5u5O2jLpGlBBvznYW87rccCaEv3LjuEpx
w8v0blTEn9hXuMZw5BrRnVB+pAqeIhiAv1A/yzkZpcMmDQM1BiLGoJPjhFpEMGON
Tet8QGqt0lhhxwXJrZ/FPzXvcweWA6kOiC/Rq1ZUsF8NiZt8G1FqFrUO8ES5OHS7
YOgaUN0Y1hvlFiMwfAjCd62aAh2P1aRY8Dn/cuHcUKWSvb102QEbmVE5xtHMPy1I
JIUUnXLT8bhyTwqANYtib6sfXxkP1NdHreLilg8HFMZbAmjeg+vGv/0enZMNYz3k
K1lKoBNY1l/LmBrjFSX6hCRqIV2YfyWx+npN6hWRgx2AoFksW6hgcypLafi0wVmv
RVCnkI8yAqxbiYkoDpxvUqHYifQqPdKyFE2yGPnbiNQ2Qm3eUTCHzuURtTnX56X2
wYTImd3ta51u3NTp8zDgfHmSsnrC9AKsvx9GoLQGyxzSQzPPWVVHzHoDSmVPjJfv
C3Orndkuz2f+Nyt/4V9j0G+tTuqpmvSsOHm81DRNlvnKxQoFEtM=
=neV7
-----END PGP SIGNATURE-----

--Sig_/agoQQVyL5ote8N4/DuaQqqZ--

