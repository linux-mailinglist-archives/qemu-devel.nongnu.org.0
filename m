Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2351D6F6C21
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 14:39:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puY4u-00020s-K2; Thu, 04 May 2023 08:28:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1puY4r-0001xa-5X
 for qemu-devel@nongnu.org; Thu, 04 May 2023 08:28:53 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1puY4b-000312-1z
 for qemu-devel@nongnu.org; Thu, 04 May 2023 08:28:52 -0400
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8Ax1ejnpFNks6AEAA--.7606S3;
 Thu, 04 May 2023 20:28:23 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Cx77PapFNk1uxJAA--.5674S26; 
 Thu, 04 May 2023 20:28:23 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	gaosong@loongson.cn
Subject: [PATCH v5 24/44] target/loongarch: Implement vsrlr vsrar
Date: Thu,  4 May 2023 20:27:50 +0800
Message-Id: <20230504122810.4094787-25-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230504122810.4094787-1-gaosong@loongson.cn>
References: <20230504122810.4094787-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Cx77PapFNk1uxJAA--.5674S26
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoW3Jr48tFWxtFWDJr1xtrykGrg_yoW3Zryxp3
 y7Kryjkr48JrZ7Xrn2va1Fy3WqqrsrKw13uw4ftr1jgw47JFnrXFyvq3yjgF4aqas5XFy0
 93W7CrZ0yry5Jw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 b0AFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4
 AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF
 7I0E14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x
 0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCF
 FI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VCjz48v1sIEY20_WwAm72CE4IkC6x0Yz7
 v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv
 8VWrMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7
 xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUXVWUAwCIc40Y0x0EwIxGrwCI42IY6xII
 jxv20xvE14v26F1j6w1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw2
 0EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Cr0_Gr1UMIIF0xvEx4A2jsIEc7Cj
 xVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0zRVWlkUUUUU=
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
- VSRLR[I].{B/H/W/D};
- VSRAR[I].{B/H/W/D}.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 target/loongarch/disas.c                    |  18 ++++
 target/loongarch/helper.h                   |  18 ++++
 target/loongarch/insn_trans/trans_lsx.c.inc |  18 ++++
 target/loongarch/insns.decode               |  18 ++++
 target/loongarch/lsx_helper.c               | 104 ++++++++++++++++++++
 5 files changed, 176 insertions(+)

diff --git a/target/loongarch/disas.c b/target/loongarch/disas.c
index 087cac10ad..c62b6720ec 100644
--- a/target/loongarch/disas.c
+++ b/target/loongarch/disas.c
@@ -1148,3 +1148,21 @@ INSN_LSX(vsllwil_hu_bu,    vv_i)
 INSN_LSX(vsllwil_wu_hu,    vv_i)
 INSN_LSX(vsllwil_du_wu,    vv_i)
 INSN_LSX(vextl_qu_du,      vv)
+
+INSN_LSX(vsrlr_b,          vvv)
+INSN_LSX(vsrlr_h,          vvv)
+INSN_LSX(vsrlr_w,          vvv)
+INSN_LSX(vsrlr_d,          vvv)
+INSN_LSX(vsrlri_b,         vv_i)
+INSN_LSX(vsrlri_h,         vv_i)
+INSN_LSX(vsrlri_w,         vv_i)
+INSN_LSX(vsrlri_d,         vv_i)
+
+INSN_LSX(vsrar_b,          vvv)
+INSN_LSX(vsrar_h,          vvv)
+INSN_LSX(vsrar_w,          vvv)
+INSN_LSX(vsrar_d,          vvv)
+INSN_LSX(vsrari_b,         vv_i)
+INSN_LSX(vsrari_h,         vv_i)
+INSN_LSX(vsrari_w,         vv_i)
+INSN_LSX(vsrari_d,         vv_i)
diff --git a/target/loongarch/helper.h b/target/loongarch/helper.h
index e98f7c3e6f..20a5e7c8e6 100644
--- a/target/loongarch/helper.h
+++ b/target/loongarch/helper.h
@@ -361,3 +361,21 @@ DEF_HELPER_4(vsllwil_hu_bu, void, env, i32, i32, i32)
 DEF_HELPER_4(vsllwil_wu_hu, void, env, i32, i32, i32)
 DEF_HELPER_4(vsllwil_du_wu, void, env, i32, i32, i32)
 DEF_HELPER_3(vextl_qu_du, void, env, i32, i32)
