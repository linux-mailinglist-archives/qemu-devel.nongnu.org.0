Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 489F93194BC
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 21:51:27 +0100 (CET)
Received: from localhost ([::1]:53320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAIvu-0002x9-Aw
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 15:51:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lAIpX-0005sh-Df
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 15:44:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20298)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lAIpR-0007Os-JG
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 15:44:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613076285;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Wr1IAzfe30rhb7m/BSh9G7kt+HzJhVBA0gnMMwAHsDo=;
 b=KKdKdjocXjQ1XGqB8RqmMpNumJSsIXsLBmL4zafhusN3MT1VS5xRA1jp1ZMuDSIrOb/Rm7
 +4ZmCkClkGa2EV20kN9wx+qGBwvRMm6OtyyPuC4KRQ4ki6CTmcesWkgHEw/waTHgP2grr3
 EezTCjKt326AJCTs5Ka30KOfVrzP7Qc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-27-tIm2zacaPG6B-bUcHrvDQw-1; Thu, 11 Feb 2021 15:44:43 -0500
X-MC-Unique: tIm2zacaPG6B-bUcHrvDQw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D90DB100CCC2;
 Thu, 11 Feb 2021 20:44:41 +0000 (UTC)
Received: from blue.redhat.com (ovpn-114-150.phx2.redhat.com [10.3.114.150])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 31BC510013D7;
 Thu, 11 Feb 2021 20:44:41 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/4] utils: Enhance testsuite for do_strtosz()
Date: Thu, 11 Feb 2021 14:44:35 -0600
Message-Id: <20210211204438.1184395-2-eblake@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
Cc: vsementsov@virtuozzo.com, berrange@redhat.com, qemu-block@nongnu.org,
 tao3.xu@intel.com, rjones@redhat.com, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Enhance our testsuite coverage of do_strtosz() to cover some things we
know that existing users want to continue working (hex bytes), as well
as some things that accidentally work but shouldn't (hex fractions) or
accidentally fail but that users want to work (64-bit precision on
byte values).  This includes fixing a typo in the comment regarding
our parsing near 2^64.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 tests/test-cutils.c | 154 ++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 143 insertions(+), 11 deletions(-)

diff --git a/tests/test-cutils.c b/tests/test-cutils.c
index 1aa8351520ae..6d9802e00b1b 100644
--- a/tests/test-cutils.c
+++ b/tests/test-cutils.c
@@ -1960,11 +1960,19 @@ static void test_qemu_strtosz_simple(void)
     g_assert_cmpint(res, ==, 0);
     g_assert(endptr == str + 1);

-    str = "12345";
+    /* Leading 0 gives decimal results, not octal */
+    str = "08";
+    err = qemu_strtosz(str, &endptr, &res);
+    g_assert_cmpint(err, ==, 0);
+    g_assert_cmpint(res, ==, 8);
+    g_assert(endptr == str + 2);
+
+    /* Leading space is ignored */
+    str = " 12345";
     err = qemu_strtosz(str, &endptr, &res);
     g_assert_cmpint(err, ==, 0);
     g_assert_cmpint(res, ==, 12345);
-    g_assert(endptr == str + 5);
+    g_assert(endptr == str + 6);

     err = qemu_strtosz(str, NULL, &res);
     g_assert_cmpint(err, ==, 0);
@@ -1984,7 +1992,7 @@ static void test_qemu_strtosz_simple(void)
     g_assert_cmpint(res, ==, 0x20000000000000);
     g_assert(endptr == str + 16);

-    str = "9007199254740993"; /* 2^53+1 */
+    str = "9007199254740993"; /* 2^53+1 FIXME loss of precision is a bug */
     err = qemu_strtosz(str, &endptr, &res);
     g_assert_cmpint(err, ==, 0);
     g_assert_cmpint(res, ==, 0x20000000000000); /* rounded to 53 bits */
@@ -1996,14 +2004,42 @@ static void test_qemu_strtosz_simple(void)
     g_assert_cmpint(res, ==, 0xfffffffffffff800);
     g_assert(endptr == str + 20);

