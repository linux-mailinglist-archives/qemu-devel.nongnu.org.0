Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F7EE6CB486
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 05:09:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgzgz-0002C2-0v; Mon, 27 Mar 2023 23:08:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1pgzgu-0001hR-4S
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 23:08:08 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1pgzgq-0001tY-5w
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 23:08:07 -0400
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8CxidnCWSJkatoSAA--.17222S3;
 Tue, 28 Mar 2023 11:06:42 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Dxyr24WSJkZukOAA--.10252S21; 
 Tue, 28 Mar 2023 11:06:41 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org
Subject: [RFC PATCH v2 19/44] target/loongarch: Implement vexth
Date: Tue, 28 Mar 2023 11:06:06 +0800
Message-Id: <20230328030631.3117129-20-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230328030631.3117129-1-gaosong@loongson.cn>
References: <20230328030631.3117129-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Dxyr24WSJkZukOAA--.10252S21
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoWxKryUAF15KrWfJr1kJF4ktFb_yoW7ZFy3pF
 42kFy3Gw48tFZ7WFnavw45Ja17Xrn7Kw4jva13Ka4kZayUJFnxXFy8ta9FgFWUXa95ZFy0
 g3W3AryYya4Fq37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bnxFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4
 AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF
 7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7
 CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2
 zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VCjz48v1sIEY20_WwAm72CE4IkC6x
 0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxF
 aVAv8VWrMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxV
 Cjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUXVWUAwCIc40Y0x0EwIxGrwCI42IY
 6xIIjxv20xvE14v26ryj6F1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6x
 AIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY
 1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7xRE6wZ7UUUUU==
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
- VEXTH.{H.B/W.H/D.W/Q.D};
- VEXTH.{HU.BU/WU.HU/DU.WU/QU.DU}.

Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 target/loongarch/disas.c                    |  9 ++++++
 target/loongarch/helper.h                   |  9 ++++++
 target/loongarch/insn_trans/trans_lsx.c.inc | 20 ++++++++++++
 target/loongarch/insns.decode               |  9 ++++++
 target/loongarch/lsx_helper.c               | 35 +++++++++++++++++++++
 5 files changed, 82 insertions(+)

diff --git a/target/loongarch/disas.c b/target/loongarch/disas.c
index b04aefe3ed..412c1cedcb 100644
--- a/target/loongarch/disas.c
+++ b/target/loongarch/disas.c
@@ -1070,3 +1070,12 @@ INSN_LSX(vsat_bu,          vv_i)
 INSN_LSX(vsat_hu,          vv_i)
 INSN_LSX(vsat_wu,          vv_i)
 INSN_LSX(vsat_du,          vv_i)
