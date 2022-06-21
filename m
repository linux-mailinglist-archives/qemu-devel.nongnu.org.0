Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FFD6552D1A
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 10:35:53 +0200 (CEST)
Received: from localhost ([::1]:49416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3ZMU-000676-LY
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 04:35:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1o3ZLE-00058z-B8
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 04:34:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43126)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1o3ZLB-0005P7-71
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 04:34:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655800465;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=rhu1sVghdcLPrSAyZ6G5jt4VB8N4oiEfxuuGDLrFnLo=;
 b=awRZyStBqA01OA684/rh9f143BQEn1simV6WrhvoA2VTV5E3UETBS7vcgYsmsSQTr1LpMI
 ECJWzeLPOJ4DYDH4mvdBmf3hllB1dohGnR7sLm1PXIMkSNYEBXIxacOc7yZckVdJCE85S1
 UV17KH6QM+p0/72KupLkHuhtYqbMddU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-266-Syx86OooMOq6F6H2q66JrQ-1; Tue, 21 Jun 2022 04:34:24 -0400
X-MC-Unique: Syx86OooMOq6F6H2q66JrQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EA27C18A6525
 for <qemu-devel@nongnu.org>; Tue, 21 Jun 2022 08:34:23 +0000 (UTC)
Received: from localhost (unknown [10.39.208.14])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 24BBB492CA3;
 Tue, 21 Jun 2022 08:34:22 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH] tests: fix test-cutils leaks
Date: Tue, 21 Jun 2022 12:34:20 +0400
Message-Id: <20220621083420.66365-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
---
 tests/unit/test-cutils.c | 42 ++++++++++++++++++++++++++++++++--------
 1 file changed, 34 insertions(+), 8 deletions(-)

diff --git a/tests/unit/test-cutils.c b/tests/unit/test-cutils.c
index f5b780f01242..86caddcf6498 100644
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
2.37.0.rc0


