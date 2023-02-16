Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25BCC6999C7
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 17:20:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSgzG-0001vH-ML; Thu, 16 Feb 2023 11:19:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1pSgzE-0001kx-7e
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 11:19:56 -0500
Received: from prt-mail.chinatelecom.cn ([42.123.76.223] helo=chinatelecom.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1pSgz6-00057o-Ks
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 11:19:55 -0500
HMM_SOURCE_IP: 172.18.0.188:50698.1319324123
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-118.116.19.27 (unknown [172.18.0.188])
 by chinatelecom.cn (HERMES) with SMTP id 1F51D2800E2;
 Fri, 17 Feb 2023 00:19:42 +0800 (CST)
X-189-SAVE-TO-SEND: +huangy81@chinatelecom.cn
Received: from  ([118.116.19.27])
 by app0023 with ESMTP id 39ca26f00da34716880fb8ea48d74c5c for
 qemu-devel@nongnu.org; Fri, 17 Feb 2023 00:19:46 CST
X-Transaction-ID: 39ca26f00da34716880fb8ea48d74c5c
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 118.116.19.27
X-MEDUSA-Status: 0
From: huangy81@chinatelecom.cn
To: qemu-devel <qemu-devel@nongnu.org>
Cc: Markus Armbruster <armbru@redhat.com>, Peter Xu <peterx@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Hyman=20Huang=28=E9=BB=84=E5=8B=87=29?= <huangy81@chinatelecom.cn>
Subject: [PATCH v4 09/10] migration: Extend query-migrate to provide dirty
 page limit info
Date: Fri, 17 Feb 2023 00:18:38 +0800
Message-Id: <92b74c98dbb6df18cda73149088083d276a660a3.1676563222.git.huangy81@chinatelecom.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1676563222.git.huangy81@chinatelecom.cn>
References: <cover.1676563222.git.huangy81@chinatelecom.cn>
In-Reply-To: <cover.1676563222.git.huangy81@chinatelecom.cn>
References: <cover.1676563222.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.223;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>

Extend query-migrate to provide throttle time and estimated
ring full time with dirty-limit capability enabled, through which
we can observe if dirty limit take effect during live migration.

Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 include/sysemu/dirtylimit.h    |  2 ++
 migration/migration-hmp-cmds.c | 10 +++++++++
 migration/migration.c          | 10 +++++++++
 qapi/migration.json            | 15 ++++++++++++-
 softmmu/dirtylimit.c           | 39 ++++++++++++++++++++++++++++++++++
 5 files changed, 75 insertions(+), 1 deletion(-)

diff --git a/include/sysemu/dirtylimit.h b/include/sysemu/dirtylimit.h
index 8d2c1f3a6b..410a2bc0b6 100644
--- a/include/sysemu/dirtylimit.h
+++ b/include/sysemu/dirtylimit.h
@@ -34,4 +34,6 @@ void dirtylimit_set_vcpu(int cpu_index,
 void dirtylimit_set_all(uint64_t quota,
                         bool enable);
 void dirtylimit_vcpu_execute(CPUState *cpu);
+int64_t dirtylimit_throttle_time_per_round(void);
+int64_t dirtylimit_ring_full_time(void);
 #endif
diff --git a/migration/migration-hmp-cmds.c b/migration/migration-hmp-cmds.c
index a61ec80d9d..1f090faec5 100644
--- a/migration/migration-hmp-cmds.c
+++ b/migration/migration-hmp-cmds.c
@@ -171,6 +171,16 @@ void hmp_info_migrate(Monitor *mon, const QDict *qdict)
                        info->cpu_throttle_percentage);
     }
 
