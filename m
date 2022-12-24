Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A64C9655925
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Dec 2022 09:19:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8zj9-0006Sj-IM; Sat, 24 Dec 2022 03:17:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1p8ziM-00068v-VC
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 03:17:08 -0500
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1p8ziH-0001IG-GG
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 03:17:05 -0500
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8Bx1vBwtaZjSkkIAA--.18345S3;
 Sat, 24 Dec 2022 16:16:48 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8CxPuRhtaZjuccKAA--.38440S31; 
 Sat, 24 Dec 2022 16:16:47 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org
Subject: [RFC PATCH 29/43] target/loongarch: Implement vssrlrn vssrarn
Date: Sat, 24 Dec 2022 16:16:19 +0800
Message-Id: <20221224081633.4185445-30-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20221224081633.4185445-1-gaosong@loongson.cn>
References: <20221224081633.4185445-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8CxPuRhtaZjuccKAA--.38440S31
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvAXoW3CFW5CryDCw47ZrWDJF43KFg_yoW8Ww17Jo
 W3Xw15Ja18KF4xK39Fya95ua4vy342yw1DuFyDua1DtFW8AF1a9345Kwn5A39aqFsIyr17
 CrWkAr4Yy3WYqr1kn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXasCq-sGcSsGvf
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
- VSSRLRN.{B.H/H.W/W.D};
- VSSRARN.{B.H/H.W/W.D};
- VSSRLRN.{BU.H/HU.W/WU.D};
- VSSRARN.{BU.H/HU.W/WU.D};
- VSSRLRNI.{B.H/H.W/W.D/D.Q};
- VSSRARNI.{B.H/H.W/W.D/D.Q};
- VSSRLRNI.{BU.H/HU.W/WU.D/DU.Q};
- VSSRARNI.{BU.H/HU.W/WU.D/DU.Q}.

Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 target/loongarch/disas.c                    |  30 +++
 target/loongarch/helper.h                   |  30 +++
 target/loongarch/insn_trans/trans_lsx.c.inc |  30 +++
 target/loongarch/insns.decode               |  30 +++
 target/loongarch/lsx_helper.c               | 257 ++++++++++++++++++++
 5 files changed, 377 insertions(+)

diff --git a/target/loongarch/disas.c b/target/loongarch/disas.c
index 1b9bd6bb86..c1d256d8b4 100644
--- a/target/loongarch/disas.c
+++ b/target/loongarch/disas.c
@@ -1199,3 +1199,33 @@ INSN_LSX(vssrani_bu_h,     vv_i)
 INSN_LSX(vssrani_hu_w,     vv_i)
 INSN_LSX(vssrani_wu_d,     vv_i)
 INSN_LSX(vssrani_du_q,     vv_i)
+
+INSN_LSX(vssrlrn_b_h,      vvv)
+INSN_LSX(vssrlrn_h_w,      vvv)
+INSN_LSX(vssrlrn_w_d,      vvv)
+INSN_LSX(vssrarn_b_h,      vvv)
+INSN_LSX(vssrarn_h_w,      vvv)
+INSN_LSX(vssrarn_w_d,      vvv)
+INSN_LSX(vssrlrn_bu_h,     vvv)
+INSN_LSX(vssrlrn_hu_w,     vvv)
+INSN_LSX(vssrlrn_wu_d,     vvv)
+INSN_LSX(vssrarn_bu_h,     vvv)
+INSN_LSX(vssrarn_hu_w,     vvv)
+INSN_LSX(vssrarn_wu_d,     vvv)
+
+INSN_LSX(vssrlrni_b_h,     vv_i)
+INSN_LSX(vssrlrni_h_w,     vv_i)
+INSN_LSX(vssrlrni_w_d,     vv_i)
+INSN_LSX(vssrlrni_d_q,     vv_i)
+INSN_LSX(vssrlrni_bu_h,    vv_i)
+INSN_LSX(vssrlrni_hu_w,    vv_i)
+INSN_LSX(vssrlrni_wu_d,    vv_i)
+INSN_LSX(vssrlrni_du_q,    vv_i)
+INSN_LSX(vssrarni_b_h,     vv_i)
+INSN_LSX(vssrarni_h_w,     vv_i)
+INSN_LSX(vssrarni_w_d,     vv_i)
+INSN_LSX(vssrarni_d_q,     vv_i)
+INSN_LSX(vssrarni_bu_h,    vv_i)
+INSN_LSX(vssrarni_hu_w,    vv_i)
+INSN_LSX(vssrarni_wu_d,    vv_i)
+INSN_LSX(vssrarni_du_q,    vv_i)
diff --git a/target/loongarch/helper.h b/target/loongarch/helper.h
index 4585f0eb55..e45eb211a6 100644
--- a/target/loongarch/helper.h
+++ b/target/loongarch/helper.h
@@ -554,3 +554,33 @@ DEF_HELPER_4(vssrani_bu_h, void, env, i32, i32, i32)
 DEF_HELPER_4(vssrani_hu_w, void, env, i32, i32, i32)
 DEF_HELPER_4(vssrani_wu_d, void, env, i32, i32, i32)
 DEF_HELPER_4(vssrani_du_q, void, env, i32, i32, i32)
