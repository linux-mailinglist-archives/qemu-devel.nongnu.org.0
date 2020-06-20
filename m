Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E35D3202132
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Jun 2020 06:07:22 +0200 (CEST)
Received: from localhost ([::1]:48884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jmUmo-0002HC-0x
	for lists+qemu-devel@lfdr.de; Sat, 20 Jun 2020 00:07:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jmUm4-0001ij-LR; Sat, 20 Jun 2020 00:06:36 -0400
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:41490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jmUm1-0002hO-VZ; Sat, 20 Jun 2020 00:06:36 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07443887|-1; CH=blue; DM=|OVERLOAD|false|;
 DS=CONTINUE|ham_system_inform|0.0476141-5.33604e-05-0.952333;
 FP=0|0|0|0|0|-1|-1|-1; HT=e01l07381; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS;
 RN=9; RT=8; SR=0; TI=SMTPD_---.HpWTaAu_1592625987; 
Received: from L-PF1D6DP4-1208.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.HpWTaAu_1592625987)
 by smtp.aliyun-inc.com(10.147.44.145);
 Sat, 20 Jun 2020 12:06:27 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v10 35/61] target/riscv: vector widening floating-point fused
 multiply-add instructions
Date: Sat, 20 Jun 2020 10:55:14 +0800
Message-Id: <20200620025540.1109-36-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200620025540.1109-1-zhiwei_liu@c-sky.com>
References: <20200620025540.1109-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=121.197.200.217;
 envelope-from=zhiwei_liu@c-sky.com; helo=smtp2200-217.mail.aliyun.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/19 21:09:48
