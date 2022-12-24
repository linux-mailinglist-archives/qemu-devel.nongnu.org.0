Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F228655952
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Dec 2022 09:33:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8zjm-00079o-P8; Sat, 24 Dec 2022 03:18:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1p8zjN-0006g2-Aa
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 03:18:09 -0500
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1p8zjK-0003Q1-Hn
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 03:18:08 -0500
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8CxI_BqtaZjNEkIAA--.18960S3;
 Sat, 24 Dec 2022 16:16:42 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8CxPuRhtaZjuccKAA--.38440S20; 
 Sat, 24 Dec 2022 16:16:41 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org
Subject: [RFC PATCH 18/43] target/loongarch: Implement vsat
Date: Sat, 24 Dec 2022 16:16:08 +0800
Message-Id: <20221224081633.4185445-19-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20221224081633.4185445-1-gaosong@loongson.cn>
References: <20221224081633.4185445-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8CxPuRhtaZjuccKAA--.38440S20
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoW3Ww18Ar1UXFW7ur1UKFyrtFb_yoWxJr1Dpr
 W7try8tr48GFZ7XFnYv3W5Jw4DXwnrKw1qva1ftw18urW7XFs7Xrykt3y29FWUu3yDtFy0
 g3WUAryjyrWrJwUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
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
- VSAT.{B/H/W/D}[U].

Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 target/loongarch/disas.c                    |  9 +++
 target/loongarch/helper.h                   |  9 +++
 target/loongarch/insn_trans/trans_lsx.c.inc |  9 +++
 target/loongarch/insns.decode               | 12 ++++
 target/loongarch/lsx_helper.c               | 70 +++++++++++++++++++++
 5 files changed, 109 insertions(+)

diff --git a/target/loongarch/disas.c b/target/loongarch/disas.c
index f50a1051b9..1ae085e192 100644
--- a/target/loongarch/disas.c
+++ b/target/loongarch/disas.c
@@ -1032,3 +1032,12 @@ INSN_LSX(vmod_bu,          vvv)
 INSN_LSX(vmod_hu,          vvv)
 INSN_LSX(vmod_wu,          vvv)
 INSN_LSX(vmod_du,          vvv)
+
+INSN_LSX(vsat_b,           vv_i)
+INSN_LSX(vsat_h,           vv_i)
+INSN_LSX(vsat_w,           vv_i)
+INSN_LSX(vsat_d,           vv_i)
+INSN_LSX(vsat_bu,          vv_i)
+INSN_LSX(vsat_hu,          vv_i)
+INSN_LSX(vsat_wu,          vv_i)
+INSN_LSX(vsat_du,          vv_i)
diff --git a/target/loongarch/helper.h b/target/loongarch/helper.h
index e5ee9260ad..fc8044db51 100644
--- a/target/loongarch/helper.h
+++ b/target/loongarch/helper.h
@@ -387,3 +387,12 @@ DEF_HELPER_4(vmod_bu, void, env, i32, i32, i32)
 DEF_HELPER_4(vmod_hu, void, env, i32, i32, i32)
 DEF_HELPER_4(vmod_wu, void, env, i32, i32, i32)
 DEF_HELPER_4(vmod_du, void, env, i32, i32, i32)
+
+DEF_HELPER_4(vsat_b, void, env, i32, i32, i32)
+DEF_HELPER_4(vsat_h, void, env, i32, i32, i32)
+DEF_HELPER_4(vsat_w, void, env, i32, i32, i32)
+DEF_HELPER_4(vsat_d, void, env, i32, i32, i32)
+DEF_HELPER_4(vsat_bu, void, env, i32, i32, i32)
+DEF_HELPER_4(vsat_hu, void, env, i32, i32, i32)
+DEF_HELPER_4(vsat_wu, void, env, i32, i32, i32)
+DEF_HELPER_4(vsat_du, void, env, i32, i32, i32)
diff --git a/target/loongarch/insn_trans/trans_lsx.c.inc b/target/loongarch/insn_trans/trans_lsx.c.inc
index 2d12470a0b..09924343b2 100644
--- a/target/loongarch/insn_trans/trans_lsx.c.inc
+++ b/target/loongarch/insn_trans/trans_lsx.c.inc
@@ -303,3 +303,12 @@ TRANS(vmod_bu, gen_vvv, gen_helper_vmod_bu)
 TRANS(vmod_hu, gen_vvv, gen_helper_vmod_hu)
 TRANS(vmod_wu, gen_vvv, gen_helper_vmod_wu)
 TRANS(vmod_du, gen_vvv, gen_helper_vmod_du)
+
+TRANS(vsat_b, gen_vv_i, gen_helper_vsat_b)
+TRANS(vsat_h, gen_vv_i, gen_helper_vsat_h)
+TRANS(vsat_w, gen_vv_i, gen_helper_vsat_w)
+TRANS(vsat_d, gen_vv_i, gen_helper_vsat_d)
+TRANS(vsat_bu, gen_vv_i, gen_helper_vsat_bu)
+TRANS(vsat_hu, gen_vv_i, gen_helper_vsat_hu)
+TRANS(vsat_wu, gen_vv_i, gen_helper_vsat_wu)
+TRANS(vsat_du, gen_vv_i, gen_helper_vsat_du)
diff --git a/target/loongarch/insns.decode b/target/loongarch/insns.decode
index cbd955a9e9..cae67533fd 100644
--- a/target/loongarch/insns.decode
+++ b/target/loongarch/insns.decode
@@ -498,7 +498,10 @@ dbcl             0000 00000010 10101 ...............      @i15
 #
 @vv               .... ........ ..... ..... vj:5 vd:5    &vv
 @vvv               .... ........ ..... vk:5 vj:5 vd:5    &vvv
