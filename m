Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDEB151468D
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 12:19:33 +0200 (CEST)
Received: from localhost ([::1]:34036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkNim-0008L6-Re
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 06:19:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1nkNXo-00088Q-NY
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 06:08:12 -0400
Received: from mail.loongson.cn ([114.242.206.163]:46280 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1nkNXm-00032t-8j
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 06:08:12 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxb9vhuGtiZicDAA--.14518S28; 
 Fri, 29 Apr 2022 18:07:54 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 26/43] target/loongarch: Add LoongArch IOCSR instruction
Date: Fri, 29 Apr 2022 18:07:12 +0800
Message-Id: <20220429100729.1572481-27-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220429100729.1572481-1-yangxiaojuan@loongson.cn>
References: <20220429100729.1572481-1-yangxiaojuan@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxb9vhuGtiZicDAA--.14518S28
X-Coremail-Antispam: 1UD129KBjvJXoW3KF4fGFyxZr17tryfKryfJFb_yoWDWF1Upr
 y7ur90krW8Ga9xA3Z2g3ZxWF1DXanrua17XaySy340kr47ZFyDZr18K39FgF4DJ3ykXrW0
 qrn5Ary0vFW5XaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
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
 target/loongarch/cpu.c                        | 44 ++++++++++++
 target/loongarch/cpu.h                        | 25 +++++++
 target/loongarch/disas.c                      |  8 +++
 target/loongarch/helper.h                     |  8 +++
 .../insn_trans/trans_privileged.c.inc         | 35 ++++++++++
 target/loongarch/insns.decode                 |  9 +++
 target/loongarch/iocsr_helper.c               | 67 +++++++++++++++++++
 target/loongarch/meson.build                  |  1 +
 8 files changed, 197 insertions(+)
 create mode 100644 target/loongarch/iocsr_helper.c

diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index 6d6216a846..7cf9c344db 100644
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
@@ -483,14 +485,56 @@ static void loongarch_cpu_realizefn(DeviceState *dev, Error **errp)
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
+    memory_region_init_io(&env->iocsr_mem, OBJECT(cpu), &loongarch_qemu_ops,
+                          NULL, "iocsr_misc", 0x428);
+    memory_region_add_subregion(&env->system_iocsr, 0, &env->iocsr_mem);
 }
 
 static ObjectClass *loongarch_cpu_class_by_name(const char *cpu_model)
diff --git a/target/loongarch/cpu.h b/target/loongarch/cpu.h
index 2081902f2e..03cc96ee9b 100644
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
 
@@ -283,6 +304,10 @@ typedef struct CPUArchState {
     uint64_t CSR_DSAVE;
 
     LoongArchTLB  tlb[LOONGARCH_TLB_MAX];
+
+    AddressSpace address_space_iocsr;
+    MemoryRegion system_iocsr;
+    MemoryRegion iocsr_mem;
 } CPULoongArchState;
 
 /**
diff --git a/target/loongarch/disas.c b/target/loongarch/disas.c
index 11a704ff7c..ea26aea728 100644
--- a/target/loongarch/disas.c
+++ b/target/loongarch/disas.c
@@ -615,6 +615,14 @@ INSN(bgeu,         rr_offs)
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
index ff83e568a5..3c46f9e41e 100644
--- a/target/loongarch/helper.h
+++ b/target/loongarch/helper.h
@@ -101,3 +101,11 @@ DEF_HELPER_2(csrwr_estat, i64, env, tl)
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
index ec14d6f3dd..68ddc09854 100644
--- a/target/loongarch/insn_trans/trans_privileged.c.inc
+++ b/target/loongarch/insn_trans/trans_privileged.c.inc
@@ -261,3 +261,38 @@ static bool trans_csrxchg(DisasContext *ctx, arg_csrxchg *a)
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
index 0000000000..0e9c537dc7
--- /dev/null
+++ b/target/loongarch/iocsr_helper.c
@@ -0,0 +1,67 @@
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
+void helper_iocsrwr_b(CPULoongArchState *env, target_ulong w_addr,
+                      target_ulong val)
+{
+    address_space_stb(&env->address_space_iocsr, w_addr,
+                      val, MEMTXATTRS_UNSPECIFIED, NULL);
+}
+
+void helper_iocsrwr_h(CPULoongArchState *env, target_ulong w_addr,
+                      target_ulong val)
+{
+    address_space_stw(&env->address_space_iocsr, w_addr,
+                      val, MEMTXATTRS_UNSPECIFIED, NULL);
+}
+
+void helper_iocsrwr_w(CPULoongArchState *env, target_ulong w_addr,
+                      target_ulong val)
+{
+    address_space_stl(&env->address_space_iocsr, w_addr,
+                      val, MEMTXATTRS_UNSPECIFIED, NULL);
+}
+
+void helper_iocsrwr_d(CPULoongArchState *env, target_ulong w_addr,
+                      target_ulong val)
+{
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


