Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A239D6FB7EE
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 22:06:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pw75p-0006Il-M4; Mon, 08 May 2023 16:04:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pw75N-0006ER-9c
 for qemu-devel@nongnu.org; Mon, 08 May 2023 16:03:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pw75J-0007J8-TN
 for qemu-devel@nongnu.org; Mon, 08 May 2023 16:03:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683576229;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BEYud4RTvD3ilmxWxMAjHFYX+Sekfi1DuUN+39KGiMQ=;
 b=iZxZJQvvONvyrCDs5mBrKOm49gdgIqshhh+UJD3Gd9Fz4ml3zIFO2OD8DhTJchrj0UOxFu
 Zyb1LQF4h8H8ieYnG8CoG1LwxVDzuX10HyckGcWgrMbVdGE7sptC53vdFj8Gv7+7MWkcsy
 P8llhnuN74wGca48o79krWZU2aqFoAg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-539-o9Nv0vL7PGOfqmV5j4ItzQ-1; Mon, 08 May 2023 16:03:47 -0400
X-MC-Unique: o9Nv0vL7PGOfqmV5j4ItzQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5BED084AF2F
 for <qemu-devel@nongnu.org>; Mon,  8 May 2023 20:03:47 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 190B31121314;
 Mon,  8 May 2023 20:03:47 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: hreitz@redhat.com
Subject: [PATCH 04/11] test-cutils: Add coverage of qemu_strtod
Date: Mon,  8 May 2023 15:03:36 -0500
Message-Id: <20230508200343.791450-5-eblake@redhat.com>
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

Plenty more corner cases of strtod proper, but this covers the bulk of
what our wrappers do. In particular, it demonstrates the difference on
when *value is left uninitialized, which an upcoming patch will
normalize.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 tests/unit/test-cutils.c | 435 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 435 insertions(+)

diff --git a/tests/unit/test-cutils.c b/tests/unit/test-cutils.c
index 1eeaf21ae22..4c096c6fc70 100644
--- a/tests/unit/test-cutils.c
+++ b/tests/unit/test-cutils.c
@@ -25,6 +25,8 @@
  * THE SOFTWARE.
  */

+#include <math.h>
+
 #include "qemu/osdep.h"
 #include "qemu/cutils.h"
 #include "qemu/units.h"
@@ -2044,6 +2046,414 @@ static void test_qemu_strtou64_full_max(void)
     g_free(str);
 }

