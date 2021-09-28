Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A88741A519
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 04:06:26 +0200 (CEST)
Received: from localhost ([::1]:48850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mV2Vl-0007ff-6k
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 22:06:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mV2QO-0004ZW-QG
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 22:00:53 -0400
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a]:44972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mV2QI-0005fD-QY
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 22:00:52 -0400
Received: by mail-qt1-x82a.google.com with SMTP id r16so18528861qtw.11
 for <qemu-devel@nongnu.org>; Mon, 27 Sep 2021 19:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ktw9tUrJhzUu8kusMPVwZ3Oa3vGWKHqQeWg6eFN1MAk=;
 b=VaclZ4KDhSG1909iBUzwa8fim5P+cX+eiwQW1Eowr7kth07TOdUavTst22t8Dk+dgI
 bbNK2ASKW2kHV+aindTQPxKy5vmzl2sWKCZ6mUX3w9efn0pKoKYx+AbV6ZWzn1KWWTqN
 K6wOqRarORitbHnVgYAcmTT6brj2dESKqcIStXQl9sNQorw382XK3g+kMTYwJoD5JT6E
 cX8UeTSbpFGNhh8PkMoEirKW+ywtesxDuOSvVvd/y9XPjfYKxOpJ5ryAV8l8J6F9NtzI
 Cou/a/dxQhVNEzvwKt79n8UnvwqWA/pnqNvIZFK+h1rfMT4XVGaemzEC5+YDGhi2Ht+a
 xPSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ktw9tUrJhzUu8kusMPVwZ3Oa3vGWKHqQeWg6eFN1MAk=;
 b=2OHhEXg/apuSKZrUskNndyDrhde1VYMFqnjo4PrMEqaNa+S5CpQWCMMv24XRmi+p5y
 L4Py0Jaz00w5+uZx/5eVy8wfH3FPXQ3lJRyF9FeyXeq7GIfPpZVrkz1+tnJJ0CdBOvw2
 WfvK5Km72P4ksct9BrzbmHwEhlikEdyvXTRIh7lKFrNWLtkYiTXtOhI4y1pFtjkR4W2d
 JL4KxT4uUIVo60PCWiek6iMtge36IsWMUoOqA7I8k3ygSsiFFsZ9gsPvLGRblwqzkBwO
 WWOJbdC6FBluRtoXku3l2c1wv1x4gPzH/2sG0Az8S0AJbOp0wdUb1VMeKFHWaqg0gAEr
 SGnw==
X-Gm-Message-State: AOAM531ytUV0X36qucDCF4ttTrRLOcF9InSVFnX6b6w/kmq9850as8/x
 cFbnta+Bmi0ThZ2uE8qOpPq25xxu4yIwAg==
X-Google-Smtp-Source: ABdhPJz4IdWewgM0Zbzt7N4oqsfaEgN4EysAbTq022Zlx60czNls5c4tyIZ7hB3eUwohK50U4RA61w==
X-Received: by 2002:ac8:611c:: with SMTP id a28mr3096612qtm.276.1632794445814; 
 Mon, 27 Sep 2021 19:00:45 -0700 (PDT)
Received: from localhost.localdomain (cpe-24-31-215-130.sc.res.rr.com.
 [24.31.215.130])
 by smtp.gmail.com with ESMTPSA id g12sm12530370qtm.59.2021.09.27.19.00.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 19:00:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 05/25] linux-user/arm: Implement setup_sigtramp
Date: Mon, 27 Sep 2021 22:00:19 -0400
Message-Id: <20210928020039.184412-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210928020039.184412-1-richard.henderson@linaro.org>
References: <20210928020039.184412-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82a;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82a.google.com
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
Cc: peter.maydell@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Mirror what the kernel does in arch/arm/kernel/signal.h,
using the old sigframe struct in the rt sigframe struct.

Update the trampoline code to match the kernel: this uses
sp-relative accesses rather than pc-relative.

Copy the code into frame->retcode from the trampoline page.
This minimises the different cases wrt arm vs thumb vs fdpic.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/arm/target_signal.h |   2 +
 linux-user/arm/signal.c        | 184 ++++++++++++++++++++-------------
 2 files changed, 115 insertions(+), 71 deletions(-)

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
index ed7d1d80bb..67a3d1428b 100644
--- a/linux-user/arm/signal.c
+++ b/linux-user/arm/signal.c
@@ -99,43 +99,21 @@ struct sigframe
 struct rt_sigframe
 {
     struct target_siginfo info;
-    struct target_ucontext uc;
-    abi_ulong retcode[4];
+    struct sigframe sig;
 };
 
