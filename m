Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA9B5504945
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Apr 2022 21:19:25 +0200 (CEST)
Received: from localhost ([::1]:43806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngAQe-0005Wq-Vj
	for lists+qemu-devel@lfdr.de; Sun, 17 Apr 2022 15:19:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng9fg-0000UX-0i
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 14:30:52 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:35764)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng9fa-0001q1-Ul
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 14:30:48 -0400
Received: by mail-pg1-x535.google.com with SMTP id k62so9002455pgd.2
 for <qemu-devel@nongnu.org>; Sun, 17 Apr 2022 11:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KyDX+9kaThDi34z+jXeKQT/xeBan8IqcerJCqXgP+WE=;
 b=GepKXb4RP3vf5dXpGCA/YrwXb15I3ERf7eGJGIqb4HXxaBXyu/kLYe35FxHUZ817Jx
 z4CaJ/deu8gKwnfCPSrqS1KnFkKO9oY8hHI90lLxjqy2SpF6haSq5cwxUH9cbSfoqlIH
 otf6xkLxU2hLlUjILaLJmf4SCSUAiXISaP0ZwoqfDs16f8rwdwYQLxp07jWfXmm3XjP7
 eZ85mGgm08Jm5IwPXG6+6ayw2Td46zJw9s+u4SooXmzqBD40wlYIgGLKRrsE6413cBcl
 U4ksK1NXe4Fnzr4LXfHmnDlgOrVgbcXJm+kXV24xR/BTn9iNPpMzcJ63iHmAyrMOSVZA
 t1hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KyDX+9kaThDi34z+jXeKQT/xeBan8IqcerJCqXgP+WE=;
 b=I26rY5wAWyJhM6VNUubmnZX6B+Sjt5XlPKthqBVu2NwP9JlWRx07H/iTOkNkVQBbcG
 0Z+j9gD29cvQJXO0ps7DdD9Ch9DUIFHBaskxM6c7Wa98U5Tb5ypRq80hWwvs4yYpyuwh
 hv73iBn2ChDvHIhgXb2RF4F9zRtCxoxulNG4Ctcja0EJ/Uf5e4CqD7yhqqYlG+KAaKaa
 H/uq1NyygojdBq5aoZIaU5FbauHHvjJ7Y6h66BSjkvL0prCM+s4QZSMsKxReRlWax7DU
 wxrMSgi1yPE/YFnCWS71GrWo+iRYAVxFSwun0RmJpYwsGRWtepIpBdCmSrHQ2cvNSNwB
 4TTw==
X-Gm-Message-State: AOAM532D3rz1jngTkseKyOW2XNlza++qwrAQeMh7lrM8tuPymY7TM5Z9
 Oa+jWZwdCi6JZJrsSeYkEMNiwyqiem4OeA==
X-Google-Smtp-Source: ABdhPJy3wr/Ke31WnqCO2EJhgImPsH2vtjyjoBD1UOFihtDNyPRVFl0s6PQj2EoOaofJaz2mPRdLIg==
X-Received: by 2002:a63:6a85:0:b0:398:9e2b:afd6 with SMTP id
 f127-20020a636a85000000b003989e2bafd6mr7303346pgc.582.1650220245279; 
 Sun, 17 Apr 2022 11:30:45 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 on10-20020a17090b1d0a00b001d08a7d569csm8154011pjb.56.2022.04.17.11.30.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 11:30:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 29/39] linux-user: Use qemu_set_log_filename_flags
Date: Sun, 17 Apr 2022 11:30:09 -0700
Message-Id: <20220417183019.755276-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220417183019.755276-1-richard.henderson@linaro.org>
References: <20220417183019.755276-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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

Perform all logfile setup in one step.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/main.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/linux-user/main.c b/linux-user/main.c
index d263b2a669..0297ae8321 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -85,6 +85,7 @@ static bool enable_strace;
  * Used to support command line arguments overriding environment variables.
  */
 static int last_log_mask;
+static const char *last_log_filename;
 
 /*
  * When running 32-on-64 we should make sure we can fit all of the possible
@@ -257,7 +258,7 @@ static void handle_arg_dfilter(const char *arg)
 
 static void handle_arg_log_filename(const char *arg)
 {
-    qemu_set_log_filename(arg, &error_fatal);
+    last_log_filename = arg;
 }
 
 static void handle_arg_set_env(const char *arg)
@@ -643,7 +644,6 @@ int main(int argc, char **argv, char **envp)
     int i;
     int ret;
     int execfd;
-    int log_mask;
     unsigned long max_reserved_va;
     bool preserve_argv0;
 
@@ -677,10 +677,9 @@ int main(int argc, char **argv, char **envp)
 
     optind = parse_args(argc, argv);
 
-    log_mask = last_log_mask | (enable_strace ? LOG_STRACE : 0);
-    if (log_mask) {
-        qemu_set_log(log_mask, &error_fatal);
-    }
+    qemu_set_log_filename_flags(last_log_filename,
+                                last_log_mask | (enable_strace * LOG_STRACE),
+                                &error_fatal);
 
     if (!trace_init_backends()) {
         exit(1);
-- 
2.25.1


