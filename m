Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5319E67408B
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 19:06:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIZHD-0003LW-9y; Thu, 19 Jan 2023 13:04:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pIZH3-0003I9-63
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 13:04:29 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pIZH0-00011B-5g
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 13:04:28 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 l41-20020a05600c1d2900b003daf986faaeso1875993wms.3
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 10:04:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3kS477a0I3Bux/zzw2KohjX48YjyxZLcbfkqW1wVgq8=;
 b=fZizxt6CyzpdQICKNpdkTlblcKoio9LQiXlcr7D6r4myQoQJzivacN+7PUypKIXVNy
 zQxjd5+/PfVI6gH5+qqzTMgY8oJ9CV/rUiMzO/OU3TvdGXy/AWCxRUsuxgDw32dGcjqc
 g2EHxRBZ4i1pSA9RCluw4/Jwg3L9fjwQkpxBPKP8NZ5e9fkDm44PDFMzSiQbxRCvjLFc
 E5Uxy9SnvZLKaL0So/m5DFpw0Oc8VOyVYthyKkEcwMLN0IwTtudgV4wBKYuD/IofWoPa
 fi4d4288SOcWb5kiDJ1xfLXTwnfeCrfaS9mTGd/5HeOJly77pnElkg5UcRmOalqlfTMZ
 iXkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3kS477a0I3Bux/zzw2KohjX48YjyxZLcbfkqW1wVgq8=;
 b=4FugteZq1lcrjvJ65yV/I6FY856SMsn+BnluyjLf7/ok1FCxb571Mi1cWQjvCn+9lI
 jjXb8ZJ4dDMsshk6VRukWDlm53FqdGd7hKq0CefbMk1ogwvI1MFZt/IrlnD/47c10Gt8
 JCrUjEh9LquYPsmOGZiUHsgu4SWyNzyHUgXK9SeLfnJHqCgPoQnfrGm0+uqjtPTNa+Me
 Fs9ikOSflt6EGZyzCLBX8kouvwOaNMk2ksusvw8/pqEbO/yRyh8KdT0shehLrIjipkyd
 0NqTmoQnPXlJbT67kdPKl4x2drdHvLOXweXKF6fMT/Gpp/1R9enYMzbMkEeeC5Ztpb/Z
 yybw==
X-Gm-Message-State: AFqh2kotrW+tuoTJUFslx/2qi049JV5JZyt97qg/gHU4mcdGkjNmc9ng
 47F7f1kvzbG8t0XCJ0fQbGp62g==
X-Google-Smtp-Source: AMrXdXs6Ss6jz6qZKmH6lQNk61KUf2gzVkZo9I1bJF+6GIi8skcwCE1UKVM5LXXAN1+lCEX6UBfEYA==
X-Received: by 2002:a05:600c:3488:b0:3d2:370b:97f4 with SMTP id
 a8-20020a05600c348800b003d2370b97f4mr19769221wmq.16.1674151462430; 
 Thu, 19 Jan 2023 10:04:22 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 s4-20020a05600c384400b003d9862ec435sm5474973wmr.20.2023.01.19.10.04.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jan 2023 10:04:20 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D5E681FFBC;
 Thu, 19 Jan 2023 18:04:19 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Beraldo Leal <bleal@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Bandan Das <bsd@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Cleber Rosa <crosa@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Darren Kenny <darren.kenny@oracle.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, John Snow <jsnow@redhat.com>,
 Ed Maste <emaste@freebsd.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH 04/18] tests/unit: drop hacky race avoidance in
 test-io-channel-command
Date: Thu, 19 Jan 2023 18:04:05 +0000
Message-Id: <20230119180419.30304-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230119180419.30304-1-alex.bennee@linaro.org>
References: <20230119180419.30304-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
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
---
 tests/unit/test-io-channel-command.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

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


