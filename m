Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C20C628EC7
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 01:58:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouj2P-0005Od-SX; Mon, 14 Nov 2022 18:38:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ouj2H-0005F9-Sc
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:38:41 -0500
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ouj2F-0006oe-QP
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:38:41 -0500
Received: by mail-pg1-x532.google.com with SMTP id o13so11645722pgu.7
 for <qemu-devel@nongnu.org>; Mon, 14 Nov 2022 15:38:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6M3iRFNhKVd0TwGrz26oDC6xvInu5XUK/efCOgi0W1w=;
 b=aA5U+tCInAObFo1LyOSZpM3+wsxg4D0Lkht7YvchqpVUvAY9B7aDsL7PuOqHgogPA+
 avtNCtoZnXmEy/oU8xBalegfRCEZAKqjs9KvK2R2qZ11cn/+gNqKmbJwYEE6sY6fvcf3
 TKR8cn5+EOnleCoxALGfb1JUpHs9EqANx5kgpzfntoqoKMRkvO5lB+J/YL3CchuMhtow
 sUWTsx5M0Bqr2JgceyEGIuUPasYawDHSvm6HjCsslfWrRoS1NMLYinIrvl+Iu4q7Xe+I
 NlVOO5JLt7XrgD9FyWvDpQzflNVWyusDgu+2/EmkVBrdsrgO0hon2mPHJtY2W6uUk146
 Jzfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6M3iRFNhKVd0TwGrz26oDC6xvInu5XUK/efCOgi0W1w=;
 b=dC+t9zlHAduQZVDdzeDR7hKugLj5suecZGDeUpkZv8dU4lcl0z+WS/R8AQwvFb9X6H
 COJKN94Xjdp9d4cqfZLhgM/nYd9FA+hzYe+er4KltxIzd6zpbhInQ6a/qrm0HozSCiAL
 GksIagOYK2DhghDbvmekPLo6iOmylZJflqQwl+hXd4Qv4pfxRQTOtjURcLt2+ITW05QR
 +XaWOpYlOBzySMD3YpcCkDTbu1XWDaE2xiHbnohJpVWsPbAEJ865+v62oni6Qcd9Tb8B
 0yT5wyP8tBX1Ml+2KS4Gh4RJn15NoyfcX4R2kMtbmd1A3OGseCNtg056017U6yvqCR6Z
 ZRyg==
X-Gm-Message-State: ANoB5pn6mYHjOo1mfzYoUEZ2aQaJX0qIjJZAwDHfDYtSi+II0GfamDRr
 ZfwVR5/YwLJ4JEo7f4Fj6HBHoA2bCPtLtdbm
X-Google-Smtp-Source: AA0mqf42T4tPCQVzKrTjIC+JqbdlEjKKdTkhFBTki2i9GR1S2Efp1wd3uopsAg8/ajI0R626M5KZDQ==
X-Received: by 2002:a65:58c7:0:b0:439:3c55:3df1 with SMTP id
 e7-20020a6558c7000000b004393c553df1mr13405505pgu.606.1668469118378; 
 Mon, 14 Nov 2022 15:38:38 -0800 (PST)
Received: from stoup.. (119-18-35-77.771223.bne.static.aussiebb.net.
 [119.18.35.77]) by smtp.gmail.com with ESMTPSA id
 cp16-20020a170902e79000b00176dc67df44sm8120268plb.132.2022.11.14.15.38.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Nov 2022 15:38:37 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 1/2] target/i386: fix cmpxchg with 32-bit register destination
Date: Tue, 15 Nov 2022 09:38:28 +1000
Message-Id: <20221114233829.3329805-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221114233829.3329805-1-richard.henderson@linaro.org>
References: <20221114233829.3329805-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

From: Paolo Bonzini <pbonzini@redhat.com>

Unlike the memory case, where "the destination operand receives a write
cycle without regard to the result of the comparison", rm must not be
touched altogether if the write fails, including not zero-extending
it on 64-bit processors.  This is not how the movcond currently works,
because it is always followed by a gen_op_mov_reg_v to rm.

To fix it, introduce a new function that is similar to gen_op_mov_reg_v
but writes to a TCG temporary.

Considering that gen_extu(ot, oldv) is not needed in the memory case
either, the two cases for register and memory destinations are different
enough that one might as well fuse the two "if (mod == 3)" into one.
So do that too.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/508
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
[rth: Add a test case ]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c      | 82 ++++++++++++++++++++++----------
 tests/tcg/x86_64/cmpxchg.c       | 42 ++++++++++++++++
 tests/tcg/x86_64/Makefile.target |  1 +
 3 files changed, 99 insertions(+), 26 deletions(-)
 create mode 100644 tests/tcg/x86_64/cmpxchg.c

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 28a4e6dc1d..dbd6492778 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -439,32 +439,51 @@ static inline MemOp mo_b_d32(int b, MemOp ot)
     return b & 1 ? (ot == MO_16 ? MO_16 : MO_32) : MO_8;
 }
 
