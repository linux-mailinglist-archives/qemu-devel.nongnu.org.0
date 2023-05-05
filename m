Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EDEB6F7AF8
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 04:31:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pulCO-0005hX-N7; Thu, 04 May 2023 22:29:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1pulCL-0005ai-NR
 for qemu-devel@nongnu.org; Thu, 04 May 2023 22:29:29 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1pulCI-0000HN-2v
 for qemu-devel@nongnu.org; Thu, 04 May 2023 22:29:29 -0400
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8AxFun5aVRk_vcEAA--.8194S3;
 Fri, 05 May 2023 10:29:13 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Bx8a+2aVRkNw9LAA--.7251S34; 
 Fri, 05 May 2023 10:29:12 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org
Subject: [PULL 32/45] target/loongarch: Implement vfrstp
Date: Fri,  5 May 2023 10:27:53 +0800
Message-Id: <20230505022806.6082-33-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230505022806.6082-1-gaosong@loongson.cn>
References: <20230505022806.6082-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Bx8a+2aVRkNw9LAA--.7251S34
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoWxZF1fAFyDXry8Xr4DAFyftFb_yoWrZr1kpr
 W2kryUKr48XrW7Xrnaqa15Aw1UZr4kKw129a1ft34q9w45WFyDXF1vq3ykKa1Yg3ZIqFy0
 q3WfC345AFyfZw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
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
- VFRSTP[I].{B/H}.

Acked-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Song Gao <gaosong@loongson.cn>
Message-Id: <20230504122810.4094787-33-gaosong@loongson.cn>
---
 target/loongarch/disas.c                    |  5 +++
 target/loongarch/helper.h                   |  5 +++
 target/loongarch/insn_trans/trans_lsx.c.inc |  5 +++
 target/loongarch/insns.decode               |  5 +++
 target/loongarch/lsx_helper.c               | 41 +++++++++++++++++++++
 5 files changed, 61 insertions(+)

diff --git a/target/loongarch/disas.c b/target/loongarch/disas.c
index 48c7ea47a4..be2bb9cc42 100644
--- a/target/loongarch/disas.c
+++ b/target/loongarch/disas.c
@@ -1297,3 +1297,8 @@ INSN_LSX(vbitrevi_b,       vv_i)
 INSN_LSX(vbitrevi_h,       vv_i)
 INSN_LSX(vbitrevi_w,       vv_i)
 INSN_LSX(vbitrevi_d,       vv_i)
