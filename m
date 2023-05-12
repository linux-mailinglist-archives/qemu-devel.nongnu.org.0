Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 936AE6FFEC6
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 04:12:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxIFW-0004nz-VD; Thu, 11 May 2023 22:11:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pxIFS-0004mk-Kv
 for qemu-devel@nongnu.org; Thu, 11 May 2023 22:11:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pxIFB-0000QR-Um
 for qemu-devel@nongnu.org; Thu, 11 May 2023 22:11:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683857451;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eGg02HC5+uCjofumDX4xiUm9ng7yU78GRRc6NhZQPoo=;
 b=ToMjWWg4/Yf3z/ycuQlnKntMWa5V+1KtuCFx2MyPEeE32eGOVS0C17seVWqPvknMkUXC4I
 INCi/oDmyE3DKDIrG6n50K7UG8ct7RxtfsMBM4hH/rgNBZwAKnRwgMEfLj8XSII2kj/awQ
 XePcusDN0hE5YAK3NP8/Z797uz2An9I=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-54-0RDAIRkqP1C2HxFlir5z6g-1; Thu, 11 May 2023 22:10:47 -0400
X-MC-Unique: 0RDAIRkqP1C2HxFlir5z6g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 85050185A790;
 Fri, 12 May 2023 02:10:47 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 229182026D16;
 Fri, 12 May 2023 02:10:47 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: hreitz@redhat.com,
	armbru@redhat.com,
	richard.henderson@linaro.org
Subject: [PATCH v2 15/19] cutils: Set value in all qemu_strtosz* error paths
Date: Thu, 11 May 2023 21:10:29 -0500
Message-Id: <20230512021033.1378730-16-eblake@redhat.com>
In-Reply-To: <20230512021033.1378730-1-eblake@redhat.com>
References: <20230512021033.1378730-1-eblake@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
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

v2: cutils.c unchanged, but rebasing test suite is significant enough
that I doropped Hanna's R-b
---
 tests/unit/test-cutils.c | 106 +++++++++++++++++++--------------------
 util/cutils.c            |  17 +++++--
 2 files changed, 63 insertions(+), 60 deletions(-)

diff --git a/tests/unit/test-cutils.c b/tests/unit/test-cutils.c
index 7800caf9b0e..4a1baf05ca6 100644
--- a/tests/unit/test-cutils.c
+++ b/tests/unit/test-cutils.c
@@ -3273,7 +3273,7 @@ static void test_qemu_strtosz_float(void)
     do_strtosz("1.k", 0, 1024, 3);

     /* FIXME An empty fraction head should be tolerated */
