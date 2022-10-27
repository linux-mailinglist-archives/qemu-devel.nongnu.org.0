Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6DD160FA57
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 16:24:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo3io-0007P2-Hn; Thu, 27 Oct 2022 10:19:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oo3iI-00079B-UY
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 10:18:33 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oo3iE-0007rM-F3
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 10:18:30 -0400
Received: by mail-wm1-x335.google.com with SMTP id y10so1150582wma.0
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 07:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=sHYyMytvaRwCrcUxnHHFfEwhoSYAHml8PTkMZH1b3Uw=;
 b=s0SQQT2W7t4NgUVAG2OcZemaN6JCVGChS9WW6wQBcHaT1BBVDIztRC43QT1uOVcOIe
 YLsTDMcutIanFkR7VyXP5nrdrKtay0JUoFMKpw0K/ARCvnWl7HxtCxKt670prxxboM/1
 3YlwA0u+k89TBHjHy13Maeo1F/gt8Xl/5Q8ZvNHhpAr5hkgwSK0tF2HuQYfOOpknhM5t
 iFGFa2SdroS5WhpFgToH8Rsm0Gz4U9UJqy/homfcxueu5sClQT0jOCCrwbvGZrzlaNnX
 7LxKHJfNx2FWZRk/MGGcEqWp9YkEsTaDUYk9hOg6xvxUva0aubrBoX57/vArM+XcMT+H
 966A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sHYyMytvaRwCrcUxnHHFfEwhoSYAHml8PTkMZH1b3Uw=;
 b=DAdBdF7RHzOx/FLjC6XBavwqyiCyaUhstnpeB9kH3LYVzgVuFBh3EYNEO6WxDkk9zq
 TtE79nomIGdllaPwmyywwe6y3aTLNRpeTYU5geqBuXnD9lWgh4r/Zjshh6oDeM3H2y/A
 aaHNCJavFkjpHCj7bzCcuDvZQbxTAX2LCpMFIIdXIabpu2GEctsFKO6T89lWPWGyx12j
 UWwwDfvb5p9tqiGdan1Gqnz4Fg6sQglIxUKTX4ELdvfKjVeWiiwSh1bdBYXurC27xZkh
 3x83iPee1fQOl+wm5mb5pbMUG5VVlvSWZiA/BKCuLV+0U8ORFVKfYt0uUBbP1KRtfOyU
 AlWw==
X-Gm-Message-State: ACrzQf1Bfw25L+/7s2I0ZV28PniyUn5j666eM7LAhs0ywr52PpsGMNcg
 n3XZ0/8NvsYmph3/HLdz0uILNw==
X-Google-Smtp-Source: AMsMyM66n6kOVtqW+J5K5OxgBfIEkxVCq899u0YDUV8Y1ttLpS9DGmkqQefVpGKusWAcMx5zvmKrOQ==
X-Received: by 2002:a1c:7215:0:b0:3c7:130c:a77f with SMTP id
 n21-20020a1c7215000000b003c7130ca77fmr6313784wmc.151.1666880299527; 
 Thu, 27 Oct 2022 07:18:19 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 h7-20020a5d4307000000b002366e3f1497sm1307155wrq.6.2022.10.27.07.18.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Oct 2022 07:18:19 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id AAAAF1FFB7;
 Thu, 27 Oct 2022 15:18:18 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Subject: [RFC PATCH] tests/unit: cleanups for test-io-channel-command
Date: Thu, 27 Oct 2022 15:18:15 +0100
Message-Id: <20221027141815.2571621-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This test is hanging under heavy load when the two socats race while
trying to create the socket. I've tried various approaches to avoid
the race but it seems "creat=0" won't stop socat trying to create a
pipe if it executes first. In the end I just use a small sleep which
seems to be reliable enough on the load situations I've tried.

While I was there I also properly created a tmpdir for the socket to
live in which is cleaned up at the end of the test.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Thomas Huth <thuth@redhat.com>
Cc: Daniel P. Berrangé <berrange@redhat.com>
Cc: Marc-André Lureau <marcandre.lureau@redhat.com>
Cc: Juan Quintela <quintela@redhat.com>
---
 tests/unit/test-io-channel-command.c | 45 +++++++++++++++++-----------
 1 file changed, 28 insertions(+), 17 deletions(-)

diff --git a/tests/unit/test-io-channel-command.c b/tests/unit/test-io-channel-command.c
index 7eee939c07..54bb0f139a 100644
--- a/tests/unit/test-io-channel-command.c
+++ b/tests/unit/test-io-channel-command.c
@@ -19,6 +19,7 @@
  */
 
 #include "qemu/osdep.h"
+#include <glib/gstdio.h>
 #include "io/channel-command.h"
 #include "io-channel-helpers.h"
 #include "qapi/error.h"
@@ -26,32 +27,32 @@
 
 #define TEST_FIFO "test-io-channel-command.fifo"
 
-#define SOCAT_SRC "PIPE:" TEST_FIFO ",wronly"
-#define SOCAT_DST "PIPE:" TEST_FIFO ",rdonly"
-
 static char *socat = NULL;
 
 static void test_io_channel_command_fifo(bool async)
 {
+    g_autofree gchar *tmpdir = g_dir_make_tmp("qemu-test-io-channel.XXXXXX", NULL);
+    g_autofree gchar *fifo = g_strdup_printf("%s/%s", tmpdir, TEST_FIFO);
+    g_autoptr(GString) srcargs = g_string_new(socat);
+    g_autoptr(GString) dstargs = g_string_new(socat);
+    g_auto(GStrv) srcargv;
+    g_auto(GStrv) dstargv;
     QIOChannel *src, *dst;
     QIOChannelTest *test;
-    const char *srcargv[] = {
-        socat, "-", SOCAT_SRC, NULL,
-    };
-    const char *dstargv[] = {
-        socat, SOCAT_DST, "-", NULL,
-    };
 
-    if (!socat) {
-        g_test_skip("socat is not found in PATH");
-        return;
-    }
+    g_string_append_printf(srcargs, " - PIPE:%s,wronly", fifo);
+    g_string_append_printf(dstargs, " PIPE:%s,rdonly -", fifo);
+
+    srcargv = g_strsplit(srcargs->str, " ", -1);
+    dstargv = g_strsplit(dstargs->str, " ", -1);
 
-    unlink(TEST_FIFO);
-    src = QIO_CHANNEL(qio_channel_command_new_spawn(srcargv,
+    src = QIO_CHANNEL(qio_channel_command_new_spawn((const char**) srcargv,
                                                     O_WRONLY,
                                                     &error_abort));
-    dst = QIO_CHANNEL(qio_channel_command_new_spawn(dstargv,
+    /* try to avoid a race to create the socket */
+    g_usleep(1000);
+
+    dst = QIO_CHANNEL(qio_channel_command_new_spawn((const char**) dstargv,
                                                     O_RDONLY,
                                                     &error_abort));
 
@@ -62,17 +63,27 @@ static void test_io_channel_command_fifo(bool async)
     object_unref(OBJECT(src));
     object_unref(OBJECT(dst));
 
-    unlink(TEST_FIFO);
+    g_rmdir(tmpdir);
 }
 
 
 static void test_io_channel_command_fifo_async(void)
 {
+    if (!socat) {
+        g_test_skip("socat is not found in PATH");
+        return;
+    }
+
     test_io_channel_command_fifo(true);
 }
 
 static void test_io_channel_command_fifo_sync(void)
 {
+    if (!socat) {
+        g_test_skip("socat is not found in PATH");
+        return;
+    }
+
     test_io_channel_command_fifo(false);
 }
 
-- 
2.34.1


