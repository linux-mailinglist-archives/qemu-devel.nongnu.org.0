Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F21D76FFEC9
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 04:13:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxIFT-0004mf-JB; Thu, 11 May 2023 22:11:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pxIFQ-0004lg-NW
 for qemu-devel@nongnu.org; Thu, 11 May 2023 22:11:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pxIF9-0000QM-IY
 for qemu-devel@nongnu.org; Thu, 11 May 2023 22:11:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683857450;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oiCquS9amYZgxXY2U4FZH6nOCpQ2gbUNDDQdkCWMbhg=;
 b=WjKcBtpO39OImG5v148Tfi3dlgtRJw/pJYkm9XwHpuAeN2UPu1ZuqIPAUOSNoFlF8lRWOC
 VLssQWJh+B2XjYs2CfxYgGZQ7mH2rEeW5QrORNYfpLhY8WIok9PRVD2VlEt42mNpJ4nuMS
 SJfv+aoLB2Yj9orLe/JcyjEJ2qGUhzQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-115-MKdhgxkXPyefEixcOdNjxw-1; Thu, 11 May 2023 22:10:47 -0400
X-MC-Unique: MKdhgxkXPyefEixcOdNjxw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EB3F285A588;
 Fri, 12 May 2023 02:10:46 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 87CA82026D16;
 Fri, 12 May 2023 02:10:46 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: hreitz@redhat.com,
	armbru@redhat.com,
	richard.henderson@linaro.org
Subject: [PATCH v2 14/19] test-cutils: Add more coverage to qemu_strtosz11;
 rgb:1e1e/1e1e/1e1e
Date: Thu, 11 May 2023 21:10:28 -0500
Message-Id: <20230512021033.1378730-15-eblake@redhat.com>
In-Reply-To: <20230512021033.1378730-1-eblake@redhat.com>
References: <20230512021033.1378730-1-eblake@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
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

Add some more strings that the user might send our way.  In
particular, some of these additions include FIXME comments showing
where our parser doesn't quite behave the way we want.

Signed-off-by: Eric Blake <eblake@redhat.com>

---

v2: even more tests added, pad a string to avoid out-of-bounds
randomness [Hanna]
---
 tests/unit/test-cutils.c | 147 +++++++++++++++++++++++++++++++++++----
 1 file changed, 135 insertions(+), 12 deletions(-)

