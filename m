Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE995879C9
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 11:23:40 +0200 (CEST)
Received: from localhost ([::1]:33706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIo7n-0001fM-L1
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 05:23:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oImhN-0006uA-Bj
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 03:52:17 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:56033)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oImhL-0007bm-Ja
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 03:52:17 -0400
Received: by mail-pj1-x102c.google.com with SMTP id b10so12932806pjq.5
 for <qemu-devel@nongnu.org>; Tue, 02 Aug 2022 00:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Z4zTRtehf6XdB5qciZM/5V8Sk8TNAjRjyBN00vz6ZKY=;
 b=Zw3+APO75m/ccau/2LlKwwJytmiwNSoA+5FnJgD6WQGzBZTS8+DmbD7nsLi1ALpO7D
 hek14y4fNdeWate917a/Wi02nYpwO7uDdB3GbgxkMWi9odrx/CkWQqpe7P2fKRmFLN69
 fnVMNxW5zO3sUCDMOr+utM/YL4WsidD4sIBMBZyiC6SDi80g3mjv7ZSd9zjC5a2vrpB5
 O9q/TVcCg+luIsrwj3umKG/ioBmNYe2KVIfZfsgQP4kI2CJpvEoE+BIBNn9dW9VVoYq8
 T/EM8u7VS7W3BGLSGwvxHDD8Dov+af6Wiwpv72Lyy1rWpQvh4jmyvFS7VS57yxCW/F2m
 4iKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Z4zTRtehf6XdB5qciZM/5V8Sk8TNAjRjyBN00vz6ZKY=;
 b=vD6Rhr/ukLkEbD89nQU+Q4bWQ/JctvgNf6olE8p7VK+i3DqiTFwCCAbyx4JyQeuhAM
 QYe0wj4QkMx3CDPFGQ/FMIq+l+DxNcb83qrirTnV/GuhJBqNlDIS30oIJtcEzKEzTwgE
 +5AqnJ78p4eiVfv2gwFunl8I5Laqvz/304Ttt63J9/djjMq3cI9wwsfgoJ5h5vzSmeWN
 WFUiHC8ZgxQmfgX/c3K4cAuzVM0lBmln1BLbNZ3r/HVn5nDKznq4yz3QWA+XNU+SSknR
 zB3y4R418Ndrw9GgfKoNjQO0UyIaNUqUp5yCbqtn9/hHlV+vWykW5y9spnZ0Z1zrvF9A
 7yPw==
X-Gm-Message-State: ACgBeo26J8k8R0LoM0ZNDu/rZyRjzTLmP/dJ5k0rkthMcVYFFa5k8nRp
 HXWOuKZZT4Dj4RFZPzK6fBOuY6jHALU=
X-Google-Smtp-Source: AA6agR43n4AgSRkLXeSQ04wAFxENFQB8tNUH75zCtrRxoS0Ybz4xzu3n3jX5SV4jYdUHIBD+el4p+A==
X-Received: by 2002:a17:90a:4501:b0:1f4:d8b8:3552 with SMTP id
 u1-20020a17090a450100b001f4d8b83552mr16254608pjg.149.1659426733915; 
 Tue, 02 Aug 2022 00:52:13 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 q19-20020aa79613000000b0052d92ccaad9sm3226098pfg.131.2022.08.02.00.52.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Aug 2022 00:52:13 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v4 4/4] tests/unit: Update test-io-channel-socket.c for Windows
Date: Tue,  2 Aug 2022 15:52:00 +0800
Message-Id: <20220802075200.907360-5-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220802075200.907360-1-bmeng.cn@gmail.com>
References: <20220802075200.907360-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

From: Bin Meng <bin.meng@windriver.com>

Change to dynamically include the test cases by checking AF_UNIX
availability using a new helper socket_check_afunix_support().
With such changes testing on a Windows host can be covered as well.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

Changes in v4:
- introduce a new helper socket_check_afunix_support() to runtime-check
  the availability of AF_UNIX socket, and skip those appropriately

Changes in v2:
- new patch: tests/unit: Update test-io-channel-socket.c for Windows

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
2.34.1


