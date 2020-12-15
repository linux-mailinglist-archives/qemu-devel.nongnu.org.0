Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D505C2DA866
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 08:11:36 +0100 (CET)
Received: from localhost ([::1]:57794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kp4Uh-0008LK-Fw
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 02:11:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fengli@smartx.com>) id 1kp4SV-0007ik-1a
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 02:09:19 -0500
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:36982)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <fengli@smartx.com>) id 1kp4SS-0004qS-1o
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 02:09:18 -0500
Received: by mail-pg1-x541.google.com with SMTP id c12so14140769pgm.4
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 23:09:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smartx-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id;
 bh=Y3YpWoxnSryB8CjXGBpQCGG0yPrRQcYr04aKhX2Gn60=;
 b=Ttm3lkq8u18+qmFVtH7TYT8KrkiOgGUxvYrpNr+Hvi0/f6KFDJLx9e/I9SI5UYi7QO
 RQtVJZqsXF4Vj380iwW6WU8oShsTIxiqHErJyqJN6SO2iO3fcOSbw/15IZIG9oMSzf/D
 s8IjjGeWxI3uAVXptXSjEYwckp9ROrdB4Vy7XxovtSw71H/jW3EUmC6VP+bYAFWEGqNK
 9rFTfZdrTwEQTDrVrkUf9iDfz21zl6xTJW9Yyj783l0wHI0J/oEpn9EWK4JGAOLRSRL5
 ePuY5iFr0/ByBQpZ1ElR1T3L4nlbHnnKissICs8PHaUccAnpQVoNR1hb2m1VI+hZ1vTI
 /0Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Y3YpWoxnSryB8CjXGBpQCGG0yPrRQcYr04aKhX2Gn60=;
 b=r0sq0livXJE1SA33pT6A8t5azY1gOOMvRfbMvTVDTJXj9wZYcAXbinxyzHKzDTDIBE
 46IVqnkUcBAd+tJPp4/EjbOMOnJ4/65LoXINCaRlw/LXK7p6yryWH2sAwUg7D92MIAnf
 l771zUcXKhft45b08obNywTJPAtaUX+nAavTO2ZVZVl01t+ITKO5j9EdWkHkNrQysBUj
 ml0EU9+AcX4kMB8OJ/QkK4Id3kVa+DemDCtI6/z4tpQ7hDRdzPzHAU8tLfZn6zbarMfw
 zt4Mo58g1wulakK69SVS3T+FsLHj21dAiVO0vj1w4dJnqWNX2kAgC9tn8qXXCZuKd76K
 asOQ==
X-Gm-Message-State: AOAM5308cB7bhHxSoIIPHpvSC1Uf9+Osc6ms0gFI0588c0YNCIcO4Ztx
 Y04UsqK9gO/eCEty4v9TYutCDw==
X-Google-Smtp-Source: ABdhPJxz8pu0BZcFvyiurnr7QHlzo2fiO4Y4Byv/dUypCRAexm4cRD6LF9JNp9IZDABB3pAzryLn2w==
X-Received: by 2002:a63:e246:: with SMTP id y6mr17213592pgj.412.1608016153679; 
 Mon, 14 Dec 2020 23:09:13 -0800 (PST)
Received: from 64-217.abest.vip ([129.227.156.197])
 by smtp.gmail.com with ESMTPSA id r68sm22628105pfr.113.2020.12.14.23.09.11
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 14 Dec 2020 23:09:13 -0800 (PST)
From: Li Feng <fengli@smartx.com>
To: berrange@redhat.com, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org (open list:raw),
 qemu-devel@nongnu.org (open list:All patches CC here)
Subject: [PATCH v4] file-posix: detect the lock using the real file
Date: Tue, 15 Dec 2020 15:09:28 +0800
Message-Id: <1608016169-5639-1-git-send-email-fengli@smartx.com>
X-Mailer: git-send-email 1.8.3.1
Received-SPF: none client-ip=2607:f8b0:4864:20::541;
 envelope-from=fengli@smartx.com; helo=mail-pg1-x541.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
v4: use the fd as the qemu_has_file_lock argument.
v3: don't call the qemu_has_ofd_lock, use a new function instead.
v2: remove the refactoring.
---
 block/file-posix.c   | 66 +++++++++++++++++++++++++-------------------
 include/qemu/osdep.h |  1 +
 util/osdep.c         | 19 +++++++++++++
 3 files changed, 58 insertions(+), 28 deletions(-)

diff --git a/block/file-posix.c b/block/file-posix.c
index 806764f7e3..9708212f01 100644
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
@@ -607,6 +622,13 @@ static int raw_open_common(BlockDriverState *bs, QDict *options,
         break;
     case ON_OFF_AUTO_AUTO:
         s->use_lock = qemu_has_ofd_lock();
+        if (s->use_lock && !qemu_has_file_lock(s->fd)) {
+            /*
+             * When the os supports the OFD lock, but the filesystem doesn't
+             * support, just disable the file lock.
+             */
+            s->use_lock = false;
+        }
         break;
     default:
         abort();
@@ -625,22 +647,6 @@ static int raw_open_common(BlockDriverState *bs, QDict *options,
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
@@ -2388,6 +2394,7 @@ raw_co_create(BlockdevCreateOptions *options, Error **errp)
     int fd;
     uint64_t perm, shared;
     int result = 0;
+    bool use_lock;
 
     /* Validate options and set default values */
     assert(options->driver == BLOCKDEV_DRIVER_FILE);
@@ -2428,19 +2435,22 @@ raw_co_create(BlockdevCreateOptions *options, Error **errp)
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
index 66d01b9160..07de97e2c5 100644
--- a/util/osdep.c
+++ b/util/osdep.c
@@ -225,6 +225,25 @@ static void qemu_probe_lock_ops(void)
     }
 }
 
+bool qemu_has_file_lock(int fd)
+{
+#ifdef F_OFD_SETLK
+    int cmd = F_OFD_GETLK;
+#else
+    int cmd = F_GETLK;
+#endif
+    int ret;
+    struct flock fl = {
+        .l_whence = SEEK_SET,
+        .l_start  = 0,
+        .l_len    = 0,
+        .l_type   = F_WRLCK,
+    };
+
+    ret = fcntl(fd, cmd, &fl);
+    return ret == 0;
+}
+
 bool qemu_has_ofd_lock(void)
 {
     qemu_probe_lock_ops();
-- 
2.24.3


