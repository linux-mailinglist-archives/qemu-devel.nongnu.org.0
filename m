Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C8F9655954
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Dec 2022 09:34:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8zij-0006Ch-4P; Sat, 24 Dec 2022 03:17:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1p8zi5-00068C-MK
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 03:17:03 -0500
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1p8zhy-0000RO-EZ
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 03:16:46 -0500
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8Dx_+tltaZjGEkIAA--.18597S3;
 Sat, 24 Dec 2022 16:16:37 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8CxPuRhtaZjuccKAA--.38440S11; 
 Sat, 24 Dec 2022 16:16:37 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org
Subject: [RFC PATCH 09/43] target/loongarch: Implement vhaddw/vhsubw
Date: Sat, 24 Dec 2022 16:15:59 +0800
Message-Id: <20221224081633.4185445-10-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20221224081633.4185445-1-gaosong@loongson.cn>
References: <20221224081633.4185445-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8CxPuRhtaZjuccKAA--.38440S11
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoW3JrWkAFyrZF17ZFy5Zw13urg_yoWDGr4kpw
 4Utry7tF4DJFWkZ3ZYvw4aqws8Xrnrtw1xZwn5G3WDuFW7AF9rZry0qw4aganru39Fgry8
 GwnxAry2yryrJaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bnxFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4
 AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF
 7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7
 CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2
 zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VCjz48v1sIEY20_WwAm72CE4IkC6x
 0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxF
 aVAv8VWrMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxV
 Cjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUXVWUAwCIc40Y0x0EwIxGrwCI42IY
 6xIIjxv20xvE14v26r4j6ryUMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6x
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
- VHADDW.{H.B/W.H/D.W/Q.D/HU.BU/WU.HU/DU.WU/QU.DU};
- VHSUBW.{H.B/W.H/D.W/Q.D/HU.BU/WU.HU/DU.WU/QU.DU}.

Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 target/loongarch/disas.c                    |  17 +++
 target/loongarch/helper.h                   |  17 +++
 target/loongarch/insn_trans/trans_lsx.c.inc |  17 +++
 target/loongarch/insns.decode               |  17 +++
 target/loongarch/lsx_helper.c               | 141 ++++++++++++++++++++
 5 files changed, 209 insertions(+)

diff --git a/target/loongarch/disas.c b/target/loongarch/disas.c
index 8f7db8b6db..1a906e8714 100644
--- a/target/loongarch/disas.c
+++ b/target/loongarch/disas.c
@@ -819,3 +819,20 @@ INSN_LSX(vssub_bu,         vvv)
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
index d13bc77d8a..4db8ca599e 100644
--- a/target/loongarch/helper.h
+++ b/target/loongarch/helper.h
@@ -173,3 +173,20 @@ DEF_HELPER_4(vssub_bu, void, env, i32, i32, i32)
 DEF_HELPER_4(vssub_hu, void, env, i32, i32, i32)
 DEF_HELPER_4(vssub_wu, void, env, i32, i32, i32)
 DEF_HELPER_4(vssub_du, void, env, i32, i32, i32)
+
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
index e9a8e3ae18..f278a3cd00 100644
--- a/target/loongarch/insn_trans/trans_lsx.c.inc
+++ b/target/loongarch/insn_trans/trans_lsx.c.inc
@@ -91,3 +91,20 @@ TRANS(vssub_bu, gen_vvv, gen_helper_vssub_bu)
 TRANS(vssub_hu, gen_vvv, gen_helper_vssub_hu)
 TRANS(vssub_wu, gen_vvv, gen_helper_vssub_wu)
 TRANS(vssub_du, gen_vvv, gen_helper_vssub_du)
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
index 9176de3ed2..77f9ab5a36 100644
--- a/target/loongarch/insns.decode
+++ b/target/loongarch/insns.decode
@@ -541,3 +541,20 @@ vssub_bu         0111 00000100 11000 ..... ..... .....    @vvv
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
index 944823986f..cb9b691dc7 100644
--- a/target/loongarch/lsx_helper.c
+++ b/target/loongarch/lsx_helper.c
@@ -332,3 +332,144 @@ DO_HELPER_VVV(vssub_bu, 8, helper_vvv, do_vssub_u)
 DO_HELPER_VVV(vssub_hu, 16, helper_vvv, do_vssub_u)
 DO_HELPER_VVV(vssub_wu, 32, helper_vvv, do_vssub_u)
 DO_HELPER_VVV(vssub_du, 64, helper_vvv, do_vssub_u)