+
+DEF_HELPER_4(vssrlrn_b_h, void, env, i32, i32, i32)
+DEF_HELPER_4(vssrlrn_h_w, void, env, i32, i32, i32)
+DEF_HELPER_4(vssrlrn_w_d, void, env, i32, i32, i32)
+DEF_HELPER_4(vssrarn_b_h, void, env, i32, i32, i32)
+DEF_HELPER_4(vssrarn_h_w, void, env, i32, i32, i32)
+DEF_HELPER_4(vssrarn_w_d, void, env, i32, i32, i32)
+DEF_HELPER_4(vssrlrn_bu_h, void, env, i32, i32, i32)
+DEF_HELPER_4(vssrlrn_hu_w, void, env, i32, i32, i32)
+DEF_HELPER_4(vssrlrn_wu_d, void, env, i32, i32, i32)
+DEF_HELPER_4(vssrarn_bu_h, void, env, i32, i32, i32)
+DEF_HELPER_4(vssrarn_hu_w, void, env, i32, i32, i32)
+DEF_HELPER_4(vssrarn_wu_d, void, env, i32, i32, i32)
+
+DEF_HELPER_4(vssrlrni_b_h, void, env, i32, i32, i32)
+DEF_HELPER_4(vssrlrni_h_w, void, env, i32, i32, i32)
+DEF_HELPER_4(vssrlrni_w_d, void, env, i32, i32, i32)
+DEF_HELPER_4(vssrlrni_d_q, void, env, i32, i32, i32)
+DEF_HELPER_4(vssrarni_b_h, void, env, i32, i32, i32)
+DEF_HELPER_4(vssrarni_h_w, void, env, i32, i32, i32)
+DEF_HELPER_4(vssrarni_w_d, void, env, i32, i32, i32)
+DEF_HELPER_4(vssrarni_d_q, void, env, i32, i32, i32)
+DEF_HELPER_4(vssrlrni_bu_h, void, env, i32, i32, i32)
+DEF_HELPER_4(vssrlrni_hu_w, void, env, i32, i32, i32)
+DEF_HELPER_4(vssrlrni_wu_d, void, env, i32, i32, i32)
+DEF_HELPER_4(vssrlrni_du_q, void, env, i32, i32, i32)
+DEF_HELPER_4(vssrarni_bu_h, void, env, i32, i32, i32)
+DEF_HELPER_4(vssrarni_hu_w, void, env, i32, i32, i32)
+DEF_HELPER_4(vssrarni_wu_d, void, env, i32, i32, i32)
+DEF_HELPER_4(vssrarni_du_q, void, env, i32, i32, i32)
diff --git a/target/loongarch/insn_trans/trans_lsx.c.inc b/target/loongarch/insn_trans/trans_lsx.c.inc
index 39e0e53677..5473adc163 100644
--- a/target/loongarch/insn_trans/trans_lsx.c.inc
+++ b/target/loongarch/insn_trans/trans_lsx.c.inc
@@ -470,3 +470,33 @@ TRANS(vssrani_bu_h, gen_vv_i, gen_helper_vssrani_bu_h)
 TRANS(vssrani_hu_w, gen_vv_i, gen_helper_vssrani_hu_w)
 TRANS(vssrani_wu_d, gen_vv_i, gen_helper_vssrani_wu_d)
 TRANS(vssrani_du_q, gen_vv_i, gen_helper_vssrani_du_q)
