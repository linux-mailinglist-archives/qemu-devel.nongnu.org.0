Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29736508F8B
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 20:35:58 +0200 (CEST)
Received: from localhost ([::1]:49564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhFBF-00065M-7W
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 14:35:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhEj7-0006Ib-0t
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:06:53 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:42572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhEj5-0001MT-DG
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:06:52 -0400
Received: by mail-pg1-x529.google.com with SMTP id bg9so2317317pgb.9
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 11:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Aaj9Eqxm00442I9UsHwK98R5AWzqyFTC/zPZ/aayFrs=;
 b=AqxPSu/z/KFTQVMtWc7lNsKooPFvWYwAMlBI53gE47l4bsC7aKuWodfRDTIlIla9ke
 k1ti7UFWIqoUlqvH4ZdCGZwI6N7EZIlRjFCNF9AZAfFDj+UxPG9DWhwuCwN3dsPx5sxh
 r5EgNNcGPfb90txEQ0esbTwL6owYpGGMmWBLiaahD/BVX2pznID8wMMZ5azxn/KacIdo
 YPbsG1dE3a6KTnVxtXKS+jh9MWGlZkVi49yxJDhA4C5ZKCCizj/UFUo7qFvcJcnEGV8m
 Cx3E1s8JPw2tztV3CF4dDy3nY1uS8Ycq/mkh4HN3YJynGdKDXNnddM0LRjIboAorWM0n
 6Y5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Aaj9Eqxm00442I9UsHwK98R5AWzqyFTC/zPZ/aayFrs=;
 b=jXpD4A7uvqzXREMClFibF84+hM6h0uDwEyzMCufcirM7NpSt7s2tmqrP+ZaO+dctSd
 A+RuHaKpLMtNmV3z0Yy86WsihlzVAsS5OIkVjCcyiGs/RVAulKpPiylxUKHHqjO0/3KC
 t6QAUic2PNkcN3pjGd5j7XESSKbyP6IXDvIcqJjErMGr80JrVs7hFy5z3IhzuPbd5wqH
 mmDK5DiFbsUlIbW2zuy44aMUbbALebQp89TINebXz6Ezm+KYpKnNi7DxBbvzGjZ9g+K8
 G7b/CQt95Uk/ffN25nxDBNQNunYPzsReDaISDPQQl1cfSXMqzNL07MyA1oj1+su50tZe
 +zEA==
X-Gm-Message-State: AOAM531vsXE0kpVBVpBMmWlWgsFCgQLLYm68WjmsHSePeDzNbLBwkaDK
 XC7JMLbhr0y6q7v3R2K5Nc0PmK8Sj2d/rg==
X-Google-Smtp-Source: ABdhPJz+OXz1+a0YFw+RSP5td2cIG1++fv+f7XBXzXhUCaFo9SPwqdTMDNUmeXyj7GI3TktxNzPqgw==
X-Received: by 2002:a63:ce45:0:b0:399:1124:fbfe with SMTP id
 r5-20020a63ce45000000b003991124fbfemr20800950pgi.542.1650478010011; 
 Wed, 20 Apr 2022 11:06:50 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 i2-20020a17090a058200b001d2fc489b8asm56681pji.25.2022.04.20.11.06.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 11:06:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 29/39] linux-user: Use qemu_set_log_filename_flags
Date: Wed, 20 Apr 2022 11:06:08 -0700
Message-Id: <20220420180618.1183855-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220420180618.1183855-1-richard.henderson@linaro.org>
References: <20220420180618.1183855-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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

Perform all logfile setup in one step.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220417183019.755276-30-richard.henderson@linaro.org>
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
2.34.1


