Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 307BE508FAB
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 20:46:45 +0200 (CEST)
Received: from localhost ([::1]:43104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhFLg-00048L-9s
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 14:46:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhEjC-0006Y9-Ey
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:06:58 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:36648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhEjB-0001Nb-0W
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:06:58 -0400
Received: by mail-pl1-x636.google.com with SMTP id q3so2524860plg.3
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 11:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2MVQ6oRvGvxSZhPXXz6BFKR1T+po8XlGuK7eE+lEBHY=;
 b=eLiEo58YBAd+F7BfF6M1murFbSsCh2Ga7+QSuFrvO9joYjro79ToBkPJfpZ1QfeV9K
 AR4vKz+UyFKBnSyctHzRUf8pJZMhlOLETTp4yvopCEXd9CWCuUzzsHX55F6dza6o6rT8
 WkzuM46Wq1YYWJD7LZ92Uxhy0KNkk07BMsUnX7BsoSiR+tO4ihEgOOzqreuXtBNWZUP4
 qBdZLenY3A50QMg0PvX8ieUF6WKQe0p5sPiCSRjHpsAUmkiS5aC+UY4AkMAk8eoM8ZDY
 6p9B9jH7pYzSiAH49ZUjI0glGTR44h5bhnsSalafJVNbV5KClhuZIFBr1TEgT8PcGerb
 HkaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2MVQ6oRvGvxSZhPXXz6BFKR1T+po8XlGuK7eE+lEBHY=;
 b=o4Wl0MWe/8ZtYznAN+HDRVZg3T4FF0Wxs8eyREkhghO7qmPDnNRjcw2iTj0yJ3lJZf
 ahe4iUw5p3GqBWiK8WrDbeb8gVVqeRfYRHxf2g3gaAuKSifXGN77B8/O+8VvZcjc0vXC
 vr16HV79RsD9vI/WTjwOBggdA40f5vm41/fDAGRcghxHJ5JCf9VLNigiN8sqf+hy60dL
 FTVuG1Id6vXPMcYqmJkpaQ/0fC1YU47fXY8XvIDtNoyq8U+8zqV9TpHvidn7FfdKS9nT
 NEFjDlEkNvsl6yNJy/vDKnAwoL78QIb9cnB+RDq7MElTHmSfwperAejwQ/Gg8UBwPASo
 o3uQ==
X-Gm-Message-State: AOAM532IM++dPp2yWeduglOxjNEZ+3JpnM656O/JJ2ujISyhlPBK7dLU
 QK/+R2K5xrWK+FrPc2rM+xjuGX7cn6EMcg==
X-Google-Smtp-Source: ABdhPJzfSEiOVRGEXkBlUtahhugmH1JGO7TDxFWZMNVYt28dpmciqCma+L8ynus1ZWeRtsV2HEeViQ==
X-Received: by 2002:a17:90b:4f92:b0:1cd:3a73:3a46 with SMTP id
 qe18-20020a17090b4f9200b001cd3a733a46mr6001884pjb.66.1650478015737; 
 Wed, 20 Apr 2022 11:06:55 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 i2-20020a17090a058200b001d2fc489b8asm56681pji.25.2022.04.20.11.06.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 11:06:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 35/39] util/log: Hoist the eval of is_daemonized in
 qemu_set_log_internal
Date: Wed, 20 Apr 2022 11:06:14 -0700
Message-Id: <20220420180618.1183855-36-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220420180618.1183855-1-richard.henderson@linaro.org>
References: <20220420180618.1183855-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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

Only call is_daemonized once.
We require the result on all paths after this point.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220417183019.755276-36-richard.henderson@linaro.org>
---
 util/log.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/util/log.c b/util/log.c
index bb201664ac..631856e231 100644
--- a/util/log.c
+++ b/util/log.c
@@ -123,6 +123,7 @@ static bool qemu_set_log_internal(const char *filename, bool changed_name,
                                   int log_flags, Error **errp)
 {
     bool need_to_open_file;
+    bool daemonized;
     QemuLogFile *logfile;
 
     QEMU_LOCK_GUARD(&global_mutex);
@@ -178,7 +179,8 @@ static bool qemu_set_log_internal(const char *filename, bool changed_name,
      *     or to a file (if there is a filename).
      *   If we are daemonized, we will only log if there is a filename.
      */
-    need_to_open_file = log_flags && (!is_daemonized() || filename);
+    daemonized = is_daemonized();
+    need_to_open_file = log_flags && (!daemonized || filename);
 
     if (logfile && !need_to_open_file) {
         qatomic_rcu_set(&global_file, NULL);
@@ -196,7 +198,7 @@ static bool qemu_set_log_internal(const char *filename, bool changed_name,
                 return false;
             }
             /* In case we are a daemon redirect stderr to logfile */
-            if (is_daemonized()) {
+            if (daemonized) {
                 dup2(fileno(fd), STDERR_FILENO);
                 fclose(fd);
                 /* This will skip closing logfile in qemu_logfile_free. */
@@ -204,7 +206,7 @@ static bool qemu_set_log_internal(const char *filename, bool changed_name,
             }
         } else {
             /* Default to stderr if no log file specified */
-            assert(!is_daemonized());
+            assert(!daemonized);
             fd = stderr;
         }
 
-- 
2.34.1


