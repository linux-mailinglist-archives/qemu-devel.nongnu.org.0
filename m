Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70DA83220D1
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 21:30:25 +0100 (CET)
Received: from localhost ([::1]:40794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEHqZ-00068L-Ta
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 15:30:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1lEHpF-0005am-1d; Mon, 22 Feb 2021 15:29:01 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:60762
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1lEHpC-00073j-EQ; Mon, 22 Feb 2021 15:29:00 -0500
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11MKQ6FZ055618; Mon, 22 Feb 2021 15:28:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=G6N7xFRJMtsrD2490GfcUnMWan0BxfZQkqmlpUBf14w=;
 b=X4Pvoo7vOE8G0mNV3G6SBGRZ1jkqQN4Obe3QsOg1q2XQlGSOXAlNtxKn/+Redrl0JY2a
 OdbZgiD2a4PQZYiUOe59IR4cqzUcZhZOJLY8Y98OeaAlYGH4BBTFgGdp+abMnzmDE3Fx
 JZwj+spOUFWz0fq5zImF9JCONwTOMaWPEbknNsjHaJ0/0Ru0b4KtzJ+khWmNKPupuKLe
 CTUA8eDBwnWI/Uk7qJoPh2+5X2Uo5l3I6bFhXdILyhB3SyFF9yCKRm0zwpOIcLvzFfjO
 uINgiFZ139xL80020L2Qz/AW1obRfdi3kXUYzHckYuRJyMIO0yx9zh/jvVosObuBusRF UQ== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 36vkmxr0ca-36
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Feb 2021 15:28:48 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 11MJYm5r009395;
 Mon, 22 Feb 2021 19:40:42 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma02dal.us.ibm.com with ESMTP id 36tt29nbt6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Feb 2021 19:40:42 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 11MJefsV10944892
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 22 Feb 2021 19:40:41 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1A067C6057;
 Mon, 22 Feb 2021 19:40:41 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A63BFC6055;
 Mon, 22 Feb 2021 19:40:39 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.33.77])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 22 Feb 2021 19:40:39 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/ppc: Fix bcdsub. emulation when result overflows
Date: Mon, 22 Feb 2021 16:40:35 -0300
Message-Id: <20210222194035.2723056-1-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-22_07:2021-02-22,
 2021-02-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 impostorscore=0
 mlxscore=0 phishscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2102220176
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: pc@us.ibm.com, qemu-ppc@nongnu.org, groug@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
index 551c02f469..a0b709948c 100755
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


