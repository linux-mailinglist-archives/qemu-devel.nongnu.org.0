Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D755FC8FD
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 18:15:16 +0200 (CEST)
Received: from localhost ([::1]:53912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oieO2-0006dU-69
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 12:15:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1oieEf-0003Mj-PH
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 12:05:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24287)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1oieER-0005iS-IQ
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 12:05:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665590718;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f3QgzVG/pGCMEd5mQ9yY3MKqQYhbwaOAz4DWMK6cZ8k=;
 b=NTmACPYGPJ/tIvLSo3k2b/a6Qk73GMgyzZQFBfeuyGT7HMf4noI+QlUhyNYo7BGOuafpjE
 G1t1ayiRUmWWKGoEsmR4U8RN+fmncyBgyD5KnD1xOVjbYiC6+VKToYthu4oTPDs0rbIdh4
 2janN7AqXWZhvGAAgyRVsPFR3cIXmjQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-669-ZgdyfamANMaHIsVRGfRXdA-1; Wed, 12 Oct 2022 12:05:17 -0400
X-MC-Unique: ZgdyfamANMaHIsVRGfRXdA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4F95C3814580;
 Wed, 12 Oct 2022 16:05:17 +0000 (UTC)
Received: from localhost (unknown [10.39.208.10])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 630AA1402BDC;
 Wed, 12 Oct 2022 16:05:15 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PULL 7/7] tests/unit: make test-io-channel-command work on win32
Date: Wed, 12 Oct 2022 20:04:44 +0400
Message-Id: <20221012160444.3762795-8-marcandre.lureau@redhat.com>
In-Reply-To: <20221012160444.3762795-1-marcandre.lureau@redhat.com>
References: <20221012160444.3762795-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124;
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

Here are the changes:
- drop tests/ from fifo/pipe path, to avoid directory issues
- use g_find_program() to lookup the socat executable (otherwise we
would need to change ChanneCommand to use G_SPAWN_SEARCH_PATH, and deal
with missing socat differently)
- skip the "echo" test when socat is missing as well

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20221006113657.2656108-7-marcandre.lureau@redhat.com>
---
 tests/unit/test-io-channel-command.c | 37 ++++++++++++++--------------
 1 file changed, 19 insertions(+), 18 deletions(-)

diff --git a/tests/unit/test-io-channel-command.c b/tests/unit/test-io-channel-command.c
index aa09c559cd..7eee939c07 100644
--- a/tests/unit/test-io-channel-command.c
+++ b/tests/unit/test-io-channel-command.c
@@ -24,29 +24,30 @@
 #include "qapi/error.h"
 #include "qemu/module.h"
 
-#ifndef WIN32
+#define TEST_FIFO "test-io-channel-command.fifo"
+
+#define SOCAT_SRC "PIPE:" TEST_FIFO ",wronly"
+#define SOCAT_DST "PIPE:" TEST_FIFO ",rdonly"
+
+static char *socat = NULL;
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
+        socat, "-", SOCAT_SRC, NULL,
     };
     const char *dstargv[] = {
-        "/bin/socat", dstfifo, "-", NULL,
+        socat, SOCAT_DST, "-", NULL,
     };
 
-    unlink(TEST_FIFO);
-    if (access("/bin/socat", X_OK) < 0) {
-        g_test_skip("socat is missing");
+    if (!socat) {
+        g_test_skip("socat is not found in PATH");
         return;
     }
-    if (mkfifo(TEST_FIFO, 0600) < 0) {
-        abort();
-    }
+
+    unlink(TEST_FIFO);
     src = QIO_CHANNEL(qio_channel_command_new_spawn(srcargv,
                                                     O_WRONLY,
                                                     &error_abort));
@@ -81,11 +82,12 @@ static void test_io_channel_command_echo(bool async)
     QIOChannel *ioc;
     QIOChannelTest *test;
     const char *socatargv[] = {
-        "/bin/socat", "-", "-", NULL,
+        socat, "-", "-", NULL,
     };
 
-    if (access("/bin/socat", X_OK) < 0) {
-        return; /* Pretend success if socat is not present */
+    if (!socat) {
+        g_test_skip("socat is not found in PATH");
+        return;
     }
 
     ioc = QIO_CHANNEL(qio_channel_command_new_spawn(socatargv,
@@ -108,7 +110,6 @@ static void test_io_channel_command_echo_sync(void)
 {
     test_io_channel_command_echo(false);
 }
-#endif
 
 int main(int argc, char **argv)
 {
@@ -116,7 +117,8 @@ int main(int argc, char **argv)
 
     g_test_init(&argc, &argv, NULL);
 
-#ifndef WIN32
+    socat = g_find_program_in_path("socat");
+
     g_test_add_func("/io/channel/command/fifo/sync",
                     test_io_channel_command_fifo_sync);
     g_test_add_func("/io/channel/command/fifo/async",
@@ -125,7 +127,6 @@ int main(int argc, char **argv)
                     test_io_channel_command_echo_sync);
     g_test_add_func("/io/channel/command/echo/async",
                     test_io_channel_command_echo_async);
-#endif
 
     return g_test_run();
 }
-- 
2.37.3


