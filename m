Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 730B86FFEC0
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 04:12:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxIFN-0004ji-5Y; Thu, 11 May 2023 22:11:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pxIFL-0004j4-HT
 for qemu-devel@nongnu.org; Thu, 11 May 2023 22:11:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pxIF6-0000PC-Pu
 for qemu-devel@nongnu.org; Thu, 11 May 2023 22:11:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683857443;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fnvkrMuUpglPotfSIHcayGPS5JFevaH1n4AoJYzF5o8=;
 b=NJY8VuM5DrKoonaQb6Gz864V//zT0+L/0jrN+onYbUHd0QVdoUsQJ67WmBGA34vAWOOPfH
 IkJeVvFpfbCPagK0pct0D+dcaC7xQHYGykzwRr4QxPuqmkblBrDztM6zn+zUcfTshWXBwX
 1l9UYzFbhbSF0kgl2tJAqtoQDSYPels=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-594-cqLJHI-GO_KVujywABGCIA-1; Thu, 11 May 2023 22:10:39 -0400
X-MC-Unique: cqLJHI-GO_KVujywABGCIA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A4604185A7A4;
 Fri, 12 May 2023 02:10:39 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 419B02026D16;
 Fri, 12 May 2023 02:10:39 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: hreitz@redhat.com,
	armbru@redhat.com,
	richard.henderson@linaro.org
Subject: [PATCH v2 05/19] cutils: Fix wraparound parsing in qemu_strtoui
Date: Thu, 11 May 2023 21:10:19 -0500
Message-Id: <20230512021033.1378730-6-eblake@redhat.com>
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

While we were matching 32-bit strtol in qemu_strtoi, our use of a
64-bit parse was leaking through for some inaccurate answers in
qemu_strtoui in comparison to a 32-bit strtoul.  Fix those, and update
the testsuite now that our bounds checks are correct.

Our int wrappers would be a lot easier to write if libc had a
guaranteed 32-bit parser even on platforms with 64-bit long.

Fixes: 473a2a331e ("cutils: add qemu_strtoi & qemu_strtoui parsers for int/unsigned int types", v2.12.0)
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 tests/unit/test-cutils.c | 11 +++++------
 util/cutils.c            | 14 ++++++++++----
 2 files changed, 15 insertions(+), 10 deletions(-)

diff --git a/tests/unit/test-cutils.c b/tests/unit/test-cutils.c
index 89c10f5307a..08989d1d3ac 100644
--- a/tests/unit/test-cutils.c
+++ b/tests/unit/test-cutils.c
@@ -858,7 +858,7 @@ static void test_qemu_strtoui_hex(void)

 static void test_qemu_strtoui_wrap(void)
 {
-    /* FIXME - wraparound should be consistent with 32-bit strtoul */
+    /* wraparound is consistent with 32-bit strtoul */
     const char *str = "-4294967295"; /* 1 mod 2^32 */
     char f = 'X';
     const char *endptr = &f;
@@ -867,8 +867,8 @@ static void test_qemu_strtoui_wrap(void)

     err = qemu_strtoui(str, &endptr, 0, &res);

-    g_assert_cmpint(err, ==, -ERANGE /* FIXME 0 */);
-    g_assert_cmphex(res, ==, UINT_MAX /* FIXME 1 */);
+    g_assert_cmpint(err, ==, 0);
+    g_assert_cmphex(res, ==, 1);
     g_assert_true(endptr == str + strlen(str));
 }

@@ -935,13 +935,12 @@ static void test_qemu_strtoui_underflow(void)
     g_assert_cmpint(res, ==, UINT_MAX);
     g_assert_true(endptr == str + strlen(str));

-    /* FIXME - overflow should be consistent with 32-bit strtoul */
     str = "-18446744073709551615"; /* -UINT64_MAX (not 1) */
     endptr = "somewhere";
     res = 999;
     err = qemu_strtoui(str, &endptr, 0, &res);
-    g_assert_cmpint(err, ==, 0 /* FIXME -ERANGE */);
-    g_assert_cmpint(res, ==, 1 /* FIXME UINT_MAX */);
+    g_assert_cmpint(err, ==, -ERANGE);
+    g_assert_cmpint(res, ==, UINT_MAX);
     g_assert_true(endptr == str + strlen(str));

     str = "-0x10000000000000000"; /* 65 bits, 32-bit sign bit clear */
diff --git a/util/cutils.c b/util/cutils.c
index 5887e744140..997ddcd09e5 100644
--- a/util/cutils.c
+++ b/util/cutils.c
@@ -466,10 +466,16 @@ int qemu_strtoui(const char *nptr, const char **endptr, int base,
     if (errno == ERANGE) {
         *result = -1;
     } else {
-        if (lresult > UINT_MAX) {
-            *result = UINT_MAX;
-            errno = ERANGE;
-        } else if (lresult < INT_MIN) {
+        /*
+         * Note that platforms with 32-bit strtoul accept input in the
+         * range [-4294967295, 4294967295]; but we used 64-bit
+         * strtoull which wraps -18446744073709551615 to 1.  Reject
+         * positive values that contain '-', and wrap all valid
+         * negative values.
+         */
+        if (lresult > UINT_MAX ||
+            lresult < -(long long)UINT_MAX ||
+            (lresult > 0 && memchr(nptr, '-', ep - nptr))) {
             *result = UINT_MAX;
             errno = ERANGE;
         } else {
-- 
2.40.1


