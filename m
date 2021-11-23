Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA4245AA30
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 18:41:10 +0100 (CET)
Received: from localhost ([::1]:36050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpZn4-0000Sm-1U
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 12:41:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mpZkI-0004GP-Dy
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 12:38:18 -0500
Received: from [2a00:1450:4864:20::434] (port=37594
 helo=mail-wr1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mpZkF-00050Q-Ko
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 12:38:18 -0500
Received: by mail-wr1-x434.google.com with SMTP id b12so40292883wrh.4
 for <qemu-devel@nongnu.org>; Tue, 23 Nov 2021 09:38:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CQBWb4vrOl0u0SYvunnH7Hx+p/iS9p5uKhN29onoZ/I=;
 b=DXY7e855yXhM/W4XRBBeyZrAXJohpkbx289Vc1ZDDN19HxyizHCB5LZzi2LUAVLau1
 jxxl7wJEVJWROpqNCxWcUnFVjtbU1rTk85oP7Sm9QoiFBm0XVxm1sr8ampCGXhMwqSQc
 mp5NGN+mUIF5FLTrsaqP33w2H9bDZbIefOV/9eKEm7aLk3MV3jvyDUqjpIqS11mk6pt5
 E/1q1BKb33T8Ky5phxA70nYBGO/HQxMsnlspVWshO1ijf3r0xP8Q1Zn3TvdJzOfKH0eD
 8XkO1O3ol9okzNk60PqWFZP5QWkT01/UHf5Z7zYqDRLd3Zi1exxNMII7ziaNEBo/jg5x
 V1QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CQBWb4vrOl0u0SYvunnH7Hx+p/iS9p5uKhN29onoZ/I=;
 b=zEE4ShUALQahgzsbKPBgodILoJhUqpo63l2zUZxXnIzLGYE5PuWNOJnQ5lz1DtGMRK
 XsblPRZmrGjqIZmjxQN9wKgfnSU5sBGM6fnc1vYIgBHQGCexS3mZg5kHLfgTyJgVCvXn
 lawC4RbEYmSg+s3cC9MwUTUDaT1GQioS+tpAvt4FMnLJWK+CWnP+lt4jbEK+OhVDQyPC
 oAjoxLQd70XpZHmR/JBMlNcTRmnU9RLmtnlS6VYG5fisECdlxsTp3sUhR6XaGnq/bYj6
 EkiKbDRB6oTqqEg/PZ1pXQnrdmGBL1G7KdyjTZz0whk/Rxowh9rd5HGmP1nm7Pai2tzv
 GMtw==
X-Gm-Message-State: AOAM533N2lVoKSn2Wz83kJyS/GKQkUVhYuZLCCdIm/hwuwthyTFSe0mS
 qSiMQ0lv0axtzJmIICoEIo8+CLBa+p7sNFmyEIU=
X-Google-Smtp-Source: ABdhPJylNh9OQN16Lz4XVTq9Jyj46Tsp3vOXK36MbUKGjnQTKsobiVzmLkjVS8EuyEgme2kolKbGiw==
X-Received: by 2002:a5d:47aa:: with SMTP id 10mr9825534wrb.50.1637689093954;
 Tue, 23 Nov 2021 09:38:13 -0800 (PST)
Received: from cloudburst.home (149.164.14.37.dynamic.jazztel.es.
 [37.14.164.149])
 by smtp.gmail.com with ESMTPSA id n13sm13054883wrt.44.2021.11.23.09.38.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 09:38:13 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 07/16] linux-user: Rename TARGET_ERESTARTSYS to
 QEMU_ERESTARTSYS
Date: Tue, 23 Nov 2021 18:37:50 +0100
Message-Id: <20211123173759.1383510-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211123173759.1383510-1-richard.henderson@linaro.org>
References: <20211123173759.1383510-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::434
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: laurent@vivier.eu, imp@bsdimp.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This value is fully internal to qemu, and so is not a TARGET define.
We use this as an extra marker for both host and target errno.

Reviewed-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/generic/target_errno_defs.h     |  2 +-
 linux-user/safe-syscall.h                  |  8 ++++----
 linux-user/signal-common.h                 |  2 +-
 linux-user/aarch64/cpu_loop.c              |  2 +-
 linux-user/alpha/cpu_loop.c                |  2 +-
 linux-user/arm/cpu_loop.c                  |  2 +-
 linux-user/cris/cpu_loop.c                 |  2 +-
 linux-user/hexagon/cpu_loop.c              |  2 +-
 linux-user/hppa/cpu_loop.c                 |  2 +-
 linux-user/i386/cpu_loop.c                 |  6 +++---
 linux-user/m68k/cpu_loop.c                 |  2 +-
 linux-user/microblaze/cpu_loop.c           |  2 +-
 linux-user/mips/cpu_loop.c                 |  2 +-
 linux-user/openrisc/cpu_loop.c             |  2 +-
 linux-user/ppc/cpu_loop.c                  |  2 +-
 linux-user/riscv/cpu_loop.c                |  2 +-
 linux-user/s390x/cpu_loop.c                |  2 +-
 linux-user/sh4/cpu_loop.c                  |  2 +-
 linux-user/signal.c                        |  6 +++---
 linux-user/sparc/cpu_loop.c                |  2 +-
 linux-user/syscall.c                       | 16 ++++++++--------
 linux-user/xtensa/cpu_loop.c               |  2 +-
 linux-user/host/aarch64/safe-syscall.inc.S |  3 +--
 linux-user/host/arm/safe-syscall.inc.S     |  2 +-
 linux-user/host/i386/safe-syscall.inc.S    |  2 +-
 linux-user/host/mips/safe-syscall.inc.S    |  2 +-
 linux-user/host/ppc64/safe-syscall.inc.S   |  2 +-
 linux-user/host/riscv/safe-syscall.inc.S   |  2 +-
 linux-user/host/s390x/safe-syscall.inc.S   |  2 +-
 linux-user/host/sparc64/safe-syscall.inc.S |  2 +-
 linux-user/host/x86_64/safe-syscall.inc.S  |  2 +-
 31 files changed, 45 insertions(+), 46 deletions(-)

diff --git a/linux-user/generic/target_errno_defs.h b/linux-user/generic/target_errno_defs.h
index 17d85e0b61..58a06a10d6 100644
--- a/linux-user/generic/target_errno_defs.h
+++ b/linux-user/generic/target_errno_defs.h
@@ -153,7 +153,7 @@
  * after handling any pending signals. They match with the ones the guest
  * kernel uses for the same purpose.
  */
-#define TARGET_ERESTARTSYS     512     /* Restart system call (if SA_RESTART) */
+#define QEMU_ERESTARTSYS     512     /* Restart system call (if SA_RESTART) */
 
 /* QEMU internal, not visible to the guest. This is returned by the
  * do_sigreturn() code after a successful sigreturn syscall, to indicate
diff --git a/linux-user/safe-syscall.h b/linux-user/safe-syscall.h
index f43267a8fc..61a04e2b5a 100644
--- a/linux-user/safe-syscall.h
+++ b/linux-user/safe-syscall.h
@@ -25,10 +25,10 @@
  *
  * Call a system call if guest signal not pending.
  * This has the same API as the libc syscall() function, except that it
- * may return -1 with errno == TARGET_ERESTARTSYS if a signal was pending.
+ * may return -1 with errno == QEMU_ERESTARTSYS if a signal was pending.
  *
  * Returns: the system call result, or -1 with an error code in errno
- * (Errnos are host errnos; we rely on TARGET_ERESTARTSYS not clashing
+ * (Errnos are host errnos; we rely on QEMU_ERESTARTSYS not clashing
  * with any of the host errno values.)
  */
 
@@ -81,7 +81,7 @@
  * which are only technically blocking (ie which we know in practice won't
  * stay in the host kernel indefinitely) it's OK to use libc if necessary.
  * You must be able to cope with backing out correctly if some safe_syscall
- * you make in the implementation returns either -TARGET_ERESTARTSYS or
+ * you make in the implementation returns either -QEMU_ERESTARTSYS or
  * EINTR though.)
  *
  * block_signals() cannot be used for interruptible syscalls.
