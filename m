Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9EE55BEDD
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 08:46:54 +0200 (CEST)
Received: from localhost ([::1]:47770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o64zt-0003wt-W2
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 02:46:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o63GG-0003qe-6u
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:55:40 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:35784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o63GE-0000Gd-A8
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:55:39 -0400
Received: by mail-pl1-x629.google.com with SMTP id o18so10051393plg.2
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 21:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qJ6ZZZSlz1PZaI3jEWDbIt6ncn6Ih8ucdkzmvg+FD4w=;
 b=SRhbol8Qd+JYSMjw8eSHKdrb+4gmhXVC0W6OZHlQHE8FJuCyU8FeXcCQ8/GG9VL/FC
 q77zL1O0wGAu3ObFrZsLK45uGJvmY/Iab1YERORRcHmq7P7cwidBeA3pIdEFBxlT6HmV
 HRAQOUWYjDosADvQ+7wDfrHaZX0lsD9nA3ilRjSxYYGwVxNW97w+BBZPUdhgf2V/XScI
 I0WRbuGY8Jeo23WSK0WyqoVGfRxDQ9EzndjYPAecR/FKlsJY6fAuFM6IXxhCOBwz8vnp
 Cyd4QJIjPVjfwt/k9Nzxcl4RtfLNcEwXQTWa2cvllzjSkDgUk8X4o1pTccGhq0UR2g7D
 xl6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qJ6ZZZSlz1PZaI3jEWDbIt6ncn6Ih8ucdkzmvg+FD4w=;
 b=Avws7zcWBZerPKPTQpV3BDBZV8fuxwTT86W1uhvilJSZEk5oSqbyHFep8iHbyCLT96
 ASGpp1rZ9gXz5xKLyAdiWUANelnFqCz41+OdaTGULVuU3EeanY3Vgwr9NnSkfv4KlfgC
 sQpfzheb4wNow8z+4A5Et5jPgYxKnelZpQcK2T8t4eonZeAJRaOrewx0Ns+naZaR5aMP
 kI08Uln/jif4XvHhLgIIj3HVmPWIHt0FZcaN31Aa3Wt8+3g2fghaisQtXqQcsF0sQTl1
 t0ctF2YV0iGFHZsmSysdVfv0h4kCizmW8eMSRm7AhCcdO3S7E74Q16MfRUxrSqLD80nn
 ntpA==
X-Gm-Message-State: AJIora+QEwtklo2JfRq73N8gXHapweG4XvKCZHoVriXY5XPKIwsy9Scr
 LfvpZyNgvWcDPtz9f9arBN8K0xvfHDsRSw==
X-Google-Smtp-Source: AGRyM1tDB777iqJTdinxH5skPa84x0I6DvXtGXuNSSxpIRldsDlEgXM8mdbLnIYR5TG33iJ4knwNUA==
X-Received: by 2002:a17:902:e749:b0:16a:2839:9e5 with SMTP id
 p9-20020a170902e74900b0016a283909e5mr3104269plf.48.1656392136939; 
 Mon, 27 Jun 2022 21:55:36 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 w8-20020a1709026f0800b00168c523032fsm8073735plk.269.2022.06.27.21.55.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 21:55:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Luc Michel <lmichel@kalray.eu>
Subject: [PULL 36/60] semihosting: Split out semihost_sys_rename
Date: Tue, 28 Jun 2022 10:23:39 +0530
Message-Id: <20220628045403.508716-37-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628045403.508716-1-richard.henderson@linaro.org>
References: <20220628045403.508716-1-richard.henderson@linaro.org>
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

Split out the non-ARM specific portions of SYS_RENAME to a
reusable function.

Reviewed-by: Luc Michel <lmichel@kalray.eu>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/semihosting/syscalls.h |  4 +++
 semihosting/arm-compat-semi.c  | 21 +------------
 semihosting/syscalls.c         | 57 ++++++++++++++++++++++++++++++++++
 3 files changed, 62 insertions(+), 20 deletions(-)

diff --git a/include/semihosting/syscalls.h b/include/semihosting/syscalls.h
index 748a4b5e47..21430aa0ef 100644
--- a/include/semihosting/syscalls.h
+++ b/include/semihosting/syscalls.h
@@ -52,4 +52,8 @@ void semihost_sys_flen(CPUState *cs, gdb_syscall_complete_cb fstat_cb,
 void semihost_sys_remove(CPUState *cs, gdb_syscall_complete_cb complete,
                          target_ulong fname, target_ulong fname_len);
 
+void semihost_sys_rename(CPUState *cs, gdb_syscall_complete_cb complete,
+                         target_ulong oname, target_ulong oname_len,
+                         target_ulong nname, target_ulong nname_len);
+
 #endif /* SEMIHOSTING_SYSCALLS_H */
diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index f4ce3851a4..14d37ac9da 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -492,26 +492,7 @@ void do_common_semihosting(CPUState *cs)
         GET_ARG(1);
         GET_ARG(2);
         GET_ARG(3);
-        if (use_gdb_syscalls()) {
-            gdb_do_syscall(common_semi_cb, "rename,%s,%s",
-                           arg0, (int)arg1 + 1, arg2, (int)arg3 + 1);
-        } else {
-            char *s2;
-
-            s = lock_user_string(arg0);
-            if (!s) {
-                goto do_fault;
-            }
-            s2 = lock_user_string(arg2);
-            if (!s2) {
-                unlock_user(s, arg0, 0);
-                goto do_fault;
-            }
-            ret = rename(s, s2);
-            unlock_user(s2, arg2, 0);
-            unlock_user(s, arg0, 0);
-            common_semi_cb(cs, ret, ret ? errno : 0);
-        }
+        semihost_sys_rename(cs, common_semi_cb, arg0, arg1 + 1, arg2, arg3 + 1);
         break;
 
     case TARGET_SYS_CLOCK:
diff --git a/semihosting/syscalls.c b/semihosting/syscalls.c
index 5ec4e8f827..223916b110 100644
--- a/semihosting/syscalls.c
+++ b/semihosting/syscalls.c
@@ -145,6 +145,26 @@ static void gdb_remove(CPUState *cs, gdb_syscall_complete_cb complete,
     gdb_do_syscall(complete, "unlink,%s", fname, len);
 }
 
+static void gdb_rename(CPUState *cs, gdb_syscall_complete_cb complete,
+                       target_ulong oname, target_ulong oname_len,
+                       target_ulong nname, target_ulong nname_len)
+{
+    int olen, nlen;
+
+    olen = validate_strlen(cs, oname, oname_len);
+    if (olen < 0) {
+        complete(cs, -1, -olen);
+        return;
+    }
+    nlen = validate_strlen(cs, nname, nname_len);
+    if (nlen < 0) {
+        complete(cs, -1, -nlen);
+        return;
+    }
+
+    gdb_do_syscall(complete, "rename,%s,%s", oname, olen, nname, nlen);
+}
+
 /*
  * Host semihosting syscall implementations.
  */
@@ -307,6 +327,32 @@ static void host_remove(CPUState *cs, gdb_syscall_complete_cb complete,
     unlock_user(p, fname, 0);
 }
 
+static void host_rename(CPUState *cs, gdb_syscall_complete_cb complete,
+                        target_ulong oname, target_ulong oname_len,
+                        target_ulong nname, target_ulong nname_len)
+{
+    CPUArchState *env G_GNUC_UNUSED = cs->env_ptr;
+    char *ostr, *nstr;
+    int ret;
+
+    ret = validate_lock_user_string(&ostr, cs, oname, oname_len);
+    if (ret < 0) {
+        complete(cs, -1, -ret);
+        return;
+    }
+    ret = validate_lock_user_string(&nstr, cs, nname, nname_len);
+    if (ret < 0) {
+        unlock_user(ostr, oname, 0);
+        complete(cs, -1, -ret);
+        return;
+    }
+
+    ret = rename(ostr, nstr);
+    complete(cs, ret, ret ? errno : 0);
+    unlock_user(ostr, oname, 0);
+    unlock_user(nstr, nname, 0);
+}
+
 /*
  * Static file semihosting syscall implementations.
  */
@@ -562,3 +608,14 @@ void semihost_sys_remove(CPUState *cs, gdb_syscall_complete_cb complete,
         host_remove(cs, complete, fname, fname_len);
     }
 }
+
+void semihost_sys_rename(CPUState *cs, gdb_syscall_complete_cb complete,
+                         target_ulong oname, target_ulong oname_len,
+                         target_ulong nname, target_ulong nname_len)
+{
+    if (use_gdb_syscalls()) {
+        gdb_rename(cs, complete, oname, oname_len, nname, nname_len);
+    } else {
+        host_rename(cs, complete, oname, oname_len, nname, nname_len);
+    }
+}
-- 
2.34.1


