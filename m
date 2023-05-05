Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9797A6F7B12
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 04:36:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pulCR-0005ra-5c; Thu, 04 May 2023 22:29:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1pulCN-0005h0-KL
 for qemu-devel@nongnu.org; Thu, 04 May 2023 22:29:31 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1pulCG-0000Gd-O1
 for qemu-devel@nongnu.org; Thu, 04 May 2023 22:29:31 -0400
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8Ax1ej3aVRk9_cEAA--.8210S3;
 Fri, 05 May 2023 10:29:11 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Bx8a+2aVRkNw9LAA--.7251S30; 
 Fri, 05 May 2023 10:29:08 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org
Subject: [PULL 28/45] target/loongarch: Implement vssrlrn vssrarn
Date: Fri,  5 May 2023 10:27:49 +0800
Message-Id: <20230505022806.6082-29-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230505022806.6082-1-gaosong@loongson.cn>
References: <20230505022806.6082-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Bx8a+2aVRkNw9LAA--.7251S30
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvAXoW3CFW5Cw47CF43tF1UGF1DAwb_yoW8CrWrto
 WfCa1UZay8GFy3urWj9ayrZ3s7ta48tw1DXrWDXrn8Kry8JFy29w15K34kta9YvFZIvry7
 Wa93ur45ta4ayr1kn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXasCq-sGcSsGvf
 J3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnRJU
 UUgK1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64
 kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY
 1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aV
 CY1x0267AKxVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x2
 6I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6x8ErcxFaVAv8VWrMcvjeVCFs4
 IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwIxGrwCF04k20xvE74AG
 Y7Cv6cx26rWl4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_Wrv_ZF1lx2IqxV
 Aqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1Y
 6r17MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Ar0_tr1lIxAIcVC0I7IYx2IY6x
 kF7I0E14v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAF
 wI0_Cr0_Gr1UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf
 9x0zRVWlkUUUUU=
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
- VSSRLRN.{B.H/H.W/W.D};
- VSSRARN.{B.H/H.W/W.D};
- VSSRLRN.{BU.H/HU.W/WU.D};
- VSSRARN.{BU.H/HU.W/WU.D};
- VSSRLRNI.{B.H/H.W/W.D/D.Q};
- VSSRARNI.{B.H/H.W/W.D/D.Q};
- VSSRLRNI.{BU.H/HU.W/WU.D/DU.Q};
- VSSRARNI.{BU.H/HU.W/WU.D/DU.Q}.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Song Gao <gaosong@loongson.cn>
Message-Id: <20230504122810.4094787-29-gaosong@loongson.cn>
---
 target/loongarch/disas.c                    |  30 ++
 target/loongarch/helper.h                   |  30 ++
 target/loongarch/insn_trans/trans_lsx.c.inc |  30 ++
 target/loongarch/insns.decode               |  30 ++
 target/loongarch/lsx_helper.c               | 358 ++++++++++++++++++++
 5 files changed, 478 insertions(+)

diff --git a/target/loongarch/disas.c b/target/loongarch/disas.c
index 426d30dc01..405e8885cd 100644
--- a/target/loongarch/disas.c
+++ b/target/loongarch/disas.c
@@ -1228,3 +1228,33 @@ INSN_LSX(vssrani_bu_h,     vv_i)
 INSN_LSX(vssrani_hu_w,     vv_i)
 INSN_LSX(vssrani_wu_d,     vv_i)
 INSN_LSX(vssrani_du_q,     vv_i)
