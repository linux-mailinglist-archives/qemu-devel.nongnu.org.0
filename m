Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A40C46FB7EA
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 22:05:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pw75g-0006GD-VD; Mon, 08 May 2023 16:04:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pw75T-0006Ej-7V
 for qemu-devel@nongnu.org; Mon, 08 May 2023 16:04:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pw75N-0007KM-VV
 for qemu-devel@nongnu.org; Mon, 08 May 2023 16:03:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683576233;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MjsYTp4uMPaj6tl4VHV5SOUdxqW2VFNDpjp7ErZwpD0=;
 b=ilI6HyqUjO9eMapCqSq8S3l8oJux/KWOT34YU1S7VZvTkFGNOBw+vNNnGXx/c4hPPuy+m2
 R0DzgIIgsg/3cRFJT/N255XQIHWslkL3qWLCBucICHtmJOOKMMpH3QOEY4azDLPO7u+I5C
 QpBPDCDHLXqWWr0xRCr5iaAhmwSwk0Y=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-629-FrONzesJNoOMq9I_AOzS4g-1; Mon, 08 May 2023 16:03:51 -0400
X-MC-Unique: FrONzesJNoOMq9I_AOzS4g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 16DDA185A7A2
 for <qemu-devel@nongnu.org>; Mon,  8 May 2023 20:03:51 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C8F5F1121314;
 Mon,  8 May 2023 20:03:50 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: hreitz@redhat.com
Subject: [PATCH 11/11] cutils: Improve qemu_strtosz handling of fractions
Date: Mon,  8 May 2023 15:03:43 -0500
Message-Id: <20230508200343.791450-12-eblake@redhat.com>
In-Reply-To: <20230508200343.791450-1-eblake@redhat.com>
References: <20230508200343.791450-1-eblake@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

We have several limitations and bugs worth fixing; they are
inter-related enough that it is not worth splitting this patch into
smaller pieces:

* ".5k" should work to specify 512, just as "0.5k" does
* "1.9999k" and "1." + "9"*50 + "k" should both produce the same
  result of 2048 after rounding
* "1." + "0"*350 + "1B" should not be treated the same as "1.0B";
  underflow in the fraction should not be lost
* "7.99e99" and "7.99e999" look similar, but our code was doing a
  read-out-of-bounds on the latter because it was not expecting ERANGE
  due to overflow. While we document that scientific notation is not
  supported, and the previous patch actually fixed
  qemu_strtod_finite() to no longer return ERANGE overflows, it is
  easier to pre-filter than to try and determine after the fact if
  strtod() consumed more than we wanted.  Note that this is a
  low-level semantic change (when endptr is not NULL, we can now
  successfully parse with a scale of 'E' and then report trailing
  junk, instead of failing outright with EINVAL); but an earlier
  commit already argued that this is not a high-level semantic change
  since the only caller passing in a non-NULL endptr also checks that
  the tail is whitespace-only.

Fixes: https://gitlab.com/qemu-project/qemu/-/issues/1629
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 tests/unit/test-cutils.c | 51 +++++++++++------------
 util/cutils.c            | 89 ++++++++++++++++++++++++++++------------
 2 files changed, 88 insertions(+), 52 deletions(-)

diff --git a/tests/unit/test-cutils.c b/tests/unit/test-cutils.c
index f781997aef7..1fb9d5323ab 100644
--- a/tests/unit/test-cutils.c
+++ b/tests/unit/test-cutils.c
@@ -2693,14 +2693,14 @@ static void test_qemu_strtosz_float(void)
     g_assert_cmpuint(res, ==, 1024);
     g_assert_true(endptr == str + 4);

-    /* FIXME An empty fraction head should be tolerated */
+    /* An empty fraction head is tolerated */
     str = " .5k";
     endptr = str;
     res = 0xbaadf00d;
     err = qemu_strtosz(str, &endptr, &res);
