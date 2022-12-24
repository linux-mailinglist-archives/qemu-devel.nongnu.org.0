Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD37655939
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Dec 2022 09:26:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8zjB-0006WB-21; Sat, 24 Dec 2022 03:17:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1p8ziN-00068y-0e
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 03:17:08 -0500
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1p8ziF-00013V-M2
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 03:17:05 -0500
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8Bx2+pstaZjP0kIAA--.18618S3;
 Sat, 24 Dec 2022 16:16:44 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8CxPuRhtaZjuccKAA--.38440S25; 
 Sat, 24 Dec 2022 16:16:43 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org
Subject: [RFC PATCH 23/43] target/loongarch: Implement vsll vsrl vsra vrotr
Date: Sat, 24 Dec 2022 16:16:13 +0800
Message-Id: <20221224081633.4185445-24-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20221224081633.4185445-1-gaosong@loongson.cn>
References: <20221224081633.4185445-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8CxPuRhtaZjuccKAA--.38440S25
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvAXoW3ZrW7Gr4kJF48uF1xJr43Wrg_yoW8GF1Duo
 W8Jw15Jw18Jr1Sy3sFka4Du3Wkt340yw1DGFWkWwnrJFWrAr43try5K34rAayxKa1Ygw17
 C39xJrW5tF1aqr1kn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXasCq-sGcSsGvf
 J3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnRJU
 UUqv1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64
 kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY
 1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6x
 kF7I0E14v26r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020E
 x4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E74AGY7Cv6cx26rWlOx8S6xCaFV
 Cjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7VAKI48JMxAIw28IcVCjz48v
 1sIEY20_WwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I
 0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jrv_JF1lIxkGc2Ij64vIr41lIxAI
 cVC0I7IYx2IY67AKxVW7JVWDJwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcV
 CF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIE
 c7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0zRVWlkUUUUU=
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
- VSLL[I].{B/H/W/D};
- VSRL[I].{B/H/W/D};
- VSRA[I].{B/H/W/D};
- VROTR[I].{B/H/W/D}.

Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 target/loongarch/disas.c                    |  36 ++++
 target/loongarch/helper.h                   |  36 ++++
 target/loongarch/insn_trans/trans_lsx.c.inc |  36 ++++
 target/loongarch/insns.decode               |  36 ++++
 target/loongarch/lsx_helper.c               | 213 ++++++++++++++++++++
 5 files changed, 357 insertions(+)

diff --git a/target/loongarch/disas.c b/target/loongarch/disas.c
index 3e8015ac0e..a422c9dfc8 100644
--- a/target/loongarch/disas.c
+++ b/target/loongarch/disas.c
@@ -1074,3 +1074,39 @@ INSN_LSX(vandi_b,          vv_i)
 INSN_LSX(vori_b,           vv_i)
 INSN_LSX(vxori_b,          vv_i)
 INSN_LSX(vnori_b,          vv_i)
