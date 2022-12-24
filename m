Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51CB4655943
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Dec 2022 09:28:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8zjq-0007Dd-Io; Sat, 24 Dec 2022 03:18:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1p8zjO-0006gg-Ax
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 03:18:10 -0500
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1p8zjK-0003Pz-Ih
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 03:18:10 -0500
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8BxlfBrtaZjOUkIAA--.18192S3;
 Sat, 24 Dec 2022 16:16:43 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8CxPuRhtaZjuccKAA--.38440S21; 
 Sat, 24 Dec 2022 16:16:42 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org
Subject: [RFC PATCH 19/43] target/loongarch: Implement vexth
Date: Sat, 24 Dec 2022 16:16:09 +0800
Message-Id: <20221224081633.4185445-20-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20221224081633.4185445-1-gaosong@loongson.cn>
References: <20221224081633.4185445-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8CxPuRhtaZjuccKAA--.38440S21
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoW3Wr1xAF4fJr13CrW5Cw4xXrb_yoW7Ar47pr
 4Utry7tw48GFZrW3Zavw45Aw4UXws3Kw48Zw4fK3WDu3y7JFnrZF1kta9FgFW5Zay0vryI
 g3W7Cryqy395J37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
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
- VEXTH.{H.B/W.H/D.W/Q.D};
- VEXTH.{HU.BU/WU.HU/DU.WU/QU.DU}.

Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 target/loongarch/disas.c                    |  9 ++++
 target/loongarch/helper.h                   |  9 ++++
 target/loongarch/insn_trans/trans_lsx.c.inc |  9 ++++
 target/loongarch/insns.decode               |  9 ++++
 target/loongarch/lsx_helper.c               | 49 +++++++++++++++++++++
 5 files changed, 85 insertions(+)

diff --git a/target/loongarch/disas.c b/target/loongarch/disas.c
index 1ae085e192..3187f87bbe 100644
--- a/target/loongarch/disas.c
+++ b/target/loongarch/disas.c
@@ -1041,3 +1041,12 @@ INSN_LSX(vsat_bu,          vv_i)
 INSN_LSX(vsat_hu,          vv_i)
 INSN_LSX(vsat_wu,          vv_i)
 INSN_LSX(vsat_du,          vv_i)
+
+INSN_LSX(vexth_h_b,        vv)
+INSN_LSX(vexth_w_h,        vv)
+INSN_LSX(vexth_d_w,        vv)
+INSN_LSX(vexth_q_d,        vv)
+INSN_LSX(vexth_hu_bu,      vv)
+INSN_LSX(vexth_wu_hu,      vv)
+INSN_LSX(vexth_du_wu,      vv)
+INSN_LSX(vexth_qu_du,      vv)
diff --git a/target/loongarch/helper.h b/target/loongarch/helper.h
index fc8044db51..7a9d4f125d 100644
--- a/target/loongarch/helper.h
+++ b/target/loongarch/helper.h
@@ -396,3 +396,12 @@ DEF_HELPER_4(vsat_bu, void, env, i32, i32, i32)
 DEF_HELPER_4(vsat_hu, void, env, i32, i32, i32)
 DEF_HELPER_4(vsat_wu, void, env, i32, i32, i32)
 DEF_HELPER_4(vsat_du, void, env, i32, i32, i32)
+
+DEF_HELPER_3(vexth_h_b, void, env, i32, i32)
+DEF_HELPER_3(vexth_w_h, void, env, i32, i32)
+DEF_HELPER_3(vexth_d_w, void, env, i32, i32)
+DEF_HELPER_3(vexth_q_d, void, env, i32, i32)
+DEF_HELPER_3(vexth_hu_bu, void, env, i32, i32)
+DEF_HELPER_3(vexth_wu_hu, void, env, i32, i32)
+DEF_HELPER_3(vexth_du_wu, void, env, i32, i32)
+DEF_HELPER_3(vexth_qu_du, void, env, i32, i32)
diff --git a/target/loongarch/insn_trans/trans_lsx.c.inc b/target/loongarch/insn_trans/trans_lsx.c.inc
index 09924343b2..48ea07b645 100644
--- a/target/loongarch/insn_trans/trans_lsx.c.inc
+++ b/target/loongarch/insn_trans/trans_lsx.c.inc
@@ -312,3 +312,12 @@ TRANS(vsat_bu, gen_vv_i, gen_helper_vsat_bu)
 TRANS(vsat_hu, gen_vv_i, gen_helper_vsat_hu)
 TRANS(vsat_wu, gen_vv_i, gen_helper_vsat_wu)
 TRANS(vsat_du, gen_vv_i, gen_helper_vsat_du)
