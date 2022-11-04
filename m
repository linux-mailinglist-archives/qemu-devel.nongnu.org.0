Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE1C9619EE7
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 18:37:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1or0cp-0000PI-5g; Fri, 04 Nov 2022 13:37:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1or0cl-0000OB-Gd
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 13:36:59 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1or0cj-0003wR-PJ
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 13:36:59 -0400
Received: by mail-wr1-x42d.google.com with SMTP id y16so7998229wrt.12
 for <qemu-devel@nongnu.org>; Fri, 04 Nov 2022 10:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MdSw8mOeJR96KDNysclJBr9Hm/Bb8SVdgNCy0HQjHtE=;
 b=ApV3fvhO0z0wJA54VM3cu8/iVvL/y423jAd1iuaR34yju0bFv42k/rpkiN7huklYOw
 iTr8GRIvAJc4ho9bJ2AZdGKizqAMOQGzaOxDSvuDRKwqI/+rHHo6bQ2HYL7P8gIe4dlA
 QkHdIejjlx5CvwUHJ3MtL3nC21WmHbuB3f8CaAOBtZII4KVLnUqTxes7sK4HU0Rvx/GH
 oF9tUExgH0zFosksMHmkK/+1ZDneGH21GtEATfj7xaObpCfR4BO0Dr3sLQyzV0NqjsdH
 r2KDCH9TK8/JfUaeY3FoparuL3W6fYN9LYg6FsnSr6mfdb1SrGHfmWNW+XjmVocCdLKC
 HM7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MdSw8mOeJR96KDNysclJBr9Hm/Bb8SVdgNCy0HQjHtE=;
 b=fF3ti/2DWrqInHmcLtsnq9L8qzmIiAwC22TWoar05tsaezYBbQ31AZlyIumfkj36b5
 S9aWA2cERfCFQyrLDCIrEosN+X2c7SjjzpoReJFRV0QcQA5dyPPFUi55hYj2M4fg/Ax7
 uzM4aqWhKXYKD1cS2NAmYAkSuUDa2bvau6htA+N113FvFIlEl+dJh9X5e0/7XvEaO4dV
 v+SQas2QnjkliJu8XxTUGs+vffKWGDdrdC91tWQhlE0CB+9vGgMhnKefF4POB71S8gns
 SA5G4AlyGauApC3vykx1URCwar00Dx7HAtvFtrqFcEotDDCqX6yAZBsqJWKkxDyLnv1I
 bMsQ==
X-Gm-Message-State: ACrzQf3Cc3/0qVla08oV2NmdVHbvPUTePCgClbMy5R9x3rFytF59mc8S
 wIdv0klH3XaD8LzaabUL46sTIHy+16hLcw==
X-Google-Smtp-Source: AMsMyM6MEBk6HL1oI56aC/w7b2dnRSlalmi/+dyQGKDzXJ9cOeGli8P3/AMPFAcRtI+4CGRHa10p+A==
X-Received: by 2002:a5d:4e88:0:b0:236:590:f5a9 with SMTP id
 e8-20020a5d4e88000000b002360590f5a9mr21858218wru.126.1667583415810; 
 Fri, 04 Nov 2022 10:36:55 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 n1-20020a1c7201000000b003c6c5a5a651sm13610wmc.28.2022.11.04.10.36.54
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 04 Nov 2022 10:36:55 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, Helge Deller <deller@gmx.de>,
 Drew DeVault <sir@cmpwn.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v5 4/5] linux-user/syscall: Extract do_execve() from
 do_syscall1()
Date: Fri,  4 Nov 2022 18:36:31 +0100
Message-Id: <20221104173632.1052-5-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221104173632.1052-1-philmd@linaro.org>
References: <20221104173632.1052-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
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

execve() is a particular case of execveat(). In order
to add do_execveat(), first factor do_execve() out.

Signed-off-by: Drew DeVault <sir@cmpwn.com>
Message-Id: <20221104081015.706009-1-sir@cmpwn.com>
[PMD: Split of bigger patch, filled description, fixed style]
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 linux-user/syscall.c | 211 +++++++++++++++++++++++--------------------
 1 file changed, 114 insertions(+), 97 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 24b25759be..c3ac6bb4d2 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -8357,6 +8357,119 @@ static int do_openat(CPUArchState *cpu_env, int dirfd, const char *pathname, int
     return safe_openat(dirfd, path(pathname), flags, mode);
 }
 
