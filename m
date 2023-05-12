Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C1D6FFEC5
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 04:12:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxIFU-0004nU-79; Thu, 11 May 2023 22:11:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pxIFQ-0004li-No
 for qemu-devel@nongnu.org; Thu, 11 May 2023 22:11:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pxIF9-0000QD-Ki
 for qemu-devel@nongnu.org; Thu, 11 May 2023 22:11:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683857449;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Kdoj0V5KACWQSN+P7cT+mO2dib1yAMZJ1tRmr1YdFSQ=;
 b=bCBPuIvV1d8Jt+s5W1LN3HhrLpcVJF6iVyTeWj0vQxgMg1TOLIh9ihlesTiusQcNOo7lZn
 ej334EYPdn4oPClA1+mQph7MVzwpUWkDopB3ADT2KtCqxn2KmwIbhlckAgyosPsiLZTp9Y
 Qt3R/nWCycgVx76iWuGx/ZjPBA/HvhI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-656-KaZObZpxMuWOfg3Kauxg5A-1; Thu, 11 May 2023 22:10:48 -0400
X-MC-Unique: KaZObZpxMuWOfg3Kauxg5A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 20DD4185A78B;
 Fri, 12 May 2023 02:10:48 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B2C312026D16;
 Fri, 12 May 2023 02:10:47 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: hreitz@redhat.com,
	armbru@redhat.com,
	richard.henderson@linaro.org
Subject: [PATCH v2 16/19] cutils: Set value in all integral qemu_strto* error
 paths
Date: Thu, 11 May 2023 21:10:30 -0500
Message-Id: <20230512021033.1378730-17-eblake@redhat.com>
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

Our goal in writing qemu_strtoi() and friends is to have an interface
harder to abuse than libc's strtol().  Leaving the return value
uninitialized on some but not all error paths does not lend itself
well to this goal; and our documentation wasn't helpful on what to
expect.

Note that the previous patch changed all qemu_strtosz() EINVAL error
paths to slam value to 0 rather than stay uninitialized, even when the
EINVAL eror occurs because of trailing junk.  But for the remaining
integral qemu_strto*, it's easier to return the parsed value than to
force things back to zero, in part because of how check_strtox_error
works; in part because people expect that from libc strto* (while
there is no libc strtosz to compare to), and in part because doing so
creates less churn in the testsuite.

