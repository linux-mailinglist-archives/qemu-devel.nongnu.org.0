Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FDF655BF41
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 09:53:53 +0200 (CEST)
Received: from localhost ([::1]:43646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o662i-0007Be-LJ
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 03:53:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o63G4-0003Xy-Iw
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:55:29 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:46058)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o63Fq-0008Ks-DO
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:55:28 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 g20-20020a17090a579400b001ed52939d72so6016270pji.4
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 21:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SB0SPUk72cCTkCcvpipl11hti/rXHdZHTqbefwlQDxE=;
 b=csh/rdijizk9mK6S2gozHoKd2YdBbZ1kOqvVopSrXGwyiaPgQc9uzNMIpTSZiz/1sQ
 TtE01wuqTtr6QG8QdIi3JqqUFsLjGbgKy6EB3iTk5ePch/wqLmFBuj4gF/VhFbLd6iHL
 UMX6cUI7E5V3cZLWqCkgmYp0cJoJtM+foowbSbuSCgCSb/Dw4s7P3OcOHfSMNx0VjtqN
 jwwUY5kKJi8Don3GTmRxWmY4kgn6QOegKn1M9qKVXWRJga7tB9zjPHbo7otp4aRQWSQf
 iROpzzv4L/aucdwrk/z/K53h3yhUFOfR5cePAFA/aYyeHbKRbmHgx0H21Od/vhno3PsC
 2GlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SB0SPUk72cCTkCcvpipl11hti/rXHdZHTqbefwlQDxE=;
 b=Bbxbb7pi098P2YoINedIdmuFdmizHv4F6LJxwuACW3ciNE9z/F5l4XAU6i31Ec6rD7
 AripR+LmK8lKaWoyGLFxiPHxWykq7Br4Hq9k72rrIVu+wrfRqaCbcF/tpM4KhNVKaZ/P
 eTteWT2d8qgz/uc0VgYCCfP51IGi/PHUFyWtohvOgxxen6SC2/meuXcRMPdlTY64UtSC
 tyLaq5nzNR6ZbytckkK18k76VHqXMOY6cPMQ6gKkaSxzHjDxkvCjSl+Ko96uJ3je4Ti0
 kbhNyvbJDIDX6s1Utm4cjSOEd0ot/W+zGC62wiySTUpgnKGnyR7rgen5V5qjnC+YWje0
 WSww==
X-Gm-Message-State: AJIora/wtJRsDoBKfAtD0Of7Q/jc+ywor0X9X+hQnih4Ut++Xlzp104R
 oHBiWv0AVM+Z4Hl5g5aFahFmXNOt9miwxw==
X-Google-Smtp-Source: AGRyM1sUXwPsAPNrxBQsjm/dRPzGWgmPkS/Fbnb8ouBIIhuc0Yc60XvHs/5iOzLKdsw4vPrGoC+8Kw==
X-Received: by 2002:a17:902:db0d:b0:16b:9057:8042 with SMTP id
 m13-20020a170902db0d00b0016b90578042mr698580plx.165.1656392113426; 
 Mon, 27 Jun 2022 21:55:13 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 w8-20020a1709026f0800b00168c523032fsm8073735plk.269.2022.06.27.21.55.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 21:55:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Luc Michel <lmichel@kalray.eu>
Subject: [PULL 27/60] semihosting: Split out semihost_sys_open
Date: Tue, 28 Jun 2022 10:23:30 +0530
Message-Id: <20220628045403.508716-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628045403.508716-1-richard.henderson@linaro.org>
References: <20220628045403.508716-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Reviewed-by: Luc Michel <lmichel@kalray.eu>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/semihosting/syscalls.h |  25 ++++++
 semihosting/arm-compat-semi.c  |  53 ++---------
 semihosting/guestfd.c          |   5 ++
 semihosting/syscalls.c         | 156 +++++++++++++++++++++++++++++++++
 semihosting/meson.build        |   1 +
 5 files changed, 194 insertions(+), 46 deletions(-)
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
index 72a1350512..07960658d8 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -32,12 +32,13 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/timer.h"
+#include "exec/gdbstub.h"
 #include "semihosting/semihost.h"
 #include "semihosting/console.h"
 #include "semihosting/common-semi.h"
 #include "semihosting/guestfd.h"
-#include "qemu/timer.h"
-#include "exec/gdbstub.h"
+#include "semihosting/syscalls.h"
 
 #ifdef CONFIG_USER_ONLY
 #include "qemu.h"
@@ -98,21 +99,6 @@ static int gdb_open_modeflags[12] = {
     GDB_O_RDWR | GDB_O_CREAT | GDB_O_APPEND,
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
@@ -284,20 +270,6 @@ common_semi_flen_cb(CPUState *cs, target_ulong ret, target_ulong err)
     common_semi_cb(cs, ret, err);
 }
 
-static int common_semi_open_guestfd;
-
-static void
-common_semi_open_cb(CPUState *cs, target_ulong ret, target_ulong err)
-{
-    if (err) {
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
@@ -601,22 +573,11 @@ void do_common_semihosting(CPUState *cs)
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
+            unlock_user(s, arg0, 0);
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
index 0000000000..9f9d19a59a
--- /dev/null
+++ b/semihosting/syscalls.c
@@ -0,0 +1,156 @@
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
+            return -EFAULT;
+        }
+        if (slen >= INT32_MAX) {
+            return -ENAMETOOLONG;
+        }
+        return slen + 1;
+    }
+    if (tlen > INT32_MAX) {
+        return -ENAMETOOLONG;
+    }
+    if (get_user_u8(c, str + tlen - 1)) {
+        return -EFAULT;
+    }
+    if (c != 0) {
+        return -EINVAL;
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
+        ret = str ? 0 : -EFAULT;
+    }
+    *pstr = str;
+    return ret;
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
+        complete(cs, -1, errno);
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


