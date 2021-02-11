Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E64543194BE
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 21:53:49 +0100 (CET)
Received: from localhost ([::1]:58058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAIyD-0004yP-0r
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 15:53:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lAIpa-0005tf-2v
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 15:44:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23462)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lAIpT-0007Pf-SF
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 15:44:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613076286;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UE1ml/pn/7dvsQEH1urpOqLErh0+o3x1vMK8RcqUT6g=;
 b=PgwOY3c1j8bT6no9eB6DWk+uXP6SPxv/Sy1528eTO1RYbFV1JNJpS2+BWTkc+t6sB8/qiP
 c2l38XQyEgeK8ovWln9CTMg+BUh8I9YQRH5M0aHbPVXa4hmdoFp+DHBSqvQzELumBhY3Yk
 ocu99bBrBD3aMSlLyTV8WiXE7MBj7X8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-466-R6L8a1GDOZWHB1ekgL_mqw-1; Thu, 11 Feb 2021 15:44:44 -0500
X-MC-Unique: R6L8a1GDOZWHB1ekgL_mqw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E63A3107ACC7;
 Thu, 11 Feb 2021 20:44:42 +0000 (UTC)
Received: from blue.redhat.com (ovpn-114-150.phx2.redhat.com [10.3.114.150])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2823610013D7;
 Thu, 11 Feb 2021 20:44:42 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/4] utils: Improve qemu_strtosz() to have 64 bits of
 precision
Date: Thu, 11 Feb 2021 14:44:36 -0600
Message-Id: <20210211204438.1184395-3-eblake@redhat.com>
In-Reply-To: <20210211204438.1184395-1-eblake@redhat.com>
References: <20210211204438.1184395-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, vsementsov@virtuozzo.com,
 berrange@redhat.com, qemu-block@nongnu.org, tao3.xu@intel.com,
 rjones@redhat.com, armbru@redhat.com, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We have multiple clients of qemu_strtosz (qemu-io, the opts visitor,
the keyval visitor), and it gets annoying that edge-case testing is
impacted by implicit rounding to 53 bits of precision due to parsing
with strtod().  As an example posted by Rich Jones:
 $ nbdkit memory $(( 2**63 - 2**30 )) --run \
   'build/qemu-io -f raw "$uri" -c "w -P 3 $(( 2**63 - 2**30 - 512 )) 512" '
 write failed: Input/output error

because 9223372035781033472 got rounded to 0x7fffffffc0000000 which is
out of bounds.

It is also worth noting that our existing parser, by virtue of using
strtod(), accepts decimal AND hex numbers, even though test-cutils
previously lacked any coverage of the latter until the previous patch.
We do have existing clients that expect a hex parse to work (for
example, iotest 33 using qemu-io -c "write -P 0xa 0x200 0x400"), but
strtod() parses "08" as 8 rather than as an invalid octal number, so
we know there are no clients that depend on octal.  Our use of
strtod() also means that "0x1.8k" would actually parse as 1536 (the
fraction is 8/16), rather than 1843 (if the fraction were 8/10); but
as this was not covered in the testsuite, I have no qualms forbidding
hex fractions as invalid, so this patch declares that the use of
fractions is only supported with decimal input, and enhances the
testsuite to document that.

Our previous use of strtod() meant that -1 parsed as a negative; now
that we parse with strtoull(), negative values can wrap around modulo
2^64, so we have to explicitly check whether the user passed in a '-';
and make it consistent to also reject '-0'.  This has the minor effect
of treating negative values as EINVAL (with no change to endptr)
rather than ERANGE (with endptr advanced to what was parsed), visible
in the updated iotest output.

We also had no testsuite coverage of "1.1e0k", which happened to parse
under strtod() but is unlikely to occur in practice; as long as we are
making things more robust, it is easy enough to reject the use of
exponents in a strtod parse.

The fix is done by breaking the parse into an integer prefix (no loss
in precision), rejecting negative values (since we can no longer rely
on strtod() to do that), determining if a decimal or hexadecimal parse
was intended (with the new restriction that a fractional hex parse is
not allowed), and where appropriate, using a floating point fractional
parse (where we also scan to reject use of exponents in the fraction).
The bulk of the patch is then updates to the testsuite to match our
new precision, as well as adding new cases we reject (whether they
were rejected or inadvertently accepted before).

