Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED3F6FB7EB
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 22:05:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pw75r-0006Jx-K3; Mon, 08 May 2023 16:04:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pw75T-0006Eh-6F
 for qemu-devel@nongnu.org; Mon, 08 May 2023 16:04:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pw75N-0007Jy-86
 for qemu-devel@nongnu.org; Mon, 08 May 2023 16:03:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683576232;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eSy16GFae7cjXsOqJEmnMXO1oOnGhcIHo44fbM7C1Ho=;
 b=bghHp4tc1QqAKY/axjsTZTg/Jt3IVYakIY7Gx6YA2JpCGNYneHvskIKtPn7pAxn7p7pGz9
 ycEyP3Z4GBdGz42UsUsH73Cfu33ql+4V7TgpC7nXUVeYPWoeVg3J5IeVHnOL2MLVLzzKYu
 DjW5MQUAU8T4nyqGjX5Sv0sXBwtKGO8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-160-BJ4XviapMp-ImP_ectTl3A-1; Mon, 08 May 2023 16:03:50 -0400
X-MC-Unique: BJ4XviapMp-ImP_ectTl3A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 98F571011579
 for <qemu-devel@nongnu.org>; Mon,  8 May 2023 20:03:50 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 565021121314;
 Mon,  8 May 2023 20:03:50 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: hreitz@redhat.com
Subject: [PATCH 10/11] cutils: Improve qemu_strtod* error paths
Date: Mon,  8 May 2023 15:03:42 -0500
Message-Id: <20230508200343.791450-11-eblake@redhat.com>
In-Reply-To: <20230508200343.791450-1-eblake@redhat.com>
References: <20230508200343.791450-1-eblake@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Previous patches changed all integral qemu_strto*() error paths to
guarantee that *value is never left uninitialized.  Do likewise for
qemu_strtod.  Also, tighten qemu_strtod_finite() to never return a
non-finite value (prior to this patch, we were rejecting "inf" with
-EINVAL and unspecified result 0.0, but failing "9e999" with -ERANGE
and HUGE_VAL - which is infinite on IEEE machines - despite our
function claiming to recognize only finite values).

Auditing callers, we have no external callers of qemu_strtod, and
among the callers of qemu_strtod_finite:

- qapi/qobject-input-visitor.c:qobject_input_type_number_keyval() and
  qapi/string-input-visitor.c:parse_type_number() which reject all
  errors (does not matter what we store)

- utils/cutils.c:do_strtosz() incorrectly assumes that *endptr points
  to '.' on all failures (that is, it is not distinguishing between
  EINVAL and ERANGE; and therefore still does the WRONG THING for
  "9.9e999".  The change here does not fix that (a later patch will
  tackle this more systematically), but at least the value of endptr
  is less likely to be out of bounds on overflow

- our testsuite, which we can update to match what we document

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 tests/unit/test-cutils.c | 57 +++++++++++++++++++++++++---------------
 util/cutils.c            | 32 +++++++++++++---------
 2 files changed, 55 insertions(+), 34 deletions(-)

diff --git a/tests/unit/test-cutils.c b/tests/unit/test-cutils.c
index 2cb33e41ae4..f781997aef7 100644
--- a/tests/unit/test-cutils.c
+++ b/tests/unit/test-cutils.c
@@ -2105,6 +2105,7 @@ static void test_qemu_strtod_einval(void)
     err = qemu_strtod(str, &endptr, &res);
     g_assert_cmpint(err, ==, -EINVAL);
     g_assert_cmpfloat(res, ==, 0.0);
+    g_assert_false(signbit(res));
     g_assert_true(endptr == str);

     /* NULL */
@@ -2113,7 +2114,8 @@ static void test_qemu_strtod_einval(void)
     res = 999;
     err = qemu_strtod(str, &endptr, &res);
     g_assert_cmpint(err, ==, -EINVAL);
-    g_assert_cmpfloat(res, ==, 999.0);
+    g_assert_cmpfloat(res, ==, 0.0);
+    g_assert_false(signbit(res));
     g_assert_null(endptr);

     /* not recognizable */
@@ -2123,6 +2125,7 @@ static void test_qemu_strtod_einval(void)
     err = qemu_strtod(str, &endptr, &res);
     g_assert_cmpint(err, ==, -EINVAL);
     g_assert_cmpfloat(res, ==, 0.0);
+    g_assert_false(signbit(res));
     g_assert_true(endptr == str);
 }

