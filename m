Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 159F350BE7A
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 19:20:45 +0200 (CEST)
Received: from localhost ([::1]:56392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhwxY-0007PA-5w
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 13:20:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhwXV-0002M5-9F
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 12:53:50 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:33622)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhwXT-0007Me-1I
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 12:53:48 -0400
Received: by mail-pf1-x431.google.com with SMTP id c1so1997126pfo.0
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 09:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=b91HmxjG0u6CLiTBN86Gl9ydinvbPQB9WXtZ8LXqaK4=;
 b=rlf3kvE1Vi+GW3k1dvTBULvkHHXAVaQMGZTzNFmpv0IbVwcLQoAIgzlfZCIvdlObmJ
 mU4aBXQL274qaec8j+Gxh21q/g4gpwECQ9j1BDgS6jDz/o02FlkukXb+JluvgX97VqXo
 zzX2WC1/h0+Cm9AHDuR2pOoMFbRVeZg9WN3M5f6XfXIe+bdMH4RcPCw0HiY9G/6nu1YV
 OLZhI86mNgyKWx3pcD5Ap8tPGCnnEwc90YFY1O42dDF6bscye4hF4E/5NvwOWyaciU6C
 6+VVhGNmizNAhHmXJo1sMu0hvtKUKb5BjfchERgKGxW1G2sWU8Ras6cLARhPkt6FxGJm
 xJyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=b91HmxjG0u6CLiTBN86Gl9ydinvbPQB9WXtZ8LXqaK4=;
 b=w8EcSOHCuKAp3q5YI1nSWzYEWPa0HAQQK4Kriiyj6JRfrnkE8Q/DAMlCgjgNmdmpe6
 mShIMpGJzI1rXBECqK7r0SXq0PrFfc3mqRZDM/3vr5JREtDpk2Bk+7AD3Ea+a/4mSvoU
 oH7uWJUmXxe1tyfCZcclvWTbq5TwxPx8tYaD6pEoj87ai/Sqd/HrJFoEoVYy7lr9jM5V
 eAWpVDPxsmCDT67BqZqeQpnBmltno/wj/TXeKnEZwQJt9zi9W9/JaWRspwETrqqMaBkd
 JFzXuJpdhRDrZW17aoaG3I86M8DzRuIPn6nCLFE3JnO4ExuuKTr9GhJyWol4aUANHzJ5
 whqg==
X-Gm-Message-State: AOAM531u9dpbhbv5nrd28Ka9JIV3nR5+GrIO1AsaaAJ6Xa0lpAwipuDv
 A++FFT6xkOWgwX5dICdVrP4l374wwxI1N1vX
X-Google-Smtp-Source: ABdhPJyTgLiG+4DNcLQ8fzTQS8UwmqzadIHhnlHSZzvIqpTyPKtaVdHGeg9UH59jlVUmYPoHZ9Mrmg==
X-Received: by 2002:aa7:8241:0:b0:509:979d:c760 with SMTP id
 e1-20020aa78241000000b00509979dc760mr5797955pfn.84.1650646425741; 
 Fri, 22 Apr 2022 09:53:45 -0700 (PDT)
Received: from stoup.. ([2607:fb90:27d0:b0f2:934d:3e2:9f8c:dd1])
 by smtp.gmail.com with ESMTPSA id
 6-20020a17090a030600b001cd4989ff5fsm6835904pje.38.2022.04.22.09.53.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 09:53:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 37/68] target/nios2: Prevent writes to read-only or
 reserved control fields
Date: Fri, 22 Apr 2022 09:52:07 -0700
Message-Id: <20220422165238.1971496-38-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220422165238.1971496-1-richard.henderson@linaro.org>
References: <20220422165238.1971496-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Create an array of masks which detail the writable and readonly
bits for each control register.  Apply them when writing to
control registers, including the write to status during eret.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20220421151735.31996-38-richard.henderson@linaro.org>
---
 target/nios2/cpu.h       |  13 +++++
 target/nios2/cpu.c       | 100 +++++++++++++++++++++++++++++++++------
 target/nios2/op_helper.c |   9 ++++
 target/nios2/translate.c |  80 ++++++++++++++++++++++++-------
 4 files changed, 171 insertions(+), 31 deletions(-)

diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index 0027416742..da85d82faa 100644
--- a/target/nios2/cpu.h
+++ b/target/nios2/cpu.h
@@ -190,6 +190,11 @@ struct CPUArchState {
     int error_code;
 };
 
