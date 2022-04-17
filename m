Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FBB5504936
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Apr 2022 21:13:11 +0200 (CEST)
Received: from localhost ([::1]:54330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngAKc-00022L-5T
	for lists+qemu-devel@lfdr.de; Sun, 17 Apr 2022 15:13:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng9fm-0000XL-Rs
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 14:31:00 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:40615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng9ff-0001r2-OT
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 14:30:58 -0400
Received: by mail-pg1-x531.google.com with SMTP id h5so15063595pgc.7
 for <qemu-devel@nongnu.org>; Sun, 17 Apr 2022 11:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=K6kWjTcY58iKATI6rD2DZBTFfVyFhkk5JFKA13ecjWE=;
 b=bQWpD/JSIfvzlU0ahsv+s72X0exoEegNg6srMbKDLbkHxIx7OX5yHysofy3oNuqE3W
 DiuBorSYyPSPb2DOlzI42aKWmADNhhDIEKpFIlvRxVCvFODQbgDJec9HltFu1gzBmdX7
 gS/ndnySRs23cf3VqIZzdyRDRKTTY4sZmV1oHz0A2MGNwG25gswe5omBjBI22eHiBq4Z
 CodjOp4Qni38GPolAIM5Xue20iJRoZlW8quKLB+J81/uS601ErK2nxl13noucjkyp8F+
 ZjOeRqyDPFCvU3xZc+I5biP+Eb9g6XOtMru49TZKMiQG8E+RuzX73+T8xGFwExQ+VYLo
 ZK0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=K6kWjTcY58iKATI6rD2DZBTFfVyFhkk5JFKA13ecjWE=;
 b=ylv/Lu048OQWuQQrdtUsWrslpXr6Ja7OjLLJ5nQYHZASKlm9UeZ3YlFJ4ZgiLBpN8V
 5rLWpyMBXZRq31rD9RJpwSh+lKgG7uiMwFfWESpXT1YNeF0qYjanLPjMHHjDqkrUR7SP
 j83froatAzdihyuDwK28mh8BOgV5jTcBW+GecOK9WzmSOnNFrlhW119JMipJmE/h4Y6B
 58lWw8gxxbUhhAkQaP5ZIhh4Y+PRo7icQNYp2iDnpgs2y9S33w9bcH6TNHTlQr2gYwKI
 2zJ2azEbJtQcxELA4em9WgypGEqJxIS4UTA4l6MKF/GPRbNmaU+xVY1IQn0uCuSaxuUs
 g5Cw==
X-Gm-Message-State: AOAM532jidWnDA2aC0Eks4lqh45HNOGuuAew820WGwlhqeETIbpnYxYN
 gH0pG30FfciFs4GnWEFNl6NkA+w4YXbNWQ==
X-Google-Smtp-Source: ABdhPJz722IkUEEvXQodj8HKwKEBFxHMxaQlmfH0iR+dUgVK4s7OjADiBFTOQ9/GD2y/1OX8HKK2dQ==
X-Received: by 2002:a63:f452:0:b0:382:7af1:6ad6 with SMTP id
 p18-20020a63f452000000b003827af16ad6mr7074010pgk.500.1650220249792; 
 Sun, 17 Apr 2022 11:30:49 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 on10-20020a17090b1d0a00b001d08a7d569csm8154011pjb.56.2022.04.17.11.30.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 11:30:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 35/39] util/log: Hoist the eval of is_daemonized in
 qemu_set_log_internal
Date: Sun, 17 Apr 2022 11:30:15 -0700
Message-Id: <20220417183019.755276-36-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220417183019.755276-1-richard.henderson@linaro.org>
References: <20220417183019.755276-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
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
Cc: alex.bennee@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Only call is_daemonized once.
We require the result on all paths after this point.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 util/log.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/util/log.c b/util/log.c
index bb201664ac..631856e231 100644
--- a/util/log.c
+++ b/util/log.c
@@ -123,6 +123,7 @@ static bool qemu_set_log_internal(const char *filename, bool changed_name,
                                   int log_flags, Error **errp)
 {
     bool need_to_open_file;
+    bool daemonized;
     QemuLogFile *logfile;
 
     QEMU_LOCK_GUARD(&global_mutex);
@@ -178,7 +179,8 @@ static bool qemu_set_log_internal(const char *filename, bool changed_name,
      *     or to a file (if there is a filename).
      *   If we are daemonized, we will only log if there is a filename.
      */
-    need_to_open_file = log_flags && (!is_daemonized() || filename);
+    daemonized = is_daemonized();
+    need_to_open_file = log_flags && (!daemonized || filename);
 
     if (logfile && !need_to_open_file) {
         qatomic_rcu_set(&global_file, NULL);
@@ -196,7 +198,7 @@ static bool qemu_set_log_internal(const char *filename, bool changed_name,
                 return false;
             }
             /* In case we are a daemon redirect stderr to logfile */
-            if (is_daemonized()) {
+            if (daemonized) {
                 dup2(fileno(fd), STDERR_FILENO);
                 fclose(fd);
                 /* This will skip closing logfile in qemu_logfile_free. */
@@ -204,7 +206,7 @@ static bool qemu_set_log_internal(const char *filename, bool changed_name,
             }
         } else {
             /* Default to stderr if no log file specified */
-            assert(!is_daemonized());
+            assert(!daemonized);
             fd = stderr;
         }
 
-- 
2.25.1


