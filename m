Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8767515DD0
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Apr 2022 15:46:10 +0200 (CEST)
Received: from localhost ([::1]:57322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nknQI-0002Sg-1C
	for lists+qemu-devel@lfdr.de; Sat, 30 Apr 2022 09:46:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nknAc-0004nA-Hn
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 09:30:00 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:42817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nknAZ-0006HO-Om
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 09:29:57 -0400
Received: by mail-pf1-x42a.google.com with SMTP id x23so3772680pff.9
 for <qemu-devel@nongnu.org>; Sat, 30 Apr 2022 06:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aKzXDiDuIzeMYnJqEAFUYGAGzPJrOV+1efeY8aXLxdY=;
 b=UFBpsZ/SnypcXOFl7I8V7aiqLkhW0lYt9rfbJjOGsuiPTaVal+6EC7fKbEYqdeQOW4
 UCP114/mtBGJphEzcIPp4zKneQpn1WE+2W6pYo2LZLoJmzLCx88VxpOqTYNDrYwTNVRq
 3zezPLtdbxoue4sOUaa11X0eiW2g/f0+gzg67rU7azmRhBIfyTA65zri9IsmPsYRpzdL
 cvXVgITzVo6tkjkTrx6uBoEd14J/yp0zQeed/NB0J6DwMfCRzozcgoEemfe2cLz2UXQK
 Wb9eFm0dCeq+WyLFy0ZHmiBdItfO31KGfbB+PQUA6kYEH1b0zO2vO1fJ3UEbLg5LT7c8
 1YVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aKzXDiDuIzeMYnJqEAFUYGAGzPJrOV+1efeY8aXLxdY=;
 b=n4AfNxbtvlBKdr6NBxBIgIxpjIovqILt6GDH8J1490KkhMyQ4SAZidGNvWqXRDaMW1
 3nGerss05HYcLtiHRbb38+j/cTHzVqoJ1+1veca1fFf1vZGdlJip/dke8T/BheFBMRy7
 1YaXlFekaGg7t2CT4CbYBxbHZgpsLxgEYACUO3TWZDB/ycFYuOS7zblVhiUKb3qwF4Rb
 D5XcD1D5J/VLWZLGtzvO+8Biyu6SORCDlfgkLPsUeQqiYXZE9eHWrSut0f9ZzFhqQBLQ
 IhYd9dpK2VEsLSnUguU/cjP5excjieEGIMCc4C/bWbFjWydZcxCWb07MiYzQe3RhUami
 s+xw==
X-Gm-Message-State: AOAM531vUfRSbaUOLdZeTOe8Benl6JnEH/tRYzyqN5ULGST+9o8uQ1CE
 jMc1qNLtjDx+FiDibLPiDZi06A5N6g2u+w==
X-Google-Smtp-Source: ABdhPJwmE+tlCv9VsKbvslxn+cB/ZPDOTD7cS1KyvtYDZEDsO9NKoDHNchfDrKDbmFQP1oq0Ybhd0Q==
X-Received: by 2002:aa7:9d0d:0:b0:50d:4fcc:7cb1 with SMTP id
 k13-20020aa79d0d000000b0050d4fcc7cb1mr3816602pfp.41.1651325394444; 
 Sat, 30 Apr 2022 06:29:54 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 x5-20020aa793a5000000b0050dc7628201sm1522606pff.219.2022.04.30.06.29.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 06:29:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 20/43] semihosting: Split out semihost_sys_open
Date: Sat, 30 Apr 2022 06:29:09 -0700
Message-Id: <20220430132932.324018-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220430132932.324018-1-richard.henderson@linaro.org>
References: <20220430132932.324018-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
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
Cc: crwulff@gmail.com, alex.bennee@linaro.org, f4bug@amsat.org,
 laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Split out the non-ARM specific portions of SYS_OPEN to a
reusable function.  This handles gdb and host file i/o.

Add helpers to validate the length of the filename string.
Prepare for usage by other semihosting by allowing the
filename length parameter to be 0, and calling strlen.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/semihosting/guestfd.h |  13 ++++
 semihosting/arm-compat-semi.c |  49 +-----------
 semihosting/guestfd.c         | 135 ++++++++++++++++++++++++++++++++++
 3 files changed, 152 insertions(+), 45 deletions(-)

diff --git a/include/semihosting/guestfd.h b/include/semihosting/guestfd.h
index 5aa2722cb2..275b91b73a 100644
--- a/include/semihosting/guestfd.h
+++ b/include/semihosting/guestfd.h
@@ -41,4 +41,17 @@ GuestFD *get_guestfd(int guestfd);
 void associate_guestfd(int guestfd, int hostfd);
 void staticfile_guestfd(int guestfd, const uint8_t *data, size_t len);
 
+/*
+ * Syscall implementations for semi-hosting.  Argument loading from
+ * the guest is performed by the caller; results are returned via
+ * the 'complete' callback.  String operands are in address/len pairs.
+ * The len argument may be 0 (when the semihosting abi does not
+ * already provide the length), or non-zero (where it should include
+ * the terminating zero).
+ */
+
+void semihost_sys_open(CPUState *cs, gdb_syscall_complete_cb complete,
+                       target_ulong fname, target_ulong fname_len,
+                       int gdb_flags, int mode);
+
 #endif /* SEMIHOSTING_GUESTFD_H */
diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index 49f976cbc5..e2decd54e4 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -35,9 +35,9 @@
 #include "semihosting/semihost.h"
 #include "semihosting/console.h"
 #include "semihosting/common-semi.h"
-#include "semihosting/guestfd.h"
 #include "qemu/timer.h"
 #include "exec/gdbstub.h"
+#include "semihosting/guestfd.h"
 
 #ifdef CONFIG_USER_ONLY
 #include "qemu.h"
@@ -98,21 +98,6 @@ static int gdb_open_modeflags[12] = {
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
@@ -285,20 +270,6 @@ common_semi_flen_cb(CPUState *cs, target_ulong ret, target_ulong err)
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
@@ -602,22 +573,10 @@ void do_common_semihosting(CPUState *cs)
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
index b6405f5663..1393279333 100644
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
 
@@ -116,3 +121,133 @@ void dealloc_guestfd(int guestfd)
     assert(gf);
     gf->type = GuestFDUnused;
 }
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
+ * File-related semihosting syscall implementations.
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
-- 
2.34.1