+static abi_ptr sigreturn_fdpic_tramp;
+
 /*
- * For ARM syscalls, we encode the syscall number into the instruction.
+ * Up to 3 words of 'retcode' in the sigframe are code,
+ * with retcode[3] being used by fdpic for the function descriptor.
+ * This code is not actually executed, but is retained for ABI compat.
+ *
+ * We will create a table of 8 retcode variants in the sigtramp page.
+ * Let each table entry use 3 words.
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
+#define RETCODE_WORDS  3
+#define RETCODE_BYTES  (RETCODE_WORDS * 4)
 
 static inline int valid_user_regs(CPUARMState *regs)
 {
@@ -183,15 +161,15 @@ get_sigframe(struct target_sigaction *ka, CPUARMState *regs, int framesize)
 }
 
 static int
-setup_return(CPUARMState *env, struct target_sigaction *ka,
-             abi_ulong *rc, abi_ulong frame_addr, int usig, abi_ulong rc_addr)
+setup_return(CPUARMState *env, struct target_sigaction *ka, int usig,
+             struct sigframe *frame, abi_ulong sp_addr)
 {
     abi_ulong handler = 0;
     abi_ulong handler_fdpic_GOT = 0;
     abi_ulong retcode;
-
-    int thumb;
+    int thumb, retcode_idx;
     int is_fdpic = info_is_fdpic(((TaskState *)thread_cpu->opaque)->info);
+    bool copy_retcode;
 
     if (is_fdpic) {
         /* In FDPIC mode, ka->_sa_handler points to a function
@@ -208,6 +186,7 @@ setup_return(CPUARMState *env, struct target_sigaction *ka,
     }
 
     thumb = handler & 1;
+    retcode_idx = thumb + (ka->sa_flags & TARGET_SA_SIGINFO ? 2 : 0);
 
     uint32_t cpsr = cpsr_read(env);
 
@@ -225,44 +204,34 @@ setup_return(CPUARMState *env, struct target_sigaction *ka,
 
     if (ka->sa_flags & TARGET_SA_RESTORER) {
         if (is_fdpic) {
-            /* For FDPIC we ensure that the restorer is called with a
-             * correct r9 value.  For that we need to write code on
-             * the stack that sets r9 and jumps back to restorer
-             * value.
-             */
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
+            __put_user((abi_ulong)ka->sa_restorer, &frame->retcode[3]);
+            retcode = (sigreturn_fdpic_tramp +
+                       retcode_idx * RETCODE_BYTES + thumb);
+            copy_retcode = true;
         } else {
             retcode = ka->sa_restorer;
+            copy_retcode = false;
         }
     } else {
-        unsigned int idx = thumb;
+        retcode = default_sigreturn + retcode_idx * RETCODE_BYTES + thumb;
+        copy_retcode = true;
+    }
 
