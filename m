Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E383B4E1D3A
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Mar 2022 18:46:37 +0100 (CET)
Received: from localhost ([::1]:32820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVzdT-0001AP-ML
	for lists+qemu-devel@lfdr.de; Sun, 20 Mar 2022 13:46:37 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nVz68-0000TM-W7
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 13:12:11 -0400
Received: from [2607:f8b0:4864:20::531] (port=37783
 helo=mail-pg1-x531.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nVz67-0003WJ-Ae
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 13:12:08 -0400
Received: by mail-pg1-x531.google.com with SMTP id bc27so8737071pgb.4
 for <qemu-devel@nongnu.org>; Sun, 20 Mar 2022 10:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gCBSdMHIZY9oTeXD1kIq/kpHPvmFkpcjsrAAZS31tWY=;
 b=B/shiz6qIymYhuvpj6wTahnrzdecbRNJ+ZyCC4mKOhd73lbUjNyp3v5htkzLKYMpWN
 LvSLdaU/Xvbd+QZr+7uVZvNj1Y4c3QJIRGruq2fWYjkwCwlsNjIoPyTdFt43RUKP0/2G
 Ju+p2iVUIVmUIYjAZa7yNXPFKLNyDq0ClJcQoLlWAwBMe1NVbi6Ej5Mb7ntHIe31uhTt
 hIy8g3PRQMQCO/hW9UH1uJgpYfkHOBNWtD09yfRtVtFwR4qpl83+r+iwNzfl6BEKFcyn
 DY1/MKnDK2xukst25SVKYk+8Np2FhIDRv8DeLwl5CtmTrv2xQs21Bll0kOLVu0tQjRgb
 Ct+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gCBSdMHIZY9oTeXD1kIq/kpHPvmFkpcjsrAAZS31tWY=;
 b=2O2QAI1X1tTlo/jdXgFv15oMKPPPfVq3ntZiEx3/WAKvTzIEOmMsQPJ8jLSk31idT2
 N0f0BI7ifrok59JjIrUxMolO83RD2/NZ63oCvZT4MyIEyWaxsFXpcCh90fI+sgWouIjp
 dnKFklA+l85AcJXhpr6TjY2pDjYhq1tIEuHra6gKaPSg85ylsxRr016i2j2ag6oNzOgo
 3+oVFu1aMRbThY00PzD/PYJ7GpQ77VT6mMFhT8c+WIgR7cn82eTySu7UQ+kr91gyAAyt
 Q7/KwldOysOFvyR7ZJLehNwt/Gzff8T9KdAinCJ1UbPWIjmhUzv4fRR6E/UnPjDdEk00
 W89g==
X-Gm-Message-State: AOAM533RXVTtP7B5iMh8ahwDTYHNZZpvDgiDMkQtQ70upkSIT+U+JK07
 ZCtY2DXfPKgDHV3I5ViuYAJwZmfq0G7uyQ==
X-Google-Smtp-Source: ABdhPJxFLaCvbxeG/crmb68sDqDsdkXWvSxcOYNEmJJZsI4HXJuJlSFdC54mQBAjsddWt/HKxZfrSA==
X-Received: by 2002:a63:1223:0:b0:381:32e6:e56b with SMTP id
 h35-20020a631223000000b0038132e6e56bmr15007259pgl.375.1647796326031; 
 Sun, 20 Mar 2022 10:12:06 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 q12-20020a17090aa00c00b001bc6f1baaaesm17149697pjp.39.2022.03.20.10.12.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Mar 2022 10:12:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL for-7.1 32/36] util/log: Hoist the eval of is_daemonized in
 qemu_set_log_internal
Date: Sun, 20 Mar 2022 10:11:31 -0700
Message-Id: <20220320171135.2704502-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220320171135.2704502-1-richard.henderson@linaro.org>
References: <20220320171135.2704502-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::531
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
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

Only call is_daemonized once.
We require the result on all paths after this point.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 util/log.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/util/log.c b/util/log.c
index 42b13e6bf1..f1f6d09c90 100644
--- a/util/log.c
+++ b/util/log.c
@@ -132,6 +132,7 @@ static void qemu_set_log_internal(const char *filename, bool changed_name,
                                   int log_flags, Error **errp)
 {
     bool need_to_open_file;
+    bool daemonized;
     QemuLogFile *logfile;
 
     QEMU_LOCK_GUARD(&global_mutex);
@@ -187,7 +188,8 @@ static void qemu_set_log_internal(const char *filename, bool changed_name,
      *     or to a file (if there is a filename).
      *   If we are daemonized, we will only log if there is a filename.
      */
-    need_to_open_file = log_flags && (!is_daemonized() || filename);
+    daemonized = is_daemonized();
+    need_to_open_file = log_flags && (!daemonized || filename);
 
     if (logfile && !need_to_open_file) {
         qatomic_rcu_set(&global_file, NULL);
@@ -205,7 +207,7 @@ static void qemu_set_log_internal(const char *filename, bool changed_name,
                 return;
             }
             /* In case we are a daemon redirect stderr to logfile */
-            if (is_daemonized()) {
+            if (daemonized) {
                 dup2(fileno(fd), STDERR_FILENO);
                 fclose(fd);
                 /* This will skip closing logfile in qemu_logfile_free. */
@@ -213,7 +215,7 @@ static void qemu_set_log_internal(const char *filename, bool changed_name,
             }
         } else {
             /* Default to stderr if no log file specified */
-            assert(!is_daemonized());
+            assert(!daemonized);
             fd = stderr;
         }
 
-- 
2.25.1


