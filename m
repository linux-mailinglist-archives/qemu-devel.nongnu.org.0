Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 669791980B4
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Mar 2020 18:14:45 +0200 (CEST)
Received: from localhost ([::1]:52310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jIx3k-0003su-7e
	for lists+qemu-devel@lfdr.de; Mon, 30 Mar 2020 12:14:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47026)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1jIx2V-00038u-Cn
 for qemu-devel@nongnu.org; Mon, 30 Mar 2020 12:13:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1jIx2T-0008Aj-FK
 for qemu-devel@nongnu.org; Mon, 30 Mar 2020 12:13:27 -0400
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:49634)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jIx2S-00081b-Ks; Mon, 30 Mar 2020 12:13:25 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07436419|-1; CH=green;
 DM=|CONTINUE|false|; DS=CONTINUE|ham_system_inform|0.335301-0.0134057-0.651294;
 FP=0|0|0|0|0|-1|-1|-1; HT=e02c03300; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS;
 RN=11; RT=11; SR=0; TI=SMTPD_---.H7kQjZk_1585584789; 
Received: from L-PF1D6DP4-1208.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.H7kQjZk_1585584789)
 by smtp.aliyun-inc.com(10.147.41.143);
 Tue, 31 Mar 2020 00:13:09 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: richard.henderson@linaro.org, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
Subject: [PATCH v7 18/61] target/riscv: vector single-width integer multiply
 instructions
Date: Mon, 30 Mar 2020 23:35:50 +0800
Message-Id: <20200330153633.15298-19-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200330153633.15298-1-zhiwei_liu@c-sky.com>
References: <20200330153633.15298-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 121.197.200.217
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: guoren@linux.alibaba.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 wxy194768@alibaba-inc.com, wenmeng_zhang@c-sky.com,
 Alistair Francis <alistair.francis@wdc.com>, LIU Zhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/helper.h                   |  33 +++++
 target/riscv/insn32.decode              |   8 ++
 target/riscv/insn_trans/trans_rvv.inc.c |  10 ++
 target/riscv/vector_helper.c            | 163 ++++++++++++++++++++++++
 4 files changed, 214 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 32f4c76b34..08c1c02e13 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -529,3 +529,36 @@ DEF_HELPER_6(vmax_vx_b, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vmax_vx_h, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vmax_vx_w, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vmax_vx_d, void, ptr, ptr, tl, ptr, env, i32)
