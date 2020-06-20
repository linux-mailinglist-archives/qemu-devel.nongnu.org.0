Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23DC3202110
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Jun 2020 05:47:43 +0200 (CEST)
Received: from localhost ([::1]:53988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jmUTl-0002Fh-EM
	for lists+qemu-devel@lfdr.de; Fri, 19 Jun 2020 23:47:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jmUSV-0001G3-F1; Fri, 19 Jun 2020 23:46:23 -0400
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:54349)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jmUSS-00082J-Ju; Fri, 19 Jun 2020 23:46:23 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07438648|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_regular_dialog|0.0804894-0.000955938-0.918555;
 FP=0|0|0|0|0|-1|-1|-1; HT=e02c03299; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS;
 RN=9; RT=8; SR=0; TI=SMTPD_---.HpWGUWH_1592624771; 
Received: from L-PF1D6DP4-1208.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.HpWGUWH_1592624771)
 by smtp.aliyun-inc.com(10.147.41.187);
 Sat, 20 Jun 2020 11:46:11 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v10 25/61] target/riscv: vector single-width averaging add and
 subtract
Date: Sat, 20 Jun 2020 10:55:04 +0800
Message-Id: <20200620025540.1109-26-zhiwei_liu@c-sky.com>
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
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/helper.h                   |  17 ++++
 target/riscv/insn32.decode              |   5 ++
 target/riscv/insn_trans/trans_rvv.inc.c |   7 ++
 target/riscv/vector_helper.c            | 100 ++++++++++++++++++++++++
 4 files changed, 129 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 85bd4b91bc..db9e2024ae 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -725,3 +725,20 @@ DEF_HELPER_6(vssub_vx_b, void, ptr, ptr, tl, ptr, env, i32)
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
index 70df42de9a..57228242aa 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -419,6 +419,11 @@ vssubu_vv       100010 . ..... ..... 000 ..... 1010111 @r_vm
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
index 4d5eae8dde..ed1ee0f1b5 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -1747,3 +1747,10 @@ GEN_OPIVX_TRANS(vssubu_vx,  opivx_check)
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
index 3d4212ea4a..ada95ab1e7 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -2497,3 +2497,103 @@ GEN_VEXT_VX_RM(vssub_vx_b, 1, 1, clearb)
 GEN_VEXT_VX_RM(vssub_vx_h, 2, 2, clearh)
 GEN_VEXT_VX_RM(vssub_vx_w, 4, 4, clearl)
 GEN_VEXT_VX_RM(vssub_vx_d, 8, 8, clearq)
