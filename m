Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5230D202119
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Jun 2020 05:51:32 +0200 (CEST)
Received: from localhost ([::1]:58436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jmUXT-0005jR-Dv
	for lists+qemu-devel@lfdr.de; Fri, 19 Jun 2020 23:51:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jmUWN-000507-H7; Fri, 19 Jun 2020 23:50:23 -0400
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:50671)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jmUWL-0008UW-4p; Fri, 19 Jun 2020 23:50:23 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07436282|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_regular_dialog|0.345499-0.00503094-0.64947;
 FP=0|0|0|0|0|-1|-1|-1; HT=e02c03267; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS;
 RN=9; RT=8; SR=0; TI=SMTPD_---.HpWKh4k_1592625013; 
Received: from L-PF1D6DP4-1208.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.HpWKh4k_1592625013)
 by smtp.aliyun-inc.com(10.147.41.120);
 Sat, 20 Jun 2020 11:50:14 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v10 27/61] target/riscv: vector widening saturating scaled
 multiply-add
Date: Sat, 20 Jun 2020 10:55:06 +0800
Message-Id: <20200620025540.1109-28-zhiwei_liu@c-sky.com>
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
 target/riscv/helper.h                   |  22 +++
 target/riscv/insn32.decode              |   7 +
 target/riscv/insn_trans/trans_rvv.inc.c |   9 ++
 target/riscv/vector_helper.c            | 205 ++++++++++++++++++++++++
 4 files changed, 243 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index b2fc71c2ea..f123302b82 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -751,3 +751,25 @@ DEF_HELPER_6(vsmul_vx_b, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vsmul_vx_h, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vsmul_vx_w, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vsmul_vx_d, void, ptr, ptr, tl, ptr, env, i32)
