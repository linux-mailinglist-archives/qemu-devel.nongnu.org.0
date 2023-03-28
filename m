Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A135E6CB479
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 05:08:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgzg9-0007QG-Jy; Mon, 27 Mar 2023 23:07:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1pgzfk-0007Ff-Fj
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 23:06:57 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1pgzfi-0000UK-2y
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 23:06:56 -0400
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8Dx_5fAWSJkZ9oSAA--.29213S3;
 Tue, 28 Mar 2023 11:06:40 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Dxyr24WSJkZukOAA--.10252S19; 
 Tue, 28 Mar 2023 11:06:40 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org
Subject: [RFC PATCH v2 17/44] target/loongarch: Implement vdiv/vmod
Date: Tue, 28 Mar 2023 11:06:04 +0800
Message-Id: <20230328030631.3117129-18-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230328030631.3117129-1-gaosong@loongson.cn>
References: <20230328030631.3117129-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Dxyr24WSJkZukOAA--.10252S19
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoW3JrWDCFW7Wr1xGFW7ur1fXrb_yoWxKr4kpr
 y7tryUJr4xXrZ2qF1SvF43Aw42gwsFgw4UZ39ayF1UZrW7XFnrXry8t3929FW2gwn5Jryj
 gw1fAryjvryrJ37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
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
 target/loongarch/disas.c                    | 17 +++++++++
 target/loongarch/helper.h                   | 17 +++++++++
 target/loongarch/insn_trans/trans_lsx.c.inc | 17 +++++++++
 target/loongarch/insns.decode               | 17 +++++++++
 target/loongarch/lsx_helper.c               | 38 +++++++++++++++++++++
 5 files changed, 106 insertions(+)

diff --git a/target/loongarch/disas.c b/target/loongarch/disas.c
index 980e6e6375..6e4f676a42 100644
--- a/target/loongarch/disas.c
+++ b/target/loongarch/disas.c
@@ -1044,3 +1044,20 @@ INSN_LSX(vmaddwod_h_bu_b,  vvv)
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
index 6bb273fefe..e46f12cb65 100644
--- a/target/loongarch/helper.h
+++ b/target/loongarch/helper.h
@@ -318,3 +318,20 @@ DEF_HELPER_FLAGS_4(vmaddwod_h_bu_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(vmaddwod_w_hu_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(vmaddwod_d_wu_w, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(vmaddwod_q_du_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
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
index 29c7aca8f9..46a18da6dd 100644
--- a/target/loongarch/insn_trans/trans_lsx.c.inc
+++ b/target/loongarch/insn_trans/trans_lsx.c.inc
@@ -2365,3 +2365,20 @@ TRANS(vmaddwod_h_bu_b, gvec_vvv, MO_8, do_vmaddwod_u_s)
 TRANS(vmaddwod_w_hu_h, gvec_vvv, MO_16, do_vmaddwod_u_s)
 TRANS(vmaddwod_d_wu_w, gvec_vvv, MO_32, do_vmaddwod_u_s)
 TRANS(vmaddwod_q_du_d, gvec_vvv, MO_64, do_vmaddwod_u_s)
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
index df23d4ee1e..67d016edb7 100644
--- a/target/loongarch/insns.decode
+++ b/target/loongarch/insns.decode
@@ -740,3 +740,20 @@ vmaddwod_h_bu_b  0111 00001011 11100 ..... ..... .....    @vvv
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
index 9ae56e9fcb..03a837fa74 100644
--- a/target/loongarch/lsx_helper.c
+++ b/target/loongarch/lsx_helper.c
@@ -725,3 +725,41 @@ VMADDWOD_U_S(vmaddwod_h_bu_b, 16, uint16_t, uint8_t, int16_t, H, B, DO_MUL)
 VMADDWOD_U_S(vmaddwod_w_hu_h, 32, uint32_t, uint16_t, int32_t, W, H, DO_MUL)
 VMADDWOD_U_S(vmaddwod_d_wu_w, 64, uint64_t, uint32_t, int64_t, D, W, DO_MUL)
 VMADD_Q(vmaddwod_q_du_d, int128_make64, int128_makes64, 1)
+
+#define DO_DIVU(N, M) (unlikely(M == 0) ? 0 : N / M)
+#define DO_REMU(N, M) (unlikely(M == 0) ? 0 : N % M)
+#define DO_DIV(N, M)  (unlikely(M == 0) ? 0 :\
+        unlikely((N == -N) && (M == (__typeof(N))(-1))) ? N : N / M)
+#define DO_REM(N, M)  (unlikely(M == 0) ? 0 :\
+        unlikely((N == -N) && (M == (__typeof(N))(-1))) ? 0 : N % M)
+
+#define DO_3OP(NAME, BIT, T, E, DO_OP)                   \
+void HELPER(NAME)(CPULoongArchState *env,                \
+                  uint32_t vd, uint32_t vj, uint32_t vk) \
+{                                                        \
+    int i;                                               \
+    VReg *Vd = &(env->fpr[vd].vreg);                     \
+    VReg *Vj = &(env->fpr[vj].vreg);                     \
+    VReg *Vk = &(env->fpr[vk].vreg);                     \
+                                                         \
+    for (i = 0; i < LSX_LEN/BIT; i++) {                  \
+        Vd->E(i) = DO_OP((T)Vj->E(i), (T)Vk->E(i));      \
+    }                                                    \
+}
+
+DO_3OP(vdiv_b, 8, int8_t, B, DO_DIV)
+DO_3OP(vdiv_h, 16, int16_t, H, DO_DIV)
+DO_3OP(vdiv_w, 32, int32_t, W, DO_DIV)
+DO_3OP(vdiv_d, 64, int64_t, D, DO_DIV)
+DO_3OP(vdiv_bu, 8, uint8_t, B, DO_DIVU)
+DO_3OP(vdiv_hu, 16, uint16_t, H, DO_DIVU)
+DO_3OP(vdiv_wu, 32, uint32_t, W, DO_DIVU)
+DO_3OP(vdiv_du, 64, uint64_t, D, DO_DIVU)
+DO_3OP(vmod_b, 8, int8_t, B, DO_REM)
+DO_3OP(vmod_h, 16, int16_t, H, DO_REM)
+DO_3OP(vmod_w, 32, int32_t, W, DO_REM)
+DO_3OP(vmod_d, 64, int64_t, D, DO_REM)
+DO_3OP(vmod_bu, 8, uint8_t, B, DO_REMU)
+DO_3OP(vmod_hu, 16, uint16_t, H, DO_REMU)
+DO_3OP(vmod_wu, 32, uint32_t, W, DO_REMU)
+DO_3OP(vmod_du, 64, uint64_t, D, DO_REMU)
-- 
2.31.1


