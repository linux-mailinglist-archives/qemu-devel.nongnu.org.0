Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 321EE6F7B00
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 04:32:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pulC7-0004gY-J0; Thu, 04 May 2023 22:29:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1pulC5-0004Zh-5T
 for qemu-devel@nongnu.org; Thu, 04 May 2023 22:29:13 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1pulC2-0000AQ-5y
 for qemu-devel@nongnu.org; Thu, 04 May 2023 22:29:12 -0400
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8CxlfDkaVRk3fcEAA--.8280S3;
 Fri, 05 May 2023 10:28:52 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Bx8a+2aVRkNw9LAA--.7251S18; 
 Fri, 05 May 2023 10:28:46 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org
Subject: [PULL 16/45] target/loongarch: Implement vdiv/vmod
Date: Fri,  5 May 2023 10:27:37 +0800
Message-Id: <20230505022806.6082-17-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230505022806.6082-1-gaosong@loongson.cn>
References: <20230505022806.6082-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Bx8a+2aVRkNw9LAA--.7251S18
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoW3JrWDuF18Ary5WF45Gw47CFg_yoWxtryxpr
 W7trWUtr4xXrZ2qF1Sva13Aw1qgwsFgw47ZanIyF1DZry7XFnrXFy8t3929FW2g3Z5t34j
 gw13CryjkF95J37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bo8Fc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4
 AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF
 7I0E14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6x
 kF7I0E14v26r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020E
 x4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E74AGY7Cv6cx26rWlOx8S6xCaFV
 Cjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7VAKI48JMxAIw28IcVCjz48v
 1sIEY20_WwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVW8ZVWrXwC20s026c
 02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jrv_
 JF1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVW5JVW7JwCI42IY6xIIjxv20xvEc7
 CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v2
 6r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0z
 RVWlkUUUUU=
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Song Gao <gaosong@loongson.cn>
Message-Id: <20230504122810.4094787-17-gaosong@loongson.cn>
---
 target/loongarch/disas.c                    | 17 ++++++++++
 target/loongarch/helper.h                   | 17 ++++++++++
 target/loongarch/insn_trans/trans_lsx.c.inc | 17 ++++++++++
 target/loongarch/insns.decode               | 17 ++++++++++
 target/loongarch/lsx_helper.c               | 37 +++++++++++++++++++++
 5 files changed, 105 insertions(+)

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
index 8cf9620702..7b7c685ede 100644
--- a/target/loongarch/helper.h
+++ b/target/loongarch/helper.h
@@ -303,3 +303,20 @@ DEF_HELPER_FLAGS_4(vmaddwev_d_wu_w, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(vmaddwod_h_bu_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(vmaddwod_w_hu_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(vmaddwod_d_wu_w, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
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
index 400c3a0339..b295a9c4df 100644
--- a/target/loongarch/insn_trans/trans_lsx.c.inc
+++ b/target/loongarch/insn_trans/trans_lsx.c.inc
@@ -2676,3 +2676,20 @@ static void do_vmaddwod_u_s(unsigned vece, uint32_t vd_ofs, uint32_t vj_ofs,
 TRANS(vmaddwod_h_bu_b, gvec_vvv, MO_8, do_vmaddwod_u_s)
 TRANS(vmaddwod_w_hu_h, gvec_vvv, MO_16, do_vmaddwod_u_s)
 TRANS(vmaddwod_d_wu_w, gvec_vvv, MO_32, do_vmaddwod_u_s)
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
index 8f82091302..018009bbf9 100644
--- a/target/loongarch/lsx_helper.c
+++ b/target/loongarch/lsx_helper.c
@@ -553,3 +553,40 @@ void HELPER(NAME)(void *vd, void *vj, void *vk, uint32_t v) \
 VMADDWOD_U_S(vmaddwod_h_bu_b, 16, H, UH, B, UB, DO_MUL)
 VMADDWOD_U_S(vmaddwod_w_hu_h, 32, W, UW, H, UH, DO_MUL)
 VMADDWOD_U_S(vmaddwod_d_wu_w, 64, D, UD, W, UW, DO_MUL)
+
+#define DO_DIVU(N, M) (unlikely(M == 0) ? 0 : N / M)
+#define DO_REMU(N, M) (unlikely(M == 0) ? 0 : N % M)
+#define DO_DIV(N, M)  (unlikely(M == 0) ? 0 :\
+        unlikely((N == -N) && (M == (__typeof(N))(-1))) ? N : N / M)
+#define DO_REM(N, M)  (unlikely(M == 0) ? 0 :\
+        unlikely((N == -N) && (M == (__typeof(N))(-1))) ? 0 : N % M)
+
+#define VDIV(NAME, BIT, E, DO_OP)                           \
+void HELPER(NAME)(CPULoongArchState *env,                   \
+                  uint32_t vd, uint32_t vj, uint32_t vk)    \
+{                                                           \
+    int i;                                                  \
+    VReg *Vd = &(env->fpr[vd].vreg);                        \
+    VReg *Vj = &(env->fpr[vj].vreg);                        \
+    VReg *Vk = &(env->fpr[vk].vreg);                        \
+    for (i = 0; i < LSX_LEN/BIT; i++) {                     \
+        Vd->E(i) = DO_OP(Vj->E(i), Vk->E(i));               \
+    }                                                       \
+}
+
+VDIV(vdiv_b, 8, B, DO_DIV)
+VDIV(vdiv_h, 16, H, DO_DIV)
+VDIV(vdiv_w, 32, W, DO_DIV)
+VDIV(vdiv_d, 64, D, DO_DIV)
+VDIV(vdiv_bu, 8, UB, DO_DIVU)
+VDIV(vdiv_hu, 16, UH, DO_DIVU)
+VDIV(vdiv_wu, 32, UW, DO_DIVU)
+VDIV(vdiv_du, 64, UD, DO_DIVU)
+VDIV(vmod_b, 8, B, DO_REM)
+VDIV(vmod_h, 16, H, DO_REM)
+VDIV(vmod_w, 32, W, DO_REM)
+VDIV(vmod_d, 64, D, DO_REM)
+VDIV(vmod_bu, 8, UB, DO_REMU)
+VDIV(vmod_hu, 16, UH, DO_REMU)
+VDIV(vmod_wu, 32, UW, DO_REMU)
+VDIV(vmod_du, 64, UD, DO_REMU)
-- 
2.31.1


