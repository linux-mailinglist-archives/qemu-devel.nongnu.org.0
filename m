Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB95504943
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Apr 2022 21:18:32 +0200 (CEST)
Received: from localhost ([::1]:39660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngAPn-0002k2-F4
	for lists+qemu-devel@lfdr.de; Sun, 17 Apr 2022 15:18:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng9fl-0000Wo-Uk
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 14:30:58 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:45842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng9fe-0001qf-Dp
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 14:30:53 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 n33-20020a17090a5aa400b001d28f5ee3f9so785862pji.4
 for <qemu-devel@nongnu.org>; Sun, 17 Apr 2022 11:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uX5gBlJVnUc9rUPyZObfmNLI8aRWAhAMQVbBfuukxxU=;
 b=kjBdjffehRSDbqZ7Er/6YIOjQ/TS/DpGTELMmGv347wvKJepDjhmtWbU+PQwshtO1U
 vMgaE3C7GRw7vwUUcjxM9ALEDBELBqE3KLxEDLNoUbw6BC42zh1uutXPbpv4KmE58Wfg
 1i0aoWdWyvcLbZhL0DEwYtE0b/cO31X0Z2362VeKC6pILnfU+yFkQofYk4HApq5IbHCx
 oDJYb0lVPJSQDwvbdTCG2Mlt33aU55mPdpQ9E6XmFMtr3+qBQW+EnSHCMfGkzMHZMCXX
 aV7FlqqjN233AsziGJt0Dfjl30bjYamwxEC+FRGSrwqo3GOJ7nkofFrQdpaZ5eOOlEmK
 aGBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uX5gBlJVnUc9rUPyZObfmNLI8aRWAhAMQVbBfuukxxU=;
 b=WRiFjJNpW9OE3b6lbMzq5wEz3rvNsWSUJEicC3rwA3XGnP99nwZm3dZzzfTbV3AVj8
 F5gKk6vahCzp/OM8h4iwTzGZRxSFkz2oUH6yCfLyUKtfUETy1tDZBwhZvbxnKtZe1ZOt
 X4lZbbo77gmCLQ2zpO2ug0dSz619DK8nJkdUso9fHFLhZWEueDzj7+eGe6nxQoVSd9S/
 g4kpn5gzePNHiAfhYE70WeFawMkJZVURBO/3dwq8M0sU2Q8DEknFtR7M/+k/VIBeRHzW
 SkF9QUq54tRhpBr8LIAYyP0ULVBMrFYBQoXTkWltOcqrFktpl3zkkgmZKJ+pMKT+UJ/y
 uF7g==
X-Gm-Message-State: AOAM530DCOfRofQtk/0aU3i6bEO+tLIy9WqtRPEJ6FXfA3BcCjv0PAFg
 qFdpp8ldcg0zFOrJlkMGTcRQ5LhRrHeoyQ==
X-Google-Smtp-Source: ABdhPJyhiVliCkB1vEDUVEqlYVUmPWu815Zv2ZS08Sb2UU4b0m8bH8LfaWrRhXEZi+WELISLxwQzvQ==
X-Received: by 2002:a17:902:9308:b0:158:da34:ab55 with SMTP id
 bc8-20020a170902930800b00158da34ab55mr7880368plb.84.1650220247395; 
 Sun, 17 Apr 2022 11:30:47 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 on10-20020a17090b1d0a00b001d08a7d569csm8154011pjb.56.2022.04.17.11.30.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 11:30:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 32/39] util/log: Rename logfilename to global_filename
Date: Sun, 17 Apr 2022 11:30:12 -0700
Message-Id: <20220417183019.755276-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220417183019.755276-1-richard.henderson@linaro.org>
References: <20220417183019.755276-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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
Cc: alex.bennee@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rename to emphasize this is the file-scope global variable.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
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


