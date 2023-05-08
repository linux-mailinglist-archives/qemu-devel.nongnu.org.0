Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0D06FB7F0
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 22:07:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pw75n-0006HY-Sv; Mon, 08 May 2023 16:04:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pw75T-0006Ei-6s
 for qemu-devel@nongnu.org; Mon, 08 May 2023 16:04:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pw75O-0007Kc-Ve
 for qemu-devel@nongnu.org; Mon, 08 May 2023 16:03:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683576234;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qp/JKhOleLZTCNgS4yxWd9K5WDKme5TPewUS1v6PyqA=;
 b=hlj8oyOzyErILaf5hsOJTdyKI2obNZ/RpHCcKVy5HZ9iynJSKGeY+WdxI7T6U41AqcC8BE
 xwqjijcmwiBP7gRHCoBo4tnuaPTXF7ERWeEB8DdK7QR7DkyykZVIzkZNFDE3keEQNKR9b+
 JdulAzuusu0TPk9O1uewIl2XQHbh364=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-46-OFcttnTxO3mC-yCIWUvKvg-1; Mon, 08 May 2023 16:03:48 -0400
X-MC-Unique: OFcttnTxO3mC-yCIWUvKvg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3F8E41C0513E
 for <qemu-devel@nongnu.org>; Mon,  8 May 2023 20:03:48 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F0BF31121314;
 Mon,  8 May 2023 20:03:47 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: hreitz@redhat.com
Subject: [PATCH 06/11] test-cutils: Add more coverage to qemu_strtosz
Date: Mon,  8 May 2023 15:03:38 -0500
Message-Id: <20230508200343.791450-7-eblake@redhat.com>
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

Add some more strings that the user might send our way.  In
particular, some of these additions include FIXME comments showing
where our parser doesn't quite behave the way we want.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 tests/unit/test-cutils.c | 226 +++++++++++++++++++++++++++++++++++++--
 1 file changed, 215 insertions(+), 11 deletions(-)

diff --git a/tests/unit/test-cutils.c b/tests/unit/test-cutils.c
index afae2ee5331..9fa6fb042e8 100644
--- a/tests/unit/test-cutils.c
+++ b/tests/unit/test-cutils.c
@@ -2478,14 +2478,14 @@ static void test_qemu_strtosz_simple(void)
     g_assert_cmpuint(res, ==, 8);
     g_assert_true(endptr == str + 2);

-    /* Leading space is ignored */
-    str = " 12345";
+    /* Leading space and + are ignored */
+    str = " +12345";
     endptr = str;
     res = 0xbaadf00d;
     err = qemu_strtosz(str, &endptr, &res);
     g_assert_cmpint(err, ==, 0);
     g_assert_cmpuint(res, ==, 12345);
-    g_assert_true(endptr == str + 6);
+    g_assert_true(endptr == str + 7);

     res = 0xbaadf00d;
     err = qemu_strtosz(str, NULL, &res);
@@ -2564,13 +2564,13 @@ static void test_qemu_strtosz_hex(void)
     g_assert_cmpuint(res, ==, 171);
     g_assert_true(endptr == str + 4);

-    str = "0xae";
+    str = " +0xae";
     endptr = str;
     res = 0xbaadf00d;
     err = qemu_strtosz(str, &endptr, &res);
     g_assert_cmpint(err, ==, 0);
     g_assert_cmpuint(res, ==, 174);
-    g_assert_true(endptr == str + 4);
+    g_assert_true(endptr == str + 6);
 }

 static void test_qemu_strtosz_units(void)
@@ -2669,14 +2669,23 @@ static void test_qemu_strtosz_float(void)
     g_assert_cmpuint(res, ==, 1);
     g_assert_true(endptr == str + 4);

-    /* An empty fraction is tolerated */
-    str = "1.k";
+    /* An empty fraction tail is tolerated */
+    str = " 1.k";
     endptr = str;
     res = 0xbaadf00d;
     err = qemu_strtosz(str, &endptr, &res);
     g_assert_cmpint(err, ==, 0);
     g_assert_cmpuint(res, ==, 1024);
