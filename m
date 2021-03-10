Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD2D733343F
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 05:12:56 +0100 (CET)
Received: from localhost ([::1]:43754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJqDP-00073l-So
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 23:12:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lJqAs-0003Wo-9o; Tue, 09 Mar 2021 23:10:19 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:52309 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lJqAp-0004AI-GY; Tue, 09 Mar 2021 23:10:18 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DwJWd5WJZz9sWm; Wed, 10 Mar 2021 15:10:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1615349405;
 bh=Yx8ESnsJE3vs1w3ajs3bxZmdzxPCWN7CoE8nMMMBGJg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ovIgFI+cHFOIlxA6ejTwf1kUzupByRUhPmKAS0/x1QbPhRyyhob59vUmp+CjX8rQ1
 K6Ov4+Qo3NfQ3XzkaL5zAeOMCPhOGscdPXgZ2653jjqpIbvftoMJs4KyLy8kL3PWiS
 CYyi14x4hR0ZZvEBsk1OZzN8P/IiZlwNTxHuDl2k=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 09/20] target/ppc: Fix bcdsub. emulation when result overflows
Date: Wed, 10 Mar 2021 15:09:51 +1100
Message-Id: <20210310041002.333813-10-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210310041002.333813-1-david@gibson.dropbear.id.au>
References: <20210310041002.333813-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Paul Clarke <pc@us.ibm.com>, David Gibson <david@gibson.dropbear.id.au>,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Fabiano Rosas <farosas@linux.ibm.com>

The commit d03b174a83 (target/ppc: simplify bcdadd/sub functions)
meant to simplify some of the code but it inadvertently altered the
way the CR6 field is set after the operation has overflowed.

The CR6 bits are set based on the *unbounded* result of the operation,
so we need to look at the result before returning from bcd_add_mag,
otherwise we will look at 0 when it overflows.

Consider the following subtraction:

v0 = 0x9999999999999999999999999999999c (maximum positive BCD value)
v1 = 0x0000000000000000000000000000001d (negative one BCD value)
bcdsub. v0,v0,v1,0

The Power ISA 2.07B says:
If the unbounded result is greater than zero, do the following.
  If PS=0, the sign code of the result is set to 0b1100.
  If PS=1, the sign code of the result is set to 0b1111.
  If the operation overflows, CR field 6 is set to 0b0101. Otherwise,
  CR field 6 is set to 0b0100.

POWER9 hardware:
vr0 = 0x0000000000000000000000000000000c (positive zero BCD value)
cr6 = 0b0101 (0x5) (positive, overflow)

QEMU:
vr0 = 0x0000000000000000000000000000000c (positive zero BCD value)
cr6 = 0b0011 (0x3) (zero, overflow) <--- wrong

This patch reverts the part of d03b174a83 that introduced the
problem and adds a test-case to avoid further regressions:

before:
$ make run-tcg-tests-ppc64le-linux-user
(...)
  TEST    bcdsub on ppc64le
