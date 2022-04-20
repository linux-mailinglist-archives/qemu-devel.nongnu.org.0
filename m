Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6194A508F81
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 20:33:11 +0200 (CEST)
Received: from localhost ([::1]:41312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhF8Y-0000KG-AF
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 14:33:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhEj3-00063P-2S
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:06:49 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:39763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhEj1-0001LO-Bo
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:06:48 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 mp16-20020a17090b191000b001cb5efbcab6so5618690pjb.4
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 11:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xNgxgSaf8cG296x/VWOV0Bb0OftTv/JlrbrLRCW/aGg=;
 b=nTAfeNHuNz4i4FKgFQ1zornoofMjWP6meJNXoMhkztlMGr2molp84K1KFWeTl+kaXz
 JpUl4inAP6caaRV5FqJW6zUVxaDmwfjMWXNYMF12m8bJ9oS/9f/Q3GW0pGk1rosmt2UH
 g8Byi0+jq0Jlh6omAmawic1xfXulx35wIx/SR3DYQf8ytP3x7UCXS/QE/KBfgrRqBYJe
 6LAPBByME7GzihzSAvEcJAEa2qBlAbpOsSQC47BeT/4n9CtopPHPIiz+HClQJ9YuHtPa
 DOfJxfFkAFyL/9lxDH1FXdXizvHUK2j/0RIkcVzg+4nu4MpNrTFH5wZWNqr4OoLOrD82
 Ssew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xNgxgSaf8cG296x/VWOV0Bb0OftTv/JlrbrLRCW/aGg=;
 b=aF2m3XDowglChDu+JisvJ8KN7w5fPmsQDL5HzNb0qlWFy7JRwwo2OoQ1X0/zmnqJQ/
 KVN7xcFh6fXqp8P4jpLMfspDnm3xcoNpy2vNG+/W0SgfaetmZeK2J6t7+zCZQRV79wYN
 z/Suw+vs5XpB/7i8pmjsPA/bNMpi5To727YES0zF23gPWp6YR9HH4BoU05ms96RI85ii
 UR826t6teHXHm+vcBT2VbmD439Ad/JUDbAAmHaU5uGSG3x+0nTtq5P1NuM8pW55WSsL7
 Q1PdShD9cMh/C4ePQ+rHlXuRxpDMLKJCcQIp6urWT2jiCVCmUeEkBhfN/RSBkxBY9MUD
 KXmQ==
X-Gm-Message-State: AOAM532bIJiWUcO6l5bx7KAnAR0cT7kqw3DrxZEO8ElD+zZ76aQal66a
 VQDO02bKNucztjtUHsn94EmK3dTB1MjfCw==
X-Google-Smtp-Source: ABdhPJxqfGfoL6grRL00QWV730hsPJc6X+OECdkA5eqISityyoRdb+w6yul9jOKfWvRBucyCPcL7rw==
X-Received: by 2002:a17:902:cacb:b0:158:694f:240e with SMTP id
 y11-20020a170902cacb00b00158694f240emr22178630pld.153.1650478006091; 
 Wed, 20 Apr 2022 11:06:46 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 i2-20020a17090a058200b001d2fc489b8asm56681pji.25.2022.04.20.11.06.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 11:06:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 25/39] include/qemu/log: Move entire implementation out-of-line
Date: Wed, 20 Apr 2022 11:06:04 -0700
Message-Id: <20220420180618.1183855-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220420180618.1183855-1-richard.henderson@linaro.org>
References: <20220420180618.1183855-1-richard.henderson@linaro.org>
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move QemuLogFile, qemu_logfile, and all inline functions into qemu/log.c.
No need to expose these implementation details in the api.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220417183019.755276-26-richard.henderson@linaro.org>
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
index 87db7fe04a..7327de7b5f 100644
--- a/tests/unit/test-logging.c
+++ b/tests/unit/test-logging.c
@@ -29,6 +29,7 @@
 
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
2.34.1