-    g_assert_true(endptr == str + 3);
+    g_assert_true(endptr == str + 4);
+
+    /* FIXME An empty fraction head should be tolerated */
+    str = " .5k";
+    endptr = str;
+    res = 0xbaadf00d;
+    err = qemu_strtosz(str, &endptr, &res);
+    g_assert_cmpint(err, ==, -EINVAL /* FIXME 0 */);
+    g_assert_cmpuint(res, ==, 0xbaadf00d /* FIXME 512 */);
+    g_assert_true(endptr == str /* FIXME + 4 */);

     /* For convenience, we permit values that are not byte-exact */
     str = "12.345M";
@@ -2686,6 +2695,32 @@ static void test_qemu_strtosz_float(void)
     g_assert_cmpint(err, ==, 0);
     g_assert_cmpuint(res, ==, (uint64_t) (12.345 * MiB + 0.5));
     g_assert_true(endptr == str + 7);
+
+    /* FIXME Fraction tail should round correctly */
+    str = "1.9999999999999999999999999999999999999999999999999999k";
+    endptr = str;
+    res = 0xbaadf00d;
+    err = qemu_strtosz(str, &endptr, &res);
+    g_assert_cmpint(err, ==, 0);
+    g_assert_cmpint(res, ==, 1024 /* FIXME 2048 */);
+    g_assert_true(endptr == str + 55);
+
+    /* FIXME ERANGE underflow in the fraction tail should not matter for 'k' */
+    str = "1."
+        "00000000000000000000000000000000000000000000000000"
+        "00000000000000000000000000000000000000000000000000"
+        "00000000000000000000000000000000000000000000000000"
+        "00000000000000000000000000000000000000000000000000"
+        "00000000000000000000000000000000000000000000000000"
+        "00000000000000000000000000000000000000000000000000"
+        "00000000000000000000000000000000000000000000000000"
+        "1k";
+    endptr = str;
+    res = 0xbaadf00d;
+    err = qemu_strtosz(str, &endptr, &res);
+    g_assert_cmpint(err, ==, 0);
+    g_assert_cmpuint(res, ==, 1 /* FIXME 1024 */);
+    g_assert_true(endptr == str + 354);
 }

 static void test_qemu_strtosz_invalid(void)
@@ -2693,10 +2728,20 @@ static void test_qemu_strtosz_invalid(void)
     const char *str;
     const char *endptr;
     int err;
-    uint64_t res = 0xbaadf00d;
+    uint64_t res;
+
+    /* Must parse at least one digit */
+    str = NULL;
+    endptr = "somewhere";
+    res = 0xbaadf00d;
+    err = qemu_strtosz(str, &endptr, &res);
+    g_assert_cmpint(err, ==, -EINVAL);
+    g_assert_cmphex(res, ==, 0xbaadf00d);
+    g_assert_null(endptr);

     str = "";
     endptr = NULL;
+    res = 0xbaadf00d;
     err = qemu_strtosz(str, &endptr, &res);
     g_assert_cmpint(err, ==, -EINVAL);
     g_assert_cmphex(res, ==, 0xbaadf00d);
@@ -2704,13 +2749,30 @@ static void test_qemu_strtosz_invalid(void)

     str = " \t ";
     endptr = NULL;
+    res = 0xbaadf00d;
     err = qemu_strtosz(str, &endptr, &res);
     g_assert_cmpint(err, ==, -EINVAL);
     g_assert_cmphex(res, ==, 0xbaadf00d);
     g_assert_true(endptr == str);

+    str = ".";
+    endptr = NULL;
+    res = 0xbaadf00d;
+    err = qemu_strtosz(str, &endptr, &res);
+    g_assert_cmpint(err, ==, -EINVAL);
+    g_assert_cmphex(res, ==, 0xbaadf00d);
+    g_assert(endptr == str);
+
+    str = " .";
+    endptr = NULL;
+    err = qemu_strtosz(str, &endptr, &res);
+    g_assert_cmpint(err, ==, -EINVAL);
+    g_assert_cmphex(res, ==, 0xbaadf00d);
+    g_assert(endptr == str);
+
     str = "crap";
     endptr = NULL;
