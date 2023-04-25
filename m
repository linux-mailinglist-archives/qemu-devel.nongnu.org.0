Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D58D96EDC3E
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 09:10:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prCjn-00046Q-N9; Tue, 25 Apr 2023 03:05:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1prCjP-0003rW-P3
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 03:04:56 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1prCjD-0008OX-2N
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 03:04:54 -0400
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8DxTusxe0dkl18AAA--.611S3;
 Tue, 25 Apr 2023 15:03:13 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Cxeb0Ye0dk3Eo6AA--.4591S27; 
 Tue, 25 Apr 2023 15:03:12 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	gaosong@loongson.cn
Subject: [RFC PATCH v4 25/44] target/loongarch: Implement vsrln vsran
Date: Tue, 25 Apr 2023 15:02:29 +0800
Message-Id: <20230425070248.2550028-26-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230425070248.2550028-1-gaosong@loongson.cn>
References: <20230425070248.2550028-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Cxeb0Ye0dk3Eo6AA--.4591S27
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoW3Gry3uFWDWr1DKF4fXFW8JFb_yoWfJw4fpa
 12kryUtr48JrWxXrnav3Zayw4DXrsrtw10gw1rJr1jgwsrXFnIqFyvqw4j9F47tas5ZFyF
 g3W7C3sFyFy5J37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 be8Fc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4
 AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF
 7I0E14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6x
 kF7I0E14v26r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020E
 x4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E74AGY7Cv6cx26rWlOx8S6xCaFV
 Cjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7VAKI48JMxAIw28IcVCjz48v
 1sIEY20_WwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I
 0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jrv_JF1lIxkGc2Ij64vIr41lIxAI
 cVC0I7IYx2IY67AKxVW7JVWDJwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMIIF0x
 vE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWxJVW8Jr1lIxAIcVC2z280
 aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7xRE6wZ7UUUUU==
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
- VSRLN.{B.H/H.W/W.D};
- VSRAN.{B.H/H.W/W.D};
- VSRLNI.{B.H/H.W/W.D/D.Q};
- VSRANI.{B.H/H.W/W.D/D.Q}.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 target/loongarch/disas.c                    |  16 +++
 target/loongarch/helper.h                   |  16 +++
 target/loongarch/insn_trans/trans_lsx.c.inc |  16 +++
 target/loongarch/insns.decode               |  17 +++
 target/loongarch/lsx_helper.c               | 114 ++++++++++++++++++++
 5 files changed, 179 insertions(+)

diff --git a/target/loongarch/disas.c b/target/loongarch/disas.c
index c62b6720ec..f0fc2ff84b 100644
--- a/target/loongarch/disas.c
+++ b/target/loongarch/disas.c
@@ -1166,3 +1166,19 @@ INSN_LSX(vsrari_b,         vv_i)
 INSN_LSX(vsrari_h,         vv_i)
 INSN_LSX(vsrari_w,         vv_i)
 INSN_LSX(vsrari_d,         vv_i)
+
+INSN_LSX(vsrln_b_h,       vvv)
+INSN_LSX(vsrln_h_w,       vvv)
+INSN_LSX(vsrln_w_d,       vvv)
+INSN_LSX(vsran_b_h,       vvv)
+INSN_LSX(vsran_h_w,       vvv)
+INSN_LSX(vsran_w_d,       vvv)
+
+INSN_LSX(vsrlni_b_h,       vv_i)
+INSN_LSX(vsrlni_h_w,       vv_i)
+INSN_LSX(vsrlni_w_d,       vv_i)
+INSN_LSX(vsrlni_d_q,       vv_i)
+INSN_LSX(vsrani_b_h,       vv_i)
+INSN_LSX(vsrani_h_w,       vv_i)
+INSN_LSX(vsrani_w_d,       vv_i)
+INSN_LSX(vsrani_d_q,       vv_i)
diff --git a/target/loongarch/helper.h b/target/loongarch/helper.h
index 20a5e7c8e6..afe7e3d2d0 100644
--- a/target/loongarch/helper.h
+++ b/target/loongarch/helper.h
@@ -379,3 +379,19 @@ DEF_HELPER_4(vsrari_b, void, env, i32, i32, i32)
 DEF_HELPER_4(vsrari_h, void, env, i32, i32, i32)
 DEF_HELPER_4(vsrari_w, void, env, i32, i32, i32)
 DEF_HELPER_4(vsrari_d, void, env, i32, i32, i32)
