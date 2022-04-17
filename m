Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE83504916
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Apr 2022 20:56:08 +0200 (CEST)
Received: from localhost ([::1]:56880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngA47-00074H-GJ
	for lists+qemu-devel@lfdr.de; Sun, 17 Apr 2022 14:56:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng9fN-0000QZ-Oz
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 14:30:37 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:40720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng9fJ-0001kB-G4
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 14:30:31 -0400
Received: by mail-pl1-x62e.google.com with SMTP id t12so10786458pll.7
 for <qemu-devel@nongnu.org>; Sun, 17 Apr 2022 11:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Rr/RffNvDVGLD4+joN+/CEx/FD3wfnt5ywEdlwbeVrE=;
 b=vnU6CHu2lzGJJ0pJQEq3JWPgd5/ws5bMdP/lk1AW85FYvNqQ4uUHCZdeqTY4Xxo1lS
 0FCGfdYbnpz8vB7oRokbyuH5jOP5iIX61URvqDGVDCwtbxTI7wERL2OdsgyHkwIGcPoC
 r9gfzA1GAn/7zyB4/OYcBmUvOpFYkOoC+qxx3D0MaDDldjAKohOhQOyAmNFkRYN4JPMi
 9t6SicsH5Dhcq90OhP2NncbmbEhFvcuOOgZoUiwiIE5rRDsxu8qHa9/dD3ArarzEXUJU
 gMnsES6TUT2QdfByIiyVFXTysguqKBcj2zFlYaR+KXlVC6sni5yJfLfYyBXf5Soe/rQc
 bPDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Rr/RffNvDVGLD4+joN+/CEx/FD3wfnt5ywEdlwbeVrE=;
 b=OP7RDxQKIoPlhLWzEkhBpdMkABhCMkp/j9FyldNIWuM0mRwMtrNd/hDPYS7IF7c2/x
 UqxLv+WL11qDFc3OSdIf1L69vxIAGF3NhzQj702Omh68plzslW2RBFHj+75OWJEdHsEl
 LM5kwCYmTZ+dVTQvRshnPNfXhJmk7qhrIzBvWx0Kp+gBi2Htb9Bjs5GnhH+WtlxgY9Oz
 UjKI/2b9fm1uEZ4YqLPLh5QVvUGXWrE3F24yFF/5B0oT0FGGs+4U4QN+hf2CV7RJMOvF
 AOIfSTBKlWreoMt4wWZJWgW3MENqeusOMzrQRU/pOEuE0o/BueFnACU/CU3MeJHkG//o
 BI9w==
X-Gm-Message-State: AOAM530E6f00uqxVXA3mBiCmWLoU9/UmsS9VvPJ2DBcVlkN8mb5n1ZCw
 PR++YDVvs9vpYfJXrzGR6etJ10t7xOCStA==
X-Google-Smtp-Source: ABdhPJxQX2+qSFXrRAeFwpcWi0ZXxkaBVWnIs4jI0kbGMsCWZ0j+mk1YkvnOKcg5xTqWiW3nB9Hy3A==
X-Received: by 2002:a17:902:b692:b0:14c:935b:2b03 with SMTP id
 c18-20020a170902b69200b0014c935b2b03mr7804894pls.81.1650220225418; 
 Sun, 17 Apr 2022 11:30:25 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 on10-20020a17090b1d0a00b001d08a7d569csm8154011pjb.56.2022.04.17.11.30.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 11:30:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 06/39] util/log: Move qemu_log_lock,
 qemu_log_unlock out of line
Date: Sun, 17 Apr 2022 11:29:46 -0700
Message-Id: <20220417183019.755276-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220417183019.755276-1-richard.henderson@linaro.org>
References: <20220417183019.755276-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/qemu/log.h | 28 +++-------------------------
 util/log.c         | 23 +++++++++++++++++++++++
 2 files changed, 26 insertions(+), 25 deletions(-)

diff --git a/include/qemu/log.h b/include/qemu/log.h
index 0b892f5e90..6a6b1efce5 100644
--- a/include/qemu/log.h
+++ b/include/qemu/log.h
@@ -65,32 +65,10 @@ static inline bool qemu_log_separate(void)
 /* LOG_STRACE is used for user-mode strace logging. */
 #define LOG_STRACE         (1 << 19)
 
-/* Lock output for a series of related logs.  Since this is not needed
- * for a single qemu_log / qemu_log_mask / qemu_log_mask_and_addr, we
- * assume that qemu_loglevel_mask has already been tested, and that
- * qemu_loglevel is never set when qemu_logfile is unset.
- */
+/* Lock/unlock output. */
 
-static inline FILE *qemu_log_lock(void)
-{
-    QemuLogFile *logfile;
-    rcu_read_lock();
-    logfile = qatomic_rcu_read(&qemu_logfile);
-    if (logfile) {
-        qemu_flockfile(logfile->fd);
-        return logfile->fd;
-    } else {
-        return NULL;
-    }
-}
-
-static inline void qemu_log_unlock(FILE *fd)
-{
-    if (fd) {
-        qemu_funlockfile(fd);
-    }
-    rcu_read_unlock();
-}
+FILE *qemu_log_lock(void);
+void qemu_log_unlock(FILE *fd);
 
 /* Logging functions: */
 
diff --git a/util/log.c b/util/log.c
index bab4d29ecb..1a3121610a 100644
--- a/util/log.c
+++ b/util/log.c
@@ -34,6 +34,29 @@ int qemu_loglevel;
 static int log_append = 0;
 static GArray *debug_regions;
 
+/* Lock/unlock output. */
+
+FILE *qemu_log_lock(void)
+{
+    QemuLogFile *logfile;
+    rcu_read_lock();
+    logfile = qatomic_rcu_read(&qemu_logfile);
+    if (logfile) {
+        qemu_flockfile(logfile->fd);
+        return logfile->fd;
+    } else {
+        return NULL;
+    }
+}
+
+void qemu_log_unlock(FILE *fd)
+{
+    if (fd) {
+        qemu_funlockfile(fd);
+    }
+    rcu_read_unlock();
+}
+
 /* Return the number of characters emitted.  */
 int qemu_log(const char *fmt, ...)
 {
-- 
2.25.1