@@ -94,7 +94,7 @@
  * handler checks the interrupted host PC against the addresse of that
  * known section. If the PC is before or at the address of the syscall
  * instruction then we change the PC to point at a "return
- * -TARGET_ERESTARTSYS" code path instead, and then exit the signal handler
+ * -QEMU_ERESTARTSYS" code path instead, and then exit the signal handler
  * (causing the safe_syscall() call to immediately return that value).
  * Then in the main.c loop if we see this magic return value we adjust
  * the guest PC to wind it back to before the system call, and invoke
diff --git a/linux-user/signal-common.h b/linux-user/signal-common.h
index 7457f8025c..b9f33bb44f 100644
--- a/linux-user/signal-common.h
+++ b/linux-user/signal-common.h
@@ -76,7 +76,7 @@ abi_long do_swapcontext(CPUArchState *env, abi_ulong uold_ctx,
  * Block all signals, and arrange that the signal mask is returned to
  * its correct value for the guest before we resume execution of guest code.
  * If this function returns non-zero, then the caller should immediately
- * return -TARGET_ERESTARTSYS to the main loop, which will take the pending
+ * return -QEMU_ERESTARTSYS to the main loop, which will take the pending
  * signal and restart execution of the syscall.
  * If block_signals() returns zero, then the caller can continue with
  * emulation of the system call knowing that no signals can be taken
diff --git a/linux-user/aarch64/cpu_loop.c b/linux-user/aarch64/cpu_loop.c
index 97e0728b67..775ba43913 100644
--- a/linux-user/aarch64/cpu_loop.c
+++ b/linux-user/aarch64/cpu_loop.c
@@ -99,7 +99,7 @@ void cpu_loop(CPUARMState *env)
                              env->xregs[4],
                              env->xregs[5],
                              0, 0);
