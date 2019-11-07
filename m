Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C167F286F
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Nov 2019 08:52:20 +0100 (CET)
Received: from localhost ([::1]:39576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iScaZ-0006gW-B0
	for lists+qemu-devel@lfdr.de; Thu, 07 Nov 2019 02:52:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45432)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tao3.xu@intel.com>) id 1iScTx-0001Id-Mb
 for qemu-devel@nongnu.org; Thu, 07 Nov 2019 02:45:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tao3.xu@intel.com>) id 1iScTv-0004Ya-33
 for qemu-devel@nongnu.org; Thu, 07 Nov 2019 02:45:28 -0500
Received: from mga02.intel.com ([134.134.136.20]:5076)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tao3.xu@intel.com>) id 1iScTu-0004DB-Nu
 for qemu-devel@nongnu.org; Thu, 07 Nov 2019 02:45:27 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Nov 2019 23:45:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,277,1569308400"; d="scan'208";a="404016840"
Received: from tao-optiplex-7060.sh.intel.com ([10.239.159.36])
 by fmsmga006.fm.intel.com with ESMTP; 06 Nov 2019 23:45:21 -0800
From: Tao Xu <tao3.xu@intel.com>
To: mst@redhat.com, imammedo@redhat.com, eblake@redhat.com,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, armbru@redhat.com,
 mdroth@linux.vnet.ibm.com, thuth@redhat.com, lvivier@redhat.com
Subject: [PATCH v15 02/12] util/cutils: Add qemu_strtotime_ns()
Date: Thu,  7 Nov 2019 15:45:01 +0800
Message-Id: <20191107074511.14304-3-tao3.xu@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191107074511.14304-1-tao3.xu@intel.com>
References: <20191107074511.14304-1-tao3.xu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.20
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
Cc: jingqi.liu@intel.com, tao3.xu@intel.com, fan.du@intel.com,
 qemu-devel@nongnu.org, jonathan.cameron@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To convert strings with time suffixes to numbers, support time unit are
"ns" for nanosecond, "us" for microsecond, "ms" for millisecond or "s"
for second. Add test for qemu_strtotime_ns, test the input of basic,
time suffixes, float, invaild, trailing and overflow.

Signed-off-by: Tao Xu <tao3.xu@intel.com>
---

Changes in v15:
    - Add a new patch to refactor do_strtosz() (Eduardo)
    - use ARRAY_SIZE(suffixes) instead of hardcoding the
      suffixes number (Eduardo)

Changes in v14:
    - Reuse the codes of do_strtosz to build qemu_strtotime_ns
      (Eduardo)
    - Squash patch v13 01/12 and 02/12 together (Daniel and Eduardo)
    - Drop time unit picosecond (Eric)
---
 include/qemu/cutils.h |   1 +
 tests/test-cutils.c   | 204 ++++++++++++++++++++++++++++++++++++++++++
 util/cutils.c         |  14 +++
 3 files changed, 219 insertions(+)

diff --git a/include/qemu/cutils.h b/include/qemu/cutils.h
index b54c847e0f..ff2b3f4614 100644
--- a/include/qemu/cutils.h
+++ b/include/qemu/cutils.h
@@ -182,5 +182,6 @@ int uleb128_decode_small(const uint8_t *in, uint32_t *n);
  * *str1 is <, == or > than *str2.
  */
 int qemu_pstrcmp0(const char **str1, const char **str2);
+int qemu_strtotime_ns(const char *nptr, const char **end, uint64_t *result);
 
 #endif
diff --git a/tests/test-cutils.c b/tests/test-cutils.c
index 1aa8351520..d6a0824efd 100644
--- a/tests/test-cutils.c
+++ b/tests/test-cutils.c
@@ -2179,6 +2179,198 @@ static void test_qemu_strtosz_metric(void)
     g_assert(endptr == str + 6);
 }
 
