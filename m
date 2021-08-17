Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE873EF384
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 22:17:29 +0200 (CEST)
Received: from localhost ([::1]:37146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mG5WZ-0001ZF-Mi
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 16:17:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viktor.prutyanov@phystech.edu>)
 id 1mG5VB-0000l4-PW
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 16:16:01 -0400
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232]:43622)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <viktor.prutyanov@phystech.edu>)
 id 1mG5V8-0008JQ-63
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 16:16:00 -0400
Received: by mail-lj1-x232.google.com with SMTP id x7so752874ljn.10
 for <qemu-devel@nongnu.org>; Tue, 17 Aug 2021 13:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=phystech-edu.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e7AC6Hm2NWATq8NSPaGyyVac9lcA9aqK1BXHKqxilAM=;
 b=RIIWBMm1HuNtTh8qsGmsrX+eNAlY1Iqbr8Jc37l0vN0syrSmmz6W2ZxWNXCkbwHdAG
 TmmffqQTYD+Iv/UYvZcBnjPKmP8L+ju8vT0zCkOu9OR25PhHGXeW0ojuePrdm8NOsw36
 71Nq/Vm/TeJqQFbtHcg9+kSmicAYAPYkPIUqZfIthlRWeco6kjYvjVISSLt4PvB6cN/6
 q/bcIxHOYn6TpT+dmYPZvRNOszt9jUAD6n8cGGGs3HTBIRUUEzdi9aT1F4gByO/4QpP8
 4kJFpsLJsRqQg+h0CUfi5u6TuXi3oGLg+yUVD1sgIdWCiDonl8OVtzRU8N5XGrIYIhBW
 Rdkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e7AC6Hm2NWATq8NSPaGyyVac9lcA9aqK1BXHKqxilAM=;
 b=G77+EdiqyviJG0RU/svXlKqgHbMQipUdB0gxMfc8ebGSGnyuuT8JhyYe1Z8Ep9SiIJ
 LfHL924qkXuz6AaHp4WrSdSSmBnopgWcRB992P8izFIdjrOmhPcP14LZlBt1PRr0idXz
 Y6ktz4YdkaInrS0Jzg1+5fmRvMMEGrkd42UBYybuEHCwFDcqajyb9tON5810mUGj/VJs
 VIRd4eyvtXHna9d1/9fjDlPCnEPDCgW7y5qsVpmmd165gOp5QyboKXzluDSS3i5x7X6Y
 PXWflHjGw99xZ/kCkTNlpjzCjiWa5cgFc2PyMpKSigGLVs0pXzPm45J68082LTdVrpQy
 dVrw==
X-Gm-Message-State: AOAM530mRLxxfeKSJ2SM23MWZi5UFoka9HPPsG6fT9V72wl4rrhCRtDz
 SZ6Y8Sgozw4tOcl1bGGA4GDUrw==
X-Google-Smtp-Source: ABdhPJyG4pFLPqNelAESzx1FNUbk2xOHohdAGAC0kF3qT80bqYm49cyUN+urUFIhfh4UcPdGE7Knnw==
X-Received: by 2002:a05:651c:2006:: with SMTP id
 s6mr4540878ljo.171.1629231355434; 
 Tue, 17 Aug 2021 13:15:55 -0700 (PDT)
Received: from 192.168.1.2 ([2a00:1370:810e:b7ea:7e3d:4f4b:921e:b1ff])
 by smtp.gmail.com with ESMTPSA id i6sm256507lfl.17.2021.08.17.13.15.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 13:15:54 -0700 (PDT)
From: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
To: philmd@redhat.com, kwolf@redhat.com, hreitz@redhat.com, sw@weilnetz.de,
 qemu-block@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v2] block/file-win32: add reopen handlers
Date: Tue, 17 Aug 2021 23:15:43 +0300
Message-Id: <20210817201543.16070-1-viktor.prutyanov@phystech.edu>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::232;
 envelope-from=viktor.prutyanov@phystech.edu; helo=mail-lj1-x232.google.com
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
Cc: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Make 'qemu-img commit' work on Windows.

Command 'commit' requires reopening backing file in RW mode. So,
add reopen prepare/commit/abort handlers and change dwShareMode
for CreateFile call in order to allow further read/write reopening.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/418

Signed-off-by: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
---
 v2:
    - fix indentation in raw_reopen_prepare
    - free rs if raw_reopen_prepare fails

 block/file-win32.c | 90 +++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 89 insertions(+), 1 deletion(-)

diff --git a/block/file-win32.c b/block/file-win32.c
index 2642088bd6..9dcbb2b53b 100644
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
@@ -634,6 +638,86 @@ static int coroutine_fn raw_co_create_opts(BlockDriver *drv,
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
+    rs = g_new0(BDRVRawReopenState, 1);
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
@@ -659,6 +743,10 @@ BlockDriver bdrv_file = {
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