Signed-off-by: Eric Blake <eblake@redhat.com>

---

Note that this approach differs from what has been attempted in the
past; see the thread starting at
https://lists.gnu.org/archive/html/qemu-devel/2019-12/msg00852.html
That approach tried to parse both as strtoull and strtod and take
whichever was longer, but that was harder to document.
---
 tests/test-cutils.c              | 74 ++++++++++----------------
 tests/test-keyval.c              | 35 +++++++++----
 tests/test-qemu-opts.c           | 33 ++++++++----
 util/cutils.c                    | 90 ++++++++++++++++++++++++--------
 tests/qemu-iotests/049.out       | 14 +++--
 tests/qemu-iotests/178.out.qcow2 |  3 +-
 tests/qemu-iotests/178.out.raw   |  3 +-
 7 files changed, 158 insertions(+), 94 deletions(-)

diff --git a/tests/test-cutils.c b/tests/test-cutils.c
index 6d9802e00b1b..bad3a6099389 100644
--- a/tests/test-cutils.c
+++ b/tests/test-cutils.c
@@ -1978,8 +1978,6 @@ static void test_qemu_strtosz_simple(void)
     g_assert_cmpint(err, ==, 0);
     g_assert_cmpint(res, ==, 12345);

-    /* Note: precision is 53 bits since we're parsing with strtod() */
-
     str = "9007199254740991"; /* 2^53-1 */
     err = qemu_strtosz(str, &endptr, &res);
     g_assert_cmpint(err, ==, 0);
@@ -1992,10 +1990,10 @@ static void test_qemu_strtosz_simple(void)
     g_assert_cmpint(res, ==, 0x20000000000000);
     g_assert(endptr == str + 16);

-    str = "9007199254740993"; /* 2^53+1 FIXME loss of precision is a bug */
+    str = "9007199254740993"; /* 2^53+1 */
     err = qemu_strtosz(str, &endptr, &res);
     g_assert_cmpint(err, ==, 0);
-    g_assert_cmpint(res, ==, 0x20000000000000); /* rounded to 53 bits */
+    g_assert_cmpint(res, ==, 0x20000000000001);
     g_assert(endptr == str + 16);

     str = "18446744073709549568"; /* 0xfffffffffffff800 (53 msbs set) */
@@ -2004,16 +2002,17 @@ static void test_qemu_strtosz_simple(void)
     g_assert_cmpint(res, ==, 0xfffffffffffff800);
     g_assert(endptr == str + 20);

-    str = "18446744073709550591"; /* 0xfffffffffffffbff FIXME */
+    str = "18446744073709550591"; /* 0xfffffffffffffbff */
     err = qemu_strtosz(str, &endptr, &res);
     g_assert_cmpint(err, ==, 0);
-    g_assert_cmpint(res, ==, 0xfffffffffffff800); /* rounded to 53 bits */
+    g_assert_cmpint(res, ==, 0xfffffffffffffbff);
     g_assert(endptr == str + 20);

-    /*
-     * FIXME 0xfffffffffffffe00..0xffffffffffffffff get rounded to
-     * 2^64, thus -ERANGE; see test_qemu_strtosz_erange()
-     */
+    str = "18446744073709551615"; /* 0xffffffffffffffff */
+    err = qemu_strtosz(str, &endptr, &res);
+    g_assert_cmpint(err, ==, 0);
+    g_assert_cmpint(res, ==, 0xffffffffffffffff);
+    g_assert(endptr == str + 20);
 }

 static void test_qemu_strtosz_hex(void)
@@ -2166,45 +2165,43 @@ static void test_qemu_strtosz_invalid(void)
     g_assert(endptr == str);

     /* Fractional values require scale larger than bytes */
-    /* FIXME endptr shouldn't move on -EINVAL */
     str = "1.1B";
     err = qemu_strtosz(str, &endptr, &res);
     g_assert_cmpint(err, ==, -EINVAL);
