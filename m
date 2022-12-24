Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D749655961
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Dec 2022 09:41:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8zj8-0006Q8-MR; Sat, 24 Dec 2022 03:17:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1p8ziA-00068J-1t
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 03:17:03 -0500
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1p8zi6-0000Wu-U9
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 03:16:53 -0500
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8DxvutmtaZjHEkIAA--.18822S3;
 Sat, 24 Dec 2022 16:16:38 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8CxPuRhtaZjuccKAA--.38440S13; 
 Sat, 24 Dec 2022 16:16:38 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org
Subject: [RFC PATCH 11/43] target/loongarch: Implement vavg/vavgr
Date: Sat, 24 Dec 2022 16:16:01 +0800
Message-Id: <20221224081633.4185445-12-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20221224081633.4185445-1-gaosong@loongson.cn>
References: <20221224081633.4185445-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8CxPuRhtaZjuccKAA--.38440S13
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoWxKrW7CFy5Kr43ZF15CFyxGrg_yoWfXF15pw
 4ayry7tw4UWFZrZF1vvw4fAws0gwsFgw17uwn3X3W8uay7JFykZrykt3y29rW7CryDJry8
 X3W7AryqyFW5Gw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
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
- VAVG.{B/H/W/D}[U];
- VAVGR.{B/H/W/D}[U].

Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 target/loongarch/disas.c                    |  17 +++
 target/loongarch/helper.h                   |  17 +++
 target/loongarch/insn_trans/trans_lsx.c.inc |  17 +++
 target/loongarch/insns.decode               |  17 +++
 target/loongarch/lsx_helper.c               | 125 ++++++++++++++++++++
 5 files changed, 193 insertions(+)

diff --git a/target/loongarch/disas.c b/target/loongarch/disas.c
index 81253f00e9..b0a491033e 100644
--- a/target/loongarch/disas.c
+++ b/target/loongarch/disas.c
@@ -879,3 +879,20 @@ INSN_LSX(vaddwod_h_bu_b,   vvv)
 INSN_LSX(vaddwod_w_hu_h,   vvv)
 INSN_LSX(vaddwod_d_wu_w,   vvv)
 INSN_LSX(vaddwod_q_du_d,   vvv)
+
+INSN_LSX(vavg_b,           vvv)
+INSN_LSX(vavg_h,           vvv)
+INSN_LSX(vavg_w,           vvv)
+INSN_LSX(vavg_d,           vvv)
+INSN_LSX(vavg_bu,          vvv)
+INSN_LSX(vavg_hu,          vvv)
+INSN_LSX(vavg_wu,          vvv)
+INSN_LSX(vavg_du,          vvv)
+INSN_LSX(vavgr_b,          vvv)
+INSN_LSX(vavgr_h,          vvv)
+INSN_LSX(vavgr_w,          vvv)
+INSN_LSX(vavgr_d,          vvv)
+INSN_LSX(vavgr_bu,         vvv)
+INSN_LSX(vavgr_hu,         vvv)
+INSN_LSX(vavgr_wu,         vvv)
+INSN_LSX(vavgr_du,         vvv)
diff --git a/target/loongarch/helper.h b/target/loongarch/helper.h
index ff16626381..c6a387c54d 100644
--- a/target/loongarch/helper.h
+++ b/target/loongarch/helper.h
@@ -233,3 +233,20 @@ DEF_HELPER_4(vaddwod_h_bu_b, void, env, i32, i32, i32)
 DEF_HELPER_4(vaddwod_w_hu_h, void, env, i32, i32, i32)
 DEF_HELPER_4(vaddwod_d_wu_w, void, env, i32, i32, i32)
 DEF_HELPER_4(vaddwod_q_du_d, void, env, i32, i32, i32)
+
+DEF_HELPER_4(vavg_b, void, env, i32, i32, i32)
+DEF_HELPER_4(vavg_h, void, env, i32, i32, i32)
+DEF_HELPER_4(vavg_w, void, env, i32, i32, i32)
+DEF_HELPER_4(vavg_d, void, env, i32, i32, i32)
+DEF_HELPER_4(vavg_bu, void, env, i32, i32, i32)
+DEF_HELPER_4(vavg_hu, void, env, i32, i32, i32)
+DEF_HELPER_4(vavg_wu, void, env, i32, i32, i32)
+DEF_HELPER_4(vavg_du, void, env, i32, i32, i32)
+DEF_HELPER_4(vavgr_b, void, env, i32, i32, i32)
+DEF_HELPER_4(vavgr_h, void, env, i32, i32, i32)
+DEF_HELPER_4(vavgr_w, void, env, i32, i32, i32)
+DEF_HELPER_4(vavgr_d, void, env, i32, i32, i32)
+DEF_HELPER_4(vavgr_bu, void, env, i32, i32, i32)
+DEF_HELPER_4(vavgr_hu, void, env, i32, i32, i32)
+DEF_HELPER_4(vavgr_wu, void, env, i32, i32, i32)
+DEF_HELPER_4(vavgr_du, void, env, i32, i32, i32)
diff --git a/target/loongarch/insn_trans/trans_lsx.c.inc b/target/loongarch/insn_trans/trans_lsx.c.inc
index 69111c498c..2d43a88d74 100644
--- a/target/loongarch/insn_trans/trans_lsx.c.inc
+++ b/target/loongarch/insn_trans/trans_lsx.c.inc
@@ -151,3 +151,20 @@ TRANS(vaddwod_h_bu_b, gen_vvv, gen_helper_vaddwod_h_bu_b)
 TRANS(vaddwod_w_hu_h, gen_vvv, gen_helper_vaddwod_w_hu_h)
 TRANS(vaddwod_d_wu_w, gen_vvv, gen_helper_vaddwod_d_wu_w)
 TRANS(vaddwod_q_du_d, gen_vvv, gen_helper_vaddwod_q_du_d)
