Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E341212A04
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jul 2020 18:47:40 +0200 (CEST)
Received: from localhost ([::1]:43044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jr2N9-00047n-3S
	for lists+qemu-devel@lfdr.de; Thu, 02 Jul 2020 12:47:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=4451fe355=alistair.francis@wdc.com>)
 id 1jr29s-0004JO-QF
 for qemu-devel@nongnu.org; Thu, 02 Jul 2020 12:33:56 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:44875)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=4451fe355=alistair.francis@wdc.com>)
 id 1jr29o-0000AD-9p
 for qemu-devel@nongnu.org; Thu, 02 Jul 2020 12:33:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1593707632; x=1625243632;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=u8zWfegQjLIP02XBDaBoZFSslj+M4uaK3HyoLPR8Vec=;
 b=e9S1OvWtglu3hPQW707z4PgHI81lMhB4Re11dZrvMTyHnOoqkh6oj2xJ
 kmwXcrZWoKGI2JSNyygaGpIiaFHDL8o6Ey2XWuFwCbcwr0HuPr2a/TZfZ
 mD7iBQHhpDzmQOcj2qFd9KyTJH3ZKJ8XAZKDzoYtSToAEpg55K/yE0mZg
 /9fMarQgu5krp5aHN5ZQBM5US12tJVgU0gzdAqLGg489ojLDzcntAsb+X
 V3WeGtXebHgCx+X9IDJ8A6tpqxkJR2nH5b2qanKy3E/Mi4jT6OEzcnQm+
 J6mFZF5BcupI2nbB4O/zSXOy/2jLyhN4eIyIwOe4TUi5Gj8HoKFxZTNtl A==;
IronPort-SDR: iFn8EwiU/7oG4tyVT6y5Qfm+WdaMIAy5wSBJ4BlppQvm2y6QwrR+CjuBo5rbUDv1ePwuesbpKU
 4cYBwah+A5iJOkVNCA+zgvKFltYlNXR97cw4WNu0C6zobtIwEx2W4kupqMp77/k0uaYDvjHvTZ
 pUr3IDrqlxdhtiOB5JRnfBPCSVwtTQjpeqgvMLvafM4VWT0kxexRvMZTsVDwwCLYGbAJ3QidrQ
 L/Xs+gme44GWTMJDpvZSzdiylMzCkGWFZ3RpS1RuFtVHrZrY7tpOYdq/O8mQY18Y02hHego+b2
 YHw=
X-IronPort-AV: E=Sophos;i="5.75,304,1589212800"; d="scan'208";a="141498480"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 03 Jul 2020 00:33:24 +0800
IronPort-SDR: N9wrRUVUKdON2qwwhj3LAZUrK6yXoHh2yhDxb25GEwPQ7TKuTCUmWqxlayYN1gPuaaT5SZSKhq
 SP8YiPLN463MWGci+3f1Thw3VVQhxIsVk=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2020 09:21:39 -0700
IronPort-SDR: O7L/YmBRfxF+qFxM81LUrTIUrJaFevjv5XWakxmcfZdj68dNDoNoPbC0z14hyqgPoTd0N2BKo4
 1IVcgydAGELQ==
WDCIronportException: Internal
Received: from 6hj08h2.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.58.118])
 by uls-op-cesaip01.wdc.com with ESMTP; 02 Jul 2020 09:33:24 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL v2 19/64] target/riscv: vector integer comparison instructions
Date: Thu,  2 Jul 2020 09:23:09 -0700
Message-Id: <20200702162354.928528-20-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200702162354.928528-1-alistair.francis@wdc.com>
References: <20200702162354.928528-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=4451fe355=alistair.francis@wdc.com;
 helo=esa4.hgst.iphmx.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/02 12:33:30
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: LIU Zhiwei <zhiwei_liu@c-sky.com>

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20200701152549.1218-17-zhiwei_liu@c-sky.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/helper.h                   |  57 +++++++++++
 target/riscv/insn32.decode              |  20 ++++
 target/riscv/insn_trans/trans_rvv.inc.c |  46 +++++++++
 target/riscv/vector_helper.c            | 123 ++++++++++++++++++++++++
 4 files changed, 246 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 1ec2202814..2bcb6c7889 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -445,3 +445,60 @@ DEF_HELPER_6(vnsrl_vx_w, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vnsra_vx_b, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vnsra_vx_h, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vnsra_vx_w, void, ptr, ptr, tl, ptr, env, i32)
