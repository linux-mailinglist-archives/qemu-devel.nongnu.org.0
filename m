Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E0652F744
	for <lists+qemu-devel@lfdr.de>; Sat, 21 May 2022 03:09:44 +0200 (CEST)
Received: from localhost ([::1]:54226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nsDck-0003gH-Je
	for lists+qemu-devel@lfdr.de; Fri, 20 May 2022 21:09:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nsCeu-00030M-I1
 for qemu-devel@nongnu.org; Fri, 20 May 2022 20:07:52 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:34089)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nsCes-0004Ys-KA
 for qemu-devel@nongnu.org; Fri, 20 May 2022 20:07:52 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 ob14-20020a17090b390e00b001dff2a43f8cso2448163pjb.1
 for <qemu-devel@nongnu.org>; Fri, 20 May 2022 17:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/j2cw52lTOWH/atsAabzvb2VUFPtyq5zVPafxci6jYk=;
 b=M8z/3zqDdqn7ST5Du25y/V2ZkkZfNqe9spOmHajrFoLfBcL1Pub620ChrGI73T+EG9
 tuhyLbDGtxTV4TN8KpH+Hy/B82z3FuOz6rly1hM2wbP0/i+Rv12o2cDzloIxflZBZQTJ
 p+l8gU11bZSuSUA95lFLzpOphb/SgTWctgb67rIwwF86DxafRh1MTq1NsVolJ5Xj4oTl
 uDP53fzy7ylivixL64HwQcvuPViqU/xcSm1j/WCrcCqresHuyV3ZY8KZSayk/mGmFe14
 E0Af2Z7vbnbQZEC+FNfDaJ+opJp5g0FU74Qzc3CK3e7BXjl3qPQ/nIEI80+cnJSFQ/o/
 9fiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/j2cw52lTOWH/atsAabzvb2VUFPtyq5zVPafxci6jYk=;
 b=PLDdciXYmA/X2idnL+nSrmuxRu6zKmFWHqL6UdvjtMcXB7zyWhiUtMyMwL/1ofqyXm
 Pivm8cgTz1TFhseM/P2VNdbJrmctLe7JQ2YWunH7eZFZnlgqCeQdhrj0Es45UV+kg3Ov
 lucx5sEQN+9jtyhF0yGGUSD1V/HjfUlXuXHfp00y+iApI9OVQFAjU1gvQGctnPKDFiXR
 IGp/Xz9NYxlnmMDFEsMidoJd40w4x9yG0KklBpFMeCqKatnKGvjxsRjw2+VoeEoa4fv/
 QmZ6DhOH2ZwJ513lcflflFM4bJ0//9PVQL0FKUWsZb4VlxUV16Iy6F+9JN8NEbb7nDgK
 f8zg==
X-Gm-Message-State: AOAM530IKZf18lHmL+VTX9eJsOs+y4y478awEMkyAAybWvpwDnTtM90o
 KEhxmK08AGVc412HD0f6/8duOHKvvFigEA==
X-Google-Smtp-Source: ABdhPJwXyOtjUgSEtrDGbjAluekEI8F94Cgg3/3dzntDKBVvz1O3Sb3QclBnNBSvtnzhHq6XQwRp5g==
X-Received: by 2002:a17:903:120a:b0:15f:99f:95bc with SMTP id
 l10-20020a170903120a00b0015f099f95bcmr12108436plh.48.1653091669222; 
 Fri, 20 May 2022 17:07:49 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 1-20020a17090a0cc100b001d2bff34228sm2517703pjt.9.2022.05.20.17.07.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 May 2022 17:07:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	alex.bennee@linaro.org
Subject: [PATCH v3 42/49] semihosting: Add GuestFDConsole
Date: Fri, 20 May 2022 17:03:53 -0700
Message-Id: <20220521000400.454525-43-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220521000400.454525-1-richard.henderson@linaro.org>
References: <20220521000400.454525-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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