+
+INSN_LSX(vsll_b,           vvv)
+INSN_LSX(vsll_h,           vvv)
+INSN_LSX(vsll_w,           vvv)
+INSN_LSX(vsll_d,           vvv)
+INSN_LSX(vslli_b,          vv_i)
+INSN_LSX(vslli_h,          vv_i)
+INSN_LSX(vslli_w,          vv_i)
+INSN_LSX(vslli_d,          vv_i)
+
+INSN_LSX(vsrl_b,           vvv)
+INSN_LSX(vsrl_h,           vvv)
+INSN_LSX(vsrl_w,           vvv)
+INSN_LSX(vsrl_d,           vvv)
+INSN_LSX(vsrli_b,          vv_i)
+INSN_LSX(vsrli_h,          vv_i)
+INSN_LSX(vsrli_w,          vv_i)
+INSN_LSX(vsrli_d,          vv_i)
+
+INSN_LSX(vsra_b,           vvv)
+INSN_LSX(vsra_h,           vvv)
+INSN_LSX(vsra_w,           vvv)
+INSN_LSX(vsra_d,           vvv)
+INSN_LSX(vsrai_b,          vv_i)
+INSN_LSX(vsrai_h,          vv_i)
+INSN_LSX(vsrai_w,          vv_i)
+INSN_LSX(vsrai_d,          vv_i)
+
+INSN_LSX(vrotr_b,          vvv)
+INSN_LSX(vrotr_h,          vvv)
+INSN_LSX(vrotr_w,          vvv)
+INSN_LSX(vrotr_d,          vvv)
+INSN_LSX(vrotri_b,         vv_i)
+INSN_LSX(vrotri_h,         vv_i)
+INSN_LSX(vrotri_w,         vv_i)
+INSN_LSX(vrotri_d,         vv_i)
diff --git a/target/loongarch/helper.h b/target/loongarch/helper.h
index 77b576f22f..c7733a7180 100644
--- a/target/loongarch/helper.h
+++ b/target/loongarch/helper.h
@@ -429,3 +429,39 @@ DEF_HELPER_4(vandi_b, void, env, i32, i32, i32)
 DEF_HELPER_4(vori_b, void, env, i32, i32, i32)
 DEF_HELPER_4(vxori_b, void, env, i32, i32, i32)
 DEF_HELPER_4(vnori_b, void, env, i32, i32, i32)
+
+DEF_HELPER_4(vsll_b, void, env, i32, i32, i32)
+DEF_HELPER_4(vsll_h, void, env, i32, i32, i32)
+DEF_HELPER_4(vsll_w, void, env, i32, i32, i32)
+DEF_HELPER_4(vsll_d, void, env, i32, i32, i32)
+DEF_HELPER_4(vslli_b, void, env, i32, i32, i32)
+DEF_HELPER_4(vslli_h, void, env, i32, i32, i32)
+DEF_HELPER_4(vslli_w, void, env, i32, i32, i32)
+DEF_HELPER_4(vslli_d, void, env, i32, i32, i32)
+
+DEF_HELPER_4(vsrl_b, void, env, i32, i32, i32)
+DEF_HELPER_4(vsrl_h, void, env, i32, i32, i32)
+DEF_HELPER_4(vsrl_w, void, env, i32, i32, i32)
+DEF_HELPER_4(vsrl_d, void, env, i32, i32, i32)
+DEF_HELPER_4(vsrli_b, void, env, i32, i32, i32)
+DEF_HELPER_4(vsrli_h, void, env, i32, i32, i32)
+DEF_HELPER_4(vsrli_w, void, env, i32, i32, i32)
+DEF_HELPER_4(vsrli_d, void, env, i32, i32, i32)
+
+DEF_HELPER_4(vsra_b, void, env, i32, i32, i32)
+DEF_HELPER_4(vsra_h, void, env, i32, i32, i32)
+DEF_HELPER_4(vsra_w, void, env, i32, i32, i32)
+DEF_HELPER_4(vsra_d, void, env, i32, i32, i32)
+DEF_HELPER_4(vsrai_b, void, env, i32, i32, i32)
+DEF_HELPER_4(vsrai_h, void, env, i32, i32, i32)
+DEF_HELPER_4(vsrai_w, void, env, i32, i32, i32)
+DEF_HELPER_4(vsrai_d, void, env, i32, i32, i32)
+
+DEF_HELPER_4(vrotr_b, void, env, i32, i32, i32)
+DEF_HELPER_4(vrotr_h, void, env, i32, i32, i32)
+DEF_HELPER_4(vrotr_w, void, env, i32, i32, i32)
+DEF_HELPER_4(vrotr_d, void, env, i32, i32, i32)
+DEF_HELPER_4(vrotri_b, void, env, i32, i32, i32)
+DEF_HELPER_4(vrotri_h, void, env, i32, i32, i32)
+DEF_HELPER_4(vrotri_w, void, env, i32, i32, i32)
+DEF_HELPER_4(vrotri_d, void, env, i32, i32, i32)
diff --git a/target/loongarch/insn_trans/trans_lsx.c.inc b/target/loongarch/insn_trans/trans_lsx.c.inc
index c12de1d3d4..62aac7713b 100644
--- a/target/loongarch/insn_trans/trans_lsx.c.inc
+++ b/target/loongarch/insn_trans/trans_lsx.c.inc
@@ -345,3 +345,39 @@ TRANS(vandi_b, gen_vv_i, gen_helper_vandi_b)
 TRANS(vori_b, gen_vv_i, gen_helper_vori_b)
 TRANS(vxori_b, gen_vv_i, gen_helper_vxori_b)
 TRANS(vnori_b, gen_vv_i, gen_helper_vnori_b)
