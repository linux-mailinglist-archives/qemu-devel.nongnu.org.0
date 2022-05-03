Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC1A518EA5
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 22:21:24 +0200 (CEST)
Received: from localhost ([::1]:55526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlz1P-0000rk-PJ
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 16:21:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyWH-0001u4-UJ
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:49:14 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:41884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyWC-0003am-6i
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:49:10 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 z5-20020a17090a468500b001d2bc2743c4so2909974pjf.0
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 12:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=PbM+bhS7D2Mao4BFHDU0zIPvu+k4lfhRPdlGiKOdrM8=;
 b=Qf47cunupHAEWp/7LUiYMwfF4R6cksvKk4aWPu3+CohQi8zC2gYXxXemi9qO/TZVVo
 DHojSYT4VJ+zJUKlwask2dxnH9aFtiYRspMX52sSruFRDMNqPCRDrf1f0XSXBP/dQ62+
 24g8wYv10f8tcSp/kO45RFydlGSDVLn/H/WJIM1ehysX0YKq2pk0tSXcjer9UNyqsyoM
 fvBnbdJn1sc/U/Xy4Yn3kDGqtiWFCaRE2F6SBqWkD89ubOxNxT5IbWdZMOH8WKgW9Rwf
 ziVh/lmIZNm1s6QP2SLFI06IbiU7N3Jvv1mXx0claXUyaJI+OEKZseZ7H7PzkaGJiOgD
 FBjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PbM+bhS7D2Mao4BFHDU0zIPvu+k4lfhRPdlGiKOdrM8=;
 b=NLqw59mUwyW+T4VjZTEUeqNTq/BWUV1Jkwa9+U36vOJuvliOJsdLYHTE7rTGbo2KNg
 GdExWDa7UJRnZbO6xF6H82WXDGjSze6lfMlJRAM10Wo+Rm10ijgvZVBgsqlAVdGlz8st
 A3+qycNHn/nBApFO7eZCA5XdWzastiiV4QFCkh0s8HK0IncGVDf6gNrmV4GP8CElj3zD
 WPSzzuY9mz4dDHAgxdChBQTS12+K06rczAz2thOwK2aY0zV32AaYUxseRS95mkD3CVAK
 n/93c462kdG8Js1LjhJ2ne+fABxLhigm0x2xi3NWypcGEJJ8nR1UEXYabEGbRp0CMwr/
 MP+w==
X-Gm-Message-State: AOAM531OO4YZHZDfCnzCfLo8mI+VsPqk3++RWD7WMPyHLqPTL4oeEUob
 gVS2ld2lec2jaN5YvNisMpu7D/FkvEXyjA==
X-Google-Smtp-Source: ABdhPJzQjr5OHs76KlEpm4BuC2CIxACZumXdZKfCTliPeuJHMXhhD2TIi+lUd8kOoOkgpMXX/1zxnw==
X-Received: by 2002:a17:90a:c504:b0:1bf:6d9f:65a6 with SMTP id
 k4-20020a17090ac50400b001bf6d9f65a6mr6392146pjt.204.1651607346756; 
 Tue, 03 May 2022 12:49:06 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 p11-20020a17090ad30b00b001cd4989fed3sm1712383pju.31.2022.05.03.12.49.06
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 12:49:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 21/74] semihosting: Split out semihost_sys_open
Date: Tue,  3 May 2022 12:47:50 -0700
Message-Id: <20220503194843.1379101-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220503194843.1379101-1-richard.henderson@linaro.org>
References: <20220503194843.1379101-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Split out the non-ARM specific portions of SYS_OPEN to a
reusable function.  This handles gdb and host file i/o.

