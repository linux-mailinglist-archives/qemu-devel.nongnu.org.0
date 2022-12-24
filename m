Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE258655937
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Dec 2022 09:25:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8zjD-0006ZB-LK; Sat, 24 Dec 2022 03:17:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1p8ziR-0006Ci-3T
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 03:17:11 -0500
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1p8ziN-0001go-J8
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 03:17:10 -0500
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8BxVPB3taZjY0kIAA--.18728S3;
 Sat, 24 Dec 2022 16:16:55 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8CxPuRhtaZjuccKAA--.38440S43; 
 Sat, 24 Dec 2022 16:16:54 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org
Subject: [RFC PATCH 41/43] target/loongarch: Implement vilvl vilvh vextrins
 vshuf
Date: Sat, 24 Dec 2022 16:16:31 +0800
Message-Id: <20221224081633.4185445-42-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20221224081633.4185445-1-gaosong@loongson.cn>
References: <20221224081633.4185445-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8CxPuRhtaZjuccKAA--.38440S43
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoW3CFykJrWrGw4xJw4rWw43Awb_yoWkZFy7pF
 s8KryUtrWUJFW0q3ZYqw13Aw1qqFsrKw18ua1fKF4rurW7JFyDZryktrW29F43W395Xryx
 K3W3CryqyF98JaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 be8Fc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4
 AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF
 7I0E14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6x
 kF7I0E14v26r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020E
 x4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E74AGY7Cv6cx26rWlOx8S6xCaFV
 Cjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7VAKI48JMxAIw28IcVCjz48v
 1sIEY20_WwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I
 0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jrv_JF1lIxkGc2Ij64vIr41lIxAI
 cVC0I7IYx2IY67AKxVWDJVCq3wCI42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMIIF0x
 vE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWxJVW8Jr1lIxAIcVC2z280
 aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7xRE6wZ7UUUUU==
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
- VILV{L/H}.{B/H/W/D};
- VSHUF.{B/H/W/D};
- VSHUF4I.{B/H/W/D};
- VPERMI.W;
- VEXTRINS.{B/H/W/D}.

Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 target/loongarch/disas.c                    |  25 +++
 target/loongarch/helper.h                   |  25 +++
 target/loongarch/insn_trans/trans_lsx.c.inc |  25 +++
 target/loongarch/insns.decode               |  25 +++
 target/loongarch/lsx_helper.c               | 202 ++++++++++++++++++++
 5 files changed, 302 insertions(+)

diff --git a/target/loongarch/disas.c b/target/loongarch/disas.c
index fd87f7fbe1..ee92029007 100644
--- a/target/loongarch/disas.c
+++ b/target/loongarch/disas.c
@@ -1600,3 +1600,28 @@ INSN_LSX(vpickod_b,        vvv)
 INSN_LSX(vpickod_h,        vvv)
 INSN_LSX(vpickod_w,        vvv)
 INSN_LSX(vpickod_d,        vvv)
+
+INSN_LSX(vilvl_b,          vvv)
+INSN_LSX(vilvl_h,          vvv)
+INSN_LSX(vilvl_w,          vvv)
+INSN_LSX(vilvl_d,          vvv)
+INSN_LSX(vilvh_b,          vvv)
+INSN_LSX(vilvh_h,          vvv)
+INSN_LSX(vilvh_w,          vvv)
+INSN_LSX(vilvh_d,          vvv)
+
+INSN_LSX(vshuf_b,          vvvv)
+INSN_LSX(vshuf_h,          vvv)
+INSN_LSX(vshuf_w,          vvv)
+INSN_LSX(vshuf_d,          vvv)
+INSN_LSX(vshuf4i_b,        vv_i)
+INSN_LSX(vshuf4i_h,        vv_i)
+INSN_LSX(vshuf4i_w,        vv_i)
+INSN_LSX(vshuf4i_d,        vv_i)
+
+INSN_LSX(vpermi_w,         vv_i)
+
+INSN_LSX(vextrins_d,       vv_i)
+INSN_LSX(vextrins_w,       vv_i)
+INSN_LSX(vextrins_h,       vv_i)
+INSN_LSX(vextrins_b,       vv_i)
diff --git a/target/loongarch/helper.h b/target/loongarch/helper.h
index dfe3eb925f..b0fb82c60e 100644
--- a/target/loongarch/helper.h
+++ b/target/loongarch/helper.h
@@ -839,3 +839,28 @@ DEF_HELPER_4(vpickod_b, void, env, i32, i32, i32)
 DEF_HELPER_4(vpickod_h, void, env, i32, i32, i32)
 DEF_HELPER_4(vpickod_w, void, env, i32, i32, i32)
 DEF_HELPER_4(vpickod_d, void, env, i32, i32, i32)
