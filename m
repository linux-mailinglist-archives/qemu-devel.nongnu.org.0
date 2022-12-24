Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD72B65592F
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Dec 2022 09:22:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8zik-0006Kn-66; Sat, 24 Dec 2022 03:17:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1p8ziC-00068R-N5
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 03:17:03 -0500
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1p8zi9-0000k0-MV
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 03:16:56 -0500
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8AxjutptaZjLkkIAA--.18769S3;
 Sat, 24 Dec 2022 16:16:41 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8CxPuRhtaZjuccKAA--.38440S16; 
 Sat, 24 Dec 2022 16:16:39 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org
Subject: [RFC PATCH 14/43] target/loongarch: Implement vmax/vmin
Date: Sat, 24 Dec 2022 16:16:04 +0800
Message-Id: <20221224081633.4185445-15-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20221224081633.4185445-1-gaosong@loongson.cn>
References: <20221224081633.4185445-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8CxPuRhtaZjuccKAA--.38440S16
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvAXoW3ZF18XrWxXr18Kr15uF4Uurg_yoW8GFWkZo
 WrJw1rGw1kKr1xt3srK3WUZF97K3yqv3yDGF9093WUGFZ5Ar1ayFy5Kwn5A3ySyrWFqr13
 CwsxJF45t3W5Xr1kn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXasCq-sGcSsGvf
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
- VMAX[I].{B/H/W/D}[U];
- VMIN[I].{B/H/W/D}[U].

Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 target/loongarch/disas.c                    |  33 +++
 target/loongarch/helper.h                   |  34 +++
 target/loongarch/insn_trans/trans_lsx.c.inc |  33 +++
 target/loongarch/insns.decode               |  35 ++++
 target/loongarch/lsx_helper.c               | 219 ++++++++++++++++++++
 5 files changed, 354 insertions(+)

diff --git a/target/loongarch/disas.c b/target/loongarch/disas.c
index ff5d9e0e5b..2e86c48f4d 100644
--- a/target/loongarch/disas.c
+++ b/target/loongarch/disas.c
@@ -910,3 +910,36 @@ INSN_LSX(vadda_b,          vvv)
 INSN_LSX(vadda_h,          vvv)
 INSN_LSX(vadda_w,          vvv)
 INSN_LSX(vadda_d,          vvv)
+
+INSN_LSX(vmax_b,           vvv)
+INSN_LSX(vmax_h,           vvv)
+INSN_LSX(vmax_w,           vvv)
+INSN_LSX(vmax_d,           vvv)
+INSN_LSX(vmin_b,           vvv)
+INSN_LSX(vmin_h,           vvv)
+INSN_LSX(vmin_w,           vvv)
+INSN_LSX(vmin_d,           vvv)
+INSN_LSX(vmax_bu,          vvv)
+INSN_LSX(vmax_hu,          vvv)
+INSN_LSX(vmax_wu,          vvv)
+INSN_LSX(vmax_du,          vvv)
+INSN_LSX(vmin_bu,          vvv)
+INSN_LSX(vmin_hu,          vvv)
+INSN_LSX(vmin_wu,          vvv)
+INSN_LSX(vmin_du,          vvv)
+INSN_LSX(vmaxi_b,          vv_i)
+INSN_LSX(vmaxi_h,          vv_i)
+INSN_LSX(vmaxi_w,          vv_i)
+INSN_LSX(vmaxi_d,          vv_i)
+INSN_LSX(vmini_b,          vv_i)
+INSN_LSX(vmini_h,          vv_i)
+INSN_LSX(vmini_w,          vv_i)
+INSN_LSX(vmini_d,          vv_i)
+INSN_LSX(vmaxi_bu,         vv_i)
+INSN_LSX(vmaxi_hu,         vv_i)
+INSN_LSX(vmaxi_wu,         vv_i)
+INSN_LSX(vmaxi_du,         vv_i)
+INSN_LSX(vmini_bu,         vv_i)
+INSN_LSX(vmini_hu,         vv_i)
+INSN_LSX(vmini_wu,         vv_i)
+INSN_LSX(vmini_du,         vv_i)
diff --git a/target/loongarch/helper.h b/target/loongarch/helper.h
index 85321c8874..04afc93dc1 100644
--- a/target/loongarch/helper.h
+++ b/target/loongarch/helper.h
@@ -264,3 +264,37 @@ DEF_HELPER_4(vadda_b, void, env, i32, i32, i32)
 DEF_HELPER_4(vadda_h, void, env, i32, i32, i32)
 DEF_HELPER_4(vadda_w, void, env, i32, i32, i32)
 DEF_HELPER_4(vadda_d, void, env, i32, i32, i32)
