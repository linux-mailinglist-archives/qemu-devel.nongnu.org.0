Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7587B655955
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Dec 2022 09:35:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8zij-0006Cd-EW; Sat, 24 Dec 2022 03:17:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1p8zi1-00067v-DY
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 03:16:45 -0500
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1p8zhy-0000QT-DR
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 03:16:45 -0500
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8BxVPBltaZjFUkIAA--.18719S3;
 Sat, 24 Dec 2022 16:16:37 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8CxPuRhtaZjuccKAA--.38440S10; 
 Sat, 24 Dec 2022 16:16:36 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org
Subject: [RFC PATCH 08/43] target/loongarch: Implement vsadd/vssub
Date: Sat, 24 Dec 2022 16:15:58 +0800
Message-Id: <20221224081633.4185445-9-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20221224081633.4185445-1-gaosong@loongson.cn>
References: <20221224081633.4185445-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8CxPuRhtaZjuccKAA--.38440S10
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoW3JrWDKF4fAr15JF4fZFWkWFg_yoWfWryUpw
 47try7tr4qqFWkZ3Wvvw43Za98XrsrKw1xuwn3Aw1DZ3y3JFykZry8t3y29ay3ur1DKFW8
 uw15CryDtry5Jw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
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
- VSADD.{B/H/W/D}[U];
- VSSUB.{B/H/W/D}[U].

Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 target/loongarch/disas.c                    |  17 +++
 target/loongarch/helper.h                   |  17 +++
 target/loongarch/insn_trans/trans_lsx.c.inc |  17 +++
 target/loongarch/insns.decode               |  17 +++
 target/loongarch/lsx_helper.c               | 138 ++++++++++++++++++++
 5 files changed, 206 insertions(+)

diff --git a/target/loongarch/disas.c b/target/loongarch/disas.c
index 53e299b4ba..8f7db8b6db 100644
--- a/target/loongarch/disas.c
+++ b/target/loongarch/disas.c
@@ -802,3 +802,20 @@ INSN_LSX(vneg_b,           vv)
 INSN_LSX(vneg_h,           vv)
 INSN_LSX(vneg_w,           vv)
 INSN_LSX(vneg_d,           vv)
+
+INSN_LSX(vsadd_b,          vvv)
+INSN_LSX(vsadd_h,          vvv)
+INSN_LSX(vsadd_w,          vvv)
+INSN_LSX(vsadd_d,          vvv)
+INSN_LSX(vsadd_bu,         vvv)
+INSN_LSX(vsadd_hu,         vvv)
+INSN_LSX(vsadd_wu,         vvv)
+INSN_LSX(vsadd_du,         vvv)
+INSN_LSX(vssub_b,          vvv)
+INSN_LSX(vssub_h,          vvv)
+INSN_LSX(vssub_w,          vvv)
+INSN_LSX(vssub_d,          vvv)
+INSN_LSX(vssub_bu,         vvv)
+INSN_LSX(vssub_hu,         vvv)
+INSN_LSX(vssub_wu,         vvv)
+INSN_LSX(vssub_du,         vvv)
diff --git a/target/loongarch/helper.h b/target/loongarch/helper.h
index 847950011e..d13bc77d8a 100644
--- a/target/loongarch/helper.h
+++ b/target/loongarch/helper.h
@@ -156,3 +156,20 @@ DEF_HELPER_3(vneg_b, void, env, i32, i32)
 DEF_HELPER_3(vneg_h, void, env, i32, i32)
 DEF_HELPER_3(vneg_w, void, env, i32, i32)
 DEF_HELPER_3(vneg_d, void, env, i32, i32)
+
+DEF_HELPER_4(vsadd_b, void, env, i32, i32, i32)
+DEF_HELPER_4(vsadd_h, void, env, i32, i32, i32)
+DEF_HELPER_4(vsadd_w, void, env, i32, i32, i32)
+DEF_HELPER_4(vsadd_d, void, env, i32, i32, i32)
+DEF_HELPER_4(vsadd_bu, void, env, i32, i32, i32)
+DEF_HELPER_4(vsadd_hu, void, env, i32, i32, i32)
+DEF_HELPER_4(vsadd_wu, void, env, i32, i32, i32)
+DEF_HELPER_4(vsadd_du, void, env, i32, i32, i32)
+DEF_HELPER_4(vssub_b, void, env, i32, i32, i32)
+DEF_HELPER_4(vssub_h, void, env, i32, i32, i32)
+DEF_HELPER_4(vssub_w, void, env, i32, i32, i32)
+DEF_HELPER_4(vssub_d, void, env, i32, i32, i32)
+DEF_HELPER_4(vssub_bu, void, env, i32, i32, i32)
+DEF_HELPER_4(vssub_hu, void, env, i32, i32, i32)
+DEF_HELPER_4(vssub_wu, void, env, i32, i32, i32)
+DEF_HELPER_4(vssub_du, void, env, i32, i32, i32)
diff --git a/target/loongarch/insn_trans/trans_lsx.c.inc b/target/loongarch/insn_trans/trans_lsx.c.inc
index 00514709c1..e9a8e3ae18 100644
--- a/target/loongarch/insn_trans/trans_lsx.c.inc
+++ b/target/loongarch/insn_trans/trans_lsx.c.inc
@@ -74,3 +74,20 @@ TRANS(vneg_b, gen_vv, gen_helper_vneg_b)
 TRANS(vneg_h, gen_vv, gen_helper_vneg_h)
 TRANS(vneg_w, gen_vv, gen_helper_vneg_w)
 TRANS(vneg_d, gen_vv, gen_helper_vneg_d)
