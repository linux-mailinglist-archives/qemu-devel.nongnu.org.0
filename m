Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A1B44CF21
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 02:41:32 +0100 (CET)
Received: from localhost ([::1]:37600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkz5n-0004LW-GE
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 20:41:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1mkz0F-0005eK-8I
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 20:35:51 -0500
Received: from mail.loongson.cn ([114.242.206.163]:53972 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1mkz0B-0001hC-I9
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 20:35:46 -0500
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxr9Ngc4xh9RMCAA--.4955S10; 
 Thu, 11 Nov 2021 09:35:40 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 08/30] target/loongarch: Add LoongArch CSR/IOCSR
 instruction
Date: Thu, 11 Nov 2021 09:35:06 +0800
Message-Id: <1636594528-8175-9-git-send-email-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1636594528-8175-1-git-send-email-yangxiaojuan@loongson.cn>
References: <1636594528-8175-1-git-send-email-yangxiaojuan@loongson.cn>
X-CM-TRANSID: AQAAf9Dxr9Ngc4xh9RMCAA--.4955S10
X-Coremail-Antispam: 1UD129KBjvAXoWfCrWkCw15tw1fXr1xZw4DCFg_yoW5GrW5Xo
 WUGF43Xr18Wr15Kws8Cw1DXws3AFWDJwn8J34qqa4jk3WxAw1Ikry3KayvgryfGr4vvryD
 JFyUJFnIv34fZFn7n29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
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

This includes:
- CSRRD
- CSRWR
- CSRXCHG
- IOCSR{RD/WR}.{B/H/W/D}

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 target/loongarch/csr_helper.c                | 322 ++++++++++++++
 target/loongarch/helper.h                    |  11 +
 target/loongarch/insn_trans/trans_core.c.inc | 437 +++++++++++++++++++
 target/loongarch/insns.decode                |  22 +
 target/loongarch/meson.build                 |   1 +
 target/loongarch/op_helper.c                 |  10 +
 target/loongarch/translate.c                 |   5 +
 7 files changed, 808 insertions(+)
 create mode 100644 target/loongarch/csr_helper.c
 create mode 100644 target/loongarch/insn_trans/trans_core.c.inc

diff --git a/target/loongarch/csr_helper.c b/target/loongarch/csr_helper.c
new file mode 100644
index 0000000000..c9e17bed20
--- /dev/null
+++ b/target/loongarch/csr_helper.c
@@ -0,0 +1,322 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * LoongArch emulation helpers for csr registers
+ *
+ * Copyright (c) 2021 Loongson Technology Corporation Limited
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
+target_ulong helper_csr_rdq(CPULoongArchState *env, uint64_t csr)
+{
+    int64_t v;
+
+    switch (csr) {
+    case LOONGARCH_CSR_PGD:
+        if (env->CSR_TLBRERA & 0x1) {
+            v = env->CSR_TLBRBADV;
+        } else {
+            v = env->CSR_BADV;
+        }
+
+        if ((v >> 63) & 0x1) {
+            v = env->CSR_PGDH;
+        } else {
+            v = env->CSR_PGDL;
+        }
+        v = v & TARGET_PHYS_MASK;
+        break;
+    case LOONGARCH_CSR_CPUID:
+        v = (env_cpu(env))->cpu_index;
+        break;
+    case LOONGARCH_CSR_TVAL:
+        v = cpu_loongarch_get_stable_timer_ticks(env);
+        break;
+    default:
+        assert(0);
+    }
+
+    return v;
+}
+
+target_ulong helper_csr_wrq(CPULoongArchState *env, target_ulong val,
+                            uint64_t csr)
+{
+    int64_t old_v;
+    old_v = -1;
+
+    switch (csr) {
+    case LOONGARCH_CSR_ASID:
+        old_v = env->CSR_ASID;
+        env->CSR_ASID = val;
+        if (old_v != val) {
+            tlb_flush(env_cpu(env));
+        }
+        break;
+    case LOONGARCH_CSR_TCFG:
+        old_v = env->CSR_TCFG;
+        cpu_loongarch_store_stable_timer_config(env, val);
+        break;
+    case LOONGARCH_CSR_TINTCLR:
+        old_v = 0;
+        qemu_irq_lower(env->irq[IRQ_TIMER]);
+        break;
+    default:
+        assert(0);
+    }
+
+    return old_v;
+}
+
+target_ulong helper_csr_xchgq(CPULoongArchState *env, target_ulong val,
+                              target_ulong mask, uint64_t csr)
+{
+    target_ulong tmp;
+    target_ulong v = val & mask;
+
+#define CASE_CSR_XCHGQ(csr)                                 \
+    case LOONGARCH_CSR_ ## csr:                             \
+    {                                                       \
+        val = env->CSR_ ## csr;                             \
+        env->CSR_ ## csr = (env->CSR_ ## csr) & (~mask);    \
+        env->CSR_ ## csr = (env->CSR_ ## csr) | v;          \
+        break;                                              \
+    };                                                      \
+
+    switch (csr) {
+    CASE_CSR_XCHGQ(CRMD)
+    CASE_CSR_XCHGQ(PRMD)
+    CASE_CSR_XCHGQ(EUEN)
+    CASE_CSR_XCHGQ(MISC)
+    CASE_CSR_XCHGQ(ECFG)
+    CASE_CSR_XCHGQ(ESTAT)
+    CASE_CSR_XCHGQ(ERA)
+    CASE_CSR_XCHGQ(BADV)
+    CASE_CSR_XCHGQ(BADI)
+    CASE_CSR_XCHGQ(EENTRY)
+    CASE_CSR_XCHGQ(TLBIDX)
+    CASE_CSR_XCHGQ(TLBEHI)
+    CASE_CSR_XCHGQ(TLBELO0)
+    CASE_CSR_XCHGQ(TLBELO1)
+    CASE_CSR_XCHGQ(ASID)
+    CASE_CSR_XCHGQ(PGDL)
+    CASE_CSR_XCHGQ(PGDH)
+    CASE_CSR_XCHGQ(PGD)
+    CASE_CSR_XCHGQ(PWCL)
+    CASE_CSR_XCHGQ(PWCH)
+    CASE_CSR_XCHGQ(STLBPS)
+    CASE_CSR_XCHGQ(RVACFG)
+    CASE_CSR_XCHGQ(CPUID)
+    CASE_CSR_XCHGQ(PRCFG1)
+    CASE_CSR_XCHGQ(PRCFG2)
+    CASE_CSR_XCHGQ(PRCFG3)
+    CASE_CSR_XCHGQ(SAVE0)
+    CASE_CSR_XCHGQ(SAVE1)
+    CASE_CSR_XCHGQ(SAVE2)
+    CASE_CSR_XCHGQ(SAVE3)
+    CASE_CSR_XCHGQ(SAVE4)
+    CASE_CSR_XCHGQ(SAVE5)
+    CASE_CSR_XCHGQ(SAVE6)
+    CASE_CSR_XCHGQ(SAVE7)
+    CASE_CSR_XCHGQ(TMID)
+    case LOONGARCH_CSR_TCFG:
+        val = env->CSR_TCFG;
+        tmp = val & ~mask;
+        tmp |= v;
+        cpu_loongarch_store_stable_timer_config(env, tmp);
+        break;
+    CASE_CSR_XCHGQ(TVAL)
+    CASE_CSR_XCHGQ(CNTC)
+    CASE_CSR_XCHGQ(TINTCLR)
+    CASE_CSR_XCHGQ(LLBCTL)
+    CASE_CSR_XCHGQ(IMPCTL1)
+    CASE_CSR_XCHGQ(IMPCTL2)
+    CASE_CSR_XCHGQ(TLBRENTRY)
+    CASE_CSR_XCHGQ(TLBRBADV)
+    CASE_CSR_XCHGQ(TLBRERA)
+    CASE_CSR_XCHGQ(TLBRSAVE)
+    CASE_CSR_XCHGQ(TLBRELO0)
+    CASE_CSR_XCHGQ(TLBRELO1)
+    CASE_CSR_XCHGQ(TLBREHI)
+    CASE_CSR_XCHGQ(TLBRPRMD)
+    CASE_CSR_XCHGQ(MERRCTL)
+    CASE_CSR_XCHGQ(MERRINFO)
+    CASE_CSR_XCHGQ(MERRINFO1)
+    CASE_CSR_XCHGQ(MERRENT)
+    CASE_CSR_XCHGQ(MERRERA)
+    CASE_CSR_XCHGQ(MERRSAVE)
+    CASE_CSR_XCHGQ(CTAG)
+    CASE_CSR_XCHGQ(DMWIN0)
+    CASE_CSR_XCHGQ(DMWIN1)
+    CASE_CSR_XCHGQ(DMWIN2)
+    CASE_CSR_XCHGQ(DMWIN3)
+    CASE_CSR_XCHGQ(PERFCTRL0)
+    CASE_CSR_XCHGQ(PERFCNTR0)
+    CASE_CSR_XCHGQ(PERFCTRL1)
+    CASE_CSR_XCHGQ(PERFCNTR1)
+    CASE_CSR_XCHGQ(PERFCTRL2)
+    CASE_CSR_XCHGQ(PERFCNTR2)
+    CASE_CSR_XCHGQ(PERFCTRL3)
+    CASE_CSR_XCHGQ(PERFCNTR3)
+    /* debug */
+    CASE_CSR_XCHGQ(MWPC)
+    CASE_CSR_XCHGQ(MWPS)
+    CASE_CSR_XCHGQ(DB0ADDR)
+    CASE_CSR_XCHGQ(DB0MASK)
+    CASE_CSR_XCHGQ(DB0CTL)
+    CASE_CSR_XCHGQ(DB0ASID)
+    CASE_CSR_XCHGQ(DB1ADDR)
+    CASE_CSR_XCHGQ(DB1MASK)
+    CASE_CSR_XCHGQ(DB1CTL)
+    CASE_CSR_XCHGQ(DB1ASID)
+    CASE_CSR_XCHGQ(DB2ADDR)
+    CASE_CSR_XCHGQ(DB2MASK)
+    CASE_CSR_XCHGQ(DB2CTL)
+    CASE_CSR_XCHGQ(DB2ASID)
+    CASE_CSR_XCHGQ(DB3ADDR)
+    CASE_CSR_XCHGQ(DB3MASK)
+    CASE_CSR_XCHGQ(DB3CTL)
+    CASE_CSR_XCHGQ(DB3ASID)
+    CASE_CSR_XCHGQ(FWPC)
+    CASE_CSR_XCHGQ(FWPS)
+    CASE_CSR_XCHGQ(IB0ADDR)
+    CASE_CSR_XCHGQ(IB0MASK)
+    CASE_CSR_XCHGQ(IB0CTL)
+    CASE_CSR_XCHGQ(IB0ASID)
+    CASE_CSR_XCHGQ(IB1ADDR)
+    CASE_CSR_XCHGQ(IB1MASK)
+    CASE_CSR_XCHGQ(IB1CTL)
+    CASE_CSR_XCHGQ(IB1ASID)
+    CASE_CSR_XCHGQ(IB2ADDR)
+    CASE_CSR_XCHGQ(IB2MASK)
+    CASE_CSR_XCHGQ(IB2CTL)
+    CASE_CSR_XCHGQ(IB2ASID)
+    CASE_CSR_XCHGQ(IB3ADDR)
+    CASE_CSR_XCHGQ(IB3MASK)
+    CASE_CSR_XCHGQ(IB3CTL)
+    CASE_CSR_XCHGQ(IB3ASID)
+    CASE_CSR_XCHGQ(IB4ADDR)
+    CASE_CSR_XCHGQ(IB4MASK)
+    CASE_CSR_XCHGQ(IB4CTL)
+    CASE_CSR_XCHGQ(IB4ASID)
+    CASE_CSR_XCHGQ(IB5ADDR)
+    CASE_CSR_XCHGQ(IB5MASK)
+    CASE_CSR_XCHGQ(IB5CTL)
+    CASE_CSR_XCHGQ(IB5ASID)
+    CASE_CSR_XCHGQ(IB6ADDR)
+    CASE_CSR_XCHGQ(IB6MASK)
+    CASE_CSR_XCHGQ(IB6CTL)
+    CASE_CSR_XCHGQ(IB6ASID)
+    CASE_CSR_XCHGQ(IB7ADDR)
+    CASE_CSR_XCHGQ(IB7MASK)
+    CASE_CSR_XCHGQ(IB7CTL)
+    CASE_CSR_XCHGQ(IB7ASID)
+    CASE_CSR_XCHGQ(DBG)
+    CASE_CSR_XCHGQ(DERA)
+    CASE_CSR_XCHGQ(DESAVE)
+    default :
+        assert(0);
+    }
+
+#undef CASE_CSR_XCHGQ
+    return val;
+}
+
+/*
+ * For per core address 0x10xx(IPI) 0x18xx(EXTIOI)
+ * need extra adjust the iocsr addr.
+ */
+uint64_t helper_iocsr_read(CPULoongArchState *env, target_ulong r_addr,
+                           uint32_t size)
+{
+    LoongArchMachineState *lams = LOONGARCH_MACHINE(qdev_get_machine());
+    int cpuid = env_cpu(env)->cpu_index;
+
+    if (((r_addr & 0xff00) == 0x1000) || ((r_addr & 0xff00) == 0x1800)) {
+        r_addr = r_addr + ((target_ulong)(cpuid & 0x3) << 8);
+    }
+
+    if (size == 1) {
+        return address_space_ldub(lams->address_space_iocsr, r_addr,
+                                  MEMTXATTRS_UNSPECIFIED, NULL);
+    } else if (size == 2) {
+        return address_space_lduw(lams->address_space_iocsr, r_addr,
+                                  MEMTXATTRS_UNSPECIFIED, NULL);
+    } else if (size == 4) {
+        return address_space_ldl(lams->address_space_iocsr, r_addr,
+                                 MEMTXATTRS_UNSPECIFIED, NULL);
+    } else if (size == 8) {
+        return address_space_ldq(lams->address_space_iocsr, r_addr,
+                                 MEMTXATTRS_UNSPECIFIED, NULL);
+    }
+    return 0;
+}
+
+void helper_iocsr_write(CPULoongArchState *env, target_ulong w_addr,
+                        target_ulong val, uint32_t size)
+{
+    LoongArchMachineState *lams = LOONGARCH_MACHINE(qdev_get_machine());
+    int cpuid = env_cpu(env)->cpu_index;
+    int mask, i;
+
+    /*
+     * For IPI send, Mail send, ANY send adjust addr and val
+     * according to their real meaning
+     */
+    if (w_addr == 0x1040) { /* IPI send */
+        cpuid = (val >> 16) & 0x3ff;
+        val = 1UL << (val & 0x1f);
+        w_addr = 0x1008;
+    } else if (w_addr == 0x1048) { /* Mail Send */
+        cpuid = (val >> 16) & 0x3ff;
+        w_addr = 0x1020 + (val & 0x1c);
+        val = val >> 32;
+        mask = (val >> 27) & 0xf;
+        size = 4;
+    } else if (w_addr == 0x1158) { /* ANY send */
+        cpuid = (val >> 16) & 0x3ff;
+        w_addr = val & 0xffff;
+        val = val >> 32;
+        mask = (val >> 27) & 0xf;
+        size = 1;
+
+        for (i = 0; i < 4; i++) {
+            if (!((mask >> i) & 1)) {
+                address_space_stb(lams->address_space_iocsr, w_addr,
+                                  val, MEMTXATTRS_UNSPECIFIED, NULL);
+            }
+            w_addr = w_addr + 1;
+            val = val >> 8;
+        }
+        return;
+    }
+
+    if (((w_addr & 0xff00) == 0x1000) || ((w_addr & 0xff00) == 0x1800)) {
+        w_addr = w_addr + ((target_ulong)(cpuid & 0x3) << 8);
+    }
+
+    if (size == 1) {
+        address_space_stb(lams->address_space_iocsr, w_addr,
+                          val, MEMTXATTRS_UNSPECIFIED, NULL);
+    } else if (size == 2) {
+        address_space_stw(lams->address_space_iocsr, w_addr,
+                          val, MEMTXATTRS_UNSPECIFIED, NULL);
+    } else if (size == 4) {
+        address_space_stl(lams->address_space_iocsr, w_addr,
+                          val, MEMTXATTRS_UNSPECIFIED, NULL);
+    } else if (size == 8) {
+        address_space_stq(lams->address_space_iocsr, w_addr,
+                          val, MEMTXATTRS_UNSPECIFIED, NULL);
+    }
+}
diff --git a/target/loongarch/helper.h b/target/loongarch/helper.h
index 26ca6d2ae0..ad4fac4c5a 100644
--- a/target/loongarch/helper.h
+++ b/target/loongarch/helper.h
@@ -92,3 +92,14 @@ DEF_HELPER_2(frint_s, i64, env, i64)
 DEF_HELPER_2(frint_d, i64, env, i64)
 
 DEF_HELPER_FLAGS_2(set_rounding_mode, TCG_CALL_NO_RWG, void, env, i32)
+
+/*Core functions */
+#ifndef CONFIG_USER_ONLY
+DEF_HELPER_1(check_plv, void, env)
+
+DEF_HELPER_2(csr_rdq, i64, env, i64)
+DEF_HELPER_3(csr_wrq, i64, env, tl, i64)
+DEF_HELPER_4(csr_xchgq, i64, env, tl, tl, i64)
+DEF_HELPER_3(iocsr_read, i64, env, tl, i32)
+DEF_HELPER_4(iocsr_write, void, env, tl, tl, i32)
+#endif /* !CONFIG_USER_ONLY */
diff --git a/target/loongarch/insn_trans/trans_core.c.inc b/target/loongarch/insn_trans/trans_core.c.inc
new file mode 100644
index 0000000000..a6ab2571d1
--- /dev/null
+++ b/target/loongarch/insn_trans/trans_core.c.inc
@@ -0,0 +1,437 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * LoongArch translate functions for system mode
+ *
+ * Copyright (c) 2021 Loongson Technology Corporation Limited
+ */
+
+/* Privileged instruction translation */
+
+#include "cpu-csr.h"
+
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
+
+#else
+static bool trans_csrrd(DisasContext *ctx, arg_csrrd *a)
+{
+    TCGv dest = gpr_dst(ctx, a->rd, EXT_NONE);
+
+    gen_helper_check_plv(cpu_env);
+
+#define CASE_CSR_RDQ(csr)                                                     \
+    case LOONGARCH_CSR_ ## csr:                                               \
+    {                                                                         \
+        tcg_gen_ld_tl(dest, cpu_env, offsetof(CPULoongArchState, CSR_##csr)); \
+        break;                                                                \
+    };                                                                        \
+
+    switch (a->csr) {
+    CASE_CSR_RDQ(CRMD)
+    CASE_CSR_RDQ(PRMD)
+    CASE_CSR_RDQ(EUEN)
+    CASE_CSR_RDQ(MISC)
+    CASE_CSR_RDQ(ECFG)
+    CASE_CSR_RDQ(ESTAT)
+    CASE_CSR_RDQ(ERA)
+    CASE_CSR_RDQ(BADV)
+    CASE_CSR_RDQ(BADI)
+    CASE_CSR_RDQ(EENTRY)
+    CASE_CSR_RDQ(TLBIDX)
+    CASE_CSR_RDQ(TLBEHI)
+    CASE_CSR_RDQ(TLBELO0)
+    CASE_CSR_RDQ(TLBELO1)
+    CASE_CSR_RDQ(ASID)
+    CASE_CSR_RDQ(PGDL)
+    CASE_CSR_RDQ(PGDH)
+    CASE_CSR_RDQ(PWCL)
+    CASE_CSR_RDQ(PWCH)
+    CASE_CSR_RDQ(STLBPS)
+    CASE_CSR_RDQ(RVACFG)
+    CASE_CSR_RDQ(PRCFG1)
+    CASE_CSR_RDQ(PRCFG2)
+    CASE_CSR_RDQ(PRCFG3)
+    CASE_CSR_RDQ(SAVE0)
+    CASE_CSR_RDQ(SAVE1)
+    CASE_CSR_RDQ(SAVE2)
+    CASE_CSR_RDQ(SAVE3)
+    CASE_CSR_RDQ(SAVE4)
+    CASE_CSR_RDQ(SAVE5)
+    CASE_CSR_RDQ(SAVE6)
+    CASE_CSR_RDQ(SAVE7)
+    CASE_CSR_RDQ(TMID)
+    CASE_CSR_RDQ(TCFG)
+    CASE_CSR_RDQ(CNTC)
+    CASE_CSR_RDQ(TINTCLR)
+    CASE_CSR_RDQ(LLBCTL)
+    CASE_CSR_RDQ(IMPCTL1)
+    CASE_CSR_RDQ(IMPCTL2)
+    CASE_CSR_RDQ(TLBRENTRY)
+    CASE_CSR_RDQ(TLBRBADV)
+    CASE_CSR_RDQ(TLBRERA)
+    CASE_CSR_RDQ(TLBRSAVE)
+    CASE_CSR_RDQ(TLBRELO0)
+    CASE_CSR_RDQ(TLBRELO1)
+    CASE_CSR_RDQ(TLBREHI)
+    CASE_CSR_RDQ(TLBRPRMD)
+    CASE_CSR_RDQ(MERRCTL)
+    CASE_CSR_RDQ(MERRINFO)
+    CASE_CSR_RDQ(MERRINFO1)
+    CASE_CSR_RDQ(MERRENT)
+    CASE_CSR_RDQ(MERRERA)
+    CASE_CSR_RDQ(MERRSAVE)
+    CASE_CSR_RDQ(CTAG)
+    CASE_CSR_RDQ(DMWIN0)
+    CASE_CSR_RDQ(DMWIN1)
+    CASE_CSR_RDQ(DMWIN2)
+    CASE_CSR_RDQ(DMWIN3)
+    CASE_CSR_RDQ(PERFCTRL0)
+    CASE_CSR_RDQ(PERFCNTR0)
+    CASE_CSR_RDQ(PERFCTRL1)
+    CASE_CSR_RDQ(PERFCNTR1)
+    CASE_CSR_RDQ(PERFCTRL2)
+    CASE_CSR_RDQ(PERFCNTR2)
+    CASE_CSR_RDQ(PERFCTRL3)
+    CASE_CSR_RDQ(PERFCNTR3)
+    /* Debug */
+    CASE_CSR_RDQ(MWPC)
+    CASE_CSR_RDQ(MWPS)
+    CASE_CSR_RDQ(DB0ADDR)
+    CASE_CSR_RDQ(DB0MASK)
+    CASE_CSR_RDQ(DB0CTL)
+    CASE_CSR_RDQ(DB0ASID)
+    CASE_CSR_RDQ(DB1ADDR)
+    CASE_CSR_RDQ(DB1MASK)
+    CASE_CSR_RDQ(DB1CTL)
+    CASE_CSR_RDQ(DB1ASID)
+    CASE_CSR_RDQ(DB2ADDR)
+    CASE_CSR_RDQ(DB2MASK)
+    CASE_CSR_RDQ(DB2CTL)
+    CASE_CSR_RDQ(DB2ASID)
+    CASE_CSR_RDQ(DB3ADDR)
+    CASE_CSR_RDQ(DB3MASK)
+    CASE_CSR_RDQ(DB3CTL)
+    CASE_CSR_RDQ(DB3ASID)
+    CASE_CSR_RDQ(FWPC)
+    CASE_CSR_RDQ(FWPS)
+    CASE_CSR_RDQ(IB0ADDR)
+    CASE_CSR_RDQ(IB0MASK)
+    CASE_CSR_RDQ(IB0CTL)
+    CASE_CSR_RDQ(IB0ASID)
+    CASE_CSR_RDQ(IB1ADDR)
+    CASE_CSR_RDQ(IB1MASK)
+    CASE_CSR_RDQ(IB1CTL)
+    CASE_CSR_RDQ(IB1ASID)
+    CASE_CSR_RDQ(IB2ADDR)
+    CASE_CSR_RDQ(IB2MASK)
+    CASE_CSR_RDQ(IB2CTL)
+    CASE_CSR_RDQ(IB2ASID)
+    CASE_CSR_RDQ(IB3ADDR)
+    CASE_CSR_RDQ(IB3MASK)
+    CASE_CSR_RDQ(IB3CTL)
+    CASE_CSR_RDQ(IB3ASID)
+    CASE_CSR_RDQ(IB4ADDR)
+    CASE_CSR_RDQ(IB4MASK)
+    CASE_CSR_RDQ(IB4CTL)
+    CASE_CSR_RDQ(IB4ASID)
+    CASE_CSR_RDQ(IB5ADDR)
+    CASE_CSR_RDQ(IB5MASK)
+    CASE_CSR_RDQ(IB5CTL)
+    CASE_CSR_RDQ(IB5ASID)
+    CASE_CSR_RDQ(IB6ADDR)
+    CASE_CSR_RDQ(IB6MASK)
+    CASE_CSR_RDQ(IB6CTL)
+    CASE_CSR_RDQ(IB6ASID)
+    CASE_CSR_RDQ(IB7ADDR)
+    CASE_CSR_RDQ(IB7MASK)
+    CASE_CSR_RDQ(IB7CTL)
+    CASE_CSR_RDQ(IB7ASID)
+    CASE_CSR_RDQ(DBG)
+    CASE_CSR_RDQ(DERA)
+    CASE_CSR_RDQ(DESAVE)
+    case LOONGARCH_CSR_PGD:
+    case LOONGARCH_CSR_CPUID:
+    case LOONGARCH_CSR_TVAL:
+        gen_helper_csr_rdq(dest, cpu_env, tcg_constant_i64(a->csr));
+        break;
+    default:
+        assert(0);
+    }
+#undef CASE_CSR_RDQ
+
+    return true;
+}
+
+static bool trans_csrwr(DisasContext *ctx, arg_csrwr *a)
+{
+    TCGv dest = gpr_dst(ctx, a->rd, EXT_NONE);
+    TCGv src1 = gpr_src(ctx, a->rd, EXT_NONE);
+    TCGv temp = tcg_temp_new();
+
+    gen_helper_check_plv(cpu_env);
+#define CASE_CSR_WRQ(csr)                                                     \
+    case LOONGARCH_CSR_ ## csr:                                               \
+    {                                                                         \
+        tcg_gen_ld_tl(temp, cpu_env, offsetof(CPULoongArchState, CSR_##csr)); \
+        tcg_gen_st_tl(src1, cpu_env, offsetof(CPULoongArchState, CSR_##csr)); \
+        tcg_gen_mov_tl(dest, temp);                                           \
+        tcg_temp_free(temp);                                                  \
+        break;                                                                \
+    };                                                                        \
+
+    switch (a->csr) {
+    case LOONGARCH_CSR_CRMD:
+        tcg_gen_ld_tl(temp, cpu_env, offsetof(CPULoongArchState, CSR_CRMD));
+        tcg_gen_st_tl(src1, cpu_env, offsetof(CPULoongArchState, CSR_CRMD));
+        tcg_gen_mov_tl(dest, temp);
+        tcg_gen_movi_tl(cpu_pc, ctx->base.pc_next + 4);
+        tcg_temp_free(temp);
+        ctx->base.is_jmp = DISAS_EXIT;
+        break;
+    case LOONGARCH_CSR_EUEN:
+        tcg_gen_ld_tl(temp, cpu_env, offsetof(CPULoongArchState, CSR_EUEN));
+        tcg_gen_st_tl(src1, cpu_env, offsetof(CPULoongArchState, CSR_EUEN));
+        tcg_gen_mov_tl(dest, temp);
+        tcg_gen_movi_tl(cpu_pc, ctx->base.pc_next + 4);
+        tcg_temp_free(temp);
+        ctx->base.is_jmp = DISAS_EXIT;
+        break;
+    CASE_CSR_WRQ(PRMD)
+    CASE_CSR_WRQ(MISC)
+    CASE_CSR_WRQ(ECFG)
+    CASE_CSR_WRQ(ESTAT)
+    CASE_CSR_WRQ(ERA)
+    CASE_CSR_WRQ(BADV)
+    CASE_CSR_WRQ(BADI)
+    CASE_CSR_WRQ(EENTRY)
+    CASE_CSR_WRQ(TLBIDX)
+    CASE_CSR_WRQ(TLBEHI)
+    CASE_CSR_WRQ(TLBELO0)
+    CASE_CSR_WRQ(TLBELO1)
+    CASE_CSR_WRQ(PGDL)
+    CASE_CSR_WRQ(PGDH)
+    CASE_CSR_WRQ(PWCL)
+    CASE_CSR_WRQ(PWCH)
+    CASE_CSR_WRQ(STLBPS)
+    CASE_CSR_WRQ(RVACFG)
+    CASE_CSR_WRQ(PRCFG1)
+    CASE_CSR_WRQ(PRCFG2)
+    CASE_CSR_WRQ(PRCFG3)
+    CASE_CSR_WRQ(SAVE0)
+    CASE_CSR_WRQ(SAVE1)
+    CASE_CSR_WRQ(SAVE2)
+    CASE_CSR_WRQ(SAVE3)
+    CASE_CSR_WRQ(SAVE4)
+    CASE_CSR_WRQ(SAVE5)
+    CASE_CSR_WRQ(SAVE6)
+    CASE_CSR_WRQ(SAVE7)
+    CASE_CSR_WRQ(TMID)
+    CASE_CSR_WRQ(TVAL)
+    CASE_CSR_WRQ(CNTC)
+    CASE_CSR_WRQ(LLBCTL)
+    CASE_CSR_WRQ(IMPCTL1)
+    CASE_CSR_WRQ(IMPCTL2)
+    CASE_CSR_WRQ(TLBRENTRY)
+    CASE_CSR_WRQ(TLBRBADV)
+    CASE_CSR_WRQ(TLBRERA)
+    CASE_CSR_WRQ(TLBRSAVE)
+    CASE_CSR_WRQ(TLBRELO0)
+    CASE_CSR_WRQ(TLBRELO1)
+    CASE_CSR_WRQ(TLBREHI)
+    CASE_CSR_WRQ(TLBRPRMD)
+    CASE_CSR_WRQ(MERRCTL)
+    CASE_CSR_WRQ(MERRINFO)
+    CASE_CSR_WRQ(MERRINFO1)
+    CASE_CSR_WRQ(MERRENT)
+    CASE_CSR_WRQ(MERRERA)
+    CASE_CSR_WRQ(MERRSAVE)
+    CASE_CSR_WRQ(CTAG)
+    CASE_CSR_WRQ(DMWIN0)
+    CASE_CSR_WRQ(DMWIN1)
+    CASE_CSR_WRQ(DMWIN2)
+    CASE_CSR_WRQ(DMWIN3)
+    CASE_CSR_WRQ(PERFCTRL0)
+    CASE_CSR_WRQ(PERFCNTR0)
+    CASE_CSR_WRQ(PERFCTRL1)
+    CASE_CSR_WRQ(PERFCNTR1)
+    CASE_CSR_WRQ(PERFCTRL2)
+    CASE_CSR_WRQ(PERFCNTR2)
+    CASE_CSR_WRQ(PERFCTRL3)
+    CASE_CSR_WRQ(PERFCNTR3)
+    /* Debug */
+    CASE_CSR_WRQ(MWPC)
+    CASE_CSR_WRQ(MWPS)
+    CASE_CSR_WRQ(DB0ADDR)
+    CASE_CSR_WRQ(DB0MASK)
+    CASE_CSR_WRQ(DB0CTL)
+    CASE_CSR_WRQ(DB0ASID)
+    CASE_CSR_WRQ(DB1ADDR)
+    CASE_CSR_WRQ(DB1MASK)
+    CASE_CSR_WRQ(DB1CTL)
+    CASE_CSR_WRQ(DB1ASID)
+    CASE_CSR_WRQ(DB2ADDR)
+    CASE_CSR_WRQ(DB2MASK)
+    CASE_CSR_WRQ(DB2CTL)
+    CASE_CSR_WRQ(DB2ASID)
+    CASE_CSR_WRQ(DB3ADDR)
+    CASE_CSR_WRQ(DB3MASK)
+    CASE_CSR_WRQ(DB3CTL)
+    CASE_CSR_WRQ(DB3ASID)
+    CASE_CSR_WRQ(FWPC)
+    CASE_CSR_WRQ(FWPS)
+    CASE_CSR_WRQ(IB0ADDR)
+    CASE_CSR_WRQ(IB0MASK)
+    CASE_CSR_WRQ(IB0CTL)
+    CASE_CSR_WRQ(IB0ASID)
+    CASE_CSR_WRQ(IB1ADDR)
+    CASE_CSR_WRQ(IB1MASK)
+    CASE_CSR_WRQ(IB1CTL)
+    CASE_CSR_WRQ(IB1ASID)
+    CASE_CSR_WRQ(IB2ADDR)
+    CASE_CSR_WRQ(IB2MASK)
+    CASE_CSR_WRQ(IB2CTL)
+    CASE_CSR_WRQ(IB2ASID)
+    CASE_CSR_WRQ(IB3ADDR)
+    CASE_CSR_WRQ(IB3MASK)
+    CASE_CSR_WRQ(IB3CTL)
+    CASE_CSR_WRQ(IB3ASID)
+    CASE_CSR_WRQ(IB4ADDR)
+    CASE_CSR_WRQ(IB4MASK)
+    CASE_CSR_WRQ(IB4CTL)
+    CASE_CSR_WRQ(IB4ASID)
+    CASE_CSR_WRQ(IB5ADDR)
+    CASE_CSR_WRQ(IB5MASK)
+    CASE_CSR_WRQ(IB5CTL)
+    CASE_CSR_WRQ(IB5ASID)
+    CASE_CSR_WRQ(IB6ADDR)
+    CASE_CSR_WRQ(IB6MASK)
+    CASE_CSR_WRQ(IB6CTL)
+    CASE_CSR_WRQ(IB6ASID)
+    CASE_CSR_WRQ(IB7ADDR)
+    CASE_CSR_WRQ(IB7MASK)
+    CASE_CSR_WRQ(IB7CTL)
+    CASE_CSR_WRQ(IB7ASID)
+    CASE_CSR_WRQ(DBG)
+    CASE_CSR_WRQ(DERA)
+    CASE_CSR_WRQ(DESAVE)
+    case LOONGARCH_CSR_ASID:
+    case LOONGARCH_CSR_TCFG:
+    case LOONGARCH_CSR_TINTCLR:
+        gen_helper_csr_wrq(dest, cpu_env, src1, tcg_constant_i64(a->csr));
+        break;
+    default:
+        assert(0);
+    }
+#undef CASE_CSR_WRQ
+
+    return true;
+}
+
+static bool trans_csrxchg(DisasContext *ctx, arg_csrxchg *a)
+{
+    TCGv dest = gpr_dst(ctx, a->rd, EXT_NONE);
+    TCGv src1 = gpr_src(ctx, a->rd, EXT_NONE);
+    TCGv src2 = gpr_src(ctx, a->rj, EXT_NONE);
+
+    gen_helper_check_plv(cpu_env);
+    gen_helper_csr_xchgq(dest, cpu_env, src1, src2, tcg_constant_i64(a->csr));
+    return true;
+}
+
+static bool trans_iocsrrd_b(DisasContext *ctx, arg_iocsrrd_b *a)
+{
+    TCGv dest = gpr_dst(ctx, a->rd, EXT_NONE);
+    TCGv src1 = gpr_src(ctx, a->rj, EXT_NONE);
+
+    gen_helper_check_plv(cpu_env);
+    gen_helper_iocsr_read(dest, cpu_env, src1, tcg_constant_i32(1));
+    return true;
+}
+
+static bool trans_iocsrrd_h(DisasContext *ctx, arg_iocsrrd_h *a)
+{
+    TCGv dest = gpr_dst(ctx, a->rd, EXT_NONE);
+    TCGv src1 = gpr_src(ctx, a->rj, EXT_NONE);
+
+    gen_helper_check_plv(cpu_env);
+    gen_helper_iocsr_read(dest, cpu_env, src1, tcg_constant_i32(2));
+    return true;
+}
+
+static bool trans_iocsrrd_w(DisasContext *ctx, arg_iocsrrd_w *a)
+{
+    TCGv dest = gpr_dst(ctx, a->rd, EXT_NONE);
+    TCGv src1 = gpr_src(ctx, a->rj, EXT_NONE);
+
+    gen_helper_check_plv(cpu_env);
+    gen_helper_iocsr_read(dest, cpu_env, src1, tcg_constant_i32(4));
+    return true;
+}
+
+static bool trans_iocsrrd_d(DisasContext *ctx, arg_iocsrrd_d *a)
+{
+    TCGv dest = gpr_dst(ctx, a->rd, EXT_NONE);
+    TCGv src1 = gpr_src(ctx, a->rj, EXT_NONE);
+
+    gen_helper_check_plv(cpu_env);
+    gen_helper_iocsr_read(dest, cpu_env, src1, tcg_constant_i32(8));
+    return true;
+}
+
+static bool trans_iocsrwr_b(DisasContext *ctx, arg_iocsrwr_b *a)
+{
+    TCGv val = gpr_src(ctx, a->rd, EXT_NONE);
+    TCGv addr = gpr_src(ctx, a->rj, EXT_NONE);
+
+    gen_helper_check_plv(cpu_env);
+    gen_helper_iocsr_write(cpu_env, addr, val, tcg_constant_i32(1));
+    return true;
+}
+
+static bool trans_iocsrwr_h(DisasContext *ctx, arg_iocsrwr_h *a)
+{
+    TCGv val = gpr_src(ctx, a->rd, EXT_NONE);
+    TCGv addr = gpr_src(ctx, a->rj, EXT_NONE);
+
+    gen_helper_check_plv(cpu_env);
+    gen_helper_iocsr_write(cpu_env, addr, val, tcg_constant_i32(2));
+    return true;
+}
+
+static bool trans_iocsrwr_w(DisasContext *ctx, arg_iocsrwr_w *a)
+{
+    TCGv val = gpr_src(ctx, a->rd, EXT_NONE);
+    TCGv addr = gpr_src(ctx, a->rj, EXT_NONE);
+
+    gen_helper_check_plv(cpu_env);
+    gen_helper_iocsr_write(cpu_env, addr, val, tcg_constant_i32(4));
+    return true;
+}
+
+static bool trans_iocsrwr_d(DisasContext *ctx, arg_iocsrwr_d *a)
+{
+    TCGv val = gpr_src(ctx, a->rd, EXT_NONE);
+    TCGv addr = gpr_src(ctx, a->rj, EXT_NONE);
+
+    gen_helper_check_plv(cpu_env);
+    gen_helper_iocsr_write(cpu_env, addr, val, tcg_constant_i32(8));
+    return true;
+}
+#endif
diff --git a/target/loongarch/insns.decode b/target/loongarch/insns.decode
index e28b843195..a867cb84d2 100644
--- a/target/loongarch/insns.decode
+++ b/target/loongarch/insns.decode
@@ -40,6 +40,7 @@
 %offs21  0:s5 10:16
 %offs16  10:s16
 %offs    0:s10 10:16
+%csr     10:14
 
 #
 # Argument sets
@@ -81,6 +82,8 @@
 &fmt_rdrjoffs16     rd rj offs16
 &fmt_offs           offs
 &fmt_rjrdoffs16     rj rd offs16
+&fmt_rdcsr          rd csr
+&fmt_rdrjcsr        rd rj csr
 
 #
 # Formats
@@ -122,6 +125,8 @@
 @fmt_rdrjoffs16      .... .. ................ ..... .....     &fmt_rdrjoffs16     %rd %rj %offs16
 @fmt_offs            .... .. ..........................       &fmt_offs           %offs
 @fmt_rjrdoffs16      .... .. ................ ..... .....     &fmt_rjrdoffs16     %rj %rd %offs16
+@fmt_rdcsr           .... .... .............. ..... .....     &fmt_rdcsr          %rd %csr
+@fmt_rdrjcsr         .... .... .............. ..... .....     &fmt_rdrjcsr        %rd %rj %csr
 
 #
 # Fixed point arithmetic operation instruction
@@ -477,3 +482,20 @@ blt              0110 00 ................ ..... .....     @fmt_rjrdoffs16
 bge              0110 01 ................ ..... .....     @fmt_rjrdoffs16
 bltu             0110 10 ................ ..... .....     @fmt_rjrdoffs16
 bgeu             0110 11 ................ ..... .....     @fmt_rjrdoffs16
+
+#
+# Core instructions
+#
+{
+  csrrd             0000 0100 .............. 00000 .....     @fmt_rdcsr
+  csrwr             0000 0100 .............. 00001 .....     @fmt_rdcsr
+  csrxchg           0000 0100 .............. ..... .....     @fmt_rdrjcsr
+}
+iocsrrd_b        0000 01100100 10000 00000 ..... .....    @fmt_rdrj
+iocsrrd_h        0000 01100100 10000 00001 ..... .....    @fmt_rdrj
+iocsrrd_w        0000 01100100 10000 00010 ..... .....    @fmt_rdrj
+iocsrrd_d        0000 01100100 10000 00011 ..... .....    @fmt_rdrj
+iocsrwr_b        0000 01100100 10000 00100 ..... .....    @fmt_rdrj
+iocsrwr_h        0000 01100100 10000 00101 ..... .....    @fmt_rdrj
+iocsrwr_w        0000 01100100 10000 00110 ..... .....    @fmt_rdrj
+iocsrwr_d        0000 01100100 10000 00111 ..... .....    @fmt_rdrj
diff --git a/target/loongarch/meson.build b/target/loongarch/meson.build
index 935ffe2765..080d6297de 100644
--- a/target/loongarch/meson.build
+++ b/target/loongarch/meson.build
@@ -19,6 +19,7 @@ loongarch_softmmu_ss.add(files(
   'machine.c',
   'stabletimer.c',
   'tlb_helper.c',
+  'csr_helper.c',
 ))
 
 loongarch_ss.add_all(when: 'CONFIG_TCG', if_true: [loongarch_tcg_ss])
diff --git a/target/loongarch/op_helper.c b/target/loongarch/op_helper.c
index fdd43032c4..20014ef07a 100644
--- a/target/loongarch/op_helper.c
+++ b/target/loongarch/op_helper.c
@@ -82,3 +82,13 @@ target_ulong helper_cpucfg(CPULoongArchState *env, target_ulong rj)
 {
     return env->cpucfg[rj];
 }
+
+#ifndef CONFIG_USER_ONLY
+void helper_check_plv(CPULoongArchState *env)
+{
+    uint64_t plv = FIELD_EX64(env->CSR_CRMD, CSR_CRMD, PLV);
+    if (plv) {
+        do_raise_exception(env, EXCP_IPE, GETPC());
+    }
+}
+#endif /* !CONFIG_USER_ONLY */
diff --git a/target/loongarch/translate.c b/target/loongarch/translate.c
index 437f33d522..3935b14163 100644
--- a/target/loongarch/translate.c
+++ b/target/loongarch/translate.c
@@ -26,6 +26,7 @@ TCGv_i32 cpu_fcsr0;
 TCGv_i64 cpu_fpr[32];
 
 #define DISAS_STOP       DISAS_TARGET_0
+#define DISAS_EXIT       DISAS_TARGET_1
 
 /*
  * LoongArch the upper 32 bits are undefined ("can be any value").
@@ -191,6 +192,7 @@ static void gen_set_gpr(int reg_num, TCGv t, DisasExtend dst_ext)
 #include "insn_trans/trans_fmov.c.inc"
 #include "insn_trans/trans_fmemory.c.inc"
 #include "insn_trans/trans_branch.c.inc"
+#include "insn_trans/trans_core.c.inc"
 
 static void loongarch_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
 {
@@ -228,6 +230,9 @@ static void loongarch_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
         break;
     case DISAS_NORETURN:
         break;
+    case DISAS_EXIT:
+        tcg_gen_exit_tb(NULL, 0);
+        break;
     default:
         g_assert_not_reached();
     }
-- 
2.27.0