@@ -2309,7 +2312,8 @@ static void test_qemu_strtod_finite_einval(void)
     res = 999;
     err = qemu_strtod_finite(str, &endptr, &res);
     g_assert_cmpint(err, ==, -EINVAL);
-    g_assert_cmpfloat(res, ==, 999.0);
+    g_assert_cmpfloat(res, ==, 0.0);
+    g_assert_false(signbit(res));
     g_assert_true(endptr == str);

     /* NULL */
@@ -2318,7 +2322,8 @@ static void test_qemu_strtod_finite_einval(void)
     res = 999;
     err = qemu_strtod_finite(str, &endptr, &res);
     g_assert_cmpint(err, ==, -EINVAL);
-    g_assert_cmpfloat(res, ==, 999.0);
+    g_assert_cmpfloat(res, ==, 0.0);
+    g_assert_false(signbit(res));
     g_assert_null(endptr);

     /* not recognizable */
@@ -2327,7 +2332,8 @@ static void test_qemu_strtod_finite_einval(void)
     res = 999;
     err = qemu_strtod_finite(str, &endptr, &res);
     g_assert_cmpint(err, ==, -EINVAL);
-    g_assert_cmpfloat(res, ==, 999.0);
+    g_assert_cmpfloat(res, ==, 0.0);
+    g_assert_false(signbit(res));
     g_assert_true(endptr == str);
 }

@@ -2338,24 +2344,26 @@ static void test_qemu_strtod_finite_erange(void)
     int err;
     double res;

-    /* overflow */
+    /* overflow turns into EINVAL */
     str = "9e999";
     endptr = NULL;
     res = 999;
     err = qemu_strtod_finite(str, &endptr, &res);
-    g_assert_cmpint(err, ==, -ERANGE);
-    g_assert_cmpfloat(res, ==, HUGE_VAL);
-    g_assert_true(endptr == str + 5);
+    g_assert_cmpint(err, ==, -EINVAL);
+    g_assert_cmpfloat(res, ==, 0.0);
+    g_assert_false(signbit(res));
+    g_assert_true(endptr == str);

     str = "-9e+999";
     endptr = NULL;
     res = 999;
     err = qemu_strtod_finite(str, &endptr, &res);
-    g_assert_cmpint(err, ==, -ERANGE);
-    g_assert_cmpfloat(res, ==, -HUGE_VAL);
-    g_assert_true(endptr == str + 7);
+    g_assert_cmpint(err, ==, -EINVAL);
+    g_assert_cmpfloat(res, ==, 0.0);
+    g_assert_false(signbit(res));
+    g_assert_true(endptr == str);

-    /* underflow */
+    /* underflow is still possible */
     str = "-9e-999";
     endptr = NULL;
     res = 999;
@@ -2380,7 +2388,8 @@ static void test_qemu_strtod_finite_nonfinite(void)
     res = 999;
     err = qemu_strtod_finite(str, &endptr, &res);
     g_assert_cmpint(err, ==, -EINVAL);
-    g_assert_cmpfloat(res, ==, 999.0);
+    g_assert_cmpfloat(res, ==, 0.0);
+    g_assert_false(signbit(res));
     g_assert_true(endptr == str);

     str = "-infinity";
@@ -2388,7 +2397,8 @@ static void test_qemu_strtod_finite_nonfinite(void)
     res = 999;
     err = qemu_strtod_finite(str, &endptr, &res);
     g_assert_cmpint(err, ==, -EINVAL);
-    g_assert_cmpfloat(res, ==, 999.0);
+    g_assert_cmpfloat(res, ==, 0.0);
+    g_assert_false(signbit(res));
     g_assert_true(endptr == str);

     /* not a number */
@@ -2397,7 +2407,8 @@ static void test_qemu_strtod_finite_nonfinite(void)
     res = 999;
     err = qemu_strtod_finite(str, &endptr, &res);
     g_assert_cmpint(err, ==, -EINVAL);
-    g_assert_cmpfloat(res, ==, 999.0);
+    g_assert_cmpfloat(res, ==, 0.0);
+    g_assert_false(signbit(res));
     g_assert_true(endptr == str);
 }

@@ -2421,7 +2432,8 @@ static void test_qemu_strtod_finite_trailing(void)
     res = 999;
     err = qemu_strtod_finite(str, NULL, &res);
     g_assert_cmpint(err, ==, -EINVAL);
-    g_assert_cmpfloat(res, ==, 999.0);
+    g_assert_cmpfloat(res, ==, 1.0);
+    g_assert_false(signbit(res));

     /* trailing e is not an exponent */
     str = ".5e";