-    do_strtosz(" .5k", -EINVAL /* FIXME 0 */, 0xbaadf00d /* FIXME 512 */,
+    do_strtosz(" .5k", -EINVAL /* FIXME 0 */, 0 /* FIXME 512 */,
                0 /* FIXME 4 */);

     /* For convenience, we permit values that are not byte-exact */
@@ -3298,29 +3298,29 @@ static void test_qemu_strtosz_float(void)

 static void test_qemu_strtosz_invalid(void)
 {
-    do_strtosz(NULL, -EINVAL, 0xbaadf00d, 0);
+    do_strtosz(NULL, -EINVAL, 0, 0);

     /* Must parse at least one digit */
-    do_strtosz("", -EINVAL, 0xbaadf00d, 0);
-    do_strtosz(" \t ", -EINVAL, 0xbaadf00d, 0);
-    do_strtosz(".", -EINVAL, 0xbaadf00d, 0);
-    do_strtosz(" .", -EINVAL, 0xbaadf00d, 0);
-    do_strtosz(" .k", -EINVAL, 0xbaadf00d, 0);
-    do_strtosz("inf", -EINVAL, 0xbaadf00d, 0);
-    do_strtosz("NaN", -EINVAL, 0xbaadf00d, 0);
+    do_strtosz("", -EINVAL, 0, 0);
+    do_strtosz(" \t ", -EINVAL, 0, 0);
+    do_strtosz(".", -EINVAL, 0, 0);
+    do_strtosz(" .", -EINVAL, 0, 0);
+    do_strtosz(" .k", -EINVAL, 0, 0);
+    do_strtosz("inf", -EINVAL, 0, 0);
+    do_strtosz("NaN", -EINVAL, 0, 0);

     /* Lone suffix is not okay */
-    do_strtosz("k", -EINVAL, 0xbaadf00d, 0);
-    do_strtosz(" M", -EINVAL, 0xbaadf00d, 0);
+    do_strtosz("k", -EINVAL, 0, 0);
+    do_strtosz(" M", -EINVAL, 0, 0);

     /* Fractional values require scale larger than bytes */
-    do_strtosz("1.1B", -EINVAL, 0xbaadf00d, 0);
-    do_strtosz("1.1", -EINVAL, 0xbaadf00d, 0);
+    do_strtosz("1.1B", -EINVAL, 0, 0);
+    do_strtosz("1.1", -EINVAL, 0, 0);

     /* FIXME underflow in the fraction tail should matter for 'B' */
-    do_strtosz("1.00001B", -EINVAL, 0xbaadf00d, 0);
+    do_strtosz("1.00001B", -EINVAL, 0, 0);
     do_strtosz("1.00000000000000000001B", 0 /* FIXME -EINVAL */,
-               1 /* FIXME 0xbaadf00d */, 23 /* FIXME 0 */);
+               1 /* FIXME 0 */, 23 /* FIXME 0 */);
     do_strtosz("1."
                "00000000000000000000000000000000000000000000000000"
                "00000000000000000000000000000000000000000000000000"
@@ -3329,62 +3329,60 @@ static void test_qemu_strtosz_invalid(void)
                "00000000000000000000000000000000000000000000000000"
                "00000000000000000000000000000000000000000000000000"
                "00000000000000000000000000000000000000000000000000"
-               "1B", 0 /* FIXME -EINVAL */, 1 /* FIXME 0xbaadf00d */,
+               "1B", 0 /* FIXME -EINVAL */, 1 /* FIXME 0 */,
                354 /* FIXME 0 */);

     /* No hex fractions */
-    do_strtosz("0x1.8k", -EINVAL, 0xbaadf00d, 0);
-    do_strtosz("0x1.k", -EINVAL, 0xbaadf00d, 0);
+    do_strtosz("0x1.8k", -EINVAL, 0, 0);
+    do_strtosz("0x1.k", -EINVAL, 0, 0);

     /* No hex suffixes */
-    do_strtosz("0x18M", -EINVAL, 0xbaadf00d, 0);
-    do_strtosz("0x1p1", -EINVAL, 0xbaadf00d, 0);
+    do_strtosz("0x18M", -EINVAL, 0, 0);
+    do_strtosz("0x1p1", -EINVAL, 0, 0);

     /* decimal in place of scaling suffix */
-    do_strtosz("1.1.k", -EINVAL, 0xbaadf00d, 0);
-    do_strtosz("1.1.", -EINVAL, 0xbaadf00d, 0);
+    do_strtosz("1.1.k", -EINVAL, 0, 0);
+    do_strtosz("1.1.", -EINVAL, 0, 0);
 }

 static void test_qemu_strtosz_trailing(void)
 {
     /* Trailing whitespace */
-    do_strtosz_full("1k ", qemu_strtosz, 0, 1024, 2, -EINVAL, 0xbaadf00d);
+    do_strtosz_full("1k ", qemu_strtosz, 0, 1024, 2, -EINVAL, 0);

     /* Unknown suffix overrides even implied scale*/
-    do_strtosz_full("123xxx", qemu_strtosz, 0, 123, 3, -EINVAL, 0xbaadf00d);
+    do_strtosz_full("123xxx", qemu_strtosz, 0, 123, 3, -EINVAL, 0);

     /* Implied scale allows partial parse */
-    do_strtosz_full("123xxx", qemu_strtosz_MiB, 0, 123 * MiB, 3,
-                    -EINVAL, 0xbaadf00d);
-    do_strtosz_full("1.5.k", qemu_strtosz_MiB, 0, 1.5 * MiB, 3,
-                    -EINVAL, 0xbaadf00d);
+    do_strtosz_full("123xxx", qemu_strtosz_MiB, 0, 123 * MiB, 3, -EINVAL, 0);
+    do_strtosz_full("1.5.k", qemu_strtosz_MiB, 0, 1.5 * MiB, 3, -EINVAL, 0);

     /* Junk after one-byte suffix */
-    do_strtosz_full("1kiB", qemu_strtosz, 0, 1024, 2, -EINVAL, 0xbaadf00d);
+    do_strtosz_full("1kiB", qemu_strtosz, 0, 1024, 2, -EINVAL, 0);

     /* Incomplete hex is an unknown suffix */
-    do_strtosz_full("0x", qemu_strtosz, 0, 0, 1, -EINVAL, 0xbaadf00d);
+    do_strtosz_full("0x", qemu_strtosz, 0, 0, 1, -EINVAL, 0);

     /* Hex literals use only one leading zero */
-    do_strtosz_full("00x1", qemu_strtosz, 0, 0, 2, -EINVAL, 0xbaadf00d);
+    do_strtosz_full("00x1", qemu_strtosz, 0, 0, 2, -EINVAL, 0);

     /* No support for binary literals; 'b' is valid suffix */
-    do_strtosz_full("0b1000", qemu_strtosz, 0, 0, 2, -EINVAL, 0xbaadf00d);
+    do_strtosz_full("0b1000", qemu_strtosz, 0, 0, 2, -EINVAL, 0);

     /* Junk after decimal */
-    do_strtosz_full("0.NaN", qemu_strtosz, 0, 0, 2, -EINVAL, 0xbaadf00d);
+    do_strtosz_full("0.NaN", qemu_strtosz, 0, 0, 2, -EINVAL, 0);

     /* Although negatives are invalid, '-' may be in trailing junk */
-    do_strtosz_full("123-45", qemu_strtosz, 0, 123, 3, -EINVAL, 0xbaadf00d);
-    do_strtosz_full(" 123 - 45", qemu_strtosz, 0, 123, 4, -EINVAL, 0xbaadf00d);
+    do_strtosz_full("123-45", qemu_strtosz, 0, 123, 3, -EINVAL, 0);
+    do_strtosz_full(" 123 - 45", qemu_strtosz, 0, 123, 4, -EINVAL, 0);

     /* FIXME should stop parse after 'e'. No floating point exponents */
     do_strtosz_full("1.5e1k", qemu_strtosz, -EINVAL /* FIXME 0 */,
-                    0xbaadf00d /* FIXME EiB * 1.5 */, 0 /* FIXME 4 */,
-                    -EINVAL, 0xbaadf00d);
+                    0 /* FIXME EiB * 1.5 */, 0 /* FIXME 4 */,
+                    -EINVAL, 0);
     do_strtosz_full("1.5E+0k", qemu_strtosz, -EINVAL /* FIXME 0 */,
-                    0xbaadf00d /* FIXME EiB * 1.5 */, 0 /* FIXME 4 */,
-                    -EINVAL, 0xbaadf00d);
+                    0 /* FIXME EiB * 1.5 */, 0 /* FIXME 4 */,
+                    -EINVAL, 0);

     /*
      * FIXME overflow in fraction is so buggy it can read beyond bounds
@@ -3392,20 +3390,19 @@ static void test_qemu_strtosz_trailing(void)
      */
     do_strtosz_full("1.5E999\0\0" /* FIXME 1.5E999" */, qemu_strtosz,
                     0, 1 /* FIXME EiB * 1.5 */, 8 /* FIXME 4 */,
-                    0 /* FIXME -EINVAL */, 1 /* FIXME 0xbaadf00d */);
+                    0 /* FIXME -EINVAL */, 1 /* FIXME 0 */);
 }

 static void test_qemu_strtosz_erange(void)
 {
     /* FIXME negative values fit better as ERANGE */
-    do_strtosz(" -0", -EINVAL /* FIXME -ERANGE */, 0xbaadf00d, 0 /* FIXME 3 */);
-    do_strtosz("-1", -EINVAL /* FIXME -ERANGE */, 0xbaadf00d, 0 /* FIXME 2 */);
-    do_strtosz_full("-2M", qemu_strtosz, -EINVAL /* FIXME -ERANGE */,
-                    0xbaadf00d, 0 /* FIXME 2 */, -EINVAL, 0xbaadf00d);
-    do_strtosz(" -.0", -EINVAL /* FIXME -ERANGE */, 0xbaadf00d,
-               0 /* FIXME 4 */);
-    do_strtosz_full("-.1k", qemu_strtosz, -EINVAL /* FIXME -ERANGE */,
-                    0xbaadf00d, 0 /* FIXME 3 */, -EINVAL, 0xbaadf00d);
+    do_strtosz(" -0", -EINVAL /* FIXME -ERANGE */, 0, 0 /* FIXME 3 */);
+    do_strtosz("-1", -EINVAL /* FIXME -ERANGE */, 0, 0 /* FIXME 2 */);
+    do_strtosz_full("-2M", qemu_strtosz, -EINVAL /* FIXME -ERANGE */, 0,
+                    0 /* FIXME 2 */, -EINVAL, 0);
+    do_strtosz(" -.0", -EINVAL /* FIXME -ERANGE */, 0, 0 /* FIXME 4 */);
+    do_strtosz_full("-.1k", qemu_strtosz, -EINVAL /* FIXME -ERANGE */, 0,
+                    0 /* FIXME 3 */, -EINVAL, 0);
     do_strtosz_full(" -."
                     "00000000000000000000000000000000000000000000000000"
                     "00000000000000000000000000000000000000000000000000"
@@ -3414,21 +3411,20 @@ static void test_qemu_strtosz_erange(void)
                     "00000000000000000000000000000000000000000000000000"
                     "00000000000000000000000000000000000000000000000000"
                     "00000000000000000000000000000000000000000000000000"
-                    "1M", qemu_strtosz, -EINVAL /* FIXME -ERANGE */,
-                    0xbaadf00d, 0 /* FIXME 354 */, -EINVAL, 0xbaadf00d);
+                    "1M", qemu_strtosz, -EINVAL /* FIXME -ERANGE */, 0,
+                    0 /* FIXME 354 */, -EINVAL, 0);

     /* 2^64; see strtosz_simple for 2^64-1 */
-    do_strtosz("18446744073709551616", -ERANGE, 0xbaadf00d, 20);
+    do_strtosz("18446744073709551616", -ERANGE, 0, 20);

-    do_strtosz("20E", -ERANGE, 0xbaadf00d, 3);
+    do_strtosz("20E", -ERANGE, 0, 3);

     /* FIXME Fraction tail can cause ERANGE overflow */
     do_strtosz("15.9999999999999999999999999999999999999999999999999999E",
-               0 /* FIXME -ERANGE */, 15ULL * EiB /* FIXME 0xbaadf00d */, 56);
+               0 /* FIXME -ERANGE */, 15ULL * EiB /* FIXME 0 */, 56);

     /* EINVAL has priority over ERANGE */
-    do_strtosz_full("100000Pjunk", qemu_strtosz, -ERANGE, 0xbaadf00d, 7,
-                    -EINVAL, 0xbaadf00d);
+    do_strtosz_full("100000Pjunk", qemu_strtosz, -ERANGE, 0, 7, -EINVAL, 0);
 }

 static void test_qemu_strtosz_metric(void)
diff --git a/util/cutils.c b/util/cutils.c
index 91c90673aba..24955d3ca94 100644
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