-        if (ka->sa_flags & TARGET_SA_SIGINFO) {
-            idx += 2;
+    /* Copy the code to the stack slot for ABI compatibility. */
+    if (copy_retcode) {
+        uint32_t *host_rc = g2h_untagged(retcode);
+        int i;
+
+        for (i = 0; i < RETCODE_WORDS; ++i) {
+            __put_user(host_rc[i], &frame->retcode[i]);
         }
-
-        __put_user(retcodes[idx], rc);
-
-        retcode = rc_addr + thumb;
     }
 
     env->regs[0] = usig;
     if (is_fdpic) {
         env->regs[9] = handler_fdpic_GOT;
     }
-    env->regs[13] = frame_addr;
+    env->regs[13] = sp_addr;
     env->regs[14] = retcode;
     env->regs[15] = handler & (thumb ? ~1 : ~3);
     cpsr_write(env, cpsr, CPSR_IT | CPSR_T | CPSR_E, CPSRWriteByInstr);
@@ -351,8 +320,7 @@ void setup_frame(int usig, struct target_sigaction *ka,
 
     setup_sigframe(&frame->uc, set, regs);
 
-    if (setup_return(regs, ka, frame->retcode, frame_addr, usig,
-                     frame_addr + offsetof(struct sigframe, retcode))) {
+    if (setup_return(regs, ka, usig, frame, frame_addr)) {
         goto sigsegv;
     }
 
@@ -377,13 +345,12 @@ void setup_rt_frame(int usig, struct target_sigaction *ka,
     }
 
     info_addr = frame_addr + offsetof(struct rt_sigframe, info);
-    uc_addr = frame_addr + offsetof(struct rt_sigframe, uc);
+    uc_addr = frame_addr + offsetof(struct rt_sigframe, sig.uc);
     tswap_siginfo(&frame->info, info);
 
-    setup_sigframe(&frame->uc, set, env);
+    setup_sigframe(&frame->sig.uc, set, env);
 
-    if (setup_return(env, ka, frame->retcode, frame_addr, usig,
-                     frame_addr + offsetof(struct rt_sigframe, retcode))) {
+    if (setup_return(env, ka, usig, &frame->sig, frame_addr)) {
         goto sigsegv;
     }
 
@@ -578,8 +545,8 @@ long do_rt_sigreturn(CPUARMState *env)
     }
 
     if (do_sigframe_return(env,
-                           frame_addr + offsetof(struct rt_sigframe, uc),
-                           &frame->uc)) {
+                           frame_addr + offsetof(struct rt_sigframe, sig.uc),
+                           &frame->sig.uc)) {
         goto badframe;
     }
 
@@ -591,3 +558,78 @@ badframe:
     force_sig(TARGET_SIGSEGV);
     return -TARGET_QEMU_ESIGRETURN;
 }
+
+/*
+ * EABI syscalls pass the number via r7.
+ * Note that the kernel still adds the OABI syscall number to the trap,
+ * presumably for backward ABI compatibility with unwinders.
+ */
+#define ARM_MOV_R7_IMM(X)       (0xe3a07000 | (X))
+#define ARM_SWI_SYS(X)          (0xef000000 | (X) | ARM_SYSCALL_BASE)
+
+#define THUMB_MOVS_R7_IMM(X)    (0x2700 | (X))
+#define THUMB_SWI_SYS           0xdf00
+
+static void write_arm_sigreturn(uint32_t *rc, int syscall)
+{
+    __put_user(ARM_MOV_R7_IMM(syscall), rc);
+    __put_user(ARM_SWI_SYS(syscall), rc + 1);
+    /* Wrote 8 of 12 bytes */
+}
+
+static void write_thm_sigreturn(uint32_t *rc, int syscall)
+{
+    __put_user(THUMB_SWI_SYS << 16 | THUMB_MOVS_R7_IMM(syscall), rc);
+    /* Wrote 4 of 12 bytes */
+}
+
+/*
+ * Stub needed to make sure the FD register (r9) contains the right value.
+ * Use the same instruction sequence as the kernel.
+ */
+static void write_arm_fdpic_sigreturn(uint32_t *rc, int ofs)
+{
+    assert(ofs <= 0xfff);
+    __put_user(0xe59d3000 | ofs, rc + 0);   /* ldr r3, [sp, #ofs] */
+    __put_user(0xe8930908, rc + 1);         /* ldm r3, { r3, r9 } */
+    __put_user(0xe12fff13, rc + 2);         /* bx  r3 */
+    /* Wrote 12 of 12 bytes */
+}
+
+static void write_thm_fdpic_sigreturn(void *vrc, int ofs)
+{
+    uint16_t *rc = vrc;
+
+    assert((ofs & ~0x3fc) == 0);
+    __put_user(0x9b00 | (ofs >> 2), rc + 0);      /* ldr r3, [sp, #ofs] */
+    __put_user(0xcb0c, rc + 1);                   /* ldm r3, { r2, r3 } */
+    __put_user(0x4699, rc + 2);                   /* mov r9, r3 */
+    __put_user(0x4710, rc + 3);                   /* bx  r2 */
+    /* Wrote 8 of 12 bytes */
+}
+
+void setup_sigtramp(abi_ulong sigtramp_page)
+{
+    uint32_t total_size = 8 * RETCODE_BYTES;
+    uint32_t *tramp = lock_user(VERIFY_WRITE, sigtramp_page, total_size, 0);
+
+    assert(tramp != NULL);
+
+    default_sigreturn = sigtramp_page;
+    write_arm_sigreturn(&tramp[0 * RETCODE_WORDS], TARGET_NR_sigreturn);
+    write_thm_sigreturn(&tramp[1 * RETCODE_WORDS], TARGET_NR_sigreturn);
+    write_arm_sigreturn(&tramp[2 * RETCODE_WORDS], TARGET_NR_rt_sigreturn);
+    write_thm_sigreturn(&tramp[3 * RETCODE_WORDS], TARGET_NR_rt_sigreturn);
+
+    sigreturn_fdpic_tramp = sigtramp_page + 4 * RETCODE_BYTES;
+    write_arm_fdpic_sigreturn(tramp + 4 * RETCODE_WORDS,
+                              offsetof(struct sigframe, retcode[3]));
+    write_thm_fdpic_sigreturn(tramp + 5 * RETCODE_WORDS,
+                                offsetof(struct sigframe, retcode[3]));
+    write_arm_fdpic_sigreturn(tramp + 6 * RETCODE_WORDS,
+                              offsetof(struct rt_sigframe, sig.retcode[3]));
+    write_thm_fdpic_sigreturn(tramp + 7 * RETCODE_WORDS,
+                              offsetof(struct rt_sigframe, sig.retcode[3]));
+
+    unlock_user(tramp, sigtramp_page, total_size);
+}
-- 
2.25.1


