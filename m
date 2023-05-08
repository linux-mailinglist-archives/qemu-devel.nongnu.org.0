Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A89716FB7EC
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 22:05:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pw75g-0006GB-1w; Mon, 08 May 2023 16:04:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pw75P-0006EZ-9K
 for qemu-devel@nongnu.org; Mon, 08 May 2023 16:03:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pw75M-0007Jn-TA
 for qemu-devel@nongnu.org; Mon, 08 May 2023 16:03:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683576231;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G22OnOyAe2863Q1QJFr/0hmyHHaHf3TwbESSTF+Hoq4=;
 b=Uy7wH65TFeYMECUU021mgFyeniHFS3sCRXpHfIijE/4gPEUrVlPYxinXH2rKvRkPlNZ7SC
 7Q7o+F9w3cytFRTw4vdNt85kvHSOpw+4oX9WoeU/dz2EKjY3ig9lwAASSxWQ5m3JrQq6Sj
 WeRlAP+AuL5dVxWxa9c14fxTMfcbiYM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-662-LjZlTJlCPByFaglPABAWvg-1; Mon, 08 May 2023 16:03:49 -0400
X-MC-Unique: LjZlTJlCPByFaglPABAWvg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A4826101A531
 for <qemu-devel@nongnu.org>; Mon,  8 May 2023 20:03:49 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 629521121314;
 Mon,  8 May 2023 20:03:49 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: hreitz@redhat.com
Subject: [PATCH 08/11] cutils: Set value in all qemu_strtosz* error paths
Date: Mon,  8 May 2023 15:03:40 -0500
Message-Id: <20230508200343.791450-9-eblake@redhat.com>
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

Making callers determine whether or not *value was populated on error
is not nice for usability.  Pre-patch, we have unit tests that check
that *result is left unchanged on most EINVAL errors and set to 0 on
many ERANGE errors.  This is subtly different from libc strtoumax()
behavior which returns UINT64_MAX on ERANGE errors, as well as
different from our parse_uint() which slams to 0 on EINVAL on the
grounds that we want our functions to be harder to mis-use than
strtoumax().

Let's audit callers:

- hw/core/numa.c:parse_numa() fixed in the previous patch to check for
  errors

- migration/migration-hmp-cmds.c:hmp_migrate_set_parameter(),
  monitor/hmp.c:monitor_parse_arguments(),
  qapi/opts-visitor.c:opts_type_size(),
  qapi/qobject-input-visitor.c:qobject_input_type_size_keyval(),
  qemu-img.c:cvtnum_full(), qemu-io-cmds.c:cvtnum(),
  target/i386/cpu.c:x86_cpu_parse_featurestr(), and
  util/qemu-option.c:parse_option_size() appear to reject all failures
  (although some with distinct messages for ERANGE as opposed to
  EINVAL), so it doesn't matter what is in the value parameter on
  error.

- All remaining callers are in the testsuite, where we can tweak our
  expectations to match our new desired behavior.

Advancing to the end of the string parsed on overflow (ERANGE), while
still returning 0, makes sense (UINT64_MAX as a size is unlikely to be
useful); likewise, our size parsing code is complex enough that it's
easier to always return 0 when endptr is NULL but trailing garbage was
found, rather than trying to return the value of the prefix actually
parsed (no current caller cared about the value of the prefix).

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 tests/unit/test-cutils.c | 72 ++++++++++++++++++++--------------------
 util/cutils.c            | 17 +++++++---
 2 files changed, 48 insertions(+), 41 deletions(-)

diff --git a/tests/unit/test-cutils.c b/tests/unit/test-cutils.c
index 9fa6fb042e8..9cf00a810e4 100644
--- a/tests/unit/test-cutils.c
+++ b/tests/unit/test-cutils.c
@@ -2684,7 +2684,7 @@ static void test_qemu_strtosz_float(void)
     res = 0xbaadf00d;
     err = qemu_strtosz(str, &endptr, &res);
     g_assert_cmpint(err, ==, -EINVAL /* FIXME 0 */);
-    g_assert_cmpuint(res, ==, 0xbaadf00d /* FIXME 512 */);
+    g_assert_cmpuint(res, ==, 0 /* FIXME 512 */);
     g_assert_true(endptr == str /* FIXME + 4 */);

     /* For convenience, we permit values that are not byte-exact */
