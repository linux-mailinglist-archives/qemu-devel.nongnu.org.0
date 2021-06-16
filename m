Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F419C3A8E36
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 03:19:37 +0200 (CEST)
Received: from localhost ([::1]:51082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltKDR-0000Vr-2b
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 21:19:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1ltK3C-00077G-DT
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 21:09:03 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.223]:51594
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1ltK3A-0006F0-6K
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 21:09:02 -0400
HMM_SOURCE_IP: 172.18.0.218:55640.1447589156
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-202.80.192.38?logid-6d78197d793c4667afc4678d3a3390f7
 (unknown [172.18.0.218])
 by chinatelecom.cn (HERMES) with SMTP id 863452800BC;
 Wed, 16 Jun 2021 09:08:57 +0800 (CST)
X-189-SAVE-TO-SEND: +huangy81@chinatelecom.cn
Received: from  ([172.18.0.218])
 by app0025 with ESMTP id f124fa0c9e48417eb7959d86d170a6ec for
 qemu-devel@nongnu.org; Wed Jun 16 09:08:56 2021
X-Transaction-ID: f124fa0c9e48417eb7959d86d170a6ec
X-filter-score: filter<0>
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.218
X-MEDUSA-Status: 0
From: huangy81@chinatelecom.cn
To: qemu-devel@nongnu.org
Subject: [PATCH v4 5/6] migration/dirtyrate: move init step of calculation to
 main thread
Date: Wed, 16 Jun 2021 09:12:31 +0800
Message-Id: <0e5ece3a7a2c235611e398086334a908bc63c4de.1623804189.git.huangy81@chinatelecom.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1623804189.git.huangy81@chinatelecom.cn>
References: <cover.1623804189.git.huangy81@chinatelecom.cn>
In-Reply-To: <cover.1623804189.git.huangy81@chinatelecom.cn>
References: <cover.1623804189.git.huangy81@chinatelecom.cn>
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

since main thread could "query dirty rate" at any time, then it's
better to move init step into main thead so that synchronization
overhead of dirty stat can be reduced.

since not sure whether "only one QMP iothread" will still keep true
forever, always introduce a mutex and protect dirty stat.

Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
---
 migration/dirtyrate.c | 34 ++++++++++++++++++++++++++++++----
 1 file changed, 30 insertions(+), 4 deletions(-)

diff --git a/migration/dirtyrate.c b/migration/dirtyrate.c
index b97f6a5..d7b41bd 100644
--- a/migration/dirtyrate.c
+++ b/migration/dirtyrate.c
@@ -26,6 +26,8 @@
 
 static int CalculatingState = DIRTY_RATE_STATUS_UNSTARTED;
 static struct DirtyRateStat DirtyStat;
+static QemuMutex dirtyrate_lock;
+static DirtyRateMeasureMode dirtyrate_mode = DIRTY_RATE_MEASURE_MODE_NONE;
 
 static int64_t set_sample_page_period(int64_t msec, int64_t initial_time)
 {
@@ -70,6 +72,7 @@ static int dirtyrate_set_state(int *state, int old_state, int new_state)
 
 static struct DirtyRateInfo *query_dirty_rate_info(void)
 {
+    qemu_mutex_lock(&dirtyrate_lock);
     int64_t dirty_rate = DirtyStat.dirty_rate;
     struct DirtyRateInfo *info = g_malloc0(sizeof(DirtyRateInfo));
 
@@ -83,6 +86,8 @@ static struct DirtyRateInfo *query_dirty_rate_info(void)
     info->calc_time = DirtyStat.calc_time;
     info->sample_pages = DirtyStat.sample_pages;
 
+    qemu_mutex_unlock(&dirtyrate_lock);
+
     trace_query_dirty_rate_info(DirtyRateStatus_str(CalculatingState));
 
     return info;
@@ -91,6 +96,7 @@ static struct DirtyRateInfo *query_dirty_rate_info(void)
 static void init_dirtyrate_stat(int64_t start_time,
                                 struct DirtyRateConfig config)
 {
+    qemu_mutex_lock(&dirtyrate_lock);
     DirtyStat.dirty_rate = -1;
     DirtyStat.start_time = start_time;
     DirtyStat.calc_time = config.sample_period_seconds;
@@ -108,6 +114,12 @@ static void init_dirtyrate_stat(int64_t start_time,
     default:
         break;
     }
+    qemu_mutex_unlock(&dirtyrate_lock);
+}
+
+static void cleanup_dirtyrate_stat(struct DirtyRateConfig config)
+{
+    /* TODO */
 }
 
 static void update_dirtyrate_stat(struct RamblockDirtyInfo *info)
@@ -379,7 +391,6 @@ void *get_dirtyrate_thread(void *arg)
 {
     struct DirtyRateConfig config = *(struct DirtyRateConfig *)arg;
     int ret;
-    int64_t start_time;
     rcu_register_thread();
 
     ret = dirtyrate_set_state(&CalculatingState, DIRTY_RATE_STATUS_UNSTARTED,
@@ -389,9 +400,6 @@ void *get_dirtyrate_thread(void *arg)
         return NULL;
     }
 
-    start_time = qemu_clock_get_ms(QEMU_CLOCK_REALTIME) / 1000;
-    init_dirtyrate_stat(start_time, config);
-
     calculate_dirtyrate(config);
 
     ret = dirtyrate_set_state(&CalculatingState, DIRTY_RATE_STATUS_MEASURING,
@@ -410,6 +418,7 @@ void qmp_calc_dirty_rate(int64_t calc_time, bool has_sample_pages,
     static struct DirtyRateConfig config;
     QemuThread thread;
     int ret;
+    int64_t start_time;
 
     /*
      * If the dirty rate is already being measured, don't attempt to start.
@@ -450,6 +459,23 @@ void qmp_calc_dirty_rate(int64_t calc_time, bool has_sample_pages,
     config.sample_period_seconds = calc_time;
     config.sample_pages_per_gigabytes = sample_pages;
     config.mode = DIRTY_RATE_MEASURE_MODE_PAGE_SAMPLING;
+
+    if (unlikely(dirtyrate_mode == DIRTY_RATE_MEASURE_MODE_NONE)) {
+        /* first time to calculate dirty rate */
+        qemu_mutex_init(&dirtyrate_lock);
+    }
+
+    cleanup_dirtyrate_stat(config);
+
+    /*
+     * update dirty rate mode so that we can figure out what mode has
+     * been used in last calculation
+     **/
+    dirtyrate_mode = DIRTY_RATE_MEASURE_MODE_PAGE_SAMPLING;
+
+    start_time = qemu_clock_get_ms(QEMU_CLOCK_REALTIME) / 1000;
+    init_dirtyrate_stat(start_time, config);
+
     qemu_thread_create(&thread, "get_dirtyrate", get_dirtyrate_thread,
                        (void *)&config, QEMU_THREAD_DETACHED);
 }
-- 
1.8.3.1