+static int do_execve(CPUArchState *cpu_env,
+                       abi_long pathname, abi_long guest_argp,
+                       abi_long guest_envp)
+{
+    int ret;
+    char **argp, **envp;
+    int argc, envc;
+    abi_ulong gp;
+    abi_ulong addr;
+    char **q;
+    void *p;
+
+    argc = 0;
+
+    for (gp = guest_argp; gp; gp += sizeof(abi_ulong)) {
+        if (get_user_ual(addr, gp)) {
+            return -TARGET_EFAULT;
+        }
+        if (!addr) {
+            break;
+        }
+        argc++;
+    }
+    envc = 0;
+    for (gp = guest_envp; gp; gp += sizeof(abi_ulong)) {
+        if (get_user_ual(addr, gp)) {
+            return -TARGET_EFAULT;
+        }
+        if (!addr) {
+            break;
+        }
+        envc++;
+    }
+
+    argp = g_new0(char *, argc + 1);
+    envp = g_new0(char *, envc + 1);
+
+    for (gp = guest_argp, q = argp; gp; gp += sizeof(abi_ulong), q++) {
+        if (get_user_ual(addr, gp)) {
+            goto execve_efault;
+        }
+        if (!addr) {
+            break;
+        }
+        *q = lock_user_string(addr);
+        if (!*q) {
+            goto execve_efault;
+        }
+    }
+    *q = NULL;
+
+    for (gp = guest_envp, q = envp; gp; gp += sizeof(abi_ulong), q++) {
+        if (get_user_ual(addr, gp)) {
+            goto execve_efault;
+        }
+        if (!addr) {
+            break;
+        }
+        *q = lock_user_string(addr);
+        if (!*q) {
+            goto execve_efault;
+        }
+    }
+    *q = NULL;
+
+    /*
+     * Although execve() is not an interruptible syscall it is
+     * a special case where we must use the safe_syscall wrapper:
+     * if we allow a signal to happen before we make the host
+     * syscall then we will 'lose' it, because at the point of
+     * execve the process leaves QEMU's control. So we use the
+     * safe syscall wrapper to ensure that we either take the
+     * signal as a guest signal, or else it does not happen
+     * before the execve completes and makes it the other
+     * program's problem.
+     */
+    p = lock_user_string(pathname);
+    if (!p) {
+        goto execve_efault;
+    }
+
+    if (is_proc_myself(p, "exe")) {
+        ret = get_errno(safe_execve(exec_path, argp, envp));
+    } else {
+        ret = get_errno(safe_execve(p, argp, envp));
+    }
+
+    unlock_user(p, pathname, 0);
+
+    goto execve_end;
+
+execve_efault:
+    ret = -TARGET_EFAULT;
+
+execve_end:
+    for (gp = guest_argp, q = argp; *q; gp += sizeof(abi_ulong), q++) {
+        if (get_user_ual(addr, gp) || !addr) {
+            break;
+        }
+        unlock_user(*q, addr, 0);
+    }
+    for (gp = guest_envp, q = envp; *q; gp += sizeof(abi_ulong), q++) {
+        if (get_user_ual(addr, gp) || !addr) {
+            break;
+        }
+        unlock_user(*q, addr, 0);
+    }
+
+    g_free(argp);
+    g_free(envp);
+    return ret;
+}
+
 #define TIMER_MAGIC 0x0caf0000
 #define TIMER_MAGIC_MASK 0xffff0000
 
@@ -8867,103 +8980,7 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
         return ret;
 #endif
     case TARGET_NR_execve:
-        {
-            char **argp, **envp;
-            int argc, envc;
-            abi_ulong gp;
-            abi_ulong guest_argp;
-            abi_ulong guest_envp;
-            abi_ulong addr;
-            char **q;
-
-            argc = 0;
-            guest_argp = arg2;
-            for (gp = guest_argp; gp; gp += sizeof(abi_ulong)) {
-                if (get_user_ual(addr, gp))
-                    return -TARGET_EFAULT;
-                if (!addr)
-                    break;
-                argc++;
-            }
-            envc = 0;
-            guest_envp = arg3;
-            for (gp = guest_envp; gp; gp += sizeof(abi_ulong)) {
-                if (get_user_ual(addr, gp))
-                    return -TARGET_EFAULT;
-                if (!addr)
-                    break;
-                envc++;
-            }
-
-            argp = g_new0(char *, argc + 1);
-            envp = g_new0(char *, envc + 1);
-
-            for (gp = guest_argp, q = argp; gp;
-                  gp += sizeof(abi_ulong), q++) {
-                if (get_user_ual(addr, gp))
-                    goto execve_efault;
-                if (!addr)
-                    break;
-                if (!(*q = lock_user_string(addr)))
-                    goto execve_efault;
-            }
-            *q = NULL;
-
-            for (gp = guest_envp, q = envp; gp;
-                  gp += sizeof(abi_ulong), q++) {
-                if (get_user_ual(addr, gp))
-                    goto execve_efault;
-                if (!addr)
-                    break;
-                if (!(*q = lock_user_string(addr)))
-                    goto execve_efault;
-            }
-            *q = NULL;
-
-            if (!(p = lock_user_string(arg1)))
-                goto execve_efault;
-            /* Although execve() is not an interruptible syscall it is
-             * a special case where we must use the safe_syscall wrapper:
-             * if we allow a signal to happen before we make the host
-             * syscall then we will 'lose' it, because at the point of
-             * execve the process leaves QEMU's control. So we use the
-             * safe syscall wrapper to ensure that we either take the
-             * signal as a guest signal, or else it does not happen
-             * before the execve completes and makes it the other
-             * program's problem.
-             */
-            if (is_proc_myself(p, "exe")) {
-                ret = get_errno(safe_execve(exec_path, argp, envp));
-            } else {
-                ret = get_errno(safe_execve(p, argp, envp));
-            }
-            unlock_user(p, arg1, 0);
-
-            goto execve_end;
-
-        execve_efault:
-            ret = -TARGET_EFAULT;
-
-        execve_end:
-            for (gp = guest_argp, q = argp; *q;
-                  gp += sizeof(abi_ulong), q++) {
-                if (get_user_ual(addr, gp)
-                    || !addr)
-                    break;
-                unlock_user(*q, addr, 0);
-            }
-            for (gp = guest_envp, q = envp; *q;
-                  gp += sizeof(abi_ulong), q++) {
-                if (get_user_ual(addr, gp)
-                    || !addr)
-                    break;
-                unlock_user(*q, addr, 0);
-            }
-
-            g_free(argp);
-            g_free(envp);
-        }
-        return ret;
+        return do_execve(cpu_env, arg1, arg2, arg3);
     case TARGET_NR_chdir:
         if (!(p = lock_user_string(arg1)))
             return -TARGET_EFAULT;
-- 
2.38.1