+    if (info->has_dirty_limit_throttle_time_per_round) {
+        monitor_printf(mon, "dirty-limit throttle time: %" PRIi64 " us\n",
+                       info->dirty_limit_throttle_time_per_round);
+    }
+
+    if (info->has_dirty_limit_ring_full_time) {
+        monitor_printf(mon, "dirty-limit ring full time: %" PRIi64 " us\n",
+                       info->dirty_limit_ring_full_time);
+    }
+
     if (info->has_postcopy_blocktime) {
         monitor_printf(mon, "postcopy blocktime: %u\n",
                        info->postcopy_blocktime);
diff --git a/migration/migration.c b/migration/migration.c
index 7ccbc07257..1f1e1f2268 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -65,6 +65,7 @@
 #include "sysemu/qtest.h"
 #include "ui/qemu-spice.h"
 #include "sysemu/kvm.h"
+#include "sysemu/dirtylimit.h"
 
 #define MAX_THROTTLE  (128 << 20)      /* Migration transfer speed throttling */
 
@@ -1203,6 +1204,15 @@ static void populate_ram_info(MigrationInfo *info, MigrationState *s)
         info->ram->remaining = ram_bytes_remaining();
         info->ram->dirty_pages_rate = ram_counters.dirty_pages_rate;
     }
+
+    if (migrate_dirty_limit() && dirtylimit_in_service()) {
+        info->has_dirty_limit_throttle_time_per_round = true;
+        info->dirty_limit_throttle_time_per_round =
+                            dirtylimit_throttle_time_per_round();
+
+        info->has_dirty_limit_ring_full_time = true;
+        info->dirty_limit_ring_full_time = dirtylimit_us_ring_full();
+    }
 }
 
 static void populate_disk_info(MigrationInfo *info)
diff --git a/qapi/migration.json b/qapi/migration.json
index b7a92be055..f511771101 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -242,6 +242,17 @@
 #                   Present and non-empty when migration is blocked.
 #                   (since 6.0)
 #
+# @dirty-limit-throttle-time-per-round: Maximum throttle time (in microseconds) of virtual
+#                                       CPUs each dirty ring full round, which shows how
+#                                       MigrationCapability dirty-limit affects the guest
+#                                       during live migration. (since 8.0)
+#
+# @dirty-limit-ring-full-time: Estimated average dirty ring full time (in microseconds)
+#                              each dirty ring full round, note that the value equals
+#                              dirty ring memory size divided by average dirty page rate
+#                              of virtual CPU, which can be used to observe the average
+#                              memory load of virtual CPU indirectly. (since 8.0)
+#
 # Since: 0.14
 ##
 { 'struct': 'MigrationInfo',
@@ -259,7 +270,9 @@
            '*postcopy-blocktime' : 'uint32',
            '*postcopy-vcpu-blocktime': ['uint32'],
            '*compression': 'CompressionStats',
-           '*socket-address': ['SocketAddress'] } }
+           '*socket-address': ['SocketAddress'],
+           '*dirty-limit-throttle-time-per-round': 'int64',
+           '*dirty-limit-ring-full-time': 'int64'} }
 
 ##
 # @query-migrate:
diff --git a/softmmu/dirtylimit.c b/softmmu/dirtylimit.c
index ae77ebe5c5..3c07844a11 100644
--- a/softmmu/dirtylimit.c
+++ b/softmmu/dirtylimit.c
@@ -568,6 +568,45 @@ static struct DirtyLimitInfo *dirtylimit_query_vcpu(int cpu_index)
     return info;
 }
 
+/* Return the max throttle time of each virtual CPU */
+int64_t dirtylimit_throttle_time_per_round(void)
+{
+    CPUState *cpu;
+    int64_t max = 0;
+
+    CPU_FOREACH(cpu) {
+        if (cpu->throttle_us_per_full > max) {
+            max = cpu->throttle_us_per_full;
+        }
+    }
+
+    return max;
+}
+
+/*
+ * Estimate average dirty ring full time of each virtaul CPU.
+ * Return -1 if guest doesn't dirty memory.
+ */
+int64_t dirtylimit_us_ring_full(void)
+{
+    CPUState *cpu;
+    uint64_t curr_rate = 0;
+    int nvcpus = 0;
+
+    CPU_FOREACH(cpu) {
+        if (cpu->running) {
+            nvcpus++;
+            curr_rate += vcpu_dirty_rate_get(cpu->cpu_index);
+        }
+    }
+
+    if (!curr_rate || !nvcpus) {
+        return -1;
+    }
+
+    return dirtylimit_dirty_ring_full_time(curr_rate / nvcpus);
+}
+
 static struct DirtyLimitInfoList *dirtylimit_query_all(void)
 {
     int i, index;
-- 
2.17.1


