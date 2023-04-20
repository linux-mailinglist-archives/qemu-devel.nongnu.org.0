Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF116E8E98
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 11:50:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppQuI-0000vQ-Me; Thu, 20 Apr 2023 05:48:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1ppQuH-0000ms-9U
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 05:48:49 -0400
Received: from mout.web.de ([212.227.15.14])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1ppQu1-00086e-Q6
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 05:48:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1681984109; i=lukasstraub2@web.de;
 bh=Gsmw9eMQx3TZL80xvncJQwGRFpgxSnMogsfuhEDYJ94=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=NADXDMQG2c1QSRJip7DPXoRoAPljB1nuy6o41XyDxfLrw26hmg5Pum0F4o7dEb9Ki
 D5O1SS4pdJclahazqt4fURszgyHwo3LzllYtV/OCG/Dy9ONCtSDSwv0XNBnZpHkEV4
 DcADniX5p5VXRhsn10mts+P/4V7qxRZJEh5TBsu6BL4XcHEn9GDxzMCNJAbaKNXrXj
 TDTX0nBufPf+N1RUVSCkKLnj7s+x/lRRI/XGrdEt41m1xMY9gx1G/R9perHN3WtVwR
 ZI+L+zbdFX7PaxJxTlzP+QUcZn7xOBaLnJurrOz5I2fd25XZjEMEZpPN66ZIVkafNZ
 b1NUEvF8GZ4JA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from gecko.fritz.box ([82.207.254.123]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1M9ZZo-1puxDN1HFs-005ZNU; Thu, 20
 Apr 2023 11:48:29 +0200
Date: Thu, 20 Apr 2023 11:48:28 +0200
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Cc: Juan Quintela <quintela@redhat.com>, Peter Xu <peterx@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>, Paolo
 Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2 11/13] ram.c: Move core decompression code into its own file
Message-ID: <e0873b0c137cef2ca799d68bf850548d11b5d61a.1681983401.git.lukasstraub2@web.de>
In-Reply-To: <cover.1681983401.git.lukasstraub2@web.de>
References: <cover.1681983401.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/U6NL63nOtzsbCI8/s4_1BUL";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:TO3qrIqpNLkpbJqKIo0cBY+WVido7I0umxJ1sePQeFAJt2Y+UAi
 x81Y/Y4rV7G5BX4jFUmCbLtDFHhscY1kc4sX+XEb8nRC322cES8nj90UwNmFeAY+IMtA3vM
 XYbTXcJ3WilaWT0sPbBRvbSqZCCy5FykOAYgAXqdUYuEebtxsvcHmAO67EglZLiwUNHVamV
 O6UX6VDr66VmTssuOAo+Q==
UI-OutboundReport: notjunk:1;M01:P0:Z3MbpmsLamc=;uvEBGsrl00cD/+cjzRFV0fqSklX
 yaXwho8y5UnEFb3jlMBdSVtcd54oFdCefqrgedGsgBqBI+hqucqvYw0/THfWmK5nTKWwFq7GG
 ZjzOIwCrP3D2FW1U5biRnLaOc2H4WqVjCALPchfEI3sC7gn4yvCYUajtFS51HmdyeZP5hj4z5
 YtMR4kFTgkW3qCUlC9DY4+sOrO0ZBaSYAfVrBacze/Y+Tj/3V/c4qCQO3yjQrWrBXGMG3RTfg
 liO5O4zszbxFS5LPOLQHZAVKRENru57Tp6k0AxF5KcZL5XeUfV4KCZZGtquU+GdMuVLlD9CuB
 sR3VoGAkUWdcP+t3lz01OPZ4QYMOe7nGIuG9F66BWcFS9qfqRx/aANVo4ZzaFL1zBunmaS+kw
 Ue6yBjPjThl/qOfd81FxhWPAa9HTc+r2hg8yvP5g0lgB8uVM8DaSa7onglcb9SU5yHTbd+dvr
 yw2QwRHKw9ttfKR2zOTEdMOlS6lRJzV9Z3LVt5z4xBEToM00JX1N4Wf1JWq6CQVOiseJDIA/+
 nAY/9WJo8VvjglZ3H3Kd2GWpSXPWb5ZaXSTuVwxScMSBmBLpTXRLjGDuA+l+TyKYVgjubSul9
 vq7tYaGjiFoGx5CTuzxdiLBaPv0ycxoaxXc3tRmUIOLz4PM5Y/3dzsF7xNWayHUEiaOg/fdM5
 u0E2M2DLPO9M7+FydENNVALDJYmWh17m9rxe10a6kLMjB0XlQ2nQmmm6n8ZlGkz5I2w3fqv9b
 8649Tk1e7E2uQGKh3qYaSpbhKWWO0qKf4u9QB5l71PK6DRfGeob0ewr+Bk0lGJanj+foQ60Az
 189u6FcemnRDM+xa/PGRqqqGkhJBvk/5rBppTzFp3aBEyJJG8QUJzOD8kXUuyNRUTFkufiZX9
 rKI2StKAzTI0GymaSlaV7alBQ8c1nVjiZNVtYQKiSUFiLLUFL/94qYrXgfyQ6bmzunWxF6YXO
 0CA5lFR09Qa/c4+gKx44xA/LVgs=
