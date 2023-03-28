Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2396CB487
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 05:09:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgzgz-0002K7-Vy; Mon, 27 Mar 2023 23:08:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1pgzgv-0001o1-1n
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 23:08:09 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1pgzgq-0001tb-7m
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 23:08:08 -0400
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8DxUOXJWSJkhNoSAA--.28741S3;
 Tue, 28 Mar 2023 11:06:49 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Dxyr24WSJkZukOAA--.10252S30; 
 Tue, 28 Mar 2023 11:06:47 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org
Subject: [RFC PATCH v2 28/44] target/loongarch: Implement vssrln vssran
Date: Tue, 28 Mar 2023 11:06:15 +0800
Message-Id: <20230328030631.3117129-29-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230328030631.3117129-1-gaosong@loongson.cn>
References: <20230328030631.3117129-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Dxyr24WSJkZukOAA--.10252S30
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvAXoW3ZF1UZw1UCFy8Kr4Uur1kuFg_yoW8Aw4UCo
 Z3Aa15ZF48Gr1a9ryj93409ws7ta48tw1DAFWDZrn8KryktF12qw15K34kta9YvFZI9ry7
 Wa97ur1Yy34avr1kn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXasCq-sGcSsGvf
 J3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnRJU
 UUqG1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64
 kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY
 1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aV
 CY1x0267AKxVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x2
 6I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6x8ErcxFaVAv8VWrMcvjeVCFs4
 IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwIxGrwCF04k20xvE74AG
 Y7Cv6cx26rWl4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s
 026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1Y6r17MIIYrxkI7VAKI48JMIIF
 0xvE2Ix0cI8IcVAFwI0_Ar0_tr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI42
 IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Cr0_Gr1UMIIF0xvEx4A2
 jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0zRVWlkUUUUU=
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
- VSSRLN.{B.H/H.W/W.D};
- VSSRAN.{B.H/H.W/W.D};
- VSSRLN.{BU.H/HU.W/WU.D};
- VSSRAN.{BU.H/HU.W/WU.D};
- VSSRLNI.{B.H/H.W/W.D/D.Q};
- VSSRANI.{B.H/H.W/W.D/D.Q};
- VSSRLNI.{BU.H/HU.W/WU.D/DU.Q};
- VSSRANI.{BU.H/HU.W/WU.D/DU.Q}.

Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 target/loongarch/disas.c                    |  30 ++
 target/loongarch/helper.h                   |  30 ++
 target/loongarch/insn_trans/trans_lsx.c.inc |  30 ++
 target/loongarch/insns.decode               |  30 ++
 target/loongarch/lsx_helper.c               | 383 ++++++++++++++++++++
 5 files changed, 503 insertions(+)

diff --git a/target/loongarch/disas.c b/target/loongarch/disas.c
index 185cd36381..426d30dc01 100644
--- a/target/loongarch/disas.c
+++ b/target/loongarch/disas.c
@@ -1198,3 +1198,33 @@ INSN_LSX(vsrarni_b_h,      vv_i)
 INSN_LSX(vsrarni_h_w,      vv_i)
 INSN_LSX(vsrarni_w_d,      vv_i)
 INSN_LSX(vsrarni_d_q,      vv_i)
