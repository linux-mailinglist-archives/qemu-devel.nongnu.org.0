Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C2A442CFC7
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 03:02:09 +0200 (CEST)
Received: from localhost ([::1]:46622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1map8K-0000YD-2t
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 21:02:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1manIo-0004A6-D6
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 19:04:50 -0400
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732]:45789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1manIk-00055i-8m
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 19:04:49 -0400
Received: by mail-qk1-x732.google.com with SMTP id q125so3817837qkd.12
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 16:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yAjmiIyIXonejlBSNKjPiX6PuZ66veKWZwcLgc4mA+s=;
 b=QXGm5AC9tCUNruC2EFjhAZ6oSWD/Rj+e7ih1n8Dff+b9rQ0pFDYF0AIO+UgfcgmGXz
 YV6b2UsW8+0Q+FV/0+p36DqidbXcTQ/BAsoKtdMELWAj/OQ43WZwhBdyLQMJKRgNPDk1
 zMUoIS3SlpSaJnPdZsQvTfV6/AqIcrwNeYgFFuJ8YPaVsMJk8ePt5nUgyvny2gmP5ckd
 Sfpz9haxmDyYMgph2NrqxXvNy4+QRHO7gXp5oy7NLJkChXFFnJsBPihDQi7fTiPbkFlU
 kcqJNfOU7pRqNUX/yJLZdf/x9YFHWBSjjoIjOvypeFwBbRCRVwOLN9XnJiLmpyTBYbWE
 S6UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yAjmiIyIXonejlBSNKjPiX6PuZ66veKWZwcLgc4mA+s=;
 b=Rn7xSlkMfpvi5TJYP8p618MCmsq42T9rq43xe20BCr83S4LgCNPpNmxEYzzjsvH8ZZ
 ESWZ+Uje2l9ziVr+XWOMvdQk3FIL+Y047cvTZj36ICRnHwbJQjpwniV0RKr5GekXGXUD
 2TmhSTNknerGp/8KjH7yM3diuitdg6ughbfMXfgRetqf6rMkEf5SsuNCkyaBeZon0xBd
 6uFICnYU4oHsI/T/yi7MBEQl/jDuzn9yGfBHZdGl7tIZgdR47NLPe4vFREDZdgwBXnYh
 xdCAmWu6I7CWk9KL6gT0OsMXqB4LdTynIf/u+6YA1kM51TRWWihgrqlhZDuxaRIF/OnK
 bO/A==
X-Gm-Message-State: AOAM530Ci0i3612KhT3YWwo/GGXoTDUAo22h+h0Ud7ouDNPLCAc1GSSM
 TdYWiBJi2Xqv+pqC3xIQCmLDZ533S0+klg==
X-Google-Smtp-Source: ABdhPJzdA3T8Hp0Q1P0WhjYYz4nMMLylxubAGenS/aojvfnT55Z38OnUD1jSDz0lnUfxqmP8Uxgv3Q==
X-Received: by 2002:ae9:df82:: with SMTP id t124mr1800193qkf.69.1634166284466; 
 Wed, 13 Oct 2021 16:04:44 -0700 (PDT)
Received: from localhost.localdomain
 (209-6-248-219.s2265.c3-0.wrx-ubr1.sbo-wrx.ma.cable.rcncustomer.com.
 [209.6.248.219])
 by smtp.gmail.com with ESMTPSA id w11sm778680qta.50.2021.10.13.16.04.43
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 13 Oct 2021 16:04:44 -0700 (PDT)
From: Will Cohen <wwcohen@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/11] 9p: darwin: Provide a fallback implementation for
 utimensat
Date: Wed, 13 Oct 2021 19:04:03 -0400
Message-Id: <20211013230405.32170-10-wwcohen@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211013230405.32170-1-wwcohen@gmail.com>
References: <20211013230405.32170-1-wwcohen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::732;
 envelope-from=wwcohen@gmail.com; helo=mail-qk1-x732.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 13 Oct 2021 20:55:22 -0400
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
Cc: Keno Fischer <keno@juliacomputing.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Keno Fischer <keno@juliacomputing.com>

