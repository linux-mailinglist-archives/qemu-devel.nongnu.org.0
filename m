Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62787617AC8
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 11:25:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqXNu-0006QP-HJ; Thu, 03 Nov 2022 06:23:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oqXNp-0006Pl-N8
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 06:23:37 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oqXNn-0002ua-Ke
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 06:23:36 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 ja4-20020a05600c556400b003cf6e77f89cso3578645wmb.0
 for <qemu-devel@nongnu.org>; Thu, 03 Nov 2022 03:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=sstJzyopg2VqPcP7Tk8pt237XBMPvUeLEz5JRu6y/fU=;
 b=MUFEXngvfjjRhi7LeLn2bhNvKnDVkTjlgSkiyc9pChUJcL8xJvtFaygtqXdclUJEJ6
 p6ZhTdfsqX6+Ts+kiMBaRb3GgUzl6S5jUwN7sMUi1Hw+5M8sbpc4otENkbuiYLKxUas9
 f7mToZGX+cPPlBw/EJqZiv0Svd4u6+/gKYA4PyxgOMEuHNu6I60vXHPB1/ZOweZjL2m1
 NLn6wDzV91PqATC0k4ehI54KLTAuMKgZlVrHX1/RGV/ec0WFnPhMbKNF+OfbaD9g5XmS
 S/t09q8Gi0wVNiW8LtnO+C0b6AHjFDOlPIrC0AALKsv4MGuxvdnr/qTS/f5hiFmy11d5
 fNSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sstJzyopg2VqPcP7Tk8pt237XBMPvUeLEz5JRu6y/fU=;
 b=57vlEpdGpYwYUrYb0hgPH6ULOqiiS3Li+fAMEpXB3CFs/9Kyi/UoXhH0wlPdO7qLh6
 MEX8y4N5wSAwk4v2IfiwrRq+QBl9MNp83xrVwdVTD9QPJ/leESulvcZ7LgHlfhe+O3Dv
 jE0GCJzQ3plCswONyqAxeXP9UoE/U5F4gR+a0g4vUMB+sj+n+/wcnt00qk/d/xW+KHca
 +V9tGWHpzUmAqdYrWsVKbZB69RrIUJziNFnN8RQFJ2XZtQYCkCL7mwlnYE5/7qv1elpe
 8p9UlcRLVtetukr4QGmuQ4J1OTO6+qFwlkw0C8ZxcG5lHyHSxss1z1mHL8JtIOGHH4yT
 Euww==
X-Gm-Message-State: ACrzQf3j8LsWilItIa23FZgByA/ljEeyemegv+lFC245Y/JDvvwSZ9LP
 ptRosiRpMkKvrAGk34OTSWOEUw==
X-Google-Smtp-Source: AMsMyM5DCWOviP0UmFAMCg00CJ16FoCeYA0ggvQ3DewCBGvMiz7DdIiMzA37xx6Tz+uBWqpks29NaA==
X-Received: by 2002:a1c:46c5:0:b0:3cf:75ac:101a with SMTP id
 t188-20020a1c46c5000000b003cf75ac101amr12866071wma.196.1667471013841; 
 Thu, 03 Nov 2022 03:23:33 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 k16-20020a5d6e90000000b002366d1cc198sm458101wrz.41.2022.11.03.03.23.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 03:23:33 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id AF0201FFB7;
 Thu,  3 Nov 2022 10:23:32 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH] tests/unit: simpler variable sequence for test-io-channel
Date: Thu,  3 Nov 2022 10:23:29 +0000
Message-Id: <20221103102329.2581508-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This avoids some compilers complaining about a potentially
un-initialised [src|dst]argv. In retrospect using GString was overkill
for what we are constructing.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/unit/test-io-channel-command.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/tests/unit/test-io-channel-command.c b/tests/unit/test-io-channel-command.c
index 43e29c8cfb..19f72eab96 100644
--- a/tests/unit/test-io-channel-command.c
+++ b/tests/unit/test-io-channel-command.c
@@ -33,19 +33,13 @@ static void test_io_channel_command_fifo(bool async)
 {
     g_autofree gchar *tmpdir = g_dir_make_tmp("qemu-test-io-channel.XXXXXX", NULL);
     g_autofree gchar *fifo = g_strdup_printf("%s/%s", tmpdir, TEST_FIFO);
-    g_autoptr(GString) srcargs = g_string_new(socat);
-    g_autoptr(GString) dstargs = g_string_new(socat);
-    g_auto(GStrv) srcargv;
-    g_auto(GStrv) dstargv;
+    g_autofree gchar *srcargs = g_strdup_printf("%s - PIPE:%s,wronly", socat, fifo);
+    g_autofree gchar *dstargs = g_strdup_printf("%s PIPE:%s,rdonly -", socat, fifo);
+    g_auto(GStrv) srcargv = g_strsplit(srcargs, " ", -1);
+    g_auto(GStrv) dstargv = g_strsplit(dstargs, " ", -1);
     QIOChannel *src, *dst;
     QIOChannelTest *test;
 
-    g_string_append_printf(srcargs, " - PIPE:%s,wronly", fifo);
-    g_string_append_printf(dstargs, " PIPE:%s,rdonly -", fifo);
-
-    srcargv = g_strsplit(srcargs->str, " ", -1);
-    dstargv = g_strsplit(dstargs->str, " ", -1);
-
     src = QIO_CHANNEL(qio_channel_command_new_spawn((const char **) srcargv,
                                                     O_WRONLY,
                                                     &error_abort));
-- 
2.34.1


