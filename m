Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 480F255ABD3
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Jun 2022 19:49:58 +0200 (CEST)
Received: from localhost ([::1]:52290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o59uv-0007bo-DJ
	for lists+qemu-devel@lfdr.de; Sat, 25 Jun 2022 13:49:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1o59kN-0003RY-M8
 for qemu-devel@nongnu.org; Sat, 25 Jun 2022 13:39:04 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.228]:53145
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1o59kK-0007S6-DP
 for qemu-devel@nongnu.org; Sat, 25 Jun 2022 13:39:03 -0400
HMM_SOURCE_IP: 172.18.0.48:34982.1285566443
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-171.223.97.81 (unknown [172.18.0.48])
 by chinatelecom.cn (HERMES) with SMTP id 0D4F92800DC;
 Sun, 26 Jun 2022 01:38:55 +0800 (CST)
X-189-SAVE-TO-SEND: +huangy81@chinatelecom.cn
Received: from  ([172.18.0.48])
 by app0024 with ESMTP id 6ecdde0d6a9f46e9b66c4c34f59e75c5 for
 qemu-devel@nongnu.org; Sun, 26 Jun 2022 01:38:59 CST
X-Transaction-ID: 6ecdde0d6a9f46e9b66c4c34f59e75c5
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.48
X-MEDUSA-Status: 0
From: huangy81@chinatelecom.cn
To: qemu-devel <qemu-devel@nongnu.org>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Peter Xu <peterx@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Hyman <huangy81@chinatelecom.cn>
Subject: [PATCH v25 4/8] softmmu/dirtylimit: Implement vCPU dirtyrate
 calculation periodically
Date: Sun, 26 Jun 2022 01:38:33 +0800
Message-Id: <5d0d641bffcb9b1c4cc3e323b6dfecb36050d948.1656177590.git.huangy81@chinatelecom.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1656177590.git.huangy81@chinatelecom.cn>
References: <cover.1656177590.git.huangy81@chinatelecom.cn>
In-Reply-To: <cover.1656177590.git.huangy81@chinatelecom.cn>
References: <cover.1656177590.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.228;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
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
Reviewed-by: Peter Xu <peterx@redhat.com>
---
 include/exec/memory.h       |   5 +-
 include/sysemu/dirtylimit.h |  22 +++++++++
 softmmu/dirtylimit.c        | 116 ++++++++++++++++++++++++++++++++++++++++++++
 softmmu/meson.build         |   1 +
 4 files changed, 143 insertions(+), 1 deletion(-)
 create mode 100644 include/sysemu/dirtylimit.h
 create mode 100644 softmmu/dirtylimit.c

diff --git a/include/exec/memory.h b/include/exec/memory.h
index a6a0f4d..bfb1de8 100644
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
index 0000000..ebdc064
--- /dev/null
+++ b/softmmu/dirtylimit.c
@@ -0,0 +1,116 @@
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
+    VcpuStat stat;
+    int i = 0;
+
+    /* calculate vcpu dirtyrate */
+    vcpu_calculate_dirtyrate(DIRTYLIMIT_CALC_TIME_MS,
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
+    return qatomic_read_i64(&rates[cpu_index].dirty_rate);
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
index 8138248..3272af1 100644
--- a/softmmu/meson.build
+++ b/softmmu/meson.build
@@ -4,6 +4,7 @@ specific_ss.add(when: 'CONFIG_SOFTMMU', if_true: [files(
   'memory.c',
   'physmem.c',
   'qtest.c',
+  'dirtylimit.c',
 )])
 
 specific_ss.add(when: ['CONFIG_SOFTMMU', 'CONFIG_TCG'], if_true: [files(
-- 
1.8.3.1