+
+TRANS(vsadd_b, gen_vvv, gen_helper_vsadd_b)
+TRANS(vsadd_h, gen_vvv, gen_helper_vsadd_h)
+TRANS(vsadd_w, gen_vvv, gen_helper_vsadd_w)
+TRANS(vsadd_d, gen_vvv, gen_helper_vsadd_d)
+TRANS(vsadd_bu, gen_vvv, gen_helper_vsadd_bu)
+TRANS(vsadd_hu, gen_vvv, gen_helper_vsadd_hu)
+TRANS(vsadd_wu, gen_vvv, gen_helper_vsadd_wu)
+TRANS(vsadd_du, gen_vvv, gen_helper_vsadd_du)
+TRANS(vssub_b, gen_vvv, gen_helper_vssub_b)
+TRANS(vssub_h, gen_vvv, gen_helper_vssub_h)
+TRANS(vssub_w, gen_vvv, gen_helper_vssub_w)
+TRANS(vssub_d, gen_vvv, gen_helper_vssub_d)
+TRANS(vssub_bu, gen_vvv, gen_helper_vssub_bu)
+TRANS(vssub_hu, gen_vvv, gen_helper_vssub_hu)
+TRANS(vssub_wu, gen_vvv, gen_helper_vssub_wu)
+TRANS(vssub_du, gen_vvv, gen_helper_vssub_du)
diff --git a/target/loongarch/insns.decode b/target/loongarch/insns.decode
index 3da5ed17ed..9176de3ed2 100644
--- a/target/loongarch/insns.decode
+++ b/target/loongarch/insns.decode
@@ -524,3 +524,20 @@ vneg_b           0111 00101001 11000 01100 ..... .....    @vv
 vneg_h           0111 00101001 11000 01101 ..... .....    @vv
 vneg_w           0111 00101001 11000 01110 ..... .....    @vv
 vneg_d           0111 00101001 11000 01111 ..... .....    @vv
+
+vsadd_b          0111 00000100 01100 ..... ..... .....    @vvv
+vsadd_h          0111 00000100 01101 ..... ..... .....    @vvv
+vsadd_w          0111 00000100 01110 ..... ..... .....    @vvv
+vsadd_d          0111 00000100 01111 ..... ..... .....    @vvv
+vsadd_bu         0111 00000100 10100 ..... ..... .....    @vvv
+vsadd_hu         0111 00000100 10101 ..... ..... .....    @vvv
+vsadd_wu         0111 00000100 10110 ..... ..... .....    @vvv
+vsadd_du         0111 00000100 10111 ..... ..... .....    @vvv
+vssub_b          0111 00000100 10000 ..... ..... .....    @vvv
+vssub_h          0111 00000100 10001 ..... ..... .....    @vvv
+vssub_w          0111 00000100 10010 ..... ..... .....    @vvv
+vssub_d          0111 00000100 10011 ..... ..... .....    @vvv
+vssub_bu         0111 00000100 11000 ..... ..... .....    @vvv
+vssub_hu         0111 00000100 11001 ..... ..... .....    @vvv
+vssub_wu         0111 00000100 11010 ..... ..... .....    @vvv
+vssub_du         0111 00000100 11011 ..... ..... .....    @vvv
diff --git a/target/loongarch/lsx_helper.c b/target/loongarch/lsx_helper.c
index 0fd17bf08f..944823986f 100644
--- a/target/loongarch/lsx_helper.c
+++ b/target/loongarch/lsx_helper.c
@@ -194,3 +194,141 @@ DO_HELPER_VV(vneg_b, 8, helper_vv, do_vneg)
 DO_HELPER_VV(vneg_h, 16, helper_vv, do_vneg)
 DO_HELPER_VV(vneg_w, 32, helper_vv, do_vneg)
 DO_HELPER_VV(vneg_d, 64, helper_vv, do_vneg)
