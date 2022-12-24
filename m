Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A52F655931
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Dec 2022 09:23:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8zjB-0006WM-90; Sat, 24 Dec 2022 03:17:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1p8ziN-00068x-0I
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 03:17:08 -0500
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1p8ziF-00018B-NI
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 03:17:04 -0500
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8BxVPButaZjRUkIAA--.18724S3;
 Sat, 24 Dec 2022 16:16:46 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8CxPuRhtaZjuccKAA--.38440S28; 
 Sat, 24 Dec 2022 16:16:45 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org
Subject: [RFC PATCH 26/43] target/loongarch: Implement vsrln vsran
Date: Sat, 24 Dec 2022 16:16:16 +0800
Message-Id: <20221224081633.4185445-27-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20221224081633.4185445-1-gaosong@loongson.cn>
References: <20221224081633.4185445-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8CxPuRhtaZjuccKAA--.38440S28
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoW3Gr18AF1xCF15tFWxCw43trb_yoWfuF45pr
 4UKryUtr48GFWIq3Wvvwnayw4kXrsrtw18uw4ftr1ruw47JF9IqFykt3y29F48CF9IyFyI
 g3WUWryjyFy5JaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 be8Fc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4
 AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF
 7I0E14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6x
 kF7I0E14v26r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020E
 x4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E74AGY7Cv6cx26rWlOx8S6xCaFV
 Cjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7VAKI48JMxAIw28IcVCjz48v
 1sIEY20_WwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I
 0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jrv_JF1lIxkGc2Ij64vIr41lIxAI
 cVC0I7IYx2IY67AKxVW7JVWDJwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMIIF0x
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
- VSRLN.{B.H/H.W/W.D};
- VSRAN.{B.H/H.W/W.D};
- VSRLNI.{B.H/H.W/W.D/D.Q};
- VSRANI.{B.H/H.W/W.D/D.Q}.

Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 target/loongarch/disas.c                    |  16 +++
 target/loongarch/helper.h                   |  16 +++
 target/loongarch/insn_trans/trans_lsx.c.inc |  16 +++
 target/loongarch/insns.decode               |  17 +++
 target/loongarch/lsx_helper.c               | 134 ++++++++++++++++++++
 5 files changed, 199 insertions(+)

diff --git a/target/loongarch/disas.c b/target/loongarch/disas.c
index 766d934705..e6f4411b43 100644
--- a/target/loongarch/disas.c
+++ b/target/loongarch/disas.c
@@ -1137,3 +1137,19 @@ INSN_LSX(vsrari_b,         vv_i)
 INSN_LSX(vsrari_h,         vv_i)
 INSN_LSX(vsrari_w,         vv_i)
 INSN_LSX(vsrari_d,         vv_i)
+
+INSN_LSX(vsrln_b_h,       vvv)
+INSN_LSX(vsrln_h_w,       vvv)
+INSN_LSX(vsrln_w_d,       vvv)
+INSN_LSX(vsran_b_h,       vvv)
+INSN_LSX(vsran_h_w,       vvv)
+INSN_LSX(vsran_w_d,       vvv)
+
+INSN_LSX(vsrlni_b_h,       vv_i)
+INSN_LSX(vsrlni_h_w,       vv_i)
+INSN_LSX(vsrlni_w_d,       vv_i)
+INSN_LSX(vsrlni_d_q,       vv_i)
+INSN_LSX(vsrani_b_h,       vv_i)
+INSN_LSX(vsrani_h_w,       vv_i)
+INSN_LSX(vsrani_w_d,       vv_i)
+INSN_LSX(vsrani_d_q,       vv_i)
diff --git a/target/loongarch/helper.h b/target/loongarch/helper.h
index 65438c00f1..eccfbfbb3e 100644
--- a/target/loongarch/helper.h
+++ b/target/loongarch/helper.h
@@ -492,3 +492,19 @@ DEF_HELPER_4(vsrari_b, void, env, i32, i32, i32)
 DEF_HELPER_4(vsrari_h, void, env, i32, i32, i32)
 DEF_HELPER_4(vsrari_w, void, env, i32, i32, i32)
 DEF_HELPER_4(vsrari_d, void, env, i32, i32, i32)
