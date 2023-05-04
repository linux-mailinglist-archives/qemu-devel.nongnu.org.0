Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FCE96F6C22
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 14:39:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puY4r-0001wy-Ic; Thu, 04 May 2023 08:28:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1puY4n-0001tv-Kg
 for qemu-devel@nongnu.org; Thu, 04 May 2023 08:28:49 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1puY4k-00033a-4D
 for qemu-devel@nongnu.org; Thu, 04 May 2023 08:28:49 -0400
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8Bx5ejxpFNk26AEAA--.7629S3;
 Thu, 04 May 2023 20:28:33 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Cx77PapFNk1uxJAA--.5674S42; 
 Thu, 04 May 2023 20:28:32 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	gaosong@loongson.cn
Subject: [PATCH v5 40/44] target/loongarch: Implement vilvl vilvh vextrins
 vshuf
Date: Thu,  4 May 2023 20:28:06 +0800
Message-Id: <20230504122810.4094787-41-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230504122810.4094787-1-gaosong@loongson.cn>
References: <20230504122810.4094787-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Cx77PapFNk1uxJAA--.5674S42
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoW3KF4fZr1UKr1DtF1kGr4Durg_yoWDWryrpF
 sIkFyUtr48JrWxXrnav343Jw1qqrsrKw1xu3WrGr1rWF47tFn8XryvqrZF9F4aga95XFWI
 g3W3C34qyF98J37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bnxFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4
 AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF
 7I0E14v26r4UJVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7
 CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE
 44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E74AGY7Cv6cx26rWlOx8S6xCaFVCjc4
 AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7VAKI48JMxAIw28IcVCjz48v1sIE
 Y20_WwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E74
 80Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jrv_JF1lIxkGc2Ij64vIr41lIxAIcVC0
 I7IYx2IY67AKxVWDJVCq3wCI42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMIIF0xvE42
 xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWxJVW8Jr1lIxAIcVC2z280aVCY
 1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7xRE6wZ7UUUUU==
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
- VILV{L/H}.{B/H/W/D};
- VSHUF.{B/H/W/D};
- VSHUF4I.{B/H/W/D};
- VPERMI.W;
- VEXTRINS.{B/H/W/D}.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 target/loongarch/disas.c                    |  25 ++++
 target/loongarch/helper.h                   |  25 ++++
 target/loongarch/insn_trans/trans_lsx.c.inc |  25 ++++
 target/loongarch/insns.decode               |  25 ++++
 target/loongarch/lsx_helper.c               | 148 ++++++++++++++++++++
 5 files changed, 248 insertions(+)

diff --git a/target/loongarch/disas.c b/target/loongarch/disas.c
index c6cf782725..0b62bbb8be 100644
--- a/target/loongarch/disas.c
+++ b/target/loongarch/disas.c
@@ -1629,3 +1629,28 @@ INSN_LSX(vpickod_b,        vvv)
 INSN_LSX(vpickod_h,        vvv)
 INSN_LSX(vpickod_w,        vvv)
 INSN_LSX(vpickod_d,        vvv)
+
+INSN_LSX(vilvl_b,          vvv)
+INSN_LSX(vilvl_h,          vvv)
+INSN_LSX(vilvl_w,          vvv)
+INSN_LSX(vilvl_d,          vvv)
+INSN_LSX(vilvh_b,          vvv)
+INSN_LSX(vilvh_h,          vvv)
+INSN_LSX(vilvh_w,          vvv)
+INSN_LSX(vilvh_d,          vvv)
+
+INSN_LSX(vshuf_b,          vvvv)
+INSN_LSX(vshuf_h,          vvv)
+INSN_LSX(vshuf_w,          vvv)
+INSN_LSX(vshuf_d,          vvv)
+INSN_LSX(vshuf4i_b,        vv_i)
+INSN_LSX(vshuf4i_h,        vv_i)
+INSN_LSX(vshuf4i_w,        vv_i)
+INSN_LSX(vshuf4i_d,        vv_i)
+
+INSN_LSX(vpermi_w,         vv_i)
+
+INSN_LSX(vextrins_d,       vv_i)
+INSN_LSX(vextrins_w,       vv_i)
+INSN_LSX(vextrins_h,       vv_i)
+INSN_LSX(vextrins_b,       vv_i)
diff --git a/target/loongarch/helper.h b/target/loongarch/helper.h
index 51ad694be2..b9de77d926 100644
--- a/target/loongarch/helper.h
+++ b/target/loongarch/helper.h
@@ -671,3 +671,28 @@ DEF_HELPER_4(vpickod_b, void, env, i32, i32, i32)
 DEF_HELPER_4(vpickod_h, void, env, i32, i32, i32)
 DEF_HELPER_4(vpickod_w, void, env, i32, i32, i32)
 DEF_HELPER_4(vpickod_d, void, env, i32, i32, i32)
