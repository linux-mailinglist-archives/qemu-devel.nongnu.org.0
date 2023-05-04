Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E516F6C1C
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 14:38:04 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puY4h-0001j2-Ro; Thu, 04 May 2023 08:28:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1puY4g-0001ho-Ke
 for qemu-devel@nongnu.org; Thu, 04 May 2023 08:28:42 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1puY4d-00031j-5j
 for qemu-devel@nongnu.org; Thu, 04 May 2023 08:28:42 -0400
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8Cx9ejppFNkt6AEAA--.7590S3;
 Thu, 04 May 2023 20:28:25 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Cx77PapFNk1uxJAA--.5674S28; 
 Thu, 04 May 2023 20:28:24 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	gaosong@loongson.cn
Subject: [PATCH v5 26/44] target/loongarch: Implement vsrlrn vsrarn
Date: Thu,  4 May 2023 20:27:52 +0800
Message-Id: <20230504122810.4094787-27-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230504122810.4094787-1-gaosong@loongson.cn>
References: <20230504122810.4094787-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Cx77PapFNk1uxJAA--.5674S28
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoWxKFW3Aw13Cr17KFyxXF4xZwb_yoWfAF13pa
 yIkryYgr4xJFWxXwnavasIyw4qqr4DKw1fWw13Jry8Wr4UAFnaqr1vq3y29F43u3ZxXF1F
 ga43C347JFyrJwUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bn8Fc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4
 AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF
 7I0E14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x
 0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCF
 FI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VCjz48v1sIEY20_WwAm72CE4IkC6x0Yz7
 v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv
 8VWrMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7
 xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUXVWUAwCIc40Y0x0EwIxGrwCI42IY6xII
 jxv20xvE14v26F1j6w1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1lIxAIcVCF04
 k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26F4j6r4UJwCI42IY6I8E87Iv6xkF
 7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvj4RC_MaUUUUU
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
- VSRLRN.{B.H/H.W/W.D};
- VSRARN.{B.H/H.W/W.D};
- VSRLRNI.{B.H/H.W/W.D/D.Q};
- VSRARNI.{B.H/H.W/W.D/D.Q}.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 target/loongarch/disas.c                    |  16 +++
 target/loongarch/helper.h                   |  16 +++
 target/loongarch/insn_trans/trans_lsx.c.inc |  16 +++
 target/loongarch/insns.decode               |  16 +++
 target/loongarch/lsx_helper.c               | 126 ++++++++++++++++++++
 5 files changed, 190 insertions(+)

diff --git a/target/loongarch/disas.c b/target/loongarch/disas.c
index f0fc2ff84b..185cd36381 100644
--- a/target/loongarch/disas.c
+++ b/target/loongarch/disas.c
@@ -1182,3 +1182,19 @@ INSN_LSX(vsrani_b_h,       vv_i)
 INSN_LSX(vsrani_h_w,       vv_i)
 INSN_LSX(vsrani_w_d,       vv_i)
 INSN_LSX(vsrani_d_q,       vv_i)
+
+INSN_LSX(vsrlrn_b_h,       vvv)
+INSN_LSX(vsrlrn_h_w,       vvv)
+INSN_LSX(vsrlrn_w_d,       vvv)
+INSN_LSX(vsrarn_b_h,       vvv)
+INSN_LSX(vsrarn_h_w,       vvv)
+INSN_LSX(vsrarn_w_d,       vvv)
+
+INSN_LSX(vsrlrni_b_h,      vv_i)
+INSN_LSX(vsrlrni_h_w,      vv_i)
+INSN_LSX(vsrlrni_w_d,      vv_i)
+INSN_LSX(vsrlrni_d_q,      vv_i)
+INSN_LSX(vsrarni_b_h,      vv_i)
+INSN_LSX(vsrarni_h_w,      vv_i)
+INSN_LSX(vsrarni_w_d,      vv_i)
+INSN_LSX(vsrarni_d_q,      vv_i)
diff --git a/target/loongarch/helper.h b/target/loongarch/helper.h
index afe7e3d2d0..0a8cfe3625 100644
--- a/target/loongarch/helper.h
+++ b/target/loongarch/helper.h
@@ -395,3 +395,19 @@ DEF_HELPER_4(vsrani_b_h, void, env, i32, i32, i32)
 DEF_HELPER_4(vsrani_h_w, void, env, i32, i32, i32)
 DEF_HELPER_4(vsrani_w_d, void, env, i32, i32, i32)
 DEF_HELPER_4(vsrani_d_q, void, env, i32, i32, i32)