+
+INSN_LSX(vssrln_b_h,       vvv)
+INSN_LSX(vssrln_h_w,       vvv)
+INSN_LSX(vssrln_w_d,       vvv)
+INSN_LSX(vssran_b_h,       vvv)
+INSN_LSX(vssran_h_w,       vvv)
+INSN_LSX(vssran_w_d,       vvv)
+INSN_LSX(vssrln_bu_h,      vvv)
+INSN_LSX(vssrln_hu_w,      vvv)
+INSN_LSX(vssrln_wu_d,      vvv)
+INSN_LSX(vssran_bu_h,      vvv)
+INSN_LSX(vssran_hu_w,      vvv)
+INSN_LSX(vssran_wu_d,      vvv)
+
+INSN_LSX(vssrlni_b_h,      vv_i)
+INSN_LSX(vssrlni_h_w,      vv_i)
+INSN_LSX(vssrlni_w_d,      vv_i)
+INSN_LSX(vssrlni_d_q,      vv_i)
+INSN_LSX(vssrani_b_h,      vv_i)
+INSN_LSX(vssrani_h_w,      vv_i)
+INSN_LSX(vssrani_w_d,      vv_i)
+INSN_LSX(vssrani_d_q,      vv_i)
+INSN_LSX(vssrlni_bu_h,     vv_i)
+INSN_LSX(vssrlni_hu_w,     vv_i)
+INSN_LSX(vssrlni_wu_d,     vv_i)
+INSN_LSX(vssrlni_du_q,     vv_i)
+INSN_LSX(vssrani_bu_h,     vv_i)
+INSN_LSX(vssrani_hu_w,     vv_i)
+INSN_LSX(vssrani_wu_d,     vv_i)
+INSN_LSX(vssrani_du_q,     vv_i)
diff --git a/target/loongarch/helper.h b/target/loongarch/helper.h
index ee0812dca2..7562f01ad6 100644
--- a/target/loongarch/helper.h
+++ b/target/loongarch/helper.h
@@ -426,3 +426,33 @@ DEF_HELPER_4(vsrarni_b_h, void, env, i32, i32, i32)
 DEF_HELPER_4(vsrarni_h_w, void, env, i32, i32, i32)
 DEF_HELPER_4(vsrarni_w_d, void, env, i32, i32, i32)
 DEF_HELPER_4(vsrarni_d_q, void, env, i32, i32, i32)
+
+DEF_HELPER_4(vssrln_b_h, void, env, i32, i32, i32)
+DEF_HELPER_4(vssrln_h_w, void, env, i32, i32, i32)
+DEF_HELPER_4(vssrln_w_d, void, env, i32, i32, i32)
+DEF_HELPER_4(vssran_b_h, void, env, i32, i32, i32)
+DEF_HELPER_4(vssran_h_w, void, env, i32, i32, i32)
+DEF_HELPER_4(vssran_w_d, void, env, i32, i32, i32)
+DEF_HELPER_4(vssrln_bu_h, void, env, i32, i32, i32)
+DEF_HELPER_4(vssrln_hu_w, void, env, i32, i32, i32)
+DEF_HELPER_4(vssrln_wu_d, void, env, i32, i32, i32)
+DEF_HELPER_4(vssran_bu_h, void, env, i32, i32, i32)
+DEF_HELPER_4(vssran_hu_w, void, env, i32, i32, i32)
+DEF_HELPER_4(vssran_wu_d, void, env, i32, i32, i32)
+
+DEF_HELPER_4(vssrlni_b_h, void, env, i32, i32, i32)
+DEF_HELPER_4(vssrlni_h_w, void, env, i32, i32, i32)
+DEF_HELPER_4(vssrlni_w_d, void, env, i32, i32, i32)
+DEF_HELPER_4(vssrlni_d_q, void, env, i32, i32, i32)
+DEF_HELPER_4(vssrani_b_h, void, env, i32, i32, i32)
+DEF_HELPER_4(vssrani_h_w, void, env, i32, i32, i32)
+DEF_HELPER_4(vssrani_w_d, void, env, i32, i32, i32)
+DEF_HELPER_4(vssrani_d_q, void, env, i32, i32, i32)
+DEF_HELPER_4(vssrlni_bu_h, void, env, i32, i32, i32)
+DEF_HELPER_4(vssrlni_hu_w, void, env, i32, i32, i32)
+DEF_HELPER_4(vssrlni_wu_d, void, env, i32, i32, i32)
+DEF_HELPER_4(vssrlni_du_q, void, env, i32, i32, i32)
+DEF_HELPER_4(vssrani_bu_h, void, env, i32, i32, i32)
+DEF_HELPER_4(vssrani_hu_w, void, env, i32, i32, i32)
+DEF_HELPER_4(vssrani_wu_d, void, env, i32, i32, i32)
+DEF_HELPER_4(vssrani_du_q, void, env, i32, i32, i32)
diff --git a/target/loongarch/insn_trans/trans_lsx.c.inc b/target/loongarch/insn_trans/trans_lsx.c.inc
index a8f699915d..58f27d7f65 100644
--- a/target/loongarch/insn_trans/trans_lsx.c.inc
+++ b/target/loongarch/insn_trans/trans_lsx.c.inc
@@ -2725,3 +2725,33 @@ TRANS(vsrarni_b_h, gen_vv_i, gen_helper_vsrarni_b_h)
 TRANS(vsrarni_h_w, gen_vv_i, gen_helper_vsrarni_h_w)
 TRANS(vsrarni_w_d, gen_vv_i, gen_helper_vsrarni_w_d)
 TRANS(vsrarni_d_q, gen_vv_i, gen_helper_vsrarni_d_q)
