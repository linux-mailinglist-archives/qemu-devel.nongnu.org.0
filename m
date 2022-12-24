Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6758365595B
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Dec 2022 09:38:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8zil-0006L0-GM; Sat, 24 Dec 2022 03:17:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1p8ziJ-00068j-Op
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 03:17:07 -0500
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1p8ziF-0000zf-Kn
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 03:17:03 -0500
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8AxhfBttaZjQEkIAA--.18519S3;
 Sat, 24 Dec 2022 16:16:45 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8CxPuRhtaZjuccKAA--.38440S26; 
 Sat, 24 Dec 2022 16:16:44 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org
Subject: [RFC PATCH 24/43] target/loongarch: Implement vsllwil vextl
Date: Sat, 24 Dec 2022 16:16:14 +0800
Message-Id: <20221224081633.4185445-25-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20221224081633.4185445-1-gaosong@loongson.cn>
References: <20221224081633.4185445-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8CxPuRhtaZjuccKAA--.38440S26
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoW3XFWxtw4UJr4UCrWxXw1UZFb_yoWxWw1rpr
 4UtryDKr48JFZ2v3ZYvayrAa1DZrs7Kw18uw4fta48urW7JFyqvrykt3y29Fs8Ga9xtry0
 v3W7A3yYyFW5Xw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bnxFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4
 AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF
 7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7
 CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2
 zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VCjz48v1sIEY20_WwAm72CE4IkC6x
 0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxF
 aVAv8VWrMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxV
 Cjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUXVWUAwCIc40Y0x0EwIxGrwCI42IY
 6xIIjxv20xvE14v26F1j6w1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6x
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
- VSLLWIL.{H.B/W.H/D.W};
- VSLLWIL.{HU.BU/WU.HU/DU.WU};
- VEXTL.Q.D, VEXTL.QU.DU.

Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 target/loongarch/disas.c                    |  9 +++
 target/loongarch/helper.h                   |  9 +++
 target/loongarch/insn_trans/trans_lsx.c.inc |  9 +++
 target/loongarch/insns.decode               |  9 +++
 target/loongarch/lsx_helper.c               | 71 +++++++++++++++++++++
 5 files changed, 107 insertions(+)

diff --git a/target/loongarch/disas.c b/target/loongarch/disas.c
index a422c9dfc8..18c4fd521a 100644
--- a/target/loongarch/disas.c
+++ b/target/loongarch/disas.c
@@ -1110,3 +1110,12 @@ INSN_LSX(vrotri_b,         vv_i)
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
index c7733a7180..e3ec216b14 100644
--- a/target/loongarch/helper.h
+++ b/target/loongarch/helper.h
@@ -465,3 +465,12 @@ DEF_HELPER_4(vrotri_b, void, env, i32, i32, i32)
 DEF_HELPER_4(vrotri_h, void, env, i32, i32, i32)
 DEF_HELPER_4(vrotri_w, void, env, i32, i32, i32)
 DEF_HELPER_4(vrotri_d, void, env, i32, i32, i32)
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
index 62aac7713b..8193e66fff 100644
--- a/target/loongarch/insn_trans/trans_lsx.c.inc
+++ b/target/loongarch/insn_trans/trans_lsx.c.inc
@@ -381,3 +381,12 @@ TRANS(vrotri_b, gen_vv_i, gen_helper_vrotri_b)
 TRANS(vrotri_h, gen_vv_i, gen_helper_vrotri_h)
 TRANS(vrotri_w, gen_vv_i, gen_helper_vrotri_w)
 TRANS(vrotri_d, gen_vv_i, gen_helper_vrotri_d)
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
index aca3267206..29609b834e 100644
--- a/target/loongarch/insns.decode
+++ b/target/loongarch/insns.decode
@@ -838,3 +838,12 @@ vrotri_b         0111 00101010 00000 01 ... ..... .....   @vv_ui3
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
index d8282b670e..91c1964d81 100644
--- a/target/loongarch/lsx_helper.c
+++ b/target/loongarch/lsx_helper.c
@@ -51,6 +51,24 @@ static  void helper_vv_i(CPULoongArchState *env,
     }
 }
 