+
+INSN_LSX(vexth_h_b,        vv)
+INSN_LSX(vexth_w_h,        vv)
+INSN_LSX(vexth_d_w,        vv)
+INSN_LSX(vexth_q_d,        vv)
+INSN_LSX(vexth_hu_bu,      vv)
+INSN_LSX(vexth_wu_hu,      vv)
+INSN_LSX(vexth_du_wu,      vv)
+INSN_LSX(vexth_qu_du,      vv)
diff --git a/target/loongarch/helper.h b/target/loongarch/helper.h
index 6345b7ef9c..0876aa3331 100644
--- a/target/loongarch/helper.h
+++ b/target/loongarch/helper.h
@@ -344,3 +344,12 @@ DEF_HELPER_FLAGS_4(vsat_bu, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
 DEF_HELPER_FLAGS_4(vsat_hu, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
 DEF_HELPER_FLAGS_4(vsat_wu, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
 DEF_HELPER_FLAGS_4(vsat_du, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
+
+DEF_HELPER_3(vexth_h_b, void, env, i32, i32)
+DEF_HELPER_3(vexth_w_h, void, env, i32, i32)
+DEF_HELPER_3(vexth_d_w, void, env, i32, i32)
+DEF_HELPER_3(vexth_q_d, void, env, i32, i32)
+DEF_HELPER_3(vexth_hu_bu, void, env, i32, i32)
+DEF_HELPER_3(vexth_wu_hu, void, env, i32, i32)
+DEF_HELPER_3(vexth_du_wu, void, env, i32, i32)
+DEF_HELPER_3(vexth_qu_du, void, env, i32, i32)
diff --git a/target/loongarch/insn_trans/trans_lsx.c.inc b/target/loongarch/insn_trans/trans_lsx.c.inc
index 7dfb3b33f6..f6058c1360 100644
--- a/target/loongarch/insn_trans/trans_lsx.c.inc
+++ b/target/loongarch/insn_trans/trans_lsx.c.inc
@@ -28,6 +28,17 @@ static bool gen_vvv(DisasContext *ctx, arg_vvv *a,
     return true;
 }
 
+static bool gen_vv(DisasContext *ctx, arg_vv *a,
+                   void (*func)(TCGv_ptr, TCGv_i32, TCGv_i32))
+{
+    TCGv_i32 vd = tcg_constant_i32(a->vd);
+    TCGv_i32 vj = tcg_constant_i32(a->vj);
+
+    CHECK_SXE;
+    func(cpu_env, vd, vj);
+    return true;
+}
+
 static bool gvec_vvv(DisasContext *ctx, arg_vvv *a, MemOp mop,
                      void (*func)(unsigned, uint32_t, uint32_t,
                                   uint32_t, uint32_t, uint32_t))
@@ -2487,3 +2498,12 @@ TRANS(vsat_bu, gvec_vv_i, MO_8, do_vsat_u)
 TRANS(vsat_hu, gvec_vv_i, MO_16, do_vsat_u)
 TRANS(vsat_wu, gvec_vv_i, MO_32, do_vsat_u)
 TRANS(vsat_du, gvec_vv_i, MO_64, do_vsat_u)
+
+TRANS(vexth_h_b, gen_vv, gen_helper_vexth_h_b)
+TRANS(vexth_w_h, gen_vv, gen_helper_vexth_w_h)
+TRANS(vexth_d_w, gen_vv, gen_helper_vexth_d_w)
+TRANS(vexth_q_d, gen_vv, gen_helper_vexth_q_d)
+TRANS(vexth_hu_bu, gen_vv, gen_helper_vexth_hu_bu)
+TRANS(vexth_wu_hu, gen_vv, gen_helper_vexth_wu_hu)
+TRANS(vexth_du_wu, gen_vv, gen_helper_vexth_du_wu)
+TRANS(vexth_qu_du, gen_vv, gen_helper_vexth_qu_du)
diff --git a/target/loongarch/insns.decode b/target/loongarch/insns.decode
index 3ed61b3d68..39c582d098 100644
--- a/target/loongarch/insns.decode
+++ b/target/loongarch/insns.decode
@@ -769,3 +769,12 @@ vsat_bu          0111 00110010 10000 01 ... ..... .....   @vv_ui3
 vsat_hu          0111 00110010 10000 1 .... ..... .....   @vv_ui4
 vsat_wu          0111 00110010 10001 ..... ..... .....    @vv_ui5
 vsat_du          0111 00110010 1001 ...... ..... .....    @vv_ui6
+
+vexth_h_b        0111 00101001 11101 11000 ..... .....    @vv
+vexth_w_h        0111 00101001 11101 11001 ..... .....    @vv
+vexth_d_w        0111 00101001 11101 11010 ..... .....    @vv
+vexth_q_d        0111 00101001 11101 11011 ..... .....    @vv
+vexth_hu_bu      0111 00101001 11101 11100 ..... .....    @vv
+vexth_wu_hu      0111 00101001 11101 11101 ..... .....    @vv
+vexth_du_wu      0111 00101001 11101 11110 ..... .....    @vv
+vexth_qu_du      0111 00101001 11101 11111 ..... .....    @vv
diff --git a/target/loongarch/lsx_helper.c b/target/loongarch/lsx_helper.c
index 15efc64e4e..9a0b358576 100644
--- a/target/loongarch/lsx_helper.c
+++ b/target/loongarch/lsx_helper.c
@@ -836,3 +836,38 @@ VSAT_U(vsat_bu, 8, uint8_t, B)
 VSAT_U(vsat_hu, 16, uint16_t, H)
 VSAT_U(vsat_wu, 32, uint32_t, W)
 VSAT_U(vsat_du, 64, uint64_t, D)
+
+#define VEXTH(NAME, BIT, T1, T2, E1, E2)                            \
+void HELPER(NAME)(CPULoongArchState *env, uint32_t vd, uint32_t vj) \
+{                                                                   \
+    int i;                                                          \
+    VReg *Vd = &(env->fpr[vd].vreg);                                \
+    VReg *Vj = &(env->fpr[vj].vreg);                                \
+                                                                    \
+    for (i = 0; i < LSX_LEN/BIT; i++) {                             \
+        Vd->E1(i) = (T2)(T1)Vj->E2(i + LSX_LEN/BIT);                \
+    }                                                               \
+}
+
+void HELPER(vexth_q_d)(CPULoongArchState *env, uint32_t vd, uint32_t vj)
+{
+    VReg *Vd = &(env->fpr[vd].vreg);
+    VReg *Vj = &(env->fpr[vj].vreg);
+
+    Vd->Q(0) = int128_makes64(Vj->D(1));
+}
+
+void HELPER(vexth_qu_du)(CPULoongArchState *env, uint32_t vd, uint32_t vj)
+{
+    VReg *Vd = &(env->fpr[vd].vreg);
+    VReg *Vj = &(env->fpr[vj].vreg);
+
+    Vd->Q(0) = int128_make64((uint64_t)Vj->D(1));
+}
+
+VEXTH(vexth_h_b, 16, int16_t, int8_t, H, B)
+VEXTH(vexth_w_h, 32, int32_t, int16_t, W, H)
+VEXTH(vexth_d_w, 64, int64_t, int32_t, D, W)
+VEXTH(vexth_hu_bu, 16, uint16_t, uint8_t, H, B)
+VEXTH(vexth_wu_hu, 32, uint32_t, uint16_t, W, H)
+VEXTH(vexth_du_wu, 64, uint64_t, uint32_t, D, W)
-- 
2.31.1


