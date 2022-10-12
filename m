Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95FBD5FC300
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 11:22:48 +0200 (CEST)
Received: from localhost ([::1]:36836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiXwt-0002WT-Bc
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 05:22:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huqi@loongson.cn>) id 1oiXo4-0002gY-8E
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 05:13:44 -0400
Received: from mail.loongson.cn ([114.242.206.163]:44886 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huqi@loongson.cn>) id 1oiXny-0001sM-G7
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 05:13:40 -0400
Received: from lingfengzhe-ms7c94.loongson.cn (unknown [10.90.50.23])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8BxXWs3hUZj6NIrAA--.30362S4; 
 Wed, 12 Oct 2022 17:13:27 +0800 (CST)
From: Qi Hu <huqi@loongson.cn>
To: WANG Xuerui <git@xen0n.name>,
 Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: [PATCH 2/2] tcg/loongarch64: Add direct jump support
Date: Wed, 12 Oct 2022 17:13:27 +0800
Message-Id: <cc5770f1a03bf90fa8b990666fb061b1e063b803.1665405913.git.huqi@loongson.cn>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <cover.1665405913.git.huqi@loongson.cn>
References: <cover.1665405913.git.huqi@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8BxXWs3hUZj6NIrAA--.30362S4
X-Coremail-Antispam: 1UD129KBjvJXoWxAFyDJF47Xw1rWF1UAF4kCrg_yoWrGF17pr
 93Crn8tF48JFZ7JrW3C3WDJry3Jws8u342qa1xKr48Zws0qw1UZa1fKrW2qFyjgF1FvrW7
 u3Z0yw13WFWDAaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9Kb7Iv0xC_tr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
 8067AKxVWUXwA2048vs2IY020Ec7CjxVAFwI0_JFI_Gr1l8cAvFVAK0II2c7xJM28CjxkF
 64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcV
 CY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv
 6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c
 02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE
 4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc2xSY4AK6svPMxAIw28IcxkI7VAKI4
 8JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xv
 wVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUXVWUAwCIc40Y0x0EwIxGrwCI42IY6xIIjx
 v20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20E
 Y4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267
 AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUcaZXUUUUU
X-CM-SenderInfo: pkxtxqxorr0wxvrqhubq/1tbiAQARCWNFXOAxfQAKsF
Received-SPF: pass client-ip=114.242.206.163; envelope-from=huqi@loongson.cn;
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Similar to the ARM64, LoongArch has PC-relative instructions such as
PCADDU18I. These instructions can be used to support direct jump for
LoongArch. Additionally, if instruction "B offset" can cover the target
address, "tb_target_set_jmp_target" will only patch the "B offset".

Signed-off-by: Qi Hu <huqi@loongson.cn>
---
 tcg/loongarch64/tcg-insn-defs.c.inc |  3 ++
 tcg/loongarch64/tcg-target.c.inc    | 49 ++++++++++++++++++++++++++---
 tcg/loongarch64/tcg-target.h        |  2 +-
 3 files changed, 48 insertions(+), 6 deletions(-)

diff --git a/tcg/loongarch64/tcg-insn-defs.c.inc b/tcg/loongarch64/tcg-insn-defs.c.inc
index d162571856..f5869c6bb1 100644
--- a/tcg/loongarch64/tcg-insn-defs.c.inc
+++ b/tcg/loongarch64/tcg-insn-defs.c.inc
@@ -112,6 +112,9 @@ typedef enum {
     OPC_BLE = 0x64000000,
     OPC_BGTU = 0x68000000,
     OPC_BLEU = 0x6c000000,
+    /* pseudo-instruction */
+    NOP = 0x03400000,
+
 } LoongArchInsn;
 
 static int32_t __attribute__((unused))
diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index f5a214a17f..3a7b1df081 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -1058,11 +1058,24 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         break;
 
     case INDEX_op_goto_tb:
-        assert(s->tb_jmp_insn_offset == 0);
-        /* indirect jump method */
-        tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TMP0, TCG_REG_ZERO,
-                   (uintptr_t)(s->tb_jmp_target_addr + a0));
-        tcg_out_opc_jirl(s, TCG_REG_ZERO, TCG_REG_TMP0, 0);
+        if (s->tb_jmp_insn_offset != NULL) {
+            /* TCG_TARGET_HAS_direct_jump */
+            /* Ensure that PCADD+JIRL are 8-byte aligned so that an atomic
+               write can be used to patch the target address. */
+            if ((uintptr_t)s->code_ptr & 7) {
+                tcg_out32(s, NOP);
+            }
+            s->tb_jmp_insn_offset[a0] = tcg_current_code_size(s);
+            /* actual branch destination will be patched by
+               tb_target_set_jmp_target later. */
+            tcg_out_opc_pcaddu18i(s, TCG_REG_TMP0, 0);
+            tcg_out_opc_jirl(s, TCG_REG_ZERO, TCG_REG_TMP0, 0);
+        } else {
+            /* !TCG_TARGET_HAS_direct_jump */
+            tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TMP0, TCG_REG_ZERO,
+                    (uintptr_t)(s->tb_jmp_target_addr + a0));
+            tcg_out_opc_jirl(s, TCG_REG_ZERO, TCG_REG_TMP0, 0);
+        }
         set_jmp_reset_offset(s, a0);
         break;
 
@@ -1708,6 +1721,32 @@ static void tcg_target_init(TCGContext *s)
     tcg_regset_set_reg(s->reserved_regs, TCG_REG_RESERVED);
 }
 
+void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_rx,
+                              uintptr_t jmp_rw, uintptr_t addr)
+{
+    tcg_insn_unit i1, i2;
+
+    ptrdiff_t offset = addr - jmp_rx;
+
+    if (offset == sextreg(offset, 0, 28)) {
+        i1 = OPC_B | ((offset >> 18) & 0x3ff) | ((offset << 8) & 0x3fffc00);
+        i2 = NOP;
+    } else {
+        offset >>= 2;
+
+        ptrdiff_t upper, lower;
+        upper = ((offset + (1 << 15)) >> 16) & 0xfffff;
+        lower = (offset & 0xffff);
+        /* patch pcaddu18i */
+        i1 = OPC_PCADDU18I | upper << 5 | TCG_REG_T0;
+        /* patch jirl */
+        i2 = OPC_JIRL | lower << 10 | TCG_REG_T0 << 5;
+    }
+    uint64_t pair = (uint64_t)i2 << 32 | i1;
+    qatomic_set((uint64_t *)jmp_rw, pair);
+    flush_idcache_range(jmp_rx, jmp_rw, 8);
+}
+
 typedef struct {
     DebugFrameHeader h;
     uint8_t fde_def_cfa[4];
diff --git a/tcg/loongarch64/tcg-target.h b/tcg/loongarch64/tcg-target.h
index 67380b2432..0e552731f5 100644
--- a/tcg/loongarch64/tcg-target.h
+++ b/tcg/loongarch64/tcg-target.h
@@ -123,7 +123,7 @@ typedef enum {
 #define TCG_TARGET_HAS_clz_i32          1
 #define TCG_TARGET_HAS_ctz_i32          1
 #define TCG_TARGET_HAS_ctpop_i32        0
-#define TCG_TARGET_HAS_direct_jump      0
+#define TCG_TARGET_HAS_direct_jump      1
 #define TCG_TARGET_HAS_brcond2          0
 #define TCG_TARGET_HAS_setcond2         0
 #define TCG_TARGET_HAS_qemu_st8_i32     0
-- 
2.37.3