+
+INSN_LSX(vssrlrn_b_h,      vvv)
+INSN_LSX(vssrlrn_h_w,      vvv)
+INSN_LSX(vssrlrn_w_d,      vvv)
+INSN_LSX(vssrarn_b_h,      vvv)
+INSN_LSX(vssrarn_h_w,      vvv)
+INSN_LSX(vssrarn_w_d,      vvv)
+INSN_LSX(vssrlrn_bu_h,     vvv)
+INSN_LSX(vssrlrn_hu_w,     vvv)
+INSN_LSX(vssrlrn_wu_d,     vvv)
+INSN_LSX(vssrarn_bu_h,     vvv)
+INSN_LSX(vssrarn_hu_w,     vvv)
+INSN_LSX(vssrarn_wu_d,     vvv)
+
+INSN_LSX(vssrlrni_b_h,     vv_i)
+INSN_LSX(vssrlrni_h_w,     vv_i)
+INSN_LSX(vssrlrni_w_d,     vv_i)
+INSN_LSX(vssrlrni_d_q,     vv_i)
+INSN_LSX(vssrlrni_bu_h,    vv_i)
+INSN_LSX(vssrlrni_hu_w,    vv_i)
+INSN_LSX(vssrlrni_wu_d,    vv_i)
+INSN_LSX(vssrlrni_du_q,    vv_i)
+INSN_LSX(vssrarni_b_h,     vv_i)
+INSN_LSX(vssrarni_h_w,     vv_i)
+INSN_LSX(vssrarni_w_d,     vv_i)
+INSN_LSX(vssrarni_d_q,     vv_i)
+INSN_LSX(vssrarni_bu_h,    vv_i)
+INSN_LSX(vssrarni_hu_w,    vv_i)
+INSN_LSX(vssrarni_wu_d,    vv_i)
+INSN_LSX(vssrarni_du_q,    vv_i)
diff --git a/target/loongarch/helper.h b/target/loongarch/helper.h
index 28f159768c..724112da81 100644
--- a/target/loongarch/helper.h
+++ b/target/loongarch/helper.h
@@ -441,3 +441,33 @@ DEF_HELPER_4(vssrani_bu_h, void, env, i32, i32, i32)
 DEF_HELPER_4(vssrani_hu_w, void, env, i32, i32, i32)
 DEF_HELPER_4(vssrani_wu_d, void, env, i32, i32, i32)
 DEF_HELPER_4(vssrani_du_q, void, env, i32, i32, i32)
+
+DEF_HELPER_4(vssrlrn_b_h, void, env, i32, i32, i32)
+DEF_HELPER_4(vssrlrn_h_w, void, env, i32, i32, i32)
+DEF_HELPER_4(vssrlrn_w_d, void, env, i32, i32, i32)
+DEF_HELPER_4(vssrarn_b_h, void, env, i32, i32, i32)
+DEF_HELPER_4(vssrarn_h_w, void, env, i32, i32, i32)
+DEF_HELPER_4(vssrarn_w_d, void, env, i32, i32, i32)
+DEF_HELPER_4(vssrlrn_bu_h, void, env, i32, i32, i32)
+DEF_HELPER_4(vssrlrn_hu_w, void, env, i32, i32, i32)
+DEF_HELPER_4(vssrlrn_wu_d, void, env, i32, i32, i32)
+DEF_HELPER_4(vssrarn_bu_h, void, env, i32, i32, i32)
+DEF_HELPER_4(vssrarn_hu_w, void, env, i32, i32, i32)
+DEF_HELPER_4(vssrarn_wu_d, void, env, i32, i32, i32)
+
+DEF_HELPER_4(vssrlrni_b_h, void, env, i32, i32, i32)
+DEF_HELPER_4(vssrlrni_h_w, void, env, i32, i32, i32)
+DEF_HELPER_4(vssrlrni_w_d, void, env, i32, i32, i32)
+DEF_HELPER_4(vssrlrni_d_q, void, env, i32, i32, i32)
+DEF_HELPER_4(vssrarni_b_h, void, env, i32, i32, i32)
+DEF_HELPER_4(vssrarni_h_w, void, env, i32, i32, i32)
+DEF_HELPER_4(vssrarni_w_d, void, env, i32, i32, i32)
+DEF_HELPER_4(vssrarni_d_q, void, env, i32, i32, i32)
+DEF_HELPER_4(vssrlrni_bu_h, void, env, i32, i32, i32)
+DEF_HELPER_4(vssrlrni_hu_w, void, env, i32, i32, i32)
+DEF_HELPER_4(vssrlrni_wu_d, void, env, i32, i32, i32)
+DEF_HELPER_4(vssrlrni_du_q, void, env, i32, i32, i32)
+DEF_HELPER_4(vssrarni_bu_h, void, env, i32, i32, i32)
+DEF_HELPER_4(vssrarni_hu_w, void, env, i32, i32, i32)
+DEF_HELPER_4(vssrarni_wu_d, void, env, i32, i32, i32)
+DEF_HELPER_4(vssrarni_du_q, void, env, i32, i32, i32)
diff --git a/target/loongarch/insn_trans/trans_lsx.c.inc b/target/loongarch/insn_trans/trans_lsx.c.inc
index 5d7e45a793..9c24cbc297 100644
--- a/target/loongarch/insn_trans/trans_lsx.c.inc
+++ b/target/loongarch/insn_trans/trans_lsx.c.inc
@@ -3067,3 +3067,33 @@ TRANS(vssrani_bu_h, gen_vv_i, gen_helper_vssrani_bu_h)
 TRANS(vssrani_hu_w, gen_vv_i, gen_helper_vssrani_hu_w)
 TRANS(vssrani_wu_d, gen_vv_i, gen_helper_vssrani_wu_d)
 TRANS(vssrani_du_q, gen_vv_i, gen_helper_vssrani_du_q)
