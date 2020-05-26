Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E0F1DCB61
	for <lists+qemu-devel@lfdr.de>; Thu, 21 May 2020 12:51:37 +0200 (CEST)
Received: from localhost ([::1]:59688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jbinY-00041r-AL
	for lists+qemu-devel@lfdr.de; Thu, 21 May 2020 06:51:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jbimr-0003aR-Rk; Thu, 21 May 2020 06:50:53 -0400
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:49259)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jbimq-0007p7-KG; Thu, 21 May 2020 06:50:53 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.08095372|-1; CH=blue; DM=|OVERLOAD|false|;
 DS=CONTINUE|ham_regular_dialog|0.0201061-0.000123248-0.979771;
 FP=0|0|0|0|0|-1|-1|-1; HT=e01a16384; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS;
 RN=8; RT=8; SR=0; TI=SMTPD_---.HbdHhVo_1590058246; 
Received: from L-PF1D6DP4-1208.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.HbdHhVo_1590058246)
 by smtp.aliyun-inc.com(10.147.42.135);
 Thu, 21 May 2020 18:50:47 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v8 33/62] target/riscv: vector single-width floating-point
 multiply/divide instructions
Date: Thu, 21 May 2020 17:43:44 +0800
Message-Id: <20200521094413.10425-34-zhiwei_liu@c-sky.com>
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
 target/riscv/helper.h                   | 16 ++++++++
 target/riscv/insn32.decode              |  5 +++
 target/riscv/insn_trans/trans_rvv.inc.c |  7 ++++
 target/riscv/vector_helper.c            | 49 +++++++++++++++++++++++++
 4 files changed, 77 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 73fc7a5a00..fa1558179a 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -830,3 +830,19 @@ DEF_HELPER_6(vfwadd_wf_h, void, ptr, ptr, i64, ptr, env, i32)
 DEF_HELPER_6(vfwadd_wf_w, void, ptr, ptr, i64, ptr, env, i32)
 DEF_HELPER_6(vfwsub_wf_h, void, ptr, ptr, i64, ptr, env, i32)
 DEF_HELPER_6(vfwsub_wf_w, void, ptr, ptr, i64, ptr, env, i32)
+
+DEF_HELPER_6(vfmul_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vfmul_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vfmul_vv_d, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vfdiv_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vfdiv_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vfdiv_vv_d, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vfmul_vf_h, void, ptr, ptr, i64, ptr, env, i32)
+DEF_HELPER_6(vfmul_vf_w, void, ptr, ptr, i64, ptr, env, i32)
+DEF_HELPER_6(vfmul_vf_d, void, ptr, ptr, i64, ptr, env, i32)
+DEF_HELPER_6(vfdiv_vf_h, void, ptr, ptr, i64, ptr, env, i32)
+DEF_HELPER_6(vfdiv_vf_w, void, ptr, ptr, i64, ptr, env, i32)
+DEF_HELPER_6(vfdiv_vf_d, void, ptr, ptr, i64, ptr, env, i32)
+DEF_HELPER_6(vfrdiv_vf_h, void, ptr, ptr, i64, ptr, env, i32)
+DEF_HELPER_6(vfrdiv_vf_w, void, ptr, ptr, i64, ptr, env, i32)
+DEF_HELPER_6(vfrdiv_vf_d, void, ptr, ptr, i64, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 68e9448842..16fd938261 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -456,6 +456,11 @@ vfwsub_vv       110010 . ..... ..... 001 ..... 1010111 @r_vm
 vfwsub_vf       110010 . ..... ..... 101 ..... 1010111 @r_vm
 vfwsub_wv       110110 . ..... ..... 001 ..... 1010111 @r_vm
 vfwsub_wf       110110 . ..... ..... 101 ..... 1010111 @r_vm
+vfmul_vv        100100 . ..... ..... 001 ..... 1010111 @r_vm
+vfmul_vf        100100 . ..... ..... 101 ..... 1010111 @r_vm
+vfdiv_vv        100000 . ..... ..... 001 ..... 1010111 @r_vm
+vfdiv_vf        100000 . ..... ..... 101 ..... 1010111 @r_vm
+vfrdiv_vf       100001 . ..... ..... 101 ..... 1010111 @r_vm
 
 vsetvli         0 ........... ..... 111 ..... 1010111  @r2_zimm
 vsetvl          1000000 ..... ..... 111 ..... 1010111  @r
diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index c7ea04f4c0..39bf357425 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -2044,3 +2044,10 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)           \
 
 GEN_OPFWF_WIDEN_TRANS(vfwadd_wf)
 GEN_OPFWF_WIDEN_TRANS(vfwsub_wf)