+
+TRANS(vavg_b, gen_vvv, gen_helper_vavg_b)
+TRANS(vavg_h, gen_vvv, gen_helper_vavg_h)
+TRANS(vavg_w, gen_vvv, gen_helper_vavg_w)
+TRANS(vavg_d, gen_vvv, gen_helper_vavg_d)
+TRANS(vavg_bu, gen_vvv, gen_helper_vavg_bu)
+TRANS(vavg_hu, gen_vvv, gen_helper_vavg_hu)
+TRANS(vavg_wu, gen_vvv, gen_helper_vavg_wu)
+TRANS(vavg_du, gen_vvv, gen_helper_vavg_du)
+TRANS(vavgr_b, gen_vvv, gen_helper_vavgr_b)
+TRANS(vavgr_h, gen_vvv, gen_helper_vavgr_h)
+TRANS(vavgr_w, gen_vvv, gen_helper_vavgr_w)
+TRANS(vavgr_d, gen_vvv, gen_helper_vavgr_d)
+TRANS(vavgr_bu, gen_vvv, gen_helper_vavgr_bu)
+TRANS(vavgr_hu, gen_vvv, gen_helper_vavgr_hu)
+TRANS(vavgr_wu, gen_vvv, gen_helper_vavgr_wu)
+TRANS(vavgr_du, gen_vvv, gen_helper_vavgr_du)
diff --git a/target/loongarch/insns.decode b/target/loongarch/insns.decode
index 7e99ead2de..de6e8a72a9 100644
--- a/target/loongarch/insns.decode
+++ b/target/loongarch/insns.decode
@@ -601,3 +601,20 @@ vaddwod_h_bu_b   0111 00000100 00000 ..... ..... .....    @vvv
 vaddwod_w_hu_h   0111 00000100 00001 ..... ..... .....    @vvv
 vaddwod_d_wu_w   0111 00000100 00010 ..... ..... .....    @vvv
 vaddwod_q_du_d   0111 00000100 00011 ..... ..... .....    @vvv
+
+vavg_b           0111 00000110 01000 ..... ..... .....    @vvv
+vavg_h           0111 00000110 01001 ..... ..... .....    @vvv
+vavg_w           0111 00000110 01010 ..... ..... .....    @vvv
+vavg_d           0111 00000110 01011 ..... ..... .....    @vvv
+vavg_bu          0111 00000110 01100 ..... ..... .....    @vvv
+vavg_hu          0111 00000110 01101 ..... ..... .....    @vvv
+vavg_wu          0111 00000110 01110 ..... ..... .....    @vvv
+vavg_du          0111 00000110 01111 ..... ..... .....    @vvv
+vavgr_b          0111 00000110 10000 ..... ..... .....    @vvv
+vavgr_h          0111 00000110 10001 ..... ..... .....    @vvv
+vavgr_w          0111 00000110 10010 ..... ..... .....    @vvv
+vavgr_d          0111 00000110 10011 ..... ..... .....    @vvv
+vavgr_bu         0111 00000110 10100 ..... ..... .....    @vvv
+vavgr_hu         0111 00000110 10101 ..... ..... .....    @vvv
+vavgr_wu         0111 00000110 10110 ..... ..... .....    @vvv
+vavgr_du         0111 00000110 10111 ..... ..... .....    @vvv
diff --git a/target/loongarch/lsx_helper.c b/target/loongarch/lsx_helper.c
index 9e3131af1b..63161ecd1a 100644
--- a/target/loongarch/lsx_helper.c
+++ b/target/loongarch/lsx_helper.c
@@ -716,3 +716,128 @@ DO_HELPER_VVV(vaddwod_h_bu_b, 16, helper_vvv, do_vaddwod_u_s)
 DO_HELPER_VVV(vaddwod_w_hu_h, 32, helper_vvv, do_vaddwod_u_s)
 DO_HELPER_VVV(vaddwod_d_wu_w, 64, helper_vvv, do_vaddwod_u_s)
 DO_HELPER_VVV(vaddwod_q_du_d, 128, helper_vvv, do_vaddwod_u_s)
