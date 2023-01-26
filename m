Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B6167C9D2
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 12:25:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL0LN-0001yT-N6; Thu, 26 Jan 2023 06:23:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pL0LJ-0001cS-Hu
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 06:22:57 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pL0LG-0003eA-UX
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 06:22:57 -0500
Received: by mail-wr1-x435.google.com with SMTP id m14so968517wrg.13
 for <qemu-devel@nongnu.org>; Thu, 26 Jan 2023 03:22:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+C92sq0vWAUt4fUXNA2VhVXJ53Co9AL3jOyRa4BuHYE=;
 b=XNQa75eNRRyRVUa2eqZ+DIneWPXfRxo4L9I4FYUsBzIOEs4iTsYguVbK27tS/SW/93
 QbPKv6Cb/vDxisxOe2Wcu8HBnElISEZEUsI+Ise3WthcM9IBPZHEh7KZpJf+XQQBYJy0
 rKJgkLb6y04DdcS+fQs3987Gsb5abneRRAAcyujMYQI5UYSzJFFsZZBKZxXblGmxPxYi
 4TCckz1+9zE6ijYPv+daIJLlhpclrYRm7YDPNPJIMfyxbQE4sogzu/q4Vw0x3Sk3M64v
 4XjoIEc/0EnO2MXToFx4/nnZUZm3a2ugLPDfaJSZZEVJAHpShL1KUvyk4yoimkLdJuSx
 c62Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+C92sq0vWAUt4fUXNA2VhVXJ53Co9AL3jOyRa4BuHYE=;
 b=uu3bfiiijWWV1ztWt5HfvLya3P/3vbfNWQgEYjj0mVbNgK4vCctZT3zVDxpJYZWhjR
 zfI9iPHRuMhUMOQwpluXmgbpIQYA0X7Ldwvp550ZdxxpmBhi6OrqEGBS4XvwcDN4ryyf
 pUHeAFGDEUDI1kM6IweQ50+XiEyJcLUtotq5dYz/jbZNPhKUVBa7KEjrDmy+pHK07DcT
 DF2zOi3Rhg6rgpMU+nHHfINMT30hq/q+56+6Yh3i4PIugs1BznGs6bjrMIa8CSF0kd4i
 TKGOnxDl/u6S0k7F/fmGYlnR4W9GnHs8jvRF1o7XehgtUNkhltkPGk6LSSSQHLYz/b86
 zl9A==
X-Gm-Message-State: AFqh2kqq3Bgn7wbejbd6ylJqMhP6aEiUVbgLAA7SOjvXdkS1WrDdaesA
 iADIpKw8SbKByBRQrMMnWmIFsw==
X-Google-Smtp-Source: AMrXdXtxBmGwCGIjCFueZ9l48uLJB90o+YypT7C6E8gmLU8QQxuPSDu9DYmHATshYD1VlBuP3APD1w==
X-Received: by 2002:adf:f4ca:0:b0:250:779a:7391 with SMTP id
 h10-20020adff4ca000000b00250779a7391mr30981654wrp.47.1674732173429; 
 Thu, 26 Jan 2023 03:22:53 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 v1-20020a5d6781000000b002b9b9445149sm1225985wru.54.2023.01.26.03.22.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 03:22:53 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BE9D71FFBC;
 Thu, 26 Jan 2023 11:22:51 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PULL 04/35] tests/unit: drop hacky race avoidance in
 test-io-channel-command
Date: Thu, 26 Jan 2023 11:22:19 +0000
Message-Id: <20230126112250.2584701-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230126112250.2584701-1-alex.bennee@linaro.org>
References: <20230126112250.2584701-1-alex.bennee@linaro.org>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

We don't need to play timing games to ensure one socat wins over the
other, just create the fifo they both can use before spawning the
processes. However in the process we need to disable two tests for
Windows platforms as we don't have an abstraction for mkfifo().

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1403
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20230124180127.1881110-5-alex.bennee@linaro.org>

diff --git a/tests/unit/test-io-channel-command.c b/tests/unit/test-io-channel-command.c
index 19f72eab96..425e2f5594 100644
--- a/tests/unit/test-io-channel-command.c
+++ b/tests/unit/test-io-channel-command.c
@@ -20,6 +20,8 @@
 
 #include "qemu/osdep.h"
 #include <glib/gstdio.h>
+#include <sys/types.h>
+#include <sys/stat.h>
 #include "io/channel-command.h"
 #include "io-channel-helpers.h"
 #include "qapi/error.h"
@@ -29,6 +31,7 @@
 
 static char *socat = NULL;
 
+#ifndef _WIN32
 static void test_io_channel_command_fifo(bool async)
 {
     g_autofree gchar *tmpdir = g_dir_make_tmp("qemu-test-io-channel.XXXXXX", NULL);
@@ -40,12 +43,13 @@ static void test_io_channel_command_fifo(bool async)
     QIOChannel *src, *dst;
     QIOChannelTest *test;
 
+    if (mkfifo(fifo, 0600)) {
+        g_error("mkfifo: %s", strerror(errno));
+    }
+
     src = QIO_CHANNEL(qio_channel_command_new_spawn((const char **) srcargv,
                                                     O_WRONLY,
                                                     &error_abort));
-    /* try to avoid a race to create the socket */
-    g_usleep(1000);
-
     dst = QIO_CHANNEL(qio_channel_command_new_spawn((const char **) dstargv,
                                                     O_RDONLY,
                                                     &error_abort));
@@ -60,7 +64,6 @@ static void test_io_channel_command_fifo(bool async)
     g_rmdir(tmpdir);
 }
 
-
 static void test_io_channel_command_fifo_async(void)
 {
     if (!socat) {
@@ -80,6 +83,7 @@ static void test_io_channel_command_fifo_sync(void)
 
     test_io_channel_command_fifo(false);
 }
+#endif
 
 
 static void test_io_channel_command_echo(bool async)
@@ -124,10 +128,12 @@ int main(int argc, char **argv)
 
     socat = g_find_program_in_path("socat");
 
+#ifndef _WIN32
     g_test_add_func("/io/channel/command/fifo/sync",
                     test_io_channel_command_fifo_sync);
     g_test_add_func("/io/channel/command/fifo/async",
                     test_io_channel_command_fifo_async);
+#endif
     g_test_add_func("/io/channel/command/echo/sync",
                     test_io_channel_command_echo_sync);
     g_test_add_func("/io/channel/command/echo/async",
-- 
2.34.1