-    g_assert_cmpint(err, ==, -EINVAL /* FIXME 0 */);
-    g_assert_cmpuint(res, ==, 0 /* FIXME 512 */);
-    g_assert_true(endptr == str /* FIXME + 4 */);
+    g_assert_cmpint(err, ==, 0);
+    g_assert_cmpuint(res, ==, 512);
+    g_assert_true(endptr == str + 4);

     /* For convenience, we permit values that are not byte-exact */
     str = "12.345M";
@@ -2711,16 +2711,16 @@ static void test_qemu_strtosz_float(void)
     g_assert_cmpuint(res, ==, (uint64_t) (12.345 * MiB + 0.5));
     g_assert_true(endptr == str + 7);

-    /* FIXME Fraction tail should round correctly */
+    /* Fraction tail can round up */
     str = "1.9999999999999999999999999999999999999999999999999999k";
     endptr = str;
     res = 0xbaadf00d;
     err = qemu_strtosz(str, &endptr, &res);
     g_assert_cmpint(err, ==, 0);
-    g_assert_cmpint(res, ==, 1024 /* FIXME 2048 */);
+    g_assert_cmpuint(res, ==, 2048);
     g_assert_true(endptr == str + 55);

-    /* FIXME ERANGE underflow in the fraction tail should not matter for 'k' */
+    /* ERANGE underflow in the fraction tail does not matter for 'k' */
     str = "1."
         "00000000000000000000000000000000000000000000000000"
         "00000000000000000000000000000000000000000000000000"
@@ -2734,7 +2734,7 @@ static void test_qemu_strtosz_float(void)
     res = 0xbaadf00d;
     err = qemu_strtosz(str, &endptr, &res);
     g_assert_cmpint(err, ==, 0);
-    g_assert_cmpuint(res, ==, 1 /* FIXME 1024 */);
+    g_assert_cmpuint(res, ==, 1024);
     g_assert_true(endptr == str + 354);
 }

@@ -2826,16 +2826,16 @@ static void test_qemu_strtosz_invalid(void)
     g_assert_cmpuint(res, ==, 0);
     g_assert_true(endptr == str);

-    /* FIXME Fraction tail can cause ERANGE overflow */
+    /* Fraction tail can cause ERANGE overflow */
     str = "15.9999999999999999999999999999999999999999999999999999E";
     endptr = str;
     res = 0xbaadf00d;
     err = qemu_strtosz(str, &endptr, &res);
-    g_assert_cmpint(err, ==, 0 /* FIXME -ERANGE */);
-    g_assert_cmpuint(res, ==, 15ULL * EiB /* FIXME 0 */);
-    g_assert_true(endptr == str + 56 /* FIXME str */);
+    g_assert_cmpint(err, ==, -ERANGE);
+    g_assert_cmpuint(res, ==, 0);
+    g_assert_true(endptr == str + 56);

-    /* FIXME ERANGE underflow in the fraction tail should matter for 'B' */
+    /* ERANGE underflow in the fraction tail matters for 'B' */
     str = "1."
         "00000000000000000000000000000000000000000000000000"
         "00000000000000000000000000000000000000000000000000"
@@ -2848,9 +2848,9 @@ static void test_qemu_strtosz_invalid(void)
     endptr = str;
     res = 0xbaadf00d;
     err = qemu_strtosz(str, &endptr, &res);
-    g_assert_cmpint(err, ==, 0 /* FIXME -EINVAL */);
-    g_assert_cmpuint(res, ==, 1 /* FIXME 0 */);
-    g_assert_true(endptr == str + 354 /* FIXME str */);
+    g_assert_cmpint(err, ==, -EINVAL);
+    g_assert_cmpuint(res, ==, 0);
+    g_assert_true(endptr == str);

     /* No hex fractions */
     str = "0x1.8k";
@@ -3045,14 +3045,14 @@ static void test_qemu_strtosz_trailing(void)
     g_assert_cmpint(err, ==, -EINVAL);
     g_assert_cmpuint(res, ==, 0);