+
+DEF_HELPER_6(vmseq_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vmseq_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vmseq_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vmseq_vv_d, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vmsne_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vmsne_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vmsne_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vmsne_vv_d, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vmsltu_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vmsltu_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vmsltu_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vmsltu_vv_d, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vmslt_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vmslt_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vmslt_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vmslt_vv_d, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vmsleu_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vmsleu_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vmsleu_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vmsleu_vv_d, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vmsle_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vmsle_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vmsle_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vmsle_vv_d, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vmseq_vx_b, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vmseq_vx_h, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vmseq_vx_w, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vmseq_vx_d, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vmsne_vx_b, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vmsne_vx_h, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vmsne_vx_w, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vmsne_vx_d, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vmsltu_vx_b, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vmsltu_vx_h, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vmsltu_vx_w, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vmsltu_vx_d, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vmslt_vx_b, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vmslt_vx_h, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vmslt_vx_w, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vmslt_vx_d, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vmsleu_vx_b, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vmsleu_vx_h, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vmsleu_vx_w, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vmsleu_vx_d, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vmsle_vx_b, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vmsle_vx_h, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vmsle_vx_w, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vmsle_vx_d, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vmsgtu_vx_b, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vmsgtu_vx_h, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vmsgtu_vx_w, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vmsgtu_vx_d, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vmsgt_vx_b, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vmsgt_vx_h, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vmsgt_vx_w, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vmsgt_vx_d, void, ptr, ptr, tl, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 435415f9f9..5d022ff414 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -337,6 +337,26 @@ vnsrl_vi        101100 . ..... ..... 011 ..... 1010111 @r_vm
 vnsra_vv        101101 . ..... ..... 000 ..... 1010111 @r_vm
 vnsra_vx        101101 . ..... ..... 100 ..... 1010111 @r_vm
 vnsra_vi        101101 . ..... ..... 011 ..... 1010111 @r_vm
+vmseq_vv        011000 . ..... ..... 000 ..... 1010111 @r_vm
+vmseq_vx        011000 . ..... ..... 100 ..... 1010111 @r_vm
+vmseq_vi        011000 . ..... ..... 011 ..... 1010111 @r_vm
+vmsne_vv        011001 . ..... ..... 000 ..... 1010111 @r_vm
+vmsne_vx        011001 . ..... ..... 100 ..... 1010111 @r_vm
+vmsne_vi        011001 . ..... ..... 011 ..... 1010111 @r_vm
+vmsltu_vv       011010 . ..... ..... 000 ..... 1010111 @r_vm
+vmsltu_vx       011010 . ..... ..... 100 ..... 1010111 @r_vm
+vmslt_vv        011011 . ..... ..... 000 ..... 1010111 @r_vm
+vmslt_vx        011011 . ..... ..... 100 ..... 1010111 @r_vm
+vmsleu_vv       011100 . ..... ..... 000 ..... 1010111 @r_vm
+vmsleu_vx       011100 . ..... ..... 100 ..... 1010111 @r_vm
+vmsleu_vi       011100 . ..... ..... 011 ..... 1010111 @r_vm
+vmsle_vv        011101 . ..... ..... 000 ..... 1010111 @r_vm
+vmsle_vx        011101 . ..... ..... 100 ..... 1010111 @r_vm
+vmsle_vi        011101 . ..... ..... 011 ..... 1010111 @r_vm
+vmsgtu_vx       011110 . ..... ..... 100 ..... 1010111 @r_vm
+vmsgtu_vi       011110 . ..... ..... 011 ..... 1010111 @r_vm
+vmsgt_vx        011111 . ..... ..... 100 ..... 1010111 @r_vm
+vmsgt_vi        011111 . ..... ..... 011 ..... 1010111 @r_vm
 
 vsetvli         0 ........... ..... 111 ..... 1010111  @r2_zimm
 vsetvl          1000000 ..... ..... 111 ..... 1010111  @r
diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index 9d2c327366..7d7e3d4cd8 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -1515,3 +1515,49 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)                   \
 
 GEN_OPIVI_NARROW_TRANS(vnsra_vi, 1, vnsra_vx)
 GEN_OPIVI_NARROW_TRANS(vnsrl_vi, 1, vnsrl_vx)