+static void test_qemu_strtotime_ns_simple(void)
+{
+    const char *str;
+    const char *endptr;
+    int err;
+    uint64_t res = 0xbaadf00d;
+
+    str = "0";
+    err = qemu_strtotime_ns(str, &endptr, &res);
+    g_assert_cmpint(err, ==, 0);
+    g_assert_cmpint(res, ==, 0);
+    g_assert(endptr == str + 1);
+
+    str = "56789";
+    err = qemu_strtotime_ns(str, &endptr, &res);
+    g_assert_cmpint(err, ==, 0);
+    g_assert_cmpint(res, ==, 56789);
+    g_assert(endptr == str + 5);
+
+    err = qemu_strtotime_ns(str, NULL, &res);
+    g_assert_cmpint(err, ==, 0);
+    g_assert_cmpint(res, ==, 56789);
+
+    /* Note: precision is 53 bits since we're parsing with strtod() */
+
+    str = "9007199254740991"; /* 2^53-1 */
+    err = qemu_strtotime_ns(str, &endptr, &res);
+    g_assert_cmpint(err, ==, 0);
+    g_assert_cmpint(res, ==, 0x1fffffffffffff);
+    g_assert(endptr == str + 16);
+
+    str = "9007199254740992"; /* 2^53 */
+    err = qemu_strtotime_ns(str, &endptr, &res);
+    g_assert_cmpint(err, ==, 0);
+    g_assert_cmpint(res, ==, 0x20000000000000);
+    g_assert(endptr == str + 16);
+
+    str = "9007199254740993"; /* 2^53+1 */
+    err = qemu_strtotime_ns(str, &endptr, &res);
+    g_assert_cmpint(err, ==, 0);
+    g_assert_cmpint(res, ==, 0x20000000000000); /* rounded to 53 bits */
+    g_assert(endptr == str + 16);
+
+    str = "18446744073709549568"; /* 0xfffffffffffff800 (53 msbs set) */
+    err = qemu_strtotime_ns(str, &endptr, &res);
+    g_assert_cmpint(err, ==, 0);
+    g_assert_cmpint(res, ==, 0xfffffffffffff800);
+    g_assert(endptr == str + 20);
+
+    str = "18446744073709550591"; /* 0xfffffffffffffbff */
+    err = qemu_strtotime_ns(str, &endptr, &res);
+    g_assert_cmpint(err, ==, 0);
+    g_assert_cmpint(res, ==, 0xfffffffffffff800); /* rounded to 53 bits */
+    g_assert(endptr == str + 20);
+
+    /* 0x7ffffffffffffe00..0x7fffffffffffffff get rounded to
+     * 0x8000000000000000, thus -ERANGE; see test_qemu_strtosz_erange() */
+}
+
+static void test_qemu_strtotime_ns_units(void)
+{
+    const char *ns = "1ns";
+    const char *us = "1us";
+    const char *ms = "1ms";
+    const char *s = "1s";
+    int err;
+    const char *endptr;
+    uint64_t res = 0xbaadf00d;
+
+    /* default time unit is ns */
+    err = qemu_strtotime_ns(ns, &endptr, &res);
+    g_assert_cmpint(err, ==, 0);
+    g_assert_cmpint(res, ==, 1);
+    g_assert(endptr == ns + 3);
+
+    err = qemu_strtotime_ns(us, &endptr, &res);
+    g_assert_cmpint(err, ==, 0);
+    g_assert_cmpint(res, ==, 1000);
+    g_assert(endptr == us + 3);
+
+    err = qemu_strtotime_ns(ms, &endptr, &res);
+    g_assert_cmpint(err, ==, 0);
+    g_assert_cmpint(res, ==, 1000000);
+    g_assert(endptr == ms + 3);
+
+    err = qemu_strtotime_ns(s, &endptr, &res);
+    g_assert_cmpint(err, ==, 0);
+    g_assert_cmpint(res, ==, 1000000000LL);
+    g_assert(endptr == s + 2);
+}
+
+static void test_qemu_strtotime_ns_float(void)
+{
+    const char *str = "56.789us";
+    int err;
+    const char *endptr;
+    uint64_t res = 0xbaadf00d;
+
+    err = qemu_strtotime_ns(str, &endptr, &res);
+    g_assert_cmpint(err, ==, 0);
+    g_assert_cmpint(res, ==, 56.789 * 1000);
+    g_assert(endptr == str + 8);
+}
+
+static void test_qemu_strtotime_ns_invalid(void)
+{
+    const char *str;
+    const char *endptr;
+    int err;
+    uint64_t res = 0xbaadf00d;
+
+    str = "";
+    err = qemu_strtotime_ns(str, &endptr, &res);
+    g_assert_cmpint(err, ==, -EINVAL);
+    g_assert(endptr == str);
+
+    str = " \t ";
+    err = qemu_strtotime_ns(str, &endptr, &res);
+    g_assert_cmpint(err, ==, -EINVAL);
+    g_assert(endptr == str);
+
+    str = "crap";
+    err = qemu_strtotime_ns(str, &endptr, &res);
+    g_assert_cmpint(err, ==, -EINVAL);
+    g_assert(endptr == str);
+
+    str = "inf";
+    err = qemu_strtotime_ns(str, &endptr, &res);
+    g_assert_cmpint(err, ==, -EINVAL);
+    g_assert(endptr == str);
+
+    str = "NaN";
+    err = qemu_strtotime_ns(str, &endptr, &res);
+    g_assert_cmpint(err, ==, -EINVAL);
+    g_assert(endptr == str);
+}
+
+static void test_qemu_strtotime_ns_trailing(void)
+{
+    const char *str;
+    const char *endptr;
+    int err;
+    uint64_t res = 0xbaadf00d;
+
+    str = "123xxx";
+
+    err = qemu_strtotime_ns(str, NULL, &res);
+    g_assert_cmpint(err, ==, -EINVAL);
+
+    str = "1msxxx";
+    err = qemu_strtotime_ns(str, &endptr, &res);
+    g_assert_cmpint(err, ==, 0);
+    g_assert_cmpint(res, ==, 1000000);
+    g_assert(endptr == str + 3);
+
+    err = qemu_strtotime_ns(str, NULL, &res);
+    g_assert_cmpint(err, ==, -EINVAL);
+}
+
+static void test_qemu_strtotime_ns_erange(void)
+{
+    const char *str;
+    const char *endptr;
+    int err;
+    uint64_t res = 0xbaadf00d;
+
+    str = "-1";
+    err = qemu_strtotime_ns(str, &endptr, &res);
+    g_assert_cmpint(err, ==, -ERANGE);
+    g_assert(endptr == str + 2);
+
+    str = "18446744073709550592"; /* 0xfffffffffffffc00 */
+    err = qemu_strtotime_ns(str, &endptr, &res);
+    g_assert_cmpint(err, ==, -ERANGE);
+    g_assert(endptr == str + 20);
+
+    str = "18446744073709551615"; /* 2^64-1 */
+    err = qemu_strtotime_ns(str, &endptr, &res);
+    g_assert_cmpint(err, ==, -ERANGE);
+    g_assert(endptr == str + 20);
+
+    str = "18446744073709551616"; /* 2^64 */
+    err = qemu_strtotime_ns(str, &endptr, &res);
+    g_assert_cmpint(err, ==, -ERANGE);
+    g_assert(endptr == str + 20);
+
+    str = "200000000000000ms";
+    err = qemu_strtotime_ns(str, &endptr, &res);
+    g_assert_cmpint(err, ==, -ERANGE);
+    g_assert(endptr == str + 17);
+}
+
 int main(int argc, char **argv)
 {
     g_test_init(&argc, &argv, NULL);
@@ -2456,5 +2648,17 @@ int main(int argc, char **argv)
     g_test_add_func("/cutils/strtosz/metric",
                     test_qemu_strtosz_metric);
 
+    g_test_add_func("/cutils/strtotime/simple",
+                    test_qemu_strtotime_ns_simple);
+    g_test_add_func("/cutils/strtotime/units",
+                    test_qemu_strtotime_ns_units);
+    g_test_add_func("/cutils/strtotime/float",
+                    test_qemu_strtotime_ns_float);
+    g_test_add_func("/cutils/strtotime/invalid",
+                    test_qemu_strtotime_ns_invalid);
+    g_test_add_func("/cutils/strtotime/trailing",
+                    test_qemu_strtotime_ns_trailing);
+    g_test_add_func("/cutils/strtotime/erange",
+                    test_qemu_strtotime_ns_erange);
     return g_test_run();
 }
diff --git a/util/cutils.c b/util/cutils.c
index 86d6e271fa..699f2b3300 100644
--- a/util/cutils.c
+++ b/util/cutils.c
@@ -286,6 +286,20 @@ int qemu_strtosz_metric(const char *nptr, const char **end, uint64_t *result)
     return do_strtosz(nptr, end, "B", 1000, result);
 }
 
+/*
+ * Convert string to time, support time unit are ns for nanosecond, us for
+ * microsecond, ms for millisecond and s for second. End pointer will be
+ * returned in *end, if not NULL. Return -ERANGE on overflow, and -EINVAL on
+ * other error.
+ */
+int qemu_strtotime_ns(const char *nptr, const char **end, uint64_t *result)
+{
+    static const char *suffixes[] = { "ns", "us", "ms", "s" };
+
+    return do_strtomul(nptr, end, suffixes, ARRAY_SIZE(suffixes), "ns", 1000,
+                       result);
+}
+
 /**
  * Helper function for error checking after strtol() and the like
  */
-- 
2.20.1


