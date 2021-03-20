Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2582F342B6E
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Mar 2021 10:35:36 +0100 (CET)
Received: from localhost ([::1]:49428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNY19-0004gT-7Y
	for lists+qemu-devel@lfdr.de; Sat, 20 Mar 2021 05:35:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pj@patrikjanousek.cz>)
 id 1lNXzC-0003ov-RT
 for qemu-devel@nongnu.org; Sat, 20 Mar 2021 05:33:35 -0400
Received: from mxe2.seznam.cz ([2a02:598:2::34]:51339)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pj@patrikjanousek.cz>)
 id 1lNXzA-0005ce-2i
 for qemu-devel@nongnu.org; Sat, 20 Mar 2021 05:33:34 -0400
Received: from email.seznam.cz
 by email-smtpc29a.ng.seznam.cz (email-smtpc29a.ng.seznam.cz [10.23.18.42])
 id 6da514190daa33ab6b965f0e; Sat, 20 Mar 2021 10:33:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=emailprofi.seznam.cz; s=beta; t=1616232808;
 bh=LHBYKDT9hBV4qnHLdN4IFa4laURN8Txokf9XBcSA0Ww=;
 h=Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:
 References:MIME-Version:Content-Type:Content-Transfer-Encoding;
 b=L6Rqpt1jVlWYp2cuqwsXLlyJB1xWjsDIN3rx3h4RC3W9gRtTsxz7m3d+A6GMZquoj
 Lj2xRblLh8b1dVpNRbu31gG+Z4fUyvk/LAJTmRGKzuhez9wv64Zq+j39e3NybLch1i
 reIoTX2AY7bzLrVFDX2LWgEEjL309DSKr5Udi+Xo=
Received: from archlinux.localdomain (2a01:510:d502:b200:c1b:ad27:bde0:341a
 [2a01:510:d502:b200:c1b:ad27:bde0:341a])
 by email-relay4.ng.seznam.cz (Seznam SMTPD 1.3.124) with ESMTP;
 Sat, 20 Mar 2021 10:33:25 +0100 (CET)  
From: =?UTF-8?q?Patrik=20Janou=C5=A1ek?= <pj@patrikjanousek.cz>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] block/raw: added support of persistent dirty bitmaps
Date: Sat, 20 Mar 2021 10:32:34 +0100
Message-Id: <20210320093235.461485-2-pj@patrikjanousek.cz>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210320093235.461485-1-pj@patrikjanousek.cz>
References: <20210320093235.461485-1-pj@patrikjanousek.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:598:2::34; envelope-from=pj@patrikjanousek.cz;
 helo=mxe2.seznam.cz
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?q?Patrik=20Janou=C5=A1ek?= <pj@patrikjanousek.cz>,
 lmatejka@kiv.zcu.cz
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Current implementation of dirty bitmaps for raw format is very
limited, because those bitmaps cannot be persistent. Basically it
makes sense, because the raw format doesn't have space where could
be dirty bitmap stored when QEMU is offline. This patch solves it
by storing content of every dirty bitmap in separate file on the
host filesystem.

However, this only solves one part of the problem. We also have to
store information about the existence of the dirty bitmap. This is
solved by adding custom options, that stores all required metadata
about dirty bitmap (filename where is the bitmap stored on the
host filesystem, granularity, persistence, etc.).

Signed-off-by: Patrik Janoušek <pj@patrikjanousek.cz>
---
 block/meson.build         |   1 +
 block/raw-format-bitmap.c | 163 ++++++++++++++++++++++++
 block/raw-format.c        | 256 ++++++++++++++++++++++++++++++++++++--
 block/raw-format.h        |  50 ++++++++
 4 files changed, 459 insertions(+), 11 deletions(-)
 create mode 100644 block/raw-format-bitmap.c
 create mode 100644 block/raw-format.h

diff --git a/block/meson.build b/block/meson.build
index 5dcc1e5cce..f163095574 100644
--- a/block/meson.build
+++ b/block/meson.build
@@ -30,6 +30,7 @@ block_ss.add(files(
   'qcow2.c',
   'quorum.c',
   'raw-format.c',
+  'raw-format-bitmap.c',
   'snapshot.c',
   'throttle-groups.c',
   'throttle.c',
diff --git a/block/raw-format-bitmap.c b/block/raw-format-bitmap.c
new file mode 100644
index 0000000000..f622f0a700
--- /dev/null
+++ b/block/raw-format-bitmap.c
@@ -0,0 +1,163 @@
+#include <stdio.h>
+
+#include "qemu/osdep.h"
+#include "block/block_int.h"
+
+#include "raw-format.h"
+#include "qapi/error.h"
+
+bool coroutine_fn raw_co_can_store_new_dirty_bitmap(BlockDriverState *bs,
+                                                    const char *name,
+                                                    uint32_t granularity,
+                                                    Error **errp)
+{
+    BDRVRawState *s = bs->opaque;
+
+    RawDirtyBitmapOpts *opts;
+    BdrvDirtyBitmap *bm;
+    FILE *fp;
+    bool file_exists;
+    for (int i = 0; i < s->rdbol.n; i++) {
+        opts = &s->rdbol.opts[i];
+        bm = bdrv_find_dirty_bitmap(bs, name);
+        if (!bm) {
+            error_setg(errp, "Dirty bitmap %s does not exists.", name);
+            return false;
+        }
+
+        if (!opts->has_filename) {
+            error_setg(errp, "Dirty bitmap does not have filename defined.");
+            return false;
+        }
+
+        if (!bdrv_dirty_bitmap_get_persistence(bm)) continue;
+        if (strcmp(opts->name, bdrv_dirty_bitmap_name(bm)) != 0)
+            continue;
+
+        file_exists = false;
+        fp = fopen(opts->filename, "r");
+        if (fp) {
+            file_exists = true;
+            fclose(false);
+        }
+
+        fp = fopen(opts->filename, "a");
+        if (!fp) {
+            error_setg(errp, "Unable to open file %s for read and write",
+                       opts->filename);
+            return false;
+        } else {
+            fclose(fp);
+            if (!file_exists) unlink(opts->filename);
+        }
+    }
+
+    return true;
+}
+
+bool raw_supports_persistent_dirty_bitmap(BlockDriverState *bs)
+{
+    return true;
+}
+
+int coroutine_fn raw_co_remove_persistent_dirty_bitmap(BlockDriverState *bs,
+                                                       const char *name,
+                                                       Error **errp)
+{
+    BDRVRawState *s = bs->opaque;
+
+    RawDirtyBitmapOpts *opts;
+    BdrvDirtyBitmap *bm;
+    for (int i = 0; i < s->rdbol.n; i++) {
+        opts = &s->rdbol.opts[i];
+        bm = bdrv_find_dirty_bitmap(bs, name);
+        if (!bm) {
+            error_setg(errp, "Dirty bitmap %s does not exists.", name);
+            return false;
+        }
+
+        if (!opts->has_filename) {
+            error_setg(errp, "Dirty bitmap does not have filename defined.");
+            return false;
+        }
+
+        if (!bdrv_dirty_bitmap_get_persistence(bm)) continue;
+        if (strcmp(opts->name, bdrv_dirty_bitmap_name(bm)) != 0)
+            continue;
+
+        return unlink(opts->filename);
+    }
+
+    return 0;
+}
+
+static void load_bitmap(BdrvDirtyBitmap *bm, FILE *fpbm) {
+    uint64_t bm_size = bdrv_dirty_bitmap_size(bm);
+    uint64_t tb_size = bdrv_dirty_bitmap_serialization_size(bm, 0, bm_size);
+    uint8_t *buf = g_malloc(tb_size);
+    size_t n = fread(buf, 1, tb_size, fpbm);
+
+    assert(n == tb_size);
+
+    bdrv_dirty_bitmap_deserialize_part(bm, buf, 0, bm_size, false);
+    bdrv_dirty_bitmap_deserialize_finish(bm);
+
+    g_free(buf);
+}
+
+void raw_load_persistent_dirty_bitmap(BlockDriverState *bs, FILE *fp,
+                                      uint32_t granularity, char* name,
+                                      bool persistent, bool disabled,
+                                      Error **errp)
+{
+    BdrvDirtyBitmap *bm;
+
+    bm = bdrv_create_dirty_bitmap(bs, granularity, name, errp);
+    if (bm) {
+        bdrv_dirty_bitmap_set_persistence(bm, persistent);
+
+        if (disabled)
+            bdrv_disable_dirty_bitmap(bm);
+    }
+
+    if (fp) {
+        load_bitmap(bm, fp);
+    }
+}
+
+static void store_bitmap(BdrvDirtyBitmap *bm, FILE *fpbm) {
+    uint64_t bm_size = bdrv_dirty_bitmap_size(bm);
+    uint64_t tb_size = bdrv_dirty_bitmap_serialization_size(bm, 0, bm_size);
+    uint8_t *buf = g_malloc(tb_size);
+
+    bdrv_dirty_bitmap_serialize_part(bm, buf, 0, bm_size);
+
+    fwrite(buf, 1, tb_size, fpbm);
+
+    g_free(buf);
+}
+
+void raw_store_persistent_dirty_bitmaps(BlockDriverState *bs, Error **errp)
+{
+    BDRVRawState *s = bs->opaque;
+
+    RawDirtyBitmapOpts *opts;
+    BdrvDirtyBitmap *bm;
+    for (int i = 0; i < s->rdbol.n; i++) {
+        opts = &s->rdbol.opts[i];
+
+        FOR_EACH_DIRTY_BITMAP(bs, bm) {
+            if (!bdrv_dirty_bitmap_get_persistence(bm)) continue;
+            assert(opts->has_filename);
+
+            if (strcmp(opts->filename, bdrv_dirty_bitmap_name(bm)) != 0)
+                continue;
+
+            FILE *fp = fopen(opts->filename, "w");
+            if(fp) {
+                store_bitmap(bm, fp);
+                fclose(fp);
+            }
+        }
+    }
+}
diff --git a/block/raw-format.c b/block/raw-format.c
index 42ec50802b..901f7a9c33 100644
--- a/block/raw-format.c
+++ b/block/raw-format.c
@@ -28,15 +28,13 @@
 
 #include "qemu/osdep.h"
 #include "block/block_int.h"
+#include "block/qdict.h"
 #include "qapi/error.h"
+#include "qapi/qmp/qlist.h"
 #include "qemu/module.h"
 #include "qemu/option.h"
 
-typedef struct BDRVRawState {
-    uint64_t offset;
-    uint64_t size;
-    bool has_size;
-} BDRVRawState;
+#include "raw-format.h"
 
 static const char *const mutable_opts[] = { "offset", "size", NULL };
 
@@ -58,6 +56,40 @@ static QemuOptsList raw_runtime_opts = {
     },
 };
 
+static QemuOptsList raw_dirty_bitmap_opts = {
+    .name = "raw-dirty-bitmap-opts",
+    .head = QTAILQ_HEAD_INITIALIZER(raw_dirty_bitmap_opts.head),
+    .desc = {
+        {
+            .name = "filename",
+            .type = QEMU_OPT_STRING,
+            .help = "path to the persistent dirty bitmap file",
+        },
+        {
+            .name = "name",
+            .type = QEMU_OPT_STRING,
+            .help = "name of the dirty bitmap",
+        },
+        {
+            .name = "granularity",
+            .type = QEMU_OPT_NUMBER,
+            .help = "granularity of the dirty bitmap",
+        },
+        {
+            .name = "persistent",
+            .type = QEMU_OPT_BOOL,
+            .help = "indicates whether the dirty bitmap is persistent"
+                    "(requires filename)",
+        },
+        {
+            .name = "disabled",
+            .type = QEMU_OPT_BOOL,
+            .help = "indicates whether the dirty bitmap is disabled",
+        },
+        { /* end of list */ }
+    },
+};
+
 static QemuOptsList raw_create_opts = {
     .name = "raw-create-opts",
     .head = QTAILQ_HEAD_INITIALIZER(raw_create_opts.head),
@@ -71,8 +103,144 @@ static QemuOptsList raw_create_opts = {
     }
 };
 
+static int raw_read_dirty_bitmap_options(QDict *options,
+                                         bool *has_filename, char **filename,
+                                         bool *has_name, char **name,
+                                         bool *has_granularity,
+                                         uint32_t *granularity,
+                                         bool *has_persistent, bool *persistent,
+                                         bool *has_disabled, bool *disabled,
+                                         Error **errp)
+{
+    QemuOpts *opts = NULL;
+    int ret;
+
+    opts = qemu_opts_create(&raw_dirty_bitmap_opts, NULL, 0, &error_abort);
+    if (!qemu_opts_absorb_qdict(opts, options, errp)) {
+        ret = -EINVAL;
+        goto end;
+    }
+
+    *has_filename = qemu_opt_find(opts, "filename");
+    *filename = g_strdup(qemu_opt_get(opts, "filename"));
+    *has_name = qemu_opt_find(opts, "name");
+    *name = g_strdup(qemu_opt_get(opts, "name"));
+    *has_granularity = qemu_opt_find(opts, "granularity");
+    *granularity = qemu_opt_get_number(opts, "granularity", 65536);
+    *has_persistent = qemu_opt_find(opts, "persistent");
+    *persistent = qemu_opt_get_bool(opts, "persistent", false);
+    *has_disabled = qemu_opt_find(opts, "disabled");
+    *disabled = qemu_opt_get_bool(opts, "disabled", false);
+
+    ret = 0;
+    end:
+    qemu_opts_del(opts);
+    return ret;
+}
+
+static int raw_read_dirty_bitmaps_options(QDict *options,
+                                          RawDirtyBitmapOptsList *rdbol,
+                                          Error **errp)
+{
+    int ret;
+    QDict *db_options = NULL;
+
+    QObject *qo;
+    char static_prefix[] = "dirty-bitmaps.";
+    uint static_prefix_len = strlen(static_prefix);
+    uint key_max_len = static_prefix_len;
+    char *key = g_malloc0(key_max_len + 1);
+    int i = 0, j;
+    char ibuff[16];
+    size_t nkey, nname;
+    *rdbol = (RawDirtyBitmapOptsList){
+        .n = 0,
+        .opts = NULL,
+    };
+    while (true) {
+        nkey = snprintf(ibuff, sizeof(ibuff), "%d.", i);
+
+        for (j = 0; raw_dirty_bitmap_opts.desc[j].name != NULL; j++) {
+            nname = strlen(raw_dirty_bitmap_opts.desc[j].name);
+            if (key_max_len < static_prefix_len + nkey + nname) {
+                key_max_len = static_prefix_len + nkey + nname;
+                key = g_realloc(key, key_max_len + 1);
+            }
+
+            strncpy(key, static_prefix, key_max_len);
+            strncpy(key + static_prefix_len, ibuff,
+                    key_max_len - static_prefix_len);
+            strncpy(key + static_prefix_len + nkey,
+                    raw_dirty_bitmap_opts.desc[j].name,
+                    key_max_len - static_prefix_len - nkey);
+            *(key + static_prefix_len + nkey + nname) = '\0';
+
+            qo = qdict_get(options, key);
+            if (qo != NULL) {
+                qobject_ref(qo);
+                qdict_del(options, key);
+
+                if (db_options == NULL) db_options = qdict_new();
+                qdict_put_obj(db_options, raw_dirty_bitmap_opts.desc[j].name,
+                              qo);
+            }
+        }
+
+        if (db_options != NULL && qdict_size(db_options) != 0) {
+            rdbol->n++;
+            if (rdbol->n == 1)
+                rdbol->opts = g_malloc0(sizeof(RawDirtyBitmapOpts) * rdbol->n);
+            else
+                rdbol->opts = g_realloc(rdbol->opts,
+                                        sizeof(RawDirtyBitmapOpts) * rdbol->n);
+
+            bool has_filename;
+            char* filename;
+            bool has_name;
+            char *name;
+            bool has_granularity;
+            uint32_t granularity;
+            bool has_persistent;
+            bool persistent;
+            bool has_disabled;
+            bool disabled;
+            ret = raw_read_dirty_bitmap_options(db_options,
+                                                &has_filename, &filename,
+                                                &has_name, &name,
+                                                &has_granularity, &granularity,
+                                                &has_persistent, &persistent,
+                                                &has_disabled, &disabled,
+                                                errp);
+            qobject_unref(db_options);
+            if (ret) {
+                goto end;
+            }
+
+            rdbol->opts[rdbol->n - 1] = (RawDirtyBitmapOpts) {
+                .has_filename = has_filename,
+                .filename = filename,
+                .has_name = has_name || has_filename,
+                .name = has_name ? name : filename,
+                .has_granularity = has_granularity,
+                .granularity = granularity,
+                .has_persistent = has_persistent,
+                .persistent = persistent,
+                .has_disabled = has_disabled,
+                .disabled = disabled,
+            };
+        } else {
+            break;
+        }
+    }
+
+    ret = 0;
+    end:
+    return ret;
+}
+
 static int raw_read_options(QDict *options, uint64_t *offset, bool *has_size,
-                            uint64_t *size, Error **errp)
+                            uint64_t *size, RawDirtyBitmapOptsList *rdbol,
+                            Error **errp)
 {
     QemuOpts *opts = NULL;
     int ret;
@@ -87,15 +255,35 @@ static int raw_read_options(QDict *options, uint64_t *offset, bool *has_size,
     *has_size = qemu_opt_find(opts, "size");
     *size = qemu_opt_get_size(opts, "size", 0);
 
+    ret = raw_read_dirty_bitmaps_options(options, rdbol, errp);
+    if (ret < 0) {
+        ret = -EINVAL;
+        goto end;
+    }
+
     ret = 0;
 end:
     qemu_opts_del(opts);
     return ret;
 }
 
+static void free_RawDirtyBitmapOptsList(RawDirtyBitmapOptsList *rdbol) {
+    if (rdbol->opts != NULL) {
+        for (int i = 0; i < rdbol->n; i++) {
+            if (rdbol->opts[i].filename != NULL)
+                g_free(rdbol->opts[i].filename);
+            if (rdbol->opts[i].name != NULL)
+                g_free(rdbol->opts[i].name);
+        }
+
+        g_free(rdbol->opts);
+        rdbol->opts = NULL;
+    }
+}
+
 static int raw_apply_options(BlockDriverState *bs, BDRVRawState *s,
                              uint64_t offset, bool has_size, uint64_t size,
-                             Error **errp)
+                             RawDirtyBitmapOptsList rdbol, Error **errp)
 {
     int64_t real_size = 0;
 
@@ -132,6 +320,29 @@ static int raw_apply_options(BlockDriverState *bs, BDRVRawState *s,
     s->offset = offset;
     s->has_size = has_size;
     s->size = has_size ? size : real_size - offset;
+    s->rdbol = rdbol;
+
+    RawDirtyBitmapOpts *opts;
+    for (int i = 0; i < rdbol.n; i++) {
+        opts = &rdbol.opts[i];
+
+        if (opts->has_persistent && opts->persistent && !opts->has_filename) {
+            error_setg(errp, "Filename is required for persistent bitmap");
+            return -EINVAL;
+        }
+
+        if (opts->has_filename) {
+            FILE *fp = fopen(opts->filename, "r");
+
+            raw_load_persistent_dirty_bitmap(bs, fp, opts->granularity,
+                                             opts->name, opts->persistent,
+                                             opts->disabled, errp);
+
+            if (fp) {
+                fclose(fp);
+            }
+        }
+    }
 
     return 0;
 }
@@ -141,6 +352,7 @@ static int raw_reopen_prepare(BDRVReopenState *reopen_state,
 {
     bool has_size;
     uint64_t offset, size;
+    RawDirtyBitmapOptsList rdbol = {0};
     int ret;
 
     assert(reopen_state != NULL);
@@ -149,13 +361,13 @@ static int raw_reopen_prepare(BDRVReopenState *reopen_state,
     reopen_state->opaque = g_new0(BDRVRawState, 1);
 
     ret = raw_read_options(reopen_state->options, &offset, &has_size, &size,
-                           errp);
+                           &rdbol, errp);
     if (ret < 0) {
         return ret;
     }
 
     ret = raw_apply_options(reopen_state->bs, reopen_state->opaque,
-                            offset, has_size, size, errp);
+                            offset, has_size, size, rdbol, errp);
     if (ret < 0) {
         return ret;
     }
@@ -170,12 +382,14 @@ static void raw_reopen_commit(BDRVReopenState *state)
 
     memcpy(s, new_s, sizeof(BDRVRawState));
 
+    free_RawDirtyBitmapOptsList(&((BDRVRawState *) state->opaque)->rdbol);
     g_free(state->opaque);
     state->opaque = NULL;
 }
 
 static void raw_reopen_abort(BDRVReopenState *state)
 {
+    free_RawDirtyBitmapOptsList(&((BDRVRawState *) state->opaque)->rdbol);
     g_free(state->opaque);
     state->opaque = NULL;
 }
@@ -438,10 +652,11 @@ static int raw_open(BlockDriverState *bs, QDict *options, int flags,
     BDRVRawState *s = bs->opaque;
     bool has_size;
     uint64_t offset, size;
+    RawDirtyBitmapOptsList rdbol = {0};
     BdrvChildRole file_role;
     int ret;
 
-    ret = raw_read_options(options, &offset, &has_size, &size, errp);
+    ret = raw_read_options(options, &offset, &has_size, &size, &rdbol, errp);
     if (ret < 0) {
         return ret;
     }
@@ -483,7 +698,7 @@ static int raw_open(BlockDriverState *bs, QDict *options, int flags,
                 bs->file->bs->filename);
     }
 
-    ret = raw_apply_options(bs, s, offset, has_size, size, errp);
+    ret = raw_apply_options(bs, s, offset, has_size, size, rdbol, errp);
     if (ret < 0) {
         return ret;
     }
@@ -496,6 +711,19 @@ static int raw_open(BlockDriverState *bs, QDict *options, int flags,
     return 0;
 }
 
+static void raw_close(BlockDriverState *bs)
+{
+    Error *local_err = NULL;
+
+    raw_store_persistent_dirty_bitmaps(bs, &local_err);
+
+    if (local_err != NULL) {
+        error_reportf_err(local_err, "Lost persistent bitmaps during "
+                          "inactivation of node '%s': ",
+                          bdrv_get_device_or_node_name(bs));
+    }
+}
+
 static int raw_probe(const uint8_t *buf, int buf_size, const char *filename)
 {
     /* smallest possible positive score so that raw is used if and only if no
@@ -583,6 +811,7 @@ BlockDriver bdrv_raw = {
     .bdrv_reopen_commit   = &raw_reopen_commit,
     .bdrv_reopen_abort    = &raw_reopen_abort,
     .bdrv_open            = &raw_open,
+    .bdrv_close           = &raw_close,
     .bdrv_child_perm      = bdrv_default_perms,
     .bdrv_co_create_opts  = &raw_co_create_opts,
     .bdrv_co_preadv       = &raw_co_preadv,
@@ -608,6 +837,11 @@ BlockDriver bdrv_raw = {
     .bdrv_has_zero_init   = &raw_has_zero_init,
     .strong_runtime_opts  = raw_strong_runtime_opts,
     .mutable_opts         = mutable_opts,
+    .bdrv_co_can_store_new_dirty_bitmap = raw_co_can_store_new_dirty_bitmap,
+    .bdrv_supports_persistent_dirty_bitmap =
+            raw_supports_persistent_dirty_bitmap,
+    .bdrv_co_remove_persistent_dirty_bitmap =
+            raw_co_remove_persistent_dirty_bitmap,
 };
 
 static void bdrv_raw_init(void)
diff --git a/block/raw-format.h b/block/raw-format.h
new file mode 100644
index 0000000000..1ac765255e
--- /dev/null
+++ b/block/raw-format.h
@@ -0,0 +1,50 @@
+#ifndef BLOCK_RAW_FORMAT_H
+#define BLOCK_RAW_FORMAT_H
+
+#include "qemu/coroutine.h"
+#include "qemu/osdep.h"
+
+typedef struct RawDirtyBitmapOpts {
+    bool has_filename;
+    char *filename;
+    bool has_name;
+    char *name;
+    bool has_granularity;
+    uint32_t granularity;
+    bool has_persistent;
+    bool persistent;
+    bool has_disabled;
+    bool disabled;
+} RawDirtyBitmapOpts;
+
+typedef struct RawDirtyBitmapOptsList {
+    size_t n;
+    RawDirtyBitmapOpts *opts;
+} RawDirtyBitmapOptsList;
+
+typedef struct BDRVRawState {
+    uint64_t offset;
+    uint64_t size;
+    bool has_size;
+    RawDirtyBitmapOptsList rdbol;
+} BDRVRawState;
+
+bool raw_co_can_store_new_dirty_bitmap(BlockDriverState *bs,
+                                       const char *name,
+                                       uint32_t granularity,
+                                       Error **errp);
+
+bool raw_supports_persistent_dirty_bitmap(BlockDriverState *bs);
+
+int raw_co_remove_persistent_dirty_bitmap(BlockDriverState *bs,
+                                          const char *name,
+                                          Error **errp);
+
+void raw_load_persistent_dirty_bitmap(BlockDriverState *bs, FILE *fp,
+                                      uint32_t granularity, char* name,
+                                      bool persistent, bool disabled,
+                                      Error **errp);
+
+void raw_store_persistent_dirty_bitmaps(BlockDriverState *bs, Error **errp);
+
+#endif
-- 
2.31.0


