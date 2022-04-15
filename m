Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E9050284F
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Apr 2022 12:31:07 +0200 (CEST)
Received: from localhost ([::1]:58222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nfJEI-0004Oh-7Y
	for lists+qemu-devel@lfdr.de; Fri, 15 Apr 2022 06:31:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1nfIXq-00005n-OH
 for qemu-devel@nongnu.org; Fri, 15 Apr 2022 05:47:14 -0400
Received: from mail.loongson.cn ([114.242.206.163]:55726 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1nfIXn-0005Oa-Ty
 for qemu-devel@nongnu.org; Fri, 15 Apr 2022 05:47:14 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx_xGqPVli41gkAA--.16856S28; 
 Fri, 15 Apr 2022 17:41:27 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 26/43] target/loongarch: Add LoongArch IOCSR instruction
Date: Fri, 15 Apr 2022 17:40:41 +0800
Message-Id: <20220415094058.3584233-27-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220415094058.3584233-1-yangxiaojuan@loongson.cn>
References: <20220415094058.3584233-1-yangxiaojuan@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dx_xGqPVli41gkAA--.16856S28
X-Coremail-Antispam: 1UD129KBjvJXoWxtrW5JF4fZrWfKF48KF1Dtrb_yoWDJFWfpr
 47Cr1jkrW8G393A3sYgw13WFn8Z3Z7uF42qaySyw1Fkw47XF9rZry8K3sIgFWUJrykXr40
 qr4rArWjqFWrXaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
 target/loongarch/cpu.h                        |   3 +
 target/loongarch/disas.c                      |   8 +
 target/loongarch/helper.h                     |   2 +
 .../insn_trans/trans_privileged.c.inc         |  96 ++++++++++++
 target/loongarch/insns.decode                 |   9 ++
 target/loongarch/iocsr_helper.c               | 139 ++++++++++++++++++
 target/loongarch/meson.build                  |   1 +
 7 files changed, 258 insertions(+)
 create mode 100644 target/loongarch/iocsr_helper.c

diff --git a/target/loongarch/cpu.h b/target/loongarch/cpu.h
index e907fe3c51..e097ca03ee 100644
--- a/target/loongarch/cpu.h
+++ b/target/loongarch/cpu.h
@@ -284,6 +284,9 @@ typedef struct CPUArchState {
     uint64_t CSR_DSAVE;
 
     LoongArchTLB  tlb[LOONGARCH_TLB_MAX];
+
+    AddressSpace address_space_iocsr;
+    MemoryRegion system_iocsr;
 } CPULoongArchState;
 
 /**
diff --git a/target/loongarch/disas.c b/target/loongarch/disas.c
index db0e0c73fe..9cc39e7817 100644
--- a/target/loongarch/disas.c
+++ b/target/loongarch/disas.c
@@ -529,6 +529,14 @@ INSN(bgeu,         rr_offs)
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
index bd2cb3a9c5..e99a714bb4 100644
--- a/target/loongarch/helper.h
+++ b/target/loongarch/helper.h
@@ -101,3 +101,5 @@ DEF_HELPER_2(csrwr_asid, i64, env, tl)
 DEF_HELPER_2(csrwr_tcfg, i64, env, tl)
 DEF_HELPER_2(csrwr_ticlr, i64, env, tl)
 DEF_HELPER_3(csr_update, void, env, tl, i64)
+DEF_HELPER_3(iocsr_read, i64, env, tl, i32)
+DEF_HELPER_4(iocsr_write, void, env, tl, tl, i32)
diff --git a/target/loongarch/insn_trans/trans_privileged.c.inc b/target/loongarch/insn_trans/trans_privileged.c.inc
index ba111779c2..6b8b79cd1c 100644
--- a/target/loongarch/insn_trans/trans_privileged.c.inc
+++ b/target/loongarch/insn_trans/trans_privileged.c.inc
@@ -175,3 +175,99 @@ static bool trans_csrxchg(DisasContext *ctx, arg_csrxchg *a)
 
     return true;
 }
+
+static bool trans_iocsrrd_b(DisasContext *ctx, arg_iocsrrd_b *a)
+{
+    TCGv dest = gpr_dst(ctx, a->rd, EXT_NONE);
+    TCGv src1 = gpr_src(ctx, a->rj, EXT_NONE);
+
+    if (check_plv(ctx)) {
+        return false;
+    }
+    gen_helper_iocsr_read(dest, cpu_env, src1, tcg_constant_i32(1));
+    return true;
+}
+
+static bool trans_iocsrrd_h(DisasContext *ctx, arg_iocsrrd_h *a)
+{
+    TCGv dest = gpr_dst(ctx, a->rd, EXT_NONE);
+    TCGv src1 = gpr_src(ctx, a->rj, EXT_NONE);
+
+    if (check_plv(ctx)) {
+        return false;
+    }
+    gen_helper_iocsr_read(dest, cpu_env, src1, tcg_constant_i32(2));
+    return true;
+}
+
+static bool trans_iocsrrd_w(DisasContext *ctx, arg_iocsrrd_w *a)
+{
+    TCGv dest = gpr_dst(ctx, a->rd, EXT_NONE);
+    TCGv src1 = gpr_src(ctx, a->rj, EXT_NONE);
+
+    if (check_plv(ctx)) {
+        return false;
+    }
+    gen_helper_iocsr_read(dest, cpu_env, src1, tcg_constant_i32(4));
+    return true;
+}
+
+static bool trans_iocsrrd_d(DisasContext *ctx, arg_iocsrrd_d *a)
+{
+    TCGv dest = gpr_dst(ctx, a->rd, EXT_NONE);
+    TCGv src1 = gpr_src(ctx, a->rj, EXT_NONE);
+
+    if (check_plv(ctx)) {
+        return false;
+    }
+    gen_helper_iocsr_read(dest, cpu_env, src1, tcg_constant_i32(8));
+    return true;
+}
+
+static bool trans_iocsrwr_b(DisasContext *ctx, arg_iocsrwr_b *a)
+{
+    TCGv val = gpr_src(ctx, a->rd, EXT_NONE);
+    TCGv addr = gpr_src(ctx, a->rj, EXT_NONE);
+
+    if (check_plv(ctx)) {
+        return false;
+    }
+    gen_helper_iocsr_write(cpu_env, addr, val, tcg_constant_i32(1));
+    return true;
+}
+
+static bool trans_iocsrwr_h(DisasContext *ctx, arg_iocsrwr_h *a)
+{
+    TCGv val = gpr_src(ctx, a->rd, EXT_NONE);
+    TCGv addr = gpr_src(ctx, a->rj, EXT_NONE);
+
+    if (check_plv(ctx)) {
+        return false;
+    }
+    gen_helper_iocsr_write(cpu_env, addr, val, tcg_constant_i32(2));
+    return true;
+}
+
+static bool trans_iocsrwr_w(DisasContext *ctx, arg_iocsrwr_w *a)
+{
+    TCGv val = gpr_src(ctx, a->rd, EXT_NONE);
+    TCGv addr = gpr_src(ctx, a->rj, EXT_NONE);
+
+    if (check_plv(ctx)) {
+        return false;
+    }
+    gen_helper_iocsr_write(cpu_env, addr, val, tcg_constant_i32(4));
+    return true;
+}
+
+static bool trans_iocsrwr_d(DisasContext *ctx, arg_iocsrwr_d *a)
+{
+    TCGv val = gpr_src(ctx, a->rd, EXT_NONE);
+    TCGv addr = gpr_src(ctx, a->rj, EXT_NONE);
+
+    if (check_plv(ctx)) {
+        return false;
+    }
+    gen_helper_iocsr_write(cpu_env, addr, val, tcg_constant_i32(8));
+    return true;
+}
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
index 0000000000..aec144880c
--- /dev/null
+++ b/target/loongarch/iocsr_helper.c
@@ -0,0 +1,139 @@
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
+#include "hw/irq.h"
+#include "cpu-csr.h"
+#include "hw/loongarch/loongarch.h"
+#include "tcg/tcg-ldst.h"
+
+uint64_t helper_iocsr_read(CPULoongArchState *env, target_ulong r_addr,
+                           uint32_t size)
+{
+    int cpuid = env_cpu(env)->cpu_index;
+    CPUState  *cs = qemu_get_cpu(cpuid);
+    env = cs->env_ptr;
+    uint64_t ret = 0;
+
+    /*
+     * Adjust the per core address such as 0x10xx(IPI)/0x18xx(EXTIOI)
+     */
+    if (((r_addr & 0xff00) == 0x1000) || ((r_addr & 0xff00) == 0x1800)) {
+        r_addr = r_addr + ((target_ulong)(cpuid & 0x3) << 8);
+    }
+
+    switch (size) {
+    case 1:
+        ret = address_space_ldub(&env->address_space_iocsr, r_addr,
+                                 MEMTXATTRS_UNSPECIFIED, NULL);
+        break;
+    case 2:
+        ret = address_space_lduw(&env->address_space_iocsr, r_addr,
+                                 MEMTXATTRS_UNSPECIFIED, NULL);
+        break;
+    case 4:
+        ret = address_space_ldl(&env->address_space_iocsr, r_addr,
+                                MEMTXATTRS_UNSPECIFIED, NULL);
+        break;
+    case 8:
+        ret = address_space_ldq(&env->address_space_iocsr, r_addr,
+                                MEMTXATTRS_UNSPECIFIED, NULL);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+    return ret;
+}
+
+void helper_iocsr_write(CPULoongArchState *env, target_ulong w_addr,
+                        target_ulong val, uint32_t size)
+{
+    int cpuid = env_cpu(env)->cpu_index;
+    CPUState *cs = qemu_get_cpu(cpuid);
+    int mask, i;
+    env = cs->env_ptr;
+
+    /*
+     * For IPI send, Mailbox send and ANY send, adjust the addr and
+     * val accordingly. The IOCSR writes are turned to different
+     * MMIO writes respectively
+     */
+    switch (w_addr) {
+    case 0x1040: /* IPI send */
+        cpuid = (val >> 16) & 0x3ff;
+        val = 1UL << (val & 0x1f);
+        if (val) {
+            qemu_mutex_lock_iothread();
+            cs = qemu_get_cpu(cpuid);
+            env = cs->env_ptr;
+            LoongArchCPU *cpu = LOONGARCH_CPU(cs);
+            loongarch_cpu_set_irq(cpu, IRQ_IPI, 1);
+            qemu_mutex_unlock_iothread();
+        }
+        break;
+    case 0x1048: /* Mail Send */
+        cpuid = (val >> 16) & 0x3ff;
+        w_addr = 0x1020 + (val & 0x1c);
+        val = val >> 32;
+        mask = (val >> 27) & 0xf;
+        size = 4;
+        env = (qemu_get_cpu(cpuid))->env_ptr;
+        break;
+    case 0x1158: /* ANY send */
+        cpuid = (val >> 16) & 0x3ff;
+        w_addr = val & 0xffff;
+        val = val >> 32;
+        mask = (val >> 27) & 0xf;
+        size = 1;
+        env = (qemu_get_cpu(cpuid))->env_ptr;
+
+        for (i = 0; i < 4; i++) {
+            if (!((mask >> i) & 1)) {
+                address_space_stb(&env->address_space_iocsr, w_addr,
+                                  val, MEMTXATTRS_UNSPECIFIED, NULL);
+            }
+            w_addr = w_addr + 1;
+            val = val >> 8;
+        }
+        return;
+    default:
+       break;
+    }
+
+    if (((w_addr & 0xff00) == 0x1000) || ((w_addr & 0xff00) == 0x1800)) {
+        w_addr = w_addr + ((target_ulong)(cpuid & 0x3) << 8);
+    }
+
+    switch (size) {
+    case 1:
+        address_space_stb(&env->address_space_iocsr, w_addr,
+                          val, MEMTXATTRS_UNSPECIFIED, NULL);
+        break;
+    case 2:
+        address_space_stw(&env->address_space_iocsr, w_addr,
+                          val, MEMTXATTRS_UNSPECIFIED, NULL);
+        break;
+    case 4:
+        address_space_stl(&env->address_space_iocsr, w_addr,
+                          val, MEMTXATTRS_UNSPECIFIED, NULL);
+        break;
+    case 8:
+        address_space_stq(&env->address_space_iocsr, w_addr,
+                          val, MEMTXATTRS_UNSPECIFIED, NULL);
+        break;
+    default:
+        g_assert_not_reached();
+    }
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


