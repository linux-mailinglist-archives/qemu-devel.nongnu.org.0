Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 659FB36AAEF
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 05:03:19 +0200 (CEST)
Received: from localhost ([::1]:47944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1larWo-0001Jr-9k
	for lists+qemu-devel@lfdr.de; Sun, 25 Apr 2021 23:03:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1larNo-00084p-BH
 for qemu-devel@nongnu.org; Sun, 25 Apr 2021 22:54:00 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:39430)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1larNe-0007aW-0E
 for qemu-devel@nongnu.org; Sun, 25 Apr 2021 22:54:00 -0400
Received: by mail-pl1-x62d.google.com with SMTP id u7so26326750plr.6
 for <qemu-devel@nongnu.org>; Sun, 25 Apr 2021 19:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=etz9UFR07Z7S/muZ/6WRfi9HnX0DFJP9uctiLlVucJE=;
 b=nOa9/0rK3zMZXfkgZ6+UlsAvUdRoE3BcloymSl/LeDhUyF9+nT1dPrFL3m94+QAAZo
 t1LG4NV0oaPi1pHfqjKQ81Lo4ihzFpwon/mTeF24mmI+AYJnOFDxf2YljPJ9cAGKTYZx
 NJv6aoEHFB9FCrrQ31/bAsT9b0/SRZwp/tz0w8zoQVyw0iYE/2jnT0a/1jxRUKy1dtUV
 UaZR+ctUyYgRsk8o8YKGazFB9QRJmZiggqiALoVxtEoFoex4EauLEpPyMA26egpkFEku
 JafRv13+tdx7LZgaYvx2m0w3yIlUHkjlrS+xCKnMkHEi1AmJWkxEDjUwVV+HwkDAeJUj
 Agwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=etz9UFR07Z7S/muZ/6WRfi9HnX0DFJP9uctiLlVucJE=;
 b=n5NLdPCDooqDVAQJHWPGIt6pQOKTlaWgpNmU3XDpTZaTqm/duukwL7289F9ioyAZYV
 EQsbV6doYkdZUAWtkzl3iz6kbOnSSpR6ObX/9LLa4iVBukO261IlESA4fZM/V2ono7ya
 pmFmpke9pGsfNwdXZGjJ0qVk7Ls4qZsx/EVkHFosklxFk9nWAhunxSdgl7eNcm+SocwM
 moCtJrPVCiw8bh6xR8YiMVkg+nN8hAy7/2noDVeoL/Gecr/92iCzPNovPP865zpbQ5xZ
 pZ6R6ouno6i9ucbz59IuVV30Jn9a/lBbGnnVHQCf6lB2yTCpTDa31rYg4175o6Mn5Zhh
 Z/Aw==
X-Gm-Message-State: AOAM531jCUy8IbYovRDS/Lnce6iwtD3Q8/3YG8xlQ1Jku6AQvfwZqZCh
 uWwKUSx8AF90W4VkenuUowICCx28QqBXbA==
X-Google-Smtp-Source: ABdhPJwH+W+hdBqroHGTDWa1DZX1KPxbmW3Al2AqF2xVsZTqKTOCB4tOF0ufLk2oQViKQAXIaw6LOA==
X-Received: by 2002:a17:90a:e28f:: with SMTP id
 d15mr19808432pjz.113.1619405626130; 
 Sun, 25 Apr 2021 19:53:46 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id e23sm9805680pgg.76.2021.04.25.19.53.45
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Apr 2021 19:53:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 15/25] linux-user/sparc: Use target_pt_regs
Date: Sun, 25 Apr 2021 19:53:24 -0700
Message-Id: <20210426025334.1168495-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210426025334.1168495-1-richard.henderson@linaro.org>
References: <20210426025334.1168495-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replace __siginfo_t with target_pt_regs, and move si_mask
into target_signal_frame directly.

Extract save/restore functions for target_pt_regs.  Adjust
for sparc64 tstate.  Use proper get/put functions for psr.
Turns out we were already writing to si_mask twice, so no
need to handle that in the new functions.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/sparc/signal.c | 121 ++++++++++++++++++++------------------
 1 file changed, 64 insertions(+), 57 deletions(-)

