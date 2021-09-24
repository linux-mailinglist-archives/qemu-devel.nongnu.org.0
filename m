Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D0341799D
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 19:19:54 +0200 (CEST)
Received: from localhost ([::1]:51732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTorZ-00056X-Bc
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 13:19:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mToYF-0003Dl-Ms
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 12:59:55 -0400
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733]:46692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mToY1-00071o-SJ
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 12:59:55 -0400
Received: by mail-qk1-x733.google.com with SMTP id b65so28387972qkc.13
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 09:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Rtqr3C3eoq1EPLIGYi3WdYYbWrj10vk/pNHEu4YGvvs=;
 b=O3fes/8Q7RRsJoVUb03lXxWyPddHN3I9YTFoax+0QZ9uukwbsRVhrrL1p6VYrzBt3o
 4NH2DgYJKb5PskLkwoSwFBs3xe85sz4+WTUTzrNgNKHUG0PI81Vu+7I25lzmIVBSkgYX
 wBr+4sKr3L4KmfZwCri8CTkTkOAzYac73pEOGyvGURgMHIjqR1IrZJZMLruSA5+PTNoq
 dwNTONQ88++CMDb8DYNhfplT6iiQqTthogSA+bCwIe3X0Ivz1Dt12HZl/+IHNEy0245Y
 nR5Jh93G3s6c+mpmsynq18bXXRkmCHsvW1j+Kl8Rk+AtC1FtV3AaohRrBkJ8EGQj+7wy
 ozFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Rtqr3C3eoq1EPLIGYi3WdYYbWrj10vk/pNHEu4YGvvs=;
 b=ardQLA0RBASy8Cqol1VI9Y1DFwL/A/qetc+cLIY5kR9JlQudRwwjWKtAnjG9e50+db
 K+b2TKcxmHK3gCyNl8su2QFEd+lS1I6IkdnQ8Q1ByZ9RBsFc3xLwYCv39E8ZXy1+Tekn
 sMD5rF4d6ifjd8xSguQ1Ty3paRMkgXKQn5DUopMaySeu5vCK9uS8XwEmXSN9rzV6/E94
 +WcFsRtrQug+ZIhVu0MQiRne7eferNQi0fZlreE/QJmzlRhGlcsS8TlNu+XMZmFM9M+F
 fYodmOaxrM6ypaT2yLxIGkH6193vggjCz1pQQ9CcN6EyQ4gr3tnkrdjJd7Jmo0TOUDd5
 tsNA==
X-Gm-Message-State: AOAM532Kd4cGDBg2582YUaEveGfx4V2aIjZ7EGTlpwP2GI96p2jsfuEh
 jGSGU8h0a8u1oJsA8Mq+9sJy0N9AVPkY1Q==
X-Google-Smtp-Source: ABdhPJzuY/ebETeJEvm6mpZYEt5N6aM0c8ZT0DJYjSLSHSfjba92xXIO4nmk88Vdi8tAEMVP/iSJ/g==
X-Received: by 2002:a37:a548:: with SMTP id o69mr11577288qke.9.1632502780911; 
 Fri, 24 Sep 2021 09:59:40 -0700 (PDT)
Received: from localhost.localdomain (cpe-24-74-129-96.carolina.res.rr.com.
 [24.74.129.96])
 by smtp.gmail.com with ESMTPSA id r13sm7141104qkk.73.2021.09.24.09.59.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 09:59:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 17/27] linux-user/nios2: Map a real kuser page
Date: Fri, 24 Sep 2021 12:59:16 -0400
Message-Id: <20210924165926.752809-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210924165926.752809-1-richard.henderson@linaro.org>
References: <20210924165926.752809-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::733;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x733.google.com
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

The first word of page1 is data, so the whole thing
can't be implemented with emulation of addresses.

Hijack trap number 31 to implement cmpxchg.

Set default_rt_sigreturn based on the kuser page.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/nios2/target_signal.h |  3 ++
 linux-user/elfload.c             | 35 ++++++++++++++++++++++
 linux-user/nios2/cpu_loop.c      | 51 +++++++++++++++++---------------
 linux-user/nios2/signal.c        |  2 +-
 target/nios2/translate.c         |  9 ------
 5 files changed, 66 insertions(+), 34 deletions(-)

