Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 383A21DCB72
	for <lists+qemu-devel@lfdr.de>; Thu, 21 May 2020 12:53:38 +0200 (CEST)
Received: from localhost ([::1]:33806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jbipV-00066x-BG
	for lists+qemu-devel@lfdr.de; Thu, 21 May 2020 06:53:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jbiop-0005Eo-Dw; Thu, 21 May 2020 06:52:55 -0400
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:35190)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jbioo-000838-3S; Thu, 21 May 2020 06:52:54 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.1778574|-1; CH=blue; DM=|OVERLOAD|false|;
 DS=CONTINUE|ham_regular_dialog|0.0190665-5.13644e-05-0.980882;
 FP=0|0|0|0|0|-1|-1|-1; HT=e02c03311; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS;
 RN=8; RT=8; SR=0; TI=SMTPD_---.Hbdp2-3_1590058367; 
Received: from L-PF1D6DP4-1208.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.Hbdp2-3_1590058367)
 by smtp.aliyun-inc.com(10.147.41.137);
 Thu, 21 May 2020 18:52:48 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v8 34/62] target/riscv: vector widening floating-point multiply
Date: Thu, 21 May 2020 17:43:45 +0800
Message-Id: <20200521094413.10425-35-zhiwei_liu@c-sky.com>
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
 target/riscv/helper.h                   |  5 +++++
 target/riscv/insn32.decode              |  2 ++
 target/riscv/insn_trans/trans_rvv.inc.c |  4 ++++
 target/riscv/vector_helper.c            | 22 ++++++++++++++++++++++
 4 files changed, 33 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index fa1558179a..5b3340a4af 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -846,3 +846,8 @@ DEF_HELPER_6(vfdiv_vf_d, void, ptr, ptr, i64, ptr, env, i32)
 DEF_HELPER_6(vfrdiv_vf_h, void, ptr, ptr, i64, ptr, env, i32)
 DEF_HELPER_6(vfrdiv_vf_w, void, ptr, ptr, i64, ptr, env, i32)
 DEF_HELPER_6(vfrdiv_vf_d, void, ptr, ptr, i64, ptr, env, i32)
+
+DEF_HELPER_6(vfwmul_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vfwmul_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vfwmul_vf_h, void, ptr, ptr, i64, ptr, env, i32)
+DEF_HELPER_6(vfwmul_vf_w, void, ptr, ptr, i64, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 16fd938261..1d963f0b8a 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -461,6 +461,8 @@ vfmul_vf        100100 . ..... ..... 101 ..... 1010111 @r_vm
 vfdiv_vv        100000 . ..... ..... 001 ..... 1010111 @r_vm
 vfdiv_vf        100000 . ..... ..... 101 ..... 1010111 @r_vm
 vfrdiv_vf       100001 . ..... ..... 101 ..... 1010111 @r_vm
+vfwmul_vv       111000 . ..... ..... 001 ..... 1010111 @r_vm
+vfwmul_vf       111000 . ..... ..... 101 ..... 1010111 @r_vm
 
 vsetvli         0 ........... ..... 111 ..... 1010111  @r2_zimm
 vsetvl          1000000 ..... ..... 111 ..... 1010111  @r
diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index 39bf357425..acb841851e 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -2051,3 +2051,7 @@ GEN_OPFVV_TRANS(vfdiv_vv, opfvv_check)
 GEN_OPFVF_TRANS(vfmul_vf,  opfvf_check)
 GEN_OPFVF_TRANS(vfdiv_vf,  opfvf_check)
 GEN_OPFVF_TRANS(vfrdiv_vf,  opfvf_check)
+
+/* Vector Widening Floating-Point Multiply */
+GEN_OPFVV_WIDEN_TRANS(vfwmul_vv, opfvv_widen_check)
+GEN_OPFVF_WIDEN_TRANS(vfwmul_vf)
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index a9fdf47c2a..bbe3719e69 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -3409,3 +3409,25 @@ RVVCALL(OPFVF2, vfrdiv_vf_d, OP_UUU_D, H8, H8, float64_rdiv)
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


