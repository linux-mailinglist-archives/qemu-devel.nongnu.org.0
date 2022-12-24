Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 548D365592E
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Dec 2022 09:21:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8zjz-0007I4-3h; Sat, 24 Dec 2022 03:18:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1p8zjP-0006lZ-Gr
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 03:18:15 -0500
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1p8zjK-0003Py-JX
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 03:18:11 -0500
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8Bx2+pvtaZjSEkIAA--.18619S3;
 Sat, 24 Dec 2022 16:16:47 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8CxPuRhtaZjuccKAA--.38440S30; 
 Sat, 24 Dec 2022 16:16:46 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org
Subject: [RFC PATCH 28/43] target/loongarch: Implement vssrln vssran
Date: Sat, 24 Dec 2022 16:16:18 +0800
Message-Id: <20221224081633.4185445-29-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20221224081633.4185445-1-gaosong@loongson.cn>
References: <20221224081633.4185445-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8CxPuRhtaZjuccKAA--.38440S30
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvAXoW3Cr1xAw47Gr47Jr1fJw1DZFb_yoW8WFyfAo
 WrJw15A3W8Grs2k39Fka4093Wkt3s2yw1DCFyDuw1DKFWvyF1Sv345K3s5Aa97tF4Yya47
 urWkJr4YyF1Yqrnrn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXasCq-sGcSsGvf
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
 target/loongarch/disas.c                    |  30 +++
 target/loongarch/helper.h                   |  30 +++
 target/loongarch/insn_trans/trans_lsx.c.inc |  30 +++
 target/loongarch/insns.decode               |  30 +++
 target/loongarch/lsx_helper.c               | 267 ++++++++++++++++++++
 5 files changed, 387 insertions(+)

diff --git a/target/loongarch/disas.c b/target/loongarch/disas.c
index 507f34feaa..1b9bd6bb86 100644
--- a/target/loongarch/disas.c
+++ b/target/loongarch/disas.c
@@ -1169,3 +1169,33 @@ INSN_LSX(vsrarni_b_h,      vv_i)
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
index bb868961d1..4585f0eb55 100644
--- a/target/loongarch/helper.h
+++ b/target/loongarch/helper.h
@@ -524,3 +524,33 @@ DEF_HELPER_4(vsrarni_b_h, void, env, i32, i32, i32)
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
index d3ab0a4a6a..39e0e53677 100644
--- a/target/loongarch/insn_trans/trans_lsx.c.inc
+++ b/target/loongarch/insn_trans/trans_lsx.c.inc
@@ -440,3 +440,33 @@ TRANS(vsrarni_b_h, gen_vv_i, gen_helper_vsrarni_b_h)
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
index 0b30175f6b..3e1b4084bb 100644
--- a/target/loongarch/insns.decode
+++ b/target/loongarch/insns.decode
@@ -898,3 +898,33 @@ vsrarni_b_h      0111 00110101 11000 1 .... ..... .....   @vv_ui4
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
index 8ccfa75fe3..6704eb4ea5 100644
--- a/target/loongarch/lsx_helper.c
+++ b/target/loongarch/lsx_helper.c
@@ -2624,3 +2624,270 @@ DO_HELPER_VV_I(vsrarni_b_h, 16, helper_vv_ni_c, do_vsrarni)
 DO_HELPER_VV_I(vsrarni_h_w, 32, helper_vv_ni_c, do_vsrarni)
 DO_HELPER_VV_I(vsrarni_w_d, 64, helper_vv_ni_c, do_vsrarni)
 DO_HELPER_VV_I(vsrarni_d_q, 128, helper_vv_ni_c, do_vsrarni)
