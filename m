Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B02FF50493D
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Apr 2022 21:13:27 +0200 (CEST)
Received: from localhost ([::1]:54854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngAKs-0002Rf-S2
	for lists+qemu-devel@lfdr.de; Sun, 17 Apr 2022 15:13:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng9ff-0000UT-0G
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 14:30:52 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:44594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng9fY-0001ox-JX
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 14:30:47 -0400
Received: by mail-pl1-x62f.google.com with SMTP id j8so10764923pll.11
 for <qemu-devel@nongnu.org>; Sun, 17 Apr 2022 11:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GuwOMriXgAwu84yDvMruRBOLZ7z6LWp1DQPbJdxkC+4=;
 b=sSlbVVIjTJJ+qatV9FUqY8iZVCS4VoN8OalAf7BhXolANaQZnDJhbb/W3qRU/zZZqC
 0frMSowxfQJ0jyykchg6xVBeqjc8j6Zn1J10HnVDfSuhDmM0w1nFg8Kuoi0x8vJUUhQ6
 P14g9FtVaM4hCdRaUBs3/DZGcLMCrGhOx9rhQZVy3jDlQMHaft04yHFSP00G9w90avS2
 49bLKscEP1CavMCXautOo9rhXzb5LyT3NYjEAPYearoPrvUZDh78TGw65EHtluTKqhLp
 P8fi11vrAGYAMFCm7UZ7TzIZlsWd6yD9aWgSmcjYt5HeuiwGnHOKRcsNO31hXPox5UYw
 DAbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GuwOMriXgAwu84yDvMruRBOLZ7z6LWp1DQPbJdxkC+4=;
 b=T1eSh1aexO4kbAFnjK0a3FKvxkqdIW1ZD7wf2B5ZqLqAEP7GYNuUUKh8Qu//l45Lqy
 NcXp6sVOXGMIj1FCGziR/ZMjElwaiQo0GYKRhjZtiYzTxIs11/oybjz3FqYGLXnc3CGD
 iPLx7KiX2uAbArVK5c48X2JAimrMgcv/PydIn/N2vDSgl9IUf3NfCzmABUZ+nXWEqLgl
 dhG4KYiQHGdXBeSOMm+DhvWRKzOHjAJZT4sG4rIP35ltzLM9RQ22FT8VPrrFQZcl80VS
 Iyks0K5m6zJuZ/ZCez7x7LsvSZ+6Ktjrtbks5T1BAp5oxy39JugKSWvSin6xJLk66Bhb
 1Omg==
X-Gm-Message-State: AOAM5312gIzdWUMB03A8iYC79st9UcpxIRb27ycUHbgH9sadG72S4A6s
 TBYovBpiHZp21VnwymugovlWKItA2V9iFA==
X-Google-Smtp-Source: ABdhPJzVmGYwgbK3B6X2uOM6v5kY7d4VZ4ZkXSGAJTmjK9YMAoQn3gr7jylU10yhgZ1KVkzN/fh++w==
X-Received: by 2002:a17:902:ec8e:b0:158:fd5f:2b2a with SMTP id
 x14-20020a170902ec8e00b00158fd5f2b2amr1678747plg.72.1650220242004; 
 Sun, 17 Apr 2022 11:30:42 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 on10-20020a17090b1d0a00b001d08a7d569csm8154011pjb.56.2022.04.17.11.30.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 11:30:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 25/39] include/qemu/log: Move entire implementation
 out-of-line
Date: Sun, 17 Apr 2022 11:30:05 -0700
Message-Id: <20220417183019.755276-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220417183019.755276-1-richard.henderson@linaro.org>
References: <20220417183019.755276-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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

Move QemuLogFile, qemu_logfile, and all inline functions into qemu/log.c.
No need to expose these implementation details in the api.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/qemu/log.h        | 38 ++++----------------------------------
 tests/unit/test-logging.c |  1 +
 util/log.c                | 30 +++++++++++++++++++++++++++++-
 3 files changed, 34 insertions(+), 35 deletions(-)

diff --git a/include/qemu/log.h b/include/qemu/log.h
index 75973111bb..42d545f77a 100644
--- a/include/qemu/log.h
+++ b/include/qemu/log.h
@@ -3,46 +3,16 @@
 
 /* A small part of this API is split into its own header */
 #include "qemu/log-for-trace.h"
-#include "qemu/rcu.h"
-
-typedef struct QemuLogFile {
-    struct rcu_head rcu;
-    FILE *fd;
-} QemuLogFile;
-
-/* Private global variable, don't use */
-extern QemuLogFile *qemu_logfile;
-
 
 /* 
  * The new API:
- *
  */
 
-/* Log settings checking macros: */
+/* Returns true if qemu_log() will really write somewhere. */
+bool qemu_log_enabled(void);
 
-/* Returns true if qemu_log() will really write somewhere
- */
-static inline bool qemu_log_enabled(void)
-{
-    return qemu_logfile != NULL;
-}
-
-/* Returns true if qemu_log() will write somewhere else than stderr
- */
-static inline bool qemu_log_separate(void)
-{
-    QemuLogFile *logfile;
-    bool res = false;
-
-    rcu_read_lock();
-    logfile = qatomic_rcu_read(&qemu_logfile);
-    if (logfile && logfile->fd != stderr) {
-        res = true;
-    }
-    rcu_read_unlock();
-    return res;
-}
+/* Returns true if qemu_log() will write somewhere other than stderr. */
+bool qemu_log_separate(void);
 
 #define CPU_LOG_TB_OUT_ASM (1 << 0)
 #define CPU_LOG_TB_IN_ASM  (1 << 1)
diff --git a/tests/unit/test-logging.c b/tests/unit/test-logging.c
index dcb8ac70df..9b87af75af 100644
--- a/tests/unit/test-logging.c
+++ b/tests/unit/test-logging.c
@@ -30,6 +30,7 @@
 #include "qemu-common.h"
 #include "qapi/error.h"
 #include "qemu/log.h"
+#include "qemu/rcu.h"
 
 static void test_parse_range(void)
 {
diff --git a/util/log.c b/util/log.c
index caa38e707b..8b8b6a5d83 100644
--- a/util/log.c
+++ b/util/log.c
@@ -26,14 +26,42 @@
 #include "trace/control.h"
 #include "qemu/thread.h"
 #include "qemu/lockable.h"
+#include "qemu/rcu.h"
+
+
+typedef struct QemuLogFile {
+    struct rcu_head rcu;
+    FILE *fd;
+} QemuLogFile;
 
 static char *logfilename;
 static QemuMutex qemu_logfile_mutex;
-QemuLogFile *qemu_logfile;
+static QemuLogFile *qemu_logfile;
 int qemu_loglevel;
 static int log_append = 0;
 static GArray *debug_regions;
 
+/* Returns true if qemu_log() will really write somewhere. */
+bool qemu_log_enabled(void)
+{
+    return qemu_logfile != NULL;
+}
+
+/* Returns true if qemu_log() will write somewhere other than stderr. */
+bool qemu_log_separate(void)
+{
+    QemuLogFile *logfile;
+    bool res = false;
+
+    rcu_read_lock();
+    logfile = qatomic_rcu_read(&qemu_logfile);
+    if (logfile && logfile->fd != stderr) {
+        res = true;
+    }
+    rcu_read_unlock();
+    return res;
+}
+
 /* Lock/unlock output. */
 
 FILE *qemu_log_trylock(void)
-- 
2.25.1


