Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFBA46F7B1A
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 04:37:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pulCD-0004nr-8N; Thu, 04 May 2023 22:29:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1pulCB-0004l8-3n
 for qemu-devel@nongnu.org; Thu, 04 May 2023 22:29:19 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1pulC8-0000FM-KA
 for qemu-devel@nongnu.org; Thu, 04 May 2023 22:29:18 -0400
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8DxRunuaVRk7fcEAA--.8125S3;
 Fri, 05 May 2023 10:29:02 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Bx8a+2aVRkNw9LAA--.7251S25; 
 Fri, 05 May 2023 10:29:00 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org
Subject: [PULL 23/45] target/loongarch: Implement vsllwil vextl
Date: Fri,  5 May 2023 10:27:44 +0800
Message-Id: <20230505022806.6082-24-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230505022806.6082-1-gaosong@loongson.cn>
References: <20230505022806.6082-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Bx8a+2aVRkNw9LAA--.7251S25
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoW3XFWxXrW7Ar1DZrWUXrW8JFb_yoW7Kr1rpF
 42kryUGr48JrWxX3Za9a4rAF1UZr4DKw17uw4fta48WrWUJF1DtF1kt3yqkFW5X3ZxXFW0
 v3W3A3yY9FW5X37anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bo8Fc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4
 AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF
 7I0E14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6x
 kF7I0E14v26r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020E
 x4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E74AGY7Cv6cx26rWlOx8S6xCaFV
 Cjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7VAKI48JMxAIw28IcVCjz48v
 1sIEY20_WwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVW8ZVWrXwC20s026c
 02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jrv_
 JF1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVW7JVWDJwCI42IY6xIIjxv20xvEc7
 CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v2
 6r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0z
 RVWlkUUUUU=
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
- VSLLWIL.{H.B/W.H/D.W};
- VSLLWIL.{HU.BU/WU.HU/DU.WU};
- VEXTL.Q.D, VEXTL.QU.DU.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Song Gao <gaosong@loongson.cn>
Message-Id: <20230504122810.4094787-24-gaosong@loongson.cn>
---
 target/loongarch/disas.c                    |  9 +++++
 target/loongarch/helper.h                   |  9 +++++
 target/loongarch/insn_trans/trans_lsx.c.inc | 21 +++++++++++
 target/loongarch/insns.decode               |  9 +++++
 target/loongarch/lsx_helper.c               | 41 +++++++++++++++++++++
 5 files changed, 89 insertions(+)

diff --git a/target/loongarch/disas.c b/target/loongarch/disas.c
index f7d0fb4441..087cac10ad 100644
--- a/target/loongarch/disas.c
+++ b/target/loongarch/disas.c
@@ -1139,3 +1139,12 @@ INSN_LSX(vrotri_b,         vv_i)
 INSN_LSX(vrotri_h,         vv_i)
 INSN_LSX(vrotri_w,         vv_i)
 INSN_LSX(vrotri_d,         vv_i)
