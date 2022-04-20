Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB35C508F9A
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 20:41:02 +0200 (CEST)
Received: from localhost ([::1]:34604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhFG9-0006ja-UF
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 14:41:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhEjB-0006X8-P0
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:06:58 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:51789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhEjA-0001NS-6n
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:06:57 -0400
Received: by mail-pj1-x1033.google.com with SMTP id bg24so2682596pjb.1
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 11:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wMWj7YM0nzYagMh7eETc1VXY8wfINhxGbhd+jW17juQ=;
 b=puHKylPILerUTc4djNeXItly9Glyr06soqRqdfpgM0+SgYlytr0c7F7gsJUhyrWVSj
 JhnjvzewVYDJ8Oa8ODOKKeRtYtQdHqMa/5MDymdhgVVHdUVcbzVIX5xxrlwjV5EmFLbe
 IOnK7IGnVkBPrK3eTRI9eOQLLikOo5cfhAUAvnzsfVpXqEU5szMUtXsoIdBBCp2kJkYv
 k4ZpWfzwHasev7zIfRIRhxwvC3zNunk+ABTMLIuVIb1eFr5FwqG7okjl+00zIUI1zfTO
 N5Pc6WSsYjVDSy7+H/y+lvZhuaFzJWWK6Y+2rUaMvjjvh/GVxVCCwDOPqrnAIjQWbLjM
 SKHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wMWj7YM0nzYagMh7eETc1VXY8wfINhxGbhd+jW17juQ=;
 b=mgcDuS3WQLE6SqzrzeeU3x/dGaiQBvU4e/rp735xwvUlNLLahe/CXmPLqe9sMM4TKE
 mTJaeWK7qZSfo6wj2An90bdQu71ZNpeVx6DaOC9t7QQs0PxKuuco84KXh0eQyADONvrH
 5ZaZJKVPBeID5Fr8kREXx0bGm+gACJxa/RVlzmPaEiTqYnbSFclEHuWWvjRTLrLdKqAE
 4r1eKvrxySMEBY2ZqbjFoUMbTAJqOOoYTQgR9juzh3pAsR7H4CK/UBvLXqAzj08We47O
 BE+zeS6YlxDgNdlQCMJwYbb2iLCckvFCMH17nifhXQ9nfsaTIdXl6Dsaxl8tJL4dLGzm
 mndQ==
X-Gm-Message-State: AOAM533FwPnXvIv+jWGfwgrSoCib3pfP4bBqZZczTbS3K/PmjOp0ZTne
 162no6RNhPatVghmKXjfojecPmVBykVxpw==
X-Google-Smtp-Source: ABdhPJxcMxwGzcTjp4cZAo2EWl7casgQ9lDraRXRHjXT9/B/5wNwro1Um6/eNaZDeB1yuGP5BOuB4w==
X-Received: by 2002:a17:903:20f:b0:158:d86a:f473 with SMTP id
 r15-20020a170903020f00b00158d86af473mr21699968plh.92.1650478014908; 
 Wed, 20 Apr 2022 11:06:54 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 i2-20020a17090a058200b001d2fc489b8asm56681pji.25.2022.04.20.11.06.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 11:06:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 34/39] util/log: Rename qemu_logfile_mutex to global_mutex
Date: Wed, 20 Apr 2022 11:06:13 -0700
Message-Id: <20220420180618.1183855-35-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220420180618.1183855-1-richard.henderson@linaro.org>
References: <20220420180618.1183855-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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

Rename to emphasize this covers the file-scope global variables.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220417183019.755276-35-richard.henderson@linaro.org>
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
2.34.1


