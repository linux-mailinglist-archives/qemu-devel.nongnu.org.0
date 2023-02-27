Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 542226A4410
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:16:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWe73-0001YX-Pp; Mon, 27 Feb 2023 09:04:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWe6x-0001S2-UG
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:04:15 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWe6v-0007yU-Ll
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:04:15 -0500
Received: by mail-wr1-x435.google.com with SMTP id bv17so6349800wrb.5
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:04:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=J7FGyxdwy1SGBIKGBhr3nGSPcWRWCDFQvC3mBKovUG4=;
 b=sIAgOTwX5pk90/zMSos6O2xr9+V1DaTx3ktdffEOdkcE1LHfK3wrHZGe21Kuk7L70f
 xNq8Qo3Lio57K8xZVNC4OsGWhxk+ewcrVNRk3qX3KIFQaM4ZsR/iZbswAuG+4NB6rfAS
 B0orKovewsHkWJ19Z7M1TnqBrZBHefB0v8UfVDSJII/z4UCt0b+AWFsCua3aoSntLImA
 qwjk1/cfzTbRZ+r9lJl11HhYZGO2Gi1qD62yk6vrusORxiFkfRJOAyHR+LxgG74JcsYw
 9+NBGij2v7GE1or8Y986sLBp6kPuScUEczmKQOCPLDTWw2K6EokwWyoqUbPhpbE5Iiy8
 wydg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J7FGyxdwy1SGBIKGBhr3nGSPcWRWCDFQvC3mBKovUG4=;
 b=4CcDk8biC2sW5Y9uQzhLfw+JmSKU4Tgz+V6gmHxxGc6wkyQTu714bsRuwTifp4E7aD
 Qr7xC+pbaLJVNa8nQ46pOGccs44vpBjn+SD1x1NVMXwKnVEgr5a7LLdBPQyOd8iET+wG
 rBlcKt18+Yc4RkoH6OR+2mzrTGgG8VHaI0JaqRVoA6jbKpLaG4qXZU9JNQfk4kosWbb/
 cNSc8IYy+HqxJgDhGqEROsQhBOxVxFw62ZZK884nS0GCB4B82hKMgqdwB7EsNoW3bJud
 zjxueAIs5Nt+5X/cjKbKPtYvb8a/E36uqhOG/zRyhctLEOo5LdutbiIMbj5cIuaeps6C
 gdHA==
X-Gm-Message-State: AO0yUKVOxnN0N5LneVCS3opzHJO5y7tG4dEq6u8EDauFy7ohl1Dvf1Ke
 +w0IClEGZrNMVzK2wYAMgt0xsS9YqlGaz9P4
X-Google-Smtp-Source: AK7set8nVbZeuYLsH+ZrhG/6O+UN+bIO4vDd3h6ZTZGcA0Rwhf5rCq6D/p2gj+5mbGBzb7RDDad0Pw==
X-Received: by 2002:a5d:5148:0:b0:2c7:1755:30bb with SMTP id
 u8-20020a5d5148000000b002c7175530bbmr9917605wrt.10.1677506651402; 
 Mon, 27 Feb 2023 06:04:11 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 i14-20020a5d55ce000000b002c559405a1csm7097077wrw.20.2023.02.27.06.04.10
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Feb 2023 06:04:10 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 031/126] replay: Extract core API to 'exec/replay-core.h'
Date: Mon, 27 Feb 2023 15:00:38 +0100
Message-Id: <20230227140213.35084-22-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230227140213.35084-1-philmd@linaro.org>
References: <20230227140213.35084-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

replay API is used deeply within TCG common code (common to user
and system emulation). Unfortunately "sysemu/replay.h" requires
some QAPI headers for few system-specific declarations, example:

  void replay_input_event(QemuConsole *src, InputEvent *evt);

