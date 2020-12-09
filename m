Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E0972D39F9
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 05:56:14 +0100 (CET)
Received: from localhost ([::1]:57968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmrWP-0003E2-Cm
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 23:56:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fengli@smartx.com>) id 1kmrV3-0002gS-DP
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 23:54:49 -0500
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:43358)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <fengli@smartx.com>) id 1kmrUt-00023X-NB
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 23:54:49 -0500
Received: by mail-pf1-x441.google.com with SMTP id c12so212536pfo.10
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 20:54:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smartx-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=zhTW2Y9/iIzSa8KmhfRffXZEL79KuIjBgeK6zCNDMBs=;
 b=MfvlirwE+hyR1fgl5+ORGSZk1N/wwmGX72ko9Fprl05a6Q8/8V1LPevjlyL3EVB5IN
 mrMicr7vUignfhi01j58ZcN/LkcRT8jFV9Ak2M0uuJ6AUs8Gkp6jBmsUP0C61vramLm0
 LcS2sNHXMF8AEImnHkxWfs+ccRvKp1tbZmwfkZK/ED24jDTq15NpVDv7q1CEsmnLF/q5
 z6tl7sMiHx3Elv69ma+ZpJlr1ZN0ytep7QRWjsXU3Po6K4I1c3xB/63Pn+Zm4YsCt/T0
 n7ow8m+GTzBcEBgGUrverqXHFJAVzTardQj0prcgXgIkXYNLgSAJPsgoj3YPjBnR4iAz
 +nzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=zhTW2Y9/iIzSa8KmhfRffXZEL79KuIjBgeK6zCNDMBs=;
 b=jrrHJMAq2pHEHkDh4vKwCb0akS6i8tFD9DL6mjDIldBZF9kYN9T0xPQuN9AChhxmo4
 VQx01gOWFqNbk0NrcQQQTv72fLdPqpmGJe6taH6r1kBldaM0rQLfRJYDTyGs17XaPs+v
 ST8ZYyTvj0psjU8AUc7xXumTr0+9pbe0J/cjgM03w3MlYzH4z935Z9y9Yyaz4FEnAcu2
 WoqnbxT37r4zzDP/50RKfyuctmb1jt6PpcpAre08pzoMeMdRsyV7N2ZlF3KWptzleoMq
 zXbNKAEHLlKqgnVYUsOjTKu7WcpGlUmd93GmTjvP9/h8SRYqccU9R2NUltzOod01o/tt
 /8Uw==
X-Gm-Message-State: AOAM531V7V/Refke9TAm6LgtjEHK8PvkFy/jryBHYfqdZv0T5EogPvCI
 ZlVQRKHQGAp6OSDIO6I4CwGgIA==
X-Google-Smtp-Source: ABdhPJzqYK1z0RTmI7lEinR+QQiFKgGT7UfnNNJW+N6gQXjbMvpXegQYJuj6PJkEA5V8AK5KeZOEww==
X-Received: by 2002:a05:6a00:1389:b029:18b:2d21:2f1a with SMTP id
 t9-20020a056a001389b029018b2d212f1amr501881pfg.1.1607489677076; 
 Tue, 08 Dec 2020 20:54:37 -0800 (PST)
Received: from 64-217.abest.vip ([129.227.156.200])
 by smtp.gmail.com with ESMTPSA id d4sm425850pjz.28.2020.12.08.20.54.34
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 08 Dec 2020 20:54:36 -0800 (PST)
From: Li Feng <fengli@smartx.com>
To: Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
 qemu-block@nongnu.org (open list:raw),
 qemu-devel@nongnu.org (open list:All patches CC here)
Subject: [PATCH v2] file-posix: detect the lock using the real file
Date: Wed,  9 Dec 2020 12:54:48 +0800
Message-Id: <1607489688-37088-1-git-send-email-fengli@smartx.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1607432377-87084-1-git-send-email-fengli@smartx.com>
References: <1607432377-87084-1-git-send-email-fengli@smartx.com>
Received-SPF: none client-ip=2607:f8b0:4864:20::441;
 envelope-from=fengli@smartx.com; helo=mail-pf1-x441.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_HELO_NONE=0.001,
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

In this patch, make the 'qemu_has_ofd_lock' with a filename be more
generic and reasonable.

Signed-off-by: Li Feng <fengli@smartx.com>
---
v2: remove the refactoring.
---
 block/file-posix.c         | 32 ++++++++++++++++++--------------
 include/qemu/osdep.h       |  2 +-
 tests/test-image-locking.c |  2 +-
 util/osdep.c               | 19 ++++++++++++-------
 4 files changed, 32 insertions(+), 23 deletions(-)

