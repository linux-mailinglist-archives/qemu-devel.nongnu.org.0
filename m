Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C37AD655962
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Dec 2022 09:42:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8zil-0006L1-JK; Sat, 24 Dec 2022 03:17:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1p8ziN-00068z-0h
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 03:17:08 -0500
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1p8ziF-0001AK-NV
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 03:17:05 -0500
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8Cx6+putaZjR0kIAA--.18702S3;
 Sat, 24 Dec 2022 16:16:46 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8CxPuRhtaZjuccKAA--.38440S29; 
 Sat, 24 Dec 2022 16:16:46 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org
Subject: [RFC PATCH 27/43] target/loongarch: Implement vsrlrn vsrarn
Date: Sat, 24 Dec 2022 16:16:17 +0800
Message-Id: <20221224081633.4185445-28-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20221224081633.4185445-1-gaosong@loongson.cn>
References: <20221224081633.4185445-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8CxPuRhtaZjuccKAA--.38440S29
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoWxKFy5WFyDuFWxZFy7Zr48tFb_yoWfXry5p3
 yUGryUAr4DGFWvq3ZIva4Syw4vqwsrtw1fuw4fAr18uw47AF9aqr1ktrW29F48WF9xtFyI
 g3W7Gr9rAFy5JaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
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
- VSRLRN.{B.H/H.W/W.D};
- VSRARN.{B.H/H.W/W.D};
- VSRLRNI.{B.H/H.W/W.D/D.Q};
- VSRARNI.{B.H/H.W/W.D/D.Q}.

Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 target/loongarch/disas.c                    |  16 +++
 target/loongarch/helper.h                   |  16 +++
 target/loongarch/insn_trans/trans_lsx.c.inc |  16 +++
 target/loongarch/insns.decode               |  16 +++
 target/loongarch/lsx_helper.c               | 108 ++++++++++++++++++++
 5 files changed, 172 insertions(+)

diff --git a/target/loongarch/disas.c b/target/loongarch/disas.c
index e6f4411b43..507f34feaa 100644
--- a/target/loongarch/disas.c
+++ b/target/loongarch/disas.c
@@ -1153,3 +1153,19 @@ INSN_LSX(vsrani_b_h,       vv_i)
 INSN_LSX(vsrani_h_w,       vv_i)
 INSN_LSX(vsrani_w_d,       vv_i)
 INSN_LSX(vsrani_d_q,       vv_i)
+
+INSN_LSX(vsrlrn_b_h,       vvv)
+INSN_LSX(vsrlrn_h_w,       vvv)
+INSN_LSX(vsrlrn_w_d,       vvv)
+INSN_LSX(vsrarn_b_h,       vvv)
+INSN_LSX(vsrarn_h_w,       vvv)
+INSN_LSX(vsrarn_w_d,       vvv)
+
+INSN_LSX(vsrlrni_b_h,      vv_i)
+INSN_LSX(vsrlrni_h_w,      vv_i)
+INSN_LSX(vsrlrni_w_d,      vv_i)
+INSN_LSX(vsrlrni_d_q,      vv_i)
+INSN_LSX(vsrarni_b_h,      vv_i)
+INSN_LSX(vsrarni_h_w,      vv_i)
+INSN_LSX(vsrarni_w_d,      vv_i)
+INSN_LSX(vsrarni_d_q,      vv_i)
diff --git a/target/loongarch/helper.h b/target/loongarch/helper.h
index eccfbfbb3e..bb868961d1 100644
--- a/target/loongarch/helper.h
+++ b/target/loongarch/helper.h
@@ -508,3 +508,19 @@ DEF_HELPER_4(vsrani_b_h, void, env, i32, i32, i32)
 DEF_HELPER_4(vsrani_h_w, void, env, i32, i32, i32)
 DEF_HELPER_4(vsrani_w_d, void, env, i32, i32, i32)
 DEF_HELPER_4(vsrani_d_q, void, env, i32, i32, i32)
+
+DEF_HELPER_4(vsrlrn_b_h, void, env, i32, i32, i32)
+DEF_HELPER_4(vsrlrn_h_w, void, env, i32, i32, i32)
+DEF_HELPER_4(vsrlrn_w_d, void, env, i32, i32, i32)
+DEF_HELPER_4(vsrarn_b_h, void, env, i32, i32, i32)
+DEF_HELPER_4(vsrarn_h_w, void, env, i32, i32, i32)
+DEF_HELPER_4(vsrarn_w_d, void, env, i32, i32, i32)
+
+DEF_HELPER_4(vsrlrni_b_h, void, env, i32, i32, i32)
+DEF_HELPER_4(vsrlrni_h_w, void, env, i32, i32, i32)
+DEF_HELPER_4(vsrlrni_w_d, void, env, i32, i32, i32)
+DEF_HELPER_4(vsrlrni_d_q, void, env, i32, i32, i32)
+DEF_HELPER_4(vsrarni_b_h, void, env, i32, i32, i32)
+DEF_HELPER_4(vsrarni_h_w, void, env, i32, i32, i32)
+DEF_HELPER_4(vsrarni_w_d, void, env, i32, i32, i32)
+DEF_HELPER_4(vsrarni_d_q, void, env, i32, i32, i32)
diff --git a/target/loongarch/insn_trans/trans_lsx.c.inc b/target/loongarch/insn_trans/trans_lsx.c.inc
index 5b4410852d..d3ab0a4a6a 100644
--- a/target/loongarch/insn_trans/trans_lsx.c.inc
+++ b/target/loongarch/insn_trans/trans_lsx.c.inc
@@ -424,3 +424,19 @@ TRANS(vsrani_b_h, gen_vv_i, gen_helper_vsrani_b_h)
 TRANS(vsrani_h_w, gen_vv_i, gen_helper_vsrani_h_w)
 TRANS(vsrani_w_d, gen_vv_i, gen_helper_vsrani_w_d)
 TRANS(vsrani_d_q, gen_vv_i, gen_helper_vsrani_d_q)
