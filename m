Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A69257EDD
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Aug 2020 18:35:29 +0200 (CEST)
Received: from localhost ([::1]:59252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kCmmG-00052u-Hv
	for lists+qemu-devel@lfdr.de; Mon, 31 Aug 2020 12:35:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kCmLA-0006Bp-GW
 for qemu-devel@nongnu.org; Mon, 31 Aug 2020 12:07:28 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:52137)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kCmL7-00068N-J2
 for qemu-devel@nongnu.org; Mon, 31 Aug 2020 12:07:28 -0400
Received: by mail-pj1-x1035.google.com with SMTP id ds1so32395pjb.1
 for <qemu-devel@nongnu.org>; Mon, 31 Aug 2020 09:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hPPwhaOv1/f5e78+KPOAqe2Pb1bWVEOSoZwO+mnHc14=;
 b=AJuVvromJM9XlIiwcU2TOEGHOSM2mO329P9cUo62B6qHFcPslndGMQgSEy1lCzMHC1
 3x0IvX32Ch5LQlYFhx9jxOU1aLwR3QfOyaaTGOEBXh2R1tqXZlp1nMfEU/nVZk/BToh2
 CWoBrMZ6QYrGKugePu7rVtkwHcRS+BL7avumgLkla1HvMwZLoqiaCO7FkkWNeEm7bnFz
 rf1mnM+OrUlvcn8kNJjAl8x78jnzVFCEaSqCedQeHFOCpSNJHXIY+M7vR+qrzNblRc7v
 e0VawtjK+nQxyfdj/nufUy1iHz6VK5Vs+HAgYXXTlfCwAYDih2Ebgoln2fEo51/rCs2v
 YNqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hPPwhaOv1/f5e78+KPOAqe2Pb1bWVEOSoZwO+mnHc14=;
 b=dS6QDyRhsKPY/xTL8F+gtgbQWvafKrBhND61IRs8L0a64+PVHYlqKHhPKBGkg5+i/O
 C7XRdsGNPVn7SDIixOWwnYgIZr1N1huFb+r3ezpMVz4NhJgpltvi8/PZYfW+lGX27BUS
 SGah73cE8/iZBRhbO8cf9pb/pQMqPl09WQM8+JvyzDltjzVY8uBnX+/joRiqOgGM+cCd
 LSlX76kXdbOqwZvBGBlh8BKLj6I5pU2cfupAyatdoEm4rCMB/dVJjf3a22pOj5q2FbNi
 o8OrOIMR5Nz66C+dXq6cuNlCHeaS3OMz27kOjUXgiPmIj38QUI2HkFKPCVLqCnE5drBd
 Sq+g==
X-Gm-Message-State: AOAM532T91HC111qtfNTLawulbXlNID5LtmQd7eyMtrHYZ6n+8otD0At
 KnOmpYgSM0AXiOQVzc5zMg5A6ylWxXsWvA==
X-Google-Smtp-Source: ABdhPJwwG1/lFvyPpfa0byOBXUnjGyYqsP8ssX6VIOFPlxq4POfWxK1iZSCnckwqGMF5zjAd9lzGpA==
X-Received: by 2002:a17:90b:4c0f:: with SMTP id
 na15mr65229pjb.119.1598890043547; 
 Mon, 31 Aug 2020 09:07:23 -0700 (PDT)
Received: from localhost.localdomain ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id gt13sm17218pjb.43.2020.08.31.09.07.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Aug 2020 09:07:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 59/76] target/microblaze: Use cc->do_unaligned_access
Date: Mon, 31 Aug 2020 09:05:44 -0700
Message-Id: <20200831160601.833692-60-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200831160601.833692-1-richard.henderson@linaro.org>
References: <20200831160601.833692-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>, peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This fixes the problem in which unaligned stores succeeded,
but then we raised the exception after modifying memory.
Store the ESS for the unaligned data access in the iflags
for the insn, so that it can be found during unwind.

Tested-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/microblaze/cpu.h       | 10 ++++-
 target/microblaze/helper.h    |  1 -
 target/microblaze/cpu.c       |  1 +
 target/microblaze/helper.c    | 28 ++++++++++++++
 target/microblaze/op_helper.c | 21 ----------
 target/microblaze/translate.c | 72 +++++++++++++----------------------
 6 files changed, 64 insertions(+), 69 deletions(-)

diff --git a/target/microblaze/cpu.h b/target/microblaze/cpu.h
index 83fadd36a5..63b8d93d41 100644
--- a/target/microblaze/cpu.h
+++ b/target/microblaze/cpu.h
@@ -79,10 +79,13 @@ typedef struct CPUMBState CPUMBState;
 
 /* Exception State Register (ESR) Fields */
 #define          ESR_DIZ       (1<<11) /* Zone Protection */
+#define          ESR_W         (1<<11) /* Unaligned word access */
 #define          ESR_S         (1<<10) /* Store instruction */
 
 #define          ESR_ESS_FSL_OFFSET     5
 