+
+TRANS(vsll_b, gen_vvv, gen_helper_vsll_b)
+TRANS(vsll_h, gen_vvv, gen_helper_vsll_h)
+TRANS(vsll_w, gen_vvv, gen_helper_vsll_w)
+TRANS(vsll_d, gen_vvv, gen_helper_vsll_d)
+TRANS(vslli_b, gen_vv_i, gen_helper_vslli_b)
+TRANS(vslli_h, gen_vv_i, gen_helper_vslli_h)
+TRANS(vslli_w, gen_vv_i, gen_helper_vslli_w)
+TRANS(vslli_d, gen_vv_i, gen_helper_vslli_d)
+
+TRANS(vsrl_b, gen_vvv, gen_helper_vsrl_b)
+TRANS(vsrl_h, gen_vvv, gen_helper_vsrl_h)
+TRANS(vsrl_w, gen_vvv, gen_helper_vsrl_w)
+TRANS(vsrl_d, gen_vvv, gen_helper_vsrl_d)
+TRANS(vsrli_b, gen_vv_i, gen_helper_vsrli_b)
+TRANS(vsrli_h, gen_vv_i, gen_helper_vsrli_h)
+TRANS(vsrli_w, gen_vv_i, gen_helper_vsrli_w)
+TRANS(vsrli_d, gen_vv_i, gen_helper_vsrli_d)
+
+TRANS(vsra_b, gen_vvv, gen_helper_vsra_b)
+TRANS(vsra_h, gen_vvv, gen_helper_vsra_h)
+TRANS(vsra_w, gen_vvv, gen_helper_vsra_w)
+TRANS(vsra_d, gen_vvv, gen_helper_vsra_d)
+TRANS(vsrai_b, gen_vv_i, gen_helper_vsrai_b)
+TRANS(vsrai_h, gen_vv_i, gen_helper_vsrai_h)
+TRANS(vsrai_w, gen_vv_i, gen_helper_vsrai_w)
+TRANS(vsrai_d, gen_vv_i, gen_helper_vsrai_d)
+
+TRANS(vrotr_b, gen_vvv, gen_helper_vrotr_b)
+TRANS(vrotr_h, gen_vvv, gen_helper_vrotr_h)
+TRANS(vrotr_w, gen_vvv, gen_helper_vrotr_w)
+TRANS(vrotr_d, gen_vvv, gen_helper_vrotr_d)
+TRANS(vrotri_b, gen_vv_i, gen_helper_vrotri_b)
+TRANS(vrotri_h, gen_vv_i, gen_helper_vrotri_h)
+TRANS(vrotri_w, gen_vv_i, gen_helper_vrotri_w)
+TRANS(vrotri_d, gen_vv_i, gen_helper_vrotri_d)
diff --git a/target/loongarch/insns.decode b/target/loongarch/insns.decode
index 03b7f76712..aca3267206 100644
--- a/target/loongarch/insns.decode
+++ b/target/loongarch/insns.decode
@@ -802,3 +802,39 @@ vandi_b          0111 00111101 00 ........ ..... .....    @vv_ui8
 vori_b           0111 00111101 01 ........ ..... .....    @vv_ui8
 vxori_b          0111 00111101 10 ........ ..... .....    @vv_ui8
 vnori_b          0111 00111101 11 ........ ..... .....    @vv_ui8
