Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E92944E8163
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Mar 2022 15:18:01 +0100 (CET)
Received: from localhost ([::1]:56912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nY7Eu-0004xu-NO
	for lists+qemu-devel@lfdr.de; Sat, 26 Mar 2022 10:18:00 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nY6UB-0002sZ-RE
 for qemu-devel@nongnu.org; Sat, 26 Mar 2022 09:29:44 -0400
Received: from [2607:f8b0:4864:20::22b] (port=35702
 helo=mail-oi1-x22b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nY6UA-0005yh-Ft
 for qemu-devel@nongnu.org; Sat, 26 Mar 2022 09:29:43 -0400
Received: by mail-oi1-x22b.google.com with SMTP id e4so11104319oif.2
 for <qemu-devel@nongnu.org>; Sat, 26 Mar 2022 06:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=31e7uABinGNdcjY/s1pEdjv5HJDeYHfqF6kH7oc0qxw=;
 b=BIMpVWQukU8Pz45UwKC45D0tSbdN+9fkit1+duChgFwIlSy1BSvsunRjaF7IAc3vTg
 yBwuKpUDPd6DMy1IMmMfYqgakXWcC0ipKsQuXG2GWvxEJBTJA/rpFhnJbdYLW6eVyM40
 hujFFz2muIsa9/DvAtvoWNQ92HbhtWJIu5C2sI7y9aA+5SPWbGdG2YZjTORfHjsxOF3K
 nwFRDFcryVI9UeqrCDUeHvBAeDXPBhOvvuIAln1Q9f5MAzO1QfHUU3xssh9TKH66IgU8
 d3VGBh9ZvsDeNQC6UC1HaD2yr5iLkOtOAXgdY1gJJXJktMr74dT1V4vQaOYgx8YZiFhw
 qPRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=31e7uABinGNdcjY/s1pEdjv5HJDeYHfqF6kH7oc0qxw=;
 b=3AuPV+ed8SWRfogBXwAKCOGywoiAzx3ml+WEQyUqKQiw6FP0X+5LZe2DAtcptl3IkI
 4WS9BlPdUQiL/1DwJL+lrlAsgmr4lSiH6nUQs7NWXU7kt1LgupwW3hzRgfAYMJF8rZMg
 pYjEsagXD1oWwDxlLWT3ofsAlQGD3BJKgNxsOqM9vJQKRL2/dArb2dWT+495D6ajMfku
 6quC4GcffDJKQjZKj+rglZYBfM7uJocBKH9pdmwzx5JF4IJqs3IpPVvOURw3PGLkpVjw
 VWudRMhUNypyKEcC3i5tsWzRW1kxlbyfgr7VVB8B/hOOja5kByUonMNpzh5XNduJFT8o
 kbEg==
X-Gm-Message-State: AOAM53327aTvgc3j2yK2XqgNajnzxlYInN/yfHq7y3A1X87VMwQZMbiv
 /nUB8TsGEvamXG6c1C3Yu+A/d/QHkCoj30ex
X-Google-Smtp-Source: ABdhPJybvmO8BwbGzHAcWAqK5LSoeyyEJAScbl00vHfe/fj28JeRcMd2Nx+tZEdj4q2aRfPQsy9H0Q==
X-Received: by 2002:a05:6808:7c2:b0:2d9:cf1b:bb2f with SMTP id
 f2-20020a05680807c200b002d9cf1bbb2fmr7880225oij.287.1648301381553; 
 Sat, 26 Mar 2022 06:29:41 -0700 (PDT)
Received: from localhost.localdomain (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168]) by smtp.gmail.com with ESMTPSA id
 s24-20020a056808209800b002da3b9bf8e0sm4394509oiw.32.2022.03.26.06.29.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Mar 2022 06:29:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 34/39] util/log: Rename qemu_logfile_mutex to global_mutex
Date: Sat, 26 Mar 2022 07:25:29 -0600
Message-Id: <20220326132534.543738-43-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220326132534.543738-1-richard.henderson@linaro.org>
References: <20220326132534.543738-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::22b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::22b;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22b.google.com
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


