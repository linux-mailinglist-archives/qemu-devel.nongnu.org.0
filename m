Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 373605577E6
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 12:30:48 +0200 (CEST)
Received: from localhost ([::1]:42216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4K6n-0001ei-W7
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 06:30:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1o4J8z-0000qQ-D1
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 05:28:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1o4J8x-00050U-Am
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 05:28:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655976534;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=66v7PyoESFH4i8uDIErFBn9sj9Qf11DXUYqrmDqKFEE=;
 b=WOMe26vm8L7/kew3raw9nesoC/s5DQELshpByazSSBtvTMHdfzdxkgBotWZy88gcdfZitq
 zC4+ysIIcleoYYgvlyxIy5KTs6EqmHiqTw5YFrTjYiOKYLZK/GOG+Ame7oULdzwfgTif3p
 YDE6aDQ9lUqoz13mXwBUitUlIW57cdU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-587-kG3HHbb5PN6bmyxJ76y-Iw-1; Thu, 23 Jun 2022 05:28:51 -0400
X-MC-Unique: kG3HHbb5PN6bmyxJ76y-Iw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B94DD3AF42A8;
 Thu, 23 Jun 2022 09:28:50 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.33.36.159])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BDD9D40C1289;
 Thu, 23 Jun 2022 09:28:49 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, berrange@redhat.com, huangy81@chinatelecom.cn,
 quintela@redhat.com, leobras@redhat.com, peterx@redhat.com
Cc: jdenemar@redhat.com
Subject: [PULL 28/33] migration/dirtyrate: Refactor dirty page rate calculation
Date: Thu, 23 Jun 2022 10:28:05 +0100
Message-Id: <20220623092810.96234-29-dgilbert@redhat.com>
In-Reply-To: <20220623092810.96234-1-dgilbert@redhat.com>
References: <20220623092810.96234-1-dgilbert@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
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

abstract out dirty log change logic into function
global_dirty_log_change.

abstract out dirty page rate calculation logic via
dirty-ring into function vcpu_calculate_dirtyrate.

abstract out mathematical dirty page rate calculation
into do_calculate_dirtyrate, decouple it from DirtyStat.

rename set_sample_page_period to dirty_stat_wait, which
is well-understood and will be reused in dirtylimit.

handle cpu hotplug/unplug scenario during measurement of
dirty page rate.

export util functions outside migration.

Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
Reviewed-by: Peter Xu <peterx@redhat.com>
Message-Id: <1d65b53c19cfc7dca0114422129515055fa18fb8.1652931128.git.huangy81@chinatelecom.cn>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 include/sysemu/dirtyrate.h |  28 +++++
 migration/dirtyrate.c      | 227 +++++++++++++++++++++++--------------
 migration/dirtyrate.h      |   7 +-
 3 files changed, 174 insertions(+), 88 deletions(-)
 create mode 100644 include/sysemu/dirtyrate.h

diff --git a/include/sysemu/dirtyrate.h b/include/sysemu/dirtyrate.h
new file mode 100644
index 0000000000..4d3b9a4902
--- /dev/null
+++ b/include/sysemu/dirtyrate.h
@@ -0,0 +1,28 @@
+/*
+ * dirty page rate helper functions
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
+#ifndef QEMU_DIRTYRATE_H
+#define QEMU_DIRTYRATE_H
+
+typedef struct VcpuStat {
+    int nvcpu; /* number of vcpu */
+    DirtyRateVcpu *rates; /* array of dirty rate for each vcpu */
+} VcpuStat;
+
+int64_t vcpu_calculate_dirtyrate(int64_t calc_time_ms,
+                                 VcpuStat *stat,
+                                 unsigned int flag,
+                                 bool one_shot);
+
+void global_dirty_log_change(unsigned int flag,
+                             bool start);
+#endif
diff --git a/migration/dirtyrate.c b/migration/dirtyrate.c
index aace12a787..795fab5c37 100644
--- a/migration/dirtyrate.c
+++ b/migration/dirtyrate.c
@@ -46,7 +46,7 @@ static struct DirtyRateStat DirtyStat;
 static DirtyRateMeasureMode dirtyrate_mode =
                 DIRTY_RATE_MEASURE_MODE_PAGE_SAMPLING;
 
