Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BCEE6F8F81
	for <lists+qemu-devel@lfdr.de>; Sat,  6 May 2023 08:48:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pvBWn-0005s9-B0; Sat, 06 May 2023 02:36:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1pvBWi-0005pE-R3
 for qemu-devel@nongnu.org; Sat, 06 May 2023 02:36:16 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1pvBWg-0004KS-7j
 for qemu-devel@nongnu.org; Sat, 06 May 2023 02:36:16 -0400
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8CxNulR9VVkGaUFAA--.9567S3;
 Sat, 06 May 2023 14:36:01 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8CxDbM89VVkhCNNAA--.9773S34; 
 Sat, 06 May 2023 14:36:01 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org
Subject: [PULL v2 32/45] target/loongarch: Implement vfrstp
Date: Sat,  6 May 2023 14:35:27 +0800
Message-Id: <20230506063540.178794-33-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230506063540.178794-1-gaosong@loongson.cn>
References: <20230506063540.178794-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8CxDbM89VVkhCNNAA--.9773S34
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoWxZF1fAFyDXry8Xr4DAFyftFb_yoWrZr1kpr
 W2kryUKr48XrW7Xrnaqa15Ar1UZr4kKw129a1ft34q9w45WFyDXF1vq3ykKa1Yg3ZIqFy0
 q3WfC345AFyfZw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bnAFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4
 AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF
 7I0E14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6x
 kF7I0E14v26F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2
 zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VCjz48v1sIEY20_WwAm72CE4IkC6x
 0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxF
 aVAv8VWrMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxV
 Cjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUXVWUAwCIc40Y0x0EwIxGrwCI42IY
 6xIIjxv20xvE14v26F1j6w1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1lIxAIcV
 CF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26F4j6r4UJwCI42IY6I8E87Iv
 6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvj4RC_MaUUUUU
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
index 14e2df254d..66e9d405a4 100644
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


