Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94895390DD8
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 03:15:25 +0200 (CEST)
Received: from localhost ([::1]:33836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lli8q-0007lk-KO
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 21:15:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lli7F-0006kH-86
 for qemu-devel@nongnu.org; Tue, 25 May 2021 21:13:45 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:45612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lli7D-0000uu-AJ
 for qemu-devel@nongnu.org; Tue, 25 May 2021 21:13:44 -0400
Received: by mail-pl1-x634.google.com with SMTP id s4so15734459plg.12
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 18:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=G346ok4fjN8cGwGkoUKPoXbymqz1ku/CjLIiZAhvwH4=;
 b=i0o1l6ZqHv3GsWABfCgiPN3iMkM/hU2Ds4mLt57AJF/C41oXKBb40jBTUCnciALVVm
 2nTD/Q8aIBdjAorUFpIPekxLtP1QVO+SaXqhrKvErz9I5ta1IoD80TP+tBvV76zQSW9J
 75tLXOyi8OXAiZ37TF7ML1ZKf+8Kata4TgeaQcsc6WMz0sXls5kPt2xfTXoTuJ5pDCFA
 N9pQpj6dgaVq3jnaRoYPCocWxNPobz2Mlk/PHLAcvBeZB22We96c+p3V/jJ10FUskr6y
 Q/kQ25E0Wl2zUYL/S7P6ZBkuKz3nhwECnKudD9V3N7JX4mMnBbXzIx2dIoavqaE6FzDH
 aezg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=G346ok4fjN8cGwGkoUKPoXbymqz1ku/CjLIiZAhvwH4=;
 b=sYmDFegQOhG4lxKVTwu0o9s5SdITX6/vDda9pS7Ynjj+nMNqy6vy4bu4RI00hadizO
 6ulMYFzt/Ap1HEv6vG+ZFd6VVnKLTq27myGfeKYjDz8dzYppddmcqc6lr8sSZxpl3rqo
 URsyxLmTTfnOoKFIUN2GeowMnizTZPieM8F7rwvRDsvNSQP3HMPqC6eCDJ0yg/JQ7saz
 9qrfuZ9JnBfUIzQZSpnsFqze8OlrrK89L6Op8hCH02j3wTKaNqIagNEdjF5IuyRG5zKR
 3eMUg2upms9H8QoSOZf6s/Kr+L2dR16e0UIA8Zf/bzKdhaqlEjdt4H1M9GSJe79+IvhH
 QmGA==
X-Gm-Message-State: AOAM5331SKO9PSMgweZFfUF+9BzI1nuona2PSch0i005A6wAdVQzyuXw
 9ktd9rLz1+H1uBcfDaX/Npg5UeyHi2knAg==
X-Google-Smtp-Source: ABdhPJyaUCgxE/HlWb0ti8jN09lUDfKKxTkMSZy1Z/upjINo5cdIeCbPDJ7q6g3kVuOhvYz7khCX6g==
X-Received: by 2002:a17:90a:f593:: with SMTP id
 ct19mr33379416pjb.225.1621991621706; 
 Tue, 25 May 2021 18:13:41 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id p8sm14003105pfw.165.2021.05.25.18.13.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 18:13:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH] linux-user/sparc: Implement v8plus signals
Date: Tue, 25 May 2021 18:13:40 -0700
Message-Id: <20210526011340.440284-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: mark.cave-ayland@ilande.co.uk, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Sparc v8plus is a sparc64 running a 32-bit ABI.
The significant difference vs sparc32 is that all 64 bits of
the %g and %o registers, plus %xcc, are saved across interrupts,
context switches, and signals.

There's a special marker in the saved %psr value that's used to
indicate that %xcc and the high bits are present in the frame.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---

I have been unable to find an extant v8plus distribution with
which to test this beyond compilation.  Thus the RFC.  I know
debian used to have one, but they have moved to pure sparc64 now.

Thoughts?


r~

---
 target/sparc/cpu.h        |  2 -
 linux-user/sparc/signal.c | 96 ++++++++++++++++++++++++++++++++-------
 2 files changed, 80 insertions(+), 18 deletions(-)