+
+DEF_HELPER_4(vsrln_b_h, void, env, i32, i32, i32)
+DEF_HELPER_4(vsrln_h_w, void, env, i32, i32, i32)
+DEF_HELPER_4(vsrln_w_d, void, env, i32, i32, i32)
+DEF_HELPER_4(vsran_b_h, void, env, i32, i32, i32)
+DEF_HELPER_4(vsran_h_w, void, env, i32, i32, i32)
+DEF_HELPER_4(vsran_w_d, void, env, i32, i32, i32)
+
+DEF_HELPER_4(vsrlni_b_h, void, env, i32, i32, i32)
+DEF_HELPER_4(vsrlni_h_w, void, env, i32, i32, i32)
+DEF_HELPER_4(vsrlni_w_d, void, env, i32, i32, i32)
+DEF_HELPER_4(vsrlni_d_q, void, env, i32, i32, i32)
+DEF_HELPER_4(vsrani_b_h, void, env, i32, i32, i32)
+DEF_HELPER_4(vsrani_h_w, void, env, i32, i32, i32)
+DEF_HELPER_4(vsrani_w_d, void, env, i32, i32, i32)
+DEF_HELPER_4(vsrani_d_q, void, env, i32, i32, i32)
diff --git a/target/loongarch/insn_trans/trans_lsx.c.inc b/target/loongarch/insn_trans/trans_lsx.c.inc
index 9196ec3ed7..5b4410852d 100644
--- a/target/loongarch/insn_trans/trans_lsx.c.inc
+++ b/target/loongarch/insn_trans/trans_lsx.c.inc
@@ -408,3 +408,19 @@ TRANS(vsrari_b, gen_vv_i, gen_helper_vsrari_b)
 TRANS(vsrari_h, gen_vv_i, gen_helper_vsrari_h)
 TRANS(vsrari_w, gen_vv_i, gen_helper_vsrari_w)
 TRANS(vsrari_d, gen_vv_i, gen_helper_vsrari_d)
+
+TRANS(vsrln_b_h, gen_vvv, gen_helper_vsrln_b_h)
+TRANS(vsrln_h_w, gen_vvv, gen_helper_vsrln_h_w)
+TRANS(vsrln_w_d, gen_vvv, gen_helper_vsrln_w_d)
+TRANS(vsran_b_h, gen_vvv, gen_helper_vsran_b_h)
+TRANS(vsran_h_w, gen_vvv, gen_helper_vsran_h_w)
+TRANS(vsran_w_d, gen_vvv, gen_helper_vsran_w_d)
+
+TRANS(vsrlni_b_h, gen_vv_i, gen_helper_vsrlni_b_h)
+TRANS(vsrlni_h_w, gen_vv_i, gen_helper_vsrlni_h_w)
+TRANS(vsrlni_w_d, gen_vv_i, gen_helper_vsrlni_w_d)
+TRANS(vsrlni_d_q, gen_vv_i, gen_helper_vsrlni_d_q)
+TRANS(vsrani_b_h, gen_vv_i, gen_helper_vsrani_b_h)
+TRANS(vsrani_h_w, gen_vv_i, gen_helper_vsrani_h_w)
+TRANS(vsrani_w_d, gen_vv_i, gen_helper_vsrani_w_d)
+TRANS(vsrani_d_q, gen_vv_i, gen_helper_vsrani_d_q)
diff --git a/target/loongarch/insns.decode b/target/loongarch/insns.decode
index eef25e2eef..859def6752 100644
--- a/target/loongarch/insns.decode
+++ b/target/loongarch/insns.decode
@@ -502,6 +502,7 @@ dbcl             0000 00000010 10101 ...............      @i15
 @vv_ui4         .... ........ ..... . imm:4 vj:5 vd:5    &vv_i
 @vv_ui5           .... ........ ..... imm:5 vj:5 vd:5    &vv_i
 @vv_ui6            .... ........ .... imm:6 vj:5 vd:5    &vv_i
+@vv_ui7             .... ........ ... imm:7 vj:5 vd:5    &vv_i
 @vv_ui8              .... ........ .. imm:8 vj:5 vd:5    &vv_i
 @vv_i5           .... ........ ..... imm:s5 vj:5 vd:5    &vv_i
 
