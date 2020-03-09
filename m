Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E56D417E01F
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Mar 2020 13:24:30 +0100 (CET)
Received: from localhost ([::1]:42152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jBHSP-0006kV-VT
	for lists+qemu-devel@lfdr.de; Mon, 09 Mar 2020 08:24:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56608)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1jBHJy-0002Lj-Gr
 for qemu-devel@nongnu.org; Mon, 09 Mar 2020 08:15:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1jBHJu-00034c-Iw
 for qemu-devel@nongnu.org; Mon, 09 Mar 2020 08:15:46 -0400
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:53381)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jBHJt-0002by-S6; Mon, 09 Mar 2020 08:15:42 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07443219|-1; CH=blue; DM=||false|;
 DS=CONTINUE|ham_regular_dialog|0.115391-0.000860666-0.883749;
 FP=2217989352393507843|1|1|7|0|-1|-1|-1; HT=e02c03302; MF=zhiwei_liu@c-sky.com;
 NM=1; PH=DS; RN=10; RT=10; SR=0; TI=SMTPD_---.GyaeXy8_1583756101; 
Received: from L-PF1D6DP4-1208.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.GyaeXy8_1583756101)
 by smtp.aliyun-inc.com(10.147.41.199);
 Mon, 09 Mar 2020 20:15:15 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: richard.henderson@linaro.org, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
Subject: [PATCH v3 24/60] target/riscv: vector single-width averaging add and
 subtract
Date: Mon,  9 Mar 2020 20:14:21 +0800
Message-Id: <20200309121457.13719-25-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200309121457.13719-1-zhiwei_liu@c-sky.com>
References: <20200309121457.13719-1-zhiwei_liu@c-sky.com>
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
---
 target/riscv/helper.h                   |  17 ++++
 target/riscv/insn32.decode              |   5 +
 target/riscv/insn_trans/trans_rvv.inc.c |   7 ++
 target/riscv/vector_helper.c            | 129 ++++++++++++++++++++++++
 4 files changed, 158 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 95da00d365..d3837d2ca4 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -707,3 +707,20 @@ DEF_HELPER_6(vssub_vx_b, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vssub_vx_h, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vssub_vx_w, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vssub_vx_d, void, ptr, ptr, tl, ptr, env, i32)
