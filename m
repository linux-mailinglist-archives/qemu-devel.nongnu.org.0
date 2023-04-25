Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D966EDC36
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 09:09:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prCiA-0001Su-Fu; Tue, 25 Apr 2023 03:03:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1prCi7-0001SK-T3
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 03:03:35 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1prCi5-0008Cl-NS
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 03:03:35 -0400
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8Cx9eg5e0dkpl8AAA--.639S3;
 Tue, 25 Apr 2023 15:03:21 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Cxeb0Ye0dk3Eo6AA--.4591S31; 
 Tue, 25 Apr 2023 15:03:19 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	gaosong@loongson.cn
Subject: [RFC PATCH v4 29/44] target/loongarch: Implement vclo vclz
Date: Tue, 25 Apr 2023 15:02:33 +0800
Message-Id: <20230425070248.2550028-30-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230425070248.2550028-1-gaosong@loongson.cn>
References: <20230425070248.2550028-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Cxeb0Ye0dk3Eo6AA--.4591S31
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoWxCF4Uur1UuF18Jry5GFy7Awb_yoW7Jw13pr
 42yrWUKw48JrZ7Xrn2va13ta12qrnrKw4xua1ft34DuFWUXFn7Xryvq3yqgFW5Z3ZxZa42
 qa47A3s0kry8JwUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 be8Fc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4
 AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF
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
- VCLO.{B/H/W/D};
- VCLZ.{B/H/W/D}.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 target/loongarch/disas.c                    |  9 ++++++
 target/loongarch/helper.h                   |  9 ++++++
 target/loongarch/insn_trans/trans_lsx.c.inc |  9 ++++++
 target/loongarch/insns.decode               |  9 ++++++
 target/loongarch/lsx_helper.c               | 31 +++++++++++++++++++++
 5 files changed, 67 insertions(+)

diff --git a/target/loongarch/disas.c b/target/loongarch/disas.c
index 405e8885cd..0c82a1d9d1 100644
--- a/target/loongarch/disas.c
+++ b/target/loongarch/disas.c
@@ -1258,3 +1258,12 @@ INSN_LSX(vssrarni_bu_h,    vv_i)
 INSN_LSX(vssrarni_hu_w,    vv_i)
 INSN_LSX(vssrarni_wu_d,    vv_i)
 INSN_LSX(vssrarni_du_q,    vv_i)
+
+INSN_LSX(vclo_b,           vv)
+INSN_LSX(vclo_h,           vv)
+INSN_LSX(vclo_w,           vv)
+INSN_LSX(vclo_d,           vv)
+INSN_LSX(vclz_b,           vv)
+INSN_LSX(vclz_h,           vv)
+INSN_LSX(vclz_w,           vv)
+INSN_LSX(vclz_d,           vv)
diff --git a/target/loongarch/helper.h b/target/loongarch/helper.h
index 724112da81..e21e9b9704 100644
--- a/target/loongarch/helper.h
+++ b/target/loongarch/helper.h
@@ -471,3 +471,12 @@ DEF_HELPER_4(vssrarni_bu_h, void, env, i32, i32, i32)
 DEF_HELPER_4(vssrarni_hu_w, void, env, i32, i32, i32)
 DEF_HELPER_4(vssrarni_wu_d, void, env, i32, i32, i32)
 DEF_HELPER_4(vssrarni_du_q, void, env, i32, i32, i32)
+
+DEF_HELPER_3(vclo_b, void, env, i32, i32)
+DEF_HELPER_3(vclo_h, void, env, i32, i32)
+DEF_HELPER_3(vclo_w, void, env, i32, i32)
+DEF_HELPER_3(vclo_d, void, env, i32, i32)
+DEF_HELPER_3(vclz_b, void, env, i32, i32)
+DEF_HELPER_3(vclz_h, void, env, i32, i32)
+DEF_HELPER_3(vclz_w, void, env, i32, i32)
+DEF_HELPER_3(vclz_d, void, env, i32, i32)
diff --git a/target/loongarch/insn_trans/trans_lsx.c.inc b/target/loongarch/insn_trans/trans_lsx.c.inc
index 9c24cbc297..c7649fb777 100644
--- a/target/loongarch/insn_trans/trans_lsx.c.inc
+++ b/target/loongarch/insn_trans/trans_lsx.c.inc
@@ -3097,3 +3097,12 @@ TRANS(vssrarni_bu_h, gen_vv_i, gen_helper_vssrarni_bu_h)
 TRANS(vssrarni_hu_w, gen_vv_i, gen_helper_vssrarni_hu_w)
 TRANS(vssrarni_wu_d, gen_vv_i, gen_helper_vssrarni_wu_d)
 TRANS(vssrarni_du_q, gen_vv_i, gen_helper_vssrarni_du_q)
