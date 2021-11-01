Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F3F442340
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 23:16:19 +0100 (CET)
Received: from localhost ([::1]:55922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhfbG-0006tc-1N
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 18:16:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mhfUb-0006qN-Fj
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 18:09:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48847)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mhfUZ-0000Zq-9k
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 18:09:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635804562;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zC+zxEH+pUhjgORZ5ETFB7/+CsNzKhs7SNRZ+CUF1/0=;
 b=D0ygIqxRSY5Sl+3gvqB/NSQ8h4qa/gD/WFYh5IuLJraAntcO8uP6NH0Ci5xFMQuthBGBxG
 jhiX9O8doGFwN36n5ItLILypvBkTjo4IiIgvqpngg6WrPT2BnaIJHzXnGPq94AMNJEuZnH
 EE5oCAg4SoyUOSUAEj6pyJEFrz9ZajY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-594-okUxi8YfNgyWkZBe2JUirQ-1; Mon, 01 Nov 2021 18:09:21 -0400
X-MC-Unique: okUxi8YfNgyWkZBe2JUirQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 r12-20020adfdc8c000000b0017d703c07c0so3507718wrj.0
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 15:09:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zC+zxEH+pUhjgORZ5ETFB7/+CsNzKhs7SNRZ+CUF1/0=;
 b=5d+9qve4QOk4mdCaz96JHl6VQTwY1OZDjh6Dj7+QXO41D0/IT5KG4PTLHMpn81j7wy
 JIP5QK1NIZEy7ayc2l1BCD+cZb/Ori94UZSseDQmeH6mfCHSjc7n2HaePhY0LFUApLCJ
 STBna8wzSoC6x2W+x42SiPbRTESF9raIzfbyoAsbi+t+tlPoBKwi5OO6otgvVgvM6tum
 tQ1zjnC2i0GcDaqr05mA7AnIBY86MABe9JMmKmIYZ8DJdcJr6JG8aVlvPfG8NTkUROVn
 KIJQDNmf+IcoUPh4VVFGwK7YvgNTt5OaqvCqs29Xwf91AREokBXAPLb7rO4D7lSguru/
 HjwA==
X-Gm-Message-State: AOAM5315s106ySvD42d8ODzacDv7L7wsFBD2r17LPSxDCBVU/JKEdCd4
 cyEt5ABJsSAyhPzIV6ug/Vg+VCqlLBdxkBmmEhfq8CYWRDIMTO1mTNFVZ7h72xekRChEhuNglwe
 OtNZbY4Bc6l1X4K7HsZVJ5yUzeNB7ZVvqHhI5gEXYUo1NGAeCq8IdbJCEbJQfl+mDlxk=
X-Received: by 2002:a5d:46cb:: with SMTP id g11mr24140831wrs.26.1635804560014; 
 Mon, 01 Nov 2021 15:09:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwOqU8wWYVaIjRWd2sjZqSUpY8HCgD5Gu3n1DFyO90oDUDzJdkVJM68NrFLzLaF6oWA+5DyZw==
X-Received: by 2002:a5d:46cb:: with SMTP id g11mr24140791wrs.26.1635804559728; 
 Mon, 01 Nov 2021 15:09:19 -0700 (PDT)
Received: from localhost (static-233-86-86-188.ipcom.comunitel.net.
 [188.86.86.233])
 by smtp.gmail.com with ESMTPSA id g5sm709951wmi.2.2021.11.01.15.09.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 15:09:19 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 04/20] migration/dirtyrate: introduce struct and adjust
 DirtyRateStat
Date: Mon,  1 Nov 2021 23:08:56 +0100
Message-Id: <20211101220912.10039-5-quintela@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211101220912.10039-1-quintela@redhat.com>
References: <20211101220912.10039-1-quintela@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.734,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?q?Hyman=20Huang=28=C3=A9=C2=BB=E2=80=9E=C3=A5=E2=80=B9?=
 =?UTF-8?q?=E2=80=A1=29?= <huangy81@chinatelecom.cn>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Paul Durrant <paul@xen.org>, Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Peter Xu <peterx@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Hyman Huang(é»„å‹‡) <huangy81@chinatelecom.cn>

