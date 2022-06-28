Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E6355BE99
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 08:06:49 +0200 (CEST)
Received: from localhost ([::1]:55430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o64N6-0000Yj-6Y
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 02:06:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o63Fz-0003Tr-Jf
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:55:24 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:41699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o63Fx-0008Mm-5N
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:55:23 -0400
Received: by mail-pg1-x530.google.com with SMTP id 23so11059700pgc.8
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 21:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zxu6KINxLNHNyp6D+HUlx2eL0Z4pY5AXAf49O5rqj6A=;
 b=cBCUYNHPK+CnqgoDTUgj6Xdpe68GwVrVwfHhgZDNNM5qAGI1VjPSu8xl+KvR5P73ci
 +oNK4+oE4LdCN4ds7ftO6wlb+cCrNO8KPsd3Ft16r4ntdx6Bklvg3QVJTpzL1iwmQX2x
 Rs7wbz/q5v9yLPgwCWqdd8nKU/pNV+nZiuGeV/DEucmBbLeI7LMIQvd4RnppRKW20xX8
 Qwq45WsYSZecuO4PZ215wXRKsFjod4xf5neYzU4RfvCRW60lBg2ZvA9+DTr/j5+LE0TH
 ZeN8EtySP8sX3RbCkrmzsZM7hGOPDcWP4O/mteUrW3EwSu8opeFhkdFcotH2JhKnOQQk
 20Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zxu6KINxLNHNyp6D+HUlx2eL0Z4pY5AXAf49O5rqj6A=;
 b=hC4cOJ6Vm9PlN3D9XFnzMW/tpOrkmFhptLMH3MSbCIqRBCGGf+nhj3jdqocMMZM1Sa
 RfV8fgfxgezqq0jQ6H2lQ2O0cwuElMgzlgrpZzzHhASEvs6DJ/nyEOUpyh2TYXa+6K5X
 lBc+Gl3Yuqwh1LOxKokXwo5hrCuHklO1XUxvYMvEhyJjfppaP2gNvPNkZMKNYJ/aPYk5
 2LvI/Tg1MZaqYFABZ0nUqGVwy4EnLBoXIfFUKmHy4ZAZZqtzIwLfIxKb0jYUtfUdoI05
 VYwLhuz9Gfhi6KWRsdZ9d2sjcxDZnP7Z8fQIHcSl3EuNFuTO0ukwoxMYTlDfnZvZKA9Q
 jAiw==
X-Gm-Message-State: AJIora9OeYlGeHFDBpV/KEyEbTWW2oVr4BcJ2a75UTaPHN3ayCeaHUQa
 AEY5qIelem2C7/lfShEXDezas8Geb07MiA==
X-Google-Smtp-Source: AGRyM1vuwXk+6SbY2q0qc/peg3Olw9spx9MahC3awUk+LofVB/2IIKErg6B2TlriwN6Qzjzu2gZF1g==
X-Received: by 2002:a63:4a4e:0:b0:401:baa6:d695 with SMTP id
 j14-20020a634a4e000000b00401baa6d695mr16690155pgl.259.1656392120327; 
 Mon, 27 Jun 2022 21:55:20 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 w8-20020a1709026f0800b00168c523032fsm8073735plk.269.2022.06.27.21.55.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 21:55:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Luc Michel <lmichel@kalray.eu>
Subject: [PULL 30/60] semihosting: Split out semihost_sys_write
Date: Tue, 28 Jun 2022 10:23:33 +0530
Message-Id: <20220628045403.508716-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628045403.508716-1-richard.henderson@linaro.org>
References: <20220628045403.508716-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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

Split out the non-ARM specific portions of SYS_WRITE to a
reusable function.  This handles all GuestFD.  This removes
the last use of common_semi_syscall_len.

Note that gdb_do_syscall %x reads target_ulong, not int.

Reviewed-by: Luc Michel <lmichel@kalray.eu>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/semihosting/syscalls.h |  6 ++++
 semihosting/arm-compat-semi.c  | 52 +-------------------------------
 semihosting/syscalls.c         | 54 ++++++++++++++++++++++++++++++++++
 3 files changed, 61 insertions(+), 51 deletions(-)

diff --git a/include/semihosting/syscalls.h b/include/semihosting/syscalls.h
index 20da8138b0..2464467579 100644
--- a/include/semihosting/syscalls.h
+++ b/include/semihosting/syscalls.h
@@ -33,4 +33,10 @@ void semihost_sys_read(CPUState *cs, gdb_syscall_complete_cb complete,
 void semihost_sys_read_gf(CPUState *cs, gdb_syscall_complete_cb complete,
                           GuestFD *gf, target_ulong buf, target_ulong len);
 
+void semihost_sys_write(CPUState *cs, gdb_syscall_complete_cb complete,
+                        int fd, target_ulong buf, target_ulong len);
+
+void semihost_sys_write_gf(CPUState *cs, gdb_syscall_complete_cb complete,
+                           GuestFD *gf, target_ulong buf, target_ulong len);
+
 #endif /* SEMIHOSTING_SYSCALLS_H */
diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index 8da31d8507..d591fcd7c2 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -215,8 +215,6 @@ static inline uint32_t get_swi_errno(CPUState *cs)
 #endif
 }
 
-static target_ulong common_semi_syscall_len;
-
 static void common_semi_cb(CPUState *cs, target_ulong ret, target_ulong err)
 {
     if (err) {
@@ -230,9 +228,6 @@ static void common_semi_cb(CPUState *cs, target_ulong ret, target_ulong err)
         /* Fixup syscalls that use nonstardard return conventions.  */
         target_ulong reg0 = common_semi_arg(cs, 0);
         switch (reg0) {
-        case TARGET_SYS_WRITE:
-            ret = common_semi_syscall_len - ret;
-            break;
         case TARGET_SYS_SEEK:
             ret = 0;
             break;
@@ -294,30 +289,10 @@ common_semi_flen_cb(CPUState *cs, target_ulong ret, target_ulong err)
  * do the work and return the required return value to the guest
  * via common_semi_cb.
  */
-typedef void sys_writefn(CPUState *cs, GuestFD *gf,
-                         target_ulong buf, uint32_t len);
 typedef void sys_isattyfn(CPUState *cs, GuestFD *gf);
 typedef void sys_seekfn(CPUState *cs, GuestFD *gf, target_ulong offset);
 typedef void sys_flenfn(CPUState *cs, GuestFD *gf);
 
-static void host_writefn(CPUState *cs, GuestFD *gf,
-                         target_ulong buf, uint32_t len)
-{
-    CPUArchState *env = cs->env_ptr;
-    uint32_t ret = 0;
-    char *s = lock_user(VERIFY_READ, buf, len, 1);
-    (void) env; /* Used in arm softmmu lock_user implicitly */
-    if (s) {
-        ret = write(gf->hostfd, s, len);
-        unlock_user(s, buf, 0);
-        if (ret == (uint32_t)-1) {
-            ret = 0;
-        }
-    }
-    /* Return bytes not written, on error as well. */
-    common_semi_cb(cs, len - ret, 0);
-}
-
 static void host_isattyfn(CPUState *cs, GuestFD *gf)
 {
     common_semi_cb(cs, isatty(gf->hostfd), 0);
@@ -340,13 +315,6 @@ static void host_flenfn(CPUState *cs, GuestFD *gf)
     }
 }
 
-static void gdb_writefn(CPUState *cs, GuestFD *gf,
-                        target_ulong buf, uint32_t len)
-{
-    common_semi_syscall_len = len;
-    gdb_do_syscall(common_semi_cb, "write,%x,%x,%x", gf->hostfd, buf, len);
-}
-
 static void gdb_isattyfn(CPUState *cs, GuestFD *gf)
 {
     gdb_do_syscall(common_semi_cb, "isatty,%x", gf->hostfd);
@@ -380,13 +348,6 @@ static const uint8_t featurefile_data[] = {
     SH_EXT_EXIT_EXTENDED | SH_EXT_STDOUT_STDERR, /* Feature byte 0 */
 };
 
-static void staticfile_writefn(CPUState *cs, GuestFD *gf,
-                               target_ulong buf, uint32_t len)
-{
-    /* This fd can never be open for writing */
-    common_semi_cb(cs, -1, EBADF);
-}
-
 static void staticfile_isattyfn(CPUState *cs, GuestFD *gf)
 {
     common_semi_cb(cs, 0, 0);
@@ -404,7 +365,6 @@ static void staticfile_flenfn(CPUState *cs, GuestFD *gf)
 }
 
 typedef struct GuestFDFunctions {
-    sys_writefn *writefn;
     sys_isattyfn *isattyfn;
     sys_seekfn *seekfn;
     sys_flenfn *flenfn;
@@ -412,19 +372,16 @@ typedef struct GuestFDFunctions {
 
 static const GuestFDFunctions guestfd_fns[] = {
     [GuestFDHost] = {
-        .writefn = host_writefn,
         .isattyfn = host_isattyfn,
         .seekfn = host_seekfn,
         .flenfn = host_flenfn,
     },
     [GuestFDGDB] = {
-        .writefn = gdb_writefn,
         .isattyfn = gdb_isattyfn,
         .seekfn = gdb_seekfn,
         .flenfn = gdb_flenfn,
     },
     [GuestFDStatic] = {
-        .writefn = staticfile_writefn,
         .isattyfn = staticfile_isattyfn,
         .seekfn = staticfile_seekfn,
         .flenfn = staticfile_flenfn,
@@ -449,7 +406,6 @@ void do_common_semihosting(CPUState *cs)
     char * s;
     int nr;
     uint32_t ret;
-    uint32_t len;
     GuestFD *gf;
     int64_t elapsed;
 
@@ -531,13 +487,7 @@ void do_common_semihosting(CPUState *cs)
         GET_ARG(0);
         GET_ARG(1);
         GET_ARG(2);
-        len = arg2;
-
-        gf = get_guestfd(arg0);
-        if (!gf) {
-            goto do_badf;
-        }
-        guestfd_fns[gf->type].writefn(cs, gf, arg1, len);
+        semihost_sys_write(cs, common_semi_rw_cb, arg0, arg1, arg2);
         break;
 
     case TARGET_SYS_READ:
diff --git a/semihosting/syscalls.c b/semihosting/syscalls.c
index d42a190746..5cb12d6adc 100644
--- a/semihosting/syscalls.c
+++ b/semihosting/syscalls.c
@@ -107,6 +107,13 @@ static void gdb_read(CPUState *cs, gdb_syscall_complete_cb complete,
                    (target_ulong)gf->hostfd, buf, len);
 }
 
+static void gdb_write(CPUState *cs, gdb_syscall_complete_cb complete,
+                      GuestFD *gf, target_ulong buf, target_ulong len)
+{
+    gdb_do_syscall(complete, "write,%x,%x,%x",
+                   (target_ulong)gf->hostfd, buf, len);
+}
+
 /*
  * Host semihosting syscall implementations.
  */
@@ -193,6 +200,22 @@ static void host_read(CPUState *cs, gdb_syscall_complete_cb complete,
     }
 }
 
+static void host_write(CPUState *cs, gdb_syscall_complete_cb complete,
+                       GuestFD *gf, target_ulong buf, target_ulong len)
+{
+    CPUArchState *env G_GNUC_UNUSED = cs->env_ptr;
+    void *ptr = lock_user(VERIFY_READ, buf, len, 1);
+    ssize_t ret;
+
+    if (!ptr) {
+        complete(cs, -1, EFAULT);
+        return;
+    }
+    ret = write(gf->hostfd, ptr, len);
+    complete(cs, ret, ret == -1 ? errno : 0);
+    unlock_user(ptr, buf, 0);
+}
+
 /*
  * Static file semihosting syscall implementations.
  */
@@ -286,3 +309,34 @@ void semihost_sys_read(CPUState *cs, gdb_syscall_complete_cb complete,
         complete(cs, -1, EBADF);
     }
 }
+
+void semihost_sys_write_gf(CPUState *cs, gdb_syscall_complete_cb complete,
+                           GuestFD *gf, target_ulong buf, target_ulong len)
+{
+    switch (gf->type) {
+    case GuestFDGDB:
+        gdb_write(cs, complete, gf, buf, len);
+        break;
+    case GuestFDHost:
+        host_write(cs, complete, gf, buf, len);
+        break;
+    case GuestFDStatic:
+        /* Static files are never open for writing: EBADF. */
+        complete(cs, -1, EBADF);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+void semihost_sys_write(CPUState *cs, gdb_syscall_complete_cb complete,
+                        int fd, target_ulong buf, target_ulong len)
+{
+    GuestFD *gf = get_guestfd(fd);
+
+    if (gf) {
+        semihost_sys_write_gf(cs, complete, gf, buf, len);
+    } else {
+        complete(cs, -1, EBADF);
+    }
+}
-- 
2.34.1


