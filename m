Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E78822DAB78
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 11:54:58 +0100 (CET)
Received: from localhost ([::1]:46322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kp7ys-0005uz-1E
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 05:54:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fengli@smartx.com>) id 1kp7xk-00058P-7z
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 05:53:48 -0500
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042]:36930)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <fengli@smartx.com>) id 1kp7xg-0007gN-NV
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 05:53:48 -0500
Received: by mail-pj1-x1042.google.com with SMTP id b5so7180160pjk.2
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 02:53:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smartx-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id;
 bh=6c/4ZulLKq+u38VLp1ymzM4cIJt61r6DTsd1rX/zQ/0=;
 b=F2msXA6cWFcegC3k1QareVmAE7Q4J6aLAyH9PMcZQBhyxluyhxDfJk3IN/csDWO2oe
 TtaTN9vMv9swRYpCOZLI6Wc4Pbn68uAmeTWAPTGlrz6y2OnjjqtMY8wdooeowfqE+fE4
 2nGc5NBuXYHuXpj7HdSNmrg+JKixyKaLvUPveVz6nVdU9AQ/oNdV3gTlIFXGC3kTRkRv
 /QprwRMK2CaF0kCpheKQcq/lmKpF0JNYvB0pHPB71lIP6TPFIw2Gc3cgpAO7Qd3yKglP
 m/dCoxCT283iVCfZQvxq9j0y3mDGFz+wB+PjBYBRZXPLoC6TtI+6KI+VKKuLNiQqbDFP
 zTRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=6c/4ZulLKq+u38VLp1ymzM4cIJt61r6DTsd1rX/zQ/0=;
 b=GwsvA00sCsbDZBMFUltaoNKAmzBYPRdK3hpBNjnMe1MWIbgqrvFEpmcTO8f3WltZZe
 5Uj7q2zV6f/iHxX2lseADU75EBs89w+P985W1+PASAPhH26aCGwutrsvLAF1aiI2FCU8
 XOR7BTcw8eyuUJAS6rkf89KnatTYqW7EJhtZA6nP93wNNC25p5FUwAhajcZRI+NBaZlA
 DXjqA6bGba+2tbReFNxUv4lmgqxH3+S2ucRoCpqW5ZXmjHqORDFsUhTMrfLshldykF6x
 lZLh/Em8u5GDssbN+grganX5XA3Mh4AvuUBLtalHwg5vsKJNiqJMhR6mbTH0R3T7HntQ
 KU1w==
X-Gm-Message-State: AOAM530VFHRWu3tNlvy1jc0GgCl5sh619R0qJ1JfBiZMEH6hqYsCOAOE
 qaNl6yyGPpr/DrZ6xphPW/FDMw==
X-Google-Smtp-Source: ABdhPJzgaAPIPEdCrxfOL0G3pn2tx8zz6eCxIXVUZluAukSC+ddsdanzA0zn+D2cxhkHIL+XVQC31g==
X-Received: by 2002:a17:90b:78d:: with SMTP id
 l13mr29698100pjz.51.1608029623035; 
 Tue, 15 Dec 2020 02:53:43 -0800 (PST)
Received: from 64-217.abest.vip ([129.227.156.197])
 by smtp.gmail.com with ESMTPSA id a11sm24371484pfr.198.2020.12.15.02.53.39
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 15 Dec 2020 02:53:42 -0800 (PST)
From: Li Feng <fengli@smartx.com>
To: berrange@redhat.com, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org (open list:raw),
 qemu-devel@nongnu.org (open list:All patches CC here)
Subject: [PATCH v5] file-posix: detect the lock using the real file
Date: Tue, 15 Dec 2020 18:53:56 +0800
Message-Id: <1608029636-31442-1-git-send-email-fengli@smartx.com>
X-Mailer: git-send-email 1.8.3.1
Received-SPF: none client-ip=2607:f8b0:4864:20::1042;
 envelope-from=fengli@smartx.com; helo=mail-pj1-x1042.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
Cc: lifeng1519@gmail.com, Li Feng <fengli@smartx.com>, kyle@smartx.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch addresses this issue:
When accessing a volume on an NFS filesystem without supporting the file lock,
tools, like qemu-img, will complain "Failed to lock byte 100".

In the original code, the qemu_has_ofd_lock will test the lock on the
"/dev/null" pseudo-file. Actually, the file.locking is per-drive property,
which depends on the underlay filesystem.

In this patch, add a new 'qemu_has_file_lock' to detect whether the
file supports the file lock. And disable the lock when the underlay file
system doesn't support locks.

Signed-off-by: Li Feng <fengli@smartx.com>
---
v5: simplify the code.
v4: use the fd as the qemu_has_file_lock argument.
v3: don't call the qemu_has_ofd_lock, use a new function instead.
v2: remove the refactoring.
---
 block/file-posix.c   | 61 +++++++++++++++++++++++---------------------
 include/qemu/osdep.h |  1 +
 util/osdep.c         | 14 ++++++++++
 3 files changed, 47 insertions(+), 29 deletions(-)

