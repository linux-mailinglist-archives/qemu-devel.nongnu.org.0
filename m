Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 746FD6F7B14
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 04:37:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pulC4-0004ZX-Ng; Thu, 04 May 2023 22:29:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1pulC2-0004ZI-S8
 for qemu-devel@nongnu.org; Thu, 04 May 2023 22:29:10 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1pulC0-0000B8-JT
 for qemu-devel@nongnu.org; Thu, 04 May 2023 22:29:10 -0400
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8CxE_DnaVRk4PcEAA--.8287S3;
 Fri, 05 May 2023 10:28:55 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Bx8a+2aVRkNw9LAA--.7251S19; 
 Fri, 05 May 2023 10:28:49 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org
Subject: [PULL 17/45] target/loongarch: Implement vsat
Date: Fri,  5 May 2023 10:27:38 +0800
Message-Id: <20230505022806.6082-18-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230505022806.6082-1-gaosong@loongson.cn>
References: <20230505022806.6082-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Bx8a+2aVRkNw9LAA--.7251S19
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoW3Ww18Ww4kGF4kXw47uF1xZrb_yoW3GFWUpF
 y8Kry8Kr48GFWxXFnYv3W5Aw4DXrsFkw1Y9a13twn5urW7XFnrXF95t39F9F4UZF1vva4j
 q3WfCryYyrZ5XwUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bnkFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4
 AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF
 7I0E14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6x
 kF7I0E14v26r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020E
 x4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E74AGY7Cv6cx26rWlOx8S6xCaFV
 Cjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7VAKI48JMxAIw28IcVCjz48v
 1sIEY20_WwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I
 0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jrv_JF1lIxkGc2Ij64vIr41lIxAI
 cVC0I7IYx2IY67AKxVW5JVW7JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcV
 CF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIE
 c7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0zRVWlkUUUUU=
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This patch includes:
- VSAT.{B/H/W/D}[U].

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Song Gao <gaosong@loongson.cn>
Message-Id: <20230504122810.4094787-18-gaosong@loongson.cn>
---
 target/loongarch/disas.c                    |   9 ++
 target/loongarch/helper.h                   |   9 ++
 target/loongarch/insn_trans/trans_lsx.c.inc | 101 ++++++++++++++++++++
 target/loongarch/insns.decode               |  12 +++
 target/loongarch/lsx_helper.c               |  37 +++++++
 5 files changed, 168 insertions(+)

diff --git a/target/loongarch/disas.c b/target/loongarch/disas.c
index 6e4f676a42..b04aefe3ed 100644
--- a/target/loongarch/disas.c
+++ b/target/loongarch/disas.c
@@ -1061,3 +1061,12 @@ INSN_LSX(vmod_bu,          vvv)
 INSN_LSX(vmod_hu,          vvv)
 INSN_LSX(vmod_wu,          vvv)
 INSN_LSX(vmod_du,          vvv)
+
+INSN_LSX(vsat_b,           vv_i)
+INSN_LSX(vsat_h,           vv_i)
+INSN_LSX(vsat_w,           vv_i)
+INSN_LSX(vsat_d,           vv_i)
+INSN_LSX(vsat_bu,          vv_i)
+INSN_LSX(vsat_hu,          vv_i)
+INSN_LSX(vsat_wu,          vv_i)
+INSN_LSX(vsat_du,          vv_i)
diff --git a/target/loongarch/helper.h b/target/loongarch/helper.h
index 7b7c685ede..d2b1c9f2a4 100644
--- a/target/loongarch/helper.h
+++ b/target/loongarch/helper.h
@@ -320,3 +320,12 @@ DEF_HELPER_4(vmod_bu, void, env, i32, i32, i32)
 DEF_HELPER_4(vmod_hu, void, env, i32, i32, i32)
 DEF_HELPER_4(vmod_wu, void, env, i32, i32, i32)
 DEF_HELPER_4(vmod_du, void, env, i32, i32, i32)
