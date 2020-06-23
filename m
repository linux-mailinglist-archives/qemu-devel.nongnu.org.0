Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D0E206737
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Jun 2020 00:39:13 +0200 (CEST)
Received: from localhost ([::1]:49584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jnrZQ-00086y-9d
	for lists+qemu-devel@lfdr.de; Tue, 23 Jun 2020 18:39:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jnrYR-00070J-Q0; Tue, 23 Jun 2020 18:38:11 -0400
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:54186)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jnrYP-0000gT-DR; Tue, 23 Jun 2020 18:38:11 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.08391488|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.0508488-0.00050273-0.948649;
 FP=0|0|0|0|0|-1|-1|-1; HT=e02c03279; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS;
 RN=9; RT=8; SR=0; TI=SMTPD_---.HrSAQ-X_1592951885; 
Received: from L-PF1D6DP4-1208.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.HrSAQ-X_1592951885)
 by smtp.aliyun-inc.com(10.147.41.187);
 Wed, 24 Jun 2020 06:38:05 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v11 19/61] target/riscv: vector integer divide instructions
Date: Wed, 24 Jun 2020 05:58:38 +0800
Message-Id: <20200623215920.2594-20-zhiwei_liu@c-sky.com>
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
 target/riscv/helper.h                   | 33 +++++++++++
 target/riscv/insn32.decode              |  8 +++
 target/riscv/insn_trans/trans_rvv.inc.c | 10 ++++
 target/riscv/vector_helper.c            | 74 +++++++++++++++++++++++++
 4 files changed, 125 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index c2de0d29ba..e14979e452 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -568,3 +568,36 @@ DEF_HELPER_6(vmulhsu_vx_b, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vmulhsu_vx_h, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vmulhsu_vx_w, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vmulhsu_vx_d, void, ptr, ptr, tl, ptr, env, i32)
