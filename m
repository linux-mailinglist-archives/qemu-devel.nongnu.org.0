Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC9F41792B
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 19:02:54 +0200 (CEST)
Received: from localhost ([::1]:59138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTob7-0005XC-FI
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 13:02:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mToXv-0002dd-Pp
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 12:59:36 -0400
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32]:45806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mToXt-0006tj-Fm
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 12:59:35 -0400
Received: by mail-qv1-xf32.google.com with SMTP id x9so486539qvn.12
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 09:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tTWEHxzXUUId2fX/NSdCUm8jXTQGtuUSFGG/XZYirZo=;
 b=VOCM2nTbaAf0Fx3vPobozgYQV63bh0P3PtyWu4qqmoSMcmJDiCVZmQcdtgg5nc/Kpn
 2FdpIOSranUcVQX7PZCMVo2xZyTWODIgK3CS2CbLQNxlroGJ4Tvw52AohfQW4ULU1bYQ
 RFHoPGhDbDyYOkNAj/mFwnFt2bNm1auMX+F9R86VzUgSC+06kyLvfnoqum+36K/HuUJe
 TtFBmeOKxvHftD8Zk52XhHGmwWYMxVreGZt2OmSUOGbxCMDut6ELpMh0KgK1vQKX3+RZ
 LijT7/r0sTqdf8UoOomqZIKxhB8X4QYezz7vcVROFtM/MaRkYS35zHv/+ln/Lf5fdzhe
 AxJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tTWEHxzXUUId2fX/NSdCUm8jXTQGtuUSFGG/XZYirZo=;
 b=K3X4lp1FfD9YWKghNa6af0p8NYSADgAKlzeLLoYztnWKq61yD1a9WnW0IiZNmUglKe
 Yfo8ymv2i6uCXK91+3YB05l0jS1WfUQXsJYbKHQXBk6fSJuaIyo82ynqLEIsfZx1CIzK
 ayJxfvWAo/nZI4fFLkYXM0xTHMvF4ap6m+X6ZsVlBQfnB5E8uDMfnzY3efgpVq2m5QcA
 FOOLIoFyYFBlmFmZZQvyai9ICT8lpjWI8NC/rnpBSX8R5ILE2ny2PpeJTTqFTkcIx1Bl
 CWcIe6pMwBZJl0Je60O72Et89q/x9a+A1svOIWlH8fy4KFYtO/MI7YXwS2dVvfvypY1q
 ceWQ==
X-Gm-Message-State: AOAM531emB7bsQhkXU4TnaR8ftslC9F355zRE/DemRdLmL8Xt5BV4IqQ
 f4gQ+Sb/Pk3ch9tgeC8BHRvV2wkCPcae0A==
X-Google-Smtp-Source: ABdhPJwgGkCCvWc6v7ufaaCb4/J7yAZCT7mID68jiVLWECgQe6BynsckFc/8G/qzf3J3Uni55/27Xw==
X-Received: by 2002:ad4:446f:: with SMTP id s15mr11239397qvt.3.1632502771872; 
 Fri, 24 Sep 2021 09:59:31 -0700 (PDT)
Received: from localhost.localdomain (cpe-24-74-129-96.carolina.res.rr.com.
 [24.74.129.96])
 by smtp.gmail.com with ESMTPSA id r13sm7141104qkk.73.2021.09.24.09.59.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 09:59:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 05/27] linux-user/arm: Implement setup_sigtramp
Date: Fri, 24 Sep 2021 12:59:04 -0400
Message-Id: <20210924165926.752809-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210924165926.752809-1-richard.henderson@linaro.org>
References: <20210924165926.752809-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f32;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf32.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Update the trampoline code to match the kernel: this uses
sp-relative accesses rather than pc-relative.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/arm/target_signal.h |   2 +
 linux-user/arm/signal.c        | 177 ++++++++++++++++++++++++---------
 2 files changed, 130 insertions(+), 49 deletions(-)

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
index ed7d1d80bb..ccfae43028 100644
--- a/linux-user/arm/signal.c
+++ b/linux-user/arm/signal.c
@@ -103,39 +103,52 @@ struct rt_sigframe
     abi_ulong retcode[4];
 };
 