+
+TRANS(vclo_b, gen_vv, gen_helper_vclo_b)
+TRANS(vclo_h, gen_vv, gen_helper_vclo_h)
+TRANS(vclo_w, gen_vv, gen_helper_vclo_w)
+TRANS(vclo_d, gen_vv, gen_helper_vclo_d)
+TRANS(vclz_b, gen_vv, gen_helper_vclz_b)
+TRANS(vclz_h, gen_vv, gen_helper_vclz_h)
+TRANS(vclz_w, gen_vv, gen_helper_vclz_w)
+TRANS(vclz_d, gen_vv, gen_helper_vclz_d)
diff --git a/target/loongarch/insns.decode b/target/loongarch/insns.decode
index bb4b2a8632..7591ec1bab 100644
--- a/target/loongarch/insns.decode
+++ b/target/loongarch/insns.decode
@@ -959,3 +959,12 @@ vssrarni_bu_h    0111 00110110 11000 1 .... ..... .....   @vv_ui4
 vssrarni_hu_w    0111 00110110 11001 ..... ..... .....    @vv_ui5
 vssrarni_wu_d    0111 00110110 1101 ...... ..... .....    @vv_ui6
 vssrarni_du_q    0111 00110110 111 ....... ..... .....    @vv_ui7
+
+vclo_b           0111 00101001 11000 00000 ..... .....    @vv
+vclo_h           0111 00101001 11000 00001 ..... .....    @vv
+vclo_w           0111 00101001 11000 00010 ..... .....    @vv
+vclo_d           0111 00101001 11000 00011 ..... .....    @vv
+vclz_b           0111 00101001 11000 00100 ..... .....    @vv
+vclz_h           0111 00101001 11000 00101 ..... .....    @vv
+vclz_w           0111 00101001 11000 00110 ..... .....    @vv
+vclz_d           0111 00101001 11000 00111 ..... .....    @vv
diff --git a/target/loongarch/lsx_helper.c b/target/loongarch/lsx_helper.c
index fb6f29c94d..044032f180 100644
--- a/target/loongarch/lsx_helper.c
+++ b/target/loongarch/lsx_helper.c
@@ -1915,3 +1915,34 @@ void HELPER(vssrarni_du_q)(CPULoongArchState *env,
 VSSRARNUI(vssrarni_bu_h, 16, B, H)
 VSSRARNUI(vssrarni_hu_w, 32, H, W)
 VSSRARNUI(vssrarni_wu_d, 64, W, D)
+
+#define DO_2OP(NAME, BIT, E, DO_OP)                                 \
+void HELPER(NAME)(CPULoongArchState *env, uint32_t vd, uint32_t vj) \
+{                                                                   \
+    int i;                                                          \
+    VReg *Vd = &(env->fpr[vd].vreg);                                \
+    VReg *Vj = &(env->fpr[vj].vreg);                                \
+                                                                    \
+    for (i = 0; i < LSX_LEN/BIT; i++)                               \
+    {                                                               \
+        Vd->E(i) = DO_OP(Vj->E(i));                                 \
+    }                                                               \
+}
+
+#define DO_CLO_B(N)  (clz32(~N & 0xff) - 24)
+#define DO_CLO_H(N)  (clz32(~N & 0xffff) - 16)
+#define DO_CLO_W(N)  (clz32(~N))
+#define DO_CLO_D(N)  (clz64(~N))
+#define DO_CLZ_B(N)  (clz32(N) - 24)
+#define DO_CLZ_H(N)  (clz32(N) - 16)
+#define DO_CLZ_W(N)  (clz32(N))
+#define DO_CLZ_D(N)  (clz64(N))
+
+DO_2OP(vclo_b, 8, UB, DO_CLO_B)
+DO_2OP(vclo_h, 16, UH, DO_CLO_H)
+DO_2OP(vclo_w, 32, UW, DO_CLO_W)
+DO_2OP(vclo_d, 64, UD, DO_CLO_D)
+DO_2OP(vclz_b, 8, UB, DO_CLZ_B)
+DO_2OP(vclz_h, 16, UH, DO_CLZ_H)
+DO_2OP(vclz_w, 32, UW, DO_CLZ_W)
+DO_2OP(vclz_d, 64, UD, DO_CLZ_D)
-- 
2.31.1


