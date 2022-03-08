Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 004694D1125
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 08:37:59 +0100 (CET)
Received: from localhost ([::1]:33212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRUPv-0005e3-21
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 02:37:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRU9F-0005GD-OG
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 02:20:46 -0500
Received: from [2607:f8b0:4864:20::102a] (port=36508
 helo=mail-pj1-x102a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRU97-0006ND-RS
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 02:20:40 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 kx6-20020a17090b228600b001bf859159bfso1460479pjb.1
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 23:20:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QZ5JgxKTY6j7jOJgJ2ehiBZmm45GMeMFdXbMkDT92PE=;
 b=pL57muVPbQr3X7kkMQK/lQZjDhg9ssh0J9C0NNjEdu0CPI2fsGtZyuMsvMvgpZm9lY
 cQk9s1JM8UvufX2FYgozpSsnKlUsEkUaOFWFy7vkbr8RrKEBtYVJ0HgXhQMAfJy/NFFi
 QW4F5rPcXr/ZvtwjShsTB2EbvHONm3oBfmTsbd861XgaDBaE3ZLZYmDSlvmUJ29Q9sq0
 5I18owchR9G75qOcG1IYdvRvZ73P8xYDHxFEqtL86cos85eBJN6t3l+qF7maC7KIU+Ry
 doz/X0+tI+H7sFT3RXHnPTkbLT3s1Dv1WAV/D3T3A2lFMhyYHDF63u3+R/YltC+NtEa+
 Ly6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QZ5JgxKTY6j7jOJgJ2ehiBZmm45GMeMFdXbMkDT92PE=;
 b=v+9Cxqe19O88sBmMrCo8lCKpZaLtmWe6UuMADyOjmEUtU+4vH2D59YzQbc1kyzzsaY
 TafUms4fXc2F1FoVbkdiOLjILT+DLc0mmeRqqmKGBUW/dz8bOQ7IXscrWjmnFLvxS9gO
 wJ0rdNZ1DIX9Xg0w9MVfasr+/7co1Qs966uh6EqVTu2/+BUPKHZEQ6Y97SbaF9Vik47a
 vU5+VAm1Ae4MshGQVJUzhJ3ciTA6gIlTeEX7EO+ELchmMrAygWbaJpQUoiV/4pVv8i7O
 uPuKn89KtNpwl8US8SXHw2L5pplNuyuJZhDcltTPC9x83FVMxYKpGbsYnNLMqb7PpqrD
 zolw==
X-Gm-Message-State: AOAM532oIAzMHY0OnENe/sBaI3UNV+CuhFInlH3lJMZbXc8k4jBQyEBQ
 qf2Fj4ZjJ4fQ8vptP9f1ph4gKiW16xCSzw==
X-Google-Smtp-Source: ABdhPJwQUj5TtnUCz7uxrD8yi9d7ALgHKXbSqz2AUg45C3YQTGxM+VuUdjq6UlFlgtLE0/w4+7AZ/Q==
X-Received: by 2002:a17:90b:3a85:b0:1bf:929c:1b1e with SMTP id
 om5-20020a17090b3a8500b001bf929c1b1emr427661pjb.200.1646724036078; 
 Mon, 07 Mar 2022 23:20:36 -0800 (PST)
Received: from localhost.localdomain (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 p125-20020a622983000000b004f6c5d58225sm13790899pfp.90.2022.03.07.23.20.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 23:20:35 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 17/33] target/nios2: Prevent writes to read-only or
 reserved control fields
Date: Mon,  7 Mar 2022 21:19:49 -1000
Message-Id: <20220308072005.307955-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220308072005.307955-1-richard.henderson@linaro.org>
References: <20220308072005.307955-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: marex@denx.de, peter.maydell@linaro.org, amir.gonnen@neuroblade.ai
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Create an array of masks which detail the writable and readonly
bits for each control register.  Apply them when writing to
control registers.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/cpu.h       | 13 ++++++
 target/nios2/cpu.c       | 90 +++++++++++++++++++++++++++++++++-------
 target/nios2/translate.c | 80 ++++++++++++++++++++++++++++-------
 3 files changed, 152 insertions(+), 31 deletions(-)

diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index 927c4aaa80..7faec97d77 100644
--- a/target/nios2/cpu.h
+++ b/target/nios2/cpu.h
@@ -207,6 +207,11 @@ struct CPUNios2State {
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
@@ -230,9 +235,17 @@ struct Nios2CPU {
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
index f2813d3b47..189adf111c 100644
--- a/target/nios2/cpu.c
+++ b/target/nios2/cpu.c
@@ -88,6 +88,55 @@ static void nios2_cpu_initfn(Object *obj)
 
     cpu_set_cpustate_pointers(cpu);
 
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
+    WR_FIELD(CR_EXCEPTION, CAUSE);
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
+        WR_FIELD(CR_TLBMISC, WR);
+        WR_FIELD(CR_TLBMISC, RD);
+        WR_FIELD(CR_TLBMISC, WAY);
+
+        WR_REG(CR_TLBACC);
+    }
+
+    /* TODO: ECC and MPU not implemented. */
+
+#undef WR_REG
+#undef RO_REG
+#undef WR_FIELD
+#undef RO_FIELD
+
 #if !defined(CONFIG_USER_ONLY)
     mmu_init(&cpu->env);
 
@@ -152,23 +201,26 @@ static void nios2_cpu_disas_set_info(CPUState *cpu, disassemble_info *info)
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
@@ -176,17 +228,25 @@ static int nios2_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
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
diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index 77b3bf05f3..38e16df459 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -101,6 +101,7 @@ typedef struct DisasContext {
     TCGv_i32          zero;
     target_ulong      pc;
     int               mem_idx;
+    const ControlRegState *cr_state;
 } DisasContext;
 
 static TCGv cpu_R[NUM_GP_REGS];
@@ -452,17 +453,26 @@ static void callr(DisasContext *dc, uint32_t code, uint32_t flags)
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
@@ -486,6 +496,7 @@ static void rdctl(DisasContext *dc, uint32_t code, uint32_t flags)
                       offsetof(CPUNios2State, ctrl[instr.imm5]));
         break;
     }
+#endif
 }
 
 /* ctlN <- rA */
@@ -500,6 +511,14 @@ static void wrctl(DisasContext *dc, uint32_t code, uint32_t flags)
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
@@ -511,17 +530,35 @@ static void wrctl(DisasContext *dc, uint32_t code, uint32_t flags)
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
@@ -785,9 +822,11 @@ static void nios2_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
 {
     DisasContext *dc = container_of(dcbase, DisasContext, base);
     CPUNios2State *env = cs->env_ptr;
+    Nios2CPU *cpu = env_archcpu(env);
     int page_insns;
 
     dc->mem_idx = cpu_mmu_index(env, false);
+    dc->cr_state = cpu->cr_state;
 
     /* Bound the number of insns to execute to those left on the page.  */
     page_insns = -(dc->base.pc_first | TARGET_PAGE_MASK) / 4;
@@ -902,16 +941,25 @@ void nios2_cpu_dump_state(CPUState *cs, FILE *f, int flags)
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
2.25.1


