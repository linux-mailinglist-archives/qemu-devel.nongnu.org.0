Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DBFC65592D
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Dec 2022 09:21:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8zj9-0006Se-MU; Sat, 24 Dec 2022 03:17:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1p8ziJ-00068l-TF
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 03:17:07 -0500
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1p8ziF-00013z-MQ
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 03:17:03 -0500
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8Cx6+pttaZjQkkIAA--.18699S3;
 Sat, 24 Dec 2022 16:16:45 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8CxPuRhtaZjuccKAA--.38440S27; 
 Sat, 24 Dec 2022 16:16:45 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org
Subject: [RFC PATCH 25/43] target/loongarch: Implement vsrlr vsrar
Date: Sat, 24 Dec 2022 16:16:15 +0800
Message-Id: <20221224081633.4185445-26-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20221224081633.4185445-1-gaosong@loongson.cn>
References: <20221224081633.4185445-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8CxPuRhtaZjuccKAA--.38440S27
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoW3Jw1DKr47Jw4UGF4DXryrWFg_yoWfGFyrp3
 yUKryUKr4DJFZFq3Z2yw1Sy3WvqrnrKw1fuw4ftr1Uu3y7JF9rXrykt3y2gF48Cr98tFy0
 g3W7CrWqyFy5Jw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 be8Fc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4
 AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF
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
- VSRLR[I].{B/H/W/D};
- VSRAR[I].{B/H/W/D}.

Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 target/loongarch/disas.c                    |  18 +++
 target/loongarch/helper.h                   |  18 +++
 target/loongarch/insn_trans/trans_lsx.c.inc |  18 +++
 target/loongarch/insns.decode               |  18 +++
 target/loongarch/lsx_helper.c               | 124 ++++++++++++++++++++
 5 files changed, 196 insertions(+)

diff --git a/target/loongarch/disas.c b/target/loongarch/disas.c
index 18c4fd521a..766d934705 100644
--- a/target/loongarch/disas.c
+++ b/target/loongarch/disas.c
@@ -1119,3 +1119,21 @@ INSN_LSX(vsllwil_hu_bu,    vv_i)
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
index e3ec216b14..65438c00f1 100644
--- a/target/loongarch/helper.h
+++ b/target/loongarch/helper.h
@@ -474,3 +474,21 @@ DEF_HELPER_4(vsllwil_hu_bu, void, env, i32, i32, i32)
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
index 8193e66fff..9196ec3ed7 100644
--- a/target/loongarch/insn_trans/trans_lsx.c.inc
+++ b/target/loongarch/insn_trans/trans_lsx.c.inc
@@ -390,3 +390,21 @@ TRANS(vsllwil_hu_bu, gen_vv_i, gen_helper_vsllwil_hu_bu)
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
index 29609b834e..eef25e2eef 100644
--- a/target/loongarch/insns.decode
+++ b/target/loongarch/insns.decode
@@ -847,3 +847,21 @@ vsllwil_hu_bu    0111 00110000 11000 01 ... ..... .....   @vv_ui3
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
index 91c1964d81..529a81372b 100644
--- a/target/loongarch/lsx_helper.c
+++ b/target/loongarch/lsx_helper.c
@@ -2258,3 +2258,127 @@ DO_HELPER_VV_I(vsllwil_hu_bu, 16, helper_vv_i_c, do_vsllwil_u)
 DO_HELPER_VV_I(vsllwil_wu_hu, 32, helper_vv_i_c, do_vsllwil_u)
 DO_HELPER_VV_I(vsllwil_du_wu, 64, helper_vv_i_c, do_vsllwil_u)
 DO_HELPER_VV(vextl_qu_du, 128, helper_vv, do_vextl_qu_du)
