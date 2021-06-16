Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D54923A8E25
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 03:15:58 +0200 (CEST)
Received: from localhost ([::1]:39674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltK9t-0001BZ-Uy
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 21:15:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltK6O-0005J9-C1
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 21:12:20 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:50693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltK6J-0008MB-1I
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 21:12:20 -0400
Received: by mail-pj1-x102e.google.com with SMTP id g4so749949pjk.0
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 18:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8Y7lnR+2rZo6JZgZkMGROv3kdJ+G1tzBBjEC9+c66tY=;
 b=WJ04eVRgJbe6eHsz+zN8rb7NX4EueSbMvAB0XRmNm6CtVyWf4HbEhSoyR7wUk1+bgJ
 QJSUqSwFR0x+bO34knLs/pUeM/3Z3mspgY6QHpie6m1OivwKTBPdCZSgohd0ERUZWNM0
 1cW7UZdzHyvstc4+5nzo6ERhGdpDVgwnOyL3vHFTnZZAduK6wvWpXAaaDqLq0GL+m3AU
 UPoP37wfkO3pYQwrk+xinxGX07DYfPYHp7t+lJAQo97ISilUMW7l0Kk/Dfs+GA3tkRK7
 mts6ZXREhRg6NtgvR6hbbeocUtlKiAL9pplTGlJBCD/Aj/1DKr9vwbb+yPus1rWkGkq+
 BwVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8Y7lnR+2rZo6JZgZkMGROv3kdJ+G1tzBBjEC9+c66tY=;
 b=J+Nx7iiKVTVaD5hxDoz1U4VCSxQAZyDha3o8AgNdJh+upUxD8n5yMXQkcl/PDOBV+S
 UAFuaM4Gno7aTdBonFwyAcUs2hL5//p9BpqtOUgGO+bwJGuG4y2j1FMbh35tFvwRZd76
 5YZoAAbF9shbZkKcBDbqNNgbarD6F8kcIzfDrFMVOTvpaShCa0QuBUZtXX1Ho4y6gWSb
 8YyWEBDI42+bJMHTR1E1Ut4QXGLrwWYgojElNTbeXP+il3chpV3rMjygOHrgct+BizU7
 7kwy/fy+mhPug+ArK+yqyVG1qYVWIVQEXuUrN/0lY+48zSX14icRmkIITOq+7/NfEAcu
 ytKA==
X-Gm-Message-State: AOAM532Z7wDZGu4FMpRcgQX86vOOFdToiA9Tt1vv/PoEpS1E6z6JT5gp
 ZMEyM/GTBVxQNIUUhwYPuNUltH0JHP8iwA==
X-Google-Smtp-Source: ABdhPJzBXxLUW7JbtJi3Q7frKOXgbrXIn0SDJLaiQebBZ3vDt8YYN/0CVsn6Nu9WEv5GSx1hpqg9xg==
X-Received: by 2002:a17:902:a981:b029:116:a139:6054 with SMTP id
 bh1-20020a170902a981b0290116a1396054mr6498117plb.60.1623805933175; 
 Tue, 15 Jun 2021 18:12:13 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id y18sm305297pgk.53.2021.06.15.18.12.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 18:12:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 04/21] linux-user/arm: Implement setup_sigtramp
Date: Tue, 15 Jun 2021 18:11:52 -0700
Message-Id: <20210616011209.1446045-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210616011209.1446045-1-richard.henderson@linaro.org>
References: <20210616011209.1446045-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
Cc: qemu-arm@nongnu.org, alex.bennee@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ARM is more complicated than the others, in that we also
have trampolines for using SA_RESTORER with FDPIC, and
we need to create trampolines for both ARM and Thumb modes.

Cc: qemu-arm@nongnu.org
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/arm/target_signal.h |   2 +
 linux-user/arm/signal.c        | 170 +++++++++++++++++++--------------
 2 files changed, 100 insertions(+), 72 deletions(-)

