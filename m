Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C0A75AB182
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Sep 2022 15:35:58 +0200 (CEST)
Received: from localhost ([::1]:33178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oU6px-0003fF-ER
	for lists+qemu-devel@lfdr.de; Fri, 02 Sep 2022 09:35:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1oU6VG-0006P1-Tx
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 09:14:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1oU6VF-0001xs-5s
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 09:14:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662124472;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DKsQRbQJVekZAv9r8iJf3OczES+5LL6qa1RDJ5gL6Ys=;
 b=DJGpgXaKBoYhtOg1Qsy21XnNatkD+jlmE0lRCjnlQFbD1P841X4xIybLkYXapMzhF7To2R
 KZ2owfTmoaeNcm6+G70mQtM3CHWPfg4vkUXMlQkV9k35nk+92bG5zsD0cSo4+pNj5rojie
 Xe0L5VPZhkPddC/3a6H9T5p29bIZ8DY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-135-FLQTqvp7OHq0pqW9O8Wvyg-1; Fri, 02 Sep 2022 09:14:29 -0400
X-MC-Unique: FLQTqvp7OHq0pqW9O8Wvyg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0DFF92A2AD74;
 Fri,  2 Sep 2022 13:14:29 +0000 (UTC)
Received: from localhost (unknown [10.39.208.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C7D151121314;
 Fri,  2 Sep 2022 13:14:27 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 bin.meng@windriver.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 3/4] tests/unit: Update test-io-channel-socket.c for Windows
Date: Fri,  2 Sep 2022 17:14:11 +0400
Message-Id: <20220902131412.3125752-4-marcandre.lureau@redhat.com>
In-Reply-To: <20220902131412.3125752-1-marcandre.lureau@redhat.com>
References: <20220902131412.3125752-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

From: Bin Meng <bin.meng@windriver.com>

Change to dynamically include the test cases by checking AF_UNIX
availability using a new helper socket_check_afunix_support().
With such changes testing on a Windows host can be covered as well.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20220802075200.907360-5-bmeng.cn@gmail.com>
---
 tests/unit/socket-helpers.h         |  9 +++++++
 tests/unit/socket-helpers.c         | 16 +++++++++++++
 tests/unit/test-io-channel-socket.c | 37 ++++++++++++++++++-----------
 3 files changed, 48 insertions(+), 14 deletions(-)

diff --git a/tests/unit/socket-helpers.h b/tests/unit/socket-helpers.h
index 512a004811..ed8477ceb3 100644
--- a/tests/unit/socket-helpers.h
+++ b/tests/unit/socket-helpers.h
@@ -32,4 +32,13 @@
  */
 int socket_check_protocol_support(bool *has_ipv4, bool *has_ipv6);
 
+/*
+ * @has_afunix: set to true on return if unix socket support is available
+ *
+ * Check whether unix domain socket support is available for use.
+ * On success, @has_afunix will be set to indicate whether AF_UNIX protocol
+ * is available.
+ */
+void socket_check_afunix_support(bool *has_afunix);
+
 #endif
diff --git a/tests/unit/socket-helpers.c b/tests/unit/socket-helpers.c
index 5af4de513b..eecadf3a3c 100644
--- a/tests/unit/socket-helpers.c
+++ b/tests/unit/socket-helpers.c
@@ -154,3 +154,19 @@ int socket_check_protocol_support(bool *has_ipv4, bool *has_ipv6)
 
     return 0;
 }
+
+void socket_check_afunix_support(bool *has_afunix)
+{
+    int fd;
+
+    fd = socket(PF_UNIX, SOCK_STREAM, 0);
+    closesocket(fd);
+
+#ifdef _WIN32
+    *has_afunix = (fd != (int)INVALID_SOCKET);
+#else
+    *has_afunix = (fd >= 0);
+#endif
+
+    return;
+}
diff --git a/tests/unit/test-io-channel-socket.c b/tests/unit/test-io-channel-socket.c
index 6713886d02..b36a5d972a 100644
--- a/tests/unit/test-io-channel-socket.c
+++ b/tests/unit/test-io-channel-socket.c
@@ -179,10 +179,12 @@ static void test_io_channel(bool async,
         test_io_channel_setup_async(listen_addr, connect_addr,
                                     &srv, &src, &dst);
 
+#ifndef _WIN32
         g_assert(!passFD ||
                  qio_channel_has_feature(src, QIO_CHANNEL_FEATURE_FD_PASS));
         g_assert(!passFD ||
                  qio_channel_has_feature(dst, QIO_CHANNEL_FEATURE_FD_PASS));
+#endif
         g_assert(qio_channel_has_feature(src, QIO_CHANNEL_FEATURE_SHUTDOWN));
         g_assert(qio_channel_has_feature(dst, QIO_CHANNEL_FEATURE_SHUTDOWN));
 
@@ -206,10 +208,12 @@ static void test_io_channel(bool async,
         test_io_channel_setup_async(listen_addr, connect_addr,
                                     &srv, &src, &dst);
 
+#ifndef _WIN32
         g_assert(!passFD ||
                  qio_channel_has_feature(src, QIO_CHANNEL_FEATURE_FD_PASS));
         g_assert(!passFD ||
                  qio_channel_has_feature(dst, QIO_CHANNEL_FEATURE_FD_PASS));
+#endif
         g_assert(qio_channel_has_feature(src, QIO_CHANNEL_FEATURE_SHUTDOWN));
         g_assert(qio_channel_has_feature(dst, QIO_CHANNEL_FEATURE_SHUTDOWN));
 
@@ -236,10 +240,12 @@ static void test_io_channel(bool async,
         test_io_channel_setup_sync(listen_addr, connect_addr,
                                    &srv, &src, &dst);
 
+#ifndef _WIN32
         g_assert(!passFD ||
                  qio_channel_has_feature(src, QIO_CHANNEL_FEATURE_FD_PASS));
         g_assert(!passFD ||
                  qio_channel_has_feature(dst, QIO_CHANNEL_FEATURE_FD_PASS));
+#endif
         g_assert(qio_channel_has_feature(src, QIO_CHANNEL_FEATURE_SHUTDOWN));
         g_assert(qio_channel_has_feature(dst, QIO_CHANNEL_FEATURE_SHUTDOWN));
 
@@ -263,10 +269,12 @@ static void test_io_channel(bool async,
         test_io_channel_setup_sync(listen_addr, connect_addr,
                                    &srv, &src, &dst);
 
+#ifndef _WIN32
         g_assert(!passFD ||
                  qio_channel_has_feature(src, QIO_CHANNEL_FEATURE_FD_PASS));
         g_assert(!passFD ||
                  qio_channel_has_feature(dst, QIO_CHANNEL_FEATURE_FD_PASS));
+#endif
         g_assert(qio_channel_has_feature(src, QIO_CHANNEL_FEATURE_SHUTDOWN));
         g_assert(qio_channel_has_feature(dst, QIO_CHANNEL_FEATURE_SHUTDOWN));
 
@@ -367,7 +375,6 @@ static void test_io_channel_ipv6_async(void)
 }
 
 
-#ifndef _WIN32
 static void test_io_channel_unix(bool async)
 {
     SocketAddress *listen_addr = g_new0(SocketAddress, 1);
@@ -398,6 +405,7 @@ static void test_io_channel_unix_async(void)
     return test_io_channel_unix(true);
 }
 
+#ifndef _WIN32
 static void test_io_channel_unix_fd_pass(void)
 {
     SocketAddress *listen_addr = g_new0(SocketAddress, 1);
@@ -491,6 +499,7 @@ static void test_io_channel_unix_fd_pass(void)
     }
     g_free(fdrecv);
 }
+#endif /* _WIN32 */
 
 static void test_io_channel_unix_listen_cleanup(void)
 {
@@ -522,9 +531,6 @@ static void test_io_channel_unix_listen_cleanup(void)
     unlink(TEST_SOCKET);
 }
 
-#endif /* _WIN32 */
-
-
 static void test_io_channel_ipv4_fd(void)
 {
     QIOChannel *ioc;
@@ -555,7 +561,7 @@ static void test_io_channel_ipv4_fd(void)
 
 int main(int argc, char **argv)
 {
-    bool has_ipv4, has_ipv6;
+    bool has_ipv4, has_ipv6, has_afunix;
 
     module_call_init(MODULE_INIT_QOM);
     qemu_init_main_loop(&error_abort);
@@ -588,16 +594,19 @@ int main(int argc, char **argv)
                         test_io_channel_ipv6_async);
     }
 
+    socket_check_afunix_support(&has_afunix);
+    if (has_afunix) {
+        g_test_add_func("/io/channel/socket/unix-sync",
+                        test_io_channel_unix_sync);
+        g_test_add_func("/io/channel/socket/unix-async",
+                        test_io_channel_unix_async);
 #ifndef _WIN32
-    g_test_add_func("/io/channel/socket/unix-sync",
-                    test_io_channel_unix_sync);
-    g_test_add_func("/io/channel/socket/unix-async",
-                    test_io_channel_unix_async);
-    g_test_add_func("/io/channel/socket/unix-fd-pass",
-                    test_io_channel_unix_fd_pass);
-    g_test_add_func("/io/channel/socket/unix-listen-cleanup",
-                    test_io_channel_unix_listen_cleanup);
-#endif /* _WIN32 */
+        g_test_add_func("/io/channel/socket/unix-fd-pass",
+                        test_io_channel_unix_fd_pass);
+#endif
+        g_test_add_func("/io/channel/socket/unix-listen-cleanup",
+                        test_io_channel_unix_listen_cleanup);
+    }
 
 end:
     return g_test_run();
-- 
2.37.2