+
+TRANS(vssrln_b_h, gen_vvv, gen_helper_vssrln_b_h)
+TRANS(vssrln_h_w, gen_vvv, gen_helper_vssrln_h_w)
+TRANS(vssrln_w_d, gen_vvv, gen_helper_vssrln_w_d)
+TRANS(vssran_b_h, gen_vvv, gen_helper_vssran_b_h)
+TRANS(vssran_h_w, gen_vvv, gen_helper_vssran_h_w)
+TRANS(vssran_w_d, gen_vvv, gen_helper_vssran_w_d)
+TRANS(vssrln_bu_h, gen_vvv, gen_helper_vssrln_bu_h)
+TRANS(vssrln_hu_w, gen_vvv, gen_helper_vssrln_hu_w)
+TRANS(vssrln_wu_d, gen_vvv, gen_helper_vssrln_wu_d)
+TRANS(vssran_bu_h, gen_vvv, gen_helper_vssran_bu_h)
+TRANS(vssran_hu_w, gen_vvv, gen_helper_vssran_hu_w)
+TRANS(vssran_wu_d, gen_vvv, gen_helper_vssran_wu_d)
+
+TRANS(vssrlni_b_h, gen_vv_i, gen_helper_vssrlni_b_h)
+TRANS(vssrlni_h_w, gen_vv_i, gen_helper_vssrlni_h_w)
+TRANS(vssrlni_w_d, gen_vv_i, gen_helper_vssrlni_w_d)
+TRANS(vssrlni_d_q, gen_vv_i, gen_helper_vssrlni_d_q)
+TRANS(vssrani_b_h, gen_vv_i, gen_helper_vssrani_b_h)
+TRANS(vssrani_h_w, gen_vv_i, gen_helper_vssrani_h_w)
+TRANS(vssrani_w_d, gen_vv_i, gen_helper_vssrani_w_d)
+TRANS(vssrani_d_q, gen_vv_i, gen_helper_vssrani_d_q)
+TRANS(vssrlni_bu_h, gen_vv_i, gen_helper_vssrlni_bu_h)
+TRANS(vssrlni_hu_w, gen_vv_i, gen_helper_vssrlni_hu_w)
+TRANS(vssrlni_wu_d, gen_vv_i, gen_helper_vssrlni_wu_d)
+TRANS(vssrlni_du_q, gen_vv_i, gen_helper_vssrlni_du_q)
+TRANS(vssrani_bu_h, gen_vv_i, gen_helper_vssrani_bu_h)
+TRANS(vssrani_hu_w, gen_vv_i, gen_helper_vssrani_hu_w)
+TRANS(vssrani_wu_d, gen_vv_i, gen_helper_vssrani_wu_d)
+TRANS(vssrani_du_q, gen_vv_i, gen_helper_vssrani_du_q)
diff --git a/target/loongarch/insns.decode b/target/loongarch/insns.decode
index 29bf4a8a6a..772c5cddfe 100644
--- a/target/loongarch/insns.decode
+++ b/target/loongarch/insns.decode
@@ -899,3 +899,33 @@ vsrarni_b_h      0111 00110101 11000 1 .... ..... .....   @vv_ui4
 vsrarni_h_w      0111 00110101 11001 ..... ..... .....    @vv_ui5
 vsrarni_w_d      0111 00110101 1101 ...... ..... .....    @vv_ui6
 vsrarni_d_q      0111 00110101 111 ....... ..... .....    @vv_ui7