+
+static int64_t s_add_s(int64_t s1, int64_t s2, int bit)
+{
+    int64_t smax = MAKE_64BIT_MASK(0, (bit -1));
+    int64_t smin = MAKE_64BIT_MASK((bit -1), 64);
+
+    if (s1 < 0) {
+        return (smin - s1 < s2) ? s1 + s2 : smin;
+    } else {
+        return (s2 < smax - s1) ? s1 + s2 : smax;
+    }
+}
+
+static void do_vsadd(vec_t *Vd, vec_t *Vj, vec_t *Vk, int bit, int n)
+{
+    switch (bit) {
+    case 8:
+        Vd->B[n] = s_add_s(Vj->B[n], Vk->B[n], bit);
+        break;
+    case 16:
+        Vd->H[n] = s_add_s(Vj->H[n], Vk->H[n], bit);
+        break;
+    case 32:
+        Vd->W[n] = s_add_s(Vj->W[n], Vk->W[n], bit);
+        break;
+    case 64:
+        Vd->D[n] = s_add_s(Vj->D[n], Vk->D[n], bit);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static uint64_t u_add_u(int64_t s1, int64_t s2, int bit)
+{
+    uint64_t umax = MAKE_64BIT_MASK(0, bit);
+    uint64_t u1 = s1 & umax;
+    uint64_t u2 = s2 & umax;
+
+    return (u1 <  umax - u2) ? u1 + u2 : umax;
+}
+
+static void do_vsadd_u(vec_t *Vd, vec_t *Vj, vec_t *Vk, int bit, int n)
+{
+    switch (bit) {
+    case 8:
+        Vd->B[n] = u_add_u(Vj->B[n], Vk->B[n], bit);
+        break;
+    case 16:
+        Vd->H[n] = u_add_u(Vj->H[n], Vk->H[n], bit);
+        break;
+    case 32:
+        Vd->W[n] = u_add_u(Vj->W[n], Vk->W[n], bit);
+        break;
+    case 64:
+        Vd->D[n] = u_add_u(Vj->D[n], Vk->D[n], bit);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static int64_t s_sub_s(int64_t s1, int64_t s2, int bit)
+{
+    int64_t smax = MAKE_64BIT_MASK(0, (bit -1));
+    int64_t smin = MAKE_64BIT_MASK((bit -1), 64);
+
+    if (s2 > 0) {
+        return (smin + s2 < s1) ? s1 - s2 : smin;
+    } else {
+        return (s1 < smax + s2) ? s1 - s2 : smax;
+    }
+}
+
+static void do_vssub(vec_t *Vd, vec_t *Vj, vec_t *Vk, int bit, int n)
+{
+    switch (bit) {
+    case 8:
+        Vd->B[n] = s_sub_s(Vj->B[n], Vk->B[n], bit);
+        break;
+    case 16:
+        Vd->H[n] = s_sub_s(Vj->H[n], Vk->H[n], bit);
+        break;
+    case 32:
+        Vd->W[n] = s_sub_s(Vj->W[n], Vk->W[n], bit);
+        break;
+    case 64:
+        Vd->D[n] = s_sub_s(Vj->D[n], Vk->D[n], bit);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static uint64_t u_sub_u(int64_t s1, int64_t s2, int bit)
+{
+    uint64_t u1 = s1 & MAKE_64BIT_MASK(0, bit);
+    uint64_t u2 = s2 & MAKE_64BIT_MASK(0, bit);
+
+    return (u1 > u2) ?  u1 -u2 : 0;
+}
+
+static void do_vssub_u(vec_t *Vd, vec_t *Vj, vec_t *Vk, int bit, int n)
+{
+    switch (bit) {
+    case 8:
+        Vd->B[n] = u_sub_u(Vj->B[n], Vk->B[n], bit);
+        break;
+    case 16:
+        Vd->H[n] = u_sub_u(Vj->H[n], Vk->H[n], bit);
+        break;
+    case 32:
+        Vd->W[n] = u_sub_u(Vj->W[n], Vk->W[n], bit);
+        break;
+    case 64:
+        Vd->D[n] = u_sub_u(Vj->D[n], Vk->D[n], bit);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+DO_HELPER_VVV(vsadd_b, 8, helper_vvv, do_vsadd)
+DO_HELPER_VVV(vsadd_h, 16, helper_vvv, do_vsadd)
+DO_HELPER_VVV(vsadd_w, 32, helper_vvv, do_vsadd)
+DO_HELPER_VVV(vsadd_d, 64, helper_vvv, do_vsadd)
+DO_HELPER_VVV(vsadd_bu, 8, helper_vvv, do_vsadd_u)
+DO_HELPER_VVV(vsadd_hu, 16, helper_vvv, do_vsadd_u)
+DO_HELPER_VVV(vsadd_wu, 32, helper_vvv, do_vsadd_u)
+DO_HELPER_VVV(vsadd_du, 64, helper_vvv, do_vsadd_u)
+DO_HELPER_VVV(vssub_b, 8, helper_vvv, do_vssub)
+DO_HELPER_VVV(vssub_h, 16, helper_vvv, do_vssub)
+DO_HELPER_VVV(vssub_w, 32, helper_vvv, do_vssub)
+DO_HELPER_VVV(vssub_d, 64, helper_vvv, do_vssub)
+DO_HELPER_VVV(vssub_bu, 8, helper_vvv, do_vssub_u)
+DO_HELPER_VVV(vssub_hu, 16, helper_vvv, do_vssub_u)
+DO_HELPER_VVV(vssub_wu, 32, helper_vvv, do_vssub_u)
+DO_HELPER_VVV(vssub_du, 64, helper_vvv, do_vssub_u)
-- 
2.31.1