-    str = "18446744073709550591"; /* 0xfffffffffffffbff */
+    str = "18446744073709550591"; /* 0xfffffffffffffbff FIXME */
     err = qemu_strtosz(str, &endptr, &res);
     g_assert_cmpint(err, ==, 0);
     g_assert_cmpint(res, ==, 0xfffffffffffff800); /* rounded to 53 bits */
     g_assert(endptr == str + 20);

-    /* 0x7ffffffffffffe00..0x7fffffffffffffff get rounded to
-     * 0x8000000000000000, thus -ERANGE; see test_qemu_strtosz_erange() */
+    /*
+     * FIXME 0xfffffffffffffe00..0xffffffffffffffff get rounded to
+     * 2^64, thus -ERANGE; see test_qemu_strtosz_erange()
+     */
+}
+
+static void test_qemu_strtosz_hex(void)
+{
+    const char *str;
+    const char *endptr;
+    int err;
+    uint64_t res = 0xbaadf00d;
+
+    str = "0x0";
+    err = qemu_strtosz(str, &endptr, &res);
+    g_assert_cmpint(err, ==, 0);
+    g_assert_cmpint(res, ==, 0);
+    g_assert(endptr == str + 3);
+
+    str = "0xab";
+    err = qemu_strtosz(str, &endptr, &res);
+    g_assert_cmpint(err, ==, 0);
+    g_assert_cmpint(res, ==, 171);
+    g_assert(endptr == str + 4);
+
+    str = "0xae";
+    err = qemu_strtosz(str, &endptr, &res);
+    g_assert_cmpint(err, ==, 0);
+    g_assert_cmpint(res, ==, 174);
+    g_assert(endptr == str + 4);
 }

 static void test_qemu_strtosz_units(void)
@@ -2064,14 +2100,36 @@ static void test_qemu_strtosz_units(void)

 static void test_qemu_strtosz_float(void)
 {
-    const char *str = "12.345M";
+    const char *str;
     int err;
     const char *endptr;
     uint64_t res = 0xbaadf00d;

+    str = "0.5E";
     err = qemu_strtosz(str, &endptr, &res);
     g_assert_cmpint(err, ==, 0);
-    g_assert_cmpint(res, ==, 12.345 * MiB);
+    g_assert_cmpint(res, ==, EiB / 2);
+    g_assert(endptr == str + 4);
+
+    /* For convenience, a fraction of 0 is tolerated even on bytes */
+    str = "1.0B";
+    err = qemu_strtosz(str, &endptr, &res);
+    g_assert_cmpint(err, ==, 0);
+    g_assert_cmpint(res, ==, 1);
+    g_assert(endptr == str + 4);
+
+    /* An empty fraction is tolerated */
+    str = "1.k";
+    err = qemu_strtosz(str, &endptr, &res);
+    g_assert_cmpint(err, ==, 0);
+    g_assert_cmpint(res, ==, 1024);
+    g_assert(endptr == str + 3);
+
+    /* For convenience, we permit values that are not byte-exact */
+    str = "12.345M";
+    err = qemu_strtosz(str, &endptr, &res);
+    g_assert_cmpint(err, ==, 0);
+    g_assert_cmpint(res, ==, (uint64_t) (12.345 * MiB));
     g_assert(endptr == str + 7);
 }

@@ -2106,6 +2164,47 @@ static void test_qemu_strtosz_invalid(void)
     err = qemu_strtosz(str, &endptr, &res);
     g_assert_cmpint(err, ==, -EINVAL);
     g_assert(endptr == str);
