Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC3555BF04
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 09:17:43 +0200 (CEST)
Received: from localhost ([::1]:55490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o65Ti-0005ei-L0
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 03:17:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o63Jc-00021q-Hs
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:59:09 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:53956)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o63JZ-0000W5-IW
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:59:07 -0400
Received: by mail-pj1-x1032.google.com with SMTP id d14so11436914pjs.3
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 21:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hlSrerE/ONSg0LVKjyJGeSkE9veMTHprjHDwYw72eK4=;
 b=WBu+wYa4ZYQQg+UltowXTuhS+SlEhkRbLgY+DJZmcvY0DcvkkdVlPjvYuPadJvFyCi
 s/aDbc9eBX71n2NF37BOPyzD7OomMpwOkZNhQzQCkIg8pvTpnc96fUVmWPIOTEmk8E6A
 xRyBaElITNA4NItBnMfFU6/cVraqLR1h1ATK8Yap0WLTI0lkB/H2WNzIO8pGs826HJPQ
 /TtDjUFTZaUOHNTDazuGYtWCliOL3GahwgovCEZzRiikTCSfgnDkBHhk/Nuhd0fYHf5C
 emWT9knXu1TTTj2pDmyaYWdHWQfYz/WoDOfYpSqbdHej7wteKKVbfRw+teE20m23o+St
 6qNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hlSrerE/ONSg0LVKjyJGeSkE9veMTHprjHDwYw72eK4=;
 b=o88K5Y2QSHu7serpZVyK+8mJORTtULIeEhvoS/nbUIxpN+AZMxyWkhBioW/jMAoocf
 Q+gOjhKvAjeU5qSBjVVYBDbNfUzGs8bqUMXsx3xVwBoiuUgm9FYdI4toGbAPTd0e5gqU
 6m4nACyhnQCoq1gfFO0a2lskU0rQId9DroddHTZvzRZyG+MHNCRNhghrt6Hk6aQ4m+DW
 vSTqAvAjj/qFLBo0nOSnLXVZ61107Rob2v6CXebpnsDMZ8J/Mpb/LoQyCFWyEm3YgCPM
 lLLYhuqTUNWy9a/BrQ0b0Riu0JsvfMBTmyqqjLNOKW3+bFlIinFIgRv/EUOS0y2AQJ5e
 L+hw==
X-Gm-Message-State: AJIora9BBidCj4nMBY9SOxIQ3rz9CzRi9fzwC9hSGYt1lBOnUMQuUGza
 0h9eI+UPTPedsCxptj0hTs8r+G6AIFG9dQ==
X-Google-Smtp-Source: AGRyM1tY0PhsE5S/nmuK/riKCiK2d0G/1kr3ikmf/Np8Rs9iWRZnlROtDyu1cZRydpF5XiIHiVrSsg==
X-Received: by 2002:a17:903:328e:b0:16b:8745:bb77 with SMTP id
 jh14-20020a170903328e00b0016b8745bb77mr3030872plb.70.1656392344208; 
 Mon, 27 Jun 2022 21:59:04 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 y7-20020aa78f27000000b00522c0a75c39sm8259686pfr.196.2022.06.27.21.59.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 21:59:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Luc Michel <lmichel@kalray.eu>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 46/60] semihosting: Add GuestFDConsole
Date: Tue, 28 Jun 2022 10:23:49 +0530
Message-Id: <20220628045403.508716-47-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628045403.508716-1-richard.henderson@linaro.org>
References: <20220628045403.508716-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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

Reviewed-by: Luc Michel <lmichel@kalray.eu>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/semihosting/guestfd.h |  7 ++--
 semihosting/syscalls.c        | 68 +++++++++++++++++++++++++++++++++++
 2 files changed, 72 insertions(+), 3 deletions(-)

diff --git a/include/semihosting/guestfd.h b/include/semihosting/guestfd.h
index ef268abe85..a7ea1041ea 100644
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
index 13a9bdeda6..9e499b1751 100644
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
@@ -577,6 +578,56 @@ static void staticfile_flen(CPUState *cs, gdb_syscall_complete_cb complete,
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
@@ -608,6 +659,7 @@ void semihost_sys_close(CPUState *cs, gdb_syscall_complete_cb complete, int fd)
         host_close(cs, complete, gf);
         break;
     case GuestFDStatic:
+    case GuestFDConsole:
         complete(cs, 0, 0);
         break;
     default:
@@ -637,6 +689,9 @@ void semihost_sys_read_gf(CPUState *cs, gdb_syscall_complete_cb complete,
     case GuestFDStatic:
         staticfile_read(cs, complete, gf, buf, len);
         break;
+    case GuestFDConsole:
+        console_read(cs, complete, gf, buf, len);
+        break;
     default:
         g_assert_not_reached();
     }
@@ -672,6 +727,9 @@ void semihost_sys_write_gf(CPUState *cs, gdb_syscall_complete_cb complete,
     case GuestFDHost:
         host_write(cs, complete, gf, buf, len);
         break;
+    case GuestFDConsole:
+        console_write(cs, complete, gf, buf, len);
+        break;
     case GuestFDStatic:
         /* Static files are never open for writing: EBADF. */
         complete(cs, -1, EBADF);
@@ -712,6 +770,9 @@ void semihost_sys_lseek(CPUState *cs, gdb_syscall_complete_cb complete,
     case GuestFDStatic:
         staticfile_lseek(cs, complete, gf, off, gdb_whence);
         break;
+    case GuestFDConsole:
+        complete(cs, -1, ESPIPE);
+        break;
     default:
         g_assert_not_reached();
     }
@@ -735,6 +796,9 @@ void semihost_sys_isatty(CPUState *cs, gdb_syscall_complete_cb complete, int fd)
     case GuestFDStatic:
         complete(cs, 0, ENOTTY);
         break;
+    case GuestFDConsole:
+        complete(cs, 1, 0);
+        break;
     default:
         g_assert_not_reached();
     }
@@ -760,6 +824,7 @@ void semihost_sys_flen(CPUState *cs, gdb_syscall_complete_cb fstat_cb,
     case GuestFDStatic:
         staticfile_flen(cs, flen_cb, gf);
         break;
+    case GuestFDConsole:
     default:
         g_assert_not_reached();
     }
@@ -781,6 +846,9 @@ void semihost_sys_fstat(CPUState *cs, gdb_syscall_complete_cb complete,
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


