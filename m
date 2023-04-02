Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D1A6D39A5
	for <lists+qemu-devel@lfdr.de>; Sun,  2 Apr 2023 20:00:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pj1wX-0006nS-HQ; Sun, 02 Apr 2023 13:56:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1pj1wS-0006mh-ML
 for qemu-devel@nongnu.org; Sun, 02 Apr 2023 13:56:37 -0400
Received: from mout.web.de ([212.227.17.11])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1pj1wQ-00043o-0W
 for qemu-devel@nongnu.org; Sun, 02 Apr 2023 13:56:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1680458190; i=lukasstraub2@web.de;
 bh=XKpglTA6owmd537ugJcEj92M/s2rh7Eom5QGAWKbQ6o=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=Ktt7/GDehJXbd9v08QBdxo5546p0QqDcQuvFyB7O8OTHUH5UdoizQ0rGaM61RoMei
 VFvRSVA2d7VtK7Qw5Ls/s/MOGRPB5xmF8/OXwikxympYcr72l23ccFBS+SrJFltkJn
 y9KA/+6V9Ea8W663QP/hRgV0LnAMxYK7V599bPRnayicbbUba6lGKKqCtZa+CEUv1o
 WCUQH12wwurQ4/fg7G9UkK9o7rw1wdmzAucCkbVU4hrhUWUy9UPpm00BHNBFlQQVpg
 RpE4JRQT8EwkWAQthx/pazyADsjliP1OdUpEOyqxWNKhe9vr6uE3nD65fjTXIGHSTv
 F7ZLulQfB37oA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from gecko.fritz.box ([82.207.254.111]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MKuKF-1pzCHA3u6H-00KueF; Sun, 02
 Apr 2023 19:56:30 +0200
Date: Sun, 2 Apr 2023 17:56:28 +0000
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Juan Quintela
 <quintela@redhat.com>, Peter Xu <peterx@redhat.com>
Subject: [PATCH 08/14] ram.c: Move core compression code into its own file
Message-ID: <15e26fb46da7826061fd47b0d58943f3279c149b.1680457764.git.lukasstraub2@web.de>
In-Reply-To: <cover.1680457764.git.lukasstraub2@web.de>
References: <cover.1680457764.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/f/SlU3YG/rDJ05fFDeyeHV7";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:NSFHLn3l3BwlqSvzuU5igoVunj6T+a9dA9+bD5f0Q6kyTHQjybJ
 V1FuWM1KEMikFjLRZ7nPQkmldTIZxGnQJ3SWOpRFwv6kCvJBlI5Z3o4zVPZWKyPShAMnTK9
 h5RPPdRK6St9KRB+HbgWX87s20w38DZPMUvy86ZQZ7PF9iYOvqapkXxj7CU33gmiCC092QK
 LvXe8rnLNH60Be3+ideTg==
UI-OutboundReport: notjunk:1;M01:P0:V4lC6v6sKMM=;oQHthH925q7pzzI8LoaYWmPFUIg
 bUTfnciLHDoiFwJeL+hll524BCcVNCmIPlIcdb5Y+v9BI7tnrkRfmBmAWZ1puI+m3I472fStl
 ALyEJ06TVlmYJWBcPnE/L8uj4hhqfwLKrm2nUp+nNVt/WuGclPU1UnJ0WqMrHFnNhr1XoyHHI
 cbV/IS0Wv28zP6vgUL4DTpZUb1JGzBwOMfzvytL8Yw6jpjfheyVt8OaWPFftYcJtvuS1VYp58
 BWw1yNs9zm50Bfzk9zUX3unwZWghsr0fCgy9PkBKxZF7deeaJmG8jFwwz+Fv7zUgXKQzQG3jF
 phOU3xgqtqOqssTX1NPd/5/TygPn0VX1iaJmvuM7aqnR/HfFTYShUEgFje51mHMhb5KLUTZW9
 szp5ixZzn2lhYVTBN8kusv+mYLiDwzLVdjK0akyFtLjm5cX2gZJUNwIVxOoc4Jj62WEk5iKLi
 4sRmiqsYeslFuiEL67Lxgr0iPIZz499R5KxWbov3hsScjQfMRhely96Vd2HaSx8WrFoJVvwhX
 qZwHevCmSLpJlDBqOHh9ABm6Ii2G8p1UI1+mHWzldiY2/Dlmy0RUamJtrWWeA7dIoXUzJ2Vj1
 jNQLa572c55qt/WsrYyLBxHFZcmkTCE0jnOiI4VuEVMlLUraBR6hshx4ZJTAXhQLg3IjABTtr
 exdwff1p5+6wTP8vBhOfSUI6sivnP/M93wZOkkEMKAp6/HFRmIbRFFvpjzaJ2G9AuNsd0Zlzp
 zXJG7y9sgC7x2sVKpXDQuU6QHiBGD0OxKDrCg3gomQ9NTBPY70Kv3uQcPJ6lA2ff+rxJOfm1B
 ksiZj4+oIAOoQHM0aY625Zs2b9N92MBjYPWgmKlQGwqpCOsK5feTs++5jVthpPyFvHpaU3yyj
 U1Ad6MRSTQvnYCo1Ke0vTTDSq6PLp+uEF6Q4UJdAiABYJWvXs08GMAs9ifEsr65wFOElB/tR7
 C6wytUt/PuKBOvedxZH/K3s63wo=
Received-SPF: pass client-ip=212.227.17.11; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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

--Sig_/f/SlU3YG/rDJ05fFDeyeHV7
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

No functional changes intended.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
---
 migration/meson.build    |   5 +-
 migration/ram-compress.c | 273 +++++++++++++++++++++++++++++++++++++++
 migration/ram-compress.h |  65 ++++++++++
 migration/ram.c          | 255 +-----------------------------------
 4 files changed, 343 insertions(+), 255 deletions(-)
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
index 475c04a18b..114901241e 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -34,6 +34,7 @@
 #include "qemu/main-loop.h"
 #include "io/channel-null.h"
 #include "xbzrle.h"
+#include "ram-compress.h"
 #include "ram.h"
 #include "migration.h"
 #include "migration/register.h"
@@ -491,32 +492,6 @@ typedef struct MigrationOps MigrationOps;

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
@@ -529,15 +504,6 @@ struct DecompressParam {
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
@@ -546,10 +512,6 @@ static QemuCond decomp_done_cond;

 static int ram_save_host_page_urgent(PageSearchStatus *pss);

-static CompressResult do_compress_ram_page(QEMUFile *f, z_stream *stream,
-                                           RAMBlock *block, ram_addr_t off=
set,
-                                           uint8_t *source_buf);
-
 /* NOTE: page is the PFN not real ram_addr_t. */
 static void pss_init(PageSearchStatus *pss, RAMBlock *rb, ram_addr_t page)
 {
@@ -568,39 +530,7 @@ static bool pss_overlap(PageSearchStatus *pss1, PageSe=
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



@@ -608,44 +538,7 @@ static void *do_data_compress(void *opaque)



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



@@ -653,49 +546,7 @@ static void compress_threads_save_cleanup(void)



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
@@ -1484,32 +1335,6 @@ static int ram_save_multifd_page(QEMUFile *file, RAM=
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
@@ -1527,13 +1352,6 @@ update_compress_thread_counts(const CompressParam *p=
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
@@ -1568,31 +1386,6 @@ static int send_queued_data(CompressParam *param)
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
@@ -1602,52 +1395,6 @@ static void ram_flush_compressed_data(RAMState *rs)
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
2.30.2


--Sig_/f/SlU3YG/rDJ05fFDeyeHV7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmQpwcwACgkQNasLKJxd
slh/JA/8D5jp7qIDpx5UyNZtl3myYzo4nxQ34LDWNSZW5XxDre+vuSaMdUIpkh6+
MPzoVzjHc4mV6yV1iVpsZkOc+ndvfo0JS4IMPwnQTNcWRYRnOr3bOA4w133a7TQR
45uAJMmWiKy1OGXp4uWW930q0cK9LR6keR22KsOc/TuwMhF4NtQHG8/y3FBopHxT
EBHPST9yCu3sVbAPylbZIaTnHm35IcVd8wn/WTHb1TIpqQQ/siKAoMP87t+xMMK4
dXVXdN4YBxaamMKAUEHrQnDRqx+Z84pclbV8te5DYVtcIJ3b05YvnGl67ZVklDsc
rqAYsGu9O55K1bJB0+g/cFrR16fFXZLOzPd2PYH8qgzy2EQeCECAgCDXloGw3Ll7
Ts60U6p+gHETmVNQZH8RtKofqY5ZHeLDDHi4l8xWGufPyj4LESP7EvpRYMF2/jfO
O2DJlDZx11zOpX++MP6JkMzZX8H/wd56MA/bYktlvrlcMN7icd/VXJjX8nGqXedJ
XJM6xoixxN3jFXoihkmWNyzhDezeFH8Fh5Gh/lT2iax8GnTBw4z/WeoF7TTUXYXS
8k3l81aFFLDmKM+XjSyxeHmdhv8+V6HErFc9zRsvgkD7k3KjupD/m6ks84GpgcMd
pKxv2VdnNQpJl5o1vLKJlY8P6ICOlyukDsKGepqra+rJCAtDyqQ=
=NWMn
-----END PGP SIGNATURE-----

--Sig_/f/SlU3YG/rDJ05fFDeyeHV7--

