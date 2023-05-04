Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ADDA6F6B7D
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 14:32:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puY4k-0001mx-Ho; Thu, 04 May 2023 08:28:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1puY4i-0001ka-JR
 for qemu-devel@nongnu.org; Thu, 04 May 2023 08:28:44 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1puY4g-00032R-BD
 for qemu-devel@nongnu.org; Thu, 04 May 2023 08:28:44 -0400
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8Cxe+rrpFNkwqAEAA--.7624S3;
 Thu, 04 May 2023 20:28:27 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Cx77PapFNk1uxJAA--.5674S32; 
 Thu, 04 May 2023 20:28:27 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	gaosong@loongson.cn
Subject: [PATCH v5 30/44] target/loongarch: Implement vpcnt
Date: Thu,  4 May 2023 20:27:56 +0800
Message-Id: <20230504122810.4094787-31-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230504122810.4094787-1-gaosong@loongson.cn>
References: <20230504122810.4094787-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Cx77PapFNk1uxJAA--.5674S32
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoWxJw1kGFWfGFyUWw4UGFW5GFg_yoW5Kr4Dpr
 42krWxKr4kXFZ3A3ZavwsYq3WUXrsrKw4I9a1ft3y8uFW7Xr1DXr1vq39FgFW5X3Z8ZFy2
 g3Way34UKFyrXwUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bn8Fc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4
 AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF
 7I0E14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x
 0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCF
 FI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VCjz48v1sIEY20_WwAm72CE4IkC6x0Yz7
 v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv
 8VWrMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7
 xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUXVWUAwCIc40Y0x0EwIxGrwCI42IY6xII
 jxv20xvE14v26F1j6w1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1lIxAIcVCF04
 k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26F4j6r4UJwCI42IY6I8E87Iv6xkF
 7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvj4RC_MaUUUUU
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
- VPCNT.{B/H/W/D}.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 target/loongarch/disas.c                    |  5 +++++
 target/loongarch/helper.h                   |  5 +++++
 target/loongarch/insn_trans/trans_lsx.c.inc |  5 +++++
 target/loongarch/insns.decode               |  5 +++++
 target/loongarch/lsx_helper.c               | 18 ++++++++++++++++++
 5 files changed, 38 insertions(+)

diff --git a/target/loongarch/disas.c b/target/loongarch/disas.c
index 0c82a1d9d1..0ca51de9d8 100644
--- a/target/loongarch/disas.c
+++ b/target/loongarch/disas.c
@@ -1267,3 +1267,8 @@ INSN_LSX(vclz_b,           vv)
 INSN_LSX(vclz_h,           vv)
 INSN_LSX(vclz_w,           vv)
 INSN_LSX(vclz_d,           vv)
+
+INSN_LSX(vpcnt_b,          vv)
+INSN_LSX(vpcnt_h,          vv)
+INSN_LSX(vpcnt_w,          vv)
+INSN_LSX(vpcnt_d,          vv)
diff --git a/target/loongarch/helper.h b/target/loongarch/helper.h
index e21e9b9704..96b9b16923 100644
--- a/target/loongarch/helper.h
+++ b/target/loongarch/helper.h
@@ -480,3 +480,8 @@ DEF_HELPER_3(vclz_b, void, env, i32, i32)
 DEF_HELPER_3(vclz_h, void, env, i32, i32)
 DEF_HELPER_3(vclz_w, void, env, i32, i32)
 DEF_HELPER_3(vclz_d, void, env, i32, i32)
+
+DEF_HELPER_3(vpcnt_b, void, env, i32, i32)
+DEF_HELPER_3(vpcnt_h, void, env, i32, i32)
+DEF_HELPER_3(vpcnt_w, void, env, i32, i32)
+DEF_HELPER_3(vpcnt_d, void, env, i32, i32)
diff --git a/target/loongarch/insn_trans/trans_lsx.c.inc b/target/loongarch/insn_trans/trans_lsx.c.inc
index c7649fb777..f4ebdca63c 100644
--- a/target/loongarch/insn_trans/trans_lsx.c.inc
+++ b/target/loongarch/insn_trans/trans_lsx.c.inc
@@ -3106,3 +3106,8 @@ TRANS(vclz_b, gen_vv, gen_helper_vclz_b)
 TRANS(vclz_h, gen_vv, gen_helper_vclz_h)
 TRANS(vclz_w, gen_vv, gen_helper_vclz_w)
 TRANS(vclz_d, gen_vv, gen_helper_vclz_d)
+
+TRANS(vpcnt_b, gen_vv, gen_helper_vpcnt_b)
+TRANS(vpcnt_h, gen_vv, gen_helper_vpcnt_h)
+TRANS(vpcnt_w, gen_vv, gen_helper_vpcnt_w)
+TRANS(vpcnt_d, gen_vv, gen_helper_vpcnt_d)
diff --git a/target/loongarch/insns.decode b/target/loongarch/insns.decode
index 7591ec1bab..f865e83da5 100644
--- a/target/loongarch/insns.decode
+++ b/target/loongarch/insns.decode
@@ -968,3 +968,8 @@ vclz_b           0111 00101001 11000 00100 ..... .....    @vv
 vclz_h           0111 00101001 11000 00101 ..... .....    @vv
 vclz_w           0111 00101001 11000 00110 ..... .....    @vv
 vclz_d           0111 00101001 11000 00111 ..... .....    @vv
+
+vpcnt_b          0111 00101001 11000 01000 ..... .....    @vv
+vpcnt_h          0111 00101001 11000 01001 ..... .....    @vv
+vpcnt_w          0111 00101001 11000 01010 ..... .....    @vv
+vpcnt_d          0111 00101001 11000 01011 ..... .....    @vv
diff --git a/target/loongarch/lsx_helper.c b/target/loongarch/lsx_helper.c
index 044032f180..f18c4a2978 100644
--- a/target/loongarch/lsx_helper.c
+++ b/target/loongarch/lsx_helper.c
@@ -1946,3 +1946,21 @@ DO_2OP(vclz_b, 8, UB, DO_CLZ_B)
 DO_2OP(vclz_h, 16, UH, DO_CLZ_H)
 DO_2OP(vclz_w, 32, UW, DO_CLZ_W)
 DO_2OP(vclz_d, 64, UD, DO_CLZ_D)
+
+#define VPCNT(NAME, BIT, E, FN)                                     \
+void HELPER(NAME)(CPULoongArchState *env, uint32_t vd, uint32_t vj) \
+{                                                                   \
+    int i;                                                          \
+    VReg *Vd = &(env->fpr[vd].vreg);                                \
+    VReg *Vj = &(env->fpr[vj].vreg);                                \
+                                                                    \
+    for (i = 0; i < LSX_LEN/BIT; i++)                               \
+    {                                                               \
+        Vd->E(i) = FN(Vj->E(i));                                    \
+    }                                                               \
+}
+
+VPCNT(vpcnt_b, 8, UB, ctpop8)
+VPCNT(vpcnt_h, 16, UH, ctpop16)
+VPCNT(vpcnt_w, 32, UW, ctpop32)
+VPCNT(vpcnt_d, 64, UD, ctpop64)
-- 
2.31.1