Since commit c2651c0eaa ("qapi/meson: Restrict UI module to system
emulation and tools") the QAPI header defining the InputEvent is
not generated anymore.
To keep it simple, extract the 'core' replay prototypes to a new
"exec/replay-core.h" header which we include in the TCG code that
doesn't need the rest of the replay API.

Reviewed-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
Message-Id: <20221219170806.60580-5-philmd@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 MAINTAINERS                    |  1 +
 accel/tcg/cpu-exec.c           |  2 +-
 accel/tcg/tcg-all.c            |  2 +-
 accel/tcg/translator.c         |  2 +-
 accel/tcg/user-exec-stub.c     |  2 +-
 cpu.c                          |  2 +-
 gdbstub/gdbstub.c              |  2 +-
 hw/core/ptimer.c               |  2 +-
 include/exec/replay-core.h     | 80 ++++++++++++++++++++++++++++++++++
 include/sysemu/replay.h        | 67 ++--------------------------
 stubs/replay.c                 |  2 +-
 tests/unit/ptimer-test-stubs.c |  2 +-
 util/guest-random.c            |  2 +-
 13 files changed, 95 insertions(+), 73 deletions(-)
 create mode 100644 include/exec/replay-core.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 5c1ee41139..6f1d230027 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3236,6 +3236,7 @@ S: Supported
 F: replay/*
 F: block/blkreplay.c
 F: net/filter-replay.c
+F: include/exec/replay-core.h
 F: include/sysemu/replay.h
 F: docs/devel/replay.rst
 F: docs/system/replay.rst
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 5c9e30a803..ef557e57aa 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -36,7 +36,7 @@
 #include "sysemu/cpus.h"
 #include "exec/cpu-all.h"
 #include "sysemu/cpu-timers.h"
-#include "sysemu/replay.h"
+#include "exec/replay-core.h"
 #include "sysemu/tcg.h"
 #include "exec/helper-proto.h"
 #include "tb-jmp-cache.h"
diff --git a/accel/tcg/tcg-all.c b/accel/tcg/tcg-all.c
index 30b503fb22..5dab1ae9dd 100644
--- a/accel/tcg/tcg-all.c
+++ b/accel/tcg/tcg-all.c
@@ -25,7 +25,7 @@
 
 #include "qemu/osdep.h"
 #include "sysemu/tcg.h"
-#include "sysemu/replay.h"
+#include "exec/replay-core.h"
 #include "sysemu/cpu-timers.h"
 #include "tcg/tcg.h"
 #include "qapi/error.h"
diff --git a/accel/tcg/translator.c b/accel/tcg/translator.c
index 1cf404ced0..15d11fabc5 100644
--- a/accel/tcg/translator.c
+++ b/accel/tcg/translator.c
@@ -16,7 +16,7 @@
 #include "exec/log.h"
 #include "exec/translator.h"
 #include "exec/plugin-gen.h"
-#include "sysemu/replay.h"
+#include "exec/replay-core.h"
 
 /* Pairs with tcg_clear_temp_count.
    To be called by #TranslatorOps.{translate_insn,tb_stop} if
diff --git a/accel/tcg/user-exec-stub.c b/accel/tcg/user-exec-stub.c
index 968cd3ca60..874e1f1a20 100644
--- a/accel/tcg/user-exec-stub.c
+++ b/accel/tcg/user-exec-stub.c
@@ -1,6 +1,6 @@
 #include "qemu/osdep.h"
 #include "hw/core/cpu.h"
-#include "sysemu/replay.h"
+#include "exec/replay-core.h"
 
 bool enable_cpu_pm = false;
 
diff --git a/cpu.c b/cpu.c
index 44df16231f..2e9f931249 100644
--- a/cpu.c
+++ b/cpu.c
@@ -33,7 +33,7 @@
 #endif
 #include "sysemu/tcg.h"
 #include "sysemu/kvm.h"
-#include "sysemu/replay.h"
+#include "exec/replay-core.h"
 #include "exec/cpu-common.h"
 #include "exec/exec-all.h"
 #include "exec/translate-all.h"
diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index c3fbc31123..fb9c49e0fd 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -48,7 +48,7 @@
 #include "sysemu/runstate.h"
 #include "semihosting/semihost.h"
 #include "exec/exec-all.h"
-#include "sysemu/replay.h"
+#include "exec/replay-core.h"
 
 #include "internals.h"
 
diff --git a/hw/core/ptimer.c b/hw/core/ptimer.c
index eb5ba1aff7..e03165febf 100644
--- a/hw/core/ptimer.c
+++ b/hw/core/ptimer.c
@@ -10,7 +10,7 @@
 #include "hw/ptimer.h"
 #include "migration/vmstate.h"
 #include "qemu/host-utils.h"
-#include "sysemu/replay.h"
+#include "exec/replay-core.h"
 #include "sysemu/cpu-timers.h"
 #include "sysemu/qtest.h"
 #include "block/aio.h"
diff --git a/include/exec/replay-core.h b/include/exec/replay-core.h
new file mode 100644
index 0000000000..244c77acce
--- /dev/null
+++ b/include/exec/replay-core.h
@@ -0,0 +1,80 @@
+/*
+ * QEMU replay core API
+ *
+ * Copyright (c) 2010-2015 Institute for System Programming
+ *                         of the Russian Academy of Sciences.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef EXEC_REPLAY_H
+#define EXEC_REPLAY_H
+
+#include "qapi/qapi-types-replay.h"
+
+extern ReplayMode replay_mode;
+
+/* Replay process control functions */
+
+/* Enables recording or saving event log with specified parameters */
+void replay_configure(struct QemuOpts *opts);
+/* Initializes timers used for snapshotting and enables events recording */
+void replay_start(void);
+/* Closes replay log file and frees other resources. */
+void replay_finish(void);
+/* Adds replay blocker with the specified error description */
+void replay_add_blocker(const char *feature);
+/* Returns name of the replay log file */
+const char *replay_get_filename(void);
+
+/*
+ * Start making one step in backward direction.
+ * Used by gdbstub for backwards debugging.
+ * Returns true on success.
+ */
+bool replay_reverse_step(void);
+/*
+ * Start searching the last breakpoint/watchpoint.
+ * Used by gdbstub for backwards debugging.
+ * Returns true if the process successfully started.
+ */
+bool replay_reverse_continue(void);
+/*
+ * Returns true if replay module is processing
+ * reverse_continue or reverse_step request
+ */
+bool replay_running_debug(void);
+/* Called in reverse debugging mode to collect breakpoint information */
+void replay_breakpoint(void);
+/* Called when gdb is attached to gdbstub */
+void replay_gdb_attached(void);
+
+/* Interrupts and exceptions */
+
+/* Called by exception handler to write or read exception processing events */
+bool replay_exception(void);
+/*
+ * Used to determine that exception is pending.
+ * Does not proceed to the next event in the log.
+ */
+bool replay_has_exception(void);
+/*
+ * Called by interrupt handlers to write or read interrupt processing events.
+ * Returns true if interrupt should be processed.
+ */
+bool replay_interrupt(void);
+/*
+ * Tries to read interrupt event from the file.
+ * Returns true, when interrupt request is pending.
+ */
+bool replay_has_interrupt(void);
+
+/* Processing data from random generators */
+
+/* Saves the values from the random number generator */
+void replay_save_random(int ret, void *buf, size_t len);
+/* Loads the saved values for the random number generator */
+int replay_read_random(void *buf, size_t len);
+
+#endif
diff --git a/include/sysemu/replay.h b/include/sysemu/replay.h
index 6e5ab09f71..08aae5869f 100644
--- a/include/sysemu/replay.h
+++ b/include/sysemu/replay.h
@@ -1,8 +1,8 @@
-#ifndef REPLAY_H
-#define REPLAY_H
+#ifndef SYSEMU_REPLAY_H
+#define SYSEMU_REPLAY_H
 
 /*
- * replay.h
+ * QEMU replay (system interface)
  *
  * Copyright (c) 2010-2015 Institute for System Programming
  *                         of the Russian Academy of Sciences.
@@ -12,9 +12,9 @@
  *
  */
 
+#include "exec/replay-core.h"
 #include "qapi/qapi-types-misc.h"
 #include "qapi/qapi-types-run-state.h"
-#include "qapi/qapi-types-replay.h"
 #include "qapi/qapi-types-ui.h"
 #include "block/aio.h"
 
@@ -45,8 +45,6 @@ typedef enum ReplayCheckpoint ReplayCheckpoint;
 
 typedef struct ReplayNetState ReplayNetState;
 
-extern ReplayMode replay_mode;
-
 /* Name of the initial VM snapshot */
 extern char *replay_snapshot;
 
@@ -63,40 +61,6 @@ extern char *replay_snapshot;
 void replay_mutex_lock(void);
 void replay_mutex_unlock(void);
 
-/* Replay process control functions */
-
-/*! Enables recording or saving event log with specified parameters */
-void replay_configure(struct QemuOpts *opts);
-/*! Initializes timers used for snapshotting and enables events recording */
-void replay_start(void);
-/*! Closes replay log file and frees other resources. */
-void replay_finish(void);
-/*! Adds replay blocker with the specified error description */
-void replay_add_blocker(const char *feature);
-/* Returns name of the replay log file */
-const char *replay_get_filename(void);
-/*
- * Start making one step in backward direction.
- * Used by gdbstub for backwards debugging.
- * Returns true on success.
- */
-bool replay_reverse_step(void);
-/*
- * Start searching the last breakpoint/watchpoint.
- * Used by gdbstub for backwards debugging.
- * Returns true if the process successfully started.
- */
-bool replay_reverse_continue(void);
-/*
- * Returns true if replay module is processing
- * reverse_continue or reverse_step request
- */
-bool replay_running_debug(void);
-/* Called in reverse debugging mode to collect breakpoint information */
-void replay_breakpoint(void);
-/* Called when gdb is attached to gdbstub */
-void replay_gdb_attached(void);
-
 /* Processing the instructions */
 
 /*! Returns number of executed instructions. */
@@ -106,22 +70,6 @@ int replay_get_instructions(void);
 /*! Updates instructions counter in replay mode. */
 void replay_account_executed_instructions(void);
 
-/* Interrupts and exceptions */
-
-/*! Called by exception handler to write or read
-    exception processing events. */
-bool replay_exception(void);
-/*! Used to determine that exception is pending.
-    Does not proceed to the next event in the log. */
-bool replay_has_exception(void);
-/*! Called by interrupt handlers to write or read
-    interrupt processing events.
-    \return true if interrupt should be processed */
-bool replay_interrupt(void);
-/*! Tries to read interrupt event from the file.
-    Returns true, when interrupt request is pending */
-bool replay_has_interrupt(void);
-
 /* Processing clocks and other time sources */
 
 /*! Save the specified clock */
@@ -143,13 +91,6 @@ int64_t replay_read_clock(ReplayClockKind kind, int64_t raw_icount);
             ? replay_save_clock((clock), (value), icount_get_raw_locked()) \
             : (value))
 