Received-SPF: pass client-ip=212.227.15.14; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, SPF_HELO_NONE=0.001,
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

--Sig_/U6NL63nOtzsbCI8/s4_1BUL
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

No functional changes intended.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
---
 migration/ram-compress.c | 203 ++++++++++++++++++++++++++++++++++++++
 migration/ram-compress.h |   5 +
 migration/ram.c          | 204 ---------------------------------------
 3 files changed, 208 insertions(+), 204 deletions(-)

diff --git a/migration/ram-compress.c b/migration/ram-compress.c
index 77902a1d65..f75b8c3079 100644
--- a/migration/ram-compress.c
+++ b/migration/ram-compress.c
@@ -47,6 +47,24 @@ static QemuThread *compress_threads;
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
                                            RAMBlock *block, ram_addr_t off=
set,
                                            uint8_t *source_buf);
@@ -271,3 +289,188 @@ retry:

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
+    err =3D inflateReset(stream);
+    if (err !=3D Z_OK) {
+        return -1;
+    }
+
+    stream->avail_in =3D source_len;
+    stream->next_in =3D (uint8_t *)source;
+    stream->avail_out =3D dest_len;
+    stream->next_out =3D dest;
+
+    err =3D inflate(stream, Z_NO_FLUSH);
+    if (err !=3D Z_STREAM_END) {
+        return -1;
+    }
+
+    return stream->total_out;
+}
+
+static void *do_data_decompress(void *opaque)
+{
+    DecompressParam *param =3D opaque;
+    unsigned long pagesize;
+    uint8_t *des;
+    int len, ret;
+
+    qemu_mutex_lock(&param->mutex);
+    while (!param->quit) {
+        if (param->des) {
+            des =3D param->des;
+            len =3D param->len;
+            param->des =3D 0;
+            qemu_mutex_unlock(&param->mutex);
+
+            pagesize =3D TARGET_PAGE_SIZE;
+
+            ret =3D qemu_uncompress_data(&param->stream, des, pagesize,
+                                       param->compbuf, len);
+            if (ret < 0 && migrate_get_current()->decompress_error_check) {
+                error_report("decompress data failed");
+                qemu_file_set_error(decomp_file, ret);
+            }
+
+            qemu_mutex_lock(&decomp_done_lock);
+            param->done =3D true;
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
+    if (!migrate_use_compression()) {
+        return 0;
+    }
+
+    thread_count =3D migrate_decompress_threads();
+    qemu_mutex_lock(&decomp_done_lock);
+    for (idx =3D 0; idx < thread_count; idx++) {
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
+    if (!migrate_use_compression()) {
+        return;
+    }
+    thread_count =3D migrate_decompress_threads();
+    for (i =3D 0; i < thread_count; i++) {
+        /*
+         * we use it as a indicator which shows if the thread is
+         * properly init'd or not
+         */
+        if (!decomp_param[i].compbuf) {
+            break;
+        }
+
+        qemu_mutex_lock(&decomp_param[i].mutex);
+        decomp_param[i].quit =3D true;
+        qemu_cond_signal(&decomp_param[i].cond);
+        qemu_mutex_unlock(&decomp_param[i].mutex);
+    }
+    for (i =3D 0; i < thread_count; i++) {
+        if (!decomp_param[i].compbuf) {
+            break;
+        }
+
+        qemu_thread_join(decompress_threads + i);
+        qemu_mutex_destroy(&decomp_param[i].mutex);
+        qemu_cond_destroy(&decomp_param[i].cond);
+        inflateEnd(&decomp_param[i].stream);
+        g_free(decomp_param[i].compbuf);
+        decomp_param[i].compbuf =3D NULL;
+    }
+    g_free(decompress_threads);
+    g_free(decomp_param);
+    decompress_threads =3D NULL;
+    decomp_param =3D NULL;
+    decomp_file =3D NULL;
+}
+
+int compress_threads_load_setup(QEMUFile *f)
+{
+    int i, thread_count;
+
+    if (!migrate_use_compression()) {
+        return 0;
+    }
+
+    thread_count =3D migrate_decompress_threads();
+    decompress_threads =3D g_new0(QemuThread, thread_count);
+    decomp_param =3D g_new0(DecompressParam, thread_count);
+    qemu_mutex_init(&decomp_done_lock);
+    qemu_cond_init(&decomp_done_cond);
+    decomp_file =3D f;
+    for (i =3D 0; i < thread_count; i++) {
+        if (inflateInit(&decomp_param[i].stream) !=3D Z_OK) {
+            goto exit;
+        }
+
+        decomp_param[i].compbuf =3D g_malloc0(compressBound(TARGET_PAGE_SI=
ZE));
+        qemu_mutex_init(&decomp_param[i].mutex);
+        qemu_cond_init(&decomp_param[i].cond);
+        decomp_param[i].done =3D true;
+        decomp_param[i].quit =3D false;
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
+    thread_count =3D migrate_decompress_threads();
+    QEMU_LOCK_GUARD(&decomp_done_lock);
+    while (true) {
+        for (idx =3D 0; idx < thread_count; idx++) {
+            if (decomp_param[idx].done) {
+                decomp_param[idx].done =3D false;
+                qemu_mutex_lock(&decomp_param[idx].mutex);
+                qemu_get_buffer(f, decomp_param[idx].compbuf, len);
+                decomp_param[idx].des =3D host;
+                decomp_param[idx].len =3D len;
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
@@ -62,4 +62,9 @@ void flush_compressed_data(int (send_queued_data(Compress=
Param *)));
 int compress_page_with_multi_thread(RAMBlock *block, ram_addr_t offset,
                                 int (send_queued_data(CompressParam *)));

+int wait_for_decompress_done(void);
+void compress_threads_load_cleanup(void);
+int compress_threads_load_setup(QEMUFile *f);
+void decompress_data_with_multi_threads(QEMUFile *f, void *host, int len);
+
 #endif
diff --git a/migration/ram.c b/migration/ram.c
index 7be09c18e3..1e5dede6f0 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -491,24 +491,6 @@ typedef struct MigrationOps MigrationOps;

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
@@ -3467,192 +3449,6 @@ void ram_handle_compressed(void *host, uint8_t ch, =
uint64_t size)
     }
 }

-/* return the size after decompression, or negative value on error */
-static int
-qemu_uncompress_data(z_stream *stream, uint8_t *dest, size_t dest_len,
-                     const uint8_t *source, size_t source_len)
-{
-    int err;
-
-    err =3D inflateReset(stream);
-    if (err !=3D Z_OK) {
-        return -1;
-    }
-
-    stream->avail_in =3D source_len;
-    stream->next_in =3D (uint8_t *)source;
-    stream->avail_out =3D dest_len;
-    stream->next_out =3D dest;
-
-    err =3D inflate(stream, Z_NO_FLUSH);
-    if (err !=3D Z_STREAM_END) {
-        return -1;
-    }
-
-    return stream->total_out;
-}
-
-static void *do_data_decompress(void *opaque)
-{
-    DecompressParam *param =3D opaque;
-    unsigned long pagesize;
-    uint8_t *des;
-    int len, ret;
-
-    qemu_mutex_lock(&param->mutex);
-    while (!param->quit) {
-        if (param->des) {
-            des =3D param->des;
-            len =3D param->len;
-            param->des =3D 0;
-            qemu_mutex_unlock(&param->mutex);
-
-            pagesize =3D TARGET_PAGE_SIZE;
-
-            ret =3D qemu_uncompress_data(&param->stream, des, pagesize,
-                                       param->compbuf, len);
-            if (ret < 0 && migrate_get_current()->decompress_error_check) {
-                error_report("decompress data failed");
-                qemu_file_set_error(decomp_file, ret);
-            }
-
-            qemu_mutex_lock(&decomp_done_lock);
-            param->done =3D true;
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
-    if (!migrate_use_compression()) {
-        return 0;
-    }
-
-    thread_count =3D migrate_decompress_threads();
-    qemu_mutex_lock(&decomp_done_lock);
-    for (idx =3D 0; idx < thread_count; idx++) {
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
-    if (!migrate_use_compression()) {
-        return;
-    }
-    thread_count =3D migrate_decompress_threads();
-    for (i =3D 0; i < thread_count; i++) {
-        /*
-         * we use it as a indicator which shows if the thread is
-         * properly init'd or not
-         */
-        if (!decomp_param[i].compbuf) {
-            break;
-        }
-
-        qemu_mutex_lock(&decomp_param[i].mutex);
-        decomp_param[i].quit =3D true;
-        qemu_cond_signal(&decomp_param[i].cond);
-        qemu_mutex_unlock(&decomp_param[i].mutex);
-    }
-    for (i =3D 0; i < thread_count; i++) {
-        if (!decomp_param[i].compbuf) {
-            break;
-        }
-
-        qemu_thread_join(decompress_threads + i);
-        qemu_mutex_destroy(&decomp_param[i].mutex);
-        qemu_cond_destroy(&decomp_param[i].cond);
-        inflateEnd(&decomp_param[i].stream);
-        g_free(decomp_param[i].compbuf);
-        decomp_param[i].compbuf =3D NULL;
-    }
-    g_free(decompress_threads);
-    g_free(decomp_param);
-    decompress_threads =3D NULL;
-    decomp_param =3D NULL;
-    decomp_file =3D NULL;
-}
-
-static int compress_threads_load_setup(QEMUFile *f)
-{
-    int i, thread_count;
-
-    if (!migrate_use_compression()) {
-        return 0;
-    }
-
-    thread_count =3D migrate_decompress_threads();
-    decompress_threads =3D g_new0(QemuThread, thread_count);
-    decomp_param =3D g_new0(DecompressParam, thread_count);
-    qemu_mutex_init(&decomp_done_lock);
-    qemu_cond_init(&decomp_done_cond);
-    decomp_file =3D f;
-    for (i =3D 0; i < thread_count; i++) {
-        if (inflateInit(&decomp_param[i].stream) !=3D Z_OK) {
-            goto exit;
-        }
-
-        decomp_param[i].compbuf =3D g_malloc0(compressBound(TARGET_PAGE_SI=
ZE));
-        qemu_mutex_init(&decomp_param[i].mutex);
-        qemu_cond_init(&decomp_param[i].cond);
-        decomp_param[i].done =3D true;
-        decomp_param[i].quit =3D false;
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
-    thread_count =3D migrate_decompress_threads();
-    QEMU_LOCK_GUARD(&decomp_done_lock);
-    while (true) {
-        for (idx =3D 0; idx < thread_count; idx++) {
-            if (decomp_param[idx].done) {
-                decomp_param[idx].done =3D false;
-                qemu_mutex_lock(&decomp_param[idx].mutex);
-                qemu_get_buffer(f, decomp_param[idx].compbuf, len);
-                decomp_param[idx].des =3D host;
-                decomp_param[idx].len =3D len;
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


--Sig_/U6NL63nOtzsbCI8/s4_1BUL
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmRBCmwACgkQNasLKJxd
slgr2A//TRgD6sbVJHWSmyqfztVkTzJ8NTq512tCIOAxMUAsGlcjJa2o/Mehe7yi
DiNggTQGjU+wyBaQCzSvqmT0Zfe3u9HS3Q8e7HJ06Yfhi+5TBzbGptnq8SNrmWQ/
BwYAaK6YuDbSuVKJWgmnkencMn9fFLment9Z4dPN415rMl0rcIjI8S/YBSHE6zoN
xboW/5rKq0y/6iqM7lE7oOUL8KhsBDyyx5j+4B2U1KxbrDHGgpIzzNimh5sE99qd
TO3Kw+JvbifRu2oIna5KY9uYM+aEi/7qCYBcqYZuSJeRATojKd9y5qrNISB+LnvW
wAvI1lPxaMXTsqtqPg3nxEYkSFdg48fNSkExfT20yeUZ6yRb13Fm+5qE4ba/KooI
TWaMva1lzBPKJGlkSKe8MHagqtwxDJ5AeBYAwJVZAUJ/FC1KyREu8GH3kxMI47Wp
VKx1KZCeeTNABoRSNRJWBlSF5JruuqVCm4EN2TwtaPKZTNgLWagtYuKAt5Ht5Hwe
Fux0ARcR5dHgLFVplOMMbTbUG1EiGtM7pVNr1Bd4Njh/1BAK9GVo4Im528osBu15
786STHbM19Um42YVIw0XSBeAcTZPGKO3ckViyXT0J49ZWRbKyzPUjOlEYJdsysoG
+ieZylTk3e+NcI+4AIq734OEvK2Zkc/k35s9Cc5l1E7TRm9j1pg=
=exuG
-----END PGP SIGNATURE-----

--Sig_/U6NL63nOtzsbCI8/s4_1BUL--

