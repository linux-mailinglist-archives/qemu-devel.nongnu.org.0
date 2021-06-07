Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6CB639D28B
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 03:23:15 +0200 (CEST)
Received: from localhost ([::1]:39188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lq3z0-0006ra-U3
	for lists+qemu-devel@lfdr.de; Sun, 06 Jun 2021 21:23:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1lq3wa-0004dC-Sg
 for qemu-devel@nongnu.org; Sun, 06 Jun 2021 21:20:44 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.228]:49309
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1lq3wY-0000Wn-6S
 for qemu-devel@nongnu.org; Sun, 06 Jun 2021 21:20:44 -0400
HMM_SOURCE_IP: 172.18.0.218:41712.897474470
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-182.138.181.182?logid-0124981a5a3c45efa7eb3d3c061ab6a6
 (unknown [172.18.0.218])
 by chinatelecom.cn (HERMES) with SMTP id 4E8E1280137;
 Mon,  7 Jun 2021 09:12:43 +0800 (CST)
X-189-SAVE-TO-SEND: +huangy81@chinatelecom.cn
Received: from  ([172.18.0.218])
 by app0025 with ESMTP id 0124981a5a3c45efa7eb3d3c061ab6a6 for
 qemu-devel@nongnu.org; Mon Jun  7 09:12:42 2021
X-Transaction-ID: 0124981a5a3c45efa7eb3d3c061ab6a6
X-filter-score: filter<0>
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.218
X-MEDUSA-Status: 0
From: huangy81@chinatelecom.cn
To: qemu-devel@nongnu.org
Subject: [PATCH v3 4/7] migration/dirtyrate: add per-vcpu option for
 calc-dirty-rate
Date: Mon,  7 Jun 2021 09:12:36 +0800
Message-Id: <19ad91782f5798844c42e34683fda833f9d1928a.1623027729.git.huangy81@chinatelecom.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1623027729.git.huangy81@chinatelecom.cn>
References: <cover.1623027729.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.228;
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
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>

calculate dirtyrate for each vcpu if vcpu is true, add the
dirtyrate of each vcpu to the return value also.

Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
---
 migration/dirtyrate.c | 45 ++++++++++++++++++++++++++++++++++++++-----
 migration/dirtyrate.h |  1 +
 qapi/migration.json   | 29 ++++++++++++++++++++++++++--
 3 files changed, 68 insertions(+), 7 deletions(-)

diff --git a/migration/dirtyrate.c b/migration/dirtyrate.c
index 320c56ba2c..5947c688f6 100644
--- a/migration/dirtyrate.c
+++ b/migration/dirtyrate.c
@@ -397,8 +397,11 @@ void *get_dirtyrate_thread(void *arg)
     return NULL;
 }
 
