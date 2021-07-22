Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC9053D1ED6
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 09:20:33 +0200 (CEST)
Received: from localhost ([::1]:36830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6T0S-0004ke-SP
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 03:20:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m6StB-0006T3-7b
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 03:13:01 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:41924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m6St8-0005V1-GM
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 03:13:00 -0400
Received: by mail-wr1-x430.google.com with SMTP id k4so4768994wrc.8
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 00:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=g9GPBnOls6lqCRr2cBSrHII9Px4RdKxn4NmBlv5xAGo=;
 b=aHGXbQWsv3gabJrXsECmcYTyQtBn3lPm/IrpHx0Ndq7A6BvYm3no97oQENQ6NLtVLA
 RufsUw41bUDz2rB9kziP100gu8hmt/60Z5c4ZL2hKDLb99Y11SbHbs96UyjdrAsyjju1
 QBtjhccSu83flM2boWSC9d8aZgYF3tNsnCrbO4Hy51/YOXyF5geeNJ8dOB4QaAcUIyF9
 WWhuoD4XHsobU1xY4R+/7T9RUBTPl50Yt5yEiuIqxwOk6Bw/e61thtk3rjuyr1A676cG
 jSAvTzsQ2efPQQT8ZtF9SwvI8ypB2N7uJ8stSzY7rN5EEzL2QWSZe1KUI0MRR5AcKUmV
 VtKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=g9GPBnOls6lqCRr2cBSrHII9Px4RdKxn4NmBlv5xAGo=;
 b=DBEVA7N05TT8pv8eJSQhjZRtMOg6fCj0oJ2AV+m6YG9JI06I9nWYD7tzwyuBr52tYA
 KLANNL4YoAWF8jRm2CXu5HgGXjX0dfyNCq3Tii/qqd5KrPGYvkSBNB4dj/uo+LeI4KUt
 irMWDukC6KjN5t9Nd4y80pVrFkh8fAy1z73XlybsMxhMM/r8jOKJs3tpuYi4VU5u9lh1
 JKID+ODBbcsv+xisobFAMx0ThNhbpIj541FqBHbkB9XCL7sM3162gV/ZbCuK4ObNrVQP
 /v3LvHHtXhlEQfTxMEcVtt2grveGFRvIyD9/XlOcmZQa6f79ZLT2V4IcgysY3LZaDsSm
 KKXQ==
X-Gm-Message-State: AOAM5325xs8Lagg1Qh4EJ8tl/BxOxTJhrXjsaYdqSLuWrde7Mi5UgVvQ
 gjf7EVwcs/UEHDr5w9J51ocQfsWmYsc=
X-Google-Smtp-Source: ABdhPJw5CHWMWvRUl2GcmmOQ5kz3LXdcLvTddAYYM+sG65SdFDw6xMzXRMA2DcDX+6YrQptCfLvUxQ==
X-Received: by 2002:a05:6000:1544:: with SMTP id
 4mr47734564wry.288.1626937977032; 
 Thu, 22 Jul 2021 00:12:57 -0700 (PDT)
Received: from localhost.localdomain ([102.44.10.38])
 by smtp.gmail.com with ESMTPSA id v21sm1802871wml.5.2021.07.22.00.12.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 00:12:56 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 09/13] tests/plugins/bb: adapt to the new arg passing scheme
Date: Thu, 22 Jul 2021 09:12:32 +0200
Message-Id: <20210722071236.139520-10-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210722071236.139520-1-ma.mandourr@gmail.com>
References: <20210722071236.139520-1-ma.mandourr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Mahmoud Mandour <ma.mandourr@gmail.com>, cota@braap.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
---
 tests/plugin/bb.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/tests/plugin/bb.c b/tests/plugin/bb.c
index de09bdde4e..7d470a1011 100644
--- a/tests/plugin/bb.c
+++ b/tests/plugin/bb.c
@@ -104,10 +104,17 @@ QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
 
     for (i = 0; i < argc; i++) {
         char *opt = argv[i];
-        if (g_strcmp0(opt, "inline") == 0) {
-            do_inline = true;
-        } else if (g_strcmp0(opt, "idle") == 0) {
-            idle_report = true;
+        g_autofree char **tokens = g_strsplit(opt, "=", 2);
+        if (g_strcmp0(tokens[0], "inline") == 0) {
+            if (!qemu_plugin_bool_parse(tokens[0], tokens[1], &do_inline)) {
+                fprintf(stderr, "boolean argument parsing failed: %s\n", opt);
+                return -1;
+            }
+        } else if (g_strcmp0(tokens[0], "idle") == 0) {
+            if (!qemu_plugin_bool_parse(tokens[0], tokens[1], &idle_report)) {
+                fprintf(stderr, "boolean argument parsing failed: %s\n", opt);
+                return -1;
+            }
         } else {
             fprintf(stderr, "option parsing failed: %s\n", opt);
             return -1;
-- 
2.25.1


