Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F18C47B4FC
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 22:18:14 +0100 (CET)
Received: from localhost ([::1]:34882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzQ2v-00011W-5B
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 16:18:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzPqr-0000X7-2U
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 16:05:45 -0500
Received: from [2607:f8b0:4864:20::531] (port=37679
 helo=mail-pg1-x531.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzPqp-0005uz-7E
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 16:05:44 -0500
Received: by mail-pg1-x531.google.com with SMTP id a23so10430930pgm.4
 for <qemu-devel@nongnu.org>; Mon, 20 Dec 2021 13:05:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JNhSgXJTgMGZWBsS+vqzx7SqW7s/rfAY63sPF+SkLf0=;
 b=b3IobSoulVxdx8q8motxIs1S/KgIVN7CoVFQXrsydHbsm7hq+yZ+WueIRNFY6Aqi5Y
 ZK5OHA4vAxedHMoEgv5ZqRrVu8G0z6Y7mlvOJJ+E5KrvA3NCXavmkyfRdFkgl0QJOOXU
 KkOH+MMjhHNG8P11WnL4degAzD6Y3Tp3sS8Uv9XtHtjCkrVmGWnR4idEvHeul+BvT+LS
 HhALkopZRrMnZqi7mJeaRplgG9Rr6/X7YkE9QJ+O13zJqKXll4mfpTitVQlHvKBdXVGb
 jIzBlgk1h7Zq0sQ25QXkBtk/PAG0l3zynXJftRfRYvE8fth9ov6Xbr32KuXwQc9GTgHF
 HFMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JNhSgXJTgMGZWBsS+vqzx7SqW7s/rfAY63sPF+SkLf0=;
 b=i3Oae6Z1BuapFaV6Pz90DptRLPaZz/AEUmvueJoqxC4YbkDJZzWfuS1HcgDEL7MBj8
 cbymsjfyiEERZtKoOSSlkF3fqJeTgmJJN1rxsruaTcLe60qS2Axtgvg9uFUVzmnGLYPE
 Q3e3y2sy+599vUm7kDo8ObcSyTLMkYX0Ctr1a2IFRsfCTapRA9Sd2rAMSKR/dPoiIqbE
 aKqSs/gkPP9PB6xFB679R1tYTXp8bSj6W7gFRyZGV6CtKmApn1zv0rVjdXYZo8HVHzGW
 nG6A5CouVmt405ExsEthoxwqwQXzVxvXKe1jysIXEswyw4tUxqTBfuPNOG9olxHblSra
 sgfA==
X-Gm-Message-State: AOAM531lMPIf5KDDCs/N2f4H4y2d6mP32kpFZBJxyG+nycDlV8pR7zUg
 lRletPGRxA80+KYXXAIdS9fJ7xn789ynsw==
X-Google-Smtp-Source: ABdhPJxhaUxOtx2cd37/1N6u1BNGsiP0oDc2tkNgU9rU4mE8HFzUSdcQMlmcxTTM0LOTaysU0LMrqw==
X-Received: by 2002:a05:6a00:ad0:b0:4a3:1056:e2ae with SMTP id
 c16-20020a056a000ad000b004a31056e2aemr18226957pfl.2.1640034341881; 
 Mon, 20 Dec 2021 13:05:41 -0800 (PST)
Received: from localhost.localdomain ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id d13sm20091021pfu.213.2021.12.20.13.05.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Dec 2021 13:05:41 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 14/24] linux-user/mips: Improve do_break
Date: Mon, 20 Dec 2021 13:05:18 -0800
Message-Id: <20211220210529.150423-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211220210529.150423-1-richard.henderson@linaro.org>
References: <20211220210529.150423-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::531
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
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
index b735c99a24..7317194cc3 100644
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