-            if (ret == -TARGET_ERESTARTSYS) {
+            if (ret == -QEMU_ERESTARTSYS) {
                 env->pc -= 4;
             } else if (ret != -TARGET_QEMU_ESIGRETURN) {
                 env->xregs[0] = ret;
diff --git a/linux-user/alpha/cpu_loop.c b/linux-user/alpha/cpu_loop.c
index 4029849d5c..ce9b251ce3 100644
--- a/linux-user/alpha/cpu_loop.c
+++ b/linux-user/alpha/cpu_loop.c
@@ -98,7 +98,7 @@ void cpu_loop(CPUAlphaState *env)
                                     env->ir[IR_A2], env->ir[IR_A3],
                                     env->ir[IR_A4], env->ir[IR_A5],
                                     0, 0);
-                if (sysret == -TARGET_ERESTARTSYS) {
+                if (sysret == -QEMU_ERESTARTSYS) {
                     env->pc -= 4;
                     break;
                 }
diff --git a/linux-user/arm/cpu_loop.c b/linux-user/arm/cpu_loop.c
index 01cb6eb534..1fcf19750e 100644
--- a/linux-user/arm/cpu_loop.c
+++ b/linux-user/arm/cpu_loop.c
@@ -407,7 +407,7 @@ void cpu_loop(CPUARMState *env)
                                      env->regs[4],
                                      env->regs[5],
                                      0, 0);
-                    if (ret == -TARGET_ERESTARTSYS) {
+                    if (ret == -QEMU_ERESTARTSYS) {
                         env->regs[15] -= env->thumb ? 2 : 4;
                     } else if (ret != -TARGET_QEMU_ESIGRETURN) {
                         env->regs[0] = ret;
diff --git a/linux-user/cris/cpu_loop.c b/linux-user/cris/cpu_loop.c
index 0d5d268609..f3e5b13f89 100644
--- a/linux-user/cris/cpu_loop.c
+++ b/linux-user/cris/cpu_loop.c
@@ -50,7 +50,7 @@ void cpu_loop(CPUCRISState *env)
                              env->pregs[7], 
                              env->pregs[11],
                              0, 0);
-            if (ret == -TARGET_ERESTARTSYS) {
+            if (ret == -QEMU_ERESTARTSYS) {
                 env->pc -= 2;
             } else if (ret != -TARGET_QEMU_ESIGRETURN) {
                 env->regs[10] = ret;
diff --git a/linux-user/hexagon/cpu_loop.c b/linux-user/hexagon/cpu_loop.c
index 6b24cbaba9..1cacbf42f1 100644
--- a/linux-user/hexagon/cpu_loop.c
+++ b/linux-user/hexagon/cpu_loop.c
@@ -54,7 +54,7 @@ void cpu_loop(CPUHexagonState *env)
                              env->gpr[4],
                              env->gpr[5],
                              0, 0);
-            if (ret == -TARGET_ERESTARTSYS) {
+            if (ret == -QEMU_ERESTARTSYS) {
                 env->gpr[HEX_REG_PC] -= 4;
             } else if (ret != -TARGET_QEMU_ESIGRETURN) {
                 env->gpr[0] = ret;
diff --git a/linux-user/hppa/cpu_loop.c b/linux-user/hppa/cpu_loop.c
index 375576c8f0..5315224d12 100644
--- a/linux-user/hppa/cpu_loop.c
+++ b/linux-user/hppa/cpu_loop.c
@@ -133,7 +133,7 @@ void cpu_loop(CPUHPPAState *env)
                 env->iaoq_f = env->gr[31];
                 env->iaoq_b = env->gr[31] + 4;
                 break;
-            case -TARGET_ERESTARTSYS:
+            case -QEMU_ERESTARTSYS:
             case -TARGET_QEMU_ESIGRETURN:
                 break;
             }
diff --git a/linux-user/i386/cpu_loop.c b/linux-user/i386/cpu_loop.c
index f6a1cc632b..fbd9a353e5 100644
--- a/linux-user/i386/cpu_loop.c
+++ b/linux-user/i386/cpu_loop.c
@@ -180,7 +180,7 @@ static void emulate_vsyscall(CPUX86State *env)
     ret = do_syscall(env, syscall, env->regs[R_EDI], env->regs[R_ESI],
                      env->regs[R_EDX], env->regs[10], env->regs[8],
                      env->regs[9], 0, 0);
-    g_assert(ret != -TARGET_ERESTARTSYS);
+    g_assert(ret != -QEMU_ERESTARTSYS);
     g_assert(ret != -TARGET_QEMU_ESIGRETURN);
     if (ret == -TARGET_EFAULT) {
         goto sigsegv;
@@ -223,7 +223,7 @@ void cpu_loop(CPUX86State *env)
                              env->regs[R_EDI],
                              env->regs[R_EBP],
                              0, 0);
-            if (ret == -TARGET_ERESTARTSYS) {
+            if (ret == -QEMU_ERESTARTSYS) {
                 env->eip -= 2;
             } else if (ret != -TARGET_QEMU_ESIGRETURN) {
                 env->regs[R_EAX] = ret;
@@ -241,7 +241,7 @@ void cpu_loop(CPUX86State *env)
                              env->regs[8],
                              env->regs[9],
                              0, 0);
-            if (ret == -TARGET_ERESTARTSYS) {
+            if (ret == -QEMU_ERESTARTSYS) {
                 env->eip -= 2;
             } else if (ret != -TARGET_QEMU_ESIGRETURN) {
                 env->regs[R_EAX] = ret;
diff --git a/linux-user/m68k/cpu_loop.c b/linux-user/m68k/cpu_loop.c
index 790bd558c3..b03c21a3dc 100644
--- a/linux-user/m68k/cpu_loop.c
+++ b/linux-user/m68k/cpu_loop.c
@@ -80,7 +80,7 @@ void cpu_loop(CPUM68KState *env)
                                  env->dregs[5],
                                  env->aregs[0],
                                  0, 0);
-                if (ret == -TARGET_ERESTARTSYS) {
+                if (ret == -QEMU_ERESTARTSYS) {
                     env->pc -= 2;
                 } else if (ret != -TARGET_QEMU_ESIGRETURN) {
                     env->dregs[0] = ret;
diff --git a/linux-user/microblaze/cpu_loop.c b/linux-user/microblaze/cpu_loop.c
index a94467dd2d..6e368f986e 100644
--- a/linux-user/microblaze/cpu_loop.c
+++ b/linux-user/microblaze/cpu_loop.c
@@ -53,7 +53,7 @@ void cpu_loop(CPUMBState *env)
                              env->regs[9], 
                              env->regs[10],
                              0, 0);
-            if (ret == -TARGET_ERESTARTSYS) {
+            if (ret == -QEMU_ERESTARTSYS) {
                 /* Wind back to before the syscall. */
                 env->pc -= 4;
             } else if (ret != -TARGET_QEMU_ESIGRETURN) {
diff --git a/linux-user/mips/cpu_loop.c b/linux-user/mips/cpu_loop.c
index b735c99a24..64f308c6ad 100644
--- a/linux-user/mips/cpu_loop.c
+++ b/linux-user/mips/cpu_loop.c
@@ -141,7 +141,7 @@ done_syscall:
                              env->active_tc.gpr[8], env->active_tc.gpr[9],
                              env->active_tc.gpr[10], env->active_tc.gpr[11]);
 # endif /* O32 */
-            if (ret == -TARGET_ERESTARTSYS) {
+            if (ret == -QEMU_ERESTARTSYS) {
                 env->active_tc.PC -= 4;
                 break;
             }
diff --git a/linux-user/openrisc/cpu_loop.c b/linux-user/openrisc/cpu_loop.c
index 3cfdbbf037..3147ab2b62 100644
--- a/linux-user/openrisc/cpu_loop.c
+++ b/linux-user/openrisc/cpu_loop.c
@@ -48,7 +48,7 @@ void cpu_loop(CPUOpenRISCState *env)
                              cpu_get_gpr(env, 6),
                              cpu_get_gpr(env, 7),
                              cpu_get_gpr(env, 8), 0, 0);
-            if (ret == -TARGET_ERESTARTSYS) {
+            if (ret == -QEMU_ERESTARTSYS) {
                 env->pc -= 4;
             } else if (ret != -TARGET_QEMU_ESIGRETURN) {
                 cpu_set_gpr(env, 11, ret);
diff --git a/linux-user/ppc/cpu_loop.c b/linux-user/ppc/cpu_loop.c
index 483e669300..5348641e9e 100644
--- a/linux-user/ppc/cpu_loop.c
+++ b/linux-user/ppc/cpu_loop.c
@@ -428,7 +428,7 @@ void cpu_loop(CPUPPCState *env)
             ret = do_syscall(env, env->gpr[0], env->gpr[3], env->gpr[4],
                              env->gpr[5], env->gpr[6], env->gpr[7],
                              env->gpr[8], 0, 0);
-            if (ret == -TARGET_ERESTARTSYS) {
+            if (ret == -QEMU_ERESTARTSYS) {
                 env->nip -= 4;
                 break;
             }
diff --git a/linux-user/riscv/cpu_loop.c b/linux-user/riscv/cpu_loop.c
index b301dac802..20f8c48b1d 100644
--- a/linux-user/riscv/cpu_loop.c
+++ b/linux-user/riscv/cpu_loop.c
@@ -69,7 +69,7 @@ void cpu_loop(CPURISCVState *env)
                                  env->gpr[xA5],
                                  0, 0);
             }
-            if (ret == -TARGET_ERESTARTSYS) {
+            if (ret == -QEMU_ERESTARTSYS) {
                 env->pc -= 4;
             } else if (ret != -TARGET_QEMU_ESIGRETURN) {
                 env->gpr[xA0] = ret;
diff --git a/linux-user/s390x/cpu_loop.c b/linux-user/s390x/cpu_loop.c
index d089c8417e..043582ca7c 100644
--- a/linux-user/s390x/cpu_loop.c
+++ b/linux-user/s390x/cpu_loop.c
@@ -83,7 +83,7 @@ void cpu_loop(CPUS390XState *env)
             ret = do_syscall(env, n, env->regs[2], env->regs[3],
                              env->regs[4], env->regs[5],
                              env->regs[6], env->regs[7], 0, 0);
-            if (ret == -TARGET_ERESTARTSYS) {
+            if (ret == -QEMU_ERESTARTSYS) {
                 env->psw.addr -= env->int_svc_ilen;
             } else if (ret != -TARGET_QEMU_ESIGRETURN) {
                 env->regs[2] = ret;
diff --git a/linux-user/sh4/cpu_loop.c b/linux-user/sh4/cpu_loop.c
index ac9b01840c..6c4ebfa969 100644
--- a/linux-user/sh4/cpu_loop.c
+++ b/linux-user/sh4/cpu_loop.c
@@ -50,7 +50,7 @@ void cpu_loop(CPUSH4State *env)
                              env->gregs[0],
                              env->gregs[1],
                              0, 0);
-            if (ret == -TARGET_ERESTARTSYS) {
+            if (ret == -QEMU_ERESTARTSYS) {
                 env->pc -= 2;
             } else if (ret != -TARGET_QEMU_ESIGRETURN) {
                 env->gregs[0] = ret;
diff --git a/linux-user/signal.c b/linux-user/signal.c
index ca8f24b9ec..12b1705287 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -213,7 +213,7 @@ int block_signals(void)
 
 /* Wrapper for sigprocmask function
  * Emulates a sigprocmask in a safe way for the guest. Note that set and oldset
- * are host signal set, not guest ones. Returns -TARGET_ERESTARTSYS if
+ * are host signal set, not guest ones. Returns -QEMU_ERESTARTSYS if
  * a signal was already pending and the syscall must be restarted, or
  * 0 on success.
  * If set is NULL, this is guaranteed not to fail.
@@ -230,7 +230,7 @@ int do_sigprocmask(int how, const sigset_t *set, sigset_t *oldset)
         int i;
 
         if (block_signals()) {
-            return -TARGET_ERESTARTSYS;
+            return -QEMU_ERESTARTSYS;
         }
 
         switch (how) {
@@ -985,7 +985,7 @@ int do_sigaction(int sig, const struct target_sigaction *act,
     }
 
     if (block_signals()) {
-        return -TARGET_ERESTARTSYS;
+        return -QEMU_ERESTARTSYS;
     }
 
     k = &sigact_table[sig - 1];
diff --git a/linux-user/sparc/cpu_loop.c b/linux-user/sparc/cpu_loop.c
index 0ba65e431c..529337c5e0 100644
--- a/linux-user/sparc/cpu_loop.c
+++ b/linux-user/sparc/cpu_loop.c
@@ -181,7 +181,7 @@ void cpu_loop (CPUSPARCState *env)
                               env->regwptr[2], env->regwptr[3],
                               env->regwptr[4], env->regwptr[5],
                               0, 0);
-            if (ret == -TARGET_ERESTARTSYS || ret == -TARGET_QEMU_ESIGRETURN) {
+            if (ret == -QEMU_ERESTARTSYS || ret == -TARGET_QEMU_ESIGRETURN) {
                 break;
             }
             if ((abi_ulong)ret >= (abi_ulong)(-515)) {
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index f1cfcc8104..23fb45e0f1 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -547,7 +547,7 @@ static inline abi_long get_errno(abi_long ret)
 
 const char *target_strerror(int err)
 {
-    if (err == TARGET_ERESTARTSYS) {
+    if (err == QEMU_ERESTARTSYS) {
         return "To be restarted";
     }
     if (err == TARGET_QEMU_ESIGRETURN) {
@@ -6458,7 +6458,7 @@ static int do_fork(CPUArchState *env, unsigned int flags, abi_ulong newsp,
         }
 
         if (block_signals()) {
-            return -TARGET_ERESTARTSYS;
+            return -QEMU_ERESTARTSYS;
         }
 
         fork_start();
@@ -8328,7 +8328,7 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
            Do thread termination if we have more then one thread.  */
 
         if (block_signals()) {
-            return -TARGET_ERESTARTSYS;
+            return -QEMU_ERESTARTSYS;
         }
 
         pthread_mutex_lock(&clone_lock);
@@ -9317,7 +9317,7 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
 #endif
             ret = get_errno(safe_rt_sigsuspend(&ts->sigsuspend_mask,
                                                SIGSET_T_SIZE));
-            if (ret != -TARGET_ERESTARTSYS) {
+            if (ret != -QEMU_ERESTARTSYS) {
                 ts->in_sigsuspend = 1;
             }
         }
@@ -9336,7 +9336,7 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
             unlock_user(p, arg1, 0);
             ret = get_errno(safe_rt_sigsuspend(&ts->sigsuspend_mask,
                                                SIGSET_T_SIZE));
-            if (ret != -TARGET_ERESTARTSYS) {
+            if (ret != -QEMU_ERESTARTSYS) {
                 ts->in_sigsuspend = 1;
             }
         }
@@ -9452,13 +9452,13 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
 #ifdef TARGET_NR_sigreturn
     case TARGET_NR_sigreturn:
         if (block_signals()) {
-            return -TARGET_ERESTARTSYS;
+            return -QEMU_ERESTARTSYS;
         }
         return do_sigreturn(cpu_env);
 #endif
     case TARGET_NR_rt_sigreturn:
         if (block_signals()) {
-            return -TARGET_ERESTARTSYS;
+            return -QEMU_ERESTARTSYS;
         }
         return do_rt_sigreturn(cpu_env);
     case TARGET_NR_sethostname:
@@ -13145,7 +13145,7 @@ abi_long do_syscall(void *cpu_env, int num, abi_long arg1,
         static bool flag;
         flag = !flag;
         if (flag) {
-            return -TARGET_ERESTARTSYS;
+            return -QEMU_ERESTARTSYS;
         }
     }
 #endif
diff --git a/linux-user/xtensa/cpu_loop.c b/linux-user/xtensa/cpu_loop.c
index a83490ab35..29cc6f3830 100644
--- a/linux-user/xtensa/cpu_loop.c
+++ b/linux-user/xtensa/cpu_loop.c
@@ -184,7 +184,7 @@ void cpu_loop(CPUXtensaState *env)
                     env->regs[2] = ret;
                     break;
 
-                case -TARGET_ERESTARTSYS:
+                case -QEMU_ERESTARTSYS:
                     env->pc -= 3;
                     break;
 
diff --git a/linux-user/host/aarch64/safe-syscall.inc.S b/linux-user/host/aarch64/safe-syscall.inc.S
index 76a0a18a6c..87c9580faa 100644
--- a/linux-user/host/aarch64/safe-syscall.inc.S
+++ b/linux-user/host/aarch64/safe-syscall.inc.S
@@ -70,8 +70,7 @@ safe_syscall_end:
         b       safe_syscall_set_errno_tail
 
         /* code path when we didn't execute the syscall */
-2:      mov     w0, #TARGET_ERESTARTSYS
+2:      mov     w0, #QEMU_ERESTARTSYS
         b       safe_syscall_set_errno_tail
-
         .cfi_endproc
         .size   safe_syscall_base, .-safe_syscall_base
diff --git a/linux-user/host/arm/safe-syscall.inc.S b/linux-user/host/arm/safe-syscall.inc.S
index 618112c6bf..f1a6aabfd3 100644
--- a/linux-user/host/arm/safe-syscall.inc.S
+++ b/linux-user/host/arm/safe-syscall.inc.S
@@ -81,7 +81,7 @@ safe_syscall_end:
         pop     { r4, r5, r6, r7, r8, pc }
 
         /* code path when we didn't execute the syscall */
-2:      mov     r0, #TARGET_ERESTARTSYS
+2:      mov     r0, #QEMU_ERESTARTSYS
 
         /* code path setting errno */
 1:      pop     { r4, r5, r6, r7, r8, lr }
diff --git a/linux-user/host/i386/safe-syscall.inc.S b/linux-user/host/i386/safe-syscall.inc.S
index f5883234bb..1fb031d228 100644
--- a/linux-user/host/i386/safe-syscall.inc.S
+++ b/linux-user/host/i386/safe-syscall.inc.S
@@ -94,7 +94,7 @@ safe_syscall_end:
         jmp     1f
 
         /* code path when we didn't execute the syscall */
-2:      mov     $TARGET_ERESTARTSYS, %eax
+2:      mov     $QEMU_ERESTARTSYS, %eax
 
         /* code path setting errno */
 1:      pop     %ebx
diff --git a/linux-user/host/mips/safe-syscall.inc.S b/linux-user/host/mips/safe-syscall.inc.S
index c6dd726001..3252aff23d 100644
--- a/linux-user/host/mips/safe-syscall.inc.S
+++ b/linux-user/host/mips/safe-syscall.inc.S
@@ -102,7 +102,7 @@ safe_syscall_end:
         jr      ra
 
         /* code path when we didn't execute the syscall */
-2:      li      v0, TARGET_ERESTARTSYS
+2:      li      v0, QEMU_ERESTARTSYS
 
         /* code path setting errno */
         /*
diff --git a/linux-user/host/ppc64/safe-syscall.inc.S b/linux-user/host/ppc64/safe-syscall.inc.S
index b370889480..36230169f4 100644
--- a/linux-user/host/ppc64/safe-syscall.inc.S
+++ b/linux-user/host/ppc64/safe-syscall.inc.S
@@ -74,7 +74,7 @@ safe_syscall_end:
         blr
 
         /* code path when we didn't execute the syscall */
-2:      addi    3, 0, TARGET_ERESTARTSYS
+2:      addi    3, 0, QEMU_ERESTARTSYS
 
         /* code path setting errno */
 1:      b       safe_syscall_set_errno_tail
diff --git a/linux-user/host/riscv/safe-syscall.inc.S b/linux-user/host/riscv/safe-syscall.inc.S
index 54c2e23f75..ca456d8a46 100644
--- a/linux-user/host/riscv/safe-syscall.inc.S
+++ b/linux-user/host/riscv/safe-syscall.inc.S
@@ -72,7 +72,7 @@ safe_syscall_end:
         j       safe_syscall_set_errno_tail
 
         /* code path when we didn't execute the syscall */
-2:      li      a0, TARGET_ERESTARTSYS
+2:      li      a0, QEMU_ERESTARTSYS
         j       safe_syscall_set_errno_tail
 
         .cfi_endproc
diff --git a/linux-user/host/s390x/safe-syscall.inc.S b/linux-user/host/s390x/safe-syscall.inc.S
index 899dab39e9..66f84385a2 100644
--- a/linux-user/host/s390x/safe-syscall.inc.S
+++ b/linux-user/host/s390x/safe-syscall.inc.S
@@ -91,7 +91,7 @@ safe_syscall_end:
 2:      lg      %r15,0(%r15)            /* load back chain */
         .cfi_adjust_cfa_offset -160
         lmg     %r6,%r15,48(%r15)       /* load saved registers */
-        lghi    %r2, TARGET_ERESTARTSYS
+        lghi    %r2, QEMU_ERESTARTSYS
         jg      safe_syscall_set_errno_tail
 
         .cfi_endproc
diff --git a/linux-user/host/sparc64/safe-syscall.inc.S b/linux-user/host/sparc64/safe-syscall.inc.S
index bb35c64cfc..3a0e76fcc7 100644
--- a/linux-user/host/sparc64/safe-syscall.inc.S
+++ b/linux-user/host/sparc64/safe-syscall.inc.S
@@ -78,7 +78,7 @@ safe_syscall_end:
          nop
 
         /* code path when we didn't execute the syscall */
-2:      set     TARGET_ERESTARTSYS, %o0
+2:      set     QEMU_ERESTARTSYS, %o0
 
         /* code path setting errno */
 1:      mov     %o7, %g1
diff --git a/linux-user/host/x86_64/safe-syscall.inc.S b/linux-user/host/x86_64/safe-syscall.inc.S
index 39b64250c3..f88cbe1347 100644
--- a/linux-user/host/x86_64/safe-syscall.inc.S
+++ b/linux-user/host/x86_64/safe-syscall.inc.S
@@ -82,7 +82,7 @@ safe_syscall_end:
         jmp     1f
 
         /* code path when we didn't execute the syscall */
-2:      mov     $TARGET_ERESTARTSYS, %eax
+2:      mov     $QEMU_ERESTARTSYS, %eax
 
         /* code path setting errno */
 1:      pop     %rbp
-- 
2.25.1