@@ -2736,7 +2736,7 @@ static void test_qemu_strtosz_invalid(void)
     res = 0xbaadf00d;
     err = qemu_strtosz(str, &endptr, &res);
     g_assert_cmpint(err, ==, -EINVAL);
-    g_assert_cmphex(res, ==, 0xbaadf00d);
+    g_assert_cmpuint(res, ==, 0);
     g_assert_null(endptr);

     str = "";
@@ -2744,7 +2744,7 @@ static void test_qemu_strtosz_invalid(void)
     res = 0xbaadf00d;
     err = qemu_strtosz(str, &endptr, &res);
     g_assert_cmpint(err, ==, -EINVAL);
-    g_assert_cmphex(res, ==, 0xbaadf00d);
+    g_assert_cmpuint(res, ==, 0);
     g_assert_true(endptr == str);

     str = " \t ";
@@ -2752,7 +2752,7 @@ static void test_qemu_strtosz_invalid(void)
     res = 0xbaadf00d;
     err = qemu_strtosz(str, &endptr, &res);
     g_assert_cmpint(err, ==, -EINVAL);
-    g_assert_cmphex(res, ==, 0xbaadf00d);
+    g_assert_cmpuint(res, ==, 0);
     g_assert_true(endptr == str);

     str = ".";
@@ -2760,14 +2760,14 @@ static void test_qemu_strtosz_invalid(void)
     res = 0xbaadf00d;
     err = qemu_strtosz(str, &endptr, &res);
     g_assert_cmpint(err, ==, -EINVAL);
-    g_assert_cmphex(res, ==, 0xbaadf00d);
+    g_assert_cmpuint(res, ==, 0);
     g_assert(endptr == str);

     str = " .";
     endptr = NULL;
     err = qemu_strtosz(str, &endptr, &res);
     g_assert_cmpint(err, ==, -EINVAL);
-    g_assert_cmphex(res, ==, 0xbaadf00d);
+    g_assert_cmpuint(res, ==, 0);
     g_assert(endptr == str);

     str = "crap";
@@ -2775,7 +2775,7 @@ static void test_qemu_strtosz_invalid(void)
     res = 0xbaadf00d;
     err = qemu_strtosz(str, &endptr, &res);
     g_assert_cmpint(err, ==, -EINVAL);
-    g_assert_cmphex(res, ==, 0xbaadf00d);
+    g_assert_cmpuint(res, ==, 0);
     g_assert_true(endptr == str);

     str = "inf";
@@ -2783,7 +2783,7 @@ static void test_qemu_strtosz_invalid(void)
     res = 0xbaadf00d;
     err = qemu_strtosz(str, &endptr, &res);
     g_assert_cmpint(err, ==, -EINVAL);
-    g_assert_cmphex(res, ==, 0xbaadf00d);
+    g_assert_cmpuint(res, ==, 0);
     g_assert_true(endptr == str);

     str = "NaN";
@@ -2791,7 +2791,7 @@ static void test_qemu_strtosz_invalid(void)
     res = 0xbaadf00d;
     err = qemu_strtosz(str, &endptr, &res);
     g_assert_cmpint(err, ==, -EINVAL);
-    g_assert_cmphex(res, ==, 0xbaadf00d);
+    g_assert_cmpuint(res, ==, 0);
     g_assert_true(endptr == str);

     /* Fractional values require scale larger than bytes */
@@ -2800,7 +2800,7 @@ static void test_qemu_strtosz_invalid(void)
     res = 0xbaadf00d;
     err = qemu_strtosz(str, &endptr, &res);
     g_assert_cmpint(err, ==, -EINVAL);
-    g_assert_cmphex(res, ==, 0xbaadf00d);
+    g_assert_cmpuint(res, ==, 0);
     g_assert_true(endptr == str);

     str = "1.1";
@@ -2808,7 +2808,7 @@ static void test_qemu_strtosz_invalid(void)
     res = 0xbaadf00d;
     err = qemu_strtosz(str, &endptr, &res);
     g_assert_cmpint(err, ==, -EINVAL);
-    g_assert_cmphex(res, ==, 0xbaadf00d);
+    g_assert_cmpuint(res, ==, 0);
     g_assert_true(endptr == str);

     /* FIXME Fraction tail can cause ERANGE overflow */
