Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8ABE50DCFA
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 11:40:28 +0200 (CEST)
Received: from localhost ([::1]:42806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nivCl-0000Gi-VJ
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 05:40:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1niukN-0008Gj-BX
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 05:11:11 -0400
Received: from mail.loongson.cn ([114.242.206.163]:39466 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1niukK-0001IQ-Nn
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 05:11:07 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxn8+DZWZi+7gwAA--.18850S28; 
 Mon, 25 Apr 2022 17:10:51 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 26/43] target/loongarch: Add LoongArch IOCSR instruction
Date: Mon, 25 Apr 2022 17:10:10 +0800
Message-Id: <20220425091027.2877892-27-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220425091027.2877892-1-yangxiaojuan@loongson.cn>
References: <20220425091027.2877892-1-yangxiaojuan@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxn8+DZWZi+7gwAA--.18850S28
X-Coremail-Antispam: 1UD129KBjvAXoWfJry8AFyxZr4DArWfCF1fCrg_yoW8JrW3Wo
 W5AFW5Aa1rGrsavFnFk3yqvrW7tF9rArZ3AF93u3Z8Ga1kAFy3tFy5GanYy3yxtrn5KrW8
 C34jgF15Ga4fXr93n29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
 AaLaJ3UjIYCTnIWjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRUUUUUUUUU=
X-CM-SenderInfo: p1dqw5xldry3tdq6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163;
 envelope-from=yangxiaojuan@loongson.cn; helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: mark.cave-ayland@ilande.co.uk, richard.henderson@linaro.org,
 gaosong@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This includes:
- IOCSR{RD/WR}.{B/H/W/D}

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 target/loongarch/cpu.c                        |  52 ++++++
 target/loongarch/cpu.h                        |  25 +++
 target/loongarch/disas.c                      |   8 +
 target/loongarch/helper.h                     |   8 +
 .../insn_trans/trans_privileged.c.inc         |  35 ++++
 target/loongarch/insns.decode                 |   9 +
 target/loongarch/iocsr_helper.c               | 174 ++++++++++++++++++
 target/loongarch/meson.build                  |   1 +
 8 files changed, 312 insertions(+)
 create mode 100644 target/loongarch/iocsr_helper.c

diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index 6d6216a846..3167323821 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -17,6 +17,8 @@
 #include "internals.h"
 #include "fpu/softfloat-helpers.h"
 #include "cpu-csr.h"
+#include "sysemu/reset.h"
+#include "hw/loader.h"
 
 const char * const regnames[32] = {
     "r0", "r1", "r2", "r3", "r4", "r5", "r6", "r7",
@@ -483,14 +485,64 @@ static void loongarch_cpu_realizefn(DeviceState *dev, Error **errp)
     lacc->parent_realize(dev, errp);
 }
 
+static void loongarch_qemu_write(void *opaque, hwaddr addr,
+                                 uint64_t val, unsigned size)
+{
+}
+
+static uint64_t loongarch_qemu_read(void *opaque, hwaddr addr, unsigned size)
+{
+    switch (addr) {
+    case FEATURE_REG:
+        return 1UL << IOCSRF_MSI | 1UL << IOCSRF_EXTIOI |
+               1UL << IOCSRF_CSRIPI;
+    case VENDOR_REG:
+        return 0x6e6f73676e6f6f4c; /* "Loongson" */
+    case CPUNAME_REG:
+        return 0x303030354133;     /* "3A5000" */
+    case MISC_FUNC_REG:
+        return 1UL << IOCSRM_EXTIOI_EN;
+    }
+    return 0;
+}
+
+static const MemoryRegionOps loongarch_qemu_ops = {
+    .read = loongarch_qemu_read,
+    .write = loongarch_qemu_write,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+    .valid = {
+        .min_access_size = 4,
+        .max_access_size = 8,
+    },
+    .impl = {
+        .min_access_size = 8,
+        .max_access_size = 8,
+    },
+};
+
+static void do_cpu_reset(void *opaque)
+{
+    LoongArchCPU *cpu = opaque;
+
+    cpu_reset(CPU(cpu));
+}
+
 static void loongarch_cpu_init(Object *obj)
 {
     LoongArchCPU *cpu = LOONGARCH_CPU(obj);
+    CPULoongArchState *env = &cpu->env;
 
     cpu_set_cpustate_pointers(cpu);
     qdev_init_gpio_in(DEVICE(cpu), loongarch_cpu_set_irq, N_IRQS);
     timer_init_ns(&cpu->timer, QEMU_CLOCK_VIRTUAL,
                   &loongarch_constant_timer_cb, cpu);
+    memory_region_init_io(&env->system_iocsr, OBJECT(cpu), NULL,
+                      env, "iocsr", UINT64_MAX);
+    address_space_init(&env->address_space_iocsr, &env->system_iocsr, "IOCSR");
+    qemu_register_reset(do_cpu_reset, cpu);
+    memory_region_init_io(&env->iocsr_mem, OBJECT(cpu), &loongarch_qemu_ops,
+                          NULL, "iocsr_misc", 0x428);
+    memory_region_add_subregion(&env->system_iocsr, 0, &env->iocsr_mem);
 }
 
 static ObjectClass *loongarch_cpu_class_by_name(const char *cpu_model)
diff --git a/target/loongarch/cpu.h b/target/loongarch/cpu.h
index e907fe3c51..734f90168e 100644
--- a/target/loongarch/cpu.h
+++ b/target/loongarch/cpu.h
@@ -12,6 +12,27 @@
 #include "fpu/softfloat-types.h"
 #include "hw/registerfields.h"
 #include "qemu/timer.h"
+#include "exec/memory.h"
+#include "hw/sysbus.h"
+
+#define IOCSRF_TEMP             0
+#define IOCSRF_NODECNT          1
+#define IOCSRF_MSI              2
+#define IOCSRF_EXTIOI           3
+#define IOCSRF_CSRIPI           4
+#define IOCSRF_FREQCSR          5
+#define IOCSRF_FREQSCALE        6
+#define IOCSRF_DVFSV1           7
+#define IOCSRF_GMOD             9
+#define IOCSRF_VM               11
+
+#define FEATURE_REG             0x8
+#define VENDOR_REG              0x10
+#define CPUNAME_REG             0x20
+#define MISC_FUNC_REG           0x420
+#define IOCSRM_EXTIOI_EN        48
+
+#define IOCSR_MEM_SIZE          0x428
 
 #define TCG_GUEST_DEFAULT_MO (0)
 
@@ -284,6 +305,10 @@ typedef struct CPUArchState {
     uint64_t CSR_DSAVE;
 
     LoongArchTLB  tlb[LOONGARCH_TLB_MAX];
+
+    AddressSpace address_space_iocsr;
+    MemoryRegion system_iocsr;
+    MemoryRegion iocsr_mem;
 } CPULoongArchState;
 
 /**
diff --git a/target/loongarch/disas.c b/target/loongarch/disas.c
index c76b82dfdf..fcc06abc6b 100644
--- a/target/loongarch/disas.c
+++ b/target/loongarch/disas.c
@@ -609,6 +609,14 @@ INSN(bgeu,         rr_offs)
 INSN(csrrd,        r_csr)
 INSN(csrwr,        r_csr)
 INSN(csrxchg,      rr_csr)
+INSN(iocsrrd_b,    rr)
+INSN(iocsrrd_h,    rr)
+INSN(iocsrrd_w,    rr)
+INSN(iocsrrd_d,    rr)
+INSN(iocsrwr_b,    rr)
+INSN(iocsrwr_h,    rr)
+INSN(iocsrwr_w,    rr)
+INSN(iocsrwr_d,    rr)
 
 #define output_fcmp(C, PREFIX, SUFFIX)                                         \
 {                                                                              \
diff --git a/target/loongarch/helper.h b/target/loongarch/helper.h
index 5a6754eb65..4664a02dcf 100644
--- a/target/loongarch/helper.h
+++ b/target/loongarch/helper.h
@@ -100,3 +100,11 @@ DEF_HELPER_2(csrwr_estat, i64, env, tl)
 DEF_HELPER_2(csrwr_asid, i64, env, tl)
 DEF_HELPER_2(csrwr_tcfg, i64, env, tl)
 DEF_HELPER_2(csrwr_ticlr, i64, env, tl)
+DEF_HELPER_2(iocsrrd_b, i64, env, tl)
+DEF_HELPER_2(iocsrrd_h, i64, env, tl)
+DEF_HELPER_2(iocsrrd_w, i64, env, tl)
+DEF_HELPER_2(iocsrrd_d, i64, env, tl)
+DEF_HELPER_3(iocsrwr_b, void, env, tl, tl)
+DEF_HELPER_3(iocsrwr_h, void, env, tl, tl)
+DEF_HELPER_3(iocsrwr_w, void, env, tl, tl)
+DEF_HELPER_3(iocsrwr_d, void, env, tl, tl)
diff --git a/target/loongarch/insn_trans/trans_privileged.c.inc b/target/loongarch/insn_trans/trans_privileged.c.inc
index 0fc5d7935c..8a1c5b8511 100644
--- a/target/loongarch/insn_trans/trans_privileged.c.inc
+++ b/target/loongarch/insn_trans/trans_privileged.c.inc
@@ -256,3 +256,38 @@ static bool trans_csrxchg(DisasContext *ctx, arg_csrxchg *a)
     tcg_temp_free(oldv);
     return true;
 }
+
+static bool gen_iocsrrd(DisasContext *ctx, arg_rr *a,
+                        void (*func)(TCGv, TCGv_ptr, TCGv))
+{
+    TCGv dest = gpr_dst(ctx, a->rd, EXT_NONE);
+    TCGv src1 = gpr_src(ctx, a->rj, EXT_NONE);
+
+    if (check_plv(ctx)) {
+        return false;
+    }
+    func(dest, cpu_env, src1);
+    return true;
+}
+
+static bool gen_iocsrwr(DisasContext *ctx, arg_rr *a,
+                        void (*func)(TCGv_ptr, TCGv, TCGv))
+{
+    TCGv val = gpr_src(ctx, a->rd, EXT_NONE);
+    TCGv addr = gpr_src(ctx, a->rj, EXT_NONE);
+
+    if (check_plv(ctx)) {
+        return false;
+    }
+    func(cpu_env, addr, val);
+    return true;
+}
+
+TRANS(iocsrrd_b, gen_iocsrrd, gen_helper_iocsrrd_b)
+TRANS(iocsrrd_h, gen_iocsrrd, gen_helper_iocsrrd_h)
+TRANS(iocsrrd_w, gen_iocsrrd, gen_helper_iocsrrd_w)
+TRANS(iocsrrd_d, gen_iocsrrd, gen_helper_iocsrrd_d)
+TRANS(iocsrwr_b, gen_iocsrwr, gen_helper_iocsrwr_b)
+TRANS(iocsrwr_h, gen_iocsrwr, gen_helper_iocsrwr_h)
+TRANS(iocsrwr_w, gen_iocsrwr, gen_helper_iocsrwr_w)
+TRANS(iocsrwr_d, gen_iocsrwr, gen_helper_iocsrwr_d)
diff --git a/target/loongarch/insns.decode b/target/loongarch/insns.decode
index 43005ca283..2b436d3cd6 100644
--- a/target/loongarch/insns.decode
+++ b/target/loongarch/insns.decode
@@ -450,3 +450,12 @@ bgeu            0110 11 ................ ..... .....     @rr_offs16
   csrwr             0000 0100 .............. 00001 .....     @r_csr
   csrxchg           0000 0100 .............. ..... .....     @rr_csr
 }
+
+iocsrrd_b        0000 01100100 10000 00000 ..... .....    @rr
+iocsrrd_h        0000 01100100 10000 00001 ..... .....    @rr
+iocsrrd_w        0000 01100100 10000 00010 ..... .....    @rr
+iocsrrd_d        0000 01100100 10000 00011 ..... .....    @rr
+iocsrwr_b        0000 01100100 10000 00100 ..... .....    @rr
+iocsrwr_h        0000 01100100 10000 00101 ..... .....    @rr
+iocsrwr_w        0000 01100100 10000 00110 ..... .....    @rr
+iocsrwr_d        0000 01100100 10000 00111 ..... .....    @rr
diff --git a/target/loongarch/iocsr_helper.c b/target/loongarch/iocsr_helper.c
new file mode 100644
index 0000000000..ce8e17fb12
--- /dev/null
+++ b/target/loongarch/iocsr_helper.c
@@ -0,0 +1,174 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (c) 2021 Loongson Technology Corporation Limited
+ *
+ * Helpers for IOCSR reads/writes
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/main-loop.h"
+#include "cpu.h"
+#include "internals.h"
+#include "qemu/host-utils.h"
+#include "exec/helper-proto.h"
+#include "exec/exec-all.h"
+#include "exec/cpu_ldst.h"
+#include "tcg/tcg-ldst.h"
+
+uint64_t helper_iocsrrd_b(CPULoongArchState *env, target_ulong r_addr)
+{
+    return address_space_ldub(&env->address_space_iocsr, r_addr,
+                              MEMTXATTRS_UNSPECIFIED, NULL);
+}
+
+uint64_t helper_iocsrrd_h(CPULoongArchState *env, target_ulong r_addr)
+{
+    return address_space_lduw(&env->address_space_iocsr, r_addr,
+                              MEMTXATTRS_UNSPECIFIED, NULL);
+}
+
+uint64_t helper_iocsrrd_w(CPULoongArchState *env, target_ulong r_addr)
+{
+    return address_space_ldl(&env->address_space_iocsr, r_addr,
+                             MEMTXATTRS_UNSPECIFIED, NULL);
+}
+
+uint64_t helper_iocsrrd_d(CPULoongArchState *env, target_ulong r_addr)
+{
+    return address_space_ldq(&env->address_space_iocsr, r_addr,
+                             MEMTXATTRS_UNSPECIFIED, NULL);
+}
+
+static int get_ipi_data(target_ulong val)
+{
+    int i, mask, data;
+
+    data = val >> 32;
+    mask = (val >> 27) & 0xf;
+
+    for (i = 0; i < 4; i++) {
+        if ((mask >> i) & 1) {
+            data &= ~(0xff << (i * 8));
+        }
+    }
+    return data;
+}
+
+static void check_ipi_send(CPULoongArchState *env, target_ulong val)
+{
+    int cpuid;
+    target_ulong data;
+
+    cpuid = (val >> 16) & 0x3ff;
+    /* IPI status vector */
+    data = 1 << (val & 0x1f);
+
+    qemu_mutex_lock_iothread();
+    CPUState *cs = qemu_get_cpu(cpuid);
+    env = cs->env_ptr;
+    LoongArchCPU *cpu = LOONGARCH_CPU(cs);
+    loongarch_cpu_set_irq(cpu, IRQ_IPI, 1);
+    qemu_mutex_unlock_iothread();
+
+    address_space_stl(&env->address_space_iocsr, 0x1008,
+                      data, MEMTXATTRS_UNSPECIFIED, NULL);
+}
+
+static void check_mail_send(CPULoongArchState *env, target_ulong w_addr,
+                     target_ulong val)
+{
+    int cpuid;
+    uint32_t data;
+
+    cpuid = (val >> 16) & 0x3ff;
+    w_addr = 0x1020 + (val & 0x1c);
+    env = (qemu_get_cpu(cpuid))->env_ptr;
+    data = get_ipi_data(val);
+
+    address_space_stl(&env->address_space_iocsr, w_addr,
+                      data, MEMTXATTRS_UNSPECIFIED, NULL);
+}
+
+static void check_any_send(CPULoongArchState *env, target_ulong w_addr,
+                    target_ulong val)
+{
+    int cpuid;
+    uint32_t data;
+
+    cpuid = (val >> 16) & 0x3ff;
+    w_addr = val & 0xffff;
+    env = (qemu_get_cpu(cpuid))->env_ptr;
+    data = get_ipi_data(val);
+
+    address_space_stl(&env->address_space_iocsr, w_addr,
+                      data, MEMTXATTRS_UNSPECIFIED, NULL);
+}
+
+static bool check_iocsrwr(CPULoongArchState *env, target_ulong w_addr,
+                   target_ulong val)
+{
+    bool ret = true;
+
+    /*
+     * For IPI send, Mailbox send and ANY send, adjust the addr and
+     * val accordingly. The IOCSR writes are turned to different
+     * MMIO writes respectively
+     */
+    switch (w_addr) {
+    case 0x1040: /* IPI send */
+        check_ipi_send(env, val);
+        ret = false;
+        break;
+    case 0x1048: /* Mail send */
+        check_mail_send(env, w_addr, val);
+        ret = false;
+        break;
+    case 0x1158: /* ANY send */
+        check_any_send(env, w_addr, val);
+        ret = false;
+        break;
+    default:
+        break;
+    }
+    return ret;
+}
+
+void helper_iocsrwr_b(CPULoongArchState *env, target_ulong w_addr,
+                      target_ulong val)
+{
+    if (!check_iocsrwr(env, w_addr, val)) {
+        return;
+    }
+    address_space_stb(&env->address_space_iocsr, w_addr,
+                      val, MEMTXATTRS_UNSPECIFIED, NULL);
+}
+
+void helper_iocsrwr_h(CPULoongArchState *env, target_ulong w_addr,
+                      target_ulong val)
+{
+    if (!check_iocsrwr(env, w_addr, val)) {
+        return;
+    }
+    address_space_stw(&env->address_space_iocsr, w_addr,
+                      val, MEMTXATTRS_UNSPECIFIED, NULL);
+}
+
+void helper_iocsrwr_w(CPULoongArchState *env, target_ulong w_addr,
+                      target_ulong val)
+{
+    if (!check_iocsrwr(env, w_addr, val)) {
+        return;
+    }
+    address_space_stl(&env->address_space_iocsr, w_addr,
+                      val, MEMTXATTRS_UNSPECIFIED, NULL);
+}
+
+void helper_iocsrwr_d(CPULoongArchState *env, target_ulong w_addr,
+                      target_ulong val)
+{
+    if (!check_iocsrwr(env, w_addr, val)) {
+        return;
+    }
+    address_space_stq(&env->address_space_iocsr, w_addr,
+                      val, MEMTXATTRS_UNSPECIFIED, NULL);
+}
diff --git a/target/loongarch/meson.build b/target/loongarch/meson.build
index d11829a6cc..74e5f3b2a7 100644
--- a/target/loongarch/meson.build
+++ b/target/loongarch/meson.build
@@ -20,6 +20,7 @@ loongarch_softmmu_ss.add(files(
   'tlb_helper.c',
   'constant_timer.c',
   'csr_helper.c',
+  'iocsr_helper.c',
 ))
 
 loongarch_ss.add_all(when: 'CONFIG_TCG', if_true: [loongarch_tcg_ss])
-- 
2.31.1


