Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7C56FB7ED
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 22:06:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pw75l-0006Gq-MA; Mon, 08 May 2023 16:04:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pw75O-0006EY-TI
 for qemu-devel@nongnu.org; Mon, 08 May 2023 16:03:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pw75M-0007Jp-Rs
 for qemu-devel@nongnu.org; Mon, 08 May 2023 16:03:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683576231;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5LJfuVrf9CfB89/AOAQief0WsZJTAoI/ADeZuAtvlmM=;
 b=cUF9vut7CzaorBZpl+eCfM/tmi75dc1Cw1V8Rd14LHKPuSbJeduBP5nZ+vHF5WkwBYLQ//
 bRogUIxpGs1A+eySK3s9YCU9tEcTU+XMSrb2K66c62ZxyWw708+n0jwbO1dx2Nc4F/0vyA
 H72ViFVf0ZBKhKv9r8Q7QLoGjHSktsA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-612-7gF5eys6OaWxbd3h8xu3fQ-1; Mon, 08 May 2023 16:03:50 -0400
X-MC-Unique: 7gF5eys6OaWxbd3h8xu3fQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 27F673C0ED41
 for <qemu-devel@nongnu.org>; Mon,  8 May 2023 20:03:50 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D8F8D1121314;
 Mon,  8 May 2023 20:03:49 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: hreitz@redhat.com
Subject: [PATCH 09/11] cutils: Set value in all integral qemu_strto* error
 paths
Date: Mon,  8 May 2023 15:03:41 -0500
Message-Id: <20230508200343.791450-10-eblake@redhat.com>
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

Our goal in writing qemu_strtoi() and friends is to have an interface
harder to abuse than libc's strtol().  Leaving the return value
initialized on some error paths does not lend itself well to this
goal; and our documentation wasn't helpful on the matter.

Note that the previous patch changed all qemu_strtosz() EINVAL error
paths to slam value to 0 rather than stay uninitialized, even when the
EINVAL eror occurs because of trailing junk.  But for the remaining
integral qemu_strto*, it's easier to return the parsed value than to
force things back to zero, in part because of how check_strtox_error
works; and doing so creates less churn in the testsuite.