+    res = 0xbaadf00d;
     err = qemu_strtosz(str, &endptr, &res);
     g_assert_cmpint(err, ==, -EINVAL);
     g_assert_cmphex(res, ==, 0xbaadf00d);
@@ -2718,6 +2780,7 @@ static void test_qemu_strtosz_invalid(void)

     str = "inf";
     endptr = NULL;
+    res = 0xbaadf00d;
     err = qemu_strtosz(str, &endptr, &res);
     g_assert_cmpint(err, ==, -EINVAL);
     g_assert_cmphex(res, ==, 0xbaadf00d);
@@ -2725,6 +2788,7 @@ static void test_qemu_strtosz_invalid(void)

     str = "NaN";
     endptr = NULL;
+    res = 0xbaadf00d;
     err = qemu_strtosz(str, &endptr, &res);
     g_assert_cmpint(err, ==, -EINVAL);
     g_assert_cmphex(res, ==, 0xbaadf00d);
@@ -2733,6 +2797,7 @@ static void test_qemu_strtosz_invalid(void)
     /* Fractional values require scale larger than bytes */
     str = "1.1B";
     endptr = NULL;
+    res = 0xbaadf00d;
     err = qemu_strtosz(str, &endptr, &res);
     g_assert_cmpint(err, ==, -EINVAL);
     g_assert_cmphex(res, ==, 0xbaadf00d);
@@ -2740,14 +2805,42 @@ static void test_qemu_strtosz_invalid(void)

     str = "1.1";
     endptr = NULL;
+    res = 0xbaadf00d;
     err = qemu_strtosz(str, &endptr, &res);
     g_assert_cmpint(err, ==, -EINVAL);
     g_assert_cmphex(res, ==, 0xbaadf00d);
     g_assert_true(endptr == str);

+    /* FIXME Fraction tail can cause ERANGE overflow */
+    str = "15.9999999999999999999999999999999999999999999999999999E";
+    endptr = str;
+    res = 0xbaadf00d;
+    err = qemu_strtosz(str, &endptr, &res);
+    g_assert_cmpint(err, ==, 0 /* FIXME -ERANGE */);
+    g_assert_cmpuint(res, ==, 15ULL * EiB /* FIXME 0xbaadf00d */);
+    g_assert_true(endptr == str + 56 /* FIXME str */);
+
+    /* FIXME ERANGE underflow in the fraction tail should matter for 'B' */
+    str = "1."
+        "00000000000000000000000000000000000000000000000000"
+        "00000000000000000000000000000000000000000000000000"
+        "00000000000000000000000000000000000000000000000000"
+        "00000000000000000000000000000000000000000000000000"
+        "00000000000000000000000000000000000000000000000000"
+        "00000000000000000000000000000000000000000000000000"
+        "00000000000000000000000000000000000000000000000000"
+        "1B";
+    endptr = str;
+    res = 0xbaadf00d;
+    err = qemu_strtosz(str, &endptr, &res);
+    g_assert_cmpint(err, ==, 0 /* FIXME -EINVAL */);
+    g_assert_cmpuint(res, ==, 1 /* FIXME 0xbaadf00d */);
+    g_assert_true(endptr == str + 354 /* FIXME str */);
+
     /* No hex fractions */
     str = "0x1.8k";
     endptr = NULL;
+    res = 0xbaadf00d;
     err = qemu_strtosz(str, &endptr, &res);
     g_assert_cmpint(err, ==, -EINVAL);
     g_assert_cmphex(res, ==, 0xbaadf00d);
@@ -2756,14 +2849,24 @@ static void test_qemu_strtosz_invalid(void)
     /* No suffixes */
     str = "0x18M";
     endptr = NULL;
+    res = 0xbaadf00d;
     err = qemu_strtosz(str, &endptr, &res);
     g_assert_cmpint(err, ==, -EINVAL);
     g_assert_cmphex(res, ==, 0xbaadf00d);
     g_assert_true(endptr == str);

