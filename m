Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 582CA5FD36A
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 05:05:38 +0200 (CEST)
Received: from localhost ([::1]:52612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oioXR-0005xm-14
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 23:05:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huqi@loongson.cn>) id 1oioTY-0003xh-Oa
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 23:01:38 -0400
Received: from mail.loongson.cn ([114.242.206.163]:53892 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huqi@loongson.cn>) id 1oioTU-0007ys-Eu
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 23:01:35 -0400
Received: from lingfengzhe-ms7c94.loongson.cn (unknown [10.90.50.23])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8CxkOCDf0djap8sAA--.29394S2; 
 Thu, 13 Oct 2022 11:01:23 +0800 (CST)
From: Qi Hu <huqi@loongson.cn>
To: WANG Xuerui <git@xen0n.name>,
 Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: [PATCH v2] tcg/loongarch64: Add direct jump support
Date: Thu, 13 Oct 2022 11:01:23 +0800
Message-Id: <20221013030123.979720-1-huqi@loongson.cn>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <cc5770f1a03bf90fa8b990666fb061b1e063b803.1665405913.git.huqi@loongson.cn>
References: <cc5770f1a03bf90fa8b990666fb061b1e063b803.1665405913.git.huqi@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8CxkOCDf0djap8sAA--.29394S2
X-Coremail-Antispam: 1UD129KBjvJXoWxAFy3XFWfWFyfCF4ftw4rGrg_yoWrJw1xpr
 93CFn8tr45JFZxt39Ik3WDJry3J3Z5uryjqF4xKr48Z398J348ZFZ3KrW3tFWjgF1FvrW7
 ZFn0y343WF4DAaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkYb7Iv0xC_KF4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4
 vEx4A2jsIEc7CjxVAFwI0_Cr1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVAC
 Y4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJV
 W8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc2xSY4AK6svPMxAIw28I
 cxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2
 IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUXVWUAwCIc40Y0x0EwIxGrwCI
 42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42
 IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280
 aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8P5r7UUUUU==
X-CM-SenderInfo: pkxtxqxorr0wxvrqhubq/1tbiAQASCWNGrmAKHwAFsh
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
 tcg/loongarch64/tcg-target.c.inc | 53 +++++++++++++++++++++++++++++---
 tcg/loongarch64/tcg-target.h     |  3 +-
 2 files changed, 49 insertions(+), 7 deletions(-)

diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index f5a214a17f..9f9508836a 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -1031,6 +1031,36 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args)
 #endif
 }
 
+/* LoongArch use `andi zero, zero, 0` as NOP.  */
+#define NOP OPC_ANDI
+static void tcg_out_nop(TCGContext *s)
+{
+	tcg_out32(s, NOP);
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
+        upper = ((offset + (1 << 15)) >> 16) & 0xfffff;
+        lower = (offset & 0xffff);
+        /* patch pcaddu18i */
+        i1 = encode_dsj20_insn(OPC_PCADDU18I, TCG_REG_T0, upper);
+        /* patch jirl */
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
@@ -1058,11 +1088,24 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         break;
 
     case INDEX_op_goto_tb:
-        assert(s->tb_jmp_insn_offset == 0);
-        /* indirect jump method */
-        tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TMP0, TCG_REG_ZERO,
-                   (uintptr_t)(s->tb_jmp_target_addr + a0));
-        tcg_out_opc_jirl(s, TCG_REG_ZERO, TCG_REG_TMP0, 0);
+        if (s->tb_jmp_insn_offset != NULL) {
+            /* TCG_TARGET_HAS_direct_jump */
+            /* Ensure that "patch area" are 8-byte aligned so that an
+               atomic write can be used to patch the target address. */
+            if ((uintptr_t)s->code_ptr & 7) {
+                tcg_out_nop(s);
+            }
+            s->tb_jmp_insn_offset[a0] = tcg_current_code_size(s);
+            /* actual branch destination will be patched by
+               tb_target_set_jmp_target later */
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
index 67380b2432..c008d5686d 100644
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
@@ -166,7 +166,6 @@ typedef enum {
 #define TCG_TARGET_HAS_muluh_i64        1
 #define TCG_TARGET_HAS_mulsh_i64        1
 
-/* not defined -- call should be eliminated at compile time */
 void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t);
 
 #define TCG_TARGET_DEFAULT_MO (0)
-- 
2.37.3