+
+DEF_HELPER_4(vilvl_b, void, env, i32, i32, i32)
+DEF_HELPER_4(vilvl_h, void, env, i32, i32, i32)
+DEF_HELPER_4(vilvl_w, void, env, i32, i32, i32)
+DEF_HELPER_4(vilvl_d, void, env, i32, i32, i32)
+DEF_HELPER_4(vilvh_b, void, env, i32, i32, i32)
+DEF_HELPER_4(vilvh_h, void, env, i32, i32, i32)
+DEF_HELPER_4(vilvh_w, void, env, i32, i32, i32)
+DEF_HELPER_4(vilvh_d, void, env, i32, i32, i32)
+
+DEF_HELPER_5(vshuf_b, void, env, i32, i32, i32, i32)
+DEF_HELPER_4(vshuf_h, void, env, i32, i32, i32)
+DEF_HELPER_4(vshuf_w, void, env, i32, i32, i32)
+DEF_HELPER_4(vshuf_d, void, env, i32, i32, i32)
+DEF_HELPER_4(vshuf4i_b, void, env, i32, i32, i32)
+DEF_HELPER_4(vshuf4i_h, void, env, i32, i32, i32)
+DEF_HELPER_4(vshuf4i_w, void, env, i32, i32, i32)
+DEF_HELPER_4(vshuf4i_d, void, env, i32, i32, i32)
+
+DEF_HELPER_4(vpermi_w, void, env, i32, i32, i32)
+
+DEF_HELPER_4(vextrins_b, void, env, i32, i32, i32)
+DEF_HELPER_4(vextrins_h, void, env, i32, i32, i32)
+DEF_HELPER_4(vextrins_w, void, env, i32, i32, i32)
+DEF_HELPER_4(vextrins_d, void, env, i32, i32, i32)
diff --git a/target/loongarch/insn_trans/trans_lsx.c.inc b/target/loongarch/insn_trans/trans_lsx.c.inc
index 1146ace1b7..e1eee6bc4c 100644
--- a/target/loongarch/insn_trans/trans_lsx.c.inc
+++ b/target/loongarch/insn_trans/trans_lsx.c.inc
@@ -4077,3 +4077,28 @@ TRANS(vpickod_b, gen_vvv, gen_helper_vpickod_b)
 TRANS(vpickod_h, gen_vvv, gen_helper_vpickod_h)
 TRANS(vpickod_w, gen_vvv, gen_helper_vpickod_w)
 TRANS(vpickod_d, gen_vvv, gen_helper_vpickod_d)
+
+TRANS(vilvl_b, gen_vvv, gen_helper_vilvl_b)
+TRANS(vilvl_h, gen_vvv, gen_helper_vilvl_h)
+TRANS(vilvl_w, gen_vvv, gen_helper_vilvl_w)
+TRANS(vilvl_d, gen_vvv, gen_helper_vilvl_d)
+TRANS(vilvh_b, gen_vvv, gen_helper_vilvh_b)
+TRANS(vilvh_h, gen_vvv, gen_helper_vilvh_h)
+TRANS(vilvh_w, gen_vvv, gen_helper_vilvh_w)
+TRANS(vilvh_d, gen_vvv, gen_helper_vilvh_d)
+
+TRANS(vshuf_b, gen_vvvv, gen_helper_vshuf_b)
+TRANS(vshuf_h, gen_vvv, gen_helper_vshuf_h)
+TRANS(vshuf_w, gen_vvv, gen_helper_vshuf_w)
+TRANS(vshuf_d, gen_vvv, gen_helper_vshuf_d)
+TRANS(vshuf4i_b, gen_vv_i, gen_helper_vshuf4i_b)
+TRANS(vshuf4i_h, gen_vv_i, gen_helper_vshuf4i_h)
+TRANS(vshuf4i_w, gen_vv_i, gen_helper_vshuf4i_w)
+TRANS(vshuf4i_d, gen_vv_i, gen_helper_vshuf4i_d)
+
+TRANS(vpermi_w, gen_vv_i, gen_helper_vpermi_w)
+
+TRANS(vextrins_b, gen_vv_i, gen_helper_vextrins_b)
+TRANS(vextrins_h, gen_vv_i, gen_helper_vextrins_h)
+TRANS(vextrins_w, gen_vv_i, gen_helper_vextrins_w)
+TRANS(vextrins_d, gen_vv_i, gen_helper_vextrins_d)
diff --git a/target/loongarch/insns.decode b/target/loongarch/insns.decode
index ab9e9e422f..0263bce28e 100644
--- a/target/loongarch/insns.decode
+++ b/target/loongarch/insns.decode
@@ -1231,3 +1231,28 @@ vpickod_b        0111 00010010 00000 ..... ..... .....    @vvv
 vpickod_h        0111 00010010 00001 ..... ..... .....    @vvv
 vpickod_w        0111 00010010 00010 ..... ..... .....    @vvv
 vpickod_d        0111 00010010 00011 ..... ..... .....    @vvv