+
+TRANS(vssrlrn_b_h, gen_vvv, gen_helper_vssrlrn_b_h)
+TRANS(vssrlrn_h_w, gen_vvv, gen_helper_vssrlrn_h_w)
+TRANS(vssrlrn_w_d, gen_vvv, gen_helper_vssrlrn_w_d)
+TRANS(vssrarn_b_h, gen_vvv, gen_helper_vssrarn_b_h)
+TRANS(vssrarn_h_w, gen_vvv, gen_helper_vssrarn_h_w)
+TRANS(vssrarn_w_d, gen_vvv, gen_helper_vssrarn_w_d)
+TRANS(vssrlrn_bu_h, gen_vvv, gen_helper_vssrlrn_bu_h)
+TRANS(vssrlrn_hu_w, gen_vvv, gen_helper_vssrlrn_hu_w)
+TRANS(vssrlrn_wu_d, gen_vvv, gen_helper_vssrlrn_wu_d)
+TRANS(vssrarn_bu_h, gen_vvv, gen_helper_vssrarn_bu_h)
+TRANS(vssrarn_hu_w, gen_vvv, gen_helper_vssrarn_hu_w)
+TRANS(vssrarn_wu_d, gen_vvv, gen_helper_vssrarn_wu_d)
+
+TRANS(vssrlrni_b_h, gen_vv_i, gen_helper_vssrlrni_b_h)
+TRANS(vssrlrni_h_w, gen_vv_i, gen_helper_vssrlrni_h_w)
+TRANS(vssrlrni_w_d, gen_vv_i, gen_helper_vssrlrni_w_d)
+TRANS(vssrlrni_d_q, gen_vv_i, gen_helper_vssrlrni_d_q)
+TRANS(vssrarni_b_h, gen_vv_i, gen_helper_vssrarni_b_h)
+TRANS(vssrarni_h_w, gen_vv_i, gen_helper_vssrarni_h_w)
+TRANS(vssrarni_w_d, gen_vv_i, gen_helper_vssrarni_w_d)
+TRANS(vssrarni_d_q, gen_vv_i, gen_helper_vssrarni_d_q)
+TRANS(vssrlrni_bu_h, gen_vv_i, gen_helper_vssrlrni_bu_h)
+TRANS(vssrlrni_hu_w, gen_vv_i, gen_helper_vssrlrni_hu_w)
+TRANS(vssrlrni_wu_d, gen_vv_i, gen_helper_vssrlrni_wu_d)
+TRANS(vssrlrni_du_q, gen_vv_i, gen_helper_vssrlrni_du_q)
+TRANS(vssrarni_bu_h, gen_vv_i, gen_helper_vssrarni_bu_h)
+TRANS(vssrarni_hu_w, gen_vv_i, gen_helper_vssrarni_hu_w)
+TRANS(vssrarni_wu_d, gen_vv_i, gen_helper_vssrarni_wu_d)
+TRANS(vssrarni_du_q, gen_vv_i, gen_helper_vssrarni_du_q)
diff --git a/target/loongarch/insns.decode b/target/loongarch/insns.decode
index 772c5cddfe..bb4b2a8632 100644
--- a/target/loongarch/insns.decode
+++ b/target/loongarch/insns.decode
@@ -929,3 +929,33 @@ vssrani_bu_h     0111 00110110 01000 1 .... ..... .....   @vv_ui4
 vssrani_hu_w     0111 00110110 01001 ..... ..... .....    @vv_ui5
 vssrani_wu_d     0111 00110110 0101 ...... ..... .....    @vv_ui6
 vssrani_du_q     0111 00110110 011 ....... ..... .....    @vv_ui7
