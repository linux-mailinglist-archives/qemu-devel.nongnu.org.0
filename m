Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66FE765595C
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Dec 2022 09:38:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8zjl-00078z-Ev; Sat, 24 Dec 2022 03:18:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1p8zjP-0006kp-Dj
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 03:18:13 -0500
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1p8zjK-0003Q0-N5
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 03:18:11 -0500
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8DxM_BotaZjLUkIAA--.18498S3;
 Sat, 24 Dec 2022 16:16:40 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8CxPuRhtaZjuccKAA--.38440S17; 
 Sat, 24 Dec 2022 16:16:40 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org
Subject: [RFC PATCH 15/43] target/loongarch: Implement vmul/vmuh/vmulw{ev/od}
Date: Sat, 24 Dec 2022 16:16:05 +0800
Message-Id: <20221224081633.4185445-16-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20221224081633.4185445-1-gaosong@loongson.cn>
References: <20221224081633.4185445-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8CxPuRhtaZjuccKAA--.38440S17
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvAXoW3Zw13GrykZFWDKw1kuw1rJFb_yoW8WFyxto
 Z5Jw15Aw1rKr1ftF9rGas7ZrnFy3yqyw4DuFWq9r1DJrW5ArnxtFyrK3s5Aa95KrWrKw13
 Can7Ars5t3W3Xr1kn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXasCq-sGcSsGvf
 J3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnRJU
 UUqv1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64
 kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY
 1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6x
 kF7I0E14v26r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020E
 x4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E74AGY7Cv6cx26rWlOx8S6xCaFV
 Cjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7VAKI48JMxAIw28IcVCjz48v
 1sIEY20_WwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I
 0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jrv_JF1lIxkGc2Ij64vIr41lIxAI
 cVC0I7IYx2IY67AKxVW5JVW7JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcV
 CF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIE
 c7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0zRVWlkUUUUU=
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
- VMUL.{B/H/W/D};
- VMUH.{B/H/W/D}[U];
- VMULW{EV/OD}.{H.B/W.H/D.W/Q.D}[U];
- VMULW{EV/OD}.{H.BU.B/W.HU.H/D.WU.W/Q.DU.D}.

Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 target/loongarch/disas.c                    |  38 ++++
 target/loongarch/helper.h                   |  38 ++++
 target/loongarch/insn_trans/trans_lsx.c.inc |  37 ++++
 target/loongarch/insns.decode               |  38 ++++
 target/loongarch/lsx_helper.c               | 218 ++++++++++++++++++++
 5 files changed, 369 insertions(+)

diff --git a/target/loongarch/disas.c b/target/loongarch/disas.c
index 2e86c48f4d..8818e078c1 100644
--- a/target/loongarch/disas.c
+++ b/target/loongarch/disas.c
@@ -943,3 +943,41 @@ INSN_LSX(vmini_bu,         vv_i)
 INSN_LSX(vmini_hu,         vv_i)
 INSN_LSX(vmini_wu,         vv_i)
 INSN_LSX(vmini_du,         vv_i)
