Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57DCF564686
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jul 2022 11:51:38 +0200 (CEST)
Received: from localhost ([::1]:35860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7wGP-0003XZ-Ek
	for lists+qemu-devel@lfdr.de; Sun, 03 Jul 2022 05:51:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7vSP-00050z-5K
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:59:58 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:43962)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7vSN-000495-8M
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:59:56 -0400
Received: by mail-pf1-x434.google.com with SMTP id g7so1604609pfb.10
 for <qemu-devel@nongnu.org>; Sun, 03 Jul 2022 01:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HHZ8mZXSfbHbPb+0SOnZD/cO7fq4POJ4YzIOL2R+a6o=;
 b=DvSMNIf4gYzGreVFBU2RrwUwBrR3cWxpOE6CSM7+ZfCtq9Wm7HgT1LmyzGl8JCWOtL
 Nw5b5KDH2liCXWk15uLMUFM3lbgwP8u1TXNrRhnKEE8Bw+uTQWDC5TqED6z/YRXuv3u2
 4r8EkOVBl8kADcPposVBTJTAC/BooeoXXHItY1io0SdNFnEMPmq/Q4053PpFc8N6ExjO
 bEDcv+/UQvzke205T2spshE8GL/jubjxn82y9BpyfvzAGQMBrjk4VlWkTFmMkdpu+MIE
 Yzzj7X1F2ACsov8XcocbFt/93nwRl/pE+Lq4pZIlU5RUjHGaKCZlgr4caVVX3v0PlCJO
 PsqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HHZ8mZXSfbHbPb+0SOnZD/cO7fq4POJ4YzIOL2R+a6o=;
 b=4X4NnKGa8H4f0GoCpaXy+jMGEC1N3H9o8umUjIq/GQjOHhBsgcW8cmhEDK6jo+b8Qt
 Pt8kkZQ+UjkAbrNd1iwMNaLbR+18vyMuVy18WkKG6A2pIwkUUX7o3r7mxqciKBEsANOv
 NpZX/YaZmIRno+/rxtepev+r00g8KW+YvV0JEgwzI4ItzgBOTi5U4azb97IakGmbcOqC
 jsUm4+ZfXNK7ldHkqf6EQ3wRCbUtc0+++Ze6mcBO/SmZE3sSUK6v18vYfnoSwUi6vU+L
 rQtK0JbVKNDJX7i4piB4DAXsRg26Ha0Ra2rMVX7qm9D9N+TrmDcRvAtQqr7pIp0dmH0A
 GRJA==
X-Gm-Message-State: AJIora+VNY/w5xEU3PcdWaAZSlhJfkolnxvZLaWW7rLlP3mUC4Fg4Y8m
 L0QtnThwyKxlGX8FURHi4HnH+DPAi2Sa7dWq
X-Google-Smtp-Source: AGRyM1vEnZ7lJHlCNdSLbQ/Df9LXxC1puf1RKQnd18r4flZDtRFnORBVtwTcOcHMWYI1PvFPKyCUQQ==
X-Received: by 2002:a63:5a49:0:b0:40d:e7a0:3cb with SMTP id
 k9-20020a635a49000000b0040de7a003cbmr19754605pgm.69.1656838794471; 
 Sun, 03 Jul 2022 01:59:54 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 cq16-20020a056a00331000b00518764d09cdsm18777593pfb.164.2022.07.03.01.59.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 01:59:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu, Song Gao <gaosong@loongson.cn>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>
Subject: [PATCH v21 11/13] target/loongarch: Adjust functions and structure to
 support user-mode
Date: Sun,  3 Jul 2022 14:29:11 +0530
Message-Id: <20220703085913.772936-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220703085913.772936-1-richard.henderson@linaro.org>
References: <20220703085913.772936-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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

From: Song Gao <gaosong@loongson.cn>

Some functions and member of the structure are different with softmmu-mode
So we need adjust them to support user-mode.