+
+DEF_HELPER_6(vaadd_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vaadd_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vaadd_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vaadd_vv_d, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vasub_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vasub_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vasub_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vasub_vv_d, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vaadd_vx_b, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vaadd_vx_h, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vaadd_vx_w, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vaadd_vx_d, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vasub_vx_b, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vasub_vx_h, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vasub_vx_w, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vasub_vx_d, void, ptr, ptr, tl, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 44baadf582..0227a16b16 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -412,6 +412,11 @@ vssubu_vv       100010 . ..... ..... 000 ..... 1010111 @r_vm
 vssubu_vx       100010 . ..... ..... 100 ..... 1010111 @r_vm
 vssub_vv        100011 . ..... ..... 000 ..... 1010111 @r_vm
 vssub_vx        100011 . ..... ..... 100 ..... 1010111 @r_vm
+vaadd_vv        100100 . ..... ..... 000 ..... 1010111 @r_vm
+vaadd_vx        100100 . ..... ..... 100 ..... 1010111 @r_vm
+vaadd_vi        100100 . ..... ..... 011 ..... 1010111 @r_vm
+vasub_vv        100110 . ..... ..... 000 ..... 1010111 @r_vm
+vasub_vx        100110 . ..... ..... 100 ..... 1010111 @r_vm
 
 vsetvli         0 ........... ..... 111 ..... 1010111  @r2_zimm
 vsetvl          1000000 ..... ..... 111 ..... 1010111  @r
diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index ad55766b98..9988fad2fe 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -1521,3 +1521,10 @@ GEN_OPIVX_TRANS(vssubu_vx,  opivx_check)
 GEN_OPIVX_TRANS(vssub_vx,  opivx_check)
 GEN_OPIVI_TRANS(vsaddu_vi, 1, vsaddu_vx, opivx_check)
 GEN_OPIVI_TRANS(vsadd_vi, 0, vsadd_vx, opivx_check)
+
+/* Vector Single-Width Averaging Add and Subtract */
+GEN_OPIVV_TRANS(vaadd_vv, opivv_check)
+GEN_OPIVV_TRANS(vasub_vv, opivv_check)
+GEN_OPIVX_TRANS(vaadd_vx,  opivx_check)
+GEN_OPIVX_TRANS(vasub_vx,  opivx_check)
+GEN_OPIVI_TRANS(vaadd_vi, 0, vaadd_vx, opivx_check)
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index c7b8c1bff4..b0a7a3b6e4 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -2291,3 +2291,132 @@ GEN_VEXT_VX_ENV(vssub_vx_b, 1, 1, clearb)
 GEN_VEXT_VX_ENV(vssub_vx_h, 2, 2, clearh)
 GEN_VEXT_VX_ENV(vssub_vx_w, 4, 4, clearl)
 GEN_VEXT_VX_ENV(vssub_vx_d, 8, 8, clearq)
+
+/* Vector Single-Width Averaging Add and Subtract */
+static inline uint8_t get_round(CPURISCVState *env, uint64_t v, uint8_t shift)
+{
+    uint8_t d = extract64(v, shift, 1);
+    uint8_t d1;
+    uint64_t D1, D2;
+    int mod = env->vxrm;
+
+    if (shift == 0 || shift > 64) {
+        return 0;
+    }
+
+    d1 = extract64(v, shift - 1, 1);
+    D1 = extract64(v, 0, shift);
+    if (mod == 0) { /* round-to-nearest-up (add +0.5 LSB) */
+        return d1;
+    } else if (mod == 1) { /* round-to-nearest-even */
+        if (shift > 1) {
+            D2 = extract64(v, 0, shift - 1);
+            return d1 & ((D2 != 0) | d);
+        } else {
+            return d1 & d;
+        }
+    } else if (mod == 3) { /* round-to-odd (OR bits into LSB, aka "jam") */
+        return !d & (D1 != 0);
+    }
+    return 0; /* round-down (truncate) */
+}
+
+static inline int8_t aadd8(CPURISCVState *env, int8_t a, int8_t b)
+{
+    int16_t res = (int16_t)a + (int16_t)b;
+    uint8_t round = get_round(env, res, 1);
+    res   = (res >> 1) + round;
+    return res;
+}
+static inline int16_t aadd16(CPURISCVState *env, int16_t a, int16_t b)
+{
+    int32_t res = (int32_t)a + (int32_t)b;
+    uint8_t round = get_round(env, res, 1);
+    res   = (res >> 1) + round;
+    return res;
+}
+static inline int32_t aadd32(CPURISCVState *env, int32_t a, int32_t b)
+{
+    int64_t res = (int64_t)a + (int64_t)b;
+    uint8_t round = get_round(env, res, 1);
+    res   = (res >> 1) + round;
+    return res;
+}
+static inline int64_t aadd64(CPURISCVState *env, int64_t a, int64_t b)
+{
+    int64_t res = (int64_t)a + (int64_t)b;
+    uint8_t round = get_round(env, res, 1); /* get_round only need v[d : 0] */
+    if (((res ^ a) & (res ^ b)) >> 63 == -1LL) { /* overflow */
+        res = ((res >> 1) ^ INT64_MIN) + round;
+    } else {
+        res   = (res >> 1) + round;
+    }
+    return res;
+}
+RVVCALL(OPIVV2_ENV, vaadd_vv_b, OP_SSS_B, H1, H1, H1, aadd8)
+RVVCALL(OPIVV2_ENV, vaadd_vv_h, OP_SSS_H, H2, H2, H2, aadd16)
+RVVCALL(OPIVV2_ENV, vaadd_vv_w, OP_SSS_W, H4, H4, H4, aadd32)
+RVVCALL(OPIVV2_ENV, vaadd_vv_d, OP_SSS_D, H8, H8, H8, aadd64)
+GEN_VEXT_VV_ENV(vaadd_vv_b, 1, 1, clearb)
+GEN_VEXT_VV_ENV(vaadd_vv_h, 2, 2, clearh)
+GEN_VEXT_VV_ENV(vaadd_vv_w, 4, 4, clearl)
+GEN_VEXT_VV_ENV(vaadd_vv_d, 8, 8, clearq)
+
+RVVCALL(OPIVX2_ENV, vaadd_vx_b, OP_SSS_B, H1, H1, aadd8)
+RVVCALL(OPIVX2_ENV, vaadd_vx_h, OP_SSS_H, H2, H2, aadd16)
+RVVCALL(OPIVX2_ENV, vaadd_vx_w, OP_SSS_W, H4, H4, aadd32)
+RVVCALL(OPIVX2_ENV, vaadd_vx_d, OP_SSS_D, H8, H8, aadd64)
+GEN_VEXT_VX_ENV(vaadd_vx_b, 1, 1, clearb)
+GEN_VEXT_VX_ENV(vaadd_vx_h, 2, 2, clearh)
+GEN_VEXT_VX_ENV(vaadd_vx_w, 4, 4, clearl)
+GEN_VEXT_VX_ENV(vaadd_vx_d, 8, 8, clearq)
+
+static inline int8_t asub8(CPURISCVState *env, int8_t a, int8_t b)
+{
+    int16_t res = (int16_t)a - (int16_t)b;
+    uint8_t round = get_round(env, res, 1);
+    res   = (res >> 1) + round;
+    return res;
+}
+static inline int16_t asub16(CPURISCVState *env, int16_t a, int16_t b)
+{
+    int32_t res = (int32_t)a - (int32_t)b;
+    uint8_t round = get_round(env, res, 1);
+    res   = (res >> 1) + round;
+    return res;
+}
+static inline int32_t asub32(CPURISCVState *env, int32_t a, int32_t b)
+{
+    int64_t res = (int64_t)a - (int64_t)b;
+    uint8_t round = get_round(env, res, 1);
+    res   = (res >> 1) + round;
+    return res;
+}
+static inline int64_t asub64(CPURISCVState *env, int64_t a, int64_t b)
+{
+    int64_t res = (int64_t)a - (int64_t)b;
+    uint8_t round = get_round(env, res, 1); /* get_round only need v[d : 0] */
+    if (((res ^ a) & (a ^ b)) >> 63 == -1LL) { /* overflow */
+        res = ((res >> 1) ^ INT64_MIN) + round;
+    } else {
+        res   = (res >> 1) + round;
+    }
+    return res;
+}
+RVVCALL(OPIVV2_ENV, vasub_vv_b, OP_SSS_B, H1, H1, H1, asub8)
+RVVCALL(OPIVV2_ENV, vasub_vv_h, OP_SSS_H, H2, H2, H2, asub16)
+RVVCALL(OPIVV2_ENV, vasub_vv_w, OP_SSS_W, H4, H4, H4, asub32)
+RVVCALL(OPIVV2_ENV, vasub_vv_d, OP_SSS_D, H8, H8, H8, asub64)
+GEN_VEXT_VV_ENV(vasub_vv_b, 1, 1, clearb)
+GEN_VEXT_VV_ENV(vasub_vv_h, 2, 2, clearh)
+GEN_VEXT_VV_ENV(vasub_vv_w, 4, 4, clearl)
+GEN_VEXT_VV_ENV(vasub_vv_d, 8, 8, clearq)
+
+RVVCALL(OPIVX2_ENV, vasub_vx_b, OP_SSS_B, H1, H1, asub8)
+RVVCALL(OPIVX2_ENV, vasub_vx_h, OP_SSS_H, H2, H2, asub16)
+RVVCALL(OPIVX2_ENV, vasub_vx_w, OP_SSS_W, H4, H4, asub32)
+RVVCALL(OPIVX2_ENV, vasub_vx_d, OP_SSS_D, H8, H8, asub64)
+GEN_VEXT_VX_ENV(vasub_vx_b, 1, 1, clearb)
+GEN_VEXT_VX_ENV(vasub_vx_h, 2, 2, clearh)
+GEN_VEXT_VX_ENV(vasub_vx_w, 4, 4, clearl)
+GEN_VEXT_VX_ENV(vasub_vx_d, 8, 8, clearq)
-- 
2.23.0


