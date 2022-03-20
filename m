Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 565624E1D40
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Mar 2022 18:52:51 +0100 (CET)
Received: from localhost ([::1]:41820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVzjW-0007ZP-DP
	for lists+qemu-devel@lfdr.de; Sun, 20 Mar 2022 13:52:50 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nVz61-00005l-4f
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 13:12:01 -0400
Received: from [2607:f8b0:4864:20::62a] (port=34479
 helo=mail-pl1-x62a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nVz5y-0003Tx-7j
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 13:11:59 -0400
Received: by mail-pl1-x62a.google.com with SMTP id i11so10197054plr.1
 for <qemu-devel@nongnu.org>; Sun, 20 Mar 2022 10:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=THGd3lL3k1TYcfn7NVeHgS8AdzPbg7kpOdsIIF9l+TA=;
 b=gu/J9y3Xbp7DURODPmJkaHY2rvKu0Uhz0c7qBDWYkGBMcIV+VKGB76Wnn6zQiiGg5t
 FpRsFjn+fBK0E89gBlZtAHZ08Zd0pcJimjNK/JSDfdAHJ0LwLN8fLnkE/x2K0Kn4PjNT
 tHc8mPIJnT1WrgX09uYstwFvkedUZ+wOqeRZXXh5U3VI61b2U6J0oUoQkU3YeXyIveOv
 XvyXrHMdRrRqrC4FZE3LjejOSHy7Oq2ikqFl/FIepcjE4YgnWOR9ro5B8/AeP92KZAyO
 8/cGiJhLslAiePPepdQs48OeE6/TFSLKF0yM+8fgVrdGO8MQvPNefmRtx9d0Gc0+LKfR
 tXwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=THGd3lL3k1TYcfn7NVeHgS8AdzPbg7kpOdsIIF9l+TA=;
 b=O78rpJ6QJq+txyDBguxvpQ2yR2jc8/YGkkmfol5X3hl/TRGbstDDwr4gUc9tayXh1e
 Xbs8DPFbc0146xpRPQifYrQmDzHHzw3MkI/dByGeBvsQORjeg0XhJLCoQYMoNl/i+pe0
 ey1kaaHUbl3St7B+ts1LSMJ0ARbSHG8MnrjkJfCyA8vEp2caxqRSAEY6EdccUpSiZcp5
 dQ8sKE0QyXkTJ5kHVBVWmUlvaoUKNaZsZiMuFYnApdQrYrjUXMYGWVzHGTLHoKowJeWB
 a2TmulcQ5wdDOPtFr6j5cGiz9/R92pn/zGZUu3fv/O2ulYrfeRahpkQt4GHQspnFGWX2
 50/A==
X-Gm-Message-State: AOAM533K0kOqsLL83PVN8FKy2zrON12uHcqXyWl3w/ajoB4yamL15aFH
 1OWcn3ZHUAaIHUqPp23/jgAUN4tyWmftvA==
X-Google-Smtp-Source: ABdhPJzWjut+X+0wnKhMJi9sUNiict5TMSY0NTgq4VYtBHt9PFrGqMJ1sYMN13LoX7RlgwdHRyYyKg==
X-Received: by 2002:a17:902:7781:b0:153:35ef:e3d1 with SMTP id
 o1-20020a170902778100b0015335efe3d1mr9309074pll.116.1647796316622; 
 Sun, 20 Mar 2022 10:11:56 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 q12-20020a17090aa00c00b001bc6f1baaaesm17149697pjp.39.2022.03.20.10.11.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Mar 2022 10:11:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL for-7.1 22/36] include/qemu/log: Move entire implementation
 out-of-line
Date: Sun, 20 Mar 2022 10:11:21 -0700
Message-Id: <20220320171135.2704502-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220320171135.2704502-1-richard.henderson@linaro.org>
References: <20220320171135.2704502-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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

Move QemuLogFile, qemu_logfile, and all inline functions into qemu/log.c.
No need to expose these implementation details in the api.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/qemu/log.h        | 38 ++++----------------------------------
 tests/unit/test-logging.c |  1 +
 util/log.c                | 30 +++++++++++++++++++++++++++++-
 3 files changed, 34 insertions(+), 35 deletions(-)

diff --git a/include/qemu/log.h b/include/qemu/log.h
index 10578ba21c..c63416c9e0 100644
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
index fc22bf40b4..7016710a74 100644
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
index be20ae6c1c..7e8b152742 100644
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
 
 FILE *qemu_log_lock(void)
-- 
2.25.1


