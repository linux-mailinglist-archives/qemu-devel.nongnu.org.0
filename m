Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E33B1443C1F
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 05:11:08 +0100 (CET)
Received: from localhost ([::1]:59296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mi7cC-0003PV-2V
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 00:11:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mi7VL-0005FV-RK
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 00:04:05 -0400
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733]:45638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mi7VH-0000vQ-GX
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 00:04:02 -0400
Received: by mail-qk1-x733.google.com with SMTP id n15so1092690qkp.12
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 21:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=baj/I/Bz1wNfmusOUpoAH2XUyOJ1rLb4eb+amBeVoKQ=;
 b=NmUMYFsf96tTM2wLwmrZnuxrGwGcb7LQ0dJNN9fKJ4RFnzpmCiMxdCOGN/ez3PpG2M
 7vcYXHAFOk2lUrqnp0L704eL34i7I6V6gn00NU28BpmNKya+GiAV/lsA+j6MQqViq5l8
 Mq6XRLISWEiKwWr8m/WZKmebLBb476kOrJS/xO84CpUl7dMNJ4pIBcpCcMzygj1QLVVr
 U1Vo+SoyGfFkqqCBWTbsGJw4TagvT3QRoXwun1/PgiG0CGr024YFZH0/V23gGqpVtzFR
 fbsUfVxwWT4En0XwZKnPVYQGsT3ZdwycFun/iLBQSgrfRp+1otnxm19J41ksXoeHM4wI
 GQIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=baj/I/Bz1wNfmusOUpoAH2XUyOJ1rLb4eb+amBeVoKQ=;
 b=3EEfldETbUW+p0Ab2qG2PRmOjkmRqPbPAW4AxIQ3shPvSdjl8JxajCVIrq6yzfiyk2
 B6B+p33QPdHjkv2L6h6gzhcOSF4kKKxOJFBUwj+RoKr1WPlodY/yZWQuB265fEntDfKr
 oLDA61FkEDR4EiYAhdI+xD65MxxPf5YJCQAKk+QM6T4gAMKAZ5kMiK4vh0ZXaik/IxrW
 zgBcd59++iwU07UdrYY1/z+sNUmlcINrTp752HYT94J7q/C2PghPOFoDDgRrldxqrhWZ
 en6/2PFqLW4upcKvS5dlI8mia4EJIm33GIs4CkBoFO8gqkVUNSQaFj8/H5LJ87UFwUBq
 KTLQ==
X-Gm-Message-State: AOAM530TtQdMR7cdnXayP9vsXU9Bbg06jrNbEHxjEaXKMwMlyoXPBikB
 ypdc5nwDU1G18z8r6sDtffNIdPrST/nwIA==
X-Google-Smtp-Source: ABdhPJzU9lycRt/3mLIhfMTgyk4AGjUIxTG0YJewjxnNDwkWTZ1pwWm3iJhbmiZspO4JxsvaPCV3uQ==
X-Received: by 2002:a37:b781:: with SMTP id h123mr5521240qkf.491.1635912238492; 
 Tue, 02 Nov 2021 21:03:58 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id br20sm730408qkb.104.2021.11.02.21.03.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 21:03:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 07/10] target/arm: Take an exception if PC is misaligned
Date: Wed,  3 Nov 2021 00:03:49 -0400
Message-Id: <20211103040352.373688-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211103040352.373688-1-richard.henderson@linaro.org>
References: <20211103040352.373688-1-richard.henderson@linaro.org>
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
---
 target/arm/helper.h           |  1 +
 target/arm/syndrome.h         |  5 ++++
 linux-user/aarch64/cpu_loop.c | 46 ++++++++++++++++++++---------------
 target/arm/tlb_helper.c       | 18 ++++++++++++++
 target/arm/translate-a64.c    | 15 ++++++++++++
 target/arm/translate.c        | 22 ++++++++++++++++-
 6 files changed, 87 insertions(+), 20 deletions(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 448a86edfd..b463d9343b 100644
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
index f30f4130a2..8cde8e7243 100644
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
index 97e0728b67..f9f3473288 100644
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
index 4cacb9658f..b79004e0cc 100644
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
index 2986fe1393..130a9ff8d5 100644
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
index 82d4e24c27..828fb328ee 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -9566,7 +9566,27 @@ static void arm_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
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