+
+
+static int64_t vavg_s(int64_t s1, int64_t s2)
+{
+    return (s1 >> 1) + (s2 >> 1) + (s1 & s2 & 1);
+}
+
+static void do_vavg_s(vec_t *Vd, vec_t *Vj, vec_t *Vk, int bit, int n)
+{
+    switch (bit) {
+    case 8:
+        Vd->B[n] = vavg_s(Vj->B[n], Vk->B[n]);
+        break;
+    case 16:
+        Vd->H[n] = vavg_s(Vj->H[n], Vk->H[n]);
+        break;
+    case 32:
+        Vd->W[n] = vavg_s(Vj->W[n], Vk->W[n]);
+        break;
+    case 64:
+        Vd->D[n] = vavg_s(Vj->D[n], Vk->D[n]);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static uint64_t vavg_u(int64_t s1, int64_t s2, int bit)
+{
+    uint64_t umax = MAKE_64BIT_MASK(0, bit);
+    uint64_t u1 = s1 & umax;
+    uint64_t u2 = s2 & umax;
+    return (u1 >> 1) + (u2 >> 1) + (u1 & u2 & 1);
+}
+
+static void do_vavg_u(vec_t *Vd, vec_t *Vj, vec_t *Vk, int bit, int n)
+{
+    switch (bit) {
+    case 8:
+        Vd->B[n] = vavg_u(Vj->B[n], Vk->B[n], bit);
+        break;
+    case 16:
+        Vd->H[n] = vavg_u(Vj->H[n], Vk->H[n], bit);
+        break;
+    case 32:
+        Vd->W[n] = vavg_u(Vj->W[n], Vk->W[n], bit);
+        break;
+    case 64:
+        Vd->D[n] = vavg_u(Vj->D[n], Vk->D[n], bit);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static int64_t vavgr_s(int64_t s1, int64_t s2)
+{
+    return (s1 >> 1) + (s2 >> 1) + ((s1 | s2) & 1);
+}
+
+static void do_vavgr_s(vec_t *Vd, vec_t *Vj, vec_t *Vk, int bit, int n)
+{
+    switch (bit) {
+    case 8:
+        Vd->B[n] = vavgr_s(Vj->B[n], Vk->B[n]);
+        break;
+    case 16:
+        Vd->H[n] = vavgr_s(Vj->H[n], Vk->H[n]);
+        break;
+    case 32:
+        Vd->W[n] = vavgr_s(Vj->W[n], Vk->W[n]);
+        break;
+    case 64:
+        Vd->D[n] = vavgr_s(Vj->D[n], Vk->D[n]);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static uint64_t vavgr_u(int64_t s1, int64_t s2, int bit)
+{
+    uint64_t umax = MAKE_64BIT_MASK(0, bit);
+    uint64_t u1 = s1 & umax;
+    uint64_t u2 = s2 & umax;
+
+    return (u1 >> 1) + (u2 >> 1) + ((u1 | u2) & 1);
+}
+
+static void do_vavgr_u(vec_t *Vd, vec_t *Vj, vec_t *Vk, int bit, int n)
+{
+    switch (bit) {
+    case 8:
+        Vd->B[n] = vavgr_u(Vj->B[n], Vk->B[n], bit);
+        break;
+    case 16:
+        Vd->H[n] = vavgr_u(Vj->H[n], Vk->H[n], bit);
+        break;
+    case 32:
+        Vd->W[n] = vavgr_u(Vj->W[n], Vk->W[n], bit);
+        break;
+    case 64:
+        Vd->D[n] = vavgr_u(Vj->D[n], Vk->D[n], bit);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+DO_HELPER_VVV(vavg_b, 8, helper_vvv, do_vavg_s)
+DO_HELPER_VVV(vavg_h, 16, helper_vvv, do_vavg_s)
+DO_HELPER_VVV(vavg_w, 32, helper_vvv, do_vavg_s)
+DO_HELPER_VVV(vavg_d, 64, helper_vvv, do_vavg_s)
+DO_HELPER_VVV(vavg_bu, 8, helper_vvv, do_vavg_u)
+DO_HELPER_VVV(vavg_hu, 16, helper_vvv, do_vavg_u)
+DO_HELPER_VVV(vavg_wu, 32, helper_vvv, do_vavg_u)
+DO_HELPER_VVV(vavg_du, 64, helper_vvv, do_vavg_u)
+DO_HELPER_VVV(vavgr_b, 8, helper_vvv, do_vavgr_s)
+DO_HELPER_VVV(vavgr_h, 16, helper_vvv, do_vavgr_s)
+DO_HELPER_VVV(vavgr_w, 32, helper_vvv, do_vavgr_s)
+DO_HELPER_VVV(vavgr_d, 64, helper_vvv, do_vavgr_s)
+DO_HELPER_VVV(vavgr_bu, 8, helper_vvv, do_vavgr_u)
+DO_HELPER_VVV(vavgr_hu, 16, helper_vvv, do_vavgr_u)
+DO_HELPER_VVV(vavgr_wu, 32, helper_vvv, do_vavgr_u)
+DO_HELPER_VVV(vavgr_du, 64, helper_vvv, do_vavgr_u)
-- 
2.31.1


