Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1DFB65595D
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Dec 2022 09:39:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8zj8-0006QC-L6; Sat, 24 Dec 2022 03:17:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1p8ziC-00068S-N0
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 03:17:03 -0500
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1p8ziA-0000ml-8K
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 03:16:56 -0500
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8DxvutptaZjMkkIAA--.18824S3;
 Sat, 24 Dec 2022 16:16:41 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8CxPuRhtaZjuccKAA--.38440S19; 
 Sat, 24 Dec 2022 16:16:41 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org
Subject: [RFC PATCH 17/43] target/loongarch: Implement vdiv/vmod
Date: Sat, 24 Dec 2022 16:16:07 +0800
Message-Id: <20221224081633.4185445-18-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20221224081633.4185445-1-gaosong@loongson.cn>
References: <20221224081633.4185445-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8CxPuRhtaZjuccKAA--.38440S19
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoW3JrWDKF4UJFWxZr4Uur1xKrg_yoWfWFW5p3
 y7try7tr4UXFWvqF1vvr43Za1jgwsrKw4xZwsYy3WDua47JF9rZry8t3y29FW7W3s8tryI
 gw1fCryjyryrJw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bnxFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4
 AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF
 7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7
 CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2
 zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VCjz48v1sIEY20_WwAm72CE4IkC6x
 0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxF
 aVAv8VWrMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxV
 Cjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUXVWUAwCIc40Y0x0EwIxGrwCI42IY
 6xIIjxv20xvE14v26ryj6F1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6x
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
- VDIV.{B/H/W/D}[U];
- VMOD.{B/H/W/D}[U].

Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 target/loongarch/disas.c                    |  17 +++
 target/loongarch/helper.h                   |  17 +++
 target/loongarch/insn_trans/trans_lsx.c.inc |  17 +++
 target/loongarch/insns.decode               |  17 +++
 target/loongarch/lsx_helper.c               | 135 ++++++++++++++++++++
 5 files changed, 203 insertions(+)

diff --git a/target/loongarch/disas.c b/target/loongarch/disas.c
index 3c11c6d5d2..f50a1051b9 100644
--- a/target/loongarch/disas.c
+++ b/target/loongarch/disas.c
@@ -1015,3 +1015,20 @@ INSN_LSX(vmaddwod_h_bu_b,  vvv)
 INSN_LSX(vmaddwod_w_hu_h,  vvv)
 INSN_LSX(vmaddwod_d_wu_w,  vvv)
 INSN_LSX(vmaddwod_q_du_d,  vvv)
+
+INSN_LSX(vdiv_b,           vvv)
+INSN_LSX(vdiv_h,           vvv)
+INSN_LSX(vdiv_w,           vvv)
+INSN_LSX(vdiv_d,           vvv)
+INSN_LSX(vdiv_bu,          vvv)
+INSN_LSX(vdiv_hu,          vvv)
+INSN_LSX(vdiv_wu,          vvv)
+INSN_LSX(vdiv_du,          vvv)
+INSN_LSX(vmod_b,           vvv)
+INSN_LSX(vmod_h,           vvv)
+INSN_LSX(vmod_w,           vvv)
+INSN_LSX(vmod_d,           vvv)
+INSN_LSX(vmod_bu,          vvv)
+INSN_LSX(vmod_hu,          vvv)
+INSN_LSX(vmod_wu,          vvv)
+INSN_LSX(vmod_du,          vvv)
diff --git a/target/loongarch/helper.h b/target/loongarch/helper.h
index 4d71b45fe0..e5ee9260ad 100644
--- a/target/loongarch/helper.h
+++ b/target/loongarch/helper.h
@@ -370,3 +370,20 @@ DEF_HELPER_4(vmaddwod_h_bu_b, void, env, i32, i32, i32)
 DEF_HELPER_4(vmaddwod_w_hu_h, void, env, i32, i32, i32)
 DEF_HELPER_4(vmaddwod_d_wu_w, void, env, i32, i32, i32)
 DEF_HELPER_4(vmaddwod_q_du_d, void, env, i32, i32, i32)