+
+/* Vector Integer Comparison Instructions */
+/*
+ * For all comparison instructions, an illegal instruction exception is raised
+ * if the destination vector register overlaps a source vector register group
+ * and LMUL > 1.
+ */
+static bool opivv_cmp_check(DisasContext *s, arg_rmrr *a)
+{
+    return (vext_check_isa_ill(s) &&
+            vext_check_reg(s, a->rs2, false) &&
+            vext_check_reg(s, a->rs1, false) &&
+            ((vext_check_overlap_group(a->rd, 1, a->rs1, 1 << s->lmul) &&
+              vext_check_overlap_group(a->rd, 1, a->rs2, 1 << s->lmul)) ||
+             (s->lmul == 0)));
+}
+GEN_OPIVV_TRANS(vmseq_vv, opivv_cmp_check)
+GEN_OPIVV_TRANS(vmsne_vv, opivv_cmp_check)
+GEN_OPIVV_TRANS(vmsltu_vv, opivv_cmp_check)
+GEN_OPIVV_TRANS(vmslt_vv, opivv_cmp_check)
+GEN_OPIVV_TRANS(vmsleu_vv, opivv_cmp_check)
+GEN_OPIVV_TRANS(vmsle_vv, opivv_cmp_check)
+
+static bool opivx_cmp_check(DisasContext *s, arg_rmrr *a)
+{
+    return (vext_check_isa_ill(s) &&
+            vext_check_reg(s, a->rs2, false) &&
+            (vext_check_overlap_group(a->rd, 1, a->rs2, 1 << s->lmul) ||
+             (s->lmul == 0)));
+}
+
+GEN_OPIVX_TRANS(vmseq_vx, opivx_cmp_check)
+GEN_OPIVX_TRANS(vmsne_vx, opivx_cmp_check)
+GEN_OPIVX_TRANS(vmsltu_vx, opivx_cmp_check)
+GEN_OPIVX_TRANS(vmslt_vx, opivx_cmp_check)
+GEN_OPIVX_TRANS(vmsleu_vx, opivx_cmp_check)
+GEN_OPIVX_TRANS(vmsle_vx, opivx_cmp_check)
+GEN_OPIVX_TRANS(vmsgtu_vx, opivx_cmp_check)
+GEN_OPIVX_TRANS(vmsgt_vx, opivx_cmp_check)
+
+GEN_OPIVI_TRANS(vmseq_vi, 0, vmseq_vx, opivx_cmp_check)
+GEN_OPIVI_TRANS(vmsne_vi, 0, vmsne_vx, opivx_cmp_check)
+GEN_OPIVI_TRANS(vmsleu_vi, 1, vmsleu_vx, opivx_cmp_check)
+GEN_OPIVI_TRANS(vmsle_vi, 0, vmsle_vx, opivx_cmp_check)
+GEN_OPIVI_TRANS(vmsgtu_vi, 1, vmsgtu_vx, opivx_cmp_check)
+GEN_OPIVI_TRANS(vmsgt_vi, 0, vmsgt_vx, opivx_cmp_check)
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 96e3467353..71f27146b3 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -1409,3 +1409,126 @@ GEN_VEXT_SHIFT_VX(vnsrl_vx_w, uint32_t, uint64_t, H4, H8, DO_SRL, 0x3f, clearl)
 GEN_VEXT_SHIFT_VX(vnsra_vx_b, int8_t, int16_t, H1, H2, DO_SRL, 0xf, clearb)
 GEN_VEXT_SHIFT_VX(vnsra_vx_h, int16_t, int32_t, H2, H4, DO_SRL, 0x1f, clearh)
 GEN_VEXT_SHIFT_VX(vnsra_vx_w, int32_t, int64_t, H4, H8, DO_SRL, 0x3f, clearl)
