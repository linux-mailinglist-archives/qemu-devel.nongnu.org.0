Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD3153F29F
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 01:37:25 +0200 (CEST)
Received: from localhost ([::1]:41554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyMHk-0006KI-4J
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 19:37:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyLwO-0001ja-2D
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 19:15:23 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:40842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyLwK-0003yV-0Z
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 19:15:19 -0400
Received: by mail-pl1-x633.google.com with SMTP id i1so13332969plg.7
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 16:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2XfSIyU1m93q10ddUrgXlMnr39iFxzfrIB3I5x64+Nw=;
 b=YZhsphjl2yLF2l+H7qqUOY8LmOxAienEuz8PXoELtAsoc6wNQskJEXIqZjvbjo919E
 N9nzlQ6goUx0urBolwxdnQtPKzc0Y2L55PTXx9m9h4YhwodGT0vYG52SucDOd9977rDb
 ak8R7dMSgpHYAyl5zIc6U7R23N2Bo/Dq4kGH44ZryU4+JDnyJWdyFMjo9pYEhs2glAHb
 DKhEcfHiMdEoBxptwnyqbGw45n9j4l3jafyW9UMNhtLVJ7CG3DB2HY1C1c2uJCoIg3CQ
 EmL/q1Py+uqvp8IENeLqhJeDU5GK/Vr0m/niChYgs/+9ImahyUInweJmY0yCgPgOipYl
 cyDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2XfSIyU1m93q10ddUrgXlMnr39iFxzfrIB3I5x64+Nw=;
 b=FB1baNv1QYTHHuBC6jzZL1FU4uMIAfmdzNN26Dps1JkUy7f7lo5itwcvRVacW/5jA/
 oXgNkk1n0IoOWbw7lE4h/FGiD9I6n33Ql6IHLAF9G3X/oV7YvcklV7XaiVvkoWBiX3g9
 H3+wvakrznJ/a9bjejFDz61RQu5mGqkbt6roCPG7azsb4a3iN68iexh8THAATaUheXyR
 KUzlJdIsIUy75PSgLA/8bGQR+hI0zoUK+mCeQZwzBoWuF9wsS6t5edomYOipE413lmOh
 GZAOLKEDPRhzfz2qJhULcvkxrcXxqsjwOnCjc3Osc48kXnFIr+Nb59f5zI4KRkDuewKL
 RtbQ==
X-Gm-Message-State: AOAM533fTa/SP+X44rf+FxVNjbquICQ6oXVBVs4wU7+bboeoE2BBPkYl
 gzTO0YFScvKKbwQe5CRIOGhka+eKVornNw==
X-Google-Smtp-Source: ABdhPJyY434HNuEyH8bjpGHAX/HqIjmxEd+y/gJWPrmaobvK9H8KvBLgYRNdA9yXr79SF0UiefSiOQ==
X-Received: by 2002:a17:903:1245:b0:167:804b:3528 with SMTP id
 u5-20020a170903124500b00167804b3528mr7072819plh.68.1654557313534; 
 Mon, 06 Jun 2022 16:15:13 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:dd1c:9738:3e40:ffe0])
 by smtp.gmail.com with ESMTPSA id
 2-20020a170902c24200b00162523fdb8fsm10954623plg.252.2022.06.06.16.15.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 16:15:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =gaosong@loongson.cn, yangxiaojuan@loongson.cn,
 Song Gao <gaosong@loongson.cn>
Subject: [PULL 23/43] target/loongarch: Add LoongArch interrupt and exception
 handle
Date: Mon,  6 Jun 2022 16:14:30 -0700
Message-Id: <20220606231450.448443-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220606231450.448443-1-richard.henderson@linaro.org>
References: <20220606231450.448443-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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

From: Xiaojuan Yang <yangxiaojuan@loongson.cn>

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Signed-off-by: Song Gao <gaosong@loongson.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220606124333.2060567-24-yangxiaojuan@loongson.cn>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/loongarch/cpu.h       |   2 +
 target/loongarch/internals.h |   2 +
 target/loongarch/cpu.c       | 230 +++++++++++++++++++++++++++++++++++
 3 files changed, 234 insertions(+)

diff --git a/target/loongarch/cpu.h b/target/loongarch/cpu.h
index e0415d8929..b983ce241c 100644
--- a/target/loongarch/cpu.h
+++ b/target/loongarch/cpu.h
@@ -184,6 +184,8 @@ FIELD(CSR_CRMD, WE, 9, 1)
 extern const char * const regnames[32];
 extern const char * const fregnames[32];
 