@@ -2817,7 +2817,7 @@ static void test_qemu_strtosz_invalid(void)
     res = 0xbaadf00d;
     err = qemu_strtosz(str, &endptr, &res);
     g_assert_cmpint(err, ==, 0 /* FIXME -ERANGE */);
-    g_assert_cmpuint(res, ==, 15ULL * EiB /* FIXME 0xbaadf00d */);
+    g_assert_cmpuint(res, ==, 15ULL * EiB /* FIXME 0 */);
     g_assert_true(endptr == str + 56 /* FIXME str */);

     /* FIXME ERANGE underflow in the fraction tail should matter for 'B' */
@@ -2834,7 +2834,7 @@ static void test_qemu_strtosz_invalid(void)
     res = 0xbaadf00d;
     err = qemu_strtosz(str, &endptr, &res);
     g_assert_cmpint(err, ==, 0 /* FIXME -EINVAL */);
-    g_assert_cmpuint(res, ==, 1 /* FIXME 0xbaadf00d */);
+    g_assert_cmpuint(res, ==, 1 /* FIXME 0 */);
     g_assert_true(endptr == str + 354 /* FIXME str */);

     /* No hex fractions */
@@ -2843,7 +2843,7 @@ static void test_qemu_strtosz_invalid(void)
     res = 0xbaadf00d;
     err = qemu_strtosz(str, &endptr, &res);
     g_assert_cmpint(err, ==, -EINVAL);
-    g_assert_cmphex(res, ==, 0xbaadf00d);
+    g_assert_cmpuint(res, ==, 0);
     g_assert_true(endptr == str);

     /* No suffixes */
@@ -2852,7 +2852,7 @@ static void test_qemu_strtosz_invalid(void)
     res = 0xbaadf00d;
     err = qemu_strtosz(str, &endptr, &res);
     g_assert_cmpint(err, ==, -EINVAL);
-    g_assert_cmphex(res, ==, 0xbaadf00d);
+    g_assert_cmpuint(res, ==, 0);
     g_assert_true(endptr == str);

     str = "0x1p1";
@@ -2860,7 +2860,7 @@ static void test_qemu_strtosz_invalid(void)
     res = 0xbaadf00d;
     err = qemu_strtosz(str, &endptr, &res);
     g_assert_cmpint(err, ==, -EINVAL);
-    g_assert_cmphex(res, ==, 0xbaadf00d);
+    g_assert_cmpuint(res, ==, 0);
     g_assert(endptr == str);

     /* No negative values */
@@ -2869,7 +2869,7 @@ static void test_qemu_strtosz_invalid(void)
     res = 0xbaadf00d;
     err = qemu_strtosz(str, &endptr, &res);
     g_assert_cmpint(err, ==, -EINVAL);
-    g_assert_cmphex(res, ==, 0xbaadf00d);
+    g_assert_cmpuint(res, ==, 0);
     g_assert_true(endptr == str);

     str = "-1";
@@ -2877,7 +2877,7 @@ static void test_qemu_strtosz_invalid(void)
     res = 0xbaadf00d;
     err = qemu_strtosz(str, &endptr, &res);
     g_assert_cmpint(err, ==, -EINVAL);
-    g_assert_cmphex(res, ==, 0xbaadf00d);
+    g_assert_cmpuint(res, ==, 0);
     g_assert_true(endptr == str);

     str = "-.0k";
@@ -2885,7 +2885,7 @@ static void test_qemu_strtosz_invalid(void)
     res = 0xbaadf00d;
     err = qemu_strtosz(str, &endptr, &res);
     g_assert_cmpint(err, ==, -EINVAL);
-    g_assert_cmphex(res, ==, 0xbaadf00d);
+    g_assert_cmpuint(res, ==, 0);
     g_assert_true(endptr == str);

     /* Too many decimals */
@@ -2894,7 +2894,7 @@ static void test_qemu_strtosz_invalid(void)
     res = 0xbaadf00d;
     err = qemu_strtosz(str, &endptr, &res);
     g_assert_cmpint(err, ==, -EINVAL);