+
+DEF_HELPER_4(vmax_b, void, env, i32, i32, i32)
+DEF_HELPER_4(vmax_h, void, env, i32, i32, i32)
+DEF_HELPER_4(vmax_w, void, env, i32, i32, i32)
+DEF_HELPER_4(vmax_d, void, env, i32, i32, i32)
+DEF_HELPER_4(vmaxi_b, void, env, i32, i32, i32)
+DEF_HELPER_4(vmaxi_h, void, env, i32, i32, i32)
+DEF_HELPER_4(vmaxi_w, void, env, i32, i32, i32)
+DEF_HELPER_4(vmaxi_d, void, env, i32, i32, i32)
+DEF_HELPER_4(vmax_bu, void, env, i32, i32, i32)
+DEF_HELPER_4(vmax_hu, void, env, i32, i32, i32)
+DEF_HELPER_4(vmax_wu, void, env, i32, i32, i32)
+DEF_HELPER_4(vmax_du, void, env, i32, i32, i32)
+DEF_HELPER_4(vmaxi_bu, void, env, i32, i32, i32)
+DEF_HELPER_4(vmaxi_hu, void, env, i32, i32, i32)
+DEF_HELPER_4(vmaxi_wu, void, env, i32, i32, i32)
+DEF_HELPER_4(vmaxi_du, void, env, i32, i32, i32)
+
+DEF_HELPER_4(vmin_b, void, env, i32, i32, i32)
+DEF_HELPER_4(vmin_h, void, env, i32, i32, i32)
+DEF_HELPER_4(vmin_w, void, env, i32, i32, i32)
+DEF_HELPER_4(vmin_d, void, env, i32, i32, i32)
+DEF_HELPER_4(vmini_b, void, env, i32, i32, i32)
+DEF_HELPER_4(vmini_h, void, env, i32, i32, i32)
+DEF_HELPER_4(vmini_w, void, env, i32, i32, i32)
+DEF_HELPER_4(vmini_d, void, env, i32, i32, i32)
+DEF_HELPER_4(vmin_bu, void, env, i32, i32, i32)
+DEF_HELPER_4(vmin_hu, void, env, i32, i32 ,i32)
+DEF_HELPER_4(vmin_wu, void, env, i32, i32, i32)
+DEF_HELPER_4(vmin_du, void, env, i32, i32, i32)
+DEF_HELPER_4(vmini_bu, void, env, i32, i32, i32)
+DEF_HELPER_4(vmini_hu, void, env, i32, i32, i32)
+DEF_HELPER_4(vmini_wu, void, env, i32, i32, i32)
+DEF_HELPER_4(vmini_du, void, env, i32, i32, i32)
diff --git a/target/loongarch/insn_trans/trans_lsx.c.inc b/target/loongarch/insn_trans/trans_lsx.c.inc
index a90fc44ba7..8bece985f1 100644
--- a/target/loongarch/insn_trans/trans_lsx.c.inc
+++ b/target/loongarch/insn_trans/trans_lsx.c.inc
@@ -182,3 +182,36 @@ TRANS(vadda_b, gen_vvv, gen_helper_vadda_b)
 TRANS(vadda_h, gen_vvv, gen_helper_vadda_h)
 TRANS(vadda_w, gen_vvv, gen_helper_vadda_w)
 TRANS(vadda_d, gen_vvv, gen_helper_vadda_d)
