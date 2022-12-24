Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66DF365593C
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Dec 2022 09:27:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8zjy-0007FX-6A; Sat, 24 Dec 2022 03:18:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1p8zjO-0006gc-85
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 03:18:10 -0500
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1p8zjK-0003Px-HZ
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 03:18:09 -0500
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8AxRPBptaZjMEkIAA--.18857S3;
 Sat, 24 Dec 2022 16:16:41 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8CxPuRhtaZjuccKAA--.38440S18; 
 Sat, 24 Dec 2022 16:16:40 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org
Subject: [RFC PATCH 16/43] target/loongarch: Implement
 vmadd/vmsub/vmaddw{ev/od}
Date: Sat, 24 Dec 2022 16:16:06 +0800
Message-Id: <20221224081633.4185445-17-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20221224081633.4185445-1-gaosong@loongson.cn>
References: <20221224081633.4185445-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8CxPuRhtaZjuccKAA--.38440S18
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvAXoWfGrykWFyfuFy7GF43ZryrWFg_yoW8XFW8Co
 Z5Jw15Aw1kAr1fGr9rGa97ZrWDJrWvyw4DtFyqgrnrJa45Ary3ta45Gw1kJayrJrZ8Kr15
 CanxAF1rt3WYqF4kn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXasCq-sGcSsGvf
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
- VMADD.{B/H/W/D};
- VMSUB.{B/H/W/D};
- VMADDW{EV/OD}.{H.B/W.H/D.W/Q.D}[U];
- VMADDW{EV/OD}.{H.BU.B/W.HU.H/D.WU.W/Q.DU.D}.

Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 target/loongarch/disas.c                    |  34 ++++
 target/loongarch/helper.h                   |  34 ++++
 target/loongarch/insn_trans/trans_lsx.c.inc |  34 ++++
 target/loongarch/insns.decode               |  34 ++++
 target/loongarch/lsx_helper.c               | 202 ++++++++++++++++++++
 5 files changed, 338 insertions(+)

diff --git a/target/loongarch/disas.c b/target/loongarch/disas.c
index 8818e078c1..3c11c6d5d2 100644
--- a/target/loongarch/disas.c
+++ b/target/loongarch/disas.c
@@ -981,3 +981,37 @@ INSN_LSX(vmulwod_h_bu_b,   vvv)
 INSN_LSX(vmulwod_w_hu_h,   vvv)
 INSN_LSX(vmulwod_d_wu_w,   vvv)
 INSN_LSX(vmulwod_q_du_d,   vvv)
+
+INSN_LSX(vmadd_b,          vvv)
+INSN_LSX(vmadd_h,          vvv)
+INSN_LSX(vmadd_w,          vvv)
+INSN_LSX(vmadd_d,          vvv)
+INSN_LSX(vmsub_b,          vvv)
+INSN_LSX(vmsub_h,          vvv)
+INSN_LSX(vmsub_w,          vvv)
+INSN_LSX(vmsub_d,          vvv)
+
+INSN_LSX(vmaddwev_h_b,     vvv)
+INSN_LSX(vmaddwev_w_h,     vvv)
+INSN_LSX(vmaddwev_d_w,     vvv)
+INSN_LSX(vmaddwev_q_d,     vvv)
+INSN_LSX(vmaddwod_h_b,     vvv)
+INSN_LSX(vmaddwod_w_h,     vvv)
+INSN_LSX(vmaddwod_d_w,     vvv)
+INSN_LSX(vmaddwod_q_d,     vvv)
+INSN_LSX(vmaddwev_h_bu,    vvv)
+INSN_LSX(vmaddwev_w_hu,    vvv)
+INSN_LSX(vmaddwev_d_wu,    vvv)
+INSN_LSX(vmaddwev_q_du,    vvv)
+INSN_LSX(vmaddwod_h_bu,    vvv)
+INSN_LSX(vmaddwod_w_hu,    vvv)
+INSN_LSX(vmaddwod_d_wu,    vvv)
+INSN_LSX(vmaddwod_q_du,    vvv)
+INSN_LSX(vmaddwev_h_bu_b,  vvv)
+INSN_LSX(vmaddwev_w_hu_h,  vvv)
+INSN_LSX(vmaddwev_d_wu_w,  vvv)
+INSN_LSX(vmaddwev_q_du_d,  vvv)
+INSN_LSX(vmaddwod_h_bu_b,  vvv)
+INSN_LSX(vmaddwod_w_hu_h,  vvv)
+INSN_LSX(vmaddwod_d_wu_w,  vvv)
+INSN_LSX(vmaddwod_q_du_d,  vvv)
diff --git a/target/loongarch/helper.h b/target/loongarch/helper.h
index 568a89eec1..4d71b45fe0 100644
--- a/target/loongarch/helper.h
+++ b/target/loongarch/helper.h
@@ -336,3 +336,37 @@ DEF_HELPER_4(vmulwod_h_bu_b, void, env, i32, i32, i32)
 DEF_HELPER_4(vmulwod_w_hu_h, void, env, i32, i32, i32)
 DEF_HELPER_4(vmulwod_d_wu_w, void, env, i32, i32, i32)
 DEF_HELPER_4(vmulwod_q_du_d, void, env, i32, i32, i32)