+
+INSN_LSX(vfrstp_b,         vvv)
+INSN_LSX(vfrstp_h,         vvv)
+INSN_LSX(vfrstpi_b,        vv_i)
+INSN_LSX(vfrstpi_h,        vv_i)
diff --git a/target/loongarch/helper.h b/target/loongarch/helper.h
index 75120ca55e..2cc235d019 100644
--- a/target/loongarch/helper.h
+++ b/target/loongarch/helper.h
@@ -512,3 +512,8 @@ DEF_HELPER_FLAGS_4(vbitrevi_b, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
 DEF_HELPER_FLAGS_4(vbitrevi_h, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
 DEF_HELPER_FLAGS_4(vbitrevi_w, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
 DEF_HELPER_FLAGS_4(vbitrevi_d, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
+
+DEF_HELPER_4(vfrstp_b, void, env, i32, i32, i32)
+DEF_HELPER_4(vfrstp_h, void, env, i32, i32, i32)
+DEF_HELPER_4(vfrstpi_b, void, env, i32, i32, i32)
+DEF_HELPER_4(vfrstpi_h, void, env, i32, i32, i32)
diff --git a/target/loongarch/insn_trans/trans_lsx.c.inc b/target/loongarch/insn_trans/trans_lsx.c.inc
index 86243b54ba..ee84a5a4ee 100644
--- a/target/loongarch/insn_trans/trans_lsx.c.inc
+++ b/target/loongarch/insn_trans/trans_lsx.c.inc
@@ -3416,3 +3416,8 @@ TRANS(vbitrevi_b, gvec_vv_i, MO_8, do_vbitrevi)
 TRANS(vbitrevi_h, gvec_vv_i, MO_16, do_vbitrevi)
 TRANS(vbitrevi_w, gvec_vv_i, MO_32, do_vbitrevi)
 TRANS(vbitrevi_d, gvec_vv_i, MO_64, do_vbitrevi)
+
+TRANS(vfrstp_b, gen_vvv, gen_helper_vfrstp_b)
+TRANS(vfrstp_h, gen_vvv, gen_helper_vfrstp_h)
+TRANS(vfrstpi_b, gen_vv_i, gen_helper_vfrstpi_b)
+TRANS(vfrstpi_h, gen_vv_i, gen_helper_vfrstpi_h)
diff --git a/target/loongarch/insns.decode b/target/loongarch/insns.decode
index 801c97714e..4cb286ffe5 100644
--- a/target/loongarch/insns.decode
+++ b/target/loongarch/insns.decode
@@ -998,3 +998,8 @@ vbitrevi_b       0111 00110001 10000 01 ... ..... .....   @vv_ui3
 vbitrevi_h       0111 00110001 10000 1 .... ..... .....   @vv_ui4
 vbitrevi_w       0111 00110001 10001 ..... ..... .....    @vv_ui5
 vbitrevi_d       0111 00110001 1001 ...... ..... .....    @vv_ui6
+
+vfrstp_b         0111 00010010 10110 ..... ..... .....    @vvv
+vfrstp_h         0111 00010010 10111 ..... ..... .....    @vvv
+vfrstpi_b        0111 00101001 10100 ..... ..... .....    @vv_ui5
+vfrstpi_h        0111 00101001 10101 ..... ..... .....    @vv_ui5
diff --git a/target/loongarch/lsx_helper.c b/target/loongarch/lsx_helper.c
index f160abfd8e..ad0d2dbe87 100644
--- a/target/loongarch/lsx_helper.c
+++ b/target/loongarch/lsx_helper.c
@@ -2019,3 +2019,44 @@ DO_BITI(vbitrevi_b, 8, UB, DO_BITREV)
 DO_BITI(vbitrevi_h, 16, UH, DO_BITREV)
 DO_BITI(vbitrevi_w, 32, UW, DO_BITREV)
 DO_BITI(vbitrevi_d, 64, UD, DO_BITREV)
+
+#define VFRSTP(NAME, BIT, MASK, E)                       \
+void HELPER(NAME)(CPULoongArchState *env,                \
+                  uint32_t vd, uint32_t vj, uint32_t vk) \
+{                                                        \
+    int i, m;                                            \
+    VReg *Vd = &(env->fpr[vd].vreg);                     \
+    VReg *Vj = &(env->fpr[vj].vreg);                     \
+    VReg *Vk = &(env->fpr[vk].vreg);                     \
+                                                         \
+    for (i = 0; i < LSX_LEN/BIT; i++) {                  \
+        if (Vj->E(i) < 0) {                              \
+            break;                                       \
+        }                                                \
+    }                                                    \
+    m = Vk->E(0) & MASK;                                 \
+    Vd->E(m) = i;                                        \
+}
+
+VFRSTP(vfrstp_b, 8, 0xf, B)
+VFRSTP(vfrstp_h, 16, 0x7, H)
+
+#define VFRSTPI(NAME, BIT, E)                             \
+void HELPER(NAME)(CPULoongArchState *env,                 \
+                  uint32_t vd, uint32_t vj, uint32_t imm) \
+{                                                         \
+    int i, m;                                             \
+    VReg *Vd = &(env->fpr[vd].vreg);                      \
+    VReg *Vj = &(env->fpr[vj].vreg);                      \
+                                                          \
+    for (i = 0; i < LSX_LEN/BIT; i++) {                   \
+        if (Vj->E(i) < 0) {                               \
+            break;                                        \
+        }                                                 \
+    }                                                     \
+    m = imm % (LSX_LEN/BIT);                              \
+    Vd->E(m) = i;                                         \
+}
+
+VFRSTPI(vfrstpi_b, 8,  B)
+VFRSTPI(vfrstpi_h, 16, H)
-- 
2.31.1


