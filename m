Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91AA233F2BD
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 15:36:53 +0100 (CET)
Received: from localhost ([::1]:60606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMXI4-0003Ta-5Y
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 10:36:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lMXEz-0001ex-E7
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 10:33:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53963)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lMXEr-0005J6-EY
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 10:33:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615991611;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BG7/LI8+jHUeNtiX/G9o6ClC/XXg4Y/Nazx+Ue8EXFU=;
 b=KQH67K9heCO/fid81IyRH+lFpp4r/88MlzSU3ne2gDUiEijcu2uHGuktKjgfuRca7Fhaw8
 1tNhGogO4Y5VppuqJ1DNHRMjih+04rZAYj2RlwR8iQpKjXY7GjZypAkxCNr/8QtrJHiTOF
 CtbSy3qhfneCZ73pJ6j4IxVwG7Jz1Wo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-232-5oMz3-wqNp-L187rRyIHxw-1; Wed, 17 Mar 2021 10:33:29 -0400
X-MC-Unique: 5oMz3-wqNp-L187rRyIHxw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 81AE0107B7E5;
 Wed, 17 Mar 2021 14:33:28 +0000 (UTC)
Received: from blue.redhat.com (ovpn-113-66.phx2.redhat.com [10.3.113.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 23D0A60C13;
 Wed, 17 Mar 2021 14:33:28 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] utils: Work around mingw strto*l bug with 0x
Date: Wed, 17 Mar 2021 09:33:25 -0500
Message-Id: <20210317143325.2165821-3-eblake@redhat.com>
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

Mingw recognizes that "0x" has value 0 without setting errno, but
fails to advance endptr to the trailing garbage 'x'.  This in turn
showed up in our recent testsuite additions for qemu_strtosz (commit
1657ba44b4 utils: Enhance testsuite for do_strtosz()); adjust our
remaining tests to show that we now work around this windows bug.

This patch intentionally fails check-syntax for use of strtol.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 tests/unit/test-cutils.c | 54 ++++++++++++++++++++++++++++++++++++++++
 util/cutils.c            | 29 +++++++++++++++------
 2 files changed, 75 insertions(+), 8 deletions(-)

diff --git a/tests/unit/test-cutils.c b/tests/unit/test-cutils.c
index 5908de4fd041..98671f1ac30e 100644
--- a/tests/unit/test-cutils.c
+++ b/tests/unit/test-cutils.c
@@ -378,6 +378,15 @@ static void test_qemu_strtoi_hex(void)
     g_assert_cmpint(err, ==, 0);
     g_assert_cmpint(res, ==, 0x123);
     g_assert(endptr == str + strlen(str));
+
+    str = "0x";
+    res = 999;
+    endptr = &f;
+    err = qemu_strtoi(str, &endptr, 16, &res);
+
+    g_assert_cmpint(err, ==, 0);
+    g_assert_cmpint(res, ==, 0);
+    g_assert(endptr == str + 1);
 }

 static void test_qemu_strtoi_max(void)
@@ -669,6 +678,15 @@ static void test_qemu_strtoui_hex(void)
     g_assert_cmpint(err, ==, 0);
     g_assert_cmphex(res, ==, 0x123);
     g_assert(endptr == str + strlen(str));
+
+    str = "0x";
+    res = 999;
+    endptr = &f;
+    err = qemu_strtoui(str, &endptr, 16, &res);
+
+    g_assert_cmpint(err, ==, 0);
+    g_assert_cmphex(res, ==, 0);
+    g_assert(endptr == str + 1);
 }

 static void test_qemu_strtoui_max(void)
@@ -955,6 +973,15 @@ static void test_qemu_strtol_hex(void)
     g_assert_cmpint(err, ==, 0);
     g_assert_cmpint(res, ==, 0x123);
     g_assert(endptr == str + strlen(str));
+
+    str = "0x";
+    res = 999;
+    endptr = &f;
+    err = qemu_strtol(str, &endptr, 16, &res);
+
+    g_assert_cmpint(err, ==, 0);
+    g_assert_cmpint(res, ==, 0);
+    g_assert(endptr == str + 1);
 }

 static void test_qemu_strtol_max(void)
@@ -1244,6 +1271,15 @@ static void test_qemu_strtoul_hex(void)
     g_assert_cmpint(err, ==, 0);
     g_assert_cmphex(res, ==, 0x123);
     g_assert(endptr == str + strlen(str));
+
+    str = "0x";
+    res = 999;
+    endptr = &f;
+    err = qemu_strtoul(str, &endptr, 16, &res);
+
+    g_assert_cmpint(err, ==, 0);
+    g_assert_cmphex(res, ==, 0);
+    g_assert(endptr == str + 1);
 }

 static void test_qemu_strtoul_max(void)