+#define N_IRQS      13
+
 #define LOONGARCH_STLB         2048 /* 2048 STLB */
 #define LOONGARCH_MTLB         64   /* 64 MTLB */
 #define LOONGARCH_TLB_MAX      (LOONGARCH_STLB + LOONGARCH_MTLB)
diff --git a/target/loongarch/internals.h b/target/loongarch/internals.h
index 2fed768653..69183e8bb5 100644
--- a/target/loongarch/internals.h
+++ b/target/loongarch/internals.h
@@ -30,6 +30,8 @@ void restore_fp_status(CPULoongArchState *env);
 
 extern const VMStateDescription vmstate_loongarch_cpu;
 
+void loongarch_cpu_set_irq(void *opaque, int irq, int level);
+
 bool loongarch_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                             MMUAccessType access_type, int mmu_idx,
                             bool probe, uintptr_t retaddr);
diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index 9a5cabbf4c..01a0b4878a 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -80,6 +80,215 @@ static void loongarch_cpu_set_pc(CPUState *cs, vaddr value)
     env->pc = value;
 }
 
+void loongarch_cpu_set_irq(void *opaque, int irq, int level)
+{
+    LoongArchCPU *cpu = opaque;
+    CPULoongArchState *env = &cpu->env;
+    CPUState *cs = CPU(cpu);
+
+    if (irq < 0 || irq >= N_IRQS) {
+        return;
+    }
+
+    env->CSR_ESTAT = deposit64(env->CSR_ESTAT, irq, 1, level != 0);
+
+    if (FIELD_EX64(env->CSR_ESTAT, CSR_ESTAT, IS)) {
+        cpu_interrupt(cs, CPU_INTERRUPT_HARD);
+    } else {
+        cpu_reset_interrupt(cs, CPU_INTERRUPT_HARD);
+    }
+}
+
+static inline bool cpu_loongarch_hw_interrupts_enabled(CPULoongArchState *env)
+{
+    bool ret = 0;
+
+    ret = (FIELD_EX64(env->CSR_CRMD, CSR_CRMD, IE) &&
+          !(FIELD_EX64(env->CSR_DBG, CSR_DBG, DST)));
+
+    return ret;
+}
+
+/* Check if there is pending and not masked out interrupt */
+static inline bool cpu_loongarch_hw_interrupts_pending(CPULoongArchState *env)
+{
+    uint32_t pending;
+    uint32_t status;
+    bool r;
+
+    pending = FIELD_EX64(env->CSR_ESTAT, CSR_ESTAT, IS);
+    status  = FIELD_EX64(env->CSR_ECFG, CSR_ECFG, LIE);
+
+    r = (pending & status) != 0;
+    return r;
+}
+
+static void loongarch_cpu_do_interrupt(CPUState *cs)
+{
+    LoongArchCPU *cpu = LOONGARCH_CPU(cs);
+    CPULoongArchState *env = &cpu->env;
+    bool update_badinstr = 1;
+    int cause = -1;
+    const char *name;
+    bool tlbfill = FIELD_EX64(env->CSR_TLBRERA, CSR_TLBRERA, ISTLBR);
+    uint32_t vec_size = FIELD_EX64(env->CSR_ECFG, CSR_ECFG, VS);
+
+    if (cs->exception_index != EXCCODE_INT) {
+        if (cs->exception_index < 0 ||
+            cs->exception_index > ARRAY_SIZE(excp_names)) {
+            name = "unknown";
+        } else {
+            name = excp_names[cs->exception_index];
+        }
+
+        qemu_log_mask(CPU_LOG_INT,
+                     "%s enter: pc " TARGET_FMT_lx " ERA " TARGET_FMT_lx
+                     " TLBRERA " TARGET_FMT_lx " %s exception\n", __func__,
+                     env->pc, env->CSR_ERA, env->CSR_TLBRERA, name);
+    }
+
+    switch (cs->exception_index) {
+    case EXCCODE_DBP:
+        env->CSR_DBG = FIELD_DP64(env->CSR_DBG, CSR_DBG, DCL, 1);
+        env->CSR_DBG = FIELD_DP64(env->CSR_DBG, CSR_DBG, ECODE, 0xC);
+        goto set_DERA;
+    set_DERA:
+        env->CSR_DERA = env->pc;
+        env->CSR_DBG = FIELD_DP64(env->CSR_DBG, CSR_DBG, DST, 1);
+        env->pc = env->CSR_EENTRY + 0x480;
+        break;
+    case EXCCODE_INT:
+        if (FIELD_EX64(env->CSR_DBG, CSR_DBG, DST)) {
+            env->CSR_DBG = FIELD_DP64(env->CSR_DBG, CSR_DBG, DEI, 1);
+            goto set_DERA;
+        }
+        QEMU_FALLTHROUGH;
+    case EXCCODE_PIF:
+        cause = cs->exception_index;
+        update_badinstr = 0;
+        break;
+    case EXCCODE_ADEM:
+    case EXCCODE_SYS:
+    case EXCCODE_BRK:
+    case EXCCODE_PIL:
+    case EXCCODE_PIS:
+    case EXCCODE_PME:
+    case EXCCODE_PNR:
+    case EXCCODE_PNX:
+    case EXCCODE_PPI:
+    case EXCCODE_INE:
+    case EXCCODE_IPE:
+    case EXCCODE_FPE:
+        cause = cs->exception_index;
+        break;
+    default:
+        qemu_log("Error: exception(%d) '%s' has not been supported\n",
+                 cs->exception_index, excp_names[cs->exception_index]);
+        abort();
+    }
+
+    if (update_badinstr) {
+        env->CSR_BADI = cpu_ldl_code(env, env->pc);
+    }
+
+    /* Save PLV and IE */
+    if (tlbfill) {
+        env->CSR_TLBRPRMD = FIELD_DP64(env->CSR_TLBRPRMD, CSR_TLBRPRMD, PPLV,
+                                       FIELD_EX64(env->CSR_CRMD,
+                                       CSR_CRMD, PLV));
+        env->CSR_TLBRPRMD = FIELD_DP64(env->CSR_TLBRPRMD, CSR_TLBRPRMD, PIE,
+                                       FIELD_EX64(env->CSR_CRMD, CSR_CRMD, IE));
+        /* set the DA mode */
+        env->CSR_CRMD = FIELD_DP64(env->CSR_CRMD, CSR_CRMD, DA, 1);
+        env->CSR_CRMD = FIELD_DP64(env->CSR_CRMD, CSR_CRMD, PG, 0);
+        env->CSR_TLBRERA = FIELD_DP64(env->CSR_TLBRERA, CSR_TLBRERA,
+                                      PC, (env->pc >> 2));
+    } else {
+        env->CSR_ESTAT = FIELD_DP64(env->CSR_ESTAT, CSR_ESTAT, ECODE, cause);
+        env->CSR_PRMD = FIELD_DP64(env->CSR_PRMD, CSR_PRMD, PPLV,
+                                   FIELD_EX64(env->CSR_CRMD, CSR_CRMD, PLV));
+        env->CSR_PRMD = FIELD_DP64(env->CSR_PRMD, CSR_PRMD, PIE,
+                                   FIELD_EX64(env->CSR_CRMD, CSR_CRMD, IE));
+        env->CSR_ERA = env->pc;
+    }
+
+    env->CSR_CRMD = FIELD_DP64(env->CSR_CRMD, CSR_CRMD, PLV, 0);
+    env->CSR_CRMD = FIELD_DP64(env->CSR_CRMD, CSR_CRMD, IE, 0);
+
+    if  (cs->exception_index == EXCCODE_INT) {
+        /* Interrupt */
+        uint32_t vector = 0;
+        uint32_t pending = FIELD_EX64(env->CSR_ESTAT, CSR_ESTAT, IS);
+        pending &= FIELD_EX64(env->CSR_ECFG, CSR_ECFG, LIE);
+
+        /* Find the highest-priority interrupt. */
+        vector = 31 - clz32(pending);
+        env->pc = env->CSR_EENTRY + (EXCCODE_EXTERNAL_INT + vector) * vec_size;
+        qemu_log_mask(CPU_LOG_INT,
+                      "%s: PC " TARGET_FMT_lx " ERA " TARGET_FMT_lx
+                      " cause %d\n" "    A " TARGET_FMT_lx " D "
+                      TARGET_FMT_lx " vector = %d ExC " TARGET_FMT_lx "ExS"
+                      TARGET_FMT_lx "\n",
+                      __func__, env->pc, env->CSR_ERA,
+                      cause, env->CSR_BADV, env->CSR_DERA, vector,
+                      env->CSR_ECFG, env->CSR_ESTAT);
+    } else {
+        if (tlbfill) {
+            env->pc = env->CSR_TLBRENTRY;
+        } else {
+            env->pc = env->CSR_EENTRY;
+            env->pc += cause * vec_size;
+        }
+        qemu_log_mask(CPU_LOG_INT,
+                      "%s: PC " TARGET_FMT_lx " ERA " TARGET_FMT_lx
+                      " cause %d%s\n, ESTAT " TARGET_FMT_lx
+                      " EXCFG " TARGET_FMT_lx " BADVA " TARGET_FMT_lx
+                      "BADI " TARGET_FMT_lx " SYS_NUM " TARGET_FMT_lu
+                      " cpu %d asid " TARGET_FMT_lx "\n", __func__, env->pc,
+                      tlbfill ? env->CSR_TLBRERA : env->CSR_ERA,
+                      cause, tlbfill ? "(refill)" : "", env->CSR_ESTAT,
+                      env->CSR_ECFG,
+                      tlbfill ? env->CSR_TLBRBADV : env->CSR_BADV,
+                      env->CSR_BADI, env->gpr[11], cs->cpu_index,
+                      env->CSR_ASID);
+    }
+    cs->exception_index = -1;
+}
+
+static void loongarch_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
+                                                vaddr addr, unsigned size,
+                                                MMUAccessType access_type,
+                                                int mmu_idx, MemTxAttrs attrs,
+                                                MemTxResult response,
+                                                uintptr_t retaddr)
+{
+    LoongArchCPU *cpu = LOONGARCH_CPU(cs);
+    CPULoongArchState *env = &cpu->env;
+
+    if (access_type == MMU_INST_FETCH) {
+        do_raise_exception(env, EXCCODE_ADEF, retaddr);
+    } else {
+        do_raise_exception(env, EXCCODE_ADEM, retaddr);
+    }
+}
+
+static bool loongarch_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
+{
+    if (interrupt_request & CPU_INTERRUPT_HARD) {
+        LoongArchCPU *cpu = LOONGARCH_CPU(cs);
+        CPULoongArchState *env = &cpu->env;
+
+        if (cpu_loongarch_hw_interrupts_enabled(env) &&
+            cpu_loongarch_hw_interrupts_pending(env)) {
+            /* Raise it */
+            cs->exception_index = EXCCODE_INT;
+            loongarch_cpu_do_interrupt(cs);
+            return true;
+        }
+    }
+    return false;
+}
+
 #ifdef CONFIG_TCG
 static void loongarch_cpu_synchronize_from_tb(CPUState *cs,
                                               const TranslationBlock *tb)
