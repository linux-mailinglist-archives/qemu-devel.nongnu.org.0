Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A8234E1D45
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Mar 2022 18:57:16 +0100 (CET)
Received: from localhost ([::1]:53916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVznn-0007TP-Ok
	for lists+qemu-devel@lfdr.de; Sun, 20 Mar 2022 13:57:15 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nVz66-0000Mx-Ko
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 13:12:06 -0400
Received: from [2607:f8b0:4864:20::52e] (port=41478
 helo=mail-pg1-x52e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nVz64-0003Vi-Gy
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 13:12:05 -0400
Received: by mail-pg1-x52e.google.com with SMTP id o26so8742682pgb.8
 for <qemu-devel@nongnu.org>; Sun, 20 Mar 2022 10:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bk/zAi7BLJglpoQ02+PCS2bvRMTlUag208O7lg3rkCQ=;
 b=iDsHyq6pt0hnEnGlxpQcGnartQoiIGXEO7lQ2h5w4KZCwySYV9hj+cf18DqtrDBaUo
 SbDqtxM3/g6CRXkx67YqqrGLPT8+UNoLkw/7JLxwyBerMI5/uBjwoRwaZiKeCvPIOWLy
 9kgTpNXq5Db+geYDIL3KlJoFW9yD14NCZ8GQQm2a6jPQbhQLsPKJ6Nx0BRTxjx8+h5L0
 3kYBtcRPR0Hrc1v+Froba5Z232NOWcKgi9HgPuE2yB/onJ4/MJHP5eQgTkLEk23JRZNM
 7VyeCfFVM7w2uGGHClbCa/azwK8jp6nWis3uA5W+DfFxtFSGoU0yyj2KOADbdZpznmG8
 VxIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bk/zAi7BLJglpoQ02+PCS2bvRMTlUag208O7lg3rkCQ=;
 b=cLt/6JCeSFZUUqMbdaM1kZja8tNrD8nv+UIRZna5YWxwu+ZVtpujpwB6o0XBLZjhC1
 LKEcSBClzig573P1sj5jFd4rbIQGLH9m087H1z7W+YhVNhrMlPu7mJ/i0wbzf8W9nxXu
 2OM9sYh3mh5fwZuV1m031OirMNOKktcgo+ID0S+ScraYMX50ntZDtXJW5VKaJbWYjPhC
 3yuQH/H7ZlgTD7HdH/RliWhi1ozuvnzu1dKlbZYHo9rurIpJ1FzDKGuD8t+x8OSfqKTT
 flDjdgBjzNjBZFDIyMxV4hgdWMUZsVs2y2VqXCU/k23hforYFeq2Kr9ZQmTosKVx5JeN
 hgVQ==
X-Gm-Message-State: AOAM530y1GuD7xxhTOIPY1+cRb0Bn/oiOzHTjxMviq4PtEvk1AihaofJ
 kP9X0yeNcHB71vPzed2Np/6UQbPXehQiKQ==
X-Google-Smtp-Source: ABdhPJwLORI2LDOiEK1JeeYDbsbk6NVQmquCLT5THrFJLNp6TSjp3Mieq+c0Q/pGeOBVn0N2GQTsUQ==
X-Received: by 2002:a65:4c82:0:b0:380:3aee:6948 with SMTP id
 m2-20020a654c82000000b003803aee6948mr15178341pgt.527.1647796323164; 
 Sun, 20 Mar 2022 10:12:03 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 q12-20020a17090aa00c00b001bc6f1baaaesm17149697pjp.39.2022.03.20.10.12.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Mar 2022 10:12:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL for-7.1 29/36] util/log: Rename logfilename to global_filename
Date: Sun, 20 Mar 2022 10:11:28 -0700
Message-Id: <20220320171135.2704502-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220320171135.2704502-1-richard.henderson@linaro.org>
References: <20220320171135.2704502-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
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

Rename to emphasize this is the file-scope global variable.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 util/log.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/util/log.c b/util/log.c
index 691d6d7930..e559d37369 100644
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
@@ -160,8 +160,8 @@ static void qemu_set_log_internal(const char *filename, bool changed_name,
             }
         }
 
-        g_free(logfilename);
-        logfilename = newname;
+        g_free(global_filename);
+        global_filename = newname;
         filename = newname;
 
         if (logfile) {
@@ -170,7 +170,7 @@ static void qemu_set_log_internal(const char *filename, bool changed_name,
             logfile = NULL;
         }
     } else {
-        filename = logfilename;
+        filename = global_filename;
     }
 
 #ifdef CONFIG_TRACE_LOG
@@ -182,9 +182,8 @@ static void qemu_set_log_internal(const char *filename, bool changed_name,
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