Here, the list of affected callers is much longer ('git grep
"qemu_strto[ui]" *.c **/*.c | grep -v tests/ |wc -l' outputs 87,
although a few of those are the implementation in in cutils.c), so
touching as little as possible is the wisest course of action.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 tests/unit/test-cutils.c | 24 +++++++++++------------
 util/cutils.c            | 42 +++++++++++++++++++++++++---------------
 2 files changed, 38 insertions(+), 28 deletions(-)

diff --git a/tests/unit/test-cutils.c b/tests/unit/test-cutils.c
index 9cf00a810e4..2cb33e41ae4 100644
--- a/tests/unit/test-cutils.c
+++ b/tests/unit/test-cutils.c
@@ -250,7 +250,7 @@ static void test_qemu_strtoi_null(void)
     err = qemu_strtoi(NULL, &endptr, 0, &res);

     g_assert_cmpint(err, ==, -EINVAL);
-    g_assert_cmpint(res, ==, 999);
+    g_assert_cmpint(res, ==, 0);
     g_assert_null(endptr);
 }

@@ -479,7 +479,7 @@ static void test_qemu_strtoi_full_null(void)
     err = qemu_strtoi(NULL, &endptr, 0, &res);

     g_assert_cmpint(err, ==, -EINVAL);
-    g_assert_cmpint(res, ==, 999);
+    g_assert_cmpint(res, ==, 0);
     g_assert_null(endptr);
 }

@@ -557,7 +557,7 @@ static void test_qemu_strtoui_null(void)
     err = qemu_strtoui(NULL, &endptr, 0, &res);

     g_assert_cmpint(err, ==, -EINVAL);
-    g_assert_cmpuint(res, ==, 999);
+    g_assert_cmpuint(res, ==, 0);
     g_assert_null(endptr);
 }

@@ -784,7 +784,7 @@ static void test_qemu_strtoui_full_null(void)
     err = qemu_strtoui(NULL, NULL, 0, &res);

     g_assert_cmpint(err, ==, -EINVAL);
-    g_assert_cmpuint(res, ==, 999);
+    g_assert_cmpuint(res, ==, 0);
 }

 static void test_qemu_strtoui_full_empty(void)
@@ -860,7 +860,7 @@ static void test_qemu_strtol_null(void)
     err = qemu_strtol(NULL, &endptr, 0, &res);

     g_assert_cmpint(err, ==, -EINVAL);
-    g_assert_cmpint(res, ==, 999);
+    g_assert_cmpint(res, ==, 0);
     g_assert_null(endptr);
 }

@@ -1087,7 +1087,7 @@ static void test_qemu_strtol_full_null(void)
     err = qemu_strtol(NULL, &endptr, 0, &res);

     g_assert_cmpint(err, ==, -EINVAL);
-    g_assert_cmpint(res, ==, 999);
+    g_assert_cmpint(res, ==, 0);
     g_assert_null(endptr);
 }

@@ -1165,7 +1165,7 @@ static void test_qemu_strtoul_null(void)
     err = qemu_strtoul(NULL, &endptr, 0, &res);

     g_assert_cmpint(err, ==, -EINVAL);
-    g_assert_cmpuint(res, ==, 999);
+    g_assert_cmpuint(res, ==, 0);
     g_assert_null(endptr);
 }

@@ -1390,7 +1390,7 @@ static void test_qemu_strtoul_full_null(void)
     err = qemu_strtoul(NULL, NULL, 0, &res);

     g_assert_cmpint(err, ==, -EINVAL);
-    g_assert_cmpuint(res, ==, 999);
+    g_assert_cmpuint(res, ==, 0);
 }

 static void test_qemu_strtoul_full_empty(void)
@@ -1466,7 +1466,7 @@ static void test_qemu_strtoi64_null(void)
     err = qemu_strtoi64(NULL, &endptr, 0, &res);

     g_assert_cmpint(err, ==, -EINVAL);
-    g_assert_cmpint(res, ==, 999);
+    g_assert_cmpint(res, ==, 0);
     g_assert_null(endptr);
 }

@@ -1691,7 +1691,7 @@ static void test_qemu_strtoi64_full_null(void)
     err = qemu_strtoi64(NULL, NULL, 0, &res);

     g_assert_cmpint(err, ==, -EINVAL);
-    g_assert_cmpint(res, ==, 999);
+    g_assert_cmpint(res, ==, 0);
 }

 static void test_qemu_strtoi64_full_empty(void)
@@ -1769,7 +1769,7 @@ static void test_qemu_strtou64_null(void)
     err = qemu_strtou64(NULL, &endptr, 0, &res);

     g_assert_cmpint(err, ==, -EINVAL);
-    g_assert_cmpuint(res, ==, 999);
+    g_assert_cmpuint(res, ==, 0);
     g_assert_null(endptr);
 }

@@ -1994,7 +1994,7 @@ static void test_qemu_strtou64_full_null(void)
     err = qemu_strtou64(NULL, NULL, 0, &res);

     g_assert_cmpint(err, ==, -EINVAL);
-    g_assert_cmpuint(res, ==, 999);
+    g_assert_cmpuint(res, ==, 0);
 }

 static void test_qemu_strtou64_full_empty(void)
diff --git a/util/cutils.c b/util/cutils.c
index 8bacf349383..83948926ec9 100644
--- a/util/cutils.c
+++ b/util/cutils.c
@@ -384,12 +384,13 @@ static int check_strtox_error(const char *nptr, char *ep,
  *
  * @nptr may be null, and no conversion is performed then.
  *
- * If no conversion is performed, store @nptr in *@endptr and return
- * -EINVAL.
+ * If no conversion is performed, store @nptr in *@endptr, 0 in
+ * @result, and return -EINVAL.
  *
  * If @endptr is null, and the string isn't fully converted, return
- * -EINVAL.  This is the case when the pointer that would be stored in
- * a non-null @endptr points to a character other than '\0'.
+ * -EINVAL with @result set to the parsed value.  This is the case
+ * when the pointer that would be stored in a non-null @endptr points
+ * to a character other than '\0'.
  *
  * If the conversion overflows @result, store INT_MAX in @result,
  * and return -ERANGE.
@@ -407,6 +408,7 @@ int qemu_strtoi(const char *nptr, const char **endptr, int base,

     assert((unsigned) base <= 36 && base != 1);
     if (!nptr) {
+        *result = 0;
         if (endptr) {
             *endptr = nptr;
         }
@@ -436,12 +438,13 @@ int qemu_strtoi(const char *nptr, const char **endptr, int base,
  *
  * @nptr may be null, and no conversion is performed then.
  *
- * If no conversion is performed, store @nptr in *@endptr and return
- * -EINVAL.
+ * If no conversion is performed, store @nptr in *@endptr, 0 in
+ * @result, and return -EINVAL.
  *
  * If @endptr is null, and the string isn't fully converted, return
- * -EINVAL.  This is the case when the pointer that would be stored in
- * a non-null @endptr points to a character other than '\0'.
+ * -EINVAL with @result set to the parsed value.  This is the case
+ * when the pointer that would be stored in a non-null @endptr points
+ * to a character other than '\0'.
  *
  * If the conversion overflows @result, store UINT_MAX in @result,
  * and return -ERANGE.
@@ -460,6 +463,7 @@ int qemu_strtoui(const char *nptr, const char **endptr, int base,

     assert((unsigned) base <= 36 && base != 1);
     if (!nptr) {
+        *result = 0;
         if (endptr) {
             *endptr = nptr;
         }
@@ -495,12 +499,13 @@ int qemu_strtoui(const char *nptr, const char **endptr, int base,
  *
  * @nptr may be null, and no conversion is performed then.
  *
- * If no conversion is performed, store @nptr in *@endptr and return
- * -EINVAL.
+ * If no conversion is performed, store @nptr in *@endptr, 0 in
+ * @result, and return -EINVAL.
  *
  * If @endptr is null, and the string isn't fully converted, return
- * -EINVAL.  This is the case when the pointer that would be stored in
- * a non-null @endptr points to a character other than '\0'.
+ * -EINVAL with @result set to the parsed value.  This is the case
+ * when the pointer that would be stored in a non-null @endptr points
+ * to a character other than '\0'.
  *
  * If the conversion overflows @result, store LONG_MAX in @result,
  * and return -ERANGE.
@@ -517,6 +522,7 @@ int qemu_strtol(const char *nptr, const char **endptr, int base,

     assert((unsigned) base <= 36 && base != 1);
     if (!nptr) {
+        *result = 0;
         if (endptr) {
             *endptr = nptr;
         }
@@ -537,12 +543,13 @@ int qemu_strtol(const char *nptr, const char **endptr, int base,
  *
  * @nptr may be null, and no conversion is performed then.
  *
- * If no conversion is performed, store @nptr in *@endptr and return
- * -EINVAL.
+ * If no conversion is performed, store @nptr in *@endptr, 0 in
+ * @result, and return -EINVAL.
  *
  * If @endptr is null, and the string isn't fully converted, return
- * -EINVAL.  This is the case when the pointer that would be stored in
- * a non-null @endptr points to a character other than '\0'.
+ * -EINVAL with @result set to the parsed value.  This is the case
+ * when the pointer that would be stored in a non-null @endptr points
+ * to a character other than '\0'.
  *
  * If the conversion overflows @result, store ULONG_MAX in @result,
  * and return -ERANGE.
@@ -560,6 +567,7 @@ int qemu_strtoul(const char *nptr, const char **endptr, int base,

     assert((unsigned) base <= 36 && base != 1);
     if (!nptr) {
+        *result = 0;
         if (endptr) {
             *endptr = nptr;
         }
@@ -588,6 +596,7 @@ int qemu_strtoi64(const char *nptr, const char **endptr, int base,

     assert((unsigned) base <= 36 && base != 1);
     if (!nptr) {
+        *result = 0;
         if (endptr) {
             *endptr = nptr;
         }
@@ -613,6 +622,7 @@ int qemu_strtou64(const char *nptr, const char **endptr, int base,

     assert((unsigned) base <= 36 && base != 1);
     if (!nptr) {
+        *result = 0;
         if (endptr) {
             *endptr = nptr;
         }
-- 
2.40.1