-    g_assert(endptr == str + 4);
+    g_assert(endptr == str);

-    /* FIXME endptr shouldn't move on -EINVAL */
     str = "1.1";
     err = qemu_strtosz(str, &endptr, &res);
     g_assert_cmpint(err, ==, -EINVAL);
-    g_assert(endptr == str + 3);
+    g_assert(endptr == str);

-    /* FIXME we should reject floating point exponents */
+    /* No floating point exponents */
     str = "1.5e1k";
     err = qemu_strtosz(str, &endptr, &res);
-    g_assert_cmpint(err, ==, 0);
-    g_assert_cmpint(res, ==, 15360);
-    g_assert(endptr == str + 6);
+    g_assert_cmpint(err, ==, -EINVAL);
+    g_assert(endptr == str);

-    /* FIXME we should reject floating point exponents */
     str = "1.5E+0k";
     err = qemu_strtosz(str, &endptr, &res);
-    g_assert_cmpint(err, ==, 0);
-    g_assert_cmpint(res, ==, 1536);
-    g_assert(endptr == str + 7);
+    g_assert_cmpint(err, ==, -EINVAL);
+    g_assert(endptr == str);

-    /* FIXME we should reject hex fractions */
+    /* No hex fractions */
     str = "0x1.8k";
     err = qemu_strtosz(str, &endptr, &res);
-    g_assert_cmpint(err, ==, 0);
-    g_assert_cmpint(res, ==, 1536);
-    g_assert(endptr == str + 6);
+    g_assert_cmpint(err, ==, -EINVAL);
+    g_assert(endptr == str);

-    /* FIXME we reject all other attempts at negative, why not -0 */
+    /* No negative values */
     str = "-0";
     err = qemu_strtosz(str, &endptr, &res);
-    g_assert_cmpint(err, ==, 0);
-    g_assert_cmpint(res, ==, 0);
-    g_assert(endptr == str + 2);
+    g_assert_cmpint(err, ==, -EINVAL);
+    g_assert(endptr == str);
+
+    str = "-1";
+    err = qemu_strtosz(str, &endptr, &res);
+    g_assert_cmpint(err, ==, -EINVAL);
+    g_assert(endptr == str);
 }

 static void test_qemu_strtosz_trailing(void)
@@ -2263,22 +2260,7 @@ static void test_qemu_strtosz_erange(void)
     int err;
     uint64_t res = 0xbaadf00d;

-    str = "-1";
-    err = qemu_strtosz(str, &endptr, &res);
-    g_assert_cmpint(err, ==, -ERANGE);
-    g_assert(endptr == str + 2);
-
-    str = "18446744073709550592"; /* 0xfffffffffffffc00 FIXME accept this */
-    err = qemu_strtosz(str, &endptr, &res);
-    g_assert_cmpint(err, ==, -ERANGE);
-    g_assert(endptr == str + 20);
-
-    str = "18446744073709551615"; /* 2^64-1 FIXME accept this */
-    err = qemu_strtosz(str, &endptr, &res);
-    g_assert_cmpint(err, ==, -ERANGE);
-    g_assert(endptr == str + 20);
-
-    str = "18446744073709551616"; /* 2^64 */
+    str = "18446744073709551616"; /* 2^64; see strtosz_simple for 2^64-1 */
     err = qemu_strtosz(str, &endptr, &res);
     g_assert_cmpint(err, ==, -ERANGE);
     g_assert(endptr == str + 20);
diff --git a/tests/test-keyval.c b/tests/test-keyval.c
index ee927fe4e427..e20c07cf3ea5 100644
--- a/tests/test-keyval.c
+++ b/tests/test-keyval.c
@@ -445,9 +445,9 @@ static void test_keyval_visit_size(void)
     visit_end_struct(v, NULL);
     visit_free(v);

-    /* Note: precision is 53 bits since we're parsing with strtod() */
+    /* Note: full 64 bits of precision */