-    /* FIXME should stop parse after 'e'. No floating point exponents */
+    /* Parse stops at 'e', which is not a floating point exponent */
     str = "1.5e1k";
     endptr = NULL;
     res = 0xbaadf00d;
     err = qemu_strtosz(str, &endptr, &res);
-    g_assert_cmpint(err, ==, -EINVAL /* FIXME 0 */);
-    g_assert_cmpuint(res, ==, 0 /* FIXME EiB * 1.5 */);
-    g_assert_true(endptr == str /* FIXME + 4 */);
+    g_assert_cmpint(err, ==, 0);
+    g_assert_cmpuint(res, ==, EiB * 1.5);
+    g_assert_true(endptr == str + 4);

     res = 0xbaadf00d;
     err = qemu_strtosz(str, NULL, &res);
@@ -3063,23 +3063,22 @@ static void test_qemu_strtosz_trailing(void)
     endptr = NULL;
     res = 0xbaadf00d;
     err = qemu_strtosz(str, &endptr, &res);
-    g_assert_cmpint(err, ==, -EINVAL /* FIXME 0 */);
-    g_assert_cmpuint(res, ==, 0 /* FIXME EiB * 1.5 */);
-    g_assert_true(endptr == str /* FIXME + 4 */);
+    g_assert_cmpint(err, ==, 0);
+    g_assert_cmpuint(res, ==, EiB * 1.5);
+    g_assert_true(endptr == str + 4);

     res = 0xbaadf00d;
     err = qemu_strtosz(str, NULL, &res);
     g_assert_cmpint(err, ==, -EINVAL);
     g_assert_cmpuint(res, ==, 0);

-    /* FIXME overflow in fraction is buggy */
     str = "1.5E999";
     endptr = NULL;
     res = 0xbaadf00d;
     err = qemu_strtosz(str, &endptr, &res);
     g_assert_cmpint(err, ==, 0);
-    g_assert_cmpuint(res, ==, 1 /* FIXME EiB * 1.5 */);
-    g_assert(endptr == str + 2 /* FIXME + 4 */);
+    g_assert_cmpuint(res, ==, EiB * 1.5);
+    g_assert_true(endptr == str + 4);

     res = 0xbaadf00d;
     err = qemu_strtosz(str, NULL, &res);
diff --git a/util/cutils.c b/util/cutils.c
index 0e056a27a44..d1dfbc69d16 100644
--- a/util/cutils.c
+++ b/util/cutils.c
@@ -194,14 +194,17 @@ static int64_t suffix_mul(char suffix, int64_t unit)
  * - 12345 - decimal, scale determined by @default_suffix and @unit
  * - 12345{bBkKmMgGtTpPeE} - decimal, scale determined by suffix and @unit
  * - 12345.678{kKmMgGtTpPeE} - decimal, scale determined by suffix, and
- *   fractional portion is truncated to byte
+ *   fractional portion is truncated to byte, either side of . may be empty
  * - 0x7fEE - hexadecimal, unit determined by @default_suffix
  *
  * The following are intentionally not supported
- * - hex with scaling suffix, such as 0x20M
- * - octal, such as 08
- * - fractional hex, such as 0x1.8
- * - floating point exponents, such as 1e3
+ * - hex with scaling suffix, such as 0x20M (0x1b is 27, not 1)
+ * - octal, such as 08 (parsed as decimal instead)
+ * - binary, such as 0b1000 (parsed as 0b with trailing garbage "1000")
+ * - fractional hex, such as 0x1.8 (parsed as 0 with trailing garbage "x1.8")
+ * - floating point exponents, such as 1e3 (parsed as 1e with trailing
+ *   garbage "3") or 0x1p3 (parsed as 1 with trailing garbage "p3")
+ * - non-finite values, such as inf or NaN
  *
  * The end pointer will be returned in *end, if not NULL.  If there is
  * no fraction, the input can be decimal or hexadecimal; if there is a