+
+DEF_HELPER_4(vilvl_b, void, env, i32, i32, i32)
+DEF_HELPER_4(vilvl_h, void, env, i32, i32, i32)
+DEF_HELPER_4(vilvl_w, void, env, i32, i32, i32)
+DEF_HELPER_4(vilvl_d, void, env, i32, i32, i32)
+DEF_HELPER_4(vilvh_b, void, env, i32, i32, i32)
+DEF_HELPER_4(vilvh_h, void, env, i32, i32, i32)
+DEF_HELPER_4(vilvh_w, void, env, i32, i32, i32)
+DEF_HELPER_4(vilvh_d, void, env, i32, i32, i32)
+
+DEF_HELPER_5(vshuf_b, void, env, i32, i32, i32, i32)
+DEF_HELPER_4(vshuf_h, void, env, i32, i32, i32)
+DEF_HELPER_4(vshuf_w, void, env, i32, i32, i32)
+DEF_HELPER_4(vshuf_d, void, env, i32, i32, i32)
+DEF_HELPER_4(vshuf4i_b, void, env, i32, i32, i32)
+DEF_HELPER_4(vshuf4i_h, void, env, i32, i32, i32)
+DEF_HELPER_4(vshuf4i_w, void, env, i32, i32, i32)
+DEF_HELPER_4(vshuf4i_d, void, env, i32, i32, i32)
+
+DEF_HELPER_4(vpermi_w, void, env, i32, i32, i32)
+
+DEF_HELPER_4(vextrins_b, void, env, i32, i32, i32)
+DEF_HELPER_4(vextrins_h, void, env, i32, i32, i32)
+DEF_HELPER_4(vextrins_w, void, env, i32, i32, i32)
+DEF_HELPER_4(vextrins_d, void, env, i32, i32, i32)
diff --git a/target/loongarch/insn_trans/trans_lsx.c.inc b/target/loongarch/insn_trans/trans_lsx.c.inc
index 0c74811bc4..b289354dc3 100644
--- a/target/loongarch/insn_trans/trans_lsx.c.inc
+++ b/target/loongarch/insn_trans/trans_lsx.c.inc
@@ -848,3 +848,28 @@ TRANS(vpickod_b, gen_vvv, gen_helper_vpickod_b)
 TRANS(vpickod_h, gen_vvv, gen_helper_vpickod_h)
 TRANS(vpickod_w, gen_vvv, gen_helper_vpickod_w)
 TRANS(vpickod_d, gen_vvv, gen_helper_vpickod_d)