+
+TRANS(vexth_h_b, gen_vv, gen_helper_vexth_h_b)
+TRANS(vexth_w_h, gen_vv, gen_helper_vexth_w_h)
+TRANS(vexth_d_w, gen_vv, gen_helper_vexth_d_w)
+TRANS(vexth_q_d, gen_vv, gen_helper_vexth_q_d)
+TRANS(vexth_hu_bu, gen_vv, gen_helper_vexth_hu_bu)
+TRANS(vexth_wu_hu, gen_vv, gen_helper_vexth_wu_hu)
+TRANS(vexth_du_wu, gen_vv, gen_helper_vexth_du_wu)
+TRANS(vexth_qu_du, gen_vv, gen_helper_vexth_qu_du)
diff --git a/target/loongarch/insns.decode b/target/loongarch/insns.decode
index cae67533fd..8ae9ca608e 100644
--- a/target/loongarch/insns.decode
+++ b/target/loongarch/insns.decode
@@ -768,3 +768,12 @@ vsat_bu          0111 00110010 10000 01 ... ..... .....   @vv_ui3
 vsat_hu          0111 00110010 10000 1 .... ..... .....   @vv_ui4
 vsat_wu          0111 00110010 10001 ..... ..... .....    @vv_ui5
 vsat_du          0111 00110010 1001 ...... ..... .....    @vv_ui6
+
+vexth_h_b        0111 00101001 11101 11000 ..... .....    @vv
+vexth_w_h        0111 00101001 11101 11001 ..... .....    @vv
+vexth_d_w        0111 00101001 11101 11010 ..... .....    @vv
+vexth_q_d        0111 00101001 11101 11011 ..... .....    @vv
+vexth_hu_bu      0111 00101001 11101 11100 ..... .....    @vv
+vexth_wu_hu      0111 00101001 11101 11101 ..... .....    @vv
+vexth_du_wu      0111 00101001 11101 11110 ..... .....    @vv
+vexth_qu_du      0111 00101001 11101 11111 ..... .....    @vv
diff --git a/target/loongarch/lsx_helper.c b/target/loongarch/lsx_helper.c
index 62ab14051e..a094d7d382 100644
--- a/target/loongarch/lsx_helper.c
+++ b/target/loongarch/lsx_helper.c
@@ -1780,3 +1780,52 @@ DO_HELPER_VV_I(vsat_bu, 8, helper_vv_i, do_vsat_u)
 DO_HELPER_VV_I(vsat_hu, 16, helper_vv_i, do_vsat_u)
 DO_HELPER_VV_I(vsat_wu, 32, helper_vv_i, do_vsat_u)
 DO_HELPER_VV_I(vsat_du, 64, helper_vv_i, do_vsat_u)
+
+static void do_vexth_s(vec_t *Vd, vec_t *Vj, int bit, int n)
+{
+    switch (bit) {
+    case 16:
+        Vd->H[n] = Vj->B[n + LSX_LEN/bit];
+        break;
+    case 32:
+        Vd->W[n] = Vj->H[n + LSX_LEN/bit];
+        break;
+    case 64:
+        Vd->D[n] = Vj->W[n + LSX_LEN/bit];
+        break;
+    case 128:
+        Vd->Q[n] = Vj->D[n + LSX_LEN/bit];
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static void do_vexth_u(vec_t *Vd, vec_t *Vj, int bit, int n)
+{
+    switch (bit) {
+    case 16:
+        Vd->H[n] = (uint8_t)Vj->B[n + LSX_LEN/bit];
+        break;
+    case 32:
+        Vd->W[n] = (uint16_t)Vj->H[n + LSX_LEN/bit];
+        break;
+    case 64:
+        Vd->D[n] = (uint32_t)Vj->W[n + LSX_LEN/bit];
+        break;
+    case 128:
+        Vd->Q[n] = (uint64_t)Vj->D[n + LSX_LEN/bit];
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+DO_HELPER_VV(vexth_h_b, 16, helper_vv, do_vexth_s)
+DO_HELPER_VV(vexth_w_h, 32, helper_vv, do_vexth_s)
+DO_HELPER_VV(vexth_d_w, 64, helper_vv, do_vexth_s)
+DO_HELPER_VV(vexth_q_d, 128, helper_vv, do_vexth_s)
+DO_HELPER_VV(vexth_hu_bu, 16, helper_vv, do_vexth_u)
+DO_HELPER_VV(vexth_wu_hu, 32, helper_vv, do_vexth_u)
+DO_HELPER_VV(vexth_du_wu, 64, helper_vv, do_vexth_u)
+DO_HELPER_VV(vexth_qu_du, 128, helper_vv, do_vexth_u)
-- 
2.31.1