+
+/* Vector Single-Width Averaging Add and Subtract */
+static inline uint8_t get_round(int vxrm, uint64_t v, uint8_t shift)
+{
+    uint8_t d = extract64(v, shift, 1);
+    uint8_t d1;
+    uint64_t D1, D2;
+
+    if (shift == 0 || shift > 64) {
+        return 0;
+    }
+
+    d1 = extract64(v, shift - 1, 1);
+    D1 = extract64(v, 0, shift);
+    if (vxrm == 0) { /* round-to-nearest-up (add +0.5 LSB) */
+        return d1;
+    } else if (vxrm == 1) { /* round-to-nearest-even */
+        if (shift > 1) {
+            D2 = extract64(v, 0, shift - 1);
+            return d1 & ((D2 != 0) | d);
+        } else {
+            return d1 & d;
+        }
+    } else if (vxrm == 3) { /* round-to-odd (OR bits into LSB, aka "jam") */
+        return !d & (D1 != 0);
+    }
+    return 0; /* round-down (truncate) */
+}
+
+static inline int32_t aadd32(CPURISCVState *env, int vxrm, int32_t a, int32_t b)
+{
+    int64_t res = (int64_t)a + b;
+    uint8_t round = get_round(vxrm, res, 1);
+
+    return (res >> 1) + round;
+}
+
+static inline int64_t aadd64(CPURISCVState *env, int vxrm, int64_t a, int64_t b)
+{
+    int64_t res = a + b;
+    uint8_t round = get_round(vxrm, res, 1);
+    int64_t over = (res ^ a) & (res ^ b) & INT64_MIN;
+
+    /* With signed overflow, bit 64 is inverse of bit 63. */
+    return ((res >> 1) ^ over) + round;
+}
+
+RVVCALL(OPIVV2_RM, vaadd_vv_b, OP_SSS_B, H1, H1, H1, aadd32)
+RVVCALL(OPIVV2_RM, vaadd_vv_h, OP_SSS_H, H2, H2, H2, aadd32)
+RVVCALL(OPIVV2_RM, vaadd_vv_w, OP_SSS_W, H4, H4, H4, aadd32)
+RVVCALL(OPIVV2_RM, vaadd_vv_d, OP_SSS_D, H8, H8, H8, aadd64)
+GEN_VEXT_VV_RM(vaadd_vv_b, 1, 1, clearb)
+GEN_VEXT_VV_RM(vaadd_vv_h, 2, 2, clearh)
+GEN_VEXT_VV_RM(vaadd_vv_w, 4, 4, clearl)
+GEN_VEXT_VV_RM(vaadd_vv_d, 8, 8, clearq)
+
+RVVCALL(OPIVX2_RM, vaadd_vx_b, OP_SSS_B, H1, H1, aadd32)
+RVVCALL(OPIVX2_RM, vaadd_vx_h, OP_SSS_H, H2, H2, aadd32)
+RVVCALL(OPIVX2_RM, vaadd_vx_w, OP_SSS_W, H4, H4, aadd32)
+RVVCALL(OPIVX2_RM, vaadd_vx_d, OP_SSS_D, H8, H8, aadd64)
+GEN_VEXT_VX_RM(vaadd_vx_b, 1, 1, clearb)
+GEN_VEXT_VX_RM(vaadd_vx_h, 2, 2, clearh)
+GEN_VEXT_VX_RM(vaadd_vx_w, 4, 4, clearl)
+GEN_VEXT_VX_RM(vaadd_vx_d, 8, 8, clearq)
+
+static inline int32_t asub32(CPURISCVState *env, int vxrm, int32_t a, int32_t b)
+{
+    int64_t res = (int64_t)a - b;
+    uint8_t round = get_round(vxrm, res, 1);
+
+    return (res >> 1) + round;
+}
+
+static inline int64_t asub64(CPURISCVState *env, int vxrm, int64_t a, int64_t b)
+{
+    int64_t res = (int64_t)a - b;
+    uint8_t round = get_round(vxrm, res, 1);
+    int64_t over = (res ^ a) & (a ^ b) & INT64_MIN;
+
+    /* With signed overflow, bit 64 is inverse of bit 63. */
+    return ((res >> 1) ^ over) + round;
+}
+
+RVVCALL(OPIVV2_RM, vasub_vv_b, OP_SSS_B, H1, H1, H1, asub32)
+RVVCALL(OPIVV2_RM, vasub_vv_h, OP_SSS_H, H2, H2, H2, asub32)
+RVVCALL(OPIVV2_RM, vasub_vv_w, OP_SSS_W, H4, H4, H4, asub32)
+RVVCALL(OPIVV2_RM, vasub_vv_d, OP_SSS_D, H8, H8, H8, asub64)
+GEN_VEXT_VV_RM(vasub_vv_b, 1, 1, clearb)
+GEN_VEXT_VV_RM(vasub_vv_h, 2, 2, clearh)
+GEN_VEXT_VV_RM(vasub_vv_w, 4, 4, clearl)
+GEN_VEXT_VV_RM(vasub_vv_d, 8, 8, clearq)
+
+RVVCALL(OPIVX2_RM, vasub_vx_b, OP_SSS_B, H1, H1, asub32)
+RVVCALL(OPIVX2_RM, vasub_vx_h, OP_SSS_H, H2, H2, asub32)
+RVVCALL(OPIVX2_RM, vasub_vx_w, OP_SSS_W, H4, H4, asub32)
+RVVCALL(OPIVX2_RM, vasub_vx_d, OP_SSS_D, H8, H8, asub64)
+GEN_VEXT_VX_RM(vasub_vx_b, 1, 1, clearb)
+GEN_VEXT_VX_RM(vasub_vx_h, 2, 2, clearh)
+GEN_VEXT_VX_RM(vasub_vx_w, 4, 4, clearl)
+GEN_VEXT_VX_RM(vasub_vx_d, 8, 8, clearq)
-- 
2.23.0


