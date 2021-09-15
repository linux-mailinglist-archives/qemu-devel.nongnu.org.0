Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8FDD40CC03
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 19:54:08 +0200 (CEST)
Received: from localhost ([::1]:43026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQZ6k-0005Il-Mk
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 13:54:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQZ2j-0000uG-Fb
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 13:49:57 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:42795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQZ2h-00038f-Pd
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 13:49:57 -0400
Received: by mail-pg1-x531.google.com with SMTP id q68so3459966pga.9
 for <qemu-devel@nongnu.org>; Wed, 15 Sep 2021 10:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mV2eu/Zav+aVRqycI4SiuColM6i5MZEh5iI5/KRQ2x0=;
 b=IT6WbsAItzILiqzNwuskc3kHAUDmVsx1ahoVDCIzZzeqqDaO9cbgCR5ZdE8M5rKNvO
 6d0mYGef7bWjzwD9WTHj4frx9hhRUgMOQ1tYUFhH8aLVohecFsCKi+aeXe+cEz+fvuY/
 AAIDRrP0PIKRdN4SXaDrW99WnU0D4FjjrdIeTp4pLuoHWUNCIw6ZYsAYulS/bXlPSQKM
 HCiXkLfFt3rmY9HfFyd5tBIDryhgfQ5A5K83Be3YpG5JL49tmG6H6+cnXs6jCVrPlMcS
 7yI0GoLXS7WE/itE9onVCwGrA7XbXemwVBCICYkMjO7pC12L7r36kYrFp3n7f6mLtZoY
 A7CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mV2eu/Zav+aVRqycI4SiuColM6i5MZEh5iI5/KRQ2x0=;
 b=N9hG5dWuTsrrdARiMw7Gq5AFpU2yk7ASIK647Dr3EyCIC8mwXe4xfwKYdwHbNXugHJ
 nOfVfVklBxyWKRJjJWaavXDvvWPD4S+SFL0ibF3gM+2ElSzn1jWA6NejUMLIE2yvLOVb
 /3bcegWqxGqhaa2gPJArTSFRYKulUJ9C2GKCxHDmOyhMRGHLscu9MrvsSnKnU0dyWJ/X
 QHSutY+D5v+sD7nN09bfnyQjdO2tU50opqrCRQuwufOpOhcrYbUIxwpVcB+zcCjJg3h7
 HT1HtagaBGLsgYBWRfg/LH+JKWoq6/sAvJOmy6ejoB+6pexKA6ebi5oJUJUVne7r8jQy
 sxqg==
X-Gm-Message-State: AOAM533KQq4GM6WVuGT94JNblRubMJhNhw1gdaR1RfasXScbctg3Og3b
 UpzuAqBJUsqfphQOSDnD2J+Srpg2eG7n3w==
X-Google-Smtp-Source: ABdhPJxiQya/J+rwXL4kSr7HEhylzNJ6tqHVIhgBc8X+9OwEB8/mCu3C0F7dmIYiQmgKRWL9BrYtsw==
X-Received: by 2002:aa7:8426:0:b0:438:3550:f190 with SMTP id
 q6-20020aa78426000000b004383550f190mr1095691pfn.19.1631728194493; 
 Wed, 15 Sep 2021 10:49:54 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id g4sm311667pjt.56.2021.09.15.10.49.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Sep 2021 10:49:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] linux-user/nios2: Map a real kuser page
Date: Wed, 15 Sep 2021 10:49:51 -0700
Message-Id: <20210915174951.1852266-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210915174951.1852266-1-richard.henderson@linaro.org>
References: <20210915174951.1852266-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
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
Cc: marex@denx.de, crwulff@gmail.com, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The first word of page1 is data, so the whole thing
can't be implemented with emulation of addresses.

Hijack trap number 31 to implement cmpxchg.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/elfload.c        | 35 +++++++++++++++++++++++++
 linux-user/nios2/cpu_loop.c | 52 ++++++++++++++++++++-----------------
 target/nios2/translate.c    |  9 -------
 3 files changed, 63 insertions(+), 33 deletions(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 01e9a833fb..e78c0af183 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -1091,6 +1091,41 @@ static void elf_core_copy_regs(target_elf_gregset_t *regs, const CPUMBState *env
 
 static void init_thread(struct target_pt_regs *regs, struct image_info *infop)
 {
+    static const uint8_t kuser_page[128] = {
+        /* __kuser_helper_version */
+        [0x00] = 0x02, 0x00, 0x00, 0x00,
+
+        /* __kuser_cmpxchg */
+        [0x04] = 0xfa, 0x6f, 0x3b, 0x00,  /* trap 31 */
+                 0x3a, 0x28, 0x00, 0xf8,  /* ret */
+
+        /* __kuser_sigtramp */
+        [0x40] = 0xc4, 0x22, 0x80, 0x00,  /* movi r2, __NR_rt_sigreturn */
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
+    if (pg == TARGET_PAGE_SIZE) {
+        ph = lock_user(VERIFY_WRITE, pg, sizeof(kuser_page), 0);
+        memcpy(ph, kuser_page, sizeof(kuser_page));
+        unlock_user(ph, pg, sizeof(kuser_page));
+        target_mprotect(TARGET_PAGE_SIZE, TARGET_PAGE_SIZE,
+                        PROT_READ | PROT_EXEC);
+    } else {
+        target_munmap(pg, TARGET_PAGE_SIZE);
+    }
+
     regs->ea = infop->entry;
     regs->sp = infop->start_stack;
     regs->estatus = 0x3;
diff --git a/linux-user/nios2/cpu_loop.c b/linux-user/nios2/cpu_loop.c
index d76bdb2891..fd3f853ac2 100644
--- a/linux-user/nios2/cpu_loop.c
+++ b/linux-user/nios2/cpu_loop.c
@@ -20,11 +20,11 @@
 #include "qemu/osdep.h"
 #include "qemu.h"
 #include "cpu_loop-common.h"
+#include "signal-common.h"
 
 void cpu_loop(CPUNios2State *env)
 {
     CPUState *cs = env_cpu(env);
-    Nios2CPU *cpu = NIOS2_CPU(cs);
     target_siginfo_t info;
     int trapnr, ret;
 
@@ -71,6 +71,32 @@ void cpu_loop(CPUNios2State *env)
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
 
@@ -81,29 +107,7 @@ void cpu_loop(CPUNios2State *env)
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