bcdsub: qemu/tests/tcg/ppc64le/bcdsub.c:58: test_bcdsub_gt:
Assertion `(cr >> 4) == ((1 << 2) | (1 << 0))' failed.

Fixes: d03b174a83 (target/ppc: simplify bcdadd/sub functions)
Reported-by: Paul Clarke <pc@us.ibm.com>
Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
Message-Id: <20210222194035.2723056-1-farosas@linux.ibm.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/int_helper.c           |  13 ++-
 tests/tcg/configure.sh            |   6 ++
 tests/tcg/ppc64/Makefile.target   |  13 +++
 tests/tcg/ppc64le/Makefile.target |  12 +++
 tests/tcg/ppc64le/bcdsub.c        | 130 ++++++++++++++++++++++++++++++
 5 files changed, 171 insertions(+), 3 deletions(-)
 create mode 100644 tests/tcg/ppc64/Makefile.target
 create mode 100644 tests/tcg/ppc64le/Makefile.target
 create mode 100644 tests/tcg/ppc64le/bcdsub.c

diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
index 0b682a1f94..429de28494 100644
--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -2175,14 +2175,17 @@ static int bcd_cmp_mag(ppc_avr_t *a, ppc_avr_t *b)
     return 0;
 }
 
-static void bcd_add_mag(ppc_avr_t *t, ppc_avr_t *a, ppc_avr_t *b, int *invalid,
+static int bcd_add_mag(ppc_avr_t *t, ppc_avr_t *a, ppc_avr_t *b, int *invalid,
                        int *overflow)
 {
     int carry = 0;
     int i;
+    int is_zero = 1;
+
     for (i = 1; i <= 31; i++) {
         uint8_t digit = bcd_get_digit(a, i, invalid) +
                         bcd_get_digit(b, i, invalid) + carry;
+        is_zero &= (digit == 0);
         if (digit > 9) {
             carry = 1;
             digit -= 10;
@@ -2194,6 +2197,7 @@ static void bcd_add_mag(ppc_avr_t *t, ppc_avr_t *a, ppc_avr_t *b, int *invalid,
     }
 
     *overflow = carry;
+    return is_zero;
 }
 
 static void bcd_sub_mag(ppc_avr_t *t, ppc_avr_t *a, ppc_avr_t *b, int *invalid,
@@ -2225,14 +2229,15 @@ uint32_t helper_bcdadd(ppc_avr_t *r,  ppc_avr_t *a, ppc_avr_t *b, uint32_t ps)
     int sgnb = bcd_get_sgn(b);
     int invalid = (sgna == 0) || (sgnb == 0);
     int overflow = 0;
+    int zero = 0;
     uint32_t cr = 0;
     ppc_avr_t result = { .u64 = { 0, 0 } };
 
     if (!invalid) {
         if (sgna == sgnb) {
             result.VsrB(BCD_DIG_BYTE(0)) = bcd_preferred_sgn(sgna, ps);
-            bcd_add_mag(&result, a, b, &invalid, &overflow);
-            cr = bcd_cmp_zero(&result);
+            zero = bcd_add_mag(&result, a, b, &invalid, &overflow);
+            cr = (sgna > 0) ? CRF_GT : CRF_LT;
         } else {
             int magnitude = bcd_cmp_mag(a, b);
             if (magnitude > 0) {
@@ -2255,6 +2260,8 @@ uint32_t helper_bcdadd(ppc_avr_t *r,  ppc_avr_t *a, ppc_avr_t *b, uint32_t ps)
         cr = CRF_SO;
     } else if (overflow) {
         cr |= CRF_SO;
+    } else if (zero) {
+        cr |= CRF_EQ;
     }
 
     *r = result;
diff --git a/tests/tcg/configure.sh b/tests/tcg/configure.sh
index 36b8a73a54..ce304f4933 100755
--- a/tests/tcg/configure.sh
+++ b/tests/tcg/configure.sh
@@ -251,6 +251,12 @@ for target in $target_list; do
                 echo "CROSS_CC_HAS_ARMV8_MTE=y" >> $config_target_mak
             fi
         ;;
+        ppc*)
+            if do_compiler "$target_compiler" $target_compiler_cflags \
+               -mpower8-vector -o $TMPE $TMPC; then
+                echo "CROSS_CC_HAS_POWER8_VECTOR=y" >> $config_target_mak
+            fi
+        ;;
     esac
 
     enabled_cross_compilers="$enabled_cross_compilers $target_compiler"
diff --git a/tests/tcg/ppc64/Makefile.target b/tests/tcg/ppc64/Makefile.target
new file mode 100644
index 0000000000..0c6a4585fc
--- /dev/null
+++ b/tests/tcg/ppc64/Makefile.target
@@ -0,0 +1,13 @@
+# -*- Mode: makefile -*-
+#
+# ppc64 specific tweaks
+
+VPATH += $(SRC_PATH)/tests/tcg/ppc64
+VPATH += $(SRC_PATH)/tests/tcg/ppc64le
+
+ifneq ($(DOCKER_IMAGE)$(CROSS_CC_HAS_POWER8_VECTOR),)
+PPC64_TESTS=bcdsub
+endif
+bcdsub: CFLAGS += -mpower8-vector
+
+TESTS += $(PPC64_TESTS)
diff --git a/tests/tcg/ppc64le/Makefile.target b/tests/tcg/ppc64le/Makefile.target
new file mode 100644
index 0000000000..1acfcff94a
--- /dev/null
+++ b/tests/tcg/ppc64le/Makefile.target
@@ -0,0 +1,12 @@
+# -*- Mode: makefile -*-
+#
+# ppc64le specific tweaks
+
+VPATH += $(SRC_PATH)/tests/tcg/ppc64le
+
+ifneq ($(DOCKER_IMAGE)$(CROSS_CC_HAS_POWER8_VECTOR),)
+PPC64LE_TESTS=bcdsub
+endif
+bcdsub: CFLAGS += -mpower8-vector
+
+TESTS += $(PPC64LE_TESTS)
diff --git a/tests/tcg/ppc64le/bcdsub.c b/tests/tcg/ppc64le/bcdsub.c
new file mode 100644
index 0000000000..8c188cae6d
--- /dev/null
+++ b/tests/tcg/ppc64le/bcdsub.c
@@ -0,0 +1,130 @@
+#include <assert.h>
+#include <unistd.h>
+#include <signal.h>
+
+#define CRF_LT  (1 << 3)
+#define CRF_GT  (1 << 2)
+#define CRF_EQ  (1 << 1)
+#define CRF_SO  (1 << 0)
+#define UNDEF   0
+
+#define BCDSUB(vra, vrb, ps)                    \
+    asm ("bcdsub. %1,%2,%3,%4;"                 \
+         "mfocrf %0,0b10;"                      \
+         : "=r" (cr), "=v" (vrt)                \
+         : "v" (vra), "v" (vrb), "i" (ps)       \
+         : );
+
+#define TEST(vra, vrb, ps, exp_res, exp_cr6)    \
+    do {                                        \
+        __int128 vrt = 0;                       \
+        int cr = 0;                             \
+        BCDSUB(vra, vrb, ps);                   \
+        if (exp_res)                            \
+            assert(vrt == exp_res);             \
+        assert((cr >> 4) == exp_cr6);           \
+    } while (0)
+
+
+/*
+ * Unbounded result is equal to zero:
+ *   sign = (PS) ? 0b1111 : 0b1100
+ *   CR6 = 0b0010
+ */
+void test_bcdsub_eq(void)
+{
+    __int128 a, b;
+
+    /* maximum positive BCD value */
+    a = b = (((__int128) 0x9999999999999999) << 64 | 0x999999999999999c);
+
+    TEST(a, b, 0, 0xc, CRF_EQ);
+    TEST(a, b, 1, 0xf, CRF_EQ);
+}
+
+/*
+ * Unbounded result is greater than zero:
+ *   sign = (PS) ? 0b1111 : 0b1100
+ *   CR6 = (overflow) ? 0b0101 : 0b0100
+ */
+void test_bcdsub_gt(void)
+{
+    __int128 a, b, c;
+
+    /* maximum positive BCD value */
+    a = (((__int128) 0x9999999999999999) << 64 | 0x999999999999999c);
+
+    /* negative one BCD value */
+    b = (__int128) 0x1d;
+
+    TEST(a, b, 0, 0xc, (CRF_GT | CRF_SO));
+    TEST(a, b, 1, 0xf, (CRF_GT | CRF_SO));
+
+    c = (((__int128) 0x9999999999999999) << 64 | 0x999999999999998c);
+
+    TEST(c, b, 0, a, CRF_GT);
+    TEST(c, b, 1, (a | 0x3), CRF_GT);
+}
+
+/*
+ * Unbounded result is less than zero:
+ *   sign = 0b1101
+ *   CR6 = (overflow) ? 0b1001 : 0b1000
+ */
+void test_bcdsub_lt(void)
+{
+    __int128 a, b;
+
+    /* positive zero BCD value */
+    a = (__int128) 0xc;
+
+    /* positive one BCD value */
+    b = (__int128) 0x1c;
+
+    TEST(a, b, 0, 0x1d, CRF_LT);
+    TEST(a, b, 1, 0x1d, CRF_LT);
+
+    /* maximum negative BCD value */
+    a = (((__int128) 0x9999999999999999) << 64 | 0x999999999999999d);
+
+    /* positive one BCD value */
+    b = (__int128) 0x1c;
+
+    TEST(a, b, 0, 0xd, (CRF_LT | CRF_SO));
+    TEST(a, b, 1, 0xd, (CRF_LT | CRF_SO));
+}
+
+void test_bcdsub_invalid(void)
+{
+    __int128 a, b;
+
+    /* positive one BCD value */
+    a = (__int128) 0x1c;
+    b = 0xf00;
+
+    TEST(a, b, 0, UNDEF, CRF_SO);
+    TEST(a, b, 1, UNDEF, CRF_SO);
+
+    TEST(b, a, 0, UNDEF, CRF_SO);
+    TEST(b, a, 1, UNDEF, CRF_SO);
+
+    a = 0xbad;
+
+    TEST(a, b, 0, UNDEF, CRF_SO);
+    TEST(a, b, 1, UNDEF, CRF_SO);
+}
+
+int main(void)
+{
+    struct sigaction action;
+
+    action.sa_handler = _exit;
+    sigaction(SIGABRT, &action, NULL);
+
+    test_bcdsub_eq();
+    test_bcdsub_gt();
+    test_bcdsub_lt();
+    test_bcdsub_invalid();
+
+    return 0;
+}
-- 
2.29.2


