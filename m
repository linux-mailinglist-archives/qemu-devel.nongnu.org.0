Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C46036EDC2A
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 09:07:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prChz-0001PB-6q; Tue, 25 Apr 2023 03:03:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1prChu-0001Mc-VT
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 03:03:23 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1prChs-00085f-KQ
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 03:03:22 -0400
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8Bx5egre0dkiF8AAA--.725S3;
 Tue, 25 Apr 2023 15:03:07 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Cxeb0Ye0dk3Eo6AA--.4591S20; 
 Tue, 25 Apr 2023 15:03:06 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	gaosong@loongson.cn
Subject: [RFC PATCH v4 18/44] target/loongarch: Implement vexth
Date: Tue, 25 Apr 2023 15:02:22 +0800
Message-Id: <20230425070248.2550028-19-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230425070248.2550028-1-gaosong@loongson.cn>
References: <20230425070248.2550028-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Cxeb0Ye0dk3Eo6AA--.4591S20
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoW3Wr48XFWfur1kKrWDuF17Wrg_yoW7Cw1xpF
 42kry3Kw48JFZ7W3Za9w45Aa17Xrs3Kw4jva1fK3WkuayUJFnxXFyktayqgFWUXa95ZFy0
 g3W3AryYyasYq37anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
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
- VEXTH.{H.B/W.H/D.W/Q.D};
- VEXTH.{HU.BU/WU.HU/DU.WU/QU.DU}.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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
index d2b1c9f2a4..005988be25 100644
--- a/target/loongarch/helper.h
+++ b/target/loongarch/helper.h
@@ -329,3 +329,12 @@ DEF_HELPER_FLAGS_4(vsat_bu, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
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
index b8f05c66a5..93ae76bc4c 100644
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
@@ -2794,3 +2805,12 @@ TRANS(vsat_bu, gvec_vv_i, MO_8, do_vsat_u)
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
index 9ba16ac631..b4582a49d9 100644
--- a/target/loongarch/lsx_helper.c
+++ b/target/loongarch/lsx_helper.c
@@ -627,3 +627,38 @@ VSAT_U(vsat_bu, 8, UB)
 VSAT_U(vsat_hu, 16, UH)
 VSAT_U(vsat_wu, 32, UW)
 VSAT_U(vsat_du, 64, UD)
+
+#define VEXTH(NAME, BIT, E1, E2)                                    \
+void HELPER(NAME)(CPULoongArchState *env, uint32_t vd, uint32_t vj) \
+{                                                                   \
+    int i;                                                          \
+    VReg *Vd = &(env->fpr[vd].vreg);                                \
+    VReg *Vj = &(env->fpr[vj].vreg);                                \
+                                                                    \
+    for (i = 0; i < LSX_LEN/BIT; i++) {                             \
+        Vd->E1(i) = Vj->E2(i + LSX_LEN/BIT);                        \
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
+VEXTH(vexth_h_b, 16, H, B)
+VEXTH(vexth_w_h, 32, W, H)
+VEXTH(vexth_d_w, 64, D, W)
+VEXTH(vexth_hu_bu, 16, UH, UB)
+VEXTH(vexth_wu_hu, 32, UW, UH)
+VEXTH(vexth_du_wu, 64, UD, UW)
-- 
2.31.1


