Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42BE7188B3F
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Mar 2020 17:54:49 +0100 (CET)
Received: from localhost ([::1]:36926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jEFUO-0005mn-9X
	for lists+qemu-devel@lfdr.de; Tue, 17 Mar 2020 12:54:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50062)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1jEFNg-0003gV-M0
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 12:47:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1jEFNf-0001jX-9z
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 12:47:52 -0400
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:35780)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jEFNe-0008Ng-Nm; Tue, 17 Mar 2020 12:47:51 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.1032798|-1; CH=blue; DM=||false|;
 DS=CONTINUE|ham_system_inform|0.00306607-5.72884e-05-0.996877;
 FP=0|0|0|0|0|-1|-1|-1; HT=e02c03311; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS;
 RN=10; RT=10; SR=0; TI=SMTPD_---.H1.KKUC_1584463661; 
Received: from L-PF1D6DP4-1208.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.H1.KKUC_1584463661)
 by smtp.aliyun-inc.com(10.147.43.230);
 Wed, 18 Mar 2020 00:47:42 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: richard.henderson@linaro.org, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
Subject: [PATCH v6 50/61] target/riscv: vector mask population count vmpopc
Date: Tue, 17 Mar 2020 23:06:42 +0800
Message-Id: <20200317150653.9008-51-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200317150653.9008-1-zhiwei_liu@c-sky.com>
References: <20200317150653.9008-1-zhiwei_liu@c-sky.com>
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/helper.h                   |  2 ++
 target/riscv/insn32.decode              |  1 +
 target/riscv/insn_trans/trans_rvv.inc.c | 32 +++++++++++++++++++++++++
 target/riscv/vector_helper.c            | 20 ++++++++++++++++
 4 files changed, 55 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 116c14f40f..e919c5e30b 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1091,3 +1091,5 @@ DEF_HELPER_6(vmor_mm, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vmnor_mm, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vmornot_mm, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vmxnor_mm, void, ptr, ptr, ptr, ptr, env, i32)
+
+DEF_HELPER_4(vmpopc_m, tl, ptr, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index a4128c26a0..decb7f773f 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -553,6 +553,7 @@ vmor_mm         011010 - ..... ..... 010 ..... 1010111 @r
 vmnor_mm        011110 - ..... ..... 010 ..... 1010111 @r
 vmornot_mm      011100 - ..... ..... 010 ..... 1010111 @r
 vmxnor_mm       011111 - ..... ..... 010 ..... 1010111 @r
+vmpopc_m        010100 . ..... ----- 010 ..... 1010111 @r2_vm
 
 vsetvli         0 ........... ..... 111 ..... 1010111  @r2_zimm
 vsetvl          1000000 ..... ..... 111 ..... 1010111  @r
diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index 620a73d741..c3d6042f82 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -2217,3 +2217,35 @@ GEN_MM_TRANS(vmor_mm)
 GEN_MM_TRANS(vmnor_mm)
 GEN_MM_TRANS(vmornot_mm)
 GEN_MM_TRANS(vmxnor_mm)
+
+/* Vector mask population count vmpopc */
+static bool trans_vmpopc_m(DisasContext *s, arg_rmr *a)
+{
+    if (vext_check_isa_ill(s)) {
+        TCGv_ptr src2, mask;
+        TCGv dst;
+        TCGv_i32 desc;
+        uint32_t data = 0;
+        data = FIELD_DP32(data, VDATA, MLEN, s->mlen);
+        data = FIELD_DP32(data, VDATA, VM, a->vm);
+        data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
+
+        mask = tcg_temp_new_ptr();
+        src2 = tcg_temp_new_ptr();
+        dst = tcg_temp_new();
+        desc = tcg_const_i32(simd_desc(0, s->vlen / 8, data));
+
+        tcg_gen_addi_ptr(src2, cpu_env, vreg_ofs(s, a->rs2));
+        tcg_gen_addi_ptr(mask, cpu_env, vreg_ofs(s, 0));
+
+        gen_helper_vmpopc_m(dst, mask, src2, cpu_env, desc);
+        gen_set_gpr(a->rd, dst);
+
+        tcg_temp_free_ptr(mask);
+        tcg_temp_free_ptr(src2);
+        tcg_temp_free(dst);
+        tcg_temp_free_i32(desc);
+        return true;
+    }
+    return false;
+}
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 7157ad49ea..829a39a8fe 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4511,3 +4511,23 @@ GEN_VEXT_MASK_VV(vmor_mm, DO_OR)
 GEN_VEXT_MASK_VV(vmnor_mm, DO_NOR)
 GEN_VEXT_MASK_VV(vmornot_mm, DO_ORNOT)
 GEN_VEXT_MASK_VV(vmxnor_mm, DO_XNOR)
+
+/* Vector mask population count vmpopc */
+target_ulong HELPER(vmpopc_m)(void *v0, void *vs2, CPURISCVState *env,
+        uint32_t desc)
+{
+    target_ulong cnt = 0;
+    uint32_t mlen = vext_mlen(desc);
+    uint32_t vm = vext_vm(desc);
+    uint32_t vl = env->vl;
+    int i;
+
+    for (i = 0; i < vl; i++) {
+        if (vm || vext_elem_mask(v0, mlen, i)) {
+            if (vext_elem_mask(vs2, mlen, i)) {
+                cnt++;
+            }
+        }
+    }
+    return cnt;
+}
-- 
2.23.0


