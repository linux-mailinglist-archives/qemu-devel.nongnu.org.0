Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55826508F4B
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 20:20:25 +0200 (CEST)
Received: from localhost ([::1]:35872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhEwC-0001B0-FH
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 14:20:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhEj1-0005zk-8l
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:06:48 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:35433)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhEiz-0001Js-Nw
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:06:46 -0400
Received: by mail-pl1-x62c.google.com with SMTP id b7so2526154plh.2
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 11:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GOrnudVIf/VxKnimUR+ZGBs6Siav2WOrF7wND8cSk34=;
 b=ggx42s3afKDy0Esj7MdNSiaEsrqqryaxX1GiKCM1OvoO6IVOH0RTNktTs+JtFRKEKG
 wv4ov7ndzSrzCz9fLGH/fXO4LI2w5OFHaNmKAWQKaWAtAh5pgtK36R+iNNnbBRWMAzGE
 +8FALRQBHdjyDAnTt722CjMIE2luDAL3eXoeJJdl5JDdrD2zRer1VJ6eikhJyEd1Xb+W
 d4pUjhH+nb8IdyHeYs1MvfRncQ4fC8t40omEd2W2pPhx/isz4cGvF4RnsMNJn96Gqwmv
 xtxx82R8xWpxaXEU3rTEme0jV7LFfR3SwQ9OmsnGc9Z6ZYlrIsmtPT2cDpkV791FU/Ro
 G1XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GOrnudVIf/VxKnimUR+ZGBs6Siav2WOrF7wND8cSk34=;
 b=yha8/BeWC0s0bFXsZDxoSjld5Pq+6T/V3ojf69qiomhg/BmkE2+idHZfW5F1AdlZvH
 khx/f3MpnqRl5WERs9+AsAOsdNCL744MY01A/CNh70xUZxm7IuLFBb2jZ63pxp43KN6T
 JOkLpkyLG21vEz/HuWsw5vFptLnSd0diBMPa0tgO+8hOSGlGdh+YEn8BIwOPNCILA5iB
 H1JyTkZXPtt92aeEoACPpCsyjEMsFpOetmXQ9vGEghvoRMqmkHE1kJw+LF3gDDs8rLIX
 7hhGXUdm/98KOe0y+xIEGrpoS3EG9V/HSbnaZ6xDcbCb9QuUxFA8qHnI2eLsDQHuA/CD
 7yYQ==
X-Gm-Message-State: AOAM530eYy9qAWJxJLHfHWsroNg/rIBR6WKCrYWKvY42B6gSTiQ1r4Wy
 4ETCAL5Bs7jN4DDvvIt9UdtSfC9fwrOyOQ==
X-Google-Smtp-Source: ABdhPJx+3MRvpKqLKe+xz9bhIClggK2pcK6QUq3+L/hxJHWelZmMHeJ8ShKjCNYAZCpDINYG4r8yiQ==
X-Received: by 2002:a17:902:ba98:b0:15a:44ee:9e91 with SMTP id
 k24-20020a170902ba9800b0015a44ee9e91mr264163pls.3.1650478004428; 
 Wed, 20 Apr 2022 11:06:44 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 i2-20020a17090a058200b001d2fc489b8asm56681pji.25.2022.04.20.11.06.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 11:06:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 23/39] tests/unit: Do not reference QemuLogFile directly
Date: Wed, 20 Apr 2022 11:06:02 -0700
Message-Id: <20220420180618.1183855-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220420180618.1183855-1-richard.henderson@linaro.org>
References: <20220420180618.1183855-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use qemu_log_lock/unlock instead of the raw rcu_read.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220417183019.755276-24-richard.henderson@linaro.org>
---
 tests/unit/test-logging.c | 33 +++++++++++++++------------------
 1 file changed, 15 insertions(+), 18 deletions(-)

diff --git a/tests/unit/test-logging.c b/tests/unit/test-logging.c
index 4c595356ae..87db7fe04a 100644
--- a/tests/unit/test-logging.c
+++ b/tests/unit/test-logging.c
@@ -109,12 +109,10 @@ static void test_parse_path(gconstpointer data)
 
 static void test_logfile_write(gconstpointer data)
 {
-    QemuLogFile *logfile;
-    QemuLogFile *logfile2;
+    FILE *logfile0, *logfile1;
     gchar const *dir = data;
-    g_autofree gchar *file_path = NULL;
+    g_autofree gchar *file_path0 = NULL;
     g_autofree gchar *file_path1 = NULL;
-    FILE *orig_fd;
 
     /*
      * Before starting test, set log flags, to ensure the file gets
@@ -123,29 +121,28 @@ static void test_logfile_write(gconstpointer data)
      * this is needed.
      */
     qemu_set_log(CPU_LOG_TB_OUT_ASM, &error_abort);
-    file_path = g_build_filename(dir, "qemu_test_log_write0.log", NULL);
+    file_path0 = g_build_filename(dir, "qemu_test_log_write0.log", NULL);
     file_path1 = g_build_filename(dir, "qemu_test_log_write1.log", NULL);
 
     /*
      * Test that even if an open file handle is changed,
      * our handle remains valid due to RCU.
      */
-    qemu_set_log_filename(file_path, &error_abort);
-    rcu_read_lock();
-    logfile = qatomic_rcu_read(&qemu_logfile);
-    orig_fd = logfile->fd;
-    g_assert(logfile && logfile->fd);
-    fprintf(logfile->fd, "%s 1st write to file\n", __func__);
-    fflush(logfile->fd);
+    qemu_set_log_filename(file_path0, &error_abort);
+    logfile0 = qemu_log_trylock();
+    g_assert(logfile0);
+    fprintf(logfile0, "%s 1st write to file\n", __func__);
+    fflush(logfile0);
 
     /* Change the logfile and ensure that the handle is still valid. */
     qemu_set_log_filename(file_path1, &error_abort);
-    logfile2 = qatomic_rcu_read(&qemu_logfile);
-    g_assert(logfile->fd == orig_fd);
-    g_assert(logfile2->fd != logfile->fd);
-    fprintf(logfile->fd, "%s 2nd write to file\n", __func__);
-    fflush(logfile->fd);
-    rcu_read_unlock();
+    logfile1 = qemu_log_trylock();
+    g_assert(logfile1);
+    g_assert(logfile0 != logfile1);
+    fprintf(logfile0, "%s 2nd write to file\n", __func__);
+    fflush(logfile0);
+    qemu_log_unlock(logfile0);
+    qemu_log_unlock(logfile1);
 }
 
 static void test_logfile_lock(gconstpointer data)
-- 
2.34.1