+#define          ESR_ESS_MASK  (0x7f << 5)
+
 #define          ESR_EC_FSL             0
 #define          ESR_EC_UNALIGNED_DATA  1
 #define          ESR_EC_ILLEGAL_OP      2
@@ -256,9 +259,11 @@ struct CPUMBState {
     /* Internal flags.  */
 #define IMM_FLAG        (1 << 0)
 #define BIMM_FLAG       (1 << 1)
-/* MSR_EE               (1 << 8)  */
+#define ESR_ESS_FLAG    (1 << 2)  /* indicates ESR_ESS_MASK is present */
+/* MSR_EE               (1 << 8)  -- these 3 are not in iflags but tb_flags */
 /* MSR_UM               (1 << 11) */
 /* MSR_VM               (1 << 13) */
+/* ESR_ESS_MASK         [11:5]    -- unwind into iflags for unaligned excp */
 #define DRTI_FLAG	(1 << 16)
 #define DRTE_FLAG	(1 << 17)
 #define DRTB_FLAG	(1 << 18)
@@ -330,6 +335,9 @@ struct MicroBlazeCPU {
 
 void mb_cpu_do_interrupt(CPUState *cs);
 bool mb_cpu_exec_interrupt(CPUState *cs, int int_req);
+void mb_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
+                                MMUAccessType access_type,
+                                int mmu_idx, uintptr_t retaddr);
 void mb_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
 hwaddr mb_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 int mb_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
diff --git a/target/microblaze/helper.h b/target/microblaze/helper.h
index a473c1867b..3980fba797 100644
--- a/target/microblaze/helper.h
+++ b/target/microblaze/helper.h
@@ -25,7 +25,6 @@ DEF_HELPER_3(mmu_read, i32, env, i32, i32)
 DEF_HELPER_4(mmu_write, void, env, i32, i32, i32)
 #endif
 
-DEF_HELPER_5(memalign, void, env, tl, i32, i32, i32)
 DEF_HELPER_FLAGS_2(stackprot, TCG_CALL_NO_WG, void, env, tl)
 
 DEF_HELPER_2(get, i32, i32, i32)
diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
index 1eabf5cc3f..67017ecc33 100644
--- a/target/microblaze/cpu.c
+++ b/target/microblaze/cpu.c
@@ -317,6 +317,7 @@ static void mb_cpu_class_init(ObjectClass *oc, void *data)
     cc->class_by_name = mb_cpu_class_by_name;
     cc->has_work = mb_cpu_has_work;
     cc->do_interrupt = mb_cpu_do_interrupt;
+    cc->do_unaligned_access = mb_cpu_do_unaligned_access;
     cc->cpu_exec_interrupt = mb_cpu_exec_interrupt;
     cc->dump_state = mb_cpu_dump_state;
     cc->set_pc = mb_cpu_set_pc;
diff --git a/target/microblaze/helper.c b/target/microblaze/helper.c
index 06f4322e09..0e3be251a7 100644
--- a/target/microblaze/helper.c
+++ b/target/microblaze/helper.c
@@ -296,3 +296,31 @@ bool mb_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
     }
     return false;
 }
+
+void mb_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
+                                MMUAccessType access_type,
+                                int mmu_idx, uintptr_t retaddr)
+{
+    MicroBlazeCPU *cpu = MICROBLAZE_CPU(cs);
+    uint32_t esr, iflags;
+
+    /* Recover the pc and iflags from the corresponding insn_start.  */
+    cpu_restore_state(cs, retaddr, true);
+    iflags = cpu->env.iflags;
+
+    qemu_log_mask(CPU_LOG_INT,
+                  "Unaligned access addr=" TARGET_FMT_lx
+                  " pc=%x iflags=%x\n", addr, cpu->env.pc, iflags);
+
+    esr = ESR_EC_UNALIGNED_DATA;
+    if (likely(iflags & ESR_ESS_FLAG)) {
+        esr |= iflags & ESR_ESS_MASK;
+    } else {
+        qemu_log_mask(LOG_UNIMP, "Unaligned access without ESR_ESS_FLAG\n");
+    }
+
+    cpu->env.ear = addr;
+    cpu->env.esr = esr;
+    cs->exception_index = EXCP_HW_EXCP;
+    cpu_loop_exit(cs);
+}
diff --git a/target/microblaze/op_helper.c b/target/microblaze/op_helper.c
index e6dcc79243..4614e99db3 100644
--- a/target/microblaze/op_helper.c
+++ b/target/microblaze/op_helper.c
@@ -365,27 +365,6 @@ uint32_t helper_pcmpbf(uint32_t a, uint32_t b)
     return 0;
 }
 