+
+DEF_HELPER_4(vmadd_b, void, env, i32, i32, i32)
+DEF_HELPER_4(vmadd_h, void, env, i32, i32, i32)
+DEF_HELPER_4(vmadd_w, void, env, i32, i32, i32)
+DEF_HELPER_4(vmadd_d, void, env, i32, i32, i32)
+DEF_HELPER_4(vmsub_b, void, env, i32, i32, i32)
+DEF_HELPER_4(vmsub_h, void, env, i32, i32, i32)
+DEF_HELPER_4(vmsub_w, void, env, i32, i32, i32)
+DEF_HELPER_4(vmsub_d, void, env, i32, i32, i32)
+
+DEF_HELPER_4(vmaddwev_h_b, void, env, i32, i32, i32)
+DEF_HELPER_4(vmaddwev_w_h, void, env, i32, i32, i32)
+DEF_HELPER_4(vmaddwev_d_w, void, env, i32, i32, i32)
+DEF_HELPER_4(vmaddwev_q_d, void, env, i32, i32, i32)
+DEF_HELPER_4(vmaddwod_h_b, void, env, i32, i32, i32)
+DEF_HELPER_4(vmaddwod_w_h, void, env, i32, i32, i32)
+DEF_HELPER_4(vmaddwod_d_w, void, env, i32, i32, i32)
+DEF_HELPER_4(vmaddwod_q_d, void, env, i32, i32, i32)
+DEF_HELPER_4(vmaddwev_h_bu, void, env, i32, i32, i32)
+DEF_HELPER_4(vmaddwev_w_hu, void, env, i32, i32, i32)
+DEF_HELPER_4(vmaddwev_d_wu, void, env, i32, i32, i32)
+DEF_HELPER_4(vmaddwev_q_du, void, env, i32, i32, i32)
+DEF_HELPER_4(vmaddwod_h_bu, void, env, i32, i32, i32)
+DEF_HELPER_4(vmaddwod_w_hu, void, env, i32, i32, i32)
+DEF_HELPER_4(vmaddwod_d_wu, void, env, i32, i32, i32)
+DEF_HELPER_4(vmaddwod_q_du, void, env, i32, i32, i32)
+DEF_HELPER_4(vmaddwev_h_bu_b, void, env, i32, i32, i32)
+DEF_HELPER_4(vmaddwev_w_hu_h, void, env, i32, i32, i32)
+DEF_HELPER_4(vmaddwev_d_wu_w, void, env, i32, i32, i32)
+DEF_HELPER_4(vmaddwev_q_du_d, void, env, i32, i32, i32)
+DEF_HELPER_4(vmaddwod_h_bu_b, void, env, i32, i32, i32)
+DEF_HELPER_4(vmaddwod_w_hu_h, void, env, i32, i32, i32)
+DEF_HELPER_4(vmaddwod_d_wu_w, void, env, i32, i32, i32)
+DEF_HELPER_4(vmaddwod_q_du_d, void, env, i32, i32, i32)
diff --git a/target/loongarch/insn_trans/trans_lsx.c.inc b/target/loongarch/insn_trans/trans_lsx.c.inc
index 7d27f574ed..e9674af1bd 100644
--- a/target/loongarch/insn_trans/trans_lsx.c.inc
+++ b/target/loongarch/insn_trans/trans_lsx.c.inc
@@ -252,3 +252,37 @@ TRANS(vmulwod_h_bu_b, gen_vvv, gen_helper_vmulwod_h_bu_b)
 TRANS(vmulwod_w_hu_h, gen_vvv, gen_helper_vmulwod_w_hu_h)
 TRANS(vmulwod_d_wu_w, gen_vvv, gen_helper_vmulwod_d_wu_w)
 TRANS(vmulwod_q_du_d, gen_vvv, gen_helper_vmulwod_q_du_d)
