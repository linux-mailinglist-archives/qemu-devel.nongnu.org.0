Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5316FFECB
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 04:13:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxIFL-0004j1-W5; Thu, 11 May 2023 22:11:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pxIFJ-0004iJ-BI
 for qemu-devel@nongnu.org; Thu, 11 May 2023 22:11:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pxIF5-0000Pj-60
 for qemu-devel@nongnu.org; Thu, 11 May 2023 22:11:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683857446;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OeThkWJtzwFFyeQiYrIHTjOVUdH6RCaM+PBhuJQ8CB4=;
 b=LXF19bwpdgragXBCwhUThE2ktOP8D7CzYorGrbkBN6OgKslHtdqBmDIjcwpYqcPCW2ARUe
 BtpDVN5epjloPcH0GS+N8tpGbLMUB/j9ZtDpq5TpftVdfrK6a4TJf1jW/XyugMeE7b0fLv
 jZr0pjpaVpK3xUumb2VkFoHwfiaZBtw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-38-ykWxV1t3PAGnGkxZIfERrw-1; Thu, 11 May 2023 22:10:42 -0400
X-MC-Unique: ykWxV1t3PAGnGkxZIfERrw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3D35B101A554;
 Fri, 12 May 2023 02:10:42 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CF5402027179;
 Fri, 12 May 2023 02:10:41 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: hreitz@redhat.com,
	armbru@redhat.com,
	richard.henderson@linaro.org
Subject: [PATCH v2 08/19] cutils: Allow NULL endptr in parse_uint()
Date: Thu, 11 May 2023 21:10:22 -0500
Message-Id: <20230512021033.1378730-9-eblake@redhat.com>
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

All the qemu_strto*() functions permit a NULL endptr, just like their
libc counterparts, leaving parse_uint() as the oddball that caused
SEGFAULT on NULL and required the user to call parse_uint_full()
instead.  Relax things for consistency, even though the testsuite is
the only impacted caller.  Add one more unit test to ensure even
parse_uint_full(NULL, 0, &value) works.  This also fixes our code to
uniformly favor EINVAL over ERANGE when both apply.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 tests/unit/test-cutils.c | 18 ++++++++++++++++--
 util/cutils.c            | 34 ++++++++++++----------------------
 2 files changed, 28 insertions(+), 24 deletions(-)

diff --git a/tests/unit/test-cutils.c b/tests/unit/test-cutils.c
index 0c7d07b3297..d3076c3fec1 100644
--- a/tests/unit/test-cutils.c
+++ b/tests/unit/test-cutils.c
@@ -260,14 +260,26 @@ static void test_parse_uint_full_correct(void)

 static void test_parse_uint_full_erange_junk(void)
 {
-    /* FIXME - inconsistent with qemu_strto* which favors EINVAL */
+    /* EINVAL has priority over ERANGE */
     uint64_t i = 999;
     const char *str = "-2junk";
     int r;

     r = parse_uint_full(str, 0, &i);

-    g_assert_cmpint(r, ==, -ERANGE /* FIXME -EINVAL */);
+    g_assert_cmpint(r, ==, -EINVAL);
+    g_assert_cmpuint(i, ==, 0);
+}
+
+static void test_parse_uint_full_null(void)
+{
+    uint64_t i = 999;
+    const char *str = NULL;
+    int r;
+
+    r = parse_uint_full(str, 0, &i);
+
+    g_assert_cmpint(r, ==, -EINVAL);
     g_assert_cmpuint(i, ==, 0);
 }

@@ -3207,6 +3219,8 @@ int main(int argc, char **argv)
                     test_parse_uint_full_correct);
     g_test_add_func("/cutils/parse_uint_full/erange_junk",
                     test_parse_uint_full_erange_junk);
+    g_test_add_func("/cutils/parse_uint_full/null",
+                    test_parse_uint_full_null);

     /* qemu_strtoi() tests */
     g_test_add_func("/cutils/qemu_strtoi/correct",
diff --git a/util/cutils.c b/util/cutils.c
index 8ab0cae5e75..e599924a0c4 100644
--- a/util/cutils.c
+++ b/util/cutils.c
@@ -715,8 +715,7 @@ const char *qemu_strchrnul(const char *s, int c)
  * parse_uint:
  *
  * @s: String to parse
- * @endptr: Destination for pointer to first character not consumed, must
- * not be %NULL
+ * @endptr: Destination for pointer to first character not consumed
  * @base: integer base, between 2 and 36 inclusive, or 0
  * @value: Destination for parsed integer value
  *
@@ -730,7 +729,8 @@ const char *qemu_strchrnul(const char *s, int c)
  *
  * Set *@endptr to point right beyond the parsed integer (even if the integer
  * overflows or is negative, all digits will be parsed and *@endptr will
- * point right beyond them).
+ * point right beyond them).  If @endptr is %NULL, any trailing character
+ * instead causes a result of -EINVAL with *@value of 0.
  *
  * If the integer is negative, set *@value to 0, and return -ERANGE.
  * (If you want to allow negative numbers that wrap around within
@@ -777,7 +777,12 @@ int parse_uint(const char *s, const char **endptr, int base, uint64_t *value)

 out:
     *value = val;
-    *endptr = endp;
+    if (endptr) {
+        *endptr = endp;
+    } else if (s && *endp) {
+        r = -EINVAL;
+        *value = 0;
+    }
     return r;
 }

@@ -788,28 +793,13 @@ out:
  * @base: integer base, between 2 and 36 inclusive, or 0
  * @value: Destination for parsed integer value
  *
- * Parse unsigned integer from entire string
+ * Parse unsigned integer from entire string, rejecting any trailing slop.
  *
- * Have the same behavior of parse_uint(), but with an additional
- * check for additional data after the parsed number. If extra
- * characters are present after a non-overflowing parsed number, the
- * function will return -EINVAL, and *@v will be set to 0.
+ * Shorthand for parse_uint(s, NULL, base, value).
  */
 int parse_uint_full(const char *s, int base, uint64_t *value)
 {
-    const char *endp;
-    int r;
-
-    r = parse_uint(s, &endp, base, value);
-    if (r < 0) {
-        return r;
-    }
-    if (*endp) {
-        *value = 0;
-        return -EINVAL;
-    }
-
-    return 0;
+    return parse_uint(s, NULL, base, value);
 }

 int qemu_parse_fd(const char *param)
-- 
2.40.1