+
+TRANS(vilvl_b, gen_vvv, gen_helper_vilvl_b)
+TRANS(vilvl_h, gen_vvv, gen_helper_vilvl_h)
+TRANS(vilvl_w, gen_vvv, gen_helper_vilvl_w)
+TRANS(vilvl_d, gen_vvv, gen_helper_vilvl_d)
+TRANS(vilvh_b, gen_vvv, gen_helper_vilvh_b)
+TRANS(vilvh_h, gen_vvv, gen_helper_vilvh_h)
+TRANS(vilvh_w, gen_vvv, gen_helper_vilvh_w)
+TRANS(vilvh_d, gen_vvv, gen_helper_vilvh_d)
+
+TRANS(vshuf_b, gen_vvvv, gen_helper_vshuf_b)
+TRANS(vshuf_h, gen_vvv, gen_helper_vshuf_h)
+TRANS(vshuf_w, gen_vvv, gen_helper_vshuf_w)
+TRANS(vshuf_d, gen_vvv, gen_helper_vshuf_d)
+TRANS(vshuf4i_b, gen_vv_i, gen_helper_vshuf4i_b)
+TRANS(vshuf4i_h, gen_vv_i, gen_helper_vshuf4i_h)
+TRANS(vshuf4i_w, gen_vv_i, gen_helper_vshuf4i_w)
+TRANS(vshuf4i_d, gen_vv_i, gen_helper_vshuf4i_d)
+
+TRANS(vpermi_w, gen_vv_i, gen_helper_vpermi_w)
+
+TRANS(vextrins_b, gen_vv_i, gen_helper_vextrins_b)
+TRANS(vextrins_h, gen_vv_i, gen_helper_vextrins_h)
+TRANS(vextrins_w, gen_vv_i, gen_helper_vextrins_w)
+TRANS(vextrins_d, gen_vv_i, gen_helper_vextrins_d)
diff --git a/target/loongarch/insns.decode b/target/loongarch/insns.decode
index 7db72bd358..67bce30d00 100644
--- a/target/loongarch/insns.decode
+++ b/target/loongarch/insns.decode
@@ -1230,3 +1230,28 @@ vpickod_b        0111 00010010 00000 ..... ..... .....    @vvv
 vpickod_h        0111 00010010 00001 ..... ..... .....    @vvv
 vpickod_w        0111 00010010 00010 ..... ..... .....    @vvv
 vpickod_d        0111 00010010 00011 ..... ..... .....    @vvv
+
+vilvl_b          0111 00010001 10100 ..... ..... .....    @vvv
+vilvl_h          0111 00010001 10101 ..... ..... .....    @vvv
+vilvl_w          0111 00010001 10110 ..... ..... .....    @vvv
+vilvl_d          0111 00010001 10111 ..... ..... .....    @vvv
+vilvh_b          0111 00010001 11000 ..... ..... .....    @vvv
+vilvh_h          0111 00010001 11001 ..... ..... .....    @vvv
+vilvh_w          0111 00010001 11010 ..... ..... .....    @vvv
+vilvh_d          0111 00010001 11011 ..... ..... .....    @vvv
+
+vshuf_b          0000 11010101 ..... ..... ..... .....    @vvvv
+vshuf_h          0111 00010111 10101 ..... ..... .....    @vvv
+vshuf_w          0111 00010111 10110 ..... ..... .....    @vvv
+vshuf_d          0111 00010111 10111 ..... ..... .....    @vvv
+vshuf4i_b        0111 00111001 00 ........ ..... .....    @vv_ui8
+vshuf4i_h        0111 00111001 01 ........ ..... .....    @vv_ui8
+vshuf4i_w        0111 00111001 10 ........ ..... .....    @vv_ui8
+vshuf4i_d        0111 00111001 11 ........ ..... .....    @vv_ui8
+
+vpermi_w         0111 00111110 01 ........ ..... .....    @vv_ui8
+
+vextrins_d       0111 00111000 00 ........ ..... .....    @vv_ui8
+vextrins_w       0111 00111000 01 ........ ..... .....    @vv_ui8
+vextrins_h       0111 00111000 10 ........ ..... .....    @vv_ui8
+vextrins_b       0111 00111000 11 ........ ..... .....    @vv_ui8
diff --git a/target/loongarch/lsx_helper.c b/target/loongarch/lsx_helper.c
index b0017a7ab8..3d478f96ce 100644
--- a/target/loongarch/lsx_helper.c
+++ b/target/loongarch/lsx_helper.c
@@ -4771,3 +4771,205 @@ DO_HELPER_VVV(vpickod_b, 8, helper_vvv_c, do_vpickod)
 DO_HELPER_VVV(vpickod_h, 16, helper_vvv_c, do_vpickod)
 DO_HELPER_VVV(vpickod_w, 32, helper_vvv_c, do_vpickod)
 DO_HELPER_VVV(vpickod_d, 64, helper_vvv_c, do_vpickod)
