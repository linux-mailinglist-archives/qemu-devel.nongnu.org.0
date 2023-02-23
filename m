Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E02846A0D67
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 16:58:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVDyN-00006k-1h; Thu, 23 Feb 2023 10:57:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pVDyI-0008E7-RP
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 10:57:26 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pVDyG-0004iL-TJ
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 10:57:26 -0500
Received: by mail-wr1-x434.google.com with SMTP id bo30so10492072wrb.0
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 07:57:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8CADyRD/0k7m7qbsD3m1XSTlaVYQ9wnpW+IRtBjtl2k=;
 b=Q59x6nRJe0zRJwA66AY/JRM6n8cYXru+djNHIUYsQASr7Gg1ikFBYNxsOpP80V49Fp
 StnjdUp5tsyZgOQKapDR+aZfzUd2fUwy+4Nabc1+ZeYWmimUQkfAsDE4vu/cLKjgy0d2
 P06yDlqpMC6Wnuvw9yhCZCxYQ/36jGwvQd5LO0r7kxU3yju9h8uBe0IHomV0BA/Sv6iA
 plf2wzdUn2yAAKeqI7m22cHQ75sknRSMgips+pYHkG4lupqV2HLo6aXRtYx4RI+CC933
 BzybmytoH7rp4lNw9RlwvpbGm/HPMV0P/vzaplfCsFyNkQYvm4w6CQzQ8FL0FCxqpLXo
 SxzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8CADyRD/0k7m7qbsD3m1XSTlaVYQ9wnpW+IRtBjtl2k=;
 b=Jg1s3JYoaHrE7zhFpSbbzKD6SevecuOa/E+SNTP4t9S/MvnrbLjBidopTE9BmV7FL9
 Ba265lyx8GS1cXhnL1meyqj7ufAiJ9jynYKiAcnhLRqfUGBI2D5xXO6MOY1tDTxMVWzo
 M0cAkuOEzNXkzBq9X6uH+kq45uhPSsqXs2hfkfL23OLdiykubcAQYHWz3MR06X0l8fcV
 ziQUUq/S98di5K3omkbG2YucnTeg4o7AdELeLlA4pJCPJX+ZEomEY2SYsfywolkqS59x
 1AA4jcQunlmdsppAKCen7sXuS2C9vtkqTvmk9tGQKX6kA41uMNchIIUitGCnonAaud0P
 tWOQ==
X-Gm-Message-State: AO0yUKUfV6Xndng/HMTLUBcNLcAEIQ3YTW1zJu7HiQH/TtbdT0Vh0oqK
 ujKwrKqI0TdYkDw6wHQCkDNroI920dQ3p1Ov
X-Google-Smtp-Source: AK7set8UAxv6VOF8BB1tYpAEw2WKeSMtJpATQNIGwDNk2wYUkacmUh1L2o12OHNcnoSAtA7K71/gzw==
X-Received: by 2002:a5d:63c4:0:b0:2c7:1483:88d6 with SMTP id
 c4-20020a5d63c4000000b002c7148388d6mr2013430wrw.23.1677167841190; 
 Thu, 23 Feb 2023 07:57:21 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 f5-20020a5d5685000000b002c58f199a49sm8912292wrv.117.2023.02.23.07.57.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 07:57:20 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4375E1FFB8;
 Thu, 23 Feb 2023 15:57:20 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PULL 01/13] tests: don't run socat tests on MacOS as well
Date: Thu, 23 Feb 2023 15:57:08 +0000
Message-Id: <20230223155720.310593-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230223155720.310593-1-alex.bennee@linaro.org>
References: <20230223155720.310593-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
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
Message-Id: <20230221094558.2864616-3-alex.bennee@linaro.org>

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