+
+DEF_HELPER_4(vsrln_b_h, void, env, i32, i32, i32)
+DEF_HELPER_4(vsrln_h_w, void, env, i32, i32, i32)
+DEF_HELPER_4(vsrln_w_d, void, env, i32, i32, i32)
+DEF_HELPER_4(vsran_b_h, void, env, i32, i32, i32)
+DEF_HELPER_4(vsran_h_w, void, env, i32, i32, i32)
+DEF_HELPER_4(vsran_w_d, void, env, i32, i32, i32)
+
+DEF_HELPER_4(vsrlni_b_h, void, env, i32, i32, i32)
+DEF_HELPER_4(vsrlni_h_w, void, env, i32, i32, i32)
+DEF_HELPER_4(vsrlni_w_d, void, env, i32, i32, i32)
+DEF_HELPER_4(vsrlni_d_q, void, env, i32, i32, i32)
+DEF_HELPER_4(vsrani_b_h, void, env, i32, i32, i32)
+DEF_HELPER_4(vsrani_h_w, void, env, i32, i32, i32)
+DEF_HELPER_4(vsrani_w_d, void, env, i32, i32, i32)
+DEF_HELPER_4(vsrani_d_q, void, env, i32, i32, i32)
diff --git a/target/loongarch/insn_trans/trans_lsx.c.inc b/target/loongarch/insn_trans/trans_lsx.c.inc
index fb43e1b3ce..ad34378ada 100644
--- a/target/loongarch/insn_trans/trans_lsx.c.inc
+++ b/target/loongarch/insn_trans/trans_lsx.c.inc
@@ -3005,3 +3005,19 @@ TRANS(vsrari_b, gen_vv_i, gen_helper_vsrari_b)
 TRANS(vsrari_h, gen_vv_i, gen_helper_vsrari_h)
 TRANS(vsrari_w, gen_vv_i, gen_helper_vsrari_w)
 TRANS(vsrari_d, gen_vv_i, gen_helper_vsrari_d)
+
+TRANS(vsrln_b_h, gen_vvv, gen_helper_vsrln_b_h)
+TRANS(vsrln_h_w, gen_vvv, gen_helper_vsrln_h_w)
+TRANS(vsrln_w_d, gen_vvv, gen_helper_vsrln_w_d)
+TRANS(vsran_b_h, gen_vvv, gen_helper_vsran_b_h)
+TRANS(vsran_h_w, gen_vvv, gen_helper_vsran_h_w)
+TRANS(vsran_w_d, gen_vvv, gen_helper_vsran_w_d)
+
+TRANS(vsrlni_b_h, gen_vv_i, gen_helper_vsrlni_b_h)
+TRANS(vsrlni_h_w, gen_vv_i, gen_helper_vsrlni_h_w)
+TRANS(vsrlni_w_d, gen_vv_i, gen_helper_vsrlni_w_d)
+TRANS(vsrlni_d_q, gen_vv_i, gen_helper_vsrlni_d_q)
+TRANS(vsrani_b_h, gen_vv_i, gen_helper_vsrani_b_h)
+TRANS(vsrani_h_w, gen_vv_i, gen_helper_vsrani_h_w)
+TRANS(vsrani_w_d, gen_vv_i, gen_helper_vsrani_w_d)
+TRANS(vsrani_d_q, gen_vv_i, gen_helper_vsrani_d_q)
diff --git a/target/loongarch/insns.decode b/target/loongarch/insns.decode
index a217411113..ee54b632a7 100644
--- a/target/loongarch/insns.decode
+++ b/target/loongarch/insns.decode
@@ -503,6 +503,7 @@ dbcl             0000 00000010 10101 ...............      @i15
 @vv_ui4         .... ........ ..... . imm:4 vj:5 vd:5    &vv_i
 @vv_ui5           .... ........ ..... imm:5 vj:5 vd:5    &vv_i
 @vv_ui6            .... ........ .... imm:6 vj:5 vd:5    &vv_i
