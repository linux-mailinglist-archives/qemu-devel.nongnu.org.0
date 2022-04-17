Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A60FD504932
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Apr 2022 21:10:13 +0200 (CEST)
Received: from localhost ([::1]:45898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngAHk-0004gk-Jw
	for lists+qemu-devel@lfdr.de; Sun, 17 Apr 2022 15:10:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng9fY-0000U4-Sk
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 14:30:49 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:45835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng9fW-0001oU-E8
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 14:30:44 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 n33-20020a17090a5aa400b001d28f5ee3f9so785720pji.4
 for <qemu-devel@nongnu.org>; Sun, 17 Apr 2022 11:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MFS05VM+1nmIS90ffHb9z5k4YW8IB7HF8idrdJvOqhE=;
 b=yJG2L9DL/hSy/pDCG7gUd9iaqRZjHV8pMMOiyIj4y8L9ilHJLGqKCidTFTqbl6YPmx
 HPYCbcwcuK3UwESKx4SqtSH5LV49+IKF8TFo+boRCl7kMvlP1AJq3L7xi3zSeN2XD4Eo
 vExwFNFF7RYOq1aVlv780G0yFaitiuyuz6EB9ZmRbnWvS2nd5oSSbzk8kP0dDHKbNqJN
 Dn68ZU/xNdvnEzl8+mAMCBrS6HjRR3DBzC2OSkrdvMhh+51MvvxPQz9x6LqFetwodq7I
 +lLyMDyWKMQmHrvcQtEGbhEn1ySLv9fv9+xiEWmBzIbHQsk35chWJc1/WCK6DpIs1XQW
 tNEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MFS05VM+1nmIS90ffHb9z5k4YW8IB7HF8idrdJvOqhE=;
 b=NhRYnvpF4BYk1LiYkUFVQEgn1kRnUdYLPVs19b12lnCMgp6sJCYeTw6MPzPNhcu5n5
 1H3nd1Gai3ncmovQ/cWZUG6LuIxN2e8wBmmCmK/xyxtKtmFxeaqGXVrKQGJTlWEH7cwb
 JlX/FF0N1TuOF84jWutDU7bHO2nq3qVZ8SpsUf4MIp37fKGdD6gIDPOS0/ahIth0QqDQ
 WiwkAXfm3WpUTpDaKlKBELtEdR5uaYjWdsMk7pExEVWUJsLN6qT+UTdNdixd1kSe9cr8
 MUEw1H+pS1YsMcn/3lRCjoa4yM2FDdVWiDenF3d2/RLdQbnZZ0lCqCj81nBoJWE0FN27
 cdsA==
X-Gm-Message-State: AOAM533k82w7A9IE14KlGnglWJ+og4ThQ/G6eNQBRCxz5q9lx8/p/DcM
 HJY1RoNxUpG6wQKMol2d1ATEH6dKiUvfGQ==
X-Google-Smtp-Source: ABdhPJwlAS1Yus0eFwwYWE3LbjnkVABl5/PC08Zii9JIbevzIklP5FMDNZPTk1XKCqJ4GdYxppy/IA==
X-Received: by 2002:a17:903:2343:b0:158:d9e2:8049 with SMTP id
 c3-20020a170903234300b00158d9e28049mr7565243plh.3.1650220240365; 
 Sun, 17 Apr 2022 11:30:40 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 on10-20020a17090b1d0a00b001d08a7d569csm8154011pjb.56.2022.04.17.11.30.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 11:30:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 23/39] tests/unit: Do not reference QemuLogFile directly
Date: Sun, 17 Apr 2022 11:30:03 -0700
Message-Id: <20220417183019.755276-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220417183019.755276-1-richard.henderson@linaro.org>
References: <20220417183019.755276-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use qemu_log_lock/unlock instead of the raw rcu_read.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
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


