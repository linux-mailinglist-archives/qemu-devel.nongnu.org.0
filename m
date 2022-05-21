Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F9C152F709
	for <lists+qemu-devel@lfdr.de>; Sat, 21 May 2022 02:53:29 +0200 (CEST)
Received: from localhost ([::1]:34586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nsDN2-0006QE-JN
	for lists+qemu-devel@lfdr.de; Fri, 20 May 2022 20:53:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nsCc7-0008CM-32
 for qemu-devel@nongnu.org; Fri, 20 May 2022 20:05:00 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:45013)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nsCbt-00042P-HJ
 for qemu-devel@nongnu.org; Fri, 20 May 2022 20:04:53 -0400
Received: by mail-pf1-x431.google.com with SMTP id x143so8947462pfc.11
 for <qemu-devel@nongnu.org>; Fri, 20 May 2022 17:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=y40sF2c9DbUtXmV2ndKv/KtYmK5ILHYoXK/oAxIJpeU=;
 b=BqxuznKg/VbuPsfCIcm0NKZ85Z7QwCbuldtJ7bNQ2L4No5IWkrDpEBtB6R7D0I35Iy
 341Mfu4ww6u3JE18zO9yWidk2180XWvEnpsFvYw+lE4Ir3SfkMKnG8EANKdbkL/vVyBM
 BxFkOmLLpTTPIxcpgQw3fayvWXdceQSXQaQSUK07VjrdM8UIMzW6dZ304J2yVwx/o6K7
 EB/Oj9VgBIugcDyd9BIObv179CXrWkpWEGCk4jEZQRbkEDC31fsejaDSfjRyx4LNWQPQ
 uVZDSX7nsaLUjM5hlIXaSo1hPgrpMYdDvw5Y3ukMnl0It0b4kFGDANTztjQ6EvMtZ6ZV
 VbIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=y40sF2c9DbUtXmV2ndKv/KtYmK5ILHYoXK/oAxIJpeU=;
 b=33VQQESq1hP74O07+2MJn7eTV9EJHOlMmk0JhP6RLQolBQJPxeu7lnp9sQJTMs8BJH
 dI3QtiZ+aGBa/T6yX+u4/keP9Rh7z2Gdjnpg49FGtEni9+IIcZLtoZvVvrtFNYfAo7F4
 fyiPshlLVNrS4NwneWJVrZeUDQLKaOPCAf9+8VgOmvJr5af8oRJBHaeASCuQQkRrJIdX
 Jkc4JpOflsIBx4OekxCxLQ0Oecw4b6V9urC18deyKz4e43fQ4eqfJwC1fnwTMXzS+59e
 UC7yWkqIfYjsMoELn1fggdz7nthWusQdWu1rUIw1KnDjO2vwv9uDX/0kN8m/GgYAPH2j
 5ulQ==
X-Gm-Message-State: AOAM532GJRuyjZqo7QYLrRaahJTZcIaWbiN10SkRavTZCu7e/6udYsJx
 54dxxxrq3vHPjXOHOUqV+ffae6JH7mhQtw==
X-Google-Smtp-Source: ABdhPJxexglpYGimk9fvX41NRcNN5WMikggNzXmZ088/n2skEbCOssKZHU6lbbBfTRN+SQKd9Ww6Pw==
X-Received: by 2002:a63:210f:0:b0:3f6:24e6:bec with SMTP id
 h15-20020a63210f000000b003f624e60becmr10667186pgh.400.1653091478870; 
 Fri, 20 May 2022 17:04:38 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 h8-20020a654808000000b003f9d1c020cbsm306369pgs.51.2022.05.20.17.04.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 May 2022 17:04:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	alex.bennee@linaro.org
Subject: [PATCH v3 33/49] semihosting: Split out semihost_sys_system
Date: Fri, 20 May 2022 17:03:44 -0700
Message-Id: <20220521000400.454525-34-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220521000400.454525-1-richard.henderson@linaro.org>
References: <20220521000400.454525-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

