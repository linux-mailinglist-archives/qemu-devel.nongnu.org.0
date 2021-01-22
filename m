Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FAA22FFFBB
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 11:05:43 +0100 (CET)
Received: from localhost ([::1]:39374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2tK1-0007ry-Ul
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 05:05:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1l2tII-0007Ng-P6
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 05:03:54 -0500
Received: from mail.ispras.ru ([83.149.199.84]:44584)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1l2tIF-0004DJ-HE
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 05:03:54 -0500
Received: from [127.0.1.1] (unknown [62.118.151.149])
 by mail.ispras.ru (Postfix) with ESMTPSA id 4D1A940D403D;
 Fri, 22 Jan 2021 10:03:45 +0000 (UTC)
Subject: [PATCH] util/log: flush TB cache when log level changes
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
To: qemu-devel@nongnu.org
Date: Fri, 22 Jan 2021 13:03:44 +0300
Message-ID: <161130982491.1038646.15688151175539344664.stgit@pasha-ThinkPad-X280>
User-Agent: StGit/0.23
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=83.149.199.84;
 envelope-from=pavel.dovgalyuk@ispras.ru; helo=mail.ispras.ru
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: alex.bennee@linaro.org, pbonzini@redhat.com, pavel.dovgalyuk@ispras.ru,
 stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Sometimes we need to collect the translation logs starting
from some point of the execution. Some TB listings may
be missed in this case, when blocks were translated before.
This patch clears TB cache to allow re-translation of such
code blocks.

Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
---
 accel/tcg/translate-all.c |    8 ++++++++
 include/sysemu/tcg.h      |    1 +
 stubs/meson.build         |    1 +
 stubs/tcg.c               |   12 ++++++++++++
 util/log.c                |    3 +++
 5 files changed, 25 insertions(+)
 create mode 100644 stubs/tcg.c

diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index e9de6ff9dd..3acb227c57 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -1461,6 +1461,14 @@ void tb_flush(CPUState *cpu)
     }
 }
 
+void tb_flush_all(void)
+{
+    CPUState *cpu;
+    CPU_FOREACH(cpu) {
+        tb_flush(cpu);
+    }
+}
+
 /*
  * Formerly ifdef DEBUG_TB_CHECK. These debug functions are user-mode-only,
  * so in order to prevent bit rot we compile them unconditionally in user-mode,
diff --git a/include/sysemu/tcg.h b/include/sysemu/tcg.h
index 00349fb18a..7415f11022 100644
--- a/include/sysemu/tcg.h
+++ b/include/sysemu/tcg.h
@@ -9,6 +9,7 @@
 #define SYSEMU_TCG_H
 
 void tcg_exec_init(unsigned long tb_size, int splitwx);
+void tb_flush_all(void);
 
 #ifdef CONFIG_TCG
 extern bool tcg_allowed;
diff --git a/stubs/meson.build b/stubs/meson.build
index 80b1d81a31..95e70f8542 100644
--- a/stubs/meson.build
+++ b/stubs/meson.build
@@ -38,6 +38,7 @@ stub_ss.add(files('set-fd-handler.c'))
 stub_ss.add(files('sysbus.c'))
 stub_ss.add(files('target-get-monitor-def.c'))
 stub_ss.add(files('target-monitor-defs.c'))
+stub_ss.add(files('tcg.c'))
 stub_ss.add(files('tpm.c'))
 stub_ss.add(files('trace-control.c'))
 stub_ss.add(files('uuid.c'))
diff --git a/stubs/tcg.c b/stubs/tcg.c
new file mode 100644
index 0000000000..775a748c77
--- /dev/null
+++ b/stubs/tcg.c
@@ -0,0 +1,12 @@
+/*
+ * TCG stubs
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "sysemu/tcg.h"
+
+void tb_flush_all(void)
+{
+}
diff --git a/util/log.c b/util/log.c
index 2ee1500bee..2ff342a91b 100644
--- a/util/log.c
+++ b/util/log.c
@@ -26,6 +26,7 @@
 #include "trace/control.h"
 #include "qemu/thread.h"
 #include "qemu/lockable.h"
+#include "sysemu/tcg.h"
 
 static char *logfilename;
 static QemuMutex qemu_logfile_mutex;
@@ -84,6 +85,8 @@ void qemu_set_log(int log_flags)
 #ifdef CONFIG_TRACE_LOG
     qemu_loglevel |= LOG_TRACE;
 #endif
+    tb_flush_all();
+
     /*
      * In all cases we only log if qemu_loglevel is set.
      * Also:


