Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A273F6C55
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 01:49:47 +0200 (CEST)
Received: from localhost ([::1]:43900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIgAr-0005Y0-Lm
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 19:49:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viktor.prutyanov@phystech.edu>)
 id 1mIgA1-0004lV-P8
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 19:48:53 -0400
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f]:46782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <viktor.prutyanov@phystech.edu>)
 id 1mIg9y-0008S7-9O
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 19:48:52 -0400
Received: by mail-lf1-x12f.google.com with SMTP id b4so4922493lfo.13
 for <qemu-devel@nongnu.org>; Tue, 24 Aug 2021 16:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=phystech-edu.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QowVcic0+G/xBgEoPE5tSP4/we07HatiCI2qz1J+jTE=;
 b=vzdJ0ffSTIxuoqrBmaFcFgfZe7VBD5Ptyi9r7j2x9uLR5FxNO0jEhtXCrv/f0QL1HQ
 UYdH2RsL+/u+wvF8xuOknatq6Y3nX8IZMQQpU1Ing1cLCqpkNc/yzNYjJ5HmW4AeN/ad
 bbEZDcn2V/QxazR5xESTx7Kv88O62+EDQO9u8I3AzDIXdISO/M6OY/49YuEYhQhctcZJ
 N2IINB/xCKeO3zf2uszGdDKbMVvY/+AuGLVOpV5g+S3Ndmxoq0PdiSBKwSvuZneweZpL
 D/gnrvZq4srKIUDA/Z3pJWkL3JvAMFKHbuxAGhYt8GS39QInPxtnZr/RIzq3fTwqQJz3
 qGRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QowVcic0+G/xBgEoPE5tSP4/we07HatiCI2qz1J+jTE=;
 b=r0+dHsNvccZ0nD8t8pFDie1PFmBuFRWV3b22BCSqdqXPHZARm741p5mf6+sPtOxZoC
 PG3TcGgi+EYIUFiLgZpFb5Vzpnz4+zfyw3udCjJgZ/qnY59oFSbkf8sdyXuHrNq8bWcD
 3DtcnKWtA0Hw67WIDJbsFBban8BIcdIdw1KCqIvv0zdZDu/12igHqck9PpM7N3HR+ad2
 YgglDgNihFqhvcL7U3NUEuUf1VhWE1HftTApgQha+4fO2uYyaaamWGhyd6aKxGmXpwWM
 iF8ZMq6vKLtJcbapcYH02jgPASiggVXsm9VpkfqlkDfSF0oOZdt6geT3SQHCvB2SHo7E
 7FyA==
X-Gm-Message-State: AOAM530VR2EBVZ40RPpWT9b+5wMBcTIAXogIKIJtPD4vxsC3qiggdLBM
 ykbZ73ygFzWeWZXr0mmXkjxkiQ==
X-Google-Smtp-Source: ABdhPJxFSdF7mr9laLCN4NpF/O7EzN4w1ceGXnutE4kAH8fPgcO5c79hgo+dz0s4AjOmPM0/JOgi+g==
X-Received: by 2002:a05:6512:132a:: with SMTP id
 x42mr29693057lfu.210.1629848927126; 
 Tue, 24 Aug 2021 16:48:47 -0700 (PDT)
Received: from 192.168.1.2 ([2a00:1370:810e:b7ea:7e3d:4f4b:921e:b1ff])
 by smtp.gmail.com with ESMTPSA id a9sm1897948ljq.51.2021.08.24.16.48.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Aug 2021 16:48:46 -0700 (PDT)
From: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
To: philmd@redhat.com, kwolf@redhat.com, hreitz@redhat.com, sw@weilnetz.de,
 yan@daynix.com, qemu-block@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v4] block/file-win32: add reopen handlers
Date: Wed, 25 Aug 2021 02:48:17 +0300
Message-Id: <20210824234817.13343-1-viktor.prutyanov@phystech.edu>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12f;
 envelope-from=viktor.prutyanov@phystech.edu; helo=mail-lf1-x12f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Helge Konetzka <hk@zapateado.de>,
 Viktor Prutyanov <viktor.prutyanov@phystech.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Make 'qemu-img commit' work on Windows.

Command 'commit' requires reopening backing file in RW mode. So,
add reopen prepare/commit/abort handlers and change dwShareMode
for CreateFile call in order to allow further read/write reopening.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/418

Suggested-by: Hanna Reitz <hreitz@redhat.com>
Signed-off-by: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
Tested-by: Helge Konetzka <hk@zapateado.de>
---
 v2:
    - fix indentation in raw_reopen_prepare
    - free rs if raw_reopen_prepare fails
 v3:
    - restore suggested-by field missed in v2
 v4:
    - add file type check
    - add comment about options
    - replace rs check with assert in raw_reopen_commit

 block/file-win32.c | 100 ++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 99 insertions(+), 1 deletion(-)