@@ -1528,6 +1564,15 @@ static void test_qemu_strtoi64_hex(void)
     g_assert_cmpint(err, ==, 0);
     g_assert_cmpint(res, ==, 0x123);
     g_assert(endptr == str + strlen(str));
+
+    str = "0x";
+    endptr = &f;
+    res = 999;
+    err = qemu_strtoi64(str, &endptr, 16, &res);
+
+    g_assert_cmpint(err, ==, 0);
+    g_assert_cmpint(res, ==, 0);
+    g_assert(endptr == str + 1);
 }

 static void test_qemu_strtoi64_max(void)
@@ -1815,6 +1860,15 @@ static void test_qemu_strtou64_hex(void)
     g_assert_cmpint(err, ==, 0);
     g_assert_cmphex(res, ==, 0x123);
     g_assert(endptr == str + strlen(str));
+
+    str = "0x";
+    endptr = &f;
+    res = 999;
+    err = qemu_strtou64(str, &endptr, 16, &res);
+
+    g_assert_cmpint(err, ==, 0);
+    g_assert_cmphex(res, ==, 0);
+    g_assert(endptr == str + 1);
 }

 static void test_qemu_strtou64_max(void)
diff --git a/util/cutils.c b/util/cutils.c
index b425ed6570c3..ee908486da44 100644
--- a/util/cutils.c
+++ b/util/cutils.c
@@ -396,9 +396,22 @@ int qemu_strtosz_metric(const char *nptr, const char **end, uint64_t *result)
  * Helper function for error checking after strtol() and the like
  */
 static int check_strtox_error(const char *nptr, char *ep,
-                              const char **endptr, int libc_errno)
+                              const char **endptr, bool check_zero,
+                              int libc_errno)
 {
     assert(ep >= nptr);
+
+    /* Windows has a bug in that it fails to parse 0 from "0x" in base 16 */
+    if (check_zero && ep == nptr && libc_errno == 0) {
+        char *tmp;
+
+        errno = 0;
+        if (strtol(nptr, &tmp, 10) == 0 && errno == 0 &&
+            (*tmp == 'x' || *tmp == 'X')) {
+            ep = tmp;
+        }
+    }
+
     if (endptr) {
         *endptr = ep;
     }
@@ -465,7 +478,7 @@ int qemu_strtoi(const char *nptr, const char **endptr, int base,
     } else {
         *result = lresult;
     }
-    return check_strtox_error(nptr, ep, endptr, errno);
+    return check_strtox_error(nptr, ep, endptr, lresult == 0, errno);
 }

 /**
@@ -524,7 +537,7 @@ int qemu_strtoui(const char *nptr, const char **endptr, int base,
             *result = lresult;
         }
     }
-    return check_strtox_error(nptr, ep, endptr, errno);
+    return check_strtox_error(nptr, ep, endptr, lresult == 0, errno);
 }

 /**
@@ -566,7 +579,7 @@ int qemu_strtol(const char *nptr, const char **endptr, int base,

     errno = 0;
     *result = strtol(nptr, &ep, base);
-    return check_strtox_error(nptr, ep, endptr, errno);
+    return check_strtox_error(nptr, ep, endptr, *result == 0, errno);
 }

 /**
@@ -613,7 +626,7 @@ int qemu_strtoul(const char *nptr, const char **endptr, int base,
     if (errno == ERANGE) {
         *result = -1;
     }
-    return check_strtox_error(nptr, ep, endptr, errno);
+    return check_strtox_error(nptr, ep, endptr, *result == 0, errno);
 }

 /**
@@ -639,7 +652,7 @@ int qemu_strtoi64(const char *nptr, const char **endptr, int base,
     QEMU_BUILD_BUG_ON(sizeof(int64_t) != sizeof(long long));
     errno = 0;
     *result = strtoll(nptr, &ep, base);
-    return check_strtox_error(nptr, ep, endptr, errno);
+    return check_strtox_error(nptr, ep, endptr, *result == 0, errno);
 }

 /**
@@ -668,7 +681,7 @@ int qemu_strtou64(const char *nptr, const char **endptr, int base,
     if (errno == ERANGE) {
         *result = -1;
     }
-    return check_strtox_error(nptr, ep, endptr, errno);
+    return check_strtox_error(nptr, ep, endptr, *result == 0, errno);
 }

 /**
@@ -708,7 +721,7 @@ int qemu_strtod(const char *nptr, const char **endptr, double *result)

     errno = 0;
     *result = strtod(nptr, &ep);
-    return check_strtox_error(nptr, ep, endptr, errno);
+    return check_strtox_error(nptr, ep, endptr, false, errno);
 }

 /**
-- 
2.30.2


