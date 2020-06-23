Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E900206731
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Jun 2020 00:35:20 +0200 (CEST)
Received: from localhost ([::1]:43682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jnrVf-0004lE-ML
	for lists+qemu-devel@lfdr.de; Tue, 23 Jun 2020 18:35:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jnrUX-0004H2-Vk; Tue, 23 Jun 2020 18:34:09 -0400
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:39219)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jnrUV-0006zO-Tk; Tue, 23 Jun 2020 18:34:09 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07447737|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.273484-0.00573218-0.720784;
 FP=0|0|0|0|0|-1|-1|-1; HT=e02c03297; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS;
 RN=9; RT=8; SR=0; TI=SMTPD_---.HrRuEfX_1592951643; 
Received: from L-PF1D6DP4-1208.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.HrRuEfX_1592951643)
 by smtp.aliyun-inc.com(10.147.40.200);
 Wed, 24 Jun 2020 06:34:04 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v11 17/61] target/riscv: vector integer min/max instructions
Date: Wed, 24 Jun 2020 05:58:36 +0800
Message-Id: <20200623215920.2594-18-zhiwei_liu@c-sky.com>
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
 target/riscv/helper.h                   | 33 ++++++++++++
 target/riscv/insn32.decode              |  8 +++
 target/riscv/insn_trans/trans_rvv.inc.c | 10 ++++
 target/riscv/vector_helper.c            | 71 +++++++++++++++++++++++++
 4 files changed, 122 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 2bcb6c7889..9c576e1220 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -502,3 +502,36 @@ DEF_HELPER_6(vmsgt_vx_b, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vmsgt_vx_h, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vmsgt_vx_w, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vmsgt_vx_d, void, ptr, ptr, tl, ptr, env, i32)