+
+DEF_HELPER_6(vmul_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vmul_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vmul_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vmul_vv_d, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vmulh_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vmulh_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vmulh_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vmulh_vv_d, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vmulhu_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vmulhu_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vmulhu_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vmulhu_vv_d, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vmulhsu_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vmulhsu_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vmulhsu_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vmulhsu_vv_d, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vmul_vx_b, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vmul_vx_h, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vmul_vx_w, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vmul_vx_d, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vmulh_vx_b, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vmulh_vx_h, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vmulh_vx_w, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vmulh_vx_d, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vmulhu_vx_b, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vmulhu_vx_h, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vmulhu_vx_w, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vmulhu_vx_d, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vmulhsu_vx_b, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vmulhsu_vx_h, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vmulhsu_vx_w, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vmulhsu_vx_d, void, ptr, ptr, tl, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index aafbdc6be7..abfed469bc 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -363,6 +363,14 @@ vmaxu_vv        000110 . ..... ..... 000 ..... 1010111 @r_vm
 vmaxu_vx        000110 . ..... ..... 100 ..... 1010111 @r_vm
 vmax_vv         000111 . ..... ..... 000 ..... 1010111 @r_vm
 vmax_vx         000111 . ..... ..... 100 ..... 1010111 @r_vm
+vmul_vv         100101 . ..... ..... 010 ..... 1010111 @r_vm
+vmul_vx         100101 . ..... ..... 110 ..... 1010111 @r_vm
+vmulh_vv        100111 . ..... ..... 010 ..... 1010111 @r_vm
+vmulh_vx        100111 . ..... ..... 110 ..... 1010111 @r_vm
+vmulhu_vv       100100 . ..... ..... 010 ..... 1010111 @r_vm
+vmulhu_vx       100100 . ..... ..... 110 ..... 1010111 @r_vm
+vmulhsu_vv      100110 . ..... ..... 010 ..... 1010111 @r_vm
+vmulhsu_vx      100110 . ..... ..... 110 ..... 1010111 @r_vm
 
 vsetvli         0 ........... ..... 111 ..... 1010111  @r2_zimm
 vsetvl          1000000 ..... ..... 111 ..... 1010111  @r
diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index 754eb78844..bfd5235755 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -1571,3 +1571,13 @@ GEN_OPIVX_TRANS(vminu_vx, opivx_check)
 GEN_OPIVX_TRANS(vmin_vx,  opivx_check)
 GEN_OPIVX_TRANS(vmaxu_vx, opivx_check)
 GEN_OPIVX_TRANS(vmax_vx,  opivx_check)
+
+/* Vector Single-Width Integer Multiply Instructions */
+GEN_OPIVV_GVEC_TRANS(vmul_vv,  mul)
+GEN_OPIVV_TRANS(vmulh_vv, opivv_check)
+GEN_OPIVV_TRANS(vmulhu_vv, opivv_check)
+GEN_OPIVV_TRANS(vmulhsu_vv, opivv_check)
+GEN_OPIVX_GVEC_TRANS(vmul_vx,  muls)
+GEN_OPIVX_TRANS(vmulh_vx, opivx_check)
+GEN_OPIVX_TRANS(vmulhu_vx, opivx_check)
+GEN_OPIVX_TRANS(vmulhsu_vx, opivx_check)
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index e9b7dc4871..d601df945d 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -858,6 +858,10 @@ GEN_VEXT_AMO(vamomaxuw_v_w, uint32_t, uint32_t, idx_w, clearl)
 #define OP_UUU_H uint16_t, uint16_t, uint16_t, uint16_t, uint16_t
 #define OP_UUU_W uint32_t, uint32_t, uint32_t, uint32_t, uint32_t
 #define OP_UUU_D uint64_t, uint64_t, uint64_t, uint64_t, uint64_t
+#define OP_SUS_B int8_t, uint8_t, int8_t, uint8_t, int8_t
+#define OP_SUS_H int16_t, uint16_t, int16_t, uint16_t, int16_t
+#define OP_SUS_W int32_t, uint32_t, int32_t, uint32_t, int32_t
+#define OP_SUS_D int64_t, uint64_t, int64_t, uint64_t, int64_t
 
 /* operation of two vector elements */
 typedef void opivv2_fn(void *vd, void *vs1, void *vs2, int i);
@@ -1602,3 +1606,162 @@ GEN_VEXT_VX(vmax_vx_b, 1, 1, clearb)
 GEN_VEXT_VX(vmax_vx_h, 2, 2, clearh)
 GEN_VEXT_VX(vmax_vx_w, 4, 4, clearl)
 GEN_VEXT_VX(vmax_vx_d, 8, 8, clearq)
+
+/* Vector Single-Width Integer Multiply Instructions */
+#define DO_MUL(N, M) (N * M)
+RVVCALL(OPIVV2, vmul_vv_b, OP_SSS_B, H1, H1, H1, DO_MUL)
+RVVCALL(OPIVV2, vmul_vv_h, OP_SSS_H, H2, H2, H2, DO_MUL)
+RVVCALL(OPIVV2, vmul_vv_w, OP_SSS_W, H4, H4, H4, DO_MUL)
+RVVCALL(OPIVV2, vmul_vv_d, OP_SSS_D, H8, H8, H8, DO_MUL)
+GEN_VEXT_VV(vmul_vv_b, 1, 1, clearb)
+GEN_VEXT_VV(vmul_vv_h, 2, 2, clearh)
+GEN_VEXT_VV(vmul_vv_w, 4, 4, clearl)
+GEN_VEXT_VV(vmul_vv_d, 8, 8, clearq)
+
+static int8_t do_mulh_b(int8_t s2, int8_t s1)
+{
+    return (int16_t)s2 * (int16_t)s1 >> 8;
+}
+
+static int16_t do_mulh_h(int16_t s2, int16_t s1)
+{
+    return (int32_t)s2 * (int32_t)s1 >> 16;
+}
+
+static int32_t do_mulh_w(int32_t s2, int32_t s1)
+{
+    return (int64_t)s2 * (int64_t)s1 >> 32;
+}
+
+static int64_t do_mulh_d(int64_t s2, int64_t s1)
+{
+    uint64_t hi_64, lo_64;
+
+    muls64(&lo_64, &hi_64, s1, s2);
+    return hi_64;
+}
+
+static uint8_t do_mulhu_b(uint8_t s2, uint8_t s1)
+{
+    return (uint16_t)s2 * (uint16_t)s1 >> 8;
+}
+
+static uint16_t do_mulhu_h(uint16_t s2, uint16_t s1)
+{
+    return (uint32_t)s2 * (uint32_t)s1 >> 16;
+}
+
+static uint32_t do_mulhu_w(uint32_t s2, uint32_t s1)
+{
+    return (uint64_t)s2 * (uint64_t)s1 >> 32;
+}
+
+static uint64_t do_mulhu_d(uint64_t s2, uint64_t s1)
+{
+    uint64_t hi_64, lo_64;
+
+    mulu64(&lo_64, &hi_64, s2, s1);
+    return hi_64;
+}
+
+static int8_t do_mulhsu_b(int8_t s2, uint8_t s1)
+{
+    return (int16_t)s2 * (uint16_t)s1 >> 8;
+}
+
+static int16_t do_mulhsu_h(int16_t s2, uint16_t s1)
+{
+    return (int32_t)s2 * (uint32_t)s1 >> 16;
+}
+
+static int32_t do_mulhsu_w(int32_t s2, uint32_t s1)
+{
+    return (int64_t)s2 * (uint64_t)s1 >> 32;
+}
+
+/*
+ * Let  A = signed operand,
+ *      B = unsigned operand
+ *      P = mulu64(A, B), unsigned product
+ *
+ * LET  X = 2 ** 64  - A, 2's complement of A
+ *      SP = signed product
+ * THEN
+ *      IF A < 0
+ *          SP = -X * B
+ *             = -(2 ** 64 - A) * B
+ *             = A * B - 2 ** 64 * B
+ *             = P - 2 ** 64 * B
+ *      ELSE
+ *          SP = P
+ * THEN
+ *      HI_P -= (A < 0 ? B : 0）
+ */
+
+static int64_t do_mulhsu_d(int64_t s2, uint64_t s1)
+{
+    uint64_t hi_64, lo_64;
+
+    mulu64(&lo_64, &hi_64, s2, s1);
+
+    hi_64 -= s2 < 0 ? s1 : 0;
+    return hi_64;
+}
+
+RVVCALL(OPIVV2, vmulh_vv_b, OP_SSS_B, H1, H1, H1, do_mulh_b)
+RVVCALL(OPIVV2, vmulh_vv_h, OP_SSS_H, H2, H2, H2, do_mulh_h)
+RVVCALL(OPIVV2, vmulh_vv_w, OP_SSS_W, H4, H4, H4, do_mulh_w)
+RVVCALL(OPIVV2, vmulh_vv_d, OP_SSS_D, H8, H8, H8, do_mulh_d)
+RVVCALL(OPIVV2, vmulhu_vv_b, OP_UUU_B, H1, H1, H1, do_mulhu_b)
+RVVCALL(OPIVV2, vmulhu_vv_h, OP_UUU_H, H2, H2, H2, do_mulhu_h)
+RVVCALL(OPIVV2, vmulhu_vv_w, OP_UUU_W, H4, H4, H4, do_mulhu_w)
+RVVCALL(OPIVV2, vmulhu_vv_d, OP_UUU_D, H8, H8, H8, do_mulhu_d)
+RVVCALL(OPIVV2, vmulhsu_vv_b, OP_SUS_B, H1, H1, H1, do_mulhsu_b)
+RVVCALL(OPIVV2, vmulhsu_vv_h, OP_SUS_H, H2, H2, H2, do_mulhsu_h)
+RVVCALL(OPIVV2, vmulhsu_vv_w, OP_SUS_W, H4, H4, H4, do_mulhsu_w)
+RVVCALL(OPIVV2, vmulhsu_vv_d, OP_SUS_D, H8, H8, H8, do_mulhsu_d)
+GEN_VEXT_VV(vmulh_vv_b, 1, 1, clearb)
+GEN_VEXT_VV(vmulh_vv_h, 2, 2, clearh)
+GEN_VEXT_VV(vmulh_vv_w, 4, 4, clearl)
+GEN_VEXT_VV(vmulh_vv_d, 8, 8, clearq)
+GEN_VEXT_VV(vmulhu_vv_b, 1, 1, clearb)
+GEN_VEXT_VV(vmulhu_vv_h, 2, 2, clearh)
+GEN_VEXT_VV(vmulhu_vv_w, 4, 4, clearl)
+GEN_VEXT_VV(vmulhu_vv_d, 8, 8, clearq)
+GEN_VEXT_VV(vmulhsu_vv_b, 1, 1, clearb)
+GEN_VEXT_VV(vmulhsu_vv_h, 2, 2, clearh)
+GEN_VEXT_VV(vmulhsu_vv_w, 4, 4, clearl)
+GEN_VEXT_VV(vmulhsu_vv_d, 8, 8, clearq)
+
+RVVCALL(OPIVX2, vmul_vx_b, OP_SSS_B, H1, H1, DO_MUL)
+RVVCALL(OPIVX2, vmul_vx_h, OP_SSS_H, H2, H2, DO_MUL)
+RVVCALL(OPIVX2, vmul_vx_w, OP_SSS_W, H4, H4, DO_MUL)
+RVVCALL(OPIVX2, vmul_vx_d, OP_SSS_D, H8, H8, DO_MUL)
+RVVCALL(OPIVX2, vmulh_vx_b, OP_SSS_B, H1, H1, do_mulh_b)
+RVVCALL(OPIVX2, vmulh_vx_h, OP_SSS_H, H2, H2, do_mulh_h)
+RVVCALL(OPIVX2, vmulh_vx_w, OP_SSS_W, H4, H4, do_mulh_w)
+RVVCALL(OPIVX2, vmulh_vx_d, OP_SSS_D, H8, H8, do_mulh_d)
+RVVCALL(OPIVX2, vmulhu_vx_b, OP_UUU_B, H1, H1, do_mulhu_b)
+RVVCALL(OPIVX2, vmulhu_vx_h, OP_UUU_H, H2, H2, do_mulhu_h)
+RVVCALL(OPIVX2, vmulhu_vx_w, OP_UUU_W, H4, H4, do_mulhu_w)
+RVVCALL(OPIVX2, vmulhu_vx_d, OP_UUU_D, H8, H8, do_mulhu_d)
+RVVCALL(OPIVX2, vmulhsu_vx_b, OP_SUS_B, H1, H1, do_mulhsu_b)
+RVVCALL(OPIVX2, vmulhsu_vx_h, OP_SUS_H, H2, H2, do_mulhsu_h)
+RVVCALL(OPIVX2, vmulhsu_vx_w, OP_SUS_W, H4, H4, do_mulhsu_w)
+RVVCALL(OPIVX2, vmulhsu_vx_d, OP_SUS_D, H8, H8, do_mulhsu_d)
+GEN_VEXT_VX(vmul_vx_b, 1, 1, clearb)
+GEN_VEXT_VX(vmul_vx_h, 2, 2, clearh)
+GEN_VEXT_VX(vmul_vx_w, 4, 4, clearl)
+GEN_VEXT_VX(vmul_vx_d, 8, 8, clearq)
+GEN_VEXT_VX(vmulh_vx_b, 1, 1, clearb)
+GEN_VEXT_VX(vmulh_vx_h, 2, 2, clearh)
+GEN_VEXT_VX(vmulh_vx_w, 4, 4, clearl)
+GEN_VEXT_VX(vmulh_vx_d, 8, 8, clearq)
+GEN_VEXT_VX(vmulhu_vx_b, 1, 1, clearb)
+GEN_VEXT_VX(vmulhu_vx_h, 2, 2, clearh)
+GEN_VEXT_VX(vmulhu_vx_w, 4, 4, clearl)
+GEN_VEXT_VX(vmulhu_vx_d, 8, 8, clearq)
+GEN_VEXT_VX(vmulhsu_vx_b, 1, 1, clearb)
+GEN_VEXT_VX(vmulhsu_vx_h, 2, 2, clearh)
+GEN_VEXT_VX(vmulhsu_vx_w, 4, 4, clearl)
+GEN_VEXT_VX(vmulhsu_vx_d, 8, 8, clearq)
-- 
2.23.0