diff --git a/linux-user/sparc/signal.c b/linux-user/sparc/signal.c
index 3474098641..0d9305818f 100644
--- a/linux-user/sparc/signal.c
+++ b/linux-user/sparc/signal.c
@@ -43,17 +43,6 @@ struct target_stackf {
     abi_ulong xargs[8];
 };
 
-typedef struct {
-    struct {
-        abi_ulong psr;
-        abi_ulong pc;
-        abi_ulong npc;
-        abi_ulong y;
-        abi_ulong u_regs[16]; /* globals and ins */
-    }               si_regs;
-    int             si_mask;
-} __siginfo_t;
-
 typedef struct {
     abi_ulong  si_float_regs[32];
     unsigned   long si_fsr;
@@ -67,7 +56,8 @@ typedef struct {
 
 struct target_signal_frame {
     struct target_stackf ss;
-    __siginfo_t         info;
+    struct target_pt_regs regs;
+    uint32_t            si_mask;
     abi_ulong           fpu_save;
     uint32_t            insns[2] QEMU_ALIGNED(8);
     abi_ulong           extramask[TARGET_NSIG_WORDS - 1];
@@ -103,23 +93,61 @@ static inline abi_ulong get_sigframe(struct target_sigaction *sa,
     return sp;
 }
 
-static int
-setup___siginfo(__siginfo_t *si, CPUSPARCState *env, abi_ulong mask)
+static void save_pt_regs(struct target_pt_regs *regs, CPUSPARCState *env)
 {
-    int err = 0, i;
+    int i;
 
-    __put_user(env->psr, &si->si_regs.psr);
-    __put_user(env->pc, &si->si_regs.pc);
-    __put_user(env->npc, &si->si_regs.npc);
-    __put_user(env->y, &si->si_regs.y);
-    for (i=0; i < 8; i++) {
-        __put_user(env->gregs[i], &si->si_regs.u_regs[i]);
+#if defined(TARGET_SPARC64) && !defined(TARGET_ABI32)
+    __put_user(sparc64_tstate(env), &regs->tstate);
+    /* TODO: magic should contain PT_REG_MAGIC + %tt. */
+    __put_user(0, &regs->magic);
+#else
+    __put_user(cpu_get_psr(env), &regs->psr);
+#endif
+
+    __put_user(env->pc, &regs->pc);
+    __put_user(env->npc, &regs->npc);
+    __put_user(env->y, &regs->y);
+
+    for (i = 0; i < 8; i++) {
+        __put_user(env->gregs[i], &regs->u_regs[i]);
     }
-    for (i=0; i < 8; i++) {
-        __put_user(env->regwptr[WREG_O0 + i], &si->si_regs.u_regs[i + 8]);
+    for (i = 0; i < 8; i++) {
+        __put_user(env->regwptr[WREG_O0 + i], &regs->u_regs[i + 8]);
+    }
+}
+
+static void restore_pt_regs(struct target_pt_regs *regs, CPUSPARCState *env)
+{
+    int i;
+
+#if defined(TARGET_SPARC64) && !defined(TARGET_ABI32)
+    /* User can only change condition codes and %asi in %tstate. */
+    uint64_t tstate;
+    __get_user(tstate, &regs->tstate);
+    cpu_put_ccr(env, tstate >> 32);
+    env->asi = extract64(tstate, 24, 8);
+#else
+    /*
+     * User can only change condition codes and FPU enabling in %psr.
+     * But don't bother with FPU enabling, since a real kernel would
+     * just re-enable the FPU upon the next fpu trap.
+     */
+    uint32_t psr;
+    __get_user(psr, &regs->psr);
+    env->psr = (psr & PSR_ICC) | (env->psr & ~PSR_ICC);
+#endif
+
+    /* Note that pc and npc are handled in the caller. */
+
+    __get_user(env->y, &regs->y);
+
+    for (i = 0; i < 8; i++) {
+        __get_user(env->gregs[i], &regs->u_regs[i]);
+    }
+    for (i = 0; i < 8; i++) {
+        __get_user(env->regwptr[WREG_O0 + i], &regs->u_regs[i + 8]);
     }
-    __put_user(mask, &si->si_mask);
-    return err;
 }
 
 #define NF_ALIGNEDSZ  (((sizeof(struct target_signal_frame) + 7) & (~7)))
@@ -129,7 +157,7 @@ void setup_frame(int sig, struct target_sigaction *ka,
 {
     abi_ulong sf_addr;
     struct target_signal_frame *sf;
-    int sigframe_size, err, i;
+    int sigframe_size, i;
 
     /* 1. Make sure everything is clean */
     //synchronize_user_stack();
@@ -143,18 +171,14 @@ void setup_frame(int sig, struct target_sigaction *ka,
     if (!sf) {
         goto sigsegv;
     }
-#if 0
-    if (invalid_frame_pointer(sf, sigframe_size))
-        goto sigill_and_return;
-#endif
     /* 2. Save the current process state */
-    err = setup___siginfo(&sf->info, env, set->sig[0]);
+    save_pt_regs(&sf->regs, env);
     __put_user(0, &sf->extra_size);
 
     //save_fpu_state(regs, &sf->fpu_state);
     //__put_user(&sf->fpu_state, &sf->fpu_save);
 
-    __put_user(set->sig[0], &sf->info.si_mask);
+    __put_user(set->sig[0], &sf->si_mask);
     for (i = 0; i < TARGET_NSIG_WORDS - 1; i++) {
         __put_user(set->sig[i + 1], &sf->extramask[i]);
     }
@@ -165,16 +189,14 @@ void setup_frame(int sig, struct target_sigaction *ka,
     for (i = 0; i < 8; i++) {
         __put_user(env->regwptr[i + WREG_I0], &sf->ss.win.ins[i]);
     }
-    if (err)
-        goto sigsegv;
 
     /* 3. signal handler back-trampoline and parameters */
     env->regwptr[WREG_SP] = sf_addr;
     env->regwptr[WREG_O0] = sig;
     env->regwptr[WREG_O1] = sf_addr +
-            offsetof(struct target_signal_frame, info);
+            offsetof(struct target_signal_frame, regs);
     env->regwptr[WREG_O2] = sf_addr +
-            offsetof(struct target_signal_frame, info);
+            offsetof(struct target_signal_frame, regs);
 
     /* 4. signal handler */
     env->pc = ka->_sa_handler;
@@ -218,7 +240,7 @@ long do_sigreturn(CPUSPARCState *env)
 {
     abi_ulong sf_addr;
     struct target_signal_frame *sf;
-    abi_ulong up_psr, pc, npc;
+    abi_ulong pc, npc;
     target_sigset_t set;
     sigset_t host_set;
     int i;
@@ -234,29 +256,17 @@ long do_sigreturn(CPUSPARCState *env)
     if (sf_addr & 3)
         goto segv_and_exit;
 
-    __get_user(pc,  &sf->info.si_regs.pc);
-    __get_user(npc, &sf->info.si_regs.npc);
+    __get_user(pc,  &sf->regs.pc);
+    __get_user(npc, &sf->regs.npc);
 
     if ((pc | npc) & 3) {
         goto segv_and_exit;
     }
 
     /* 2. Restore the state */
-    __get_user(up_psr, &sf->info.si_regs.psr);
-
-    /* User can only change condition codes and FPU enabling in %psr. */
-    env->psr = (up_psr & (PSR_ICC /* | PSR_EF */))
-            | (env->psr & ~(PSR_ICC /* | PSR_EF */));
-
+    restore_pt_regs(&sf->regs, env);
     env->pc = pc;
     env->npc = npc;
-    __get_user(env->y, &sf->info.si_regs.y);
-    for (i=0; i < 8; i++) {
-        __get_user(env->gregs[i], &sf->info.si_regs.u_regs[i]);
-    }
-    for (i=0; i < 8; i++) {
-        __get_user(env->regwptr[i + WREG_O0], &sf->info.si_regs.u_regs[i + 8]);
-    }
 
     /* FIXME: implement FPU save/restore:
      * __get_user(fpu_save, &sf->fpu_save);
@@ -267,11 +277,8 @@ long do_sigreturn(CPUSPARCState *env)
      * }
      */
 
-    /* This is pretty much atomic, no amount locking would prevent
-         * the races which exist anyways.
-         */
-    __get_user(set.sig[0], &sf->info.si_mask);
-    for(i = 1; i < TARGET_NSIG_WORDS; i++) {
+    __get_user(set.sig[0], &sf->si_mask);
+    for (i = 1; i < TARGET_NSIG_WORDS; i++) {
         __get_user(set.sig[i], &sf->extramask[i - 1]);
     }
 
-- 
2.25.1


