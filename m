Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78B9C2021B7
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Jun 2020 07:44:34 +0200 (CEST)
Received: from localhost ([::1]:40584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jmWIr-0007Zx-HB
	for lists+qemu-devel@lfdr.de; Sat, 20 Jun 2020 01:44:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jmWI0-00076c-5w; Sat, 20 Jun 2020 01:43:40 -0400
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:41202)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jmWHx-0008RC-K7; Sat, 20 Jun 2020 01:43:39 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.1805073|-1; CH=blue; DM=|OVERLOAD|false|;
 DS=CONTINUE|ham_system_inform|0.027892-8.54176e-05-0.972023;
 FP=3368813710931602547|2|2|6|0|-1|-1|-1; HT=e01a16378; MF=zhiwei_liu@c-sky.com;
 NM=1; PH=DS; RN=9; RT=8; SR=0; TI=SMTPD_---.HpYLM6C_1592631812; 
Received: from L-PF1D6DP4-1208.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.HpYLM6C_1592631812)
 by smtp.aliyun-inc.com(10.147.41.158);
 Sat, 20 Jun 2020 13:43:32 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v10 33/61] target/riscv: vector widening floating-point
 multiply
Date: Sat, 20 Jun 2020 12:36:33 +0800
Message-Id: <20200620043701.1323-34-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200620043701.1323-1-zhiwei_liu@c-sky.com>
References: <20200620043701.1323-1-zhiwei_liu@c-sky.com>
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
 target/riscv/helper.h                   |  5 +++++
 target/riscv/insn32.decode              |  2 ++
 target/riscv/insn_trans/trans_rvv.inc.c |  4 ++++
 target/riscv/vector_helper.c            | 22 ++++++++++++++++++++++
 4 files changed, 33 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 94305bd870..9d7dcfeef9 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -852,3 +852,8 @@ DEF_HELPER_6(vfdiv_vf_d, void, ptr, ptr, i64, ptr, env, i32)
 DEF_HELPER_6(vfrdiv_vf_h, void, ptr, ptr, i64, ptr, env, i32)
 DEF_HELPER_6(vfrdiv_vf_w, void, ptr, ptr, i64, ptr, env, i32)
 DEF_HELPER_6(vfrdiv_vf_d, void, ptr, ptr, i64, ptr, env, i32)
+
+DEF_HELPER_6(vfwmul_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vfwmul_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vfwmul_vf_h, void, ptr, ptr, i64, ptr, env, i32)
+DEF_HELPER_6(vfwmul_vf_w, void, ptr, ptr, i64, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 5db02f0c0a..dd9bca7eeb 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -463,6 +463,8 @@ vfmul_vf        100100 . ..... ..... 101 ..... 1010111 @r_vm
 vfdiv_vv        100000 . ..... ..... 001 ..... 1010111 @r_vm
 vfdiv_vf        100000 . ..... ..... 101 ..... 1010111 @r_vm
 vfrdiv_vf       100001 . ..... ..... 101 ..... 1010111 @r_vm
+vfwmul_vv       111000 . ..... ..... 001 ..... 1010111 @r_vm
+vfwmul_vf       111000 . ..... ..... 101 ..... 1010111 @r_vm
 
 vsetvli         0 ........... ..... 111 ..... 1010111  @r2_zimm
 vsetvl          1000000 ..... ..... 111 ..... 1010111  @r
diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index be60115801..7ff3af0c61 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -2057,3 +2057,7 @@ GEN_OPFVV_TRANS(vfdiv_vv, opfvv_check)
 GEN_OPFVF_TRANS(vfmul_vf,  opfvf_check)
 GEN_OPFVF_TRANS(vfdiv_vf,  opfvf_check)
 GEN_OPFVF_TRANS(vfrdiv_vf,  opfvf_check)
+
+/* Vector Widening Floating-Point Multiply */
+GEN_OPFVV_WIDEN_TRANS(vfwmul_vv, opfvv_widen_check)
+GEN_OPFVF_WIDEN_TRANS(vfwmul_vf)
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index ea807ef731..0dd94348e8 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -3410,3 +3410,25 @@ RVVCALL(OPFVF2, vfrdiv_vf_d, OP_UUU_D, H8, H8, float64_rdiv)
 GEN_VEXT_VF(vfrdiv_vf_h, 2, 2, clearh)
 GEN_VEXT_VF(vfrdiv_vf_w, 4, 4, clearl)
 GEN_VEXT_VF(vfrdiv_vf_d, 8, 8, clearq)
+
+/* Vector Widening Floating-Point Multiply */
+static uint32_t vfwmul16(uint16_t a, uint16_t b, float_status *s)
+{
+    return float32_mul(float16_to_float32(a, true, s),
+            float16_to_float32(b, true, s), s);
+}
+
+static uint64_t vfwmul32(uint32_t a, uint32_t b, float_status *s)
+{
+    return float64_mul(float32_to_float64(a, s),
+            float32_to_float64(b, s), s);
+
+}
+RVVCALL(OPFVV2, vfwmul_vv_h, WOP_UUU_H, H4, H2, H2, vfwmul16)
+RVVCALL(OPFVV2, vfwmul_vv_w, WOP_UUU_W, H8, H4, H4, vfwmul32)
+GEN_VEXT_VV_ENV(vfwmul_vv_h, 2, 4, clearl)
+GEN_VEXT_VV_ENV(vfwmul_vv_w, 4, 8, clearq)
+RVVCALL(OPFVF2, vfwmul_vf_h, WOP_UUU_H, H4, H2, vfwmul16)
+RVVCALL(OPFVF2, vfwmul_vf_w, WOP_UUU_W, H8, H4, vfwmul32)
+GEN_VEXT_VF(vfwmul_vf_h, 2, 4, clearl)
+GEN_VEXT_VF(vfwmul_vf_w, 4, 8, clearq)
-- 
2.23.0


