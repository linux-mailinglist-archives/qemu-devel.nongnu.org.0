Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 016F34684E2
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Dec 2021 13:48:08 +0100 (CET)
Received: from localhost ([::1]:35740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mtUSV-0007bH-2e
	for lists+qemu-devel@lfdr.de; Sat, 04 Dec 2021 07:48:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1mtTw8-00008S-5t
 for qemu-devel@nongnu.org; Sat, 04 Dec 2021 07:14:40 -0500
Received: from mail.loongson.cn ([114.242.206.163]:59552 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1mtTw3-00007D-78
 for qemu-devel@nongnu.org; Sat, 04 Dec 2021 07:14:39 -0500
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Axysj9Wath8+ECAA--.6122S10; 
 Sat, 04 Dec 2021 20:07:31 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v3 08/27] target/loongarch: Add LoongArch IOCSR instruction
Date: Sat,  4 Dec 2021 20:07:06 +0800
Message-Id: <1638619645-11283-9-git-send-email-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1638619645-11283-1-git-send-email-yangxiaojuan@loongson.cn>
References: <1638619645-11283-1-git-send-email-yangxiaojuan@loongson.cn>
X-CM-TRANSID: AQAAf9Axysj9Wath8+ECAA--.6122S10
X-Coremail-Antispam: 1UD129KBjvJXoWxtrWUKr18Gr4UJFWDCFWkXrb_yoWfKr48pr
 4xCr1UCrW8Ga93AasYg343WFn8Zan7uF42qaySyw1Fkw43ZF9rZr10k343KFWUJ34kXrW8
 XFs5AFWjqFW5XaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, chenhuacai@loongson.cn,
 philmd@redhat.com, i.qemu@xen0n.name, mark.cave-ayland@ilande.co.uk,
 laurent@vivier.eu, peterx@redhat.com, f4bug@amsat.org,
 yangxiaojuan@loongson.cn, alistair.francis@wdc.com, maobibo@loongson.cn,
 pbonzini@redhat.com, richard.henderson@linaro.org, alex.bennee@linaro.org,
 gaosong@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This includes:
- IOCSR{RD/WR}.{B/H/W/D}

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 target/loongarch/disas.c                     |   8 ++
 target/loongarch/helper.h                    |   2 +
 target/loongarch/insn_trans/trans_core.c.inc | 103 ++++++++++++++++++
 target/loongarch/insns.decode                |   9 ++
 target/loongarch/iocsr_helper.c              | 109 +++++++++++++++++++
 target/loongarch/meson.build                 |   1 +
 6 files changed, 232 insertions(+)
 create mode 100644 target/loongarch/iocsr_helper.c

diff --git a/target/loongarch/disas.c b/target/loongarch/disas.c
index de683bb88b..cbb264a318 100644
--- a/target/loongarch/disas.c
+++ b/target/loongarch/disas.c
@@ -531,6 +531,14 @@ INSN(bgeu,         rr_offs)
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
index 036dbf31f8..1bcd082858 100644
--- a/target/loongarch/helper.h
+++ b/target/loongarch/helper.h
@@ -98,4 +98,6 @@ DEF_HELPER_FLAGS_2(set_rounding_mode, TCG_CALL_NO_RWG, void, env, i32)
 DEF_HELPER_2(csr_rdq, i64, env, i64)
 DEF_HELPER_3(csr_wrq, i64, env, tl, i64)
 DEF_HELPER_4(csr_xchgq, i64, env, tl, tl, i64)
+DEF_HELPER_3(iocsr_read, i64, env, tl, i32)
+DEF_HELPER_4(iocsr_write, void, env, tl, tl, i32)
 #endif /* !CONFIG_USER_ONLY */
diff --git a/target/loongarch/insn_trans/trans_core.c.inc b/target/loongarch/insn_trans/trans_core.c.inc
index 7d2cfe3534..592d2a339e 100644
--- a/target/loongarch/insn_trans/trans_core.c.inc
+++ b/target/loongarch/insn_trans/trans_core.c.inc
@@ -20,6 +20,14 @@ static bool trans_##name(DisasContext *ctx, arg_##name * a)  \
 GEN_FALSE_TRANS(csrrd)
 GEN_FALSE_TRANS(csrwr)
 GEN_FALSE_TRANS(csrxchg)
+GEN_FALSE_TRANS(iocsrrd_b)
+GEN_FALSE_TRANS(iocsrrd_h)
+GEN_FALSE_TRANS(iocsrrd_w)
+GEN_FALSE_TRANS(iocsrrd_d)
+GEN_FALSE_TRANS(iocsrwr_b)
+GEN_FALSE_TRANS(iocsrwr_h)
+GEN_FALSE_TRANS(iocsrwr_w)
+GEN_FALSE_TRANS(iocsrwr_d)
 
 #else
 
@@ -120,4 +128,99 @@ static bool trans_csrxchg(DisasContext *ctx, arg_csrxchg *a)
     return true;
 }
 
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
 #endif
diff --git a/target/loongarch/insns.decode b/target/loongarch/insns.decode
index 647fcb9def..9a43f288c3 100644
--- a/target/loongarch/insns.decode
+++ b/target/loongarch/insns.decode
@@ -453,3 +453,12 @@ bgeu            0110 11 ................ ..... .....     @rr_offs16
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
index 0000000000..c7be8cfd7b
--- /dev/null
+++ b/target/loongarch/iocsr_helper.c
@@ -0,0 +1,109 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * LoongArch emulation helpers for iocsr read/write
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
+        return address_space_ldub(&lams->address_space_iocsr, r_addr,
+                                  MEMTXATTRS_UNSPECIFIED, NULL);
+    } else if (size == 2) {
+        return address_space_lduw(&lams->address_space_iocsr, r_addr,
+                                  MEMTXATTRS_UNSPECIFIED, NULL);
+    } else if (size == 4) {
+        return address_space_ldl(&lams->address_space_iocsr, r_addr,
+                                 MEMTXATTRS_UNSPECIFIED, NULL);
+    } else if (size == 8) {
+        return address_space_ldq(&lams->address_space_iocsr, r_addr,
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
+     * according to their real meaning. The iocsr write
+     * will finally lead to the corresponding mmio write
+     * all operations handled there.
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
+                address_space_stb(&lams->address_space_iocsr, w_addr,
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
+        address_space_stb(&lams->address_space_iocsr, w_addr,
+                          val, MEMTXATTRS_UNSPECIFIED, NULL);
+    } else if (size == 2) {
+        address_space_stw(&lams->address_space_iocsr, w_addr,
+                          val, MEMTXATTRS_UNSPECIFIED, NULL);
+    } else if (size == 4) {
+        address_space_stl(&lams->address_space_iocsr, w_addr,
+                          val, MEMTXATTRS_UNSPECIFIED, NULL);
+    } else if (size == 8) {
+        address_space_stq(&lams->address_space_iocsr, w_addr,
+                          val, MEMTXATTRS_UNSPECIFIED, NULL);
+    }
+}
diff --git a/target/loongarch/meson.build b/target/loongarch/meson.build
index 080d6297de..2b2feb886a 100644
--- a/target/loongarch/meson.build
+++ b/target/loongarch/meson.build
@@ -20,6 +20,7 @@ loongarch_softmmu_ss.add(files(
   'stabletimer.c',
   'tlb_helper.c',
   'csr_helper.c',
+  'iocsr_helper.c',
 ))
 
 loongarch_ss.add_all(when: 'CONFIG_TCG', if_true: [loongarch_tcg_ss])
-- 
2.27.0


