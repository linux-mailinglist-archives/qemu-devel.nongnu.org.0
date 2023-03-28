Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15BF86CB4A4
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 05:12:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgzhi-0005VC-3m; Mon, 27 Mar 2023 23:08:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1pgzhg-0005Jr-1W
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 23:08:56 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1pgzhd-0003KN-Ft
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 23:08:55 -0400
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8CxjdrKWSJkh9oSAA--.17386S3;
 Tue, 28 Mar 2023 11:06:50 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Dxyr24WSJkZukOAA--.10252S34; 
 Tue, 28 Mar 2023 11:06:50 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org
Subject: [RFC PATCH v2 32/44] target/loongarch: Implement vbitclr vbitset
 vbitrev
Date: Tue, 28 Mar 2023 11:06:19 +0800
Message-Id: <20230328030631.3117129-33-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230328030631.3117129-1-gaosong@loongson.cn>
References: <20230328030631.3117129-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Dxyr24WSJkZukOAA--.10252S34
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoW3Jr4rGr45AF47GFyDCFyrXrb_yoWfur1fpa
 y7trWUWr48XrZrZrn2vr4aya1j9rsrK3WUua1rtw1j9rW7WF1DJrZ0q392ga12gFn0qFy0
 g347C34qyas5JaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
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
- VBITCLR[I].{B/H/W/D};
- VBITSET[I].{B/H/W/D};
- VBITREV[I].{B/H/W/D}.

Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 target/loongarch/disas.c                    | 25 +++++++++
 target/loongarch/helper.h                   | 25 +++++++++
 target/loongarch/insn_trans/trans_lsx.c.inc | 25 +++++++++
 target/loongarch/insns.decode               | 25 +++++++++
 target/loongarch/lsx_helper.c               | 57 +++++++++++++++++++++
 5 files changed, 157 insertions(+)

diff --git a/target/loongarch/disas.c b/target/loongarch/disas.c
index 0ca51de9d8..48c7ea47a4 100644
--- a/target/loongarch/disas.c
+++ b/target/loongarch/disas.c
@@ -1272,3 +1272,28 @@ INSN_LSX(vpcnt_b,          vv)
 INSN_LSX(vpcnt_h,          vv)
 INSN_LSX(vpcnt_w,          vv)
 INSN_LSX(vpcnt_d,          vv)
+
+INSN_LSX(vbitclr_b,        vvv)
+INSN_LSX(vbitclr_h,        vvv)
+INSN_LSX(vbitclr_w,        vvv)
+INSN_LSX(vbitclr_d,        vvv)
+INSN_LSX(vbitclri_b,       vv_i)
+INSN_LSX(vbitclri_h,       vv_i)
+INSN_LSX(vbitclri_w,       vv_i)
+INSN_LSX(vbitclri_d,       vv_i)
+INSN_LSX(vbitset_b,        vvv)
+INSN_LSX(vbitset_h,        vvv)
+INSN_LSX(vbitset_w,        vvv)
+INSN_LSX(vbitset_d,        vvv)
+INSN_LSX(vbitseti_b,       vv_i)
+INSN_LSX(vbitseti_h,       vv_i)
+INSN_LSX(vbitseti_w,       vv_i)
+INSN_LSX(vbitseti_d,       vv_i)
+INSN_LSX(vbitrev_b,        vvv)
+INSN_LSX(vbitrev_h,        vvv)
+INSN_LSX(vbitrev_w,        vvv)
+INSN_LSX(vbitrev_d,        vvv)
+INSN_LSX(vbitrevi_b,       vv_i)
+INSN_LSX(vbitrevi_h,       vv_i)
+INSN_LSX(vbitrevi_w,       vv_i)
+INSN_LSX(vbitrevi_d,       vv_i)
diff --git a/target/loongarch/helper.h b/target/loongarch/helper.h
index 38e310512b..4622f788ee 100644
--- a/target/loongarch/helper.h
+++ b/target/loongarch/helper.h
@@ -500,3 +500,28 @@ DEF_HELPER_3(vpcnt_b, void, env, i32, i32)
 DEF_HELPER_3(vpcnt_h, void, env, i32, i32)
 DEF_HELPER_3(vpcnt_w, void, env, i32, i32)
 DEF_HELPER_3(vpcnt_d, void, env, i32, i32)
