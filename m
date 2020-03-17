Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65588188996
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Mar 2020 16:59:43 +0100 (CET)
Received: from localhost ([::1]:35408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jEEd4-0002eU-CU
	for lists+qemu-devel@lfdr.de; Tue, 17 Mar 2020 11:59:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33778)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1jEERN-0005TK-Uz
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 11:47:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1jEERM-0000Dt-4k
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 11:47:37 -0400
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:57481)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jEERL-0007ZJ-5K; Tue, 17 Mar 2020 11:47:36 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07440888|-1; CH=green; DM=||false|;
 DS=CONTINUE|ham_system_inform|0.68344-0.000122694-0.316437;
 FP=0|0|0|0|0|-1|-1|-1; HT=e02c03312; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS;
 RN=10; RT=10; SR=0; TI=SMTPD_---.H1-CLrA_1584460038; 
Received: from L-PF1D6DP4-1208.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.H1-CLrA_1584460038)
 by smtp.aliyun-inc.com(10.147.41.187);
 Tue, 17 Mar 2020 23:47:18 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: richard.henderson@linaro.org, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
Subject: [PATCH v6 20/61] target/riscv: vector widening integer multiply
 instructions
Date: Tue, 17 Mar 2020 23:06:12 +0800
Message-Id: <20200317150653.9008-21-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200317150653.9008-1-zhiwei_liu@c-sky.com>
References: <20200317150653.9008-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
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
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/helper.h                   | 19 +++++++++
 target/riscv/insn32.decode              |  6 +++
 target/riscv/insn_trans/trans_rvv.inc.c |  8 ++++
 target/riscv/vector_helper.c            | 51 +++++++++++++++++++++++++
 4 files changed, 84 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 357f149198..1704b8c512 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -591,3 +591,22 @@ DEF_HELPER_6(vrem_vx_b, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vrem_vx_h, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vrem_vx_w, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vrem_vx_d, void, ptr, ptr, tl, ptr, env, i32)