@@ -220,22 +223,17 @@ static int do_strtosz(const char *nptr, const char **end,
                       uint64_t *result)
 {
     int retval;
-    const char *endptr, *f;
+    const char *endptr;
     unsigned char c;
-    uint64_t val, valf = 0;
+    uint64_t val = 0, valf = 0;
     int64_t mul;

     /* Parse integral portion as decimal. */
     retval = qemu_strtou64(nptr, &endptr, 10, &val);
-    if (retval) {
+    if (retval == -ERANGE || !nptr) {
         goto out;
     }
-    if (memchr(nptr, '-', endptr - nptr) != NULL) {
-        endptr = nptr;
-        retval = -EINVAL;
-        goto out;
-    }
-    if (val == 0 && (*endptr == 'x' || *endptr == 'X')) {
+    if (retval == 0 && val == 0 && (*endptr == 'x' || *endptr == 'X')) {
         /* Input looks like hex; reparse, and insist on no fraction or suffix. */
         retval = qemu_strtou64(nptr, &endptr, 16, &val);
         if (retval) {
@@ -246,27 +244,66 @@ static int do_strtosz(const char *nptr, const char **end,
             retval = -EINVAL;
             goto out;
         }
-    } else if (*endptr == '.') {
+    } else if (*endptr == '.' || (endptr == nptr && strchr(nptr, '.'))) {
         /*
          * Input looks like a fraction.  Make sure even 1.k works
-         * without fractional digits.  If we see an exponent, treat
-         * the entire input as invalid instead.
+         * without fractional digits.  strtod tries to treat 'e' as an
+         * exponent, but we want to treat it as a scaling suffix;
+         * doing this requires modifying a copy of the fraction.
          */
-        double fraction;
+        double fraction = 0.0;

-        f = endptr;
-        retval = qemu_strtod_finite(f, &endptr, &fraction);
-        if (retval) {
+        if (retval == 0 && *endptr == '.' && !isdigit(endptr[1])) {
+            /* If we got here, we parsed at least one digit already. */
             endptr++;
-        } else if (memchr(f, 'e', endptr - f) || memchr(f, 'E', endptr - f)) {
-            endptr = nptr;
-            retval = -EINVAL;
-            goto out;
         } else {
-            /* Extract into a 64-bit fixed-point fraction. */
+            char *e;
+            const char *tail;
+            g_autofree char *copy = g_strdup(endptr);
+
+            e = strchr(copy, 'e');
+            if (e) {
+                *e = '\0';
+            }
+            e = strchr(copy, 'E');
+            if (e) {
+                *e = '\0';
+            }
+            /*
+             * If this is a floating point, we are guaranteed that '.'
+             * appears before any possible digits in copy.  If it is
+             * not a floating point, strtod will fail.  Either way,
+             * there is now no exponent in copy, so if it parses, we
+             * know 0.0 <= abs(result) <= 1.0 (after rounding), and
+             * ERANGE is only possible on underflow which is okay.
+             */
+            retval = qemu_strtod_finite(copy, &tail, &fraction);
+            endptr += tail - copy;
+        }
+
+        /* Extract into a 64-bit fixed-point fraction. */
+        if (fraction == 1.0) {
+            if (val == UINT64_MAX) {
+                retval = -ERANGE;
+                goto out;
+            }
+            val++;
+        } else if (retval == -ERANGE) {
+            /* See comments above about underflow */
+            valf = 1;
+            retval = 0;
+        } else {
             valf = (uint64_t)(fraction * 0x1p64);
         }
     }
+    if (retval) {
+        goto out;
+    }
+    if (memchr(nptr, '-', endptr - nptr) != NULL) {
+        endptr = nptr;
+        retval = -EINVAL;
+        goto out;
+    }
     c = *endptr;
     mul = suffix_mul(c, unit);
     if (mul > 0) {
-- 
2.40.1


