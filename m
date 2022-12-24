Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5BC965593F
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Dec 2022 09:27:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8ziq-0006L5-U7; Sat, 24 Dec 2022 03:17:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1p8zi2-000683-B6
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 03:17:03 -0500
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1p8zhy-0000Lv-EF
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 03:16:46 -0500
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8Cxl_FktaZjFEkIAA--.17948S3;
 Sat, 24 Dec 2022 16:16:36 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8CxPuRhtaZjuccKAA--.38440S9; 
 Sat, 24 Dec 2022 16:16:36 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org
Subject: [RFC PATCH 07/43] target/loongarch: Implement vneg
Date: Sat, 24 Dec 2022 16:15:57 +0800
Message-Id: <20221224081633.4185445-8-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20221224081633.4185445-1-gaosong@loongson.cn>
References: <20221224081633.4185445-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8CxPuRhtaZjuccKAA--.38440S9
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoW3AFy3Ww47Cry5uFW7tF4xZwb_yoW7urWUpr
 47trW3trWUGFZ7X3Zaqw15Xw1jqrs7Kw1I9an3Kw4rZrW5XFnrZw1kt3yj9FWUW3yDZFy0
 g3W7C34DGFyfXw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
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

This patch includes;
- VNEG.{B/H/W/D}.

Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 target/loongarch/disas.c                    | 10 +++++
 target/loongarch/helper.h                   |  5 +++
 target/loongarch/insn_trans/trans_lsx.c.inc | 16 ++++++++
 target/loongarch/insns.decode               |  7 ++++
 target/loongarch/lsx_helper.c               | 42 +++++++++++++++++++++
 5 files changed, 80 insertions(+)

diff --git a/target/loongarch/disas.c b/target/loongarch/disas.c
index 13a503951a..53e299b4ba 100644
--- a/target/loongarch/disas.c
+++ b/target/loongarch/disas.c
@@ -773,6 +773,11 @@ static void output_vv_i(DisasContext *ctx, arg_vv_i *a, const char *mnemonic)
     output(ctx, mnemonic, "v%d, v%d, 0x%x", a->vd, a->vj, a->imm);
 }
 
+static void output_vv(DisasContext *ctx, arg_vv *a, const char *mnemonic)
+{
+    output(ctx, mnemonic, "v%d, v%d", a->vd, a->vj);
+}
+
 INSN_LSX(vadd_b,           vvv)
 INSN_LSX(vadd_h,           vvv)
 INSN_LSX(vadd_w,           vvv)
@@ -792,3 +797,8 @@ INSN_LSX(vsubi_bu,         vv_i)
 INSN_LSX(vsubi_hu,         vv_i)
 INSN_LSX(vsubi_wu,         vv_i)
 INSN_LSX(vsubi_du,         vv_i)
+
+INSN_LSX(vneg_b,           vv)
+INSN_LSX(vneg_h,           vv)
+INSN_LSX(vneg_w,           vv)
+INSN_LSX(vneg_d,           vv)
diff --git a/target/loongarch/helper.h b/target/loongarch/helper.h
index d6d50f6771..847950011e 100644
--- a/target/loongarch/helper.h
+++ b/target/loongarch/helper.h
@@ -151,3 +151,8 @@ DEF_HELPER_4(vsubi_bu, void, env, i32, i32, i32)
 DEF_HELPER_4(vsubi_hu, void, env, i32, i32, i32)
 DEF_HELPER_4(vsubi_wu, void, env, i32, i32, i32)
 DEF_HELPER_4(vsubi_du, void, env, i32, i32, i32)
+
+DEF_HELPER_3(vneg_b, void, env, i32, i32)
+DEF_HELPER_3(vneg_h, void, env, i32, i32)
+DEF_HELPER_3(vneg_w, void, env, i32, i32)
+DEF_HELPER_3(vneg_d, void, env, i32, i32)
diff --git a/target/loongarch/insn_trans/trans_lsx.c.inc b/target/loongarch/insn_trans/trans_lsx.c.inc
index 9485a03a08..00514709c1 100644
--- a/target/loongarch/insn_trans/trans_lsx.c.inc
+++ b/target/loongarch/insn_trans/trans_lsx.c.inc
@@ -39,6 +39,17 @@ static bool gen_vv_i(DisasContext *ctx, arg_vv_i *a,
     return true;
 }
 
+static bool gen_vv(DisasContext *ctx, arg_vv *a,
+                   void (*func)(TCGv_ptr, TCGv_i32, TCGv_i32))
+{
+    TCGv_i32 vd = tcg_constant_i32(a->vd);
+    TCGv_i32 vj = tcg_constant_i32(a->vj);
+
+    CHECK_SXE;
+    func(cpu_env, vd, vj);
+    return true;
+}
+
 TRANS(vadd_b, gen_vvv, gen_helper_vadd_b)
 TRANS(vadd_h, gen_vvv, gen_helper_vadd_h)
 TRANS(vadd_w, gen_vvv, gen_helper_vadd_w)