+typedef struct {
+    uint32_t writable;
+    uint32_t readonly;
+} ControlRegState;
+
 /**
  * Nios2CPU:
  * @env: #CPUNios2State
@@ -213,9 +218,17 @@ struct ArchCPU {
     uint32_t reset_addr;
     uint32_t exception_addr;
     uint32_t fast_tlb_miss_addr;
+
+    /* Bits within each control register which are reserved or readonly. */
+    ControlRegState cr_state[NUM_CR_REGS];
 };
 
 
+static inline bool nios2_cr_reserved(const ControlRegState *s)
+{
+    return (s->writable | s->readonly) == 0;
+}
+
 void nios2_tcg_init(void);
 void nios2_cpu_do_interrupt(CPUState *cs);
 void dump_mmu(CPUNios2State *env);
diff --git a/target/nios2/cpu.c b/target/nios2/cpu.c
index fce16a2e77..b3c5ae681c 100644
--- a/target/nios2/cpu.c
+++ b/target/nios2/cpu.c
@@ -102,6 +102,64 @@ static ObjectClass *nios2_cpu_class_by_name(const char *cpu_model)
     return object_class_by_name(TYPE_NIOS2_CPU);
 }
 
+static void realize_cr_status(CPUState *cs)
+{
+    Nios2CPU *cpu = NIOS2_CPU(cs);
+
+    /* Begin with all fields of all registers are reserved. */
+    memset(cpu->cr_state, 0, sizeof(cpu->cr_state));
+
+    /*
+     * The combination of writable and readonly is the set of all
+     * non-reserved fields.  We apply writable as a mask to bits,
+     * and merge in existing readonly bits, before storing.
+     */
+#define WR_REG(C)       cpu->cr_state[C].writable = -1
+#define RO_REG(C)       cpu->cr_state[C].readonly = -1
+#define WR_FIELD(C, F)  cpu->cr_state[C].writable |= R_##C##_##F##_MASK
+#define RO_FIELD(C, F)  cpu->cr_state[C].readonly |= R_##C##_##F##_MASK
+
+    WR_FIELD(CR_STATUS, PIE);
+    WR_REG(CR_ESTATUS);
+    WR_REG(CR_BSTATUS);
+    RO_REG(CR_CPUID);
+    RO_REG(CR_EXCEPTION);
+    WR_REG(CR_BADADDR);
+
+    /* TODO: These control registers are not present with the EIC. */
+    WR_REG(CR_IENABLE);
+    RO_REG(CR_IPENDING);
+
+    if (cpu->mmu_present) {
+        WR_FIELD(CR_STATUS, U);
+        WR_FIELD(CR_STATUS, EH);
+
+        WR_FIELD(CR_PTEADDR, VPN);
+        WR_FIELD(CR_PTEADDR, PTBASE);
+
+        RO_FIELD(CR_TLBMISC, D);
+        RO_FIELD(CR_TLBMISC, PERM);
+        RO_FIELD(CR_TLBMISC, BAD);
+        RO_FIELD(CR_TLBMISC, DBL);
+        WR_FIELD(CR_TLBMISC, PID);
+        WR_FIELD(CR_TLBMISC, WE);
+        WR_FIELD(CR_TLBMISC, RD);
+        WR_FIELD(CR_TLBMISC, WAY);
+
+        WR_REG(CR_TLBACC);
+    }
+
+    /*
+     * TODO: ECC (config, eccinj) and MPU (config, mpubase, mpuacc) are
+     * unimplemented, so their corresponding control regs remain reserved.
+     */
+
+#undef WR_REG
+#undef RO_REG
+#undef WR_FIELD
+#undef RO_FIELD
+}
+
 static void nios2_cpu_realizefn(DeviceState *dev, Error **errp)
 {
     CPUState *cs = CPU(dev);
@@ -114,6 +172,7 @@ static void nios2_cpu_realizefn(DeviceState *dev, Error **errp)
         return;
     }
 
+    realize_cr_status(cs);
     qemu_init_vcpu(cs);
     cpu_reset(cs);
 