+
+DEF_HELPER_4(vbitclr_b, void, env, i32, i32, i32)
+DEF_HELPER_4(vbitclr_h, void, env, i32, i32, i32)
+DEF_HELPER_4(vbitclr_w, void, env, i32, i32, i32)
+DEF_HELPER_4(vbitclr_d, void, env, i32, i32, i32)
+DEF_HELPER_4(vbitclri_b, void, env, i32, i32, i32)
+DEF_HELPER_4(vbitclri_h, void, env, i32, i32, i32)
+DEF_HELPER_4(vbitclri_w, void, env, i32, i32, i32)
+DEF_HELPER_4(vbitclri_d, void, env, i32, i32, i32)
+DEF_HELPER_4(vbitset_b, void, env, i32, i32, i32)
+DEF_HELPER_4(vbitset_h, void, env, i32, i32, i32)
+DEF_HELPER_4(vbitset_w, void, env, i32, i32, i32)
+DEF_HELPER_4(vbitset_d, void, env, i32, i32, i32)
+DEF_HELPER_4(vbitseti_b, void, env, i32, i32, i32)
+DEF_HELPER_4(vbitseti_h, void, env, i32, i32, i32)
+DEF_HELPER_4(vbitseti_w, void, env, i32, i32, i32)
+DEF_HELPER_4(vbitseti_d, void, env, i32, i32, i32)
+DEF_HELPER_4(vbitrev_b, void, env, i32, i32, i32)
+DEF_HELPER_4(vbitrev_h, void, env, i32, i32, i32)
+DEF_HELPER_4(vbitrev_w, void, env, i32, i32, i32)
+DEF_HELPER_4(vbitrev_d, void, env, i32, i32, i32)
+DEF_HELPER_4(vbitrevi_b, void, env, i32, i32, i32)
+DEF_HELPER_4(vbitrevi_h, void, env, i32, i32, i32)
+DEF_HELPER_4(vbitrevi_w, void, env, i32, i32, i32)
+DEF_HELPER_4(vbitrevi_d, void, env, i32, i32, i32)
diff --git a/target/loongarch/insn_trans/trans_lsx.c.inc b/target/loongarch/insn_trans/trans_lsx.c.inc
index 59923eb1fa..6d3a804767 100644
--- a/target/loongarch/insn_trans/trans_lsx.c.inc
+++ b/target/loongarch/insn_trans/trans_lsx.c.inc
@@ -2799,3 +2799,28 @@ TRANS(vpcnt_b, gen_vv, gen_helper_vpcnt_b)
 TRANS(vpcnt_h, gen_vv, gen_helper_vpcnt_h)
 TRANS(vpcnt_w, gen_vv, gen_helper_vpcnt_w)
 TRANS(vpcnt_d, gen_vv, gen_helper_vpcnt_d)
