Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61EF65AADBE
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Sep 2022 13:33:16 +0200 (CEST)
Received: from localhost ([::1]:58342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oU4v7-0005Di-45
	for lists+qemu-devel@lfdr.de; Fri, 02 Sep 2022 07:33:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1oU4hm-0001IG-60
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 07:19:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28379)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1oU4hk-0006lr-LJ
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 07:19:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662117559;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/PFdD2R5sOXGWoM5/LIPX/Ihv6N1EQmtuPD8yP7u8cs=;
 b=ar7YiCVZf1uFEbC/Cl8ypQOiuyhCYHPypeex5DiaHs4Ckq6jHYumrn6Vx8lsjKDeUg0Q1T
 wDKdUmpVBpXxbAetFa9QOmhDOSWeFE4r3R3Ni+/th3QaOiYrX+Cm8RSMr6OVKIeTT5CFO4
 b8DeaANmKfF1y7wTGdY/wOrkZLYC4iA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-370-VU-D4hs1N8q32H3fzUYmSQ-1; Fri, 02 Sep 2022 07:19:18 -0400
X-MC-Unique: VU-D4hs1N8q32H3fzUYmSQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 54C3E801755
 for <qemu-devel@nongnu.org>; Fri,  2 Sep 2022 11:19:18 +0000 (UTC)
Received: from localhost (unknown [10.39.208.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 64BED2026D4C;
 Fri,  2 Sep 2022 11:19:17 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v2 3/3] tests/unit: make test-io-channel-command work on win32
Date: Fri,  2 Sep 2022 15:19:00 +0400
Message-Id: <20220902111900.3029260-4-marcandre.lureau@redhat.com>
In-Reply-To: <20220902111900.3029260-1-marcandre.lureau@redhat.com>
References: <20220902111900.3029260-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

This has been tested under msys2 & windows 11. I haven't tried to make
it work with other environments yet, but that should be enough to
validate the channel-command implementation anyway.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 tests/unit/test-io-channel-command.c | 31 +++++++++++++++++-----------
 1 file changed, 19 insertions(+), 12 deletions(-)

diff --git a/tests/unit/test-io-channel-command.c b/tests/unit/test-io-channel-command.c
index 99056e07c0..56dcc0be19 100644
--- a/tests/unit/test-io-channel-command.c
+++ b/tests/unit/test-io-channel-command.c
@@ -24,28 +24,38 @@
 #include "qapi/error.h"
 #include "qemu/module.h"
 
-#ifndef WIN32
+#define TEST_FIFO "tests/test-io-channel-command.fifo"
+
+#ifdef WIN32
+#define SOCAT "/bin/socat.exe"
+#define SOCAT_SRC "PIPE:" TEST_FIFO ",wronly"
+#define SOCAT_DST "PIPE:" TEST_FIFO ",rdonly"
+#else
+#define SOCAT "/bin/socat"
+#define SOCAT_SRC "UNIX-LISTEN:" TEST_FIFO
+#define SOCAT_DST "UNIX-CONNECT:" TEST_FIFO
+#endif
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
+        SOCAT, "-", SOCAT_SRC, NULL,
     };
     const char *dstargv[] = {
-        "/bin/socat", dstfifo, "-", NULL,
+        SOCAT, SOCAT_DST, "-", NULL,
     };
 
     unlink(TEST_FIFO);
-    if (access("/bin/socat", X_OK) < 0) {
+    if (access(SOCAT, X_OK) < 0) {
         return; /* Pretend success if socat is not present */
     }
+#ifndef WIN32
     if (mkfifo(TEST_FIFO, 0600) < 0) {
         abort();
     }
+#endif
     src = QIO_CHANNEL(qio_channel_command_new_spawn(srcargv,
                                                     O_WRONLY,
                                                     &error_abort));
@@ -80,10 +90,10 @@ static void test_io_channel_command_echo(bool async)
     QIOChannel *ioc;
     QIOChannelTest *test;
     const char *socatargv[] = {
-        "/bin/socat", "-", "-", NULL,
+        SOCAT, "-", "-", NULL,
     };
 
-    if (access("/bin/socat", X_OK) < 0) {
+    if (access(SOCAT, X_OK) < 0) {
         return; /* Pretend success if socat is not present */
     }
 
@@ -107,7 +117,6 @@ static void test_io_channel_command_echo_sync(void)
 {
     test_io_channel_command_echo(false);
 }
-#endif
 
 int main(int argc, char **argv)
 {
@@ -115,7 +124,6 @@ int main(int argc, char **argv)
 
     g_test_init(&argc, &argv, NULL);
 
-#ifndef WIN32
     g_test_add_func("/io/channel/command/fifo/sync",
                     test_io_channel_command_fifo_sync);
     g_test_add_func("/io/channel/command/fifo/async",
@@ -124,7 +132,6 @@ int main(int argc, char **argv)
                     test_io_channel_command_echo_sync);
     g_test_add_func("/io/channel/command/echo/async",
                     test_io_channel_command_echo_async);
-#endif
 
     return g_test_run();
 }
-- 
2.37.2


