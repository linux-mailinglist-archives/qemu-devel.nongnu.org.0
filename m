Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1016EDC39
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 09:10:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prChu-0001LG-2N; Tue, 25 Apr 2023 03:03:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1prChp-0001Jo-K2
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 03:03:17 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1prChZ-0007zd-HQ
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 03:03:17 -0400
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8CxuOkie0dkdF8AAA--.632S3;
 Tue, 25 Apr 2023 15:02:58 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Cxeb0Ye0dk3Eo6AA--.4591S10; 
 Tue, 25 Apr 2023 15:02:57 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	gaosong@loongson.cn
Subject: [RFC PATCH v4 08/44] target/loongarch: Implement vhaddw/vhsubw
Date: Tue, 25 Apr 2023 15:02:12 +0800
Message-Id: <20230425070248.2550028-9-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230425070248.2550028-1-gaosong@loongson.cn>
References: <20230425070248.2550028-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Cxeb0Ye0dk3Eo6AA--.4591S10
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoW3Wr48urWxur1kJF1DtF4fZrb_yoW3tr13pa
 12kr1UGF48Ja97J3WSvw4YgwsFgrnrK3W7ua1rt3WUXFW7XF1DXryvqw4F9a9rWanagFy0
 g3W3A342yFyrJaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bnkFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4
 AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF
 7I0E14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6x
 kF7I0E14v26r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020E
 x4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E74AGY7Cv6cx26rWlOx8S6xCaFV
 Cjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7VAKI48JMxAIw28IcVCjz48v
 1sIEY20_WwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I
 0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jrv_JF1lIxkGc2Ij64vIr41lIxAI
 cVC0I7IYx2IY67AKxVW8JVW5JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcV
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
- VHADDW.{H.B/W.H/D.W/Q.D/HU.BU/WU.HU/DU.WU/QU.DU};
- VHSUBW.{H.B/W.H/D.W/Q.D/HU.BU/WU.HU/DU.WU/QU.DU}.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 target/loongarch/disas.c                    | 17 +++++
 target/loongarch/helper.h                   | 18 +++++
 target/loongarch/insn_trans/trans_lsx.c.inc | 17 +++++
 target/loongarch/insns.decode               | 17 +++++
 target/loongarch/lsx_helper.c               | 81 +++++++++++++++++++++
 5 files changed, 150 insertions(+)

diff --git a/target/loongarch/disas.c b/target/loongarch/disas.c
index b7f9320ba0..adfd693938 100644
--- a/target/loongarch/disas.c
+++ b/target/loongarch/disas.c
@@ -848,3 +848,20 @@ INSN_LSX(vssub_bu,         vvv)
 INSN_LSX(vssub_hu,         vvv)
 INSN_LSX(vssub_wu,         vvv)
 INSN_LSX(vssub_du,         vvv)
+
+INSN_LSX(vhaddw_h_b,       vvv)
+INSN_LSX(vhaddw_w_h,       vvv)
+INSN_LSX(vhaddw_d_w,       vvv)
+INSN_LSX(vhaddw_q_d,       vvv)
+INSN_LSX(vhaddw_hu_bu,     vvv)
+INSN_LSX(vhaddw_wu_hu,     vvv)
+INSN_LSX(vhaddw_du_wu,     vvv)
+INSN_LSX(vhaddw_qu_du,     vvv)
+INSN_LSX(vhsubw_h_b,       vvv)
+INSN_LSX(vhsubw_w_h,       vvv)
+INSN_LSX(vhsubw_d_w,       vvv)
+INSN_LSX(vhsubw_q_d,       vvv)
+INSN_LSX(vhsubw_hu_bu,     vvv)
+INSN_LSX(vhsubw_wu_hu,     vvv)
+INSN_LSX(vhsubw_du_wu,     vvv)
+INSN_LSX(vhsubw_qu_du,     vvv)
diff --git a/target/loongarch/helper.h b/target/loongarch/helper.h
index 9c01823a26..6d58dabaed 100644
--- a/target/loongarch/helper.h
+++ b/target/loongarch/helper.h
@@ -130,3 +130,21 @@ DEF_HELPER_4(ldpte, void, env, tl, tl, i32)
 DEF_HELPER_1(ertn, void, env)
 DEF_HELPER_1(idle, void, env)
 #endif
