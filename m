Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 311D92D2B97
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 14:03:56 +0100 (CET)
Received: from localhost ([::1]:55574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmcep-0004Tw-8S
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 08:03:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fengli@smartx.com>) id 1kmcac-0002tP-Du
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 07:59:39 -0500
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:41970)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <fengli@smartx.com>) id 1kmcaX-0001ZG-Ci
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 07:59:31 -0500
Received: by mail-pf1-x442.google.com with SMTP id t8so13832359pfg.8
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 04:59:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smartx-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id;
 bh=KqJC29+YUdSyqlCknlqea4A4DRzPWvH5hAjZ9mwdKDM=;
 b=QjnhRkKnWG26oAMXinUkDpr8Sm5XNQNnm6OzxvYXlkjUg94zDGjcVpaTEvl8CqWEEX
 5ck8WpuqZkQrOKqXksJyMgVkKq2N9T4OyCJRoJ1GZt2qgANQxOCSx41uf8vcEmiDWOPH
 9x2KFbNLqnZ4N61su/ik4z5yorjQEQ2kg4CFfGSd8nr03FIfQAQmZtT7I1KVRdCyusRy
 KsZ2X9GAG8Gcu6cZRJGRczbQjtWjouOxzBBDHYxhPdFPpRgOySc1jVD3p2tlpqy3AbaZ
 5fPoqu3NrBOxNT+MmEdcm7NIu2NCePNoJeQYLxjcEXD9NjuuLsowf7WRdsYGnfTB4ayw
 Llpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=KqJC29+YUdSyqlCknlqea4A4DRzPWvH5hAjZ9mwdKDM=;
 b=MYgA8ie/Vh6vivjAcFDIAya7JvJLY8CBOJ/iv1S4mBLNMxjmzIyZMcmsmTpO3HKOEy
 LU7hdAQsVF87P07G/QYf27ZURoGqUO3KHlU3Xyv1qXCvIQLwXxd5V2pZSpfdHFg6tSDF
 fKPpwDSFXu3UxV9LInWytbGwRQbixHretiZ24SjqNw/CZftU43Swki2pp1tt/NZqMWNn
 /SLW7/EHLxmwtmxx3DIam7jd//iGQLhkRKWme2qlfnXiRAU5K5gaZYNbiy0Z8587J+Xz
 jyz4o4EK5iekLyddY1uCMSC7wDEdr5uyl9iwuSTCsBCX2iTZ0UtwuxOj5xgbTVVs3o4R
 YDow==
X-Gm-Message-State: AOAM531ae7YIpJE6+8bxvFSzUkJ7pORZoC2Pi4vwSqHI7NjHfQaa6AmQ
 eAwD1N5HABJFe7f24B0NyHKvOg==
X-Google-Smtp-Source: ABdhPJw/XYHdUizP/HdqthgwuaIWJsKuAwz7pQqmiYN5MJS1YbC3iytVLlnfvumzJ21V5FgKzD8A2Q==
X-Received: by 2002:a17:90a:578f:: with SMTP id
 g15mr4262183pji.3.1607432366609; 
 Tue, 08 Dec 2020 04:59:26 -0800 (PST)
Received: from 64-217.abest.vip ([129.227.156.201])
 by smtp.gmail.com with ESMTPSA id d22sm2985412pjw.11.2020.12.08.04.59.24
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 08 Dec 2020 04:59:25 -0800 (PST)
From: Li Feng <fengli@smartx.com>
To: Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
 qemu-block@nongnu.org (open list:raw),
 qemu-devel@nongnu.org (open list:All patches CC here)
Subject: [PATCH] file-posix: detect the lock using the real file
Date: Tue,  8 Dec 2020 20:59:37 +0800
Message-Id: <1607432377-87084-1-git-send-email-fengli@smartx.com>
X-Mailer: git-send-email 1.8.3.1
Received-SPF: none client-ip=2607:f8b0:4864:20::442;
 envelope-from=fengli@smartx.com; helo=mail-pf1-x442.google.com
