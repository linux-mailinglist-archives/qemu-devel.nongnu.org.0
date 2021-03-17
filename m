Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF8833F2BE
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 15:36:56 +0100 (CET)
Received: from localhost ([::1]:60808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMXI7-0003YV-72
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 10:36:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lMXF1-0001iI-UW
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 10:33:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lMXEp-0005J1-Ki
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 10:33:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615991610;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cwwsB+gmZvitCXTL4K++VWtZz4zPnv3E0zsA5rSs3sc=;
 b=UvXDm1qlv1Ww+zJdMKT/FjAGcHuhuttSB9I598B/u7Nd6irbMc+AXuIN3zquWljGYobM5U
 7wlR4FTH8i865txtKCKdY9PFuAcN5bMmM4zeUfkp8uH5jtTVhFICnmdv43EyXyyfL6kP6B
 xjbk9MY8UhuR9NKTULTUDVKJ+emXAS8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-230-ol_QU6X_M1-egMF3bisNxQ-1; Wed, 17 Mar 2021 10:33:28 -0400
X-MC-Unique: ol_QU6X_M1-egMF3bisNxQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E714D18C89D9;
 Wed, 17 Mar 2021 14:33:27 +0000 (UTC)
Received: from blue.redhat.com (ovpn-113-66.phx2.redhat.com [10.3.113.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 77AAC50330;
 Wed, 17 Mar 2021 14:33:27 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] utils: Tighter tests for qemu_strtosz
Date: Wed, 17 Mar 2021 09:33:24 -0500
Message-Id: <20210317143325.2165821-2-eblake@redhat.com>
In-Reply-To: <20210317143325.2165821-1-eblake@redhat.com>
References: <20210317143325.2165821-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: richard.henderson@linaro.org, thuth@redhat.com, berrange@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Our tests were not validating the return value in all cases, nor was
it guaranteeing our documented claim that 'res' is unchanged on error.
For that matter, it wasn't as thorough as the existing tests for
qemu_strtoi() and friends for proving that endptr and res are sanely
set.  Enhancing the test found one case where we violated our
documentation: namely, when failing with EINVAL when endptr is NULL,
we shouldn't modify res.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 tests/unit/test-cutils.c | 117 +++++++++++++++++++++++++++++++++++++--
 util/cutils.c            |   4 +-
 2 files changed, 114 insertions(+), 7 deletions(-)

diff --git a/tests/unit/test-cutils.c b/tests/unit/test-cutils.c
index e025b54c0514..5908de4fd041 100644
--- a/tests/unit/test-cutils.c
+++ b/tests/unit/test-cutils.c
@@ -1952,9 +1952,11 @@ static void test_qemu_strtosz_simple(void)
     const char *str;
     const char *endptr;
     int err;
-    uint64_t res = 0xbaadf00d;
+    uint64_t res;

     str = "0";
+    endptr = str;
+    res = 0xbaadf00d;
     err = qemu_strtosz(str, &endptr, &res);
     g_assert_cmpint(err, ==, 0);
     g_assert_cmpint(res, ==, 0);
@@ -1962,6 +1964,8 @@ static void test_qemu_strtosz_simple(void)

     /* Leading 0 gives decimal results, not octal */
     str = "08";
+    endptr = str;
+    res = 0xbaadf00d;
     err = qemu_strtosz(str, &endptr, &res);
     g_assert_cmpint(err, ==, 0);
     g_assert_cmpint(res, ==, 8);
@@ -1969,46 +1973,61 @@ static void test_qemu_strtosz_simple(void)

     /* Leading space is ignored */
     str = " 12345";
+    endptr = str;
+    res = 0xbaadf00d;
     err = qemu_strtosz(str, &endptr, &res);
     g_assert_cmpint(err, ==, 0);
     g_assert_cmpint(res, ==, 12345);
     g_assert(endptr == str + 6);

+    res = 0xbaadf00d;
     err = qemu_strtosz(str, NULL, &res);
     g_assert_cmpint(err, ==, 0);
     g_assert_cmpint(res, ==, 12345);

     str = "9007199254740991"; /* 2^53-1 */
+    endptr = str;
+    res = 0xbaadf00d;
     err = qemu_strtosz(str, &endptr, &res);
     g_assert_cmpint(err, ==, 0);
     g_assert_cmpint(res, ==, 0x1fffffffffffff);
     g_assert(endptr == str + 16);

     str = "9007199254740992"; /* 2^53 */
+    endptr = str;
+    res = 0xbaadf00d;
     err = qemu_strtosz(str, &endptr, &res);
     g_assert_cmpint(err, ==, 0);
     g_assert_cmpint(res, ==, 0x20000000000000);
     g_assert(endptr == str + 16);

     str = "9007199254740993"; /* 2^53+1 */
+    endptr = str;
+    res = 0xbaadf00d;
     err = qemu_strtosz(str, &endptr, &res);
     g_assert_cmpint(err, ==, 0);
     g_assert_cmpint(res, ==, 0x20000000000001);
     g_assert(endptr == str + 16);

     str = "18446744073709549568"; /* 0xfffffffffffff800 (53 msbs set) */
+    endptr = str;
+    res = 0xbaadf00d;
     err = qemu_strtosz(str, &endptr, &res);
     g_assert_cmpint(err, ==, 0);
     g_assert_cmpint(res, ==, 0xfffffffffffff800);
     g_assert(endptr == str + 20);

     str = "18446744073709550591"; /* 0xfffffffffffffbff */
+    endptr = str;
+    res = 0xbaadf00d;
     err = qemu_strtosz(str, &endptr, &res);
     g_assert_cmpint(err, ==, 0);
     g_assert_cmpint(res, ==, 0xfffffffffffffbff);
     g_assert(endptr == str + 20);

     str = "18446744073709551615"; /* 0xffffffffffffffff */
+    endptr = str;
+    res = 0xbaadf00d;
     err = qemu_strtosz(str, &endptr, &res);
     g_assert_cmpint(err, ==, 0);
     g_assert_cmpint(res, ==, 0xffffffffffffffff);
@@ -2020,21 +2039,27 @@ static void test_qemu_strtosz_hex(void)
     const char *str;
     const char *endptr;
     int err;
-    uint64_t res = 0xbaadf00d;
+    uint64_t res;

     str = "0x0";
+    endptr = str;
+    res = 0xbaadf00d;
     err = qemu_strtosz(str, &endptr, &res);
     g_assert_cmpint(err, ==, 0);
     g_assert_cmpint(res, ==, 0);
     g_assert(endptr == str + 3);

     str = "0xab";
+    endptr = str;
+    res = 0xbaadf00d;
     err = qemu_strtosz(str, &endptr, &res);
     g_assert_cmpint(err, ==, 0);
     g_assert_cmpint(res, ==, 171);
     g_assert(endptr == str + 4);

     str = "0xae";
+    endptr = str;
+    res = 0xbaadf00d;
     err = qemu_strtosz(str, &endptr, &res);
     g_assert_cmpint(err, ==, 0);
     g_assert_cmpint(res, ==, 174);
@@ -2053,44 +2078,60 @@ static void test_qemu_strtosz_units(void)
     const char *e = "1E";
     int err;
     const char *endptr;
-    uint64_t res = 0xbaadf00d;
+    uint64_t res;

     /* default is M */
+    endptr = NULL;
+    res = 0xbaadf00d;
     err = qemu_strtosz_MiB(none, &endptr, &res);
     g_assert_cmpint(err, ==, 0);
     g_assert_cmpint(res, ==, MiB);
     g_assert(endptr == none + 1);

+    endptr = NULL;
+    res = 0xbaadf00d;
     err = qemu_strtosz(b, &endptr, &res);
     g_assert_cmpint(err, ==, 0);
     g_assert_cmpint(res, ==, 1);
     g_assert(endptr == b + 2);

+    endptr = NULL;
+    res = 0xbaadf00d;
     err = qemu_strtosz(k, &endptr, &res);
     g_assert_cmpint(err, ==, 0);
     g_assert_cmpint(res, ==, KiB);
     g_assert(endptr == k + 2);

+    endptr = NULL;
+    res = 0xbaadf00d;
     err = qemu_strtosz(m, &endptr, &res);
     g_assert_cmpint(err, ==, 0);
     g_assert_cmpint(res, ==, MiB);
     g_assert(endptr == m + 2);

+    endptr = NULL;
+    res = 0xbaadf00d;
     err = qemu_strtosz(g, &endptr, &res);
     g_assert_cmpint(err, ==, 0);
     g_assert_cmpint(res, ==, GiB);
     g_assert(endptr == g + 2);

+    endptr = NULL;
+    res = 0xbaadf00d;
     err = qemu_strtosz(t, &endptr, &res);
     g_assert_cmpint(err, ==, 0);
     g_assert_cmpint(res, ==, TiB);
     g_assert(endptr == t + 2);

+    endptr = NULL;
+    res = 0xbaadf00d;
     err = qemu_strtosz(p, &endptr, &res);
     g_assert_cmpint(err, ==, 0);
     g_assert_cmpint(res, ==, PiB);
     g_assert(endptr == p + 2);

+    endptr = NULL;
+    res = 0xbaadf00d;
     err = qemu_strtosz(e, &endptr, &res);
     g_assert_cmpint(err, ==, 0);
     g_assert_cmpint(res, ==, EiB);
@@ -2102,9 +2143,11 @@ static void test_qemu_strtosz_float(void)
     const char *str;
     int err;
     const char *endptr;
-    uint64_t res = 0xbaadf00d;
+    uint64_t res;

     str = "0.5E";
+    endptr = str;
+    res = 0xbaadf00d;
     err = qemu_strtosz(str, &endptr, &res);
     g_assert_cmpint(err, ==, 0);
     g_assert_cmpint(res, ==, EiB / 2);
@@ -2112,6 +2155,8 @@ static void test_qemu_strtosz_float(void)

     /* For convenience, a fraction of 0 is tolerated even on bytes */
     str = "1.0B";
+    endptr = str;
+    res = 0xbaadf00d;
     err = qemu_strtosz(str, &endptr, &res);
     g_assert_cmpint(err, ==, 0);
     g_assert_cmpint(res, ==, 1);
@@ -2119,6 +2164,8 @@ static void test_qemu_strtosz_float(void)

     /* An empty fraction is tolerated */
     str = "1.k";
+    endptr = str;
+    res = 0xbaadf00d;
     err = qemu_strtosz(str, &endptr, &res);
     g_assert_cmpint(err, ==, 0);
     g_assert_cmpint(res, ==, 1024);
@@ -2126,6 +2173,8 @@ static void test_qemu_strtosz_float(void)

     /* For convenience, we permit values that are not byte-exact */
     str = "12.345M";
+    endptr = str;
+    res = 0xbaadf00d;
     err = qemu_strtosz(str, &endptr, &res);
     g_assert_cmpint(err, ==, 0);
     g_assert_cmpint(res, ==, (uint64_t) (12.345 * MiB + 0.5));
@@ -2140,67 +2189,91 @@ static void test_qemu_strtosz_invalid(void)
     uint64_t res = 0xbaadf00d;

     str = "";
+    endptr = NULL;
     err = qemu_strtosz(str, &endptr, &res);
     g_assert_cmpint(err, ==, -EINVAL);
+    g_assert_cmpint(res, ==, 0xbaadf00d);
     g_assert(endptr == str);

     str = " \t ";
+    endptr = NULL;
     err = qemu_strtosz(str, &endptr, &res);
     g_assert_cmpint(err, ==, -EINVAL);
+    g_assert_cmpint(res, ==, 0xbaadf00d);
     g_assert(endptr == str);

     str = "crap";
+    endptr = NULL;
     err = qemu_strtosz(str, &endptr, &res);
     g_assert_cmpint(err, ==, -EINVAL);
+    g_assert_cmpint(res, ==, 0xbaadf00d);
     g_assert(endptr == str);

     str = "inf";
+    endptr = NULL;
     err = qemu_strtosz(str, &endptr, &res);
     g_assert_cmpint(err, ==, -EINVAL);
+    g_assert_cmpint(res, ==, 0xbaadf00d);
     g_assert(endptr == str);

     str = "NaN";
+    endptr = NULL;
     err = qemu_strtosz(str, &endptr, &res);
     g_assert_cmpint(err, ==, -EINVAL);
+    g_assert_cmpint(res, ==, 0xbaadf00d);
     g_assert(endptr == str);

     /* Fractional values require scale larger than bytes */
     str = "1.1B";
+    endptr = NULL;
     err = qemu_strtosz(str, &endptr, &res);
     g_assert_cmpint(err, ==, -EINVAL);
+    g_assert_cmpint(res, ==, 0xbaadf00d);
     g_assert(endptr == str);

     str = "1.1";
+    endptr = NULL;
     err = qemu_strtosz(str, &endptr, &res);
     g_assert_cmpint(err, ==, -EINVAL);
+    g_assert_cmpint(res, ==, 0xbaadf00d);
     g_assert(endptr == str);

     /* No floating point exponents */
     str = "1.5e1k";
+    endptr = NULL;
     err = qemu_strtosz(str, &endptr, &res);
     g_assert_cmpint(err, ==, -EINVAL);
+    g_assert_cmpint(res, ==, 0xbaadf00d);
     g_assert(endptr == str);

     str = "1.5E+0k";
+    endptr = NULL;
     err = qemu_strtosz(str, &endptr, &res);
     g_assert_cmpint(err, ==, -EINVAL);
+    g_assert_cmpint(res, ==, 0xbaadf00d);
     g_assert(endptr == str);

     /* No hex fractions */
     str = "0x1.8k";
+    endptr = NULL;
     err = qemu_strtosz(str, &endptr, &res);
     g_assert_cmpint(err, ==, -EINVAL);
+    g_assert_cmpint(res, ==, 0xbaadf00d);
     g_assert(endptr == str);

     /* No negative values */
     str = "-0";
+    endptr = NULL;
     err = qemu_strtosz(str, &endptr, &res);
     g_assert_cmpint(err, ==, -EINVAL);
+    g_assert_cmpint(res, ==, 0xbaadf00d);
     g_assert(endptr == str);

     str = "-1";
+    endptr = NULL;
     err = qemu_strtosz(str, &endptr, &res);
     g_assert_cmpint(err, ==, -EINVAL);
+    g_assert_cmpint(res, ==, 0xbaadf00d);
     g_assert(endptr == str);
 }

@@ -2209,48 +2282,72 @@ static void test_qemu_strtosz_trailing(void)
     const char *str;
     const char *endptr;
     int err;
-    uint64_t res = 0xbaadf00d;
+    uint64_t res;

     str = "123xxx";
+    endptr = NULL;
+    res = 0xbaadf00d;
     err = qemu_strtosz_MiB(str, &endptr, &res);
+    g_assert_cmpint(err, ==, 0);
     g_assert_cmpint(res, ==, 123 * MiB);
     g_assert(endptr == str + 3);

+    res = 0xbaadf00d;
     err = qemu_strtosz(str, NULL, &res);
     g_assert_cmpint(err, ==, -EINVAL);
+    g_assert_cmpint(res, ==, 0xbaadf00d);

     str = "1kiB";
+    endptr = NULL;
+    res = 0xbaadf00d;
     err = qemu_strtosz(str, &endptr, &res);
     g_assert_cmpint(err, ==, 0);
     g_assert_cmpint(res, ==, 1024);
     g_assert(endptr == str + 2);

+    res = 0xbaadf00d;
     err = qemu_strtosz(str, NULL, &res);
     g_assert_cmpint(err, ==, -EINVAL);
+    g_assert_cmpint(res, ==, 0xbaadf00d);

     str = "0x";
+    endptr = NULL;
+    res = 0xbaadf00d;
     err = qemu_strtosz(str, &endptr, &res);
+    g_assert_cmpint(err, ==, 0);
     g_assert_cmpint(res, ==, 0);
     g_assert(endptr == str + 1);

+    res = 0xbaadf00d;
     err = qemu_strtosz(str, NULL, &res);
     g_assert_cmpint(err, ==, -EINVAL);
+    g_assert_cmpint(res, ==, 0xbaadf00d);

     str = "0.NaN";
+    endptr = NULL;
+    res = 0xbaadf00d;
     err = qemu_strtosz(str, &endptr, &res);
     g_assert_cmpint(err, ==, 0);
+    g_assert_cmpint(res, ==, 0);
     g_assert(endptr == str + 2);

+    res = 0xbaadf00d;
     err = qemu_strtosz(str, NULL, &res);
     g_assert_cmpint(err, ==, -EINVAL);
+    g_assert_cmpint(res, ==, 0xbaadf00d);

     str = "123-45";
+    endptr = NULL;
+    res = 0xbaadf00d;
     err = qemu_strtosz(str, &endptr, &res);
+    g_assert_cmpint(err, ==, 0);
     g_assert_cmpint(res, ==, 123);
     g_assert(endptr == str + 3);

+    res = 0xbaadf00d;
     err = qemu_strtosz(str, NULL, &res);
     g_assert_cmpint(err, ==, -EINVAL);
+    g_assert_cmpint(res, ==, 0xbaadf00d);
 }

 static void test_qemu_strtosz_erange(void)