Add helpers to validate the length of the filename string.
Prepare for usage by other semihosting by allowing the
filename length parameter to be 0, and calling strlen.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/semihosting/syscalls.h |  25 +++++
 semihosting/arm-compat-semi.c  |  50 +--------
 semihosting/guestfd.c          |   5 +
 semihosting/syscalls.c         | 186 +++++++++++++++++++++++++++++++++
 semihosting/meson.build        |   1 +
 5 files changed, 222 insertions(+), 45 deletions(-)
 create mode 100644 include/semihosting/syscalls.h
 create mode 100644 semihosting/syscalls.c

diff --git a/include/semihosting/syscalls.h b/include/semihosting/syscalls.h
new file mode 100644
index 0000000000..991658bf79
--- /dev/null
+++ b/include/semihosting/syscalls.h
@@ -0,0 +1,25 @@
+/*
+ * Syscall implementations for semihosting.
+ *
+ * Copyright (c) 2022 Linaro
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef SEMIHOSTING_SYSCALLS_H
+#define SEMIHOSTING_SYSCALLS_H
+
+/*
+ * Argument loading from the guest is performed by the caller;
+ * results are returned via the 'complete' callback.
+ *
+ * String operands are in address/len pairs.  The len argument may be 0
+ * (when the semihosting abi does not already provide the length),
+ * or non-zero (where it should include the terminating zero).
+ */
+
+void semihost_sys_open(CPUState *cs, gdb_syscall_complete_cb complete,
+                       target_ulong fname, target_ulong fname_len,
+                       int gdb_flags, int mode);
+
+#endif /* SEMIHOSTING_SYSCALLS_H */
diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index 49f976cbc5..4a2f0c9202 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -35,9 +35,10 @@
 #include "semihosting/semihost.h"
 #include "semihosting/console.h"
 #include "semihosting/common-semi.h"
-#include "semihosting/guestfd.h"
 #include "qemu/timer.h"
 #include "exec/gdbstub.h"
+#include "semihosting/guestfd.h"
+#include "semihosting/syscalls.h"
 
 #ifdef CONFIG_USER_ONLY
 #include "qemu.h"
@@ -98,21 +99,6 @@ static int gdb_open_modeflags[12] = {
     GDB_O_RDWR | GDB_O_CREAT | GDB_O_APPEND | GDB_O_BINARY
 };
 
