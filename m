Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E74817E01D
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Mar 2020 13:23:16 +0100 (CET)
Received: from localhost ([::1]:42142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jBHRD-0005H3-IC
	for lists+qemu-devel@lfdr.de; Mon, 09 Mar 2020 08:23:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56607)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1jBHJy-0002Lg-GG
 for qemu-devel@nongnu.org; Mon, 09 Mar 2020 08:15:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1jBHJu-000354-SK
 for qemu-devel@nongnu.org; Mon, 09 Mar 2020 08:15:46 -0400
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:55263)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jBHJu-0002bp-6U; Mon, 09 Mar 2020 08:15:42 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.08336018|-1; CH=blue; DM=||false|;
 DS=CONTINUE|ham_system_inform|0.383444-0.00866632-0.607889;
 FP=1065095526150243379|1|1|7|0|-1|-1|-1; HT=e02c03301; MF=zhiwei_liu@c-sky.com;
 NM=1; PH=DS; RN=10; RT=10; SR=0; TI=SMTPD_---.GyaeXy8_1583756101; 
Received: from L-PF1D6DP4-1208.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.GyaeXy8_1583756101)
 by smtp.aliyun-inc.com(10.147.41.199);
 Mon, 09 Mar 2020 20:15:08 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: richard.henderson@linaro.org, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
Subject: [PATCH v3 12/60] target/riscv: vector bitwise logical instructions
Date: Mon,  9 Mar 2020 20:14:09 +0800
Message-Id: <20200309121457.13719-13-zhiwei_liu@c-sky.com>
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
 target/riscv/helper.h                   | 25 ++++++++++++
 target/riscv/insn32.decode              |  9 +++++
 target/riscv/insn_trans/trans_rvv.inc.c | 11 ++++++
 target/riscv/vector_helper.c            | 51 +++++++++++++++++++++++++
 4 files changed, 96 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 72c733bf49..4373e9e8c2 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -372,3 +372,28 @@ DEF_HELPER_6(vmsbc_vxm_b, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vmsbc_vxm_h, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vmsbc_vxm_w, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vmsbc_vxm_d, void, ptr, ptr, tl, ptr, env, i32)
+
+DEF_HELPER_6(vand_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vand_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vand_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vand_vv_d, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vor_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vor_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vor_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vor_vv_d, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vxor_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vxor_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vxor_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vxor_vv_d, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vand_vx_b, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vand_vx_h, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vand_vx_w, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vand_vx_d, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vor_vx_b, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vor_vx_h, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vor_vx_w, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vor_vx_d, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vxor_vx_b, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vxor_vx_h, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vxor_vx_w, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vxor_vx_d, void, ptr, ptr, tl, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index e8ddf95d3d..29a505cede 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -310,6 +310,15 @@ vsbc_vvm        010010 1 ..... ..... 000 ..... 1010111 @r
 vsbc_vxm        010010 1 ..... ..... 100 ..... 1010111 @r
 vmsbc_vvm       010011 1 ..... ..... 000 ..... 1010111 @r
 vmsbc_vxm       010011 1 ..... ..... 100 ..... 1010111 @r
+vand_vv         001001 . ..... ..... 000 ..... 1010111 @r_vm
+vand_vx         001001 . ..... ..... 100 ..... 1010111 @r_vm
+vand_vi         001001 . ..... ..... 011 ..... 1010111 @r_vm
+vor_vv          001010 . ..... ..... 000 ..... 1010111 @r_vm
+vor_vx          001010 . ..... ..... 100 ..... 1010111 @r_vm
+vor_vi          001010 . ..... ..... 011 ..... 1010111 @r_vm
+vxor_vv         001011 . ..... ..... 000 ..... 1010111 @r_vm
+vxor_vx         001011 . ..... ..... 100 ..... 1010111 @r_vm
+vxor_vi         001011 . ..... ..... 011 ..... 1010111 @r_vm
 
 vsetvli         0 ........... ..... 111 ..... 1010111  @r2_zimm
 vsetvl          1000000 ..... ..... 111 ..... 1010111  @r
diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index a1f2e84eb8..3a4696dbcd 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -1212,3 +1212,14 @@ static bool trans_##NAME(DisasContext *s, arg_r *a)                      \
 }
 GEN_OPIVI_R_TRANS(vadc_vim, 0, vadc_vxm, opivx_vadc_check)
 GEN_OPIVI_R_TRANS(vmadc_vim, 0, vmadc_vxm, opivx_vmadc_check)
+
+/* Vector Bitwise Logical Instructions */
+GEN_OPIVV_GVEC_TRANS(vand_vv, and)
+GEN_OPIVV_GVEC_TRANS(vor_vv,  or)
+GEN_OPIVV_GVEC_TRANS(vxor_vv, xor)
+GEN_OPIVX_GVEC_TRANS(vand_vx, ands)
+GEN_OPIVX_GVEC_TRANS(vor_vx,  ors)
+GEN_OPIVX_GVEC_TRANS(vxor_vx, xors)
+GEN_OPIVI_GVEC_TRANS(vand_vi, 0, vand_vx, andi)
+GEN_OPIVI_GVEC_TRANS(vor_vi, 0, vor_vx,  ori)
+GEN_OPIVI_GVEC_TRANS(vxor_vi, 0, vxor_vx, xori)
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index dd85b94fe7..532b373f99 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -1202,3 +1202,54 @@ GEN_VEXT_VMADC_VXM(vmsbc_vxm_b, uint8_t,  H1, DO_MSBC)
 GEN_VEXT_VMADC_VXM(vmsbc_vxm_h, uint16_t, H2, DO_MSBC)
 GEN_VEXT_VMADC_VXM(vmsbc_vxm_w, uint32_t, H4, DO_MSBC)
 GEN_VEXT_VMADC_VXM(vmsbc_vxm_d, uint64_t, H8, DO_MSBC)
