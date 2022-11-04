Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 264A2619EE9
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 18:37:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1or0cd-0000HT-AU; Fri, 04 Nov 2022 13:36:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1or0cb-0000Eh-AZ
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 13:36:49 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1or0cZ-0003vm-Hh
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 13:36:48 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 v124-20020a1cac82000000b003cf7a4ea2caso5858411wme.5
 for <qemu-devel@nongnu.org>; Fri, 04 Nov 2022 10:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ySa/ES1xlmucJALkQqyY4MyTUUQjejtiY/uWInOLY+4=;
 b=SK6pmIJRsk8psOxrmc2Va0Ka7wocLvkL/vtltbKUjsIiyAaTzQzGaFnryr8O50sVR+
 oBMt1mrtkQiEukvXmJyWW4ZvsDReaRF11eTMOJjBhaHW3BZ0jVVjn0YWjk9ReaKlCLKA
 J6pki4HsFSIWAD6xUO2ULqv8CZic3PCzpPLAryOn4U8eVGuhjjntKP9aiHGJTiRDmSX1
 zaPi8gt2nT3eRf8/pku+e0RfNq6DQOnEIuEtdMwz/bqInEk7Oj5Pza3JE6QpH4at25d2
 rR7m+fthDAuL26QMeuHFKyhFqb0Cr27pJMADItClys10z/e3lQh1KAlCsD32qpPO2omO
 v7tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ySa/ES1xlmucJALkQqyY4MyTUUQjejtiY/uWInOLY+4=;
 b=FuRrSRrWKF83y2LHQO6BXVh3p0r9m71hc9bAaVy1nksH6RFlS09qvWNqh+C0uhTz1r
 N1ICBfbV792fENCmCbKMzLi/CoUyFeijxRjAievyCwHoQRReYd8FBJlLO07rwcLPHMO/
 MCK6tVBRH+44PclsdlslbhhSBoYxEemg2w+nVyNmVcbliZQO0/dvldndWM//kwe4VimU
 QnWswv9epGJ6kIbHmGaVqVXpzwD+MpJDUnsZCnKkoeMtpgGnLPydnSDSN42hGs+QSFox
 VVeHkmY/stdsalTBOTjurzEXxLuQpAgVH4FAotQLrao7e1H+DPD5hVOtnWY12HUjPSZt
 oq0Q==
X-Gm-Message-State: ACrzQf1umsSfOQWP/M8wqQyNbGEFNCDvqmBcDujsbhOm7IvFw8qPLfuq
 kKxvLCGFaIBARvL6LF3Ufzzb1ibD9eC9Dw==
X-Google-Smtp-Source: AMsMyM6dSZAV/rHO+C0EsJs5FqoHvpz9Bwy50ahjBAsjPTXnWhW95aVsA4ebLd7ko1um2faAr+3Z7g==
X-Received: by 2002:a1c:c901:0:b0:3cf:6fdb:3367 with SMTP id
 f1-20020a1cc901000000b003cf6fdb3367mr20427783wmb.119.1667583405907; 
 Fri, 04 Nov 2022 10:36:45 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 m15-20020a056000024f00b002365b759b65sm3747615wrz.86.2022.11.04.10.36.44
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 04 Nov 2022 10:36:45 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, Helge Deller <deller@gmx.de>,
 Drew DeVault <sir@cmpwn.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v5 2/5] linux-user/strace: Extract print_execve_argv() from
 print_execve()
Date: Fri,  4 Nov 2022 18:36:29 +0100
Message-Id: <20221104173632.1052-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221104173632.1052-1-philmd@linaro.org>
References: <20221104173632.1052-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Drew DeVault <sir@cmpwn.com>

In order to add print_execveat() which re-use common code from
print_execve(), extract print_execve_argv() from it.

Signed-off-by: Drew DeVault <sir@cmpwn.com>
Message-Id: <20221104081015.706009-1-sir@cmpwn.com>
[PMD: Split of bigger patch, filled description, fixed style]
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 linux-user/strace.c | 71 +++++++++++++++++++++++++--------------------
 1 file changed, 39 insertions(+), 32 deletions(-)

diff --git a/linux-user/strace.c b/linux-user/strace.c
index 25c47f0316..3d11d2f759 100644
--- a/linux-user/strace.c
+++ b/linux-user/strace.c
@@ -616,38 +616,6 @@ print_semctl(CPUArchState *cpu_env, const struct syscallname *name,
 }
 #endif
 
-static void
-print_execve(CPUArchState *cpu_env, const struct syscallname *name,
-             abi_long arg1, abi_long arg2, abi_long arg3,
-             abi_long arg4, abi_long arg5, abi_long arg6)
-{
-    abi_ulong arg_ptr_addr;
-    char *s;
-
-    if (!(s = lock_user_string(arg1)))
-        return;
-    qemu_log("%s(\"%s\",{", name->name, s);
-    unlock_user(s, arg1, 0);
-
-    for (arg_ptr_addr = arg2; ; arg_ptr_addr += sizeof(abi_ulong)) {
-        abi_ulong *arg_ptr, arg_addr;
-
-        arg_ptr = lock_user(VERIFY_READ, arg_ptr_addr, sizeof(abi_ulong), 1);
-        if (!arg_ptr)
-            return;
-    arg_addr = tswapal(*arg_ptr);
-        unlock_user(arg_ptr, arg_ptr_addr, 0);
-        if (!arg_addr)
-            break;
-        if ((s = lock_user_string(arg_addr))) {
-            qemu_log("\"%s\",", s);
-            unlock_user(s, arg_addr, 0);
-        }
-    }
-
-    qemu_log("NULL})");
-}
-
 #ifdef TARGET_NR_ipc
 static void
 print_ipc(CPUArchState *cpu_env, const struct syscallname *name,
@@ -1969,6 +1937,45 @@ print_execv(CPUArchState *cpu_env, const struct syscallname *name,
 }
 #endif
 
+static void
+print_execve_argv(abi_long argv, int last)
+{
+    abi_ulong arg_ptr_addr;
+    char *s;
+
+    qemu_log("{");
+    for (arg_ptr_addr = argv; ; arg_ptr_addr += sizeof(abi_ulong)) {
+        abi_ulong *arg_ptr, arg_addr;
+
+        arg_ptr = lock_user(VERIFY_READ, arg_ptr_addr, sizeof(abi_ulong), 1);
+        if (!arg_ptr) {
+            return;
+        }
+        arg_addr = tswapal(*arg_ptr);
+        unlock_user(arg_ptr, arg_ptr_addr, 0);
+        if (!arg_addr) {
+            break;
+        }
+        s = lock_user_string(arg_addr);
+        if (s) {
+            qemu_log("\"%s\",", s);
+            unlock_user(s, arg_addr, 0);
+        }
+    }
+    qemu_log("NULL}%s", get_comma(last));
+}
+
+static void
+print_execve(CPUArchState *cpu_env, const struct syscallname *name,
+             abi_long arg1, abi_long arg2, abi_long arg3,
+             abi_long arg4, abi_long arg5, abi_long arg6)
+{
+    print_syscall_prologue(name);
+    print_string(arg1, 0);
+    print_execve_argv(arg2, 1);
+    print_syscall_epilogue(name);
+}
+
 #if defined(TARGET_NR_faccessat) || defined(TARGET_NR_faccessat2)
 static void
 print_faccessat(CPUArchState *cpu_env, const struct syscallname *name,
-- 
2.38.1