X-Spam_score_int: 14
X-Spam_score: 1.4
X-Spam_bar: +
X-Spam_report: (1.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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

In this patch, make the 'qemu_has_ofd_lock' with a filename be more generic
and reasonable.

Signed-off-by: Li Feng <fengli@smartx.com>
---
 block/file-posix.c         | 32 +++++++++++++++-------------
 include/qemu/osdep.h       |  2 +-
 tests/test-image-locking.c |  2 +-
 util/osdep.c               | 43 ++++++++++++++++++++++++--------------
 4 files changed, 47 insertions(+), 32 deletions(-)

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
index 66d01b9160..e7e502edd1 100644
--- a/util/osdep.c
+++ b/util/osdep.c
@@ -42,6 +42,7 @@ extern int madvise(char *, size_t, int);
 static bool fips_enabled = false;
 
 static const char *hw_version = QEMU_HW_VERSION;
+static const char *null_device = "/dev/null";
 
 int socket_set_cork(int fd, int v)
 {
@@ -187,11 +188,10 @@ static int qemu_parse_fdset(const char *param)
     return qemu_parse_fd(param);
 }
 
-static void qemu_probe_lock_ops(void)
+static void qemu_probe_lock_ops_fd(int fd)
 {
     if (fcntl_op_setlk == -1) {
 #ifdef F_OFD_SETLK
-        int fd;
         int ret;
         struct flock fl = {
             .l_whence = SEEK_SET,
@@ -200,17 +200,7 @@ static void qemu_probe_lock_ops(void)
             .l_type   = F_WRLCK,
         };
 
-        fd = open("/dev/null", O_RDWR);
-        if (fd < 0) {
-            fprintf(stderr,
-                    "Failed to open /dev/null for OFD lock probing: %s\n",
-                    strerror(errno));
-            fcntl_op_setlk = F_SETLK;
-            fcntl_op_getlk = F_GETLK;
-            return;
-        }
         ret = fcntl(fd, F_OFD_GETLK, &fl);
-        close(fd);
         if (!ret) {
             fcntl_op_setlk = F_OFD_SETLK;
             fcntl_op_getlk = F_OFD_GETLK;
@@ -225,9 +215,30 @@ static void qemu_probe_lock_ops(void)
     }
 }
 
-bool qemu_has_ofd_lock(void)
+static void qemu_probe_lock_ops(const char *filename)
+{
+    int fd;
+    if (filename) {
+        fd = open(filename, O_RDWR);
+    } else {
+        fd = open(null_device, O_RDONLY);
+    }
+    if (fd < 0) {
+        fprintf(stderr,
+                "Failed to open %s for OFD lock probing: %s\n",
+                filename ? filename : null_device,
+                strerror(errno));
+        fcntl_op_setlk = F_SETLK;
+        fcntl_op_getlk = F_GETLK;
+        return;
+    }
+    qemu_probe_lock_ops_fd(fd);
+    close(fd);
+}
+
+bool qemu_has_ofd_lock(const char *filename)
 {
-    qemu_probe_lock_ops();
+    qemu_probe_lock_ops(filename);
 #ifdef F_OFD_SETLK
     return fcntl_op_setlk == F_OFD_SETLK;
 #else
@@ -244,7 +255,7 @@ static int qemu_lock_fcntl(int fd, int64_t start, int64_t len, int fl_type)
         .l_len    = len,
         .l_type   = fl_type,
     };
-    qemu_probe_lock_ops();
+    qemu_probe_lock_ops_fd(fd);
     do {
         ret = fcntl(fd, fcntl_op_setlk, &fl);
     } while (ret == -1 && errno == EINTR);
@@ -270,7 +281,7 @@ int qemu_lock_fd_test(int fd, int64_t start, int64_t len, bool exclusive)
         .l_len    = len,
         .l_type   = exclusive ? F_WRLCK : F_RDLCK,
     };
-    qemu_probe_lock_ops();
+    qemu_probe_lock_ops_fd(fd);
     ret = fcntl(fd, fcntl_op_getlk, &fl);
     if (ret == -1) {
         return -errno;
-- 
2.24.3


