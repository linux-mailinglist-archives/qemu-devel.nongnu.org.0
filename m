Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61266518EAD
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 22:24:24 +0200 (CEST)
Received: from localhost ([::1]:34830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlz4J-0006pJ-Cc
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 16:24:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyZQ-0007Vr-PT
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:52:28 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:44603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyZO-00063S-Qd
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:52:28 -0400
Received: by mail-pl1-x62e.google.com with SMTP id j8so15861766pll.11
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 12:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=6P93sk4kWHKA40484oabYrAFLKtkFM6g8eI+ZgtYvkQ=;
 b=FaVJSf4lhQGEG9LjlgjqN+zXUQ/zDHW77ozJWTg/zFz3q5Q8htvfTPt0xlcF9oZIm6
 SC1yIzbEQWSR85Mc2XusTXWb+eBCc1kGQ9FfEErwPpx7CxItrRuSeVCXkZPizXeju/sG
 W5T2DWIJZfoebroU1UC1JsMKXZdV6JbfAcs1bCHd4ZIbFrkD5AenXorRoR4mxNidZ2Tr
 bvuYxtD6h1rzzpUjY49LMdmG4SQuVFDQE34Q/HqjjXIiRMwtZE7nrrdsY9NKVtihoChT
 6H2DFAazHicxtrEbc26UsXluUxS4/1jULlKqqQiDrE6heb+OXC2mk7LUl/QkvwseyGkq
 d5HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6P93sk4kWHKA40484oabYrAFLKtkFM6g8eI+ZgtYvkQ=;
 b=lfDOiTtEImZgo5DrK6rsnU9yop51z5CaONPHPl0fn0FcSevFn8o+BP2CibHoWebrk9
 46O1pxevO8wBvPS064RyWBahwe+r3+8y5cL3IFCK0d6HPd9pB3Zvrs46TRe23JmSbovy
 Ykbq7KDBSJY84l5PBH54jRu5zRTlo+BRwCXmcbRXGsXfmV5rwQejnzRH5B3tcIDtNgoG
 vwhSAvZlnSmxqlUlcyCesNvluSoLihXuhyXwO3pRhpMvIMYzuc433rF03v/mmm7hJbcw
 hivz8eWzzwqLxVvLSyJFKFSLaf1IiKN6Bq0E2mG+fuScZqKl21jnpfJi7ZXStvR+0G9D
 dJFw==
X-Gm-Message-State: AOAM530xZCrAcrpURSMf4KM0DDqiYkolSaxl27nMpGRcKJ64sgiXdHDu
 bCgUaVkF0HTuDfx1+PMQ4ohu+vapAVP59Q==
X-Google-Smtp-Source: ABdhPJyiH8ew6Wp9bkib7IptU18/QK963L2QRwUf0LppwMhZRyfPT9DUDQ88BtbJBwY3UozdY+jDEg==
X-Received: by 2002:a17:902:bf07:b0:158:24d9:3946 with SMTP id
 bi7-20020a170902bf0700b0015824d93946mr18231803plb.28.1651607545472; 
 Tue, 03 May 2022 12:52:25 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 fz16-20020a17090b025000b001dbe11be891sm1692286pjb.44.2022.05.03.12.52.24
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 12:52:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 40/74] semihosting: Add GuestFDConsole
Date: Tue,  3 May 2022 12:48:09 -0700
Message-Id: <20220503194843.1379101-41-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220503194843.1379101-1-richard.henderson@linaro.org>
References: <20220503194843.1379101-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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

Add a GuestFDType for connecting to the semihosting console.
Hook up to read, write, isatty, and fstat syscalls.

Note that the arm-specific syscall flen cannot be applied
to the console, because the console is not a descriptor
exposed to the guest.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/semihosting/guestfd.h |  7 ++--
 semihosting/syscalls.c        | 68 +++++++++++++++++++++++++++++++++++
 2 files changed, 72 insertions(+), 3 deletions(-)

