Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA6203B523E
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Jun 2021 07:44:15 +0200 (CEST)
Received: from localhost ([::1]:58134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxNaY-0003kg-Bm
	for lists+qemu-devel@lfdr.de; Sun, 27 Jun 2021 01:44:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1lxNVI-0007fo-Ub
 for qemu-devel@nongnu.org; Sun, 27 Jun 2021 01:38:48 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.227]:44597
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1lxNVF-0001SH-UN
 for qemu-devel@nongnu.org; Sun, 27 Jun 2021 01:38:48 -0400
HMM_SOURCE_IP: 172.18.0.218:60506.95674552
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-171.223.99.176?logid-0210caab79734a8b87be68778a878dff
 (unknown [172.18.0.218])
 by chinatelecom.cn (HERMES) with SMTP id D5308280098;
 Sun, 27 Jun 2021 13:38:44 +0800 (CST)
X-189-SAVE-TO-SEND: +huangy81@chinatelecom.cn
Received: from  ([172.18.0.218])
 by app0025 with ESMTP id 9faa8b32bda048a993e73bdd46f4c4c7 for
 qemu-devel@nongnu.org; Sun Jun 27 13:38:44 2021
X-Transaction-ID: 9faa8b32bda048a993e73bdd46f4c4c7
X-filter-score: 
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.218
X-MEDUSA-Status: 0
From: huangy81@chinatelecom.cn
To: qemu-devel@nongnu.org
Subject: [PATCH 4/4] migration/dirtyrate: implement dirty-bitmap dirtyrate
 calculation
Date: Sun, 27 Jun 2021 13:38:17 +0800
Message-Id: <d7079fd32152065b5301b88571b46bdf5dc62867.1624771216.git.huangy81@chinatelecom.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1624768443.git.huangy81@chinatelecom.cn>
References: <cover.1624768443.git.huangy81@chinatelecom.cn>
In-Reply-To: <cover.1624771216.git.huangy81@chinatelecom.cn>
References: <cover.1624771216.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.227;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Hyman <huangy81@chinatelecom.cn>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Chuan Zheng <zhengchuan@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>

introduce dirty-bitmap mode as the third method of calc-dirty-rate.
implement dirty-bitmap dirtyrate calculation, which can be used
to measuring dirtyrate in the absence of dirty-ring.

introduce "dirty_bitmap:-b" option in hmp calc_dirty_rate to
indicate dirty bitmap method should be used for calculation.

Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
---
 hmp-commands.hx        |   9 +--
 migration/dirtyrate.c  | 147 ++++++++++++++++++++++++++++++++++++++++++++++---
 migration/trace-events |   2 +
 qapi/migration.json    |   6 +-
 4 files changed, 150 insertions(+), 14 deletions(-)

diff --git a/hmp-commands.hx b/hmp-commands.hx
index f7fc9d7..605973c 100644
--- a/hmp-commands.hx
+++ b/hmp-commands.hx
@@ -1738,9 +1738,10 @@ ERST
 
     {
         .name       = "calc_dirty_rate",
-        .args_type  = "dirty_ring:-r,second:l,sample_pages_per_GB:l?",
-        .params     = "[-r] second [sample_pages_per_GB]",
-        .help       = "start a round of guest dirty rate measurement (using -d to"
-                      "\n\t\t\t specify dirty ring as the method of calculation)",
+        .args_type  = "dirty_ring:-r,dirty_bitmap:-b,second:l,sample_pages_per_GB:l?",
+        .params     = "[-r] [-b] second [sample_pages_per_GB]",
+        .help       = "start a round of guest dirty rate measurement (using -r to"
+                      "\n\t\t\t specify dirty ring as the method of calculation and"
+                      "\n\t\t\t -b to specify dirty bitmap as method of calculation)",
         .cmd        = hmp_calc_dirty_rate,
     },
diff --git a/migration/dirtyrate.c b/migration/dirtyrate.c
index 3c8c5e2..bf465ce 100644
--- a/migration/dirtyrate.c
+++ b/migration/dirtyrate.c
@@ -15,6 +15,7 @@
 #include "qapi/error.h"
 #include "cpu.h"
 #include "exec/ramblock.h"
+#include "exec/ram_addr.h"
 #include "qemu/rcu_queue.h"
 #include "qemu/main-loop.h"
 #include "qapi/qapi-commands-migration.h"
@@ -111,6 +112,10 @@ static struct DirtyRateInfo *query_dirty_rate_info(void)
             }
             info->vcpu_dirty_rate = head;
         }
+
+        if (dirtyrate_mode == DIRTY_RATE_MEASURE_MODE_DIRTY_BITMAP) {
+            info->sample_pages = 0;
+        }
     }
 
     trace_query_dirty_rate_info(DirtyRateStatus_str(CalculatingState));