+
+vsll_b           0111 00001110 10000 ..... ..... .....    @vvv
+vsll_h           0111 00001110 10001 ..... ..... .....    @vvv
+vsll_w           0111 00001110 10010 ..... ..... .....    @vvv
+vsll_d           0111 00001110 10011 ..... ..... .....    @vvv
+vslli_b          0111 00110010 11000 01 ... ..... .....   @vv_ui3
+vslli_h          0111 00110010 11000 1 .... ..... .....   @vv_ui4
+vslli_w          0111 00110010 11001 ..... ..... .....    @vv_ui5
+vslli_d          0111 00110010 1101 ...... ..... .....    @vv_ui6
+
+vsrl_b           0111 00001110 10100 ..... ..... .....    @vvv
+vsrl_h           0111 00001110 10101 ..... ..... .....    @vvv
+vsrl_w           0111 00001110 10110 ..... ..... .....    @vvv
+vsrl_d           0111 00001110 10111 ..... ..... .....    @vvv
+vsrli_b          0111 00110011 00000 01 ... ..... .....   @vv_ui3
+vsrli_h          0111 00110011 00000 1 .... ..... .....   @vv_ui4
+vsrli_w          0111 00110011 00001 ..... ..... .....    @vv_ui5
+vsrli_d          0111 00110011 0001 ...... ..... .....    @vv_ui6
+
+vsra_b           0111 00001110 11000 ..... ..... .....    @vvv
+vsra_h           0111 00001110 11001 ..... ..... .....    @vvv
+vsra_w           0111 00001110 11010 ..... ..... .....    @vvv
+vsra_d           0111 00001110 11011 ..... ..... .....    @vvv
+vsrai_b          0111 00110011 01000 01 ... ..... .....   @vv_ui3
+vsrai_h          0111 00110011 01000 1 .... ..... .....   @vv_ui4
+vsrai_w          0111 00110011 01001 ..... ..... .....    @vv_ui5
+vsrai_d          0111 00110011 0101 ...... ..... .....    @vv_ui6
+
+vrotr_b          0111 00001110 11100 ..... ..... .....    @vvv
+vrotr_h          0111 00001110 11101 ..... ..... .....    @vvv
+vrotr_w          0111 00001110 11110 ..... ..... .....    @vvv
+vrotr_d          0111 00001110 11111 ..... ..... .....    @vvv
+vrotri_b         0111 00101010 00000 01 ... ..... .....   @vv_ui3
+vrotri_h         0111 00101010 00000 1 .... ..... .....   @vv_ui4
+vrotri_w         0111 00101010 00001 ..... ..... .....    @vv_ui5
+vrotri_d         0111 00101010 0001 ...... ..... .....    @vv_ui6
diff --git a/target/loongarch/lsx_helper.c b/target/loongarch/lsx_helper.c
index c61479bf74..d8282b670e 100644
--- a/target/loongarch/lsx_helper.c
+++ b/target/loongarch/lsx_helper.c
@@ -1974,3 +1974,216 @@ DO_HELPER_VV_I(vandi_b, 8, helper_vv_i, do_vandi_b)
 DO_HELPER_VV_I(vori_b, 8, helper_vv_i, do_vori_b)
 DO_HELPER_VV_I(vxori_b, 8, helper_vv_i, do_vxori_b)
 DO_HELPER_VV_I(vnori_b, 8, helper_vv_i, do_vnori_b)