@@ -91,6 +300,20 @@ static void loongarch_cpu_synchronize_from_tb(CPUState *cs,
 }
 #endif /* CONFIG_TCG */
 
+static bool loongarch_cpu_has_work(CPUState *cs)
+{
+    LoongArchCPU *cpu = LOONGARCH_CPU(cs);
+    CPULoongArchState *env = &cpu->env;
+    bool has_work = false;
+
+    if ((cs->interrupt_request & CPU_INTERRUPT_HARD) &&
+        cpu_loongarch_hw_interrupts_pending(env)) {
+        has_work = true;
+    }
+
+    return has_work;
+}
+
 static void loongarch_la464_initfn(Object *obj)
 {
     LoongArchCPU *cpu = LOONGARCH_CPU(obj);
@@ -237,6 +460,8 @@ static void loongarch_cpu_reset(DeviceState *dev)
         env->CSR_DMW[n] = FIELD_DP64(env->CSR_DMW[n], CSR_DMW, PLV3, 0);
     }
 
+    env->pc = 0x1c000000;
+
     restore_fp_status(env);
     cs->exception_index = -1;
 }
@@ -269,6 +494,7 @@ static void loongarch_cpu_init(Object *obj)
     LoongArchCPU *cpu = LOONGARCH_CPU(obj);
 
     cpu_set_cpustate_pointers(cpu);