-/*
- * For ARM syscalls, we encode the syscall number into the instruction.
- */
-#define SWI_SYS_SIGRETURN       (0xef000000|(TARGET_NR_sigreturn + ARM_SYSCALL_BASE))
-#define SWI_SYS_RT_SIGRETURN    (0xef000000|(TARGET_NR_rt_sigreturn + ARM_SYSCALL_BASE))
+static abi_ptr sigreturn_fdpic_tramp;
 
 /*
- * For Thumb syscalls, we pass the syscall number via r7.  We therefore
- * need two 16-bit instructions.
+ * EABI syscalls pass the number via r7.
+ * Note that the kernel still adds the OABI syscall number to the trap,
+ * presumably for backward ABI compatibility with unwinders.
  */
-#define SWI_THUMB_SIGRETURN     (0xdf00 << 16 | 0x2700 | (TARGET_NR_sigreturn))
-#define SWI_THUMB_RT_SIGRETURN  (0xdf00 << 16 | 0x2700 | (TARGET_NR_rt_sigreturn))
+#define ARM_MOV_R7_IMM(X)       (0xe3a07000 | (X))
+#define ARM_SWI_SYS(X)          (0xef000000 | (X) | ARM_SYSCALL_BASE)
 
-static const abi_ulong retcodes[4] = {
-        SWI_SYS_SIGRETURN,      SWI_THUMB_SIGRETURN,
-        SWI_SYS_RT_SIGRETURN,   SWI_THUMB_RT_SIGRETURN
-};
+#define THUMB_MOVS_R7_IMM(X)    (0x2700 | (X))
+#define THUMB_SWI_SYS           0xdf00
+
+static void write_arm_sigreturn(uint32_t *rc, int syscall)
+{
+    __put_user(ARM_MOV_R7_IMM(syscall), rc);
+    __put_user(ARM_SWI_SYS(syscall), rc + 1);
+}
+
+static void write_thumb_sigreturn(uint32_t *rc, int syscall)
+{
+    __put_user(THUMB_SWI_SYS << 16 | THUMB_MOVS_R7_IMM(syscall), rc);
+}
 
 /*
- * Stub needed to make sure the FD register (r9) contains the right
- * value.
+ * Stub needed to make sure the FD register (r9) contains the right value.
+ * Use the same instruction sequence as the kernel.
  */
-static const unsigned long sigreturn_fdpic_codes[3] = {
-    0xe59fc004, /* ldr r12, [pc, #4] to read function descriptor */
-    0xe59c9004, /* ldr r9, [r12, #4] to setup GOT */
-    0xe59cf000  /* ldr pc, [r12] to jump into restorer */
-};
+static void write_arm_fdpic_sigreturn(uint32_t *rc, int ofs)
+{
+    assert(ofs <= 0xfff);
+    __put_user(0xe59d3000 | ofs, rc + 0);   /* ldr r3, [sp, #ofs] */
+    __put_user(0xe8930908, rc + 1);         /* ldm r3, { r3, r9 } */
+    __put_user(0xe12fff13, rc + 2);         /* bx  r3 */
+}
 