diff --git a/block/file-posix.c b/block/file-posix.c
index 806764f7e3..03be1b188c 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -595,7 +595,7 @@ static int raw_open_common(BlockDriverState *bs, QDict *options,
     switch (locking) {
     case ON_OFF_AUTO_ON:
         s->use_lock = true;
-        if (!qemu_has_ofd_lock()) {
+        if (!qemu_has_ofd_lock(filename)) {
             warn_report("File lock requested but OFD locking syscall is "
                         "unavailable, falling back to POSIX file locks");
             error_printf("Due to the implementation, locks can be lost "
@@ -606,7 +606,7 @@ static int raw_open_common(BlockDriverState *bs, QDict *options,
         s->use_lock = false;
         break;
     case ON_OFF_AUTO_AUTO:
-        s->use_lock = qemu_has_ofd_lock();
+        s->use_lock = qemu_has_ofd_lock(filename);
         break;
     default:
         abort();
@@ -2388,6 +2388,7 @@ raw_co_create(BlockdevCreateOptions *options, Error **errp)
     int fd;
     uint64_t perm, shared;
     int result = 0;
+    bool use_lock;
 
     /* Validate options and set default values */
     assert(options->driver == BLOCKDEV_DRIVER_FILE);
@@ -2428,19 +2429,22 @@ raw_co_create(BlockdevCreateOptions *options, Error **errp)
     perm = BLK_PERM_WRITE | BLK_PERM_RESIZE;
     shared = BLK_PERM_ALL & ~BLK_PERM_RESIZE;
 
-    /* Step one: Take locks */
-    result = raw_apply_lock_bytes(NULL, fd, perm, ~shared, false, errp);
-    if (result < 0) {
-        goto out_close;
-    }
+    use_lock = qemu_has_ofd_lock(file_opts->filename);
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
index f9ec8c84e9..349adad465 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -512,7 +512,7 @@ int qemu_dup(int fd);
 int qemu_lock_fd(int fd, int64_t start, int64_t len, bool exclusive);
 int qemu_unlock_fd(int fd, int64_t start, int64_t len);
 int qemu_lock_fd_test(int fd, int64_t start, int64_t len, bool exclusive);
-bool qemu_has_ofd_lock(void);
+bool qemu_has_ofd_lock(const char *filename);
 #endif
 
 #if defined(__HAIKU__) && defined(__i386__)
diff --git a/tests/test-image-locking.c b/tests/test-image-locking.c
index ba057bd66c..3e80246081 100644
--- a/tests/test-image-locking.c
+++ b/tests/test-image-locking.c
@@ -149,7 +149,7 @@ int main(int argc, char **argv)
 
     g_test_init(&argc, &argv, NULL);
 
-    if (qemu_has_ofd_lock()) {
+    if (qemu_has_ofd_lock(NULL)) {
         g_test_add_func("/image-locking/basic", test_image_locking_basic);
         g_test_add_func("/image-locking/set-perm-abort", test_set_perm_abort);
     }
diff --git a/util/osdep.c b/util/osdep.c
index 66d01b9160..20119aa9ae 100644
--- a/util/osdep.c
+++ b/util/osdep.c
@@ -187,7 +187,7 @@ static int qemu_parse_fdset(const char *param)
     return qemu_parse_fd(param);
 }
 
-static void qemu_probe_lock_ops(void)
+static void qemu_probe_lock_ops(const char *filename)
 {
     if (fcntl_op_setlk == -1) {
 #ifdef F_OFD_SETLK
@@ -200,10 +200,15 @@ static void qemu_probe_lock_ops(void)
             .l_type   = F_WRLCK,
         };
 
-        fd = open("/dev/null", O_RDWR);
+        if (filename) {
+            fd = open(filename, O_RDWR);
+        } else {
+            fd = open("/dev/null", O_RDONLY);
+        }
         if (fd < 0) {
             fprintf(stderr,
-                    "Failed to open /dev/null for OFD lock probing: %s\n",
+                    "Failed to open %s for OFD lock probing: %s\n",
+                    filename ? filename : "/dev/null",
                     strerror(errno));
             fcntl_op_setlk = F_SETLK;
             fcntl_op_getlk = F_GETLK;
@@ -225,9 +230,9 @@ static void qemu_probe_lock_ops(void)
     }
 }
 
-bool qemu_has_ofd_lock(void)
+bool qemu_has_ofd_lock(const char *filename)
 {
-    qemu_probe_lock_ops();
+    qemu_probe_lock_ops(filename);
 #ifdef F_OFD_SETLK
     return fcntl_op_setlk == F_OFD_SETLK;
 #else
@@ -244,7 +249,7 @@ static int qemu_lock_fcntl(int fd, int64_t start, int64_t len, int fl_type)
         .l_len    = len,
         .l_type   = fl_type,
     };
-    qemu_probe_lock_ops();
+    qemu_probe_lock_ops(NULL);
     do {
         ret = fcntl(fd, fcntl_op_setlk, &fl);
     } while (ret == -1 && errno == EINTR);
@@ -270,7 +275,7 @@ int qemu_lock_fd_test(int fd, int64_t start, int64_t len, bool exclusive)
         .l_len    = len,
         .l_type   = exclusive ? F_WRLCK : F_RDLCK,
     };
-    qemu_probe_lock_ops();
+    qemu_probe_lock_ops(NULL);
     ret = fcntl(fd, fcntl_op_getlk, &fl);
     if (ret == -1) {
         return -errno;
-- 
2.24.3