+
+INSN_LSX(vmul_b,           vvv)
+INSN_LSX(vmul_h,           vvv)
+INSN_LSX(vmul_w,           vvv)
+INSN_LSX(vmul_d,           vvv)
+INSN_LSX(vmuh_b,           vvv)
+INSN_LSX(vmuh_h,           vvv)
+INSN_LSX(vmuh_w,           vvv)
+INSN_LSX(vmuh_d,           vvv)
+INSN_LSX(vmuh_bu,          vvv)
+INSN_LSX(vmuh_hu,          vvv)
+INSN_LSX(vmuh_wu,          vvv)
+INSN_LSX(vmuh_du,          vvv)
+
+INSN_LSX(vmulwev_h_b,      vvv)
+INSN_LSX(vmulwev_w_h,      vvv)
+INSN_LSX(vmulwev_d_w,      vvv)
+INSN_LSX(vmulwev_q_d,      vvv)
+INSN_LSX(vmulwod_h_b,      vvv)
+INSN_LSX(vmulwod_w_h,      vvv)
+INSN_LSX(vmulwod_d_w,      vvv)
+INSN_LSX(vmulwod_q_d,      vvv)
+INSN_LSX(vmulwev_h_bu,     vvv)
+INSN_LSX(vmulwev_w_hu,     vvv)
+INSN_LSX(vmulwev_d_wu,     vvv)
+INSN_LSX(vmulwev_q_du,     vvv)
+INSN_LSX(vmulwod_h_bu,     vvv)
+INSN_LSX(vmulwod_w_hu,     vvv)
+INSN_LSX(vmulwod_d_wu,     vvv)
+INSN_LSX(vmulwod_q_du,     vvv)
+INSN_LSX(vmulwev_h_bu_b,   vvv)
+INSN_LSX(vmulwev_w_hu_h,   vvv)
+INSN_LSX(vmulwev_d_wu_w,   vvv)
+INSN_LSX(vmulwev_q_du_d,   vvv)
+INSN_LSX(vmulwod_h_bu_b,   vvv)
+INSN_LSX(vmulwod_w_hu_h,   vvv)
+INSN_LSX(vmulwod_d_wu_w,   vvv)
+INSN_LSX(vmulwod_q_du_d,   vvv)
diff --git a/target/loongarch/helper.h b/target/loongarch/helper.h
index 04afc93dc1..568a89eec1 100644
--- a/target/loongarch/helper.h
+++ b/target/loongarch/helper.h
@@ -298,3 +298,41 @@ DEF_HELPER_4(vmini_bu, void, env, i32, i32, i32)
 DEF_HELPER_4(vmini_hu, void, env, i32, i32, i32)
 DEF_HELPER_4(vmini_wu, void, env, i32, i32, i32)
 DEF_HELPER_4(vmini_du, void, env, i32, i32, i32)
+
+DEF_HELPER_4(vmul_b, void, env, i32, i32, i32)
+DEF_HELPER_4(vmul_h, void, env, i32, i32, i32)
+DEF_HELPER_4(vmul_w, void, env, i32, i32, i32)
+DEF_HELPER_4(vmul_d, void, env, i32, i32, i32)
+DEF_HELPER_4(vmuh_b, void, env, i32, i32, i32)
+DEF_HELPER_4(vmuh_h, void, env, i32, i32, i32)
+DEF_HELPER_4(vmuh_w, void, env, i32, i32, i32)
+DEF_HELPER_4(vmuh_d, void, env, i32, i32, i32)
+DEF_HELPER_4(vmuh_bu, void, env, i32, i32, i32)
+DEF_HELPER_4(vmuh_hu, void, env, i32, i32, i32)
+DEF_HELPER_4(vmuh_wu, void, env, i32, i32, i32)
+DEF_HELPER_4(vmuh_du, void, env, i32, i32, i32)
+
+DEF_HELPER_4(vmulwev_h_b, void, env, i32, i32, i32)
+DEF_HELPER_4(vmulwev_w_h, void, env, i32, i32, i32)
+DEF_HELPER_4(vmulwev_d_w, void, env, i32, i32, i32)
+DEF_HELPER_4(vmulwev_q_d, void, env, i32, i32, i32)
+DEF_HELPER_4(vmulwod_h_b, void, env, i32, i32, i32)
+DEF_HELPER_4(vmulwod_w_h, void, env, i32, i32, i32)
+DEF_HELPER_4(vmulwod_d_w, void, env, i32, i32, i32)
+DEF_HELPER_4(vmulwod_q_d, void, env, i32, i32, i32)
+DEF_HELPER_4(vmulwev_h_bu, void, env, i32, i32, i32)
+DEF_HELPER_4(vmulwev_w_hu, void, env, i32, i32, i32)
+DEF_HELPER_4(vmulwev_d_wu, void, env, i32, i32, i32)
+DEF_HELPER_4(vmulwev_q_du, void, env, i32, i32, i32)
+DEF_HELPER_4(vmulwod_h_bu, void, env, i32, i32, i32)
+DEF_HELPER_4(vmulwod_w_hu, void, env, i32, i32, i32)
+DEF_HELPER_4(vmulwod_d_wu, void, env, i32, i32, i32)
+DEF_HELPER_4(vmulwod_q_du, void, env, i32, i32, i32)
+DEF_HELPER_4(vmulwev_h_bu_b, void, env, i32, i32, i32)
+DEF_HELPER_4(vmulwev_w_hu_h, void, env, i32, i32, i32)
+DEF_HELPER_4(vmulwev_d_wu_w, void, env, i32, i32, i32)
+DEF_HELPER_4(vmulwev_q_du_d, void, env, i32, i32, i32)
+DEF_HELPER_4(vmulwod_h_bu_b, void, env, i32, i32, i32)
+DEF_HELPER_4(vmulwod_w_hu_h, void, env, i32, i32, i32)
+DEF_HELPER_4(vmulwod_d_wu_w, void, env, i32, i32, i32)
+DEF_HELPER_4(vmulwod_q_du_d, void, env, i32, i32, i32)
diff --git a/target/loongarch/insn_trans/trans_lsx.c.inc b/target/loongarch/insn_trans/trans_lsx.c.inc
index 8bece985f1..7d27f574ed 100644
--- a/target/loongarch/insn_trans/trans_lsx.c.inc
+++ b/target/loongarch/insn_trans/trans_lsx.c.inc
@@ -215,3 +215,40 @@ TRANS(vmini_bu, gen_vv_i, gen_helper_vmini_bu)
 TRANS(vmini_hu, gen_vv_i, gen_helper_vmini_hu)
 TRANS(vmini_wu, gen_vv_i, gen_helper_vmini_wu)
 TRANS(vmini_du, gen_vv_i, gen_helper_vmini_du)