+
+TRANS(vmadd_b, gen_vvv, gen_helper_vmadd_b)
+TRANS(vmadd_h, gen_vvv, gen_helper_vmadd_h)
+TRANS(vmadd_w, gen_vvv, gen_helper_vmadd_w)
+TRANS(vmadd_d, gen_vvv, gen_helper_vmadd_d)
+TRANS(vmsub_b, gen_vvv, gen_helper_vmsub_b)
+TRANS(vmsub_h, gen_vvv, gen_helper_vmsub_h)
+TRANS(vmsub_w, gen_vvv, gen_helper_vmsub_w)
+TRANS(vmsub_d, gen_vvv, gen_helper_vmsub_d)
+
+TRANS(vmaddwev_h_b, gen_vvv, gen_helper_vmaddwev_h_b)
+TRANS(vmaddwev_w_h, gen_vvv, gen_helper_vmaddwev_w_h)
+TRANS(vmaddwev_d_w, gen_vvv, gen_helper_vmaddwev_d_w)
+TRANS(vmaddwev_q_d, gen_vvv, gen_helper_vmaddwev_q_d)
+TRANS(vmaddwod_h_b, gen_vvv, gen_helper_vmaddwod_h_b)
+TRANS(vmaddwod_w_h, gen_vvv, gen_helper_vmaddwod_w_h)
+TRANS(vmaddwod_d_w, gen_vvv, gen_helper_vmaddwod_d_w)
+TRANS(vmaddwod_q_d, gen_vvv, gen_helper_vmaddwod_q_d)
+TRANS(vmaddwev_h_bu, gen_vvv, gen_helper_vmaddwev_h_bu)
+TRANS(vmaddwev_w_hu, gen_vvv, gen_helper_vmaddwev_w_hu)
+TRANS(vmaddwev_d_wu, gen_vvv, gen_helper_vmaddwev_d_wu)
+TRANS(vmaddwev_q_du, gen_vvv, gen_helper_vmaddwev_q_du)
+TRANS(vmaddwod_h_bu, gen_vvv, gen_helper_vmaddwod_h_bu)
+TRANS(vmaddwod_w_hu, gen_vvv, gen_helper_vmaddwod_w_hu)
+TRANS(vmaddwod_d_wu, gen_vvv, gen_helper_vmaddwod_d_wu)
+TRANS(vmaddwod_q_du, gen_vvv, gen_helper_vmaddwod_q_du)
+TRANS(vmaddwev_h_bu_b, gen_vvv, gen_helper_vmaddwev_h_bu_b)
+TRANS(vmaddwev_w_hu_h, gen_vvv, gen_helper_vmaddwev_w_hu_h)
+TRANS(vmaddwev_d_wu_w, gen_vvv, gen_helper_vmaddwev_d_wu_w)
+TRANS(vmaddwev_q_du_d, gen_vvv, gen_helper_vmaddwev_q_du_d)
+TRANS(vmaddwod_h_bu_b, gen_vvv, gen_helper_vmaddwod_h_bu_b)
+TRANS(vmaddwod_w_hu_h, gen_vvv, gen_helper_vmaddwod_w_hu_h)
+TRANS(vmaddwod_d_wu_w, gen_vvv, gen_helper_vmaddwod_d_wu_w)
+TRANS(vmaddwod_q_du_d, gen_vvv, gen_helper_vmaddwod_q_du_d)
diff --git a/target/loongarch/insns.decode b/target/loongarch/insns.decode
index 6f32fd290e..73390a07ce 100644
--- a/target/loongarch/insns.decode
+++ b/target/loongarch/insns.decode
@@ -705,3 +705,37 @@ vmulwod_h_bu_b   0111 00001010 00100 ..... ..... .....    @vvv
 vmulwod_w_hu_h   0111 00001010 00101 ..... ..... .....    @vvv
 vmulwod_d_wu_w   0111 00001010 00110 ..... ..... .....    @vvv
 vmulwod_q_du_d   0111 00001010 00111 ..... ..... .....    @vvv