+
+static int64_t vsra(int64_t s1, int64_t s2, int bit)
+{
+    return (s1 >> ((uint64_t)(s2) % bit));
+}
+
+static void do_vssrln(vec_t *Vd, vec_t *Vj, vec_t *Vk, int bit, int n)
+{
+    switch (bit) {
+    case 16:
+        Vd->B[n] = sat_s(vsrl((uint16_t)Vj->H[n], Vk->H[n], bit), bit/2 - 1);
+        break;
+    case 32:
+        Vd->H[n] = sat_s(vsrl((uint32_t)Vj->W[n], Vk->W[n], bit), bit/2 - 1);
+        break;
+    case 64:
+        Vd->W[n] = sat_s(vsrl((uint64_t)Vj->D[n], Vk->D[n], bit), bit/2 - 1);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static void do_vssran(vec_t *Vd, vec_t *Vj, vec_t *Vk, int bit, int n)
+{
+    switch (bit) {
+    case 16:
+        Vd->B[n] = sat_s(vsra(Vj->H[n], Vk->H[n], bit), bit/2 - 1);
+        break;
+    case 32:
+        Vd->H[n] = sat_s(vsra(Vj->W[n], Vk->W[n], bit), bit/2 - 1);
+        break;
+    case 64:
+        Vd->W[n] = sat_s(vsra(Vj->D[n], Vk->D[n], bit), bit/2 - 1);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+DO_HELPER_VVV(vssrln_b_h, 16, helper_vvv_hz, do_vssrln)
+DO_HELPER_VVV(vssrln_h_w, 32, helper_vvv_hz, do_vssrln)
+DO_HELPER_VVV(vssrln_w_d, 64, helper_vvv_hz, do_vssrln)
+DO_HELPER_VVV(vssran_b_h, 16, helper_vvv_hz, do_vssran)
+DO_HELPER_VVV(vssran_h_w, 32, helper_vvv_hz, do_vssran)
+DO_HELPER_VVV(vssran_w_d, 64, helper_vvv_hz, do_vssran)
+
+static void do_vssrln_u(vec_t *Vd, vec_t *Vj, vec_t *Vk, int bit, int n)
+{
+    switch (bit) {
+    case 16:
+        Vd->B[n] = sat_u(vsrl((uint16_t)Vj->H[n], Vk->H[n], bit), bit/2 - 1);
+        break;
+    case 32:
+        Vd->H[n] = sat_u(vsrl((uint32_t)Vj->W[n], Vk->W[n], bit), bit/2 - 1);
+        break;
+    case 64:
+        Vd->W[n] = sat_u(vsrl((uint64_t)Vj->D[n], Vk->D[n], bit), bit/2 - 1);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static void do_vssran_u(vec_t *Vd, vec_t *Vj, vec_t *Vk, int bit, int n)
+{
+    switch (bit) {
+    case 16:
+        Vd->B[n] = sat_u(vsra(Vj->H[n], Vk->H[n], bit), bit/2 - 1);
+        if (Vd->B[n] < 0) {
+            Vd->B[n] = 0;
+        }
+        break;
+    case 32:
+        Vd->H[n] = sat_u(vsra(Vj->W[n], Vk->W[n], bit), bit/2 - 1);
+        if (Vd->H[n] < 0) {
+            Vd->H[n] = 0;
+        }
+        break;
+    case 64:
+        Vd->W[n] = sat_u(vsra(Vj->D[n], Vk->D[n], bit), bit/2 - 1);
+        if (Vd->W[n] < 0) {
+            Vd->W[n] = 0;
+        }
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+DO_HELPER_VVV(vssrln_bu_h, 16, helper_vvv_hz, do_vssrln_u)
+DO_HELPER_VVV(vssrln_hu_w, 32, helper_vvv_hz, do_vssrln_u)
+DO_HELPER_VVV(vssrln_wu_d, 64, helper_vvv_hz, do_vssrln_u)
+DO_HELPER_VVV(vssran_bu_h, 16, helper_vvv_hz, do_vssran_u)
+DO_HELPER_VVV(vssran_hu_w, 32, helper_vvv_hz, do_vssran_u)
+DO_HELPER_VVV(vssran_wu_d, 64, helper_vvv_hz, do_vssran_u)
+
+static int64_t sat_s_128u(__uint128_t u1, uint32_t imm)
+{
+    uint64_t max = MAKE_64BIT_MASK(0, imm);
+    return u1 < max ? u1: max;
+}
+
+static void do_vssrlni(vec_t *dest, vec_t *Vd, vec_t *Vj,
+                       uint32_t imm, int bit, int n)
+{
+    switch (bit) {
+    case 16:
+        dest->B[n] = sat_s((((uint16_t)Vj->H[n]) >> imm), bit/2 - 1);
+        dest->B[n + 128/bit] = sat_s((((uint16_t)Vd->H[n]) >> imm), bit/2 -1);
+        break;
+    case 32:
+        dest->H[n] = sat_s((((uint32_t)Vj->W[n]) >> imm), bit/2 - 1);
+        dest->H[n + 128/bit] = sat_s((((uint32_t)Vd->W[n]) >> imm), bit/2 - 1);
+        break;
+    case 64:
+        dest->W[n] = sat_s((((uint64_t)Vj->D[n]) >> imm), bit/2 - 1);
+        dest->W[n + 128/bit] = sat_s((((uint64_t)Vd->D[n]) >> imm), bit/2 - 1);
+        break;
+    case 128:
+        dest->D[n] = sat_s_128u((((__uint128_t)Vj->Q[n]) >> imm), bit/2 - 1);
+        dest->D[n + 128/bit] = sat_s_128u((((__uint128_t)Vd->Q[n]) >> imm),
+                                          bit/2 - 1);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static int64_t sat_s_128(__int128_t s1, uint32_t imm)
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
+static void do_vssrani(vec_t *dest, vec_t *Vd, vec_t *Vj,
+                       uint32_t imm, int bit, int n)
+{
+    switch (bit) {
+    case 16:
+        dest->B[n] = sat_s((Vj->H[n] >> imm), bit/2 - 1);
+        dest->B[n + 128/bit] = sat_s((Vd->H[n] >> imm), bit/2 - 1);
+        break;
+    case 32:
+        dest->H[n] = sat_s((Vj->W[n] >> imm), bit/2 - 1);
+        dest->H[n + 128/bit] = sat_s((Vd->W[n] >> imm), bit/2 - 1);
+        break;
+    case 64:
+        dest->W[n] = sat_s((Vj->D[n] >> imm), bit/2 - 1);
+        dest->W[n + 128/bit] = sat_s((Vd->D[n] >> imm), bit/2 - 1);
+        break;
+    case 128:
+        dest->D[n] = sat_s_128(((__int128_t)Vj->Q[n] >> imm), bit/2 - 1);
+        dest->D[n + 128/bit] = sat_s_128(((__int128_t)Vd->Q[n] >> imm),
+                                         bit/2 - 1);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+DO_HELPER_VV_I(vssrlni_b_h, 16, helper_vv_ni_c, do_vssrlni)
+DO_HELPER_VV_I(vssrlni_h_w, 32, helper_vv_ni_c, do_vssrlni)
+DO_HELPER_VV_I(vssrlni_w_d, 64, helper_vv_ni_c, do_vssrlni)
+DO_HELPER_VV_I(vssrlni_d_q, 128, helper_vv_ni_c, do_vssrlni)
+DO_HELPER_VV_I(vssrani_b_h, 16, helper_vv_ni_c, do_vssrani)
+DO_HELPER_VV_I(vssrani_h_w, 32, helper_vv_ni_c, do_vssrani)
+DO_HELPER_VV_I(vssrani_w_d, 64, helper_vv_ni_c, do_vssrani)
+DO_HELPER_VV_I(vssrani_d_q, 128, helper_vv_ni_c, do_vssrani)
+
+static int64_t sat_u_128(__uint128_t u1, uint32_t imm)
+{
+    uint64_t max = MAKE_64BIT_MASK(0, imm + 1);
+    return u1 < max ? u1 : max;
+}
+
+static void do_vssrlni_u(vec_t *dest, vec_t *Vd, vec_t *Vj,
+                         uint32_t imm, int bit, int n)
+{
+    switch (bit) {
+    case 16:
+        dest->B[n] = sat_u((((uint16_t)Vj->H[n]) >> imm),  bit/2 -1);
+        dest->B[n + 128/bit] = sat_u((((uint16_t)Vd->H[n]) >> imm), bit/2 -1);
+        break;
+    case 32:
+        dest->H[n] = sat_u((((uint32_t)Vj->W[n]) >> imm), imm);
+        dest->H[n + 128/bit] = sat_u((((uint32_t)Vd->W[n]) >> imm), bit/2 -1);
+        break;
+    case 64:
+        dest->W[n] = sat_u((((uint64_t)Vj->D[n]) >> imm), bit/2 - 1);
+        dest->W[n + 128/bit] = sat_u((((uint64_t)Vd->D[n]) >> imm), bit/2 -1);
+        break;
+    case 128:
+        dest->D[n] = sat_u_128((((__uint128_t)Vj->Q[n]) >> imm), bit/2 - 1);
+        dest->D[n + 128/bit] = sat_u_128((((__uint128_t)Vd->Q[n]) >> imm),
+                                         bit/2 -1);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static void  do_vssrani_u(vec_t *dest, vec_t *Vd, vec_t *Vj,
+                          uint32_t imm, int bit, int n)
+{
+    switch (bit) {
+    case 16:
+        dest->B[n] = sat_u((Vj->H[n] >> imm), bit/2 - 1);
+        if (dest->B[n] < 0) {
+            dest->B[n] = 0;
+        }
+        dest->B[n + 128/bit] = sat_u((Vd->H[n] >> imm), bit/2 - 1);
+        if (dest->B[n + 128/bit] < 0) {
+            dest->B[n + 128/bit] = 0;
+        }
+        break;
+    case 32:
+        dest->H[n] = sat_u((Vj->W[n] >> imm), bit/2 - 1);
+        if (dest->H[n] < 0) {
+            dest->H[n] = 0;
+        }
+        dest->H[n + 128/bit] = sat_u((Vd->W[n] >> imm), bit/2 - 1);
+        if (dest->H[n + 128/bit] < 0) {
+            dest->H[n + 128/bit] = 0;
+        }
+        break;
+    case 64:
+        dest->W[n] = sat_u((Vj->D[n] >> imm), bit/2 - 1);
+        if (dest->W[n] < 0) {
+            dest->W[n] = 0;
+        }
+        dest->W[n + 128/bit] = sat_u((Vd->D[n] >> imm), bit/2 - 1);
+        if (dest->W[n + 128/bit] < 0) {
+            dest->W[n + 128/bit] = 0;
+        }
+        break;
+    case 128:
+        dest->D[n] = sat_u_128((Vj->Q[n] >> imm), bit/2 - 1);
+        if (dest->D[n] < 0) {
+            dest->D[n] = 0;
+        }
+        dest->D[n + 128/bit] = sat_u_128((Vd->Q[n] >> imm), bit/2 - 1);
+        if (dest->D[n + 128/bit] < 0) {
+            dest->D[n + 128/bit] = 0;
+        }
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+DO_HELPER_VV_I(vssrlni_bu_h, 16, helper_vv_ni_c, do_vssrlni_u)
+DO_HELPER_VV_I(vssrlni_hu_w, 32, helper_vv_ni_c, do_vssrlni_u)
+DO_HELPER_VV_I(vssrlni_wu_d, 64, helper_vv_ni_c, do_vssrlni_u)
+DO_HELPER_VV_I(vssrlni_du_q, 128, helper_vv_ni_c, do_vssrlni_u)
+DO_HELPER_VV_I(vssrani_bu_h, 16, helper_vv_ni_c, do_vssrani_u)
+DO_HELPER_VV_I(vssrani_hu_w, 32, helper_vv_ni_c, do_vssrani_u)
+DO_HELPER_VV_I(vssrani_wu_d, 64, helper_vv_ni_c, do_vssrani_u)
+DO_HELPER_VV_I(vssrani_du_q, 128, helper_vv_ni_c, do_vssrani_u)
-- 
2.31.1