+
+DEF_HELPER_6(vminu_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vminu_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vminu_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vminu_vv_d, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vmin_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vmin_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vmin_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vmin_vv_d, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vmaxu_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vmaxu_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vmaxu_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vmaxu_vv_d, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vmax_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vmax_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vmax_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vmax_vv_d, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vminu_vx_b, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vminu_vx_h, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vminu_vx_w, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vminu_vx_d, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vmin_vx_b, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vmin_vx_h, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vmin_vx_w, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vmin_vx_d, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vmaxu_vx_b, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vmaxu_vx_h, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vmaxu_vx_w, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vmaxu_vx_d, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vmax_vx_b, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vmax_vx_h, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vmax_vx_w, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vmax_vx_d, void, ptr, ptr, tl, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 5d022ff414..3d8986c74d 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -357,6 +357,14 @@ vmsgtu_vx       011110 . ..... ..... 100 ..... 1010111 @r_vm
 vmsgtu_vi       011110 . ..... ..... 011 ..... 1010111 @r_vm
 vmsgt_vx        011111 . ..... ..... 100 ..... 1010111 @r_vm
 vmsgt_vi        011111 . ..... ..... 011 ..... 1010111 @r_vm
+vminu_vv        000100 . ..... ..... 000 ..... 1010111 @r_vm
+vminu_vx        000100 . ..... ..... 100 ..... 1010111 @r_vm
+vmin_vv         000101 . ..... ..... 000 ..... 1010111 @r_vm
+vmin_vx         000101 . ..... ..... 100 ..... 1010111 @r_vm
+vmaxu_vv        000110 . ..... ..... 000 ..... 1010111 @r_vm
+vmaxu_vx        000110 . ..... ..... 100 ..... 1010111 @r_vm
+vmax_vv         000111 . ..... ..... 000 ..... 1010111 @r_vm
+vmax_vx         000111 . ..... ..... 100 ..... 1010111 @r_vm
 
 vsetvli         0 ........... ..... 111 ..... 1010111  @r2_zimm
 vsetvl          1000000 ..... ..... 111 ..... 1010111  @r
diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index 7d7e3d4cd8..861fd3bf1a 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -1561,3 +1561,13 @@ GEN_OPIVI_TRANS(vmsleu_vi, 1, vmsleu_vx, opivx_cmp_check)
 GEN_OPIVI_TRANS(vmsle_vi, 0, vmsle_vx, opivx_cmp_check)
 GEN_OPIVI_TRANS(vmsgtu_vi, 1, vmsgtu_vx, opivx_cmp_check)
 GEN_OPIVI_TRANS(vmsgt_vi, 0, vmsgt_vx, opivx_cmp_check)
+
+/* Vector Integer Min/Max Instructions */
+GEN_OPIVV_GVEC_TRANS(vminu_vv, umin)
+GEN_OPIVV_GVEC_TRANS(vmin_vv,  smin)
+GEN_OPIVV_GVEC_TRANS(vmaxu_vv, umax)
+GEN_OPIVV_GVEC_TRANS(vmax_vv,  smax)
+GEN_OPIVX_TRANS(vminu_vx, opivx_check)
+GEN_OPIVX_TRANS(vmin_vx,  opivx_check)
+GEN_OPIVX_TRANS(vmaxu_vx, opivx_check)
+GEN_OPIVX_TRANS(vmax_vx,  opivx_check)
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 07e474781c..cb41daa3ac 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -855,6 +855,10 @@ GEN_VEXT_AMO(vamomaxuw_v_w, uint32_t, uint32_t, idx_w, clearl)
 #define OP_SSS_H int16_t, int16_t, int16_t, int16_t, int16_t
 #define OP_SSS_W int32_t, int32_t, int32_t, int32_t, int32_t
 #define OP_SSS_D int64_t, int64_t, int64_t, int64_t, int64_t
+#define OP_UUU_B uint8_t, uint8_t, uint8_t, uint8_t, uint8_t
+#define OP_UUU_H uint16_t, uint16_t, uint16_t, uint16_t, uint16_t
+#define OP_UUU_W uint32_t, uint32_t, uint32_t, uint32_t, uint32_t
+#define OP_UUU_D uint64_t, uint64_t, uint64_t, uint64_t, uint64_t
 
 /* operation of two vector elements */
 typedef void opivv2_fn(void *vd, void *vs1, void *vs2, int i);
@@ -1532,3 +1536,70 @@ GEN_VEXT_CMP_VX(vmsgt_vx_b, int8_t,  H1, DO_MSGT)
 GEN_VEXT_CMP_VX(vmsgt_vx_h, int16_t, H2, DO_MSGT)
 GEN_VEXT_CMP_VX(vmsgt_vx_w, int32_t, H4, DO_MSGT)
 GEN_VEXT_CMP_VX(vmsgt_vx_d, int64_t, H8, DO_MSGT)
+
+/* Vector Integer Min/Max Instructions */
+RVVCALL(OPIVV2, vminu_vv_b, OP_UUU_B, H1, H1, H1, DO_MIN)
+RVVCALL(OPIVV2, vminu_vv_h, OP_UUU_H, H2, H2, H2, DO_MIN)
+RVVCALL(OPIVV2, vminu_vv_w, OP_UUU_W, H4, H4, H4, DO_MIN)
+RVVCALL(OPIVV2, vminu_vv_d, OP_UUU_D, H8, H8, H8, DO_MIN)
+RVVCALL(OPIVV2, vmin_vv_b, OP_SSS_B, H1, H1, H1, DO_MIN)
+RVVCALL(OPIVV2, vmin_vv_h, OP_SSS_H, H2, H2, H2, DO_MIN)
+RVVCALL(OPIVV2, vmin_vv_w, OP_SSS_W, H4, H4, H4, DO_MIN)
+RVVCALL(OPIVV2, vmin_vv_d, OP_SSS_D, H8, H8, H8, DO_MIN)
+RVVCALL(OPIVV2, vmaxu_vv_b, OP_UUU_B, H1, H1, H1, DO_MAX)
+RVVCALL(OPIVV2, vmaxu_vv_h, OP_UUU_H, H2, H2, H2, DO_MAX)
+RVVCALL(OPIVV2, vmaxu_vv_w, OP_UUU_W, H4, H4, H4, DO_MAX)
+RVVCALL(OPIVV2, vmaxu_vv_d, OP_UUU_D, H8, H8, H8, DO_MAX)
+RVVCALL(OPIVV2, vmax_vv_b, OP_SSS_B, H1, H1, H1, DO_MAX)
+RVVCALL(OPIVV2, vmax_vv_h, OP_SSS_H, H2, H2, H2, DO_MAX)
+RVVCALL(OPIVV2, vmax_vv_w, OP_SSS_W, H4, H4, H4, DO_MAX)
+RVVCALL(OPIVV2, vmax_vv_d, OP_SSS_D, H8, H8, H8, DO_MAX)
+GEN_VEXT_VV(vminu_vv_b, 1, 1, clearb)
+GEN_VEXT_VV(vminu_vv_h, 2, 2, clearh)
+GEN_VEXT_VV(vminu_vv_w, 4, 4, clearl)
+GEN_VEXT_VV(vminu_vv_d, 8, 8, clearq)
+GEN_VEXT_VV(vmin_vv_b, 1, 1, clearb)
+GEN_VEXT_VV(vmin_vv_h, 2, 2, clearh)
+GEN_VEXT_VV(vmin_vv_w, 4, 4, clearl)
+GEN_VEXT_VV(vmin_vv_d, 8, 8, clearq)
+GEN_VEXT_VV(vmaxu_vv_b, 1, 1, clearb)
+GEN_VEXT_VV(vmaxu_vv_h, 2, 2, clearh)
+GEN_VEXT_VV(vmaxu_vv_w, 4, 4, clearl)
+GEN_VEXT_VV(vmaxu_vv_d, 8, 8, clearq)
+GEN_VEXT_VV(vmax_vv_b, 1, 1, clearb)
+GEN_VEXT_VV(vmax_vv_h, 2, 2, clearh)
+GEN_VEXT_VV(vmax_vv_w, 4, 4, clearl)
+GEN_VEXT_VV(vmax_vv_d, 8, 8, clearq)
+
+RVVCALL(OPIVX2, vminu_vx_b, OP_UUU_B, H1, H1, DO_MIN)
+RVVCALL(OPIVX2, vminu_vx_h, OP_UUU_H, H2, H2, DO_MIN)
+RVVCALL(OPIVX2, vminu_vx_w, OP_UUU_W, H4, H4, DO_MIN)
+RVVCALL(OPIVX2, vminu_vx_d, OP_UUU_D, H8, H8, DO_MIN)
+RVVCALL(OPIVX2, vmin_vx_b, OP_SSS_B, H1, H1, DO_MIN)
+RVVCALL(OPIVX2, vmin_vx_h, OP_SSS_H, H2, H2, DO_MIN)
+RVVCALL(OPIVX2, vmin_vx_w, OP_SSS_W, H4, H4, DO_MIN)
+RVVCALL(OPIVX2, vmin_vx_d, OP_SSS_D, H8, H8, DO_MIN)
+RVVCALL(OPIVX2, vmaxu_vx_b, OP_UUU_B, H1, H1, DO_MAX)
+RVVCALL(OPIVX2, vmaxu_vx_h, OP_UUU_H, H2, H2, DO_MAX)
+RVVCALL(OPIVX2, vmaxu_vx_w, OP_UUU_W, H4, H4, DO_MAX)
+RVVCALL(OPIVX2, vmaxu_vx_d, OP_UUU_D, H8, H8, DO_MAX)
+RVVCALL(OPIVX2, vmax_vx_b, OP_SSS_B, H1, H1, DO_MAX)
+RVVCALL(OPIVX2, vmax_vx_h, OP_SSS_H, H2, H2, DO_MAX)
+RVVCALL(OPIVX2, vmax_vx_w, OP_SSS_W, H4, H4, DO_MAX)
+RVVCALL(OPIVX2, vmax_vx_d, OP_SSS_D, H8, H8, DO_MAX)
+GEN_VEXT_VX(vminu_vx_b, 1, 1, clearb)
+GEN_VEXT_VX(vminu_vx_h, 2, 2, clearh)
+GEN_VEXT_VX(vminu_vx_w, 4, 4, clearl)
+GEN_VEXT_VX(vminu_vx_d, 8, 8, clearq)
+GEN_VEXT_VX(vmin_vx_b, 1, 1, clearb)
+GEN_VEXT_VX(vmin_vx_h, 2, 2, clearh)
+GEN_VEXT_VX(vmin_vx_w, 4, 4, clearl)
+GEN_VEXT_VX(vmin_vx_d, 8, 8, clearq)
+GEN_VEXT_VX(vmaxu_vx_b, 1, 1, clearb)
+GEN_VEXT_VX(vmaxu_vx_h, 2, 2, clearh)
+GEN_VEXT_VX(vmaxu_vx_w, 4, 4, clearl)
+GEN_VEXT_VX(vmaxu_vx_d, 8, 8,  clearq)
+GEN_VEXT_VX(vmax_vx_b, 1, 1, clearb)
+GEN_VEXT_VX(vmax_vx_h, 2, 2, clearh)
+GEN_VEXT_VX(vmax_vx_w, 4, 4, clearl)
+GEN_VEXT_VX(vmax_vx_d, 8, 8, clearq)
-- 
2.23.0


