Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F2976A5F4B
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 20:08:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX5Jw-0002NP-1t; Tue, 28 Feb 2023 14:07:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pX5JT-0002FY-ET
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 14:07:15 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pX5JP-0002lE-Uo
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 14:06:59 -0500
Received: by mail-wr1-x431.google.com with SMTP id v16so8064887wrn.0
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 11:06:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1ticoOhCA7kOKu3KKguho+amZ9lnaesdRDBsj8TDMo4=;
 b=F5vpebMYwPCQ137qb98jewCUZCXTe2M0qMV7JCo46SzADzqzuB+1KJHOHfy3dPm6hh
 GyWoxqMQojhOJShZB2Q8Z4j+8M5ALN1qqIdaQeRxWmjnr8gTqoycj2dBMHEYjrNmk/mV
 UFbObbJMVg6nO6o4u8Wh9Tb4A7AxO7ygzhNGxgt0L3jSbA+S/vtxX8HLXN9DK8ivWiiM
 qXqzv0B04bjfXNX5euUObtV6HUtqRcWUKogvaOwmoPifhdvm2MDGuabgM/tKw7uW+pXI
 HrqhL8hp5vtfWYEChovbCZfcynrHYJvR7+0xRORq+OeKZqtj3oeZNnuBRYtdPL2mkSgJ
 mwbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1ticoOhCA7kOKu3KKguho+amZ9lnaesdRDBsj8TDMo4=;
 b=fngUK89MYWDd8/afZiYP/kkxdoPSgtZKHJsQXCPwOcUJQGGaBg7RM4vM5zaSbn1Fbs
 ViIcw5FKOBUomfzMteCvy+0oQwTuuhuWfCOv3x4cbY6Tx5BMgcBH/UAzY6asXopzsi1v
 GZagieYma3GVVyrgldxSW5uiILeUwMw5BcBFYVnnel6ShHFThpR9Q5W7NflhFQYuScJX
 lcv2v/lnLycQrZKAJ6Tj80qA7xFdT/rk7mhRg7Gy0maQJsu9mfty+oQyu7TCaRbq7U9M
 zQBZ4RZlqv4rol+CjjmdHowu+jIkPUsyd+KfvzMah4BnC19GwoppQQkpt3vwSpETJwOJ
 iVUA==
X-Gm-Message-State: AO0yUKW12b+4NUOyr1xAskcYJLkwkHMsUWdo2fj+paTGSlIgdoN0AJUC
 xqzXDpO5clqrS6jsH/GqJ2ON+g==
X-Google-Smtp-Source: AK7set98ZKI0UMXCz9+615K3bKvG3RnnUgJHcZ7DmstN2oddBy+JE//DBBZBowcvnCk3AzPgBp76Vw==
X-Received: by 2002:a05:6000:18ce:b0:2c7:bbe:4572 with SMTP id
 w14-20020a05600018ce00b002c70bbe4572mr3115830wrq.39.1677611214195; 
 Tue, 28 Feb 2023 11:06:54 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 l17-20020a5d6691000000b002c54e26bca5sm10525553wru.49.2023.02.28.11.06.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 11:06:53 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3FBB81FFB8;
 Tue, 28 Feb 2023 19:06:53 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Michael Roth <michael.roth@amd.com>,
 Peter Maydell <peter.maydell@linaro.org>, Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Darren Kenny <darren.kenny@oracle.com>, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>,
 Ed Maste <emaste@freebsd.org>, qemu-arm@nongnu.org,
 Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 Yonggang Luo <luoyonggang@gmail.com>, qemu-block@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Bandan Das <bsd@redhat.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Laurent Vivier <lvivier@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Qiuhao Li <Qiuhao.Li@outlook.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: [PATCH v3 01/24] tests: don't run socat tests on MacOS as well
Date: Tue, 28 Feb 2023 19:06:30 +0000
Message-Id: <20230228190653.1602033-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230228190653.1602033-1-alex.bennee@linaro.org>
References: <20230228190653.1602033-1-alex.bennee@linaro.org>
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

In preparation for the next patch when we enable socat for our CI
images we need to disable this part of the test for MacOS. The bug has
been raised here:

  https://gitlab.com/qemu-project/qemu/-/issues/1495

Once that is fixed we should re-enable the test.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230221094558.2864616-3-alex.bennee@linaro.org>
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
2.39.2