+
+vilvl_b          0111 00010001 10100 ..... ..... .....    @vvv
+vilvl_h          0111 00010001 10101 ..... ..... .....    @vvv
+vilvl_w          0111 00010001 10110 ..... ..... .....    @vvv
+vilvl_d          0111 00010001 10111 ..... ..... .....    @vvv
+vilvh_b          0111 00010001 11000 ..... ..... .....    @vvv
+vilvh_h          0111 00010001 11001 ..... ..... .....    @vvv
+vilvh_w          0111 00010001 11010 ..... ..... .....    @vvv
+vilvh_d          0111 00010001 11011 ..... ..... .....    @vvv
+
+vshuf_b          0000 11010101 ..... ..... ..... .....    @vvvv
+vshuf_h          0111 00010111 10101 ..... ..... .....    @vvv
+vshuf_w          0111 00010111 10110 ..... ..... .....    @vvv
+vshuf_d          0111 00010111 10111 ..... ..... .....    @vvv
+vshuf4i_b        0111 00111001 00 ........ ..... .....    @vv_ui8
+vshuf4i_h        0111 00111001 01 ........ ..... .....    @vv_ui8
+vshuf4i_w        0111 00111001 10 ........ ..... .....    @vv_ui8
+vshuf4i_d        0111 00111001 11 ........ ..... .....    @vv_ui8
+
+vpermi_w         0111 00111110 01 ........ ..... .....    @vv_ui8
+
+vextrins_d       0111 00111000 00 ........ ..... .....    @vv_ui8
+vextrins_w       0111 00111000 01 ........ ..... .....    @vv_ui8
+vextrins_h       0111 00111000 10 ........ ..... .....    @vv_ui8
+vextrins_b       0111 00111000 11 ........ ..... .....    @vv_ui8
diff --git a/target/loongarch/lsx_helper.c b/target/loongarch/lsx_helper.c
index d5e1a1231d..f1ed726ed2 100644
--- a/target/loongarch/lsx_helper.c
+++ b/target/loongarch/lsx_helper.c
@@ -2854,3 +2854,151 @@ VPICKOD(vpickod_b, 16, B)
 VPICKOD(vpickod_h, 32, H)
 VPICKOD(vpickod_w, 64, W)
 VPICKOD(vpickod_d, 128, D)