diff --git a/include/semihosting/guestfd.h b/include/semihosting/guestfd.h
index 5aa2722cb2..5c3e7cd538 100644
--- a/include/semihosting/guestfd.h
+++ b/include/semihosting/guestfd.h
@@ -13,9 +13,10 @@
 
 typedef enum GuestFDType {
     GuestFDUnused = 0,
-    GuestFDHost = 1,
-    GuestFDGDB = 2,
-    GuestFDStatic = 3,
+    GuestFDHost,
+    GuestFDGDB,
+    GuestFDStatic,
+    GuestFDConsole,
 } GuestFDType;
 
 /*
diff --git a/semihosting/syscalls.c b/semihosting/syscalls.c
index 4c934654cd..aa4ee47649 100644
--- a/semihosting/syscalls.c
+++ b/semihosting/syscalls.c
@@ -10,6 +10,7 @@
 #include "exec/gdbstub.h"
 #include "semihosting/guestfd.h"
 #include "semihosting/syscalls.h"
+#include "semihosting/console.h"
 #ifdef CONFIG_USER_ONLY
 #include "qemu.h"
 #else
@@ -607,6 +608,56 @@ static void staticfile_flen(CPUState *cs, gdb_syscall_complete_cb complete,
     complete(cs, gf->staticfile.len, 0);
 }
 
+/*
+ * Console semihosting syscall implementations.
+ */
+
+static void console_read(CPUState *cs, gdb_syscall_complete_cb complete,
+                         GuestFD *gf, target_ulong buf, target_ulong len)
+{
+    CPUArchState *env G_GNUC_UNUSED = cs->env_ptr;
+    char *ptr;
+    int ret;
+
+    ptr = lock_user(VERIFY_WRITE, buf, len, 0);
+    if (!ptr) {
+        complete(cs, -1, EFAULT);
+        return;
+    }
+    ret = qemu_semihosting_console_read(cs, ptr, len);
+    complete(cs, ret, 0);
+    unlock_user(ptr, buf, ret);
+}
+
+static void console_write(CPUState *cs, gdb_syscall_complete_cb complete,
+                          GuestFD *gf, target_ulong buf, target_ulong len)
+{
+    CPUArchState *env G_GNUC_UNUSED = cs->env_ptr;
+    char *ptr = lock_user(VERIFY_READ, buf, len, 1);
+    int ret;
+
+    if (!ptr) {
+        complete(cs, -1, EFAULT);
+        return;
+    }
+    ret = qemu_semihosting_console_write(ptr, len);
+    complete(cs, ret ? ret : -1, ret ? 0 : EIO);
+    unlock_user(ptr, buf, ret);
+}
+
+static void console_fstat(CPUState *cs, gdb_syscall_complete_cb complete,
+                          GuestFD *gf, target_ulong addr)
+{
+    static const struct stat tty_buf = {
+        .st_mode = 020666,  /* S_IFCHR, ugo+rw */
+        .st_rdev = 5,       /* makedev(5, 0) -- linux /dev/tty */
+    };
+    int ret;
+
+    ret = copy_stat_to_user(cs, addr, &tty_buf);
+    complete(cs, ret ? -1 : 0, ret ? -ret : 0);
+}
+
 /*
  * Syscall entry points.
  */
@@ -638,6 +689,7 @@ void semihost_sys_close(CPUState *cs, gdb_syscall_complete_cb complete, int fd)
         host_close(cs, complete, gf);
         break;
     case GuestFDStatic:
+    case GuestFDConsole:
         complete(cs, 0, 0);
         break;
     default:
@@ -667,6 +719,9 @@ void semihost_sys_read_gf(CPUState *cs, gdb_syscall_complete_cb complete,
     case GuestFDStatic:
         staticfile_read(cs, complete, gf, buf, len);
         break;
+    case GuestFDConsole:
+        console_read(cs, complete, gf, buf, len);
+        break;
     default:
         g_assert_not_reached();
     }
@@ -702,6 +757,9 @@ void semihost_sys_write_gf(CPUState *cs, gdb_syscall_complete_cb complete,
     case GuestFDHost:
         host_write(cs, complete, gf, buf, len);
         break;
+    case GuestFDConsole:
+        console_write(cs, complete, gf, buf, len);
+        break;
     case GuestFDStatic:
         /* Static files are never open for writing: EBADF. */
         complete(cs, -1, GDB_EBADF);
@@ -742,6 +800,9 @@ void semihost_sys_lseek(CPUState *cs, gdb_syscall_complete_cb complete,
     case GuestFDStatic:
         staticfile_lseek(cs, complete, gf, off, gdb_whence);
         break;
+    case GuestFDConsole:
+        complete(cs, -1, ESPIPE);
+        break;
     default:
         g_assert_not_reached();
     }
@@ -765,6 +826,9 @@ void semihost_sys_isatty(CPUState *cs, gdb_syscall_complete_cb complete, int fd)
     case GuestFDStatic:
         complete(cs, 0, GDB_ENOTTY);
         break;
+    case GuestFDConsole:
+        complete(cs, 1, 0);
+        break;
     default:
         g_assert_not_reached();
     }
@@ -790,6 +854,7 @@ void semihost_sys_flen(CPUState *cs, gdb_syscall_complete_cb fstat_cb,
     case GuestFDStatic:
         staticfile_flen(cs, flen_cb, gf);
         break;
+    case GuestFDConsole:
     default:
         g_assert_not_reached();
     }
@@ -811,6 +876,9 @@ void semihost_sys_fstat(CPUState *cs, gdb_syscall_complete_cb complete,
     case GuestFDHost:
         host_fstat(cs, complete, gf, addr);
         break;
+    case GuestFDConsole:
+        console_fstat(cs, complete, gf, addr);
+        break;
     case GuestFDStatic:
     default:
         g_assert_not_reached();
-- 
2.34.1


