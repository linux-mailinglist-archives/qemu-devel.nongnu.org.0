Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 467E9206826
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Jun 2020 01:17:21 +0200 (CEST)
Received: from localhost ([::1]:54940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jnsAK-0008LD-Ap
	for lists+qemu-devel@lfdr.de; Tue, 23 Jun 2020 19:17:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jns9V-0007s6-8x; Tue, 23 Jun 2020 19:16:29 -0400
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:38487)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jns9S-0000TY-Ho; Tue, 23 Jun 2020 19:16:28 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07455867|-1; CH=blue; DM=|OVERLOAD|false|;
 DS=CONTINUE|ham_system_inform|0.0261419-9.53996e-05-0.973763;
 FP=0|0|0|0|0|-1|-1|-1; HT=e01l07447; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS;
 RN=9; RT=8; SR=0; TI=SMTPD_---.HrSeMj7_1592954179; 
Received: from L-PF1D6DP4-1208.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.HrSeMj7_1592954179)
 by smtp.aliyun-inc.com(10.147.42.16); Wed, 24 Jun 2020 07:16:20 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v11 38/61] target/riscv: vector floating-point sign-injection
 instructions
Date: Wed, 24 Jun 2020 05:58:57 +0800
Message-Id: <20200623215920.2594-39-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200623215920.2594-1-zhiwei_liu@c-sky.com>
References: <20200623215920.2594-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=121.197.200.217;
 envelope-from=zhiwei_liu@c-sky.com; helo=smtp2200-217.mail.aliyun.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/23 17:32:41
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
 target/riscv/helper.h                   | 19 ++++++
 target/riscv/insn32.decode              |  6 ++
 target/riscv/insn_trans/trans_rvv.inc.c |  8 +++
 target/riscv/vector_helper.c            | 85 +++++++++++++++++++++++++
 4 files changed, 118 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index a080f8358a..eea4c59820 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -940,3 +940,22 @@ DEF_HELPER_6(vfmin_vf_d, void, ptr, ptr, i64, ptr, env, i32)
 DEF_HELPER_6(vfmax_vf_h, void, ptr, ptr, i64, ptr, env, i32)
 DEF_HELPER_6(vfmax_vf_w, void, ptr, ptr, i64, ptr, env, i32)
 DEF_HELPER_6(vfmax_vf_d, void, ptr, ptr, i64, ptr, env, i32)