+@vv_ui3        .... ........ ..... .. imm:3 vj:5 vd:5    &vv_i
+@vv_ui4         .... ........ ..... . imm:4 vj:5 vd:5    &vv_i
 @vv_ui5           .... ........ ..... imm:5 vj:5 vd:5    &vv_i
+@vv_ui6            .... ........ .... imm:6 vj:5 vd:5    &vv_i
 @vv_i5           .... ........ ..... imm:s5 vj:5 vd:5    &vv_i
 
 vadd_b           0111 00000000 10100 ..... ..... .....    @vvv
@@ -756,3 +759,12 @@ vmod_bu          0111 00001110 01100 ..... ..... .....    @vvv
 vmod_hu          0111 00001110 01101 ..... ..... .....    @vvv
 vmod_wu          0111 00001110 01110 ..... ..... .....    @vvv
 vmod_du          0111 00001110 01111 ..... ..... .....    @vvv
+
+vsat_b           0111 00110010 01000 01 ... ..... .....   @vv_ui3
+vsat_h           0111 00110010 01000 1 .... ..... .....   @vv_ui4
+vsat_w           0111 00110010 01001 ..... ..... .....    @vv_ui5
+vsat_d           0111 00110010 0101 ...... ..... .....    @vv_ui6
+vsat_bu          0111 00110010 10000 01 ... ..... .....   @vv_ui3
+vsat_hu          0111 00110010 10000 1 .... ..... .....   @vv_ui4
+vsat_wu          0111 00110010 10001 ..... ..... .....    @vv_ui5
+vsat_du          0111 00110010 1001 ...... ..... .....    @vv_ui6
diff --git a/target/loongarch/lsx_helper.c b/target/loongarch/lsx_helper.c
index 99bdf4eb02..62ab14051e 100644
--- a/target/loongarch/lsx_helper.c
+++ b/target/loongarch/lsx_helper.c
@@ -1710,3 +1710,73 @@ DO_HELPER_VVV(vmod_bu, 8, helper_vvv, do_vmod_u)
 DO_HELPER_VVV(vmod_hu, 16, helper_vvv, do_vmod_u)
 DO_HELPER_VVV(vmod_wu, 32, helper_vvv, do_vmod_u)
 DO_HELPER_VVV(vmod_du, 64, helper_vvv, do_vmod_u)
+
+static int64_t sat_s(int64_t s1, uint32_t imm)
+{
+    int64_t max = MAKE_64BIT_MASK(0, imm);
+    int64_t min = MAKE_64BIT_MASK(imm, 64);
+
+    if (s1 > max -1) {
+        return max;
+    } else if (s1 < - max) {
+        return min;
+    } else {
+        return s1;
+    }
+}
+
+static void do_vsat_s(vec_t *Vd, vec_t *Vj, uint32_t imm, int bit, int n)
+{
+    switch (bit) {
+    case 8:
+        Vd->B[n] = sat_s(Vj->B[n], imm);
+        break;
+    case 16:
+        Vd->H[n] = sat_s(Vj->H[n], imm);
+        break;
+    case 32:
+        Vd->W[n] = sat_s(Vj->W[n], imm);
+        break;
+    case 64:
+        Vd->D[n] = sat_s(Vj->D[n], imm);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static uint64_t sat_u(uint64_t u1, uint32_t imm)
+{
+    uint64_t umax_imm = MAKE_64BIT_MASK(0, imm + 1);
+
+    return u1 < umax_imm ? u1 : umax_imm;
+}
+
+static void do_vsat_u(vec_t *Vd, vec_t *Vj, uint32_t imm, int bit, int n)
+{
+    switch (bit) {
+    case 8:
+        Vd->B[n] = sat_u((uint8_t)Vj->B[n], imm);
+        break;
+    case 16:
+        Vd->H[n] = sat_u((uint16_t)Vj->H[n], imm);
+        break;
+    case 32:
+        Vd->W[n] = sat_u((uint32_t)Vj->W[n], imm);
+        break;
+    case 64:
+        Vd->D[n] = sat_u((uint64_t)Vj->D[n], imm);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+DO_HELPER_VV_I(vsat_b, 8, helper_vv_i, do_vsat_s)
+DO_HELPER_VV_I(vsat_h, 16, helper_vv_i, do_vsat_s)
+DO_HELPER_VV_I(vsat_w, 32, helper_vv_i, do_vsat_s)
+DO_HELPER_VV_I(vsat_d, 64, helper_vv_i, do_vsat_s)
+DO_HELPER_VV_I(vsat_bu, 8, helper_vv_i, do_vsat_u)
+DO_HELPER_VV_I(vsat_hu, 16, helper_vv_i, do_vsat_u)
+DO_HELPER_VV_I(vsat_wu, 32, helper_vv_i, do_vsat_u)
+DO_HELPER_VV_I(vsat_du, 64, helper_vv_i, do_vsat_u)
-- 
2.31.1


