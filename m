Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60C4120676D
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Jun 2020 00:45:02 +0200 (CEST)
Received: from localhost ([::1]:59108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jnrf3-0005Ah-G8
	for lists+qemu-devel@lfdr.de; Tue, 23 Jun 2020 18:45:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jnreI-0004LW-Rk; Tue, 23 Jun 2020 18:44:14 -0400
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:45386)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jnreG-0002VH-6a; Tue, 23 Jun 2020 18:44:14 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.08512919|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.727025-0.000620295-0.272354;
 FP=0|0|0|0|0|-1|-1|-1; HT=e02c03305; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS;
 RN=9; RT=8; SR=0; TI=SMTPD_---.HrSJy04_1592952247; 
Received: from L-PF1D6DP4-1208.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.HrSJy04_1592952247)
 by smtp.aliyun-inc.com(10.147.40.44); Wed, 24 Jun 2020 06:44:07 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v11 22/61] target/riscv: vector widening integer multiply-add
 instructions
Date: Wed, 24 Jun 2020 05:58:41 +0800
Message-Id: <20200623215920.2594-23-zhiwei_liu@c-sky.com>
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
 target/riscv/helper.h                   | 22 ++++++++++++
 target/riscv/insn32.decode              |  7 ++++
 target/riscv/insn_trans/trans_rvv.inc.c |  9 +++++
 target/riscv/vector_helper.c            | 45 +++++++++++++++++++++++++
 4 files changed, 83 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index a65a38596b..1249ee274d 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -653,3 +653,25 @@ DEF_HELPER_6(vnmsub_vx_b, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vnmsub_vx_h, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vnmsub_vx_w, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vnmsub_vx_d, void, ptr, ptr, tl, ptr, env, i32)