+
+DEF_HELPER_4(vsrlr_b, void, env, i32, i32, i32)
+DEF_HELPER_4(vsrlr_h, void, env, i32, i32, i32)
+DEF_HELPER_4(vsrlr_w, void, env, i32, i32, i32)
+DEF_HELPER_4(vsrlr_d, void, env, i32, i32, i32)
+DEF_HELPER_4(vsrlri_b, void, env, i32, i32, i32)
+DEF_HELPER_4(vsrlri_h, void, env, i32, i32, i32)
+DEF_HELPER_4(vsrlri_w, void, env, i32, i32, i32)
+DEF_HELPER_4(vsrlri_d, void, env, i32, i32, i32)
+
+DEF_HELPER_4(vsrar_b, void, env, i32, i32, i32)
+DEF_HELPER_4(vsrar_h, void, env, i32, i32, i32)
+DEF_HELPER_4(vsrar_w, void, env, i32, i32, i32)
+DEF_HELPER_4(vsrar_d, void, env, i32, i32, i32)
+DEF_HELPER_4(vsrari_b, void, env, i32, i32, i32)
+DEF_HELPER_4(vsrari_h, void, env, i32, i32, i32)
+DEF_HELPER_4(vsrari_w, void, env, i32, i32, i32)
+DEF_HELPER_4(vsrari_d, void, env, i32, i32, i32)
diff --git a/target/loongarch/insn_trans/trans_lsx.c.inc b/target/loongarch/insn_trans/trans_lsx.c.inc
index 037c742aa4..fb43e1b3ce 100644
--- a/target/loongarch/insn_trans/trans_lsx.c.inc
+++ b/target/loongarch/insn_trans/trans_lsx.c.inc
@@ -2987,3 +2987,21 @@ TRANS(vsllwil_hu_bu, gen_vv_i, gen_helper_vsllwil_hu_bu)
 TRANS(vsllwil_wu_hu, gen_vv_i, gen_helper_vsllwil_wu_hu)
 TRANS(vsllwil_du_wu, gen_vv_i, gen_helper_vsllwil_du_wu)
 TRANS(vextl_qu_du, gen_vv, gen_helper_vextl_qu_du)
+
+TRANS(vsrlr_b, gen_vvv, gen_helper_vsrlr_b)
+TRANS(vsrlr_h, gen_vvv, gen_helper_vsrlr_h)
+TRANS(vsrlr_w, gen_vvv, gen_helper_vsrlr_w)
+TRANS(vsrlr_d, gen_vvv, gen_helper_vsrlr_d)
+TRANS(vsrlri_b, gen_vv_i, gen_helper_vsrlri_b)
+TRANS(vsrlri_h, gen_vv_i, gen_helper_vsrlri_h)
+TRANS(vsrlri_w, gen_vv_i, gen_helper_vsrlri_w)
+TRANS(vsrlri_d, gen_vv_i, gen_helper_vsrlri_d)
+
+TRANS(vsrar_b, gen_vvv, gen_helper_vsrar_b)
+TRANS(vsrar_h, gen_vvv, gen_helper_vsrar_h)
+TRANS(vsrar_w, gen_vvv, gen_helper_vsrar_w)
+TRANS(vsrar_d, gen_vvv, gen_helper_vsrar_d)
+TRANS(vsrari_b, gen_vv_i, gen_helper_vsrari_b)
+TRANS(vsrari_h, gen_vv_i, gen_helper_vsrari_h)
+TRANS(vsrari_w, gen_vv_i, gen_helper_vsrari_w)
+TRANS(vsrari_d, gen_vv_i, gen_helper_vsrari_d)
diff --git a/target/loongarch/insns.decode b/target/loongarch/insns.decode
index 23dd338026..a217411113 100644
--- a/target/loongarch/insns.decode
+++ b/target/loongarch/insns.decode
@@ -848,3 +848,21 @@ vsllwil_hu_bu    0111 00110000 11000 01 ... ..... .....   @vv_ui3
 vsllwil_wu_hu    0111 00110000 11000 1 .... ..... .....   @vv_ui4
 vsllwil_du_wu    0111 00110000 11001 ..... ..... .....    @vv_ui5
 vextl_qu_du      0111 00110000 11010 00000 ..... .....    @vv
+
+vsrlr_b          0111 00001111 00000 ..... ..... .....    @vvv
+vsrlr_h          0111 00001111 00001 ..... ..... .....    @vvv
+vsrlr_w          0111 00001111 00010 ..... ..... .....    @vvv
+vsrlr_d          0111 00001111 00011 ..... ..... .....    @vvv
+vsrlri_b         0111 00101010 01000 01 ... ..... .....   @vv_ui3
+vsrlri_h         0111 00101010 01000 1 .... ..... .....   @vv_ui4
+vsrlri_w         0111 00101010 01001 ..... ..... .....    @vv_ui5
+vsrlri_d         0111 00101010 0101 ...... ..... .....    @vv_ui6
+
+vsrar_b          0111 00001111 00100 ..... ..... .....    @vvv
+vsrar_h          0111 00001111 00101 ..... ..... .....    @vvv
+vsrar_w          0111 00001111 00110 ..... ..... .....    @vvv
+vsrar_d          0111 00001111 00111 ..... ..... .....    @vvv
+vsrari_b         0111 00101010 10000 01 ... ..... .....   @vv_ui3
+vsrari_h         0111 00101010 10000 1 .... ..... .....   @vv_ui4
+vsrari_w         0111 00101010 10001 ..... ..... .....    @vv_ui5
+vsrari_d         0111 00101010 1001 ...... ..... .....    @vv_ui6
diff --git a/target/loongarch/lsx_helper.c b/target/loongarch/lsx_helper.c
index de86f41cce..61d39a044c 100644
--- a/target/loongarch/lsx_helper.c
+++ b/target/loongarch/lsx_helper.c
@@ -834,3 +834,107 @@ VSLLWIL(vsllwil_d_w, 64, D, W)
 VSLLWIL(vsllwil_hu_bu, 16, UH, UB)
 VSLLWIL(vsllwil_wu_hu, 32, UW, UH)
 VSLLWIL(vsllwil_du_wu, 64, UD, UW)