-void helper_memalign(CPUMBState *env, target_ulong addr,
-                     uint32_t dr, uint32_t wr,
-                     uint32_t mask)
-{
-    if (addr & mask) {
-            qemu_log_mask(CPU_LOG_INT,
-                          "unaligned access addr=" TARGET_FMT_lx
-                          " mask=%x, wr=%d dr=r%d\n",
-                          addr, mask, wr, dr);
-            env->ear = addr;
-            env->esr = ESR_EC_UNALIGNED_DATA | (wr << 10) | (dr & 31) << 5;
-            if (mask == 3) {
-                env->esr |= 1 << 11;
-            }
-            if (!(env->msr & MSR_EE)) {
-                return;
-            }
-            helper_raise_exception(env, EXCP_HW_EXCP);
-    }
-}
-
 void helper_stackprot(CPUMBState *env, target_ulong addr)
 {
     if (addr < env->slr || addr > env->shr) {
diff --git a/target/microblaze/translate.c b/target/microblaze/translate.c
index d2ee163294..597b96ffb3 100644
--- a/target/microblaze/translate.c
+++ b/target/microblaze/translate.c
@@ -751,10 +751,22 @@ static TCGv compute_ldst_addr_ea(DisasContext *dc, int ra, int rb)
     return ret;
 }
 
+static void record_unaligned_ess(DisasContext *dc, int rd,
+                                 MemOp size, bool store)
+{
+    uint32_t iflags = tcg_get_insn_start_param(dc->insn_start, 1);
+
+    iflags |= ESR_ESS_FLAG;
+    iflags |= rd << 5;
+    iflags |= store * ESR_S;
+    iflags |= (size == MO_32) * ESR_W;
+
+    tcg_set_insn_start_param(dc->insn_start, 1, iflags);
+}
+
 static bool do_load(DisasContext *dc, int rd, TCGv addr, MemOp mop,
                     int mem_index, bool rev)
 {
-    TCGv_i32 v;
     MemOp size = mop & MO_SIZE;
 
     /*
@@ -774,34 +786,15 @@ static bool do_load(DisasContext *dc, int rd, TCGv addr, MemOp mop,
 
     sync_jmpstate(dc);
 
-    /*
-     * Microblaze gives MMU faults priority over faults due to
-     * unaligned addresses. That's why we speculatively do the load
-     * into v. If the load succeeds, we verify alignment of the
-     * address and if that succeeds we write into the destination reg.
-     */
-    v = tcg_temp_new_i32();
-    tcg_gen_qemu_ld_i32(v, addr, mem_index, mop);
-
-    /* TODO: Convert to CPUClass::do_unaligned_access.  */
-    if (dc->cpu->cfg.unaligned_exceptions && size > MO_8) {
-        TCGv_i32 t0 = tcg_const_i32(0);
-        TCGv_i32 treg = tcg_const_i32(rd);
-        TCGv_i32 tsize = tcg_const_i32((1 << size) - 1);
-
-        tcg_gen_movi_i32(cpu_pc, dc->base.pc_next);
-        gen_helper_memalign(cpu_env, addr, treg, t0, tsize);
-
-        tcg_temp_free_i32(t0);
-        tcg_temp_free_i32(treg);
-        tcg_temp_free_i32(tsize);
+    if (size > MO_8 &&
+        (dc->tb_flags & MSR_EE) &&
+        dc->cpu->cfg.unaligned_exceptions) {
+        record_unaligned_ess(dc, rd, size, false);
+        mop |= MO_ALIGN;
     }
 
-    if (rd) {
-        tcg_gen_mov_i32(cpu_R[rd], v);
-    }
+    tcg_gen_qemu_ld_i32(reg_for_write(dc, rd), addr, mem_index, mop);
 
-    tcg_temp_free_i32(v);
     tcg_temp_free(addr);
     return true;
 }
@@ -931,28 +924,15 @@ static bool do_store(DisasContext *dc, int rd, TCGv addr, MemOp mop,
 
     sync_jmpstate(dc);
 
-    tcg_gen_qemu_st_i32(reg_for_read(dc, rd), addr, mem_index, mop);
-
-    /* TODO: Convert to CPUClass::do_unaligned_access.  */
-    if (dc->cpu->cfg.unaligned_exceptions && size > MO_8) {
-        TCGv_i32 t1 = tcg_const_i32(1);
-        TCGv_i32 treg = tcg_const_i32(rd);
-        TCGv_i32 tsize = tcg_const_i32((1 << size) - 1);
-
-        tcg_gen_movi_i32(cpu_pc, dc->base.pc_next);
-        /* FIXME: if the alignment is wrong, we should restore the value
-         *        in memory. One possible way to achieve this is to probe
-         *        the MMU prior to the memaccess, thay way we could put
-         *        the alignment checks in between the probe and the mem
-         *        access.
-         */
-        gen_helper_memalign(cpu_env, addr, treg, t1, tsize);
-
-        tcg_temp_free_i32(t1);
-        tcg_temp_free_i32(treg);
-        tcg_temp_free_i32(tsize);
+    if (size > MO_8 &&
+        (dc->tb_flags & MSR_EE) &&
+        dc->cpu->cfg.unaligned_exceptions) {
+        record_unaligned_ess(dc, rd, size, true);
+        mop |= MO_ALIGN;
     }
 
+    tcg_gen_qemu_st_i32(reg_for_read(dc, rd), addr, mem_index, mop);
+
     tcg_temp_free(addr);
     return true;
 }
-- 
2.25.1


