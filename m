Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D5455553F9
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 21:07:56 +0200 (CEST)
Received: from localhost ([::1]:55636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o45hj-0006lw-F4
	for lists+qemu-devel@lfdr.de; Wed, 22 Jun 2022 15:07:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1o45Gm-0008I6-Cl
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 14:40:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36334)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1o45Gi-0002Iz-3I
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 14:40:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655923199;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+fD8EzKfyZsSjieIEW8N0I5mT8kDQQSXoBwgJL6zw9Y=;
 b=M8qnuTYL2JYjqyKvvU+yQmbPOOyQhJRIsYxwQYsaibH0kv560W2TPLZoxof5tpyADDyvbg
 IPn5MkkCTZ3MDKZ/FnOejByXLrZccJIrDgmLJeijB5cEdlLpxzPXPXjuv/LDYg/vaTg7LC
 a8+uCB/BYZl4gIs0Fd2nNdNvrNCnHwY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-205-rdflEBaqOh6z3uveo-Vquw-1; Wed, 22 Jun 2022 14:39:56 -0400
X-MC-Unique: rdflEBaqOh6z3uveo-Vquw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 11D511C1C1A7;
 Wed, 22 Jun 2022 18:39:56 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.33.36.161])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 302E89D63;
 Wed, 22 Jun 2022 18:39:55 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, berrange@redhat.com, huangy81@chinatelecom.cn,
 quintela@redhat.com, leobras@redhat.com
Cc: jdenemar@redhat.com
Subject: [PULL 29/33] softmmu/dirtylimit: Implement vCPU dirtyrate calculation
 periodically
Date: Wed, 22 Jun 2022 19:39:13 +0100
Message-Id: <20220622183917.155308-30-dgilbert@redhat.com>
In-Reply-To: <20220622183917.155308-1-dgilbert@redhat.com>
References: <20220622183917.155308-1-dgilbert@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Message-Id: <69a2287b9bf98a4a3d967e01091cb8f6bf80ead4.1652931128.git.huangy81@chinatelecom.cn>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 include/exec/memory.h       |   5 +-
 include/sysemu/dirtylimit.h |  22 +++++++
 softmmu/dirtylimit.c        | 116 ++++++++++++++++++++++++++++++++++++
 softmmu/meson.build         |   1 +
 4 files changed, 143 insertions(+), 1 deletion(-)
 create mode 100644 include/sysemu/dirtylimit.h
 create mode 100644 softmmu/dirtylimit.c

diff --git a/include/exec/memory.h b/include/exec/memory.h
index a6a0f4d8ad..bfb1de8eea 100644
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
index 0000000000..da459f03d6
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
index 0000000000..6102e8c76f
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
index 8138248661..3272af1f31 100644
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
2.36.1