+
+TRANS(vmax_b, gen_vvv, gen_helper_vmax_b)
+TRANS(vmax_h, gen_vvv, gen_helper_vmax_h)
+TRANS(vmax_w, gen_vvv, gen_helper_vmax_w)
+TRANS(vmax_d, gen_vvv, gen_helper_vmax_d)
+TRANS(vmaxi_b, gen_vv_i, gen_helper_vmaxi_b)
+TRANS(vmaxi_h, gen_vv_i, gen_helper_vmaxi_h)
+TRANS(vmaxi_w, gen_vv_i, gen_helper_vmaxi_w)
+TRANS(vmaxi_d, gen_vv_i, gen_helper_vmaxi_d)
+TRANS(vmax_bu, gen_vvv, gen_helper_vmax_bu)
+TRANS(vmax_hu, gen_vvv, gen_helper_vmax_hu)
+TRANS(vmax_wu, gen_vvv, gen_helper_vmax_wu)
+TRANS(vmax_du, gen_vvv, gen_helper_vmax_du)
+TRANS(vmaxi_bu, gen_vv_i, gen_helper_vmaxi_bu)
+TRANS(vmaxi_hu, gen_vv_i, gen_helper_vmaxi_hu)
+TRANS(vmaxi_wu, gen_vv_i, gen_helper_vmaxi_wu)
+TRANS(vmaxi_du, gen_vv_i, gen_helper_vmaxi_du)
+TRANS(vmin_b, gen_vvv, gen_helper_vmin_b)
+TRANS(vmin_h, gen_vvv, gen_helper_vmin_h)
+TRANS(vmin_w, gen_vvv, gen_helper_vmin_w)
+TRANS(vmin_d, gen_vvv, gen_helper_vmin_d)
+TRANS(vmini_b, gen_vv_i, gen_helper_vmini_b)
+TRANS(vmini_h, gen_vv_i, gen_helper_vmini_h)
+TRANS(vmini_w, gen_vv_i, gen_helper_vmini_w)
+TRANS(vmini_d, gen_vv_i, gen_helper_vmini_d)
+TRANS(vmin_bu, gen_vvv, gen_helper_vmin_bu)
+TRANS(vmin_hu, gen_vvv, gen_helper_vmin_hu)
+TRANS(vmin_wu, gen_vvv, gen_helper_vmin_wu)
+TRANS(vmin_du, gen_vvv, gen_helper_vmin_du)
+TRANS(vmini_bu, gen_vv_i, gen_helper_vmini_bu)
+TRANS(vmini_hu, gen_vv_i, gen_helper_vmini_hu)
+TRANS(vmini_wu, gen_vv_i, gen_helper_vmini_wu)
+TRANS(vmini_du, gen_vv_i, gen_helper_vmini_du)
diff --git a/target/loongarch/insns.decode b/target/loongarch/insns.decode
index 9529ffe970..c5d8859db2 100644
--- a/target/loongarch/insns.decode
+++ b/target/loongarch/insns.decode
@@ -499,6 +499,7 @@ dbcl             0000 00000010 10101 ...............      @i15
 @vv               .... ........ ..... ..... vj:5 vd:5    &vv
 @vvv               .... ........ ..... vk:5 vj:5 vd:5    &vvv
 @vv_ui5           .... ........ ..... imm:5 vj:5 vd:5    &vv_i
+@vv_i5           .... ........ ..... imm:s5 vj:5 vd:5    &vv_i
 
 vadd_b           0111 00000000 10100 ..... ..... .....    @vvv
 vadd_h           0111 00000000 10101 ..... ..... .....    @vvv
@@ -632,3 +633,37 @@ vadda_b          0111 00000101 11000 ..... ..... .....    @vvv
 vadda_h          0111 00000101 11001 ..... ..... .....    @vvv
 vadda_w          0111 00000101 11010 ..... ..... .....    @vvv
 vadda_d          0111 00000101 11011 ..... ..... .....    @vvv
