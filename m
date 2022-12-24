Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2146655932
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Dec 2022 09:24:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8zjD-0006Ye-9C; Sat, 24 Dec 2022 03:17:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1p8ziE-00068W-95
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 03:17:03 -0500
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1p8ziB-0000tg-M2
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 03:16:57 -0500
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8DxfetrtaZjOkkIAA--.18602S3;
 Sat, 24 Dec 2022 16:16:43 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8CxPuRhtaZjuccKAA--.38440S23; 
 Sat, 24 Dec 2022 16:16:43 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org
Subject: [RFC PATCH 21/43] target/loongarch: Implement vmskltz/vmskgez/vmsknz
Date: Sat, 24 Dec 2022 16:16:11 +0800
Message-Id: <20221224081633.4185445-22-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20221224081633.4185445-1-gaosong@loongson.cn>
References: <20221224081633.4185445-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8CxPuRhtaZjuccKAA--.38440S23
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoW3Xw1DAF45uF1rJr1Utry8uFg_yoW7GF1Dpr
 47try7trWxJFZ3Z3Z2vayfu3yDXrsxKw48uan3tw18ZrW7WF1DZr48t39rKFWrWr1DXryI
 qasFyryDKFW5Jw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
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
- VMSKLTZ.{B/H/W/D};
- VMSKGEZ.B;
- VMSKNZ.B.

Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 target/loongarch/disas.c                    |  7 +++
 target/loongarch/helper.h                   |  7 +++
 target/loongarch/insn_trans/trans_lsx.c.inc |  7 +++
 target/loongarch/insns.decode               |  7 +++
 target/loongarch/lsx_helper.c               | 54 +++++++++++++++++++++
 5 files changed, 82 insertions(+)

diff --git a/target/loongarch/disas.c b/target/loongarch/disas.c
index 34a459410b..b674167120 100644
--- a/target/loongarch/disas.c
+++ b/target/loongarch/disas.c
@@ -1055,3 +1055,10 @@ INSN_LSX(vsigncov_b,       vvv)
 INSN_LSX(vsigncov_h,       vvv)
 INSN_LSX(vsigncov_w,       vvv)
 INSN_LSX(vsigncov_d,       vvv)
+
+INSN_LSX(vmskltz_b,        vv)
+INSN_LSX(vmskltz_h,        vv)
+INSN_LSX(vmskltz_w,        vv)
+INSN_LSX(vmskltz_d,        vv)
+INSN_LSX(vmskgez_b,        vv)
+INSN_LSX(vmsknz_b,         vv)
diff --git a/target/loongarch/helper.h b/target/loongarch/helper.h
index c2b4407663..ae9351f513 100644
--- a/target/loongarch/helper.h
+++ b/target/loongarch/helper.h
@@ -410,3 +410,10 @@ DEF_HELPER_4(vsigncov_b, void, env, i32, i32, i32)
 DEF_HELPER_4(vsigncov_h, void, env, i32, i32, i32)
 DEF_HELPER_4(vsigncov_w, void, env, i32, i32, i32)
 DEF_HELPER_4(vsigncov_d, void, env, i32, i32, i32)
+
+DEF_HELPER_3(vmskltz_b, void, env, i32, i32)
+DEF_HELPER_3(vmskltz_h, void, env, i32, i32)
+DEF_HELPER_3(vmskltz_w, void, env, i32, i32)
+DEF_HELPER_3(vmskltz_d, void, env, i32, i32)
+DEF_HELPER_3(vmskgez_b, void, env, i32, i32)
+DEF_HELPER_3(vmsknz_b, void, env, i32,i32)
diff --git a/target/loongarch/insn_trans/trans_lsx.c.inc b/target/loongarch/insn_trans/trans_lsx.c.inc
index ce207eda05..c02602c409 100644
--- a/target/loongarch/insn_trans/trans_lsx.c.inc
+++ b/target/loongarch/insn_trans/trans_lsx.c.inc
@@ -326,3 +326,10 @@ TRANS(vsigncov_b, gen_vvv, gen_helper_vsigncov_b)
 TRANS(vsigncov_h, gen_vvv, gen_helper_vsigncov_h)
 TRANS(vsigncov_w, gen_vvv, gen_helper_vsigncov_w)
 TRANS(vsigncov_d, gen_vvv, gen_helper_vsigncov_d)
