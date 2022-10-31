Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 856A76137CB
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 14:23:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opUia-0005Mj-3N; Mon, 31 Oct 2022 09:20:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1opUi1-0003JZ-Hx
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 09:20:09 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1opUhr-0005S7-JQ
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 09:20:09 -0400
Received: by mail-wr1-x435.google.com with SMTP id k8so15976332wrh.1
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 06:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=38CIqeK6tAYrMp96yOEjbU4GfBGml0abO/Zm0V1JKyw=;
 b=i3yUo005Q9AZdYSkRkt2ilYEugHuZPjzLyaP5L7wRCcGJMGQAdXeOt9Ez63H84afO7
 YM6EsEdDMQT+DRLUf6U1ZfLdio1lSup5bsmR07mDrJqQotJkyco+lW74ApGBsKFsG/Sh
 kko3fRWWK1wn6LdE4aTgupilZiJfQej7MEKbIdCQ4fyR6X4dps2TBFZhQNSo62YSJhfJ
 GeUdM64cY/5/UrO3/nGzbdZWZ/F58o51wJb/L/zjZMnaDCrBd1c0kmx/MCBMrChnb4E9
 LiUfsCPPD97UMm3F632IYAUbLQEKwdmqf9y5J3C1N0/b+rvH5rwHCHaIuD/dFfPmr6PD
 +dlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=38CIqeK6tAYrMp96yOEjbU4GfBGml0abO/Zm0V1JKyw=;
 b=GsizgXpPH0HSFi5ZkmUSNnZSrnSSpGaRCz97N/nquCrimtzJrHFkCeLArCrb9FlVAN
 3SJghHJm9twLKg5R1p9u/y73Uapz6xDuvAgvjOMQC/ppwFcsicJLGCQB6wLDCfmQoJMD
 cXliBBrAPaH0DtpSLdyrqbDdxGrNqXUPz10M1VeVjLSrozQ1yM+04v/WZEZKAfVlxZPR
 54cmR7rHpE5aOo8DEkNRZZ4SuNMXpkQP+i+ESs4aihzzmCNhTUF0ctbZhO7lr/TXNjTx
 wO6I7ljJygMirt7W1xerOPv/oEs6RfpcZffAGsbrue6xHq0ssL/lrITcmFXdxIrikIJs
 WJ4w==
X-Gm-Message-State: ACrzQf0rnGq2+3EUWu8bHx40Bv7wg5E5F08e7FBXJISDPLXGfbceqSvB
 R6y4VK3JqOQz+ZBV1tFdfR2WJg==
X-Google-Smtp-Source: AMsMyM5voTHwV/+/EG3q6DmdXP3gBshoyh2heZe9VM87Q+88kFUUIKDX/t4PPrjqErITbPs3Y3fP4g==
X-Received: by 2002:a5d:588f:0:b0:231:c661:5cee with SMTP id
 n15-20020a5d588f000000b00231c6615ceemr8386955wrf.18.1667222397585; 
 Mon, 31 Oct 2022 06:19:57 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 p11-20020a05600c468b00b003cf75213bb9sm1771353wmo.8.2022.10.31.06.19.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 06:19:54 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C95731FFD3;
 Mon, 31 Oct 2022 13:10:13 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Subject: [PULL 30/31] tests/unit: cleanups for test-io-channel-command
Date: Mon, 31 Oct 2022 13:10:09 +0000
Message-Id: <20221031131010.682984-31-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221031131010.682984-1-alex.bennee@linaro.org>
References: <20221031131010.682984-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

This test is hanging under heavy load when the two socats race while
trying to create the socket. I've tried various approaches to avoid
the race but it seems "creat=0" won't stop socat trying to create a
pipe if it executes first. In the end I just use a small sleep which
seems to be reliable enough on the load situations I've tried.

While I was there I also properly created a tmpdir for the socket to
live in which is cleaned up at the end of the test.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>
Cc: Marc-André Lureau <marcandre.lureau@redhat.com>
Cc: Juan Quintela <quintela@redhat.com>
Message-Id: <20221027183637.2772968-30-alex.bennee@linaro.org>

diff --git a/tests/unit/test-io-channel-command.c b/tests/unit/test-io-channel-command.c
index 7eee939c07..43e29c8cfb 100644
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
+    src = QIO_CHANNEL(qio_channel_command_new_spawn((const char **) srcargv,
                                                     O_WRONLY,
                                                     &error_abort));
-    dst = QIO_CHANNEL(qio_channel_command_new_spawn(dstargv,
+    /* try to avoid a race to create the socket */
+    g_usleep(1000);
+
+    dst = QIO_CHANNEL(qio_channel_command_new_spawn((const char **) dstargv,
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