+
+TRANS(vssrlrn_b_h, gen_vvv, gen_helper_vssrlrn_b_h)
+TRANS(vssrlrn_h_w, gen_vvv, gen_helper_vssrlrn_h_w)
+TRANS(vssrlrn_w_d, gen_vvv, gen_helper_vssrlrn_w_d)
+TRANS(vssrarn_b_h, gen_vvv, gen_helper_vssrarn_b_h)
+TRANS(vssrarn_h_w, gen_vvv, gen_helper_vssrarn_h_w)
+TRANS(vssrarn_w_d, gen_vvv, gen_helper_vssrarn_w_d)
+TRANS(vssrlrn_bu_h, gen_vvv, gen_helper_vssrlrn_bu_h)
+TRANS(vssrlrn_hu_w, gen_vvv, gen_helper_vssrlrn_hu_w)
+TRANS(vssrlrn_wu_d, gen_vvv, gen_helper_vssrlrn_wu_d)
+TRANS(vssrarn_bu_h, gen_vvv, gen_helper_vssrarn_bu_h)
+TRANS(vssrarn_hu_w, gen_vvv, gen_helper_vssrarn_hu_w)
+TRANS(vssrarn_wu_d, gen_vvv, gen_helper_vssrarn_wu_d)
+
+TRANS(vssrlrni_b_h, gen_vv_i, gen_helper_vssrlrni_b_h)
+TRANS(vssrlrni_h_w, gen_vv_i, gen_helper_vssrlrni_h_w)
+TRANS(vssrlrni_w_d, gen_vv_i, gen_helper_vssrlrni_w_d)
+TRANS(vssrlrni_d_q, gen_vv_i, gen_helper_vssrlrni_d_q)
+TRANS(vssrarni_b_h, gen_vv_i, gen_helper_vssrarni_b_h)
+TRANS(vssrarni_h_w, gen_vv_i, gen_helper_vssrarni_h_w)
+TRANS(vssrarni_w_d, gen_vv_i, gen_helper_vssrarni_w_d)
+TRANS(vssrarni_d_q, gen_vv_i, gen_helper_vssrarni_d_q)
+TRANS(vssrlrni_bu_h, gen_vv_i, gen_helper_vssrlrni_bu_h)
+TRANS(vssrlrni_hu_w, gen_vv_i, gen_helper_vssrlrni_hu_w)
+TRANS(vssrlrni_wu_d, gen_vv_i, gen_helper_vssrlrni_wu_d)
+TRANS(vssrlrni_du_q, gen_vv_i, gen_helper_vssrlrni_du_q)
+TRANS(vssrarni_bu_h, gen_vv_i, gen_helper_vssrarni_bu_h)
+TRANS(vssrarni_hu_w, gen_vv_i, gen_helper_vssrarni_hu_w)
+TRANS(vssrarni_wu_d, gen_vv_i, gen_helper_vssrarni_wu_d)
+TRANS(vssrarni_du_q, gen_vv_i, gen_helper_vssrarni_du_q)
diff --git a/target/loongarch/insns.decode b/target/loongarch/insns.decode
index 3e1b4084bb..3b3c2520c3 100644
--- a/target/loongarch/insns.decode
+++ b/target/loongarch/insns.decode
@@ -928,3 +928,33 @@ vssrani_bu_h     0111 00110110 01000 1 .... ..... .....   @vv_ui4
 vssrani_hu_w     0111 00110110 01001 ..... ..... .....    @vv_ui5
 vssrani_wu_d     0111 00110110 0101 ...... ..... .....    @vv_ui6
 vssrani_du_q     0111 00110110 011 ....... ..... .....    @vv_ui7
