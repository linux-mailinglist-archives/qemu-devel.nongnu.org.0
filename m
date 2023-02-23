Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF45B6A0D69
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 16:59:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVDyN-00006P-0g; Thu, 23 Feb 2023 10:57:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pVDyK-0008OW-2u
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 10:57:28 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pVDyG-0004iW-Su
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 10:57:27 -0500
Received: by mail-wr1-x430.google.com with SMTP id r7so10890763wrz.6
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 07:57:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y5CagnZd0OC5H3cuEddG4GatnBqEK8bA4UH4sgfkIbo=;
 b=sxP3WpiOCnEFP/+Ji0UnSZeDb2pvABaXDDuPWJY+0gexmPwyRircxBeC7IrNfVCI/i
 5MzDJjisk7UZJYGAstxA65qaFdqNDOFzxh6lXcTzA5nViYBK+CIi69MEGsBSPK5jpR0c
 nZr2q5qbbKSME85Nu8gcoIZAFdwNC7xf3G5oTol7VknpiOUkKoUjHW00ARmfUVhuueAj
 CsJ9tNKsWjs6KSCUrLHDLbiptmVEnJuOK8/PA+J9kdqtHwCasESdaLJvs2sfi8zDem42
 oEh1bNSekkbkUGGySU3+PwjVpwbmTayK2lMA1hZXrQCNO+DBhFh7eNAYltACm8TB73dR
 96Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Y5CagnZd0OC5H3cuEddG4GatnBqEK8bA4UH4sgfkIbo=;
 b=ulcNWMgroZcWZr97SAYd86ZYvZsHoXhGOm7upuJ4mKde97EW0AZzZPPnRZvAVgzH+3
 oWWU0/9LxHfrMmOhI2NxoKeSDUKq3IeNucmhtgvo/nrNnEf+9vO8yeMrkSPnd1VNKGBn
 Q7pmIv4oqnWDBtMzCdzJl4OwQBo3a6Gqc/sM8OLanHKcSI4pQMIKdlsscjnFzT51iSDT
 SwLXlceOlu5hm2BDI9Y6UNpwcix2lZeYzM7a5SeiXACPr1OnfuGGsYgBH1xkGWgXbPTt
 wXim2YcqoxFvO11ix8GISWhuCqEZi5MzJ0mBO5MCej6gzw9Y6Grg9WIiaZNVNwSi5jOd
 H2UQ==
X-Gm-Message-State: AO0yUKVzSMGZScPFW1WYMbCbH6BlYz0ZftRXjP9Jw82sEgGEQM67kMYE
 QHbMLvOoioj2uIc9yD41vbqwGA==
X-Google-Smtp-Source: AK7set9Rm8mHHNjh2MHRXPUbzV916lwWv9bohSdKaA2oT9S2qYlLSvEqIv36G+q8jsoueqGE3ZNjtg==
X-Received: by 2002:a5d:5308:0:b0:2bf:c0d3:430c with SMTP id
 e8-20020a5d5308000000b002bfc0d3430cmr11035823wrv.11.1677167842227; 
 Thu, 23 Feb 2023 07:57:22 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 t16-20020a5d5350000000b002c53cc7504csm7354786wrv.78.2023.02.23.07.57.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 07:57:21 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BA4FD1FFBB;
 Thu, 23 Feb 2023 15:57:20 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PULL 03/13] tests: be a bit more strict cleaning up fifos
Date: Thu, 23 Feb 2023 15:57:10 +0000
Message-Id: <20230223155720.310593-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230223155720.310593-1-alex.bennee@linaro.org>
References: <20230223155720.310593-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
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

When we re-factored we dropped the unlink() step which turns out to be
required for rmdir to do its thing. If we had been checking the return
value we would have noticed so lets do that with this fix.

Fixes: 68406d1085 (tests/unit: cleanups for test-io-channel-command)
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Suggested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230221094558.2864616-5-alex.bennee@linaro.org>

diff --git a/tests/unit/test-io-channel-command.c b/tests/unit/test-io-channel-command.c
index 04b75ab3b4..c6e66a8c33 100644
--- a/tests/unit/test-io-channel-command.c
+++ b/tests/unit/test-io-channel-command.c
@@ -42,6 +42,7 @@ static void test_io_channel_command_fifo(bool async)
     g_auto(GStrv) dstargv = g_strsplit(dstargs, " ", -1);
     QIOChannel *src, *dst;
     QIOChannelTest *test;
+    int err;
 
     if (mkfifo(fifo, 0600)) {
         g_error("mkfifo: %s", strerror(errno));
@@ -61,7 +62,10 @@ static void test_io_channel_command_fifo(bool async)
     object_unref(OBJECT(src));
     object_unref(OBJECT(dst));
 
-    g_rmdir(tmpdir);
+    err = g_unlink(fifo);
+    g_assert(err == 0);
+    err = g_rmdir(tmpdir);
+    g_assert(err == 0);
 }
 
 static void test_io_channel_command_fifo_async(void)
-- 
2.39.1


