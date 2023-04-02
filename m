Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C9F6D399A
	for <lists+qemu-devel@lfdr.de>; Sun,  2 Apr 2023 19:58:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pj1wc-0006p4-Hl; Sun, 02 Apr 2023 13:56:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1pj1wZ-0006oc-AO
 for qemu-devel@nongnu.org; Sun, 02 Apr 2023 13:56:43 -0400
Received: from mout.web.de ([212.227.17.11])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1pj1wX-00044Q-13
 for qemu-devel@nongnu.org; Sun, 02 Apr 2023 13:56:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1680458196; i=lukasstraub2@web.de;
 bh=TBYuBZEdHM9itefC6FEFGIchlHsJurZstc3lDoPhNX8=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=WFz6bcsjbuRhzSK+AmoKeZVrLw79YejE+15zKwy2nuT5AAkN+i3ioiOlO2OMIKA0H
 T+lKmfs4nwDo+Go3nM3f0aGtZhT0MjUnKxGIyxHughBVo/wVTUaL+X/E4+dyfJo6e2
 nOXi8Im6JU5bex6nFSTE5K68SLHyUplnDoWcEqu2Pytllr03tzl+e63ZNdmKSrdoEU
 6dvSekRv/5Poz97iCu/w7G/b3CCIzqeV96UOZou/MbVmy35POyfEgaFfC9cpYFkzac
 Udvl8T/7OO+YerOB00npWGL26QH/fl9CUYgbnYCmMVcTZQJ1MM69ohIS0J8UiWLJPD
 VsFWn5dVd4qJg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from gecko.fritz.box ([82.207.254.111]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N45xz-1qQZxF2psH-00zprQ; Sun, 02
 Apr 2023 19:56:36 +0200
Date: Sun, 2 Apr 2023 17:56:35 +0000
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Juan Quintela
 <quintela@redhat.com>, Peter Xu <peterx@redhat.com>
Subject: [PATCH 10/14] ram.c: Move core decompression code into its own file
Message-ID: <2af9a607c95a9b543a213c7123be5c8f131e922c.1680457764.git.lukasstraub2@web.de>
In-Reply-To: <cover.1680457764.git.lukasstraub2@web.de>
References: <cover.1680457764.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/qD3MiitBfU791lsd+zCjl7K";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:BQJnpT5XPmoh82m+VPTKKT3XVYx2JVmWEfy23RI6qD82cw5hyAM
 uskcG5xkjB6X2/8o9njONJ9q4dXNVLad3GW/ZwHl8QE1USI5LquVCFsX0ujW9yAQeewtQT3
 qzXmZoBscqx8ak++qpvWDAX86mhKGjrh092vbQQsGHs9UinE0Dhvic0duwzjPM2Dehs5dOt
 9tnOdINxbzAvIJ00r0hVQ==
UI-OutboundReport: notjunk:1;M01:P0:vbmtOslda68=;0mpP3qqzNpRz24opK1+Umwbe6Y5
 DS2A3uEpXBvyfIXy2jQ/vGfxy2BeLYHhIU5D7iGhAnYSb3noXKjbzR08Ghb/+vkqRW5c1+8cR
 2ma+mdCwQOt+rVBV/rBDsEonkPCypZRt9tyG1rYnrfUFrHnNov9LxhrrDPIpsBTITbPA/JHg2
 OPXt0LUQanNZefHxsr2+sUa68lyTr5QU7v3zYh1D9PkUyL+aEAQTwcU0Hr/mYP4j1wS+b4KHE
 HnHW/A7lbUTOPpqqkJy2gBQMgJZNSUc+VQk1HcWkGv/9EsywcWowri1x2faUv0PaWjS+TgUrD
 qKAFskCnDjOkJdYaGHL9XZ+I3YlUYelbE1s7Ogi0oFfK6Aaj6/orUjhKOuHF485d6U26WFbIS
 bltibsY6hRKvFyOJcWfZJQZNc3j4IvbAbdFSS6pLMLr2r4EYGpkPo/lIAVWlI3DbGNDWvjuYO
 4VTfRwOc4omVmzivdZK/9AGXKSIYXKwoMwroUTqU8dfU7UIpDnlMFaABw+Ki7KdYw6MCVJ9WI
 s3Ql3WWQ6FWah1zgbvP2mdytbKrT5u+umDfNTE9dUtEiJyFeJtqB8hxYoHvCjJ3rSmI6qOCJr
 zLallzc0Y55n2DaLZZ6LAsbf3mVLTubeFrwNpO+LlSRt9tjaro+PGrHEK7LdQTWXNQcg2Ssf9
 YDArlPvZ9Zo1GYAxkkQLrdPyZyF4BewnEBAkZyqlJtXuKoyrTG5ITNItpXzRhFDbWCauxEIZA
 JyFQk6YqOTgWa51L0EGbBJui5yhp3lm0WFgs6TaNi8YT7Y/gKkz5WHswTly0X7i1bcVrDZGWu
 yga4fWlkN1nkLlUR8oPUch5yitSf2KPs5oUtWp4QrvBACsBf3eQNowvT/V2Xr9PMDHfJt7DHo
 uJxnaNc2E8ERmTfz+mRNoddWVZ4j0zgyJHohsDY/IBDk5240KkPeOImvlRkiScRcpd1uW7Hxo
 7JI90qIyhGiq59/T5jVnJpzKVlI=
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

--Sig_/qD3MiitBfU791lsd+zCjl7K
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

No functional changes intended.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
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
index 31b9b0b9ec..5a2486bf89 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -492,24 +492,6 @@ typedef struct MigrationOps MigrationOps;

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
2.30.2


--Sig_/qD3MiitBfU791lsd+zCjl7K
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmQpwdMACgkQNasLKJxd
slhBaw/9GKohUdW0XEF6eJcjZDKxRnlt25Svitvn05CiEyMinXiAu64eEJVJRRpL
D7pYsds2JcLwt8lbvM+PdC6emYpwcmC+wkvJeJpHxpIzesOfAHttKXnMeByErKt8
Nd0lfcd6GPrQzoFNfNaR+YnwtdeAz1Qx6Bh+seatFz03bD7UWvzfRnjRzQg46De4
nJiHQhsUNOokZIiwGQniviwlNTe88XsnnSfTj9cnkze/RRxrExRCwRKmQUaoBEZR
nay4cYsYKf5zIpjpn3kMC8TGR72LsWM5z42HhSLLQ5wgOdXl4B1o1XCzNIXXAyU9
RXh0PTZdVvWwFFjwpCdjVXcIBrKUJzKHdXmVGlrNwywOk4HAylPYff+yhwabje5J
lGf9slJSeV2qvZdDeBEgaVx5TIRrLegJR8W7Ere8KLfzPBEJz746o0H38MV8RXn6
oMbyyRCSWnWa9Ef3/9oIMtBMqQniqqgMxcukVmKAPG3z7++7qh4qAvDed3tJkTGj
MHZE0/bQVuJews0Z/PU8PiEbSW2yvrjLjt/aXSeVqoB28kxBYRFSyg+hzsV8ibaQ
rOmRdjM77urEgRfsb3iLm9/vKGxWNL2q9SvKBbG8aznyaxncHmyD2vDf6xWGreai
vtoGFfFnbgZDu8PgNvmln9U1+rPGfqxGuW8xp5cnikWM9mIAGwM=
=XF0p
-----END PGP SIGNATURE-----

--Sig_/qD3MiitBfU791lsd+zCjl7K--