+
+vssrlrn_b_h      0111 00010000 00001 ..... ..... .....    @vvv
+vssrlrn_h_w      0111 00010000 00010 ..... ..... .....    @vvv
+vssrlrn_w_d      0111 00010000 00011 ..... ..... .....    @vvv
+vssrarn_b_h      0111 00010000 00101 ..... ..... .....    @vvv
+vssrarn_h_w      0111 00010000 00110 ..... ..... .....    @vvv
+vssrarn_w_d      0111 00010000 00111 ..... ..... .....    @vvv
+vssrlrn_bu_h     0111 00010000 10001 ..... ..... .....    @vvv
+vssrlrn_hu_w     0111 00010000 10010 ..... ..... .....    @vvv
+vssrlrn_wu_d     0111 00010000 10011 ..... ..... .....    @vvv
+vssrarn_bu_h     0111 00010000 10101 ..... ..... .....    @vvv
+vssrarn_hu_w     0111 00010000 10110 ..... ..... .....    @vvv
+vssrarn_wu_d     0111 00010000 10111 ..... ..... .....    @vvv
+
+vssrlrni_b_h     0111 00110101 00000 1 .... ..... .....   @vv_ui4
+vssrlrni_h_w     0111 00110101 00001 ..... ..... .....    @vv_ui5
+vssrlrni_w_d     0111 00110101 0001 ...... ..... .....    @vv_ui6
+vssrlrni_d_q     0111 00110101 001 ....... ..... .....    @vv_ui7
+vssrarni_b_h     0111 00110110 10000 1 .... ..... .....   @vv_ui4
+vssrarni_h_w     0111 00110110 10001 ..... ..... .....    @vv_ui5
+vssrarni_w_d     0111 00110110 1001 ...... ..... .....    @vv_ui6
+vssrarni_d_q     0111 00110110 101 ....... ..... .....    @vv_ui7
+vssrlrni_bu_h    0111 00110101 01000 1 .... ..... .....   @vv_ui4
+vssrlrni_hu_w    0111 00110101 01001 ..... ..... .....    @vv_ui5
+vssrlrni_wu_d    0111 00110101 0101 ...... ..... .....    @vv_ui6
+vssrlrni_du_q    0111 00110101 011 ....... ..... .....    @vv_ui7
+vssrarni_bu_h    0111 00110110 11000 1 .... ..... .....   @vv_ui4
+vssrarni_hu_w    0111 00110110 11001 ..... ..... .....    @vv_ui5
+vssrarni_wu_d    0111 00110110 1101 ...... ..... .....    @vv_ui6
+vssrarni_du_q    0111 00110110 111 ....... ..... .....    @vv_ui7
diff --git a/target/loongarch/lsx_helper.c b/target/loongarch/lsx_helper.c
index 6704eb4ea5..d771ff953c 100644
--- a/target/loongarch/lsx_helper.c
+++ b/target/loongarch/lsx_helper.c
@@ -2891,3 +2891,260 @@ DO_HELPER_VV_I(vssrani_bu_h, 16, helper_vv_ni_c, do_vssrani_u)
 DO_HELPER_VV_I(vssrani_hu_w, 32, helper_vv_ni_c, do_vssrani_u)
 DO_HELPER_VV_I(vssrani_wu_d, 64, helper_vv_ni_c, do_vssrani_u)
 DO_HELPER_VV_I(vssrani_du_q, 128, helper_vv_ni_c, do_vssrani_u)
