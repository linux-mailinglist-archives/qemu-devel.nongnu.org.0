Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 579F72B87C8
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 23:36:51 +0100 (CET)
Received: from localhost ([::1]:42316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfW4H-0000o4-Rs
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 17:36:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <msys.mizuma@gmail.com>)
 id 1kfVxS-0007JS-55; Wed, 18 Nov 2020 17:29:46 -0500
Received: from mail-qv1-xf42.google.com ([2607:f8b0:4864:20::f42]:39846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <msys.mizuma@gmail.com>)
 id 1kfVxP-0001Tw-IS; Wed, 18 Nov 2020 17:29:45 -0500
Received: by mail-qv1-xf42.google.com with SMTP id ek7so1904144qvb.6;
 Wed, 18 Nov 2020 14:29:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=Xll6bGXfLhJ8sDfx6zBdkywKzwaBwlmt4s/B4RiH8eg=;
 b=FTSEb4nykJZB8cJzxz2Xz8AZ+O+qOyX/dG2JhLr4/Q/V4F90VO1SKHSdrTX3DL39qo
 SQtRQFqu1lS8v0B7bZLH7bt4BwtROQquKmrE+WLBQYgLMTJHIEY90fP5jGOCeOy5+46p
 wEe1qf8wAU8aiFwPuz7NRv9ruBak27fhqGaLA8ZwOsotGZcYd1++BdBrZ21SRuys4vR6
 qIQCJEmNDV0cKBMJOL+/JPGHo1ytbPHIJh/tyLFucQ1pobqk+Hq4gpg3dzU7zCHPtN0V
 xQeBU1qB3tTuDWwjXB9HQ2Ji3rptwLx55urbmMkArBOD0+x5XN2hMiWDlxTdj0mu4ITN
 8wBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Xll6bGXfLhJ8sDfx6zBdkywKzwaBwlmt4s/B4RiH8eg=;
 b=O2gS0xyeL5JozxsdEZNDXPpyUnJGorgoo0gH89vMurZL0hp3CNas/8bCD+16dL9CPw
 jYRc/OFX+H64ntA1+Iu8KPGt2X0Q2rIfHCc0Ey61+PZWNIQwNmmYzOOrpbcLF+7hSPfK
 Wk4pxXoqG+kq1NEKiNnmPBIJ5oWPr4G2h0TTF4wE4Nnp2ffeoKSi48UTqsxglZimSKIL
 5Wc2fa5Bh0Nd0IXEDS3JwENaXKiMB/CT34hlqU4hEr1ptgS3xiUS9qSZPTDsZvWoZUtz
 SSLfJzRw5V5w8TH+DgomrGGW5YXotqUgw2zEP7vNo1W8Nud3vBIG6PRUK8/yMwSD6J14
 vyhA==
X-Gm-Message-State: AOAM5324sUJUnobse8Hto6Po5NcxlySw2B3yxZKW6o3MGqKigOwhYDe0
 SbhIY5r8CP7DZZwDgUMnHA==
X-Google-Smtp-Source: ABdhPJzX6bVdOir4aDTKB2XNf40OjSwfnn8EnNlQZqnbFfROq6SLg9ue/TjcmqNO8T+7dTfdcFALvA==
X-Received: by 2002:ad4:4e13:: with SMTP id dl19mr7277999qvb.24.1605738581091; 
 Wed, 18 Nov 2020 14:29:41 -0800 (PST)
Received: from localhost
 (209-6-122-159.s2973.c3-0.arl-cbr1.sbo-arl.ma.cable.rcncustomer.com.
 [209.6.122.159])
 by smtp.gmail.com with ESMTPSA id a83sm10004891qkc.77.2020.11.18.14.29.39
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 18 Nov 2020 14:29:40 -0800 (PST)
From: Masayoshi Mizuma <msys.mizuma@gmail.com>
To: Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
 qemu-block@nongnu.org
Subject: [PATCH v2] file-posix: Use OFD lock only if the filesystem supports
 the lock
