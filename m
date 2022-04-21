Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEBEE50A1EA
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 16:16:32 +0200 (CEST)
Received: from localhost ([::1]:53232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhXbj-0001ky-SL
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 10:16:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhXDj-0004hB-JO
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 09:51:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhXDh-0006DO-2A
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 09:51:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650549100;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6LChbIKCQGgWTk8FDlJNk6Ns6fz1CDlRHNwJ1l7roGk=;
 b=fD3vqDkJN7EgBbrzdHk7Ee1FhTrZIllQwA0mZEu7hlpixsHb/XoaqqdgqG6GVHyc+t2s2a
 qeVo6ip8QgZ6cXzbjPwDGo1BC/vhK+rI/zBL5Cr1CVQAYxgI27NuZIpn8fUnxPZGTX1XOd
 /1HOETTJhYyV4Zz3dBxoxe6Ykb8pgFE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-607-A6vzXugZM3eJCAgvYQbUGw-1; Thu, 21 Apr 2022 09:51:39 -0400
X-MC-Unique: A6vzXugZM3eJCAgvYQbUGw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D96B3185A7A4;
 Thu, 21 Apr 2022 13:51:38 +0000 (UTC)
Received: from localhost (unknown [10.39.208.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 114C5404728A;
 Thu, 21 Apr 2022 13:51:37 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL 20/30] tests: run-time skip test-qga if TSAN is enabled
Date: Thu, 21 Apr 2022 17:49:30 +0400
Message-Id: <20220421134940.2887768-21-marcandre.lureau@redhat.com>
In-Reply-To: <20220421134940.2887768-1-marcandre.lureau@redhat.com>
References: <20220421134940.2887768-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124;
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 richard.henderson@linaro.org, Michael Roth <michael.roth@amd.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

This allows to make sure the test is still built, and gives more
accurate report details.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20220420132624.2439741-30-marcandre.lureau@redhat.com>
---
 tests/unit/test-qga.c  | 7 +++++++
 tests/unit/meson.build | 2 +-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/tests/unit/test-qga.c b/tests/unit/test-qga.c
index 5cb140d1b53d..e17a288034bc 100644
--- a/tests/unit/test-qga.c
+++ b/tests/unit/test-qga.c
@@ -969,6 +969,13 @@ int main(int argc, char **argv)
     TestFixture fix;
     int ret;
 
+#ifdef QEMU_SANITIZE_THREAD
+    {
+        g_test_skip("tsan enabled, https://github.com/google/sanitizers/issues/1116");
+        return 0;
+    }
+#endif
+
     setlocale (LC_ALL, "");
     g_test_init(&argc, &argv, NULL);
     fixture_setup(&fix, NULL, NULL);
diff --git a/tests/unit/meson.build b/tests/unit/meson.build
index 026e39f52025..ab01e00f12cf 100644
--- a/tests/unit/meson.build
+++ b/tests/unit/meson.build
@@ -153,7 +153,7 @@ if have_system
   endif
 endif
 
-if have_ga and targetos == 'linux' and 'CONFIG_TSAN' not in config_host
+if have_ga and targetos == 'linux'
   tests += {'test-qga': ['../qtest/libqtest.c']}
   test_deps += {'test-qga': qga}
 endif
-- 
2.36.0


