Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FBCB5299AF
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 08:44:17 +0200 (CEST)
Received: from localhost ([::1]:55898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqqwJ-0001Dk-Tr
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 02:44:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1nqqoN-0004mC-KF
 for qemu-devel@nongnu.org; Tue, 17 May 2022 02:36:04 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.219]:46625
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1nqqoL-0007mR-FN
 for qemu-devel@nongnu.org; Tue, 17 May 2022 02:36:03 -0400
HMM_SOURCE_IP: 172.18.0.48:35216.1855245433
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-36.111.64.84 (unknown [172.18.0.48])
 by chinatelecom.cn (HERMES) with SMTP id 73F9E2800D6;
 Tue, 17 May 2022 14:35:41 +0800 (CST)
X-189-SAVE-TO-SEND: +huangy81@chinatelecom.cn
Received: from  ([172.18.0.48])
 by app0024 with ESMTP id b65c6fbde9e2463098aabac31856ca78 for
 qemu-devel@nongnu.org; Tue, 17 May 2022 14:35:45 CST
X-Transaction-ID: b65c6fbde9e2463098aabac31856ca78
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.48
X-MEDUSA-Status: 0
From: huangy81@chinatelecom.cn
To: qemu-devel <qemu-devel@nongnu.org>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Hyman Huang <huangy81@chinatelecom.cn>
Subject: [RFC 5/6] migration: Add dirtylimit data into migration info
Date: Tue, 17 May 2022 14:35:05 +0800
Message-Id: <b501e5d069a76ca2b60e076c424ca45fb062b05e.1652762652.git.huangy81@chinatelecom.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1652762652.git.huangy81@chinatelecom.cn>
References: <cover.1652762652.git.huangy81@chinatelecom.cn>
In-Reply-To: <cover.1652762652.git.huangy81@chinatelecom.cn>
References: <cover.1652762652.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.219;
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

Add dirtylimit throttle data into migration info, through
which we can observe the process of dirtylimit during
live migration.

Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
---
 include/sysemu/dirtylimit.h |  2 ++
 migration/migration.c       | 10 ++++++++++
 qapi/migration.json         | 11 ++++++++++-
 softmmu/dirtylimit.c        | 22 ++++++++++++++++++++++
 4 files changed, 44 insertions(+), 1 deletion(-)

diff --git a/include/sysemu/dirtylimit.h b/include/sysemu/dirtylimit.h
index 8d2c1f3..0b8dd76 100644
--- a/include/sysemu/dirtylimit.h
+++ b/include/sysemu/dirtylimit.h
@@ -34,4 +34,6 @@ void dirtylimit_set_vcpu(int cpu_index,
 void dirtylimit_set_all(uint64_t quota,
                         bool enable);
 void dirtylimit_vcpu_execute(CPUState *cpu);
+int64_t dirtylimit_throttle_us_per_full(void);
+int64_t dirtylimit_us_per_full(void);
 #endif
diff --git a/migration/migration.c b/migration/migration.c
index 4a659b6..935179e 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -61,6 +61,7 @@
 #include "sysemu/cpus.h"
 #include "yank_functions.h"
 #include "sysemu/qtest.h"
+#include "sysemu/dirtylimit.h"
 
 #define MAX_THROTTLE  (128 << 20)      /* Migration transfer speed throttling */
 
@@ -1065,6 +1066,15 @@ static void populate_ram_info(MigrationInfo *info, MigrationState *s)
         info->ram->remaining = ram_bytes_remaining();
         info->ram->dirty_pages_rate = ram_counters.dirty_pages_rate;
     }
+
+    if (migrate_dirtylimit() && dirtylimit_in_service()) {
+        info->has_dirtylimit_throttle_us_per_full = true;
+        info->dirtylimit_throttle_us_per_full =
+                            dirtylimit_throttle_us_per_full();
+
+        info->has_dirtylimit_us_per_full = true;
+        info->dirtylimit_us_per_full = dirtylimit_us_per_full();
+    }
 }
 
 static void populate_disk_info(MigrationInfo *info)
diff --git a/qapi/migration.json b/qapi/migration.json
index 30ad413..cac4c8d 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -239,6 +239,13 @@
 #                   Present and non-empty when migration is blocked.
 #                   (since 6.0)
 #
+# @dirtylimit-throttle-us-per-full: Throttle time (us) during the period of
+#                                   dirty ring full.
+#                                   (since 7.0)
+#
+# @dirtylimit-us-per-full: Estimated the periodic time (us) of dirty ring full.
+#                          (since 7.0)
+#
 # Since: 0.14
 ##
 { 'struct': 'MigrationInfo',
@@ -256,7 +263,9 @@
            '*postcopy-blocktime' : 'uint32',
            '*postcopy-vcpu-blocktime': ['uint32'],
            '*compression': 'CompressionStats',
-           '*socket-address': ['SocketAddress'] } }
+           '*socket-address': ['SocketAddress'],
+           '*dirtylimit-throttle-us-per-full': 'int64',
+           '*dirtylimit-us-per-full': 'int64'} }
 
 ##
 # @query-migrate:
diff --git a/softmmu/dirtylimit.c b/softmmu/dirtylimit.c
index affe993..33440c0 100644
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
+int64_t dirtylimit_us_per_full(void)
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