-/* Processing data from random generators */
-
-/* Saves the values from the random number generator */
-void replay_save_random(int ret, void *buf, size_t len);
-/* Loads the saved values for the random number generator */
-int replay_read_random(void *buf, size_t len);
-
 /* Events */
 
 /*! Called when qemu shutdown is requested. */
diff --git a/stubs/replay.c b/stubs/replay.c
index 9d5b4be339..42c92e4acb 100644
--- a/stubs/replay.c
+++ b/stubs/replay.c
@@ -1,5 +1,5 @@
 #include "qemu/osdep.h"
-#include "sysemu/replay.h"
+#include "exec/replay-core.h"
 
 ReplayMode replay_mode;
 
diff --git a/tests/unit/ptimer-test-stubs.c b/tests/unit/ptimer-test-stubs.c
index f5e75a96b6..f2bfcede93 100644
--- a/tests/unit/ptimer-test-stubs.c
+++ b/tests/unit/ptimer-test-stubs.c
@@ -10,7 +10,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu/main-loop.h"
-#include "sysemu/replay.h"
+#include "exec/replay-core.h"
 #include "migration/vmstate.h"
 
 #include "ptimer-test.h"
diff --git a/util/guest-random.c b/util/guest-random.c
index 23643f86cc..a24d27624c 100644
--- a/util/guest-random.c
+++ b/util/guest-random.c
@@ -14,7 +14,7 @@
 #include "qapi/error.h"
 #include "qemu/guest-random.h"
 #include "crypto/random.h"
-#include "sysemu/replay.h"
+#include "exec/replay-core.h"
 
 
 static __thread GRand *thread_rand;
-- 
2.38.1