@@ -2261,13 +2358,17 @@ static void test_qemu_strtosz_erange(void)
     uint64_t res = 0xbaadf00d;

     str = "18446744073709551616"; /* 2^64; see strtosz_simple for 2^64-1 */
+    endptr = NULL;
     err = qemu_strtosz(str, &endptr, &res);
     g_assert_cmpint(err, ==, -ERANGE);
+    g_assert_cmpint(res, ==, 0xbaadf00d);
     g_assert(endptr == str + 20);

     str = "20E";
+    endptr = NULL;
     err = qemu_strtosz(str, &endptr, &res);
     g_assert_cmpint(err, ==, -ERANGE);
+    g_assert_cmpint(res, ==, 0xbaadf00d);
     g_assert(endptr == str + 3);
 }

@@ -2276,15 +2377,19 @@ static void test_qemu_strtosz_metric(void)
     const char *str;
     int err;
     const char *endptr;
-    uint64_t res = 0xbaadf00d;
+    uint64_t res;

     str = "12345k";
+    endptr = str;
+    res = 0xbaadf00d;
     err = qemu_strtosz_metric(str, &endptr, &res);
     g_assert_cmpint(err, ==, 0);
     g_assert_cmpint(res, ==, 12345000);
     g_assert(endptr == str + 6);

     str = "12.345M";
+    endptr = str;
+    res = 0xbaadf00d;
     err = qemu_strtosz_metric(str, &endptr, &res);
     g_assert_cmpint(err, ==, 0);
     g_assert_cmpint(res, ==, 12345000);
diff --git a/util/cutils.c b/util/cutils.c
index c442882b88d5..b425ed6570c3 100644
--- a/util/cutils.c
+++ b/util/cutils.c
@@ -362,7 +362,6 @@ static int do_strtosz(const char *nptr, const char **end,
         }
     }

-    *result = val;
     retval = 0;

 out:
@@ -371,6 +370,9 @@ out:
     } else if (*endptr) {
         retval = -EINVAL;
     }
+    if (retval == 0) {
+        *result = val;
+    }

     return retval;
 }
-- 
2.30.2