-    g_assert_cmphex(res, ==, 0xbaadf00d);
+    g_assert_cmpuint(res, ==, 0);
     g_assert(endptr == str);
 }

@@ -2917,7 +2917,7 @@ static void test_qemu_strtosz_trailing(void)
     res = 0xbaadf00d;
     err = qemu_strtosz(str, NULL, &res);
     g_assert_cmpint(err, ==, -EINVAL);
-    g_assert_cmphex(res, ==, 0xbaadf00d);
+    g_assert_cmpuint(res, ==, 0);

     /* Unknown suffix */
     str = "123xxx";
@@ -2931,7 +2931,7 @@ static void test_qemu_strtosz_trailing(void)
     res = 0xbaadf00d;
     err = qemu_strtosz(str, NULL, &res);
     g_assert_cmpint(err, ==, -EINVAL);
-    g_assert_cmphex(res, ==, 0xbaadf00d);
+    g_assert_cmpuint(res, ==, 0);

     /* Junk after one-byte suffix */
     str = "1kiB";
@@ -2945,7 +2945,7 @@ static void test_qemu_strtosz_trailing(void)
     res = 0xbaadf00d;
     err = qemu_strtosz(str, NULL, &res);
     g_assert_cmpint(err, ==, -EINVAL);
-    g_assert_cmphex(res, ==, 0xbaadf00d);
+    g_assert_cmpuint(res, ==, 0);

     /* Incomplete hex is an unknown suffix */
     str = "0x";
@@ -2959,7 +2959,7 @@ static void test_qemu_strtosz_trailing(void)
     res = 0xbaadf00d;
     err = qemu_strtosz(str, NULL, &res);
     g_assert_cmpint(err, ==, -EINVAL);
-    g_assert_cmphex(res, ==, 0xbaadf00d);
+    g_assert_cmpuint(res, ==, 0);

     /* Junk after decimal */
     str = "0.NaN";
@@ -2973,7 +2973,7 @@ static void test_qemu_strtosz_trailing(void)
     res = 0xbaadf00d;
     err = qemu_strtosz(str, NULL, &res);
     g_assert_cmpint(err, ==, -EINVAL);
-    g_assert_cmphex(res, ==, 0xbaadf00d);
+    g_assert_cmpuint(res, ==, 0);

     /* No support for binary literals; 'b' is valid suffix */
     str = "0b1000";
@@ -2987,7 +2987,7 @@ static void test_qemu_strtosz_trailing(void)
     res = 0xbaadf00d;
     err = qemu_strtosz(str, NULL, &res);
     g_assert_cmpint(err, ==, -EINVAL);
-    g_assert_cmphex(res, ==, 0xbaadf00d);
+    g_assert_cmpuint(res, ==, 0);

     /* Hex literals use only one leading zero */
     str = "00x1";
@@ -3001,7 +3001,7 @@ static void test_qemu_strtosz_trailing(void)
     res = 0xbaadf00d;
     err = qemu_strtosz(str, NULL, &res);
     g_assert_cmpint(err, ==, -EINVAL);
-    g_assert_cmphex(res, ==, 0xbaadf00d);
+    g_assert_cmpuint(res, ==, 0);

     /* Although negatives are invalid, '-' may be in trailing junk */
     str = "123-45";
@@ -3015,7 +3015,7 @@ static void test_qemu_strtosz_trailing(void)
     res = 0xbaadf00d;
     err = qemu_strtosz(str, NULL, &res);
     g_assert_cmpint(err, ==, -EINVAL);
-    g_assert_cmphex(res, ==, 0xbaadf00d);
+    g_assert_cmpuint(res, ==, 0);

     str = " 123 - 45";
     endptr = NULL;
@@ -3028,7 +3028,7 @@ static void test_qemu_strtosz_trailing(void)
     res = 0xbaadf00d;
     err = qemu_strtosz(str, NULL, &res);
     g_assert_cmpint(err, ==, -EINVAL);
-    g_assert_cmphex(res, ==, 0xbaadf00d);
+    g_assert_cmpuint(res, ==, 0);

     /* FIXME should stop parse after 'e'. No floating point exponents */
     str = "1.5e1k";
@@ -3036,26 +3036,26 @@ static void test_qemu_strtosz_trailing(void)
     res = 0xbaadf00d;
     err = qemu_strtosz(str, &endptr, &res);
     g_assert_cmpint(err, ==, -EINVAL /* FIXME 0 */);
