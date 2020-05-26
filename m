Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C24F81DCB03
	for <lists+qemu-devel@lfdr.de>; Thu, 21 May 2020 12:26:09 +0200 (CEST)
Received: from localhost ([::1]:41666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jbiOu-0002WM-QH
	for lists+qemu-devel@lfdr.de; Thu, 21 May 2020 06:26:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jbiNY-0001WW-F2; Thu, 21 May 2020 06:24:44 -0400
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:49362)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jbiNW-00025P-1L; Thu, 21 May 2020 06:24:43 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.06440596|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.468884-0.00013242-0.530983;
 FP=0|0|0|0|0|-1|-1|-1; HT=e01a16368; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS;
 RN=8; RT=8; SR=0; TI=SMTPD_---.Hbcevih_1590056676; 
Received: from L-PF1D6DP4-1208.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.Hbcevih_1590056676)
 by smtp.aliyun-inc.com(10.147.43.230);
 Thu, 21 May 2020 18:24:36 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v8 20/62] target/riscv: vector widening integer multiply
 instructions
Date: Thu, 21 May 2020 17:43:31 +0800
Message-Id: <20200521094413.10425-21-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200521094413.10425-1-zhiwei_liu@c-sky.com>
References: <20200521094413.10425-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=121.197.200.217;
 envelope-from=zhiwei_liu@c-sky.com; helo=smtp2200-217.mail.aliyun.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/21 05:19:14
X-ACL-Warn: Detected OS   = Linux 3.x [generic] [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, UNPARSEABLE_RELAY=0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
Cc: richard.henderson@linaro.org, wxy194768@alibaba-inc.com,
 wenmeng_zhang@c-sky.com, alistair.francis@wdc.com, palmer@dabbelt.com,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/helper.h                   | 19 +++++++++
 target/riscv/insn32.decode              |  6 +++
 target/riscv/insn_trans/trans_rvv.inc.c |  8 ++++
 target/riscv/vector_helper.c            | 51 +++++++++++++++++++++++++
 4 files changed, 84 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 5fd718771c..e5c3a66903 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -595,3 +595,22 @@ DEF_HELPER_6(vrem_vx_b, void, ptr, ptr, tl, ptr, env, i32)
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
index df89ddc767..cd28c135b8 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -1591,3 +1591,11 @@ GEN_OPIVX_TRANS(vdivu_vx, opivx_check)
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
index 07d2d57c9d..0af2acb8ad 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -862,6 +862,18 @@ GEN_VEXT_AMO(vamomaxuw_v_w, uint32_t, uint32_t, idx_w, clearl)
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
@@ -1839,3 +1851,42 @@ GEN_VEXT_VX(vrem_vx_b, 1, 1, clearb)
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


