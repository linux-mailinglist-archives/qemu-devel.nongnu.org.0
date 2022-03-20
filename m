Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E8CC4E1D3E
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Mar 2022 18:52:19 +0100 (CET)
Received: from localhost ([::1]:40752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVziz-0006sA-K3
	for lists+qemu-devel@lfdr.de; Sun, 20 Mar 2022 13:52:17 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nVz6B-0000UE-9V
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 13:12:12 -0400
Received: from [2607:f8b0:4864:20::434] (port=37575
 helo=mail-pf1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nVz69-0003Wr-EE
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 13:12:11 -0400
Received: by mail-pf1-x434.google.com with SMTP id t5so13673775pfg.4
 for <qemu-devel@nongnu.org>; Sun, 20 Mar 2022 10:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HX+XPB3fiJw2JeMEDh6SpA1VcXxzUSznHfCOQKqLolk=;
 b=DjlLVb6GZCbSdFyEw0mXZZ4IMhKbhvPFBlTIeATr1n7nBqJ9834Zr+Q6ohGOQAi7A+
 HSdW0LkSzZTjgspWWu/UtluSQM7FwF0YAORM2RrPc9jWWMnQ4ng9YhU2RL5lqRt2NeJK
 Rx6GEINtOOoro5qlC5oBVIb9/fEn+4oGrCGPOCBtbXysamsJ79IRuQTLXyjHHKpdQRSm
 PA/Y2IHLaSeYlf92lDDiLocFJQspKfrE5hP7AC6vuYusAsAGEW06pbWHRaZ30VQRKFtr
 HarbMetHhNtxjoXBi10ymy/KprCvpvRgwlmUWPKzp3M2YlaQgMKox9Fi95hogUi8uzX0
 NTCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HX+XPB3fiJw2JeMEDh6SpA1VcXxzUSznHfCOQKqLolk=;
 b=oKZc2+Eyt5RJawXvCL2++gVmW1UOXDGq+/VNueTsI0nS9uQzrafwdMGluQd1PyyBXU
 lvmQT3IYMmqoBAvyLwVWelF2Bcvxn4uHrHnOxWt7HQK0a00DxFPQfRkGKUltYtsC7WY2
 xKnu5Nscl812qUr17qnNoY7AfYk5TBFznbV5iSx94Cxb1/eXsTqcM7id9hkPfhznVarI
 fvAx3vOcOMXZZyAQXubBsMhrIJsWlLorANC3WoThttc7dHmGL0f1ZJBn4V9mc1prFm45
 K5bljLDVg/XMSPgmc60UStcFs5R1Tj+uvbs+pp+K7ixJ8AlzpOiNYwc5ndIGwBrC2sTV
 2L6g==
X-Gm-Message-State: AOAM530rW+Axx6jBdC37woWEO9HKO1liTnTa63pl2s5/PuTYCgLli7sg
 0Fw/GaZWkoMJD8qv2aD+NCxVnjTi6m+BPQ==
X-Google-Smtp-Source: ABdhPJzfb4BOWi080JrA0+dVOrCPKTwdsMTOgfPZu8JOHJXt8eCmxMTWTZWPh2ofHcee9Z3RTw7blg==
X-Received: by 2002:a63:2259:0:b0:382:294c:5bee with SMTP id
 t25-20020a632259000000b00382294c5beemr10779401pgm.387.1647796327912; 
 Sun, 20 Mar 2022 10:12:07 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 q12-20020a17090aa00c00b001bc6f1baaaesm17149697pjp.39.2022.03.20.10.12.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Mar 2022 10:12:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL for-7.1 34/36] util/log: Rename QemuLogFile to RCUCloseFILE
Date: Sun, 20 Mar 2022 10:11:33 -0700
Message-Id: <20220320171135.2704502-35-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220320171135.2704502-1-richard.henderson@linaro.org>
References: <20220320171135.2704502-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::434
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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

s/QemuLogFile/RCUCloseFILE/
s/qemu_logfile_free/rcu_close_file/

Emphasize that this is only a carrier for passing a pointer
to call_rcu for closing, and not the real logfile.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 util/log.c | 28 +++++++++++++---------------
 1 file changed, 13 insertions(+), 15 deletions(-)

diff --git a/util/log.c b/util/log.c
index 596de0050f..e966d1091d 100644
--- a/util/log.c
+++ b/util/log.c
@@ -29,15 +29,15 @@
 #include "qemu/rcu.h"
 
 
-typedef struct QemuLogFile {
+typedef struct RCUCloseFILE {
     struct rcu_head rcu;
     FILE *fd;
-} QemuLogFile;
+} RCUCloseFILE;
 
 /* Mutex covering the other global_* variables. */
 static QemuMutex global_mutex;
 static char *global_filename;
-static QemuLogFile *global_file;
+static RCUCloseFILE *global_file;
 
 int qemu_loglevel;
 static int log_append = 0;
@@ -52,7 +52,7 @@ bool qemu_log_enabled(void)
 /* Returns true if qemu_log() will write somewhere other than stderr. */
 bool qemu_log_separate(void)
 {
-    QemuLogFile *logfile;
+    RCUCloseFILE *logfile;
     bool res = false;
 
     rcu_read_lock();
@@ -68,7 +68,7 @@ bool qemu_log_separate(void)
 
 FILE *qemu_log_lock(void)
 {
-    QemuLogFile *logfile;
+    RCUCloseFILE *logfile;
 
     rcu_read_lock();
     logfile = qatomic_rcu_read(&global_file);
@@ -117,14 +117,12 @@ static void __attribute__((__constructor__)) startup(void)
     qemu_mutex_init(&global_mutex);
 }
 
-static void qemu_logfile_free(QemuLogFile *logfile)
+static void rcu_close_file(RCUCloseFILE *r)
 {
-    g_assert(logfile);
-
-    if (logfile->fd != stderr) {
-        fclose(logfile->fd);
+    if (r->fd != stderr) {
+        fclose(r->fd);
     }
-    g_free(logfile);
+    g_free(r);
 }
 
 /* enable or disable low levels log */
@@ -133,7 +131,7 @@ static void qemu_set_log_internal(const char *filename, bool changed_name,
 {
     bool need_to_open_file;
     bool daemonized;
-    QemuLogFile *logfile;
+    RCUCloseFILE *logfile;
 
     QEMU_LOCK_GUARD(&global_mutex);
     logfile = global_file;
@@ -187,7 +185,7 @@ static void qemu_set_log_internal(const char *filename, bool changed_name,
 
     if (logfile && (!need_to_open_file || changed_name)) {
         qatomic_rcu_set(&global_file, NULL);
-        call_rcu(logfile, qemu_logfile_free, rcu);
+        call_rcu(logfile, rcu_close_file, rcu);
         logfile = NULL;
     }
 
@@ -205,7 +203,7 @@ static void qemu_set_log_internal(const char *filename, bool changed_name,
             if (daemonized) {
                 dup2(fileno(fd), STDERR_FILENO);
                 fclose(fd);
-                /* This will skip closing logfile in qemu_logfile_free. */
+                /* This will skip closing logfile in rcu_close_file. */
                 fd = stderr;
             }
         } else {
@@ -216,7 +214,7 @@ static void qemu_set_log_internal(const char *filename, bool changed_name,
 
         log_append = 1;
 
-        logfile = g_new0(QemuLogFile, 1);
+        logfile = g_new0(RCUCloseFILE, 1);
         logfile->fd = fd;
         qatomic_rcu_set(&global_file, logfile);
     }
-- 
2.25.1