-    /* Around limit of precision: 2^53-1, 2^53, 2^53+1 */
+    /* Around double limit of precision: 2^53-1, 2^53, 2^53+1 */
     qdict = keyval_parse("sz1=9007199254740991,"
                          "sz2=9007199254740992,"
                          "sz3=9007199254740993",
@@ -460,22 +460,25 @@ static void test_keyval_visit_size(void)
     visit_type_size(v, "sz2", &sz, &error_abort);
     g_assert_cmphex(sz, ==, 0x20000000000000);
     visit_type_size(v, "sz3", &sz, &error_abort);
-    g_assert_cmphex(sz, ==, 0x20000000000000);
+    g_assert_cmphex(sz, ==, 0x20000000000001);
     visit_check_struct(v, &error_abort);
     visit_end_struct(v, NULL);
     visit_free(v);

-    /* Close to signed upper limit 0x7ffffffffffffc00 (53 msbs set) */
-    qdict = keyval_parse("sz1=9223372036854774784," /* 7ffffffffffffc00 */
-                         "sz2=9223372036854775295", /* 7ffffffffffffdff */
+    /* Close to signed integer limit 2^63 */
+    qdict = keyval_parse("sz1=9223372036854775807," /* 7fffffffffffffff */
+                         "sz2=9223372036854775808," /* 8000000000000000 */
+                         "sz3=9223372036854775809", /* 8000000000000001 */
                          NULL, NULL, &error_abort);
     v = qobject_input_visitor_new_keyval(QOBJECT(qdict));
     qobject_unref(qdict);
     visit_start_struct(v, NULL, NULL, 0, &error_abort);
     visit_type_size(v, "sz1", &sz, &error_abort);
-    g_assert_cmphex(sz, ==, 0x7ffffffffffffc00);
+    g_assert_cmphex(sz, ==, 0x7fffffffffffffff);
     visit_type_size(v, "sz2", &sz, &error_abort);
-    g_assert_cmphex(sz, ==, 0x7ffffffffffffc00);
+    g_assert_cmphex(sz, ==, 0x8000000000000000);
+    visit_type_size(v, "sz3", &sz, &error_abort);
+    g_assert_cmphex(sz, ==, 0x8000000000000001);
     visit_check_struct(v, &error_abort);
     visit_end_struct(v, NULL);
     visit_free(v);
@@ -490,14 +493,26 @@ static void test_keyval_visit_size(void)
     visit_type_size(v, "sz1", &sz, &error_abort);
     g_assert_cmphex(sz, ==, 0xfffffffffffff800);
     visit_type_size(v, "sz2", &sz, &error_abort);
-    g_assert_cmphex(sz, ==, 0xfffffffffffff800);
+    g_assert_cmphex(sz, ==, 0xfffffffffffffbff);
+    visit_check_struct(v, &error_abort);
+    visit_end_struct(v, NULL);
+    visit_free(v);
+
+    /* Actual limit 2^64-1*/
+    qdict = keyval_parse("sz1=18446744073709551615", /* ffffffffffffffff */
+                         NULL, NULL, &error_abort);
+    v = qobject_input_visitor_new_keyval(QOBJECT(qdict));
+    qobject_unref(qdict);
+    visit_start_struct(v, NULL, NULL, 0, &error_abort);
+    visit_type_size(v, "sz1", &sz, &error_abort);
+    g_assert_cmphex(sz, ==, 0xffffffffffffffff);
     visit_check_struct(v, &error_abort);
     visit_end_struct(v, NULL);
     visit_free(v);

     /* Beyond limits */
     qdict = keyval_parse("sz1=-1,"
-                         "sz2=18446744073709550592", /* fffffffffffffc00 */
+                         "sz2=18446744073709551616", /* 2^64 */
                          NULL, NULL, &error_abort);
     v = qobject_input_visitor_new_keyval(QOBJECT(qdict));
     qobject_unref(qdict);
diff --git a/tests/test-qemu-opts.c b/tests/test-qemu-opts.c
index 8bbb17b1c726..6568e31a7229 100644
--- a/tests/test-qemu-opts.c
+++ b/tests/test-qemu-opts.c
@@ -654,9 +654,9 @@ static void test_opts_parse_size(void)
     g_assert_cmpuint(opts_count(opts), ==, 1);
     g_assert_cmpuint(qemu_opt_get_size(opts, "size1", 1), ==, 0);

-    /* Note: precision is 53 bits since we're parsing with strtod() */
+    /* Note: full 64 bits of precision */

-    /* Around limit of precision: 2^53-1, 2^53, 2^54 */
+    /* Around double limit of precision: 2^53-1, 2^53, 2^53+1 */
     opts = qemu_opts_parse(&opts_list_02,
                            "size1=9007199254740991,"
                            "size2=9007199254740992,"
@@ -668,18 +668,21 @@ static void test_opts_parse_size(void)
     g_assert_cmphex(qemu_opt_get_size(opts, "size2", 1),
                      ==, 0x20000000000000);
     g_assert_cmphex(qemu_opt_get_size(opts, "size3", 1),
-                     ==, 0x20000000000000);
+                     ==, 0x20000000000001);

-    /* Close to signed upper limit 0x7ffffffffffffc00 (53 msbs set) */
+    /* Close to signed int limit: 2^63-1, 2^63, 2^63+1 */
     opts = qemu_opts_parse(&opts_list_02,
-                           "size1=9223372036854774784," /* 7ffffffffffffc00 */
-                           "size2=9223372036854775295", /* 7ffffffffffffdff */
+                           "size1=9223372036854775807," /* 7fffffffffffffff */
+                           "size2=9223372036854775808," /* 8000000000000000 */
+                           "size3=9223372036854775809", /* 8000000000000001 */
                            false, &error_abort);
-    g_assert_cmpuint(opts_count(opts), ==, 2);
+    g_assert_cmpuint(opts_count(opts), ==, 3);
     g_assert_cmphex(qemu_opt_get_size(opts, "size1", 1),
-                     ==, 0x7ffffffffffffc00);
+                     ==, 0x7fffffffffffffff);
     g_assert_cmphex(qemu_opt_get_size(opts, "size2", 1),
-                     ==, 0x7ffffffffffffc00);
+                     ==, 0x8000000000000000);
+    g_assert_cmphex(qemu_opt_get_size(opts, "size3", 1),
+                     ==, 0x8000000000000001);

     /* Close to actual upper limit 0xfffffffffffff800 (53 msbs set) */
     opts = qemu_opts_parse(&opts_list_02,
@@ -690,14 +693,22 @@ static void test_opts_parse_size(void)
     g_assert_cmphex(qemu_opt_get_size(opts, "size1", 1),
                      ==, 0xfffffffffffff800);
     g_assert_cmphex(qemu_opt_get_size(opts, "size2", 1),
-                     ==, 0xfffffffffffff800);
+                     ==, 0xfffffffffffffbff);
+
+    /* Actual limit, 2^64-1 */
+    opts = qemu_opts_parse(&opts_list_02,
+                           "size1=18446744073709551615", /* ffffffffffffffff */
+                           false, &error_abort);
+    g_assert_cmpuint(opts_count(opts), ==, 1);
+    g_assert_cmphex(qemu_opt_get_size(opts, "size1", 1),
+                     ==, 0xffffffffffffffff);

     /* Beyond limits */
     opts = qemu_opts_parse(&opts_list_02, "size1=-1", false, &err);
     error_free_or_abort(&err);
     g_assert(!opts);
     opts = qemu_opts_parse(&opts_list_02,
-                           "size1=18446744073709550592", /* fffffffffffffc00 */
+                           "size1=18446744073709551616", /* 2^64 */
                            false, &err);
     error_free_or_abort(&err);
     g_assert(!opts);