+
+TRANS(vsrlrn_b_h, gen_vvv, gen_helper_vsrlrn_b_h)
+TRANS(vsrlrn_h_w, gen_vvv, gen_helper_vsrlrn_h_w)
+TRANS(vsrlrn_w_d, gen_vvv, gen_helper_vsrlrn_w_d)
+TRANS(vsrarn_b_h, gen_vvv, gen_helper_vsrarn_b_h)
+TRANS(vsrarn_h_w, gen_vvv, gen_helper_vsrarn_h_w)
+TRANS(vsrarn_w_d, gen_vvv, gen_helper_vsrarn_w_d)
+
+TRANS(vsrlrni_b_h, gen_vv_i, gen_helper_vsrlrni_b_h)
+TRANS(vsrlrni_h_w, gen_vv_i, gen_helper_vsrlrni_h_w)
+TRANS(vsrlrni_w_d, gen_vv_i, gen_helper_vsrlrni_w_d)
+TRANS(vsrlrni_d_q, gen_vv_i, gen_helper_vsrlrni_d_q)
+TRANS(vsrarni_b_h, gen_vv_i, gen_helper_vsrarni_b_h)
+TRANS(vsrarni_h_w, gen_vv_i, gen_helper_vsrarni_h_w)
+TRANS(vsrarni_w_d, gen_vv_i, gen_helper_vsrarni_w_d)
+TRANS(vsrarni_d_q, gen_vv_i, gen_helper_vsrarni_d_q)
diff --git a/target/loongarch/insns.decode b/target/loongarch/insns.decode
index 859def6752..0b30175f6b 100644
--- a/target/loongarch/insns.decode
+++ b/target/loongarch/insns.decode
@@ -882,3 +882,19 @@ vsrani_b_h       0111 00110101 10000 1 .... ..... .....   @vv_ui4
 vsrani_h_w       0111 00110101 10001 ..... ..... .....    @vv_ui5
 vsrani_w_d       0111 00110101 1001 ...... ..... .....    @vv_ui6
 vsrani_d_q       0111 00110101 101 ....... ..... .....    @vv_ui7
+
+vsrlrn_b_h       0111 00001111 10001 ..... ..... .....    @vvv
+vsrlrn_h_w       0111 00001111 10010 ..... ..... .....    @vvv
+vsrlrn_w_d       0111 00001111 10011 ..... ..... .....    @vvv
+vsrarn_b_h       0111 00001111 10101 ..... ..... .....    @vvv
+vsrarn_h_w       0111 00001111 10110 ..... ..... .....    @vvv
+vsrarn_w_d       0111 00001111 10111 ..... ..... .....    @vvv
+
+vsrlrni_b_h      0111 00110100 01000 1 .... ..... .....   @vv_ui4
+vsrlrni_h_w      0111 00110100 01001 ..... ..... .....    @vv_ui5
+vsrlrni_w_d      0111 00110100 0101 ...... ..... .....    @vv_ui6
+vsrlrni_d_q      0111 00110100 011 ....... ..... .....    @vv_ui7
+vsrarni_b_h      0111 00110101 11000 1 .... ..... .....   @vv_ui4
+vsrarni_h_w      0111 00110101 11001 ..... ..... .....    @vv_ui5
+vsrarni_w_d      0111 00110101 1101 ...... ..... .....    @vv_ui6
+vsrarni_d_q      0111 00110101 111 ....... ..... .....    @vv_ui7
diff --git a/target/loongarch/lsx_helper.c b/target/loongarch/lsx_helper.c
index 30b8da837a..8ccfa75fe3 100644
--- a/target/loongarch/lsx_helper.c
+++ b/target/loongarch/lsx_helper.c
@@ -2516,3 +2516,111 @@ DO_HELPER_VV_I(vsrani_b_h, 16, helper_vv_ni_c, do_vsrani)
 DO_HELPER_VV_I(vsrani_h_w, 32, helper_vv_ni_c, do_vsrani)
 DO_HELPER_VV_I(vsrani_w_d, 64, helper_vv_ni_c, do_vsrani)
 DO_HELPER_VV_I(vsrani_d_q, 128, helper_vv_ni_c, do_vsrani)
