Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5B24E812B
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Mar 2022 14:50:53 +0100 (CET)
Received: from localhost ([::1]:54746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nY6oe-0006nc-7b
	for lists+qemu-devel@lfdr.de; Sat, 26 Mar 2022 09:50:52 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nY6U9-0002ov-Tj
 for qemu-devel@nongnu.org; Sat, 26 Mar 2022 09:29:41 -0400
Received: from [2607:f8b0:4864:20::234] (port=45720
 helo=mail-oi1-x234.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nY6U8-0005yS-EQ
 for qemu-devel@nongnu.org; Sat, 26 Mar 2022 09:29:41 -0400
Received: by mail-oi1-x234.google.com with SMTP id 12so11072747oix.12
 for <qemu-devel@nongnu.org>; Sat, 26 Mar 2022 06:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tAM8l8umDTOu711aIMp31KRAq18xpQUFDBfm3PD7em4=;
 b=BNQUIdUyW12rPVzyDZtNkkk27GgsLQDiq0rWh5/IsmhUcyQLn2lMCdiKExaECvNE1Y
 EhHVsLDhQhI1rtUEON3yuxufOH4wdIJTzGFmsTvCznYy6KhJXqIo8R9Ysw598Q+i8vNB
 Vw4iePBT8S8+HW98dZe4xwJf/iR8ZIRXWfUH+Qd7+DCdcini/+n5prIzEJ8+14CY/mxS
 XhrUe1FLPtshVU4qgEPKoi6h8yKeEFjijD68AUzEW97CuILFJwBfM61B/q94kQ4Od5N/
 pt96y5lku82eAhRKLLn8n0vrk8o9VBnjJUvmP89MOc2gIbg3RuGSD4scYHsng1yL+mfU
 gK0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tAM8l8umDTOu711aIMp31KRAq18xpQUFDBfm3PD7em4=;
 b=ylSvkJrw9mlzEG0Xz7F+XN1pYv+bSle9PpiKbWYmnpKKyAIrQECI0uI8S6FqwDWDFu
 Yp/6IR/4wkCOJIo+pH7cCUGom7hSuaKa+LetzdiqoFr/7VGRBCM+boDZmupvuFA60MqQ
 3Zk5a6ej+G9/Z2cpykVjBs9t9flxJAead7MYASCTBSomXJhBMWdOwtSCkjWvQIbMCn/H
 GC/Ia3ncQAXjezfRbaie/x5/PwqHT5gfqfN45CUzpyABKkk6Q7sIMDpZOJF6TaRlEhxr
 /7zdVik9htLGfHROXkrBlC28zazi3nKXM431QA9Yh12WbOrcd6CixxRUgEgiGLUca+4o
 PMtA==
X-Gm-Message-State: AOAM532fuLxDEMiTjGVkh2wRWCrx68H5pj3e7xFcKDGz0AqwfgRrxsnw
 lHkqldKl+xZWXYNtaw+Ts8L5TtHb/6MO3JxM
X-Google-Smtp-Source: ABdhPJwfIkkLaRq+SQgqCsdqjItym0Cu4n1liJI6ifCavW0nYxOuMh/C8WjLjWgbfcbGCeNW+ULbWg==
X-Received: by 2002:a05:6808:9b4:b0:2ef:9e41:4f6f with SMTP id
 e20-20020a05680809b400b002ef9e414f6fmr7752317oig.40.1648301379350; 
 Sat, 26 Mar 2022 06:29:39 -0700 (PDT)
Received: from localhost.localdomain (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168]) by smtp.gmail.com with ESMTPSA id
 s24-20020a056808209800b002da3b9bf8e0sm4394509oiw.32.2022.03.26.06.29.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Mar 2022 06:29:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 32/39] util/log: Rename logfilename to global_filename
Date: Sat, 26 Mar 2022 07:25:27 -0600
Message-Id: <20220326132534.543738-41-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220326132534.543738-1-richard.henderson@linaro.org>
References: <20220326132534.543738-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::234
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::234;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x234.google.com
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
Cc: alex.bennee@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rename to emphasize this is the file-scope global variable.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 util/log.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/util/log.c b/util/log.c
index 491a8f97f9..b3f79deb6c 100644
--- a/util/log.c
+++ b/util/log.c
@@ -34,7 +34,7 @@ typedef struct QemuLogFile {
     FILE *fd;
 } QemuLogFile;
 
-static char *logfilename;
+static char *global_filename;
 static QemuMutex qemu_logfile_mutex;
 static QemuLogFile *qemu_logfile;
 int qemu_loglevel;
@@ -151,8 +151,8 @@ static bool qemu_set_log_internal(const char *filename, bool changed_name,
             }
         }
 
-        g_free(logfilename);
-        logfilename = newname;
+        g_free(global_filename);
+        global_filename = newname;
         filename = newname;
 
         if (logfile) {
@@ -161,7 +161,7 @@ static bool qemu_set_log_internal(const char *filename, bool changed_name,
             logfile = NULL;
         }
     } else {
-        filename = logfilename;
+        filename = global_filename;
     }
 
 #ifdef CONFIG_TRACE_LOG
@@ -173,9 +173,8 @@ static bool qemu_set_log_internal(const char *filename, bool changed_name,
      * In all cases we only log if qemu_loglevel is set.
      * Also:
      *   If not daemonized we will always log either to stderr
-     *     or to a file (if there is a logfilename).
-     *   If we are daemonized,
-     *     we will only log if there is a logfilename.
+     *     or to a file (if there is a filename).
+     *   If we are daemonized, we will only log if there is a filename.
      */
     need_to_open_file = log_flags && (!is_daemonized() || filename);
 
-- 
2.25.1


