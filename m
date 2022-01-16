Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6033348FA67
	for <lists+qemu-devel@lfdr.de>; Sun, 16 Jan 2022 04:03:34 +0100 (CET)
Received: from localhost ([::1]:38968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8vpM-00068i-LW
	for lists+qemu-devel@lfdr.de; Sat, 15 Jan 2022 22:03:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1n8vnd-0003RI-0y; Sat, 15 Jan 2022 22:01:45 -0500
Received: from smtp23.cstnet.cn ([159.226.251.23]:56488 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1n8vnJ-0002lV-9N; Sat, 15 Jan 2022 22:01:28 -0500
Received: from localhost.localdomain (unknown [180.156.147.178])
 by APP-03 (Coremail) with SMTP id rQCowABXXVluiuNhImeeBQ--.54727S5;
 Sun, 16 Jan 2022 11:01:06 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: anup@brainfault.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v4 3/4] target/riscv: add support for svinval extension
Date: Sun, 16 Jan 2022 10:59:24 +0800
Message-Id: <20220116025925.29973-4-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220116025925.29973-1-liweiwei@iscas.ac.cn>
References: <20220116025925.29973-1-liweiwei@iscas.ac.cn>
X-CM-TRANSID: rQCowABXXVluiuNhImeeBQ--.54727S5
X-Coremail-Antispam: 1UD129KBjvJXoW3XrykAF4rJr15Jw48Kr47XFb_yoW7WF4DpF
 4UKrW7Gr4kJryfAa4ftr45JFy8Grs3CayUG3saywn5Xa15GrWDJr1DKrW7KrZ8JF4kWr1Y
 9F4jyryjyrW8XaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9G14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JrWl82xGYIkIc2
 x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
 Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84
 ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr0_Cr1U
 M2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjx
 v20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1l
 F7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxAIw28IcxkI7VAKI48JMx
 C20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAF
 wI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20x
 vE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v2
 0xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxV
 W8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbJ73DUUUUU==
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.23; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_BL=0.001, RCVD_IN_MSPIKE_L4=0.001, SPF_HELO_PASS=-0.001,
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
Cc: wangjunqiang@iscas.ac.cn, Weiwei Li <liweiwei@iscas.ac.cn>,
 lazyparser@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

- sinval.vma, hinval.vvma and hinval.gvma do the same as sfence.vma, hfence.vvma and hfence.gvma except extension check
- do nothing other than extension check for sfence.w.inval and sfence.inval.ir

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Anup Patel <anup@brainfault.org>
---
 target/riscv/cpu.c                          |  1 +
 target/riscv/cpu.h                          |  1 +
 target/riscv/insn32.decode                  |  7 ++
 target/riscv/insn_trans/trans_svinval.c.inc | 75 +++++++++++++++++++++
 target/riscv/translate.c                    |  1 +
 5 files changed, 85 insertions(+)
 create mode 100644 target/riscv/insn_trans/trans_svinval.c.inc

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index ff6c86c85b..45ac98e06b 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -668,6 +668,7 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_UINT16("vlen", RISCVCPU, cfg.vlen, 128),
     DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
 
+    DEFINE_PROP_BOOL("svinval", RISCVCPU, cfg.ext_svinval, false),
     DEFINE_PROP_BOOL("svnapot", RISCVCPU, cfg.ext_svnapot, false),
 
     DEFINE_PROP_BOOL("zba", RISCVCPU, cfg.ext_zba, true),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index d3d17cde82..c3d1845ca1 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -327,6 +327,7 @@ struct RISCVCPU {
         bool ext_counters;
         bool ext_ifencei;
         bool ext_icsr;
+        bool ext_svinval;
         bool ext_svnapot;
         bool ext_zfh;
         bool ext_zfhmin;
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 5bbedc254c..1d3ff1efe1 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -809,3 +809,10 @@ fcvt_l_h   1100010  00010 ..... ... ..... 1010011 @r2_rm
 fcvt_lu_h  1100010  00011 ..... ... ..... 1010011 @r2_rm
 fcvt_h_l   1101010  00010 ..... ... ..... 1010011 @r2_rm
 fcvt_h_lu  1101010  00011 ..... ... ..... 1010011 @r2_rm
+
+# *** Svinval Standard Extension ***
+sinval_vma        0001011 ..... ..... 000 00000 1110011 @sfence_vma
+sfence_w_inval    0001100 00000 00000 000 00000 1110011
+sfence_inval_ir   0001100 00001 00000 000 00000 1110011
+hinval_vvma       0010011 ..... ..... 000 00000 1110011 @hfence_vvma
+hinval_gvma       0110011 ..... ..... 000 00000 1110011 @hfence_gvma
diff --git a/target/riscv/insn_trans/trans_svinval.c.inc b/target/riscv/insn_trans/trans_svinval.c.inc
new file mode 100644
index 0000000000..1dde665661
--- /dev/null
+++ b/target/riscv/insn_trans/trans_svinval.c.inc
@@ -0,0 +1,75 @@
+/*
+ * RISC-V translation routines for the Svinval Standard Instruction Set.
+ *
+ * Copyright (c) 2020-2021 PLCT lab
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2 or later, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#define REQUIRE_SVINVAL(ctx) do {                    \
+    if (!RISCV_CPU(ctx->cs)->cfg.ext_svinval) {      \
+        return false;                                \
+    }                                                \
+} while (0)
+
+static bool trans_sinval_vma(DisasContext *ctx, arg_sinval_vma *a)
+{
+    REQUIRE_SVINVAL(ctx);
+    /* Do the same as sfence.vma currently */
+    REQUIRE_EXT(ctx, RVS);
+#ifndef CONFIG_USER_ONLY
+    gen_helper_tlb_flush(cpu_env);
+    return true;
+#endif
+    return false;
+}
+
+static bool trans_sfence_w_inval(DisasContext *ctx, arg_sfence_w_inval *a)
+{
+    REQUIRE_SVINVAL(ctx);
+    REQUIRE_EXT(ctx, RVS);
+    /* Do nothing currently */
+    return true;
+}
+
+static bool trans_sfence_inval_ir(DisasContext *ctx, arg_sfence_inval_ir *a)
+{
+    REQUIRE_SVINVAL(ctx);
+    REQUIRE_EXT(ctx, RVS);
+    /* Do nothing currently */
+    return true;
+}
+
+static bool trans_hinval_vvma(DisasContext *ctx, arg_hinval_vvma *a)
+{
+    REQUIRE_SVINVAL(ctx);
+    /* Do the same as hfence.vvma currently */
+    REQUIRE_EXT(ctx, RVH);
+#ifndef CONFIG_USER_ONLY
+    gen_helper_hyp_tlb_flush(cpu_env);
+    return true;
+#endif
+    return false;
+}
+
+static bool trans_hinval_gvma(DisasContext *ctx, arg_hinval_gvma *a)
+{
+    REQUIRE_SVINVAL(ctx);
+    /* Do the same as hfence.gvma currently */
+    REQUIRE_EXT(ctx, RVH);
+#ifndef CONFIG_USER_ONLY
+    gen_helper_hyp_gvma_tlb_flush(cpu_env);
+    return true;
+#endif
+    return false;
+}
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 615048ec87..4e5a9660a4 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -838,6 +838,7 @@ static uint32_t opcode_at(DisasContextBase *dcbase, target_ulong pc)
 #include "insn_trans/trans_rvb.c.inc"
 #include "insn_trans/trans_rvzfh.c.inc"
 #include "insn_trans/trans_privileged.c.inc"
+#include "insn_trans/trans_svinval.c.inc"
 
 /* Include the auto-generated decoder for 16 bit insn */
 #include "decode-insn16.c.inc"
-- 
2.17.1