@@ -2436,7 +2448,8 @@ static void test_qemu_strtod_finite_trailing(void)
     res = 999;
     err = qemu_strtod_finite(str, NULL, &res);
     g_assert_cmpint(err, ==, -EINVAL);
-    g_assert_cmpfloat(res, ==, 999.0);
+    g_assert_cmpfloat(res, ==, 0.5);
+    g_assert_false(signbit(res));

     /* trailing ( not part of long NaN */
     str = "nan(";
@@ -2444,14 +2457,16 @@ static void test_qemu_strtod_finite_trailing(void)
     res = 999;
     err = qemu_strtod_finite(str, &endptr, &res);
     g_assert_cmpint(err, ==, -EINVAL);
-    g_assert_cmpfloat(res, ==, 999.0);
+    g_assert_cmpfloat(res, ==, 0.0);
+    g_assert_false(signbit(res));
     g_assert_true(endptr == str);

     endptr = NULL;
     res = 999;
     err = qemu_strtod_finite(str, NULL, &res);
     g_assert_cmpint(err, ==, -EINVAL);
-    g_assert_cmpfloat(res, ==, 999.0);
+    g_assert_cmpfloat(res, ==, 0.0);
+    g_assert_false(signbit(res));
 }

 static void test_qemu_strtosz_simple(void)
@@ -3063,8 +3078,8 @@ static void test_qemu_strtosz_trailing(void)
     res = 0xbaadf00d;
     err = qemu_strtosz(str, &endptr, &res);
     g_assert_cmpint(err, ==, 0);
-    g_assert_cmpuint(res, ==, EiB /* FIXME EiB * 1.5 */);
-    g_assert(endptr == str + 9 /* FIXME + 4 */);
+    g_assert_cmpuint(res, ==, 1 /* FIXME EiB * 1.5 */);
+    g_assert(endptr == str + 2 /* FIXME + 4 */);

     res = 0xbaadf00d;
     err = qemu_strtosz(str, NULL, &res);
diff --git a/util/cutils.c b/util/cutils.c
index 83948926ec9..0e056a27a44 100644
--- a/util/cutils.c
+++ b/util/cutils.c
@@ -649,12 +649,13 @@ int qemu_strtou64(const char *nptr, const char **endptr, int base,
  *
  * @nptr may be null, and no conversion is performed then.
  *
- * If no conversion is performed, store @nptr in *@endptr and return
- * -EINVAL.
+ * If no conversion is performed, store @nptr in *@endptr, +0.0 in
+ * @result, and return -EINVAL.
  *
  * If @endptr is null, and the string isn't fully converted, return
- * -EINVAL. This is the case when the pointer that would be stored in
- * a non-null @endptr points to a character other than '\0'.
+ * -EINVAL with @result set to the parsed value.  This is the case
+ * when the pointer that would be stored in a non-null @endptr points
+ * to a character other than '\0'.
  *
  * If the conversion overflows, store +/-HUGE_VAL in @result, depending
  * on the sign, and return -ERANGE.
@@ -669,6 +670,7 @@ int qemu_strtod(const char *nptr, const char **endptr, double *result)
     char *ep;

     if (!nptr) {
+        *result = 0.0;
         if (endptr) {
             *endptr = nptr;
         }
@@ -683,24 +685,28 @@ int qemu_strtod(const char *nptr, const char **endptr, double *result)
 /**
  * Convert string @nptr to a finite double.
  *
- * Works like qemu_strtod(), except that "NaN" and "inf" are rejected
- * with -EINVAL and no conversion is performed.
+ * Works like qemu_strtod(), except that "NaN", "inf", and strings
+ * that cause ERANGE overflow errors are rejected with -EINVAL as if
+ * no conversion is performed, storing 0.0 into @result regardless of
+ * any sign.  -ERANGE failures for underflow still preserve the parsed
+ * sign.
  */
 int qemu_strtod_finite(const char *nptr, const char **endptr, double *result)
 {
-    double tmp;
+    const char *tmp;
     int ret;

-    ret = qemu_strtod(nptr, endptr, &tmp);
-    if (!ret && !isfinite(tmp)) {
+    ret = qemu_strtod(nptr, &tmp, result);
+    if (!isfinite(*result)) {
         if (endptr) {
             *endptr = nptr;
         }
+        *result = 0.0;
+        ret = -EINVAL;
+    } else if (endptr) {
+        *endptr = tmp;
+    } else if (*tmp) {
         ret = -EINVAL;
-    }
-
-    if (ret != -EINVAL) {
-        *result = tmp;
     }
     return ret;
 }
-- 
2.40.1


