Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C8CE6ABF86
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 13:31:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZ9yc-0000AW-2Z; Mon, 06 Mar 2023 07:30:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pZ9xT-0007fA-GQ
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 07:28:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pZ9xR-0003MG-4p
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 07:28:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678105727;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fabF+/VqGsrwYEFvCtPe+ob3Xg9pzyTYeIb5h0qbImc=;
 b=Al3IrdNhNO0z1dd1G8yXwtCbA9jMx4WgKKhJZqkp91vsbm1FR9JVdAUw+RErM2iqDuoG7q
 EoqLJnp3imH+1DvO7sqZxtEfwORDE4BF1khlPGic4QA4AagOZbhzRMTw4HFj73lBJVJ2O2
 +13i4u2DLUsSlvfA1wiCGcwRvgTDq+g=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-623-Q7uHlBAJNayMSyhwrs_62w-1; Mon, 06 Mar 2023 07:28:44 -0500
X-MC-Unique: Q7uHlBAJNayMSyhwrs_62w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 46282183B3C1;
 Mon,  6 Mar 2023 12:28:44 +0000 (UTC)
Received: from localhost (unknown [10.39.208.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0812F1121314;
 Mon,  6 Mar 2023 12:28:42 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Michael Roth <michael.roth@amd.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: [PATCH v4 10/11] qtest: enable vnc-display test on win32
Date: Mon,  6 Mar 2023 16:27:50 +0400
Message-Id: <20230306122751.2355515-11-marcandre.lureau@redhat.com>
In-Reply-To: <20230306122751.2355515-1-marcandre.lureau@redhat.com>
References: <20230306122751.2355515-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Now that qtest_qmp_add_client() works on win32, we can enable the VNC
test.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Acked-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/vnc-display-test.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/tests/qtest/vnc-display-test.c b/tests/qtest/vnc-display-test.c
index e52a4326ec..f8933b0761 100644
--- a/tests/qtest/vnc-display-test.c
+++ b/tests/qtest/vnc-display-test.c
@@ -19,7 +19,7 @@ typedef struct Test {
     GMainLoop *loop;
 } Test;
 
-#if !defined(WIN32) && !defined(CONFIG_DARWIN)
+#if !defined(CONFIG_DARWIN)
 
 static void on_vnc_error(VncConnection* self,
                          const char* msg)
@@ -38,10 +38,7 @@ static void on_vnc_auth_failure(VncConnection *self,
 static bool
 test_setup(Test *test)
 {
-#ifdef WIN32
-    g_test_skip("Not supported on Windows yet");
-    return false;
-#elif defined(CONFIG_DARWIN)
+#if defined(CONFIG_DARWIN)
     g_test_skip("Broken on Darwin");
     return false;
 #else
@@ -59,7 +56,12 @@ test_setup(Test *test)
     g_signal_connect(test->conn, "vnc-auth-failure",
                      G_CALLBACK(on_vnc_auth_failure), NULL);
     vnc_connection_set_auth_type(test->conn, VNC_CONNECTION_AUTH_NONE);
+
+#ifdef WIN32
+    vnc_connection_open_fd(test->conn, _get_osfhandle(pair[0]));
+#else
     vnc_connection_open_fd(test->conn, pair[0]);
+#endif
 
     test->loop = g_main_loop_new(NULL, FALSE);
     return true;
-- 
2.39.2