+@vv_ui7             .... ........ ... imm:7 vj:5 vd:5    &vv_i
 @vv_ui8              .... ........ .. imm:8 vj:5 vd:5    &vv_i
 @vv_i5           .... ........ ..... imm:s5 vj:5 vd:5    &vv_i
 
@@ -866,3 +867,19 @@ vsrari_b         0111 00101010 10000 01 ... ..... .....   @vv_ui3
 vsrari_h         0111 00101010 10000 1 .... ..... .....   @vv_ui4
 vsrari_w         0111 00101010 10001 ..... ..... .....    @vv_ui5
 vsrari_d         0111 00101010 1001 ...... ..... .....    @vv_ui6
+
+vsrln_b_h        0111 00001111 01001 ..... ..... .....    @vvv
+vsrln_h_w        0111 00001111 01010 ..... ..... .....    @vvv
+vsrln_w_d        0111 00001111 01011 ..... ..... .....    @vvv
+vsran_b_h        0111 00001111 01101 ..... ..... .....    @vvv
+vsran_h_w        0111 00001111 01110 ..... ..... .....    @vvv
+vsran_w_d        0111 00001111 01111 ..... ..... .....    @vvv
+
+vsrlni_b_h       0111 00110100 00000 1 .... ..... .....   @vv_ui4
+vsrlni_h_w       0111 00110100 00001 ..... ..... .....    @vv_ui5
+vsrlni_w_d       0111 00110100 0001 ...... ..... .....    @vv_ui6
+vsrlni_d_q       0111 00110100 001 ....... ..... .....    @vv_ui7
+vsrani_b_h       0111 00110101 10000 1 .... ..... .....   @vv_ui4
+vsrani_h_w       0111 00110101 10001 ..... ..... .....    @vv_ui5
+vsrani_w_d       0111 00110101 1001 ...... ..... .....    @vv_ui6
+vsrani_d_q       0111 00110101 101 ....... ..... .....    @vv_ui7
diff --git a/target/loongarch/lsx_helper.c b/target/loongarch/lsx_helper.c
index 61d39a044c..f9b6cf2d69 100644
--- a/target/loongarch/lsx_helper.c
+++ b/target/loongarch/lsx_helper.c
@@ -938,3 +938,117 @@ VSRARI(vsrari_b, 8, B)
 VSRARI(vsrari_h, 16, H)
 VSRARI(vsrari_w, 32, W)
 VSRARI(vsrari_d, 64, D)