+
+static void do_vssrlrn(vec_t *Vd, vec_t *Vj, vec_t *Vk, int bit, int n)
+{
+    switch (bit) {
+    case 16:
+        Vd->B[n] = sat_s(vsrlr((uint16_t)Vj->H[n], Vk->H[n], bit), bit/2 - 1);
+        break;
+    case 32:
+        Vd->H[n] = sat_s(vsrlr((uint32_t)Vj->W[n], Vk->W[n], bit), bit/2 - 1);
+        break;
+    case 64:
+        Vd->W[n] = sat_s(vsrlr((uint64_t)Vj->D[n], Vk->D[n], bit), bit/2 - 1);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static void do_vssrarn(vec_t *Vd, vec_t *Vj, vec_t *Vk, int bit, int n)
+{
+    switch (bit) {
+    case 16:
+        Vd->B[n] = sat_s(vsrar(Vj->H[n], Vk->H[n], bit), bit/2 - 1);
+        break;
+    case 32:
+        Vd->H[n] = sat_s(vsrar(Vj->W[n], Vk->W[n], bit), bit/2 - 1);
+        break;
+    case 64:
+        Vd->W[n] = sat_s(vsrar(Vj->D[n], Vk->D[n], bit), bit/2 - 1);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+DO_HELPER_VVV(vssrlrn_b_h, 16, helper_vvv_hz, do_vssrlrn)
+DO_HELPER_VVV(vssrlrn_h_w, 32, helper_vvv_hz, do_vssrlrn)
+DO_HELPER_VVV(vssrlrn_w_d, 64, helper_vvv_hz, do_vssrlrn)
+DO_HELPER_VVV(vssrarn_b_h, 16, helper_vvv_hz, do_vssrarn)
+DO_HELPER_VVV(vssrarn_h_w, 32, helper_vvv_hz, do_vssrarn)
+DO_HELPER_VVV(vssrarn_w_d, 64, helper_vvv_hz, do_vssrarn)
+
+static void do_vssrlrn_u(vec_t *Vd, vec_t *Vj, vec_t *Vk, int bit, int n)
+{
+    switch (bit) {
+    case 16:
+        Vd->B[n] = sat_u(vsrlr((uint16_t)Vj->H[n], Vk->H[n], bit), bit/2 - 1);
+        break;
+    case 32:
+        Vd->H[n] = sat_u(vsrlr((uint32_t)Vj->W[n], Vk->W[n], bit), bit/2 - 1);
+        break;
+    case 64:
+        Vd->W[n] = sat_u(vsrlr((uint64_t)Vj->D[n], Vk->D[n], bit), bit/2 - 1);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static void do_vssrarn_u(vec_t *Vd, vec_t *Vj, vec_t *Vk, int bit, int n)
+{
+    switch (bit) {
+    case 16:
+        Vd->B[n] = sat_u(vsrar(Vj->H[n], Vk->H[n], bit), bit/2 - 1);
+        if (Vd->B[n] < 0) {
+            Vd->B[n] = 0;
+        }
+        break;
+    case 32:
+        Vd->H[n] = sat_u(vsrar(Vj->W[n], Vk->W[n], bit), bit/2 - 1);
+        if (Vd->H[n] < 0) {
+            Vd->H[n] = 0;
+        }
+        break;
+    case 64:
+        Vd->W[n] = sat_u(vsrar(Vj->D[n], Vk->W[n], bit), bit/2 - 1);
+        if (Vd->W[n] < 0) {
+            Vd->W[n] = 0;
+        }
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+DO_HELPER_VVV(vssrlrn_bu_h, 16, helper_vvv_hz, do_vssrlrn_u)
+DO_HELPER_VVV(vssrlrn_hu_w, 32, helper_vvv_hz, do_vssrlrn_u)
+DO_HELPER_VVV(vssrlrn_wu_d, 64, helper_vvv_hz, do_vssrlrn_u)
+DO_HELPER_VVV(vssrarn_bu_h, 16, helper_vvv_hz, do_vssrarn_u)
+DO_HELPER_VVV(vssrarn_hu_w, 32, helper_vvv_hz, do_vssrarn_u)
+DO_HELPER_VVV(vssrarn_wu_d, 64, helper_vvv_hz, do_vssrarn_u)
+
+static __int128_t vsrarn(__int128_t s1, int64_t s2, int bit)
+{
+    int32_t n = (uint64_t)(s2 % bit);
+
+    if (n == 0) {
+        return s1;
+    } else {
+        uint64_t r_bit = (s1 >> (n  - 1)) & 1;
+        return (s1 >> n) + r_bit;
+    }
+}
+
+static void do_vssrlrni(vec_t *dest, vec_t *Vd, vec_t *Vj,
+                        uint32_t imm, int bit, int n)
+{
+    switch (bit) {
+    case 16:
+        dest->B[n] = sat_s(vsrlr((uint16_t)Vj->H[n], imm, bit), bit/2 - 1);
+        dest->B[n + 128/bit] = sat_s(vsrlr((uint16_t)Vd->H[n], imm, bit),
+	                             bit/2 -1);
+        break;
+    case 32:
+        dest->H[n] = sat_s(vsrlr((uint32_t)Vj->W[n], imm, bit), bit/2 - 1);
+        dest->H[n + 128/bit] = sat_s(vsrlr((uint32_t)Vd->W[n], imm, bit),
+                                     bit/2 - 1);
+        break;
+    case 64:
+        dest->W[n] = sat_s(vsrlr((uint64_t)Vj->D[n], imm, bit), bit/2 - 1);
+        dest->W[n + 128/bit] = sat_s(vsrlr((uint64_t)Vd->D[n], imm, bit),
+                                     bit/2 - 1);
+        break;
+    case 128:
+        dest->D[n] = sat_s_128u(vsrlrn((__uint128_t)Vj->Q[n], imm), bit/2 - 1);
+        dest->D[n + 128/bit] = sat_s_128u(vsrlrn((__uint128_t)Vd->Q[n], imm),
+                                          bit/2 - 1);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static void do_vssrarni(vec_t *dest, vec_t *Vd, vec_t *Vj,
+                        uint32_t imm, int bit, int n)
+{
+    switch (bit) {
+    case 16:
+        dest->B[n] = sat_s(vsrar(Vj->H[n], imm, bit), bit/2 - 1);
+        dest->B[n + 128/bit] = sat_s(vsrar(Vd->H[n], imm, bit), bit/2 - 1);
+        break;
+    case 32:
+        dest->H[n] = sat_s(vsrar(Vj->W[n], imm, bit), bit/2 - 1);
+        dest->H[n + 128/bit] = sat_s(vsrar(Vd->W[n], imm, bit), bit/2 - 1);
+        break;
+    case 64:
+        dest->W[n] = sat_s(vsrar(Vj->D[n], imm, bit), bit/2 - 1);
+        dest->W[n + 128/bit] = sat_s(vsrar(Vd->D[n], imm, bit), bit/2 - 1);
+        break;
+    case 128:
+        dest->D[n] = sat_s_128(vsrarn((__int128_t)Vj->Q[n], imm, bit),
+                               bit/2 - 1);
+        dest->D[n + 128/bit] = sat_s_128(vsrarn((__int128_t)Vd->Q[n], imm, bit),
+                                         bit/2 - 1);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+DO_HELPER_VV_I(vssrlrni_b_h, 16, helper_vv_ni_c, do_vssrlrni)
+DO_HELPER_VV_I(vssrlrni_h_w, 32, helper_vv_ni_c, do_vssrlrni)
+DO_HELPER_VV_I(vssrlrni_w_d, 64, helper_vv_ni_c, do_vssrlrni)
+DO_HELPER_VV_I(vssrlrni_d_q, 128, helper_vv_ni_c, do_vssrlrni)
+DO_HELPER_VV_I(vssrarni_b_h, 16, helper_vv_ni_c, do_vssrarni)
+DO_HELPER_VV_I(vssrarni_h_w, 32, helper_vv_ni_c, do_vssrarni)
+DO_HELPER_VV_I(vssrarni_w_d, 64, helper_vv_ni_c, do_vssrarni)
+DO_HELPER_VV_I(vssrarni_d_q, 128, helper_vv_ni_c, do_vssrarni)
+
+static void do_vssrlrni_u(vec_t *dest, vec_t *Vd, vec_t *Vj,
+                          uint32_t imm, int bit, int n)
+{
+    switch (bit) {
+    case 16:
+        dest->B[n] = sat_u(vsrlr((uint16_t)Vj->H[n], imm, bit), bit/2 - 1);
+        dest->B[n + 128/bit] = sat_u(vsrlr((uint16_t)Vd->H[n], imm, bit),
+                                     bit/2 - 1);
+        break;
+    case 32:
+        dest->H[n] = sat_u(vsrlr((uint32_t)Vj->W[n], imm, bit), bit/2 - 1);
+        dest->H[n + 128/bit] = sat_u(vsrlr((uint32_t)Vd->W[n], imm, bit),
+                                     bit/2 - 1);
+        break;
+    case 64:
+        dest->W[n] = sat_u(vsrlr((uint64_t)Vj->D[n], imm, bit), bit/2 - 1);
+        dest->W[n + 128/bit] = sat_u(vsrlr((uint64_t)Vd->D[n], imm, bit),
+                                     bit/2 - 1);
+        break;
+    case 128:
+        dest->D[n] = sat_u_128(vsrlrn((__uint128_t)Vj->Q[n], imm), bit/2 - 1);
+        dest->D[n + 128/bit] = sat_u_128(vsrlrn((__uint128_t)Vd->Q[n], imm),
+                                         bit/2 - 1);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static void do_vssrarni_u(vec_t *dest, vec_t *Vd, vec_t *Vj,
+                          uint32_t imm, int bit, int n)
+{
+    switch (bit) {
+    case 16:
+        dest->B[n] = sat_u(vsrar(Vj->H[n], imm, bit), bit/2 - 1);
+        if (dest->B[n] < 0) {
+            dest->B[n] = 0;
+        }
+        dest->B[n + 128/bit] = sat_u(vsrar(Vd->H[n], imm, bit), bit/2 - 1);
+        if (dest->B[n + 128/bit] < 0) {
+            dest->B[n + 128/bit] = 0;
+        }
+        break;
+    case 32:
+        dest->H[n] = sat_u(vsrar(Vj->W[n],imm, bit), bit/2 - 1);
+        if (dest->H[n] < 0) {
+            dest->H[n] = 0;
+        }
+        dest->H[n + 128/bit] = sat_u(vsrar(Vd->W[n], imm, bit), bit/2 - 1);
+        if (dest->H[n + 128/bit] < 0) {
+            dest->H[n + 128/bit] = 0;
+        }
+        break;
+    case 64:
+        dest->W[n] = sat_u(vsrar(Vj->D[n], imm, bit), bit/2 - 1);
+        if (dest->W[n] < 0) {
+            dest->W[n] = 0;
+        }
+        dest->W[n + 128/bit] = sat_u(vsrar(Vd->D[n], imm, bit), bit/2 - 1);
+        if (dest->W[n + 128/bit] < 0) {
+            dest->W[n + 128/bit] = 0;
+        }
+        break;
+    case 128:
+        dest->D[n] = sat_u_128(vsrarn((__int128_t)Vj->Q[n], imm, bit),
+                               bit/2 - 1);
+        if (dest->D[n] < 0) {
+            dest->D[n] = 0;
+        }
+        dest->D[n + 128/bit] = sat_u_128(vsrarn((__int128_t)Vd->Q[n], imm, bit),
+                                         bit/2 - 1);
+        if (dest->D[n + 128/bit] < 0) {
+            dest->D[n + 128/bit] = 0;
+        }
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+DO_HELPER_VV_I(vssrlrni_bu_h, 16, helper_vv_ni_c, do_vssrlrni_u)
+DO_HELPER_VV_I(vssrlrni_hu_w, 32, helper_vv_ni_c, do_vssrlrni_u)
+DO_HELPER_VV_I(vssrlrni_wu_d, 64, helper_vv_ni_c, do_vssrlrni_u)
+DO_HELPER_VV_I(vssrlrni_du_q, 128, helper_vv_ni_c, do_vssrlrni_u)
+DO_HELPER_VV_I(vssrarni_bu_h, 16, helper_vv_ni_c, do_vssrarni_u)
+DO_HELPER_VV_I(vssrarni_hu_w, 32, helper_vv_ni_c, do_vssrarni_u)
+DO_HELPER_VV_I(vssrarni_wu_d, 64, helper_vv_ni_c, do_vssrarni_u)
+DO_HELPER_VV_I(vssrarni_du_q, 128, helper_vv_ni_c, do_vssrarni_u)
-- 
2.31.1