+
+TRANS(vbitclr_b, gen_vvv, gen_helper_vbitclr_b)
+TRANS(vbitclr_h, gen_vvv, gen_helper_vbitclr_h)
+TRANS(vbitclr_w, gen_vvv, gen_helper_vbitclr_w)
+TRANS(vbitclr_d, gen_vvv, gen_helper_vbitclr_d)
+TRANS(vbitclri_b, gen_vv_i, gen_helper_vbitclri_b)
+TRANS(vbitclri_h, gen_vv_i, gen_helper_vbitclri_h)
+TRANS(vbitclri_w, gen_vv_i, gen_helper_vbitclri_w)
+TRANS(vbitclri_d, gen_vv_i, gen_helper_vbitclri_d)
+TRANS(vbitset_b, gen_vvv, gen_helper_vbitset_b)
+TRANS(vbitset_h, gen_vvv, gen_helper_vbitset_h)
+TRANS(vbitset_w, gen_vvv, gen_helper_vbitset_w)
+TRANS(vbitset_d, gen_vvv, gen_helper_vbitset_d)
+TRANS(vbitseti_b, gen_vv_i, gen_helper_vbitseti_b)
+TRANS(vbitseti_h, gen_vv_i, gen_helper_vbitseti_h)
+TRANS(vbitseti_w, gen_vv_i, gen_helper_vbitseti_w)
+TRANS(vbitseti_d, gen_vv_i, gen_helper_vbitseti_d)
+TRANS(vbitrev_b, gen_vvv, gen_helper_vbitrev_b)
+TRANS(vbitrev_h, gen_vvv, gen_helper_vbitrev_h)
+TRANS(vbitrev_w, gen_vvv, gen_helper_vbitrev_w)
+TRANS(vbitrev_d, gen_vvv, gen_helper_vbitrev_d)
+TRANS(vbitrevi_b, gen_vv_i, gen_helper_vbitrevi_b)
+TRANS(vbitrevi_h, gen_vv_i, gen_helper_vbitrevi_h)
+TRANS(vbitrevi_w, gen_vv_i, gen_helper_vbitrevi_w)
+TRANS(vbitrevi_d, gen_vv_i, gen_helper_vbitrevi_d)
diff --git a/target/loongarch/insns.decode b/target/loongarch/insns.decode
index f865e83da5..801c97714e 100644
--- a/target/loongarch/insns.decode
+++ b/target/loongarch/insns.decode
@@ -973,3 +973,28 @@ vpcnt_b          0111 00101001 11000 01000 ..... .....    @vv
 vpcnt_h          0111 00101001 11000 01001 ..... .....    @vv
 vpcnt_w          0111 00101001 11000 01010 ..... .....    @vv
 vpcnt_d          0111 00101001 11000 01011 ..... .....    @vv
+
+vbitclr_b        0111 00010000 11000 ..... ..... .....    @vvv
+vbitclr_h        0111 00010000 11001 ..... ..... .....    @vvv
+vbitclr_w        0111 00010000 11010 ..... ..... .....    @vvv
+vbitclr_d        0111 00010000 11011 ..... ..... .....    @vvv
+vbitclri_b       0111 00110001 00000 01 ... ..... .....   @vv_ui3
+vbitclri_h       0111 00110001 00000 1 .... ..... .....   @vv_ui4
+vbitclri_w       0111 00110001 00001 ..... ..... .....    @vv_ui5
+vbitclri_d       0111 00110001 0001 ...... ..... .....    @vv_ui6
+vbitset_b        0111 00010000 11100 ..... ..... .....    @vvv
+vbitset_h        0111 00010000 11101 ..... ..... .....    @vvv
+vbitset_w        0111 00010000 11110 ..... ..... .....    @vvv
+vbitset_d        0111 00010000 11111 ..... ..... .....    @vvv
+vbitseti_b       0111 00110001 01000 01 ... ..... .....   @vv_ui3
+vbitseti_h       0111 00110001 01000 1 .... ..... .....   @vv_ui4
+vbitseti_w       0111 00110001 01001 ..... ..... .....    @vv_ui5
+vbitseti_d       0111 00110001 0101 ...... ..... .....    @vv_ui6
+vbitrev_b        0111 00010001 00000 ..... ..... .....    @vvv
+vbitrev_h        0111 00010001 00001 ..... ..... .....    @vvv
+vbitrev_w        0111 00010001 00010 ..... ..... .....    @vvv
+vbitrev_d        0111 00010001 00011 ..... ..... .....    @vvv
+vbitrevi_b       0111 00110001 10000 01 ... ..... .....   @vv_ui3
+vbitrevi_h       0111 00110001 10000 1 .... ..... .....   @vv_ui4
+vbitrevi_w       0111 00110001 10001 ..... ..... .....    @vv_ui5
+vbitrevi_d       0111 00110001 1001 ...... ..... .....    @vv_ui6
diff --git a/target/loongarch/lsx_helper.c b/target/loongarch/lsx_helper.c
index 94dded7e49..e23c75bd56 100644
--- a/target/loongarch/lsx_helper.c
+++ b/target/loongarch/lsx_helper.c
@@ -2231,3 +2231,60 @@ VPCNT(vpcnt_b, 8, B, uint8_t)
 VPCNT(vpcnt_h, 16, H, uint16_t)
 VPCNT(vpcnt_w, 32, W, uint32_t)
 VPCNT(vpcnt_d, 64, D, uint64_t)