+
+DEF_HELPER_FLAGS_4(vsat_b, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
+DEF_HELPER_FLAGS_4(vsat_h, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
+DEF_HELPER_FLAGS_4(vsat_w, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
+DEF_HELPER_FLAGS_4(vsat_d, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
+DEF_HELPER_FLAGS_4(vsat_bu, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
+DEF_HELPER_FLAGS_4(vsat_hu, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
+DEF_HELPER_FLAGS_4(vsat_wu, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
+DEF_HELPER_FLAGS_4(vsat_du, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
diff --git a/target/loongarch/insn_trans/trans_lsx.c.inc b/target/loongarch/insn_trans/trans_lsx.c.inc
index b295a9c4df..b8f05c66a5 100644
--- a/target/loongarch/insn_trans/trans_lsx.c.inc
+++ b/target/loongarch/insn_trans/trans_lsx.c.inc
@@ -2693,3 +2693,104 @@ TRANS(vmod_bu, gen_vvv, gen_helper_vmod_bu)
 TRANS(vmod_hu, gen_vvv, gen_helper_vmod_hu)
 TRANS(vmod_wu, gen_vvv, gen_helper_vmod_wu)
 TRANS(vmod_du, gen_vvv, gen_helper_vmod_du)
+
+static void gen_vsat_s(unsigned vece, TCGv_vec t, TCGv_vec a, TCGv_vec max)
+{
+    TCGv_vec min;
+
+    min = tcg_temp_new_vec_matching(t);
+    tcg_gen_not_vec(vece, min, max);
+    tcg_gen_smax_vec(vece, t, a, min);
+    tcg_gen_smin_vec(vece, t, t, max);
+}
+
+static void do_vsat_s(unsigned vece, uint32_t vd_ofs, uint32_t vj_ofs,
+                      int64_t imm, uint32_t oprsz, uint32_t maxsz)
+{
+    static const TCGOpcode vecop_list[] = {
+        INDEX_op_smax_vec, INDEX_op_smin_vec, 0
+        };
+    static const GVecGen2s op[4] = {
+        {
+            .fniv = gen_vsat_s,
+            .fno = gen_helper_vsat_b,
+            .opt_opc = vecop_list,
+            .vece = MO_8
+        },
+        {
+            .fniv = gen_vsat_s,
+            .fno = gen_helper_vsat_h,
+            .opt_opc = vecop_list,
+            .vece = MO_16
+        },
+        {
+            .fniv = gen_vsat_s,
+            .fno = gen_helper_vsat_w,
+            .opt_opc = vecop_list,
+            .vece = MO_32
+        },
+        {
+            .fniv = gen_vsat_s,
+            .fno = gen_helper_vsat_d,
+            .opt_opc = vecop_list,
+            .vece = MO_64
+        },
+    };
+
+    tcg_gen_gvec_2s(vd_ofs, vj_ofs, oprsz, maxsz,
+                    tcg_constant_i64((1ll<< imm) -1), &op[vece]);
+}
+
+TRANS(vsat_b, gvec_vv_i, MO_8, do_vsat_s)
+TRANS(vsat_h, gvec_vv_i, MO_16, do_vsat_s)
+TRANS(vsat_w, gvec_vv_i, MO_32, do_vsat_s)
+TRANS(vsat_d, gvec_vv_i, MO_64, do_vsat_s)
+
+static void gen_vsat_u(unsigned vece, TCGv_vec t, TCGv_vec a, TCGv_vec max)
+{
+    tcg_gen_umin_vec(vece, t, a, max);
+}
+
+static void do_vsat_u(unsigned vece, uint32_t vd_ofs, uint32_t vj_ofs,
+                       int64_t imm, uint32_t oprsz, uint32_t maxsz)
+{
+    uint64_t max;
+    static const TCGOpcode vecop_list[] = {
+        INDEX_op_umin_vec, 0
+        };
+    static const GVecGen2s op[4] = {
+        {
+            .fniv = gen_vsat_u,
+            .fno = gen_helper_vsat_bu,
+            .opt_opc = vecop_list,
+            .vece = MO_8
+        },
+        {
+            .fniv = gen_vsat_u,
+            .fno = gen_helper_vsat_hu,
+            .opt_opc = vecop_list,
+            .vece = MO_16
+        },
+        {
+            .fniv = gen_vsat_u,
+            .fno = gen_helper_vsat_wu,
+            .opt_opc = vecop_list,
+            .vece = MO_32
+        },
+        {
+            .fniv = gen_vsat_u,
+            .fno = gen_helper_vsat_du,
+            .opt_opc = vecop_list,
+            .vece = MO_64
+        },
+    };
+
+    max = (imm == 0x3f) ? UINT64_MAX : (1ull << (imm + 1)) - 1;
+    tcg_gen_gvec_2s(vd_ofs, vj_ofs, oprsz, maxsz,
+                    tcg_constant_i64(max), &op[vece]);
+}
+
+TRANS(vsat_bu, gvec_vv_i, MO_8, do_vsat_u)
+TRANS(vsat_hu, gvec_vv_i, MO_16, do_vsat_u)
+TRANS(vsat_wu, gvec_vv_i, MO_32, do_vsat_u)
+TRANS(vsat_du, gvec_vv_i, MO_64, do_vsat_u)
diff --git a/target/loongarch/insns.decode b/target/loongarch/insns.decode
index 67d016edb7..3ed61b3d68 100644
--- a/target/loongarch/insns.decode
+++ b/target/loongarch/insns.decode
@@ -499,7 +499,10 @@ dbcl             0000 00000010 10101 ...............      @i15
 #
 @vv               .... ........ ..... ..... vj:5 vd:5    &vv
 @vvv               .... ........ ..... vk:5 vj:5 vd:5    &vvv
+@vv_ui3        .... ........ ..... .. imm:3 vj:5 vd:5    &vv_i
+@vv_ui4         .... ........ ..... . imm:4 vj:5 vd:5    &vv_i
 @vv_ui5           .... ........ ..... imm:5 vj:5 vd:5    &vv_i
+@vv_ui6            .... ........ .... imm:6 vj:5 vd:5    &vv_i
 @vv_i5           .... ........ ..... imm:s5 vj:5 vd:5    &vv_i
 
 vadd_b           0111 00000000 10100 ..... ..... .....    @vvv
@@ -757,3 +760,12 @@ vmod_bu          0111 00001110 01100 ..... ..... .....    @vvv
 vmod_hu          0111 00001110 01101 ..... ..... .....    @vvv
 vmod_wu          0111 00001110 01110 ..... ..... .....    @vvv
 vmod_du          0111 00001110 01111 ..... ..... .....    @vvv
+
+vsat_b           0111 00110010 01000 01 ... ..... .....   @vv_ui3
+vsat_h           0111 00110010 01000 1 .... ..... .....   @vv_ui4
+vsat_w           0111 00110010 01001 ..... ..... .....    @vv_ui5
+vsat_d           0111 00110010 0101 ...... ..... .....    @vv_ui6
+vsat_bu          0111 00110010 10000 01 ... ..... .....   @vv_ui3
+vsat_hu          0111 00110010 10000 1 .... ..... .....   @vv_ui4
+vsat_wu          0111 00110010 10001 ..... ..... .....    @vv_ui5
+vsat_du          0111 00110010 1001 ...... ..... .....    @vv_ui6
diff --git a/target/loongarch/lsx_helper.c b/target/loongarch/lsx_helper.c
index 018009bbf9..9ba16ac631 100644
--- a/target/loongarch/lsx_helper.c
+++ b/target/loongarch/lsx_helper.c
@@ -590,3 +590,40 @@ VDIV(vmod_bu, 8, UB, DO_REMU)
 VDIV(vmod_hu, 16, UH, DO_REMU)
 VDIV(vmod_wu, 32, UW, DO_REMU)
 VDIV(vmod_du, 64, UD, DO_REMU)
+
+#define VSAT_S(NAME, BIT, E)                                    \
+void HELPER(NAME)(void *vd, void *vj, uint64_t max, uint32_t v) \
+{                                                               \
+    int i;                                                      \
+    VReg *Vd = (VReg *)vd;                                      \
+    VReg *Vj = (VReg *)vj;                                      \
+    typedef __typeof(Vd->E(0)) TD;                              \
+                                                                \
+    for (i = 0; i < LSX_LEN/BIT; i++) {                         \
+        Vd->E(i) = Vj->E(i) > (TD)max ? (TD)max :               \
+                   Vj->E(i) < (TD)~max ? (TD)~max: Vj->E(i);    \
+    }                                                           \
+}
+
+VSAT_S(vsat_b, 8, B)
+VSAT_S(vsat_h, 16, H)
+VSAT_S(vsat_w, 32, W)
+VSAT_S(vsat_d, 64, D)
+
+#define VSAT_U(NAME, BIT, E)                                    \
+void HELPER(NAME)(void *vd, void *vj, uint64_t max, uint32_t v) \
+{                                                               \
+    int i;                                                      \
+    VReg *Vd = (VReg *)vd;                                      \
+    VReg *Vj = (VReg *)vj;                                      \
+    typedef __typeof(Vd->E(0)) TD;                              \
+                                                                \
+    for (i = 0; i < LSX_LEN/BIT; i++) {                         \
+        Vd->E(i) = Vj->E(i) > (TD)max ? (TD)max : Vj->E(i);     \
+    }                                                           \
+}
+
+VSAT_U(vsat_bu, 8, UB)
+VSAT_U(vsat_hu, 16, UH)
+VSAT_U(vsat_wu, 32, UW)
+VSAT_U(vsat_du, 64, UD)
-- 
2.31.1