+
+TRANS(vmul_b, gen_vvv, gen_helper_vmul_b)
+TRANS(vmul_h, gen_vvv, gen_helper_vmul_h)
+TRANS(vmul_w, gen_vvv, gen_helper_vmul_w)
+TRANS(vmul_d, gen_vvv, gen_helper_vmul_d)
+TRANS(vmuh_b, gen_vvv, gen_helper_vmuh_b)
+TRANS(vmuh_h, gen_vvv, gen_helper_vmuh_h)
+TRANS(vmuh_w, gen_vvv, gen_helper_vmuh_w)
+TRANS(vmuh_d, gen_vvv, gen_helper_vmuh_d)
+TRANS(vmuh_bu, gen_vvv, gen_helper_vmuh_bu)
+TRANS(vmuh_hu, gen_vvv, gen_helper_vmuh_hu)
+TRANS(vmuh_wu, gen_vvv, gen_helper_vmuh_wu)
+TRANS(vmuh_du, gen_vvv, gen_helper_vmuh_du)
+TRANS(vmulwev_h_b, gen_vvv, gen_helper_vmulwev_h_b)
+TRANS(vmulwev_w_h, gen_vvv, gen_helper_vmulwev_w_h)
+TRANS(vmulwev_d_w, gen_vvv, gen_helper_vmulwev_d_w)
+TRANS(vmulwev_q_d, gen_vvv, gen_helper_vmulwev_q_d)
+TRANS(vmulwod_h_b, gen_vvv, gen_helper_vmulwod_h_b)
+TRANS(vmulwod_w_h, gen_vvv, gen_helper_vmulwod_w_h)
+TRANS(vmulwod_d_w, gen_vvv, gen_helper_vmulwod_d_w)
+TRANS(vmulwod_q_d, gen_vvv, gen_helper_vmulwod_q_d)
+TRANS(vmulwev_h_bu, gen_vvv, gen_helper_vmulwev_h_bu)
+TRANS(vmulwev_w_hu, gen_vvv, gen_helper_vmulwev_w_hu)
+TRANS(vmulwev_d_wu, gen_vvv, gen_helper_vmulwev_d_wu)
+TRANS(vmulwev_q_du, gen_vvv, gen_helper_vmulwev_q_du)
+TRANS(vmulwod_h_bu, gen_vvv, gen_helper_vmulwod_h_bu)
+TRANS(vmulwod_w_hu, gen_vvv, gen_helper_vmulwod_w_hu)
+TRANS(vmulwod_d_wu, gen_vvv, gen_helper_vmulwod_d_wu)
+TRANS(vmulwod_q_du, gen_vvv, gen_helper_vmulwod_q_du)
+TRANS(vmulwev_h_bu_b, gen_vvv, gen_helper_vmulwev_h_bu_b)
+TRANS(vmulwev_w_hu_h, gen_vvv, gen_helper_vmulwev_w_hu_h)
+TRANS(vmulwev_d_wu_w, gen_vvv, gen_helper_vmulwev_d_wu_w)
+TRANS(vmulwev_q_du_d, gen_vvv, gen_helper_vmulwev_q_du_d)
+TRANS(vmulwod_h_bu_b, gen_vvv, gen_helper_vmulwod_h_bu_b)
+TRANS(vmulwod_w_hu_h, gen_vvv, gen_helper_vmulwod_w_hu_h)
+TRANS(vmulwod_d_wu_w, gen_vvv, gen_helper_vmulwod_d_wu_w)
+TRANS(vmulwod_q_du_d, gen_vvv, gen_helper_vmulwod_q_du_d)
diff --git a/target/loongarch/insns.decode b/target/loongarch/insns.decode
index c5d8859db2..6f32fd290e 100644
--- a/target/loongarch/insns.decode
+++ b/target/loongarch/insns.decode
@@ -667,3 +667,41 @@ vmini_bu         0111 00101001 01100 ..... ..... .....    @vv_ui5
 vmini_hu         0111 00101001 01101 ..... ..... .....    @vv_ui5
 vmini_wu         0111 00101001 01110 ..... ..... .....    @vv_ui5
 vmini_du         0111 00101001 01111 ..... ..... .....    @vv_ui5