+
+vssrlrn_b_h      0111 00010000 00001 ..... ..... .....    @vvv
+vssrlrn_h_w      0111 00010000 00010 ..... ..... .....    @vvv
+vssrlrn_w_d      0111 00010000 00011 ..... ..... .....    @vvv
+vssrarn_b_h      0111 00010000 00101 ..... ..... .....    @vvv
+vssrarn_h_w      0111 00010000 00110 ..... ..... .....    @vvv
+vssrarn_w_d      0111 00010000 00111 ..... ..... .....    @vvv
+vssrlrn_bu_h     0111 00010000 10001 ..... ..... .....    @vvv
+vssrlrn_hu_w     0111 00010000 10010 ..... ..... .....    @vvv
+vssrlrn_wu_d     0111 00010000 10011 ..... ..... .....    @vvv
+vssrarn_bu_h     0111 00010000 10101 ..... ..... .....    @vvv
+vssrarn_hu_w     0111 00010000 10110 ..... ..... .....    @vvv
+vssrarn_wu_d     0111 00010000 10111 ..... ..... .....    @vvv
+
+vssrlrni_b_h     0111 00110101 00000 1 .... ..... .....   @vv_ui4
+vssrlrni_h_w     0111 00110101 00001 ..... ..... .....    @vv_ui5
+vssrlrni_w_d     0111 00110101 0001 ...... ..... .....    @vv_ui6
+vssrlrni_d_q     0111 00110101 001 ....... ..... .....    @vv_ui7
+vssrarni_b_h     0111 00110110 10000 1 .... ..... .....   @vv_ui4
+vssrarni_h_w     0111 00110110 10001 ..... ..... .....    @vv_ui5
+vssrarni_w_d     0111 00110110 1001 ...... ..... .....    @vv_ui6
+vssrarni_d_q     0111 00110110 101 ....... ..... .....    @vv_ui7
+vssrlrni_bu_h    0111 00110101 01000 1 .... ..... .....   @vv_ui4
+vssrlrni_hu_w    0111 00110101 01001 ..... ..... .....    @vv_ui5
+vssrlrni_wu_d    0111 00110101 0101 ...... ..... .....    @vv_ui6
+vssrlrni_du_q    0111 00110101 011 ....... ..... .....    @vv_ui7
+vssrarni_bu_h    0111 00110110 11000 1 .... ..... .....   @vv_ui4
+vssrarni_hu_w    0111 00110110 11001 ..... ..... .....    @vv_ui5
+vssrarni_wu_d    0111 00110110 1101 ...... ..... .....    @vv_ui6
+vssrarni_du_q    0111 00110110 111 ....... ..... .....    @vv_ui7
diff --git a/target/loongarch/lsx_helper.c b/target/loongarch/lsx_helper.c
index c904332427..fb6f29c94d 100644
--- a/target/loongarch/lsx_helper.c
+++ b/target/loongarch/lsx_helper.c
@@ -1557,3 +1557,361 @@ void HELPER(vssrani_du_q)(CPULoongArchState *env,
 VSSRANUI(vssrani_bu_h, 16, B, H)
 VSSRANUI(vssrani_hu_w, 32, H, W)
 VSSRANUI(vssrani_wu_d, 64, W, D)
+
+#define SSRLRNS(E1, E2, T1, T2, T3)                \
+static T1 do_ssrlrns_ ## E1(T2 e2, int sa, int sh) \
+{                                                  \
+    T1 shft_res;                                   \
+                                                   \
+    shft_res = do_vsrlr_ ## E2(e2, sa);            \
+    T1 mask;                                       \
+    mask = (1ull << sh) -1;                        \
+    if (shft_res > mask) {                         \
+        return mask;                               \
+    } else {                                       \
+        return  shft_res;                          \
+    }                                              \
+}
+
+SSRLRNS(B, H, uint16_t, int16_t, uint8_t)
+SSRLRNS(H, W, uint32_t, int32_t, uint16_t)
+SSRLRNS(W, D, uint64_t, int64_t, uint32_t)
+
+#define VSSRLRN(NAME, BIT, T, E1, E2)                                         \
+void HELPER(NAME)(CPULoongArchState *env,                                     \
+                  uint32_t vd, uint32_t vj, uint32_t vk)                      \
+{                                                                             \
+    int i;                                                                    \
+    VReg *Vd = &(env->fpr[vd].vreg);                                          \
+    VReg *Vj = &(env->fpr[vj].vreg);                                          \
+    VReg *Vk = &(env->fpr[vk].vreg);                                          \
+                                                                              \
+    for (i = 0; i < LSX_LEN/BIT; i++) {                                       \
+        Vd->E1(i) = do_ssrlrns_ ## E1(Vj->E2(i), (T)Vk->E2(i)%BIT, BIT/2 -1); \
+    }                                                                         \
+    Vd->D(1) = 0;                                                             \
+}
+
+VSSRLRN(vssrlrn_b_h, 16, uint16_t, B, H)
+VSSRLRN(vssrlrn_h_w, 32, uint32_t, H, W)
+VSSRLRN(vssrlrn_w_d, 64, uint64_t, W, D)
+
+#define SSRARNS(E1, E2, T1, T2)                    \
+static T1 do_ssrarns_ ## E1(T1 e2, int sa, int sh) \
+{                                                  \
+    T1 shft_res;                                   \
+                                                   \
+    shft_res = do_vsrar_ ## E2(e2, sa);            \
+    T2 mask;                                       \
+    mask = (1ll << sh) -1;                         \
+    if (shft_res > mask) {                         \
+        return  mask;                              \
+    } else if (shft_res < -(mask +1)) {            \
+        return  ~mask;                             \
+    } else {                                       \
+        return shft_res;                           \
+    }                                              \
+}
+
+SSRARNS(B, H, int16_t, int8_t)
+SSRARNS(H, W, int32_t, int16_t)
+SSRARNS(W, D, int64_t, int32_t)
+
+#define VSSRARN(NAME, BIT, T, E1, E2)                                         \
+void HELPER(NAME)(CPULoongArchState *env,                                     \
+                  uint32_t vd, uint32_t vj, uint32_t vk)                      \
+{                                                                             \
+    int i;                                                                    \
+    VReg *Vd = &(env->fpr[vd].vreg);                                          \
+    VReg *Vj = &(env->fpr[vj].vreg);                                          \
+    VReg *Vk = &(env->fpr[vk].vreg);                                          \
+                                                                              \
+    for (i = 0; i < LSX_LEN/BIT; i++) {                                       \
+        Vd->E1(i) = do_ssrarns_ ## E1(Vj->E2(i), (T)Vk->E2(i)%BIT, BIT/2 -1); \
+    }                                                                         \
+    Vd->D(1) = 0;                                                             \
+}
+
+VSSRARN(vssrarn_b_h, 16, uint16_t, B, H)
+VSSRARN(vssrarn_h_w, 32, uint32_t, H, W)
+VSSRARN(vssrarn_w_d, 64, uint64_t, W, D)
+
+#define SSRLRNU(E1, E2, T1, T2, T3)                \
+static T1 do_ssrlrnu_ ## E1(T3 e2, int sa, int sh) \
+{                                                  \
+    T1 shft_res;                                   \
+                                                   \
+    shft_res = do_vsrlr_ ## E2(e2, sa);            \
+                                                   \
+    T2 mask;                                       \
+    mask = (1ull << sh) -1;                        \
+    if (shft_res > mask) {                         \
+        return mask;                               \
+    } else {                                       \
+        return shft_res;                           \
+    }                                              \
+}
+
+SSRLRNU(B, H, uint16_t, uint8_t, int16_t)
+SSRLRNU(H, W, uint32_t, uint16_t, int32_t)
+SSRLRNU(W, D, uint64_t, uint32_t, int64_t)
+
+#define VSSRLRNU(NAME, BIT, T, E1, E2)                                     \
+void HELPER(NAME)(CPULoongArchState *env,                                  \
+                  uint32_t vd, uint32_t vj, uint32_t vk)                   \
+{                                                                          \
+    int i;                                                                 \
+    VReg *Vd = &(env->fpr[vd].vreg);                                       \
+    VReg *Vj = &(env->fpr[vj].vreg);                                       \
+    VReg *Vk = &(env->fpr[vk].vreg);                                       \
+                                                                           \
+    for (i = 0; i < LSX_LEN/BIT; i++) {                                    \
+        Vd->E1(i) = do_ssrlrnu_ ## E1(Vj->E2(i), (T)Vk->E2(i)%BIT, BIT/2); \
+    }                                                                      \
+    Vd->D(1) = 0;                                                          \
+}
+
+VSSRLRNU(vssrlrn_bu_h, 16, uint16_t, B, H)
+VSSRLRNU(vssrlrn_hu_w, 32, uint32_t, H, W)
+VSSRLRNU(vssrlrn_wu_d, 64, uint64_t, W, D)
+
+#define SSRARNU(E1, E2, T1, T2, T3)                \
+static T1 do_ssrarnu_ ## E1(T3 e2, int sa, int sh) \
+{                                                  \
+    T1 shft_res;                                   \
+                                                   \
+    if (e2 < 0) {                                  \
+        shft_res = 0;                              \
+    } else {                                       \
+        shft_res = do_vsrar_ ## E2(e2, sa);        \
+    }                                              \
+    T2 mask;                                       \
+    mask = (1ull << sh) -1;                        \
+    if (shft_res > mask) {                         \
+        return mask;                               \
+    } else {                                       \
+        return shft_res;                           \
+    }                                              \
+}
+
+SSRARNU(B, H, uint16_t, uint8_t, int16_t)
+SSRARNU(H, W, uint32_t, uint16_t, int32_t)
+SSRARNU(W, D, uint64_t, uint32_t, int64_t)
+
+#define VSSRARNU(NAME, BIT, T, E1, E2)                                     \
+void HELPER(NAME)(CPULoongArchState *env,                                  \
+                  uint32_t vd, uint32_t vj, uint32_t vk)                   \
+{                                                                          \
+    int i;                                                                 \
+    VReg *Vd = &(env->fpr[vd].vreg);                                       \
+    VReg *Vj = &(env->fpr[vj].vreg);                                       \
+    VReg *Vk = &(env->fpr[vk].vreg);                                       \
+                                                                           \
+    for (i = 0; i < LSX_LEN/BIT; i++) {                                    \
+        Vd->E1(i) = do_ssrarnu_ ## E1(Vj->E2(i), (T)Vk->E2(i)%BIT, BIT/2); \
+    }                                                                      \
+    Vd->D(1) = 0;                                                          \
+}
+
+VSSRARNU(vssrarn_bu_h, 16, uint16_t, B, H)
+VSSRARNU(vssrarn_hu_w, 32, uint32_t, H, W)
+VSSRARNU(vssrarn_wu_d, 64, uint64_t, W, D)
+
+#define VSSRLRNI(NAME, BIT, E1, E2)                                            \
+void HELPER(NAME)(CPULoongArchState *env,                                      \
+                  uint32_t vd, uint32_t vj, uint32_t imm)                      \
+{                                                                              \
+    int i;                                                                     \
+    VReg temp;                                                                 \
+    VReg *Vd = &(env->fpr[vd].vreg);                                           \
+    VReg *Vj = &(env->fpr[vj].vreg);                                           \
+                                                                               \
+    for (i = 0; i < LSX_LEN/BIT; i++) {                                        \
+        temp.E1(i) = do_ssrlrns_ ## E1(Vj->E2(i), imm, BIT/2 -1);              \
+        temp.E1(i + LSX_LEN/BIT) = do_ssrlrns_ ## E1(Vd->E2(i), imm, BIT/2 -1);\
+    }                                                                          \
+    *Vd = temp;                                                                \
+}
+
+#define VSSRLRNI_Q(NAME, sh)                                               \
+void HELPER(NAME)(CPULoongArchState *env,                                  \
+                          uint32_t vd, uint32_t vj, uint32_t imm)          \
+{                                                                          \
+    Int128 shft_res1, shft_res2, mask, r1, r2;                             \
+    VReg *Vd = &(env->fpr[vd].vreg);                                       \
+    VReg *Vj = &(env->fpr[vj].vreg);                                       \
+                                                                           \
+    if (imm == 0) {                                                        \
+        shft_res1 = Vj->Q(0);                                              \
+        shft_res2 = Vd->Q(0);                                              \
+    } else {                                                               \
+        r1 = int128_and(int128_urshift(Vj->Q(0), (imm -1)), int128_one()); \
+        r2 = int128_and(int128_urshift(Vd->Q(0), (imm -1)), int128_one()); \
+                                                                           \
+        shft_res1 = (int128_add(int128_urshift(Vj->Q(0), imm), r1));       \
+        shft_res2 = (int128_add(int128_urshift(Vd->Q(0), imm), r2));       \
+    }                                                                      \
+                                                                           \
+    mask = int128_sub(int128_lshift(int128_one(), sh), int128_one());      \
+                                                                           \
+    if (int128_ult(mask, shft_res1)) {                                     \
+        Vd->D(0) = int128_getlo(mask);                                     \
+    }else {                                                                \
+        Vd->D(0) = int128_getlo(shft_res1);                                \
+    }                                                                      \
+                                                                           \
+    if (int128_ult(mask, shft_res2)) {                                     \
+        Vd->D(1) = int128_getlo(mask);                                     \
+    }else {                                                                \
+        Vd->D(1) = int128_getlo(shft_res2);                                \
+    }                                                                      \
+}
+
+VSSRLRNI(vssrlrni_b_h, 16, B, H)
+VSSRLRNI(vssrlrni_h_w, 32, H, W)
+VSSRLRNI(vssrlrni_w_d, 64, W, D)
+VSSRLRNI_Q(vssrlrni_d_q, 63)
+
+#define VSSRARNI(NAME, BIT, E1, E2)                                             \
+void HELPER(NAME)(CPULoongArchState *env,                                       \
+                  uint32_t vd, uint32_t vj, uint32_t imm)                       \
+{                                                                               \
+    int i;                                                                      \
+    VReg temp;                                                                  \
+    VReg *Vd = &(env->fpr[vd].vreg);                                            \
+    VReg *Vj = &(env->fpr[vj].vreg);                                            \
+                                                                                \
+    for (i = 0; i < LSX_LEN/BIT; i++) {                                         \
+        temp.E1(i) = do_ssrarns_ ## E1(Vj->E2(i), imm, BIT/2 -1);               \
+        temp.E1(i + LSX_LEN/BIT) = do_ssrarns_ ## E1(Vd->E2(i), imm, BIT/2 -1); \
+    }                                                                           \
+    *Vd = temp;                                                                 \
+}
+
+void HELPER(vssrarni_d_q)(CPULoongArchState *env,
+                          uint32_t vd, uint32_t vj, uint32_t imm)
+{
+    Int128 shft_res1, shft_res2, mask1, mask2, r1, r2;
+    VReg *Vd = &(env->fpr[vd].vreg);
+    VReg *Vj = &(env->fpr[vj].vreg);
+
+    if (imm == 0) {
+        shft_res1 = Vj->Q(0);
+        shft_res2 = Vd->Q(0);
+    } else {
+        r1 = int128_and(int128_rshift(Vj->Q(0), (imm -1)), int128_one());
+        r2 = int128_and(int128_rshift(Vd->Q(0), (imm -1)), int128_one());
+
+        shft_res1 = int128_add(int128_rshift(Vj->Q(0), imm), r1);
+        shft_res2 = int128_add(int128_rshift(Vd->Q(0), imm), r2);
+    }
+
+    mask1 = int128_sub(int128_lshift(int128_one(), 63), int128_one());
+    mask2  = int128_lshift(int128_one(), 63);
+
+    if (int128_gt(shft_res1,  mask1)) {
+        Vd->D(0) = int128_getlo(mask1);
+    } else if (int128_lt(shft_res1, int128_neg(mask2))) {
+        Vd->D(0) = int128_getlo(mask2);
+    } else {
+        Vd->D(0) = int128_getlo(shft_res1);
+    }
+
+    if (int128_gt(shft_res2, mask1)) {
+        Vd->D(1) = int128_getlo(mask1);
+    } else if (int128_lt(shft_res2, int128_neg(mask2))) {
+        Vd->D(1) = int128_getlo(mask2);
+    } else {
+        Vd->D(1) = int128_getlo(shft_res2);
+    }
+}
+
+VSSRARNI(vssrarni_b_h, 16, B, H)
+VSSRARNI(vssrarni_h_w, 32, H, W)
+VSSRARNI(vssrarni_w_d, 64, W, D)
+
+#define VSSRLRNUI(NAME, BIT, E1, E2)                                         \
+void HELPER(NAME)(CPULoongArchState *env,                                    \
+                  uint32_t vd, uint32_t vj, uint32_t imm)                    \
+{                                                                            \
+    int i;                                                                   \
+    VReg temp;                                                               \
+    VReg *Vd = &(env->fpr[vd].vreg);                                         \
+    VReg *Vj = &(env->fpr[vj].vreg);                                         \
+                                                                             \
+    for (i = 0; i < LSX_LEN/BIT; i++) {                                      \
+        temp.E1(i) = do_ssrlrnu_ ## E1(Vj->E2(i), imm, BIT/2);               \
+        temp.E1(i + LSX_LEN/BIT) = do_ssrlrnu_ ## E1(Vd->E2(i), imm, BIT/2); \
+    }                                                                        \
+    *Vd = temp;                                                              \
+}
+
+VSSRLRNUI(vssrlrni_bu_h, 16, B, H)
+VSSRLRNUI(vssrlrni_hu_w, 32, H, W)
+VSSRLRNUI(vssrlrni_wu_d, 64, W, D)
+VSSRLRNI_Q(vssrlrni_du_q, 64)
+
+#define VSSRARNUI(NAME, BIT, E1, E2)                                         \
+void HELPER(NAME)(CPULoongArchState *env,                                    \
+                  uint32_t vd, uint32_t vj, uint32_t imm)                    \
+{                                                                            \
+    int i;                                                                   \
+    VReg temp;                                                               \
+    VReg *Vd = &(env->fpr[vd].vreg);                                         \
+    VReg *Vj = &(env->fpr[vj].vreg);                                         \
+                                                                             \
+    for (i = 0; i < LSX_LEN/BIT; i++) {                                      \
+        temp.E1(i) = do_ssrarnu_ ## E1(Vj->E2(i), imm, BIT/2);               \
+        temp.E1(i + LSX_LEN/BIT) = do_ssrarnu_ ## E1(Vd->E2(i), imm, BIT/2); \
+    }                                                                        \
+    *Vd = temp;                                                              \
+}
+
+void HELPER(vssrarni_du_q)(CPULoongArchState *env,
+                           uint32_t vd, uint32_t vj, uint32_t imm)
+{
+    Int128 shft_res1, shft_res2, mask1, mask2, r1, r2;
+    VReg *Vd = &(env->fpr[vd].vreg);
+    VReg *Vj = &(env->fpr[vj].vreg);
+
+    if (imm == 0) {
+        shft_res1 = Vj->Q(0);
+        shft_res2 = Vd->Q(0);
+    } else {
+        r1 = int128_and(int128_rshift(Vj->Q(0), (imm -1)), int128_one());
+        r2 = int128_and(int128_rshift(Vd->Q(0), (imm -1)), int128_one());
+
+        shft_res1 = int128_add(int128_rshift(Vj->Q(0), imm), r1);
+        shft_res2 = int128_add(int128_rshift(Vd->Q(0), imm), r2);
+    }
+
+    if (int128_lt(Vj->Q(0), int128_zero())) {
+        shft_res1 = int128_zero();
+    }
+    if (int128_lt(Vd->Q(0), int128_zero())) {
+        shft_res2 = int128_zero();
+    }
+
+    mask1 = int128_sub(int128_lshift(int128_one(), 64), int128_one());
+    mask2  = int128_lshift(int128_one(), 64);
+
+    if (int128_gt(shft_res1,  mask1)) {
+        Vd->D(0) = int128_getlo(mask1);
+    } else if (int128_lt(shft_res1, int128_neg(mask2))) {
+        Vd->D(0) = int128_getlo(mask2);
+    } else {
+        Vd->D(0) = int128_getlo(shft_res1);
+    }
+
+    if (int128_gt(shft_res2, mask1)) {
+        Vd->D(1) = int128_getlo(mask1);
+    } else if (int128_lt(shft_res2, int128_neg(mask2))) {
+        Vd->D(1) = int128_getlo(mask2);
+    } else {
+        Vd->D(1) = int128_getlo(shft_res2);
+    }
+}
+
+VSSRARNUI(vssrarni_bu_h, 16, B, H)
+VSSRARNUI(vssrarni_hu_w, 32, H, W)
+VSSRARNUI(vssrarni_wu_d, 64, W, D)
-- 
2.31.1


