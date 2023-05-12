Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B10E6FFED0
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 04:13:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxIFX-0004ql-UT; Thu, 11 May 2023 22:11:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pxIFW-0004oh-I9
 for qemu-devel@nongnu.org; Thu, 11 May 2023 22:11:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pxIFF-0000Qh-Iv
 for qemu-devel@nongnu.org; Thu, 11 May 2023 22:11:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683857452;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TZCwzc/82AeqgxSVwgQBV/R0GPQa6yEbzAKl8JvPOjg=;
 b=UJGg6Y0bKsRWs+kCEIT4XuHmEGr2bgxT9R2vUVfqhO2k3gaf+MtO1kQoPY/wN7QwkWPNFd
 s5b8PW15Rmc+cJEj61oOy3xuw9UYj+vo/zcpXSiAfc+8DlIzc3pP9ARWl52R04gu2kQ0Ae
 13HS4Jjv0yBiXhb1i3C6zwHXSY4WKoQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-311-0_y6Ll6dNFeUlGkKAunz3A-1; Thu, 11 May 2023 22:10:49 -0400
X-MC-Unique: 0_y6Ll6dNFeUlGkKAunz3A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B0A1A3C10246;
 Fri, 12 May 2023 02:10:48 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4D7EC2026D16;
 Fri, 12 May 2023 02:10:48 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: hreitz@redhat.com,
	armbru@redhat.com,
	richard.henderson@linaro.org
Subject: [PATCH v2 17/19] cutils: Use parse_uint in qemu_strtosz for negative
 rejection
Date: Thu, 11 May 2023 21:10:31 -0500
Message-Id: <20230512021033.1378730-18-eblake@redhat.com>
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

Rather than open-coding two different ways to check for an unwanted
negative sign, reuse the same code in both functions.  That way, if we
decide down the road to accept "-0" instead of rejecting it, we have
fewer places to change.  Also, it means we now get ERANGE instead of
EINVAL for negative values in qemu_strtosz, which is reasonable for
what it represents.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 tests/unit/test-cutils.c | 7 +++----
 util/cutils.c            | 8 ++------
 2 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/tests/unit/test-cutils.c b/tests/unit/test-cutils.c
index 1272638582a..b8ad4d7fbac 100644
--- a/tests/unit/test-cutils.c
+++ b/tests/unit/test-cutils.c
@@ -3396,10 +3396,9 @@ static void test_qemu_strtosz_trailing(void)
 static void test_qemu_strtosz_erange(void)
 {
     /* FIXME negative values fit better as ERANGE */
-    do_strtosz(" -0", -EINVAL /* FIXME -ERANGE */, 0, 0 /* FIXME 3 */);
-    do_strtosz("-1", -EINVAL /* FIXME -ERANGE */, 0, 0 /* FIXME 2 */);
-    do_strtosz_full("-2M", qemu_strtosz, -EINVAL /* FIXME -ERANGE */, 0,
-                    0 /* FIXME 2 */, -EINVAL, 0);
+    do_strtosz(" -0", -ERANGE, 0, 3);
+    do_strtosz("-1", -ERANGE, 0, 2);
+    do_strtosz_full("-2M", qemu_strtosz, -ERANGE, 0, 2, -EINVAL, 0);
     do_strtosz(" -.0", -EINVAL /* FIXME -ERANGE */, 0, 0 /* FIXME 4 */);
     do_strtosz_full("-.1k", qemu_strtosz, -EINVAL /* FIXME -ERANGE */, 0,
                     0 /* FIXME 3 */, -EINVAL, 0);
diff --git a/util/cutils.c b/util/cutils.c
index b5a6641fa0f..550abbe5c06 100644
--- a/util/cutils.c
+++ b/util/cutils.c
@@ -201,6 +201,7 @@ static int64_t suffix_mul(char suffix, int64_t unit)
  * - hex with scaling suffix, such as 0x20M
  * - octal, such as 08
  * - fractional hex, such as 0x1.8
+ * - negative values, including -0
  * - floating point exponents, such as 1e3
  *
  * The end pointer will be returned in *end, if not NULL.  If there is
@@ -226,15 +227,10 @@ static int do_strtosz(const char *nptr, const char **end,
     int64_t mul;

     /* Parse integral portion as decimal. */
-    retval = qemu_strtou64(nptr, &endptr, 10, &val);
+    retval = parse_uint(nptr, &endptr, 10, &val);
     if (retval) {
         goto out;
     }
-    if (memchr(nptr, '-', endptr - nptr) != NULL) {
-        endptr = nptr;
-        retval = -EINVAL;
-        goto out;
-    }
     if (val == 0 && (*endptr == 'x' || *endptr == 'X')) {
         /* Input looks like hex; reparse, and insist on no fraction or suffix. */
         retval = qemu_strtou64(nptr, &endptr, 16, &val);
-- 
2.40.1


