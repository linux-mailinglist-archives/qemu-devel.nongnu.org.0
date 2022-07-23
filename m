Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF6157ECA4
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jul 2022 10:08:11 +0200 (CEST)
Received: from localhost ([::1]:32950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oFABF-0007x0-Ra
	for lists+qemu-devel@lfdr.de; Sat, 23 Jul 2022 04:08:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1oF9ti-0001gg-PG
 for qemu-devel@nongnu.org; Sat, 23 Jul 2022 03:50:02 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.222]:53680
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1oF9tT-0000TK-KE
 for qemu-devel@nongnu.org; Sat, 23 Jul 2022 03:50:02 -0400
HMM_SOURCE_IP: 172.18.0.218:34686.1353564676
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-125.69.42.4 (unknown [172.18.0.218])
 by chinatelecom.cn (HERMES) with SMTP id AEC362800C3;
 Sat, 23 Jul 2022 15:49:39 +0800 (CST)
X-189-SAVE-TO-SEND: +huangy81@chinatelecom.cn
Received: from  ([172.18.0.218])
 by app0025 with ESMTP id 3e3a940d6ca34fe4bc961cf268e1c8b2 for
 qemu-devel@nongnu.org; Sat, 23 Jul 2022 15:49:41 CST
X-Transaction-ID: 3e3a940d6ca34fe4bc961cf268e1c8b2
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.218
X-MEDUSA-Status: 0
From: huangy81@chinatelecom.cn
To: qemu-devel <qemu-devel@nongnu.org>
Cc: Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, peterx@redhat.com,
 "Daniel P. Berrange" <berrange@redhat.com>,
 =?UTF-8?q?Hyman=20Huang=28=E9=BB=84=E5=8B=87=29?= <huangy81@chinatelecom.cn>
Subject: [PATCH 5/8] migration: Export dirty-limit time info
Date: Sat, 23 Jul 2022 15:49:17 +0800
Message-Id: <a58c283199e8c219307888c7fa0e3fe4129d2b3d.1658561555.git.huangy81@chinatelecom.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1658561555.git.huangy81@chinatelecom.cn>
References: <cover.1658561555.git.huangy81@chinatelecom.cn>
In-Reply-To: <cover.1658561555.git.huangy81@chinatelecom.cn>
References: <cover.1658561555.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.222;
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

Export dirty limit throttle time and estimated ring full
time, through which we can observe the process of dirty
limit during live migration.

Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
---
 include/sysemu/dirtylimit.h |  2 ++
 migration/migration.c       | 10 ++++++++++
 monitor/hmp-cmds.c          | 10 ++++++++++
 qapi/migration.json         | 10 +++++++++-
 softmmu/dirtylimit.c        | 22 ++++++++++++++++++++++
 5 files changed, 53 insertions(+), 1 deletion(-)

diff --git a/include/sysemu/dirtylimit.h b/include/sysemu/dirtylimit.h
index 8d2c1f3..98cc4a6 100644
--- a/include/sysemu/dirtylimit.h
+++ b/include/sysemu/dirtylimit.h
@@ -34,4 +34,6 @@ void dirtylimit_set_vcpu(int cpu_index,
 void dirtylimit_set_all(uint64_t quota,
                         bool enable);
 void dirtylimit_vcpu_execute(CPUState *cpu);
+int64_t dirtylimit_throttle_us_per_full(void);
+int64_t dirtylimit_us_ring_full(void);
 #endif
diff --git a/migration/migration.c b/migration/migration.c
index 84b592e..81a46e2 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -61,6 +61,7 @@
 #include "sysemu/cpus.h"
 #include "yank_functions.h"
 #include "sysemu/qtest.h"
+#include "sysemu/dirtylimit.h"
 
 #define MAX_THROTTLE  (128 << 20)      /* Migration transfer speed throttling */
 
@@ -1109,6 +1110,15 @@ static void populate_ram_info(MigrationInfo *info, MigrationState *s)
         info->ram->remaining = ram_bytes_remaining();
         info->ram->dirty_pages_rate = ram_counters.dirty_pages_rate;
     }
+
+    if (migrate_dirty_limit() && dirtylimit_in_service()) {
+        info->has_dirty_limit_throttle_us_per_full = true;
+        info->dirty_limit_throttle_us_per_full =
+                            dirtylimit_throttle_us_per_full();
+
+        info->has_dirty_limit_us_ring_full = true;
+        info->dirty_limit_us_ring_full = dirtylimit_us_ring_full();
+    }
 }
 
 static void populate_disk_info(MigrationInfo *info)
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index acbc5e8..accc869 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -358,6 +358,16 @@ void hmp_info_migrate(Monitor *mon, const QDict *qdict)
                        info->cpu_throttle_percentage);
     }
 
+    if (info->has_dirty_limit_throttle_us_per_full) {
+        monitor_printf(mon, "dirty-limit throttle time: %" PRIu64 " us\n",
+                       info->dirty_limit_throttle_us_per_full);
+    }
+
+    if (info->has_dirty_limit_us_ring_full) {
+        monitor_printf(mon, "dirty-limit ring full time: %" PRIu64 " us\n",
+                       info->dirty_limit_us_ring_full);
+    }
+
     if (info->has_postcopy_blocktime) {
         monitor_printf(mon, "postcopy blocktime: %u\n",
                        info->postcopy_blocktime);
diff --git a/qapi/migration.json b/qapi/migration.json
index 39e5f5e..6b8283f 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -242,6 +242,12 @@
 #                   Present and non-empty when migration is blocked.
 #                   (since 6.0)
 #
+# @dirty-limit-throttle-us-per-full: Throttle time (us) during the period of
+#                                    dirty ring full (since 7.0)
+#
+# @dirty-limit-us-ring-full: Estimated periodic time (us) of dirty ring full.
+#                            (since 7.0)
+#
 # Since: 0.14
 ##
 { 'struct': 'MigrationInfo',
@@ -259,7 +265,9 @@
            '*postcopy-blocktime' : 'uint32',
            '*postcopy-vcpu-blocktime': ['uint32'],
            '*compression': 'CompressionStats',
-           '*socket-address': ['SocketAddress'] } }
+           '*socket-address': ['SocketAddress'],
+           '*dirty-limit-throttle-us-per-full': 'int64',
+           '*dirty-limit-us-ring-full': 'int64'} }
 
 ##
 # @query-migrate:
diff --git a/softmmu/dirtylimit.c b/softmmu/dirtylimit.c
index 1fdd8c6..1251b27 100644
--- a/softmmu/dirtylimit.c
+++ b/softmmu/dirtylimit.c
@@ -546,6 +546,28 @@ static struct DirtyLimitInfo *dirtylimit_query_vcpu(int cpu_index)
     return info;
 }
 
+/* Pick up first vcpu throttle time by default */
+int64_t dirtylimit_throttle_us_per_full(void)
+{
+    CPUState *cpu = first_cpu;
+    return cpu->throttle_us_per_full;
+}
+
+/*
+ * Estimate dirty ring full time under current dirty page rate.
+ * Return -1 if guest doesn't dirty memory.
+ */
+int64_t dirtylimit_us_ring_full(void)
+{
+    uint64_t curr_rate = vcpu_dirty_rate_get(0);
+
+    if (!curr_rate) {
+        return -1;
+    }
+
+    return dirtylimit_dirty_ring_full_time(curr_rate);
+}
+
 static struct DirtyLimitInfoList *dirtylimit_query_all(void)
 {
     int i, index;
-- 
1.8.3.1


