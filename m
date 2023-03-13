Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6FE6B76E6
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 12:53:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbgcl-00081s-MO; Mon, 13 Mar 2023 07:45:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pbgcb-0007bw-Df
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 07:45:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pbgcR-0004AE-KN
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 07:45:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678707935;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R25bg50OqmzQ3Y5wEs/8TI7A4DH0Jw/sYrrM0K5yItY=;
 b=fzskv1P4ArEP6GnvNCVfpcn2SJc8Wemb1YcukDPNkQ/HUwaIaOVPtRmt0TDIgf70y+gRwu
 cMmzSM8DesJuZONb7j/rVuqW/62WjtRGGDWCeuqEI+R5gVa4Zssg/cwcqOVk70Ds0/4/Bi
 H6b9tjAL7eNguE1Bg1ZW3J0qWaQv3Js=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-28-kQZA9i1XMh-k56y4L3HaIg-1; Mon, 13 Mar 2023 07:45:31 -0400
X-MC-Unique: kQZA9i1XMh-k56y4L3HaIg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4344F1C04324;
 Mon, 13 Mar 2023 11:45:31 +0000 (UTC)
Received: from localhost (unknown [10.39.208.8])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4A2734042AC3;
 Mon, 13 Mar 2023 11:45:29 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Joel Stanley <joel@jms.id.au>,
 Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, Eric Blake <eblake@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Michael Roth <michael.roth@amd.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>, Fam Zheng <fam@euphon.net>,
 Hanna Reitz <hreitz@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL 24/25] qtest: enable vnc-display test on win32
Date: Mon, 13 Mar 2023 15:43:34 +0400
Message-Id: <20230313114335.424093-25-marcandre.lureau@redhat.com>
In-Reply-To: <20230313114335.424093-1-marcandre.lureau@redhat.com>
References: <20230313114335.424093-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124;
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
Message-Id: <20230306122751.2355515-11-marcandre.lureau@redhat.com>
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