This function is new in Mac OS 10.13. Provide a fallback implementation
when building against older SDKs. The complication in the definition comes
having to separately handle the used SDK version and the target OS version.

- If the SDK version is too low (__MAC_10_13 not defined), utimensat is not
  defined in the header, so we must not try to use it (doing so would error).
- Otherwise, if the targetted OS version is at least 10.13, we know this
  function is available, so we can unconditionally call it.
- Lastly, we check for the availability of the __builtin_available macro to
  potentially insert a dynamic check for this OS version. However, __builtin_available
  is only available with sufficiently recent versions of clang and while all
  Apple clang versions that ship with Xcode versions that support the 10.13
  SDK support with builtin, we want to allow building with compilers other
  than Apple clang that may not support this builtin.

Signed-off-by: Keno Fischer <keno@juliacomputing.com>
---
 hw/9pfs/9p-local.c       |  2 +-
 hw/9pfs/9p-util-darwin.c | 96 ++++++++++++++++++++++++++++++++++++++++
 hw/9pfs/9p-util-linux.c  |  6 +++
 hw/9pfs/9p-util.h        |  8 ++++
 hw/9pfs/9p.c             |  1 +
 5 files changed, 112 insertions(+), 1 deletion(-)

diff --git a/hw/9pfs/9p-local.c b/hw/9pfs/9p-local.c
index 2bfff79b12..4268703d05 100644
--- a/hw/9pfs/9p-local.c
+++ b/hw/9pfs/9p-local.c
@@ -1076,7 +1076,7 @@ static int local_utimensat(FsContext *s, V9fsPath *fs_path,
         goto out;
     }
 
-    ret = utimensat(dirfd, name, buf, AT_SYMLINK_NOFOLLOW);
+    ret = utimensat_nofollow(dirfd, name, buf);
     close_preserve_errno(dirfd);
 out:
     g_free(dirpath);
diff --git a/hw/9pfs/9p-util-darwin.c b/hw/9pfs/9p-util-darwin.c
index cdb4c9e24c..ac414bcbfd 100644
--- a/hw/9pfs/9p-util-darwin.c
+++ b/hw/9pfs/9p-util-darwin.c
@@ -62,3 +62,99 @@ int fsetxattrat_nofollow(int dirfd, const char *filename, const char *name,
     close_preserve_errno(fd);
     return ret;
 }
