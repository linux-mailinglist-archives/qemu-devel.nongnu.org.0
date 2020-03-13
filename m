Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4BB7183533
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Mar 2020 16:43:36 +0100 (CET)
Received: from localhost ([::1]:43598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jCPzj-0000SV-Lt
	for lists+qemu-devel@lfdr.de; Thu, 12 Mar 2020 11:43:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49141)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1jCPxv-00051y-Sm
 for qemu-devel@nongnu.org; Thu, 12 Mar 2020 11:41:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1jCPxu-0002fu-Ci
 for qemu-devel@nongnu.org; Thu, 12 Mar 2020 11:41:43 -0400
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:41862)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jCPxt-0002R7-Ix; Thu, 12 Mar 2020 11:41:42 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.08819726|-1; CH=blue; DM=||false|;
 DS=CONTINUE|ham_system_inform|0.727025-0.000620295-0.272354;
 FP=0|0|0|0|0|-1|-1|-1; HT=e02c03267; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS;
 RN=10; RT=10; SR=0; TI=SMTPD_---.H-OpWZ5_1584027693; 
Received: from L-PF1D6DP4-1208.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.H-OpWZ5_1584027693)
 by smtp.aliyun-inc.com(10.147.41.187);
 Thu, 12 Mar 2020 23:41:34 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: richard.henderson@linaro.org, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
Subject: [PATCH v5 21/60] target/riscv: vector widening integer multiply-add
 instructions
Date: Thu, 12 Mar 2020 22:58:21 +0800
Message-Id: <20200312145900.2054-22-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200312145900.2054-1-zhiwei_liu@c-sky.com>
References: <20200312145900.2054-1-zhiwei_liu@c-sky.com>
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
 target/riscv/helper.h                   | 22 ++++++++++++
 target/riscv/insn32.decode              |  7 ++++
 target/riscv/insn_trans/trans_rvv.inc.c |  9 +++++
 target/riscv/vector_helper.c            | 45 +++++++++++++++++++++++++
 4 files changed, 83 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 098288df76..1f0d3d60e3 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -643,3 +643,25 @@ DEF_HELPER_6(vnmsub_vx_b, void, ptr, ptr, tl, ptr, env, i32)
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
index 58de888afa..2a5b945139 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -392,6 +392,13 @@ vmadd_vv        101001 . ..... ..... 010 ..... 1010111 @r_vm
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
index 05f7ae0bc4..958737d097 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -1472,3 +1472,12 @@ GEN_OPIVX_TRANS(vmacc_vx, opivx_check)
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
index e5082c8adc..5109654f9f 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -1910,3 +1910,48 @@ GEN_VEXT_VX(vnmsub_vx_b, 1, 1, clearb)
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


