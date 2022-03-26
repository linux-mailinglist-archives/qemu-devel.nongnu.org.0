Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1097D4E814B
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Mar 2022 15:03:58 +0100 (CET)
Received: from localhost ([::1]:52314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nY71J-0007yx-4Y
	for lists+qemu-devel@lfdr.de; Sat, 26 Mar 2022 10:03:57 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nY6R5-0007cH-TR
 for qemu-devel@nongnu.org; Sat, 26 Mar 2022 09:26:34 -0400
Received: from [2607:f8b0:4864:20::229] (port=41731
 helo=mail-oi1-x229.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nY6R3-0005XW-U5
 for qemu-devel@nongnu.org; Sat, 26 Mar 2022 09:26:31 -0400
Received: by mail-oi1-x229.google.com with SMTP id e189so11079165oia.8
 for <qemu-devel@nongnu.org>; Sat, 26 Mar 2022 06:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kCBAoENAiY9tRs3tDbNuJNsMArF3Wl4ZlwA9j6bO048=;
 b=Qi3kLmiWUXji1lVQ5t8FaRlLaxVjkvMMOQwv7qbEiqIQUwA4KaKrSSK/3Q0c5e2qXv
 jTvaBPKNgwMGFzcWP0sSNIWNzTf5WU6TaHLvgKlIvWPax7r2++4vpiRymaQHSDuDoId+
 Xnfhh8TUqUo4N5WrWFCmpO0c1wm3D59PxsLuwIZkCmcC1s0LqD3DbTpxn5BXLI/Q2GjH
 IEwlxJhYjEyuYny+YRU8yXfhbpU1mDVO9r5t00QFo1thq4qHarR9Uxqo8zruLIrkNom5
 /LQsN/LIjp64FjzAYcL7ulf1ociELXFDftiHQeA5OK/QlQUt4tXpLgMVutwT8XMVdV/o
 OWXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kCBAoENAiY9tRs3tDbNuJNsMArF3Wl4ZlwA9j6bO048=;
 b=YUgg7rChMZMaz2MaQCEGtUG/BcmQ0MwE/SXoosdiK78XyK3B4xGwGs+BKQATE0qCys
 hTsCRunQ6puuJFdcbN3D0oJyGY4zz9v8Dv3fwFXFcUxPe/O/23wC3AT6jv1zqVD9iY1W
 1S48UiNxL+yTzv52SXYnzDbZZ5rUIX+TYVC6vgBrd5TP0MF3w5INhQJKWcWTPot9G+cA
 A0VQz/PcwVY+Muf12Qo4RT0garmggiVmUQ+AY9DYjrRMm5hy/1i1BmKLpvuRiW4jRSRQ
 EfEm5F0q9MCxWULGyNgU69pIVCJ1WHq0ibXrX0Gaya+GwVOUqRW1GjBhwQlo+1VBgysX
 o7lQ==
X-Gm-Message-State: AOAM533BKWQ7RyZhB/zaWeEIUftaZItyeuvqXf0QwtUbQdDPeSKn27lR
 Hu0/xsjgH4qRaO1qiGBxbdfqzmFurA6i4AVP
X-Google-Smtp-Source: ABdhPJwxUiFZj0mp6shMAcGUEMeesRutWxrIPM/LhUu2Lcu3rBmIxG2TD/r+GLVphAUd1ux+lgCmkg==
X-Received: by 2002:a05:6808:2204:b0:2da:30c1:dd4c with SMTP id
 bd4-20020a056808220400b002da30c1dd4cmr8000386oib.195.1648301188974; 
 Sat, 26 Mar 2022 06:26:28 -0700 (PDT)
Received: from localhost.localdomain (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168]) by smtp.gmail.com with ESMTPSA id
 n62-20020acaef41000000b002ef646e6690sm4610331oih.53.2022.03.26.06.26.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Mar 2022 06:26:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 25/39] include/qemu/log: Move entire implementation
 out-of-line
Date: Sat, 26 Mar 2022 07:25:20 -0600
Message-Id: <20220326132534.543738-34-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220326132534.543738-1-richard.henderson@linaro.org>
References: <20220326132534.543738-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::229
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::229;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x229.google.com
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


