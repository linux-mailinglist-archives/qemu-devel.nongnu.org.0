Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ACA7655926
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Dec 2022 09:20:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8zj9-0006Si-Nr; Sat, 24 Dec 2022 03:17:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1p8ziD-00068V-S3
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 03:17:03 -0500
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1p8ziB-0000qS-2V
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 03:16:57 -0500
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8DxOelrtaZjNkkIAA--.15342S3;
 Sat, 24 Dec 2022 16:16:43 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8CxPuRhtaZjuccKAA--.38440S22; 
 Sat, 24 Dec 2022 16:16:42 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org
Subject: [RFC PATCH 20/43] target/loongarch: Implement vsigncov
Date: Sat, 24 Dec 2022 16:16:10 +0800
Message-Id: <20221224081633.4185445-21-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20221224081633.4185445-1-gaosong@loongson.cn>
References: <20221224081633.4185445-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8CxPuRhtaZjuccKAA--.38440S22
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoWxAFyrJw1UZF18urW7tw47Jwb_yoWrAr47pr
 42yry7t3yUJFZ7X3Zav3y3uw4qqws7Kw4xZan3t3WUuwsxJFyDZr18ta9FgFW8Xa1kAry0
 g3W7CryYyFWrX3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
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
- VSIGNCOV.{B/H/W/D}.

Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 target/loongarch/disas.c                    |  5 ++++
 target/loongarch/helper.h                   |  5 ++++
 target/loongarch/insn_trans/trans_lsx.c.inc |  5 ++++
 target/loongarch/insns.decode               |  5 ++++
 target/loongarch/lsx_helper.c               | 29 +++++++++++++++++++++
 5 files changed, 49 insertions(+)

diff --git a/target/loongarch/disas.c b/target/loongarch/disas.c
index 3187f87bbe..34a459410b 100644
--- a/target/loongarch/disas.c
+++ b/target/loongarch/disas.c
@@ -1050,3 +1050,8 @@ INSN_LSX(vexth_hu_bu,      vv)
 INSN_LSX(vexth_wu_hu,      vv)
 INSN_LSX(vexth_du_wu,      vv)
 INSN_LSX(vexth_qu_du,      vv)
+
+INSN_LSX(vsigncov_b,       vvv)
+INSN_LSX(vsigncov_h,       vvv)
+INSN_LSX(vsigncov_w,       vvv)
+INSN_LSX(vsigncov_d,       vvv)
diff --git a/target/loongarch/helper.h b/target/loongarch/helper.h
index 7a9d4f125d..c2b4407663 100644
--- a/target/loongarch/helper.h
+++ b/target/loongarch/helper.h
@@ -405,3 +405,8 @@ DEF_HELPER_3(vexth_hu_bu, void, env, i32, i32)
 DEF_HELPER_3(vexth_wu_hu, void, env, i32, i32)
 DEF_HELPER_3(vexth_du_wu, void, env, i32, i32)
 DEF_HELPER_3(vexth_qu_du, void, env, i32, i32)
+
+DEF_HELPER_4(vsigncov_b, void, env, i32, i32, i32)
+DEF_HELPER_4(vsigncov_h, void, env, i32, i32, i32)
+DEF_HELPER_4(vsigncov_w, void, env, i32, i32, i32)
+DEF_HELPER_4(vsigncov_d, void, env, i32, i32, i32)
diff --git a/target/loongarch/insn_trans/trans_lsx.c.inc b/target/loongarch/insn_trans/trans_lsx.c.inc
index 48ea07b645..ce207eda05 100644
--- a/target/loongarch/insn_trans/trans_lsx.c.inc
+++ b/target/loongarch/insn_trans/trans_lsx.c.inc
@@ -321,3 +321,8 @@ TRANS(vexth_hu_bu, gen_vv, gen_helper_vexth_hu_bu)
 TRANS(vexth_wu_hu, gen_vv, gen_helper_vexth_wu_hu)
 TRANS(vexth_du_wu, gen_vv, gen_helper_vexth_du_wu)
 TRANS(vexth_qu_du, gen_vv, gen_helper_vexth_qu_du)
+
+TRANS(vsigncov_b, gen_vvv, gen_helper_vsigncov_b)
+TRANS(vsigncov_h, gen_vvv, gen_helper_vsigncov_h)
+TRANS(vsigncov_w, gen_vvv, gen_helper_vsigncov_w)
+TRANS(vsigncov_d, gen_vvv, gen_helper_vsigncov_d)
diff --git a/target/loongarch/insns.decode b/target/loongarch/insns.decode
index 8ae9ca608e..c7237730d3 100644
--- a/target/loongarch/insns.decode
+++ b/target/loongarch/insns.decode
@@ -777,3 +777,8 @@ vexth_hu_bu      0111 00101001 11101 11100 ..... .....    @vv
 vexth_wu_hu      0111 00101001 11101 11101 ..... .....    @vv
 vexth_du_wu      0111 00101001 11101 11110 ..... .....    @vv
 vexth_qu_du      0111 00101001 11101 11111 ..... .....    @vv
+
+vsigncov_b       0111 00010010 11100 ..... ..... .....    @vvv
+vsigncov_h       0111 00010010 11101 ..... ..... .....    @vvv
+vsigncov_w       0111 00010010 11110 ..... ..... .....    @vvv
+vsigncov_d       0111 00010010 11111 ..... ..... .....    @vvv
diff --git a/target/loongarch/lsx_helper.c b/target/loongarch/lsx_helper.c
index a094d7d382..73360e45e2 100644
--- a/target/loongarch/lsx_helper.c
+++ b/target/loongarch/lsx_helper.c
@@ -1829,3 +1829,32 @@ DO_HELPER_VV(vexth_hu_bu, 16, helper_vv, do_vexth_u)
 DO_HELPER_VV(vexth_wu_hu, 32, helper_vv, do_vexth_u)
 DO_HELPER_VV(vexth_du_wu, 64, helper_vv, do_vexth_u)
 DO_HELPER_VV(vexth_qu_du, 128, helper_vv, do_vexth_u)
+
+static void do_vsigncov(vec_t *Vd, vec_t *Vj, vec_t *Vk, int bit, int n)
+{
+    switch (bit) {
+    case 8:
+        Vd->B[n] = (Vj->B[n] == 0x0) ? 0 :
+                   (Vj->B[n] < 0) ? -Vk->B[n] : Vk->B[n];
+        break;
+    case 16:
+        Vd->H[n] = (Vj->H[n] == 0x0) ? 0 :
+                   (Vj->H[n] < 0) ? -Vk->H[n] : Vk->H[n];
+        break;
+    case 32:
+        Vd->W[n] = (Vj->W[n] == 0x0) ? 0 :
+                   (Vj->W[n] < 0) ? -Vk->W[n] : Vk->W[n];
+        break;
+    case 64:
+        Vd->D[n] = (Vj->D[n] == 0x0) ? 0 :
+                   (Vj->D[n] < 0) ? -Vk->D[n] : Vk->W[n];
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+DO_HELPER_VVV(vsigncov_b, 8, helper_vvv, do_vsigncov)
+DO_HELPER_VVV(vsigncov_h, 16, helper_vvv, do_vsigncov)
+DO_HELPER_VVV(vsigncov_w, 32, helper_vvv, do_vsigncov)
+DO_HELPER_VVV(vsigncov_d, 64, helper_vvv, do_vsigncov)
-- 
2.31.1