-static int64_t set_sample_page_period(int64_t msec, int64_t initial_time)
+static int64_t dirty_stat_wait(int64_t msec, int64_t initial_time)
 {
     int64_t current_time;
 
@@ -60,6 +60,132 @@ static int64_t set_sample_page_period(int64_t msec, int64_t initial_time)
     return msec;
 }
 
+static inline void record_dirtypages(DirtyPageRecord *dirty_pages,
+                                     CPUState *cpu, bool start)
+{
+    if (start) {
+        dirty_pages[cpu->cpu_index].start_pages = cpu->dirty_pages;
+    } else {
+        dirty_pages[cpu->cpu_index].end_pages = cpu->dirty_pages;
+    }
+}
+
+static int64_t do_calculate_dirtyrate(DirtyPageRecord dirty_pages,
+                                      int64_t calc_time_ms)
+{
+    uint64_t memory_size_MB;
+    uint64_t increased_dirty_pages =
+        dirty_pages.end_pages - dirty_pages.start_pages;
+
+    memory_size_MB = (increased_dirty_pages * TARGET_PAGE_SIZE) >> 20;
+
+    return memory_size_MB * 1000 / calc_time_ms;
+}
+
+void global_dirty_log_change(unsigned int flag, bool start)
+{
+    qemu_mutex_lock_iothread();
+    if (start) {
+        memory_global_dirty_log_start(flag);
+    } else {
+        memory_global_dirty_log_stop(flag);
+    }
+    qemu_mutex_unlock_iothread();
+}
+
+/*
+ * global_dirty_log_sync
+ * 1. sync dirty log from kvm
+ * 2. stop dirty tracking if needed.
+ */
+static void global_dirty_log_sync(unsigned int flag, bool one_shot)
+{
+    qemu_mutex_lock_iothread();
+    memory_global_dirty_log_sync();
+    if (one_shot) {
+        memory_global_dirty_log_stop(flag);
+    }
+    qemu_mutex_unlock_iothread();
+}
+
+static DirtyPageRecord *vcpu_dirty_stat_alloc(VcpuStat *stat)
+{
+    CPUState *cpu;
+    DirtyPageRecord *records;
+    int nvcpu = 0;
+
+    CPU_FOREACH(cpu) {
+        nvcpu++;
+    }
+
+    stat->nvcpu = nvcpu;
+    stat->rates = g_malloc0(sizeof(DirtyRateVcpu) * nvcpu);
+
+    records = g_malloc0(sizeof(DirtyPageRecord) * nvcpu);
+
+    return records;
+}
+
+static void vcpu_dirty_stat_collect(VcpuStat *stat,
+                                    DirtyPageRecord *records,
+                                    bool start)
+{
+    CPUState *cpu;
+
+    CPU_FOREACH(cpu) {
+        record_dirtypages(records, cpu, start);
+    }
+}
+
+int64_t vcpu_calculate_dirtyrate(int64_t calc_time_ms,
+                                 VcpuStat *stat,
+                                 unsigned int flag,
+                                 bool one_shot)
+{
+    DirtyPageRecord *records;
+    int64_t init_time_ms;
+    int64_t duration;
+    int64_t dirtyrate;
+    int i = 0;
+    unsigned int gen_id;
+
+retry:
+    init_time_ms = qemu_clock_get_ms(QEMU_CLOCK_REALTIME);
+
+    cpu_list_lock();
+    gen_id = cpu_list_generation_id_get();
+    records = vcpu_dirty_stat_alloc(stat);
+    vcpu_dirty_stat_collect(stat, records, true);
+    cpu_list_unlock();
+
+    duration = dirty_stat_wait(calc_time_ms, init_time_ms);
+
+    global_dirty_log_sync(flag, one_shot);
+
+    cpu_list_lock();
+    if (gen_id != cpu_list_generation_id_get()) {
+        g_free(records);
+        g_free(stat->rates);
+        cpu_list_unlock();
+        goto retry;
+    }
+    vcpu_dirty_stat_collect(stat, records, false);
+    cpu_list_unlock();
+
+    for (i = 0; i < stat->nvcpu; i++) {
+        dirtyrate = do_calculate_dirtyrate(records[i], duration);
+
+        stat->rates[i].id = i;
+        stat->rates[i].dirty_rate = dirtyrate;
+
+        trace_dirtyrate_do_calculate_vcpu(i, dirtyrate);
+    }
+
+    g_free(records);
+
+    return duration;
+}
+
 static bool is_sample_period_valid(int64_t sec)
 {
     if (sec < MIN_FETCH_DIRTYRATE_TIME_SEC ||
@@ -396,44 +522,6 @@ static bool compare_page_hash_info(struct RamblockDirtyInfo *info,
     return true;
 }
 
-static inline void record_dirtypages(DirtyPageRecord *dirty_pages,
-                                     CPUState *cpu, bool start)
-{
-    if (start) {
-        dirty_pages[cpu->cpu_index].start_pages = cpu->dirty_pages;
-    } else {
-        dirty_pages[cpu->cpu_index].end_pages = cpu->dirty_pages;
-    }
-}
-
-static void dirtyrate_global_dirty_log_start(void)
-{
-    qemu_mutex_lock_iothread();
-    memory_global_dirty_log_start(GLOBAL_DIRTY_DIRTY_RATE);
-    qemu_mutex_unlock_iothread();
-}
-
-static void dirtyrate_global_dirty_log_stop(void)
-{
-    qemu_mutex_lock_iothread();
-    memory_global_dirty_log_sync();
-    memory_global_dirty_log_stop(GLOBAL_DIRTY_DIRTY_RATE);
-    qemu_mutex_unlock_iothread();
-}
-
-static int64_t do_calculate_dirtyrate_vcpu(DirtyPageRecord dirty_pages)
-{
-    uint64_t memory_size_MB;
-    int64_t time_s;
-    uint64_t increased_dirty_pages =
-        dirty_pages.end_pages - dirty_pages.start_pages;
-
-    memory_size_MB = (increased_dirty_pages * TARGET_PAGE_SIZE) >> 20;
-    time_s = DirtyStat.calc_time;
-
-    return memory_size_MB / time_s;
-}
-
 static inline void record_dirtypages_bitmap(DirtyPageRecord *dirty_pages,
                                             bool start)
 {
@@ -444,11 +532,6 @@ static inline void record_dirtypages_bitmap(DirtyPageRecord *dirty_pages,
     }
 }
 
-static void do_calculate_dirtyrate_bitmap(DirtyPageRecord dirty_pages)
-{
-    DirtyStat.dirty_rate = do_calculate_dirtyrate_vcpu(dirty_pages);
-}
-
 static inline void dirtyrate_manual_reset_protect(void)
 {
     RAMBlock *block = NULL;
@@ -492,71 +575,49 @@ static void calculate_dirtyrate_dirty_bitmap(struct DirtyRateConfig config)
     DirtyStat.start_time = start_time / 1000;
 
     msec = config.sample_period_seconds * 1000;
-    msec = set_sample_page_period(msec, start_time);
+    msec = dirty_stat_wait(msec, start_time);
     DirtyStat.calc_time = msec / 1000;
 
     /*
-     * dirtyrate_global_dirty_log_stop do two things.
+     * do two things.
      * 1. fetch dirty bitmap from kvm
      * 2. stop dirty tracking
      */
-    dirtyrate_global_dirty_log_stop();
+    global_dirty_log_sync(GLOBAL_DIRTY_DIRTY_RATE, true);
 
     record_dirtypages_bitmap(&dirty_pages, false);
 
-    do_calculate_dirtyrate_bitmap(dirty_pages);
+    DirtyStat.dirty_rate = do_calculate_dirtyrate(dirty_pages, msec);
 }
 
 static void calculate_dirtyrate_dirty_ring(struct DirtyRateConfig config)
 {
-    CPUState *cpu;
-    int64_t msec = 0;
-    int64_t start_time;
+    int64_t duration;
     uint64_t dirtyrate = 0;
     uint64_t dirtyrate_sum = 0;
-    DirtyPageRecord *dirty_pages;
-    int nvcpu = 0;
     int i = 0;
 
-    CPU_FOREACH(cpu) {
-        nvcpu++;
-    }
-
-    dirty_pages = malloc(sizeof(*dirty_pages) * nvcpu);
-
-    DirtyStat.dirty_ring.nvcpu = nvcpu;
-    DirtyStat.dirty_ring.rates = malloc(sizeof(DirtyRateVcpu) * nvcpu);
-
-    dirtyrate_global_dirty_log_start();
-
-    CPU_FOREACH(cpu) {
-        record_dirtypages(dirty_pages, cpu, true);
-    }
-
-    start_time = qemu_clock_get_ms(QEMU_CLOCK_REALTIME);
-    DirtyStat.start_time = start_time / 1000;
+    /* start log sync */
+    global_dirty_log_change(GLOBAL_DIRTY_DIRTY_RATE, true);
 
-    msec = config.sample_period_seconds * 1000;
-    msec = set_sample_page_period(msec, start_time);
-    DirtyStat.calc_time = msec / 1000;
+    DirtyStat.start_time = qemu_clock_get_ms(QEMU_CLOCK_REALTIME) / 1000;
 
-    dirtyrate_global_dirty_log_stop();
+    /* calculate vcpu dirtyrate */
+    duration = vcpu_calculate_dirtyrate(config.sample_period_seconds * 1000,
+                                        &DirtyStat.dirty_ring,
+                                        GLOBAL_DIRTY_DIRTY_RATE,
+                                        true);
 
-    CPU_FOREACH(cpu) {
-        record_dirtypages(dirty_pages, cpu, false);
-    }
+    DirtyStat.calc_time = duration / 1000;
 
+    /* calculate vm dirtyrate */
     for (i = 0; i < DirtyStat.dirty_ring.nvcpu; i++) {
-        dirtyrate = do_calculate_dirtyrate_vcpu(dirty_pages[i]);
-        trace_dirtyrate_do_calculate_vcpu(i, dirtyrate);
-
-        DirtyStat.dirty_ring.rates[i].id = i;
+        dirtyrate = DirtyStat.dirty_ring.rates[i].dirty_rate;
         DirtyStat.dirty_ring.rates[i].dirty_rate = dirtyrate;
         dirtyrate_sum += dirtyrate;
     }
 
     DirtyStat.dirty_rate = dirtyrate_sum;
-    free(dirty_pages);
 }
 
 static void calculate_dirtyrate_sample_vm(struct DirtyRateConfig config)
@@ -574,7 +635,7 @@ static void calculate_dirtyrate_sample_vm(struct DirtyRateConfig config)
     rcu_read_unlock();
 
     msec = config.sample_period_seconds * 1000;
-    msec = set_sample_page_period(msec, initial_time);
+    msec = dirty_stat_wait(msec, initial_time);
     DirtyStat.start_time = initial_time / 1000;
     DirtyStat.calc_time = msec / 1000;
 
diff --git a/migration/dirtyrate.h b/migration/dirtyrate.h
index 69d4c5b865..594a5c0bb6 100644
--- a/migration/dirtyrate.h
+++ b/migration/dirtyrate.h
@@ -13,6 +13,8 @@
 #ifndef QEMU_MIGRATION_DIRTYRATE_H
 #define QEMU_MIGRATION_DIRTYRATE_H
 
+#include "sysemu/dirtyrate.h"
+
 /*
  * Sample 512 pages per GB as default.
  */
@@ -65,11 +67,6 @@ typedef struct SampleVMStat {
     uint64_t total_block_mem_MB; /* size of total sampled pages in MB */
 } SampleVMStat;
 
-typedef struct VcpuStat {
-    int nvcpu; /* number of vcpu */
-    DirtyRateVcpu *rates; /* array of dirty rate for each vcpu */
-} VcpuStat;
-
 /*
  * Store calculation statistics for each measure.
  */
-- 
2.36.1