+
+vmul_b           0111 00001000 01000 ..... ..... .....    @vvv
+vmul_h           0111 00001000 01001 ..... ..... .....    @vvv
+vmul_w           0111 00001000 01010 ..... ..... .....    @vvv
+vmul_d           0111 00001000 01011 ..... ..... .....    @vvv
+vmuh_b           0111 00001000 01100 ..... ..... .....    @vvv
+vmuh_h           0111 00001000 01101 ..... ..... .....    @vvv
+vmuh_w           0111 00001000 01110 ..... ..... .....    @vvv
+vmuh_d           0111 00001000 01111 ..... ..... .....    @vvv
+vmuh_bu          0111 00001000 10000 ..... ..... .....    @vvv
+vmuh_hu          0111 00001000 10001 ..... ..... .....    @vvv
+vmuh_wu          0111 00001000 10010 ..... ..... .....    @vvv
+vmuh_du          0111 00001000 10011 ..... ..... .....    @vvv
+
+vmulwev_h_b      0111 00001001 00000 ..... ..... .....    @vvv
+vmulwev_w_h      0111 00001001 00001 ..... ..... .....    @vvv
+vmulwev_d_w      0111 00001001 00010 ..... ..... .....    @vvv
+vmulwev_q_d      0111 00001001 00011 ..... ..... .....    @vvv
+vmulwod_h_b      0111 00001001 00100 ..... ..... .....    @vvv
+vmulwod_w_h      0111 00001001 00101 ..... ..... .....    @vvv
+vmulwod_d_w      0111 00001001 00110 ..... ..... .....    @vvv
+vmulwod_q_d      0111 00001001 00111 ..... ..... .....    @vvv
+vmulwev_h_bu     0111 00001001 10000 ..... ..... .....    @vvv
+vmulwev_w_hu     0111 00001001 10001 ..... ..... .....    @vvv
+vmulwev_d_wu     0111 00001001 10010 ..... ..... .....    @vvv
+vmulwev_q_du     0111 00001001 10011 ..... ..... .....    @vvv
+vmulwod_h_bu     0111 00001001 10100 ..... ..... .....    @vvv
+vmulwod_w_hu     0111 00001001 10101 ..... ..... .....    @vvv
+vmulwod_d_wu     0111 00001001 10110 ..... ..... .....    @vvv
+vmulwod_q_du     0111 00001001 10111 ..... ..... .....    @vvv
+vmulwev_h_bu_b   0111 00001010 00000 ..... ..... .....    @vvv
+vmulwev_w_hu_h   0111 00001010 00001 ..... ..... .....    @vvv
+vmulwev_d_wu_w   0111 00001010 00010 ..... ..... .....    @vvv
+vmulwev_q_du_d   0111 00001010 00011 ..... ..... .....    @vvv
+vmulwod_h_bu_b   0111 00001010 00100 ..... ..... .....    @vvv
+vmulwod_w_hu_h   0111 00001010 00101 ..... ..... .....    @vvv
+vmulwod_d_wu_w   0111 00001010 00110 ..... ..... .....    @vvv
+vmulwod_q_du_d   0111 00001010 00111 ..... ..... .....    @vvv
diff --git a/target/loongarch/lsx_helper.c b/target/loongarch/lsx_helper.c
index 5bccb3111b..d55d2350dc 100644
--- a/target/loongarch/lsx_helper.c
+++ b/target/loongarch/lsx_helper.c
@@ -1155,3 +1155,221 @@ DO_HELPER_VV_I(vmini_bu, 8, helper_vv_i, do_vmini_u)
 DO_HELPER_VV_I(vmini_hu, 16, helper_vv_i, do_vmini_u)
 DO_HELPER_VV_I(vmini_wu, 32, helper_vv_i, do_vmini_u)
 DO_HELPER_VV_I(vmini_du, 64, helper_vv_i, do_vmini_u)