+
+INSN_LSX(vsllwil_h_b,      vv_i)
+INSN_LSX(vsllwil_w_h,      vv_i)
+INSN_LSX(vsllwil_d_w,      vv_i)
+INSN_LSX(vextl_q_d,        vv)
+INSN_LSX(vsllwil_hu_bu,    vv_i)
+INSN_LSX(vsllwil_wu_hu,    vv_i)
+INSN_LSX(vsllwil_du_wu,    vv_i)
+INSN_LSX(vextl_qu_du,      vv)
diff --git a/target/loongarch/helper.h b/target/loongarch/helper.h
index 617c579592..e98f7c3e6f 100644
--- a/target/loongarch/helper.h
+++ b/target/loongarch/helper.h
@@ -352,3 +352,12 @@ DEF_HELPER_3(vmskgez_b, void, env, i32, i32)
 DEF_HELPER_3(vmsknz_b, void, env, i32,i32)
 
 DEF_HELPER_FLAGS_4(vnori_b, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
+
+DEF_HELPER_4(vsllwil_h_b, void, env, i32, i32, i32)
+DEF_HELPER_4(vsllwil_w_h, void, env, i32, i32, i32)
+DEF_HELPER_4(vsllwil_d_w, void, env, i32, i32, i32)
+DEF_HELPER_3(vextl_q_d, void, env, i32, i32)
+DEF_HELPER_4(vsllwil_hu_bu, void, env, i32, i32, i32)
+DEF_HELPER_4(vsllwil_wu_hu, void, env, i32, i32, i32)
+DEF_HELPER_4(vsllwil_du_wu, void, env, i32, i32, i32)
+DEF_HELPER_3(vextl_qu_du, void, env, i32, i32)
diff --git a/target/loongarch/insn_trans/trans_lsx.c.inc b/target/loongarch/insn_trans/trans_lsx.c.inc
index ad8f32ed18..037c742aa4 100644
--- a/target/loongarch/insn_trans/trans_lsx.c.inc
+++ b/target/loongarch/insn_trans/trans_lsx.c.inc
@@ -39,6 +39,18 @@ static bool gen_vv(DisasContext *ctx, arg_vv *a,
     return true;
 }
 
+static bool gen_vv_i(DisasContext *ctx, arg_vv_i *a,
+                     void (*func)(TCGv_ptr, TCGv_i32, TCGv_i32, TCGv_i32))
+{
+    TCGv_i32 vd = tcg_constant_i32(a->vd);
+    TCGv_i32 vj = tcg_constant_i32(a->vj);
+    TCGv_i32 imm = tcg_constant_i32(a->imm);
+
+    CHECK_SXE;
+    func(cpu_env, vd, vj, imm);
+    return true;
+}
+
 static bool gvec_vvv(DisasContext *ctx, arg_vvv *a, MemOp mop,
                      void (*func)(unsigned, uint32_t, uint32_t,
                                   uint32_t, uint32_t, uint32_t))
@@ -2966,3 +2978,12 @@ TRANS(vrotri_b, gvec_vv_i, MO_8, tcg_gen_gvec_rotri)
 TRANS(vrotri_h, gvec_vv_i, MO_16, tcg_gen_gvec_rotri)
 TRANS(vrotri_w, gvec_vv_i, MO_32, tcg_gen_gvec_rotri)
 TRANS(vrotri_d, gvec_vv_i, MO_64, tcg_gen_gvec_rotri)
+
+TRANS(vsllwil_h_b, gen_vv_i, gen_helper_vsllwil_h_b)
+TRANS(vsllwil_w_h, gen_vv_i, gen_helper_vsllwil_w_h)
+TRANS(vsllwil_d_w, gen_vv_i, gen_helper_vsllwil_d_w)
+TRANS(vextl_q_d, gen_vv, gen_helper_vextl_q_d)
+TRANS(vsllwil_hu_bu, gen_vv_i, gen_helper_vsllwil_hu_bu)
+TRANS(vsllwil_wu_hu, gen_vv_i, gen_helper_vsllwil_wu_hu)
+TRANS(vsllwil_du_wu, gen_vv_i, gen_helper_vsllwil_du_wu)
+TRANS(vextl_qu_du, gen_vv, gen_helper_vextl_qu_du)
diff --git a/target/loongarch/insns.decode b/target/loongarch/insns.decode
index 7c0b0c4ac8..23dd338026 100644
--- a/target/loongarch/insns.decode
+++ b/target/loongarch/insns.decode
@@ -839,3 +839,12 @@ vrotri_b         0111 00101010 00000 01 ... ..... .....   @vv_ui3
 vrotri_h         0111 00101010 00000 1 .... ..... .....   @vv_ui4
 vrotri_w         0111 00101010 00001 ..... ..... .....    @vv_ui5
 vrotri_d         0111 00101010 0001 ...... ..... .....    @vv_ui6
+
+vsllwil_h_b      0111 00110000 10000 01 ... ..... .....   @vv_ui3
+vsllwil_w_h      0111 00110000 10000 1 .... ..... .....   @vv_ui4
+vsllwil_d_w      0111 00110000 10001 ..... ..... .....    @vv_ui5
+vextl_q_d        0111 00110000 10010 00000 ..... .....    @vv
+vsllwil_hu_bu    0111 00110000 11000 01 ... ..... .....   @vv_ui3
+vsllwil_wu_hu    0111 00110000 11000 1 .... ..... .....   @vv_ui4
+vsllwil_du_wu    0111 00110000 11001 ..... ..... .....    @vv_ui5
+vextl_qu_du      0111 00110000 11010 00000 ..... .....    @vv
diff --git a/target/loongarch/lsx_helper.c b/target/loongarch/lsx_helper.c
index ff00d60ab8..de86f41cce 100644
--- a/target/loongarch/lsx_helper.c
+++ b/target/loongarch/lsx_helper.c
@@ -793,3 +793,44 @@ void HELPER(vnori_b)(void *vd, void *vj, uint64_t imm, uint32_t v)
         Vd->B(i) = ~(Vj->B(i) | (uint8_t)imm);
     }
 }
+
+#define VSLLWIL(NAME, BIT, E1, E2)                        \
+void HELPER(NAME)(CPULoongArchState *env,                 \
+                  uint32_t vd, uint32_t vj, uint32_t imm) \
+{                                                         \
+    int i;                                                \
+    VReg temp;                                            \
+    VReg *Vd = &(env->fpr[vd].vreg);                      \
+    VReg *Vj = &(env->fpr[vj].vreg);                      \
+    typedef __typeof(temp.E1(0)) TD;                      \
+                                                          \
+    temp.D(0) = 0;                                        \
+    temp.D(1) = 0;                                        \
+    for (i = 0; i < LSX_LEN/BIT; i++) {                   \
+        temp.E1(i) = (TD)Vj->E2(i) << (imm % BIT);        \
+    }                                                     \
+    *Vd = temp;                                           \
+}
+
+void HELPER(vextl_q_d)(CPULoongArchState *env, uint32_t vd, uint32_t vj)
+{
+    VReg *Vd = &(env->fpr[vd].vreg);
+    VReg *Vj = &(env->fpr[vj].vreg);
+
+    Vd->Q(0) = int128_makes64(Vj->D(0));
+}
+
+void HELPER(vextl_qu_du)(CPULoongArchState *env, uint32_t vd, uint32_t vj)
+{
+    VReg *Vd = &(env->fpr[vd].vreg);
+    VReg *Vj = &(env->fpr[vj].vreg);
+
+    Vd->Q(0) = int128_make64(Vj->D(0));
+}
+
+VSLLWIL(vsllwil_h_b, 16, H, B)
+VSLLWIL(vsllwil_w_h, 32, W, H)
+VSLLWIL(vsllwil_d_w, 64, D, W)
+VSLLWIL(vsllwil_hu_bu, 16, UH, UB)
+VSLLWIL(vsllwil_wu_hu, 32, UW, UH)
+VSLLWIL(vsllwil_du_wu, 64, UD, UW)
-- 
2.31.1


