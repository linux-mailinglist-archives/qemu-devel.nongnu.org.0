Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 773816A6F20
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 16:17:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXOBo-0008GX-TF; Wed, 01 Mar 2023 10:16:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pXOBh-00087m-M3
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 10:16:14 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pXOBb-0007bG-NM
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 10:16:13 -0500
Received: by mail-wr1-x42c.google.com with SMTP id bx12so10431848wrb.11
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 07:16:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EqFhRBXrn6GPErRi8pyJLWIavaWOiOrxY9yomxuPC6M=;
 b=sJKGHSql7XJ01ANn5mmS9Rs7+id4qzzx7rCezAFN9doOmOyuKDc8uxIUYFEp2TLuiB
 w+OUWfWqcS2y4qKEiL0ZY0d5c+0jsMzDzHod8WXKRpDLAoDi14uLKZXHtmBU1A9i7VUc
 aT3+/cGo8EWOCiAGcKCujj3WIKh804Bfyb1wroKF8Oky5UfECTiR6Q3TPgxEURixBKXc
 5fhCxKxxYSXGc6ossf37w2SJaTwTYBmWW+723dWj2Ol0vI+6hJV3k+KekQC5LY+ZIBe6
 OQ/8MYR70JNkr63gfh7Hg8elNVnKqJgiraMk2DF7YkxSbGeQdl95tySqIkOTkNhlqgW4
 2fuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EqFhRBXrn6GPErRi8pyJLWIavaWOiOrxY9yomxuPC6M=;
 b=dxIHHoYCB+55GRApIZJ7hdldhVzKefynZh2Tjbrpx9Yfm8n6CeKKYB0BHJEGsULxx5
 WGkuYr2qKamEFlzFmJXYq6PyO1C8yZgASYcn9PwXwSSE3IMivDrBu6VqBhhSK+ne8i2f
 oCjlJj64qiL3636pbBfPwwzY77Xz9/I5g4WIDOXVcLt+Q5+Ua1M4kIpZQSfrhRLUO8x9
 7T8/0ZU+LhW4PLO+xkilPsaVKam2SJyBYMf6d6SNjKw8NWqVv3lKnEqb2KXiigFNW8m9
 YGXmsnfFBQxD1BRKJ9Rs+2901bW5BLCFbIe97dwNr38Imhw6+MKBQv62eF0udkqdcXYk
 tE6w==
X-Gm-Message-State: AO0yUKX2ouhTZ23hV7tmaVxGG6rS/vw2F7NX0BEhi897DHgcZiSv90G2
 hKh2LaKuH18TCJykV/Z8W4XLuQ==
X-Google-Smtp-Source: AK7set+5J87ErGK0zTiEUhfseV/IZTU0PUty/WZf0AgISYTjQ4LkwSSb05r/nqKmne8yW0HHP7Ul5A==
X-Received: by 2002:adf:f789:0:b0:2c7:1319:7b1d with SMTP id
 q9-20020adff789000000b002c713197b1dmr5167726wrp.39.1677683765652; 
 Wed, 01 Mar 2023 07:16:05 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 z5-20020a5d6545000000b002c5501a5803sm13049632wrv.65.2023.03.01.07.16.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 07:16:05 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9C6FD1FFB8;
 Wed,  1 Mar 2023 15:16:04 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PULL v2 01/24] tests: don't run socat tests on MacOS as well
Date: Wed,  1 Mar 2023 15:15:41 +0000
Message-Id: <20230301151604.1948813-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230301151604.1948813-1-alex.bennee@linaro.org>
References: <20230301151604.1948813-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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

In preparation for the next patch when we enable socat for our CI
images we need to disable this part of the test for MacOS. The bug has
been raised here:

  https://gitlab.com/qemu-project/qemu/-/issues/1495

Once that is fixed we should re-enable the test.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230228190653.1602033-2-alex.bennee@linaro.org>

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


