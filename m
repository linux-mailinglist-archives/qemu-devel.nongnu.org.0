Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21902541F39
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 00:52:11 +0200 (CEST)
Received: from localhost ([::1]:49128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyi3W-00038j-33
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 18:52:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyg95-0005h8-U1
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:49:47 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:40933)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyg92-0001p8-8U
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:49:46 -0400
Received: by mail-pl1-x629.google.com with SMTP id i1so15824990plg.7
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 13:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=qTti2vBBVQlW3s6Vv39qkRBctywHeP3Orf0ls4LRzrE=;
 b=SIwtjF7py6wC5mJhrkBKhBPo4L+Ei6kw0Mc1JQeIpEoUgZzWXR4ThGv31KQCKu8Q6N
 CUf8SuWFDifBVE2h7232Rt3ZiUwk+DNTKeoPPAw9FmbNQlP2UVY1UbKQxA/3gRtsEMtQ
 nntge6Yf6EqCdR9zn4xRtYr/gPJ+Njd+BaEZVyPleys4JgXKmLICmzlq/el6Cnrnn8Wv
 QcOYEPb+8eaWF3d2k/ah9lup/px3U21hCfzm6Q33p1ZubRHj1os+i2NJUMMv2U4lx/I6
 yghZyv7HFTmW7/YDJOCgo+n/g9gMHQHoRu4ZZ5ZIjVZWiIiQKCiVNkGL8rFmgSUAtOo8
 5XYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qTti2vBBVQlW3s6Vv39qkRBctywHeP3Orf0ls4LRzrE=;
 b=OE45AgMfDRtle3SQFu6zaEuUuY7eNd+mQZlQCdIeDSYq6BZcDEJya7p3n/Ie+Jj6JI
 ViV7hsGuOEEUYQ9/ewMqDR1cNc7WV2FlDxURavcpC9EFZ/6jd4SI/t5v4NvCuf+0wzvv
 kH+7a37zKejvjO8RJqGiGPwgOEKnvMULoECbo347e4c0ly7SGmwAXWVk3qh8eGs4BvhF
 uEQEy/tvY6JE+5g1MupZcvN/7sQR3ycL4LMEtq92Vh61kJUjL2nOVkw2gsXPJ/FqeGXe
 OZJgTeHNAOCg3hSjabNs90CQOQeG4XKvXmoj9/cqoV3ObVo1UFWSNosY3F96uEKmzt5r
 m+VA==
X-Gm-Message-State: AOAM530v5UpDXY6QCZAWPYLgXSUKFtpm8NK5BtF2wXBqWG3bJrYA8JEx
 uepHLtFN4G4jWbj3k8ptsD6C9CEPQcwtpw==
X-Google-Smtp-Source: ABdhPJxqVBHNmrNwpOFbFc5/ptI6uNQd2YVX2H5B8lj4PJ5BnrfqXVdep1+iSIU2VQAdLHzJRmpizQ==
X-Received: by 2002:a17:902:f690:b0:163:f8eb:3741 with SMTP id
 l16-20020a170902f69000b00163f8eb3741mr30512588plg.112.1654634980345; 
 Tue, 07 Jun 2022 13:49:40 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 128-20020a620686000000b00518b4cfbbe0sm13152327pfg.203.2022.06.07.13.49.39
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:49:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 46/53] semihosting: Add GuestFDConsole
Date: Tue,  7 Jun 2022 13:45:50 -0700
Message-Id: <20220607204557.658541-47-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607204557.658541-1-richard.henderson@linaro.org>
References: <20220607204557.658541-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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