+
+#define DO_BITCLR(a, bit) (a & ~(1ul << bit))
+#define DO_BITSET(a, bit) (a | 1ul << bit)
+#define DO_BITREV(a, bit) (a ^ (1ul << bit))
+
+#define DO_BIT(NAME, BIT, T, E, DO_OP)                   \
+void HELPER(NAME)(CPULoongArchState *env,                \
+                  uint32_t vd, uint32_t vj, uint32_t vk) \
+{                                                        \
+    int i;                                               \
+    VReg *Vd = &(env->fpr[vd].vreg);                     \
+    VReg *Vj = &(env->fpr[vj].vreg);                     \
+    VReg *Vk = &(env->fpr[vk].vreg);                     \
+                                                         \
+    for (i = 0; i < LSX_LEN/BIT; i++) {                  \
+        Vd->E(i) = DO_OP((T)Vj->E(i), (T)Vk->E(i)%BIT);  \
+    }                                                    \
+}
+
+DO_BIT(vbitclr_b, 8, uint8_t, B, DO_BITCLR)
+DO_BIT(vbitclr_h, 16, uint16_t, H, DO_BITCLR)
+DO_BIT(vbitclr_w, 32, uint32_t, W, DO_BITCLR)
+DO_BIT(vbitclr_d, 64, uint64_t, D, DO_BITCLR)
+DO_BIT(vbitset_b, 8, uint8_t, B, DO_BITSET)
+DO_BIT(vbitset_h, 16, uint16_t, H, DO_BITSET)
+DO_BIT(vbitset_w, 32, uint32_t, W, DO_BITSET)
+DO_BIT(vbitset_d, 64, uint64_t, D, DO_BITSET)
+DO_BIT(vbitrev_b, 8, uint8_t, B, DO_BITREV)
+DO_BIT(vbitrev_h, 16, uint16_t, H, DO_BITREV)
+DO_BIT(vbitrev_w, 32, uint32_t, W, DO_BITREV)
+DO_BIT(vbitrev_d, 64, uint64_t, D, DO_BITREV)
+
+#define DO_BITI(NAME, BIT, T, E, DO_OP)                   \
+void HELPER(NAME)(CPULoongArchState *env,                 \
+                  uint32_t vd, uint32_t vj, uint32_t imm) \
+{                                                         \
+    int i;                                                \
+    VReg *Vd = &(env->fpr[vd].vreg);                      \
+    VReg *Vj = &(env->fpr[vj].vreg);                      \
+                                                          \
+    for (i = 0; i < LSX_LEN/BIT; i++) {                   \
+        Vd->E(i) = DO_OP((T)Vj->E(i), imm);               \
+    }                                                     \
+}
+
+DO_BITI(vbitclri_b, 8, uint8_t, B, DO_BITCLR)
+DO_BITI(vbitclri_h, 16, uint16_t, H, DO_BITCLR)
+DO_BITI(vbitclri_w, 32, uint32_t, W, DO_BITCLR)
+DO_BITI(vbitclri_d, 64, uint64_t, D, DO_BITCLR)
+DO_BITI(vbitseti_b, 8, uint8_t, B, DO_BITSET)
+DO_BITI(vbitseti_h, 16, uint16_t, H, DO_BITSET)
+DO_BITI(vbitseti_w, 32, uint32_t, W, DO_BITSET)
+DO_BITI(vbitseti_d, 64, uint64_t, D, DO_BITSET)
+DO_BITI(vbitrevi_b, 8, uint8_t, B, DO_BITREV)
+DO_BITI(vbitrevi_h, 16, uint16_t, H, DO_BITREV)
+DO_BITI(vbitrevi_w, 32, uint32_t, W, DO_BITREV)
+DO_BITI(vbitrevi_d, 64, uint64_t, D, DO_BITREV)
-- 
2.31.1