@@ -865,3 +866,19 @@ vsrari_b         0111 00101010 10000 01 ... ..... .....   @vv_ui3
 vsrari_h         0111 00101010 10000 1 .... ..... .....   @vv_ui4
 vsrari_w         0111 00101010 10001 ..... ..... .....    @vv_ui5
 vsrari_d         0111 00101010 1001 ...... ..... .....    @vv_ui6
+
+vsrln_b_h        0111 00001111 01001 ..... ..... .....    @vvv
+vsrln_h_w        0111 00001111 01010 ..... ..... .....    @vvv
+vsrln_w_d        0111 00001111 01011 ..... ..... .....    @vvv
+vsran_b_h        0111 00001111 01101 ..... ..... .....    @vvv
+vsran_h_w        0111 00001111 01110 ..... ..... .....    @vvv
+vsran_w_d        0111 00001111 01111 ..... ..... .....    @vvv
+
+vsrlni_b_h       0111 00110100 00000 1 .... ..... .....   @vv_ui4
+vsrlni_h_w       0111 00110100 00001 ..... ..... .....    @vv_ui5
+vsrlni_w_d       0111 00110100 0001 ...... ..... .....    @vv_ui6
+vsrlni_d_q       0111 00110100 001 ....... ..... .....    @vv_ui7
+vsrani_b_h       0111 00110101 10000 1 .... ..... .....   @vv_ui4
+vsrani_h_w       0111 00110101 10001 ..... ..... .....    @vv_ui5
+vsrani_w_d       0111 00110101 1001 ...... ..... .....    @vv_ui6
+vsrani_d_q       0111 00110101 101 ....... ..... .....    @vv_ui7
diff --git a/target/loongarch/lsx_helper.c b/target/loongarch/lsx_helper.c
index 529a81372b..30b8da837a 100644
--- a/target/loongarch/lsx_helper.c
+++ b/target/loongarch/lsx_helper.c
@@ -2382,3 +2382,137 @@ DO_HELPER_VVV(vsrari_b, 8, helper_vv_i, do_vsrari)
 DO_HELPER_VVV(vsrari_h, 16, helper_vv_i, do_vsrari)
 DO_HELPER_VVV(vsrari_w, 32, helper_vv_i, do_vsrari)
 DO_HELPER_VVV(vsrari_d, 64, helper_vv_i, do_vsrari)