+
+/* Vector Integer Comparison Instructions */
+#define DO_MSEQ(N, M) (N == M)
+#define DO_MSNE(N, M) (N != M)
+#define DO_MSLT(N, M) (N < M)
+#define DO_MSLE(N, M) (N <= M)
+#define DO_MSGT(N, M) (N > M)
+
+#define GEN_VEXT_CMP_VV(NAME, ETYPE, H, DO_OP)                \
+void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,   \
+                  CPURISCVState *env, uint32_t desc)          \
+{                                                             \
+    uint32_t mlen = vext_mlen(desc);                          \
+    uint32_t vm = vext_vm(desc);                              \
+    uint32_t vl = env->vl;                                    \
+    uint32_t vlmax = vext_maxsz(desc) / sizeof(ETYPE);        \
+    uint32_t i;                                               \
+                                                              \
+    for (i = 0; i < vl; i++) {                                \
+        ETYPE s1 = *((ETYPE *)vs1 + H(i));                    \
+        ETYPE s2 = *((ETYPE *)vs2 + H(i));                    \
+        if (!vm && !vext_elem_mask(v0, mlen, i)) {            \
+            continue;                                         \
+        }                                                     \
+        vext_set_elem_mask(vd, mlen, i, DO_OP(s2, s1));       \
+    }                                                         \
+    for (; i < vlmax; i++) {                                  \
+        vext_set_elem_mask(vd, mlen, i, 0);                   \
+    }                                                         \
+}
+
+GEN_VEXT_CMP_VV(vmseq_vv_b, uint8_t,  H1, DO_MSEQ)
+GEN_VEXT_CMP_VV(vmseq_vv_h, uint16_t, H2, DO_MSEQ)
+GEN_VEXT_CMP_VV(vmseq_vv_w, uint32_t, H4, DO_MSEQ)
+GEN_VEXT_CMP_VV(vmseq_vv_d, uint64_t, H8, DO_MSEQ)
+
+GEN_VEXT_CMP_VV(vmsne_vv_b, uint8_t,  H1, DO_MSNE)
+GEN_VEXT_CMP_VV(vmsne_vv_h, uint16_t, H2, DO_MSNE)
+GEN_VEXT_CMP_VV(vmsne_vv_w, uint32_t, H4, DO_MSNE)
+GEN_VEXT_CMP_VV(vmsne_vv_d, uint64_t, H8, DO_MSNE)
+
+GEN_VEXT_CMP_VV(vmsltu_vv_b, uint8_t,  H1, DO_MSLT)
+GEN_VEXT_CMP_VV(vmsltu_vv_h, uint16_t, H2, DO_MSLT)
+GEN_VEXT_CMP_VV(vmsltu_vv_w, uint32_t, H4, DO_MSLT)
+GEN_VEXT_CMP_VV(vmsltu_vv_d, uint64_t, H8, DO_MSLT)
+
+GEN_VEXT_CMP_VV(vmslt_vv_b, int8_t,  H1, DO_MSLT)
+GEN_VEXT_CMP_VV(vmslt_vv_h, int16_t, H2, DO_MSLT)
+GEN_VEXT_CMP_VV(vmslt_vv_w, int32_t, H4, DO_MSLT)
+GEN_VEXT_CMP_VV(vmslt_vv_d, int64_t, H8, DO_MSLT)
+
+GEN_VEXT_CMP_VV(vmsleu_vv_b, uint8_t,  H1, DO_MSLE)
+GEN_VEXT_CMP_VV(vmsleu_vv_h, uint16_t, H2, DO_MSLE)
+GEN_VEXT_CMP_VV(vmsleu_vv_w, uint32_t, H4, DO_MSLE)
+GEN_VEXT_CMP_VV(vmsleu_vv_d, uint64_t, H8, DO_MSLE)
+
+GEN_VEXT_CMP_VV(vmsle_vv_b, int8_t,  H1, DO_MSLE)
+GEN_VEXT_CMP_VV(vmsle_vv_h, int16_t, H2, DO_MSLE)
+GEN_VEXT_CMP_VV(vmsle_vv_w, int32_t, H4, DO_MSLE)
+GEN_VEXT_CMP_VV(vmsle_vv_d, int64_t, H8, DO_MSLE)
+
+#define GEN_VEXT_CMP_VX(NAME, ETYPE, H, DO_OP)                      \
+void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,   \
+                  CPURISCVState *env, uint32_t desc)                \
+{                                                                   \
+    uint32_t mlen = vext_mlen(desc);                                \
+    uint32_t vm = vext_vm(desc);                                    \
+    uint32_t vl = env->vl;                                          \
+    uint32_t vlmax = vext_maxsz(desc) / sizeof(ETYPE);              \
+    uint32_t i;                                                     \
+                                                                    \
+    for (i = 0; i < vl; i++) {                                      \
+        ETYPE s2 = *((ETYPE *)vs2 + H(i));                          \
+        if (!vm && !vext_elem_mask(v0, mlen, i)) {                  \
+            continue;                                               \
+        }                                                           \
+        vext_set_elem_mask(vd, mlen, i,                             \
+                DO_OP(s2, (ETYPE)(target_long)s1));                 \
+    }                                                               \
+    for (; i < vlmax; i++) {                                        \
+        vext_set_elem_mask(vd, mlen, i, 0);                         \
+    }                                                               \
+}
+
+GEN_VEXT_CMP_VX(vmseq_vx_b, uint8_t,  H1, DO_MSEQ)
+GEN_VEXT_CMP_VX(vmseq_vx_h, uint16_t, H2, DO_MSEQ)
+GEN_VEXT_CMP_VX(vmseq_vx_w, uint32_t, H4, DO_MSEQ)
+GEN_VEXT_CMP_VX(vmseq_vx_d, uint64_t, H8, DO_MSEQ)
+
+GEN_VEXT_CMP_VX(vmsne_vx_b, uint8_t,  H1, DO_MSNE)
+GEN_VEXT_CMP_VX(vmsne_vx_h, uint16_t, H2, DO_MSNE)
+GEN_VEXT_CMP_VX(vmsne_vx_w, uint32_t, H4, DO_MSNE)
+GEN_VEXT_CMP_VX(vmsne_vx_d, uint64_t, H8, DO_MSNE)
+
+GEN_VEXT_CMP_VX(vmsltu_vx_b, uint8_t,  H1, DO_MSLT)
+GEN_VEXT_CMP_VX(vmsltu_vx_h, uint16_t, H2, DO_MSLT)
+GEN_VEXT_CMP_VX(vmsltu_vx_w, uint32_t, H4, DO_MSLT)
+GEN_VEXT_CMP_VX(vmsltu_vx_d, uint64_t, H8, DO_MSLT)
+
+GEN_VEXT_CMP_VX(vmslt_vx_b, int8_t,  H1, DO_MSLT)
+GEN_VEXT_CMP_VX(vmslt_vx_h, int16_t, H2, DO_MSLT)
+GEN_VEXT_CMP_VX(vmslt_vx_w, int32_t, H4, DO_MSLT)
+GEN_VEXT_CMP_VX(vmslt_vx_d, int64_t, H8, DO_MSLT)
+
+GEN_VEXT_CMP_VX(vmsleu_vx_b, uint8_t,  H1, DO_MSLE)
+GEN_VEXT_CMP_VX(vmsleu_vx_h, uint16_t, H2, DO_MSLE)
+GEN_VEXT_CMP_VX(vmsleu_vx_w, uint32_t, H4, DO_MSLE)
+GEN_VEXT_CMP_VX(vmsleu_vx_d, uint64_t, H8, DO_MSLE)
+
+GEN_VEXT_CMP_VX(vmsle_vx_b, int8_t,  H1, DO_MSLE)
+GEN_VEXT_CMP_VX(vmsle_vx_h, int16_t, H2, DO_MSLE)
+GEN_VEXT_CMP_VX(vmsle_vx_w, int32_t, H4, DO_MSLE)
+GEN_VEXT_CMP_VX(vmsle_vx_d, int64_t, H8, DO_MSLE)
+
+GEN_VEXT_CMP_VX(vmsgtu_vx_b, uint8_t,  H1, DO_MSGT)
+GEN_VEXT_CMP_VX(vmsgtu_vx_h, uint16_t, H2, DO_MSGT)
+GEN_VEXT_CMP_VX(vmsgtu_vx_w, uint32_t, H4, DO_MSGT)
+GEN_VEXT_CMP_VX(vmsgtu_vx_d, uint64_t, H8, DO_MSGT)
+
+GEN_VEXT_CMP_VX(vmsgt_vx_b, int8_t,  H1, DO_MSGT)
+GEN_VEXT_CMP_VX(vmsgt_vx_h, int16_t, H2, DO_MSGT)
+GEN_VEXT_CMP_VX(vmsgt_vx_w, int32_t, H4, DO_MSGT)
+GEN_VEXT_CMP_VX(vmsgt_vx_d, int64_t, H8, DO_MSGT)
-- 
2.27.0


