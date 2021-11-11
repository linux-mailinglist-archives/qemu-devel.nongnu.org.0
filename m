Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33EE344CF3B
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 02:47:42 +0100 (CET)
Received: from localhost ([::1]:52232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkzBl-0005yr-BQ
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 20:47:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1mkz0F-0005eI-4h
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 20:35:50 -0500
Received: from mail.loongson.cn ([114.242.206.163]:53960 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1mkz0B-0001hN-Vh
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 20:35:46 -0500
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxr9Ngc4xh9RMCAA--.4955S9;
 Thu, 11 Nov 2021 09:35:39 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 07/30] target/loongarch: Add MMU support for LoongArch
 CPU.
Date: Thu, 11 Nov 2021 09:35:05 +0800
Message-Id: <1636594528-8175-8-git-send-email-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1636594528-8175-1-git-send-email-yangxiaojuan@loongson.cn>
References: <1636594528-8175-1-git-send-email-yangxiaojuan@loongson.cn>
X-CM-TRANSID: AQAAf9Dxr9Ngc4xh9RMCAA--.4955S9
X-Coremail-Antispam: 1UD129KBjvAXoW3uFWUtF1xtw48JF4xXF4xJFb_yoW8CFyDCo
 WayF13Ja1xG34F9FnYkr90qayIqFWDCFW0ka93Zr45Wa1IyryUGFyfKa90vFy3Wrn5XFs7
 AayIgFnxJrZrZry3n29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
 AaLaJ3UjIYCTnIWjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRUUUUUUUUU=
X-CM-SenderInfo: p1dqw5xldry3tdq6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163;
 envelope-from=yangxiaojuan@loongson.cn; helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
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
Cc: Song Gao <gaosong@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch introduces basic TLB interfaces.

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 target/loongarch/cpu-param.h  |   3 +
 target/loongarch/cpu.c        |  36 ++++
 target/loongarch/cpu.h        |  57 ++++++
 target/loongarch/internals.h  |   7 +
 target/loongarch/machine.c    |  56 ++++++
 target/loongarch/meson.build  |   1 +
 target/loongarch/tlb_helper.c | 339 ++++++++++++++++++++++++++++++++++
 7 files changed, 499 insertions(+)
 create mode 100644 target/loongarch/tlb_helper.c

diff --git a/target/loongarch/cpu-param.h b/target/loongarch/cpu-param.h
index 9a769b67e0..5a2147fb90 100644
--- a/target/loongarch/cpu-param.h
+++ b/target/loongarch/cpu-param.h
@@ -12,6 +12,9 @@
 #define TARGET_PHYS_ADDR_SPACE_BITS 48
 #define TARGET_VIRT_ADDR_SPACE_BITS 48
 
+#define TARGET_PHYS_MASK ((1UL << TARGET_PHYS_ADDR_SPACE_BITS) - 1)
+#define TARGET_VIRT_MASK ((1UL << TARGET_VIRT_ADDR_SPACE_BITS) - 1)
+
 #define TARGET_PAGE_BITS 14
 #define NB_MMU_MODES 4
 
diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index c3e7c5dc98..7db6e21298 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -223,6 +223,10 @@ static void loongarch_cpu_disas_set_info(CPUState *s, disassemble_info *info)
 static void loongarch_cpu_realizefn(DeviceState *dev, Error **errp)
 {
     CPUState *cs = CPU(dev);
+#ifndef CONFIG_USER_ONLY
+    LoongArchCPU *cpu = LOONGARCH_CPU(dev);
+    CPULoongArchState *env = &cpu->env;
+#endif
     LoongArchCPUClass *lacc = LOONGARCH_CPU_GET_CLASS(dev);
     Error *local_err = NULL;
 
@@ -232,6 +236,10 @@ static void loongarch_cpu_realizefn(DeviceState *dev, Error **errp)
         return;
     }
 
+#ifndef CONFIG_USER_ONLY
+    loongarch_mmu_init(env);
+#endif
+
     cpu_reset(cs);
     qemu_init_vcpu(cs);
 
@@ -277,6 +285,21 @@ void loongarch_cpu_dump_state(CPUState *cs, FILE *f, int flags)
         }
     }
 