diff --git a/target/sparc/cpu.h b/target/sparc/cpu.h
index ff8ae73002..d2c6e2e4ec 100644
--- a/target/sparc/cpu.h
+++ b/target/sparc/cpu.h
@@ -104,14 +104,12 @@ enum {
 #define PSR_CARRY_SHIFT 20
 #define PSR_CARRY (1 << PSR_CARRY_SHIFT)
 #define PSR_ICC   (PSR_NEG|PSR_ZERO|PSR_OVF|PSR_CARRY)
-#if !defined(TARGET_SPARC64)
 #define PSR_EF    (1<<12)
 #define PSR_PIL   0xf00
 #define PSR_S     (1<<7)
 #define PSR_PS    (1<<6)
 #define PSR_ET    (1<<5)
 #define PSR_CWP   0x1f
-#endif
 
 #define CC_SRC (env->cc_src)
 #define CC_SRC2 (env->cc_src2)
diff --git a/linux-user/sparc/signal.c b/linux-user/sparc/signal.c
index 0cc3db5570..d3d699545b 100644
--- a/linux-user/sparc/signal.c
+++ b/linux-user/sparc/signal.c
@@ -61,6 +61,13 @@ struct target_siginfo_fpu {
 #endif
 };
 
+struct target_siginfo_v8plus {
+#if defined(TARGET_SPARC64) && defined(TARGET_ABI32)
+    uint32_t u_regs_upper[16];
+    uint32_t asi;
+#endif
+};
+
 #ifdef TARGET_ARCH_HAS_SETUP_FRAME
 struct target_signal_frame {
     struct target_stackf ss;
@@ -69,7 +76,8 @@ struct target_signal_frame {
     abi_ulong fpu_save;
     uint32_t insns[2] QEMU_ALIGNED(8);
     abi_ulong extramask[TARGET_NSIG_WORDS - 1];
-    abi_ulong extra_size; /* Should be 0 */
+    abi_ulong extra_size; /* Should be sizeof(v8plus) */
+    struct target_siginfo_v8plus v8plus;
     abi_ulong rwin_save;
 };
 #endif
@@ -87,8 +95,9 @@ struct target_rt_signal_frame {
     abi_ulong fpu_save;
     uint32_t insns[2];
     target_stack_t stack;
-    abi_ulong extra_size; /* Should be 0 */
+    abi_ulong extra_size; /* Should be sizeof(v8plus) */
 #endif
+    struct target_siginfo_v8plus v8plus;
     abi_ulong rwin_save;
 };
 
@@ -121,7 +130,34 @@ static abi_ulong get_sigframe(struct target_sigaction *sa,
     return sp;
 }
 
-static void save_pt_regs(struct target_pt_regs *regs, CPUSPARCState *env)
+/* Fake PSR_IMPL | PSR_VER, meaning 64-bit cpu is present. */
+#define PSR_V8PLUS  0xff000000u
+/* If PSR_V8PLUS, this field contains %xcc. */
+#define PSR_XCC     0x000f0000u
+
+#if defined(TARGET_SPARC64) && defined(TARGET_ABI32)
+# define SAVE_REG(X, I)                                 \
+    do {                                                \
+        __put_user(X, &regs->u_regs[I]);                \
+        __put_user(X >> 32, &v8plus->u_regs_upper[I]);  \
+    } while (0)
+# define RESTORE_REG(X, I)                              \
+    do {                                                \
+        uint32_t l_, h_ = 0;                            \
+        __get_user(l_, &regs->u_regs[I]);               \
+        if ((psr & PSR_V8PLUS) == PSR_V8PLUS) {         \
+            __get_user(h_, &v8plus->u_regs_upper[I]);   \
+        }                                               \
+        X = deposit64(l_, 32, 32, h_);                  \
+    } while (0)
+#else
+# define SAVE_REG(X, I)     __put_user(X, &regs->u_regs[I])
+# define RESTORE_REG(X, I)  __get_user(X, &regs->u_regs[I])
+#endif
+
+static void save_pt_regs(struct target_pt_regs *regs,
+                         struct target_siginfo_v8plus *v8plus,
+                         CPUSPARCState *env)
 {
     int i;
 
@@ -130,7 +166,18 @@ static void save_pt_regs(struct target_pt_regs *regs, CPUSPARCState *env)
     /* TODO: magic should contain PT_REG_MAGIC + %tt. */
     __put_user(0, &regs->magic);
 #else
-    __put_user(cpu_get_psr(env), &regs->psr);
+    uint32_t psr;
+# ifdef TARGET_SPARC64
+    /* See linux/arch/sparc/include/uapi/asm/psrcompat.h, tstate_to_psr */
+    uint64_t tstate = sparc64_tstate(env);
+    psr = (tstate & 0x1f) /* TSTATE_CWP */
+        | ((tstate >> 12) & PSR_ICC)
+        | ((tstate >> 20) & PSR_XCC)
+        | PSR_S | PSR_V8PLUS;
+# else
+    psr = cpu_get_psr(env);
+# endif
+    __put_user(psr, &regs->psr);
 #endif
 
     __put_user(env->pc, &regs->pc);
@@ -138,14 +185,20 @@ static void save_pt_regs(struct target_pt_regs *regs, CPUSPARCState *env)
     __put_user(env->y, &regs->y);
 
     for (i = 0; i < 8; i++) {
-        __put_user(env->gregs[i], &regs->u_regs[i]);
+        SAVE_REG(env->gregs[i], i);
     }
     for (i = 0; i < 8; i++) {
-        __put_user(env->regwptr[WREG_O0 + i], &regs->u_regs[i + 8]);
+        SAVE_REG(env->regwptr[WREG_O0 + i], i + 8);
     }
+
+#if defined(TARGET_SPARC64) && defined(TARGET_ABI32)
+    __put_user(env->asi, &v8plus->asi);
+#endif
 }
 
-static void restore_pt_regs(struct target_pt_regs *regs, CPUSPARCState *env)
+static void restore_pt_regs(struct target_pt_regs *regs,
+                            struct target_siginfo_v8plus *v8plus,
+                            CPUSPARCState *env)
 {
     int i;
 
@@ -163,7 +216,15 @@ static void restore_pt_regs(struct target_pt_regs *regs, CPUSPARCState *env)
      */
     uint32_t psr;
     __get_user(psr, &regs->psr);
-    env->psr = (psr & PSR_ICC) | (env->psr & ~PSR_ICC);
+# ifdef TARGET_SPARC64
+    /* Unconditionally restore %icc and %xcc; conditionally restore %asi. */
+    cpu_put_ccr(env, ((psr & PSR_ICC) >> 20) | ((psr & PSR_XCC) >> 12));
+    if ((psr & PSR_V8PLUS) == PSR_V8PLUS) {
+        env->asi = v8plus->asi & 0xff;
+    }
+# else
+    cpu_put_psr(env, (psr & PSR_ICC) | (env->psr & ~PSR_ICC));
+# endif
 #endif
 
     /* Note that pc and npc are handled in the caller. */
@@ -171,13 +232,16 @@ static void restore_pt_regs(struct target_pt_regs *regs, CPUSPARCState *env)
     __get_user(env->y, &regs->y);
 
     for (i = 0; i < 8; i++) {
-        __get_user(env->gregs[i], &regs->u_regs[i]);
+        RESTORE_REG(env->gregs[i], i);
     }
     for (i = 0; i < 8; i++) {
-        __get_user(env->regwptr[WREG_O0 + i], &regs->u_regs[i + 8]);
+        RESTORE_REG(env->regwptr[WREG_O0 + i], i + 8);
     }
 }
 
+#undef SAVE_REG
+#undef RESTORE_REG
+
 static void save_reg_win(struct target_reg_window *win, CPUSPARCState *env)
 {
     int i;
@@ -259,8 +323,8 @@ void setup_frame(int sig, struct target_sigaction *ka,
     }
 
     /* 2. Save the current process state */
-    save_pt_regs(&sf->regs, env);
-    __put_user(0, &sf->extra_size);
+    save_pt_regs(&sf->regs, &sf->v8plus, env);
+    __put_user(sizeof(sf->v8plus), &sf->extra_size);
 
     save_fpu((struct target_siginfo_fpu *)(sf + 1), env);
     __put_user(sf_addr + sizeof(*sf), &sf->fpu_save);
@@ -321,7 +385,7 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
 
     /* 2. Save the current process state */
     save_reg_win(&sf->ss.win, env);
-    save_pt_regs(&sf->regs, env);
+    save_pt_regs(&sf->regs, &sf->v8plus, env);
 
     save_fpu((struct target_siginfo_fpu *)(sf + 1), env);
     __put_user(sf_addr + sizeof(*sf), &sf->fpu_save);
@@ -333,7 +397,7 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
     target_save_altstack(&sf->stack, env);
 
 #ifdef TARGET_ABI32
-    __put_user(0, &sf->extra_size);
+    __put_user(sizeof(sf->v8plus), &sf->extra_size);
 #endif
 
     /* 3. signal handler back-trampoline and parameters */
@@ -404,7 +468,7 @@ long do_sigreturn(CPUSPARCState *env)
     }
 
     /* 2. Restore the state */
-    restore_pt_regs(&sf->regs, env);
+    restore_pt_regs(&sf->regs, &sf->v8plus, env);
     env->pc = pc;
     env->npc = npc;
 
@@ -471,7 +535,7 @@ long do_rt_sigreturn(CPUSPARCState *env)
     }
 
     /* 2. Restore the state */
-    restore_pt_regs(&sf->regs, env);
+    restore_pt_regs(&sf->regs, &sf->v8plus, env);
 
     __get_user(ptr, &sf->fpu_save);
     if (ptr) {
-- 
2.25.1