+
+    /* Fractional values require scale larger than bytes */
+    /* FIXME endptr shouldn't move on -EINVAL */
+    str = "1.1B";
+    err = qemu_strtosz(str, &endptr, &res);
+    g_assert_cmpint(err, ==, -EINVAL);
+    g_assert(endptr == str + 4);
+
+    /* FIXME endptr shouldn't move on -EINVAL */
+    str = "1.1";
+    err = qemu_strtosz(str, &endptr, &res);
+    g_assert_cmpint(err, ==, -EINVAL);
+    g_assert(endptr == str + 3);
+
+    /* FIXME we should reject floating point exponents */
+    str = "1.5e1k";
+    err = qemu_strtosz(str, &endptr, &res);
+    g_assert_cmpint(err, ==, 0);
+    g_assert_cmpint(res, ==, 15360);
+    g_assert(endptr == str + 6);
+
+    /* FIXME we should reject floating point exponents */
+    str = "1.5E+0k";
+    err = qemu_strtosz(str, &endptr, &res);
+    g_assert_cmpint(err, ==, 0);
+    g_assert_cmpint(res, ==, 1536);
+    g_assert(endptr == str + 7);
+
+    /* FIXME we should reject hex fractions */
+    str = "0x1.8k";
+    err = qemu_strtosz(str, &endptr, &res);
+    g_assert_cmpint(err, ==, 0);
+    g_assert_cmpint(res, ==, 1536);
+    g_assert(endptr == str + 6);
+
+    /* FIXME we reject all other attempts at negative, why not -0 */
+    str = "-0";
+    err = qemu_strtosz(str, &endptr, &res);
+    g_assert_cmpint(err, ==, 0);
+    g_assert_cmpint(res, ==, 0);
+    g_assert(endptr == str + 2);
 }

 static void test_qemu_strtosz_trailing(void)
@@ -2131,6 +2230,30 @@ static void test_qemu_strtosz_trailing(void)

     err = qemu_strtosz(str, NULL, &res);
     g_assert_cmpint(err, ==, -EINVAL);
+
+    str = "0x";
+    err = qemu_strtosz(str, &endptr, &res);
+    g_assert_cmpint(res, ==, 0);
+    g_assert(endptr == str + 1);
+
+    err = qemu_strtosz(str, NULL, &res);
+    g_assert_cmpint(err, ==, -EINVAL);
+
+    str = "0.NaN";
+    err = qemu_strtosz(str, &endptr, &res);
+    g_assert_cmpint(err, ==, 0);
+    g_assert(endptr == str + 2);
+
+    err = qemu_strtosz(str, NULL, &res);
+    g_assert_cmpint(err, ==, -EINVAL);
+
+    str = "123-45";
+    err = qemu_strtosz(str, &endptr, &res);
+    g_assert_cmpint(res, ==, 123);
+    g_assert(endptr == str + 3);
+
+    err = qemu_strtosz(str, NULL, &res);
+    g_assert_cmpint(err, ==, -EINVAL);
 }

 static void test_qemu_strtosz_erange(void)
@@ -2145,12 +2268,12 @@ static void test_qemu_strtosz_erange(void)
     g_assert_cmpint(err, ==, -ERANGE);
     g_assert(endptr == str + 2);

-    str = "18446744073709550592"; /* 0xfffffffffffffc00 */
+    str = "18446744073709550592"; /* 0xfffffffffffffc00 FIXME accept this */
     err = qemu_strtosz(str, &endptr, &res);
     g_assert_cmpint(err, ==, -ERANGE);
     g_assert(endptr == str + 20);

-    str = "18446744073709551615"; /* 2^64-1 */
+    str = "18446744073709551615"; /* 2^64-1 FIXME accept this */
     err = qemu_strtosz(str, &endptr, &res);
     g_assert_cmpint(err, ==, -ERANGE);
     g_assert(endptr == str + 20);
@@ -2168,15 +2291,22 @@ static void test_qemu_strtosz_erange(void)

 static void test_qemu_strtosz_metric(void)
 {
-    const char *str = "12345k";
+    const char *str;
     int err;
     const char *endptr;
     uint64_t res = 0xbaadf00d;

+    str = "12345k";
     err = qemu_strtosz_metric(str, &endptr, &res);
     g_assert_cmpint(err, ==, 0);
     g_assert_cmpint(res, ==, 12345000);
     g_assert(endptr == str + 6);
+
+    str = "12.345M";
+    err = qemu_strtosz_metric(str, &endptr, &res);
+    g_assert_cmpint(err, ==, 0);
+    g_assert_cmpint(res, ==, 12345000);
+    g_assert(endptr == str + 7);
 }

 int main(int argc, char **argv)
@@ -2443,6 +2573,8 @@ int main(int argc, char **argv)

     g_test_add_func("/cutils/strtosz/simple",
                     test_qemu_strtosz_simple);
+    g_test_add_func("/cutils/strtosz/hex",
+                    test_qemu_strtosz_hex);
     g_test_add_func("/cutils/strtosz/units",
                     test_qemu_strtosz_units);
     g_test_add_func("/cutils/strtosz/float",
-- 
2.30.1


