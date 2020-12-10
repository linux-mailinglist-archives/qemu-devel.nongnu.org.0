Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2EAE2D62F2
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 18:04:47 +0100 (CET)
Received: from localhost ([::1]:54052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knPMz-0005pN-Sj
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 12:04:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fengli@smartx.com>) id 1knOxN-0004f9-5H
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 11:38:17 -0500
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:32996)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <fengli@smartx.com>) id 1knOxK-0004Dc-G7
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 11:38:16 -0500
Received: by mail-pg1-x542.google.com with SMTP id o4so4724625pgj.0
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 08:38:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smartx-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id;
 bh=JzJ5j2j1RYfOUcN3mcMsR2iB/uIWdqx6Tnrj8acZOJ0=;
 b=rhxRh81l46hsXe/FKCfIm5dxiO+uofIG2OzRJdTawBKubaePY73kS0mNuTSH8sfUt2
 TZzMFXLt5e11ZORwYp26swkmuG2LILpdh1Wdvmh4elFCOV63JL7VNTnVWEB/8g17IE+j
 lePFopRfSz2900U8gaWqi6UiOuWA3CiSqJlRACuBH4S7sibOLRgYgow7t5qYgE/yhQto
 oXfFIrBYPPpBPiVoRBjDnHXhmFClWz18bqBMVDbbA7dyazQTw4Gc3V8/aQi6aUnuYBNo
 ywEpPUmMBGx0Db5BOJjrrRIrM/VxjjfnoFzgR4Rdlda/dbPTBi8DGOnwYcxPe8kiOJsI
 1+sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=JzJ5j2j1RYfOUcN3mcMsR2iB/uIWdqx6Tnrj8acZOJ0=;
 b=pNSicFwBIy1fcKZilS4RqtroiJJKjmBsm1XsCJT7qVrarZ6+nrOMmpu1/jM5fld9/e
 /jTmCwsSBwyStpI2yIgAFyCsxinPrIukn1K9VV1pAAZ8N60+DfDvd8VsYi7AGcKWMC5v
 Fh8lIARW1w16UlCP/5GHIOBLhEiyp4fpnJ+MVWAoMBjrp8qXuocty4wFfU8bNwxccwVk
 Zq1fYlzCQ2aQRpAhpzoL8fsultIXfb4rC//eKS2vt0E3XHSUmVMBA1+YwKvxhXxRlYJg
 a7AuCHvA+D8PouikBUrM/jNdLy5z2jSTsw2OlgtBzfxypxB1WCqZADmvhiv9fkAd/4XE
 W83A==
X-Gm-Message-State: AOAM531TkUdd3BDh79Y78ZwoBefe+bxL60xHaqZ8hB4zP5C3I1N8KNRD
 rQM2cnQN0f9rZQo0FwyCV355TQ==
X-Google-Smtp-Source: ABdhPJwcw+FGnwjojKo+PZSGgui2wGKrK6Zn/oOlkkepHQAvkv0UFBnI8N7Hg9nAv3pGfxn5sqBGqA==
X-Received: by 2002:a17:90a:4042:: with SMTP id
 k2mr8691704pjg.160.1607618291960; 
 Thu, 10 Dec 2020 08:38:11 -0800 (PST)
Received: from 64-217.abest.vip ([129.227.156.197])
 by smtp.gmail.com with ESMTPSA id u7sm6576343pfh.115.2020.12.10.08.38.09
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 10 Dec 2020 08:38:11 -0800 (PST)
From: Li Feng <fengli@smartx.com>
To: berrange@redhat.com, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org (open list:raw),
 qemu-devel@nongnu.org (open list:All patches CC here)
Subject: [PATCH v3] file-posix: detect the lock using the real file
Date: Fri, 11 Dec 2020 00:38:19 +0800
Message-Id: <1607618299-55092-1-git-send-email-fengli@smartx.com>
X-Mailer: git-send-email 1.8.3.1
Received-SPF: none client-ip=2607:f8b0:4864:20::542;
 envelope-from=fengli@smartx.com; helo=mail-pg1-x542.google.com
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

Add a new function 'qemu_has_file_lock' to detect if the filesystem supports locks
or not.
And when the drive is auto mode, use the 'qemu_has_file_lock' to set the toggle.

Signed-off-by: Li Feng <fengli@smartx.com>
---
v3: don't call the qemu_has_ofd_lock, use a new function instead.
v2: remove the refactoring.
---
 block/file-posix.c   | 30 +++++++++++++++++-------------
 include/qemu/osdep.h |  1 +
 util/osdep.c         | 29 +++++++++++++++++++++++++++++
 3 files changed, 47 insertions(+), 13 deletions(-)

diff --git a/block/file-posix.c b/block/file-posix.c
index 806764f7e3..48f9a32de2 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -606,7 +606,7 @@ static int raw_open_common(BlockDriverState *bs, QDict *options,
         s->use_lock = false;
         break;
     case ON_OFF_AUTO_AUTO:
-        s->use_lock = qemu_has_ofd_lock();
+        s->use_lock = qemu_has_file_lock(filename);
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
+    use_lock = qemu_has_file_lock(file_opts->filename);
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
index f9ec8c84e9..593ae0f4d2 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -513,6 +513,7 @@ int qemu_lock_fd(int fd, int64_t start, int64_t len, bool exclusive);
 int qemu_unlock_fd(int fd, int64_t start, int64_t len);
 int qemu_lock_fd_test(int fd, int64_t start, int64_t len, bool exclusive);
 bool qemu_has_ofd_lock(void);
+bool qemu_has_file_lock(const char *filename);
 #endif
 
 #if defined(__HAIKU__) && defined(__i386__)
diff --git a/util/osdep.c b/util/osdep.c
index 66d01b9160..5d9961d261 100644
--- a/util/osdep.c
+++ b/util/osdep.c
@@ -225,6 +225,35 @@ static void qemu_probe_lock_ops(void)
     }
 }
 
+bool qemu_has_file_lock(const char *filename)
+{
+#ifdef F_OFD_SETLK
+    int cmd = F_OFD_GETLK;
+#else
+    int cmd = F_GETLK;
+#endif
+        int fd;
+        int ret;
+        struct flock fl = {
+            .l_whence = SEEK_SET,
+            .l_start  = 0,
+            .l_len    = 0,
+            .l_type   = F_WRLCK,
+        };
+
+        fd = open(filename, O_RDWR);
+        if (fd < 0) {
+            fprintf(stderr,
+                    "Failed to open %s for OFD lock probing: %s\n",
+                    filename,
+                    strerror(errno));
+            return false;
+        }
+        ret = fcntl(fd, cmd, &fl);
+        close(fd);
+        return ret == 0;
+}
+
 bool qemu_has_ofd_lock(void)
 {
     qemu_probe_lock_ops();
-- 
2.24.3