+#ifndef CONFIG_USER_ONLY
+    qemu_fprintf(f, "EUEN            0x%lx\n", env->CSR_EUEN);
+    qemu_fprintf(f, "ESTAT           0x%lx\n", env->CSR_ESTAT);
+    qemu_fprintf(f, "ERA             0x%lx\n", env->CSR_ERA);
+    qemu_fprintf(f, "CRMD            0x%lx\n", env->CSR_CRMD);
+    qemu_fprintf(f, "PRMD            0x%lx\n", env->CSR_PRMD);
+    qemu_fprintf(f, "BadVAddr        0x%lx\n", env->CSR_BADV);
+    qemu_fprintf(f, "TLB refill ERA  0x%lx\n", env->CSR_TLBRERA);
+    qemu_fprintf(f, "TLB refill BadV 0x%lx\n", env->CSR_TLBRBADV);
+    qemu_fprintf(f, "EENTRY          0x%lx\n", env->CSR_EENTRY);
+    qemu_fprintf(f, "BadInstr        0x%lx\n", env->CSR_BADI);
+    qemu_fprintf(f, "PRCFG1    0x%lx\nPRCFG2     0x%lx\nPRCFG3     0x%lx\n",
+                 env->CSR_PRCFG1, env->CSR_PRCFG3, env->CSR_PRCFG3);
+#endif
+
     /* fpr */
     if (flags & CPU_DUMP_FPU) {
         for (i = 0; i < 32; i++) {
@@ -294,9 +317,21 @@ void loongarch_cpu_dump_state(CPUState *cs, FILE *f, int flags)
 static struct TCGCPUOps loongarch_tcg_ops = {
     .initialize = loongarch_translate_init,
     .synchronize_from_tb = loongarch_cpu_synchronize_from_tb,
+
+#if !defined(CONFIG_USER_ONLY)
+    .tlb_fill = loongarch_cpu_tlb_fill,
+#endif /* !CONFIG_USER_ONLY */
 };
 #endif /* CONFIG_TCG */
 
+#ifndef CONFIG_USER_ONLY
+#include "hw/core/sysemu-cpu-ops.h"
+
+static const struct SysemuCPUOps loongarch_sysemu_ops = {
+    .get_phys_page_debug = loongarch_cpu_get_phys_page_debug,
+};
+#endif
+
 static void loongarch_cpu_class_init(ObjectClass *c, void *data)
 {
     LoongArchCPUClass *lacc = LOONGARCH_CPU_CLASS(c);
@@ -313,6 +348,7 @@ static void loongarch_cpu_class_init(ObjectClass *c, void *data)
     cc->set_pc = loongarch_cpu_set_pc;
 #ifndef CONFIG_USER_ONLY
     dc->vmsd = &vmstate_loongarch_cpu;
+    cc->sysemu_ops = &loongarch_sysemu_ops;
 #endif
     cc->disas_set_info = loongarch_cpu_disas_set_info;
 #ifdef CONFIG_TCG
diff --git a/target/loongarch/cpu.h b/target/loongarch/cpu.h
index 3dc0ef4cdf..4881f18cf1 100644
--- a/target/loongarch/cpu.h
+++ b/target/loongarch/cpu.h
@@ -151,6 +151,53 @@ extern const char * const fregnames[];
 #define N_IRQS      14
 #define IRQ_TIMER   11
 
+/*
+ * LoongArch cpu has 4 priv level, now only 2 mode used.
+ * 0 for kernel mode, 3 for user mode.
+ */
+#define LOONGARCH_HFLAG_UM     0x3 /* user mode */
+#define LOONGARCH_HFLAG_KM     0x0 /* kernel mode */
+
+#define LOONGARCH_TLB_MAX      2112 /* 2048 STLB + 64 MTLB */
+
+/*
+ * define the ASID PS E VPPN field of TLB
+ *
+ * PS of stlb come from stlbps.ps
+ * PS of mtlb come from tlbidx.ps
+ */
+FIELD(TLB_MISC, E, 0, 1)
+FIELD(TLB_MISC, ASID, 1, 10)
+FIELD(TLB_MISC, G, 11, 1)
+FIELD(TLB_MISC, PS, 12, 6)
+FIELD(TLB_MISC, VPPN, 18, 35)
+
+/* Corresponding to CSR_TLBELO0/1 */
+FIELD(ENTRY0, V, 0, 1)
+FIELD(ENTRY0, D, 1, 1)
+FIELD(ENTRY0, NR, 2, 1)
+FIELD(ENTRY0, NX, 3, 1)
+FIELD(ENTRY0, MAT, 4, 2)
+FIELD(ENTRY0, PLV, 6, 2)
+FIELD(ENTRY0, RPLV, 8, 1)
+FIELD(ENTRY0, PPN, 9, 36)
+
+FIELD(ENTRY1, V, 0, 1)
+FIELD(ENTRY1, D, 1, 1)
+FIELD(ENTRY1, NR, 2, 1)
+FIELD(ENTRY1, NX, 3, 1)
+FIELD(ENTRY1, MAT, 4, 2)
+FIELD(ENTRY1, PLV, 6, 2)
+FIELD(ENTRY1, RPLV, 8, 1)
+FIELD(ENTRY1, PPN, 9, 36)
+
+struct loongarch_tlb {
+    uint64_t tlb_misc;
+    uint64_t tlb_entry0;
+    uint64_t tlb_entry1;
+};
+typedef struct loongarch_tlb loongarch_tlb;
+
 typedef struct CPULoongArchState CPULoongArchState;
 struct CPULoongArchState {
     uint64_t gpr[32];
@@ -303,6 +350,12 @@ struct CPULoongArchState {
 
     void *irq[N_IRQS];
     QEMUTimer *timer; /* Internal timer */
+
+#ifndef CONFIG_USER_ONLY
+    uint32_t      stlb_size; /* at most : 8 * 256 = 2048 */
+    uint32_t      mtlb_size; /* at most : 64 */
+    loongarch_tlb tlb[LOONGARCH_TLB_MAX];
+#endif
 };
 
 /**
@@ -345,7 +398,11 @@ struct LoongArchCPUClass {
 
 static inline int cpu_mmu_index(CPULoongArchState *env, bool ifetch)
 {
+#ifdef CONFIG_USER_ONLY
     return MMU_USER_IDX;
+#else
+    return FIELD_EX64(env->CSR_CRMD, CSR_CRMD, PLV);
+#endif
 }
 
 static inline void cpu_get_tb_cpu_state(CPULoongArchState *env,
diff --git a/target/loongarch/internals.h b/target/loongarch/internals.h
index 49ed6829d7..3f72492b91 100644
--- a/target/loongarch/internals.h
+++ b/target/loongarch/internals.h
@@ -27,6 +27,13 @@ void restore_fp_status(CPULoongArchState *env);
 
 #ifndef CONFIG_USER_ONLY
 extern const VMStateDescription vmstate_loongarch_cpu;
+
+bool loongarch_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
+                            MMUAccessType access_type, int mmu_idx,
+                            bool probe, uintptr_t retaddr);
+
+void loongarch_mmu_init(CPULoongArchState *env);
+hwaddr loongarch_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 #endif
 
 #endif
diff --git a/target/loongarch/machine.c b/target/loongarch/machine.c
index b628374814..ccac5b9ef3 100644
--- a/target/loongarch/machine.c
+++ b/target/loongarch/machine.c
@@ -8,6 +8,54 @@
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "migration/cpu.h"
+#include "internals.h"
+
+/* TLB state */
+static int get_tlb(QEMUFile *f, void *pv, size_t size,
+                   const VMStateField *field)
+{
+    loongarch_tlb *v = pv;
+
+    qemu_get_be64s(f, &v->tlb_misc);
+    qemu_get_be64s(f, &v->tlb_entry0);
+    qemu_get_be64s(f, &v->tlb_entry1);
+
+    return 0;
+}
+
+static int put_tlb(QEMUFile *f, void *pv, size_t size,
+                   const VMStateField *field, JSONWriter *vmdesc)
+{
+    loongarch_tlb *v = pv;
+
+    qemu_put_be64s(f, &v->tlb_misc);
+    qemu_put_be64s(f, &v->tlb_entry0);
+    qemu_put_be64s(f, &v->tlb_entry1);
+
+    return 0;
+}
+
+const VMStateInfo vmstate_info_tlb = {
+    .name = "tlb_entry",
+    .get  = get_tlb,
+    .put  = put_tlb,
+};
+
+#define VMSTATE_TLB_ARRAY_V(_f, _s, _n, _v)                     \
+    VMSTATE_ARRAY(_f, _s, _n, _v, vmstate_info_tlb, loongarch_tlb)
+
+#define VMSTATE_TLB_ARRAY(_f, _s, _n)                           \
+    VMSTATE_TLB_ARRAY_V(_f, _s, _n, 0)
+
+const VMStateDescription vmstate_tlb = {
+    .name = "cpu/tlb",
+    .version_id = 0,
+    .minimum_version_id = 0,
+    .fields = (VMStateField[]) {
+        VMSTATE_TLB_ARRAY(env.tlb, LoongArchCPU, LOONGARCH_TLB_MAX),
+        VMSTATE_END_OF_LIST()
+    }
+};
 
 /* LoongArch CPU state */
 
@@ -22,6 +70,10 @@ const VMStateDescription vmstate_loongarch_cpu = {
         VMSTATE_UINT64_ARRAY(env.fpr, LoongArchCPU, 32),
         VMSTATE_UINT32(env.fcsr0, LoongArchCPU),
 
+        /* TLB */
+        VMSTATE_UINT32(env.stlb_size, LoongArchCPU),
+        VMSTATE_UINT32(env.mtlb_size, LoongArchCPU),
+
         /* Remaining CSR registers */
         VMSTATE_UINT64(env.CSR_CRMD, LoongArchCPU),
         VMSTATE_UINT64(env.CSR_PRMD, LoongArchCPU),
@@ -151,4 +203,8 @@ const VMStateDescription vmstate_loongarch_cpu = {
 
         VMSTATE_END_OF_LIST()
     },
+    .subsections = (const VMStateDescription * []) {
+        &vmstate_tlb,
+        NULL
+    }
 };
diff --git a/target/loongarch/meson.build b/target/loongarch/meson.build
index bda9f47ae4..935ffe2765 100644
--- a/target/loongarch/meson.build
+++ b/target/loongarch/meson.build
@@ -18,6 +18,7 @@ loongarch_softmmu_ss = ss.source_set()
 loongarch_softmmu_ss.add(files(
   'machine.c',
   'stabletimer.c',
+  'tlb_helper.c',
 ))
 
 loongarch_ss.add_all(when: 'CONFIG_TCG', if_true: [loongarch_tcg_ss])
diff --git a/target/loongarch/tlb_helper.c b/target/loongarch/tlb_helper.c
new file mode 100644
index 0000000000..69c69ece0a
--- /dev/null
+++ b/target/loongarch/tlb_helper.c
@@ -0,0 +1,339 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * QEMU LoongArch TLB helpers for qemu
+ *
+ * Copyright (c) 2021 Loongson Technology Corporation Limited
+ *
+ */
+
+#include "qemu/osdep.h"
+
+#include "cpu.h"
+#include "internals.h"
+#include "exec/exec-all.h"
+#include "exec/cpu_ldst.h"
+#include "exec/log.h"
+#include "cpu-csr.h"
+
+enum {
+    TLBRET_MATCH = 0,
+    TLBRET_BADADDR =1,
+    TLBRET_NOMATCH = 2,
+    TLBRET_INVALID = 3,
+    TLBRET_DIRTY = 4,
+    TLBRET_RI = 5,
+    TLBRET_XI = 6,
+    TLBRET_PE = 7,
+};
+
+/* TLB address map */
+static int loongarch_map_tlb_entry(CPULoongArchState *env, hwaddr *physical,
+                                   int *prot, target_ulong address,
+                                   int access_type, loongarch_tlb *tlb)
+{
+    uint64_t plv = FIELD_EX64(env->CSR_CRMD, CSR_CRMD, PLV);
+    uint8_t tlb_ps, n, tlb_v0, tlb_v1, tlb_d0, tlb_d1;
+    uint8_t tlb_nx0, tlb_nx1, tlb_nr0, tlb_nr1;
+    uint64_t tlb_ppn0, tlb_ppn1;
+    uint8_t tlb_rplv0, tlb_rplv1, tlb_plv0, tlb_plv1;
+
+    tlb_ps = FIELD_EX64(tlb->tlb_misc, TLB_MISC, PS);
+    n = (address >> tlb_ps) & 0x1;/* Odd or even */
+
+    tlb_v0 = FIELD_EX64(tlb->tlb_entry0, ENTRY0, V);
+    tlb_d0 = FIELD_EX64(tlb->tlb_entry0, ENTRY0, D);
+    tlb_plv0 = FIELD_EX64(tlb->tlb_entry0, ENTRY0, PLV);
+    tlb_ppn0 = FIELD_EX64(tlb->tlb_entry0, ENTRY0, PPN);
+    tlb_nx0 = FIELD_EX64(tlb->tlb_entry0, ENTRY0, NX);
+    tlb_nr0 = FIELD_EX64(tlb->tlb_entry0, ENTRY0, NR);
+    tlb_rplv0 = FIELD_EX64(tlb->tlb_entry0, ENTRY0, RPLV);
+
+    tlb_v1 = FIELD_EX64(tlb->tlb_entry1, ENTRY1, V);
+    tlb_d1 = FIELD_EX64(tlb->tlb_entry1, ENTRY1, D);
+    tlb_plv1 = FIELD_EX64(tlb->tlb_entry1, ENTRY1, PLV);
+    tlb_ppn1 = FIELD_EX64(tlb->tlb_entry1, ENTRY1, PPN);
+    tlb_nx1 = FIELD_EX64(tlb->tlb_entry1, ENTRY1, NX);
+    tlb_nr1 = FIELD_EX64(tlb->tlb_entry1, ENTRY1, NR);
+    tlb_rplv1 = FIELD_EX64(tlb->tlb_entry1, ENTRY1, RPLV);
+
+    /* Check access rights */
+    if (!(n ? tlb_v1 : tlb_v0)) {
+        return TLBRET_INVALID;
+    }
+
+    if (access_type == MMU_INST_FETCH && (n ? tlb_nx1 : tlb_nx0)) {
+        return TLBRET_XI;
+    }
+
+    if (access_type == MMU_DATA_LOAD && (n ? tlb_nr1 : tlb_nr0)) {
+        return TLBRET_RI;
+    }
+
+    if (n) {
+        if (((tlb_rplv1 == 0) && (plv > tlb_plv1)) ||
+            ((tlb_rplv1 == 1) && (plv != tlb_plv1))) {
+            return TLBRET_PE;
+        }
+    } else {
+        if (((tlb_rplv0 == 0) && (plv > tlb_plv0)) ||
+            ((tlb_rplv0 == 1) && (plv != tlb_plv0))) {
+            return TLBRET_PE;
+        }
+    }
+
+    if ((access_type == MMU_DATA_STORE) && !(n ? tlb_d1 : tlb_d0)) {
+        return TLBRET_DIRTY;
+    }
+
+    /*
+     *         PPN     address
+     *  4 KB: [47:13]   [12;0]
+     * 16 KB: [47:15]   [14:0]
+     */
+    if (n) {
+        *physical = (tlb_ppn1 << 12) | (address & ((1 << tlb_ps) - 1));
+    } else {
+        *physical = (tlb_ppn0 << 12) | (address & ((1 << tlb_ps) - 1));
+    }
+    *prot = PAGE_READ;
+    if (n ? tlb_d1 : tlb_d0) {
+        *prot |= PAGE_WRITE;
+    }
+    if (!(n ? tlb_nx1 : tlb_nx0)) {
+        *prot |= PAGE_EXEC;
+    }
+    return TLBRET_MATCH;
+}
+
+/* LoongArch 3A5000 -style MMU emulation */
+static int loongarch_map_address(CPULoongArchState *env, hwaddr *physical,
+                                 int *prot,
+                                 target_ulong address,
+                                 MMUAccessType access_type)
+{
+    loongarch_tlb *tlb;
+    uint16_t csr_asid, tlb_asid, stlb_idx;
+    uint8_t tlb_e, stlb_ps, tlb_ps, tlb_g;
+    int i, stlb_size, mtlb_size;
+    uint64_t vpn, tlb_vppn;   /* Address to map */
+
+    stlb_size = env->stlb_size;
+    mtlb_size = env->mtlb_size;
+    csr_asid = FIELD_EX64(env->CSR_ASID, CSR_ASID, ASID);
+
+    /* Search MTLB */
+    for (i = stlb_size; i < stlb_size + mtlb_size; ++i) {
+        tlb = &env->tlb[i];
+        tlb_vppn = FIELD_EX64(tlb->tlb_misc, TLB_MISC, VPPN);
+        tlb_ps = FIELD_EX64(tlb->tlb_misc, TLB_MISC, PS);
+
+        vpn = (address & TARGET_VIRT_MASK) >> (tlb_ps + 1);
+        tlb_asid = FIELD_EX64(tlb->tlb_misc, TLB_MISC, ASID);
+        tlb_e = FIELD_EX64(tlb->tlb_misc, TLB_MISC, E);
+        tlb_g = FIELD_EX64(tlb->tlb_misc, TLB_MISC, G);
+
+        if ((tlb_g == 1 || tlb_asid == csr_asid) &&
+            (vpn == (tlb_vppn >> (tlb_ps + 1 - 13))) && tlb_e) {
+            return loongarch_map_tlb_entry(env, physical, prot,
+                                                   address, access_type, tlb);
+        }
+    }
+
+    /* Search STLB */
+    stlb_ps = FIELD_EX64(env->CSR_STLBPS, CSR_STLBPS, PS);
+    vpn = (address & TARGET_VIRT_MASK) >> (stlb_ps + 1);
+
+    /* VA[ps+11 : ps+1] indicate the stlb index */
+    stlb_idx = vpn & 0xff; /* [0,255] */
+
+    for (i = 0; i < 8; ++i) {
+        tlb = &env->tlb[i * 256 + stlb_idx];
+        tlb_vppn = FIELD_EX64(tlb->tlb_misc, TLB_MISC, VPPN);
+        tlb_asid = FIELD_EX64(tlb->tlb_misc, TLB_MISC, ASID);
+        tlb_e = FIELD_EX64(tlb->tlb_misc, TLB_MISC, E);
+        tlb_g = FIELD_EX64(tlb->tlb_misc, TLB_MISC, G);
+
+        if ((tlb_g == 1 || tlb_asid == csr_asid) &&
+            (vpn == (tlb_vppn >> (stlb_ps + 1 - 13))) && tlb_e) {
+            return loongarch_map_tlb_entry(env, physical, prot,
+                                                   address, access_type, tlb);
+        }
+    }
+
+    return TLBRET_NOMATCH;
+}
+
+static int get_physical_address(CPULoongArchState *env, hwaddr *physical,
+                                int *prot, target_ulong real_address,
+                                MMUAccessType access_type, int mmu_idx)
+{
+    int user_mode = mmu_idx == LOONGARCH_HFLAG_UM;
+    int kernel_mode = !user_mode;
+    unsigned plv, base_c, base_v, tmp;
+    uint64_t pg = FIELD_EX64(env->CSR_CRMD, CSR_CRMD, PG);
+
+    /* Effective address */
+    target_ulong address = real_address;
+
+    /* Check PG */
+    if (!pg) {
+        /* DA mode */
+        *physical = address & TARGET_PHYS_MASK;
+        *prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
+        return TLBRET_MATCH;
+    }
+
+    plv = kernel_mode | (user_mode << 3);
+    base_v = address >> CSR_DMW_BASE_SH;
+    /* Check direct map window 0 */
+    base_c = env->CSR_DMWIN0 >> CSR_DMW_BASE_SH;
+    if ((plv & env->CSR_DMWIN0) && (base_c == base_v)) {
+        *physical = dmwin_va2pa(address);
+        *prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
+        return TLBRET_MATCH;
+    }
+    /* Check direct map window 1 */
+    base_c = env->CSR_DMWIN1 >> CSR_DMW_BASE_SH;
+    if ((plv & env->CSR_DMWIN1) && (base_c == base_v)) {
+        *physical = dmwin_va2pa(address);
+        *prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
+        return TLBRET_MATCH;
+    }
+    /* Check valid extension */
+    tmp = address >> (TARGET_VIRT_ADDR_SPACE_BITS - 1);
+    if (!(tmp == 0 || tmp == 0x1ffff)) {
+        return TLBRET_BADADDR;
+    }
+    /* Mapped address */
+    return loongarch_map_address(env, physical, prot, real_address,
+                                 access_type);
+}
+
+hwaddr loongarch_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
+{
+    LoongArchCPU *cpu = LOONGARCH_CPU(cs);
+    CPULoongArchState *env = &cpu->env;
+    hwaddr phys_addr;
+    int prot;
+
+    if (get_physical_address(env, &phys_addr, &prot, addr, MMU_DATA_LOAD,
+                             cpu_mmu_index(env, false)) != 0) {
+        return -1;
+    }
+    return phys_addr;
+}
+
+static void raise_mmu_exception(CPULoongArchState *env, target_ulong address,
+                                MMUAccessType access_type, int tlb_error)
+{
+    CPUState *cs = env_cpu(env);
+
+    switch (tlb_error) {
+    default:
+    case TLBRET_BADADDR:
+        cs->exception_index = EXCP_ADE;
+        break;
+    case TLBRET_NOMATCH:
+        /* No TLB match for a mapped address */
+        if (access_type == MMU_DATA_LOAD) {
+            cs->exception_index = EXCP_TLBL;
+        } else if (access_type == MMU_DATA_STORE) {
+            cs->exception_index = EXCP_TLBS;
+        } else if (access_type == MMU_INST_FETCH) {
+            cs->exception_index = EXCP_INST_NOTAVAIL;
+        }
+        env->CSR_TLBRERA = FIELD_DP64(env->CSR_TLBRERA, CSR_TLBRERA, ISTLBR, 1);
+        break;
+    case TLBRET_INVALID:
+        /* TLB match with no valid bit */
+        if (access_type == MMU_DATA_LOAD) {
+            cs->exception_index = EXCP_TLBL;
+        } else if (access_type == MMU_DATA_STORE) {
+            cs->exception_index = EXCP_TLBS;
+        } else if (access_type == MMU_INST_FETCH) {
+            cs->exception_index = EXCP_INST_NOTAVAIL;
+        }
+        break;
+    case TLBRET_DIRTY:
+        /* TLB match but 'D' bit is cleared */
+        cs->exception_index = EXCP_TLBM;
+        break;
+    case TLBRET_XI:
+        /* Execute-Inhibit Exception */
+        cs->exception_index = EXCP_TLBNX;
+        break;
+    case TLBRET_RI:
+        /* Read-Inhibit Exception */
+        cs->exception_index = EXCP_TLBNR;
+        break;
+    case TLBRET_PE:
+        /* Privileged Exception */
+        cs->exception_index = EXCP_TLBPE;
+        break;
+    }
+
+    if (tlb_error == TLBRET_NOMATCH) {
+        env->CSR_TLBRBADV = address;
+        env->CSR_TLBREHI = address & (TARGET_PAGE_MASK << 1);
+    } else {
+        if (!FIELD_EX64(env->CSR_DBG, CSR_DBG, DST)) {
+            env->CSR_BADV = address;
+        }
+        env->CSR_TLBEHI = address & (TARGET_PAGE_MASK << 1);
+   }
+
+}
+
+void loongarch_mmu_init(CPULoongArchState *env)
+{
+    /* Number of MTLB */
+    env->mtlb_size = 64;
+
+    /* Number of STLB */
+    env->stlb_size = 2048;
+
+    /* For 16KB, ps = 14, compare the bit [47:15] */
+    for (int i = 0; i < LOONGARCH_TLB_MAX; i++) {
+        env->tlb[i].tlb_misc = FIELD_DP64(env->tlb[i].tlb_misc, TLB_MISC, E, 0);
+    }
+}
+
+bool loongarch_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
+                            MMUAccessType access_type, int mmu_idx,
+                            bool probe, uintptr_t retaddr)
+{
+    LoongArchCPU *cpu = LOONGARCH_CPU(cs);
+    CPULoongArchState *env = &cpu->env;
+    hwaddr physical;
+    int prot;
+    int ret = TLBRET_BADADDR;
+
+    /* Data access */
+    /* XXX: put correct access by using cpu_restore_state() correctly */
+    ret = get_physical_address(env, &physical, &prot, address,
+                               access_type, mmu_idx);
+    switch (ret) {
+    case TLBRET_MATCH:
+        qemu_log_mask(CPU_LOG_MMU,
+                      "%s address=%" VADDR_PRIx " physical " TARGET_FMT_plx
+                      " prot %d\n", __func__, address, physical, prot);
+        break;
+    default:
+        qemu_log_mask(CPU_LOG_MMU,
+                      "%s address=%" VADDR_PRIx " ret %d\n", __func__, address,
+                      ret);
+        break;
+    }
+    if (ret == TLBRET_MATCH) {
+        tlb_set_page(cs, address & TARGET_PAGE_MASK,
+                     physical & TARGET_PAGE_MASK, prot,
+                     mmu_idx, TARGET_PAGE_SIZE);
+        return true;
+    }
+    if (probe) {
+        return false;
+    } else {
+        raise_mmu_exception(env, address, access_type, ret);
+        do_raise_exception(env, cs->exception_index, retaddr);
+    }
+}
-- 
2.27.0