+
+static void do_vilvl(vec_t *Vd, vec_t *Vj, vec_t *Vk, int bit, int n)
+{
+    switch (bit) {
+    case 8:
+        Vd->B[2 * n + 1] = Vj->B[n];
+        Vd->B[2 * n] = Vk->B[n];
+        break;
+    case 16:
+        Vd->H[2 * n + 1] = Vj->H[n];
+        Vd->H[2 * n] = Vk->H[n];
+        break;
+    case 32:
+        Vd->W[2 * n + 1] = Vj->W[n];
+        Vd->W[2 * n] = Vk->W[n];
+        break;
+    case 64:
+        Vd->D[2 * n + 1] = Vj->D[n];
+        Vd->D[2 * n] = Vk->D[n];
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static void do_vilvh(vec_t *Vd, vec_t *Vj, vec_t *Vk, int bit, int n)
+{
+    switch (bit) {
+    case 8:
+        Vd->B[2 * n + 1] = Vj->B[n + 8];
+        Vd->B[2 * n] = Vk->B[n + 8];
+        break;
+    case 16:
+        Vd->H[2 * n + 1] = Vj->H[n + 4];
+        Vd->H[2 * n] = Vk->H[n + 4];
+        break;
+    case 32:
+        Vd->W[2 * n + 1] = Vj->W[n + 2];
+        Vd->W[2 * n] = Vk->W[n + 2];
+        break;
+    case 64:
+        Vd->D[2 * n + 1] = Vj->D[n + 1];
+        Vd->D[2 * n] = Vk->D[n + 1];
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+DO_HELPER_VVV(vilvl_b, 8, helper_vvv_c, do_vilvl)
+DO_HELPER_VVV(vilvl_h, 16, helper_vvv_c, do_vilvl)
+DO_HELPER_VVV(vilvl_w, 32, helper_vvv_c, do_vilvl)
+DO_HELPER_VVV(vilvl_d, 64, helper_vvv_c, do_vilvl)
+DO_HELPER_VVV(vilvh_b, 8, helper_vvv_c, do_vilvh)
+DO_HELPER_VVV(vilvh_h, 16, helper_vvv_c, do_vilvh)
+DO_HELPER_VVV(vilvh_w, 32, helper_vvv_c, do_vilvh)
+DO_HELPER_VVV(vilvh_d, 64, helper_vvv_c, do_vilvh)
+
+void helper_vshuf_b(CPULoongArchState *env,
+                    uint32_t vd, uint32_t vj, uint32_t vk, uint32_t va)
+{
+    vec_t *Vd = &(env->fpr[vd].vec);
+    vec_t *Vj = &(env->fpr[vj].vec);
+    vec_t *Vk = &(env->fpr[vk].vec);
+    vec_t *Va = &(env->fpr[va].vec);
+
+    uint32_t i;
+    uint32_t max = LSX_LEN/8;
+    vec_t temp;
+    temp.D[0] = Vd->D[0];
+    temp.D[1] = Vd->D[1];
+    for (i = 0; i < max ; i++) {
+        uint32_t k = (Va->B[i] & 0x3f) % (2 *max);
+        temp.B[i] = (Va->B[i] & 0xc0) ? 0 : k < max ? Vk->B[k] : Vj->B[k - max];
+    }
+    Vd->D[0] = temp.D[0];
+    Vd->D[1] = temp.D[1];
+}
+
+static void do_vshuf(vec_t *Vd, vec_t *Vj, vec_t *Vk, int bit, int n)
+{
+    uint32_t i;
+    uint32_t max = LSX_LEN/bit;
+    switch (bit) {
+    case 16:
+        i = (Vd->H[n] & 0x1f) % (2 *max);
+        Vd->H[n] = (Vd->H[n] & 0xc000) ? 0 : i < max ? Vk->H[i] : Vj->H[i - max];
+        break;
+    case 32:
+        i = (Vd->W[n] & 0xf) % (2 *max);
+        Vd->W[n] = (Vd->W[n] & 0xc0000000) ? 0 : i < max ? Vk->W[i] : Vj->W[i - max];
+        break;
+    case 64:
+        i = (Vd->D[n] & 0x7) % (2* max);
+        Vd->D[n] = (Vd->D[n] & 0xc000000000000000) ? 0 :i < max ? Vk->D[i] : Vj->D[i - max];
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+DO_HELPER_VVV(vshuf_h, 16, helper_vvv, do_vshuf)
+DO_HELPER_VVV(vshuf_w, 32, helper_vvv, do_vshuf)
+DO_HELPER_VVV(vshuf_d, 64, helper_vvv, do_vshuf)
+
+#define SHF_POS(i, imm) (((i) & 0xfc) + (((imm) >> (2 * ((i) & 0x03))) & 0x03))
+
+static void do_vshuf4i(vec_t *Vd, vec_t *Vj, uint32_t imm, int bit, int n)
+{
+    switch (bit) {
+    case 8:
+        Vd->B[n] = Vj->B[SHF_POS(n, imm)];
+        break;
+    case 16:
+        Vd->H[n] = Vj->H[SHF_POS(n, imm)];
+        break;
+    case 32:
+        Vd->W[n] = Vj->W[SHF_POS(n, imm)];
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+void helper_vshuf4i_d(CPULoongArchState *env, uint32_t vd, uint32_t vj, uint32_t imm)
+{
+    int i;
+    vec_t *Vd = &(env->fpr[vd].vec);
+    vec_t *Vj = &(env->fpr[vj].vec);
+
+    vec_t temp;
+    temp.D[0] = 0;
+    temp.D[1] = 0;
+    for (i = 0; i < 2; i++) {
+        temp.D[i] = (((imm & 0x03) << (2 *i)) == 0x00) ? Vd->D[0] :
+                    (((imm & 0x03) << (2 *i)) == 0x01) ? Vd->D[1] :
+                    (((imm & 0x03) << (2 *i)) == 0x02) ? Vj->D[0] : Vj->D[1];
+    }
+    Vd->D[0] = temp.D[0];
+    Vd->D[1] = temp.D[1];
+}
+
+DO_HELPER_VV_I(vshuf4i_b, 8, helper_vv_i_c, do_vshuf4i)
+DO_HELPER_VV_I(vshuf4i_h, 16, helper_vv_i_c, do_vshuf4i)
+DO_HELPER_VV_I(vshuf4i_w, 32, helper_vv_i_c, do_vshuf4i)
+
+void helper_vpermi_w(CPULoongArchState *env, uint32_t vd,
+                         uint32_t vj, uint32_t imm)
+{
+    vec_t *Vd = &(env->fpr[vd].vec);
+    vec_t *Vj = &(env->fpr[vj].vec);
+
+    Vd->W[0] = Vj->W[imm & 0x3];
+    Vd->W[1] = Vj->W[(imm >> 2) & 0x3];
+    Vd->W[2] = Vj->W[(imm >> 4) & 0x3];
+    Vd->W[3] = Vj->W[(imm >> 6) & 0x3];
+}
+
+static void helper_vextrins(CPULoongArchState *env,
+                            uint32_t vd, uint32_t vj, uint32_t imm, int bit,
+                            void (*func)(vec_t*, vec_t*, uint32_t, int))
+
+{
+    vec_t *Vd = &(env->fpr[vd].vec);
+    vec_t *Vj = &(env->fpr[vj].vec);
+
+    func(Vd, Vj, imm, bit);
+}
+
+static void do_vextrins(vec_t *Vd, vec_t *Vj, uint32_t imm, int bit)
+{
+    int ins, extr;
+    switch (bit) {
+    case 8:
+       ins = (imm >> 4) & 0xf;
+       extr = imm & 0xf;
+       Vd->B[ins] = Vj->B[extr];
+       break;
+    case 16:
+       ins = (imm >> 4) & 0x7;
+       extr = imm & 0x7;
+       Vd->H[ins] = Vj->H[extr];
+       break;
+    case 32:
+       ins = (imm >> 4) & 0x3;
+       extr = imm & 0x3;
+       Vd->W[ins] = Vj->W[extr];
+       break;
+    case 64:
+       ins = (imm >> 4) & 0x1;
+       extr = imm & 0x1;
+       Vd->D[ins] = Vj->D[extr];
+       break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+DO_HELPER_VV_I(vextrins_b, 8, helper_vextrins, do_vextrins)
+DO_HELPER_VV_I(vextrins_h, 16, helper_vextrins, do_vextrins)
+DO_HELPER_VV_I(vextrins_w, 32, helper_vextrins, do_vextrins)
+DO_HELPER_VV_I(vextrins_d, 64, helper_vextrins, do_vextrins)
-- 
2.31.1