+
+DEF_HELPER_6(vwmaccu_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vwmaccu_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vwmaccu_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vwmacc_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vwmacc_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vwmacc_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vwmaccsu_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vwmaccsu_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vwmaccsu_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vwmaccu_vx_b, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vwmaccu_vx_h, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vwmaccu_vx_w, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vwmacc_vx_b, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vwmacc_vx_h, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vwmacc_vx_w, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vwmaccsu_vx_b, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vwmaccsu_vx_h, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vwmaccsu_vx_w, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vwmaccus_vx_b, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vwmaccus_vx_h, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vwmaccus_vx_w, void, ptr, ptr, tl, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index f01cf14777..843c15f8fa 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -395,6 +395,13 @@ vmadd_vv        101001 . ..... ..... 010 ..... 1010111 @r_vm
 vmadd_vx        101001 . ..... ..... 110 ..... 1010111 @r_vm
 vnmsub_vv       101011 . ..... ..... 010 ..... 1010111 @r_vm
 vnmsub_vx       101011 . ..... ..... 110 ..... 1010111 @r_vm
+vwmaccu_vv      111100 . ..... ..... 010 ..... 1010111 @r_vm
+vwmaccu_vx      111100 . ..... ..... 110 ..... 1010111 @r_vm
+vwmacc_vv       111101 . ..... ..... 010 ..... 1010111 @r_vm
+vwmacc_vx       111101 . ..... ..... 110 ..... 1010111 @r_vm
+vwmaccsu_vv     111110 . ..... ..... 010 ..... 1010111 @r_vm
+vwmaccsu_vx     111110 . ..... ..... 110 ..... 1010111 @r_vm
+vwmaccus_vx     111111 . ..... ..... 110 ..... 1010111 @r_vm
 
 vsetvli         0 ........... ..... 111 ..... 1010111  @r2_zimm
 vsetvl          1000000 ..... ..... 111 ..... 1010111  @r
diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index 0f549f7a19..24e43c615c 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -1609,3 +1609,12 @@ GEN_OPIVX_TRANS(vmacc_vx, opivx_check)
 GEN_OPIVX_TRANS(vnmsac_vx, opivx_check)
 GEN_OPIVX_TRANS(vmadd_vx, opivx_check)
 GEN_OPIVX_TRANS(vnmsub_vx, opivx_check)
+
+/* Vector Widening Integer Multiply-Add Instructions */
+GEN_OPIVV_WIDEN_TRANS(vwmaccu_vv, opivv_widen_check)
+GEN_OPIVV_WIDEN_TRANS(vwmacc_vv, opivv_widen_check)
+GEN_OPIVV_WIDEN_TRANS(vwmaccsu_vv, opivv_widen_check)
+GEN_OPIVX_WIDEN_TRANS(vwmaccu_vx)
+GEN_OPIVX_WIDEN_TRANS(vwmacc_vx)
+GEN_OPIVX_WIDEN_TRANS(vwmaccsu_vx)
+GEN_OPIVX_WIDEN_TRANS(vwmaccus_vx)
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 0f3ae3c31a..f53a530377 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -1979,3 +1979,48 @@ GEN_VEXT_VX(vnmsub_vx_b, 1, 1, clearb)
 GEN_VEXT_VX(vnmsub_vx_h, 2, 2, clearh)
 GEN_VEXT_VX(vnmsub_vx_w, 4, 4, clearl)
 GEN_VEXT_VX(vnmsub_vx_d, 8, 8, clearq)
+
+/* Vector Widening Integer Multiply-Add Instructions */
+RVVCALL(OPIVV3, vwmaccu_vv_b, WOP_UUU_B, H2, H1, H1, DO_MACC)
+RVVCALL(OPIVV3, vwmaccu_vv_h, WOP_UUU_H, H4, H2, H2, DO_MACC)
+RVVCALL(OPIVV3, vwmaccu_vv_w, WOP_UUU_W, H8, H4, H4, DO_MACC)
+RVVCALL(OPIVV3, vwmacc_vv_b, WOP_SSS_B, H2, H1, H1, DO_MACC)
+RVVCALL(OPIVV3, vwmacc_vv_h, WOP_SSS_H, H4, H2, H2, DO_MACC)
+RVVCALL(OPIVV3, vwmacc_vv_w, WOP_SSS_W, H8, H4, H4, DO_MACC)
+RVVCALL(OPIVV3, vwmaccsu_vv_b, WOP_SSU_B, H2, H1, H1, DO_MACC)
+RVVCALL(OPIVV3, vwmaccsu_vv_h, WOP_SSU_H, H4, H2, H2, DO_MACC)
+RVVCALL(OPIVV3, vwmaccsu_vv_w, WOP_SSU_W, H8, H4, H4, DO_MACC)
+GEN_VEXT_VV(vwmaccu_vv_b, 1, 2, clearh)
+GEN_VEXT_VV(vwmaccu_vv_h, 2, 4, clearl)
+GEN_VEXT_VV(vwmaccu_vv_w, 4, 8, clearq)
+GEN_VEXT_VV(vwmacc_vv_b, 1, 2, clearh)
+GEN_VEXT_VV(vwmacc_vv_h, 2, 4, clearl)
+GEN_VEXT_VV(vwmacc_vv_w, 4, 8, clearq)
+GEN_VEXT_VV(vwmaccsu_vv_b, 1, 2, clearh)
+GEN_VEXT_VV(vwmaccsu_vv_h, 2, 4, clearl)
+GEN_VEXT_VV(vwmaccsu_vv_w, 4, 8, clearq)
+
+RVVCALL(OPIVX3, vwmaccu_vx_b, WOP_UUU_B, H2, H1, DO_MACC)
+RVVCALL(OPIVX3, vwmaccu_vx_h, WOP_UUU_H, H4, H2, DO_MACC)
+RVVCALL(OPIVX3, vwmaccu_vx_w, WOP_UUU_W, H8, H4, DO_MACC)
+RVVCALL(OPIVX3, vwmacc_vx_b, WOP_SSS_B, H2, H1, DO_MACC)
+RVVCALL(OPIVX3, vwmacc_vx_h, WOP_SSS_H, H4, H2, DO_MACC)
+RVVCALL(OPIVX3, vwmacc_vx_w, WOP_SSS_W, H8, H4, DO_MACC)
+RVVCALL(OPIVX3, vwmaccsu_vx_b, WOP_SSU_B, H2, H1, DO_MACC)
+RVVCALL(OPIVX3, vwmaccsu_vx_h, WOP_SSU_H, H4, H2, DO_MACC)
+RVVCALL(OPIVX3, vwmaccsu_vx_w, WOP_SSU_W, H8, H4, DO_MACC)
+RVVCALL(OPIVX3, vwmaccus_vx_b, WOP_SUS_B, H2, H1, DO_MACC)
+RVVCALL(OPIVX3, vwmaccus_vx_h, WOP_SUS_H, H4, H2, DO_MACC)
+RVVCALL(OPIVX3, vwmaccus_vx_w, WOP_SUS_W, H8, H4, DO_MACC)
+GEN_VEXT_VX(vwmaccu_vx_b, 1, 2, clearh)
+GEN_VEXT_VX(vwmaccu_vx_h, 2, 4, clearl)
+GEN_VEXT_VX(vwmaccu_vx_w, 4, 8, clearq)
+GEN_VEXT_VX(vwmacc_vx_b, 1, 2, clearh)
+GEN_VEXT_VX(vwmacc_vx_h, 2, 4, clearl)
+GEN_VEXT_VX(vwmacc_vx_w, 4, 8, clearq)
+GEN_VEXT_VX(vwmaccsu_vx_b, 1, 2, clearh)
+GEN_VEXT_VX(vwmaccsu_vx_h, 2, 4, clearl)
+GEN_VEXT_VX(vwmaccsu_vx_w, 4, 8, clearq)
+GEN_VEXT_VX(vwmaccus_vx_b, 1, 2, clearh)
+GEN_VEXT_VX(vwmaccus_vx_h, 2, 4, clearl)
+GEN_VEXT_VX(vwmaccus_vx_w, 4, 8, clearq)
-- 
2.23.0


