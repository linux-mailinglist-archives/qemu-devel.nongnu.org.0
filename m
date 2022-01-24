Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 668534981E0
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 15:17:46 +0100 (CET)
Received: from localhost ([::1]:36146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nC0AD-0007hR-8E
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 09:17:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1nC044-0001WX-Lr
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 09:11:24 -0500
Received: from prt-mail.chinatelecom.cn ([42.123.76.222]:43337
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1nC03y-0003wC-Ru
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 09:11:24 -0500
HMM_SOURCE_IP: 172.18.0.188:38272.1433758357
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-171.223.99.59 (unknown [172.18.0.188])
 by chinatelecom.cn (HERMES) with SMTP id 49DC22800AE;
 Mon, 24 Jan 2022 22:10:57 +0800 (CST)
X-189-SAVE-TO-SEND: +huangy81@chinatelecom.cn
Received: from  ([172.18.0.188])
 by app0023 with ESMTP id 3a93532455dd48b894b63ff38f314ec3 for
 qemu-devel@nongnu.org; Mon, 24 Jan 2022 22:11:00 CST
X-Transaction-ID: 3a93532455dd48b894b63ff38f314ec3
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.188
X-MEDUSA-Status: 0
From: huangy81@chinatelecom.cn
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH v12 3/5] softmmu/dirtylimit: implement vCPU dirtyrate
 calculation periodically
Date: Mon, 24 Jan 2022 22:10:38 +0800
Message-Id: <95f60ae3e69240eb61ddb6a630bafecb9c14f286.1643026714.git.huangy81@chinatelecom.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1642774952.git.huangy81@chinatelecom.cn>
References: <cover.1642774952.git.huangy81@chinatelecom.cn>
In-Reply-To: <cover.1643026714.git.huangy81@chinatelecom.cn>
References: <cover.1643026714.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.222;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>, David Hildenbrand <david@redhat.com>,
 Hyman <huangy81@chinatelecom.cn>, Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus ArmBruster <armbru@redhat.com>, Peter Xu <peterx@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>

Introduce the third method GLOBAL_DIRTY_LIMIT of dirty
tracking for calculate dirtyrate periodly for dirty page
rate limit.

Add dirtylimit.c to implement dirtyrate calculation periodly,
which will be used for dirty page rate limit.

Add dirtylimit.h to export util functions for dirty page rate
limit implementation.

Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
---
 include/exec/memory.h       |   5 +-
 include/sysemu/dirtylimit.h |  22 ++++++++
 softmmu/dirtylimit.c        | 120 ++++++++++++++++++++++++++++++++++++++++++++
 softmmu/meson.build         |   1 +
 4 files changed, 147 insertions(+), 1 deletion(-)
 create mode 100644 include/sysemu/dirtylimit.h
 create mode 100644 softmmu/dirtylimit.c

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 4d5997e..88ca510 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -69,7 +69,10 @@ static inline void fuzz_dma_read_cb(size_t addr,
 /* Dirty tracking enabled because measuring dirty rate */
 #define GLOBAL_DIRTY_DIRTY_RATE (1U << 1)
 
-#define GLOBAL_DIRTY_MASK  (0x3)
+/* Dirty tracking enabled because dirty limit */
+#define GLOBAL_DIRTY_LIMIT      (1U << 2)
+
+#define GLOBAL_DIRTY_MASK  (0x7)
 
 extern unsigned int global_dirty_tracking;
 
diff --git a/include/sysemu/dirtylimit.h b/include/sysemu/dirtylimit.h
new file mode 100644
index 0000000..da459f0
--- /dev/null
+++ b/include/sysemu/dirtylimit.h
@@ -0,0 +1,22 @@
+/*
+ * Dirty page rate limit common functions
+ *
+ * Copyright (c) 2022 CHINA TELECOM CO.,LTD.
+ *
+ * Authors:
+ *  Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+#ifndef QEMU_DIRTYRLIMIT_H
+#define QEMU_DIRTYRLIMIT_H
+
+#define DIRTYLIMIT_CALC_TIME_MS         1000    /* 1000ms */
+
+int64_t vcpu_dirty_rate_get(int cpu_index);
+void vcpu_dirty_rate_stat_start(void);
+void vcpu_dirty_rate_stat_stop(void);
+void vcpu_dirty_rate_stat_initialize(void);
+void vcpu_dirty_rate_stat_finalize(void);
+#endif
diff --git a/softmmu/dirtylimit.c b/softmmu/dirtylimit.c
new file mode 100644
index 0000000..a10ac6f
--- /dev/null
+++ b/softmmu/dirtylimit.c
@@ -0,0 +1,120 @@
+/*
+ * Dirty page rate limit implementation code
+ *
+ * Copyright (c) 2022 CHINA TELECOM CO.,LTD.
+ *
+ * Authors:
+ *  Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "qemu/main-loop.h"
+#include "qapi/qapi-commands-migration.h"
+#include "sysemu/dirtyrate.h"
+#include "sysemu/dirtylimit.h"
+#include "exec/memory.h"
+#include "hw/boards.h"
+
+struct {
+    VcpuStat stat;
+    bool running;
+    QemuThread thread;
+} *vcpu_dirty_rate_stat;
+
+static void vcpu_dirty_rate_stat_collect(void)
+{
+    int64_t start_time;
+    VcpuStat stat;
+    int i = 0;
+
+    start_time = qemu_clock_get_ms(QEMU_CLOCK_REALTIME);
+
+    /* calculate vcpu dirtyrate */
+    vcpu_calculate_dirtyrate(DIRTYLIMIT_CALC_TIME_MS,
+                             start_time,
+                             &stat,
+                             GLOBAL_DIRTY_LIMIT,
+                             false);
+
+    for (i = 0; i < stat.nvcpu; i++) {
+        vcpu_dirty_rate_stat->stat.rates[i].id = i;
+        vcpu_dirty_rate_stat->stat.rates[i].dirty_rate =
+            stat.rates[i].dirty_rate;
+    }
+
+    free(stat.rates);
+}
+
+static void *vcpu_dirty_rate_stat_thread(void *opaque)
+{
+    rcu_register_thread();
+
+    /* start log sync */
+    global_dirty_log_change(GLOBAL_DIRTY_LIMIT, true);
+
+    while (qatomic_read(&vcpu_dirty_rate_stat->running)) {
+        vcpu_dirty_rate_stat_collect();
+    }
+
+    /* stop log sync */
+    global_dirty_log_change(GLOBAL_DIRTY_LIMIT, false);
+
+    rcu_unregister_thread();
+    return NULL;
+}
+
+int64_t vcpu_dirty_rate_get(int cpu_index)
+{
+    DirtyRateVcpu *rates = vcpu_dirty_rate_stat->stat.rates;
+    return qatomic_read(&rates[cpu_index].dirty_rate);
+}
+
+void vcpu_dirty_rate_stat_start(void)
+{
+    if (qatomic_read(&vcpu_dirty_rate_stat->running)) {
+        return;
+    }
+
+    qatomic_set(&vcpu_dirty_rate_stat->running, 1);
+    qemu_thread_create(&vcpu_dirty_rate_stat->thread,
+                       "dirtyrate-stat",
+                       vcpu_dirty_rate_stat_thread,
+                       NULL,
+                       QEMU_THREAD_JOINABLE);
+}
+
+void vcpu_dirty_rate_stat_stop(void)
+{
+    qatomic_set(&vcpu_dirty_rate_stat->running, 0);
+    qemu_mutex_unlock_iothread();
+    qemu_thread_join(&vcpu_dirty_rate_stat->thread);
+    qemu_mutex_lock_iothread();
+}
+
+void vcpu_dirty_rate_stat_initialize(void)
+{
+    MachineState *ms = MACHINE(qdev_get_machine());
+    int max_cpus = ms->smp.max_cpus;
+
+    vcpu_dirty_rate_stat =
+        g_malloc0(sizeof(*vcpu_dirty_rate_stat));
+
+    vcpu_dirty_rate_stat->stat.nvcpu = max_cpus;
+    vcpu_dirty_rate_stat->stat.rates =
+        g_malloc0(sizeof(DirtyRateVcpu) * max_cpus);
+
+    vcpu_dirty_rate_stat->running = false;
+}
+
+void vcpu_dirty_rate_stat_finalize(void)
+{
+    free(vcpu_dirty_rate_stat->stat.rates);
+    vcpu_dirty_rate_stat->stat.rates = NULL;
+
+    free(vcpu_dirty_rate_stat);
+    vcpu_dirty_rate_stat = NULL;
+}
diff --git a/softmmu/meson.build b/softmmu/meson.build
index d8e0301..95029a5 100644
--- a/softmmu/meson.build
+++ b/softmmu/meson.build
@@ -15,6 +15,7 @@ specific_ss.add(when: 'CONFIG_SOFTMMU', if_true: [files(
   'vl.c',
   'cpu-timers.c',
   'runstate-action.c',
+  'dirtylimit.c',
 )])
 
 specific_ss.add(when: ['CONFIG_SOFTMMU', 'CONFIG_TCG'], if_true: [files(
-- 
1.8.3.1