+
+static void helper_vvv_hz(CPULoongArchState *env,
+                          uint32_t vd, uint32_t vj, uint32_t vk, int bit,
+                          void (*func)(vec_t*, vec_t*, vec_t*, int, int))
+{
+    int i;
+    vec_t *Vd = &(env->fpr[vd].vec);
+    vec_t *Vj = &(env->fpr[vj].vec);
+    vec_t *Vk = &(env->fpr[vk].vec);
+
+    for (i = 0; i < LSX_LEN/bit; i++) {
+        func(Vd, Vj, Vk, bit, i);
+    }
+    Vd->D[1] = 0;
+}
+
+static void do_vsrln(vec_t *Vd, vec_t *Vj, vec_t *Vk, int bit, int n)
+{
+    switch (bit) {
+    case 16:
+        Vd->B[n] = (uint16_t)Vj->H[n] >> (Vk->H[n] & 0xf);
+        break;
+    case 32:
+        Vd->H[n] = (uint32_t)Vj->W[n] >> (Vk->W[n] & 0x1f);
+        break;
+    case 64:
+        Vd->W[n] = (uint64_t)Vj->D[n] >> (Vk->D[n] & 0x3f);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static void do_vsran(vec_t *Vd, vec_t *Vj, vec_t *Vk, int bit, int n)
+{
+    switch (bit) {
+    case 16:
+        Vd->B[n] = Vj->H[n] >> (Vk->H[n] & 0xf);
+        break;
+    case 32:
+        Vd->H[n] = Vj->W[n] >> (Vk->W[n] & 0x1f);
+        break;
+    case 64:
+        Vd->W[n] = Vj->D[n] >> (Vk->D[n] & 0x3f);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+DO_HELPER_VVV(vsrln_b_h, 16, helper_vvv_hz, do_vsrln)
+DO_HELPER_VVV(vsrln_h_w, 32, helper_vvv_hz, do_vsrln)
+DO_HELPER_VVV(vsrln_w_d, 64, helper_vvv_hz, do_vsrln)
+DO_HELPER_VVV(vsran_b_h, 16, helper_vvv_hz, do_vsran)
+DO_HELPER_VVV(vsran_h_w, 32, helper_vvv_hz, do_vsran)
+DO_HELPER_VVV(vsran_w_d, 64, helper_vvv_hz, do_vsran)
+
+static void helper_vv_ni_c(CPULoongArchState *env,
+                           uint32_t vd, uint32_t vj, uint32_t imm, int bit,
+                           void (*func)(vec_t*, vec_t*, vec_t*,
+                                        uint32_t, int, int))
+{
+    int i;
+    vec_t *Vd = &(env->fpr[vd].vec);
+    vec_t *Vj = &(env->fpr[vj].vec);
+
+    vec_t dest;
+    dest.D[0] = 0;
+    dest.D[1] = 0;
+    for (i = 0; i < LSX_LEN/bit; i++) {
+         func(&dest, Vd, Vj, imm, bit, i);
+    }
+    Vd->D[0] = dest.D[0];
+    Vd->D[1] = dest.D[1];
+}
+
+static void do_vsrlni(vec_t *dest, vec_t *Vd, vec_t *Vj,
+                      uint32_t imm, int bit, int n)
+{
+    switch (bit) {
+    case 16:
+        dest->B[n] = (uint16_t)Vj->H[n] >> imm;
+        dest->B[n + 128/bit] = (uint16_t)Vd->H[n] >> imm;
+        break;
+    case 32:
+        dest->H[n] = (uint32_t)Vj->W[n] >> imm;
+        dest->H[n + 128/bit] = (uint32_t)Vd->W[n] >> imm;
+        break;
+    case 64:
+        dest->W[n] = (uint64_t)Vj->D[n] >> imm;
+        dest->W[n + 128/bit] = (uint64_t)Vd->D[n] >> imm;
+        break;
+    case 128:
+        dest->D[n] = (__uint128_t)Vj->Q[n] >> imm;
+        dest->D[n + 128/bit] = (__uint128_t)Vd->Q[n] >> imm;
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static void do_vsrani(vec_t *dest, vec_t *Vd, vec_t *Vj,
+                      uint32_t imm, int bit, int n)
+{
+    switch (bit) {
+    case 16:
+        dest->B[n] = Vj->H[n] >> imm;
+        dest->B[n + 128/bit] = Vd->H[n] >> imm;
+        break;
+    case 32:
+        dest->H[n] = Vj->W[n] >> imm;
+        dest->H[n + 128/bit] = Vd->W[n] >> imm;
+        break;
+    case 64:
+        dest->W[n] = Vj->D[n] >> imm;
+        dest->W[n + 128/bit] = Vd->D[n] >> imm;
+        break;
+    case 128:
+        dest->D[n] = (__int128_t)Vj->Q[n] >> imm;
+        dest->D[n + 128/bit] = (__int128_t)Vd->Q[n] >> imm;
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+DO_HELPER_VV_I(vsrlni_b_h, 16, helper_vv_ni_c, do_vsrlni)
+DO_HELPER_VV_I(vsrlni_h_w, 32, helper_vv_ni_c, do_vsrlni)
+DO_HELPER_VV_I(vsrlni_w_d, 64, helper_vv_ni_c, do_vsrlni)
+DO_HELPER_VV_I(vsrlni_d_q, 128, helper_vv_ni_c, do_vsrlni)
+DO_HELPER_VV_I(vsrani_b_h, 16, helper_vv_ni_c, do_vsrani)
+DO_HELPER_VV_I(vsrani_h_w, 32, helper_vv_ni_c, do_vsrani)
+DO_HELPER_VV_I(vsrani_w_d, 64, helper_vv_ni_c, do_vsrani)
+DO_HELPER_VV_I(vsrani_d_q, 128, helper_vv_ni_c, do_vsrani)
-- 
2.31.1


