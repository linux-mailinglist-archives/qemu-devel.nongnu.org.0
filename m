Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D780DDE31
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Oct 2019 13:15:11 +0200 (CEST)
Received: from localhost ([::1]:59342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iM9Az-0004MX-Hc
	for lists+qemu-devel@lfdr.de; Sun, 20 Oct 2019 07:15:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35680)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tao3.xu@intel.com>) id 1iM97Z-0002dj-WB
 for qemu-devel@nongnu.org; Sun, 20 Oct 2019 07:11:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tao3.xu@intel.com>) id 1iM97Y-0002wp-4o
 for qemu-devel@nongnu.org; Sun, 20 Oct 2019 07:11:37 -0400
Received: from mga12.intel.com ([192.55.52.136]:63374)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tao3.xu@intel.com>) id 1iM97X-0002wA-TQ
 for qemu-devel@nongnu.org; Sun, 20 Oct 2019 07:11:36 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Oct 2019 04:11:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,319,1566889200"; d="scan'208";a="371917536"
Received: from tao-optiplex-7060.sh.intel.com ([10.239.159.36])
 by orsmga005.jf.intel.com with ESMTP; 20 Oct 2019 04:11:29 -0700
From: Tao Xu <tao3.xu@intel.com>
To: imammedo@redhat.com,
	eblake@redhat.com,
	ehabkost@redhat.com
Subject: [PATCH v13 01/12] util/cutils: Add qemu_strtotime_ps()
Date: Sun, 20 Oct 2019 19:11:14 +0800
Message-Id: <20191020111125.27659-2-tao3.xu@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191020111125.27659-1-tao3.xu@intel.com>
References: <20191020111125.27659-1-tao3.xu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.136
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
"ps" for picosecond, "ns" for nanosecond, "us" for microsecond, "ms"
for millisecond or "s" for second.

Signed-off-by: Tao Xu <tao3.xu@intel.com>
---

No changes in v13.
---
 include/qemu/cutils.h |  1 +
 util/cutils.c         | 82 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 83 insertions(+)

diff --git a/include/qemu/cutils.h b/include/qemu/cutils.h
index b54c847e0f..7b6d106bdd 100644
--- a/include/qemu/cutils.h
+++ b/include/qemu/cutils.h
@@ -182,5 +182,6 @@ int uleb128_decode_small(const uint8_t *in, uint32_t *n);
  * *str1 is <, == or > than *str2.
  */
 int qemu_pstrcmp0(const char **str1, const char **str2);
+int qemu_strtotime_ps(const char *nptr, const char **end, uint64_t *result);
 
 #endif
diff --git a/util/cutils.c b/util/cutils.c
index fd591cadf0..a50c15f46a 100644
--- a/util/cutils.c
+++ b/util/cutils.c
@@ -847,3 +847,85 @@ int qemu_pstrcmp0(const char **str1, const char **str2)
 {
     return g_strcmp0(*str1, *str2);
 }
+
+static int64_t timeunit_mul(const char *unitstr)
+{
+    if (g_strcmp0(unitstr, "ps") == 0) {
+        return 1;
+    } else if (g_strcmp0(unitstr, "ns") == 0) {
+        return 1000;
+    } else if (g_strcmp0(unitstr, "us") == 0) {
+        return 1000000;
+    } else if (g_strcmp0(unitstr, "ms") == 0) {
+        return 1000000000LL;
+    } else if (g_strcmp0(unitstr, "s") == 0) {
+        return 1000000000000LL;
+    } else {
+        return -1;
+    }
+}
+
+
+/*
+ * Convert string to time, support time unit are ps for picosecond,
+ * ns for nanosecond, us for microsecond, ms for millisecond or s for second.
+ * End pointer will be returned in *end, if not NULL. Return -ERANGE on
+ * overflow, and -EINVAL on other error.
+ */
+static int do_strtotime(const char *nptr, const char **end,
+                      const char *default_unit, uint64_t *result)
+{
+    int retval;
+    const char *endptr;
+    int mul_required = 0;
+    int64_t mul;
+    double val, integral, fraction;
+
+    retval = qemu_strtod_finite(nptr, &endptr, &val);
+    if (retval) {
+        goto out;
+    }
+    fraction = modf(val, &integral);
+    if (fraction != 0) {
+        mul_required = 1;
+    }
+
+    mul = timeunit_mul(endptr);
+
+    if (mul == 1000000000000LL) {
+        endptr++;
+    } else if (mul != -1) {
+        endptr += 2;
+    } else {
+        mul = timeunit_mul(default_unit);
+        assert(mul >= 0);
+    }
+    if (mul == 1 && mul_required) {
+        retval = -EINVAL;
+        goto out;
+    }
+    /*
+     * Values >= 0xfffffffffffffc00 overflow uint64_t after their trip
+     * through double (53 bits of precision).
+     */
+    if ((val * (double)mul >= 0xfffffffffffffc00) || val < 0) {
+        retval = -ERANGE;
+        goto out;
+    }
+    *result = val * (double)mul;
+    retval = 0;
+
+out:
+    if (end) {
+        *end = endptr;
+    } else if (*endptr) {
+        retval = -EINVAL;
+    }
+
+    return retval;
+}
+
+int qemu_strtotime_ps(const char *nptr, const char **end, uint64_t *result)
+{
+    return do_strtotime(nptr, end, "ps", result);
+}
-- 
2.20.1