diff --git a/block/file-win32.c b/block/file-win32.c
index 2642088bd6..8320495f2b 100644
--- a/block/file-win32.c
+++ b/block/file-win32.c
@@ -58,6 +58,10 @@ typedef struct BDRVRawState {
     QEMUWin32AIOState *aio;
 } BDRVRawState;
 
+typedef struct BDRVRawReopenState {
+    HANDLE hfile;
+} BDRVRawReopenState;
+
 /*
  * Read/writes the data to/from a given linear buffer.
  *
@@ -392,7 +396,7 @@ static int raw_open(BlockDriverState *bs, QDict *options, int flags,
     }
 
     s->hfile = CreateFile(filename, access_flags,
-                          FILE_SHARE_READ, NULL,
+                          FILE_SHARE_READ | FILE_SHARE_WRITE, NULL,
                           OPEN_EXISTING, overlapped, NULL);
     if (s->hfile == INVALID_HANDLE_VALUE) {
         int err = GetLastError();
@@ -634,6 +638,96 @@ static int coroutine_fn raw_co_create_opts(BlockDriver *drv,
     return raw_co_create(&options, errp);
 }
 
+static int raw_reopen_prepare(BDRVReopenState *state,
+                              BlockReopenQueue *queue, Error **errp)
+{
+    BDRVRawState *s = state->bs->opaque;
+    BDRVRawReopenState *rs;
+    int access_flags;
+    DWORD overlapped;
+    int ret = 0;
+
+    if (s->type != FTYPE_FILE) {
+        error_setg(errp, "Can only reopen files");
+        return -EINVAL;
+    }
+
+    rs = g_new0(BDRVRawReopenState, 1);
+
+    /*
+     * We do not support changing any options (only flags). By leaving
+     * all options in state->options, we tell the generic reopen code
+     * that we do not support changing any of them, so it will verify
+     * that their values did not change.
+     */
+
+    raw_parse_flags(state->flags, s->aio != NULL, &access_flags, &overlapped);
+    rs->hfile = CreateFile(state->bs->filename, access_flags,
+                           FILE_SHARE_READ | FILE_SHARE_WRITE, NULL,
+                           OPEN_EXISTING, overlapped, NULL);
+
+    if (rs->hfile == INVALID_HANDLE_VALUE) {
+        int err = GetLastError();
+
+        error_setg_win32(errp, err, "Could not reopen '%s'",
+                         state->bs->filename);
+        if (err == ERROR_ACCESS_DENIED) {
+            ret = -EACCES;
+        } else {
+            ret = -EINVAL;
+        }
+        goto fail;
+    }
+
+    if (s->aio) {
+        ret = win32_aio_attach(s->aio, rs->hfile);
+        if (ret < 0) {
+            error_setg_errno(errp, -ret, "Could not enable AIO");
+            goto fail;
+        }
+    }
+
+    state->opaque = rs;
+
+    return 0;
+
+fail:
+    g_free(rs);
+    state->opaque = NULL;
+
+    return ret;
+}
+
+static void raw_reopen_commit(BDRVReopenState *state)
+{
+    BDRVRawState *s = state->bs->opaque;
+    BDRVRawReopenState *rs = state->opaque;
+
+    assert(rs != NULL);
+
+    CloseHandle(s->hfile);
+    s->hfile = rs->hfile;
+
+    g_free(rs);
+    state->opaque = NULL;
+}
+
+static void raw_reopen_abort(BDRVReopenState *state)
+{
+    BDRVRawReopenState *rs = state->opaque;
+
+    if (!rs) {
+        return;
+    }
+
+    if (rs->hfile != INVALID_HANDLE_VALUE) {
+        CloseHandle(rs->hfile);
+    }
+
+    g_free(rs);
+    state->opaque = NULL;
+}
+
 static QemuOptsList raw_create_opts = {
     .name = "raw-create-opts",
     .head = QTAILQ_HEAD_INITIALIZER(raw_create_opts.head),
@@ -659,6 +753,10 @@ BlockDriver bdrv_file = {
     .bdrv_co_create_opts = raw_co_create_opts,
     .bdrv_has_zero_init = bdrv_has_zero_init_1,
 
+    .bdrv_reopen_prepare = raw_reopen_prepare,
+    .bdrv_reopen_commit  = raw_reopen_commit,
+    .bdrv_reopen_abort   = raw_reopen_abort,
+
     .bdrv_aio_preadv    = raw_aio_preadv,
     .bdrv_aio_pwritev   = raw_aio_pwritev,
     .bdrv_aio_flush     = raw_aio_flush,
-- 
2.21.0