+
+DEF_HELPER_6(vwmul_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vwmul_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vwmul_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vwmulu_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vwmulu_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vwmulu_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vwmulsu_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vwmulsu_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vwmulsu_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vwmul_vx_b, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vwmul_vx_h, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vwmul_vx_w, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vwmulu_vx_b, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vwmulu_vx_h, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vwmulu_vx_w, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vwmulsu_vx_b, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vwmulsu_vx_h, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vwmulsu_vx_w, void, ptr, ptr, tl, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 7fb8f8fad8..ae7cfa3e28 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -379,6 +379,12 @@ vremu_vv        100010 . ..... ..... 010 ..... 1010111 @r_vm
 vremu_vx        100010 . ..... ..... 110 ..... 1010111 @r_vm
 vrem_vv         100011 . ..... ..... 010 ..... 1010111 @r_vm
 vrem_vx         100011 . ..... ..... 110 ..... 1010111 @r_vm
+vwmulu_vv       111000 . ..... ..... 010 ..... 1010111 @r_vm
+vwmulu_vx       111000 . ..... ..... 110 ..... 1010111 @r_vm
+vwmulsu_vv      111010 . ..... ..... 010 ..... 1010111 @r_vm
+vwmulsu_vx      111010 . ..... ..... 110 ..... 1010111 @r_vm
+vwmul_vv        111011 . ..... ..... 010 ..... 1010111 @r_vm
+vwmul_vx        111011 . ..... ..... 110 ..... 1010111 @r_vm
 
 vsetvli         0 ........... ..... 111 ..... 1010111  @r2_zimm
 vsetvl          1000000 ..... ..... 111 ..... 1010111  @r
diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index ed53eaaef5..98df7e2daa 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -1472,3 +1472,11 @@ GEN_OPIVX_TRANS(vdivu_vx, opivx_check)
 GEN_OPIVX_TRANS(vdiv_vx, opivx_check)
 GEN_OPIVX_TRANS(vremu_vx, opivx_check)
 GEN_OPIVX_TRANS(vrem_vx, opivx_check)
+
+/* Vector Widening Integer Multiply Instructions */
+GEN_OPIVV_WIDEN_TRANS(vwmul_vv, opivv_widen_check)
+GEN_OPIVV_WIDEN_TRANS(vwmulu_vv, opivv_widen_check)
+GEN_OPIVV_WIDEN_TRANS(vwmulsu_vv, opivv_widen_check)
+GEN_OPIVX_WIDEN_TRANS(vwmul_vx)
+GEN_OPIVX_WIDEN_TRANS(vwmulu_vx)
+GEN_OPIVX_WIDEN_TRANS(vwmulsu_vx)
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 4fc7a08954..35c6aa8494 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -856,6 +856,18 @@ GEN_VEXT_AMO(vamomaxuw_v_w, uint32_t, uint32_t, idx_w, clearl)
 #define OP_SUS_H int16_t, uint16_t, int16_t, uint16_t, int16_t
 #define OP_SUS_W int32_t, uint32_t, int32_t, uint32_t, int32_t
 #define OP_SUS_D int64_t, uint64_t, int64_t, uint64_t, int64_t
+#define WOP_UUU_B uint16_t, uint8_t, uint8_t, uint16_t, uint16_t
+#define WOP_UUU_H uint32_t, uint16_t, uint16_t, uint32_t, uint32_t
+#define WOP_UUU_W uint64_t, uint32_t, uint32_t, uint64_t, uint64_t
+#define WOP_SSS_B int16_t, int8_t, int8_t, int16_t, int16_t
+#define WOP_SSS_H int32_t, int16_t, int16_t, int32_t, int32_t
+#define WOP_SSS_W int64_t, int32_t, int32_t, int64_t, int64_t
+#define WOP_SUS_B int16_t, uint8_t, int8_t, uint16_t, int16_t
+#define WOP_SUS_H int32_t, uint16_t, int16_t, uint32_t, int32_t
+#define WOP_SUS_W int64_t, uint32_t, int32_t, uint64_t, int64_t
+#define WOP_SSU_B int16_t, int8_t, uint8_t, int16_t, uint16_t
+#define WOP_SSU_H int32_t, int16_t, uint16_t, int32_t, uint32_t
+#define WOP_SSU_W int64_t, int32_t, uint32_t, int64_t, uint64_t
 
 /* operation of two vector elements */
 typedef void opivv2_fn(void *vd, void *vs1, void *vs2, int i);
@@ -1815,3 +1827,42 @@ GEN_VEXT_VX(vrem_vx_b, 1, 1, clearb)
 GEN_VEXT_VX(vrem_vx_h, 2, 2, clearh)
 GEN_VEXT_VX(vrem_vx_w, 4, 4, clearl)
 GEN_VEXT_VX(vrem_vx_d, 8, 8, clearq)
+
+/* Vector Widening Integer Multiply Instructions */
+RVVCALL(OPIVV2, vwmul_vv_b, WOP_SSS_B, H2, H1, H1, DO_MUL)
+RVVCALL(OPIVV2, vwmul_vv_h, WOP_SSS_H, H4, H2, H2, DO_MUL)
+RVVCALL(OPIVV2, vwmul_vv_w, WOP_SSS_W, H8, H4, H4, DO_MUL)
+RVVCALL(OPIVV2, vwmulu_vv_b, WOP_UUU_B, H2, H1, H1, DO_MUL)
+RVVCALL(OPIVV2, vwmulu_vv_h, WOP_UUU_H, H4, H2, H2, DO_MUL)
+RVVCALL(OPIVV2, vwmulu_vv_w, WOP_UUU_W, H8, H4, H4, DO_MUL)
+RVVCALL(OPIVV2, vwmulsu_vv_b, WOP_SUS_B, H2, H1, H1, DO_MUL)
+RVVCALL(OPIVV2, vwmulsu_vv_h, WOP_SUS_H, H4, H2, H2, DO_MUL)
+RVVCALL(OPIVV2, vwmulsu_vv_w, WOP_SUS_W, H8, H4, H4, DO_MUL)
+GEN_VEXT_VV(vwmul_vv_b, 1, 2, clearh)
+GEN_VEXT_VV(vwmul_vv_h, 2, 4, clearl)
+GEN_VEXT_VV(vwmul_vv_w, 4, 8, clearq)
+GEN_VEXT_VV(vwmulu_vv_b, 1, 2, clearh)
+GEN_VEXT_VV(vwmulu_vv_h, 2, 4, clearl)
+GEN_VEXT_VV(vwmulu_vv_w, 4, 8, clearq)
+GEN_VEXT_VV(vwmulsu_vv_b, 1, 2, clearh)
+GEN_VEXT_VV(vwmulsu_vv_h, 2, 4, clearl)
+GEN_VEXT_VV(vwmulsu_vv_w, 4, 8, clearq)
+
+RVVCALL(OPIVX2, vwmul_vx_b, WOP_SSS_B, H2, H1, DO_MUL)
+RVVCALL(OPIVX2, vwmul_vx_h, WOP_SSS_H, H4, H2, DO_MUL)
+RVVCALL(OPIVX2, vwmul_vx_w, WOP_SSS_W, H8, H4, DO_MUL)
+RVVCALL(OPIVX2, vwmulu_vx_b, WOP_UUU_B, H2, H1, DO_MUL)
+RVVCALL(OPIVX2, vwmulu_vx_h, WOP_UUU_H, H4, H2, DO_MUL)
+RVVCALL(OPIVX2, vwmulu_vx_w, WOP_UUU_W, H8, H4, DO_MUL)
+RVVCALL(OPIVX2, vwmulsu_vx_b, WOP_SUS_B, H2, H1, DO_MUL)
+RVVCALL(OPIVX2, vwmulsu_vx_h, WOP_SUS_H, H4, H2, DO_MUL)
+RVVCALL(OPIVX2, vwmulsu_vx_w, WOP_SUS_W, H8, H4, DO_MUL)
+GEN_VEXT_VX(vwmul_vx_b, 1, 2, clearh)
+GEN_VEXT_VX(vwmul_vx_h, 2, 4, clearl)
+GEN_VEXT_VX(vwmul_vx_w, 4, 8, clearq)
+GEN_VEXT_VX(vwmulu_vx_b, 1, 2, clearh)
+GEN_VEXT_VX(vwmulu_vx_h, 2, 4, clearl)
+GEN_VEXT_VX(vwmulu_vx_w, 4, 8, clearq)
+GEN_VEXT_VX(vwmulsu_vx_b, 1, 2, clearh)
+GEN_VEXT_VX(vwmulsu_vx_h, 2, 4, clearl)
+GEN_VEXT_VX(vwmulsu_vx_w, 4, 8, clearq)
-- 
2.23.0