introduce "DirtyRateMeasureMode" to specify what method should be
used to calculate dirty rate, introduce "DirtyRateVcpu" to store
dirty rate for each vcpu.

use union to store stat data of specific mode

Signed-off-by: Hyman Huang(é»„å‹‡) <huangy81@chinatelecom.cn>
Message-Id: <661c98c40f40e163aa58334337af8f3ddf41316a.1624040308.git.huangy81@chinatelecom.cn>
Reviewed-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 qapi/migration.json   | 30 +++++++++++++++++++++++++++
 migration/dirtyrate.h | 21 +++++++++++++++----
 migration/dirtyrate.c | 48 +++++++++++++++++++++++++------------------
 3 files changed, 75 insertions(+), 24 deletions(-)

diff --git a/qapi/migration.json b/qapi/migration.json
index 9aa8bc5759..94eece16e1 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -1731,6 +1731,21 @@
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
@@ -1748,6 +1763,21 @@
 { 'enum': 'DirtyRateStatus',
   'data': [ 'unstarted', 'measuring', 'measured'] }
 
+##
+# @DirtyRateMeasureMode:
+#
+# An enumeration of mode of measuring dirtyrate.
+#
+# @page-sampling: calculate dirtyrate by sampling pages.
+#
+# @dirty-ring: calculate dirtyrate by via dirty ring.
+#
+# Since: 6.1
+#
+##
+{ 'enum': 'DirtyRateMeasureMode',
+  'data': ['page-sampling', 'dirty-ring'] }
+
 ##
 # @DirtyRateInfo:
 #
diff --git a/migration/dirtyrate.h b/migration/dirtyrate.h
index e1fd29089e..69d4c5b865 100644
--- a/migration/dirtyrate.h
+++ b/migration/dirtyrate.h
@@ -43,6 +43,7 @@
 struct DirtyRateConfig {
     uint64_t sample_pages_per_gigabytes; /* sample pages per GB */
     int64_t sample_period_seconds; /* time duration between two sampling */
+    DirtyRateMeasureMode mode; /* mode of dirtyrate measurement */
 };
 
 /*
@@ -58,17 +59,29 @@ struct RamblockDirtyInfo {
     uint32_t *hash_result; /* array of hash result for sampled pages */
 };
 
-/*
- * Store calculation statistics for each measure.
- */
-struct DirtyRateStat {
+typedef struct SampleVMStat {
     uint64_t total_dirty_samples; /* total dirty sampled page */
     uint64_t total_sample_count; /* total sampled pages */
     uint64_t total_block_mem_MB; /* size of total sampled pages in MB */
+} SampleVMStat;
+
+typedef struct VcpuStat {
+    int nvcpu; /* number of vcpu */
+    DirtyRateVcpu *rates; /* array of dirty rate for each vcpu */
+} VcpuStat;
+
+/*
+ * Store calculation statistics for each measure.
+ */
+struct DirtyRateStat {
     int64_t dirty_rate; /* dirty rate in MB/s */
     int64_t start_time; /* calculation start time in units of second */
     int64_t calc_time; /* time duration of two sampling in units of second */
     uint64_t sample_pages; /* sample pages per GB */
+    union {
+        SampleVMStat page_sampling;
+        VcpuStat dirty_ring;
+    };
 };
 
 void *get_dirtyrate_thread(void *arg);
diff --git a/migration/dirtyrate.c b/migration/dirtyrate.c
index 320c56ba2c..e0a27a992c 100644
--- a/migration/dirtyrate.c
+++ b/migration/dirtyrate.c
@@ -88,33 +88,44 @@ static struct DirtyRateInfo *query_dirty_rate_info(void)
     return info;
 }
 