@@ -421,6 +426,114 @@ static int64_t do_calculate_dirtyrate_vcpu(DirtyPageRecord dirty_pages)
     return memory_size_MB / time_s;
 }
 
+static inline void dirtyrate_dirty_bits_clear(void)
+{
+    RAMBlock *block = NULL;
+
+    WITH_RCU_READ_LOCK_GUARD() {
+        RAMBLOCK_FOREACH_MIGRATABLE(block) {
+            cpu_physical_memory_dirtyrate_clear_dirty_bits(block);
+        }
+    }
+}
+
+static inline uint64_t dirtyrate_dirty_bits_reap(void)
+{
+    RAMBlock *block = NULL;
+    uint64_t dirty_pages = 0;
+    uint64_t total_pages = 0;
+
+    WITH_RCU_READ_LOCK_GUARD() {
+        RAMBLOCK_FOREACH_MIGRATABLE(block) {
+            dirty_pages = cpu_physical_memory_dirtyrate_stat_dirty_bits(block);
+            total_pages += dirty_pages;
+
+            trace_dirtyrate_bitmap_reap(block->idstr, dirty_pages);
+        }
+    }
+
+    return total_pages;
+}
+
+static inline void dirtyrate_manual_reset_protect(void)
+{
+    RAMBlock *block = NULL;
+
+    WITH_RCU_READ_LOCK_GUARD() {
+        RAMBLOCK_FOREACH_MIGRATABLE(block) {
+            cpu_physical_memory_dirtyrate_reset_protect(block);
+        }
+    }
+}
+
+static void do_calculate_dirtyrate_bitmap(void)
+{
+    uint64_t memory_size_MB;
+    int64_t time_s;
+    uint64_t increased_dirty_pages = 0;
+    uint64_t dirtyrate = 0;
+
+    increased_dirty_pages = dirtyrate_dirty_bits_reap();
+
+    memory_size_MB = (increased_dirty_pages * TARGET_PAGE_SIZE) >> 20;
+    time_s = DirtyStat.calc_time;
+
+    dirtyrate = memory_size_MB / time_s;
+    DirtyStat.dirty_rate = dirtyrate;
+
+    trace_dirtyrate_do_calculate_bitmap(increased_dirty_pages,
+                                        time_s, dirtyrate);
+}
+
+static void calculate_dirtyrate_dirty_bitmap(struct DirtyRateConfig config)
+{
+    int64_t msec = 0;
+    int64_t start_time;
+    uint64_t protect_flags = 0;
+    uint64_t initially_set = 0;
+    uint64_t protect_only = 0;
+
+    protect_flags = kvm_get_manual_dirty_log_protect();
+    protect_only = KVM_DIRTY_LOG_MANUAL_PROTECT_ENABLE;
+    initially_set =
+        (KVM_DIRTY_LOG_MANUAL_PROTECT_ENABLE | KVM_DIRTY_LOG_INITIALLY_SET);
+
+    dirtyrate_global_dirty_log_start();
+
+    /* absense of migration */
+    if (!(global_dirty_tracking & GLOBAL_DIRTY_MIGRATION)) {
+        if ((protect_flags & initially_set) == initially_set) {
+            /* skip the 1'round which return all 1 bits */
+            memory_global_dirty_log_sync();
+            /*
+             * reset page protect manually and
+             * start dirty tracking from now on
+             **/
+            dirtyrate_manual_reset_protect();
+        }
+    }
+
+    dirtyrate_dirty_bits_clear();
+
+    start_time = qemu_clock_get_ms(QEMU_CLOCK_REALTIME);
+    DirtyStat.start_time = start_time / 1000;
+
+    msec = config.sample_period_seconds * 1000;
+    msec = set_sample_page_period(msec, start_time);
+    DirtyStat.calc_time = msec / 1000;
+
+    /* fetch dirty bitmap from kvm */
+    memory_global_dirty_log_sync();
+
+    do_calculate_dirtyrate_bitmap();
+
+    if (protect_flags & protect_only) {
+        dirtyrate_manual_reset_protect();
+    }
+
+    dirtyrate_global_dirty_log_stop();
+}
+
 static void calculate_dirtyrate_dirty_ring(struct DirtyRateConfig config)
 {
     CPUState *cpu;
@@ -506,7 +619,9 @@ out:
 
 static void calculate_dirtyrate(struct DirtyRateConfig config)
 {
-    if (config.mode == DIRTY_RATE_MEASURE_MODE_DIRTY_RING) {
+    if (config.mode == DIRTY_RATE_MEASURE_MODE_DIRTY_BITMAP) {
+        calculate_dirtyrate_dirty_bitmap(config);
+    } else if (config.mode == DIRTY_RATE_MEASURE_MODE_DIRTY_RING) {
         calculate_dirtyrate_dirty_ring(config);
     } else {
         calculate_dirtyrate_sample_vm(config);
@@ -589,11 +704,14 @@ void qmp_calc_dirty_rate(int64_t calc_time,
 
     /*
      * dirty ring mode only works when kvm dirty ring is enabled.
+     * on the contrary, dirty bitmap mode is not.
      */
-    if ((mode == DIRTY_RATE_MEASURE_MODE_DIRTY_RING) &&
-        !kvm_dirty_ring_enabled()) {
-        error_setg(errp, "dirty ring is disabled, use sample-pages method "
-                         "or remeasure later.");
+    if (((mode == DIRTY_RATE_MEASURE_MODE_DIRTY_RING) &&
+        !kvm_dirty_ring_enabled()) ||
+        ((mode == DIRTY_RATE_MEASURE_MODE_DIRTY_BITMAP) &&
+         kvm_dirty_ring_enabled())) {
+        error_setg(errp, "mode %s is not enabled, use other method instead.",
+                         DirtyRateMeasureMode_str(mode));
         return;
     }
 
@@ -670,9 +788,8 @@ void hmp_calc_dirty_rate(Monitor *mon, const QDict *qdict)
     int64_t sample_pages = qdict_get_try_int(qdict, "sample_pages_per_GB", -1);
     bool has_sample_pages = (sample_pages != -1);
     bool dirty_ring = qdict_get_try_bool(qdict, "dirty_ring", false);
-    DirtyRateMeasureMode mode =
-        (dirty_ring ? DIRTY_RATE_MEASURE_MODE_DIRTY_RING :
-         DIRTY_RATE_MEASURE_MODE_PAGE_SAMPLING);
+    bool dirty_bitmap = qdict_get_try_bool(qdict, "dirty_bitmap", false);
+    DirtyRateMeasureMode mode = DIRTY_RATE_MEASURE_MODE_PAGE_SAMPLING;
     Error *err = NULL;
 
     if (!sec) {
@@ -680,6 +797,20 @@ void hmp_calc_dirty_rate(Monitor *mon, const QDict *qdict)
         return;
     }
 
+    if (dirty_ring && dirty_bitmap) {
+        monitor_printf(mon, "Either dirty ring or dirty bitmap "
+                       "can be specified!\n");
+        return;
+    }
+
+    if (dirty_bitmap) {
+        mode = DIRTY_RATE_MEASURE_MODE_DIRTY_BITMAP;
+    }
+
+    if (dirty_ring) {
+        mode = DIRTY_RATE_MEASURE_MODE_DIRTY_RING;
+    }
+
     qmp_calc_dirty_rate(sec, has_sample_pages, sample_pages, true,
                         mode, &err);
     if (err) {
diff --git a/migration/trace-events b/migration/trace-events
index ce0b5e6..e19e3e1 100644
--- a/migration/trace-events
+++ b/migration/trace-events
@@ -333,6 +333,8 @@ skip_sample_ramblock(const char *idstr, uint64_t ramblock_size) "ramblock name:
 find_page_matched(const char *idstr) "ramblock %s addr or size changed"
 dirtyrate_calculate(int64_t dirtyrate) "dirty rate: %" PRIi64 " MB/s"
 dirtyrate_do_calculate_vcpu(int idx, uint64_t rate) "vcpu[%d]: %"PRIu64 " MB/s"
+dirtyrate_do_calculate_bitmap(uint64_t pages, int64_t time, uint64_t rate) "%"PRIu64 " pages has increased in %"PRIi64 " s, rate %"PRIu64 "MB/s"
+dirtyrate_bitmap_reap(const char *idstr, uint64_t pages) "ramblock name: %s, has %"PRIu64 " dirty pages"
 
 # block.c
 migration_block_init_shared(const char *blk_device_name) "Start migration for %s with shared base image"
diff --git a/qapi/migration.json b/qapi/migration.json
index de35528..0b00976 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -1747,13 +1747,15 @@
 #
 # @page-sampling: calculate dirtyrate by sampling pages.
 #
-# @dirty-ring: calculate dirtyrate by via dirty ring.
+# @dirty-ring: calculate dirtyrate by dirty ring.
+#
+# @dirty-bitmap: calculate dirtyrate by dirty bitmap.
 #
 # Since: 6.1
 #
 ##
 { 'enum': 'DirtyRateMeasureMode',
-  'data': ['page-sampling', 'dirty-ring'] }
+  'data': ['page-sampling', 'dirty-ring', 'dirty-bitmap'] }
 
 ##
 # @DirtyRateInfo:
-- 
1.8.3.1


