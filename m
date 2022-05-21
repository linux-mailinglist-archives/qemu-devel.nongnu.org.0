Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 994D752F6BA
	for <lists+qemu-devel@lfdr.de>; Sat, 21 May 2022 02:22:45 +0200 (CEST)
Received: from localhost ([::1]:38366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nsCtI-0002tF-Mg
	for lists+qemu-devel@lfdr.de; Fri, 20 May 2022 20:22:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nsCc6-0008CD-Bd
 for qemu-devel@nongnu.org; Fri, 20 May 2022 20:05:00 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:37394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nsCbq-00042L-1Q
 for qemu-devel@nongnu.org; Fri, 20 May 2022 20:04:49 -0400
Received: by mail-pl1-x629.google.com with SMTP id m12so8569854plb.4
 for <qemu-devel@nongnu.org>; Fri, 20 May 2022 17:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=enxou4yoMT/vOpcisCbCyqvDmHRkcHgrMJIOlZ4t5Wk=;
 b=UuUwACNEm16rttnhC6EIr4KP7EYN9j7Eete+HNg5BflWy4dEiEroa2UIfaI4hd5J9z
 ETkFGPg2FHD8ddJ3d3C134DB2weN9E0AVb0ymlJrSoAFkPGt1AhYfmTiBtJwe0zD+lXB
 oJuGyjCV40/TG08Hj5Y8yPLRA2wyGVdDWtaaRnXYW4hKBstrUZXYf56GWpeOCv9n67PH
 Wpv2nPqZjcvKz+ZaEtJGhKDhdrN6g36IQON6nndiYMVeqxZRsGJatdVxFvEyjwQUKQrF
 Vunr65cu0UerXfXR4cTgZgV1qla8wCj+pFSYneqsOw8yhDfhaZuEcii1EHhHP1+NDFBk
 a48w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=enxou4yoMT/vOpcisCbCyqvDmHRkcHgrMJIOlZ4t5Wk=;
 b=y1/qenJvJgqdmZuYYTB0jVSyNqDf4j31BYZtoi8xadvChzXEk1ZriZNU50DV00jE31
 15pgT1fu0SZK7Owe8uExE+iycxjt2cQnubPQ2AYE8Hxp2fIx+YYfHPVZS1/eAMkpK1ky
 wKv2Xl9FK1TMoMn1XcBzE9N0pUIyuij2ZkVJJwLbI3NkQhVmZzKUzyYp7SbM45Npn4XW
 Gly2PozGq/QCEY+WMaFUm4RrJcXxdTxub/FdZY4/ABjtKlMwnD+o+XFNmT90AErbsXsM
 3mXDs69JAcCcVYHEFL4/IAEL+d2RlfhCKO9271e44aLyKDmuEGgQtIbtoyOqqamkjIwP
 4jPQ==
X-Gm-Message-State: AOAM5338EJDU4pktsYnJ143Z14LNkDtmnYfOXhBk4Dd/Qbgu5Pgz/n/C
 o7htuRplPSzOxo9eY2EGeOTiJnaYkta6lQ==
X-Google-Smtp-Source: ABdhPJxvZC96zAvy60Qq22DmHEtVXEJBGVdQv//d0dxzFFbe7bfpyXSIgKvrjYgUpQ/A5lAfVI/gFA==
X-Received: by 2002:a17:902:8c8f:b0:15e:ab1c:591b with SMTP id
 t15-20020a1709028c8f00b0015eab1c591bmr12056861plo.171.1653091477954; 
 Fri, 20 May 2022 17:04:37 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 h8-20020a654808000000b003f9d1c020cbsm306369pgs.51.2022.05.20.17.04.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 May 2022 17:04:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	alex.bennee@linaro.org
Subject: [PATCH v3 32/49] semihosting: Split out semihost_sys_rename
Date: Fri, 20 May 2022 17:03:43 -0700
Message-Id: <20220521000400.454525-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220521000400.454525-1-richard.henderson@linaro.org>
References: <20220521000400.454525-1-richard.henderson@linaro.org>
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
index b4320939a1..f02131aebd 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -478,26 +478,7 @@ void do_common_semihosting(CPUState *cs)
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
index 3464896281..96d823e8b3 100644
--- a/semihosting/syscalls.c
+++ b/semihosting/syscalls.c
@@ -175,6 +175,26 @@ static void gdb_remove(CPUState *cs, gdb_syscall_complete_cb complete,
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
@@ -337,6 +357,32 @@ static void host_remove(CPUState *cs, gdb_syscall_complete_cb complete,
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
+    complete(cs, ret, ret ? errno_for_gdb() : 0);
+    unlock_user(ostr, oname, 0);
+    unlock_user(nstr, nname, 0);
+}
+
 /*
  * Static file semihosting syscall implementations.
  */
@@ -592,3 +638,14 @@ void semihost_sys_remove(CPUState *cs, gdb_syscall_complete_cb complete,
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


