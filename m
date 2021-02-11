Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00DFA3194C2
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 21:55:29 +0100 (CET)
Received: from localhost ([::1]:33948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAIzo-0006ew-3E
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 15:55:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lAIpg-0005wD-Hp
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 15:45:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60120)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lAIpZ-0007Rk-7a
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 15:45:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613076292;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9t4IkoAmXiHcfKk4F3GTc5helKS3pdW0WkOh9WuI2hA=;
 b=Nvl2XRfUeSD12IyV7TQ5DZ8NTlxGfG42M8hm0d0g9xreamPVLbBHqBVw1ZiFkK/5dwDHoJ
 7PcOY3YJV5CA7eaY69NXrOhHNUKV70Y+pyGQHZ9HGo6TSrS+LyZqEZgqR+WdlYyLmxCdZ4
 aqRZCw5Ltd/dVWcBu+Xct7x5V+OBKZ4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-281-4ZKmVndYN3CuOnGPlUL_Zw-1; Thu, 11 Feb 2021 15:44:48 -0500
X-MC-Unique: 4ZKmVndYN3CuOnGPlUL_Zw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A77CF5210;
 Thu, 11 Feb 2021 20:44:47 +0000 (UTC)
Received: from blue.redhat.com (ovpn-114-150.phx2.redhat.com [10.3.114.150])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 097DD10013D7;
 Thu, 11 Feb 2021 20:44:46 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/4] utils: Deprecate inexact fractional suffix sizes
Date: Thu, 11 Feb 2021 14:44:38 -0600
Message-Id: <20210211204438.1184395-5-eblake@redhat.com>
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 "reviewer:Incompatible changes" <libvir-list@redhat.com>, tao3.xu@intel.com,
 rjones@redhat.com, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The value '1.1k' is inexact; 1126.4 bytes is not possible, so we
happen to truncate it to 1126.  Our use of fractional sizes is
intended for convenience, but when a user specifies a fraction that is
not a clean translation to binary, truncating/rounding behind their
backs can cause confusion.  Better is to deprecate inexact values,
which still leaves '1.5k' as valid, but alerts the user to spell out
their values as a precise byte number in cases where they are
currently being rounded.

Note that values like '0.1G' in the testsuite need adjustment as a
result.

Since qemu_strtosz() does not have an Err** parameter, and plumbing
that in would be a much larger task, we instead go with just directly
emitting the deprecation warning to stderr.

Signed-off-by: Eric Blake <eblake@redhat.com>

---

I'm not a fan of this patch, but am proposing it for discussion purposes.
---
 docs/system/deprecated.rst | 9 +++++++++
 tests/test-cutils.c        | 6 +++---
 tests/test-keyval.c        | 4 ++--
 tests/test-qemu-opts.c     | 4 ++--
 util/cutils.c              | 9 +++++++--
 5 files changed, 23 insertions(+), 9 deletions(-)

diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
index 113c2e933f1b..2c9cb849eec5 100644
--- a/docs/system/deprecated.rst
+++ b/docs/system/deprecated.rst
@@ -154,6 +154,15 @@ Input parameters that take a size value should only use a size suffix
 the value is hexadecimal.  That is, '0x20M' is deprecated, and should
 be written either as '32M' or as '0x2000000'.