+
+DEF_HELPER_4(vdiv_b, void, env, i32, i32, i32)
+DEF_HELPER_4(vdiv_h, void, env, i32, i32, i32)
+DEF_HELPER_4(vdiv_w, void, env, i32, i32, i32)
+DEF_HELPER_4(vdiv_d, void, env, i32, i32, i32)
+DEF_HELPER_4(vdiv_bu, void, env, i32, i32, i32)
+DEF_HELPER_4(vdiv_hu, void, env, i32, i32, i32)
+DEF_HELPER_4(vdiv_wu, void, env, i32, i32, i32)
+DEF_HELPER_4(vdiv_du, void, env, i32, i32, i32)
+DEF_HELPER_4(vmod_b, void, env, i32, i32, i32)
+DEF_HELPER_4(vmod_h, void, env, i32, i32, i32)
+DEF_HELPER_4(vmod_w, void, env, i32, i32, i32)
+DEF_HELPER_4(vmod_d, void, env, i32, i32, i32)
+DEF_HELPER_4(vmod_bu, void, env, i32, i32, i32)
+DEF_HELPER_4(vmod_hu, void, env, i32, i32, i32)
+DEF_HELPER_4(vmod_wu, void, env, i32, i32, i32)
+DEF_HELPER_4(vmod_du, void, env, i32, i32, i32)
diff --git a/target/loongarch/insn_trans/trans_lsx.c.inc b/target/loongarch/insn_trans/trans_lsx.c.inc
index e9674af1bd..2d12470a0b 100644
--- a/target/loongarch/insn_trans/trans_lsx.c.inc
+++ b/target/loongarch/insn_trans/trans_lsx.c.inc
@@ -286,3 +286,20 @@ TRANS(vmaddwod_h_bu_b, gen_vvv, gen_helper_vmaddwod_h_bu_b)
 TRANS(vmaddwod_w_hu_h, gen_vvv, gen_helper_vmaddwod_w_hu_h)
 TRANS(vmaddwod_d_wu_w, gen_vvv, gen_helper_vmaddwod_d_wu_w)
 TRANS(vmaddwod_q_du_d, gen_vvv, gen_helper_vmaddwod_q_du_d)
+
+TRANS(vdiv_b, gen_vvv, gen_helper_vdiv_b)
+TRANS(vdiv_h, gen_vvv, gen_helper_vdiv_h)
+TRANS(vdiv_w, gen_vvv, gen_helper_vdiv_w)
+TRANS(vdiv_d, gen_vvv, gen_helper_vdiv_d)
+TRANS(vdiv_bu, gen_vvv, gen_helper_vdiv_bu)
+TRANS(vdiv_hu, gen_vvv, gen_helper_vdiv_hu)
+TRANS(vdiv_wu, gen_vvv, gen_helper_vdiv_wu)
+TRANS(vdiv_du, gen_vvv, gen_helper_vdiv_du)
+TRANS(vmod_b, gen_vvv, gen_helper_vmod_b)
+TRANS(vmod_h, gen_vvv, gen_helper_vmod_h)
+TRANS(vmod_w, gen_vvv, gen_helper_vmod_w)
+TRANS(vmod_d, gen_vvv, gen_helper_vmod_d)
+TRANS(vmod_bu, gen_vvv, gen_helper_vmod_bu)
+TRANS(vmod_hu, gen_vvv, gen_helper_vmod_hu)
+TRANS(vmod_wu, gen_vvv, gen_helper_vmod_wu)
+TRANS(vmod_du, gen_vvv, gen_helper_vmod_du)
diff --git a/target/loongarch/insns.decode b/target/loongarch/insns.decode
index 73390a07ce..cbd955a9e9 100644
--- a/target/loongarch/insns.decode
+++ b/target/loongarch/insns.decode
@@ -739,3 +739,20 @@ vmaddwod_h_bu_b  0111 00001011 11100 ..... ..... .....    @vvv
 vmaddwod_w_hu_h  0111 00001011 11101 ..... ..... .....    @vvv
 vmaddwod_d_wu_w  0111 00001011 11110 ..... ..... .....    @vvv
 vmaddwod_q_du_d  0111 00001011 11111 ..... ..... .....    @vvv