+
+static void do_vsrlrn(vec_t *Vd, vec_t *Vj, vec_t *Vk, int bit, int n)
+{
+    switch (bit) {
+    case 16:
+        Vd->B[n] = vsrlr((uint16_t)Vj->H[n], Vk->H[n], bit);
+        break;
+    case 32:
+        Vd->H[n] = vsrlr((uint32_t)Vj->W[n], Vk->W[n], bit);
+        break;
+    case 64:
+        Vd->W[n] = vsrlr((uint64_t)Vj->D[n], Vk->D[n], bit);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static void do_vsrarn(vec_t *Vd, vec_t *Vj, vec_t *Vk, int bit, int n)
+{
+    switch (bit) {
+    case 16:
+        Vd->B[n] = vsrar(Vj->H[n], Vk->H[n], bit);
+        break;
+    case 32:
+        Vd->H[n] = vsrar(Vj->W[n], Vk->W[n], bit);
+        break;
+    case 64:
+        Vd->W[n] = vsrar(Vj->D[n], Vk->D[n], bit);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+DO_HELPER_VVV(vsrlrn_b_h, 16, helper_vvv_hz, do_vsrlrn)
+DO_HELPER_VVV(vsrlrn_h_w, 32, helper_vvv_hz, do_vsrlrn)
+DO_HELPER_VVV(vsrlrn_w_d, 64, helper_vvv_hz, do_vsrlrn)
+DO_HELPER_VVV(vsrarn_b_h, 16, helper_vvv_hz, do_vsrarn)
+DO_HELPER_VVV(vsrarn_h_w, 32, helper_vvv_hz, do_vsrarn)
+DO_HELPER_VVV(vsrarn_w_d, 64, helper_vvv_hz, do_vsrarn)
+
+static __int128_t vsrlrn(__int128_t s1, uint32_t imm)
+{
+    if (imm == 0) {
+        return s1;
+    } else {
+        __uint128_t t1 = (__uint128_t)1 << (imm -1);
+        return (s1 + t1) >> imm;
+    }
+}
+
+static void do_vsrlrni(vec_t *dest, vec_t *Vd, vec_t *Vj, uint32_t imm, int bit, int n)
+{
+    switch (bit) {
+    case 16:
+        dest->B[n] = vsrlrn((uint16_t)Vj->H[n], imm);
+        dest->B[n + 128 / bit] = vsrlrn((uint16_t)Vd->H[n], imm);
+        break;
+    case 32:
+        dest->H[n] = vsrlrn((uint32_t)Vj->W[n], imm);
+        dest->H[n + 128 / bit] = vsrlrn((uint32_t)Vd->W[n], imm);
+        break;
+    case 64:
+        dest->W[n] = vsrlrn((uint64_t)Vj->D[n], imm);
+        dest->W[n + 128 / bit] = vsrlrn((uint64_t)Vd->D[n], imm);
+        break;
+    case 128:
+        dest->D[n] = vsrlrn((__uint128_t)Vj->Q[n], imm);
+        dest->D[n + 128 / bit] = vsrlrn((__uint128_t)Vd->Q[n], imm);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static void do_vsrarni(vec_t *dest, vec_t *Vd, vec_t *Vj, uint32_t imm, int bit, int n)
+{
+    switch (bit) {
+    case 16:
+        dest->B[n] = vsrlrn(Vj->H[n], imm);
+        dest->B[n + 128 / bit] = vsrlrn(Vd->H[n], imm);
+        break;
+    case 32:
+        dest->H[n] = vsrlrn(Vj->W[n], imm);
+        dest->H[n + 128 / bit] = vsrlrn(Vd->W[n], imm);
+        break;
+    case 64:
+        dest->W[n] = vsrlrn(Vj->D[n], imm);
+        dest->W[n + 128 / bit] = vsrlrn(Vd->D[n], imm);
+        break;
+    case 128:
+        dest->D[n] = vsrlrn(Vj->Q[n], imm);
+        dest->D[n + 128 / bit] = vsrlrn(Vd->Q[n], imm);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+DO_HELPER_VV_I(vsrlrni_b_h, 16, helper_vv_ni_c, do_vsrlrni)
+DO_HELPER_VV_I(vsrlrni_h_w, 32, helper_vv_ni_c, do_vsrlrni)
+DO_HELPER_VV_I(vsrlrni_w_d, 64, helper_vv_ni_c, do_vsrlrni)
+DO_HELPER_VV_I(vsrlrni_d_q, 128, helper_vv_ni_c, do_vsrlrni)
+DO_HELPER_VV_I(vsrarni_b_h, 16, helper_vv_ni_c, do_vsrarni)
+DO_HELPER_VV_I(vsrarni_h_w, 32, helper_vv_ni_c, do_vsrarni)
+DO_HELPER_VV_I(vsrarni_w_d, 64, helper_vv_ni_c, do_vsrarni)
+DO_HELPER_VV_I(vsrarni_d_q, 128, helper_vv_ni_c, do_vsrarni)
-- 
2.31.1