+
+vmadd_b          0111 00001010 10000 ..... ..... .....    @vvv
+vmadd_h          0111 00001010 10001 ..... ..... .....    @vvv
+vmadd_w          0111 00001010 10010 ..... ..... .....    @vvv
+vmadd_d          0111 00001010 10011 ..... ..... .....    @vvv
+vmsub_b          0111 00001010 10100 ..... ..... .....    @vvv
+vmsub_h          0111 00001010 10101 ..... ..... .....    @vvv
+vmsub_w          0111 00001010 10110 ..... ..... .....    @vvv
+vmsub_d          0111 00001010 10111 ..... ..... .....    @vvv
+
+vmaddwev_h_b     0111 00001010 11000 ..... ..... .....    @vvv
+vmaddwev_w_h     0111 00001010 11001 ..... ..... .....    @vvv
+vmaddwev_d_w     0111 00001010 11010 ..... ..... .....    @vvv
+vmaddwev_q_d     0111 00001010 11011 ..... ..... .....    @vvv
+vmaddwod_h_b     0111 00001010 11100 ..... ..... .....    @vvv
+vmaddwod_w_h     0111 00001010 11101 ..... ..... .....    @vvv
+vmaddwod_d_w     0111 00001010 11110 ..... ..... .....    @vvv
+vmaddwod_q_d     0111 00001010 11111 ..... ..... .....    @vvv
+vmaddwev_h_bu    0111 00001011 01000 ..... ..... .....    @vvv
+vmaddwev_w_hu    0111 00001011 01001 ..... ..... .....    @vvv
+vmaddwev_d_wu    0111 00001011 01010 ..... ..... .....    @vvv
+vmaddwev_q_du    0111 00001011 01011 ..... ..... .....    @vvv
+vmaddwod_h_bu    0111 00001011 01100 ..... ..... .....    @vvv
+vmaddwod_w_hu    0111 00001011 01101 ..... ..... .....    @vvv
+vmaddwod_d_wu    0111 00001011 01110 ..... ..... .....    @vvv
+vmaddwod_q_du    0111 00001011 01111 ..... ..... .....    @vvv
+vmaddwev_h_bu_b  0111 00001011 11000 ..... ..... .....    @vvv
+vmaddwev_w_hu_h  0111 00001011 11001 ..... ..... .....    @vvv
+vmaddwev_d_wu_w  0111 00001011 11010 ..... ..... .....    @vvv
+vmaddwev_q_du_d  0111 00001011 11011 ..... ..... .....    @vvv
+vmaddwod_h_bu_b  0111 00001011 11100 ..... ..... .....    @vvv
+vmaddwod_w_hu_h  0111 00001011 11101 ..... ..... .....    @vvv
+vmaddwod_d_wu_w  0111 00001011 11110 ..... ..... .....    @vvv
+vmaddwod_q_du_d  0111 00001011 11111 ..... ..... .....    @vvv
diff --git a/target/loongarch/lsx_helper.c b/target/loongarch/lsx_helper.c
index d55d2350dc..aea2e34292 100644
--- a/target/loongarch/lsx_helper.c
+++ b/target/loongarch/lsx_helper.c
@@ -1373,3 +1373,205 @@ DO_HELPER_VVV(vmulwod_h_bu_b, 16, helper_vvv, do_vmulwod_u_s)
 DO_HELPER_VVV(vmulwod_w_hu_h, 32, helper_vvv, do_vmulwod_u_s)
 DO_HELPER_VVV(vmulwod_d_wu_w, 64, helper_vvv, do_vmulwod_u_s)
 DO_HELPER_VVV(vmulwod_q_du_d, 128, helper_vvv, do_vmulwod_u_s)