+
+#define S_EVEN(a, bit) \
+        ((((int64_t)(a)) << (64 - bit / 2)) >> (64 - bit / 2))
+
+#define U_EVEN(a, bit) \
+        ((((uint64_t)(a)) << (64 - bit / 2)) >> (64 - bit / 2))
+
+#define S_ODD(a, bit) \
+        ((((int64_t)(a)) << (64 - bit)) >> (64 - bit/ 2))
+
+#define U_ODD(a, bit) \
+        ((((uint64_t)(a)) << (64 - bit)) >> (64 - bit / 2))
+
+#define S_EVEN_Q(a, bit) \
+        ((((__int128)(a)) << (128 - bit / 2)) >> (128 - bit / 2))
+
+#define U_EVEN_Q(a, bit) \
+        ((((unsigned __int128)(a)) << (128 - bit / 2)) >> (128 - bit / 2))
+
+#define S_ODD_Q(a, bit) \
+        ((((__int128)(a)) << (128 - bit)) >> (128 - bit/ 2))
+
+#define U_ODD_Q(a, bit) \
+        ((((unsigned __int128)(a)) << (128 - bit)) >> (128 - bit / 2))
+
+static int64_t s_haddw_s(int64_t s1, int64_t s2,  int bit)
+{
+    return S_ODD(s1, bit) + S_EVEN(s2, bit);
+}
+
+static void do_vhaddw_s(vec_t *Vd, vec_t *Vj, vec_t *Vk, int bit, int n)
+{
+    switch (bit) {
+    case 16:
+        Vd->H[n] = s_haddw_s(Vj->H[n], Vk->H[n], bit);
+        break;
+    case 32:
+        Vd->W[n] = s_haddw_s(Vj->W[n], Vk->W[n], bit);
+        break;
+    case 64:
+        Vd->D[n] = s_haddw_s(Vj->D[n], Vk->D[n], bit);
+        break;
+    case 128:
+        Vd->Q[n] = S_ODD_Q(Vj->Q[n], bit) + S_EVEN_Q(Vk->Q[n], bit);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static uint64_t u_haddw_u(int64_t s1, int64_t s2, int bit)
+{
+    return U_ODD(s1, bit) + U_EVEN(s2, bit);
+}
+
+static void do_vhaddw_u(vec_t *Vd, vec_t *Vj, vec_t *Vk, int bit, int n)
+{
+    switch (bit) {
+    case 16:
+        Vd->H[n] = u_haddw_u(Vj->H[n], Vk->H[n], bit);
+        break;
+    case 32:
+        Vd->W[n] = u_haddw_u(Vj->W[n], Vk->W[n], bit);
+        break;
+    case 64:
+        Vd->D[n] = u_haddw_u(Vj->D[n], Vk->D[n], bit);
+        break;
+    case 128:
+        Vd->Q[n] = U_ODD_Q(Vj->Q[n], bit) + U_EVEN_Q(Vk->Q[n], bit);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static int64_t s_hsubw_s(int64_t s1, int64_t s2, int bit)
+{
+    return S_ODD(s1, bit) - S_EVEN(s2, bit);
+}
+
+static void do_vhsubw_s(vec_t *Vd, vec_t *Vj, vec_t *Vk, int bit, int n)
+{
+    switch (bit) {
+    case 16:
+        Vd->H[n] = s_hsubw_s(Vj->H[n], Vk->H[n], bit);
+        break;
+    case 32:
+        Vd->W[n] = s_hsubw_s(Vj->W[n], Vk->W[n], bit);
+        break;
+    case 64:
+        Vd->D[n] = s_hsubw_s(Vj->D[n], Vk->D[n], bit);
+        break;
+    case 128:
+        Vd->Q[n] = S_ODD_Q(Vj->Q[n], bit) - S_EVEN_Q(Vk->Q[n], bit);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static uint64_t u_hsubw_u(int64_t s1, int64_t s2, int bit)
+{
+    return U_ODD(s1, bit) - U_EVEN(s2, bit);
+}
+
+static void do_vhsubw_u(vec_t *Vd, vec_t *Vj, vec_t *Vk, int bit, int n)
+{
+    switch (bit) {
+    case 16:
+        Vd->H[n] = u_hsubw_u(Vj->H[n], Vk->H[n], bit);
+        break;
+    case 32:
+        Vd->W[n] = u_hsubw_u(Vj->W[n], Vk->W[n], bit);
+        break;
+    case 64:
+        Vd->D[n] = u_hsubw_u(Vj->D[n], Vk->D[n], bit);
+        break;
+    case 128:
+        Vd->Q[n] = U_ODD_Q(Vj->Q[n], bit) - U_EVEN_Q(Vk->Q[n], bit);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+DO_HELPER_VVV(vhaddw_h_b, 16, helper_vvv, do_vhaddw_s)
+DO_HELPER_VVV(vhaddw_w_h, 32, helper_vvv, do_vhaddw_s)
+DO_HELPER_VVV(vhaddw_d_w, 64, helper_vvv, do_vhaddw_s)
+DO_HELPER_VVV(vhaddw_q_d, 128, helper_vvv, do_vhaddw_s)
+DO_HELPER_VVV(vhaddw_hu_bu, 16, helper_vvv, do_vhaddw_u)
+DO_HELPER_VVV(vhaddw_wu_hu, 32, helper_vvv, do_vhaddw_u)
+DO_HELPER_VVV(vhaddw_du_wu, 64, helper_vvv, do_vhaddw_u)
+DO_HELPER_VVV(vhaddw_qu_du, 128, helper_vvv, do_vhaddw_u)
+DO_HELPER_VVV(vhsubw_h_b, 16, helper_vvv, do_vhsubw_s)
+DO_HELPER_VVV(vhsubw_w_h, 32, helper_vvv, do_vhsubw_s)
+DO_HELPER_VVV(vhsubw_d_w, 64, helper_vvv, do_vhsubw_s)
+DO_HELPER_VVV(vhsubw_q_d, 128, helper_vvv, do_vhsubw_s)
+DO_HELPER_VVV(vhsubw_hu_bu, 16, helper_vvv, do_vhsubw_u)
+DO_HELPER_VVV(vhsubw_wu_hu, 32, helper_vvv, do_vhsubw_u)
+DO_HELPER_VVV(vhsubw_du_wu, 64, helper_vvv, do_vhsubw_u)
+DO_HELPER_VVV(vhsubw_qu_du, 128, helper_vvv, do_vhsubw_u)
-- 
2.31.1