+
+static void do_vmul(vec_t *Vd, vec_t *Vj, vec_t *Vk, int bit, int n)
+{
+    switch (bit) {
+    case 8:
+        Vd->B[n] = Vj->B[n] * Vk->B[n];
+        break;
+    case 16:
+        Vd->H[n] = Vj->H[n] * Vk->H[n];
+        break;
+    case 32:
+        Vd->W[n] = Vj->W[n] * Vk->W[n];
+        break;
+    case 64:
+        Vd->D[n] = Vj->D[n] * Vk->D[n];
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static void do_vmuh_s(vec_t *Vd, vec_t *Vj, vec_t *Vk, int bit, int n)
+{
+    switch (bit) {
+    case 8:
+        Vd->B[n] = ((int16_t)(Vj->B[n] * Vk->B[n])) >> 8;
+        break;
+    case 16:
+        Vd->H[n] = ((int32_t)(Vj->H[n] * Vk->H[n])) >> 16;
+        break;
+    case 32:
+        Vd->W[n] = ((int64_t)(Vj->W[n] * (int64_t)Vk->W[n])) >> 32;
+        break;
+    case 64:
+        Vd->D[n] = ((__int128_t)(Vj->D[n] * (__int128_t)Vk->D[n])) >> 64;
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static void do_vmuh_u(vec_t *Vd, vec_t *Vj, vec_t *Vk, int bit, int n)
+{
+    switch (bit) {
+    case 8:
+        Vd->B[n] = ((uint16_t)(((uint8_t)Vj->B[n]) * ((uint8_t)Vk->B[n]))) >> 8;
+        break;
+    case 16:
+        Vd->H[n] = ((uint32_t)(((uint16_t)Vj->H[n]) * ((uint16_t)Vk->H[n]))) >> 16;
+        break;
+    case 32:
+        Vd->W[n] = ((uint64_t)(((uint32_t)Vj->W[n]) * ((uint64_t)(uint32_t)Vk->W[n]))) >> 32;
+        break;
+    case 64:
+        Vd->D[n] = ((__int128_t)(((uint64_t)Vj->D[n]) * ((__int128_t)(uint64_t)Vk->D[n]))) >> 64;
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+DO_HELPER_VVV(vmul_b, 8, helper_vvv, do_vmul)
+DO_HELPER_VVV(vmul_h, 16, helper_vvv, do_vmul)
+DO_HELPER_VVV(vmul_w, 32, helper_vvv, do_vmul)
+DO_HELPER_VVV(vmul_d, 64, helper_vvv, do_vmul)
+DO_HELPER_VVV(vmuh_b, 8, helper_vvv, do_vmuh_s)
+DO_HELPER_VVV(vmuh_h, 16, helper_vvv, do_vmuh_s)
+DO_HELPER_VVV(vmuh_w, 32, helper_vvv, do_vmuh_s)
+DO_HELPER_VVV(vmuh_d, 64, helper_vvv, do_vmuh_s)
+DO_HELPER_VVV(vmuh_bu, 8, helper_vvv, do_vmuh_u)
+DO_HELPER_VVV(vmuh_hu, 16, helper_vvv, do_vmuh_u)
+DO_HELPER_VVV(vmuh_wu, 32, helper_vvv, do_vmuh_u)
+DO_HELPER_VVV(vmuh_du, 64, helper_vvv, do_vmuh_u)
+
+static void do_vmulwev_s(vec_t *Vd, vec_t *Vj, vec_t *Vk, int bit, int n)
+{
+    switch (bit) {
+    case 16:
+        Vd->H[n] = Vj->B[2 * n] * Vk->B[2 * n];
+        break;
+    case 32:
+        Vd->W[n] = Vj->H[2 * n] * Vk->H[2 * n];
+        break;
+    case 64:
+        Vd->D[n] = (int64_t)Vj->W[2 * n] * (int64_t)Vk->W[2 * n];
+        break;
+    case 128:
+        Vd->Q[n] = (__int128_t)Vj->D[2 * n] * (__int128_t)Vk->D[2 * n];
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static void do_vmulwod_s(vec_t *Vd, vec_t *Vj, vec_t *Vk, int bit, int n)
+{
+    switch (bit) {
+    case 16:
+        Vd->H[n] = Vj->B[2 * n + 1] * Vk->B[2 * n + 1];
+        break;
+    case 32:
+        Vd->W[n] = Vj->H[2 * n + 1] * Vk->H[2 * n + 1];
+        break;
+    case 64:
+        Vd->D[n] = (int64_t)Vj->W[2 * n + 1] * (int64_t)Vk->W[2 * n + 1];
+        break;
+    case 128:
+        Vd->Q[n] = (__int128_t)Vj->D[2 * n + 1] * (__int128_t)Vk->D[2 * n + 1];
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static void do_vmulwev_u(vec_t *Vd, vec_t *Vj, vec_t *Vk, int bit, int n)
+{
+    switch (bit) {
+    case 16:
+        Vd->H[n] = (uint8_t)Vj->B[2 * n] * (uint8_t)Vk->B[2 * n];
+        break;
+    case 32:
+        Vd->W[n] = (uint16_t)Vj->H[2 * n] * (uint16_t)Vk->H[2 * n];
+        break;
+    case 64:
+        Vd->D[n] = (uint64_t)(uint32_t)Vj->W[2 * n] * (uint64_t)(uint32_t)Vk->W[2 * n];
+        break;
+    case 128:
+        Vd->Q[n] = (__uint128_t)(uint64_t)Vj->D[2 * n] * (__uint128_t)(uint64_t)Vk->D[2 * n];
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static void do_vmulwod_u(vec_t *Vd, vec_t *Vj, vec_t *Vk, int bit, int n)
+{
+    switch (bit) {
+    case 16:
+        Vd->H[n] = (uint8_t)Vj->B[2 * n + 1] * (uint8_t)Vk->B[2 * n + 1];
+        break;
+    case 32:
+        Vd->W[n] = (uint16_t)Vj->H[2 * n + 1] * (uint16_t)Vk->H[2 * n + 1];
+        break;
+    case 64:
+        Vd->D[n] = (uint64_t)(uint32_t)Vj->W[2 * n + 1] * (uint64_t)(uint32_t)Vk->W[2 * n + 1];
+        break;
+    case 128:
+        Vd->Q[n] = (__uint128_t)(uint64_t)Vj->D[2 * n + 1] * (__uint128_t)(uint64_t)Vk->D[2 * n + 1];
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static void do_vmulwev_u_s(vec_t *Vd, vec_t *Vj, vec_t *Vk, int bit, int n)
+{
+    switch (bit) {
+    case 16:
+        Vd->H[n] = (uint8_t)Vj->B[2 * n] * Vk->B[2 * n];
+        break;
+    case 32:
+        Vd->W[n] = (uint16_t)Vj->H[2 * n] * Vk->H[2 * n];
+        break;
+    case 64:
+        Vd->D[n] = (int64_t)(uint32_t)Vj->W[2 * n] * (int64_t)Vk->W[2 * n];
+        break;
+    case 128:
+        Vd->Q[n] = (__int128_t)(uint64_t)Vj->D[2 * n] * (__int128_t)Vk->D[2 * n];
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static void do_vmulwod_u_s(vec_t *Vd, vec_t *Vj, vec_t *Vk, int bit, int n)
+{
+    switch (bit) {
+    case 16:
+        Vd->H[n] = (uint8_t)Vj->B[2 * n + 1] * Vk->B[2 * n + 1];
+        break;
+    case 32:
+        Vd->W[n] = (uint16_t)Vj->H[2 * n + 1] * Vk->H[2 * n + 1];
+        break;
+    case 64:
+        Vd->D[n] = (int64_t)(uint32_t)Vj->W[2 * n + 1] * (int64_t)Vk->W[2 * n + 1];
+        break;
+    case 128:
+        Vd->Q[n] = (__int128_t)(uint64_t)Vj->D[2 * n + 1] * (__int128_t)Vk->D[2 * n + 1];
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+DO_HELPER_VVV(vmulwev_h_b, 16, helper_vvv, do_vmulwev_s)
+DO_HELPER_VVV(vmulwev_w_h, 32, helper_vvv, do_vmulwev_s)
+DO_HELPER_VVV(vmulwev_d_w, 64, helper_vvv, do_vmulwev_s)
+DO_HELPER_VVV(vmulwev_q_d, 128, helper_vvv, do_vmulwev_s)
+DO_HELPER_VVV(vmulwod_h_b, 16, helper_vvv, do_vmulwod_s)
+DO_HELPER_VVV(vmulwod_w_h, 32, helper_vvv, do_vmulwod_s)
+DO_HELPER_VVV(vmulwod_d_w, 64, helper_vvv, do_vmulwod_s)
+DO_HELPER_VVV(vmulwod_q_d, 128, helper_vvv, do_vmulwod_s)
+DO_HELPER_VVV(vmulwev_h_bu, 16, helper_vvv, do_vmulwev_u)
+DO_HELPER_VVV(vmulwev_w_hu, 32, helper_vvv, do_vmulwev_u)
+DO_HELPER_VVV(vmulwev_d_wu, 64, helper_vvv, do_vmulwev_u)
+DO_HELPER_VVV(vmulwev_q_du, 128, helper_vvv, do_vmulwev_u)
+DO_HELPER_VVV(vmulwod_h_bu, 16, helper_vvv, do_vmulwod_u)
+DO_HELPER_VVV(vmulwod_w_hu, 32, helper_vvv, do_vmulwod_u)
+DO_HELPER_VVV(vmulwod_d_wu, 64, helper_vvv, do_vmulwod_u)
+DO_HELPER_VVV(vmulwod_q_du, 128, helper_vvv, do_vmulwod_u)
+DO_HELPER_VVV(vmulwev_h_bu_b, 16, helper_vvv, do_vmulwev_u_s)
+DO_HELPER_VVV(vmulwev_w_hu_h, 32, helper_vvv, do_vmulwev_u_s)
+DO_HELPER_VVV(vmulwev_d_wu_w, 64, helper_vvv, do_vmulwev_u_s)
+DO_HELPER_VVV(vmulwev_q_du_d, 128, helper_vvv, do_vmulwev_u_s)
+DO_HELPER_VVV(vmulwod_h_bu_b, 16, helper_vvv, do_vmulwod_u_s)
+DO_HELPER_VVV(vmulwod_w_hu_h, 32, helper_vvv, do_vmulwod_u_s)
+DO_HELPER_VVV(vmulwod_d_wu_w, 64, helper_vvv, do_vmulwod_u_s)
+DO_HELPER_VVV(vmulwod_q_du_d, 128, helper_vvv, do_vmulwod_u_s)
-- 
2.31.1