-static void init_dirtyrate_stat(int64_t start_time, int64_t calc_time,
-                                uint64_t sample_pages)
+static void init_dirtyrate_stat(int64_t start_time,
+                                struct DirtyRateConfig config)
 {
-    DirtyStat.total_dirty_samples = 0;
-    DirtyStat.total_sample_count = 0;
-    DirtyStat.total_block_mem_MB = 0;
     DirtyStat.dirty_rate = -1;
     DirtyStat.start_time = start_time;
-    DirtyStat.calc_time = calc_time;
-    DirtyStat.sample_pages = sample_pages;
+    DirtyStat.calc_time = config.sample_period_seconds;
+    DirtyStat.sample_pages = config.sample_pages_per_gigabytes;
+
+    switch (config.mode) {
+    case DIRTY_RATE_MEASURE_MODE_PAGE_SAMPLING:
+        DirtyStat.page_sampling.total_dirty_samples = 0;
+        DirtyStat.page_sampling.total_sample_count = 0;
+        DirtyStat.page_sampling.total_block_mem_MB = 0;
+        break;
+    case DIRTY_RATE_MEASURE_MODE_DIRTY_RING:
+        DirtyStat.dirty_ring.nvcpu = -1;
+        DirtyStat.dirty_ring.rates = NULL;
+        break;
+    default:
+        break;
+    }
 }
 
 static void update_dirtyrate_stat(struct RamblockDirtyInfo *info)
 {
-    DirtyStat.total_dirty_samples += info->sample_dirty_count;
-    DirtyStat.total_sample_count += info->sample_pages_count;
+    DirtyStat.page_sampling.total_dirty_samples += info->sample_dirty_count;
+    DirtyStat.page_sampling.total_sample_count += info->sample_pages_count;
     /* size of total pages in MB */
-    DirtyStat.total_block_mem_MB += (info->ramblock_pages *
-                                     TARGET_PAGE_SIZE) >> 20;
+    DirtyStat.page_sampling.total_block_mem_MB += (info->ramblock_pages *
+                                                   TARGET_PAGE_SIZE) >> 20;
 }
 
 static void update_dirtyrate(uint64_t msec)
 {
     uint64_t dirtyrate;
-    uint64_t total_dirty_samples = DirtyStat.total_dirty_samples;
-    uint64_t total_sample_count = DirtyStat.total_sample_count;
-    uint64_t total_block_mem_MB = DirtyStat.total_block_mem_MB;
+    uint64_t total_dirty_samples = DirtyStat.page_sampling.total_dirty_samples;
+    uint64_t total_sample_count = DirtyStat.page_sampling.total_sample_count;
+    uint64_t total_block_mem_MB = DirtyStat.page_sampling.total_block_mem_MB;
 
     dirtyrate = total_dirty_samples * total_block_mem_MB *
                 1000 / (total_sample_count * msec);
@@ -327,7 +338,7 @@ static bool compare_page_hash_info(struct RamblockDirtyInfo *info,
         update_dirtyrate_stat(block_dinfo);
     }
 
-    if (DirtyStat.total_sample_count == 0) {
+    if (DirtyStat.page_sampling.total_sample_count == 0) {
         return false;
     }
 
@@ -372,8 +383,6 @@ void *get_dirtyrate_thread(void *arg)
     struct DirtyRateConfig config = *(struct DirtyRateConfig *)arg;
     int ret;
     int64_t start_time;
-    int64_t calc_time;
-    uint64_t sample_pages;
 
     ret = dirtyrate_set_state(&CalculatingState, DIRTY_RATE_STATUS_UNSTARTED,
                               DIRTY_RATE_STATUS_MEASURING);
@@ -383,9 +392,7 @@ void *get_dirtyrate_thread(void *arg)
     }
 
     start_time = qemu_clock_get_ms(QEMU_CLOCK_REALTIME) / 1000;
-    calc_time = config.sample_period_seconds;
-    sample_pages = config.sample_pages_per_gigabytes;
-    init_dirtyrate_stat(start_time, calc_time, sample_pages);
+    init_dirtyrate_stat(start_time, config);
 
     calculate_dirtyrate(config);
 
@@ -442,6 +449,7 @@ void qmp_calc_dirty_rate(int64_t calc_time, bool has_sample_pages,
 
     config.sample_period_seconds = calc_time;
     config.sample_pages_per_gigabytes = sample_pages;
+    config.mode = DIRTY_RATE_MEASURE_MODE_PAGE_SAMPLING;
     qemu_thread_create(&thread, "get_dirtyrate", get_dirtyrate_thread,
                        (void *)&config, QEMU_THREAD_DETACHED);
 }
-- 
2.33.1


