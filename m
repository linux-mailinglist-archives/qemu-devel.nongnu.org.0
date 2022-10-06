Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 178015F62A3
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 10:29:35 +0200 (CEST)
Received: from localhost ([::1]:36436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogMG5-0003ED-Sq
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 04:29:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1ogLzv-0006QR-J1
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 04:12:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29117)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1ogLzt-0002pI-Tx
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 04:12:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665043969;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e5k/wLn7IEccbADJ5zePlBZPAqaHVDssqFVHapiNmq8=;
 b=AuHh9cI/LJxzUztzWCp7H1rpPED5TjbjuTMOrHQvw+E0Yt4iM32vVkMR0Tq8q0lksRYXxa
 AzwiK13K+wobjlqmqPCqz5kFGqFvtPShQ/6YqJY4K71FrUhFqo/6d96pE1d+YOtWS2i5Jn
 12HiZYMsk1JhV3xy4l8UMikRRnk7M5s=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-516-fxVLurNWMlCR1ZU8XpqHog-1; Thu, 06 Oct 2022 04:12:47 -0400
X-MC-Unique: fxVLurNWMlCR1ZU8XpqHog-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 970443811F28
 for <qemu-devel@nongnu.org>; Thu,  6 Oct 2022 08:12:47 +0000 (UTC)
Received: from localhost (unknown [10.39.208.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8E54E2166B2E;
 Thu,  6 Oct 2022 08:12:46 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v3 5/5] tests/unit: make test-io-channel-command work on win32
Date: Thu,  6 Oct 2022 12:12:22 +0400
Message-Id: <20221006081222.2606746-6-marcandre.lureau@redhat.com>
In-Reply-To: <20221006081222.2606746-1-marcandre.lureau@redhat.com>
References: <20221006081222.2606746-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

This has been tested under msys2 & windows 11. I haven't tried to make
it work with other environments yet, but that should be enough to
validate the channel-command implementation anyway.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 tests/unit/test-io-channel-command.c | 32 ++++++++++++----------------
 tests/unit/meson.build               |  2 +-
 2 files changed, 15 insertions(+), 19 deletions(-)

diff --git a/tests/unit/test-io-channel-command.c b/tests/unit/test-io-channel-command.c
index aa09c559cd..be98c3452a 100644
--- a/tests/unit/test-io-channel-command.c
+++ b/tests/unit/test-io-channel-command.c
@@ -24,29 +24,27 @@
 #include "qapi/error.h"
 #include "qemu/module.h"
 
-#ifndef WIN32
+#define TEST_PATH "test-io-channel-command.fifo"
+
+#define SOCAT_SRC "PIPE:" TEST_PATH ",wronly"
+#define SOCAT_DST "PIPE:" TEST_PATH ",rdonly"
+
 static void test_io_channel_command_fifo(bool async)
 {
-#define TEST_FIFO "tests/test-io-channel-command.fifo"
     QIOChannel *src, *dst;
     QIOChannelTest *test;
-    const char *srcfifo = "PIPE:" TEST_FIFO ",wronly";
-    const char *dstfifo = "PIPE:" TEST_FIFO ",rdonly";
     const char *srcargv[] = {
-        "/bin/socat", "-", srcfifo, NULL,
+        g_getenv("SOCAT"), "-", SOCAT_SRC, NULL,
     };
     const char *dstargv[] = {
-        "/bin/socat", dstfifo, "-", NULL,
+        g_getenv("SOCAT"), SOCAT_DST, "-", NULL,
     };
 
-    unlink(TEST_FIFO);
-    if (access("/bin/socat", X_OK) < 0) {
+    unlink(TEST_PATH);
+    if (!g_file_test(g_getenv("SOCAT"), G_FILE_TEST_IS_EXECUTABLE)) {
         g_test_skip("socat is missing");
         return;
     }
-    if (mkfifo(TEST_FIFO, 0600) < 0) {
-        abort();
-    }
     src = QIO_CHANNEL(qio_channel_command_new_spawn(srcargv,
                                                     O_WRONLY,
                                                     &error_abort));
@@ -61,7 +59,7 @@ static void test_io_channel_command_fifo(bool async)
     object_unref(OBJECT(src));
     object_unref(OBJECT(dst));
 
-    unlink(TEST_FIFO);
+    unlink(TEST_PATH);
 }
 
 
@@ -81,11 +79,12 @@ static void test_io_channel_command_echo(bool async)
     QIOChannel *ioc;
     QIOChannelTest *test;
     const char *socatargv[] = {
-        "/bin/socat", "-", "-", NULL,
+        g_getenv("SOCAT"), "-", "-", NULL,
     };
 
-    if (access("/bin/socat", X_OK) < 0) {
-        return; /* Pretend success if socat is not present */
+    if (!g_file_test(g_getenv("SOCAT"), G_FILE_TEST_IS_EXECUTABLE)) {
+        g_test_skip("socat is missing");
+        return;
     }
 
     ioc = QIO_CHANNEL(qio_channel_command_new_spawn(socatargv,
@@ -108,7 +107,6 @@ static void test_io_channel_command_echo_sync(void)
 {
     test_io_channel_command_echo(false);
 }
-#endif
 
 int main(int argc, char **argv)
 {
@@ -116,7 +114,6 @@ int main(int argc, char **argv)
 
     g_test_init(&argc, &argv, NULL);
 
-#ifndef WIN32
     g_test_add_func("/io/channel/command/fifo/sync",
                     test_io_channel_command_fifo_sync);
     g_test_add_func("/io/channel/command/fifo/async",
@@ -125,7 +122,6 @@ int main(int argc, char **argv)
                     test_io_channel_command_echo_sync);
     g_test_add_func("/io/channel/command/echo/async",
                     test_io_channel_command_echo_async);
-#endif
 
     return g_test_run();
 }
diff --git a/tests/unit/meson.build b/tests/unit/meson.build
index b497a41378..42e8218ac2 100644
--- a/tests/unit/meson.build
+++ b/tests/unit/meson.build
@@ -1,4 +1,3 @@
-
 testblock = declare_dependency(dependencies: [block], sources: 'iothread.c')
 
 tests = {
@@ -164,6 +163,7 @@ endif
 test_env = environment()
 test_env.set('G_TEST_SRCDIR', meson.current_source_dir())
 test_env.set('G_TEST_BUILDDIR', meson.current_build_dir())
+test_env.set('SOCAT', find_program('socat').full_path())
 
 slow_tests = {
   'test-crypto-tlscredsx509': 45,
-- 
2.37.3