+
+vmax_b           0111 00000111 00000 ..... ..... .....    @vvv
+vmax_h           0111 00000111 00001 ..... ..... .....    @vvv
+vmax_w           0111 00000111 00010 ..... ..... .....    @vvv
+vmax_d           0111 00000111 00011 ..... ..... .....    @vvv
+vmaxi_b          0111 00101001 00000 ..... ..... .....    @vv_i5
+vmaxi_h          0111 00101001 00001 ..... ..... .....    @vv_i5
+vmaxi_w          0111 00101001 00010 ..... ..... .....    @vv_i5
+vmaxi_d          0111 00101001 00011 ..... ..... .....    @vv_i5
+vmax_bu          0111 00000111 01000 ..... ..... .....    @vvv
+vmax_hu          0111 00000111 01001 ..... ..... .....    @vvv
+vmax_wu          0111 00000111 01010 ..... ..... .....    @vvv
+vmax_du          0111 00000111 01011 ..... ..... .....    @vvv
+vmaxi_bu         0111 00101001 01000 ..... ..... .....    @vv_ui5
+vmaxi_hu         0111 00101001 01001 ..... ..... .....    @vv_ui5
+vmaxi_wu         0111 00101001 01010 ..... ..... .....    @vv_ui5
+vmaxi_du         0111 00101001 01011 ..... ..... .....    @vv_ui5
+
+vmin_b           0111 00000111 00100 ..... ..... .....    @vvv
+vmin_h           0111 00000111 00101 ..... ..... .....    @vvv
+vmin_w           0111 00000111 00110 ..... ..... .....    @vvv
+vmin_d           0111 00000111 00111 ..... ..... .....    @vvv
+vmini_b          0111 00101001 00100 ..... ..... .....    @vv_i5
+vmini_h          0111 00101001 00101 ..... ..... .....    @vv_i5
+vmini_w          0111 00101001 00110 ..... ..... .....    @vv_i5
+vmini_d          0111 00101001 00111 ..... ..... .....    @vv_i5
+vmin_bu          0111 00000111 01100 ..... ..... .....    @vvv
+vmin_hu          0111 00000111 01101 ..... ..... .....    @vvv
+vmin_wu          0111 00000111 01110 ..... ..... .....    @vvv
+vmin_du          0111 00000111 01111 ..... ..... .....    @vvv
+vmini_bu         0111 00101001 01100 ..... ..... .....    @vv_ui5
+vmini_hu         0111 00101001 01101 ..... ..... .....    @vv_ui5
+vmini_wu         0111 00101001 01110 ..... ..... .....    @vv_ui5
+vmini_du         0111 00101001 01111 ..... ..... .....    @vv_ui5
diff --git a/target/loongarch/lsx_helper.c b/target/loongarch/lsx_helper.c
index a9a0b01fd7..5bccb3111b 100644
--- a/target/loongarch/lsx_helper.c
+++ b/target/loongarch/lsx_helper.c
@@ -936,3 +936,222 @@ DO_HELPER_VVV(vadda_b, 8, helper_vvv, do_vadda_s)
 DO_HELPER_VVV(vadda_h, 16, helper_vvv, do_vadda_s)
 DO_HELPER_VVV(vadda_w, 32, helper_vvv, do_vadda_s)
 DO_HELPER_VVV(vadda_d, 64, helper_vvv, do_vadda_s)
