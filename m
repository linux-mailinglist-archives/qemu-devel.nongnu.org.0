Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F00526B0F86
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 18:00:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZx8B-0004Rr-9E; Wed, 08 Mar 2023 11:59:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1pZx83-0004IO-TB; Wed, 08 Mar 2023 11:59:03 -0500
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1pZx80-000425-PJ; Wed, 08 Mar 2023 11:59:03 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 196F140101;
 Wed,  8 Mar 2023 19:58:33 +0300 (MSK)
Received: from tls.msk.ru (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with SMTP id DD73B92;
 Wed,  8 Mar 2023 19:58:31 +0300 (MSK)
Received: (nullmailer pid 2098321 invoked by uid 1000);
 Wed, 08 Mar 2023 16:58:31 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>
Subject: [PATCH 23/47] target/i386: fix ADOX followed by ADCX
Date: Wed,  8 Mar 2023 19:57:26 +0300
Message-Id: <20230308165815.2098148-23-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230308165035.2097594-1-mjt@msgid.tls.msk.ru>
References: <20230308165035.2097594-1-mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

When ADCX is followed by ADOX or vice versa, the second instruction's
carry comes from EFLAGS and the condition codes use the CC_OP_ADCOX
operation.  Retrieving the carry from EFLAGS is handled by this bit
of gen_ADCOX:

        tcg_gen_extract_tl(carry_in, cpu_cc_src,
            ctz32(cc_op == CC_OP_ADCX ? CC_C : CC_O), 1);

Unfortunately, in this case cc_op has been overwritten by the previous
"if" statement to CC_OP_ADCOX.  This works by chance when the first
instruction is ADCX; however, if the first instruction is ADOX,
ADCX will incorrectly take its carry from OF instead of CF.

Fix by moving the computation of the new cc_op at the end of the function.
The included exhaustive test case fails without this patch and passes
afterwards.

Because ADCX/ADOX need not be invoked through the VEX prefix, this
regression bisects to commit 16fc5726a6e2 ("target/i386: reimplement
0x0f 0x38, add AVX", 2022-10-18).  However, the mistake happened a
little earlier, when BMI instructions were rewritten using the new
decoder framework.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1471
Reported-by: Paul Jolly <https://gitlab.com/myitcv>
Fixes: 1d0b926150e5 ("target/i386: move scalar 0F 38 and 0F 3A instruction to new decoder", 2022-10-18)
Cc: qemu-stable@nongnu.org
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
(cherry picked from commit 60c7dd22e1383754d5f150bc9f7c2785c662a7b6)
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 target/i386/tcg/emit.c.inc       | 20 +++++----
 tests/tcg/i386/Makefile.target   |  6 ++-
 tests/tcg/i386/test-i386-adcox.c | 75 ++++++++++++++++++++++++++++++++
 3 files changed, 91 insertions(+), 10 deletions(-)
 create mode 100644 tests/tcg/i386/test-i386-adcox.c

diff --git a/target/i386/tcg/emit.c.inc b/target/i386/tcg/emit.c.inc
index 4d7702c106..0d7c6e80ae 100644
--- a/target/i386/tcg/emit.c.inc
+++ b/target/i386/tcg/emit.c.inc
@@ -1015,6 +1015,7 @@ VSIB_AVX(VPGATHERQ, vpgatherq)
 
 static void gen_ADCOX(DisasContext *s, CPUX86State *env, MemOp ot, int cc_op)
 {
+    int opposite_cc_op;
     TCGv carry_in = NULL;
     TCGv carry_out = (cc_op == CC_OP_ADCX ? cpu_cc_dst : cpu_cc_src2);
     TCGv zero;
@@ -1022,14 +1023,8 @@ static void gen_ADCOX(DisasContext *s, CPUX86State *env, MemOp ot, int cc_op)
     if (cc_op == s->cc_op || s->cc_op == CC_OP_ADCOX) {
         /* Re-use the carry-out from a previous round.  */
         carry_in = carry_out;
-        cc_op = s->cc_op;
-    } else if (s->cc_op == CC_OP_ADCX || s->cc_op == CC_OP_ADOX) {
-        /* Merge with the carry-out from the opposite instruction.  */
-        cc_op = CC_OP_ADCOX;
-    }
-
-    /* If we don't have a carry-in, get it out of EFLAGS.  */
-    if (!carry_in) {
+    } else {
+        /* We don't have a carry-in, get it out of EFLAGS.  */
         if (s->cc_op != CC_OP_ADCX && s->cc_op != CC_OP_ADOX) {
             gen_compute_eflags(s);
         }
@@ -1053,7 +1048,14 @@ static void gen_ADCOX(DisasContext *s, CPUX86State *env, MemOp ot, int cc_op)
         tcg_gen_add2_tl(s->T0, carry_out, s->T0, carry_out, s->T1, zero);
         break;
     }
-    set_cc_op(s, cc_op);
+
+    opposite_cc_op = cc_op == CC_OP_ADCX ? CC_OP_ADOX : CC_OP_ADCX;
+    if (s->cc_op == CC_OP_ADCOX || s->cc_op == opposite_cc_op) {
+        /* Merge with the carry-out from the opposite instruction.  */
+        set_cc_op(s, CC_OP_ADCOX);
+    } else {
+        set_cc_op(s, cc_op);
+    }
 }
 
 static void gen_ADCX(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
diff --git a/tests/tcg/i386/Makefile.target b/tests/tcg/i386/Makefile.target
index 81831cafbc..bafd8c2180 100644
--- a/tests/tcg/i386/Makefile.target
+++ b/tests/tcg/i386/Makefile.target
@@ -14,7 +14,7 @@ config-cc.mak: Makefile
 I386_SRCS=$(notdir $(wildcard $(I386_SRC)/*.c))
 ALL_X86_TESTS=$(I386_SRCS:.c=)
 SKIP_I386_TESTS=test-i386-ssse3 test-avx test-3dnow test-mmx
-X86_64_TESTS:=$(filter test-i386-bmi2 $(SKIP_I386_TESTS), $(ALL_X86_TESTS))
+X86_64_TESTS:=$(filter test-i386-adcox test-i386-bmi2 $(SKIP_I386_TESTS), $(ALL_X86_TESTS))
 
 test-i386-sse-exceptions: CFLAGS += -msse4.1 -mfpmath=sse
 run-test-i386-sse-exceptions: QEMU_OPTS += -cpu max
@@ -28,6 +28,10 @@ test-i386-bmi2: CFLAGS=-O2
 run-test-i386-bmi2: QEMU_OPTS += -cpu max
 run-plugin-test-i386-bmi2-%: QEMU_OPTS += -cpu max
 
+test-i386-adcox: CFLAGS=-O2
+run-test-i386-adcox: QEMU_OPTS += -cpu max
+run-plugin-test-i386-adcox-%: QEMU_OPTS += -cpu max
+
 #
 # hello-i386 is a barebones app
 #
diff --git a/tests/tcg/i386/test-i386-adcox.c b/tests/tcg/i386/test-i386-adcox.c
new file mode 100644
index 0000000000..16169efff8
--- /dev/null
+++ b/tests/tcg/i386/test-i386-adcox.c
@@ -0,0 +1,75 @@
+/* See if various BMI2 instructions give expected results */
+#include <assert.h>
+#include <stdint.h>
+#include <stdio.h>
+
+#define CC_C 1
+#define CC_O (1 << 11)
+
+#ifdef __x86_64__
+#define REG uint64_t
+#else
+#define REG uint32_t
+#endif
+
+void test_adox_adcx(uint32_t in_c, uint32_t in_o, REG adcx_operand, REG adox_operand)
+{
+    REG flags;
+    REG out_adcx, out_adox;
+
+    asm("pushf; pop %0" : "=r"(flags));
+    flags &= ~(CC_C | CC_O);
+    flags |= (in_c ? CC_C : 0);
+    flags |= (in_o ? CC_O : 0);
+
+    out_adcx = adcx_operand;
+    out_adox = adox_operand;
+    asm("push %0; popf;"
+        "adox %3, %2;"
+        "adcx %3, %1;"
+        "pushf; pop %0"
+        : "+r" (flags), "+r" (out_adcx), "+r" (out_adox)
+        : "r" ((REG)-1), "0" (flags), "1" (out_adcx), "2" (out_adox));
+
+    assert(out_adcx == in_c + adcx_operand - 1);
+    assert(out_adox == in_o + adox_operand - 1);
+    assert(!!(flags & CC_C) == (in_c || adcx_operand));
+    assert(!!(flags & CC_O) == (in_o || adox_operand));
+}
+
+void test_adcx_adox(uint32_t in_c, uint32_t in_o, REG adcx_operand, REG adox_operand)
+{
+    REG flags;
+    REG out_adcx, out_adox;
+
+    asm("pushf; pop %0" : "=r"(flags));
+    flags &= ~(CC_C | CC_O);
+    flags |= (in_c ? CC_C : 0);
+    flags |= (in_o ? CC_O : 0);
+
+    out_adcx = adcx_operand;
+    out_adox = adox_operand;
+    asm("push %0; popf;"
+        "adcx %3, %1;"
+        "adox %3, %2;"
+        "pushf; pop %0"
+        : "+r" (flags), "+r" (out_adcx), "+r" (out_adox)
+        : "r" ((REG)-1), "0" (flags), "1" (out_adcx), "2" (out_adox));
+
+    assert(out_adcx == in_c + adcx_operand - 1);
+    assert(out_adox == in_o + adox_operand - 1);
+    assert(!!(flags & CC_C) == (in_c || adcx_operand));
+    assert(!!(flags & CC_O) == (in_o || adox_operand));
+}
+
+int main(int argc, char *argv[]) {
+    /* try all combinations of input CF, input OF, CF from op1+op2,  OF from op2+op1 */
+    int i;
+    for (i = 0; i <= 15; i++) {
+        printf("%d\n", i);
+        test_adcx_adox(!!(i & 1), !!(i & 2), !!(i & 4), !!(i & 8));
+        test_adox_adcx(!!(i & 1), !!(i & 2), !!(i & 4), !!(i & 8));
+    }
+    return 0;
+}
+
-- 
2.30.2