Date: Wed, 18 Nov 2020 17:28:42 -0500
Message-Id: <20201118222842.8772-1-msys.mizuma@gmail.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=2607:f8b0:4864:20::f42;
 envelope-from=msys.mizuma@gmail.com; helo=mail-qv1-xf42.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Masayoshi Mizuma <m.mizuma@jp.fujitsu.com>,
 Masayoshi Mizuma <msys.mizuma@gmail.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Masayoshi Mizuma <m.mizuma@jp.fujitsu.com>

locking=auto doesn't work if the filesystem doesn't support OFD lock.
In that situation, following error happens:

  qemu-system-x86_64: -blockdev driver=qcow2,node-name=disk,file.driver=file,file.filename=/mnt/guest.qcow2,file.locking=auto: Failed to lock byte 100

qemu_probe_lock_ops() judges whether qemu can use OFD lock
or not with doing fcntl(F_OFD_GETLK) to /dev/null. So the
error happens if /dev/null supports OFD lock, but the filesystem
doesn't support the lock.

Lock the actual file, not /dev/null, using F_OFD_SETLK and if that
fails, then fallback to F_SETLK.

Fixes: ca749954b0 ("osdep: Add runtime OFD lock detection")
Signed-off-by: Masayoshi Mizuma <m.mizuma@jp.fujitsu.com>
---
 block/file-posix.c         |  56 ++++++++---------
 include/qemu/osdep.h       |   2 +-
 tests/test-image-locking.c |  13 +++-
 util/osdep.c               | 125 +++++++++++++++++++++----------------
 4 files changed, 111 insertions(+), 85 deletions(-)