Split out the non-ARM specific portions of SYS_SYSTEM to a
reusable function.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/semihosting/syscalls.h |  3 +++
 semihosting/arm-compat-semi.c  | 12 +---------
 semihosting/syscalls.c         | 40 ++++++++++++++++++++++++++++++++++
 3 files changed, 44 insertions(+), 11 deletions(-)

diff --git a/include/semihosting/syscalls.h b/include/semihosting/syscalls.h
index 21430aa0ef..c9f9e66be1 100644
--- a/include/semihosting/syscalls.h
+++ b/include/semihosting/syscalls.h
@@ -56,4 +56,7 @@ void semihost_sys_rename(CPUState *cs, gdb_syscall_complete_cb complete,
                          target_ulong oname, target_ulong oname_len,
                          target_ulong nname, target_ulong nname_len);
 
+void semihost_sys_system(CPUState *cs, gdb_syscall_complete_cb complete,
+                         target_ulong cmd, target_ulong cmd_len);
+
 #endif /* SEMIHOSTING_SYSCALLS_H */
diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index f02131aebd..9cfa8a421c 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -493,17 +493,7 @@ void do_common_semihosting(CPUState *cs)
     case TARGET_SYS_SYSTEM:
         GET_ARG(0);
         GET_ARG(1);
-        if (use_gdb_syscalls()) {
-            gdb_do_syscall(common_semi_cb, "system,%s", arg0, (int)arg1 + 1);
-            break;
-        }
-        s = lock_user_string(arg0);
-        if (!s) {
-            goto do_fault;
-        }
-        ret = system(s);
-        unlock_user(s, arg0, 0);
-        common_semi_cb(cs, ret, ret == -1 ? errno : 0);
+        semihost_sys_system(cs, common_semi_cb, arg0, arg1 + 1);
         break;
 
     case TARGET_SYS_ERRNO:
diff --git a/semihosting/syscalls.c b/semihosting/syscalls.c
index 96d823e8b3..b6c395af22 100644
--- a/semihosting/syscalls.c
+++ b/semihosting/syscalls.c
@@ -195,6 +195,18 @@ static void gdb_rename(CPUState *cs, gdb_syscall_complete_cb complete,
     gdb_do_syscall(complete, "rename,%s,%s", oname, olen, nname, nlen);
 }
 
+static void gdb_system(CPUState *cs, gdb_syscall_complete_cb complete,
+                       target_ulong cmd, target_ulong cmd_len)
+{
+    int len = validate_strlen(cs, cmd, cmd_len);
+    if (len < 0) {
+        complete(cs, -1, -len);
+        return;
+    }
+
+    gdb_do_syscall(complete, "system,%s", cmd, len);
+}
+
 /*
  * Host semihosting syscall implementations.
  */
@@ -383,6 +395,24 @@ static void host_rename(CPUState *cs, gdb_syscall_complete_cb complete,
     unlock_user(nstr, nname, 0);
 }
 
+static void host_system(CPUState *cs, gdb_syscall_complete_cb complete,
+                        target_ulong cmd, target_ulong cmd_len)
+{
+    CPUArchState *env G_GNUC_UNUSED = cs->env_ptr;
+    char *p;
+    int ret;
+
+    ret = validate_lock_user_string(&p, cs, cmd, cmd_len);
+    if (ret < 0) {
+        complete(cs, -1, -ret);
+        return;
+    }
+
+    ret = system(p);
+    complete(cs, ret, ret == -1 ? errno_for_gdb() : 0);
+    unlock_user(p, cmd, 0);
+}
+
 /*
  * Static file semihosting syscall implementations.
  */
@@ -649,3 +679,13 @@ void semihost_sys_rename(CPUState *cs, gdb_syscall_complete_cb complete,
         host_rename(cs, complete, oname, oname_len, nname, nname_len);
     }
 }
+
+void semihost_sys_system(CPUState *cs, gdb_syscall_complete_cb complete,
+                         target_ulong cmd, target_ulong cmd_len)
+{
+    if (use_gdb_syscalls()) {
+        gdb_system(cs, complete, cmd, cmd_len);
+    } else {
+        host_system(cs, complete, cmd, cmd_len);
+    }
+}
-- 
2.34.1