Signed-off-by: Song Gao <gaosong@loongson.cn>
Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220624031049.1716097-12-gaosong@loongson.cn>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/loongarch/cpu.h                        |  6 ++++
 target/loongarch/helper.h                     |  2 ++
 target/loongarch/internals.h                  |  2 ++
 target/loongarch/cpu.c                        | 21 ++++++++++-
 target/loongarch/op_helper.c                  |  6 ++++
 .../insn_trans/trans_privileged.c.inc         | 36 +++++++++++++++++++
 6 files changed, 72 insertions(+), 1 deletion(-)

diff --git a/target/loongarch/cpu.h b/target/loongarch/cpu.h
index 4b4fbcdc71..d141ec9b5d 100644
--- a/target/loongarch/cpu.h
+++ b/target/loongarch/cpu.h
@@ -301,6 +301,7 @@ typedef struct CPUArchState {
     uint64_t CSR_DERA;
     uint64_t CSR_DSAVE;
 
+#ifndef CONFIG_USER_ONLY
     LoongArchTLB  tlb[LOONGARCH_TLB_MAX];
 
     AddressSpace address_space_iocsr;
@@ -308,6 +309,7 @@ typedef struct CPUArchState {
     MemoryRegion iocsr_mem;
     bool load_elf;
     uint64_t elf_address;
+#endif
 } CPULoongArchState;
 
 /**
@@ -358,12 +360,16 @@ struct LoongArchCPUClass {
 
 static inline int cpu_mmu_index(CPULoongArchState *env, bool ifetch)
 {
+#ifdef CONFIG_USER_ONLY
+    return MMU_USER_IDX;
+#else
     uint8_t pg = FIELD_EX64(env->CSR_CRMD, CSR_CRMD, PG);
 
     if (!pg) {
         return MMU_DA_IDX;
     }
     return FIELD_EX64(env->CSR_CRMD, CSR_CRMD, PLV);
+#endif
 }
 
 static inline void cpu_get_tb_cpu_state(CPULoongArchState *env,
diff --git a/target/loongarch/helper.h b/target/loongarch/helper.h
index 85c11a60d4..cbbe008f32 100644
--- a/target/loongarch/helper.h
+++ b/target/loongarch/helper.h
@@ -95,6 +95,7 @@ DEF_HELPER_FLAGS_2(set_rounding_mode, TCG_CALL_NO_RWG, void, env, i32)
 
 DEF_HELPER_1(rdtime_d, i64, env)
 
+#ifndef CONFIG_USER_ONLY
 /* CSRs helper */
 DEF_HELPER_1(csrrd_pgd, i64, env)
 DEF_HELPER_1(csrrd_tval, i64, env)
@@ -128,3 +129,4 @@ DEF_HELPER_4(lddir, tl, env, tl, tl, i32)
 DEF_HELPER_4(ldpte, void, env, tl, tl, i32)
 DEF_HELPER_1(ertn, void, env)
 DEF_HELPER_1(idle, void, env)
+#endif
diff --git a/target/loongarch/internals.h b/target/loongarch/internals.h
index 9d50fbdd81..ea227362b6 100644
--- a/target/loongarch/internals.h
+++ b/target/loongarch/internals.h
@@ -33,6 +33,7 @@ const char *loongarch_exception_name(int32_t exception);
 
 void restore_fp_status(CPULoongArchState *env);
 
+#ifndef CONFIG_USER_ONLY
 extern const VMStateDescription vmstate_loongarch_cpu;
 
 void loongarch_cpu_set_irq(void *opaque, int irq, int level);
@@ -48,6 +49,7 @@ bool loongarch_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                             bool probe, uintptr_t retaddr);
 
 hwaddr loongarch_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
+#endif /* !CONFIG_USER_ONLY */
 
 int loongarch_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n);
 int loongarch_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n);
diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index bf163a8dce..47c0bdd1ac 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -82,6 +82,7 @@ static void loongarch_cpu_set_pc(CPUState *cs, vaddr value)
     env->pc = value;
 }
 
+#ifndef CONFIG_USER_ONLY
 #include "hw/loongarch/virt.h"
 
 void loongarch_cpu_set_irq(void *opaque, int irq, int level)
@@ -295,6 +296,7 @@ static bool loongarch_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
     }
     return false;
 }