diff --git a/tests/unit/test-cutils.c b/tests/unit/test-cutils.c
index 1936c7b5795..7800caf9b0e 100644
--- a/tests/unit/test-cutils.c
+++ b/tests/unit/test-cutils.c
@@ -3162,7 +3162,12 @@ static void do_strtosz_full(const char *str, qemu_strtosz_fn fn,
     ret = fn(str, &endptr, &val);
     g_assert_cmpint(ret, ==, exp_ptr_ret);
     g_assert_cmpuint(val, ==, exp_ptr_val);
-    g_assert_true(endptr == str + exp_ptr_offset);
+    if (str) {
+        g_assert_true(endptr == str + exp_ptr_offset);
+    } else {
+        g_assert_cmpint(exp_ptr_offset, ==, 0);
+        g_assert_null(endptr);
+    }

     val = 0xbaadf00d;
     ret = fn(str, NULL, &val);
@@ -3198,8 +3203,8 @@ static void test_qemu_strtosz_simple(void)
     /* Leading 0 gives decimal results, not octal */
     do_strtosz("08", 0, 8, 2);

-    /* Leading space is ignored */
-    do_strtosz(" 12345", 0, 12345, 6);
+    /* Leading space and + are ignored */
+    do_strtosz(" +12345", 0, 12345, 7);

     /* 2^53-1 */
     do_strtosz("9007199254740991", 0, 0x1fffffffffffffULL, 16);
@@ -3226,17 +3231,27 @@ static void test_qemu_strtosz_hex(void)

     do_strtosz("0xab", 0, 171, 4);

-    do_strtosz("0xae", 0, 174, 4);
+    do_strtosz(" +0xae", 0, 174, 6);
 }

 static void test_qemu_strtosz_units(void)
 {
-    /* default is M */
+    /* default scale depends on function */
+    do_strtosz("1", 0, 1, 1);
     do_strtosz_MiB("1", 0, MiB, 1);
+    do_strtosz_metric("1", 0, 1, 1);

+    /* Explicit byte suffix works for all functions */
     do_strtosz("1B", 0, 1, 2);
+    do_strtosz_MiB("1B", 0, 1, 2);
+    do_strtosz_metric("1B", 0, 1, 2);

+    /* Expose the scale */
     do_strtosz("1K", 0, KiB, 2);
+    do_strtosz_MiB("1K", 0, KiB, 2);
+    do_strtosz_metric("1K", 0, 1000, 2);
+
+    /* Other suffixes, see also test_qemu_strtosz_metric */
     do_strtosz("1M", 0, MiB, 2);
     do_strtosz("1G", 0, GiB, 2);
     do_strtosz("1T", 0, TiB, 2);
@@ -3248,14 +3263,37 @@ static void test_qemu_strtosz_float(void)
 {
     do_strtosz("0.5E", 0, EiB / 2, 4);

+    /* Implied M suffix okay */
+    do_strtosz_MiB("0.5", 0, MiB / 2, 3);
+
     /* For convenience, a fraction of 0 is tolerated even on bytes */
     do_strtosz("1.0B", 0, 1, 4);

-    /* An empty fraction is tolerated */
+    /* An empty fraction tail is tolerated */
     do_strtosz("1.k", 0, 1024, 3);

+    /* FIXME An empty fraction head should be tolerated */
+    do_strtosz(" .5k", -EINVAL /* FIXME 0 */, 0xbaadf00d /* FIXME 512 */,
+               0 /* FIXME 4 */);
+
     /* For convenience, we permit values that are not byte-exact */
     do_strtosz("12.345M", 0, (uint64_t) (12.345 * MiB + 0.5), 7);
+
+    /* FIXME Fraction tail should round correctly */
+    do_strtosz("1.9999k", 0, 2048, 7);
+    do_strtosz("1.9999999999999999999999999999999999999999999999999999k", 0,
+               1024 /* FIXME 2048 */, 55);
+
+    /* FIXME ERANGE underflow in the fraction tail should not matter for 'k' */
+    do_strtosz("1."
+               "00000000000000000000000000000000000000000000000000"
+               "00000000000000000000000000000000000000000000000000"
+               "00000000000000000000000000000000000000000000000000"
+               "00000000000000000000000000000000000000000000000000"
+               "00000000000000000000000000000000000000000000000000"
+               "00000000000000000000000000000000000000000000000000"
+               "00000000000000000000000000000000000000000000000000"
+               "1k", 0, 1 /* FIXME 1024 */, 354);
 }

 static void test_qemu_strtosz_invalid(void)
@@ -3265,57 +3303,142 @@ static void test_qemu_strtosz_invalid(void)
     /* Must parse at least one digit */
     do_strtosz("", -EINVAL, 0xbaadf00d, 0);
     do_strtosz(" \t ", -EINVAL, 0xbaadf00d, 0);
-    do_strtosz("crap", -EINVAL, 0xbaadf00d, 0);
+    do_strtosz(".", -EINVAL, 0xbaadf00d, 0);
+    do_strtosz(" .", -EINVAL, 0xbaadf00d, 0);
+    do_strtosz(" .k", -EINVAL, 0xbaadf00d, 0);
     do_strtosz("inf", -EINVAL, 0xbaadf00d, 0);
     do_strtosz("NaN", -EINVAL, 0xbaadf00d, 0);

+    /* Lone suffix is not okay */
+    do_strtosz("k", -EINVAL, 0xbaadf00d, 0);
+    do_strtosz(" M", -EINVAL, 0xbaadf00d, 0);
+
     /* Fractional values require scale larger than bytes */
     do_strtosz("1.1B", -EINVAL, 0xbaadf00d, 0);
     do_strtosz("1.1", -EINVAL, 0xbaadf00d, 0);

+    /* FIXME underflow in the fraction tail should matter for 'B' */
+    do_strtosz("1.00001B", -EINVAL, 0xbaadf00d, 0);
+    do_strtosz("1.00000000000000000001B", 0 /* FIXME -EINVAL */,
+               1 /* FIXME 0xbaadf00d */, 23 /* FIXME 0 */);
+    do_strtosz("1."
+               "00000000000000000000000000000000000000000000000000"
+               "00000000000000000000000000000000000000000000000000"
+               "00000000000000000000000000000000000000000000000000"
+               "00000000000000000000000000000000000000000000000000"
+               "00000000000000000000000000000000000000000000000000"
+               "00000000000000000000000000000000000000000000000000"
+               "00000000000000000000000000000000000000000000000000"
+               "1B", 0 /* FIXME -EINVAL */, 1 /* FIXME 0xbaadf00d */,
+               354 /* FIXME 0 */);
+
     /* No hex fractions */
     do_strtosz("0x1.8k", -EINVAL, 0xbaadf00d, 0);
+    do_strtosz("0x1.k", -EINVAL, 0xbaadf00d, 0);

-    /* No suffixes */
+    /* No hex suffixes */
     do_strtosz("0x18M", -EINVAL, 0xbaadf00d, 0);
+    do_strtosz("0x1p1", -EINVAL, 0xbaadf00d, 0);

-    /* No negative values */
-    do_strtosz("-0", -EINVAL, 0xbaadf00d, 0);
-    do_strtosz("-1", -EINVAL, 0xbaadf00d, 0);
+    /* decimal in place of scaling suffix */
+    do_strtosz("1.1.k", -EINVAL, 0xbaadf00d, 0);
+    do_strtosz("1.1.", -EINVAL, 0xbaadf00d, 0);
 }

 static void test_qemu_strtosz_trailing(void)
 {
+    /* Trailing whitespace */
+    do_strtosz_full("1k ", qemu_strtosz, 0, 1024, 2, -EINVAL, 0xbaadf00d);
+
+    /* Unknown suffix overrides even implied scale*/
+    do_strtosz_full("123xxx", qemu_strtosz, 0, 123, 3, -EINVAL, 0xbaadf00d);
+
+    /* Implied scale allows partial parse */
     do_strtosz_full("123xxx", qemu_strtosz_MiB, 0, 123 * MiB, 3,
                     -EINVAL, 0xbaadf00d);
+    do_strtosz_full("1.5.k", qemu_strtosz_MiB, 0, 1.5 * MiB, 3,
+                    -EINVAL, 0xbaadf00d);

+    /* Junk after one-byte suffix */
     do_strtosz_full("1kiB", qemu_strtosz, 0, 1024, 2, -EINVAL, 0xbaadf00d);
+
+    /* Incomplete hex is an unknown suffix */
     do_strtosz_full("0x", qemu_strtosz, 0, 0, 1, -EINVAL, 0xbaadf00d);
+
+    /* Hex literals use only one leading zero */
+    do_strtosz_full("00x1", qemu_strtosz, 0, 0, 2, -EINVAL, 0xbaadf00d);
+
+    /* No support for binary literals; 'b' is valid suffix */
+    do_strtosz_full("0b1000", qemu_strtosz, 0, 0, 2, -EINVAL, 0xbaadf00d);
+
+    /* Junk after decimal */
     do_strtosz_full("0.NaN", qemu_strtosz, 0, 0, 2, -EINVAL, 0xbaadf00d);
+
+    /* Although negatives are invalid, '-' may be in trailing junk */
     do_strtosz_full("123-45", qemu_strtosz, 0, 123, 3, -EINVAL, 0xbaadf00d);
+    do_strtosz_full(" 123 - 45", qemu_strtosz, 0, 123, 4, -EINVAL, 0xbaadf00d);

     /* FIXME should stop parse after 'e'. No floating point exponents */
     do_strtosz_full("1.5e1k", qemu_strtosz, -EINVAL /* FIXME 0 */,
                     0xbaadf00d /* FIXME EiB * 1.5 */, 0 /* FIXME 4 */,
                     -EINVAL, 0xbaadf00d);
-
     do_strtosz_full("1.5E+0k", qemu_strtosz, -EINVAL /* FIXME 0 */,
                     0xbaadf00d /* FIXME EiB * 1.5 */, 0 /* FIXME 4 */,
                     -EINVAL, 0xbaadf00d);
+
+    /*
+     * FIXME overflow in fraction is so buggy it can read beyond bounds
+     * if we don't stuff extra \0 in our literal
+     */
+    do_strtosz_full("1.5E999\0\0" /* FIXME 1.5E999" */, qemu_strtosz,
+                    0, 1 /* FIXME EiB * 1.5 */, 8 /* FIXME 4 */,
+                    0 /* FIXME -EINVAL */, 1 /* FIXME 0xbaadf00d */);
 }

 static void test_qemu_strtosz_erange(void)
 {
+    /* FIXME negative values fit better as ERANGE */
+    do_strtosz(" -0", -EINVAL /* FIXME -ERANGE */, 0xbaadf00d, 0 /* FIXME 3 */);
+    do_strtosz("-1", -EINVAL /* FIXME -ERANGE */, 0xbaadf00d, 0 /* FIXME 2 */);
+    do_strtosz_full("-2M", qemu_strtosz, -EINVAL /* FIXME -ERANGE */,
+                    0xbaadf00d, 0 /* FIXME 2 */, -EINVAL, 0xbaadf00d);
+    do_strtosz(" -.0", -EINVAL /* FIXME -ERANGE */, 0xbaadf00d,
+               0 /* FIXME 4 */);
+    do_strtosz_full("-.1k", qemu_strtosz, -EINVAL /* FIXME -ERANGE */,
+                    0xbaadf00d, 0 /* FIXME 3 */, -EINVAL, 0xbaadf00d);
+    do_strtosz_full(" -."
+                    "00000000000000000000000000000000000000000000000000"
+                    "00000000000000000000000000000000000000000000000000"
+                    "00000000000000000000000000000000000000000000000000"
+                    "00000000000000000000000000000000000000000000000000"
+                    "00000000000000000000000000000000000000000000000000"
+                    "00000000000000000000000000000000000000000000000000"
+                    "00000000000000000000000000000000000000000000000000"
+                    "1M", qemu_strtosz, -EINVAL /* FIXME -ERANGE */,
+                    0xbaadf00d, 0 /* FIXME 354 */, -EINVAL, 0xbaadf00d);
+
     /* 2^64; see strtosz_simple for 2^64-1 */
     do_strtosz("18446744073709551616", -ERANGE, 0xbaadf00d, 20);

     do_strtosz("20E", -ERANGE, 0xbaadf00d, 3);
+
+    /* FIXME Fraction tail can cause ERANGE overflow */
+    do_strtosz("15.9999999999999999999999999999999999999999999999999999E",
+               0 /* FIXME -ERANGE */, 15ULL * EiB /* FIXME 0xbaadf00d */, 56);
+
+    /* EINVAL has priority over ERANGE */
+    do_strtosz_full("100000Pjunk", qemu_strtosz, -ERANGE, 0xbaadf00d, 7,
+                    -EINVAL, 0xbaadf00d);
 }

 static void test_qemu_strtosz_metric(void)
 {
     do_strtosz_metric("12345k", 0, 12345000, 6);
     do_strtosz_metric("12.345M", 0, 12345000, 7);
+
+    /* Fraction is affected by floating-point rounding */
+    /* This would be 0xfffffffffffffbff with infinite precision */
+    do_strtosz_metric("18.446744073709550591E", 0, 0xfffffffffffffc0cULL, 22);
 }

 static void test_freq_to_str(void)
-- 
2.40.1