-    g_assert_cmphex(res, ==, 0xbaadf00d /* FIXME EiB * 1.5 */);
+    g_assert_cmpuint(res, ==, 0 /* FIXME EiB * 1.5 */);
     g_assert_true(endptr == str /* FIXME + 4 */);

     res = 0xbaadf00d;
     err = qemu_strtosz(str, NULL, &res);
     g_assert_cmpint(err, ==, -EINVAL);
-    g_assert_cmphex(res, ==, 0xbaadf00d);
+    g_assert_cmpuint(res, ==, 0);

     str = "1.5E+0k";
     endptr = NULL;
     res = 0xbaadf00d;
     err = qemu_strtosz(str, &endptr, &res);
     g_assert_cmpint(err, ==, -EINVAL /* FIXME 0 */);
-    g_assert_cmphex(res, ==, 0xbaadf00d /* FIXME EiB * 1.5 */);
+    g_assert_cmpuint(res, ==, 0 /* FIXME EiB * 1.5 */);
     g_assert_true(endptr == str /* FIXME + 4 */);

     res = 0xbaadf00d;
     err = qemu_strtosz(str, NULL, &res);
     g_assert_cmpint(err, ==, -EINVAL);
-    g_assert_cmphex(res, ==, 0xbaadf00d);
+    g_assert_cmpuint(res, ==, 0);

     /* FIXME overflow in fraction is buggy */
     str = "1.5E999";
@@ -3069,7 +3069,7 @@ static void test_qemu_strtosz_trailing(void)
     res = 0xbaadf00d;
     err = qemu_strtosz(str, NULL, &res);
     g_assert_cmpint(err, ==, -EINVAL);
-    g_assert_cmphex(res, ==, 0xbaadf00d);
+    g_assert_cmpuint(res, ==, 0);
 }

 static void test_qemu_strtosz_erange(void)
@@ -3083,14 +3083,14 @@ static void test_qemu_strtosz_erange(void)
     endptr = NULL;
     err = qemu_strtosz(str, &endptr, &res);
     g_assert_cmpint(err, ==, -ERANGE);
-    g_assert_cmphex(res, ==, 0xbaadf00d);
+    g_assert_cmpuint(res, ==, 0);
     g_assert_true(endptr == str + 20);

     str = "20E";
     endptr = NULL;
     err = qemu_strtosz(str, &endptr, &res);
     g_assert_cmpint(err, ==, -ERANGE);
-    g_assert_cmphex(res, ==, 0xbaadf00d);
+    g_assert_cmpuint(res, ==, 0);
     g_assert_true(endptr == str + 3);
 }

diff --git a/util/cutils.c b/util/cutils.c
index 5887e744140..8bacf349383 100644
--- a/util/cutils.c
+++ b/util/cutils.c
@@ -205,13 +205,15 @@ static int64_t suffix_mul(char suffix, int64_t unit)
  *
  * The end pointer will be returned in *end, if not NULL.  If there is
  * no fraction, the input can be decimal or hexadecimal; if there is a
- * fraction, then the input must be decimal and there must be a suffix
- * (possibly by @default_suffix) larger than Byte, and the fractional
- * portion may suffer from precision loss or rounding.  The input must
- * be positive.
+ * non-zero fraction, then the input must be decimal and there must be
+ * a suffix (possibly by @default_suffix) larger than Byte, and the
+ * fractional portion may suffer from precision loss or rounding.  The
+ * input must be positive.
  *
  * Return -ERANGE on overflow (with *@end advanced), and -EINVAL on
- * other error (with *@end left unchanged).
+ * other error (with *@end at @nptr).  Unlike strtoull, *@result is
+ * set to 0 on all errors, as returning UINT64_MAX on overflow is less
+ * likely to be usable as a size.
  */
 static int do_strtosz(const char *nptr, const char **end,
                       const char default_suffix, int64_t unit,
@@ -311,6 +313,11 @@ out:
     }
     if (retval == 0) {
         *result = val;
+    } else {
+        *result = 0;
+        if (end && retval == -EINVAL) {
+            *end = nptr;
+        }
     }

     return retval;
-- 
2.40.1


