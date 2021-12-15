Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C3A4757C4
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 12:31:19 +0100 (CET)
Received: from localhost ([::1]:60342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxSVC-0007eV-5u
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 06:31:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mxRib-0006x2-Uz
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:41:06 -0500
Received: from [2a00:1450:4864:20::433] (port=33692
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mxRiX-0008RH-CX
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:41:05 -0500
Received: by mail-wr1-x433.google.com with SMTP id j9so5247849wrc.0
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 02:41:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=6kBw302WwHhJPN2hEgYUEFv5ycm8v30JC+SADrB5jpk=;
 b=Ch8cE4mHOcl2A0sCtyIOB4vmvG1kHOssN0BkxH9XX7uPOsXk5sRD4czuKj3IqblOXc
 AzjTidooLjsAmYJRtC+rpbbG1hJwt0lvt0Z7xM8hmthF7NVn8Ww+d6WUdEJHHqwwNjTh
 qUwZyzyl/OQ2M92shYlLiDBE4Jj8qg5O1g8ixZKA4GVm0/DtR1jpDiJySaLg4kQxxLYB
 +EeXiaBKnU+LxcnNQN2rTzG9uqGZJ+9ois9cedxLVVU+8yvX/mTL1A9qF1rz6jmO0bLE
 /9fSVGmX9GpWleIlRLLCnJGLCOZRKemuE4mpWCLut/FUme2HAfD3fHAjFsofK0NUcWXx
 EExQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6kBw302WwHhJPN2hEgYUEFv5ycm8v30JC+SADrB5jpk=;
 b=zJ+C3Yq4xUDEvxgAricFBQyxN61MJON3CrLBp37dmP1EYElxSNaLuNVExdnOJe3hTf
 pVNk/YrWCQJGYhtlQt36Yb44LQenkE8Pq48/TzeNQ9gnyI1qjfpMtx+LwMzqJyEAWbc9
 7ADIJMXCDaR83/I7iwtODcM0oZa2X5nzs3nfUzw/WiUaItpAEIQQjy6lkRLZg7tlBrYU
 BM5yXAS9JdSBYc2Sfx+uvTJgbJMgxe/qSfV4OxiJ3JOYpwRttCoTUZg4J0Xjmj4sRk/s
 3Snb9eD1aMOUAKEmtfLpFCwM7AIMqtB+R5t64bONT7eC4dENQTHxSL7m+Sur/jMHXYW5
 1uMw==
X-Gm-Message-State: AOAM531TgkzShpNGgTRSKSOQ0XRL5nE8v/iyrXDHly7zqD92YOjZ/rsa
 zn57I9+i8wPND+lH+qWqiHZ7hwfheX253w==
X-Google-Smtp-Source: ABdhPJyMXGq+41h35yUSqfI2/Ou+MXhsyTLQV9zq+u33fRqaKvoUk7zfkRZrEO/aTZ+rBk5AfDQBQg==
X-Received: by 2002:a5d:6546:: with SMTP id z6mr125034wrv.516.1639564859476;
 Wed, 15 Dec 2021 02:40:59 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id e18sm1600815wrs.48.2021.12.15.02.40.58
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 02:40:59 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 15/33] target/arm: Take an exception if PC is misaligned
Date: Wed, 15 Dec 2021 10:40:31 +0000
Message-Id: <20211215104049.2030475-16-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211215104049.2030475-1-peter.maydell@linaro.org>
References: <20211215104049.2030475-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

For A64, any input to an indirect branch can cause this.

For A32, many indirect branch paths force the branch to be aligned,
but BXWritePC does not.  This includes the BX instruction but also
other interworking changes to PC.  Prior to v8, this case is UNDEFINED.
With v8, this is CONSTRAINED UNPREDICTABLE and may either raise an
exception or force align the PC.

We choose to raise an exception because we have the infrastructure,
it makes the generated code for gen_bx simpler, and it has the
possibility of catching more guest bugs.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.h           |  1 +
 target/arm/syndrome.h         |  5 ++++
 linux-user/aarch64/cpu_loop.c | 46 ++++++++++++++++++++---------------
 target/arm/tlb_helper.c       | 18 ++++++++++++++
 target/arm/translate-a64.c    | 15 ++++++++++++
 target/arm/translate.c        | 22 ++++++++++++++++-
 6 files changed, 87 insertions(+), 20 deletions(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 448a86edfdc..b463d9343bc 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -47,6 +47,7 @@ DEF_HELPER_FLAGS_3(sel_flags, TCG_CALL_NO_RWG_SE,
 DEF_HELPER_2(exception_internal, void, env, i32)
 DEF_HELPER_4(exception_with_syndrome, void, env, i32, i32, i32)
 DEF_HELPER_2(exception_bkpt_insn, void, env, i32)
+DEF_HELPER_2(exception_pc_alignment, noreturn, env, tl)
 DEF_HELPER_1(setend, void, env)
 DEF_HELPER_2(wfi, void, env, i32)
 DEF_HELPER_1(wfe, void, env)
diff --git a/target/arm/syndrome.h b/target/arm/syndrome.h
index f30f4130a27..8cde8e7243a 100644
--- a/target/arm/syndrome.h
+++ b/target/arm/syndrome.h
@@ -282,4 +282,9 @@ static inline uint32_t syn_illegalstate(void)
     return (EC_ILLEGALSTATE << ARM_EL_EC_SHIFT) | ARM_EL_IL;
 }
 
+static inline uint32_t syn_pcalignment(void)
+{
+    return (EC_PCALIGNMENT << ARM_EL_EC_SHIFT) | ARM_EL_IL;
+}
+
 #endif /* TARGET_ARM_SYNDROME_H */
diff --git a/linux-user/aarch64/cpu_loop.c b/linux-user/aarch64/cpu_loop.c
index 97e0728b679..f9f3473288f 100644
--- a/linux-user/aarch64/cpu_loop.c
+++ b/linux-user/aarch64/cpu_loop.c
@@ -113,27 +113,35 @@ void cpu_loop(CPUARMState *env)
             break;
         case EXCP_PREFETCH_ABORT:
         case EXCP_DATA_ABORT:
-            /* We should only arrive here with EC in {DATAABORT, INSNABORT}. */
             ec = syn_get_ec(env->exception.syndrome);
-            assert(ec == EC_DATAABORT || ec == EC_INSNABORT);
-
-            /* Both EC have the same format for FSC, or close enough. */
-            fsc = extract32(env->exception.syndrome, 0, 6);
-            switch (fsc) {
-            case 0x04 ... 0x07: /* Translation fault, level {0-3} */
-                si_signo = TARGET_SIGSEGV;
-                si_code = TARGET_SEGV_MAPERR;
+            switch (ec) {
+            case EC_DATAABORT:
+            case EC_INSNABORT:
+                /* Both EC have the same format for FSC, or close enough. */
+                fsc = extract32(env->exception.syndrome, 0, 6);
+                switch (fsc) {
+                case 0x04 ... 0x07: /* Translation fault, level {0-3} */
+                    si_signo = TARGET_SIGSEGV;
+                    si_code = TARGET_SEGV_MAPERR;
+                    break;
+                case 0x09 ... 0x0b: /* Access flag fault, level {1-3} */
+                case 0x0d ... 0x0f: /* Permission fault, level {1-3} */
+                    si_signo = TARGET_SIGSEGV;
+                    si_code = TARGET_SEGV_ACCERR;
+                    break;
+                case 0x11: /* Synchronous Tag Check Fault */
+                    si_signo = TARGET_SIGSEGV;
+                    si_code = TARGET_SEGV_MTESERR;
+                    break;
+                case 0x21: /* Alignment fault */
+                    si_signo = TARGET_SIGBUS;
+                    si_code = TARGET_BUS_ADRALN;
+                    break;
+                default:
+                    g_assert_not_reached();
+                }
                 break;
-            case 0x09 ... 0x0b: /* Access flag fault, level {1-3} */
-            case 0x0d ... 0x0f: /* Permission fault, level {1-3} */
-                si_signo = TARGET_SIGSEGV;
-                si_code = TARGET_SEGV_ACCERR;
-                break;
-            case 0x11: /* Synchronous Tag Check Fault */
-                si_signo = TARGET_SIGSEGV;
-                si_code = TARGET_SEGV_MTESERR;
-                break;
-            case 0x21: /* Alignment fault */
+            case EC_PCALIGNMENT:
                 si_signo = TARGET_SIGBUS;
                 si_code = TARGET_BUS_ADRALN;
                 break;
diff --git a/target/arm/tlb_helper.c b/target/arm/tlb_helper.c
index 4cacb9658fb..b79004e0cca 100644
--- a/target/arm/tlb_helper.c
+++ b/target/arm/tlb_helper.c
@@ -9,6 +9,7 @@
 #include "cpu.h"
 #include "internals.h"
 #include "exec/exec-all.h"
+#include "exec/helper-proto.h"
 
 static inline uint32_t merge_syn_data_abort(uint32_t template_syn,
                                             unsigned int target_el,
@@ -134,6 +135,23 @@ void arm_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
     arm_deliver_fault(cpu, vaddr, access_type, mmu_idx, &fi);
 }
 
+void helper_exception_pc_alignment(CPUARMState *env, target_ulong pc)
+{
+    ARMMMUFaultInfo fi = { .type = ARMFault_Alignment };
+    int target_el = exception_target_el(env);
+    int mmu_idx = cpu_mmu_index(env, true);
+    uint32_t fsc;
+
+    env->exception.vaddress = pc;
+
+    /*
+     * Note that the fsc is not applicable to this exception,
+     * since any syndrome is pcalignment not insn_abort.
+     */
+    env->exception.fsr = compute_fsr_fsc(env, &fi, target_el, mmu_idx, &fsc);
+    raise_exception(env, EXCP_PREFETCH_ABORT, syn_pcalignment(), target_el);
+}
+
 #if !defined(CONFIG_USER_ONLY)
 
 /*
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 2986fe13935..130a9ff8d54 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -14753,6 +14753,7 @@ static void aarch64_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
     uint64_t pc = s->base.pc_next;
     uint32_t insn;
 
+    /* Singlestep exceptions have the highest priority. */
     if (s->ss_active && !s->pstate_ss) {
         /* Singlestep state is Active-pending.
          * If we're in this state at the start of a TB then either
@@ -14771,6 +14772,20 @@ static void aarch64_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
         return;
     }
 
+    if (pc & 3) {
+        /*
+         * PC alignment fault.  This has priority over the instruction abort
+         * that we would receive from a translation fault via arm_ldl_code.
+         * This should only be possible after an indirect branch, at the
+         * start of the TB.
+         */
+        assert(s->base.num_insns == 1);
+        gen_helper_exception_pc_alignment(cpu_env, tcg_constant_tl(pc));
+        s->base.is_jmp = DISAS_NORETURN;
+        s->base.pc_next = QEMU_ALIGN_UP(pc, 4);
+        return;
+    }
+
     s->pc_curr = pc;
     insn = arm_ldl_code(env, &s->base, pc, s->sctlr_b);
     s->insn = insn;
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 0103c75a274..45917c3a6d2 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -9555,7 +9555,27 @@ static void arm_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
     uint32_t pc = dc->base.pc_next;
     unsigned int insn;
 
-    if (arm_check_ss_active(dc) || arm_check_kernelpage(dc)) {
+    /* Singlestep exceptions have the highest priority. */
+    if (arm_check_ss_active(dc)) {
+        dc->base.pc_next = pc + 4;
+        return;
+    }
+
+    if (pc & 3) {
+        /*
+         * PC alignment fault.  This has priority over the instruction abort
+         * that we would receive from a translation fault via arm_ldl_code
+         * (or the execution of the kernelpage entrypoint). This should only
+         * be possible after an indirect branch, at the start of the TB.
+         */
+        assert(dc->base.num_insns == 1);
+        gen_helper_exception_pc_alignment(cpu_env, tcg_constant_tl(pc));
+        dc->base.is_jmp = DISAS_NORETURN;
+        dc->base.pc_next = QEMU_ALIGN_UP(pc, 4);
+        return;
+    }
+
+    if (arm_check_kernelpage(dc)) {
         dc->base.pc_next = pc + 4;
         return;
     }
-- 
2.25.1