+
+static int64_t vsrlr(int64_t s1, int64_t s2, int bit)
+{
+    uint64_t umax = MAKE_64BIT_MASK(0, bit);
+    uint64_t u1 = s1 & umax;
+    int32_t n = (uint64_t)(s2 % bit);
+
+    if (n == 0) {
+        return u1;
+    } else {
+        uint64_t r_bit = (u1 >> (n  -1)) & 1;
+        return (u1 >> n) + r_bit;
+    }
+}
+
+static void do_vsrlr(vec_t *Vd, vec_t *Vj, vec_t *Vk, int bit, int n)
+{
+    switch (bit) {
+    case 8:
+        Vd->B[n] = vsrlr(Vj->B[n], Vk->B[n], bit);
+        break;
+    case 16:
+        Vd->H[n] = vsrlr(Vj->H[n], Vk->H[n], bit);
+        break;
+    case 32:
+        Vd->W[n] = vsrlr(Vj->W[n], Vk->W[n], bit);
+        break;
+    case 64:
+        Vd->D[n] = vsrlr(Vj->D[n], Vk->D[n], bit);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static void do_vsrlri(vec_t *Vd, vec_t *Vj, uint32_t imm, int bit, int n)
+{
+    switch (bit) {
+    case 8:
+        Vd->B[n] = vsrlr(Vj->B[n], imm, bit);
+        break;
+    case 16:
+        Vd->H[n] = vsrlr(Vj->H[n], imm, bit);
+        break;
+    case 32:
+        Vd->W[n] = vsrlr(Vj->W[n], imm, bit);
+        break;
+    case 64:
+        Vd->D[n] = vsrlr(Vj->D[n], imm, bit);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+DO_HELPER_VVV(vsrlr_b, 8, helper_vvv, do_vsrlr)
+DO_HELPER_VVV(vsrlr_h, 16, helper_vvv, do_vsrlr)
+DO_HELPER_VVV(vsrlr_w, 32, helper_vvv, do_vsrlr)
+DO_HELPER_VVV(vsrlr_d, 64, helper_vvv, do_vsrlr)
+DO_HELPER_VVV(vsrlri_b, 8, helper_vv_i, do_vsrlri)
+DO_HELPER_VVV(vsrlri_h, 16, helper_vv_i, do_vsrlri)
+DO_HELPER_VVV(vsrlri_w, 32, helper_vv_i, do_vsrlri)
+DO_HELPER_VVV(vsrlri_d, 64, helper_vv_i, do_vsrlri)
+
+static int64_t vsrar(int64_t s1, int64_t s2, int bit)
+{
+    int32_t n = (uint64_t)(s2 % bit);
+
+    if (n == 0) {
+        return s1;
+    } else {
+        uint64_t r_bit = (s1 >> (n  -1)) & 1;
+        return (s1 >> n) + r_bit;
+    }
+}
+
+static void do_vsrar(vec_t *Vd, vec_t *Vj, vec_t *Vk, int bit, int n)
+{
+    switch (bit) {
+    case 8:
+        Vd->B[n] = vsrar(Vj->B[n], Vk->B[n], bit);
+        break;
+    case 16:
+        Vd->H[n] = vsrar(Vj->H[n], Vk->H[n], bit);
+        break;
+    case 32:
+        Vd->W[n] = vsrar(Vj->W[n], Vk->W[n], bit);
+        break;
+    case 64:
+        Vd->D[n] = vsrar(Vj->D[n], Vk->D[n], bit);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static void do_vsrari(vec_t *Vd, vec_t *Vj, uint32_t imm, int bit, int n)
+{
+    switch (bit) {
+    case 8:
+        Vd->B[n] = vsrar(Vj->B[n], imm, bit);
+        break;
+    case 16:
+        Vd->H[n] = vsrar(Vj->H[n], imm, bit);
+        break;
+    case 32:
+        Vd->W[n] = vsrar(Vj->W[n], imm, bit);
+        break;
+    case 64:
+        Vd->D[n] = vsrar(Vj->D[n], imm, bit);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+DO_HELPER_VVV(vsrar_b, 8, helper_vvv, do_vsrar)
+DO_HELPER_VVV(vsrar_h, 16, helper_vvv, do_vsrar)
+DO_HELPER_VVV(vsrar_w, 32, helper_vvv, do_vsrar)
+DO_HELPER_VVV(vsrar_d, 64, helper_vvv, do_vsrar)
+DO_HELPER_VVV(vsrari_b, 8, helper_vv_i, do_vsrari)
+DO_HELPER_VVV(vsrari_h, 16, helper_vv_i, do_vsrari)
+DO_HELPER_VVV(vsrari_w, 32, helper_vv_i, do_vsrari)
+DO_HELPER_VVV(vsrari_d, 64, helper_vv_i, do_vsrari)
-- 
2.31.1