+
+#ifndef __has_builtin
+#define __has_builtin(x) 0
+#endif
+
+static int update_times_from_stat(int fd, struct timespec times[2],
+                                  int update0, int update1)
+{
+    struct stat buf;
+    int ret = fstat(fd, &buf);
+    if (ret == -1) {
+        return ret;
+    }
+    if (update0) {
+        times[0] = buf.st_atimespec;
+    }
+    if (update1) {
+        times[1] = buf.st_mtimespec;
+    }
+    return 0;
+}
+
+int utimensat_nofollow(int dirfd, const char *filename,
+                       const struct timespec times_in[2])
+{
+    int ret, fd;
+    int special0, special1;
+    struct timeval futimes_buf[2];
+    struct timespec times[2];
+    memcpy(times, times_in, 2 * sizeof(struct timespec));
+
+/* Check whether we have an SDK version that defines utimensat */
+#if defined(__MAC_10_13)
+# if __MAC_OS_X_VERSION_MIN_REQUIRED >= __MAC_10_13
+#  define UTIMENSAT_AVAILABLE 1
+# elif __has_builtin(__builtin_available)
+#  define UTIMENSAT_AVAILABLE __builtin_available(macos 10.13, *)
+# else
+#  define UTIMENSAT_AVAILABLE 0
+# endif
+    if (UTIMENSAT_AVAILABLE) {
+        return utimensat(dirfd, filename, times, AT_SYMLINK_NOFOLLOW);
+    }
+#endif
+
+    /* utimensat not available. Use futimes. */
+    fd = openat_file(dirfd, filename, O_PATH_9P_UTIL | O_NOFOLLOW, 0);
+    if (fd == -1) {
+        return -1;
+    }
+
+    special0 = times[0].tv_nsec == UTIME_OMIT;
+    special1 = times[1].tv_nsec == UTIME_OMIT;
+    if (special0 || special1) {
+        /* If both are set, nothing to do */
+        if (special0 && special1) {
+            ret = 0;
+            goto done;
+        }
+
+        ret = update_times_from_stat(fd, times, special0, special1);
+        if (ret < 0) {
+            goto done;
+        }
+    }
+
+    special0 = times[0].tv_nsec == UTIME_NOW;
+    special1 = times[1].tv_nsec == UTIME_NOW;
+    if (special0 || special1) {
+        ret = futimes(fd, NULL);
+        if (ret < 0) {
+            goto done;
+        }
+
+        /* If both are set, we are done */
+        if (special0 && special1) {
+            ret = 0;
+            goto done;
+        }
+
+        ret = update_times_from_stat(fd, times, special0, special1);
+        if (ret < 0) {
+            goto done;
+        }
+    }
+
+    futimes_buf[0].tv_sec = times[0].tv_sec;
+    futimes_buf[0].tv_usec = times[0].tv_nsec / 1000;
+    futimes_buf[1].tv_sec = times[1].tv_sec;
+    futimes_buf[1].tv_usec = times[1].tv_nsec / 1000;
+    ret = futimes(fd, futimes_buf);
+
+done:
+    close_preserve_errno(fd);
+    return ret;
+}
diff --git a/hw/9pfs/9p-util-linux.c b/hw/9pfs/9p-util-linux.c
index 398614a5d0..d54bf57a59 100644
--- a/hw/9pfs/9p-util-linux.c
+++ b/hw/9pfs/9p-util-linux.c
@@ -62,3 +62,9 @@ int fsetxattrat_nofollow(int dirfd, const char *filename, const char *name,
     g_free(proc_path);
     return ret;
 }
+
+int utimensat_nofollow(int dirfd, const char *filename,
+                       const struct timespec times[2])
+{
+    return utimensat(dirfd, filename, times, AT_SYMLINK_NOFOLLOW);
+}
diff --git a/hw/9pfs/9p-util.h b/hw/9pfs/9p-util.h
index 38ef8b289d..1c477a0e66 100644
--- a/hw/9pfs/9p-util.h
+++ b/hw/9pfs/9p-util.h
@@ -36,6 +36,12 @@ static inline int qemu_lsetxattr(const char *path, const char *name,
 #define qemu_lsetxattr lsetxattr
 #endif
 
+/* Compatibility with old SDK Versions for Darwin */
+#if defined(CONFIG_DARWIN) && !defined(UTIME_NOW)
+#define UTIME_NOW -1
+#define UTIME_OMIT -2
+#endif
+
 static inline void close_preserve_errno(int fd)
 {
     int serrno = errno;
@@ -96,5 +102,7 @@ ssize_t flistxattrat_nofollow(int dirfd, const char *filename,
                               char *list, size_t size);
 ssize_t fremovexattrat_nofollow(int dirfd, const char *filename,
                                 const char *name);
+int utimensat_nofollow(int dirfd, const char *filename,
+                       const struct timespec times[2]);
 
 #endif
diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
index 3fc43cb482..6fe42e61fc 100644
--- a/hw/9pfs/9p.c
+++ b/hw/9pfs/9p.c
@@ -27,6 +27,7 @@
 #include "virtio-9p.h"
 #include "fsdev/qemu-fsdev.h"
 #include "9p-xattr.h"
+#include "9p-util.h"
 #include "coth.h"
 #include "trace.h"
 #include "migration/blocker.h"
-- 
2.33.0