-void qmp_calc_dirty_rate(int64_t calc_time, bool has_sample_pages,
-                         int64_t sample_pages, Error **errp)
+void qmp_calc_dirty_rate(int64_t calc_time,
+                         bool per_vcpu,
+                         bool has_sample_pages,
+                         int64_t sample_pages,
+                         Error **errp)
 {
     static struct DirtyRateConfig config;
     QemuThread thread;
@@ -419,6 +422,12 @@ void qmp_calc_dirty_rate(int64_t calc_time, bool has_sample_pages,
         return;
     }
 
+    if (has_sample_pages && per_vcpu) {
+        error_setg(errp, "per-vcpu and sample-pages are mutually exclusive, "
+                         "only one of then can be specified!\n");
+        return;
+    }
+
     if (has_sample_pages) {
         if (!is_sample_pages_valid(sample_pages)) {
             error_setg(errp, "sample-pages is out of range[%d, %d].",
@@ -430,6 +439,15 @@ void qmp_calc_dirty_rate(int64_t calc_time, bool has_sample_pages,
         sample_pages = DIRTYRATE_DEFAULT_SAMPLE_PAGES;
     }
 
+    /*
+     * Vcpu method only works when kvm dirty ring is enabled.
+     */
+    if (per_vcpu && !kvm_dirty_ring_enabled()) {
+        error_setg(errp, "dirty ring is disabled or conflict with migration"
+                         "use sample method or remeasure later.");
+        return;
+    }
+
     /*
      * Init calculation state as unstarted.
      */
@@ -442,6 +460,7 @@ void qmp_calc_dirty_rate(int64_t calc_time, bool has_sample_pages,
 
     config.sample_period_seconds = calc_time;
     config.sample_pages_per_gigabytes = sample_pages;
+    config.per_vcpu = per_vcpu;
     qemu_thread_create(&thread, "get_dirtyrate", get_dirtyrate_thread,
                        (void *)&config, QEMU_THREAD_DETACHED);
 }
@@ -459,13 +478,22 @@ void hmp_info_dirty_rate(Monitor *mon, const QDict *qdict)
                    DirtyRateStatus_str(info->status));
     monitor_printf(mon, "Start Time: %"PRIi64" (ms)\n",
                    info->start_time);
-    monitor_printf(mon, "Sample Pages: %"PRIu64" (per GB)\n",
-                   info->sample_pages);
     monitor_printf(mon, "Period: %"PRIi64" (sec)\n",
                    info->calc_time);
+    if (info->has_sample_pages) {
+        monitor_printf(mon, "Sample Pages: %"PRIu64" (per GB)\n",
+                       info->sample_pages);
+    }
     monitor_printf(mon, "Dirty rate: ");
     if (info->has_dirty_rate) {
         monitor_printf(mon, "%"PRIi64" (MB/s)\n", info->dirty_rate);
+        if (info->per_vcpu && info->has_vcpu_dirty_rate) {
+            DirtyRateVcpuList *rate, *head = info->vcpu_dirty_rate;
+            for (rate = head; rate != NULL; rate = rate->next) {
+                monitor_printf(mon, "vcpu[%"PRIi64"], Dirty rate: %"PRIi64"\n",
+                               rate->value->id, rate->value->dirty_rate);
+            }
+        }
     } else {
         monitor_printf(mon, "(not ready)\n");
     }
@@ -477,6 +505,7 @@ void hmp_calc_dirty_rate(Monitor *mon, const QDict *qdict)
     int64_t sec = qdict_get_try_int(qdict, "second", 0);
     int64_t sample_pages = qdict_get_try_int(qdict, "sample_pages_per_GB", -1);
     bool has_sample_pages = (sample_pages != -1);
+    bool per_vcpu = qdict_get_try_bool(qdict, "per_vcpu", false);
     Error *err = NULL;
 
     if (!sec) {
@@ -484,7 +513,13 @@ void hmp_calc_dirty_rate(Monitor *mon, const QDict *qdict)
         return;
     }
 
-    qmp_calc_dirty_rate(sec, has_sample_pages, sample_pages, &err);
+    if (has_sample_pages && per_vcpu) {
+        monitor_printf(mon, "per_vcpu and sample_pages are mutually exclusive, "
+                       "only one of then can be specified!\n");
+        return;
+    }
+
+    qmp_calc_dirty_rate(sec, per_vcpu, has_sample_pages, sample_pages, &err);
     if (err) {
         hmp_handle_error(mon, err);
         return;
diff --git a/migration/dirtyrate.h b/migration/dirtyrate.h
index e1fd29089e..ec82716b40 100644
--- a/migration/dirtyrate.h
+++ b/migration/dirtyrate.h
@@ -43,6 +43,7 @@
 struct DirtyRateConfig {
     uint64_t sample_pages_per_gigabytes; /* sample pages per GB */
     int64_t sample_period_seconds; /* time duration between two sampling */
+    bool per_vcpu; /* calculate dirtyrate for each vcpu using dirty ring */
 };
 
 /*
diff --git a/qapi/migration.json b/qapi/migration.json
index 770ae54c17..7eef988182 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -1708,6 +1708,21 @@
 { 'event': 'UNPLUG_PRIMARY',
   'data': { 'device-id': 'str' } }
 
+##
+# @DirtyRateVcpu:
+#
+# Dirty rate of vcpu.
+#
+# @id: vcpu index.
+#
+# @dirty-rate: dirty rate.
+#
+# Since: 6.1
+#
+##
+{ 'struct': 'DirtyRateVcpu',
+  'data': { 'id': 'int', 'dirty-rate': 'int64' } }
+
 ##
 # @DirtyRateStatus:
 #
@@ -1743,6 +1758,10 @@
 # @sample-pages: page count per GB for sample dirty pages
 #                the default value is 512 (since 6.1)
 #
+# @per-vcpu: calculate dirtyrate for each vcpu (Since 6.1)
+#
+# @vcpu-dirty-rate: dirtyrate for each vcpu (Since 6.1)
+#
 # Since: 5.2
 #
 ##
@@ -1751,7 +1770,9 @@
            'status': 'DirtyRateStatus',
            'start-time': 'int64',
            'calc-time': 'int64',
-           'sample-pages': 'uint64'} }
+           '*sample-pages': 'uint64',
+           'per-vcpu': 'bool',
+           '*vcpu-dirty-rate': [ 'DirtyRateVcpu' ] } }
 
 ##
 # @calc-dirty-rate:
@@ -1760,6 +1781,10 @@
 #
 # @calc-time: time in units of second for sample dirty pages
 #
+# @per-vcpu: calculate vcpu dirty rate if true, the default value is
+#            false, note that the per-vcpu and sample-pages are mutually
+#            exclusive (since 6.1)
+#
 # @sample-pages: page count per GB for sample dirty pages
 #                the default value is 512 (since 6.1)
 #
@@ -1769,7 +1794,7 @@
 #   {"command": "calc-dirty-rate", "data": {"calc-time": 1, 'sample-pages': 512} }
 #
 ##
-{ 'command': 'calc-dirty-rate', 'data': {'calc-time': 'int64', '*sample-pages': 'int'} }
+{ 'command': 'calc-dirty-rate', 'data': {'calc-time': 'int64', 'per-vcpu': 'bool', '*sample-pages': 'int'} }
 
 ##
 # @query-dirty-rate:
-- 
2.18.2


