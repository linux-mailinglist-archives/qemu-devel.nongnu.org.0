Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B61968BFB2
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 15:13:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP2D3-0006Ca-M6; Mon, 06 Feb 2023 09:11:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pP2Cz-0006B6-Tn
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 09:11:02 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pP2Cy-0002iI-AW
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 09:11:01 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 hn2-20020a05600ca38200b003dc5cb96d46so10846150wmb.4
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 06:10:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+I53xBk94Icn+HXy2XnY6Y742j305f3BEwXvDIM+VP0=;
 b=IaPj2GlSwArMOGAzOmDFvSjsOnAt4qOiE2YUaUYpRlyFZp7fjEXT2ZdevbD3xN3zWq
 qXs5+S+PqQEPeTA0WVT+G+2+LDgv86DFQOfM6ikPtHpsqS3tkkQuvLichsW1P8dbhKOI
 TVfSbwt8EJOT6aSNle2iy+zAtLSDw21mv/91+GdgPHMo4J3pw2bgEtHtJZY5a5AM17rj
 rdoj8iKMLEWoYPjn0vdLbH1bcSeIDXzwMDsg3PP9GQl1XiP4DzbftrnC0yuyehpkyGyZ
 Vv54+3hqRQTyKEjT8m5NgS2UQcZG2wpKSGjwHPHZg5Mtf1Xv4r6HKqygdo/U1xX2EgWp
 batg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+I53xBk94Icn+HXy2XnY6Y742j305f3BEwXvDIM+VP0=;
 b=KnaEgCShSffdbv1q8PcbZ2FXliPnArWqi5dAqt0YrCtOKD+vvu3MUuhjJojZXLefYh
 Y8CIWV4rBZNfggztE5nrf4KWo8TXLewz7n0GVXW17/UCWMVVPuZOA5W0Ay+eyu7Ri44r
 elm2gyzQugvRvu97CD6nkkbQFl+4Pt2mqd/NDVj2L0+Zadcqsnf/gnlvlufDtVGocikF
 c/ypQ6cVNYDUoSi7xF7Bfk9G9dKHItS7IXNPRQYy5WD4G5FlARELtNjd9Ln6GfwNv72c
 SOOjCdZIDLsC1/HiLaWFvNL4BgfF0aLs1NSjsP5L4Cdcs0cTkOty8VZ4sR0vGDFCHA/4
 3xDA==
X-Gm-Message-State: AO0yUKWRMYtORb5ny/JMNCtGLUuwpq2hhDKmADpmqZw4aAdEPyrHbqT8
 vSgvPv3TYDQBj3+84jcRnwJCog==
X-Google-Smtp-Source: AK7set9ivmAhnk0qcjninxqfEhMupTOxs/VDHro+3YmjFmwJbEWFayKn8vmcaahSX94AW5waDcH6SQ==
X-Received: by 2002:a05:600c:1553:b0:3df:fa96:f670 with SMTP id
 f19-20020a05600c155300b003dffa96f670mr5252924wmg.22.1675692658692; 
 Mon, 06 Feb 2023 06:10:58 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a05600c0a0400b003dfdeb57027sm14339806wmp.38.2023.02.06.06.10.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Feb 2023 06:10:58 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C4E7C1FFB7;
 Mon,  6 Feb 2023 14:10:57 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [RFC PATCH] tests: be a bit more strict cleaning up fifos
Date: Mon,  6 Feb 2023 14:10:51 +0000
Message-Id: <20230206141051.4088777-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
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
---
 tests/unit/test-io-channel-command.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tests/unit/test-io-channel-command.c b/tests/unit/test-io-channel-command.c
index 425e2f5594..c2179a6462 100644
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


