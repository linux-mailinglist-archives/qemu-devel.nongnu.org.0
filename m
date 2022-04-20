Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B56A9508F7A
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 20:30:22 +0200 (CEST)
Received: from localhost ([::1]:35846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhF5p-0004pq-R9
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 14:30:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhEj9-0006RG-Ul
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:06:55 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:41887)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhEj8-0001N8-CW
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:06:55 -0400
Received: by mail-pl1-x62c.google.com with SMTP id s14so2505758plk.8
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 11:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ggCkE4H0GpylDO/t2+Oit+yU2z/D8eefxrTSlD31bcs=;
 b=Tg6rA8NJvLT2odlNnWZkXSs2ISzYkKnQ8qRrrgnvHXveiG8IuFT4+Ksmmg8lYmfGZ0
 mG3h4wrK30x7GuGlw5jCChySypeVQZJ8vrfswfh2LWRSTMfD9J9N2JH1fPfxqdYGSt8g
 SdQyQ1VENYjWhYAXY41pafSri8GpQBD/9VmhlXaUprIWuw5l0pGQrzuWHS+bA3Qb1O8r
 ji4h+scdQfXofj4g/39xs42UyKTc7UBE0gdgpzi+Md5gibaxZaRogk33y2lKbOmu7PrV
 MH01zZ/OsulNAnrVgIfgDVDa7nn2tcBWM1kHsIibNm1RepHBIsJzsH8nuG5/3VNUDuGH
 r0Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ggCkE4H0GpylDO/t2+Oit+yU2z/D8eefxrTSlD31bcs=;
 b=biRCwmcsCBRu9YACN+uH0AOgAn0P+v0fPT9vqpgLhbI6IURM/Z7HMNxhLzlZgh9wzg
 HAe5u0E0fMwNNBozIqTxD4FVJ8hXo7e1RP7JDhiaezWBQ7wNrT/qD30qZnkBh71Z0pQR
 9HaLTxPBqkDc0XNtNKoFZp+gk18V3kYA/clFSFkePdKk9b0Jnr6vHKKrnXmY5aTli662
 OJd4zr2N3TmKmnVSfWjM0RUp5hlt45Whr4mfdGZnUU8NmZ3nESe3KAIcWyxxy86x1yRx
 RNoqhzxySkiLdrNjvqVKU9L2+BIO9rDvfF17ymXUZMDeI3BW44xauqgPeHpxOjUPdz+7
 dLTg==
X-Gm-Message-State: AOAM53063PAYE1Bazt6xXDE5Vy/sgQ2RLFTey4TLDsVBqFIE3o/nL+Y5
 6Lt6dT5PBfkvr2WlgCnF0RvRPvUEsFBupg==
X-Google-Smtp-Source: ABdhPJwCfDih7K9viZj93TMP8NZVs1Io1ph50znxdoUxIdQoRIzX1wiQKoQHJ1x2OrXkwsNrBv4jSw==
X-Received: by 2002:a17:902:f70b:b0:14d:643d:9c99 with SMTP id
 h11-20020a170902f70b00b0014d643d9c99mr22154719plo.18.1650478013067; 
 Wed, 20 Apr 2022 11:06:53 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 i2-20020a17090a058200b001d2fc489b8asm56681pji.25.2022.04.20.11.06.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 11:06:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 32/39] util/log: Rename logfilename to global_filename
Date: Wed, 20 Apr 2022 11:06:11 -0700
Message-Id: <20220420180618.1183855-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220420180618.1183855-1-richard.henderson@linaro.org>
References: <20220420180618.1183855-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rename to emphasize this is the file-scope global variable.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220417183019.755276-33-richard.henderson@linaro.org>
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
2.34.1


