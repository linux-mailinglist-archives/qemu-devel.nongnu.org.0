Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A6569DD24
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 10:48:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUPE6-0006hq-5q; Tue, 21 Feb 2023 04:46:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pUPDp-0006Y2-RI
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 04:46:08 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pUPDm-0005hU-BY
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 04:46:05 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 l2-20020a05600c1d0200b003e1f6dff952so3005086wms.1
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 01:46:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KhqJDF19zs5rfm3N2MBvoePdiOYf5ocnGb+1ca8BnR0=;
 b=EU3yyO+uv9X9FwaQs8hmvSvw5flyTJ/tSPQzLLda3MghNuF90YxGImHaayMYxdrf0g
 QJEWsb0VQljiuc+Axu7MA8l3hHk83G9EoknH5TZIuf7aSAWukohGedkv/8Mv/OnnEeBt
 J9skTViwCw79C0P87l51fpVdzCKElX5ppG5b+dVHelv/NZXw8rU+ZvVMOy+ZZmi7R+8t
 BeednGBpdhTBgUsS5RtdnWSx98V2WAJi9lyeOUloTn+9qusl0EYM0FuZf/kzF+YfhhoR
 pgaH8OyZ8/Hjp4yJHhb3Ac1Czwayw34K0xWngdU2qj70laSIp6de5l2vZg2NST1BCKor
 PJBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KhqJDF19zs5rfm3N2MBvoePdiOYf5ocnGb+1ca8BnR0=;
 b=q9wVPJIXRhhnhv6q+5q6UiIKGb691hAf6Cn77J6/gjG1ctPk/Y1jbcqSEJrWDAbJLO
 cG7hnqPk8US3+isBqifbFG06d2LsCGqdL7c9emaTuipb4C3RHlyIqPs+4Bvs98K2afij
 dMad25XQAcnDZSWV934iRNRRqkLgyiH7YTRonMkmXMRyJzG59brPpdkRBqLok9BDLSJL
 Wku9p9rLim8BMUgc+Os56k+JICn4ssNDV6dhNET2FOgY8lkC2cFmqaCE0bPZhUrGz2tR
 f25xD6jhHCwKlUezHKFxYAbqDDCUsX/YOWfpZKwICtLVhYRWpAaj1Zv1qaVVMR6Kz61A
 hIUA==
X-Gm-Message-State: AO0yUKWetOKth7iIQggsZMEWJWW2c6lcpYaUw3P3GNshyAMqdnuCFUaf
 eF7TDhQlTs925mhZ+yAitGoimw==
X-Google-Smtp-Source: AK7set94DC7q8pGCS2I01+5H9X81VxvTW/XAXwGVq1dCQdKL7p169tg6s+X4LnBC1r7aKQ+Ae+M1/Q==
X-Received: by 2002:a05:600c:929:b0:3e2:5c3:bcfc with SMTP id
 m41-20020a05600c092900b003e205c3bcfcmr2487532wmp.18.1676972760845; 
 Tue, 21 Feb 2023 01:46:00 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 a22-20020a05600c225600b003e2058a7109sm4446078wmm.14.2023.02.21.01.45.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Feb 2023 01:45:59 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1BE8A1FFBA;
 Tue, 21 Feb 2023 09:45:59 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Yonggang Luo <luoyonggang@gmail.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Ed Maste <emaste@freebsd.org>, Bandan Das <bsd@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 qemu-block@nongnu.org, Beraldo Leal <bleal@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-arm@nongnu.org,
 Michael Roth <michael.roth@amd.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Alexander Bulekov <alxndr@bu.edu>, Darren Kenny <darren.kenny@oracle.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v2 02/14] tests: don't run socat tests on MacOS as well
Date: Tue, 21 Feb 2023 09:45:46 +0000
Message-Id: <20230221094558.2864616-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230221094558.2864616-1-alex.bennee@linaro.org>
References: <20230221094558.2864616-1-alex.bennee@linaro.org>
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

In preparation for the next patch when we enable socat for our CI
images we need to disable this part of the test for MacOS. The bug has
been raised here:

  https://gitlab.com/qemu-project/qemu/-/issues/1495

Once that is fixed we should re-enable the test.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tests/unit/test-io-channel-command.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/unit/test-io-channel-command.c b/tests/unit/test-io-channel-command.c
index 425e2f5594..04b75ab3b4 100644
--- a/tests/unit/test-io-channel-command.c
+++ b/tests/unit/test-io-channel-command.c
@@ -31,7 +31,7 @@
 
 static char *socat = NULL;
 
-#ifndef _WIN32
+#if !defined(_WIN32) && !defined(CONFIG_DARWIN)
 static void test_io_channel_command_fifo(bool async)
 {
     g_autofree gchar *tmpdir = g_dir_make_tmp("qemu-test-io-channel.XXXXXX", NULL);
@@ -128,7 +128,7 @@ int main(int argc, char **argv)
 
     socat = g_find_program_in_path("socat");
 
-#ifndef _WIN32
+#if !defined(_WIN32) && !defined(CONFIG_DARWIN)
     g_test_add_func("/io/channel/command/fifo/sync",
                     test_io_channel_command_fifo_sync);
     g_test_add_func("/io/channel/command/fifo/async",
-- 
2.39.1


