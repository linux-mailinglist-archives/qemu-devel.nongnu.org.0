Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 992B24E1D39
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Mar 2022 18:45:57 +0100 (CET)
Received: from localhost ([::1]:60362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVzcq-0000gw-ES
	for lists+qemu-devel@lfdr.de; Sun, 20 Mar 2022 13:45:56 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nVz67-0000QM-TH
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 13:12:07 -0400
Received: from [2607:f8b0:4864:20::62d] (port=42804
 helo=mail-pl1-x62d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nVz66-0003W6-DK
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 13:12:07 -0400
Received: by mail-pl1-x62d.google.com with SMTP id p17so10876873plo.9
 for <qemu-devel@nongnu.org>; Sun, 20 Mar 2022 10:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=djzZiLuHHr1dL1YPwKuuIKcK6Xvam7Lxv67yyC1ECSo=;
 b=Wy13zcjzhRw/UmQnsSco9nDFFjzFjYfWT1KH3Gh6A4G8t/b57AIgVHIj3iXoxzJEou
 0E4OVjOV5P1NFKaqsYg7tNzHymvGfw4R6VIRS9tUUGjf/sSPnc9zObzqrDEkan8UgLGw
 Du5xr7uzYBQdIBxaUDvBOkx19rsDs+ZRUH/8FVM7gvKhrjjldxzsZ0eirS44birEfSBm
 1ssgYAzLT6yHOFf7kJfFlAc893zehOiazsLdmOT5X3JFtKeJoCLNwHITQzJqjGLbgYqq
 2xhXmVjOafJBuD10h4rqy+eoyx7gPnF4LdqjceEkSVNMQA3k5KpGIzk9tBhNQg+yDPVN
 1YvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=djzZiLuHHr1dL1YPwKuuIKcK6Xvam7Lxv67yyC1ECSo=;
 b=rgZwjVF+Uuoy4kPQQjil6ZytMro615g90IJpXbs+KEUfKoDWkv/7RiuYgMr+oZxw0G
 Za9rtcTHWqZC08GRN/cfDs7iNrAeusE2H2BVIYbG9/mxm0mJhd59k/e3W86M6VWMv85+
 5NKghzLoDJgsPZEsvZTWOqXkzK9PxOVSqCY56Y2YsT8BymfeuFN2MbPRhDoVQZsNszuV
 a2rLalMp1+dHn6igoiEdpicUmXh1r/7/gjneaWsuqoqYmM1A/YpjqQw1MsLk+YwXFvRS
 BVY8gMroCquND8QgPsGcyS48CNAUY8fxq3jxujcrPAMU7yNG41jA6KVcasgHoap+fnUk
 pAsw==
X-Gm-Message-State: AOAM532VaDBXCoRnZberXA2Jn6x8IrQ+Y1pjtB3jkJNaa4N15k78jghO
 bkOMlGdqrJ/oYUlDQ+9WJSoLCZ2WmFD5fQ==
X-Google-Smtp-Source: ABdhPJyqv39waDqbKopvIIWFBM6D+Tdraz8E5bb338HbMOh9o6Gag8AzWdSpLByBEB1HgfrTDRgVyQ==
X-Received: by 2002:a17:902:c949:b0:154:5215:1db1 with SMTP id
 i9-20020a170902c94900b0015452151db1mr2223793pla.163.1647796325188; 
 Sun, 20 Mar 2022 10:12:05 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 q12-20020a17090aa00c00b001bc6f1baaaesm17149697pjp.39.2022.03.20.10.12.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Mar 2022 10:12:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL for-7.1 31/36] util/log: Rename qemu_logfile_mutex to
 global_mutex
Date: Sun, 20 Mar 2022 10:11:30 -0700
Message-Id: <20220320171135.2704502-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220320171135.2704502-1-richard.henderson@linaro.org>
References: <20220320171135.2704502-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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

Rename to emphasize this covers the file-scope global variables.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 util/log.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/util/log.c b/util/log.c
index 0676ce5bd6..42b13e6bf1 100644
--- a/util/log.c
+++ b/util/log.c
@@ -34,9 +34,11 @@ typedef struct QemuLogFile {
     FILE *fd;
 } QemuLogFile;
 
+/* Mutex covering the other global_* variables. */
+static QemuMutex global_mutex;
 static char *global_filename;
-static QemuMutex qemu_logfile_mutex;
 static QemuLogFile *global_file;
+
 int qemu_loglevel;
 static int log_append = 0;
 static GArray *debug_regions;
@@ -110,9 +112,9 @@ int qemu_log(const char *fmt, ...)
     return ret;
 }
 
-static void __attribute__((__constructor__)) qemu_logfile_init(void)
+static void __attribute__((__constructor__)) startup(void)
 {
-    qemu_mutex_init(&qemu_logfile_mutex);
+    qemu_mutex_init(&global_mutex);
 }
 
 static void qemu_logfile_free(QemuLogFile *logfile)
@@ -132,7 +134,7 @@ static void qemu_set_log_internal(const char *filename, bool changed_name,
     bool need_to_open_file;
     QemuLogFile *logfile;
 
-    QEMU_LOCK_GUARD(&qemu_logfile_mutex);
+    QEMU_LOCK_GUARD(&global_mutex);
     logfile = global_file;
 
     if (changed_name) {
-- 
2.25.1