+
+DEF_HELPER_6(vwsmaccu_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vwsmaccu_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vwsmaccu_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vwsmacc_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vwsmacc_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vwsmacc_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vwsmaccsu_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vwsmaccsu_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vwsmaccsu_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vwsmaccu_vx_b, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vwsmaccu_vx_h, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vwsmaccu_vx_w, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vwsmacc_vx_b, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vwsmacc_vx_h, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vwsmacc_vx_w, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vwsmaccsu_vx_b, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vwsmaccsu_vx_h, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vwsmaccsu_vx_w, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vwsmaccus_vx_b, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vwsmaccus_vx_h, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vwsmaccus_vx_w, void, ptr, ptr, tl, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 1dfc5f7ca0..8cc2bf4864 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -426,6 +426,13 @@ vasub_vv        100110 . ..... ..... 000 ..... 1010111 @r_vm
 vasub_vx        100110 . ..... ..... 100 ..... 1010111 @r_vm
 vsmul_vv        100111 . ..... ..... 000 ..... 1010111 @r_vm
 vsmul_vx        100111 . ..... ..... 100 ..... 1010111 @r_vm
+vwsmaccu_vv     111100 . ..... ..... 000 ..... 1010111 @r_vm
+vwsmaccu_vx     111100 . ..... ..... 100 ..... 1010111 @r_vm
+vwsmacc_vv      111101 . ..... ..... 000 ..... 1010111 @r_vm
+vwsmacc_vx      111101 . ..... ..... 100 ..... 1010111 @r_vm
+vwsmaccsu_vv    111110 . ..... ..... 000 ..... 1010111 @r_vm
+vwsmaccsu_vx    111110 . ..... ..... 100 ..... 1010111 @r_vm
+vwsmaccus_vx    111111 . ..... ..... 100 ..... 1010111 @r_vm
 
 vsetvli         0 ........... ..... 111 ..... 1010111  @r2_zimm
 vsetvl          1000000 ..... ..... 111 ..... 1010111  @r
diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index 23714793df..3886b2f45a 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -1758,3 +1758,12 @@ GEN_OPIVI_TRANS(vaadd_vi, 0, vaadd_vx, opivx_check)
 /* Vector Single-Width Fractional Multiply with Rounding and Saturation */
 GEN_OPIVV_TRANS(vsmul_vv, opivv_check)
 GEN_OPIVX_TRANS(vsmul_vx,  opivx_check)
+
+/* Vector Widening Saturating Scaled Multiply-Add */
+GEN_OPIVV_WIDEN_TRANS(vwsmaccu_vv, opivv_widen_check)
+GEN_OPIVV_WIDEN_TRANS(vwsmacc_vv, opivv_widen_check)
+GEN_OPIVV_WIDEN_TRANS(vwsmaccsu_vv, opivv_widen_check)
+GEN_OPIVX_WIDEN_TRANS(vwsmaccu_vx)
+GEN_OPIVX_WIDEN_TRANS(vwsmacc_vx)
+GEN_OPIVX_WIDEN_TRANS(vwsmaccsu_vx)
+GEN_OPIVX_WIDEN_TRANS(vwsmaccus_vx)
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index dd3fc39016..d653ec5e2b 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -2704,3 +2704,208 @@ GEN_VEXT_VX_RM(vsmul_vx_b, 1, 1, clearb)
 GEN_VEXT_VX_RM(vsmul_vx_h, 2, 2, clearh)
 GEN_VEXT_VX_RM(vsmul_vx_w, 4, 4, clearl)
 GEN_VEXT_VX_RM(vsmul_vx_d, 8, 8, clearq)
+
+/* Vector Widening Saturating Scaled Multiply-Add */
+static inline uint16_t
+vwsmaccu8(CPURISCVState *env, int vxrm, uint8_t a, uint8_t b,
+          uint16_t c)
+{
+    uint8_t round;
+    uint16_t res = (uint16_t)a * b;
+
+    round = get_round(vxrm, res, 4);
+    res   = (res >> 4) + round;
+    return saddu16(env, vxrm, c, res);
+}
+
+static inline uint32_t
+vwsmaccu16(CPURISCVState *env, int vxrm, uint16_t a, uint16_t b,
+           uint32_t c)
+{
+    uint8_t round;
+    uint32_t res = (uint32_t)a * b;
+
+    round = get_round(vxrm, res, 8);
+    res   = (res >> 8) + round;
+    return saddu32(env, vxrm, c, res);
+}
+
+static inline uint64_t
+vwsmaccu32(CPURISCVState *env, int vxrm, uint32_t a, uint32_t b,
+           uint64_t c)
+{
+    uint8_t round;
+    uint64_t res = (uint64_t)a * b;
+
+    round = get_round(vxrm, res, 16);
+    res   = (res >> 16) + round;
+    return saddu64(env, vxrm, c, res);
+}
+
+#define OPIVV3_RM(NAME, TD, T1, T2, TX1, TX2, HD, HS1, HS2, OP)    \
+static inline void                                                 \
+do_##NAME(void *vd, void *vs1, void *vs2, int i,                   \
+          CPURISCVState *env, int vxrm)                            \
+{                                                                  \
+    TX1 s1 = *((T1 *)vs1 + HS1(i));                                \
+    TX2 s2 = *((T2 *)vs2 + HS2(i));                                \
+    TD d = *((TD *)vd + HD(i));                                    \
+    *((TD *)vd + HD(i)) = OP(env, vxrm, s2, s1, d);                \
+}
+
+RVVCALL(OPIVV3_RM, vwsmaccu_vv_b, WOP_UUU_B, H2, H1, H1, vwsmaccu8)
+RVVCALL(OPIVV3_RM, vwsmaccu_vv_h, WOP_UUU_H, H4, H2, H2, vwsmaccu16)
+RVVCALL(OPIVV3_RM, vwsmaccu_vv_w, WOP_UUU_W, H8, H4, H4, vwsmaccu32)
+GEN_VEXT_VV_RM(vwsmaccu_vv_b, 1, 2, clearh)
+GEN_VEXT_VV_RM(vwsmaccu_vv_h, 2, 4, clearl)
+GEN_VEXT_VV_RM(vwsmaccu_vv_w, 4, 8, clearq)
+
+#define OPIVX3_RM(NAME, TD, T1, T2, TX1, TX2, HD, HS2, OP)         \
+static inline void                                                 \
+do_##NAME(void *vd, target_long s1, void *vs2, int i,              \
+          CPURISCVState *env, int vxrm)                            \
+{                                                                  \
+    TX2 s2 = *((T2 *)vs2 + HS2(i));                                \
+    TD d = *((TD *)vd + HD(i));                                    \
+    *((TD *)vd + HD(i)) = OP(env, vxrm, s2, (TX1)(T1)s1, d);       \
+}
+
+RVVCALL(OPIVX3_RM, vwsmaccu_vx_b, WOP_UUU_B, H2, H1, vwsmaccu8)
+RVVCALL(OPIVX3_RM, vwsmaccu_vx_h, WOP_UUU_H, H4, H2, vwsmaccu16)
+RVVCALL(OPIVX3_RM, vwsmaccu_vx_w, WOP_UUU_W, H8, H4, vwsmaccu32)
+GEN_VEXT_VX_RM(vwsmaccu_vx_b, 1, 2, clearh)
+GEN_VEXT_VX_RM(vwsmaccu_vx_h, 2, 4, clearl)
+GEN_VEXT_VX_RM(vwsmaccu_vx_w, 4, 8, clearq)
+
+static inline int16_t
+vwsmacc8(CPURISCVState *env, int vxrm, int8_t a, int8_t b, int16_t c)
+{
+    uint8_t round;
+    int16_t res = (int16_t)a * b;
+
+    round = get_round(vxrm, res, 4);
+    res   = (res >> 4) + round;
+    return sadd16(env, vxrm, c, res);
+}
+
+static inline int32_t
+vwsmacc16(CPURISCVState *env, int vxrm, int16_t a, int16_t b, int32_t c)
+{
+    uint8_t round;
+    int32_t res = (int32_t)a * b;
+
+    round = get_round(vxrm, res, 8);
+    res   = (res >> 8) + round;
+    return sadd32(env, vxrm, c, res);
+
+}
+
+static inline int64_t
+vwsmacc32(CPURISCVState *env, int vxrm, int32_t a, int32_t b, int64_t c)
+{
+    uint8_t round;
+    int64_t res = (int64_t)a * b;
+
+    round = get_round(vxrm, res, 16);
+    res   = (res >> 16) + round;
+    return sadd64(env, vxrm, c, res);
+}
+
+RVVCALL(OPIVV3_RM, vwsmacc_vv_b, WOP_SSS_B, H2, H1, H1, vwsmacc8)
+RVVCALL(OPIVV3_RM, vwsmacc_vv_h, WOP_SSS_H, H4, H2, H2, vwsmacc16)
+RVVCALL(OPIVV3_RM, vwsmacc_vv_w, WOP_SSS_W, H8, H4, H4, vwsmacc32)
+GEN_VEXT_VV_RM(vwsmacc_vv_b, 1, 2, clearh)
+GEN_VEXT_VV_RM(vwsmacc_vv_h, 2, 4, clearl)
+GEN_VEXT_VV_RM(vwsmacc_vv_w, 4, 8, clearq)
+RVVCALL(OPIVX3_RM, vwsmacc_vx_b, WOP_SSS_B, H2, H1, vwsmacc8)
+RVVCALL(OPIVX3_RM, vwsmacc_vx_h, WOP_SSS_H, H4, H2, vwsmacc16)
+RVVCALL(OPIVX3_RM, vwsmacc_vx_w, WOP_SSS_W, H8, H4, vwsmacc32)
+GEN_VEXT_VX_RM(vwsmacc_vx_b, 1, 2, clearh)
+GEN_VEXT_VX_RM(vwsmacc_vx_h, 2, 4, clearl)
+GEN_VEXT_VX_RM(vwsmacc_vx_w, 4, 8, clearq)
+
+static inline int16_t
+vwsmaccsu8(CPURISCVState *env, int vxrm, uint8_t a, int8_t b, int16_t c)
+{
+    uint8_t round;
+    int16_t res = a * (int16_t)b;
+
+    round = get_round(vxrm, res, 4);
+    res   = (res >> 4) + round;
+    return ssub16(env, vxrm, c, res);
+}
+
+static inline int32_t
+vwsmaccsu16(CPURISCVState *env, int vxrm, uint16_t a, int16_t b, uint32_t c)
+{
+    uint8_t round;
+    int32_t res = a * (int32_t)b;
+
+    round = get_round(vxrm, res, 8);
+    res   = (res >> 8) + round;
+    return ssub32(env, vxrm, c, res);
+}
+
+static inline int64_t
+vwsmaccsu32(CPURISCVState *env, int vxrm, uint32_t a, int32_t b, int64_t c)
+{
+    uint8_t round;
+    int64_t res = a * (int64_t)b;
+
+    round = get_round(vxrm, res, 16);
+    res   = (res >> 16) + round;
+    return ssub64(env, vxrm, c, res);
+}
+
+RVVCALL(OPIVV3_RM, vwsmaccsu_vv_b, WOP_SSU_B, H2, H1, H1, vwsmaccsu8)
+RVVCALL(OPIVV3_RM, vwsmaccsu_vv_h, WOP_SSU_H, H4, H2, H2, vwsmaccsu16)
+RVVCALL(OPIVV3_RM, vwsmaccsu_vv_w, WOP_SSU_W, H8, H4, H4, vwsmaccsu32)
+GEN_VEXT_VV_RM(vwsmaccsu_vv_b, 1, 2, clearh)
+GEN_VEXT_VV_RM(vwsmaccsu_vv_h, 2, 4, clearl)
+GEN_VEXT_VV_RM(vwsmaccsu_vv_w, 4, 8, clearq)
+RVVCALL(OPIVX3_RM, vwsmaccsu_vx_b, WOP_SSU_B, H2, H1, vwsmaccsu8)
+RVVCALL(OPIVX3_RM, vwsmaccsu_vx_h, WOP_SSU_H, H4, H2, vwsmaccsu16)
+RVVCALL(OPIVX3_RM, vwsmaccsu_vx_w, WOP_SSU_W, H8, H4, vwsmaccsu32)
+GEN_VEXT_VX_RM(vwsmaccsu_vx_b, 1, 2, clearh)
+GEN_VEXT_VX_RM(vwsmaccsu_vx_h, 2, 4, clearl)
+GEN_VEXT_VX_RM(vwsmaccsu_vx_w, 4, 8, clearq)
+
+static inline int16_t
+vwsmaccus8(CPURISCVState *env, int vxrm, int8_t a, uint8_t b, int16_t c)
+{
+    uint8_t round;
+    int16_t res = (int16_t)a * b;
+
+    round = get_round(vxrm, res, 4);
+    res   = (res >> 4) + round;
+    return ssub16(env, vxrm, c, res);
+}
+
+static inline int32_t
+vwsmaccus16(CPURISCVState *env, int vxrm, int16_t a, uint16_t b, int32_t c)
+{
+    uint8_t round;
+    int32_t res = (int32_t)a * b;
+
+    round = get_round(vxrm, res, 8);
+    res   = (res >> 8) + round;
+    return ssub32(env, vxrm, c, res);
+}
+
+static inline int64_t
+vwsmaccus32(CPURISCVState *env, int vxrm, int32_t a, uint32_t b, int64_t c)
+{
+    uint8_t round;
+    int64_t res = (int64_t)a * b;
+
+    round = get_round(vxrm, res, 16);
+    res   = (res >> 16) + round;
+    return ssub64(env, vxrm, c, res);
+}
+
+RVVCALL(OPIVX3_RM, vwsmaccus_vx_b, WOP_SUS_B, H2, H1, vwsmaccus8)
+RVVCALL(OPIVX3_RM, vwsmaccus_vx_h, WOP_SUS_H, H4, H2, vwsmaccus16)
+RVVCALL(OPIVX3_RM, vwsmaccus_vx_w, WOP_SUS_W, H8, H4, vwsmaccus32)
+GEN_VEXT_VX_RM(vwsmaccus_vx_b, 1, 2, clearh)
+GEN_VEXT_VX_RM(vwsmaccus_vx_h, 2, 4, clearl)
+GEN_VEXT_VX_RM(vwsmaccus_vx_w, 4, 8, clearq)
-- 
2.23.0