+
+vssrln_b_h       0111 00001111 11001 ..... ..... .....    @vvv
+vssrln_h_w       0111 00001111 11010 ..... ..... .....    @vvv
+vssrln_w_d       0111 00001111 11011 ..... ..... .....    @vvv
+vssran_b_h       0111 00001111 11101 ..... ..... .....    @vvv
+vssran_h_w       0111 00001111 11110 ..... ..... .....    @vvv
+vssran_w_d       0111 00001111 11111 ..... ..... .....    @vvv
+vssrln_bu_h      0111 00010000 01001 ..... ..... .....    @vvv
+vssrln_hu_w      0111 00010000 01010 ..... ..... .....    @vvv
+vssrln_wu_d      0111 00010000 01011 ..... ..... .....    @vvv
+vssran_bu_h      0111 00010000 01101 ..... ..... .....    @vvv
+vssran_hu_w      0111 00010000 01110 ..... ..... .....    @vvv
+vssran_wu_d      0111 00010000 01111 ..... ..... .....    @vvv
+
+vssrlni_b_h      0111 00110100 10000 1 .... ..... .....   @vv_ui4
+vssrlni_h_w      0111 00110100 10001 ..... ..... .....    @vv_ui5
+vssrlni_w_d      0111 00110100 1001 ...... ..... .....    @vv_ui6
+vssrlni_d_q      0111 00110100 101 ....... ..... .....    @vv_ui7
+vssrani_b_h      0111 00110110 00000 1 .... ..... .....   @vv_ui4
+vssrani_h_w      0111 00110110 00001 ..... ..... .....    @vv_ui5
+vssrani_w_d      0111 00110110 0001 ...... ..... .....    @vv_ui6
+vssrani_d_q      0111 00110110 001 ....... ..... .....    @vv_ui7
+vssrlni_bu_h     0111 00110100 11000 1 .... ..... .....   @vv_ui4
+vssrlni_hu_w     0111 00110100 11001 ..... ..... .....    @vv_ui5
+vssrlni_wu_d     0111 00110100 1101 ...... ..... .....    @vv_ui6
+vssrlni_du_q     0111 00110100 111 ....... ..... .....    @vv_ui7
+vssrani_bu_h     0111 00110110 01000 1 .... ..... .....   @vv_ui4
+vssrani_hu_w     0111 00110110 01001 ..... ..... .....    @vv_ui5
+vssrani_wu_d     0111 00110110 0101 ...... ..... .....    @vv_ui6
+vssrani_du_q     0111 00110110 011 ....... ..... .....    @vv_ui7
diff --git a/target/loongarch/lsx_helper.c b/target/loongarch/lsx_helper.c
index c0e704c7e5..680b345695 100644
--- a/target/loongarch/lsx_helper.c
+++ b/target/loongarch/lsx_helper.c
@@ -1425,3 +1425,386 @@ void HELPER(vsrarni_d_q)(CPULoongArchState *env,
 VSRARNI(vsrarni_b_h, 16, B, H)
 VSRARNI(vsrarni_h_w, 32, H, W)
 VSRARNI(vsrarni_w_d, 64, W, D)
+
+#define SSRLNS(NAME, T1, T2, T3)                    \
+static T1 do_ssrlns_ ## NAME(T2 e2, int sa, int sh) \
+{                                                   \
+        T1 shft_res;                                \
+        if (sa == 0) {                              \
+            shft_res = e2;                          \
+        } else {                                    \
+            shft_res = (((T1)e2) >> sa);            \
+        }                                           \
+        T3 mask;                                    \
+        mask = (1u << sh) -1;                       \
+        if (shft_res > mask) {                      \
+            return mask;                            \
+        } else {                                    \
+            return  shft_res;                       \
+        }                                           \
+}
+
+SSRLNS(B, uint16_t, int16_t, uint8_t)
+SSRLNS(H, uint32_t, int32_t, uint16_t)
+SSRLNS(W, uint64_t, int64_t, uint32_t)
+
+#define VSSRLN(NAME, BIT, T, E1, E2)                                          \
+void HELPER(NAME)(CPULoongArchState *env,                                     \
+                  uint32_t vd, uint32_t vj, uint32_t vk)                      \
+{                                                                             \
+    int i;                                                                    \
+    VReg *Vd = &(env->fpr[vd].vreg);                                          \
+    VReg *Vj = &(env->fpr[vj].vreg);                                          \
+    VReg *Vk = &(env->fpr[vk].vreg);                                          \
+                                                                              \
+    for (i = 0; i < LSX_LEN/BIT; i++) {                                       \
+        Vd->E1(i) = do_ssrlns_ ## E1(Vj->E2(i), (T)Vk->E2(i)% BIT, BIT/2 -1); \
+    }                                                                         \
+    Vd->D(1) = 0;                                                             \
+}
+
+VSSRLN(vssrln_b_h, 16, uint16_t, B, H)
+VSSRLN(vssrln_h_w, 32, uint32_t, H, W)
+VSSRLN(vssrln_w_d, 64, uint64_t, W, D)
+
+#define SSRANS(E, T1, T2)                        \
+static T1 do_ssrans_ ## E(T1 e2, int sa, int sh) \
+{                                                \
+        T1 shft_res;                             \
+        if (sa == 0) {                           \
+            shft_res = e2;                       \
+        } else {                                 \
+            shft_res = e2 >> sa;                 \
+        }                                        \
+        T2 mask;                                 \
+        mask = (1l << sh) -1;                    \
+        if (shft_res > mask) {                   \
+            return  mask;                        \
+        } else if (shft_res < -(mask +1)) {      \
+            return  ~mask;                       \
+        } else {                                 \
+            return shft_res;                     \
+        }                                        \
+}
+
+SSRANS(B, int16_t, int8_t)
+SSRANS(H, int32_t, int16_t)
+SSRANS(W, int64_t, int32_t)
+
+#define VSSRAN(NAME, BIT, T, E1, E2)                                         \
+void HELPER(NAME)(CPULoongArchState *env,                                    \
+                  uint32_t vd, uint32_t vj, uint32_t vk)                     \
+{                                                                            \
+    int i;                                                                   \
+    VReg *Vd = &(env->fpr[vd].vreg);                                         \
+    VReg *Vj = &(env->fpr[vj].vreg);                                         \
+    VReg *Vk = &(env->fpr[vk].vreg);                                         \
+                                                                             \
+    for (i = 0; i < LSX_LEN/BIT; i++) {                                      \
+        Vd->E1(i) = do_ssrans_ ## E1(Vj->E2(i), (T)Vk->E2(i)%BIT, BIT/2 -1); \
+    }                                                                        \
+    Vd->D(1) = 0;                                                            \
+}
+
+VSSRAN(vssran_b_h, 16, uint16_t, B, H)
+VSSRAN(vssran_h_w, 32, uint32_t, H, W)
+VSSRAN(vssran_w_d, 64, uint64_t, W, D)
+
+#define SSRLNU(E, T1, T2, T3)                    \
+static T1 do_ssrlnu_ ## E(T3 e2, int sa, int sh) \
+{                                                \
+        T1 shft_res;                             \
+        if (sa == 0) {                           \
+            shft_res = e2;                       \
+        } else {                                 \
+            shft_res = (((T1)e2) >> sa);         \
+        }                                        \
+        T2 mask;                                 \
+        mask = (1ul << sh) -1;                   \
+        if (shft_res > mask) {                   \
+            return mask;                         \
+        } else {                                 \
+            return shft_res;                     \
+        }                                        \
+}
+
+SSRLNU(B, uint16_t, uint8_t,  int16_t)
+SSRLNU(H, uint32_t, uint16_t, int32_t)
+SSRLNU(W, uint64_t, uint32_t, int64_t)
+
+#define VSSRLNU(NAME, BIT, T, E1, E2)                                     \
+void HELPER(NAME)(CPULoongArchState *env,                                 \
+                  uint32_t vd, uint32_t vj, uint32_t vk)                  \
+{                                                                         \
+    int i;                                                                \
+    VReg *Vd = &(env->fpr[vd].vreg);                                      \
+    VReg *Vj = &(env->fpr[vj].vreg);                                      \
+    VReg *Vk = &(env->fpr[vk].vreg);                                      \
+                                                                          \
+    for (i = 0; i < LSX_LEN/BIT; i++) {                                   \
+        Vd->E1(i) = do_ssrlnu_ ## E1(Vj->E2(i), (T)Vk->E2(i)%BIT, BIT/2); \
+    }                                                                     \
+    Vd->D(1) = 0;                                                         \
+}
+
+VSSRLNU(vssrln_bu_h, 16, uint16_t, B, H)
+VSSRLNU(vssrln_hu_w, 32, uint32_t, H, W)
+VSSRLNU(vssrln_wu_d, 64, uint64_t, W, D)
+
+#define SSRANU(E, T1, T2, T3)                    \
+static T1 do_ssranu_ ## E(T3 e2, int sa, int sh) \
+{                                                \
+        T1 shft_res;                             \
+        if (sa == 0) {                           \
+            shft_res = e2;                       \
+        } else {                                 \
+            shft_res = e2 >> sa;                 \
+        }                                        \
+        if (e2 < 0) {                            \
+            shft_res = 0;                        \
+        }                                        \
+        T2 mask;                                 \
+        mask = (1ul << sh) -1;                   \
+        if (shft_res > mask) {                   \
+            return mask;                         \
+        } else {                                 \
+            return shft_res;                     \
+        }                                        \
+}
+
+SSRANU(B, uint16_t, uint8_t,  int16_t)
+SSRANU(H, uint32_t, uint16_t, int32_t)
+SSRANU(W, uint64_t, uint32_t, int64_t)
+
+#define VSSRANU(NAME, BIT, T, E1, E2)                                     \
+void HELPER(NAME)(CPULoongArchState *env,                                 \
+                  uint32_t vd, uint32_t vj, uint32_t vk)                  \
+{                                                                         \
+    int i;                                                                \
+    VReg *Vd = &(env->fpr[vd].vreg);                                      \
+    VReg *Vj = &(env->fpr[vj].vreg);                                      \
+    VReg *Vk = &(env->fpr[vk].vreg);                                      \
+                                                                          \
+    for (i = 0; i < LSX_LEN/BIT; i++) {                                   \
+        Vd->E1(i) = do_ssranu_ ## E1(Vj->E2(i), (T)Vk->E2(i)%BIT, BIT/2); \
+    }                                                                     \
+    Vd->D(1) = 0;                                                         \
+}
+
+VSSRANU(vssran_bu_h, 16, uint16_t, B, H)
+VSSRANU(vssran_hu_w, 32, uint32_t, H, W)
+VSSRANU(vssran_wu_d, 64, uint64_t, W, D)
+
+#define VSSRLNI(NAME, BIT, E1, E2)                                            \
+void HELPER(NAME)(CPULoongArchState *env,                                     \
+                  uint32_t vd, uint32_t vj, uint32_t imm)                     \
+{                                                                             \
+    int i;                                                                    \
+    VReg temp;                                                                \
+    VReg *Vd = &(env->fpr[vd].vreg);                                          \
+    VReg *Vj = &(env->fpr[vj].vreg);                                          \
+                                                                              \
+    for (i = 0; i < LSX_LEN/BIT; i++) {                                       \
+        temp.E1(i) = do_ssrlns_ ## E1(Vj->E2(i), imm, BIT/2 -1);              \
+        temp.E1(i + LSX_LEN/BIT) = do_ssrlns_ ## E1(Vd->E2(i), imm, BIT/2 -1);\
+    }                                                                         \
+    Vd->D(0) = temp.D(0);                                                     \
+    Vd->D(1) = temp.D(1);                                                     \
+}
+
+void HELPER(vssrlni_d_q)(CPULoongArchState *env,
+                         uint32_t vd, uint32_t vj, uint32_t imm)
+{
+    Int128 shft_res1, shft_res2, mask;
+    VReg *Vd = &(env->fpr[vd].vreg);
+    VReg *Vj = &(env->fpr[vj].vreg);
+
+    if (imm == 0) {
+        shft_res1 = Vj->Q(0);
+        shft_res2 = Vd->Q(0);
+    } else {
+        shft_res1 = int128_urshift(Vj->Q(0), imm);
+        shft_res2 = int128_urshift(Vd->Q(0), imm);
+    }
+    mask = int128_sub(int128_lshift(int128_one(), 63), int128_one());
+
+    if (int128_ult(mask, shft_res1)) {
+        Vd->D(0) = int128_getlo(mask);
+    }else {
+        Vd->D(0) = int128_getlo(shft_res1);
+    }
+
+    if (int128_ult(mask, shft_res2)) {
+        Vd->D(1) = int128_getlo(mask);
+    }else {
+        Vd->D(1) = int128_getlo(shft_res2);
+    }
+}
+
+VSSRLNI(vssrlni_b_h, 16, B, H)
+VSSRLNI(vssrlni_h_w, 32, H, W)
+VSSRLNI(vssrlni_w_d, 64, W, D)
+
+#define VSSRANI(NAME, BIT, E1, E2)                                             \
+void HELPER(NAME)(CPULoongArchState *env,                                      \
+                  uint32_t vd, uint32_t vj, uint32_t imm)                      \
+{                                                                              \
+    int i;                                                                     \
+    VReg temp;                                                                 \
+    VReg *Vd = &(env->fpr[vd].vreg);                                           \
+    VReg *Vj = &(env->fpr[vj].vreg);                                           \
+                                                                               \
+    for (i = 0; i < LSX_LEN/BIT; i++) {                                        \
+        temp.E1(i) = do_ssrans_ ## E1(Vj->E2(i), imm, BIT/2 -1);               \
+        temp.E1(i + LSX_LEN/BIT) = do_ssrans_ ## E1(Vd->E2(i), imm, BIT/2 -1); \
+    }                                                                          \
+    Vd->D(0) = temp.D(0);                                                      \
+    Vd->D(1) = temp.D(1);                                                      \
+}
+
+void HELPER(vssrani_d_q)(CPULoongArchState *env,
+                         uint32_t vd, uint32_t vj, uint32_t imm)
+{
+    Int128 shft_res1, shft_res2, mask, min;
+    VReg *Vd = &(env->fpr[vd].vreg);
+    VReg *Vj = &(env->fpr[vj].vreg);
+
+    if (imm == 0) {
+        shft_res1 = Vj->Q(0);
+        shft_res2 = Vd->Q(0);
+    } else {
+        shft_res1 = int128_rshift(Vj->Q(0), imm);
+        shft_res2 = int128_rshift(Vd->Q(0), imm);
+    }
+    mask = int128_sub(int128_lshift(int128_one(), 63), int128_one());
+    min  = int128_lshift(int128_one(), 63);
+
+    if (int128_gt(shft_res1,  mask)) {
+        Vd->D(0) = int128_getlo(mask);
+    } else if (int128_lt(shft_res1, int128_neg(min))) {
+        Vd->D(0) = int128_getlo(min);
+    } else {
+        Vd->D(0) = int128_getlo(shft_res1);
+    }
+
+    if (int128_gt(shft_res2, mask)) {
+        Vd->D(1) = int128_getlo(mask);
+    } else if (int128_lt(shft_res2, int128_neg(min))) {
+        Vd->D(1) = int128_getlo(min);
+    } else {
+        Vd->D(1) = int128_getlo(shft_res2);
+    }
+}
+
+VSSRANI(vssrani_b_h, 16, B, H)
+VSSRANI(vssrani_h_w, 32, H, W)
+VSSRANI(vssrani_w_d, 64, W, D)
+
+#define VSSRLNUI(NAME, BIT, E1, E2)                                         \
+void HELPER(NAME)(CPULoongArchState *env,                                   \
+                  uint32_t vd, uint32_t vj, uint32_t imm)                   \
+{                                                                           \
+    int i;                                                                  \
+    VReg temp;                                                              \
+    VReg *Vd = &(env->fpr[vd].vreg);                                        \
+    VReg *Vj = &(env->fpr[vj].vreg);                                        \
+                                                                            \
+    for (i = 0; i < LSX_LEN/BIT; i++) {                                     \
+        temp.E1(i) = do_ssrlnu_ ## E1(Vj->E2(i), imm, BIT/2);               \
+        temp.E1(i + LSX_LEN/BIT) = do_ssrlnu_ ## E1(Vd->E2(i), imm, BIT/2); \
+    }                                                                       \
+    Vd->D(0) = temp.D(0);                                                   \
+    Vd->D(1) = temp.D(1);                                                   \
+}
+
+void HELPER(vssrlni_du_q)(CPULoongArchState *env,
+                         uint32_t vd, uint32_t vj, uint32_t imm)
+{
+    Int128 shft_res1, shft_res2, mask;
+    VReg *Vd = &(env->fpr[vd].vreg);
+    VReg *Vj = &(env->fpr[vj].vreg);
+
+    if (imm == 0) {
+        shft_res1 = Vj->Q(0);
+        shft_res2 = Vd->Q(0);
+    } else {
+        shft_res1 = int128_urshift(Vj->Q(0), imm);
+        shft_res2 = int128_urshift(Vd->Q(0), imm);
+    }
+    mask = int128_sub(int128_lshift(int128_one(), 64), int128_one());
+
+    if (int128_ult(mask, shft_res1)) {
+        Vd->D(0) = int128_getlo(mask);
+    }else {
+        Vd->D(0) = int128_getlo(shft_res1);
+    }
+
+    if (int128_ult(mask, shft_res2)) {
+        Vd->D(1) = int128_getlo(mask);
+    }else {
+        Vd->D(1) = int128_getlo(shft_res2);
+    }
+}
+
+VSSRLNUI(vssrlni_bu_h, 16, B, H)
+VSSRLNUI(vssrlni_hu_w, 32, H, W)
+VSSRLNUI(vssrlni_wu_d, 64, W, D)
+
+#define VSSRANUI(NAME, BIT, E1, E2)                                         \
+void HELPER(NAME)(CPULoongArchState *env,                                   \
+                  uint32_t vd, uint32_t vj, uint32_t imm)                   \
+{                                                                           \
+    int i;                                                                  \
+    VReg temp;                                                              \
+    VReg *Vd = &(env->fpr[vd].vreg);                                        \
+    VReg *Vj = &(env->fpr[vj].vreg);                                        \
+                                                                            \
+    for (i = 0; i < LSX_LEN/BIT; i++) {                                     \
+        temp.E1(i) = do_ssranu_ ## E1(Vj->E2(i), imm, BIT/2);               \
+        temp.E1(i + LSX_LEN/BIT) = do_ssranu_ ## E1(Vd->E2(i), imm, BIT/2); \
+    }                                                                       \
+    Vd->D(0) = temp.D(0);                                                   \
+    Vd->D(1) = temp.D(1);                                                   \
+}
+
+void HELPER(vssrani_du_q)(CPULoongArchState *env,
+                         uint32_t vd, uint32_t vj, uint32_t imm)
+{
+    Int128 shft_res1, shft_res2, mask;
+    VReg *Vd = &(env->fpr[vd].vreg);
+    VReg *Vj = &(env->fpr[vj].vreg);
+
+    if (imm == 0) {
+        shft_res1 = Vj->Q(0);
+        shft_res2 = Vd->Q(0);
+    } else {
+        shft_res1 = int128_rshift(Vj->Q(0), imm);
+        shft_res2 = int128_rshift(Vd->Q(0), imm);
+    }
+
+    if (int128_lt(Vj->Q(0), int128_zero())) {
+        shft_res1 = int128_zero();
+    }
+
+    if (int128_lt(Vd->Q(0), int128_zero())) {
+        shft_res2 = int128_zero();
+    }
+
+    mask = int128_sub(int128_lshift(int128_one(), 64), int128_one());
+
+    if (int128_ult(mask, shft_res1)) {
+        Vd->D(0) = int128_getlo(mask);
+    }else {
+        Vd->D(0) = int128_getlo(shft_res1);
+    }
+
+    if (int128_ult(mask, shft_res2)) {
+        Vd->D(1) = int128_getlo(mask);
+    }else {
+        Vd->D(1) = int128_getlo(shft_res2);
+    }
+}
+
+VSSRANUI(vssrani_bu_h, 16, B, H)
+VSSRANUI(vssrani_hu_w, 32, H, W)
+VSSRANUI(vssrani_wu_d, 64, W, D)
-- 
2.31.1