+
+DEF_HELPER_6(vdivu_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vdivu_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vdivu_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vdivu_vv_d, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vdiv_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vdiv_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vdiv_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vdiv_vv_d, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vremu_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vremu_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vremu_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vremu_vv_d, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vrem_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vrem_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vrem_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vrem_vv_d, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vdivu_vx_b, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vdivu_vx_h, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vdivu_vx_w, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vdivu_vx_d, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vdiv_vx_b, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vdiv_vx_h, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vdiv_vx_w, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vdiv_vx_d, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vremu_vx_b, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vremu_vx_h, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vremu_vx_w, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vremu_vx_d, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vrem_vx_b, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vrem_vx_h, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vrem_vx_w, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vrem_vx_d, void, ptr, ptr, tl, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 6b29aad4d2..cf58764308 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -373,6 +373,14 @@ vmulhu_vv       100100 . ..... ..... 010 ..... 1010111 @r_vm
 vmulhu_vx       100100 . ..... ..... 110 ..... 1010111 @r_vm
 vmulhsu_vv      100110 . ..... ..... 010 ..... 1010111 @r_vm
 vmulhsu_vx      100110 . ..... ..... 110 ..... 1010111 @r_vm
+vdivu_vv        100000 . ..... ..... 010 ..... 1010111 @r_vm
+vdivu_vx        100000 . ..... ..... 110 ..... 1010111 @r_vm
+vdiv_vv         100001 . ..... ..... 010 ..... 1010111 @r_vm
+vdiv_vx         100001 . ..... ..... 110 ..... 1010111 @r_vm
+vremu_vv        100010 . ..... ..... 010 ..... 1010111 @r_vm
+vremu_vx        100010 . ..... ..... 110 ..... 1010111 @r_vm
+vrem_vv         100011 . ..... ..... 010 ..... 1010111 @r_vm
+vrem_vx         100011 . ..... ..... 110 ..... 1010111 @r_vm
 
 vsetvli         0 ........... ..... 111 ..... 1010111  @r2_zimm
 vsetvl          1000000 ..... ..... 111 ..... 1010111  @r
diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index b5ea1c59a1..f3a8baf581 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -1581,3 +1581,13 @@ GEN_OPIVX_GVEC_TRANS(vmul_vx,  muls)
 GEN_OPIVX_TRANS(vmulh_vx, opivx_check)
 GEN_OPIVX_TRANS(vmulhu_vx, opivx_check)
 GEN_OPIVX_TRANS(vmulhsu_vx, opivx_check)
+
+/* Vector Integer Divide Instructions */
+GEN_OPIVV_TRANS(vdivu_vv, opivv_check)
+GEN_OPIVV_TRANS(vdiv_vv, opivv_check)
+GEN_OPIVV_TRANS(vremu_vv, opivv_check)
+GEN_OPIVV_TRANS(vrem_vv, opivv_check)
+GEN_OPIVX_TRANS(vdivu_vx, opivx_check)
+GEN_OPIVX_TRANS(vdiv_vx, opivx_check)
+GEN_OPIVX_TRANS(vremu_vx, opivx_check)
+GEN_OPIVX_TRANS(vrem_vx, opivx_check)
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index ce4aae8753..e0a372967a 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -1766,3 +1766,77 @@ GEN_VEXT_VX(vmulhsu_vx_b, 1, 1, clearb)
 GEN_VEXT_VX(vmulhsu_vx_h, 2, 2, clearh)
 GEN_VEXT_VX(vmulhsu_vx_w, 4, 4, clearl)
 GEN_VEXT_VX(vmulhsu_vx_d, 8, 8, clearq)
+
+/* Vector Integer Divide Instructions */
+#define DO_DIVU(N, M) (unlikely(M == 0) ? (__typeof(N))(-1) : N / M)
+#define DO_REMU(N, M) (unlikely(M == 0) ? N : N % M)
+#define DO_DIV(N, M)  (unlikely(M == 0) ? (__typeof(N))(-1) :\
+        unlikely((N == -N) && (M == (__typeof(N))(-1))) ? N : N / M)
+#define DO_REM(N, M)  (unlikely(M == 0) ? N :\
+        unlikely((N == -N) && (M == (__typeof(N))(-1))) ? 0 : N % M)
+
+RVVCALL(OPIVV2, vdivu_vv_b, OP_UUU_B, H1, H1, H1, DO_DIVU)
+RVVCALL(OPIVV2, vdivu_vv_h, OP_UUU_H, H2, H2, H2, DO_DIVU)
+RVVCALL(OPIVV2, vdivu_vv_w, OP_UUU_W, H4, H4, H4, DO_DIVU)
+RVVCALL(OPIVV2, vdivu_vv_d, OP_UUU_D, H8, H8, H8, DO_DIVU)
+RVVCALL(OPIVV2, vdiv_vv_b, OP_SSS_B, H1, H1, H1, DO_DIV)
+RVVCALL(OPIVV2, vdiv_vv_h, OP_SSS_H, H2, H2, H2, DO_DIV)
+RVVCALL(OPIVV2, vdiv_vv_w, OP_SSS_W, H4, H4, H4, DO_DIV)
+RVVCALL(OPIVV2, vdiv_vv_d, OP_SSS_D, H8, H8, H8, DO_DIV)
+RVVCALL(OPIVV2, vremu_vv_b, OP_UUU_B, H1, H1, H1, DO_REMU)
+RVVCALL(OPIVV2, vremu_vv_h, OP_UUU_H, H2, H2, H2, DO_REMU)
+RVVCALL(OPIVV2, vremu_vv_w, OP_UUU_W, H4, H4, H4, DO_REMU)
+RVVCALL(OPIVV2, vremu_vv_d, OP_UUU_D, H8, H8, H8, DO_REMU)
+RVVCALL(OPIVV2, vrem_vv_b, OP_SSS_B, H1, H1, H1, DO_REM)
+RVVCALL(OPIVV2, vrem_vv_h, OP_SSS_H, H2, H2, H2, DO_REM)
+RVVCALL(OPIVV2, vrem_vv_w, OP_SSS_W, H4, H4, H4, DO_REM)
+RVVCALL(OPIVV2, vrem_vv_d, OP_SSS_D, H8, H8, H8, DO_REM)
+GEN_VEXT_VV(vdivu_vv_b, 1, 1, clearb)
+GEN_VEXT_VV(vdivu_vv_h, 2, 2, clearh)
+GEN_VEXT_VV(vdivu_vv_w, 4, 4, clearl)
+GEN_VEXT_VV(vdivu_vv_d, 8, 8, clearq)
+GEN_VEXT_VV(vdiv_vv_b, 1, 1, clearb)
+GEN_VEXT_VV(vdiv_vv_h, 2, 2, clearh)
+GEN_VEXT_VV(vdiv_vv_w, 4, 4, clearl)
+GEN_VEXT_VV(vdiv_vv_d, 8, 8, clearq)
+GEN_VEXT_VV(vremu_vv_b, 1, 1, clearb)
+GEN_VEXT_VV(vremu_vv_h, 2, 2, clearh)
+GEN_VEXT_VV(vremu_vv_w, 4, 4, clearl)
+GEN_VEXT_VV(vremu_vv_d, 8, 8, clearq)
+GEN_VEXT_VV(vrem_vv_b, 1, 1, clearb)
+GEN_VEXT_VV(vrem_vv_h, 2, 2, clearh)
+GEN_VEXT_VV(vrem_vv_w, 4, 4, clearl)
+GEN_VEXT_VV(vrem_vv_d, 8, 8, clearq)
+
+RVVCALL(OPIVX2, vdivu_vx_b, OP_UUU_B, H1, H1, DO_DIVU)
+RVVCALL(OPIVX2, vdivu_vx_h, OP_UUU_H, H2, H2, DO_DIVU)
+RVVCALL(OPIVX2, vdivu_vx_w, OP_UUU_W, H4, H4, DO_DIVU)
+RVVCALL(OPIVX2, vdivu_vx_d, OP_UUU_D, H8, H8, DO_DIVU)
+RVVCALL(OPIVX2, vdiv_vx_b, OP_SSS_B, H1, H1, DO_DIV)
+RVVCALL(OPIVX2, vdiv_vx_h, OP_SSS_H, H2, H2, DO_DIV)
+RVVCALL(OPIVX2, vdiv_vx_w, OP_SSS_W, H4, H4, DO_DIV)
+RVVCALL(OPIVX2, vdiv_vx_d, OP_SSS_D, H8, H8, DO_DIV)
+RVVCALL(OPIVX2, vremu_vx_b, OP_UUU_B, H1, H1, DO_REMU)
+RVVCALL(OPIVX2, vremu_vx_h, OP_UUU_H, H2, H2, DO_REMU)
+RVVCALL(OPIVX2, vremu_vx_w, OP_UUU_W, H4, H4, DO_REMU)
+RVVCALL(OPIVX2, vremu_vx_d, OP_UUU_D, H8, H8, DO_REMU)
+RVVCALL(OPIVX2, vrem_vx_b, OP_SSS_B, H1, H1, DO_REM)
+RVVCALL(OPIVX2, vrem_vx_h, OP_SSS_H, H2, H2, DO_REM)
+RVVCALL(OPIVX2, vrem_vx_w, OP_SSS_W, H4, H4, DO_REM)
+RVVCALL(OPIVX2, vrem_vx_d, OP_SSS_D, H8, H8, DO_REM)
+GEN_VEXT_VX(vdivu_vx_b, 1, 1, clearb)
+GEN_VEXT_VX(vdivu_vx_h, 2, 2, clearh)
+GEN_VEXT_VX(vdivu_vx_w, 4, 4, clearl)
+GEN_VEXT_VX(vdivu_vx_d, 8, 8, clearq)
+GEN_VEXT_VX(vdiv_vx_b, 1, 1, clearb)
+GEN_VEXT_VX(vdiv_vx_h, 2, 2, clearh)
+GEN_VEXT_VX(vdiv_vx_w, 4, 4, clearl)
+GEN_VEXT_VX(vdiv_vx_d, 8, 8, clearq)
+GEN_VEXT_VX(vremu_vx_b, 1, 1, clearb)
+GEN_VEXT_VX(vremu_vx_h, 2, 2, clearh)
+GEN_VEXT_VX(vremu_vx_w, 4, 4, clearl)
+GEN_VEXT_VX(vremu_vx_d, 8, 8, clearq)
+GEN_VEXT_VX(vrem_vx_b, 1, 1, clearb)
+GEN_VEXT_VX(vrem_vx_h, 2, 2, clearh)
+GEN_VEXT_VX(vrem_vx_w, 4, 4, clearl)
+GEN_VEXT_VX(vrem_vx_d, 8, 8, clearq)
-- 
2.23.0


