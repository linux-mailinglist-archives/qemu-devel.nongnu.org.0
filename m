Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4AAF3EEAB6
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 12:14:11 +0200 (CEST)
Received: from localhost ([::1]:51642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFw6k-0006lE-Mu
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 06:14:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viktor.prutyanov@phystech.edu>)
 id 1mFw5v-0005tG-CT
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 06:13:19 -0400
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129]:45598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <viktor.prutyanov@phystech.edu>)
 id 1mFw5r-0004SX-Me
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 06:13:18 -0400
Received: by mail-lf1-x129.google.com with SMTP id g13so40293922lfj.12
 for <qemu-devel@nongnu.org>; Tue, 17 Aug 2021 03:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=phystech-edu.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DYUCxdgbICWFj6YWYVB9Eq9Rnw6dwHmMIReyB8M4b3A=;
 b=lylMzMW5lKHOJyzXqqkPtyExOqkcZwUTF4+wFjA30hJfSOPchbEXImjwImI2eVoMmj
 yOt7zK6wI+U5LWIXWPFjkCkIN/rIJ5m5NefDyEEex4eKfIKuh7JKpz17jqQaLAPnym0g
 2ifNFcSfMXTbDr3vb0gQvkoSF1WvXU2IZcLdHGU6KlSt3qjhRY5Ei/gltuDHMpfnTwP7
 kaPvuIj7qOtFlvk+oVLNsL0XwMjKwPss52B62zvU7F2jBAHhr7/XXfLP7CTjLsMHT4Yk
 6Gc/Wo6ol1RJAXmzKwUm7Cn9fdS/tsm4Yoh6AUYWZ+G7QSSaziTQNbVD+6pk0dXDKyn4
 FVZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DYUCxdgbICWFj6YWYVB9Eq9Rnw6dwHmMIReyB8M4b3A=;
 b=uAdOD0opjlZavVX7LIvfTEHa5PSGNpUBxFD3ufbI2LomymDeQHq5zLZeqUTnJApU9m
 KhF7tGd7YzX8RLJTtv/b0MtTjSHGBVogyE+uhCquRzAeb8mAqs5m3nGBLqhwmzGSO/tz
 1TfqoO7BUFp6AdAWwP9bVil3/dFYRIJxbOotqee+GW3+vX9GTDgBAF7zs+pKzznZ6i6L
 +ssPLnk4HB82pEq9JBVGPh8A3mbd9qow2VSUlASaluCmc6fcVYSSBr4OIqLicul9T/cA
 4EsK6ATsbTHS+/ekwnTYGAkePuTuxQW2fhjuP2XmbvfnNyQFaqSYTEbtyy6aQseA4fAc
 X9kw==
X-Gm-Message-State: AOAM533IBKJ9MRkclIA5dRGdn9JnsIoXSjblnsgl826wjWTQEMOIrbnH
 OgDVOG+GP4XutkuckdEl/nTVHw==
X-Google-Smtp-Source: ABdhPJwrCJ9oAT6W2atkSnT/InOY5WqpCitOJ2+OhIWjQDUrEFijkRwK0+21zw6iecTVTrxM+RNkDA==
X-Received: by 2002:a05:6512:2248:: with SMTP id
 i8mr1891816lfu.258.1629195193035; 
 Tue, 17 Aug 2021 03:13:13 -0700 (PDT)
Received: from 192.168.1.2 ([2a00:1370:810e:b7ea:7e3d:4f4b:921e:b1ff])
 by smtp.gmail.com with ESMTPSA id b12sm145923lfs.152.2021.08.17.03.13.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 03:13:12 -0700 (PDT)
From: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
To: kwolf@redhat.com, hreitz@redhat.com, sw@weilnetz.de, qemu-block@nongnu.org,
 qemu-devel@nongnu.org
Subject: [PATCH] block/file-win32: add reopen handlers
Date: Tue, 17 Aug 2021 13:12:51 +0300
Message-Id: <20210817101251.28438-1-viktor.prutyanov@phystech.edu>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::129;
 envelope-from=viktor.prutyanov@phystech.edu; helo=mail-lf1-x129.google.com
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Make 'qemu-img commit' work on Windows.

Command 'commit' requires reopening backing file in RW mode. So,
add reopen prepare/commit/abort handlers and change dwShareMode
for CreateFile call in order to allow further read/write reopening.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/418
Suggested-by: Hanna Reitz <hreitz@redhat.com>
Signed-off-by: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
---
 block/file-win32.c | 85 +++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 84 insertions(+), 1 deletion(-)

diff --git a/block/file-win32.c b/block/file-win32.c
index 2642088bd6..e44878e6be 100644
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
@@ -634,6 +638,81 @@ static int coroutine_fn raw_co_create_opts(BlockDriver *drv,
     return raw_co_create(&options, errp);
 }
 
+static int raw_reopen_prepare(BDRVReopenState *state,
+        BlockReopenQueue *queue, Error **errp)
+{
+    BDRVRawState *s = state->bs->opaque;
+    BDRVRawReopenState *rs;
+    int access_flags;
+    DWORD overlapped;
+    int ret = 0;
+
+    rs = state->opaque = g_new0(BDRVRawReopenState, 1);
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
+    return 0;
+
+fail:
+    return ret;
+}
+
+static void raw_reopen_commit(BDRVReopenState *state)
+{
+    BDRVRawState *s = state->bs->opaque;
+    BDRVRawReopenState *rs = state->opaque;
+
+    if (!rs) {
+        return;
+    }
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
@@ -659,6 +738,10 @@ BlockDriver bdrv_file = {
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