+
+vdiv_b           0111 00001110 00000 ..... ..... .....    @vvv
+vdiv_h           0111 00001110 00001 ..... ..... .....    @vvv
+vdiv_w           0111 00001110 00010 ..... ..... .....    @vvv
+vdiv_d           0111 00001110 00011 ..... ..... .....    @vvv
+vdiv_bu          0111 00001110 01000 ..... ..... .....    @vvv
+vdiv_hu          0111 00001110 01001 ..... ..... .....    @vvv
+vdiv_wu          0111 00001110 01010 ..... ..... .....    @vvv
+vdiv_du          0111 00001110 01011 ..... ..... .....    @vvv
+vmod_b           0111 00001110 00100 ..... ..... .....    @vvv
+vmod_h           0111 00001110 00101 ..... ..... .....    @vvv
+vmod_w           0111 00001110 00110 ..... ..... .....    @vvv
+vmod_d           0111 00001110 00111 ..... ..... .....    @vvv
+vmod_bu          0111 00001110 01100 ..... ..... .....    @vvv
+vmod_hu          0111 00001110 01101 ..... ..... .....    @vvv
+vmod_wu          0111 00001110 01110 ..... ..... .....    @vvv
+vmod_du          0111 00001110 01111 ..... ..... .....    @vvv
diff --git a/target/loongarch/lsx_helper.c b/target/loongarch/lsx_helper.c
index aea2e34292..99bdf4eb02 100644
--- a/target/loongarch/lsx_helper.c
+++ b/target/loongarch/lsx_helper.c
@@ -1575,3 +1575,138 @@ DO_HELPER_VVV(vmaddwod_h_bu_b, 16, helper_vvv, do_vmaddwod_u_s)
 DO_HELPER_VVV(vmaddwod_w_hu_h, 32, helper_vvv, do_vmaddwod_u_s)
 DO_HELPER_VVV(vmaddwod_d_wu_w, 64, helper_vvv, do_vmaddwod_u_s)
 DO_HELPER_VVV(vmaddwod_q_du_d, 128, helper_vvv, do_vmaddwod_u_s)