+#endif
 
 #ifdef CONFIG_TCG
 static void loongarch_cpu_synchronize_from_tb(CPUState *cs,
@@ -309,6 +311,9 @@ static void loongarch_cpu_synchronize_from_tb(CPUState *cs,
 
 static bool loongarch_cpu_has_work(CPUState *cs)
 {
+#ifdef CONFIG_USER_ONLY
+    return true;
+#else
     LoongArchCPU *cpu = LOONGARCH_CPU(cs);
     CPULoongArchState *env = &cpu->env;
     bool has_work = false;
@@ -319,6 +324,7 @@ static bool loongarch_cpu_has_work(CPUState *cs)
     }
 
     return has_work;
+#endif
 }
 
 static void loongarch_la464_initfn(Object *obj)
@@ -467,7 +473,9 @@ static void loongarch_cpu_reset(DeviceState *dev)
         env->CSR_DMW[n] = FIELD_DP64(env->CSR_DMW[n], CSR_DMW, PLV3, 0);
     }
 
+#ifndef CONFIG_USER_ONLY
     env->pc = 0x1c000000;
+#endif
 
     restore_fp_status(env);
     cs->exception_index = -1;
@@ -498,6 +506,7 @@ static void loongarch_cpu_realizefn(DeviceState *dev, Error **errp)
     lacc->parent_realize(dev, errp);
 }
 
+#ifndef CONFIG_USER_ONLY
 static void loongarch_qemu_write(void *opaque, hwaddr addr,
                                  uint64_t val, unsigned size)
 {
@@ -532,13 +541,16 @@ static const MemoryRegionOps loongarch_qemu_ops = {
         .max_access_size = 8,
     },
 };
+#endif
 
 static void loongarch_cpu_init(Object *obj)
 {
     LoongArchCPU *cpu = LOONGARCH_CPU(obj);
-    CPULoongArchState *env = &cpu->env;
 
     cpu_set_cpustate_pointers(cpu);
+
+#ifndef CONFIG_USER_ONLY
+    CPULoongArchState *env = &cpu->env;
     qdev_init_gpio_in(DEVICE(cpu), loongarch_cpu_set_irq, N_IRQS);
     timer_init_ns(&cpu->timer, QEMU_CLOCK_VIRTUAL,
                   &loongarch_constant_timer_cb, cpu);
@@ -548,6 +560,7 @@ static void loongarch_cpu_init(Object *obj)
     memory_region_init_io(&env->iocsr_mem, OBJECT(cpu), &loongarch_qemu_ops,
                           NULL, "iocsr_misc", 0x428);
     memory_region_add_subregion(&env->system_iocsr, 0, &env->iocsr_mem);
+#endif
 }
 
 static ObjectClass *loongarch_cpu_class_by_name(const char *cpu_model)
@@ -615,18 +628,22 @@ static struct TCGCPUOps loongarch_tcg_ops = {
     .initialize = loongarch_translate_init,
     .synchronize_from_tb = loongarch_cpu_synchronize_from_tb,
 
+#ifndef CONFIG_USER_ONLY
     .tlb_fill = loongarch_cpu_tlb_fill,
     .cpu_exec_interrupt = loongarch_cpu_exec_interrupt,
     .do_interrupt = loongarch_cpu_do_interrupt,
     .do_transaction_failed = loongarch_cpu_do_transaction_failed,
+#endif
 };
 #endif /* CONFIG_TCG */
 
+#ifndef CONFIG_USER_ONLY
 #include "hw/core/sysemu-cpu-ops.h"
 
 static const struct SysemuCPUOps loongarch_sysemu_ops = {
     .get_phys_page_debug = loongarch_cpu_get_phys_page_debug,
 };