+
+static void do_vsll(vec_t *Vd, vec_t *Vj, vec_t *Vk, int bit, int n)
+{
+    switch (bit) {
+    case 8:
+        Vd->B[n] = Vj->B[n] << ((uint64_t)(Vk->B[n]) % bit);
+        break;
+    case 16:
+        Vd->H[n] = Vj->H[n] << ((uint64_t)(Vk->H[n]) % bit);
+        break;
+    case 32:
+        Vd->W[n] = Vj->W[n] << ((uint64_t)(Vk->W[n]) % bit);
+        break;
+    case 64:
+        Vd->D[n] = Vj->D[n] << ((uint64_t)(Vk->D[n]) % bit);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static void do_vslli(vec_t *Vd, vec_t *Vj, uint32_t imm, int bit, int n)
+{
+    switch (bit) {
+    case 8:
+        Vd->B[n] = Vj->B[n] << ((uint64_t)(imm) % bit);
+        break;
+    case 16:
+        Vd->H[n] = Vj->H[n] << ((uint64_t)(imm) % bit);
+        break;
+    case 32:
+        Vd->W[n] = Vj->W[n] << ((uint64_t)(imm) % bit);
+        break;
+    case 64:
+        Vd->D[n] = Vj->D[n] << ((uint64_t)(imm) % bit);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+DO_HELPER_VVV(vsll_b, 8, helper_vvv, do_vsll)
+DO_HELPER_VVV(vsll_h, 16, helper_vvv, do_vsll)
+DO_HELPER_VVV(vsll_w, 32, helper_vvv, do_vsll)
+DO_HELPER_VVV(vsll_d, 64, helper_vvv, do_vsll)
+DO_HELPER_VV_I(vslli_b, 8, helper_vv_i, do_vslli)
+DO_HELPER_VV_I(vslli_h, 16, helper_vv_i, do_vslli)
+DO_HELPER_VV_I(vslli_w, 32, helper_vv_i, do_vslli)
+DO_HELPER_VV_I(vslli_d, 64, helper_vv_i, do_vslli)
+
+static int64_t vsrl(int64_t s1, int64_t s2, int bit)
+{
+    uint64_t umax = MAKE_64BIT_MASK(0, bit);
+    uint64_t u1 = s1 & umax;
+
+    return u1 >> ((uint64_t)(s2) % bit);
+}
+
+static void do_vsrl(vec_t *Vd, vec_t *Vj, vec_t *Vk, int bit, int n)
+{
+    switch (bit) {
+    case 8:
+        Vd->B[n] = vsrl(Vj->B[n], Vk->B[n], bit);
+        break;
+    case 16:
+        Vd->H[n] = vsrl(Vj->H[n], Vk->H[n], bit);
+        break;
+    case 32:
+        Vd->W[n] = vsrl(Vj->W[n], Vk->W[n], bit);
+        break;
+    case 64:
+        Vd->D[n] = vsrl(Vj->D[n], Vk->D[n], bit);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static void do_vsrli(vec_t *Vd, vec_t *Vj, uint32_t imm, int bit, int n)
+{
+    switch (bit) {
+    case 8:
+        Vd->B[n] = vsrl(Vj->B[n], imm, bit);
+        break;
+    case 16:
+        Vd->H[n] = vsrl(Vj->H[n], imm, bit);
+        break;
+    case 32:
+        Vd->W[n] = vsrl(Vj->W[n], imm, bit);
+        break;
+    case 64:
+        Vd->D[n] = vsrl(Vj->D[n], imm, bit);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+DO_HELPER_VVV(vsrl_b, 8, helper_vvv, do_vsrl)
+DO_HELPER_VVV(vsrl_h, 16, helper_vvv, do_vsrl)
+DO_HELPER_VVV(vsrl_w, 32, helper_vvv, do_vsrl)
+DO_HELPER_VVV(vsrl_d, 64, helper_vvv, do_vsrl)
+DO_HELPER_VV_I(vsrli_b, 8, helper_vv_i, do_vsrli)
+DO_HELPER_VV_I(vsrli_h, 16, helper_vv_i, do_vsrli)
+DO_HELPER_VV_I(vsrli_w, 32, helper_vv_i, do_vsrli)
+DO_HELPER_VV_I(vsrli_d, 64, helper_vv_i, do_vsrli)
+
+static void do_vsra(vec_t *Vd, vec_t *Vj, vec_t *Vk, int bit, int n)
+{
+    switch (bit) {
+    case 8:
+        Vd->B[n] = Vj->B[n] >> ((uint64_t)(Vk->B[n]) % bit);
+        break;
+    case 16:
+        Vd->H[n] = Vj->H[n] >> ((uint64_t)(Vk->H[n]) % bit);
+        break;
+    case 32:
+        Vd->W[n] = Vj->W[n] >> ((uint64_t)(Vk->W[n]) % bit);
+        break;
+    case 64:
+        Vd->D[n] = Vj->D[n] >> ((uint64_t)(Vk->D[n]) % bit);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static void do_vsrai(vec_t *Vd, vec_t *Vj, uint32_t imm, int bit, int n)
+{
+    switch (bit) {
+    case 8:
+        Vd->B[n] = Vj->B[n] >> ((uint64_t)(imm) % bit);
+        break;
+    case 16:
+        Vd->H[n] = Vj->H[n] >> ((uint64_t)(imm) % bit);
+        break;
+    case 32:
+        Vd->W[n] = Vj->W[n] >> ((uint64_t)(imm) % bit);
+        break;
+    case 64:
+        Vd->D[n] = Vj->D[n] >> ((uint64_t)(imm) % bit);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+DO_HELPER_VVV(vsra_b, 8, helper_vvv, do_vsra)
+DO_HELPER_VVV(vsra_h, 16, helper_vvv, do_vsra)
+DO_HELPER_VVV(vsra_w, 32, helper_vvv, do_vsra)
+DO_HELPER_VVV(vsra_d, 64, helper_vvv, do_vsra)
+DO_HELPER_VV_I(vsrai_b, 8, helper_vv_i, do_vsrai)
+DO_HELPER_VV_I(vsrai_h, 16, helper_vv_i, do_vsrai)
+DO_HELPER_VV_I(vsrai_w, 32, helper_vv_i, do_vsrai)
+DO_HELPER_VV_I(vsrai_d, 64, helper_vv_i, do_vsrai)
+
+static uint64_t vrotr(int64_t s1, int64_t s2, int bit)
+{
+    uint64_t umax = MAKE_64BIT_MASK(0, bit);
+    uint64_t u1 = s1 & umax;
+    int32_t n = (uint64_t)(s2) % bit;
+
+    return u1 >> n | u1 << (bit - n);
+}
+
+static void do_vrotr(vec_t *Vd, vec_t *Vj, vec_t *Vk, int bit, int n)
+{
+    switch (bit) {
+    case 8:
+        Vd->B[n] = vrotr(Vj->B[n], Vk->B[n], bit);
+        break;
+    case 16:
+        Vd->H[n] = vrotr(Vj->H[n], Vk->H[n], bit);
+        break;
+    case 32:
+        Vd->W[n] = vrotr(Vj->W[n], Vk->W[n], bit);
+        break;
+    case 64:
+        Vd->D[n] = vrotr(Vj->D[n], Vk->D[n], bit);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static void do_vrotri(vec_t *Vd, vec_t *Vj, uint32_t imm, int bit, int n)
+{
+    switch (bit) {
+    case 8:
+        Vd->B[n] = vrotr(Vj->B[n], imm, bit);
+        break;
+    case 16:
+        Vd->H[n] = vrotr(Vj->H[n], imm, bit);
+        break;
+    case 32:
+        Vd->W[n] = vrotr(Vj->W[n], imm, bit);
+        break;
+    case 64:
+        Vd->D[n] = vrotr(Vj->D[n], imm, bit);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+DO_HELPER_VVV(vrotr_b, 8, helper_vvv, do_vrotr)
+DO_HELPER_VVV(vrotr_h, 16, helper_vvv, do_vrotr)
+DO_HELPER_VVV(vrotr_w, 32, helper_vvv, do_vrotr)
+DO_HELPER_VVV(vrotr_d, 64, helper_vvv, do_vrotr)
+DO_HELPER_VV_I(vrotri_b, 8, helper_vv_i, do_vrotri)
+DO_HELPER_VV_I(vrotri_h, 16, helper_vv_i, do_vrotri)
+DO_HELPER_VV_I(vrotri_w, 32, helper_vv_i, do_vrotri)
+DO_HELPER_VV_I(vrotri_d, 64, helper_vv_i, do_vrotri)
-- 
2.31.1