+
+#define do_vsrlr(E, T)                                  \
+static T do_vsrlr_ ##E(T s1, int sh)                    \
+{                                                       \
+    if (sh == 0) {                                      \
+        return s1;                                      \
+    } else {                                            \
+        return  (s1 >> sh)  + ((s1 >> (sh - 1)) & 0x1); \
+    }                                                   \
+}
+
+do_vsrlr(B, uint8_t)
+do_vsrlr(H, uint16_t)
+do_vsrlr(W, uint32_t)
+do_vsrlr(D, uint64_t)
+
+#define VSRLR(NAME, BIT, T, E)                                  \
+void HELPER(NAME)(CPULoongArchState *env,                       \
+                  uint32_t vd, uint32_t vj, uint32_t vk)        \
+{                                                               \
+    int i;                                                      \
+    VReg *Vd = &(env->fpr[vd].vreg);                            \
+    VReg *Vj = &(env->fpr[vj].vreg);                            \
+    VReg *Vk = &(env->fpr[vk].vreg);                            \
+                                                                \
+    for (i = 0; i < LSX_LEN/BIT; i++) {                         \
+        Vd->E(i) = do_vsrlr_ ## E(Vj->E(i), ((T)Vk->E(i))%BIT); \
+    }                                                           \
+}
+
+VSRLR(vsrlr_b, 8,  uint8_t, B)
+VSRLR(vsrlr_h, 16, uint16_t, H)
+VSRLR(vsrlr_w, 32, uint32_t, W)
+VSRLR(vsrlr_d, 64, uint64_t, D)
+
+#define VSRLRI(NAME, BIT, E)                              \
+void HELPER(NAME)(CPULoongArchState *env,                 \
+                  uint32_t vd, uint32_t vj, uint32_t imm) \
+{                                                         \
+    int i;                                                \
+    VReg *Vd = &(env->fpr[vd].vreg);                      \
+    VReg *Vj = &(env->fpr[vj].vreg);                      \
+                                                          \
+    for (i = 0; i < LSX_LEN/BIT; i++) {                   \
+        Vd->E(i) = do_vsrlr_ ## E(Vj->E(i), imm);         \
+    }                                                     \
+}
+
+VSRLRI(vsrlri_b, 8, B)
+VSRLRI(vsrlri_h, 16, H)
+VSRLRI(vsrlri_w, 32, W)
+VSRLRI(vsrlri_d, 64, D)
+
+#define do_vsrar(E, T)                                  \
+static T do_vsrar_ ##E(T s1, int sh)                    \
+{                                                       \
+    if (sh == 0) {                                      \
+        return s1;                                      \
+    } else {                                            \
+        return  (s1 >> sh)  + ((s1 >> (sh - 1)) & 0x1); \
+    }                                                   \
+}
+
+do_vsrar(B, int8_t)
+do_vsrar(H, int16_t)
+do_vsrar(W, int32_t)
+do_vsrar(D, int64_t)
+
+#define VSRAR(NAME, BIT, T, E)                                  \
+void HELPER(NAME)(CPULoongArchState *env,                       \
+                  uint32_t vd, uint32_t vj, uint32_t vk)        \
+{                                                               \
+    int i;                                                      \
+    VReg *Vd = &(env->fpr[vd].vreg);                            \
+    VReg *Vj = &(env->fpr[vj].vreg);                            \
+    VReg *Vk = &(env->fpr[vk].vreg);                            \
+                                                                \
+    for (i = 0; i < LSX_LEN/BIT; i++) {                         \
+        Vd->E(i) = do_vsrar_ ## E(Vj->E(i), ((T)Vk->E(i))%BIT); \
+    }                                                           \
+}
+
+VSRAR(vsrar_b, 8,  uint8_t, B)
+VSRAR(vsrar_h, 16, uint16_t, H)
+VSRAR(vsrar_w, 32, uint32_t, W)
+VSRAR(vsrar_d, 64, uint64_t, D)
+
+#define VSRARI(NAME, BIT, E)                              \
+void HELPER(NAME)(CPULoongArchState *env,                 \
+                  uint32_t vd, uint32_t vj, uint32_t imm) \
+{                                                         \
+    int i;                                                \
+    VReg *Vd = &(env->fpr[vd].vreg);                      \
+    VReg *Vj = &(env->fpr[vj].vreg);                      \
+                                                          \
+    for (i = 0; i < LSX_LEN/BIT; i++) {                   \
+        Vd->E(i) = do_vsrar_ ## E(Vj->E(i), imm);         \
+    }                                                     \
+}
+
+VSRARI(vsrari_b, 8, B)
+VSRARI(vsrari_h, 16, H)
+VSRARI(vsrari_w, 32, W)
+VSRARI(vsrari_d, 64, D)
-- 
2.31.1