+
+/* Vector Bitwise Logical Instructions */
+RVVCALL(OPIVV2, vand_vv_b, OP_SSS_B, H1, H1, H1, DO_AND)
+RVVCALL(OPIVV2, vand_vv_h, OP_SSS_H, H2, H2, H2, DO_AND)
+RVVCALL(OPIVV2, vand_vv_w, OP_SSS_W, H4, H4, H4, DO_AND)
+RVVCALL(OPIVV2, vand_vv_d, OP_SSS_D, H8, H8, H8, DO_AND)
+RVVCALL(OPIVV2, vor_vv_b, OP_SSS_B, H1, H1, H1, DO_OR)
+RVVCALL(OPIVV2, vor_vv_h, OP_SSS_H, H2, H2, H2, DO_OR)
+RVVCALL(OPIVV2, vor_vv_w, OP_SSS_W, H4, H4, H4, DO_OR)
+RVVCALL(OPIVV2, vor_vv_d, OP_SSS_D, H8, H8, H8, DO_OR)
+RVVCALL(OPIVV2, vxor_vv_b, OP_SSS_B, H1, H1, H1, DO_XOR)
+RVVCALL(OPIVV2, vxor_vv_h, OP_SSS_H, H2, H2, H2, DO_XOR)
+RVVCALL(OPIVV2, vxor_vv_w, OP_SSS_W, H4, H4, H4, DO_XOR)
+RVVCALL(OPIVV2, vxor_vv_d, OP_SSS_D, H8, H8, H8, DO_XOR)
+GEN_VEXT_VV(vand_vv_b, 1, 1, clearb)
+GEN_VEXT_VV(vand_vv_h, 2, 2, clearh)
+GEN_VEXT_VV(vand_vv_w, 4, 4, clearl)
+GEN_VEXT_VV(vand_vv_d, 8, 8, clearq)
+GEN_VEXT_VV(vor_vv_b, 1, 1, clearb)
+GEN_VEXT_VV(vor_vv_h, 2, 2, clearh)
+GEN_VEXT_VV(vor_vv_w, 4, 4, clearl)
+GEN_VEXT_VV(vor_vv_d, 8, 8, clearq)
+GEN_VEXT_VV(vxor_vv_b, 1, 1, clearb)
+GEN_VEXT_VV(vxor_vv_h, 2, 2, clearh)
+GEN_VEXT_VV(vxor_vv_w, 4, 4, clearl)
+GEN_VEXT_VV(vxor_vv_d, 8, 8, clearq)
+
+RVVCALL(OPIVX2, vand_vx_b, OP_SSS_B, H1, H1, DO_AND)
+RVVCALL(OPIVX2, vand_vx_h, OP_SSS_H, H2, H2, DO_AND)
+RVVCALL(OPIVX2, vand_vx_w, OP_SSS_W, H4, H4, DO_AND)
+RVVCALL(OPIVX2, vand_vx_d, OP_SSS_D, H8, H8, DO_AND)
+RVVCALL(OPIVX2, vor_vx_b, OP_SSS_B, H1, H1, DO_OR)
+RVVCALL(OPIVX2, vor_vx_h, OP_SSS_H, H2, H2, DO_OR)
+RVVCALL(OPIVX2, vor_vx_w, OP_SSS_W, H4, H4, DO_OR)
+RVVCALL(OPIVX2, vor_vx_d, OP_SSS_D, H8, H8, DO_OR)
+RVVCALL(OPIVX2, vxor_vx_b, OP_SSS_B, H1, H1, DO_XOR)
+RVVCALL(OPIVX2, vxor_vx_h, OP_SSS_H, H2, H2, DO_XOR)
+RVVCALL(OPIVX2, vxor_vx_w, OP_SSS_W, H4, H4, DO_XOR)
+RVVCALL(OPIVX2, vxor_vx_d, OP_SSS_D, H8, H8, DO_XOR)
+GEN_VEXT_VX(vand_vx_b, 1, 1, clearb)
+GEN_VEXT_VX(vand_vx_h, 2, 2, clearh)
+GEN_VEXT_VX(vand_vx_w, 4, 4, clearl)
+GEN_VEXT_VX(vand_vx_d, 8, 8, clearq)
+GEN_VEXT_VX(vor_vx_b, 1, 1, clearb)
+GEN_VEXT_VX(vor_vx_h, 2, 2, clearh)
+GEN_VEXT_VX(vor_vx_w, 4, 4, clearl)
+GEN_VEXT_VX(vor_vx_d, 8, 8, clearq)
+GEN_VEXT_VX(vxor_vx_b, 1, 1, clearb)
+GEN_VEXT_VX(vxor_vx_h, 2, 2, clearh)
+GEN_VEXT_VX(vxor_vx_w, 4, 4, clearl)
+GEN_VEXT_VX(vxor_vx_d, 8, 8, clearq)
-- 
2.23.0