+    qdev_init_gpio_in(DEVICE(cpu), loongarch_cpu_set_irq, N_IRQS);
 }
 
 static ObjectClass *loongarch_cpu_class_by_name(const char *cpu_model)
@@ -337,6 +563,9 @@ static struct TCGCPUOps loongarch_tcg_ops = {
     .synchronize_from_tb = loongarch_cpu_synchronize_from_tb,
 
     .tlb_fill = loongarch_cpu_tlb_fill,
+    .cpu_exec_interrupt = loongarch_cpu_exec_interrupt,
+    .do_interrupt = loongarch_cpu_do_interrupt,
+    .do_transaction_failed = loongarch_cpu_do_transaction_failed,
 };
 #endif /* CONFIG_TCG */
 
@@ -357,6 +586,7 @@ static void loongarch_cpu_class_init(ObjectClass *c, void *data)
     device_class_set_parent_reset(dc, loongarch_cpu_reset, &lacc->parent_reset);
 
     cc->class_by_name = loongarch_cpu_class_by_name;
+    cc->has_work = loongarch_cpu_has_work;
     cc->dump_state = loongarch_cpu_dump_state;
     cc->set_pc = loongarch_cpu_set_pc;
     dc->vmsd = &vmstate_loongarch_cpu;
-- 
2.34.1


