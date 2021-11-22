Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D43BF458790
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 01:57:28 +0100 (CET)
Received: from localhost ([::1]:40938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1moxeC-0004pf-0v
	for lists+qemu-devel@lfdr.de; Sun, 21 Nov 2021 19:57:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1moxcb-0002k1-NL
 for qemu-devel@nongnu.org; Sun, 21 Nov 2021 19:55:49 -0500
Received: from [2607:f8b0:4864:20::f30] (port=42694
 helo=mail-qv1-xf30.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1moxcZ-0001is-MZ
 for qemu-devel@nongnu.org; Sun, 21 Nov 2021 19:55:49 -0500
Received: by mail-qv1-xf30.google.com with SMTP id b17so11336070qvl.9
 for <qemu-devel@nongnu.org>; Sun, 21 Nov 2021 16:55:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6/FI/gIVcuCmFj1315nRIJkD7aP2LvmufA/USxsxLcc=;
 b=mzlsLH8f/35XTn8DtNuvyA1rrOZGhtjkzN/fA67MQ/C8wl8HNBpkMqsopfMcBRRriJ
 QONxcVdvMRB3qR9cKSDRtm050P3C3Va4HWs0ccx1R3AjfhFfgYRjnyXMdvdlWGSdzFSR
 xetjNUufRODT5I+JlntxNwOMDSmWXz6U4/R2cLIvKRMuKZLgbRSng+q+2KiHF9BauUIA
 x9RILtNxI+6RmQ069LVGcMUKCIrhNoq86MuElX/jkLnZ3S0kILlrT60+wrZoGircCuNT
 /+AClePVOLCCcNwDLuYhED7wD6KFKd2ryPM5N3vSry2DuJUtzhsx9L7IP5woLeG0/yUS
 +XiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6/FI/gIVcuCmFj1315nRIJkD7aP2LvmufA/USxsxLcc=;
 b=xhAX1Hz5xrsjMu1XdvX+cIQxoZ3ufO/RJwX4ePktS46UtvbmT6YUg2Mm3NA1+WqfS0
 aSjAWy+TyIazeTWy4emvqPf/K7Cf8GmwVGGkzNKXPtF+ZOrpnrrUdXDGOQx9Go5MuTiO
 i7M4wltfxgjKmHoas9YqgiEuApVoszpPqnjfr+Uj08/vXWhg5jt/dm/aUeT8A0M2rSi5
 VrT38qEIZW0pfAcaY7CGl+wXZV3cZlz+huP1gNnlrQhuCkfM2D2weFMoghX48+05Wdi5
 uc+J5oAT3/Kbav6EGygWQfQxoVPsMyrTZx370cu2aLpPV6qvSZH/njwJO2/pvVPdXsD8
 m+Cg==
X-Gm-Message-State: AOAM531NTy7DPePKJcL5K9FjYb4QZmJHX4P7eEPYAHePmcU9ILFrCUZ+
 gAokGQHadat2aPiByNEouWbGnQLoWR+F/A==
X-Google-Smtp-Source: ABdhPJxGjJc0MnaPRgPPEJ9tzOKcyWiMMLanMrJYRVYSv9Eh/ZheqTqHBT8tgMtZjCkmZv1rnUepfg==
X-Received: by 2002:ad4:5aa4:: with SMTP id u4mr96575131qvg.7.1637542171477;
 Sun, 21 Nov 2021 16:49:31 -0800 (PST)
Received: from localhost.localdomain
 (209-6-248-219.s2265.c3-0.wrx-ubr1.sbo-wrx.ma.cable.rcncustomer.com.
 [209.6.248.219])
 by smtp.gmail.com with ESMTPSA id x17sm3651745qta.66.2021.11.21.16.49.30
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 21 Nov 2021 16:49:31 -0800 (PST)
From: Will Cohen <wwcohen@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 09/11] 9p: darwin: Provide fallback impl for utimensat
Date: Sun, 21 Nov 2021 19:49:11 -0500
Message-Id: <20211122004913.20052-10-wwcohen@gmail.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211122004913.20052-1-wwcohen@gmail.com>
References: <20211122004913.20052-1-wwcohen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::f30
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f30;
 envelope-from=wwcohen@gmail.com; helo=mail-qv1-xf30.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Keno Fischer <keno@juliacomputing.com>, Greg Kurz <groug@kaod.org>,
 hi@alyssa.is, Michael Roitzsch <reactorcontrol@icloud.com>,
 Will Cohen <wwcohen@gmail.com>
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
Signed-off-by: Michael Roitzsch <reactorcontrol@icloud.com>
Signed-off-by: Will Cohen <wwcohen@gmail.com>
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
index d671995aa4..3d676405c7 100644
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
2.34.0


