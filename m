Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F993F7BA0
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 19:37:41 +0200 (CEST)
Received: from localhost ([::1]:44646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIwqJ-0007X7-Nr
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 13:37:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viktor.prutyanov@phystech.edu>)
 id 1mIwpP-0005tw-Av
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 13:36:43 -0400
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e]:38682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <viktor.prutyanov@phystech.edu>)
 id 1mIwpL-0007wH-Q7
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 13:36:41 -0400
Received: by mail-lf1-x12e.google.com with SMTP id x27so598090lfu.5
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 10:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=phystech-edu.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EL5YgdQeNcyTK1DbujpI0X3stp39LOsZIVJaD87CSUE=;
 b=rmS19YfyVzE/K1AJLe/90HHp7JRZ5YLJ6CdgIdyS7SFbVY7ld8cMCjVMiyqeCeoYba
 d9ie/Y9EnqCssPaxashkDcI+RbDXV3tBqv86HMXFhaoRhUHuXTH8WtujDwLzKAY/T8UY
 v7O9Wb17rd/6qAa2FQcCWxn+CNGOCm8QtfD4/itSm04hs0jiXd+XxTMwrvlSxvt91pDw
 FO4Mm1naU59LxbvdnjKylYCKwbSw8FApYni65PNrF6GbgnddOl+rYzVjD/QHMDkog9im
 CP8Dn+yU7daC1s9VSJw3OzWe1qBzo9/neYZeOht5mqlxUH8HOKBBPlXuZMTmqFfNzsOS
 ejVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EL5YgdQeNcyTK1DbujpI0X3stp39LOsZIVJaD87CSUE=;
 b=TRnVI0RnosBDQA016TMq4VaFZcgCPb0qcvtEnWifzWDkMNyq4PZQEPc78P1CDU1LGv
 Yr8RKe5SSXkycztL1/PICN8jg2kF7zrj3tdnCDqbRJGNNi9o16rAGqw4aryRhpo4bXqP
 e8KNWEeJq9XM35xx35X0mNZ1VEd642qKwHk4Ay9VUMjH4+H8R77e8a3SKvwfNkj3kTff
 eYmsi/dC2REgZEZd6s21ANkI3KEsMtwTRwmMOCYkpSjWIQEstm+/mP5iJejP5So5uZZ3
 PHPlvL4d55rt3G0DsaEJpikUQAANxp7h+B2clEV7f6CMczp18rRB6bIACT4jPvOY4Wg+
 /BuQ==
X-Gm-Message-State: AOAM533LkfM1BGWw8VZEzpXAoRRPk2C+G4K+tewF9dGB/uofiQUuZYFD
 cPKq7j711bYT3wb5TN3mb4PRhA==
X-Google-Smtp-Source: ABdhPJzQ7oZfdARmcrf53GuHNrxuG1Jvk2bCdgQthgWPYMFZGZfMfvHiY7OcyjIYYbZkSlcNLQ40Iw==
X-Received: by 2002:a19:c787:: with SMTP id
 x129mr32870181lff.490.1629912997496; 
 Wed, 25 Aug 2021 10:36:37 -0700 (PDT)
Received: from 192.168.1.2 ([2a00:1370:810e:b7ea:7e3d:4f4b:921e:b1ff])
 by smtp.gmail.com with ESMTPSA id k13sm61706lfm.168.2021.08.25.10.36.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 10:36:37 -0700 (PDT)
From: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
To: philmd@redhat.com, kwolf@redhat.com, hreitz@redhat.com, sw@weilnetz.de,
 yan@daynix.com, qemu-block@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v5] block/file-win32: add reopen handlers
Date: Wed, 25 Aug 2021 20:36:25 +0300
Message-Id: <20210825173625.19415-1-viktor.prutyanov@phystech.edu>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12e;
 envelope-from=viktor.prutyanov@phystech.edu; helo=mail-lf1-x12e.google.com
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
 v5:
    - add CloseHandle at AIO attach fail

 block/file-win32.c | 101 ++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 100 insertions(+), 1 deletion(-)

diff --git a/block/file-win32.c b/block/file-win32.c
index 2642088bd6..b97c58d642 100644
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
@@ -634,6 +638,97 @@ static int coroutine_fn raw_co_create_opts(BlockDriver *drv,
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
+            CloseHandle(rs->hfile);
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
@@ -659,6 +754,10 @@ BlockDriver bdrv_file = {
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