+    str = "0x1p1";
+    endptr = NULL;
+    res = 0xbaadf00d;
+    err = qemu_strtosz(str, &endptr, &res);
+    g_assert_cmpint(err, ==, -EINVAL);
+    g_assert_cmphex(res, ==, 0xbaadf00d);
+    g_assert(endptr == str);
+
     /* No negative values */
-    str = "-0";
+    str = " -0";
     endptr = NULL;
+    res = 0xbaadf00d;
     err = qemu_strtosz(str, &endptr, &res);
     g_assert_cmpint(err, ==, -EINVAL);
     g_assert_cmphex(res, ==, 0xbaadf00d);
@@ -2771,10 +2874,28 @@ static void test_qemu_strtosz_invalid(void)

     str = "-1";
     endptr = NULL;
+    res = 0xbaadf00d;
     err = qemu_strtosz(str, &endptr, &res);
     g_assert_cmpint(err, ==, -EINVAL);
     g_assert_cmphex(res, ==, 0xbaadf00d);
     g_assert_true(endptr == str);
+
+    str = "-.0k";
+    endptr = NULL;
+    res = 0xbaadf00d;
+    err = qemu_strtosz(str, &endptr, &res);
+    g_assert_cmpint(err, ==, -EINVAL);
+    g_assert_cmphex(res, ==, 0xbaadf00d);
+    g_assert_true(endptr == str);
+
+    /* Too many decimals */
+    str = "1.1.k";
+    endptr = NULL;
+    res = 0xbaadf00d;
+    err = qemu_strtosz(str, &endptr, &res);
+    g_assert_cmpint(err, ==, -EINVAL);
+    g_assert_cmphex(res, ==, 0xbaadf00d);
+    g_assert(endptr == str);
 }

 static void test_qemu_strtosz_trailing(void)
@@ -2784,6 +2905,21 @@ static void test_qemu_strtosz_trailing(void)
     int err;
     uint64_t res;

+    /* Trailing whitespace */
+    str = "1k ";
+    endptr = NULL;
+    res = 0xbaadf00d;
+    err = qemu_strtosz(str, &endptr, &res);
+    g_assert_cmpint(err, ==, 0);
+    g_assert_cmpuint(res, ==, 1024);
+    g_assert(endptr == str + 2);
+
+    res = 0xbaadf00d;
+    err = qemu_strtosz(str, NULL, &res);
+    g_assert_cmpint(err, ==, -EINVAL);
+    g_assert_cmphex(res, ==, 0xbaadf00d);
+
+    /* Unknown suffix */
     str = "123xxx";
     endptr = NULL;
     res = 0xbaadf00d;
@@ -2797,6 +2933,7 @@ static void test_qemu_strtosz_trailing(void)
     g_assert_cmpint(err, ==, -EINVAL);
     g_assert_cmphex(res, ==, 0xbaadf00d);

+    /* Junk after one-byte suffix */
     str = "1kiB";
     endptr = NULL;
     res = 0xbaadf00d;
@@ -2810,6 +2947,7 @@ static void test_qemu_strtosz_trailing(void)
     g_assert_cmpint(err, ==, -EINVAL);
     g_assert_cmphex(res, ==, 0xbaadf00d);

+    /* Incomplete hex is an unknown suffix */
     str = "0x";
     endptr = NULL;
     res = 0xbaadf00d;
@@ -2823,6 +2961,7 @@ static void test_qemu_strtosz_trailing(void)
     g_assert_cmpint(err, ==, -EINVAL);
     g_assert_cmphex(res, ==, 0xbaadf00d);

+    /* Junk after decimal */
     str = "0.NaN";
     endptr = NULL;
     res = 0xbaadf00d;
@@ -2836,6 +2975,35 @@ static void test_qemu_strtosz_trailing(void)
     g_assert_cmpint(err, ==, -EINVAL);
     g_assert_cmphex(res, ==, 0xbaadf00d);