+
+/* LoongArch LSX  */
+DEF_HELPER_4(vhaddw_h_b, void, env, i32, i32, i32)
+DEF_HELPER_4(vhaddw_w_h, void, env, i32, i32, i32)
+DEF_HELPER_4(vhaddw_d_w, void, env, i32, i32, i32)
+DEF_HELPER_4(vhaddw_q_d, void, env, i32, i32, i32)
+DEF_HELPER_4(vhaddw_hu_bu, void, env, i32, i32, i32)
+DEF_HELPER_4(vhaddw_wu_hu, void, env, i32, i32, i32)
+DEF_HELPER_4(vhaddw_du_wu, void, env, i32, i32, i32)
+DEF_HELPER_4(vhaddw_qu_du, void, env, i32, i32, i32)
+DEF_HELPER_4(vhsubw_h_b, void, env, i32, i32, i32)
+DEF_HELPER_4(vhsubw_w_h, void, env, i32, i32, i32)
+DEF_HELPER_4(vhsubw_d_w, void, env, i32, i32, i32)
+DEF_HELPER_4(vhsubw_q_d, void, env, i32, i32, i32)
+DEF_HELPER_4(vhsubw_hu_bu, void, env, i32, i32, i32)
+DEF_HELPER_4(vhsubw_wu_hu, void, env, i32, i32, i32)
+DEF_HELPER_4(vhsubw_du_wu, void, env, i32, i32, i32)
+DEF_HELPER_4(vhsubw_qu_du, void, env, i32, i32, i32)
diff --git a/target/loongarch/insn_trans/trans_lsx.c.inc b/target/loongarch/insn_trans/trans_lsx.c.inc
index 082bd738ce..562096c0d7 100644
--- a/target/loongarch/insn_trans/trans_lsx.c.inc
+++ b/target/loongarch/insn_trans/trans_lsx.c.inc
@@ -157,3 +157,20 @@ TRANS(vssub_bu, gvec_vvv, MO_8, tcg_gen_gvec_ussub)
 TRANS(vssub_hu, gvec_vvv, MO_16, tcg_gen_gvec_ussub)
 TRANS(vssub_wu, gvec_vvv, MO_32, tcg_gen_gvec_ussub)
 TRANS(vssub_du, gvec_vvv, MO_64, tcg_gen_gvec_ussub)
+
+TRANS(vhaddw_h_b, gen_vvv, gen_helper_vhaddw_h_b)
+TRANS(vhaddw_w_h, gen_vvv, gen_helper_vhaddw_w_h)
+TRANS(vhaddw_d_w, gen_vvv, gen_helper_vhaddw_d_w)
+TRANS(vhaddw_q_d, gen_vvv, gen_helper_vhaddw_q_d)
+TRANS(vhaddw_hu_bu, gen_vvv, gen_helper_vhaddw_hu_bu)
+TRANS(vhaddw_wu_hu, gen_vvv, gen_helper_vhaddw_wu_hu)
+TRANS(vhaddw_du_wu, gen_vvv, gen_helper_vhaddw_du_wu)
+TRANS(vhaddw_qu_du, gen_vvv, gen_helper_vhaddw_qu_du)
+TRANS(vhsubw_h_b, gen_vvv, gen_helper_vhsubw_h_b)
+TRANS(vhsubw_w_h, gen_vvv, gen_helper_vhsubw_w_h)
+TRANS(vhsubw_d_w, gen_vvv, gen_helper_vhsubw_d_w)
+TRANS(vhsubw_q_d, gen_vvv, gen_helper_vhsubw_q_d)
+TRANS(vhsubw_hu_bu, gen_vvv, gen_helper_vhsubw_hu_bu)
+TRANS(vhsubw_wu_hu, gen_vvv, gen_helper_vhsubw_wu_hu)
+TRANS(vhsubw_du_wu, gen_vvv, gen_helper_vhsubw_du_wu)
+TRANS(vhsubw_qu_du, gen_vvv, gen_helper_vhsubw_qu_du)
diff --git a/target/loongarch/insns.decode b/target/loongarch/insns.decode
index 3a29f0a9ab..10a20858e5 100644
--- a/target/loongarch/insns.decode
+++ b/target/loongarch/insns.decode
@@ -542,3 +542,20 @@ vssub_bu         0111 00000100 11000 ..... ..... .....    @vvv
 vssub_hu         0111 00000100 11001 ..... ..... .....    @vvv
 vssub_wu         0111 00000100 11010 ..... ..... .....    @vvv
 vssub_du         0111 00000100 11011 ..... ..... .....    @vvv
+
+vhaddw_h_b       0111 00000101 01000 ..... ..... .....    @vvv
+vhaddw_w_h       0111 00000101 01001 ..... ..... .....    @vvv
+vhaddw_d_w       0111 00000101 01010 ..... ..... .....    @vvv
+vhaddw_q_d       0111 00000101 01011 ..... ..... .....    @vvv
+vhaddw_hu_bu     0111 00000101 10000 ..... ..... .....    @vvv
+vhaddw_wu_hu     0111 00000101 10001 ..... ..... .....    @vvv
+vhaddw_du_wu     0111 00000101 10010 ..... ..... .....    @vvv
+vhaddw_qu_du     0111 00000101 10011 ..... ..... .....    @vvv
+vhsubw_h_b       0111 00000101 01100 ..... ..... .....    @vvv
+vhsubw_w_h       0111 00000101 01101 ..... ..... .....    @vvv
+vhsubw_d_w       0111 00000101 01110 ..... ..... .....    @vvv
+vhsubw_q_d       0111 00000101 01111 ..... ..... .....    @vvv
+vhsubw_hu_bu     0111 00000101 10100 ..... ..... .....    @vvv
+vhsubw_wu_hu     0111 00000101 10101 ..... ..... .....    @vvv
+vhsubw_du_wu     0111 00000101 10110 ..... ..... .....    @vvv
+vhsubw_qu_du     0111 00000101 10111 ..... ..... .....    @vvv
diff --git a/target/loongarch/lsx_helper.c b/target/loongarch/lsx_helper.c
index 9332163aff..7088b3e0ca 100644
--- a/target/loongarch/lsx_helper.c
+++ b/target/loongarch/lsx_helper.c
@@ -4,3 +4,84 @@
  *
  * Copyright (c) 2022-2023 Loongson Technology Corporation Limited
  */