X-ACL-Warn: Detected OS   = Linux 3.x [generic] [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, UNPARSEABLE_RELAY=0.001 autolearn=_AUTOLEARN
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
 wenmeng_zhang@c-sky.com, Alistair Francis <alistair.francis@wdc.com>,
 palmer@dabbelt.com, LIU Zhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/helper.h                   | 17 +++++
 target/riscv/insn32.decode              |  8 +++
 target/riscv/insn_trans/trans_rvv.inc.c | 10 +++
 target/riscv/vector_helper.c            | 91 +++++++++++++++++++++++++
 4 files changed, 126 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 108a177f25..b537030a11 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -906,3 +906,20 @@ DEF_HELPER_6(vfmsub_vf_d, void, ptr, ptr, i64, ptr, env, i32)
 DEF_HELPER_6(vfnmsub_vf_h, void, ptr, ptr, i64, ptr, env, i32)
 DEF_HELPER_6(vfnmsub_vf_w, void, ptr, ptr, i64, ptr, env, i32)
 DEF_HELPER_6(vfnmsub_vf_d, void, ptr, ptr, i64, ptr, env, i32)
+
+DEF_HELPER_6(vfwmacc_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vfwmacc_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vfwnmacc_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vfwnmacc_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vfwmsac_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vfwmsac_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vfwnmsac_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vfwnmsac_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vfwmacc_vf_h, void, ptr, ptr, i64, ptr, env, i32)
+DEF_HELPER_6(vfwmacc_vf_w, void, ptr, ptr, i64, ptr, env, i32)
+DEF_HELPER_6(vfwnmacc_vf_h, void, ptr, ptr, i64, ptr, env, i32)
+DEF_HELPER_6(vfwnmacc_vf_w, void, ptr, ptr, i64, ptr, env, i32)
+DEF_HELPER_6(vfwmsac_vf_h, void, ptr, ptr, i64, ptr, env, i32)
+DEF_HELPER_6(vfwmsac_vf_w, void, ptr, ptr, i64, ptr, env, i32)
+DEF_HELPER_6(vfwnmsac_vf_h, void, ptr, ptr, i64, ptr, env, i32)
+DEF_HELPER_6(vfwnmsac_vf_w, void, ptr, ptr, i64, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 9ca765d37f..c9d5078385 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -481,6 +481,14 @@ vfmsub_vv       101010 . ..... ..... 001 ..... 1010111 @r_vm
 vfmsub_vf       101010 . ..... ..... 101 ..... 1010111 @r_vm
 vfnmsub_vv      101011 . ..... ..... 001 ..... 1010111 @r_vm
 vfnmsub_vf      101011 . ..... ..... 101 ..... 1010111 @r_vm
+vfwmacc_vv      111100 . ..... ..... 001 ..... 1010111 @r_vm
+vfwmacc_vf      111100 . ..... ..... 101 ..... 1010111 @r_vm
+vfwnmacc_vv     111101 . ..... ..... 001 ..... 1010111 @r_vm
+vfwnmacc_vf     111101 . ..... ..... 101 ..... 1010111 @r_vm
+vfwmsac_vv      111110 . ..... ..... 001 ..... 1010111 @r_vm
+vfwmsac_vf      111110 . ..... ..... 101 ..... 1010111 @r_vm
+vfwnmsac_vv     111111 . ..... ..... 001 ..... 1010111 @r_vm
+vfwnmsac_vf     111111 . ..... ..... 101 ..... 1010111 @r_vm
 
 vsetvli         0 ........... ..... 111 ..... 1010111  @r2_zimm
 vsetvl          1000000 ..... ..... 111 ..... 1010111  @r
diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index 439bfc0469..945c9424ba 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -2079,3 +2079,13 @@ GEN_OPFVF_TRANS(vfmadd_vf, opfvf_check)
 GEN_OPFVF_TRANS(vfnmadd_vf, opfvf_check)
 GEN_OPFVF_TRANS(vfmsub_vf, opfvf_check)
 GEN_OPFVF_TRANS(vfnmsub_vf, opfvf_check)
+
+/* Vector Widening Floating-Point Fused Multiply-Add Instructions */
+GEN_OPFVV_WIDEN_TRANS(vfwmacc_vv, opfvv_widen_check)
+GEN_OPFVV_WIDEN_TRANS(vfwnmacc_vv, opfvv_widen_check)
+GEN_OPFVV_WIDEN_TRANS(vfwmsac_vv, opfvv_widen_check)
+GEN_OPFVV_WIDEN_TRANS(vfwnmsac_vv, opfvv_widen_check)
+GEN_OPFVF_WIDEN_TRANS(vfwmacc_vf)
+GEN_OPFVF_WIDEN_TRANS(vfwnmacc_vf)
+GEN_OPFVF_WIDEN_TRANS(vfwmsac_vf)
+GEN_OPFVF_WIDEN_TRANS(vfwnmsac_vf)
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index d3ad4aa8f1..7abdc2b7d8 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -3683,3 +3683,94 @@ RVVCALL(OPFVF3, vfnmsub_vf_d, OP_UUU_D, H8, H8, fnmsub64)
 GEN_VEXT_VF(vfnmsub_vf_h, 2, 2, clearh)
 GEN_VEXT_VF(vfnmsub_vf_w, 4, 4, clearl)
 GEN_VEXT_VF(vfnmsub_vf_d, 8, 8, clearq)
+
+/* Vector Widening Floating-Point Fused Multiply-Add Instructions */
+static uint32_t fwmacc16(uint16_t a, uint16_t b, uint32_t d, float_status *s)
+{
+    return float32_muladd(float16_to_float32(a, true, s),
+                        float16_to_float32(b, true, s), d, 0, s);
+}
+
+static uint64_t fwmacc32(uint32_t a, uint32_t b, uint64_t d, float_status *s)
+{
+    return float64_muladd(float32_to_float64(a, s),
+                        float32_to_float64(b, s), d, 0, s);
+}
+
+RVVCALL(OPFVV3, vfwmacc_vv_h, WOP_UUU_H, H4, H2, H2, fwmacc16)
+RVVCALL(OPFVV3, vfwmacc_vv_w, WOP_UUU_W, H8, H4, H4, fwmacc32)
+GEN_VEXT_VV_ENV(vfwmacc_vv_h, 2, 4, clearl)
+GEN_VEXT_VV_ENV(vfwmacc_vv_w, 4, 8, clearq)
+RVVCALL(OPFVF3, vfwmacc_vf_h, WOP_UUU_H, H4, H2, fwmacc16)
+RVVCALL(OPFVF3, vfwmacc_vf_w, WOP_UUU_W, H8, H4, fwmacc32)
+GEN_VEXT_VF(vfwmacc_vf_h, 2, 4, clearl)
+GEN_VEXT_VF(vfwmacc_vf_w, 4, 8, clearq)
+
+static uint32_t fwnmacc16(uint16_t a, uint16_t b, uint32_t d, float_status *s)
+{
+    return float32_muladd(float16_to_float32(a, true, s),
+                        float16_to_float32(b, true, s), d,
+                        float_muladd_negate_c | float_muladd_negate_product, s);
+}
+
+static uint64_t fwnmacc32(uint32_t a, uint32_t b, uint64_t d, float_status *s)
+{
+    return float64_muladd(float32_to_float64(a, s),
+                        float32_to_float64(b, s), d,
+                        float_muladd_negate_c | float_muladd_negate_product, s);
+}
+
+RVVCALL(OPFVV3, vfwnmacc_vv_h, WOP_UUU_H, H4, H2, H2, fwnmacc16)
+RVVCALL(OPFVV3, vfwnmacc_vv_w, WOP_UUU_W, H8, H4, H4, fwnmacc32)
+GEN_VEXT_VV_ENV(vfwnmacc_vv_h, 2, 4, clearl)
+GEN_VEXT_VV_ENV(vfwnmacc_vv_w, 4, 8, clearq)
+RVVCALL(OPFVF3, vfwnmacc_vf_h, WOP_UUU_H, H4, H2, fwnmacc16)
+RVVCALL(OPFVF3, vfwnmacc_vf_w, WOP_UUU_W, H8, H4, fwnmacc32)
+GEN_VEXT_VF(vfwnmacc_vf_h, 2, 4, clearl)
+GEN_VEXT_VF(vfwnmacc_vf_w, 4, 8, clearq)
+
+static uint32_t fwmsac16(uint16_t a, uint16_t b, uint32_t d, float_status *s)
+{
+    return float32_muladd(float16_to_float32(a, true, s),
+                        float16_to_float32(b, true, s), d,
+                        float_muladd_negate_c, s);
+}
+
+static uint64_t fwmsac32(uint32_t a, uint32_t b, uint64_t d, float_status *s)
+{
+    return float64_muladd(float32_to_float64(a, s),
+                        float32_to_float64(b, s), d,
+                        float_muladd_negate_c, s);
+}
+
+RVVCALL(OPFVV3, vfwmsac_vv_h, WOP_UUU_H, H4, H2, H2, fwmsac16)
+RVVCALL(OPFVV3, vfwmsac_vv_w, WOP_UUU_W, H8, H4, H4, fwmsac32)
+GEN_VEXT_VV_ENV(vfwmsac_vv_h, 2, 4, clearl)
+GEN_VEXT_VV_ENV(vfwmsac_vv_w, 4, 8, clearq)
+RVVCALL(OPFVF3, vfwmsac_vf_h, WOP_UUU_H, H4, H2, fwmsac16)
+RVVCALL(OPFVF3, vfwmsac_vf_w, WOP_UUU_W, H8, H4, fwmsac32)
+GEN_VEXT_VF(vfwmsac_vf_h, 2, 4, clearl)
+GEN_VEXT_VF(vfwmsac_vf_w, 4, 8, clearq)
+
+static uint32_t fwnmsac16(uint16_t a, uint16_t b, uint32_t d, float_status *s)
+{
+    return float32_muladd(float16_to_float32(a, true, s),
+                        float16_to_float32(b, true, s), d,
+                        float_muladd_negate_product, s);
+}
+
+static uint64_t fwnmsac32(uint32_t a, uint32_t b, uint64_t d, float_status *s)
+{
+    return float64_muladd(float32_to_float64(a, s),
+                        float32_to_float64(b, s), d,
+                        float_muladd_negate_product, s);
+}
+
+RVVCALL(OPFVV3, vfwnmsac_vv_h, WOP_UUU_H, H4, H2, H2, fwnmsac16)
+RVVCALL(OPFVV3, vfwnmsac_vv_w, WOP_UUU_W, H8, H4, H4, fwnmsac32)
+GEN_VEXT_VV_ENV(vfwnmsac_vv_h, 2, 4, clearl)
+GEN_VEXT_VV_ENV(vfwnmsac_vv_w, 4, 8, clearq)
+RVVCALL(OPFVF3, vfwnmsac_vf_h, WOP_UUU_H, H4, H2, fwnmsac16)
+RVVCALL(OPFVF3, vfwnmsac_vf_w, WOP_UUU_W, H8, H4, fwnmsac32)
+GEN_VEXT_VF(vfwnmsac_vf_h, 2, 4, clearl)
+GEN_VEXT_VF(vfwnmsac_vf_w, 4, 8, clearq)
-- 
2.23.0


