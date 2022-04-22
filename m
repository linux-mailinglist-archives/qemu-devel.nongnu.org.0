Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB7050B791
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 14:44:36 +0200 (CEST)
Received: from localhost ([::1]:39220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhseJ-0001fK-4f
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 08:44:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1nhrr6-0001qU-Qe
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 07:53:47 -0400
Received: from mail.ispras.ru ([83.149.199.84]:39378)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1nhrr5-0005F4-4Z
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 07:53:44 -0400
Received: from [127.0.1.1] (unknown [85.142.117.226])
 by mail.ispras.ru (Postfix) with ESMTPSA id 69A1C4076261;
 Fri, 22 Apr 2022 11:53:20 +0000 (UTC)
Subject: [PATCH 2/9] replay: notify vCPU when BH is scheduled
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
To: qemu-devel@nongnu.org
Date: Fri, 22 Apr 2022 14:53:20 +0300
Message-ID: <165062840023.526882.4524922830180183891.stgit@pasha-ThinkPad-X280>
In-Reply-To: <165062838915.526882.13230207960407998257.stgit@pasha-ThinkPad-X280>
References: <165062838915.526882.13230207960407998257.stgit@pasha-ThinkPad-X280>
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
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: pavel.dovgalyuk@ispras.ru, philmd@redhat.com, wrampazz@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

vCPU execution should be suspended when new BH is scheduled.
This is needed to avoid guest timeouts caused by the long cycles
of the execution. In replay mode execution may hang when
vCPU sleeps and block event comes to the queue.
This patch adds notification which wakes up vCPU or interrupts
execution of guest code.

Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
---
 include/sysemu/cpu-timers.h |    1 +
 softmmu/icount.c            |    8 ++++++++
 stubs/icount.c              |    4 ++++
 util/async.c                |    8 ++++++++
 4 files changed, 21 insertions(+)

diff --git a/include/sysemu/cpu-timers.h b/include/sysemu/cpu-timers.h
index ed6ee5c46c..2e786fe7fb 100644
--- a/include/sysemu/cpu-timers.h
+++ b/include/sysemu/cpu-timers.h
@@ -59,6 +59,7 @@ int64_t icount_round(int64_t count);
 /* if the CPUs are idle, start accounting real time to virtual clock. */
 void icount_start_warp_timer(void);
 void icount_account_warp_timer(void);
+void icount_notify_exit(void);
 
 /*
  * CPU Ticks and Clock
diff --git a/softmmu/icount.c b/softmmu/icount.c
index 5ca271620d..880ed04900 100644
--- a/softmmu/icount.c
+++ b/softmmu/icount.c
@@ -486,3 +486,11 @@ void icount_configure(QemuOpts *opts, Error **errp)
                    qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
                    NANOSECONDS_PER_SECOND / 10);
 }
+
+void icount_notify_exit(void)
+{
+    if (icount_enabled() && first_cpu) {
+        cpu_exit(first_cpu);
+        qemu_clock_notify(QEMU_CLOCK_VIRTUAL);
+    }
+}
diff --git a/stubs/icount.c b/stubs/icount.c
index f13c43568b..6df8c2bf7d 100644
--- a/stubs/icount.c
+++ b/stubs/icount.c
@@ -43,3 +43,7 @@ void icount_account_warp_timer(void)
 {
     abort();
 }
+
+void icount_notify_exit(void)
+{
+}
diff --git a/util/async.c b/util/async.c
index 2ea1172f3e..c376b6c2b4 100644
--- a/util/async.c
+++ b/util/async.c
@@ -33,6 +33,7 @@
 #include "block/raw-aio.h"
 #include "qemu/coroutine_int.h"
 #include "qemu/coroutine-tls.h"
+#include "sysemu/cpu-timers.h"
 #include "trace.h"
 
 /***********************************************************/
@@ -185,6 +186,13 @@ void qemu_bh_schedule_idle(QEMUBH *bh)
 void qemu_bh_schedule(QEMUBH *bh)
 {
     aio_bh_enqueue(bh, BH_SCHEDULED);
+    /*
+     * Workaround for record/replay.
+     * vCPU execution should be suspended when new BH is set.
+     * This is needed to avoid guest timeouts caused
+     * by the long cycles of the execution.
+     */
+    icount_notify_exit();
 }
 
 /* This func is async.


