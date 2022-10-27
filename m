Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05CBF61015A
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 21:16:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo7tG-0005ki-Lw; Thu, 27 Oct 2022 14:46:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oo7sC-0005SR-8m
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:45:03 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oo7s6-0004jT-U0
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:44:59 -0400
Received: by mail-wr1-x42d.google.com with SMTP id bs21so3717074wrb.4
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 11:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sHYyMytvaRwCrcUxnHHFfEwhoSYAHml8PTkMZH1b3Uw=;
 b=i7CMzyk2Q/F/37Y8xk/nuncJNSx1vG9hbjqjaNU7I6xAjqq8xZAyG2rzAF7QhOYz31
 fQk5uEXt6kZMwFWxZzFoatSA1PMhpBhN4q95vOLpoK96TtkLalZ9C41xJcEa8FbKz1IA
 gtrxP9h5VSFTAgOvm8B5sEd4HpKHE+qzqn2xNyAj41f1xNhmDvCvDwzOI8W9FmvXwVUU
 rkbDGrT8zvmGG+Awx9tSLw/TJcy516G7DqQOZrww0PkoGRPxr+nFwuufE1cQxbt478wn
 1WMUyn6hpAHAP/cUC+LJSSAkWs/bkddk0to6SNhYjSAmoA0arjGr/FGQtj8F5taeFRm4
 NQKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sHYyMytvaRwCrcUxnHHFfEwhoSYAHml8PTkMZH1b3Uw=;
 b=KxQEoZPVusoKhHsSCuOBbIBaa+znjSaqZiby3CTHYYYBodKXkxqFX2l0CDLgv7vwkH
 IMhJte2ivIqpB1/P3kqsIwQOYdsLchvUEXB0p+ADRCUGp3qMQ0sLRqLp73MUxARTFG0k
 ivtKTSJq9JjePmRDS8jVTzmj5h2fu4hfELwyImy8sYCtYEXjK56R7emMTxj2bhfDe6r3
 BpzdHIGf6G7zMqDRgv1PtrHbnljeWVDZeorG6p6jzOtp9Y13QlB0ID9/uUkf3xyJCvZh
 SE2rmdT520sHUci8QPVSaTpMh3TQo0NxHijwuGuMejwAKPfKgQ9HscbA2vcLX1WsaVdH
 x5Sw==
X-Gm-Message-State: ACrzQf20edvv4w5tk1Wiookdz/i5mx0ArfFpCtNG9NkBZvdlJtS1hVAF
 ua6zGtn714Gwd4mT4hxfhjIE3Q==
X-Google-Smtp-Source: AMsMyM5g6ltUHGXGv/KzENSfsis9g8fRv/Ewo70qyVogM9Fzq+FSoMxEfJqhZ/MFj6FxSbnkaEdW4g==
X-Received: by 2002:a05:6000:144f:b0:231:2053:ef7c with SMTP id
 v15-20020a056000144f00b002312053ef7cmr32995992wrx.179.1666896293358; 
 Thu, 27 Oct 2022 11:44:53 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 e8-20020adffd08000000b0022e653f5abbsm1770173wrr.69.2022.10.27.11.44.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Oct 2022 11:44:51 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 10C031FFBC;
 Thu, 27 Oct 2022 19:36:40 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Subject: [PATCH  v4 29/30] tests/unit: cleanups for test-io-channel-command
Date: Thu, 27 Oct 2022 19:36:35 +0100
Message-Id: <20221027183637.2772968-30-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221027183637.2772968-1-alex.bennee@linaro.org>
References: <20221027183637.2772968-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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