+
+static void do_vmadd(vec_t *Vd, vec_t *Vj, vec_t *Vk, int bit, int n)
+{
+    switch (bit) {
+    case 8:
+        Vd->B[n] += Vj->B[n] * Vk->B[n];
+        break;
+    case 16:
+        Vd->H[n] += Vj->H[n] * Vk->H[n];
+        break;
+    case 32:
+        Vd->W[n] += Vj->W[n] * Vk->W[n];
+        break;
+    case 64:
+        Vd->D[n] += Vj->D[n] * Vk->D[n];
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static void do_vmsub(vec_t *Vd, vec_t *Vj, vec_t *Vk, int bit, int n)
+{
+    switch (bit) {
+    case 8:
+        Vd->B[n] -= Vj->B[n] * Vk->B[n];
+        break;
+    case 16:
+        Vd->H[n] -= Vj->H[n] * Vk->H[n];
+        break;
+    case 32:
+        Vd->W[n] -= Vj->W[n] * Vk->W[n];
+        break;
+    case 64:
+        Vd->D[n] -= Vj->D[n] * Vk->D[n];
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+DO_HELPER_VVV(vmadd_b, 8, helper_vvv, do_vmadd)
+DO_HELPER_VVV(vmadd_h, 16, helper_vvv, do_vmadd)
+DO_HELPER_VVV(vmadd_w, 32, helper_vvv, do_vmadd)
+DO_HELPER_VVV(vmadd_d, 64, helper_vvv, do_vmadd)
+DO_HELPER_VVV(vmsub_b, 8, helper_vvv, do_vmsub)
+DO_HELPER_VVV(vmsub_h, 16, helper_vvv, do_vmsub)
+DO_HELPER_VVV(vmsub_w, 32, helper_vvv, do_vmsub)
+DO_HELPER_VVV(vmsub_d, 64, helper_vvv, do_vmsub)
+
+static void do_vmaddwev_s(vec_t *Vd, vec_t *Vj, vec_t *Vk, int bit, int n)
+{
+    switch (bit) {
+    case 16:
+        Vd->H[n] += Vj->B[2 * n] * Vk->B[2 * n];
+        break;
+    case 32:
+        Vd->W[n] += Vj->H[2 * n] * Vk->H[2 * n];
+        break;
+    case 64:
+        Vd->D[n] += (int64_t)Vj->W[2 * n] * (int64_t)Vk->W[2 * n];
+        break;
+    case 128:
+        Vd->Q[n] += (__int128_t)Vj->D[2 * n] * (__int128_t)Vk->D[2 * n];
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static void do_vmaddwod_s(vec_t *Vd, vec_t *Vj, vec_t *Vk, int bit, int n)
+{
+    switch (bit) {
+    case 16:
+        Vd->H[n] += Vj->B[2 * n + 1] * Vk->B[2 * n + 1];
+        break;
+    case 32:
+        Vd->W[n] += Vj->H[2 * n + 1] * Vk->H[2 * n + 1];
+        break;
+    case 64:
+        Vd->D[n] += (int64_t)Vj->W[2 * n + 1] * (int64_t)Vk->W[2 * n + 1];
+        break;
+    case 128:
+        Vd->Q[n] += (__int128_t)((__int128_t)Vj->D[2 * n + 1] *
+                    (__int128_t)Vk->D[2 * n + 1]);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static void do_vmaddwev_u(vec_t *Vd, vec_t *Vj, vec_t *Vk, int bit, int n)
+{
+    switch (bit) {
+    case 16:
+        Vd->H[n] += (uint8_t)Vj->B[2 * n] * (uint8_t)Vk->B[2 * n];
+        break;
+    case 32:
+        Vd->W[n] += (uint16_t)Vj->H[2 * n] * (uint16_t)Vk->H[2 * n];
+        break;
+    case 64:
+        Vd->D[n] += (uint64_t)(uint32_t)Vj->W[2 * n] *
+                    (uint64_t)(uint32_t)Vk->W[2 * n];
+        break;
+    case 128:
+        Vd->Q[n] += (__uint128_t)(uint64_t)Vj->D[2 * n] *
+                    (__uint128_t)(uint64_t)Vk->D[2 * n];
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static void do_vmaddwod_u(vec_t *Vd, vec_t *Vj, vec_t *Vk, int bit, int n)
+{
+    switch (bit) {
+    case 16:
+        Vd->H[n] += (uint8_t)Vj->B[2 * n + 1] * (uint8_t)Vk->B[2 * n + 1];
+        break;
+    case 32:
+        Vd->W[n] += (uint16_t)Vj->H[2 * n + 1] * (uint16_t)Vk->H[2 * n + 1];
+        break;
+    case 64:
+        Vd->D[n] += (uint64_t)(uint32_t)Vj->W[2 * n + 1] *
+                    (uint64_t)(uint32_t)Vk->W[2 * n + 1];
+        break;
+    case 128:
+        Vd->Q[n] += (__uint128_t)(uint64_t)Vj->D[2 * n + 1] *
+                    (__uint128_t)(uint64_t)Vk->D[2 * n + 1];
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static void do_vmaddwev_u_s(vec_t *Vd, vec_t *Vj, vec_t *Vk, int bit, int n)
+{
+    switch (bit) {
+    case 16:
+        Vd->H[n] += (uint8_t)Vj->B[2 * n] * Vk->B[2 * n];
+        break;
+    case 32:
+        Vd->W[n] += (uint16_t)Vj->H[2 * n] * Vk->H[2 * n];
+        break;
+    case 64:
+        Vd->D[n] += (int64_t)(uint32_t)Vj->W[2 * n] * (int64_t)Vk->W[2 * n];
+        break;
+    case 128:
+        Vd->Q[n] += (__int128_t)(uint64_t)Vj->D[2 * n] *
+                    (__int128_t)Vk->D[2 * n];
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static void do_vmaddwod_u_s(vec_t *Vd, vec_t *Vj, vec_t *Vk, int bit, int n)
+{
+    switch (bit) {
+    case 16:
+        Vd->H[n] += (uint8_t)Vj->B[2 * n + 1] * Vk->B[2 * n + 1];
+        break;
+    case 32:
+        Vd->W[n] += (uint16_t)Vj->H[2 * n + 1] * Vk->H[2 * n + 1];
+        break;
+    case 64:
+        Vd->D[n] += (int64_t)(uint32_t)Vj->W[2 * n + 1] *
+                    (int64_t)Vk->W[2 * n + 1];
+        break;
+    case 128:
+        Vd->Q[n] += (__int128_t)(uint64_t)Vj->D[2 * n + 1] *
+                    (__int128_t)Vk->D[2 * n + 1];
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+DO_HELPER_VVV(vmaddwev_h_b, 16, helper_vvv, do_vmaddwev_s)
+DO_HELPER_VVV(vmaddwev_w_h, 32, helper_vvv, do_vmaddwev_s)
+DO_HELPER_VVV(vmaddwev_d_w, 64, helper_vvv, do_vmaddwev_s)
+DO_HELPER_VVV(vmaddwev_q_d, 128, helper_vvv, do_vmaddwev_s)
+DO_HELPER_VVV(vmaddwod_h_b, 16, helper_vvv, do_vmaddwod_s)
+DO_HELPER_VVV(vmaddwod_w_h, 32, helper_vvv, do_vmaddwod_s)
+DO_HELPER_VVV(vmaddwod_d_w, 64, helper_vvv, do_vmaddwod_s)
+DO_HELPER_VVV(vmaddwod_q_d, 128, helper_vvv, do_vmaddwod_s)
+DO_HELPER_VVV(vmaddwev_h_bu, 16, helper_vvv, do_vmaddwev_u)
+DO_HELPER_VVV(vmaddwev_w_hu, 32, helper_vvv, do_vmaddwev_u)
+DO_HELPER_VVV(vmaddwev_d_wu, 64, helper_vvv, do_vmaddwev_u)
+DO_HELPER_VVV(vmaddwev_q_du, 128, helper_vvv, do_vmaddwev_u)
+DO_HELPER_VVV(vmaddwod_h_bu, 16, helper_vvv, do_vmaddwod_u)
+DO_HELPER_VVV(vmaddwod_w_hu, 32, helper_vvv, do_vmaddwod_u)
+DO_HELPER_VVV(vmaddwod_d_wu, 64, helper_vvv, do_vmaddwod_u)
+DO_HELPER_VVV(vmaddwod_q_du, 128, helper_vvv, do_vmaddwod_u)
+DO_HELPER_VVV(vmaddwev_h_bu_b, 16, helper_vvv, do_vmaddwev_u_s)
+DO_HELPER_VVV(vmaddwev_w_hu_h, 32, helper_vvv, do_vmaddwev_u_s)
+DO_HELPER_VVV(vmaddwev_d_wu_w, 64, helper_vvv, do_vmaddwev_u_s)
+DO_HELPER_VVV(vmaddwev_q_du_d, 128, helper_vvv, do_vmaddwev_u_s)
+DO_HELPER_VVV(vmaddwod_h_bu_b, 16, helper_vvv, do_vmaddwod_u_s)
+DO_HELPER_VVV(vmaddwod_w_hu_h, 32, helper_vvv, do_vmaddwod_u_s)
+DO_HELPER_VVV(vmaddwod_d_wu_w, 64, helper_vvv, do_vmaddwod_u_s)
+DO_HELPER_VVV(vmaddwod_q_du_d, 128, helper_vvv, do_vmaddwod_u_s)
-- 
2.31.1


