Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F1D5FE7A7
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 05:42:18 +0200 (CEST)
Received: from localhost ([::1]:40722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ojBaS-0001dz-Tk
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 23:42:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huqi@loongson.cn>) id 1ojBYj-0000AN-AY
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 23:40:29 -0400
Received: from mail.loongson.cn ([114.242.206.163]:39018 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huqi@loongson.cn>) id 1ojBYg-00050b-Ir
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 23:40:29 -0400
Received: from lingfengzhe-ms7c94.loongson.cn (unknown [10.90.50.23])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8DxReIk2khjntotAA--.33108S2; 
 Fri, 14 Oct 2022 11:40:20 +0800 (CST)
From: Qi Hu <huqi@loongson.cn>
To: WANG Xuerui <git@xen0n.name>,
 Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: [PATCH v3] tcg/loongarch64: Add direct jump support
Date: Fri, 14 Oct 2022 11:40:20 +0800
Message-Id: <20221014034020.1167864-1-huqi@loongson.cn>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8DxReIk2khjntotAA--.33108S2
X-Coremail-Antispam: 1UD129KBjvJXoWxAFy3XFWfWFy7JrW7JFyxKrg_yoWrXrWUpr
 93CFn8tF45JFZIy3yakFn8Jry7Jas5uryUXF4xKr48Zan8t348ZFZ5KrW3tFWjgFyFvrWx
 ZFs0y343Wa1DAaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkjb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4
 vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
 F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r
 4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY02Avz4vE-syl42xK82IY
 c2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s
 026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1Y6r17MIIYrxkI7VAKI48JMIIF
 0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0x
 vE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv
 6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07bOoGdUUUUU=
X-CM-SenderInfo: pkxtxqxorr0wxvrqhubq/1tbiAQATCWNH-+ATFgACsn
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
address(target is within ±128MB range), a single "B offset" plus a nop
will be used by "tb_target_set_jump_target".

Signed-off-by: Qi Hu <huqi@loongson.cn>
---
 tcg/loongarch64/tcg-target.c.inc | 56 +++++++++++++++++++++++++++++---
 tcg/loongarch64/tcg-target.h     |  5 ++-
 2 files changed, 53 insertions(+), 8 deletions(-)

diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index f5a214a17f..2a068a52cc 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -1031,6 +1031,35 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args)
 #endif
 }
 
+/* LoongArch use `andi zero, zero, 0` as NOP.  */
+#define NOP OPC_ANDI
+static void tcg_out_nop(TCGContext *s)
+{
+    tcg_out32(s, NOP);
+}
+
+void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_rx,
+                              uintptr_t jmp_rw, uintptr_t addr)
+{
+    tcg_insn_unit i1, i2;
+    ptrdiff_t upper, lower;
+    ptrdiff_t offset = (addr - jmp_rx) >> 2;
+
+    if (offset == sextreg(offset, 0, 28)) {
+        i1 = encode_sd10k16_insn(OPC_B, offset);
+        i2 = NOP;
+    } else {
+        lower = (int16_t)offset;
+        upper = (offset - lower) >> 16;
+
+        i1 = encode_dsj20_insn(OPC_PCADDU18I, TCG_REG_T0, upper);
+        i2 = encode_djsk16_insn(OPC_JIRL, TCG_REG_ZERO, TCG_REG_T0, lower);
+    }
+    uint64_t pair = ((uint64_t)i2 << 32) | i1;
+    qatomic_set((uint64_t *)jmp_rw, pair);
+    flush_idcache_range(jmp_rx, jmp_rw, 8);
+}
+
 /*
  * Entry-points
  */
@@ -1058,11 +1087,28 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         break;
 
     case INDEX_op_goto_tb:
-        assert(s->tb_jmp_insn_offset == 0);
-        /* indirect jump method */
-        tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TMP0, TCG_REG_ZERO,
-                   (uintptr_t)(s->tb_jmp_target_addr + a0));
-        tcg_out_opc_jirl(s, TCG_REG_ZERO, TCG_REG_TMP0, 0);
+        if (s->tb_jmp_insn_offset != NULL) {
+            /* TCG_TARGET_HAS_direct_jump */
+            /*
+             * Ensure that "patch area" are 8-byte aligned so that an
+             * atomic write can be used to patch the target address.
+             */
+            if ((uintptr_t)s->code_ptr & 7) {
+                tcg_out_nop(s);
+            }
+            s->tb_jmp_insn_offset[a0] = tcg_current_code_size(s);
+            /*
+             * actual branch destination will be patched by
+             * tb_target_set_jmp_target later
+             */
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
 
diff --git a/tcg/loongarch64/tcg-target.h b/tcg/loongarch64/tcg-target.h
index 67380b2432..ee207ec32c 100644
--- a/tcg/loongarch64/tcg-target.h
+++ b/tcg/loongarch64/tcg-target.h
@@ -42,7 +42,7 @@
 
 #define TCG_TARGET_INSN_UNIT_SIZE 4
 #define TCG_TARGET_NB_REGS 32
-#define MAX_CODE_GEN_BUFFER_SIZE  SIZE_MAX
+#define MAX_CODE_GEN_BUFFER_SIZE  (128 * GiB)
 
 typedef enum {
     TCG_REG_ZERO,
@@ -123,7 +123,7 @@ typedef enum {
 #define TCG_TARGET_HAS_clz_i32          1
 #define TCG_TARGET_HAS_ctz_i32          1
 #define TCG_TARGET_HAS_ctpop_i32        0
-#define TCG_TARGET_HAS_direct_jump      0
+#define TCG_TARGET_HAS_direct_jump      1
 #define TCG_TARGET_HAS_brcond2          0
 #define TCG_TARGET_HAS_setcond2         0
 #define TCG_TARGET_HAS_qemu_st8_i32     0
@@ -166,7 +166,6 @@ typedef enum {
 #define TCG_TARGET_HAS_muluh_i64        1
 #define TCG_TARGET_HAS_mulsh_i64        1
 
-/* not defined -- call should be eliminated at compile time */
 void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t);
 
 #define TCG_TARGET_DEFAULT_MO (0)
-- 
2.37.3