+#endif
 
 static void loongarch_cpu_class_init(ObjectClass *c, void *data)
 {
@@ -642,8 +659,10 @@ static void loongarch_cpu_class_init(ObjectClass *c, void *data)
     cc->has_work = loongarch_cpu_has_work;
     cc->dump_state = loongarch_cpu_dump_state;
     cc->set_pc = loongarch_cpu_set_pc;
+#ifndef CONFIG_USER_ONLY
     dc->vmsd = &vmstate_loongarch_cpu;
     cc->sysemu_ops = &loongarch_sysemu_ops;
+#endif
     cc->disas_set_info = loongarch_cpu_disas_set_info;
     cc->gdb_read_register = loongarch_cpu_gdb_read_register;
     cc->gdb_write_register = loongarch_cpu_gdb_write_register;
diff --git a/target/loongarch/op_helper.c b/target/loongarch/op_helper.c
index df049cec59..4b429b6699 100644
--- a/target/loongarch/op_helper.c
+++ b/target/loongarch/op_helper.c
@@ -86,6 +86,9 @@ target_ulong helper_cpucfg(CPULoongArchState *env, target_ulong rj)
 
 uint64_t helper_rdtime_d(CPULoongArchState *env)
 {
+#ifdef CONFIG_USER_ONLY
+    return cpu_get_host_ticks();
+#else
     uint64_t plv;
     LoongArchCPU *cpu = env_archcpu(env);
 
@@ -95,8 +98,10 @@ uint64_t helper_rdtime_d(CPULoongArchState *env)
     }
 
     return cpu_loongarch_get_constant_timer_counter(cpu);
+#endif
 }
 
+#ifndef CONFIG_USER_ONLY
 void helper_ertn(CPULoongArchState *env)
 {
     uint64_t csr_pplv, csr_pie;
@@ -131,3 +136,4 @@ void helper_idle(CPULoongArchState *env)
     cs->halted = 1;
     do_raise_exception(env, EXCP_HLT, 0);
 }
+#endif
diff --git a/target/loongarch/insn_trans/trans_privileged.c.inc b/target/loongarch/insn_trans/trans_privileged.c.inc
index 53596c4f77..9c4dcbfcfb 100644
--- a/target/loongarch/insn_trans/trans_privileged.c.inc
+++ b/target/loongarch/insn_trans/trans_privileged.c.inc
@@ -7,6 +7,41 @@
 
 #include "cpu-csr.h"
 
+#ifdef CONFIG_USER_ONLY
+
+#define GEN_FALSE_TRANS(name)   \
+static bool trans_##name(DisasContext *ctx, arg_##name * a)  \
+{   \
+    return false;   \
+}
+
+GEN_FALSE_TRANS(csrrd)
+GEN_FALSE_TRANS(csrwr)
+GEN_FALSE_TRANS(csrxchg)
+GEN_FALSE_TRANS(iocsrrd_b)
+GEN_FALSE_TRANS(iocsrrd_h)
+GEN_FALSE_TRANS(iocsrrd_w)
+GEN_FALSE_TRANS(iocsrrd_d)
+GEN_FALSE_TRANS(iocsrwr_b)
+GEN_FALSE_TRANS(iocsrwr_h)
+GEN_FALSE_TRANS(iocsrwr_w)
+GEN_FALSE_TRANS(iocsrwr_d)
+GEN_FALSE_TRANS(tlbsrch)
+GEN_FALSE_TRANS(tlbrd)
+GEN_FALSE_TRANS(tlbwr)
+GEN_FALSE_TRANS(tlbfill)
+GEN_FALSE_TRANS(tlbclr)
+GEN_FALSE_TRANS(tlbflush)
+GEN_FALSE_TRANS(invtlb)
+GEN_FALSE_TRANS(cacop)
+GEN_FALSE_TRANS(ldpte)
+GEN_FALSE_TRANS(lddir)
+GEN_FALSE_TRANS(ertn)
+GEN_FALSE_TRANS(dbcl)
+GEN_FALSE_TRANS(idle)
+
+#else
+
 typedef void (*GenCSRRead)(TCGv dest, TCGv_ptr env);
 typedef void (*GenCSRWrite)(TCGv dest, TCGv_ptr env, TCGv src);
 
@@ -464,3 +499,4 @@ static bool trans_idle(DisasContext *ctx, arg_idle *a)
     ctx->base.is_jmp = DISAS_NORETURN;
     return true;
 }
+#endif
-- 
2.34.1


