Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F328487E94
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 22:53:28 +0100 (CET)
Received: from localhost ([::1]:48214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5xAt-0001Jc-Gs
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 16:53:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5wr5-0005D7-43
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 16:32:59 -0500
Received: from [2607:f8b0:4864:20::1030] (port=38628
 helo=mail-pj1-x1030.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5wr1-0007q7-4m
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 16:32:57 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 l10-20020a17090a384a00b001b22190e075so13206299pjf.3
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 13:32:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rBQkgkJ54f7z1vTww2xh0WVqmfrtV6PIdKV7fgqQBjk=;
 b=nIxLM0oBoY28xeOsqZFDrarRbr9NVx1nNic+uJ7XF1nfOYKwZpSyVofAaxjJXxZQsx
 hZKQX05I2xDFTe1vTAUTsYZTkqi+uYTp0Qzw+fthxP45C+z0V+d85ZoXhV7AWoPIUJuZ
 ujkAkJX3dNcSn973BXaze6F0uVHaX2l3/Cve56RJ4NpjPRNnPKnnixm3K/zXwnuIWpY0
 WXQQDFzBtoGJgraKvbMiHQDmqh5AreJ/pnUit0AgUJ6gz8hOJwkF/yZTLXVUwFx5cQv+
 MdddqgBz2C0CctLL7myGUBtyBqCErKuVQyJul0vtpJk2UEPqjXhzi2AoWE8d1rU01Jmy
 xCjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rBQkgkJ54f7z1vTww2xh0WVqmfrtV6PIdKV7fgqQBjk=;
 b=YLKU7O1I00riNfixz/GNTL1l7k98mB5Dq7++CTYXorKhS4YrGvsmnKwv28upJjfBDg
 NilEAcfKM3h6wufodFB0rnI3U1WGF4dILkR/XdBJMAb+No8T2kDXF97z7cjN5BjmWYmh
 4HXW8S1sNAAZ4jrHyC2kqyyY6dl+nJCFHf1dwvuwkXByxDke/aoFMByLa7hkOa6sgSJE
 egFpUiIDt1UjyQ56KuuK86JvjUA/dSlZAfNwdx1kZpUU38rr1sH1fNyvfLFUP0/OLQG7
 NRCjRf1kqpJzmWQaJ9TlfAeTEG9aD8mpJsBcoeCWUNvVhus2rRU7QgcW/aVJNGd3/WEc
 Tiqw==
X-Gm-Message-State: AOAM533mZ/rtbaePwVtrS7pZZt7LlGxrGECTgJDwT5d17YMN4Mjvsu2b
 zLtfzbmFNut2EfoPu2gb3pvIrUN3QPxFnQ==
X-Google-Smtp-Source: ABdhPJyA8zk1Qnoeq6I2jfH/RMC1hoqtVFbcUPeeb35XgpvtSg/itz9BTAObzwSkSn5cePVCJjQ9Dw==
X-Received: by 2002:a17:90b:4b90:: with SMTP id
 lr16mr17702458pjb.209.1641591172852; 
 Fri, 07 Jan 2022 13:32:52 -0800 (PST)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id y11sm6633030pfi.80.2022.01.07.13.32.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 13:32:52 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 14/24] linux-user/mips: Improve do_break
Date: Fri,  7 Jan 2022 13:32:33 -0800
Message-Id: <20220107213243.212806-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220107213243.212806-1-richard.henderson@linaro.org>
References: <20220107213243.212806-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1030
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: laurent@vivier.eu,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rename to do_tr_or_bp, as per the kernel function.
Add a 'trap' argument, akin to the kernel's si_code, but clearer.
The return value is always 0, so change the return value to void.
Use force_sig and force_sig_fault.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/mips/cpu_loop.c | 46 +++++++++++++++++++++-----------------
 1 file changed, 26 insertions(+), 20 deletions(-)

diff --git a/linux-user/mips/cpu_loop.c b/linux-user/mips/cpu_loop.c
index 32f9fc1c1c..4fa24cc074 100644
--- a/linux-user/mips/cpu_loop.c
+++ b/linux-user/mips/cpu_loop.c
@@ -40,29 +40,25 @@ enum {
     BRK_DIVZERO = 7
 };
 
-static int do_break(CPUMIPSState *env, target_siginfo_t *info,
-                    unsigned int code)
+static void do_tr_or_bp(CPUMIPSState *env, unsigned int code, bool trap)
 {
-    int ret = -1;
+    target_ulong pc = env->active_tc.PC;
 
     switch (code) {
     case BRK_OVERFLOW:
+        force_sig_fault(TARGET_SIGFPE, TARGET_FPE_INTOVF, pc);
+        break;
     case BRK_DIVZERO:
-        info->si_signo = TARGET_SIGFPE;
-        info->si_errno = 0;
-        info->si_code = (code == BRK_OVERFLOW) ? FPE_INTOVF : FPE_INTDIV;
-        queue_signal(env, info->si_signo, QEMU_SI_FAULT, &*info);
-        ret = 0;
+        force_sig_fault(TARGET_SIGFPE, TARGET_FPE_INTDIV, pc);
         break;
     default:
-        info->si_signo = TARGET_SIGTRAP;
-        info->si_errno = 0;
-        queue_signal(env, info->si_signo, QEMU_SI_FAULT, &*info);
-        ret = 0;
+        if (trap) {
+            force_sig(TARGET_SIGTRAP);
+        } else {
+            force_sig_fault(TARGET_SIGTRAP, TARGET_TRAP_BRKPT, pc);
+        }
         break;
     }
-
-    return ret;
 }
 
 void cpu_loop(CPUMIPSState *env)
@@ -205,6 +201,13 @@ done_syscall:
                 abi_ulong trap_instr;
                 unsigned int code;
 
+                /*
+                 * FIXME: It would be better to decode the trap number
+                 * during translate, and store it in error_code while
+                 * raising the exception.  We should not be re-reading
+                 * the opcode here.
+                 */
+
                 if (env->hflags & MIPS_HFLAG_M16) {
                     if (env->insn_flags & ASE_MICROMIPS) {
                         /* microMIPS mode */
@@ -257,9 +260,7 @@ done_syscall:
                     }
                 }
 
-                if (do_break(env, &info, code) != 0) {
-                    goto error;
-                }
+                do_tr_or_bp(env, code, false);
             }
             break;
         case EXCP_TRAP:
@@ -267,6 +268,13 @@ done_syscall:
                 abi_ulong trap_instr;
                 unsigned int code = 0;
 
+                /*
+                 * FIXME: It would be better to decode the trap number
+                 * during translate, and store it in error_code while
+                 * raising the exception.  We should not be re-reading
+                 * the opcode here.
+                 */
+
                 if (env->hflags & MIPS_HFLAG_M16) {
                     /* microMIPS mode */
                     abi_ulong instr[2];
@@ -293,9 +301,7 @@ done_syscall:
                     }
                 }
 
-                if (do_break(env, &info, code) != 0) {
-                    goto error;
-                }
+                do_tr_or_bp(env, code, true);
             }
             break;
         case EXCP_ATOMIC:
-- 
2.25.1


