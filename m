Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B72BE5A9E23
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 19:37:29 +0200 (CEST)
Received: from localhost ([::1]:52562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTo89-0006FR-0S
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 13:37:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1oTnuA-0000Ew-Ca
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 13:23:02 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.223]:56536
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1oTnu7-00037I-WE
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 13:23:01 -0400
HMM_SOURCE_IP: 172.18.0.218:57590.1734067809
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-171.223.99.60 (unknown [172.18.0.218])
 by chinatelecom.cn (HERMES) with SMTP id 3014F2800D6;
 Fri,  2 Sep 2022 01:22:56 +0800 (CST)
X-189-SAVE-TO-SEND: +huangy81@chinatelecom.cn
Received: from  ([172.18.0.218])
 by app0025 with ESMTP id 948b856cdb844f828436419023467706 for
 qemu-devel@nongnu.org; Fri, 02 Sep 2022 01:22:58 CST
X-Transaction-ID: 948b856cdb844f828436419023467706
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.218
X-MEDUSA-Status: 0
From: huangy81@chinatelecom.cn
To: qemu-devel <qemu-devel@nongnu.org>
Cc: Peter Xu <peterx@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 =?UTF-8?q?Hyman=20Huang=28=E9=BB=84=E5=8B=87=29?= <huangy81@chinatelecom.cn>
Subject: [PATCH v1 5/8] migration: Export dirty-limit time info
Date: Fri,  2 Sep 2022 01:22:33 +0800
Message-Id: <5ca0b4ae2aa787c1547d798521ab0e67867437a8.1662052189.git.huangy81@chinatelecom.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1662052189.git.huangy81@chinatelecom.cn>
References: <cover.1662052189.git.huangy81@chinatelecom.cn>
In-Reply-To: <cover.1662052189.git.huangy81@chinatelecom.cn>
References: <cover.1662052189.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.223;
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
index 64696de..22ba197 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -61,6 +61,7 @@
 #include "sysemu/cpus.h"
 #include "yank_functions.h"
 #include "sysemu/qtest.h"
+#include "sysemu/dirtylimit.h"
 
 #define MAX_THROTTLE  (128 << 20)      /* Migration transfer speed throttling */
 
@@ -1110,6 +1111,15 @@ static void populate_ram_info(MigrationInfo *info, MigrationState *s)
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
index b362fae..23c3f48 100644
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
index bc4bc96..c263d54 100644
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