+static void test_qemu_strtod_simple(void)
+{
+    const char *str;
+    const char *endptr;
+    int err;
+    double res;
+
+    /* no radix or exponent */
+    str = "1";
+    endptr = NULL;
+    res = 999;
+    err = qemu_strtod(str, &endptr, &res);
+    g_assert_cmpint(err, ==, 0);
+    g_assert_cmpfloat(res, ==, 1.0);
+    g_assert_true(endptr == str + 1);
+
+    /* leading space and sign */
+    str = " -0.0";
+    endptr = NULL;
+    res = 999;
+    err = qemu_strtod(str, &endptr, &res);
+    g_assert_cmpint(err, ==, 0);
+    g_assert_cmpfloat(res, ==, -0.0);
+    g_assert_true(signbit(res));
+    g_assert_true(endptr == str + 5);
+
+    /* fraction only */
+    str = "+.5";
+    endptr = NULL;
+    res = 999;
+    err = qemu_strtod(str, &endptr, &res);
+    g_assert_cmpint(err, ==, 0);
+    g_assert_cmpfloat(res, ==, 0.5);
+    g_assert_true(endptr == str + 3);
+
+    /* exponent */
+    str = "1.e+1";
+    endptr = NULL;
+    res = 999;
+    err = qemu_strtod(str, &endptr, &res);
+    g_assert_cmpint(err, ==, 0);
+    g_assert_cmpfloat(res, ==, 10.0);
+    g_assert_true(endptr == str + 5);
+}
+
+static void test_qemu_strtod_einval(void)
+{
+    const char *str;
+    const char *endptr;
+    int err;
+    double res;
+
+    /* empty */
+    str = "";
+    endptr = NULL;
+    res = 999;
+    err = qemu_strtod(str, &endptr, &res);
+    g_assert_cmpint(err, ==, -EINVAL);
+    g_assert_cmpfloat(res, ==, 0.0);
+    g_assert_true(endptr == str);
+
+    /* NULL */
+    str = NULL;
+    endptr = "random";
+    res = 999;
+    err = qemu_strtod(str, &endptr, &res);
+    g_assert_cmpint(err, ==, -EINVAL);
+    g_assert_cmpfloat(res, ==, 999.0);
+    g_assert_null(endptr);
+
+    /* not recognizable */
+    str = " junk";
+    endptr = NULL;
+    res = 999;
+    err = qemu_strtod(str, &endptr, &res);
+    g_assert_cmpint(err, ==, -EINVAL);
+    g_assert_cmpfloat(res, ==, 0.0);
+    g_assert_true(endptr == str);
+}
+
+static void test_qemu_strtod_erange(void)
+{
+    const char *str;
+    const char *endptr;
+    int err;
+    double res;
+
+    /* overflow */
+    str = "9e999";
+    endptr = NULL;
+    res = 999;
+    err = qemu_strtod(str, &endptr, &res);
+    g_assert_cmpint(err, ==, -ERANGE);
+    g_assert_cmpfloat(res, ==, HUGE_VAL);
+    g_assert_true(endptr == str + 5);
+
+    str = "-9e+999";
+    endptr = NULL;
+    res = 999;
+    err = qemu_strtod(str, &endptr, &res);
+    g_assert_cmpint(err, ==, -ERANGE);
+    g_assert_cmpfloat(res, ==, -HUGE_VAL);
+    g_assert_true(endptr == str + 7);
+
+    /* underflow */
+    str = "-9e-999";
+    endptr = NULL;
+    res = 999;
+    err = qemu_strtod(str, &endptr, &res);
+    g_assert_cmpint(err, ==, -ERANGE);
+    g_assert_cmpfloat(res, >=, -DBL_MIN);
+    g_assert_cmpfloat(res, <=, -0.0);
+    g_assert_true(signbit(res));
+    g_assert_true(endptr == str + 7);
+}
+
+static void test_qemu_strtod_nonfinite(void)
+{
+    const char *str;
+    const char *endptr;
+    int err;
+    double res;
+
+    /* infinity */
+    str = "inf";
+    endptr = NULL;
+    res = 999;
+    err = qemu_strtod(str, &endptr, &res);
+    g_assert_cmpint(err, ==, 0);
+    g_assert_true(isinf(res));
+    g_assert_false(signbit(res));
+    g_assert_true(endptr == str + 3);
+
+    str = "-infinity";
+    endptr = NULL;
+    res = 999;
+    err = qemu_strtod(str, &endptr, &res);
+    g_assert_cmpint(err, ==, 0);
+    g_assert_true(isinf(res));
+    g_assert_true(signbit(res));
+    g_assert_true(endptr == str + 9);
+
+    /* not a number */
+    str = " NaN";
+    endptr = NULL;
+    res = 999;
+    err = qemu_strtod(str, &endptr, &res);
+    g_assert_cmpint(err, ==, 0);
+    g_assert_true(isnan(res));
+    g_assert_true(endptr == str + 4);
+}
+
+static void test_qemu_strtod_trailing(void)
+{
+    const char *str;
+    const char *endptr;
+    int err;
+    double res;
+
+    /* trailing whitespace */
+    str = "1. ";
+    endptr = NULL;
+    res = 999;
+    err = qemu_strtod(str, &endptr, &res);
+    g_assert_cmpint(err, ==, 0);
+    g_assert_cmpfloat(res, ==, 1.0);
+    g_assert_true(endptr == str + 2);
+
+    endptr = NULL;
+    res = 999;
+    err = qemu_strtod(str, NULL, &res);
+    g_assert_cmpint(err, ==, -EINVAL);
+    g_assert_cmpfloat(res, ==, 1.0);
+
+    /* trailing e is not an exponent */
+    str = ".5e";
+    endptr = NULL;
+    res = 999;
+    err = qemu_strtod(str, &endptr, &res);
+    g_assert_cmpint(err, ==, 0);
+    g_assert_cmpfloat(res, ==, 0.5);
+    g_assert_true(endptr == str + 2);
+
+    endptr = NULL;
+    res = 999;
+    err = qemu_strtod(str, NULL, &res);
+    g_assert_cmpint(err, ==, -EINVAL);
+    g_assert_cmpfloat(res, ==, 0.5);
+
+    /* trailing ( not part of long NaN */
+    str = "nan(";
+    endptr = NULL;
+    res = 999;
+    err = qemu_strtod(str, &endptr, &res);
+    g_assert_cmpint(err, ==, 0);
+    g_assert_true(isnan(res));
+    g_assert_true(endptr == str + 3);
+
+    endptr = NULL;
+    res = 999;
+    err = qemu_strtod(str, NULL, &res);
+    g_assert_cmpint(err, ==, -EINVAL);
+    g_assert_true(isnan(res));
+}
+
+static void test_qemu_strtod_finite_simple(void)
+{
+    const char *str;
+    const char *endptr;
+    int err;
+    double res;
+
+    /* no radix or exponent */
+    str = "1";
+    endptr = NULL;
+    res = 999;
+    err = qemu_strtod_finite(str, &endptr, &res);
+    g_assert_cmpint(err, ==, 0);
+    g_assert_cmpfloat(res, ==, 1.0);
+    g_assert_true(endptr == str + 1);
+
+    /* leading space and sign */
+    str = " -0.0";
+    endptr = NULL;
+    res = 999;
+    err = qemu_strtod_finite(str, &endptr, &res);
+    g_assert_cmpint(err, ==, 0);
+    g_assert_cmpfloat(res, ==, -0.0);
+    g_assert_true(signbit(res));
+    g_assert_true(endptr == str + 5);
+
+    /* fraction only */
+    str = "+.5";
+    endptr = NULL;
+    res = 999;
+    err = qemu_strtod_finite(str, &endptr, &res);
+    g_assert_cmpint(err, ==, 0);
+    g_assert_cmpfloat(res, ==, 0.5);
+    g_assert_true(endptr == str + 3);
+
+    /* exponent */
+    str = "1.e+1";
+    endptr = NULL;
+    res = 999;
+    err = qemu_strtod_finite(str, &endptr, &res);
+    g_assert_cmpint(err, ==, 0);
+    g_assert_cmpfloat(res, ==, 10.0);
+    g_assert_true(endptr == str + 5);
+}
+
+static void test_qemu_strtod_finite_einval(void)
+{
+    const char *str;
+    const char *endptr;
+    int err;
+    double res;
+
+    /* empty */
+    str = "";
+    endptr = NULL;
+    res = 999;
+    err = qemu_strtod_finite(str, &endptr, &res);
+    g_assert_cmpint(err, ==, -EINVAL);
+    g_assert_cmpfloat(res, ==, 999.0);
+    g_assert_true(endptr == str);
+
+    /* NULL */
+    str = NULL;
+    endptr = "random";
+    res = 999;
+    err = qemu_strtod_finite(str, &endptr, &res);
+    g_assert_cmpint(err, ==, -EINVAL);
+    g_assert_cmpfloat(res, ==, 999.0);
+    g_assert_null(endptr);
+
+    /* not recognizable */
+    str = " junk";
+    endptr = NULL;
+    res = 999;
+    err = qemu_strtod_finite(str, &endptr, &res);
+    g_assert_cmpint(err, ==, -EINVAL);
+    g_assert_cmpfloat(res, ==, 999.0);
+    g_assert_true(endptr == str);
+}
+
+static void test_qemu_strtod_finite_erange(void)
+{
+    const char *str;
+    const char *endptr;
+    int err;
+    double res;
+
+    /* overflow */
+    str = "9e999";
+    endptr = NULL;
+    res = 999;
+    err = qemu_strtod_finite(str, &endptr, &res);
+    g_assert_cmpint(err, ==, -ERANGE);
+    g_assert_cmpfloat(res, ==, HUGE_VAL);
+    g_assert_true(endptr == str + 5);
+
+    str = "-9e+999";
+    endptr = NULL;
+    res = 999;
+    err = qemu_strtod_finite(str, &endptr, &res);
+    g_assert_cmpint(err, ==, -ERANGE);
+    g_assert_cmpfloat(res, ==, -HUGE_VAL);
+    g_assert_true(endptr == str + 7);
+
+    /* underflow */
+    str = "-9e-999";
+    endptr = NULL;
+    res = 999;
+    err = qemu_strtod_finite(str, &endptr, &res);
+    g_assert_cmpint(err, ==, -ERANGE);
+    g_assert_cmpfloat(res, >=, -DBL_MIN);
+    g_assert_cmpfloat(res, <=, -0.0);
+    g_assert_true(signbit(res));
+    g_assert_true(endptr == str + 7);
+}
+
+static void test_qemu_strtod_finite_nonfinite(void)
+{
+    const char *str;
+    const char *endptr;
+    int err;
+    double res;
+
+    /* infinity */
+    str = "inf";
+    endptr = NULL;
+    res = 999;
+    err = qemu_strtod_finite(str, &endptr, &res);
+    g_assert_cmpint(err, ==, -EINVAL);
+    g_assert_cmpfloat(res, ==, 999.0);
+    g_assert_true(endptr == str);
+
+    str = "-infinity";
+    endptr = NULL;
+    res = 999;
+    err = qemu_strtod_finite(str, &endptr, &res);
+    g_assert_cmpint(err, ==, -EINVAL);
+    g_assert_cmpfloat(res, ==, 999.0);
+    g_assert_true(endptr == str);
+
+    /* not a number */
+    str = " NaN";
+    endptr = NULL;
+    res = 999;
+    err = qemu_strtod_finite(str, &endptr, &res);
+    g_assert_cmpint(err, ==, -EINVAL);
+    g_assert_cmpfloat(res, ==, 999.0);
+    g_assert_true(endptr == str);
+}
+
+static void test_qemu_strtod_finite_trailing(void)
+{
+    const char *str;
+    const char *endptr;
+    int err;
+    double res;
+
+    /* trailing whitespace */
+    str = "1. ";
+    endptr = NULL;
+    res = 999;
+    err = qemu_strtod_finite(str, &endptr, &res);
+    g_assert_cmpint(err, ==, 0);
+    g_assert_cmpfloat(res, ==, 1.0);
+    g_assert_true(endptr == str + 2);
+
+    endptr = NULL;
+    res = 999;
+    err = qemu_strtod_finite(str, NULL, &res);
+    g_assert_cmpint(err, ==, -EINVAL);
+    g_assert_cmpfloat(res, ==, 999.0);
+
+    /* trailing e is not an exponent */
+    str = ".5e";
+    endptr = NULL;
+    res = 999;
+    err = qemu_strtod_finite(str, &endptr, &res);
+    g_assert_cmpint(err, ==, 0);
+    g_assert_cmpfloat(res, ==, 0.5);
+    g_assert_true(endptr == str + 2);
+
+    endptr = NULL;
+    res = 999;
+    err = qemu_strtod_finite(str, NULL, &res);
+    g_assert_cmpint(err, ==, -EINVAL);
+    g_assert_cmpfloat(res, ==, 999.0);
+
+    /* trailing ( not part of long NaN */
+    str = "nan(";
+    endptr = NULL;
+    res = 999;
+    err = qemu_strtod_finite(str, &endptr, &res);
+    g_assert_cmpint(err, ==, -EINVAL);
+    g_assert_cmpfloat(res, ==, 999.0);
+    g_assert_true(endptr == str);
+
+    endptr = NULL;
+    res = 999;
+    err = qemu_strtod_finite(str, NULL, &res);
+    g_assert_cmpint(err, ==, -EINVAL);
+    g_assert_cmpfloat(res, ==, 999.0);
+}
+
 static void test_qemu_strtosz_simple(void)
 {
     const char *str;
@@ -2833,6 +3243,31 @@ int main(int argc, char **argv)
     g_test_add_func("/cutils/qemu_strtou64_full/max",
                     test_qemu_strtou64_full_max);

+    /* qemu_strtod() tests */
+    g_test_add_func("/cutils/qemu_strtod/simple",
+                    test_qemu_strtod_simple);
+    g_test_add_func("/cutils/qemu_strtod/einval",
+                    test_qemu_strtod_einval);
+    g_test_add_func("/cutils/qemu_strtod/erange",
+                    test_qemu_strtod_erange);
+    g_test_add_func("/cutils/qemu_strtod/nonfinite",
+                    test_qemu_strtod_nonfinite);
+    g_test_add_func("/cutils/qemu_strtod/trailing",
+                    test_qemu_strtod_trailing);
+
+    /* qemu_strtod_finite() tests */
+    g_test_add_func("/cutils/qemu_strtod_finite/simple",
+                    test_qemu_strtod_finite_simple);
+    g_test_add_func("/cutils/qemu_strtod_finite/einval",
+                    test_qemu_strtod_finite_einval);
+    g_test_add_func("/cutils/qemu_strtod_finite/erange",
+                    test_qemu_strtod_finite_erange);
+    g_test_add_func("/cutils/qemu_strtod_finite/nonfinite",
+                    test_qemu_strtod_finite_nonfinite);
+    g_test_add_func("/cutils/qemu_strtod_finite/trailing",
+                    test_qemu_strtod_finite_trailing);
+
+    /* qemu_strtosz() tests */
     g_test_add_func("/cutils/strtosz/simple",
                     test_qemu_strtosz_simple);
     g_test_add_func("/cutils/strtosz/hex",
-- 
2.40.1