+
+DEF_HELPER_6(vfsgnj_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vfsgnj_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vfsgnj_vv_d, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vfsgnjn_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vfsgnjn_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vfsgnjn_vv_d, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vfsgnjx_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vfsgnjx_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vfsgnjx_vv_d, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vfsgnj_vf_h, void, ptr, ptr, i64, ptr, env, i32)
+DEF_HELPER_6(vfsgnj_vf_w, void, ptr, ptr, i64, ptr, env, i32)
+DEF_HELPER_6(vfsgnj_vf_d, void, ptr, ptr, i64, ptr, env, i32)
+DEF_HELPER_6(vfsgnjn_vf_h, void, ptr, ptr, i64, ptr, env, i32)
+DEF_HELPER_6(vfsgnjn_vf_w, void, ptr, ptr, i64, ptr, env, i32)
+DEF_HELPER_6(vfsgnjn_vf_d, void, ptr, ptr, i64, ptr, env, i32)
+DEF_HELPER_6(vfsgnjx_vf_h, void, ptr, ptr, i64, ptr, env, i32)
+DEF_HELPER_6(vfsgnjx_vf_w, void, ptr, ptr, i64, ptr, env, i32)
+DEF_HELPER_6(vfsgnjx_vf_d, void, ptr, ptr, i64, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 854ff9a38f..0e173e9b71 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -496,6 +496,12 @@ vfmin_vv        000100 . ..... ..... 001 ..... 1010111 @r_vm
 vfmin_vf        000100 . ..... ..... 101 ..... 1010111 @r_vm
 vfmax_vv        000110 . ..... ..... 001 ..... 1010111 @r_vm
 vfmax_vf        000110 . ..... ..... 101 ..... 1010111 @r_vm
+vfsgnj_vv       001000 . ..... ..... 001 ..... 1010111 @r_vm
+vfsgnj_vf       001000 . ..... ..... 101 ..... 1010111 @r_vm
+vfsgnjn_vv      001001 . ..... ..... 001 ..... 1010111 @r_vm
+vfsgnjn_vf      001001 . ..... ..... 101 ..... 1010111 @r_vm
+vfsgnjx_vv      001010 . ..... ..... 001 ..... 1010111 @r_vm
+vfsgnjx_vf      001010 . ..... ..... 101 ..... 1010111 @r_vm
 
 vsetvli         0 ........... ..... 111 ..... 1010111  @r2_zimm
 vsetvl          1000000 ..... ..... 111 ..... 1010111  @r
diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index b40e8eec53..460d9bce8c 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -2138,3 +2138,11 @@ GEN_OPFVV_TRANS(vfmin_vv, opfvv_check)
 GEN_OPFVV_TRANS(vfmax_vv, opfvv_check)
 GEN_OPFVF_TRANS(vfmin_vf, opfvf_check)
 GEN_OPFVF_TRANS(vfmax_vf, opfvf_check)
+
+/* Vector Floating-Point Sign-Injection Instructions */
+GEN_OPFVV_TRANS(vfsgnj_vv, opfvv_check)
+GEN_OPFVV_TRANS(vfsgnjn_vv, opfvv_check)
+GEN_OPFVV_TRANS(vfsgnjx_vv, opfvv_check)
+GEN_OPFVF_TRANS(vfsgnj_vf, opfvf_check)
+GEN_OPFVF_TRANS(vfsgnjn_vf, opfvf_check)
+GEN_OPFVF_TRANS(vfsgnjx_vf, opfvf_check)
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 57f596be4f..dbf8817664 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -3844,3 +3844,88 @@ RVVCALL(OPFVF2, vfmax_vf_d, OP_UUU_D, H8, H8, float64_maxnum)
 GEN_VEXT_VF(vfmax_vf_h, 2, 2, clearh)
 GEN_VEXT_VF(vfmax_vf_w, 4, 4, clearl)
 GEN_VEXT_VF(vfmax_vf_d, 8, 8, clearq)
+
+/* Vector Floating-Point Sign-Injection Instructions */
+static uint16_t fsgnj16(uint16_t a, uint16_t b, float_status *s)
+{
+    return deposit64(b, 0, 15, a);
+}
+
+static uint32_t fsgnj32(uint32_t a, uint32_t b, float_status *s)
+{
+    return deposit64(b, 0, 31, a);
+}
+
+static uint64_t fsgnj64(uint64_t a, uint64_t b, float_status *s)
+{
+    return deposit64(b, 0, 63, a);
+}
+
+RVVCALL(OPFVV2, vfsgnj_vv_h, OP_UUU_H, H2, H2, H2, fsgnj16)
+RVVCALL(OPFVV2, vfsgnj_vv_w, OP_UUU_W, H4, H4, H4, fsgnj32)
+RVVCALL(OPFVV2, vfsgnj_vv_d, OP_UUU_D, H8, H8, H8, fsgnj64)
+GEN_VEXT_VV_ENV(vfsgnj_vv_h, 2, 2, clearh)
+GEN_VEXT_VV_ENV(vfsgnj_vv_w, 4, 4, clearl)
+GEN_VEXT_VV_ENV(vfsgnj_vv_d, 8, 8, clearq)
+RVVCALL(OPFVF2, vfsgnj_vf_h, OP_UUU_H, H2, H2, fsgnj16)
+RVVCALL(OPFVF2, vfsgnj_vf_w, OP_UUU_W, H4, H4, fsgnj32)
+RVVCALL(OPFVF2, vfsgnj_vf_d, OP_UUU_D, H8, H8, fsgnj64)
+GEN_VEXT_VF(vfsgnj_vf_h, 2, 2, clearh)
+GEN_VEXT_VF(vfsgnj_vf_w, 4, 4, clearl)
+GEN_VEXT_VF(vfsgnj_vf_d, 8, 8, clearq)
+
+static uint16_t fsgnjn16(uint16_t a, uint16_t b, float_status *s)
+{
+    return deposit64(~b, 0, 15, a);
+}
+
+static uint32_t fsgnjn32(uint32_t a, uint32_t b, float_status *s)
+{
+    return deposit64(~b, 0, 31, a);
+}
+
+static uint64_t fsgnjn64(uint64_t a, uint64_t b, float_status *s)
+{
+    return deposit64(~b, 0, 63, a);
+}
+
+RVVCALL(OPFVV2, vfsgnjn_vv_h, OP_UUU_H, H2, H2, H2, fsgnjn16)
+RVVCALL(OPFVV2, vfsgnjn_vv_w, OP_UUU_W, H4, H4, H4, fsgnjn32)
+RVVCALL(OPFVV2, vfsgnjn_vv_d, OP_UUU_D, H8, H8, H8, fsgnjn64)
+GEN_VEXT_VV_ENV(vfsgnjn_vv_h, 2, 2, clearh)
+GEN_VEXT_VV_ENV(vfsgnjn_vv_w, 4, 4, clearl)
+GEN_VEXT_VV_ENV(vfsgnjn_vv_d, 8, 8, clearq)
+RVVCALL(OPFVF2, vfsgnjn_vf_h, OP_UUU_H, H2, H2, fsgnjn16)
+RVVCALL(OPFVF2, vfsgnjn_vf_w, OP_UUU_W, H4, H4, fsgnjn32)
+RVVCALL(OPFVF2, vfsgnjn_vf_d, OP_UUU_D, H8, H8, fsgnjn64)
+GEN_VEXT_VF(vfsgnjn_vf_h, 2, 2, clearh)
+GEN_VEXT_VF(vfsgnjn_vf_w, 4, 4, clearl)
+GEN_VEXT_VF(vfsgnjn_vf_d, 8, 8, clearq)
+
+static uint16_t fsgnjx16(uint16_t a, uint16_t b, float_status *s)
+{
+    return deposit64(b ^ a, 0, 15, a);
+}
+
+static uint32_t fsgnjx32(uint32_t a, uint32_t b, float_status *s)
+{
+    return deposit64(b ^ a, 0, 31, a);
+}
+
+static uint64_t fsgnjx64(uint64_t a, uint64_t b, float_status *s)
+{
+    return deposit64(b ^ a, 0, 63, a);
+}
+
+RVVCALL(OPFVV2, vfsgnjx_vv_h, OP_UUU_H, H2, H2, H2, fsgnjx16)
+RVVCALL(OPFVV2, vfsgnjx_vv_w, OP_UUU_W, H4, H4, H4, fsgnjx32)
+RVVCALL(OPFVV2, vfsgnjx_vv_d, OP_UUU_D, H8, H8, H8, fsgnjx64)
+GEN_VEXT_VV_ENV(vfsgnjx_vv_h, 2, 2, clearh)
+GEN_VEXT_VV_ENV(vfsgnjx_vv_w, 4, 4, clearl)
+GEN_VEXT_VV_ENV(vfsgnjx_vv_d, 8, 8, clearq)
+RVVCALL(OPFVF2, vfsgnjx_vf_h, OP_UUU_H, H2, H2, fsgnjx16)
+RVVCALL(OPFVF2, vfsgnjx_vf_w, OP_UUU_W, H4, H4, fsgnjx32)
+RVVCALL(OPFVF2, vfsgnjx_vf_d, OP_UUU_D, H8, H8, fsgnjx64)
+GEN_VEXT_VF(vfsgnjx_vf_h, 2, 2, clearh)
+GEN_VEXT_VF(vfsgnjx_vf_w, 4, 4, clearl)
+GEN_VEXT_VF(vfsgnjx_vf_d, 8, 8, clearq)
-- 
2.23.0