@@ -58,3 +69,8 @@ TRANS(vsubi_bu, gen_vv_i, gen_helper_vsubi_bu)
 TRANS(vsubi_hu, gen_vv_i, gen_helper_vsubi_hu)
 TRANS(vsubi_wu, gen_vv_i, gen_helper_vsubi_wu)
 TRANS(vsubi_du, gen_vv_i, gen_helper_vsubi_du)
+
+TRANS(vneg_b, gen_vv, gen_helper_vneg_b)
+TRANS(vneg_h, gen_vv, gen_helper_vneg_h)
+TRANS(vneg_w, gen_vv, gen_helper_vneg_w)
+TRANS(vneg_d, gen_vv, gen_helper_vneg_d)
diff --git a/target/loongarch/insns.decode b/target/loongarch/insns.decode
index 4f8226060a..3da5ed17ed 100644
--- a/target/loongarch/insns.decode
+++ b/target/loongarch/insns.decode
@@ -489,12 +489,14 @@ dbcl             0000 00000010 10101 ...............      @i15
 # LSX Argument sets
 #
 
+&vv           vd vj
 &vvv          vd vj vk
 &vv_i         vd vj imm
 
 #
 # LSX Formats
 #
+@vv               .... ........ ..... ..... vj:5 vd:5    &vv
 @vvv               .... ........ ..... vk:5 vj:5 vd:5    &vvv
 @vv_ui5           .... ........ ..... imm:5 vj:5 vd:5    &vv_i
 
@@ -517,3 +519,8 @@ vsubi_bu         0111 00101000 11000 ..... ..... .....    @vv_ui5
 vsubi_hu         0111 00101000 11001 ..... ..... .....    @vv_ui5
 vsubi_wu         0111 00101000 11010 ..... ..... .....    @vv_ui5
 vsubi_du         0111 00101000 11011 ..... ..... .....    @vv_ui5
+
+vneg_b           0111 00101001 11000 01100 ..... .....    @vv
+vneg_h           0111 00101001 11000 01101 ..... .....    @vv
+vneg_w           0111 00101001 11000 01110 ..... .....    @vv
+vneg_d           0111 00101001 11000 01111 ..... .....    @vv
diff --git a/target/loongarch/lsx_helper.c b/target/loongarch/lsx_helper.c
index e227db20d3..0fd17bf08f 100644
--- a/target/loongarch/lsx_helper.c
+++ b/target/loongarch/lsx_helper.c
@@ -20,6 +20,10 @@
                        uint32_t vd, uint32_t vj, uint32_t imm) \
     { FUNC(env, vd, vj, imm, BIT, __VA_ARGS__ ); }
 
+#define DO_HELPER_VV(NAME, BIT, FUNC, ...)                               \
+    void helper_##NAME(CPULoongArchState *env, uint32_t vd, uint32_t vj) \
+    { FUNC(env, vd, vj, BIT, __VA_ARGS__); }
+
 static void helper_vvv(CPULoongArchState *env,
                        uint32_t vd, uint32_t vj, uint32_t vk, int bit,
                        void (*func)(vec_t*, vec_t*, vec_t*, int, int))
@@ -47,6 +51,19 @@ static  void helper_vv_i(CPULoongArchState *env,
     }
 }
 
+static void helper_vv(CPULoongArchState *env,
+                      uint32_t vd, uint32_t vj, int bit,
+                      void (*func)(vec_t*, vec_t*, int, int))
+{
+    int i;
+    vec_t *Vd = &(env->fpr[vd].vec);
+    vec_t *Vj = &(env->fpr[vj].vec);
+
+    for (i = 0; i < LSX_LEN/bit; i++) {
+        func(Vd, Vj, bit, i);
+    }
+}
+
 static void do_vadd(vec_t *Vd, vec_t *Vj, vec_t *Vk,  int bit, int n)
 {
     switch (bit) {
@@ -152,3 +169,28 @@ DO_HELPER_VV_I(vsubi_bu, 8, helper_vv_i, do_vsubi)
 DO_HELPER_VV_I(vsubi_hu, 16, helper_vv_i, do_vsubi)
 DO_HELPER_VV_I(vsubi_wu, 32, helper_vv_i, do_vsubi)
 DO_HELPER_VV_I(vsubi_du, 64, helper_vv_i, do_vsubi)
+
+static void do_vneg(vec_t *Vd, vec_t *Vj, int bit, int n)
+{
+    switch (bit) {
+    case 8:
+        Vd->B[n] = -Vj->B[n];
+        break;
+    case 16:
+        Vd->H[n] = -Vj->H[n];
+        break;
+    case 32:
+        Vd->W[n] = -Vj->W[n];
+        break;
+    case 64:
+        Vd->D[n] = -Vj->D[n];
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+DO_HELPER_VV(vneg_b, 8, helper_vv, do_vneg)
+DO_HELPER_VV(vneg_h, 16, helper_vv, do_vneg)
+DO_HELPER_VV(vneg_w, 32, helper_vv, do_vneg)
+DO_HELPER_VV(vneg_d, 64, helper_vv, do_vneg)
-- 
2.31.1