-static void gen_op_mov_reg_v(DisasContext *s, MemOp ot, int reg, TCGv t0)
+/* Compute the result of writing t0 to the OT-sized register REG.
+ *
+ * If DEST is NULL, store the result into the register and return the
+ * register's TCGv.
+ *
+ * If DEST is not NULL, store the result into DEST and return the
+ * register's TCGv.
+ */
+static TCGv gen_op_deposit_reg_v(DisasContext *s, MemOp ot, int reg, TCGv dest, TCGv t0)
 {
     switch(ot) {
     case MO_8:
-        if (!byte_reg_is_xH(s, reg)) {
-            tcg_gen_deposit_tl(cpu_regs[reg], cpu_regs[reg], t0, 0, 8);
-        } else {
-            tcg_gen_deposit_tl(cpu_regs[reg - 4], cpu_regs[reg - 4], t0, 8, 8);
+        if (byte_reg_is_xH(s, reg)) {
+            dest = dest ? dest : cpu_regs[reg - 4];
+            tcg_gen_deposit_tl(dest, cpu_regs[reg - 4], t0, 8, 8);
+            return cpu_regs[reg - 4];
         }
+        dest = dest ? dest : cpu_regs[reg];
+        tcg_gen_deposit_tl(dest, cpu_regs[reg], t0, 0, 8);
         break;
     case MO_16:
-        tcg_gen_deposit_tl(cpu_regs[reg], cpu_regs[reg], t0, 0, 16);
+        dest = dest ? dest : cpu_regs[reg];
+        tcg_gen_deposit_tl(dest, cpu_regs[reg], t0, 0, 16);
         break;
     case MO_32:
         /* For x86_64, this sets the higher half of register to zero.
            For i386, this is equivalent to a mov. */
-        tcg_gen_ext32u_tl(cpu_regs[reg], t0);
+        dest = dest ? dest : cpu_regs[reg];
+        tcg_gen_ext32u_tl(dest, t0);
         break;
 #ifdef TARGET_X86_64
     case MO_64:
-        tcg_gen_mov_tl(cpu_regs[reg], t0);
+        dest = dest ? dest : cpu_regs[reg];
+        tcg_gen_mov_tl(dest, t0);
         break;
 #endif
     default:
         tcg_abort();
     }
+    return cpu_regs[reg];
+}
+
+static void gen_op_mov_reg_v(DisasContext *s, MemOp ot, int reg, TCGv t0)
+{
+    gen_op_deposit_reg_v(s, ot, reg, NULL, t0);
 }
 
 static inline
@@ -3747,7 +3766,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
     case 0x1b0:
     case 0x1b1: /* cmpxchg Ev, Gv */
         {
-            TCGv oldv, newv, cmpv;
+            TCGv oldv, newv, cmpv, dest;
 
             ot = mo_b_d(b, dflag);
             modrm = x86_ldub_code(env, s);
@@ -3758,7 +3777,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             cmpv = tcg_temp_new();
             gen_op_mov_v_reg(s, ot, newv, reg);
             tcg_gen_mov_tl(cmpv, cpu_regs[R_EAX]);
-
+            gen_extu(ot, cmpv);
             if (s->prefix & PREFIX_LOCK) {
                 if (mod == 3) {
                     goto illegal_op;
@@ -3766,32 +3785,43 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                 gen_lea_modrm(env, s, modrm);
                 tcg_gen_atomic_cmpxchg_tl(oldv, s->A0, cmpv, newv,
                                           s->mem_index, ot | MO_LE);
-                gen_op_mov_reg_v(s, ot, R_EAX, oldv);
             } else {
                 if (mod == 3) {
                     rm = (modrm & 7) | REX_B(s);
                     gen_op_mov_v_reg(s, ot, oldv, rm);
+                    gen_extu(ot, oldv);
+
+                    /*
+                     * Unlike the memory case, where "the destination operand receives
+                     * a write cycle without regard to the result of the comparison",
+                     * rm must not be touched altogether if the write fails, including
+                     * not zero-extending it on 64-bit processors.  So, precompute
+                     * the result of a successful writeback and perform the movcond
+                     * directly on cpu_regs.  Also need to write accumulator first, in
+                     * case rm is part of RAX too.
+                     */
+                    dest = gen_op_deposit_reg_v(s, ot, rm, newv, newv);
+                    tcg_gen_movcond_tl(TCG_COND_EQ, dest, oldv, cmpv, newv, dest);
                 } else {
                     gen_lea_modrm(env, s, modrm);
                     gen_op_ld_v(s, ot, oldv, s->A0);
-                    rm = 0; /* avoid warning */
-                }
-                gen_extu(ot, oldv);
-                gen_extu(ot, cmpv);
-                /* store value = (old == cmp ? new : old);  */
-                tcg_gen_movcond_tl(TCG_COND_EQ, newv, oldv, cmpv, newv, oldv);
-                if (mod == 3) {
-                    gen_op_mov_reg_v(s, ot, R_EAX, oldv);
-                    gen_op_mov_reg_v(s, ot, rm, newv);
-                } else {
-                    /* Perform an unconditional store cycle like physical cpu;
-                       must be before changing accumulator to ensure
-                       idempotency if the store faults and the instruction
-                       is restarted */
+
+                    /*
+                     * Perform an unconditional store cycle like physical cpu;
+                     * must be before changing accumulator to ensure
+                     * idempotency if the store faults and the instruction
+                     * is restarted
+                     */
+                    tcg_gen_movcond_tl(TCG_COND_EQ, newv, oldv, cmpv, newv, oldv);
                     gen_op_st_v(s, ot, newv, s->A0);
-                    gen_op_mov_reg_v(s, ot, R_EAX, oldv);
                 }
             }
+	    /*
+	     * Write EAX only if the cmpxchg fails; reuse newv as the destination,
+	     * since it's dead here.
+	     */
+            dest = gen_op_deposit_reg_v(s, ot, R_EAX, newv, oldv);
+            tcg_gen_movcond_tl(TCG_COND_EQ, dest, oldv, cmpv, dest, newv);
             tcg_gen_mov_tl(cpu_cc_src, oldv);
             tcg_gen_mov_tl(s->cc_srcT, cmpv);
             tcg_gen_sub_tl(cpu_cc_dst, cmpv, oldv);
diff --git a/tests/tcg/x86_64/cmpxchg.c b/tests/tcg/x86_64/cmpxchg.c
new file mode 100644
index 0000000000..5891735161
--- /dev/null
+++ b/tests/tcg/x86_64/cmpxchg.c
@@ -0,0 +1,42 @@
+#include <assert.h>
+
+static int mem;
+
+static unsigned long test_cmpxchgb(unsigned long orig)
+{
+  unsigned long ret;
+  mem = orig;
+  asm("cmpxchgb %b[cmp],%[mem]"
+      : [ mem ] "+m"(mem), [ rax ] "=a"(ret)
+      : [ cmp ] "r"(0x77), "a"(orig));
+  return ret;
+}
+
+static unsigned long test_cmpxchgw(unsigned long orig)
+{
+  unsigned long ret;
+  mem = orig;
+  asm("cmpxchgw %w[cmp],%[mem]"
+      : [ mem ] "+m"(mem), [ rax ] "=a"(ret)
+      : [ cmp ] "r"(0x7777), "a"(orig));
+  return ret;
+}
+
+static unsigned long test_cmpxchgl(unsigned long orig)
+{
+  unsigned long ret;
+  mem = orig;
+  asm("cmpxchgl %[cmp],%[mem]"
+      : [ mem ] "+m"(mem), [ rax ] "=a"(ret)
+      : [ cmp ] "r"(0x77777777u), "a"(orig));
+  return ret;
+}
+
+int main()
+{
+  unsigned long test = 0xdeadbeef12345678ull;
+  assert(test == test_cmpxchgb(test));
+  assert(test == test_cmpxchgw(test));
+  assert(test == test_cmpxchgl(test));
+  return 0;
+}
diff --git a/tests/tcg/x86_64/Makefile.target b/tests/tcg/x86_64/Makefile.target
index 6895db1c43..4eac78293f 100644
--- a/tests/tcg/x86_64/Makefile.target
+++ b/tests/tcg/x86_64/Makefile.target
@@ -11,6 +11,7 @@ include $(SRC_PATH)/tests/tcg/i386/Makefile.target
 ifeq ($(filter %-linux-user, $(TARGET)),$(TARGET))
 X86_64_TESTS += vsyscall
 X86_64_TESTS += noexec
+X86_64_TESTS += cmpxchg
 TESTS=$(MULTIARCH_TESTS) $(X86_64_TESTS) test-x86_64
 else
 TESTS=$(MULTIARCH_TESTS)
-- 
2.34.1


