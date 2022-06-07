Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5FE9541F33
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 00:48:40 +0200 (CEST)
Received: from localhost ([::1]:43060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyi07-00076o-Km
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 18:48:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyg5y-0007jk-PZ
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:46:34 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:35747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyg5x-0001Iw-0d
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:46:34 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 o6-20020a17090a0a0600b001e2c6566046so21958880pjo.0
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 13:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ZXHdblC6SrA06FFaTRv5QA7GGElan0kMMWhWUA3e/yM=;
 b=CDtJU4toah72Nf6irckQg6uSMNz724bf0GyVhovKAxw7hYf7H3eFKuEMrADipk15Bv
 mH6vudeFt7sYpA39ATUos8gf2Dt2lUIITQVg9E70jfOVHCCpqWNkB8tFizbXGra6Ilrg
 SjRAGX6G61q4Y6NdSwGChKAQ+NcDk0uIGLZE13sAdglXhrafn4dGxbha6eBH5+pGDgfV
 qmHMbucC2sVO65ANK3rqInrOhm3zYmmRAfKhLh7Iq4MbMq1uQVgnCufp/q7mozyE2fgg
 8dOAkoa7TRUq1+qztQR5CQzubYDsuwXeS12hoHD8kgtISMMWWMA657OwqHuj0Z4MOEQm
 xXag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZXHdblC6SrA06FFaTRv5QA7GGElan0kMMWhWUA3e/yM=;
 b=CxgF6zOJ1XlO3R4VjnRmo/N8kRw2lH1bccu4sYXO5qAnTMgP4UcD3p8NUy720lgu/9
 PtZx3+5hMsAtzdcq/CbflumlAJ4wrwY2sBenc8ofjwdO+QXwGhtQm3No4WiBZsRyhUmS
 txeaq8D07gvUNQrgbVbc6ke+lTVRmu/v9ohJIMS8PqWNTlyyi2/Q7eBcepmJ+viiV5FU
 1b1rzGjYZ4vtKs2RsggW9fgzcn3eDQ49wa6jZTjkw5mFf4wT7miSe6qKHjCDHOQCLkL0
 aaoLaIMSmeXbxFYB2c1aAHYManyYlLqIHjyF4ZrVybJUYpRT/pDcf6CQ0b0QUhvFfTJX
 DxGQ==
X-Gm-Message-State: AOAM533MhuoaVXyjAWq5B24NKS7EHz/AWdt0lnmEUhqSarPgqx9PMAoS
 rw6W2uh2tIBbRyuc5LyiFFzqZ+Yj24RbZw==
X-Google-Smtp-Source: ABdhPJxBsXD7tdCWTZswqmRMGvMgx5U/wJJSE31DPIs3nhKgb1nibBRD9NQBbHiXEEyhs2Kxp8qwqw==
X-Received: by 2002:a17:90b:33ca:b0:1e8:61e8:7b26 with SMTP id
 lk10-20020a17090b33ca00b001e861e87b26mr18985167pjb.102.1654634792151; 
 Tue, 07 Jun 2022 13:46:32 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 r6-20020a170902be0600b00162037fbacdsm12971279pls.187.2022.06.07.13.46.31
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:46:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 37/53] semihosting: Split out semihost_sys_system
Date: Tue,  7 Jun 2022 13:45:41 -0700
Message-Id: <20220607204557.658541-38-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607204557.658541-1-richard.henderson@linaro.org>
References: <20220607204557.658541-1-richard.henderson@linaro.org>
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
index da5c80b3d5..8a4e22a20a 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -506,17 +506,7 @@ void do_common_semihosting(CPUState *cs)
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
index 223916b110..de846ced32 100644
--- a/semihosting/syscalls.c
+++ b/semihosting/syscalls.c
@@ -165,6 +165,18 @@ static void gdb_rename(CPUState *cs, gdb_syscall_complete_cb complete,
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
@@ -353,6 +365,24 @@ static void host_rename(CPUState *cs, gdb_syscall_complete_cb complete,
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
+    complete(cs, ret, ret == -1 ? errno : 0);
+    unlock_user(p, cmd, 0);
+}
+
 /*
  * Static file semihosting syscall implementations.
  */
@@ -619,3 +649,13 @@ void semihost_sys_rename(CPUState *cs, gdb_syscall_complete_cb complete,
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