diff --git a/linux-user/arm/target_signal.h b/linux-user/arm/target_signal.h
index 0998dd6dfa..1e7fb0cecb 100644
--- a/linux-user/arm/target_signal.h
+++ b/linux-user/arm/target_signal.h
@@ -22,4 +22,6 @@ typedef struct target_sigaltstack {
 #include "../generic/signal.h"
 
 #define TARGET_ARCH_HAS_SETUP_FRAME
+#define TARGET_ARCH_HAS_SIGTRAMP_PAGE 1
+
 #endif /* ARM_TARGET_SIGNAL_H */
diff --git a/linux-user/arm/signal.c b/linux-user/arm/signal.c
index 2d30345fc2..b7c3c80c75 100644
--- a/linux-user/arm/signal.c
+++ b/linux-user/arm/signal.c
@@ -101,13 +101,12 @@ struct sigframe_v1
 {
     struct target_sigcontext sc;
     abi_ulong extramask[TARGET_NSIG_WORDS-1];
-    abi_ulong retcode[4];
 };
 
 struct sigframe_v2
 {
     struct target_ucontext_v2 uc;
-    abi_ulong retcode[4];
+    abi_ulong fdpic_ret;
 };
 
 struct rt_sigframe_v1
@@ -116,49 +115,20 @@ struct rt_sigframe_v1
     abi_ulong puc;
     struct target_siginfo info;
     struct target_ucontext_v1 uc;
-    abi_ulong retcode[4];
 };
 
 struct rt_sigframe_v2
 {
     struct target_siginfo info;
     struct target_ucontext_v2 uc;
-    abi_ulong retcode[4];
+    abi_ulong fdpic_ret;
 };
 
 /*
- * For ARM syscalls, we encode the syscall number into the instruction.
+ * Stubs needed to make sure the FD register (r9) contains the right value.
+ * There are 4 of them, each consuming 8 bytes.
  */