diff --git a/block/file-posix.c b/block/file-posix.c
index d5fd1dbcd2..ff8a2804c5 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -584,34 +584,6 @@ static int raw_open_common(BlockDriverState *bs, QDict *options,
     s->use_linux_io_uring = (aio == BLOCKDEV_AIO_OPTIONS_IO_URING);
 #endif
 
-    locking = qapi_enum_parse(&OnOffAuto_lookup,
-                              qemu_opt_get(opts, "locking"),
-                              ON_OFF_AUTO_AUTO, &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
-        ret = -EINVAL;
-        goto fail;
-    }
-    switch (locking) {
-    case ON_OFF_AUTO_ON:
-        s->use_lock = true;
-        if (!qemu_has_ofd_lock()) {
-            warn_report("File lock requested but OFD locking syscall is "
-                        "unavailable, falling back to POSIX file locks");
-            error_printf("Due to the implementation, locks can be lost "
-                         "unexpectedly.\n");
-        }
-        break;
-    case ON_OFF_AUTO_OFF:
-        s->use_lock = false;
-        break;
-    case ON_OFF_AUTO_AUTO:
-        s->use_lock = qemu_has_ofd_lock();
-        break;
-    default:
-        abort();
-    }
-
     str = qemu_opt_get(opts, "pr-manager");
     if (str) {
         s->pr_mgr = pr_manager_lookup(str, &local_err);
@@ -641,6 +613,34 @@ static int raw_open_common(BlockDriverState *bs, QDict *options,
     }
     s->fd = fd;
 
+    locking = qapi_enum_parse(&OnOffAuto_lookup,
+                              qemu_opt_get(opts, "locking"),
+                              ON_OFF_AUTO_AUTO, &local_err);
+    if (local_err) {
+        error_propagate(errp, local_err);
+        ret = -EINVAL;
+        goto fail;
+    }
+    switch (locking) {
+    case ON_OFF_AUTO_ON:
+        s->use_lock = true;
+        if (!qemu_has_ofd_lock(s->fd)) {
+            warn_report("File lock requested but OFD locking syscall is "
+                        "unavailable, falling back to POSIX file locks");
+            error_printf("Due to the implementation, locks can be lost "
+                         "unexpectedly.\n");
+        }
+        break;
+    case ON_OFF_AUTO_OFF:
+        s->use_lock = false;
+        break;
+    case ON_OFF_AUTO_AUTO:
+        s->use_lock = qemu_has_ofd_lock(s->fd);
+        break;
+    default:
+        abort();
+    }
+
     /* Check s->open_flags rather than bdrv_flags due to auto-read-only */
     if (s->open_flags & O_RDWR) {
         ret = check_hdev_writable(s->fd);
diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index f9ec8c84e9..222138a81a 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -512,7 +512,7 @@ int qemu_dup(int fd);
 int qemu_lock_fd(int fd, int64_t start, int64_t len, bool exclusive);
 int qemu_unlock_fd(int fd, int64_t start, int64_t len);
 int qemu_lock_fd_test(int fd, int64_t start, int64_t len, bool exclusive);
-bool qemu_has_ofd_lock(void);
+bool qemu_has_ofd_lock(int fd);
 #endif
 
 #if defined(__HAIKU__) && defined(__i386__)
diff --git a/tests/test-image-locking.c b/tests/test-image-locking.c
index ba057bd66c..7a28d9d043 100644
--- a/tests/test-image-locking.c
+++ b/tests/test-image-locking.c
@@ -144,14 +144,21 @@ static void test_set_perm_abort(void)
 
 int main(int argc, char **argv)
 {
+    int fd;
+
     bdrv_init();
     qemu_init_main_loop(&error_abort);
 
     g_test_init(&argc, &argv, NULL);
 
-    if (qemu_has_ofd_lock()) {
-        g_test_add_func("/image-locking/basic", test_image_locking_basic);
-        g_test_add_func("/image-locking/set-perm-abort", test_set_perm_abort);
+    fd = open("/dev/null", O_RDONLY);
+
+    if (fd != -1 && qemu_has_ofd_lock(fd)) {
+        if (qemu_has_ofd_lock(fd)) {
+            g_test_add_func("/image-locking/basic", test_image_locking_basic);
+            g_test_add_func("/image-locking/set-perm-abort",
+                            test_set_perm_abort);
+        }
     }
 
     return g_test_run();
diff --git a/util/osdep.c b/util/osdep.c
index 66d01b9160..ff8c2473d2 100644
--- a/util/osdep.c
+++ b/util/osdep.c
@@ -117,9 +117,6 @@ int qemu_mprotect_none(void *addr, size_t size)
 
 #ifndef _WIN32
 
-static int fcntl_op_setlk = -1;
-static int fcntl_op_getlk = -1;
-
 /*
  * Dups an fd and sets the flags
  */
@@ -187,68 +184,82 @@ static int qemu_parse_fdset(const char *param)
     return qemu_parse_fd(param);
 }
 
-static void qemu_probe_lock_ops(void)
+bool qemu_has_ofd_lock(int fd)
 {
-    if (fcntl_op_setlk == -1) {
 #ifdef F_OFD_SETLK
-        int fd;
-        int ret;
-        struct flock fl = {
-            .l_whence = SEEK_SET,
-            .l_start  = 0,
-            .l_len    = 0,
-            .l_type   = F_WRLCK,
-        };
-
-        fd = open("/dev/null", O_RDWR);
-        if (fd < 0) {
-            fprintf(stderr,
-                    "Failed to open /dev/null for OFD lock probing: %s\n",
-                    strerror(errno));
-            fcntl_op_setlk = F_SETLK;
-            fcntl_op_getlk = F_GETLK;
-            return;
-        }
-        ret = fcntl(fd, F_OFD_GETLK, &fl);
-        close(fd);
-        if (!ret) {
-            fcntl_op_setlk = F_OFD_SETLK;
-            fcntl_op_getlk = F_OFD_GETLK;
-        } else {
-            fcntl_op_setlk = F_SETLK;
-            fcntl_op_getlk = F_GETLK;
-        }
+    int ret;
+    struct flock fl = {
+        .l_whence = SEEK_SET,
+        .l_start  = 0,
+        .l_len    = 0,
+        .l_type   = F_RDLCK,
+        .l_pid    = 0,
+    };
+
+    ret = fcntl(fd, F_OFD_GETLK, &fl);
+
+    return ret == 0;
 #else
-        fcntl_op_setlk = F_SETLK;
-        fcntl_op_getlk = F_GETLK;
+    return false;
 #endif
-    }
 }
 
-bool qemu_has_ofd_lock(void)
+static int qemu_fcntl(int fd, struct flock *fl, bool setlk, bool *ofd_lock)
 {
-    qemu_probe_lock_ops();
+    int ret;
+    int op = setlk ? F_SETLK : F_GETLK;
+
+    if (*ofd_lock) {
 #ifdef F_OFD_SETLK
-    return fcntl_op_setlk == F_OFD_SETLK;
+        if (op == F_SETLK) {
+            op = F_OFD_SETLK;
+        } else {
+            op = F_OFD_GETLK;
+        }
+
+        ret = fcntl(fd, op, fl);
+        if (ret == -1 && errno == EINVAL) {
+            *ofd_lock = false;
+            if (op == F_OFD_SETLK) {
+                op = F_SETLK;
+            } else {
+                op = F_GETLK;
+            }
+        }
 #else
-    return false;
+        *ofd_lock = false;
 #endif
+    }
+    if (!*ofd_lock) {
+        ret = fcntl(fd, op, fl);
+    }
+
+    return ret;
 }
 
-static int qemu_lock_fcntl(int fd, int64_t start, int64_t len, int fl_type)
+static inline int _qemu_lock_fcntl(int fd, struct flock *fl)
 {
     int ret;
+    bool ofd_lock = true;
+
+    do {
+        ret = qemu_fcntl(fd, fl, true, &ofd_lock);
+    } while (ret == -1 && errno == EINTR);
+
+    return ret == -1 ? -errno : 0;
+}
+
+static int qemu_lock_fcntl(int fd, int64_t start, int64_t len, int fl_type)
+{
     struct flock fl = {
         .l_whence = SEEK_SET,
         .l_start  = start,
         .l_len    = len,
         .l_type   = fl_type,
+        .l_pid    = 0,
     };
-    qemu_probe_lock_ops();
-    do {
-        ret = fcntl(fd, fcntl_op_setlk, &fl);
-    } while (ret == -1 && errno == EINTR);
-    return ret == -1 ? -errno : 0;
+
+    return _qemu_lock_fcntl(fd, &fl);
 }
 
 int qemu_lock_fd(int fd, int64_t start, int64_t len, bool exclusive)
@@ -261,22 +272,30 @@ int qemu_unlock_fd(int fd, int64_t start, int64_t len)
     return qemu_lock_fcntl(fd, start, len, F_UNLCK);
 }
 
-int qemu_lock_fd_test(int fd, int64_t start, int64_t len, bool exclusive)
+static inline int _qemu_lock_fd_test(int fd, struct flock *fl)
 {
     int ret;
+    bool ofd_lock = true;
+
+    ret = qemu_fcntl(fd, fl, false, &ofd_lock);
+    if (ret == -1) {
+        return -errno;
+    } else {
+        return fl->l_type == F_UNLCK ? 0 : -EAGAIN;
+    }
+}
+
+int qemu_lock_fd_test(int fd, int64_t start, int64_t len, bool exclusive)
+{
     struct flock fl = {
         .l_whence = SEEK_SET,
         .l_start  = start,
         .l_len    = len,
         .l_type   = exclusive ? F_WRLCK : F_RDLCK,
+        .l_pid    = 0,
     };
-    qemu_probe_lock_ops();
-    ret = fcntl(fd, fcntl_op_getlk, &fl);
-    if (ret == -1) {
-        return -errno;
-    } else {
-        return fl.l_type == F_UNLCK ? 0 : -EAGAIN;
-    }
+
+    return _qemu_lock_fd_test(fd, &fl);
 }
 #endif
 
-- 
2.27.0


