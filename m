Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 377AD518E3A
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 22:10:02 +0200 (CEST)
Received: from localhost ([::1]:59336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlyqO-0007sx-Tl
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 16:10:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyWT-0002Gh-7C
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:49:28 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:43782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyWN-0003c6-6O
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:49:21 -0400
Received: by mail-pg1-x52f.google.com with SMTP id q76so11750651pgq.10
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 12:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=/Tnt2IWUsnzN1DncvQNw1ounPVnk2pgfg+nnvDvrCdE=;
 b=LUyAqobHP30Lh8OtIA+55QMwrRw5jqnYhqmQOvEGqYMj1i4ID6zpUKSKuc1N6tXY66
 dmmVomoGcDXL9Npj6XHnHQW5topaox+SA9JamHHnvn9FMKDIWnnTeAnW0J8ctgQt7FBV
 1ly+/q4fbnmmxaZW0bG5QaNZwvhWQrQ0Sg1/g1jgNfnciWqZr6yVTO2lMDzMfnOJgS/H
 wuyYFi4vOQyuxZGmKwt26tKwvJyoZGtUiKGYGhKw6cGnGY5ki9JFoXkGgJck/oQ/JLMl
 Fo4j8EslpnIzXgLhqvaIis7qncCrOXn3kT1SagsrVwBYwc7X9GgbNt3sNbbgwoKP0tCS
 p4gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/Tnt2IWUsnzN1DncvQNw1ounPVnk2pgfg+nnvDvrCdE=;
 b=oT+o+wQXT7ZfP+QIeSJrRRFTldLt5pVVECGaGlSw3EN/35LedLD7C7Yl40mJfOcpoH
 HzWgOBCY+LPoR+eWE1XSRAKeE66JW7hPzRyYRf7IBbNf8ebSMQ6QtEB394hcmh8K/Yjh
 hprzDgqgah2C+85TaEJZg98Fy7d1gXxIdQ24laAufPF8F88lkgAaJn/vHhYVTYvp2QWM
 FnI1H5mPO7kGwOX5MvexO29VEX/TdWFKHZsB73KuM1WmbFpRn8qNBcJMwuvRqIguFTyo
 PuXjs7LQlPM3PidH1T2JfPoS2YBfCRUZISGNfcsZyGCvDRDPRaDYCPl0rGm0CGlTu+rU
 NZGw==
X-Gm-Message-State: AOAM533Q2umBvJ3l/G2NaII3SqYv3RjNzhDw5NXeWq3Z934eA8G98FLu
 CpxMfBtuDlKW1MPk9t8SPYAZBCtfaet+ww==
X-Google-Smtp-Source: ABdhPJy90ZlHT+oSOPOlWdKxwnNoy6yPcP7aPhu5M0yDYcf5tdRlk1HnYAp/y88ppyX+zqtJUMzMbA==
X-Received: by 2002:a63:85c8:0:b0:3ab:24cf:e625 with SMTP id
 u191-20020a6385c8000000b003ab24cfe625mr15309386pgd.212.1651607356343; 
 Tue, 03 May 2022 12:49:16 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 p11-20020a17090ad30b00b001cd4989fed3sm1712383pju.31.2022.05.03.12.49.15
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 12:49:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 31/74] semihosting: Split out semihost_sys_system
Date: Tue,  3 May 2022 12:48:00 -0700
Message-Id: <20220503194843.1379101-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220503194843.1379101-1-richard.henderson@linaro.org>
References: <20220503194843.1379101-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
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
index f554f4761f..a7520d6f41 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -496,17 +496,7 @@ void do_common_semihosting(CPUState *cs)
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


