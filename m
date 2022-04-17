Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 318AF504940
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Apr 2022 21:16:40 +0200 (CEST)
Received: from localhost ([::1]:34652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngANz-0007nq-9X
	for lists+qemu-devel@lfdr.de; Sun, 17 Apr 2022 15:16:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng9fo-0000XO-4n
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 14:31:00 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:35759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng9fl-0001qr-87
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 14:30:59 -0400
Received: by mail-pg1-x52f.google.com with SMTP id k62so9002601pgd.2
 for <qemu-devel@nongnu.org>; Sun, 17 Apr 2022 11:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8g8xUltHBVQUHV98Q/wu8AvtaiRfGRVKXLPd8aD+jcM=;
 b=ihyVe4PP/zrSSRSjQVdvBHE8vf/Jw6bMHL6TgU+Z8aSMaUoO3TCyZkaCWHN9K7ME1P
 nS6N0eNSFfuZbi8jGv49y20heY3is0oESEv7ujw9Nhr2FIJmVOFV0usWHu4tac2pA5Fz
 kX7yfzzcT26uDKMYDtXJBWWnIYOhQ8PuKZmRWbeCe7EF1lyu0kqg5TkMgisEUgD/81dC
 HUTYF62Yk/E4yIut5VZzLUH6NYZoDwHcYc5a+eoN1RvBL1UPGJwm2dzsvW+DmV1wNoB4
 Dzfjmdm6h/E55gc02GSCHTxt8GCPmYxYEgCVXg0CwWqFC09ocGu0DmOc2CE/Aj/LCtMl
 RDSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8g8xUltHBVQUHV98Q/wu8AvtaiRfGRVKXLPd8aD+jcM=;
 b=E4+JzaPIgiuyk5pUc7IHpxK4wkZuvZczQwsLa6FuiuYF5TUp2IgX9iNnaNZXoMn8Qz
 Ms+XEnxi8EM5xRUFA4B/t6Hz3ehxB0tfWNxP4x9BzYb/P8Eh4upXyh4igfuXSfwqhJX+
 KQElM/khf3djWvVpgEY986KFBWwSEHXoJly7W/HAu8vmtDf71/b7KwtABg0j7tjsB2oB
 Zaa4DCCDtuiSA4XvAPmYyVC9UJbj3FA2b674kQXfpaOzdJpHk0s0MU09pykkEdEE3rKU
 +Xv9HBmUGjUTYr0J96cFbD+oiKQi62f5d6gIXKpx7tSV/svBppkxHV3ijVLFYtAUXBPf
 cK5A==
X-Gm-Message-State: AOAM5310DVcWATmxNJVZijrqGiyD7MbyLeOJ6Zs3JjKOcWIyppDPhe2Q
 Q+5JazuM2kbmP7uPXJpcVy65STUPfOJT9g==
X-Google-Smtp-Source: ABdhPJxSLwxkG8RRgYUvWZX2Eis+4R5ca6qVLaJKelm/w09nXQdf2IFi9/mhg5ZzdQDNuKtdRsTJLQ==
X-Received: by 2002:a63:4c52:0:b0:398:db25:d2b8 with SMTP id
 m18-20020a634c52000000b00398db25d2b8mr7470619pgl.432.1650220248965; 
 Sun, 17 Apr 2022 11:30:48 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 on10-20020a17090b1d0a00b001d08a7d569csm8154011pjb.56.2022.04.17.11.30.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 11:30:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 34/39] util/log: Rename qemu_logfile_mutex to global_mutex
Date: Sun, 17 Apr 2022 11:30:14 -0700
Message-Id: <20220417183019.755276-35-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220417183019.755276-1-richard.henderson@linaro.org>
References: <20220417183019.755276-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
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

Rename to emphasize this covers the file-scope global variables.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 util/log.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/util/log.c b/util/log.c
index 425f0064b0..bb201664ac 100644
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
@@ -101,9 +103,9 @@ void qemu_log(const char *fmt, ...)
     }
 }
 
-static void __attribute__((__constructor__)) qemu_logfile_init(void)
+static void __attribute__((__constructor__)) startup(void)
 {
-    qemu_mutex_init(&qemu_logfile_mutex);
+    qemu_mutex_init(&global_mutex);
 }
 
 static void qemu_logfile_free(QemuLogFile *logfile)
@@ -123,7 +125,7 @@ static bool qemu_set_log_internal(const char *filename, bool changed_name,
     bool need_to_open_file;
     QemuLogFile *logfile;
 
-    QEMU_LOCK_GUARD(&qemu_logfile_mutex);
+    QEMU_LOCK_GUARD(&global_mutex);
     logfile = global_file;
 
     if (changed_name) {
-- 
2.25.1