-static int open_modeflags[12] = {
-    O_RDONLY,
-    O_RDONLY | O_BINARY,
-    O_RDWR,
-    O_RDWR | O_BINARY,
-    O_WRONLY | O_CREAT | O_TRUNC,
-    O_WRONLY | O_CREAT | O_TRUNC | O_BINARY,
-    O_RDWR | O_CREAT | O_TRUNC,
-    O_RDWR | O_CREAT | O_TRUNC | O_BINARY,
-    O_WRONLY | O_CREAT | O_APPEND,
-    O_WRONLY | O_CREAT | O_APPEND | O_BINARY,
-    O_RDWR | O_CREAT | O_APPEND,
-    O_RDWR | O_CREAT | O_APPEND | O_BINARY
-};
-
 #ifndef CONFIG_USER_ONLY
 
 /**
@@ -285,20 +271,6 @@ common_semi_flen_cb(CPUState *cs, target_ulong ret, target_ulong err)
     common_semi_set_ret(cs, size);
 }
 
-static int common_semi_open_guestfd;
-
-static void
-common_semi_open_cb(CPUState *cs, target_ulong ret, target_ulong err)
-{
-    if (ret == (target_ulong)-1) {
-        dealloc_guestfd(common_semi_open_guestfd);
-    } else {
-        associate_guestfd(common_semi_open_guestfd, ret);
-        ret = common_semi_open_guestfd;
-    }
-    common_semi_cb(cs, ret, err);
-}
-
 /*
  * Types for functions implementing various semihosting calls
  * for specific types of guest file descriptor. These must all
@@ -602,22 +574,10 @@ void do_common_semihosting(CPUState *cs)
                 staticfile_guestfd(ret, featurefile_data,
                                    sizeof(featurefile_data));
             }
-        } else if (use_gdb_syscalls()) {
-            unlock_user(s, arg0, 0);
-            common_semi_open_guestfd = alloc_guestfd();
-            gdb_do_syscall(common_semi_open_cb,
-                           "open,%s,%x,1a4", arg0, (int)arg2 + 1,
-                           gdb_open_modeflags[arg1]);
-            break;
         } else {
-            hostfd = open(s, open_modeflags[arg1], 0644);
-            if (hostfd < 0) {
-                ret = -1;
-                err = errno;
-            } else {
-                ret = alloc_guestfd();
-                associate_guestfd(ret, hostfd);
-            }
+            semihost_sys_open(cs, common_semi_cb, arg0, arg2 + 1,
+                              gdb_open_modeflags[arg1], 0644);
+            break;
         }
         unlock_user(s, arg0, 0);
         common_semi_cb(cs, ret, err);
diff --git a/semihosting/guestfd.c b/semihosting/guestfd.c
index b6405f5663..7ac2e147a8 100644
--- a/semihosting/guestfd.c
+++ b/semihosting/guestfd.c
@@ -11,6 +11,11 @@
 #include "qemu/osdep.h"
 #include "exec/gdbstub.h"
 #include "semihosting/guestfd.h"
+#ifdef CONFIG_USER_ONLY
+#include "qemu.h"
+#else
+#include "semihosting/softmmu-uaccess.h"
+#endif
 
 static GArray *guestfd_array;
 
diff --git a/semihosting/syscalls.c b/semihosting/syscalls.c
new file mode 100644
index 0000000000..a44d5cbae2
--- /dev/null
+++ b/semihosting/syscalls.c
@@ -0,0 +1,186 @@
+/*
+ * Syscall implementations for semihosting.
+ *
+ * Copyright (c) 2022 Linaro
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "exec/gdbstub.h"
+#include "semihosting/guestfd.h"
+#include "semihosting/syscalls.h"
+#ifdef CONFIG_USER_ONLY
+#include "qemu.h"
+#else
+#include "semihosting/softmmu-uaccess.h"
+#endif
+
+
+/*
+ * Validate or compute the length of the string (including terminator).
+ */
+static int validate_strlen(CPUState *cs, target_ulong str, target_ulong tlen)
+{
+    CPUArchState *env G_GNUC_UNUSED = cs->env_ptr;
+    char c;
+
+    if (tlen == 0) {
+        ssize_t slen = target_strlen(str);
+
+        if (slen < 0) {
+            return -GDB_EFAULT;
+        }
+        if (slen >= INT32_MAX) {
+            return -GDB_ENAMETOOLONG;
+        }
+        return slen + 1;
+    }
+    if (tlen > INT32_MAX) {
+        return -GDB_ENAMETOOLONG;
+    }
+    if (get_user_u8(c, str + tlen - 1)) {
+        return -GDB_EFAULT;
+    }
+    if (c != 0) {
+        return -GDB_EINVAL;
+    }
+    return tlen;
+}
+
+static int validate_lock_user_string(char **pstr, CPUState *cs,
+                                     target_ulong tstr, target_ulong tlen)
+{
+    int ret = validate_strlen(cs, tstr, tlen);
+    CPUArchState *env G_GNUC_UNUSED = cs->env_ptr;
+    char *str = NULL;
+
+    if (ret > 0) {
+        str = lock_user(VERIFY_READ, tstr, ret, true);
+        ret = str ? 0 : -GDB_EFAULT;
+    }
+    *pstr = str;
+    return ret;
+}
+
+static int errno_for_gdb(void)
+{
+#define E(N)  case E##N: return GDB_E##N
+
+    switch (errno) {
+    E(PERM);
+    E(NOENT);
+    E(INTR);
+    E(BADF);
+    E(ACCES);
+    E(FAULT);
+    E(BUSY);
+    E(EXIST);
+    E(NODEV);
+    E(NOTDIR);
+    E(ISDIR);
+    E(INVAL);
+    E(NFILE);
+    E(MFILE);
+    E(FBIG);
+    E(NOSPC);
+    E(SPIPE);
+    E(ROFS);
+    E(NAMETOOLONG);
+    }
+    return GDB_EUNKNOWN;
+
+#undef E
+}
+
+/*
+ * GDB semihosting syscall implementations.
+ */
+
+static gdb_syscall_complete_cb gdb_open_complete;
+
+static void gdb_open_cb(CPUState *cs, target_ulong ret, target_ulong err)
+{
+    if (!err) {
+        int guestfd = alloc_guestfd();
+        associate_guestfd(guestfd, ret);
+        ret = guestfd;
+    }
+    gdb_open_complete(cs, ret, err);
+}
+
+static void gdb_open(CPUState *cs, gdb_syscall_complete_cb complete,
+                     target_ulong fname, target_ulong fname_len,
+                     int gdb_flags, int mode)
+{
+    int len = validate_strlen(cs, fname, fname_len);
+    if (len < 0) {
+        complete(cs, -1, -len);
+        return;
+    }
+
+    gdb_open_complete = complete;
+    gdb_do_syscall(gdb_open_cb, "open,%s,%x,%x",
+                   fname, len, (target_ulong)gdb_flags, (target_ulong)mode);
+}
+
+/*
+ * Host semihosting syscall implementations.
+ */
+
+static void host_open(CPUState *cs, gdb_syscall_complete_cb complete,
+                      target_ulong fname, target_ulong fname_len,
+                      int gdb_flags, int mode)
+{
+    CPUArchState *env G_GNUC_UNUSED = cs->env_ptr;
+    char *p;
+    int ret, host_flags;
+
+    ret = validate_lock_user_string(&p, cs, fname, fname_len);
+    if (ret < 0) {
+        complete(cs, -1, -ret);
+        return;
+    }
+
+    if (gdb_flags & GDB_O_WRONLY) {
+        host_flags = O_WRONLY;
+    } else if (gdb_flags & GDB_O_RDWR) {
+        host_flags = O_RDWR;
+    } else {
+        host_flags = O_RDONLY;
+    }
+    if (gdb_flags & GDB_O_CREAT) {
+        host_flags |= O_CREAT;
+    }
+    if (gdb_flags & GDB_O_TRUNC) {
+        host_flags |= O_TRUNC;
+    }
+    if (gdb_flags & GDB_O_EXCL) {
+        host_flags |= O_EXCL;
+    }
+
+    ret = open(p, host_flags, mode);
+    if (ret < 0) {
+        complete(cs, -1, errno_for_gdb());
+    } else {
+        int guestfd = alloc_guestfd();
+        associate_guestfd(guestfd, ret);
+        complete(cs, guestfd, 0);
+    }
+    unlock_user(p, fname, 0);
+}
+
+/*
+ * Syscall entry points.
+ */
+
+void semihost_sys_open(CPUState *cs, gdb_syscall_complete_cb complete,
+                       target_ulong fname, target_ulong fname_len,
+                       int gdb_flags, int mode)
+{
+    if (use_gdb_syscalls()) {
+        gdb_open(cs, complete, fname, fname_len, gdb_flags, mode);
+    } else {
+        host_open(cs, complete, fname, fname_len, gdb_flags, mode);
+    }
+}
diff --git a/semihosting/meson.build b/semihosting/meson.build
index d2c1c37bfd..8057db5494 100644
--- a/semihosting/meson.build
+++ b/semihosting/meson.build
@@ -1,5 +1,6 @@
 specific_ss.add(when: 'CONFIG_SEMIHOSTING', if_true: files(
   'guestfd.c',
+  'syscalls.c',
 ))
 
 specific_ss.add(when: ['CONFIG_SEMIHOSTING', 'CONFIG_SOFTMMU'], if_true: files(
-- 
2.34.1