-#define SWI_SYS_SIGRETURN       (0xef000000|(TARGET_NR_sigreturn + ARM_SYSCALL_BASE))
-#define SWI_SYS_RT_SIGRETURN    (0xef000000|(TARGET_NR_rt_sigreturn + ARM_SYSCALL_BASE))
-
-/*
- * For Thumb syscalls, we pass the syscall number via r7.  We therefore
- * need two 16-bit instructions.
- */
-#define SWI_THUMB_SIGRETURN     (0xdf00 << 16 | 0x2700 | (TARGET_NR_sigreturn))
-#define SWI_THUMB_RT_SIGRETURN  (0xdf00 << 16 | 0x2700 | (TARGET_NR_rt_sigreturn))
-
-static const abi_ulong retcodes[4] = {
-        SWI_SYS_SIGRETURN,      SWI_THUMB_SIGRETURN,
-        SWI_SYS_RT_SIGRETURN,   SWI_THUMB_RT_SIGRETURN
-};
-
-/*
- * Stub needed to make sure the FD register (r9) contains the right
- * value.
- */
-static const unsigned long sigreturn_fdpic_codes[3] = {
-    0xe59fc004, /* ldr r12, [pc, #4] to read function descriptor */
-    0xe59c9004, /* ldr r9, [r12, #4] to setup GOT */
-    0xe59cf000  /* ldr pc, [r12] to jump into restorer */
-};
-
-static const unsigned long sigreturn_fdpic_thumb_codes[3] = {
-    0xc008f8df, /* ldr r12, [pc, #8] to read function descriptor */
-    0x9004f8dc, /* ldr r9, [r12, #4] to setup GOT */
-    0xf000f8dc  /* ldr pc, [r12] to jump into restorer */
-};
+static abi_ulong sigreturn_fdpic_tramp;
 
 static inline int valid_user_regs(CPUARMState *regs)
 {
@@ -219,13 +189,12 @@ get_sigframe(struct target_sigaction *ka, CPUARMState *regs, int framesize)
 
 static int
 setup_return(CPUARMState *env, struct target_sigaction *ka,
-             abi_ulong *rc, abi_ulong frame_addr, int usig, abi_ulong rc_addr)
+             abi_ulong frame_addr, int usig)
 {
     abi_ulong handler = 0;
     abi_ulong handler_fdpic_GOT = 0;
     abi_ulong retcode;
-
-    int thumb;
+    int thumb, retcode_idx;
     int is_fdpic = info_is_fdpic(((TaskState *)thread_cpu->opaque)->info);
 
     if (is_fdpic) {
@@ -243,6 +212,7 @@ setup_return(CPUARMState *env, struct target_sigaction *ka,
     }
 
     thumb = handler & 1;
+    retcode_idx = thumb + (ka->sa_flags & TARGET_SA_SIGINFO ? 2 : 0);
 
     uint32_t cpsr = cpsr_read(env);
 
@@ -260,37 +230,24 @@ setup_return(CPUARMState *env, struct target_sigaction *ka,
 
     if (ka->sa_flags & TARGET_SA_RESTORER) {
         if (is_fdpic) {
-            /* For FDPIC we ensure that the restorer is called with a
-             * correct r9 value.  For that we need to write code on
-             * the stack that sets r9 and jumps back to restorer
-             * value.
+            /*
+             * For FDPIC we ensure that the restorer is called with a
+             * correct r9 value.  For that we use a special trampoline
+             * that reads the function descriptor from the frame,
+             * sets r9 and jumps back to restorer value.
              */
-            if (thumb) {
-                __put_user(sigreturn_fdpic_thumb_codes[0], rc);
-                __put_user(sigreturn_fdpic_thumb_codes[1], rc + 1);
-                __put_user(sigreturn_fdpic_thumb_codes[2], rc + 2);
-                __put_user((abi_ulong)ka->sa_restorer, rc + 3);
-            } else {
-                __put_user(sigreturn_fdpic_codes[0], rc);
-                __put_user(sigreturn_fdpic_codes[1], rc + 1);
-                __put_user(sigreturn_fdpic_codes[2], rc + 2);
-                __put_user((abi_ulong)ka->sa_restorer, rc + 3);
-            }
-
-            retcode = rc_addr + thumb;
+            abi_ulong fd_ofs = (retcode_idx & 2
+                                ? offsetof(struct rt_sigframe_v2, fdpic_ret)
+                                : offsetof(struct sigframe_v2, fdpic_ret));
+            put_user_ual(ka->sa_restorer, frame_addr + fd_ofs);
+            /* Each trampoline variant consumes 8-byte slot. */
+            retcode = sigreturn_fdpic_tramp + retcode_idx * 8 + thumb;
         } else {
             retcode = ka->sa_restorer;
         }
     } else {
-        unsigned int idx = thumb;
-
-        if (ka->sa_flags & TARGET_SA_SIGINFO) {
-            idx += 2;
-        }
-
-        __put_user(retcodes[idx], rc);
-
-        retcode = rc_addr + thumb;
+        /* Each trampoline variant consumes one 4-byte slot. */
+        retcode = default_sigreturn + retcode_idx * 4 + thumb;
     }
 
     env->regs[0] = usig;
@@ -394,8 +351,7 @@ static void setup_frame_v1(int usig, struct target_sigaction *ka,
         __put_user(set->sig[i], &frame->extramask[i - 1]);
     }
 
-    if (setup_return(regs, ka, frame->retcode, frame_addr, usig,
-                     frame_addr + offsetof(struct sigframe_v1, retcode))) {
+    if (setup_return(regs, ka, frame_addr, usig)) {
         goto sigsegv;
     }
 
@@ -419,8 +375,7 @@ static void setup_frame_v2(int usig, struct target_sigaction *ka,
 
     setup_sigframe_v2(&frame->uc, set, regs);
 
-    if (setup_return(regs, ka, frame->retcode, frame_addr, usig,
-                     frame_addr + offsetof(struct sigframe_v2, retcode))) {
+    if (setup_return(regs, ka, frame_addr, usig)) {
         goto sigsegv;
     }
 
@@ -475,8 +430,7 @@ static void setup_rt_frame_v1(int usig, struct target_sigaction *ka,
         __put_user(set->sig[i], &frame->uc.tuc_sigmask.sig[i]);
     }
 
-    if (setup_return(env, ka, frame->retcode, frame_addr, usig,
-                     frame_addr + offsetof(struct rt_sigframe_v1, retcode))) {
+    if (setup_return(env, ka, frame_addr, usig)) {
         goto sigsegv;
     }
 
@@ -509,8 +463,7 @@ static void setup_rt_frame_v2(int usig, struct target_sigaction *ka,
 
     setup_sigframe_v2(&frame->uc, set, env);
 
-    if (setup_return(env, ka, frame->retcode, frame_addr, usig,
-                     frame_addr + offsetof(struct rt_sigframe_v2, retcode))) {
+    if (setup_return(env, ka, frame_addr, usig)) {
         goto sigsegv;
     }
 
@@ -841,3 +794,76 @@ long do_rt_sigreturn(CPUARMState *env)
         return do_rt_sigreturn_v1(env);
     }
 }
+
+void setup_sigtramp(abi_ulong sigtramp_page)
+{
+    enum {
+        /* For ARM, we encode the syscall number into the instruction. */
+        SWI_SYS_SIGRETURN =
+            0xef000000 | (TARGET_NR_sigreturn + ARM_SYSCALL_BASE),
+        SWI_SYS_RT_SIGRETURN =
+            0xef000000 | (TARGET_NR_rt_sigreturn + ARM_SYSCALL_BASE),
+
+        /*
+         * For Thumb , we pass the syscall number via r7.
+         * We therefore need two 16-bit instructions.
+         */
+        SWI_THUMB_SIGRETURN =
+            0xdf00 << 16 | 0x2700 | TARGET_NR_sigreturn,
+        SWI_THUMB_RT_SIGRETURN =
+            0xdf00 << 16 | 0x2700 | TARGET_NR_rt_sigreturn,
+
+        SIGFRAME_FDPIC_OFS = offsetof(struct sigframe_v2, fdpic_ret),
+        RT_SIGFRAME_FDPIC_OFS = offsetof(struct rt_sigframe_v2, fdpic_ret),
+    };
+
+    uint32_t total_size = 4 * 4 + 2 * 8;
+    uint32_t *tramp = lock_user(VERIFY_WRITE, sigtramp_page, total_size, 0);
+    uint32_t i = 0;
+
+    assert(tramp != NULL);
+
+    default_sigreturn = sigtramp_page;
+    __put_user(SWI_SYS_SIGRETURN, &tramp[i++]);
+    __put_user(SWI_THUMB_SIGRETURN, &tramp[i++]);
+    __put_user(SWI_SYS_RT_SIGRETURN, &tramp[i++]);
+    __put_user(SWI_THUMB_RT_SIGRETURN, &tramp[i++]);
+
+    /*
+     * FDPIC require trampolines to call sa_restorer.
+     *
+     * ARM versions use:
+     *    ldr   r9, [sp, #ofs]
+     *    ldmia r9, {r9, pc}
+     *
+     * Thumb versions use:
+     *    ldrd  r9, r10, [sp, #ofs]
+     *    bx    r10
+     *    nop
+     */
+    sigreturn_fdpic_tramp = sigtramp_page + i * 4;
+
+    /* ARM sigframe */
+    _Static_assert(SIGFRAME_FDPIC_OFS <= 0xfff);
+    __put_user(0xe59d9000 | SIGFRAME_FDPIC_OFS, &tramp[i++]);
+    __put_user(0xe8998200, &tramp[i++]);
+
+    /* Thumb sigframe */
+    _Static_assert(SIGFRAME_FDPIC_OFS <= 0xff << 2);
+    _Static_assert((SIGFRAME_FDPIC_OFS & 3) == 0);
+    __put_user(0x9a00e9dd | (SIGFRAME_FDPIC_OFS << 14), &tramp[i++]);
+    __put_user(0x46c04750, &tramp[i++]);
+
+    /* ARM rt_sigframe */
+    _Static_assert(RT_SIGFRAME_FDPIC_OFS <= 0xfff);
+    __put_user(0xe59d9000 | RT_SIGFRAME_FDPIC_OFS, &tramp[i++]);
+    __put_user(0xe8998200, &tramp[i++]);
+
+    /* Thumb rt_sigframe */
+    _Static_assert(RT_SIGFRAME_FDPIC_OFS <= 0xff << 2);
+    _Static_assert((RT_SIGFRAME_FDPIC_OFS & 3) == 0);
+    __put_user(0x9a00e9dd | (RT_SIGFRAME_FDPIC_OFS << 14), &tramp[i++]);
+    __put_user(0x46c04750, &tramp[i++]);
+
+    unlock_user(tramp, sigtramp_page, total_size);
+}
-- 
2.25.1