Here, the list of affected callers is much longer ('git grep
"qemu_strto[ui]" *.c **/*.c | grep -v tests/ |wc -l' outputs 87,
although a few of those are the implementation in in cutils.c), so
touching as little as possible is the wisest course of action.

Signed-off-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Hanna Czenczek <hreitz@redhat.com>

---

v2: commit message tweaked, but code unchanged, so R-b applied
---
 tests/unit/test-cutils.c | 24 +++++++++++------------
 util/cutils.c            | 42 +++++++++++++++++++++++++---------------
 2 files changed, 38 insertions(+), 28 deletions(-)

diff --git a/tests/unit/test-cutils.c b/tests/unit/test-cutils.c
index 4a1baf05ca6..1272638582a 100644
--- a/tests/unit/test-cutils.c
+++ b/tests/unit/test-cutils.c
@@ -310,7 +310,7 @@ static void test_qemu_strtoi_null(void)
     err = qemu_strtoi(NULL, &endptr, 0, &res);

     g_assert_cmpint(err, ==, -EINVAL);
-    g_assert_cmpint(res, ==, 999);
+    g_assert_cmpint(res, ==, 0);
     g_assert_null(endptr);
 }

@@ -610,7 +610,7 @@ static void test_qemu_strtoi_full_null(void)
     err = qemu_strtoi(NULL, &endptr, 0, &res);

     g_assert_cmpint(err, ==, -EINVAL);
-    g_assert_cmpint(res, ==, 999);
+    g_assert_cmpint(res, ==, 0);
     g_assert_null(endptr);
 }

@@ -713,7 +713,7 @@ static void test_qemu_strtoui_null(void)
     err = qemu_strtoui(NULL, &endptr, 0, &res);

     g_assert_cmpint(err, ==, -EINVAL);
-    g_assert_cmpuint(res, ==, 999);
+    g_assert_cmpuint(res, ==, 0);
     g_assert_null(endptr);
 }

@@ -1011,7 +1011,7 @@ static void test_qemu_strtoui_full_null(void)
     err = qemu_strtoui(NULL, NULL, 0, &res);

     g_assert_cmpint(err, ==, -EINVAL);
-    g_assert_cmpuint(res, ==, 999);
+    g_assert_cmpuint(res, ==, 0);
 }

 static void test_qemu_strtoui_full_empty(void)
@@ -1111,7 +1111,7 @@ static void test_qemu_strtol_null(void)
     err = qemu_strtol(NULL, &endptr, 0, &res);

     g_assert_cmpint(err, ==, -EINVAL);
-    g_assert_cmpint(res, ==, 999);
+    g_assert_cmpint(res, ==, 0);
     g_assert_null(endptr);
 }

@@ -1415,7 +1415,7 @@ static void test_qemu_strtol_full_null(void)
     err = qemu_strtol(NULL, &endptr, 0, &res);

     g_assert_cmpint(err, ==, -EINVAL);
-    g_assert_cmpint(res, ==, 999);
+    g_assert_cmpint(res, ==, 0);
     g_assert_null(endptr);
 }

@@ -1518,7 +1518,7 @@ static void test_qemu_strtoul_null(void)
     err = qemu_strtoul(NULL, &endptr, 0, &res);

     g_assert_cmpint(err, ==, -EINVAL);
-    g_assert_cmpuint(res, ==, 999);
+    g_assert_cmpuint(res, ==, 0);
     g_assert_null(endptr);
 }

@@ -1811,7 +1811,7 @@ static void test_qemu_strtoul_full_null(void)
     err = qemu_strtoul(NULL, NULL, 0, &res);

     g_assert_cmpint(err, ==, -EINVAL);
-    g_assert_cmpuint(res, ==, 999);
+    g_assert_cmpuint(res, ==, 0);
 }

 static void test_qemu_strtoul_full_empty(void)
@@ -1911,7 +1911,7 @@ static void test_qemu_strtoi64_null(void)
     err = qemu_strtoi64(NULL, &endptr, 0, &res);

     g_assert_cmpint(err, ==, -EINVAL);
-    g_assert_cmpint(res, ==, 999);
+    g_assert_cmpint(res, ==, 0);
     g_assert_null(endptr);
 }

@@ -2201,7 +2201,7 @@ static void test_qemu_strtoi64_full_null(void)
     err = qemu_strtoi64(NULL, NULL, 0, &res);

     g_assert_cmpint(err, ==, -EINVAL);
-    g_assert_cmpint(res, ==, 999);
+    g_assert_cmpint(res, ==, 0);
 }

 static void test_qemu_strtoi64_full_empty(void)
@@ -2304,7 +2304,7 @@ static void test_qemu_strtou64_null(void)
     err = qemu_strtou64(NULL, &endptr, 0, &res);

     g_assert_cmpint(err, ==, -EINVAL);
-    g_assert_cmpuint(res, ==, 999);
+    g_assert_cmpuint(res, ==, 0);
     g_assert_null(endptr);
 }

@@ -2593,7 +2593,7 @@ static void test_qemu_strtou64_full_null(void)
     err = qemu_strtou64(NULL, NULL, 0, &res);

     g_assert_cmpint(err, ==, -EINVAL);
-    g_assert_cmpuint(res, ==, 999);
+    g_assert_cmpuint(res, ==, 0);
 }

 static void test_qemu_strtou64_full_empty(void)
diff --git a/util/cutils.c b/util/cutils.c
index 24955d3ca94..b5a6641fa0f 100644
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
@@ -501,12 +505,13 @@ int qemu_strtoui(const char *nptr, const char **endptr, int base,
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
@@ -523,6 +528,7 @@ int qemu_strtol(const char *nptr, const char **endptr, int base,

     assert((unsigned) base <= 36 && base != 1);
     if (!nptr) {
+        *result = 0;
         if (endptr) {
             *endptr = nptr;
         }
@@ -543,12 +549,13 @@ int qemu_strtol(const char *nptr, const char **endptr, int base,
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
@@ -566,6 +573,7 @@ int qemu_strtoul(const char *nptr, const char **endptr, int base,

     assert((unsigned) base <= 36 && base != 1);
     if (!nptr) {
+        *result = 0;
         if (endptr) {
             *endptr = nptr;
         }
@@ -594,6 +602,7 @@ int qemu_strtoi64(const char *nptr, const char **endptr, int base,

     assert((unsigned) base <= 36 && base != 1);
     if (!nptr) {
+        *result = 0;
         if (endptr) {
             *endptr = nptr;
         }
@@ -621,6 +630,7 @@ int qemu_strtou64(const char *nptr, const char **endptr, int base,

     assert((unsigned) base <= 36 && base != 1);
     if (!nptr) {
+        *result = 0;
         if (endptr) {
             *endptr = nptr;
         }
-- 
2.40.1