+
+static int64_t vmax_s(int64_t s1, int64_t s2)
+{
+    return s1 > s2 ? s1 : s2;
+}
+
+static void do_vmax_s(vec_t *Vd, vec_t *Vj, vec_t *Vk, int bit, int n)
+{
+    switch (bit) {
+    case 8:
+        Vd->B[n] = vmax_s(Vj->B[n], Vk->B[n]);
+        break;
+    case 16:
+        Vd->H[n] = vmax_s(Vj->H[n], Vk->H[n]);
+        break;
+    case 32:
+        Vd->W[n] = vmax_s(Vj->W[n], Vk->W[n]);
+        break;
+    case 64:
+        Vd->D[n] = vmax_s(Vj->D[n], Vk->D[n]);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static void do_vmaxi_s(vec_t *Vd, vec_t *Vj, uint32_t imm, int bit , int n)
+{
+    switch (bit) {
+    case 8:
+        Vd->B[n] = vmax_s(Vj->B[n], imm);
+        break;
+    case 16:
+        Vd->H[n] = vmax_s(Vj->H[n], imm);
+        break;
+    case 32:
+        Vd->W[n] = vmax_s(Vj->W[n], imm);
+        break;
+    case 64:
+        Vd->D[n] = vmax_s(Vj->D[n], imm);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static uint64_t vmax_u(int64_t s1, int64_t s2, int bit)
+{
+    uint64_t umax = MAKE_64BIT_MASK(0, bit);
+    uint64_t u1 = s1 & umax;
+    uint64_t u2 = s2 & umax;
+    return u1 > u2 ? u1 : u2;
+}
+
+static void do_vmax_u(vec_t *Vd, vec_t *Vj, vec_t *Vk, int bit, int n)
+{
+    switch (bit) {
+    case 8:
+        Vd->B[n] = vmax_u(Vj->B[n], Vk->B[n], bit);
+        break;
+    case 16:
+        Vd->H[n] = vmax_u(Vj->H[n], Vk->H[n], bit);
+        break;
+    case 32:
+        Vd->W[n] = vmax_u(Vj->W[n], Vk->W[n], bit);
+        break;
+    case 64:
+        Vd->D[n] = vmax_u(Vj->D[n], Vk->D[n], bit);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static void do_vmaxi_u(vec_t *Vd, vec_t *Vj, uint32_t imm , int bit, int n)
+{
+    switch (bit) {
+    case 8:
+        Vd->B[n] = vmax_u(Vj->B[n], imm, bit);
+        break;
+    case 16:
+        Vd->H[n] = vmax_u(Vj->H[n], imm, bit);
+        break;
+    case 32:
+        Vd->W[n] = vmax_u(Vj->W[n], imm, bit);
+        break;
+    case 64:
+        Vd->D[n] = vmax_u(Vj->D[n], imm, bit);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static int64_t vmin_s(int64_t s1, int64_t s2)
+{
+    return s1 < s2 ? s1 : s2;
+}
+
+static void do_vmin_s(vec_t *Vd, vec_t *Vj, vec_t *Vk, int bit, int n)
+{
+    switch (bit) {
+    case 8:
+        Vd->B[n] = vmin_s(Vj->B[n], Vk->B[n]);
+        break;
+    case 16:
+        Vd->H[n] = vmin_s(Vj->H[n], Vk->H[n]);
+        break;
+    case 32:
+        Vd->W[n] = vmin_s(Vj->W[n], Vk->W[n]);
+        break;
+    case 64:
+        Vd->D[n] = vmin_s(Vj->D[n], Vk->D[n]);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static void do_vmini_s(vec_t *Vd, vec_t *Vj, uint32_t imm, int bit, int n)
+{
+    switch (bit) {
+    case 8:
+        Vd->B[n] = vmin_s(Vj->B[n], imm);
+        break;
+    case 16:
+        Vd->H[n] = vmin_s(Vj->H[n], imm);
+        break;
+    case 32:
+        Vd->W[n] = vmin_s(Vj->W[n], imm);
+        break;
+    case 64:
+        Vd->D[n] = vmin_s(Vj->D[n], imm);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static uint64_t vmin_u(int64_t s1, int64_t s2, int bit)
+{
+    uint64_t umax = MAKE_64BIT_MASK(0, bit);
+    uint64_t u1 = s1 & umax;
+    uint64_t u2 = s2 & umax;
+    return u1 < u2 ? u1 : u2;
+}
+
+static void do_vmin_u(vec_t *Vd, vec_t *Vj, vec_t *Vk, int bit, int n)
+{
+    switch (bit) {
+    case 8:
+        Vd->B[n] = vmin_u(Vj->B[n], Vk->B[n], bit);
+        break;
+    case 16:
+        Vd->H[n] = vmin_u(Vj->H[n], Vk->H[n], bit);
+        break;
+    case 32:
+        Vd->W[n] = vmin_u(Vj->W[n], Vk->W[n], bit);
+        break;
+    case 64:
+        Vd->D[n] = vmin_u(Vj->D[n], Vk->D[n], bit);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static void do_vmini_u(vec_t *Vd, vec_t *Vj, uint32_t imm, int bit, int n)
+{
+    switch (bit) {
+    case 8:
+        Vd->B[n] = vmin_u(Vj->B[n], imm, bit);
+        break;
+    case 16:
+        Vd->H[n] = vmin_u(Vj->H[n], imm, bit);
+        break;
+    case 32:
+        Vd->W[n] = vmin_u(Vj->W[n], imm, bit);
+        break;
+    case 64:
+        Vd->D[n] = vmin_u(Vj->D[n], imm, bit);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+DO_HELPER_VVV(vmax_b, 8, helper_vvv, do_vmax_s)
+DO_HELPER_VVV(vmax_h, 16, helper_vvv, do_vmax_s)
+DO_HELPER_VVV(vmax_w, 32, helper_vvv, do_vmax_s)
+DO_HELPER_VVV(vmax_d, 64, helper_vvv, do_vmax_s)
+DO_HELPER_VV_I(vmaxi_b, 8, helper_vv_i, do_vmaxi_s)
+DO_HELPER_VV_I(vmaxi_h, 16, helper_vv_i, do_vmaxi_s)
+DO_HELPER_VV_I(vmaxi_w, 32, helper_vv_i, do_vmaxi_s)
+DO_HELPER_VV_I(vmaxi_d, 64, helper_vv_i, do_vmaxi_s)
+DO_HELPER_VVV(vmax_bu, 8, helper_vvv, do_vmax_u)
+DO_HELPER_VVV(vmax_hu, 16, helper_vvv, do_vmax_u)
+DO_HELPER_VVV(vmax_wu, 32, helper_vvv, do_vmax_u)
+DO_HELPER_VVV(vmax_du, 64, helper_vvv, do_vmax_u)
+DO_HELPER_VV_I(vmaxi_bu, 8, helper_vv_i, do_vmaxi_u)
+DO_HELPER_VV_I(vmaxi_hu, 16, helper_vv_i, do_vmaxi_u)
+DO_HELPER_VV_I(vmaxi_wu, 32, helper_vv_i, do_vmaxi_u)
+DO_HELPER_VV_I(vmaxi_du, 64, helper_vv_i, do_vmaxi_u)
+DO_HELPER_VVV(vmin_b, 8, helper_vvv, do_vmin_s)
+DO_HELPER_VVV(vmin_h, 16, helper_vvv, do_vmin_s)
+DO_HELPER_VVV(vmin_w, 32, helper_vvv, do_vmin_s)
+DO_HELPER_VVV(vmin_d, 64, helper_vvv, do_vmin_s)
+DO_HELPER_VV_I(vmini_b, 8, helper_vv_i, do_vmini_s)
+DO_HELPER_VV_I(vmini_h, 16, helper_vv_i, do_vmini_s)
+DO_HELPER_VV_I(vmini_w, 32, helper_vv_i, do_vmini_s)
+DO_HELPER_VV_I(vmini_d, 64, helper_vv_i, do_vmini_s)
+DO_HELPER_VVV(vmin_bu, 8, helper_vvv, do_vmin_u)
+DO_HELPER_VVV(vmin_hu, 16, helper_vvv, do_vmin_u)
+DO_HELPER_VVV(vmin_wu, 32, helper_vvv, do_vmin_u)
+DO_HELPER_VVV(vmin_du, 64, helper_vvv, do_vmin_u)
+DO_HELPER_VV_I(vmini_bu, 8, helper_vv_i, do_vmini_u)
+DO_HELPER_VV_I(vmini_hu, 16, helper_vv_i, do_vmini_u)
+DO_HELPER_VV_I(vmini_wu, 32, helper_vv_i, do_vmini_u)
+DO_HELPER_VV_I(vmini_du, 64, helper_vv_i, do_vmini_u)
-- 
2.31.1


