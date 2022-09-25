Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 291385E92D9
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 13:54:56 +0200 (CEST)
Received: from localhost ([::1]:44828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocQDn-00024a-7V
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 07:54:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ocPrG-0002jb-Fw
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 07:31:41 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:37572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ocPr5-0006Ks-0W
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 07:31:36 -0400
Received: by mail-pf1-x436.google.com with SMTP id a80so4178780pfa.4
 for <qemu-devel@nongnu.org>; Sun, 25 Sep 2022 04:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=5qjVxtNqYJcB9xh5QVsfjKrkZmQUDej/8jaQ07ygeG4=;
 b=dUP8NSpP3Uw2ZDEQoL3vIwnDCFYFDntCksNF+bs4Awr7QFRT+oZPcHm9nKHo/2+Dca
 zUztCUGIgQyS4xBZvzn10B1Kahonrrh5Fs68x671HYWw1yHVNYH89wTpToUcn5+146aY
 OMqzttrJKPsrU5wEQcVpwCNE0hNrQA8nLc6Jh0PpuvmINE0We9thkCFngOXhXaCTeUpL
 pYG1aJSchB2e78cbjVvhvyhirTy6OZcGec5ckFYRZAr58UmGS79jZ5yFvBP5nKvwu8gh
 Uxqvf9ISz5YKXxrIo+5jWsvWv2TvWI7xO/A+Z6/d0YxP1PQjAGhHe3JtfQ4fZE2ORXQh
 nXrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=5qjVxtNqYJcB9xh5QVsfjKrkZmQUDej/8jaQ07ygeG4=;
 b=uqlARiKN4Y1RWJVEabUQSnozNlcnWKTFLVES8e5FmGkh88j/JRQqxD1AUlMzpiEE8a
 T3x8CBI2fWhocmMGh5abk5ReLzFpAoxmH10Sx8M+HAAXTcfV/UH+UO6DWsOJVuzNabK1
 PB7YbbcP/N0YY/BybZOzOeVhUm9YHoyAGmwIdQXb1m2iMwd8G9w0bouTuyTO6kI9wDI0
 vvCPKcsWHp452loqn2frpXTxqgGDnGnx+foL2w4JHs6D4970VRkuLCq4l5w7a1RY8jKP
 fcnTSzhOLYlSlOlOvdidw3yg+qgRluHKDxPhsT1+vwWvZj5xwQDpe7d8iYBsEywRdLm3
 F7HQ==
X-Gm-Message-State: ACrzQf06ZYfQobCW+4/J1G3M5zxfvLs6UArpGjFHSoD1qjjeK6C71Kkl
 qleZ/qV0ndaPT0Cx+21JTBUhkmG4niw=
X-Google-Smtp-Source: AMsMyM6w+C2GK3eE0r2aG17P0qiipC+fdcKkohVFP/SHK84JvneX1GUh70RJh9jQ78YQYznPUIAa2w==
X-Received: by 2002:a65:63ce:0:b0:43a:2103:b7b8 with SMTP id
 n14-20020a6563ce000000b0043a2103b7b8mr15903976pgv.59.1664105484759; 
 Sun, 25 Sep 2022 04:31:24 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a1709027e8400b00176c6738d13sm9187760pla.169.2022.09.25.04.31.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Sep 2022 04:31:24 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Laurent Vivier <lvivier@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH v3 16/54] tests/qtest: qmp-test: Avoid using hardcoded /tmp
Date: Sun, 25 Sep 2022 19:29:54 +0800
Message-Id: <20220925113032.1949844-17-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220925113032.1949844-1-bmeng.cn@gmail.com>
References: <20220925113032.1949844-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

This case was written to use hardcoded /tmp directory for temporary
files. Update to use g_dir_make_tmp() for a portable implementation.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

Changes in v3:
- Split to a separate patch

 tests/qtest/qmp-test.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tests/qtest/qmp-test.c b/tests/qtest/qmp-test.c
index bf7304c7dc..0fa00c12dc 100644
--- a/tests/qtest/qmp-test.c
+++ b/tests/qtest/qmp-test.c
@@ -161,12 +161,13 @@ static void test_qmp_protocol(void)
 
 /* Out-of-band tests */
 
-char tmpdir[] = "/tmp/qmp-test-XXXXXX";
+char *tmpdir;
 char *fifo_name;
 
 static void setup_blocking_cmd(void)
 {
-    if (!g_mkdtemp(tmpdir)) {
+    tmpdir = g_dir_make_tmp("qmp-test-XXXXXX", NULL);
+    if (!tmpdir) {
         g_error("g_mkdtemp: %s", strerror(errno));
     }
     fifo_name = g_strdup_printf("%s/fifo", tmpdir);
@@ -179,6 +180,7 @@ static void cleanup_blocking_cmd(void)
 {
     unlink(fifo_name);
     rmdir(tmpdir);
+    g_free(tmpdir);
 }
 
 static void send_cmd_that_blocks(QTestState *s, const char *id)
-- 
2.34.1