diff --git a/linux-user/nios2/target_signal.h b/linux-user/nios2/target_signal.h
index aebf749f12..fe266c4c51 100644
--- a/linux-user/nios2/target_signal.h
+++ b/linux-user/nios2/target_signal.h
@@ -19,4 +19,7 @@ typedef struct target_sigaltstack {
 
 #include "../generic/signal.h"
 
+/* Nios2 uses a fixed address on the kuser page for sigreturn. */
+#define TARGET_ARCH_HAS_SIGTRAMP_PAGE 0
+
 #endif /* NIOS2_TARGET_SIGNAL_H */
diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 459a26ef1d..7b3a91b3ed 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -1100,6 +1100,41 @@ static void elf_core_copy_regs(target_elf_gregset_t *regs, const CPUMBState *env
 
 static void init_thread(struct target_pt_regs *regs, struct image_info *infop)
 {
+    static const uint8_t kuser_page[4 + 2 * 64] = {
+        /* __kuser_helper_version */
+        [0x00] = 0x02, 0x00, 0x00, 0x00,
+
+        /* __kuser_cmpxchg */
+        [0x04] = 0xfa, 0x6f, 0x3b, 0x00,  /* trap 31 */
+                 0x3a, 0x28, 0x00, 0xf8,  /* ret */
+
+        /* __kuser_sigtramp */
+        [0x44] = 0xc4, 0x22, 0x80, 0x00,  /* movi r2, __NR_rt_sigreturn */
+                 0x3a, 0x68, 0x3b, 0x00,  /* trap 0 */
+    };
+
+    abi_ulong pg;
+    uint8_t *ph;
+
+    pg = target_mmap(TARGET_PAGE_SIZE, TARGET_PAGE_SIZE,
+                     PROT_READ | PROT_WRITE,
+                     MAP_ANON | MAP_PRIVATE | MAP_FIXED, -1, 0);
+
+    /*
+     * If the mmap doesn't give us exactly page 1, there's nothing
+     * we can do, and it's unlikely that the program will be able
+     * to continue.  FIXME: Error out now?
+     */
+    assert(pg == TARGET_PAGE_SIZE);
+
+    ph = lock_user(VERIFY_WRITE, pg, sizeof(kuser_page), 0);
+    memcpy(ph, kuser_page, sizeof(kuser_page));
+    unlock_user(ph, pg, sizeof(kuser_page));
+    target_mprotect(TARGET_PAGE_SIZE, TARGET_PAGE_SIZE, PROT_READ | PROT_EXEC);
+
+    /* Install __kuser_sigtramp */
+    default_rt_sigreturn = TARGET_PAGE_SIZE + 0x44;
+
     regs->ea = infop->entry;
     regs->sp = infop->start_stack;
     regs->estatus = 0x3;
diff --git a/linux-user/nios2/cpu_loop.c b/linux-user/nios2/cpu_loop.c
index 246293a501..12070c8a3c 100644
--- a/linux-user/nios2/cpu_loop.c
+++ b/linux-user/nios2/cpu_loop.c
@@ -26,7 +26,6 @@
 void cpu_loop(CPUNios2State *env)
 {
     CPUState *cs = env_cpu(env);
-    Nios2CPU *cpu = NIOS2_CPU(cs);
     target_siginfo_t info;
     int trapnr, ret;
 
@@ -73,6 +72,32 @@ void cpu_loop(CPUNios2State *env)
                 force_sig_fault(TARGET_SIGILL, TARGET_ILL_ILLTRP,
                                 env->regs[R_PC]);
                 break;
+
+            case 31: /* QEMU specific, for __kuser_cmpxchg */
+                {
+                    abi_ptr g = env->regs[4];
+                    uint32_t *h, n, o;
+
+                    if (g & 0x3) {
+                        force_sig_fault(TARGET_SIGBUS, TARGET_BUS_ADRALN, g);
+                        break;
+                    }
+                    ret = page_get_flags(g);
+                    if (!(ret & PAGE_VALID)) {
+                        force_sig_fault(TARGET_SIGSEGV, TARGET_SEGV_MAPERR, g);
+                        break;
+                    }
+                    if (!(ret & PAGE_READ) || !(ret & PAGE_WRITE)) {
+                        force_sig_fault(TARGET_SIGSEGV, TARGET_SEGV_ACCERR, g);
+                        break;
+                    }
+                    h = g2h(cs, g);
+                    o = env->regs[5];
+                    n = env->regs[6];
+                    env->regs[2] = qatomic_cmpxchg(h, o, n) - o;
+                    env->regs[R_PC] += 4;
+                }
+                break;
             }
             break;
 
@@ -83,29 +108,7 @@ void cpu_loop(CPUNios2State *env)
             queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
             break;
         case 0xaa:
-            switch (env->regs[R_PC]) {
-            /*case 0x1000:*/  /* TODO:__kuser_helper_version */
-            case 0x1004:      /* __kuser_cmpxchg */
-                start_exclusive();
-                if (env->regs[4] & 0x3) {
-                    goto kuser_fail;
-                }
-                ret = get_user_u32(env->regs[2], env->regs[4]);
-                if (ret) {
-                    end_exclusive();
-                    goto kuser_fail;
-                }
-                env->regs[2] -= env->regs[5];
-                if (env->regs[2] == 0) {
-                    put_user_u32(env->regs[6], env->regs[4]);
-                }
-                end_exclusive();
-                env->regs[R_PC] = env->regs[R_RA];
-                break;
-            /*case 0x1040:*/  /* TODO:__kuser_sigtramp */
-            default:
-                ;
-kuser_fail:
+            {
                 info.si_signo = TARGET_SIGSEGV;
                 info.si_errno = 0;
                 /* TODO: check env->error_code */
diff --git a/linux-user/nios2/signal.c b/linux-user/nios2/signal.c
index a77e8a40f4..c9a235ded5 100644
--- a/linux-user/nios2/signal.c
+++ b/linux-user/nios2/signal.c
@@ -177,7 +177,7 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
 
     /* Set up to return from userspace; jump to fixed address sigreturn
        trampoline on kuser page.  */
-    env->regs[R_RA] = (unsigned long) (0x1044);
+    env->regs[R_RA] = default_rt_sigreturn;
 
     /* Set up registers for signal handler */
     env->regs[R_SP] = (unsigned long) frame;
diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index 485b487665..77706dd805 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -795,15 +795,6 @@ static void nios2_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
     dc->base.pc_next = pc + 4;
 
     /* Decode an instruction */
-
-#if defined(CONFIG_USER_ONLY)
-    /* FIXME: Is this needed ? */
-    if (pc >= 0x1000 && pc < 0x2000) {
-        t_gen_helper_raise_exception(dc, 0xaa);
-        return;
-    }
-#endif
-
     code = cpu_ldl_code(env, pc);
     op = get_opcode(code);
 
-- 
2.25.1