+
+#define R_SHIFT(a, b) (a >> b)
+
+#define VSRLN(NAME, BIT, T, E1, E2)                             \
+void HELPER(NAME)(CPULoongArchState *env,                       \
+                  uint32_t vd, uint32_t vj, uint32_t vk)        \
+{                                                               \
+    int i;                                                      \
+    VReg *Vd = &(env->fpr[vd].vreg);                            \
+    VReg *Vj = &(env->fpr[vj].vreg);                            \
+    VReg *Vk = &(env->fpr[vk].vreg);                            \
+                                                                \
+    for (i = 0; i < LSX_LEN/BIT; i++) {                         \
+        Vd->E1(i) = R_SHIFT((T)Vj->E2(i),((T)Vk->E2(i)) % BIT); \
+    }                                                           \
+    Vd->D(1) = 0;                                               \
+}
+
+VSRLN(vsrln_b_h, 16, uint16_t, B, H)
+VSRLN(vsrln_h_w, 32, uint32_t, H, W)
+VSRLN(vsrln_w_d, 64, uint64_t, W, D)
+
+#define VSRAN(NAME, BIT, T, E1, E2)                           \
+void HELPER(NAME)(CPULoongArchState *env,                     \
+                  uint32_t vd, uint32_t vj, uint32_t vk)      \
+{                                                             \
+    int i;                                                    \
+    VReg *Vd = &(env->fpr[vd].vreg);                          \
+    VReg *Vj = &(env->fpr[vj].vreg);                          \
+    VReg *Vk = &(env->fpr[vk].vreg);                          \
+                                                              \
+    for (i = 0; i < LSX_LEN/BIT; i++) {                       \
+        Vd->E1(i) = R_SHIFT(Vj->E2(i), ((T)Vk->E2(i)) % BIT); \
+    }                                                         \
+    Vd->D(1) = 0;                                             \
+}
+
+VSRAN(vsran_b_h, 16, uint16_t, B, H)
+VSRAN(vsran_h_w, 32, uint32_t, H, W)
+VSRAN(vsran_w_d, 64, uint64_t, W, D)
+
+#define VSRLNI(NAME, BIT, T, E1, E2)                         \
+void HELPER(NAME)(CPULoongArchState *env,                    \
+                  uint32_t vd, uint32_t vj, uint32_t imm)    \
+{                                                            \
+    int i, max;                                              \
+    VReg temp;                                               \
+    VReg *Vd = &(env->fpr[vd].vreg);                         \
+    VReg *Vj = &(env->fpr[vj].vreg);                         \
+                                                             \
+    temp.D(0) = 0;                                           \
+    temp.D(1) = 0;                                           \
+    max = LSX_LEN/BIT;                                       \
+    for (i = 0; i < max; i++) {                              \
+        temp.E1(i) = R_SHIFT((T)Vj->E2(i), imm);             \
+        temp.E1(i + max) = R_SHIFT((T)Vd->E2(i), imm);       \
+    }                                                        \
+    *Vd = temp;                                              \
+}
+
+void HELPER(vsrlni_d_q)(CPULoongArchState *env,
+                        uint32_t vd, uint32_t vj, uint32_t imm)
+{
+    VReg temp;
+    VReg *Vd = &(env->fpr[vd].vreg);
+    VReg *Vj = &(env->fpr[vj].vreg);
+
+    temp.D(0) = 0;
+    temp.D(1) = 0;
+    temp.D(0) = int128_urshift(Vj->Q(0), imm % 128);
+    temp.D(1) = int128_urshift(Vd->Q(0), imm % 128);
+    *Vd = temp;
+}
+
+VSRLNI(vsrlni_b_h, 16, uint16_t, B, H)
+VSRLNI(vsrlni_h_w, 32, uint32_t, H, W)
+VSRLNI(vsrlni_w_d, 64, uint64_t, W, D)
+
+#define VSRANI(NAME, BIT, E1, E2)                         \
+void HELPER(NAME)(CPULoongArchState *env,                 \
+                  uint32_t vd, uint32_t vj, uint32_t imm) \
+{                                                         \
+    int i, max;                                           \
+    VReg temp;                                            \
+    VReg *Vd = &(env->fpr[vd].vreg);                      \
+    VReg *Vj = &(env->fpr[vj].vreg);                      \
+                                                          \
+    temp.D(0) = 0;                                        \
+    temp.D(1) = 0;                                        \
+    max = LSX_LEN/BIT;                                    \
+    for (i = 0; i < max; i++) {                           \
+        temp.E1(i) = R_SHIFT(Vj->E2(i), imm);             \
+        temp.E1(i + max) = R_SHIFT(Vd->E2(i), imm);       \
+    }                                                     \
+    *Vd = temp;                                           \
+}
+
+void HELPER(vsrani_d_q)(CPULoongArchState *env,
+                        uint32_t vd, uint32_t vj, uint32_t imm)
+{
+    VReg temp;
+    VReg *Vd = &(env->fpr[vd].vreg);
+    VReg *Vj = &(env->fpr[vj].vreg);
+
+    temp.D(0) = 0;
+    temp.D(1) = 0;
+    temp.D(0) = int128_rshift(Vj->Q(0), imm % 128);
+    temp.D(1) = int128_rshift(Vd->Q(0), imm % 128);
+    *Vd = temp;
+}
+
+VSRANI(vsrani_b_h, 16, B, H)
+VSRANI(vsrani_h_w, 32, H, W)
+VSRANI(vsrani_w_d, 64, W, D)
-- 
2.31.1


