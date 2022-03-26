Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E1E54E8152
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Mar 2022 15:06:17 +0100 (CET)
Received: from localhost ([::1]:57648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nY73Y-00037t-Ca
	for lists+qemu-devel@lfdr.de; Sat, 26 Mar 2022 10:06:16 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nY6R3-0007Zp-9B
 for qemu-devel@nongnu.org; Sat, 26 Mar 2022 09:26:30 -0400
Received: from [2607:f8b0:4864:20::234] (port=34583
 helo=mail-oi1-x234.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nY6R1-0005X8-Og
 for qemu-devel@nongnu.org; Sat, 26 Mar 2022 09:26:29 -0400
Received: by mail-oi1-x234.google.com with SMTP id v75so11116308oie.1
 for <qemu-devel@nongnu.org>; Sat, 26 Mar 2022 06:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Xvpxj4nK9wpX7Z4tgHMyHFYd/y+hd6ZVPNnNHANWilg=;
 b=TgEJo57iboti6CrVqfODuxx/cJ8iwhTI/hF+IObiEq38zwUhFdpf4IxOdTOIolQ4Ry
 2MTO8/582lZkrfar8tv5ZYu8AtBQOUKrJjIFLnbWVvAIm3TGtIM15NhA9l2AC5ld2EI6
 qmvPu16X/FzHK2xibb734uIJPPfNMftXmp7RB+V4zZdjyCqlg86m8i8aYzW8YugLr22Q
 nAzaPy67cZxD7veWqbioSTiF7Ex1ENdSJx29GQmt3sbFvbfm8bDdBCn0uPGl6jSbgA9r
 kV8MSbxsguMYsVWUULhPblC1Gc5mzjCcicZMtPOZboEhBLk+P4H9p6loDP9xqEAJPvq6
 U+Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Xvpxj4nK9wpX7Z4tgHMyHFYd/y+hd6ZVPNnNHANWilg=;
 b=ntsfXHxiyevs9KMeOlohCGtkw6XdJNa0nmIqDiOFNd6v8mx+9QkiIaqB7IF9ey2hPG
 qyEyllt/DhLpU0RGdB9C7tIdgylA97wLhxT4SwypGqNrJToO2ywj4XsAEDKwytWJUL9W
 /r9mYZKNwHe7asXL5pS4VVhbTbZFmxU5dCCfFtxYDLn8X6D58UyyAzTFycd/YHIRzpZ3
 faVNNmL1sSNh9cC06XBbxi1UZ9nM7crmratQqIrXiVm0nXmPB9aURqkbD0VXRXj9801N
 +zAokjDVY1Uk/SVMv4mEMha6GyKTjl93JQfAUqvWYDBWQaVA2iwkqRDZnzfA9ere+hnu
 tLuQ==
X-Gm-Message-State: AOAM532YWVN2DjMVQPB8iSXjZYBxngp2ewuIZW1FTNB0CYAni2OeIZIU
 vIOMumAOi0k8ULrKbDyVDideGpPgcsv99eSI
X-Google-Smtp-Source: ABdhPJwsRQp4vwFYQiKKqEdd2m9Kizp8EfQ3frakC6JIWcbRnngvSnTMYUy74ZNggIQ7rTheDO1Zcg==
X-Received: by 2002:aca:4b88:0:b0:2d9:f709:2c07 with SMTP id
 y130-20020aca4b88000000b002d9f7092c07mr7339543oia.212.1648301186044; 
 Sat, 26 Mar 2022 06:26:26 -0700 (PDT)
Received: from localhost.localdomain (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168]) by smtp.gmail.com with ESMTPSA id
 n62-20020acaef41000000b002ef646e6690sm4610331oih.53.2022.03.26.06.26.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Mar 2022 06:26:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 23/39] tests/unit: Do not reference QemuLogFile directly
Date: Sat, 26 Mar 2022 07:25:18 -0600
Message-Id: <20220326132534.543738-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220326132534.543738-1-richard.henderson@linaro.org>
References: <20220326132534.543738-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::234
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::234;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x234.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use qemu_log_lock/unlock instead of the raw rcu_read.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/unit/test-logging.c | 33 +++++++++++++++------------------
 1 file changed, 15 insertions(+), 18 deletions(-)

diff --git a/tests/unit/test-logging.c b/tests/unit/test-logging.c
index 54d7e8e33b..dcb8ac70df 100644
--- a/tests/unit/test-logging.c
+++ b/tests/unit/test-logging.c
@@ -110,12 +110,10 @@ static void test_parse_path(gconstpointer data)
 
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
@@ -124,29 +122,28 @@ static void test_logfile_write(gconstpointer data)
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
2.25.1


