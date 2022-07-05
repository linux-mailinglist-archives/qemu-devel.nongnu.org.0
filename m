Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4406356686C
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 12:45:50 +0200 (CEST)
Received: from localhost ([::1]:35632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8g3x-0003Js-B7
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 06:45:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o8fws-0006EI-23
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 06:38:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42000)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o8fwn-0005xs-62
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 06:38:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657017504;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vspu2akcsIaT0NkUHngHswUGD/BiN3NO+lWFHcJsgqo=;
 b=dxmyTowVsqHZh008aG+uaawG9gEUSL5dSGWTULmod5U12FsFEWpy38AxxSSBs8Tosc+It1
 JUVaokupLIqvFwEtGMYVfPi3RiuC9PfUrm9Vu2ZLTirFPoGcfvhbEzLVmdGBvtZsunwkyp
 krB5dm1K6F6PUkLpb5+7ZOoN4fV9hts=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-486-9YSNeKrhNdqkIFrxCW9qFA-1; Tue, 05 Jul 2022 06:38:21 -0400
X-MC-Unique: 9YSNeKrhNdqkIFrxCW9qFA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 01C5D83397F;
 Tue,  5 Jul 2022 10:38:21 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.133])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AE845492C3B;
 Tue,  5 Jul 2022 10:38:19 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 01/14] tests: fix test-cutils leaks
Date: Tue,  5 Jul 2022 12:38:03 +0200
Message-Id: <20220705103816.608166-2-thuth@redhat.com>
In-Reply-To: <20220705103816.608166-1-thuth@redhat.com>
References: <20220705103816.608166-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Reported by ASAN.

Fixes commit cfb34489 ("cutils: add functions for IEC and SI prefixes").

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20220621083420.66365-1-marcandre.lureau@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/unit/test-cutils.c | 42 ++++++++++++++++++++++++++++++++--------
 1 file changed, 34 insertions(+), 8 deletions(-)

diff --git a/tests/unit/test-cutils.c b/tests/unit/test-cutils.c
index f5b780f012..86caddcf64 100644
--- a/tests/unit/test-cutils.c
+++ b/tests/unit/test-cutils.c
@@ -2452,18 +2452,44 @@ static void test_qemu_strtosz_metric(void)
 
 static void test_freq_to_str(void)
 {
-    g_assert_cmpstr(freq_to_str(999), ==, "999 Hz");
-    g_assert_cmpstr(freq_to_str(1000), ==, "1 KHz");
-    g_assert_cmpstr(freq_to_str(1010), ==, "1.01 KHz");
+    char *str;
+
+    str = freq_to_str(999);
+    g_assert_cmpstr(str, ==, "999 Hz");
+    g_free(str);
+
+    str = freq_to_str(1000);
+    g_assert_cmpstr(str, ==, "1 KHz");
+    g_free(str);
+
+    str = freq_to_str(1010);
+    g_assert_cmpstr(str, ==, "1.01 KHz");
+    g_free(str);
 }
 
 static void test_size_to_str(void)
 {
-    g_assert_cmpstr(size_to_str(0), ==, "0 B");
-    g_assert_cmpstr(size_to_str(1), ==, "1 B");
-    g_assert_cmpstr(size_to_str(1016), ==, "0.992 KiB");
-    g_assert_cmpstr(size_to_str(1024), ==, "1 KiB");
-    g_assert_cmpstr(size_to_str(512ull << 20), ==, "512 MiB");
+    char *str;
+
+    str = size_to_str(0);
+    g_assert_cmpstr(str, ==, "0 B");
+    g_free(str);
+
+    str = size_to_str(1);
+    g_assert_cmpstr(str, ==, "1 B");
+    g_free(str);
+
+    str = size_to_str(1016);
+    g_assert_cmpstr(str, ==, "0.992 KiB");
+    g_free(str);
+
+    str = size_to_str(1024);
+    g_assert_cmpstr(str, ==, "1 KiB");
+    g_free(str);
+
+    str = size_to_str(512ull << 20);
+    g_assert_cmpstr(str, ==, "512 MiB");
+    g_free(str);
 }
 
 static void test_iec_binary_prefix(void)
-- 
2.31.1