+
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "exec/exec-all.h"
+#include "exec/helper-proto.h"
+
+#define DO_ADD(a, b)  (a + b)
+#define DO_SUB(a, b)  (a - b)
+
+#define DO_ODD_EVEN(NAME, BIT, E1, E2, DO_OP)                        \
+void HELPER(NAME)(CPULoongArchState *env,                            \
+                  uint32_t vd, uint32_t vj, uint32_t vk)             \
+{                                                                    \
+    int i;                                                           \
+    VReg *Vd = &(env->fpr[vd].vreg);                                 \
+    VReg *Vj = &(env->fpr[vj].vreg);                                 \
+    VReg *Vk = &(env->fpr[vk].vreg);                                 \
+    typedef __typeof(Vd->E1(0)) TD;                                  \
+                                                                     \
+    for (i = 0; i < LSX_LEN/BIT; i++) {                              \
+        Vd->E1(i) = DO_OP((TD)Vj->E2(2 * i + 1), (TD)Vk->E2(2 * i)); \
+    }                                                                \
+}
+
+DO_ODD_EVEN(vhaddw_h_b, 16, H, B, DO_ADD)
+DO_ODD_EVEN(vhaddw_w_h, 32, W, H, DO_ADD)
+DO_ODD_EVEN(vhaddw_d_w, 64, D, W, DO_ADD)
+
+void HELPER(vhaddw_q_d)(CPULoongArchState *env,
+                        uint32_t vd, uint32_t vj, uint32_t vk)
+{
+    VReg *Vd = &(env->fpr[vd].vreg);
+    VReg *Vj = &(env->fpr[vj].vreg);
+    VReg *Vk = &(env->fpr[vk].vreg);
+
+    Vd->Q(0) = int128_add(int128_makes64(Vj->D(1)), int128_makes64(Vk->D(0)));
+}
+
+DO_ODD_EVEN(vhsubw_h_b, 16, H, B, DO_SUB)
+DO_ODD_EVEN(vhsubw_w_h, 32, W, H, DO_SUB)
+DO_ODD_EVEN(vhsubw_d_w, 64, D, W, DO_SUB)
+
+void HELPER(vhsubw_q_d)(CPULoongArchState *env,
+                        uint32_t vd, uint32_t vj, uint32_t vk)
+{
+    VReg *Vd = &(env->fpr[vd].vreg);
+    VReg *Vj = &(env->fpr[vj].vreg);
+    VReg *Vk = &(env->fpr[vk].vreg);
+
+    Vd->Q(0) = int128_sub(int128_makes64(Vj->D(1)), int128_makes64(Vk->D(0)));
+}
+
+DO_ODD_EVEN(vhaddw_hu_bu, 16, UH, UB, DO_ADD)
+DO_ODD_EVEN(vhaddw_wu_hu, 32, UW, UH, DO_ADD)
+DO_ODD_EVEN(vhaddw_du_wu, 64, UD, UW, DO_ADD)
+
+void HELPER(vhaddw_qu_du)(CPULoongArchState *env,
+                          uint32_t vd, uint32_t vj, uint32_t vk)
+{
+    VReg *Vd = &(env->fpr[vd].vreg);
+    VReg *Vj = &(env->fpr[vj].vreg);
+    VReg *Vk = &(env->fpr[vk].vreg);
+
+    Vd->Q(0) = int128_add(int128_make64((uint64_t)Vj->D(1)),
+                          int128_make64((uint64_t)Vk->D(0)));
+}
+
+DO_ODD_EVEN(vhsubw_hu_bu, 16, UH, UB, DO_SUB)
+DO_ODD_EVEN(vhsubw_wu_hu, 32, UW, UH, DO_SUB)
+DO_ODD_EVEN(vhsubw_du_wu, 64, UD, UW, DO_SUB)
+
+void HELPER(vhsubw_qu_du)(CPULoongArchState *env,
+                          uint32_t vd, uint32_t vj, uint32_t vk)
+{
+    VReg *Vd = &(env->fpr[vd].vreg);
+    VReg *Vj = &(env->fpr[vj].vreg);
+    VReg *Vk = &(env->fpr[vk].vreg);
+
+    Vd->Q(0) = int128_sub(int128_make64((uint64_t)Vj->D(1)),
+                          int128_make64((uint64_t)Vk->D(0)));
+}
-- 
2.31.1