-static const unsigned long sigreturn_fdpic_thumb_codes[3] = {
-    0xc008f8df, /* ldr r12, [pc, #8] to read function descriptor */
-    0x9004f8dc, /* ldr r9, [r12, #4] to setup GOT */
-    0xf000f8dc  /* ldr pc, [r12] to jump into restorer */
-};
+static void write_thumb_fdpic_sigreturn(void *vrc, int ofs)
+{
+    uint16_t *rc = vrc;
+
+    assert((ofs & ~0x3fc) == 0);
+    __put_user(0x9b00 | (ofs >> 2), rc + 0);      /* ldr r3, [sp, #ofs] */
+    __put_user(0xcb0c, rc + 1);                   /* ldm r3, { r2, r3 } */
+    __put_user(0x4699, rc + 2);                   /* mov r9, r3 */
+    __put_user(0x4710, rc + 3);                   /* bx  r2 */
+}
 
 static inline int valid_user_regs(CPUARMState *regs)
 {
@@ -184,13 +197,12 @@ get_sigframe(struct target_sigaction *ka, CPUARMState *regs, int framesize)
 
 static int
 setup_return(CPUARMState *env, struct target_sigaction *ka,
-             abi_ulong *rc, abi_ulong frame_addr, int usig, abi_ulong rc_addr)
+             abi_ulong *rc, abi_ulong frame_addr, int usig, abi_ulong rc_ofs)
 {
     abi_ulong handler = 0;
     abi_ulong handler_fdpic_GOT = 0;
     abi_ulong retcode;
-
-    int thumb;
+    int thumb, retcode_idx;
     int is_fdpic = info_is_fdpic(((TaskState *)thread_cpu->opaque)->info);
 
     if (is_fdpic) {
@@ -208,6 +220,7 @@ setup_return(CPUARMState *env, struct target_sigaction *ka,
     }
 
     thumb = handler & 1;
+    retcode_idx = thumb + (ka->sa_flags & TARGET_SA_SIGINFO ? 2 : 0);
 
     uint32_t cpsr = cpsr_read(env);
 
@@ -225,37 +238,39 @@ setup_return(CPUARMState *env, struct target_sigaction *ka,
 
     if (ka->sa_flags & TARGET_SA_RESTORER) {
         if (is_fdpic) {
-            /* For FDPIC we ensure that the restorer is called with a
-             * correct r9 value.  For that we need to write code on
-             * the stack that sets r9 and jumps back to restorer
-             * value.
+            /*
+             * For FDPIC we ensure that the restorer is called with a
+             * correct r9 value.  For that we need a special trampoline
+             * the reads the function descriptor from the frame,
+             * sets r9 and jumps back to restorer value.
+             *
+             * This on-stack code is unused but retained for ABI compliance.
              */
             if (thumb) {
-                __put_user(sigreturn_fdpic_thumb_codes[0], rc);
-                __put_user(sigreturn_fdpic_thumb_codes[1], rc + 1);
-                __put_user(sigreturn_fdpic_thumb_codes[2], rc + 2);
-                __put_user((abi_ulong)ka->sa_restorer, rc + 3);
+                write_thumb_fdpic_sigreturn(rc, rc_ofs + 12);
             } else {
-                __put_user(sigreturn_fdpic_codes[0], rc);
-                __put_user(sigreturn_fdpic_codes[1], rc + 1);
-                __put_user(sigreturn_fdpic_codes[2], rc + 2);
-                __put_user((abi_ulong)ka->sa_restorer, rc + 3);
+                write_arm_fdpic_sigreturn(rc, rc_ofs + 12);
             }
+            __put_user((abi_ulong)ka->sa_restorer, &rc[3]);
 
-            retcode = rc_addr + thumb;
+            /* Each trampoline variant consumes a 12-byte slot. */
+            retcode = sigreturn_fdpic_tramp + retcode_idx * 12 + thumb;
         } else {
             retcode = ka->sa_restorer;
         }
     } else {
-        unsigned int idx = thumb;
+        int syscall = (ka->sa_flags & TARGET_SA_SIGINFO
+                       ? TARGET_NR_rt_sigreturn : TARGET_NR_sigreturn);
 
-        if (ka->sa_flags & TARGET_SA_SIGINFO) {
-            idx += 2;
+        /* This on-stack code is unused but retained for ABI compliance. */
+        if (thumb) {
+            write_thumb_sigreturn(rc, syscall);
+        } else {
+            write_arm_sigreturn(rc, syscall);
         }
 
-        __put_user(retcodes[idx], rc);
-
-        retcode = rc_addr + thumb;
+        /* Each trampoline variant consumes 8-byte slot. */
+        retcode = default_sigreturn + retcode_idx * 8 + thumb;
     }
 
     env->regs[0] = usig;
@@ -352,7 +367,7 @@ void setup_frame(int usig, struct target_sigaction *ka,
     setup_sigframe(&frame->uc, set, regs);
 
     if (setup_return(regs, ka, frame->retcode, frame_addr, usig,
-                     frame_addr + offsetof(struct sigframe, retcode))) {
+                     offsetof(struct sigframe, retcode))) {
         goto sigsegv;
     }
 
@@ -383,7 +398,7 @@ void setup_rt_frame(int usig, struct target_sigaction *ka,
     setup_sigframe(&frame->uc, set, env);
 
     if (setup_return(env, ka, frame->retcode, frame_addr, usig,
-                     frame_addr + offsetof(struct rt_sigframe, retcode))) {
+                     offsetof(struct rt_sigframe, retcode))) {
         goto sigsegv;
     }
 
@@ -591,3 +606,67 @@ badframe:
     force_sig(TARGET_SIGSEGV);
     return -TARGET_QEMU_ESIGRETURN;
 }
+
+void setup_sigtramp(abi_ulong sigtramp_page)
+{
+    enum {
+        SIGFRAME_FDPIC_OFS = offsetof(struct sigframe, retcode[3]),
+        RT_SIGFRAME_FDPIC_OFS = offsetof(struct rt_sigframe, retcode[3]),
+    };
+
+    uint32_t total_size = 4 * 8 + 4 * 12;
+    uint32_t *tramp = lock_user(VERIFY_WRITE, sigtramp_page, total_size, 0);
+    uint32_t i = 0;
+
+    assert(tramp != NULL);
+
+    default_sigreturn = sigtramp_page;
+    write_arm_sigreturn(&tramp[i], TARGET_NR_sigreturn);
+    i += 2;
+    write_thumb_sigreturn(&tramp[i], TARGET_NR_sigreturn);
+    i += 2;
+    write_arm_sigreturn(&tramp[i], TARGET_NR_rt_sigreturn);
+    i += 2;
+    write_thumb_sigreturn(&tramp[i], TARGET_NR_rt_sigreturn);
+    i += 2;
+
+    /*
+     * FDPIC require trampolines to call sa_restorer, and different
+     * from the pc-relative versions we write to the stack.
+     *
+     * ARM versions use:
+     *    ldr   r3, [sp, #ofs]
+     *    ldr   r9, [r3, #4]
+     *    ldr   pc, [r3, #0]
+     *
+     * Thumb versions use:
+     *    ldr   r3, [sp, #ofs]
+     *    ldmia r3, {r2, r3}
+     *    mov   r9, r3
+     *    bx    r2
+     */
+    sigreturn_fdpic_tramp = sigtramp_page + i * 4;
+
+    /* ARM sigframe */
+    write_arm_fdpic_sigreturn(tramp + i,
+                              offsetof(struct sigframe, retcode[3]));
+    i += 3;
+
+    /* Thumb sigframe */
+    write_thumb_fdpic_sigreturn(tramp + i,
+                                offsetof(struct sigframe, retcode[3]));
+    i += 3;
+
+    /* ARM rt_sigframe */
+    write_arm_fdpic_sigreturn(tramp + i,
+                              offsetof(struct rt_sigframe, retcode[3]));
+    i += 3;
+
+    /* Thumb rt_sigframe */
+    write_thumb_fdpic_sigreturn(tramp + i,
+                                offsetof(struct rt_sigframe, retcode[3]));
+    i += 3;
+
+    assert(i * 4 == total_size);
+    unlock_user(tramp, sigtramp_page, total_size);
+}
-- 
2.25.1