+
+TRANS(vmskltz_b, gen_vv, gen_helper_vmskltz_b)
+TRANS(vmskltz_h, gen_vv, gen_helper_vmskltz_h)
+TRANS(vmskltz_w, gen_vv, gen_helper_vmskltz_w)
+TRANS(vmskltz_d, gen_vv, gen_helper_vmskltz_d)
+TRANS(vmskgez_b, gen_vv, gen_helper_vmskgez_b)
+TRANS(vmsknz_b,  gen_vv, gen_helper_vmsknz_b)
diff --git a/target/loongarch/insns.decode b/target/loongarch/insns.decode
index c7237730d3..864a524fe6 100644
--- a/target/loongarch/insns.decode
+++ b/target/loongarch/insns.decode
@@ -782,3 +782,10 @@ vsigncov_b       0111 00010010 11100 ..... ..... .....    @vvv
 vsigncov_h       0111 00010010 11101 ..... ..... .....    @vvv
 vsigncov_w       0111 00010010 11110 ..... ..... .....    @vvv
 vsigncov_d       0111 00010010 11111 ..... ..... .....    @vvv
+
+vmskltz_b        0111 00101001 11000 10000 ..... .....    @vv
+vmskltz_h        0111 00101001 11000 10001 ..... .....    @vv
+vmskltz_w        0111 00101001 11000 10010 ..... .....    @vv
+vmskltz_d        0111 00101001 11000 10011 ..... .....    @vv
+vmskgez_b        0111 00101001 11000 10100 ..... .....    @vv
+vmsknz_b         0111 00101001 11000 11000 ..... .....    @vv
diff --git a/target/loongarch/lsx_helper.c b/target/loongarch/lsx_helper.c
index 73360e45e2..cea1d99eb6 100644
--- a/target/loongarch/lsx_helper.c
+++ b/target/loongarch/lsx_helper.c
@@ -1858,3 +1858,57 @@ DO_HELPER_VVV(vsigncov_b, 8, helper_vvv, do_vsigncov)
 DO_HELPER_VVV(vsigncov_h, 16, helper_vvv, do_vsigncov)
 DO_HELPER_VVV(vsigncov_w, 32, helper_vvv, do_vsigncov)
 DO_HELPER_VVV(vsigncov_d, 64, helper_vvv, do_vsigncov)
+
+/* Vd, Vj, vd = 0 */
+static void helper_vv_z(CPULoongArchState *env,
+                        uint32_t vd, uint32_t vj, int bit,
+                        void (*func)(vec_t*, vec_t*, int, int))
+{
+    int i;
+    vec_t *Vd = &(env->fpr[vd].vec);
+    vec_t *Vj = &(env->fpr[vj].vec);
+
+    Vd->D[0] = 0;
+    Vd->D[1] = 0;
+
+    for (i = 0; i < LSX_LEN/bit; i++) {
+        func(Vd, Vj, bit, i);
+    }
+}
+
+static void do_vmskltz(vec_t *Vd, vec_t *Vj, int bit, int n)
+{
+    switch (bit) {
+    case 8:
+        Vd->H[0] |= ((0x80 & Vj->B[n]) == 0) << n;
+        break;
+    case 16:
+        Vd->H[0] |= ((0x8000 & Vj->H[n]) == 0) << n;
+        break;
+    case 32:
+        Vd->H[0] |= ((0x80000000 & Vj->W[n]) == 0) << n;
+        break;
+    case 64:
+        Vd->H[0] |= ((0x8000000000000000 & Vj->D[n]) == 0) << n;
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static void do_vmskgez(vec_t *Vd, vec_t *Vj, int bit, int n)
+{
+    Vd->H[0] |= !((0x80 & Vj->B[n]) == 0) << n;
+}
+
+static void do_vmsknz(vec_t *Vd, vec_t *Vj, int bit, int n)
+{
+    Vd->H[0] |=  (Vj->B[n] == 0) << n;
+}
+
+DO_HELPER_VV(vmskltz_b, 8, helper_vv_z, do_vmskltz)
+DO_HELPER_VV(vmskltz_h, 16, helper_vv_z, do_vmskltz)
+DO_HELPER_VV(vmskltz_w, 32, helper_vv_z, do_vmskltz)
+DO_HELPER_VV(vmskltz_d, 64, helper_vv_z, do_vmskltz)
+DO_HELPER_VV(vmskgez_b, 8, helper_vv_z, do_vmskgez)
+DO_HELPER_VV(vmsknz_b, 8, helper_vv_z, do_vmsknz)
-- 
2.31.1


