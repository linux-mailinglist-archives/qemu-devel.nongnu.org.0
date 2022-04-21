Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8609F50A4AE
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 17:50:42 +0200 (CEST)
Received: from localhost ([::1]:47908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhZ4r-0004zr-Jt
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 11:50:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhYZq-0008VM-WF
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:18:39 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:40514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhYZo-0006O6-Sd
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:18:38 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 md20-20020a17090b23d400b001cb70ef790dso8004635pjb.5
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 08:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Yd0irHT+JM82G1zADs5FXAR4v7VrqIr0k9G1Q4ZBll8=;
 b=WIOdYvK4mncHUsb25ldvaIJLBSQm224PNoXwdkHycVIQRTYf4nbUZktdUZRclvm9LA
 PV6MJii9RR53mnU76h6FuEPhCM/ZvoFRS1H0dxd6zX77S7acz3tXetkEtyVx8uBszocK
 XQzqzfgIg0hW8SPcNVpPxG/KiTQgxxFfF7cGjXUPDPMHZfvceFDFA/RO1IM/CLGH+eSe
 2KYGwCIZcbAdiKpJOjzga5xWgreL/TUycOkWzouabZqhAeZ3WIEyXCiSPMnziHpFmxqf
 LQPVAjzTWsTIyCWpaSXGnZ+SG/I8lNO0O65s64VNZU7FMGZMFEu+a3lXChHQn2QcFVPG
 G9hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Yd0irHT+JM82G1zADs5FXAR4v7VrqIr0k9G1Q4ZBll8=;
 b=DCU4CKtsZwpa2K/PFe6s8v/9NMS8De7QCm4P4bXYJWzGBxCb33gGjSw6o8TjMtFm0L
 PTruo+ODrQ8eVrwNV6VcGyNksP/dMChiIAsbfopPaOYmtxOA9pxmZ10d+Uu7ogAhW4Mb
 +hLd10918bqhffr5MAn8g6gn+zYj3fJmYGIylShpcCz91YZQBvru8bexQ7KDAuJoOIs8
 cPCBYFsi8cMcoOeoGYtB7wV/QkF80oSvw+lzGA8DXRQSkEEcYj1+7LC2jE4/zIpFEuhe
 R239fhaJ9air7UfoiHclZXhEiQ71sCME4PE3vvnp6846abE7JSE+uNco4z+PX0w2kmsH
 G2dA==
X-Gm-Message-State: AOAM532BWJ1tfYgNPn6kxG70N4fW8HbTpo8MQReT96sdRjzcZmbKRgSc
 w/aWCdng2nHWSj68rISYyTsAi03NgLPnmg==
X-Google-Smtp-Source: ABdhPJwKr4EFJtVqXkyy7D3ltO4dTtF9CqCdmBDUJ7esewDRsyELk4akO46Y5zgtP9KjWLQqnzavJw==
X-Received: by 2002:a17:90a:eb0e:b0:1cb:7d07:52f6 with SMTP id
 j14-20020a17090aeb0e00b001cb7d0752f6mr11072778pjz.66.1650554315455; 
 Thu, 21 Apr 2022 08:18:35 -0700 (PDT)
Received: from stoup.. ([2607:fb90:80c8:6cf3:a91a:4957:ba18:ac18])
 by smtp.gmail.com with ESMTPSA id
 z16-20020a056a00241000b004f3a647ae89sm24616248pfh.174.2022.04.21.08.18.33
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 08:18:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 37/64] target/nios2: Prevent writes to read-only or
 reserved control fields
Date: Thu, 21 Apr 2022 08:17:08 -0700
Message-Id: <20220421151735.31996-38-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220421151735.31996-1-richard.henderson@linaro.org>
References: <20220421151735.31996-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Create an array of masks which detail the writable and readonly
bits for each control register.  Apply them when writing to
control registers, including the write to status during eret.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/cpu.h       |  13 +++++
 target/nios2/cpu.c       | 100 +++++++++++++++++++++++++++++++++------
 target/nios2/op_helper.c |   9 ++++
 target/nios2/translate.c |  80 ++++++++++++++++++++++++-------
 4 files changed, 171 insertions(+), 31 deletions(-)

diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index 7189f9a45f..5f6b9242a2 100644
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