diff --git a/block/file-posix.c b/block/file-posix.c
index 806764f7e3..4e00111031 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -584,6 +584,21 @@ static int raw_open_common(BlockDriverState *bs, QDict *options,
     s->use_linux_io_uring = (aio == BLOCKDEV_AIO_OPTIONS_IO_URING);
 #endif
 
+    s->open_flags = open_flags;
+    raw_parse_flags(bdrv_flags, &s->open_flags, false);
+
+    s->fd = -1;
+    fd = qemu_open(filename, s->open_flags, errp);
+    ret = fd < 0 ? -errno : 0;
+
+    if (ret < 0) {
+        if (ret == -EROFS) {
+            ret = -EACCES;
+        }
+        goto fail;
+    }
+    s->fd = fd;
+
     locking = qapi_enum_parse(&OnOffAuto_lookup,
                               qemu_opt_get(opts, "locking"),
                               ON_OFF_AUTO_AUTO, &local_err);
@@ -606,7 +621,7 @@ static int raw_open_common(BlockDriverState *bs, QDict *options,
         s->use_lock = false;
         break;
     case ON_OFF_AUTO_AUTO:
-        s->use_lock = qemu_has_ofd_lock();
+        s->use_lock = qemu_has_file_lock(s->fd) && qemu_has_ofd_lock();
         break;
     default:
         abort();
@@ -625,22 +640,6 @@ static int raw_open_common(BlockDriverState *bs, QDict *options,
     s->drop_cache = qemu_opt_get_bool(opts, "drop-cache", true);
     s->check_cache_dropped = qemu_opt_get_bool(opts, "x-check-cache-dropped",
                                                false);
-
-    s->open_flags = open_flags;
-    raw_parse_flags(bdrv_flags, &s->open_flags, false);
-
-    s->fd = -1;
-    fd = qemu_open(filename, s->open_flags, errp);
-    ret = fd < 0 ? -errno : 0;
-
-    if (ret < 0) {
-        if (ret == -EROFS) {
-            ret = -EACCES;
-        }
-        goto fail;
-    }
-    s->fd = fd;
-
     /* Check s->open_flags rather than bdrv_flags due to auto-read-only */
     if (s->open_flags & O_RDWR) {
         ret = check_hdev_writable(s->fd);
@@ -2388,6 +2387,7 @@ raw_co_create(BlockdevCreateOptions *options, Error **errp)
     int fd;
     uint64_t perm, shared;
     int result = 0;
+    bool use_lock;
 
     /* Validate options and set default values */
     assert(options->driver == BLOCKDEV_DRIVER_FILE);
@@ -2428,19 +2428,22 @@ raw_co_create(BlockdevCreateOptions *options, Error **errp)
     perm = BLK_PERM_WRITE | BLK_PERM_RESIZE;
     shared = BLK_PERM_ALL & ~BLK_PERM_RESIZE;
 
-    /* Step one: Take locks */
-    result = raw_apply_lock_bytes(NULL, fd, perm, ~shared, false, errp);
-    if (result < 0) {
-        goto out_close;
-    }
+    use_lock = qemu_has_file_lock(fd);
+    if (use_lock) {
+        /* Step one: Take locks */
+        result = raw_apply_lock_bytes(NULL, fd, perm, ~shared, false, errp);
+        if (result < 0) {
+            goto out_close;
+        }
 
-    /* Step two: Check that nobody else has taken conflicting locks */
-    result = raw_check_lock_bytes(fd, perm, shared, errp);
-    if (result < 0) {
-        error_append_hint(errp,
-                          "Is another process using the image [%s]?\n",
-                          file_opts->filename);
-        goto out_unlock;
+        /* Step two: Check that nobody else has taken conflicting locks */
+        result = raw_check_lock_bytes(fd, perm, shared, errp);
+        if (result < 0) {
+            error_append_hint(errp,
+                              "Is another process using the image [%s]?\n",
+                              file_opts->filename);
+            goto out_unlock;
+        }
     }
 
     /* Clear the file by truncating it to 0 */
diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index f9ec8c84e9..c7587be99d 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -513,6 +513,7 @@ int qemu_lock_fd(int fd, int64_t start, int64_t len, bool exclusive);
 int qemu_unlock_fd(int fd, int64_t start, int64_t len);
 int qemu_lock_fd_test(int fd, int64_t start, int64_t len, bool exclusive);
 bool qemu_has_ofd_lock(void);
+bool qemu_has_file_lock(int fd);
 #endif
 
 #if defined(__HAIKU__) && defined(__i386__)
diff --git a/util/osdep.c b/util/osdep.c
index 66d01b9160..dee1f076da 100644
--- a/util/osdep.c
+++ b/util/osdep.c
@@ -225,6 +225,20 @@ static void qemu_probe_lock_ops(void)
     }
 }
 
+bool qemu_has_file_lock(int fd)
+{
+    int ret;
+    struct flock fl = {
+        .l_whence = SEEK_SET,
+        .l_start  = 0,
+        .l_len    = 0,
+        .l_type   = F_WRLCK,
+    };
+
+    ret = fcntl(fd, F_GETLK, &fl);
+    return ret == 0;
+}
+
 bool qemu_has_ofd_lock(void)
 {
     qemu_probe_lock_ops();
-- 
2.24.3