+
+static int64_t s_div_s(int64_t s1, int64_t s2, int bit)
+{
+    int64_t smin = MAKE_64BIT_MASK((bit -1), 64);
+
+    if (s1 == smin && s2 == -1) {
+        return smin;
+    }
+    return s2 ? s1 / s2 : s1 >= 0 ? -1 : 1;
+}
+
+static void do_vdiv_s(vec_t *Vd, vec_t *Vj, vec_t *Vk, int bit, int n)
+{
+    switch (bit) {
+    case 8:
+        Vd->B[n] = s_div_s(Vj->B[n], Vk->B[n], bit);
+        break;
+    case 16:
+        Vd->H[n] = s_div_s(Vj->H[n], Vk->H[n], bit);
+        break;
+    case 32:
+        Vd->W[n] = s_div_s(Vj->W[n], Vk->W[n], bit);
+        break;
+    case 64:
+        Vd->D[n] = s_div_s(Vj->D[n], Vk->D[n], bit);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static uint64_t u_div_u(int64_t s1, int64_t s2, int bit)
+{
+    uint64_t umax = MAKE_64BIT_MASK(0, bit);
+    uint64_t u1 = s1 & umax;
+    uint64_t u2 = s2 & umax;
+
+    return u2 ? u1 / u2 : -1;
+}
+
+static void do_vdiv_u(vec_t *Vd, vec_t *Vj, vec_t *Vk, int bit, int n)
+{
+    switch (bit) {
+    case 8:
+        Vd->B[n] = u_div_u(Vj->B[n], Vk->B[n], bit);
+        break;
+    case 16:
+        Vd->H[n] = u_div_u(Vj->H[n], Vk->H[n], bit);
+        break;
+    case 32:
+        Vd->W[n] = u_div_u(Vj->W[n], Vk->W[n], bit);
+        break;
+    case 64:
+        Vd->D[n] = u_div_u(Vj->D[n], Vk->D[n], bit);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static int64_t s_mod_s(int64_t s1, int64_t s2, int bit)
+{
+    int64_t smin = MAKE_64BIT_MASK((bit -1), 64);
+
+    if (s1 == smin && s2 == -1) {
+        return 0;
+    }
+    return s2 ? s1 % s2 : s1;
+}
+
+static void do_vmod_s(vec_t *Vd, vec_t *Vj, vec_t *Vk, int bit, int n)
+{
+    switch (bit) {
+    case 8:
+        Vd->B[n] = s_mod_s(Vj->B[n], Vk->B[n], bit);
+        break;
+    case 16:
+        Vd->H[n] = s_mod_s(Vj->H[n], Vk->H[n], bit);
+        break;
+    case 32:
+        Vd->W[n] = s_mod_s(Vj->W[n], Vk->W[n], bit);
+        break;
+    case 64:
+        Vd->D[n] = s_mod_s(Vj->D[n], Vk->D[n], bit);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static uint64_t u_mod_u(int64_t s1, int64_t s2, int bit)
+{
+    uint64_t umax = MAKE_64BIT_MASK(0, bit);
+    uint64_t u1 = s1 & umax;
+    uint64_t u2 = s2 & umax;
+
+    return u2 ? u1 % u2 : u1;
+}
+
+static void do_vmod_u(vec_t *Vd, vec_t *Vj, vec_t *Vk, int bit, int n)
+{
+    switch (bit) {
+    case 8:
+        Vd->B[n] = u_mod_u(Vj->B[n], Vk->B[n], bit);
+        break;
+    case 16:
+        Vd->H[n] = u_mod_u(Vj->H[n], Vk->H[n], bit);
+        break;
+    case 32:
+        Vd->W[n] = u_mod_u(Vj->W[n], Vk->W[n], bit);
+        break;
+    case 64:
+        Vd->D[n] = u_mod_u(Vj->D[n], Vk->D[n], bit);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+DO_HELPER_VVV(vdiv_b, 8, helper_vvv, do_vdiv_s)
+DO_HELPER_VVV(vdiv_h, 16, helper_vvv, do_vdiv_s)
+DO_HELPER_VVV(vdiv_w, 32, helper_vvv, do_vdiv_s)
+DO_HELPER_VVV(vdiv_d, 64, helper_vvv, do_vdiv_s)
+DO_HELPER_VVV(vdiv_bu, 8, helper_vvv, do_vdiv_u)
+DO_HELPER_VVV(vdiv_hu, 16, helper_vvv, do_vdiv_u)
+DO_HELPER_VVV(vdiv_wu, 32, helper_vvv, do_vdiv_u)
+DO_HELPER_VVV(vdiv_du, 64, helper_vvv, do_vdiv_u)
+DO_HELPER_VVV(vmod_b, 8, helper_vvv, do_vmod_s)
+DO_HELPER_VVV(vmod_h, 16, helper_vvv, do_vmod_s)
+DO_HELPER_VVV(vmod_w, 32, helper_vvv, do_vmod_s)
+DO_HELPER_VVV(vmod_d, 64, helper_vvv, do_vmod_s)
+DO_HELPER_VVV(vmod_bu, 8, helper_vvv, do_vmod_u)
+DO_HELPER_VVV(vmod_hu, 16, helper_vvv, do_vmod_u)
+DO_HELPER_VVV(vmod_wu, 32, helper_vvv, do_vmod_u)
+DO_HELPER_VVV(vmod_du, 64, helper_vvv, do_vmod_u)
-- 
2.31.1


