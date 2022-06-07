Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 195B0541E43
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 00:28:15 +0200 (CEST)
Received: from localhost ([::1]:48498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyhgL-0005v5-Hw
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 18:28:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyg5y-0007js-RZ
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:46:34 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:53099)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyg5w-0001Zt-Rx
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:46:34 -0400
Received: by mail-pj1-x102d.google.com with SMTP id gd1so16698356pjb.2
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 13:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=EyKpAGdKnRqUyWCkixrBsiIlLJNPzOZLPQD/wXw+KgI=;
 b=NTaDVaVoeHR5K2efkOuHAi9eKbfWb1puSJDsYMOxZRzF3CFrBSwId+9zK/UHGqyz0k
 Yppzwev7yUX9OnRyKsLXY+Ex4dX7uNWdmaKZ29dyxEY8oL4hNA8RNk9sv7iavS17gTKS
 d8Ps3WjzB9ijQbicfM2fMRyATjYEohd+oyNKbh3UHoGoQs2OeFXi+YZEfvJjTXeQtFSB
 Z+hg5FNHbJGxOk7nMPWtki7Sr7RElBzh289IDm73qTIH8MsD5KngfVTbGlZTznd9WdLg
 LTNewW5s2GBCFLCRhnrW6CBQaNTP10pqYZeCivrIi1WX2LsAKjb/O//1HgTeXKzhaYm/
 FcpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EyKpAGdKnRqUyWCkixrBsiIlLJNPzOZLPQD/wXw+KgI=;
 b=XVRp5fK9LV006BznhnEJItgiIxn6rFnkIcLom8f/fn4c9lgJTNYXiDRPDghHvruJwD
 Wff0ykyn21CV/ROEWLZEq4mmJTQRbklauzpZMK05mzvBIyG8CbPOrw4Xss1kgSMNsOdG
 IO7yNUc0AsO3VzSBrmZ+EiMsSK+UtRzq0ZfvF1oTo+qKsRj8UKL62D+OGCrUeflsd8Yo
 6y43alNMFyr4ScNgqZByxwwFvEjqeg1DASlbdAPL8EqHIBeQmXTk9hQjA/zUCFwoypZA
 zOdKfjIMIZtA+UGkWL6EnIr9MvlJwYdK8vyY1JWOOIlqnEMJSghkPT8JtlBqJoQd2TsD
 h9/Q==
X-Gm-Message-State: AOAM530LdC1cd7MfC6EP/jsXN5qPmDuPKFQ1FkbUeW4iw4omAXtB5Rfe
 SMpJtficy5nkRChUtCOPNicr/E0JSEAeLA==
X-Google-Smtp-Source: ABdhPJwWYj3DtON4rlc626vqBy/6vvalYrfZEsQ3/pGABmhyukbjXSPsTO2cXfnM4am1yfV33LXoRA==
X-Received: by 2002:a17:90a:c202:b0:1e2:e772:5f0a with SMTP id
 e2-20020a17090ac20200b001e2e7725f0amr33951733pjt.109.1654634791448; 
 Tue, 07 Jun 2022 13:46:31 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 r6-20020a170902be0600b00162037fbacdsm12971279pls.187.2022.06.07.13.46.30
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:46:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 36/53] semihosting: Split out semihost_sys_rename
Date: Tue,  7 Jun 2022 13:45:40 -0700
Message-Id: <20220607204557.658541-37-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607204557.658541-1-richard.henderson@linaro.org>
References: <20220607204557.658541-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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
index 6c9d50176a..da5c80b3d5 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -491,26 +491,7 @@ void do_common_semihosting(CPUState *cs)
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


