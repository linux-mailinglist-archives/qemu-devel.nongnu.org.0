Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C4E4E1D2C
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Mar 2022 18:35:45 +0100 (CET)
Received: from localhost ([::1]:46970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVzSy-0008Pd-0S
	for lists+qemu-devel@lfdr.de; Sun, 20 Mar 2022 13:35:44 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nVz63-0000Eg-LF
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 13:12:03 -0400
Received: from [2607:f8b0:4864:20::533] (port=40499
 helo=mail-pg1-x533.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nVz61-0003Uu-Vu
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 13:12:03 -0400
Received: by mail-pg1-x533.google.com with SMTP id w21so5045268pgm.7
 for <qemu-devel@nongnu.org>; Sun, 20 Mar 2022 10:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tbvVNjefg+clp9cnxa2dTGnw4THGled3q05yu65oSKo=;
 b=hqrARsdyXj855FwNSqVrrxSYRCsaLSWD4vBMiFL621BnosRPBDuvANTOIwY2/Bl31U
 UPotp2yuG3PXcaI/fmrBZ8edO/CnWPpmdc8zCuyCyjeBvZ3vhui3kxAPGWi0M457lB4d
 FhKh3Ivl7BUv1lm6FeHfN2mSz689Jsvaa8Rg9ZGYXhp4NXs7P2qZdVSNkV/H68YxyKA7
 RPTVwQ+4x34j68HfscjRUDE2468MmOCWnGuNyIzg+ZtRGWLCpFrOUEpjFquljqDdly84
 aJsymWEXJvkMM4o6xLG5GCF6l8DNdY4hlv/iTtvUJI7J33sRAgrWCtUyNkoA4aLYRCjF
 mzdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tbvVNjefg+clp9cnxa2dTGnw4THGled3q05yu65oSKo=;
 b=4sUjBeEcGotJ86sR6meMDPNEKSaFYYQdizZDDvB7f6y1wPCM0gjE2x3ywoYHy6QFsw
 MCWdj/DdVF0e5H2KtME4CvqvbgAwQWo+49wrVRqpfvrwoD9Ik5Vrpas4ovQSMffUXuqM
 i8djohxlXeJzUPDVqqU6qtbBC7IsZIwoqmg140G6Uioygv+ghXMdBBUmwUQBoi7iAW/3
 lEsh0yX2L+L7AIWsX3E4l6MchWp9AVGhEfDJkGTdKh9SfBdkv9z3z8Poh0fjFqN4FDKm
 GD3vx39mATefYI3rXmotgWTQIY6KfdRlv2scjJ3nmFw2XE/g6HaO1ge2EaSmXgdj4jHC
 JeGQ==
X-Gm-Message-State: AOAM533OQl88Fg2FWBa3S5EfXWe/q3PMV0u3D9bCPo9Le5lQKveEWdmQ
 KF540ouSODba5akHRepZGrBtyphQoQ07SA==
X-Google-Smtp-Source: ABdhPJyqyIlulEUa99r6zUzca4I3OVJJkzWiRAxGUO5FPCYhWKzCowgILJYGTau0nmP23o0wqzcG8A==
X-Received: by 2002:a63:5907:0:b0:382:2f93:5467 with SMTP id
 n7-20020a635907000000b003822f935467mr9381857pgb.460.1647796320720; 
 Sun, 20 Mar 2022 10:12:00 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 q12-20020a17090aa00c00b001bc6f1baaaesm17149697pjp.39.2022.03.20.10.12.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Mar 2022 10:12:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL for-7.1 26/36] linux-user: Use qemu_set_log_filename_flags
Date: Sun, 20 Mar 2022 10:11:25 -0700
Message-Id: <20220320171135.2704502-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220320171135.2704502-1-richard.henderson@linaro.org>
References: <20220320171135.2704502-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::533
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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

Perform all logfile setup in one step.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/main.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/linux-user/main.c b/linux-user/main.c
index 2bdee78019..75d13eff97 100644
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