+
+DEF_HELPER_4(vsrlrn_b_h, void, env, i32, i32, i32)
+DEF_HELPER_4(vsrlrn_h_w, void, env, i32, i32, i32)
+DEF_HELPER_4(vsrlrn_w_d, void, env, i32, i32, i32)
+DEF_HELPER_4(vsrarn_b_h, void, env, i32, i32, i32)
+DEF_HELPER_4(vsrarn_h_w, void, env, i32, i32, i32)
+DEF_HELPER_4(vsrarn_w_d, void, env, i32, i32, i32)
+
+DEF_HELPER_4(vsrlrni_b_h, void, env, i32, i32, i32)
+DEF_HELPER_4(vsrlrni_h_w, void, env, i32, i32, i32)
+DEF_HELPER_4(vsrlrni_w_d, void, env, i32, i32, i32)
+DEF_HELPER_4(vsrlrni_d_q, void, env, i32, i32, i32)
+DEF_HELPER_4(vsrarni_b_h, void, env, i32, i32, i32)
+DEF_HELPER_4(vsrarni_h_w, void, env, i32, i32, i32)
+DEF_HELPER_4(vsrarni_w_d, void, env, i32, i32, i32)
+DEF_HELPER_4(vsrarni_d_q, void, env, i32, i32, i32)
diff --git a/target/loongarch/insn_trans/trans_lsx.c.inc b/target/loongarch/insn_trans/trans_lsx.c.inc
index ad34378ada..6034a74bfb 100644
--- a/target/loongarch/insn_trans/trans_lsx.c.inc
+++ b/target/loongarch/insn_trans/trans_lsx.c.inc
@@ -3021,3 +3021,19 @@ TRANS(vsrani_b_h, gen_vv_i, gen_helper_vsrani_b_h)
 TRANS(vsrani_h_w, gen_vv_i, gen_helper_vsrani_h_w)
 TRANS(vsrani_w_d, gen_vv_i, gen_helper_vsrani_w_d)
 TRANS(vsrani_d_q, gen_vv_i, gen_helper_vsrani_d_q)
+
+TRANS(vsrlrn_b_h, gen_vvv, gen_helper_vsrlrn_b_h)
+TRANS(vsrlrn_h_w, gen_vvv, gen_helper_vsrlrn_h_w)
+TRANS(vsrlrn_w_d, gen_vvv, gen_helper_vsrlrn_w_d)
+TRANS(vsrarn_b_h, gen_vvv, gen_helper_vsrarn_b_h)
+TRANS(vsrarn_h_w, gen_vvv, gen_helper_vsrarn_h_w)
+TRANS(vsrarn_w_d, gen_vvv, gen_helper_vsrarn_w_d)
+
+TRANS(vsrlrni_b_h, gen_vv_i, gen_helper_vsrlrni_b_h)
+TRANS(vsrlrni_h_w, gen_vv_i, gen_helper_vsrlrni_h_w)
+TRANS(vsrlrni_w_d, gen_vv_i, gen_helper_vsrlrni_w_d)
+TRANS(vsrlrni_d_q, gen_vv_i, gen_helper_vsrlrni_d_q)
+TRANS(vsrarni_b_h, gen_vv_i, gen_helper_vsrarni_b_h)
+TRANS(vsrarni_h_w, gen_vv_i, gen_helper_vsrarni_h_w)
+TRANS(vsrarni_w_d, gen_vv_i, gen_helper_vsrarni_w_d)
+TRANS(vsrarni_d_q, gen_vv_i, gen_helper_vsrarni_d_q)
diff --git a/target/loongarch/insns.decode b/target/loongarch/insns.decode
index ee54b632a7..29bf4a8a6a 100644
--- a/target/loongarch/insns.decode
+++ b/target/loongarch/insns.decode
@@ -883,3 +883,19 @@ vsrani_b_h       0111 00110101 10000 1 .... ..... .....   @vv_ui4
 vsrani_h_w       0111 00110101 10001 ..... ..... .....    @vv_ui5
 vsrani_w_d       0111 00110101 1001 ...... ..... .....    @vv_ui6
 vsrani_d_q       0111 00110101 101 ....... ..... .....    @vv_ui7