@@ -147,23 +206,26 @@ static void nios2_cpu_disas_set_info(CPUState *cpu, disassemble_info *info)
 static int nios2_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
 {
     Nios2CPU *cpu = NIOS2_CPU(cs);
-    CPUClass *cc = CPU_GET_CLASS(cs);
     CPUNios2State *env = &cpu->env;
+    uint32_t val;
 
-    if (n > cc->gdb_num_core_regs) {
+    if (n < 32) {          /* GP regs */
+        val = env->regs[n];
+    } else if (n == 32) {    /* PC */
+        val = env->pc;
+    } else if (n < 49) {     /* Status regs */
+        unsigned cr = n - 33;
+        if (nios2_cr_reserved(&cpu->cr_state[cr])) {
+            val = 0;
+        } else {
+            val = env->ctrl[n - 33];
+        }
+    } else {
+        /* Invalid regs */
         return 0;
     }
 
-    if (n < 32) {          /* GP regs */
-        return gdb_get_reg32(mem_buf, env->regs[n]);
-    } else if (n == 32) {    /* PC */
-        return gdb_get_reg32(mem_buf, env->pc);
-    } else if (n < 49) {     /* Status regs */
-        return gdb_get_reg32(mem_buf, env->ctrl[n - 33]);
-    }
-
-    /* Invalid regs */
-    return 0;
+    return gdb_get_reg32(mem_buf, val);
 }
 
 static int nios2_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
@@ -171,17 +233,25 @@ static int nios2_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
     Nios2CPU *cpu = NIOS2_CPU(cs);
     CPUClass *cc = CPU_GET_CLASS(cs);
     CPUNios2State *env = &cpu->env;
+    uint32_t val;
 
     if (n > cc->gdb_num_core_regs) {
         return 0;
     }
+    val = ldl_p(mem_buf);
 
     if (n < 32) {            /* GP regs */
-        env->regs[n] = ldl_p(mem_buf);
+        env->regs[n] = val;
     } else if (n == 32) {    /* PC */
-        env->pc = ldl_p(mem_buf);
+        env->pc = val;
     } else if (n < 49) {     /* Status regs */
-        env->ctrl[n - 33] = ldl_p(mem_buf);
+        unsigned cr = n - 33;
+        /* ??? Maybe allow the debugger to write to readonly fields. */
+        val &= cpu->cr_state[cr].writable;
+        val |= cpu->cr_state[cr].readonly & env->ctrl[cr];
+        env->ctrl[cr] = val;
+    } else {
+        g_assert_not_reached();
     }
 
     return 4;
diff --git a/target/nios2/op_helper.c b/target/nios2/op_helper.c
index 08ed3b4598..49fccf2c2c 100644
--- a/target/nios2/op_helper.c
+++ b/target/nios2/op_helper.c
@@ -34,6 +34,15 @@ void helper_raise_exception(CPUNios2State *env, uint32_t index)
 #ifndef CONFIG_USER_ONLY
 void helper_eret(CPUNios2State *env, uint32_t new_status, uint32_t new_pc)
 {
+    Nios2CPU *cpu = env_archcpu(env);
+
+    /*
+     * Both estatus and bstatus have no constraints on write;
+     * do not allow reserved fields in status to be set.
+     * TODO: more than this is required for shadow registers.
+     */
+    new_status &= cpu->cr_state[CR_STATUS].writable;
+
     env->ctrl[CR_STATUS] = new_status;
     env->pc = new_pc;
     cpu_loop_exit(env_cpu(env));
diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index 97e531529f..b8d75207a4 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -102,6 +102,7 @@ typedef struct DisasContext {
     TCGv_i32          zero;
     target_ulong      pc;
     int               mem_idx;
+    const ControlRegState *cr_state;
 } DisasContext;
 
 static TCGv cpu_R[NUM_GP_REGS];
@@ -471,17 +472,26 @@ static void callr(DisasContext *dc, uint32_t code, uint32_t flags)
 /* rC <- ctlN */
 static void rdctl(DisasContext *dc, uint32_t code, uint32_t flags)
 {
-    R_TYPE(instr, code);
-    TCGv t1, t2;
-
     if (!gen_check_supervisor(dc)) {
         return;
     }
 
+#ifdef CONFIG_USER_ONLY
+    g_assert_not_reached();
+#else
+    R_TYPE(instr, code);
+    TCGv t1, t2;
+
     if (unlikely(instr.c == R_ZERO)) {
         return;
     }
 
+    /* Reserved registers read as zero. */
+    if (nios2_cr_reserved(&dc->cr_state[instr.imm5])) {
+        tcg_gen_movi_tl(cpu_R[instr.c], 0);
+        return;
+    }
+
     switch (instr.imm5) {
     case CR_IPENDING:
         /*
@@ -505,6 +515,7 @@ static void rdctl(DisasContext *dc, uint32_t code, uint32_t flags)
                       offsetof(CPUNios2State, ctrl[instr.imm5]));
         break;
     }
+#endif
 }
 
 /* ctlN <- rA */
@@ -519,6 +530,14 @@ static void wrctl(DisasContext *dc, uint32_t code, uint32_t flags)
 #else
     R_TYPE(instr, code);
     TCGv v = load_gpr(dc, instr.a);
+    uint32_t ofs = offsetof(CPUNios2State, ctrl[instr.imm5]);
+    uint32_t wr = dc->cr_state[instr.imm5].writable;
+    uint32_t ro = dc->cr_state[instr.imm5].readonly;
+
+    /* Skip reserved or readonly registers. */
+    if (wr == 0) {
+        return;
+    }
 
     switch (instr.imm5) {
     case CR_PTEADDR:
@@ -530,17 +549,35 @@ static void wrctl(DisasContext *dc, uint32_t code, uint32_t flags)
     case CR_TLBMISC:
         gen_helper_mmu_write_tlbmisc(cpu_env, v);
         break;
-    case CR_IPENDING:
-        /* ipending is read only, writes ignored. */
-        break;
     case CR_STATUS:
     case CR_IENABLE:
         /* If interrupts were enabled using WRCTL, trigger them. */
         dc->base.is_jmp = DISAS_UPDATE;
         /* fall through */
     default:
-        tcg_gen_st_tl(v, cpu_env,
-                      offsetof(CPUNios2State, ctrl[instr.imm5]));
+        if (wr == -1) {
+            /* The register is entirely writable. */
+            tcg_gen_st_tl(v, cpu_env, ofs);
+        } else {
+            /*
+             * The register is partially read-only or reserved:
+             * merge the value.
+             */
+            TCGv n = tcg_temp_new();
+
+            tcg_gen_andi_tl(n, v, wr);
+
+            if (ro != 0) {
+                TCGv o = tcg_temp_new();
+                tcg_gen_ld_tl(o, cpu_env, ofs);
+                tcg_gen_andi_tl(o, o, ro);
+                tcg_gen_or_tl(n, n, o);
+                tcg_temp_free(o);
+            }
+
+            tcg_gen_st_tl(n, cpu_env, ofs);
+            tcg_temp_free(n);
+        }
         break;
     }
 #endif
@@ -818,9 +855,11 @@ static void nios2_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
 {
     DisasContext *dc = container_of(dcbase, DisasContext, base);
     CPUNios2State *env = cs->env_ptr;
+    Nios2CPU *cpu = env_archcpu(env);
     int page_insns;
 
     dc->mem_idx = cpu_mmu_index(env, false);
+    dc->cr_state = cpu->cr_state;
 
     /* Bound the number of insns to execute to those left on the page.  */
     page_insns = -(dc->base.pc_first | TARGET_PAGE_MASK) / 4;
@@ -932,16 +971,25 @@ void nios2_cpu_dump_state(CPUState *cs, FILE *f, int flags)
     }
 
 #if !defined(CONFIG_USER_ONLY)
-    for (i = 0; i < NUM_CR_REGS; i++) {
-        qemu_fprintf(f, "%9s=%8.8x ", cr_regnames[i], env->ctrl[i]);
-        if ((i + 1) % 4 == 0) {
-            qemu_fprintf(f, "\n");
+    int j;
+
+    for (i = j = 0; i < NUM_CR_REGS; i++) {
+        if (!nios2_cr_reserved(&cpu->cr_state[i])) {
+            qemu_fprintf(f, "%9s=%8.8x ", cr_regnames[i], env->ctrl[i]);
+            if (++j % 4 == 0) {
+                qemu_fprintf(f, "\n");
+            }
         }
     }
-    qemu_fprintf(f, " mmu write: VPN=%05X PID %02X TLBACC %08X\n",
-                 env->mmu.pteaddr_wr & R_CR_PTEADDR_VPN_MASK,
-                 FIELD_EX32(env->mmu.tlbmisc_wr, CR_TLBMISC, PID),
-                 env->mmu.tlbacc_wr);
+    if (j % 4 != 0) {
+        qemu_fprintf(f, "\n");
+    }
+    if (cpu->mmu_present) {
+        qemu_fprintf(f, " mmu write: VPN=%05X PID %02X TLBACC %08X\n",
+                     env->mmu.pteaddr_wr & R_CR_PTEADDR_VPN_MASK,
+                     FIELD_EX32(env->mmu.tlbmisc_wr, CR_TLBMISC, PID),
+                     env->mmu.tlbacc_wr);
+    }
 #endif
     qemu_fprintf(f, "\n\n");
 }
-- 
2.34.1