+inexact sizes via scaled fractions (since 6.0)
+''''''''''''''''''''''''''''''''''''''''''''''
+
+Input parameters that take a size value should only use a fractional
+size (such as '1.5M') that will result in an exact byte value.  The
+use of inexact values (such as '1.1M') that require truncation or
+rounding is deprecated, and you should instead consider writing your
+unusual size in bytes (here, '1153433' or '1153434' as desired).
+
 QEMU Machine Protocol (QMP) commands
 ------------------------------------

diff --git a/tests/test-cutils.c b/tests/test-cutils.c
index bad3a6099389..c6c33866277b 100644
--- a/tests/test-cutils.c
+++ b/tests/test-cutils.c
@@ -2124,11 +2124,11 @@ static void test_qemu_strtosz_float(void)
     g_assert_cmpint(res, ==, 1024);
     g_assert(endptr == str + 3);

-    /* For convenience, we permit values that are not byte-exact */
-    str = "12.345M";
+    /* Fractional values should still be byte-exact */
+    str = "12.125M";
     err = qemu_strtosz(str, &endptr, &res);
     g_assert_cmpint(err, ==, 0);
-    g_assert_cmpint(res, ==, (uint64_t) (12.345 * MiB));
+    g_assert_cmpint(res, ==, (uint64_t) (12.125 * MiB));
     g_assert(endptr == str + 7);
 }

diff --git a/tests/test-keyval.c b/tests/test-keyval.c
index e20c07cf3ea5..7a45c22942e6 100644
--- a/tests/test-keyval.c
+++ b/tests/test-keyval.c
@@ -525,7 +525,7 @@ static void test_keyval_visit_size(void)
     visit_free(v);

     /* Suffixes */
-    qdict = keyval_parse("sz1=8b,sz2=1.5k,sz3=2M,sz4=0.1G,sz5=16777215T",
+    qdict = keyval_parse("sz1=8b,sz2=1.5k,sz3=2M,sz4=0.125G,sz5=16777215T",
                          NULL, NULL, &error_abort);
     v = qobject_input_visitor_new_keyval(QOBJECT(qdict));
     qobject_unref(qdict);
@@ -537,7 +537,7 @@ static void test_keyval_visit_size(void)
     visit_type_size(v, "sz3", &sz, &error_abort);
     g_assert_cmphex(sz, ==, 2 * MiB);
     visit_type_size(v, "sz4", &sz, &error_abort);
-    g_assert_cmphex(sz, ==, GiB / 10);
+    g_assert_cmphex(sz, ==, GiB / 8);
     visit_type_size(v, "sz5", &sz, &error_abort);
     g_assert_cmphex(sz, ==, 16777215ULL * TiB);
     visit_check_struct(v, &error_abort);
diff --git a/tests/test-qemu-opts.c b/tests/test-qemu-opts.c
index 6568e31a7229..549e994938fe 100644
--- a/tests/test-qemu-opts.c
+++ b/tests/test-qemu-opts.c
@@ -720,10 +720,10 @@ static void test_opts_parse_size(void)
     g_assert_cmphex(qemu_opt_get_size(opts, "size1", 0), ==, 8);
     g_assert_cmphex(qemu_opt_get_size(opts, "size2", 0), ==, 1536);
     g_assert_cmphex(qemu_opt_get_size(opts, "size3", 0), ==, 2 * MiB);
-    opts = qemu_opts_parse(&opts_list_02, "size1=0.1G,size2=16777215T",
+    opts = qemu_opts_parse(&opts_list_02, "size1=0.125G,size2=16777215T",
                            false, &error_abort);
     g_assert_cmpuint(opts_count(opts), ==, 2);
-    g_assert_cmphex(qemu_opt_get_size(opts, "size1", 0), ==, GiB / 10);
+    g_assert_cmphex(qemu_opt_get_size(opts, "size1", 0), ==, GiB / 8);
     g_assert_cmphex(qemu_opt_get_size(opts, "size2", 0), ==, 16777215ULL * TiB);

     /* Beyond limit with suffix */
diff --git a/util/cutils.c b/util/cutils.c
index 6a8a175e0d71..1154b9de131a 100644
--- a/util/cutils.c
+++ b/util/cutils.c
@@ -246,12 +246,13 @@ static int64_t suffix_mul(char suffix, int64_t unit)
  * The size parsing supports the following syntaxes
  * - 12345 - decimal, scale determined by @default_suffix and @unit
  * - 12345{bBkKmMgGtTpPeE} - decimal, scale determined by suffix and @unit
- * - 12345.678{kKmMgGtTpPeE} - decimal, scale determined by suffix, and
- *   fractional portion is truncated to byte
+ * - 12345.678{kKmMgGtTpPeE} - decimal, scale determined by suffix, if
+ *   fractional portion is exact
  * - 0x7fEE - hexadecimal, unit determined by @default_suffix
  *
  * The following cause a deprecation warning, and may be removed in the future
  * - 0xabc{kKmMgGtTpP} - hex with scaling suffix
+ * - 12345.678{kKmMgGtTpPeE} - decimal with inexact fraction that caused truncation
  *
  * The following are intentionally not supported
  * - octal, such as 08
@@ -342,6 +343,10 @@ static int do_strtosz(const char *nptr, const char **end,
         retval = -ERANGE;
         goto out;
     }
+    if (mul_required && fraction * mul != (uint64_t) (fraction * mul)) {
+        warn_report("Using a fractional size that is not an exact byte "
+                    "multiple is deprecated: %s", nptr);
+    }
     *result = val * mul + (uint64_t) (fraction * mul);
     retval = 0;

-- 
2.30.1