+    /* No support for binary literals; 'b' is valid suffix */
+    str = "0b1000";
+    endptr = NULL;
+    res = 0xbaadf00d;
+    err = qemu_strtosz(str, &endptr, &res);
+    g_assert_cmpint(err, ==, 0);
+    g_assert_cmpuint(res, ==, 0);
+    g_assert(endptr == str + 2);
+
+    res = 0xbaadf00d;
+    err = qemu_strtosz(str, NULL, &res);
+    g_assert_cmpint(err, ==, -EINVAL);
+    g_assert_cmphex(res, ==, 0xbaadf00d);
+
+    /* Hex literals use only one leading zero */
+    str = "00x1";
+    endptr = NULL;
+    res = 0xbaadf00d;
+    err = qemu_strtosz(str, &endptr, &res);
+    g_assert_cmpint(err, ==, 0);
+    g_assert_cmpuint(res, ==, 0);
+    g_assert(endptr == str + 2);
+
+    res = 0xbaadf00d;
+    err = qemu_strtosz(str, NULL, &res);
+    g_assert_cmpint(err, ==, -EINVAL);
+    g_assert_cmphex(res, ==, 0xbaadf00d);
+
+    /* Although negatives are invalid, '-' may be in trailing junk */
     str = "123-45";
     endptr = NULL;
     res = 0xbaadf00d;
@@ -2849,6 +3017,19 @@ static void test_qemu_strtosz_trailing(void)
     g_assert_cmpint(err, ==, -EINVAL);
     g_assert_cmphex(res, ==, 0xbaadf00d);

+    str = " 123 - 45";
+    endptr = NULL;
+    res = 0xbaadf00d;
+    err = qemu_strtosz(str, &endptr, &res);
+    g_assert_cmpint(err, ==, 0);
+    g_assert_cmpuint(res, ==, 123);
+    g_assert(endptr == str + 4);
+
+    res = 0xbaadf00d;
+    err = qemu_strtosz(str, NULL, &res);
+    g_assert_cmpint(err, ==, -EINVAL);
+    g_assert_cmphex(res, ==, 0xbaadf00d);
+
     /* FIXME should stop parse after 'e'. No floating point exponents */
     str = "1.5e1k";
     endptr = NULL;
@@ -2861,7 +3042,7 @@ static void test_qemu_strtosz_trailing(void)
     res = 0xbaadf00d;
     err = qemu_strtosz(str, NULL, &res);
     g_assert_cmpint(err, ==, -EINVAL);
-    g_assert_cmpint(res, ==, 0xbaadf00d);
+    g_assert_cmphex(res, ==, 0xbaadf00d);

     str = "1.5E+0k";
     endptr = NULL;
@@ -2875,6 +3056,20 @@ static void test_qemu_strtosz_trailing(void)
     err = qemu_strtosz(str, NULL, &res);
     g_assert_cmpint(err, ==, -EINVAL);
     g_assert_cmphex(res, ==, 0xbaadf00d);
+
+    /* FIXME overflow in fraction is buggy */
+    str = "1.5E999";
+    endptr = NULL;
+    res = 0xbaadf00d;
+    err = qemu_strtosz(str, &endptr, &res);
+    g_assert_cmpint(err, ==, 0);
+    g_assert_cmpuint(res, ==, EiB /* FIXME EiB * 1.5 */);
+    g_assert(endptr == str + 9 /* FIXME + 4 */);
+
+    res = 0xbaadf00d;
+    err = qemu_strtosz(str, NULL, &res);
+    g_assert_cmpint(err, ==, -EINVAL);
+    g_assert_cmphex(res, ==, 0xbaadf00d);
 }

 static void test_qemu_strtosz_erange(void)
@@ -2921,6 +3116,15 @@ static void test_qemu_strtosz_metric(void)
     g_assert_cmpint(err, ==, 0);
     g_assert_cmpuint(res, ==, 12345000);
     g_assert_true(endptr == str + 7);
+
+    /* Fraction is affected by floating-point rounding */
+    str = "18.446744073709550591E"; /* resembles 0xfffffffffffffbff */
+    endptr = str;
+    res = 0xbaadf00d;
+    err = qemu_strtosz_metric(str, &endptr, &res);
+    g_assert_cmpint(err, ==, 0);
+    g_assert_cmpuint(res, ==, 0xfffffffffffffc0c);
+    g_assert_true(endptr == str + 22);
 }

 static void test_freq_to_str(void)
-- 
2.40.1


