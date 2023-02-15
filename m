Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9627B69847A
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 20:26:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSNPX-0006lj-BD; Wed, 15 Feb 2023 14:25:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pSNPM-0006hs-V5
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 14:25:36 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pSNPK-0001gC-1t
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 14:25:36 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 f18-20020a7bcd12000000b003e206711347so1392856wmj.0
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 11:25:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/kO6KvD/UT+wvNNPZpX8pG7g3+2FfCgwvzZIN4Mpdz8=;
 b=y4zkzeICHCC85KUWKYJXPETUTQqKQRyo0EgIZbwGCkfOTfPO0M9Z0ympsxl3qc14nr
 9qVmaN7tYkYjrNDjm8T5WNZBx4pceXPYLyBfXeVsWiJQKN+xHHer7JC5wEZrQkq94mev
 79eU+AjUaFz9w9o21qDAHtcJR+RptnW6HND1chc8YZkEkSrLXj5FoHBqDp+Wqw9k08At
 ntr9prdcM7vCAnfNcjeTuXGTinkPnyrVXg+fdwPTywljog6H25F0/9Lm/k/OVmGy6OVy
 GqFk18/sxyyZlBpEm3DR8XgJhtvsoskHNmVG48F1emrRf6O+tY4rqXGqxY6YTQOyUdTv
 cXRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/kO6KvD/UT+wvNNPZpX8pG7g3+2FfCgwvzZIN4Mpdz8=;
 b=sVE4MdxtprY1moRMrNx339kqkojg0Ty5xhVugCw8SKVBXjoFYNcb+GVd8QtbxY8hfI
 mi/v9lKJkXbFlFIMyFGhExgPiOBXLntU5xXuGX6v1qQO63wPYr8whFALjzvy+ctBFbhp
 GMxTfOMcNzDeAqvMBuVBTo6eOceKxuLqe2HAp7z+ijcnXz2hReyLhuqchxvLgXbj1VlG
 kc5cn7nViVSR0fScuc3lhGW9iy9RgUZEcocIevnl6QZC3hwvN4Z6K6FIrA7vz9kc1MCM
 EfOwNdv/TKYI+ja5FnTDNyKAmILAX0tJQGHGYMAa6rGhmuEqKAXq9Hy2pbcUNiYP3Ppe
 WAgw==
X-Gm-Message-State: AO0yUKVxo5NPTFnPj4J9P9b4OS2Ndny2FBtkmK9pXlcZhHxdQlXAk0Cc
 voPAWltFsj1TvYAeiKl4j4HO2A==
X-Google-Smtp-Source: AK7set/tlnv9AfXRBjL8lKaoIBnlSXxU2j+im//sqCM7154EOspzgG9O+kOe8mlvpubX7WwOYg6oZQ==
X-Received: by 2002:a05:600c:2e95:b0:3dd:1bcc:eb17 with SMTP id
 p21-20020a05600c2e9500b003dd1bcceb17mr3051433wmn.28.1676489132528; 
 Wed, 15 Feb 2023 11:25:32 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 r18-20020a05600c459200b003dc4baaedd3sm3367513wmo.37.2023.02.15.11.25.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 11:25:32 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 09D2F1FFBC;
 Wed, 15 Feb 2023 19:25:31 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Michael Roth <michael.roth@amd.com>, Alexander Bulekov <alxndr@bu.edu>,
 Qiuhao Li <Qiuhao.Li@outlook.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, John Snow <jsnow@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Darren Kenny <darren.kenny@oracle.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Bandan Das <bsd@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Yonggang Luo <luoyonggang@gmail.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Ed Maste <emaste@freebsd.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: [PATCH 04/12] tests: be a bit more strict cleaning up fifos
Date: Wed, 15 Feb 2023 19:25:22 +0000
Message-Id: <20230215192530.299263-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230215192530.299263-1-alex.bennee@linaro.org>
References: <20230215192530.299263-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
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
index f3c34152ac..70e82e0e12 100644
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


