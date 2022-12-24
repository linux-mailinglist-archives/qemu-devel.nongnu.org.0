Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0FF0655956
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Dec 2022 09:35:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8zij-0006H8-JN; Sat, 24 Dec 2022 03:17:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1p8ziA-00068I-1l
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 03:17:03 -0500
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1p8zi7-0000ZF-Am
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 03:16:53 -0500
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8Cxl_FntaZjIEkIAA--.17949S3;
 Sat, 24 Dec 2022 16:16:39 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8CxPuRhtaZjuccKAA--.38440S15; 
 Sat, 24 Dec 2022 16:16:39 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org
Subject: [RFC PATCH 13/43] target/loongarch: Implement vadda
Date: Sat, 24 Dec 2022 16:16:03 +0800
Message-Id: <20221224081633.4185445-14-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20221224081633.4185445-1-gaosong@loongson.cn>
References: <20221224081633.4185445-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8CxPuRhtaZjuccKAA--.38440S15
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoWxJw13CFW3JryxGr4rur4xXrb_yoWrWryUpr
 W2kry7tFW8GFZrX3Zavw13Ww1jqrs5Kw4xuan3ta1UuF47XF1kZFy8t39FgFWUXw4DZFyI
 q3W8A34DuF95Ww7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
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
- VADDA.{B/H/W/D}.

Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 target/loongarch/disas.c                    |  5 ++++
 target/loongarch/helper.h                   |  5 ++++
 target/loongarch/insn_trans/trans_lsx.c.inc |  5 ++++
 target/loongarch/insns.decode               |  5 ++++
 target/loongarch/lsx_helper.c               | 32 +++++++++++++++++++++
 5 files changed, 52 insertions(+)

diff --git a/target/loongarch/disas.c b/target/loongarch/disas.c
index 8ec612446c..ff5d9e0e5b 100644
--- a/target/loongarch/disas.c
+++ b/target/loongarch/disas.c
@@ -905,3 +905,8 @@ INSN_LSX(vabsd_bu,         vvv)
 INSN_LSX(vabsd_hu,         vvv)
 INSN_LSX(vabsd_wu,         vvv)
 INSN_LSX(vabsd_du,         vvv)
+
+INSN_LSX(vadda_b,          vvv)
+INSN_LSX(vadda_h,          vvv)
+INSN_LSX(vadda_w,          vvv)
+INSN_LSX(vadda_d,          vvv)
diff --git a/target/loongarch/helper.h b/target/loongarch/helper.h
index 8298af2d40..85321c8874 100644
--- a/target/loongarch/helper.h
+++ b/target/loongarch/helper.h
@@ -259,3 +259,8 @@ DEF_HELPER_4(vabsd_bu, void, env, i32, i32, i32)
 DEF_HELPER_4(vabsd_hu, void, env, i32, i32, i32)
 DEF_HELPER_4(vabsd_wu, void, env, i32, i32, i32)
 DEF_HELPER_4(vabsd_du, void, env, i32, i32, i32)
+
+DEF_HELPER_4(vadda_b, void, env, i32, i32, i32)
+DEF_HELPER_4(vadda_h, void, env, i32, i32, i32)
+DEF_HELPER_4(vadda_w, void, env, i32, i32, i32)
+DEF_HELPER_4(vadda_d, void, env, i32, i32, i32)
diff --git a/target/loongarch/insn_trans/trans_lsx.c.inc b/target/loongarch/insn_trans/trans_lsx.c.inc
index 00a921a935..a90fc44ba7 100644
--- a/target/loongarch/insn_trans/trans_lsx.c.inc
+++ b/target/loongarch/insn_trans/trans_lsx.c.inc
@@ -177,3 +177,8 @@ TRANS(vabsd_bu, gen_vvv, gen_helper_vabsd_bu)
 TRANS(vabsd_hu, gen_vvv, gen_helper_vabsd_hu)
 TRANS(vabsd_wu, gen_vvv, gen_helper_vabsd_wu)
 TRANS(vabsd_du, gen_vvv, gen_helper_vabsd_du)
+
+TRANS(vadda_b, gen_vvv, gen_helper_vadda_b)
+TRANS(vadda_h, gen_vvv, gen_helper_vadda_h)
+TRANS(vadda_w, gen_vvv, gen_helper_vadda_w)
+TRANS(vadda_d, gen_vvv, gen_helper_vadda_d)
diff --git a/target/loongarch/insns.decode b/target/loongarch/insns.decode
index a770f37b99..9529ffe970 100644
--- a/target/loongarch/insns.decode
+++ b/target/loongarch/insns.decode
@@ -627,3 +627,8 @@ vabsd_bu         0111 00000110 00100 ..... ..... .....    @vvv
 vabsd_hu         0111 00000110 00101 ..... ..... .....    @vvv
 vabsd_wu         0111 00000110 00110 ..... ..... .....    @vvv
 vabsd_du         0111 00000110 00111 ..... ..... .....    @vvv
+
+vadda_b          0111 00000101 11000 ..... ..... .....    @vvv
+vadda_h          0111 00000101 11001 ..... ..... .....    @vvv
+vadda_w          0111 00000101 11010 ..... ..... .....    @vvv
+vadda_d          0111 00000101 11011 ..... ..... .....    @vvv
diff --git a/target/loongarch/lsx_helper.c b/target/loongarch/lsx_helper.c
index 61dc92059e..a9a0b01fd7 100644
--- a/target/loongarch/lsx_helper.c
+++ b/target/loongarch/lsx_helper.c
@@ -904,3 +904,35 @@ DO_HELPER_VVV(vabsd_bu, 8, helper_vvv, do_vabsd_u)
 DO_HELPER_VVV(vabsd_hu, 16, helper_vvv, do_vabsd_u)
 DO_HELPER_VVV(vabsd_wu, 32, helper_vvv, do_vabsd_u)
 DO_HELPER_VVV(vabsd_du, 64, helper_vvv, do_vabsd_u)
+
+static int64_t vadda_s(int64_t s1, int64_t s2)
+{
+    int64_t abs_s1 = s1 >= 0 ? s1 : -s1;
+    int64_t abs_s2 = s2 >= 0 ? s2 : -s2;
+    return abs_s1 + abs_s2;
+}
+
+static void do_vadda_s(vec_t *Vd, vec_t *Vj, vec_t *Vk, int bit, int n)
+{
+    switch (bit) {
+    case 8:
+        Vd->B[n] = vadda_s(Vj->B[n], Vk->B[n]);
+        break;
+    case 16:
+        Vd->H[n] = vadda_s(Vj->H[n], Vk->H[n]);
+        break;
+    case 32:
+        Vd->W[n] = vadda_s(Vj->W[n], Vk->W[n]);
+        break;
+    case 64:
+        Vd->D[n] = vadda_s(Vj->D[n], Vk->D[n]);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+DO_HELPER_VVV(vadda_b, 8, helper_vvv, do_vadda_s)
+DO_HELPER_VVV(vadda_h, 16, helper_vvv, do_vadda_s)
+DO_HELPER_VVV(vadda_w, 32, helper_vvv, do_vadda_s)
+DO_HELPER_VVV(vadda_d, 64, helper_vvv, do_vadda_s)
-- 
2.31.1