+
+/* Vector Single-Width Floating-Point Multiply/Divide Instructions */
+GEN_OPFVV_TRANS(vfmul_vv, opfvv_check)
+GEN_OPFVV_TRANS(vfdiv_vv, opfvv_check)
+GEN_OPFVF_TRANS(vfmul_vf,  opfvf_check)
+GEN_OPFVF_TRANS(vfdiv_vf,  opfvf_check)
+GEN_OPFVF_TRANS(vfrdiv_vf,  opfvf_check)
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 08e59b0e29..a9fdf47c2a 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -3360,3 +3360,52 @@ RVVCALL(OPFVF2, vfwsub_wf_h, WOP_WUUU_H, H4, H2, vfwsubw16)
 RVVCALL(OPFVF2, vfwsub_wf_w, WOP_WUUU_W, H8, H4, vfwsubw32)
 GEN_VEXT_VF(vfwsub_wf_h, 2, 4, clearl)
 GEN_VEXT_VF(vfwsub_wf_w, 4, 8, clearq)
+
+/* Vector Single-Width Floating-Point Multiply/Divide Instructions */
+RVVCALL(OPFVV2, vfmul_vv_h, OP_UUU_H, H2, H2, H2, float16_mul)
+RVVCALL(OPFVV2, vfmul_vv_w, OP_UUU_W, H4, H4, H4, float32_mul)
+RVVCALL(OPFVV2, vfmul_vv_d, OP_UUU_D, H8, H8, H8, float64_mul)
+GEN_VEXT_VV_ENV(vfmul_vv_h, 2, 2, clearh)
+GEN_VEXT_VV_ENV(vfmul_vv_w, 4, 4, clearl)
+GEN_VEXT_VV_ENV(vfmul_vv_d, 8, 8, clearq)
+RVVCALL(OPFVF2, vfmul_vf_h, OP_UUU_H, H2, H2, float16_mul)
+RVVCALL(OPFVF2, vfmul_vf_w, OP_UUU_W, H4, H4, float32_mul)
+RVVCALL(OPFVF2, vfmul_vf_d, OP_UUU_D, H8, H8, float64_mul)
+GEN_VEXT_VF(vfmul_vf_h, 2, 2, clearh)
+GEN_VEXT_VF(vfmul_vf_w, 4, 4, clearl)
+GEN_VEXT_VF(vfmul_vf_d, 8, 8, clearq)
+
+RVVCALL(OPFVV2, vfdiv_vv_h, OP_UUU_H, H2, H2, H2, float16_div)
+RVVCALL(OPFVV2, vfdiv_vv_w, OP_UUU_W, H4, H4, H4, float32_div)
+RVVCALL(OPFVV2, vfdiv_vv_d, OP_UUU_D, H8, H8, H8, float64_div)
+GEN_VEXT_VV_ENV(vfdiv_vv_h, 2, 2, clearh)
+GEN_VEXT_VV_ENV(vfdiv_vv_w, 4, 4, clearl)
+GEN_VEXT_VV_ENV(vfdiv_vv_d, 8, 8, clearq)
+RVVCALL(OPFVF2, vfdiv_vf_h, OP_UUU_H, H2, H2, float16_div)
+RVVCALL(OPFVF2, vfdiv_vf_w, OP_UUU_W, H4, H4, float32_div)
+RVVCALL(OPFVF2, vfdiv_vf_d, OP_UUU_D, H8, H8, float64_div)
+GEN_VEXT_VF(vfdiv_vf_h, 2, 2, clearh)
+GEN_VEXT_VF(vfdiv_vf_w, 4, 4, clearl)
+GEN_VEXT_VF(vfdiv_vf_d, 8, 8, clearq)
+
+static uint16_t float16_rdiv(uint16_t a, uint16_t b, float_status *s)
+{
+    return float16_div(b, a, s);
+}
+
+static uint32_t float32_rdiv(uint32_t a, uint32_t b, float_status *s)
+{
+    return float32_div(b, a, s);
+}
+
+static uint64_t float64_rdiv(uint64_t a, uint64_t b, float_status *s)
+{
+    return float64_div(b, a, s);
+}
+
+RVVCALL(OPFVF2, vfrdiv_vf_h, OP_UUU_H, H2, H2, float16_rdiv)
+RVVCALL(OPFVF2, vfrdiv_vf_w, OP_UUU_W, H4, H4, float32_rdiv)
+RVVCALL(OPFVF2, vfrdiv_vf_d, OP_UUU_D, H8, H8, float64_rdiv)
+GEN_VEXT_VF(vfrdiv_vf_h, 2, 2, clearh)
+GEN_VEXT_VF(vfrdiv_vf_w, 4, 4, clearl)
+GEN_VEXT_VF(vfrdiv_vf_d, 8, 8, clearq)
-- 
2.23.0