diff --git a/util/cutils.c b/util/cutils.c
index 0b5073b33012..22d27b0fd21b 100644
--- a/util/cutils.c
+++ b/util/cutils.c
@@ -241,52 +241,100 @@ static int64_t suffix_mul(char suffix, int64_t unit)
 }

 /*
- * Convert string to bytes, allowing either B/b for bytes, K/k for KB,
- * M/m for MB, G/g for GB or T/t for TB. End pointer will be returned
- * in *end, if not NULL. Return -ERANGE on overflow, and -EINVAL on
- * other error.
+ * Convert size string to bytes.
+ *
+ * The size parsing supports the following syntaxes
+ * - 12345 - decimal, scale determined by @default_suffix and @unit
+ * - 12345{bBkKmMgGtTpPeE} - decimal, scale determined by suffix and @unit
+ * - 12345.678{kKmMgGtTpPeE} - decimal, scale determined by suffix, and
+ *   fractional portion is truncated to byte
+ * - 0x7fEE - hexadecimal, unit determined by @default_suffix
+ *
+ * The following are intentionally not supported
+ * - octal, such as 08
+ * - fractional hex, such as 0x1.8
+ * - floating point exponents, such as 1e3
+ *
+ * The end pointer will be returned in *end, if not NULL.  If there is
+ * no fraction, the input can be decimal or hexadecimal; if there is a
+ * fraction, then the input must be decimal and there must be a suffix
+ * (possibly by @default_suffix) larger than Byte, and the fractional
+ * portion may suffer from precision loss or rounding.  The input must
+ * be positive.
+ *
+ * Return -ERANGE on overflow (with *@end advanced), and -EINVAL on
+ * other error (with *@end left unchanged).
  */
 static int do_strtosz(const char *nptr, const char **end,
                       const char default_suffix, int64_t unit,
                       uint64_t *result)
 {
     int retval;
-    const char *endptr;
+    const char *endptr, *f;
     unsigned char c;
-    int mul_required = 0;
-    double val, mul, integral, fraction;
+    bool mul_required = false;
+    uint64_t val;
+    int64_t mul;
+    double fraction = 0.0;

-    retval = qemu_strtod_finite(nptr, &endptr, &val);
+    /* Parse integral portion as decimal. */
+    retval = qemu_strtou64(nptr, &endptr, 10, &val);
     if (retval) {
         goto out;
     }
-    fraction = modf(val, &integral);
-    if (fraction != 0) {
-        mul_required = 1;
+    if (memchr(nptr, '-', endptr - nptr) != NULL) {
+        endptr = nptr;
+        retval = -EINVAL;
+        goto out;
+    }
+    if (val == 0 && (*endptr == 'x' || *endptr == 'X')) {
+        /* Input looks like hex, reparse, and insist on no fraction. */
+        retval = qemu_strtou64(nptr, &endptr, 16, &val);
+        if (retval) {
+            goto out;
+        }
+        if (*endptr == '.') {
+            endptr = nptr;
+            retval = -EINVAL;
+            goto out;
+        }
+    } else if (*endptr == '.') {
+        /*
+         * Input looks like a fraction.  Make sure even 1.k works
+         * without fractional digits.  If we see an exponent, treat
+         * the entire input as invalid instead.
+         */
+        f = endptr;
+        retval = qemu_strtod_finite(f, &endptr, &fraction);
+        if (retval) {
+            fraction = 0.0;
+            endptr++;
+        } else if (memchr(f, 'e', endptr - f) || memchr(f, 'E', endptr - f)) {
+            endptr = nptr;
+            retval = -EINVAL;
+            goto out;
+        } else if (fraction != 0) {
+            mul_required = true;
+        }
     }
     c = *endptr;
     mul = suffix_mul(c, unit);
-    if (mul >= 0) {
+    if (mul > 0) {
         endptr++;
     } else {
         mul = suffix_mul(default_suffix, unit);
-        assert(mul >= 0);
+        assert(mul > 0);
     }
     if (mul == 1 && mul_required) {
+        endptr = nptr;
         retval = -EINVAL;
         goto out;
     }
-    /*
-     * Values near UINT64_MAX overflow to 2**64 when converting to double
-     * precision.  Compare against the maximum representable double precision
-     * value below 2**64, computed as "the next value after 2**64 (0x1p64) in
-     * the direction of 0".
-     */
-    if ((val * mul > nextafter(0x1p64, 0)) || val < 0) {
+    if (val > (UINT64_MAX - ((uint64_t) (fraction * mul))) / mul) {
         retval = -ERANGE;
         goto out;
     }
-    *result = val * mul;
+    *result = val * mul + (uint64_t) (fraction * mul);
     retval = 0;

 out:
diff --git a/tests/qemu-iotests/049.out b/tests/qemu-iotests/049.out
index b1d8fd9107ef..01f7b1f2408b 100644
--- a/tests/qemu-iotests/049.out
+++ b/tests/qemu-iotests/049.out
@@ -92,16 +92,22 @@ Formatting 'TEST_DIR/t.qcow2', fmt=qcow2 cluster_size=65536 extended_l2=off comp
 == 3. Invalid sizes ==

 qemu-img create -f qcow2 TEST_DIR/t.qcow2 -- -1024
-qemu-img: Invalid image size specified. Must be between 0 and 9223372036854775807.
+qemu-img: Invalid image size specified. You may use k, M, G, T, P or E suffixes for
+qemu-img: kilobytes, megabytes, gigabytes, terabytes, petabytes and exabytes.

 qemu-img create -f qcow2 -o size=-1024 TEST_DIR/t.qcow2
-qemu-img: TEST_DIR/t.qcow2: Value '-1024' is out of range for parameter 'size'
+qemu-img: TEST_DIR/t.qcow2: Parameter 'size' expects a non-negative number below 2^64
+Optional suffix k, M, G, T, P or E means kilo-, mega-, giga-, tera-, peta-
+and exabytes, respectively.

 qemu-img create -f qcow2 TEST_DIR/t.qcow2 -- -1k
-qemu-img: Invalid image size specified. Must be between 0 and 9223372036854775807.
+qemu-img: Invalid image size specified. You may use k, M, G, T, P or E suffixes for
+qemu-img: kilobytes, megabytes, gigabytes, terabytes, petabytes and exabytes.

 qemu-img create -f qcow2 -o size=-1k TEST_DIR/t.qcow2
-qemu-img: TEST_DIR/t.qcow2: Value '-1k' is out of range for parameter 'size'
+qemu-img: TEST_DIR/t.qcow2: Parameter 'size' expects a non-negative number below 2^64
+Optional suffix k, M, G, T, P or E means kilo-, mega-, giga-, tera-, peta-
+and exabytes, respectively.

 qemu-img create -f qcow2 TEST_DIR/t.qcow2 -- 1kilobyte
 qemu-img: Invalid image size specified. You may use k, M, G, T, P or E suffixes for
diff --git a/tests/qemu-iotests/178.out.qcow2 b/tests/qemu-iotests/178.out.qcow2
index fe193fd5f4ff..0d51fe401ecb 100644
--- a/tests/qemu-iotests/178.out.qcow2
+++ b/tests/qemu-iotests/178.out.qcow2
@@ -13,7 +13,8 @@ qemu-img: Invalid option list: ,
 qemu-img: Invalid parameter 'snapshot.foo'
 qemu-img: Failed in parsing snapshot param 'snapshot.foo=bar'
 qemu-img: --output must be used with human or json as argument.
-qemu-img: Invalid image size specified. Must be between 0 and 9223372036854775807.
+qemu-img: Invalid image size specified. You may use k, M, G, T, P or E suffixes for
+qemu-img: kilobytes, megabytes, gigabytes, terabytes, petabytes and exabytes.
 qemu-img: Unknown file format 'foo'

 == Size calculation for a new file (human) ==
diff --git a/tests/qemu-iotests/178.out.raw b/tests/qemu-iotests/178.out.raw
index 445e460fad99..116241ddef2f 100644
--- a/tests/qemu-iotests/178.out.raw
+++ b/tests/qemu-iotests/178.out.raw
@@ -13,7 +13,8 @@ qemu-img: Invalid option list: ,
 qemu-img: Invalid parameter 'snapshot.foo'
 qemu-img: Failed in parsing snapshot param 'snapshot.foo=bar'
 qemu-img: --output must be used with human or json as argument.
-qemu-img: Invalid image size specified. Must be between 0 and 9223372036854775807.
+qemu-img: Invalid image size specified. You may use k, M, G, T, P or E suffixes for
+qemu-img: kilobytes, megabytes, gigabytes, terabytes, petabytes and exabytes.
 qemu-img: Unknown file format 'foo'

 == Size calculation for a new file (human) ==
-- 
2.30.1