+static void helper_vv_i_c(CPULoongArchState *env,
+                         uint32_t vd, uint32_t vj, uint32_t imm, int bit,
+                         void (*func)(vec_t*, vec_t*, uint32_t, int, int))
+{
+    int i;
+    vec_t *Vd = &(env->fpr[vd].vec);
+    vec_t *Vj = &(env->fpr[vj].vec);
+
+    vec_t dest;
+    dest.D[0] = 0;
+    dest.D[1] = 0;
+    for (i = 0; i < LSX_LEN/bit; i++) {
+         func(&dest, Vj, imm, bit, i);
+    }
+    Vd->D[0] = dest.D[0];
+    Vd->D[1] = dest.D[1];
+}
+
 static void helper_vv(CPULoongArchState *env,
                       uint32_t vd, uint32_t vj, int bit,
                       void (*func)(vec_t*, vec_t*, int, int))
@@ -2187,3 +2205,56 @@ DO_HELPER_VV_I(vrotri_b, 8, helper_vv_i, do_vrotri)
 DO_HELPER_VV_I(vrotri_h, 16, helper_vv_i, do_vrotri)
 DO_HELPER_VV_I(vrotri_w, 32, helper_vv_i, do_vrotri)
 DO_HELPER_VV_I(vrotri_d, 64, helper_vv_i, do_vrotri)
+
+static void do_vsllwil_s(vec_t *Vd, vec_t *Vj, uint32_t imm, int bit, int n)
+{
+    switch (bit) {
+    case 16:
+        Vd->H[n] = ((int8_t)Vj->B[n]) << ((uint64_t)(imm) % bit);
+        break;
+    case 32:
+        Vd->W[n] = ((int16_t)Vj->H[n]) << ((uint64_t)(imm) % bit);
+        break;
+    case 64:
+        Vd->D[n] = ((int64_t)(int32_t)Vj->W[n]) << ((uint64_t)(imm) % bit);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static void do_vextl_q_d(vec_t *Vd, vec_t *Vj, int bit, int n)
+{
+    Vd->Q[0] = (__int128_t)Vj->D[0];
+}
+
+static void do_vsllwil_u(vec_t *Vd, vec_t *Vj, uint32_t imm, int bit, int n)
+{
+    switch (bit) {
+    case 16:
+        Vd->H[n] = ((uint8_t)Vj->B[n]) << ((uint64_t)(imm) % bit);
+        break;
+    case 32:
+        Vd->W[n] = ((uint16_t)Vj->H[n]) << ((uint64_t)(imm) % bit);
+        break;
+    case 64:
+        Vd->D[n] = ((uint64_t)(uint32_t)Vj->W[n]) << ((uint64_t)(imm) % bit);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static void do_vextl_qu_du(vec_t *Vd, vec_t *Vj, int bit, int n)
+{
+     Vd->Q[0] = (uint64_t)Vj->D[0];
+}
+
+DO_HELPER_VV_I(vsllwil_h_b, 16, helper_vv_i_c, do_vsllwil_s)
+DO_HELPER_VV_I(vsllwil_w_h, 32, helper_vv_i_c, do_vsllwil_s)
+DO_HELPER_VV_I(vsllwil_d_w, 64, helper_vv_i_c, do_vsllwil_s)
+DO_HELPER_VV(vextl_q_d, 128, helper_vv, do_vextl_q_d)
+DO_HELPER_VV_I(vsllwil_hu_bu, 16, helper_vv_i_c, do_vsllwil_u)
+DO_HELPER_VV_I(vsllwil_wu_hu, 32, helper_vv_i_c, do_vsllwil_u)
+DO_HELPER_VV_I(vsllwil_du_wu, 64, helper_vv_i_c, do_vsllwil_u)
+DO_HELPER_VV(vextl_qu_du, 128, helper_vv, do_vextl_qu_du)
-- 
2.31.1


