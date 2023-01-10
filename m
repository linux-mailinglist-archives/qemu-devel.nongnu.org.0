Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 197EC6647F9
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 19:00:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFIb0-0003NK-MH; Tue, 10 Jan 2023 12:39:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pFIaz-0003MD-6B
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 12:39:33 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pFIav-0001Dl-DY
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 12:39:32 -0500
Received: by mail-wr1-x431.google.com with SMTP id h16so12575073wrz.12
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 09:39:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OUd9ildWmy9isAgbHX/TLo9qeZ901KMhVb24iOZZFpk=;
 b=AsHCXpfDnJjoLLAo8LppSfgbnWkCyA1lbhjMbu2/93s6q1Lt/GZRTkgsLhYJmJzbh4
 d3mWkKAzrWgBKS8NvspK2gOQh4uvtipamOdQKJsUA9mn6ihdHVqes12UOdBlD9cI1v6Y
 Hg4Psok8FwPbtdgvl8GQdc5Y2QGAv9PlOR7L8dkz4rSSga+n/vae9hNqaLI89/1WMFZ4
 R5nmoNRqAKyHOI6/Nz1yMQCraVaDCE4W2abUvMPB/1QLY6ppazaK/bsckMbeCE41qMRn
 t7lw6dVmLlh03vCymOvbtKxfBIcj92itSJffZhr67cYBDuMO+gf0NRqhqyLL8T0BMRah
 pD6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OUd9ildWmy9isAgbHX/TLo9qeZ901KMhVb24iOZZFpk=;
 b=EoclZtWvBu80ou5Hg+C6VWH043DY4ZDSygKg5PS9G+YxLWml1dAFESCs7IITKUawu/
 QSxjnpcQS22ceSYpBBZ8Y5sTEjOVgK2aYdDoCEyBk745pgwHWN9B/VLC/EHvXibZYNBl
 hOgBVyrE56VHDYPLIQAI72orPBsvv8RAqhgKaNJ+4MhYbueksgqRuhN5oc1BC8k7nE65
 OpIBtVz+Q97p1yKZzL4uS+lR8HQuY1tclzY5WQL+iCKFhx5DnVGqqCIUtEas4/PRC2cL
 faRHcdWy28gxgGWZRh7JosZDL+G37PtCpViy6Dn6umIVJPum9cSbMoBOhgWZIHK/qhI6
 BaYQ==
X-Gm-Message-State: AFqh2koQDdwT1g0ftwjhYLRWuD48P98ickOoB3j1CAmAxUegavsjxSlf
 gSfFunB9wovzEctmnPt1XQnQSA==
X-Google-Smtp-Source: AMrXdXuEdWFKk0G6sWlCeE5axEFgDquSTu6zbMzp2hb3YowAKGUtdHsckEF6IlVR3RSlvGNbtYzyRg==
X-Received: by 2002:a05:6000:81:b0:2bc:1b58:8264 with SMTP id
 m1-20020a056000008100b002bc1b588264mr5924059wrx.49.1673372367820; 
 Tue, 10 Jan 2023 09:39:27 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 bu3-20020a056000078300b002bbe7efd88csm7303894wrb.41.2023.01.10.09.39.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jan 2023 09:39:27 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2EC711FFBC;
 Tue, 10 Jan 2023 17:39:23 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>, Beraldo Leal <bleal@redhat.com>,
 Thomas Huth <thuth@redhat.com>, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Ed Maste <emaste@freebsd.org>, Yanan Wang <wangyanan55@huawei.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>, Markus Armbruster <armbru@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Michael Roth <michael.roth@amd.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 John G Johnson <john.g.johnson@oracle.com>
Subject: [PATCH 04/26] tests/unit: drop hacky race avoidance in
 test-io-channel-command
Date: Tue, 10 Jan 2023 17:39:00 +0000
Message-Id: <20230110173922.265055-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230110173922.265055-1-alex.bennee@linaro.org>
References: <20230110173922.265055-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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