+
+#define VILVL(NAME, BIT, E)                              \
+void HELPER(NAME)(CPULoongArchState *env,                \
+                  uint32_t vd, uint32_t vj, uint32_t vk) \
+{                                                        \
+    int i;                                               \
+    VReg temp;                                           \
+    VReg *Vd = &(env->fpr[vd].vreg);                     \
+    VReg *Vj = &(env->fpr[vj].vreg);                     \
+    VReg *Vk = &(env->fpr[vk].vreg);                     \
+                                                         \
+    for (i = 0; i < LSX_LEN/BIT; i++) {                  \
+        temp.E(2 * i + 1) = Vj->E(i);                    \
+        temp.E(2 * i) = Vk->E(i);                        \
+    }                                                    \
+    *Vd = temp;                                          \
+}
+
+VILVL(vilvl_b, 16, B)
+VILVL(vilvl_h, 32, H)
+VILVL(vilvl_w, 64, W)
+VILVL(vilvl_d, 128, D)
+
+#define VILVH(NAME, BIT, E)                              \
+void HELPER(NAME)(CPULoongArchState *env,                \
+                  uint32_t vd, uint32_t vj, uint32_t vk) \
+{                                                        \
+    int i;                                               \
+    VReg temp;                                           \
+    VReg *Vd = &(env->fpr[vd].vreg);                     \
+    VReg *Vj = &(env->fpr[vj].vreg);                     \
+    VReg *Vk = &(env->fpr[vk].vreg);                     \
+                                                         \
+    for (i = 0; i < LSX_LEN/BIT; i++) {                  \
+        temp.E(2 * i + 1) = Vj->E(i + LSX_LEN/BIT);      \
+        temp.E(2 * i) = Vk->E(i + LSX_LEN/BIT);          \
+    }                                                    \
+    *Vd = temp;                                          \
+}
+
+VILVH(vilvh_b, 16, B)
+VILVH(vilvh_h, 32, H)
+VILVH(vilvh_w, 64, W)
+VILVH(vilvh_d, 128, D)
+
+void HELPER(vshuf_b)(CPULoongArchState *env,
+                     uint32_t vd, uint32_t vj, uint32_t vk, uint32_t va)
+{
+    int i, m;
+    VReg temp;
+    VReg *Vd = &(env->fpr[vd].vreg);
+    VReg *Vj = &(env->fpr[vj].vreg);
+    VReg *Vk = &(env->fpr[vk].vreg);
+    VReg *Va = &(env->fpr[va].vreg);
+
+    m = LSX_LEN/8;
+    for (i = 0; i < m ; i++) {
+        uint64_t k = (uint8_t)Va->B(i) % (2 * m);
+        temp.B(i) = k < m ? Vk->B(k) : Vj->B(k - m);
+    }
+    *Vd = temp;
+}
+
+#define VSHUF(NAME, BIT, E)                              \
+void HELPER(NAME)(CPULoongArchState *env,                \
+                  uint32_t vd, uint32_t vj, uint32_t vk) \
+{                                                        \
+    int i, m;                                            \
+    VReg temp;                                           \
+    VReg *Vd = &(env->fpr[vd].vreg);                     \
+    VReg *Vj = &(env->fpr[vj].vreg);                     \
+    VReg *Vk = &(env->fpr[vk].vreg);                     \
+                                                         \
+    m = LSX_LEN/BIT;                                     \
+    for (i = 0; i < m; i++) {                            \
+        uint64_t k  = ((uint8_t) Vd->E(i)) % (2 * m);    \
+        temp.E(i) = k < m ? Vk->E(k) : Vj->E(k - m);     \
+    }                                                    \
+    *Vd = temp;                                          \
+}
+
+VSHUF(vshuf_h, 16, H)
+VSHUF(vshuf_w, 32, W)
+VSHUF(vshuf_d, 64, D)
+
+#define VSHUF4I(NAME, BIT, E)                             \
+void HELPER(NAME)(CPULoongArchState *env,                 \
+                  uint32_t vd, uint32_t vj, uint32_t imm) \
+{                                                         \
+    int i;                                                \
+    VReg temp;                                            \
+    VReg *Vd = &(env->fpr[vd].vreg);                      \
+    VReg *Vj = &(env->fpr[vj].vreg);                      \
+                                                          \
+    for (i = 0; i < LSX_LEN/BIT; i++) {                   \
+         temp.E(i) = Vj->E(((i) & 0xfc) + (((imm) >>      \
+                           (2 * ((i) & 0x03))) & 0x03));  \
+    }                                                     \
+    *Vd = temp;                                           \
+}
+
+VSHUF4I(vshuf4i_b, 8, B)
+VSHUF4I(vshuf4i_h, 16, H)
+VSHUF4I(vshuf4i_w, 32, W)
+
+void HELPER(vshuf4i_d)(CPULoongArchState *env,
+                       uint32_t vd, uint32_t vj, uint32_t imm)
+{
+    VReg *Vd = &(env->fpr[vd].vreg);
+    VReg *Vj = &(env->fpr[vj].vreg);
+
+    VReg temp;
+    temp.D(0) = (imm & 2 ? Vj : Vd)->D(imm & 1);
+    temp.D(1) = (imm & 8 ? Vj : Vd)->D((imm >> 2) & 1);
+    *Vd = temp;
+}
+
+void HELPER(vpermi_w)(CPULoongArchState *env,
+                      uint32_t vd, uint32_t vj, uint32_t imm)
+{
+    VReg temp;
+    VReg *Vd = &(env->fpr[vd].vreg);
+    VReg *Vj = &(env->fpr[vj].vreg);
+
+    temp.W(0) = Vj->W(imm & 0x3);
+    temp.W(1) = Vj->W((imm >> 2) & 0x3);
+    temp.W(2) = Vd->W((imm >> 4) & 0x3);
+    temp.W(3) = Vd->W((imm >> 6) & 0x3);
+    *Vd = temp;
+}
+
+#define VEXTRINS(NAME, BIT, E, MASK)                      \
+void HELPER(NAME)(CPULoongArchState *env,                 \
+                  uint32_t vd, uint32_t vj, uint32_t imm) \
+{                                                         \
+    int ins, extr;                                        \
+    VReg *Vd = &(env->fpr[vd].vreg);                      \
+    VReg *Vj = &(env->fpr[vj].vreg);                      \
+                                                          \
+    ins = (imm >> 4) & MASK;                              \
+    extr = imm & MASK;                                    \
+    Vd->E(ins) = Vj->E(extr);                             \
+}
+
+VEXTRINS(vextrins_b, 8, B, 0xf)
+VEXTRINS(vextrins_h, 16, H, 0x7)
+VEXTRINS(vextrins_w, 32, W, 0x3)
+VEXTRINS(vextrins_d, 64, D, 0x1)
-- 
2.31.1