+
+vsrlrn_b_h       0111 00001111 10001 ..... ..... .....    @vvv
+vsrlrn_h_w       0111 00001111 10010 ..... ..... .....    @vvv
+vsrlrn_w_d       0111 00001111 10011 ..... ..... .....    @vvv
+vsrarn_b_h       0111 00001111 10101 ..... ..... .....    @vvv
+vsrarn_h_w       0111 00001111 10110 ..... ..... .....    @vvv
+vsrarn_w_d       0111 00001111 10111 ..... ..... .....    @vvv
+
+vsrlrni_b_h      0111 00110100 01000 1 .... ..... .....   @vv_ui4
+vsrlrni_h_w      0111 00110100 01001 ..... ..... .....    @vv_ui5
+vsrlrni_w_d      0111 00110100 0101 ...... ..... .....    @vv_ui6
+vsrlrni_d_q      0111 00110100 011 ....... ..... .....    @vv_ui7
+vsrarni_b_h      0111 00110101 11000 1 .... ..... .....   @vv_ui4
+vsrarni_h_w      0111 00110101 11001 ..... ..... .....    @vv_ui5
+vsrarni_w_d      0111 00110101 1101 ...... ..... .....    @vv_ui6
+vsrarni_d_q      0111 00110101 111 ....... ..... .....    @vv_ui7
diff --git a/target/loongarch/lsx_helper.c b/target/loongarch/lsx_helper.c
index f9b6cf2d69..0ef18723fb 100644
--- a/target/loongarch/lsx_helper.c
+++ b/target/loongarch/lsx_helper.c
@@ -1052,3 +1052,129 @@ void HELPER(vsrani_d_q)(CPULoongArchState *env,
 VSRANI(vsrani_b_h, 16, B, H)
 VSRANI(vsrani_h_w, 32, H, W)
 VSRANI(vsrani_w_d, 64, W, D)
+
+#define VSRLRN(NAME, BIT, T, E1, E2)                                \
+void HELPER(NAME)(CPULoongArchState *env,                           \
+                  uint32_t vd, uint32_t vj, uint32_t vk)            \
+{                                                                   \
+    int i;                                                          \
+    VReg *Vd = &(env->fpr[vd].vreg);                                \
+    VReg *Vj = &(env->fpr[vj].vreg);                                \
+    VReg *Vk = &(env->fpr[vk].vreg);                                \
+                                                                    \
+    for (i = 0; i < LSX_LEN/BIT; i++) {                             \
+        Vd->E1(i) = do_vsrlr_ ## E2(Vj->E2(i), ((T)Vk->E2(i))%BIT); \
+    }                                                               \
+    Vd->D(1) = 0;                                                   \
+}
+
+VSRLRN(vsrlrn_b_h, 16, uint16_t, B, H)
+VSRLRN(vsrlrn_h_w, 32, uint32_t, H, W)
+VSRLRN(vsrlrn_w_d, 64, uint64_t, W, D)
+
+#define VSRARN(NAME, BIT, T, E1, E2)                                \
+void HELPER(NAME)(CPULoongArchState *env,                           \
+                  uint32_t vd, uint32_t vj, uint32_t vk)            \
+{                                                                   \
+    int i;                                                          \
+    VReg *Vd = &(env->fpr[vd].vreg);                                \
+    VReg *Vj = &(env->fpr[vj].vreg);                                \
+    VReg *Vk = &(env->fpr[vk].vreg);                                \
+                                                                    \
+    for (i = 0; i < LSX_LEN/BIT; i++) {                             \
+        Vd->E1(i) = do_vsrar_ ## E2(Vj->E2(i), ((T)Vk->E2(i))%BIT); \
+    }                                                               \
+    Vd->D(1) = 0;                                                   \
+}
+
+VSRARN(vsrarn_b_h, 16, uint8_t,  B, H)
+VSRARN(vsrarn_h_w, 32, uint16_t, H, W)
+VSRARN(vsrarn_w_d, 64, uint32_t, W, D)
+
+#define VSRLRNI(NAME, BIT, E1, E2)                          \
+void HELPER(NAME)(CPULoongArchState *env,                   \
+                  uint32_t vd, uint32_t vj, uint32_t imm)   \
+{                                                           \
+    int i, max;                                             \
+    VReg temp;                                              \
+    VReg *Vd = &(env->fpr[vd].vreg);                        \
+    VReg *Vj = &(env->fpr[vj].vreg);                        \
+                                                            \
+    temp.D(0) = 0;                                          \
+    temp.D(1) = 0;                                          \
+    max = LSX_LEN/BIT;                                      \
+    for (i = 0; i < max; i++) {                             \
+        temp.E1(i) = do_vsrlr_ ## E2(Vj->E2(i), imm);       \
+        temp.E1(i + max) = do_vsrlr_ ## E2(Vd->E2(i), imm); \
+    }                                                       \
+    *Vd = temp;                                             \
+}
+
+void HELPER(vsrlrni_d_q)(CPULoongArchState *env,
+                         uint32_t vd, uint32_t vj, uint32_t imm)
+{
+    VReg temp;
+    VReg *Vd = &(env->fpr[vd].vreg);
+    VReg *Vj = &(env->fpr[vj].vreg);
+    Int128 r1, r2;
+
+    if (imm == 0) {
+        temp.D(0) = int128_getlo(Vj->Q(0));
+        temp.D(1) = int128_getlo(Vd->Q(0));
+    } else {
+        r1 = int128_and(int128_urshift(Vj->Q(0), (imm -1)), int128_one());
+        r2 = int128_and(int128_urshift(Vd->Q(0), (imm -1)), int128_one());
+
+       temp.D(0) = int128_getlo(int128_add(int128_urshift(Vj->Q(0), imm), r1));
+       temp.D(1) = int128_getlo(int128_add(int128_urshift(Vd->Q(0), imm), r2));
+    }
+    *Vd = temp;
+}
+
+VSRLRNI(vsrlrni_b_h, 16, B, H)
+VSRLRNI(vsrlrni_h_w, 32, H, W)
+VSRLRNI(vsrlrni_w_d, 64, W, D)
+
+#define VSRARNI(NAME, BIT, E1, E2)                          \
+void HELPER(NAME)(CPULoongArchState *env,                   \
+                  uint32_t vd, uint32_t vj, uint32_t imm)   \
+{                                                           \
+    int i, max;                                             \
+    VReg temp;                                              \
+    VReg *Vd = &(env->fpr[vd].vreg);                        \
+    VReg *Vj = &(env->fpr[vj].vreg);                        \
+                                                            \
+    temp.D(0) = 0;                                          \
+    temp.D(1) = 0;                                          \
+    max = LSX_LEN/BIT;                                      \
+    for (i = 0; i < max; i++) {                             \
+        temp.E1(i) = do_vsrar_ ## E2(Vj->E2(i), imm);       \
+        temp.E1(i + max) = do_vsrar_ ## E2(Vd->E2(i), imm); \
+    }                                                       \
+    *Vd = temp;                                             \
+}
+
+void HELPER(vsrarni_d_q)(CPULoongArchState *env,
+                         uint32_t vd, uint32_t vj, uint32_t imm)
+{
+    VReg temp;
+    VReg *Vd = &(env->fpr[vd].vreg);
+    VReg *Vj = &(env->fpr[vj].vreg);
+    Int128 r1, r2;
+
+    if (imm == 0) {
+        temp.D(0) = int128_getlo(Vj->Q(0));
+        temp.D(1) = int128_getlo(Vd->Q(0));
+    } else {
+        r1 = int128_and(int128_rshift(Vj->Q(0), (imm -1)), int128_one());
+        r2 = int128_and(int128_rshift(Vd->Q(0), (imm -1)), int128_one());
+
+       temp.D(0) = int128_getlo(int128_add(int128_rshift(Vj->Q(0), imm), r1));
+       temp.D(1) = int128_getlo(int128_add(int128_rshift(Vd->Q(0), imm), r2));
+    }
+    *Vd = temp;
+}
+
+VSRARNI(vsrarni_b_h, 16, B, H)
+VSRARNI(vsrarni_h_w, 32, H, W)
+VSRARNI(vsrarni_w_d, 64, W, D)
-- 
2.31.1


