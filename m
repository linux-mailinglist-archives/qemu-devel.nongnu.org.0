Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 700664E1FA9
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 05:55:27 +0100 (CET)
Received: from localhost ([::1]:43998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWA4k-00058G-40
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 00:55:26 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wucy11@chinatelecom.cn>)
 id 1nW8cq-0002FC-Su
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 23:22:32 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.228]:39686
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <wucy11@chinatelecom.cn>) id 1nW8cm-0006hn-Jd
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 23:22:32 -0400
HMM_SOURCE_IP: 172.18.0.218:50780.1411965616
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-36.111.64.85 (unknown [172.18.0.218])
 by chinatelecom.cn (HERMES) with SMTP id 4B44E280152;
 Mon, 21 Mar 2022 11:14:03 +0800 (CST)
X-189-SAVE-TO-SEND: wucy11@chinatelecom.cn
Received: from  ([172.18.0.218])
 by app0025 with ESMTP id f8afbe016b5f4b469e6f3935aeaf22de for
 kvm@vger.kernel.org; Mon, 21 Mar 2022 11:14:10 CST
X-Transaction-ID: f8afbe016b5f4b469e6f3935aeaf22de
X-Real-From: wucy11@chinatelecom.cn
X-Receive-IP: 172.18.0.218
X-MEDUSA-Status: 0
Message-ID: <e7c327af-9aae-ccbf-011f-21d1db40bae4@chinatelecom.cn>
Date: Mon, 21 Mar 2022 11:14:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
From: Chongyun Wu <wucy11@chinatelecom.cn>
Subject: [PATCH 5/5] migration: Calculate the appropriate throttle for
 autoconverge
To: kvm@vger.kernel.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=42.123.76.228;
 envelope-from=wucy11@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 21 Mar 2022 00:52:38 -0400
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
Cc: "ligh10@chinatelecom.cn" <ligh10@chinatelecom.cn>,
 David Hildenbrand <david@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 yubin1@chinatelecom.cn, zhengwenm@chinatelecom.cn,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The current autoconverge algorithm does not obtain the threshold
that currently requires the CPU to limit the speed through
calculation, but limits the speed of the CPU through continuous
attempts. Start from an initial value to limit the speed. If the
migration can not be completed for two consecutive rounds, increase
the limit threshold and continue to try until the limit threshold
reaches 99%. If the memory pressure is high or the migration
bandwidth is low, then it will gradually increase from the initial
20% to 99%, which will be a long and time-consuming process.

This optimization method calculates a matching rate limit
threshold according to the current migration bandwidth and the
rate of current dirty page generation. When the memory pressure
is high, this optimization can reduce the unnecessary and
time-consuming process of constantly trying to increase the
limit, and significantly improve the efficiency of migration.

Test results after optimization(VM 8C32G, qemu stress tool):
mem_stress  caculated_auto_converge_throttle  bandwidth(MiB/s)
300M               0                          1000M
400M               0                          1000M
1G                50                          1000M
2G                80                          1000M
3G                90                          1000M
4G                90                          1000M
5G                90                          1000M
6G                99                          1000M
10G               99                          1000M
20G               99                          1000M
30G               99                          1000M

Series optimization summary:
Related Patch Series:
[1]kvm,memory: Optimize dirty page collection for dirty ring
[2]kvm: Dynamically control the load of the reaper thread
[3]kvm: Dirty ring autoconverge optmization for kvm_cpu_
synchronize_kick_all
[4]kvm: Introduce a dirty rate calculation method based on dirty
ring
[5]migration: Calculate the appropriate throttle for autoconverge

Test environment:
Host: 64 cpus(Intel(R) Xeon(R) Gold 5218 CPU @ 2.30GHz),
       512G memory,
       10G NIC
VM: 2 cpus,4G memory and 8 cpus, 32G memory
memory stress: run stress(qemu) in VM to generates memory stress

Test1: Massive online migration(Run each test item 50 to 200 times)
Test command: virsh -t migrate $vm --live --p2p --unsafe
--undefinesource --persistent --auto-converge  --migrateuri
tcp://${data_ip_remote}
*********** Use optimized dirtry ring  ***********
ring_size  mem_stress VM   average_migration_time(ms)
4096      1G       2C4G     15888
4096      3G       2C4G     13320
65536     1G       2C4G     10036
65536     3G       2C4G     12132
4096      4G       8C32G    53629
4096      8G       8C32G    62474
4096      30G      8C32G    99025
65536     4G       8C32G    45563
65536     8G       8C32G    61114
65536     30G      8C32G    102087
*********** Use Unoptimized dirtry ring ***********
ring_size  mem_stress VM   average_migration_time(ms)
4096      1G       2C4G     23992
4096      3G       2C4G     44234
65536     1G       2C4G     24546
65536     3G       2C4G     44939
4096      4G       8C32G    88441
4096      8G       8C32G    may not complete
4096      30G      8C32G    602884
65536     4G       8C32G    335535
65536     8G       8C32G    1249232
65536     30G      8C32G    616939
*********** Use bitmap dirty tracking  ***********
ring_size  mem_stress VM   average_migration_time(ms)
0         1G       2C4G     24597
0         3G       2C4G     45254
0         4G       8C32G    103773
0         8G       8C32G    129626
0         30G      8C32G    588212
Compared with the old bitmap method and the unoptimized dirty ring,
the migration time of the optimized dirty ring from the sorted data
is greatly improved, especially when the virtual machine memory is
large and the memory pressure is high, the effect is more obvious,
can achieve five to six times the migration acceleration effect.

And during the test, it was found that the dirty ring could not be
completed for a long time after adding certain memory pressure.
The optimized dirty ring did not encounter such a problem.

Test2: qemu guestperf test
Test ommand parameters:  --auto-converge  --stress-mem XX
--downtime 300 --bandwidth 10000
*********** Use optimized dirtry ring  ***********
ring_size stress VM    Significant_perf  max_memory_update cost_time(s)
                        _drop_duration(s) speed(ms/GB)
4096       3G    2C4G        5.5           2962             23.5
65536      3G    2C4G        6             3160             25
4096       3G    8C32G       13            7921             38
4096       6G    8C32G       16            11.6K            46
4096       10G   8C32G       12.1          11.2K            47.6
4096       20G   8C32G       20            20.2K            71
4096       30G   8C32G       29.5          29K              94.5
65536      3G    8C32G       14            8700             40
65536      6G    8C32G       15            12K              46
65536      10G   8C32G       11.5          11.1k            47.5
65536      20G   8C32G       21            20.9K            72
65536      30G   8C32G       29.5          29.1K            94.5
*********** Use Unoptimized dirtry ring ***********
ring_size stress VM    Significant_perf  max_memory_update cost_time(s)
                        _drop_duration(s) speed(ms/GB)
4096        3G    2C4G        23            2766            46
65536       3G    2C4G        22.2          3283            46
4096        3G    8C32G       62            48.8K           106
4096        6G    8C32G       68            23.87K          124
4096        10G   8C32G       91            16.87K          190
4096        20G   8C32G       152.8         28.65K          336.8
4096        30G   8C32G       187           41.19K          502
65536       3G    8C32G       71            12.7K           67
65536       6G    8C32G       63            12K             46
65536       10G   8C32G       88            25.3k           120
65536       20G   8C32G       157.3         25K             391
65536       30G   8C32G       171           30.8K           487
*********** Use bitmap dirty tracking  ***********
ring_size stress VM    Significant_perf  max_memory_update cost_time(s)
                        _drop_duration(s) speed(ms/GB)
0           3G    2C4G        18             3300            38
0           3G    8C32G       38             7571            66
0           6G    8C32G       61.5           10.5K           115.5
0           10G   8C32G       110            13.68k          180
0           20G   8C32G       161.6          24.4K           280
0           30G   8C32G       221.5          28.4K           337.5

The above test data shows that the guestperf performance of the
optimized dirty ring during the migration process is significantly
better than that of the unoptimized dirty ring, and slightly better
than the bitmap method.

During the migration process of the optimized dirty ring, the migration
time is greatly reduced, and the time in the period of significant
memory performance degradation is  significantly shorter than that of
the bitmap mode and the unoptimized dirty ring mode. Therefore, the
optimized ditry ring can better reduce the impact on guests accessing
memory resources during the migration process.

Signed-off-by: Chongyun Wu <wucy11@chinatelecom.cn>
---
  accel/kvm/kvm-all.c   |  7 ++++--
  migration/migration.c |  1 +
  migration/migration.h |  2 ++
  migration/ram.c       | 64 ++++++++++++++++++++++++++++++++++++++++++++++++---
  4 files changed, 69 insertions(+), 5 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 05af6ce..87c2c6a 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -798,7 +798,11 @@ int64_t kvm_dirty_ring_get_rate(void)

  int64_t kvm_dirty_ring_get_peak_rate(void)
  {
-    return kvm_state->reaper.counter.dirty_pages_period_peak_rate;
+    int64_t rate = kvm_state->reaper.counter.dirty_pages_period_peak_rate;
+    /* Reset the peak rate to calculate a new peak rate after this moment */
+    kvm_state->reaper.counter.dirty_pages_period_peak_rate = 0;
+
+    return rate;
  }

  static void kvm_dirty_ring_reap_count(KVMState *s)
@@ -834,7 +838,6 @@ static void kvm_dirty_ring_reap_count(KVMState *s)
              s->reaper.counter.dirty_pages_period_peak_rate =
                  s->reaper.counter.dirty_pages_rate;
          }
-
          /* Reset counters */
          s->reaper.counter.dirty_pages_period = 0;
          s->reaper.counter.time_last_count = 0;
diff --git a/migration/migration.c b/migration/migration.c
index 1114b2f..13a8c1c 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -2065,6 +2065,7 @@ void migrate_init(MigrationState *s)
      s->vm_was_running = false;
      s->iteration_initial_bytes = 0;
      s->threshold_size = 0;
+    s->have_caculated_throttle_pct = false;
  }

  int migrate_add_blocker_internal(Error *reason, Error **errp)
diff --git a/migration/migration.h b/migration/migration.h
index 8130b70..fe50439 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -296,6 +296,8 @@ struct MigrationState {
       * This save hostname when out-going migration starts
       */
      char *hostname;
+    /* If already caculated the throttle percentage for migration */
+    bool have_caculated_throttle_pct;
  };

  void migrate_set_state(int *state, int old_state, int new_state);
diff --git a/migration/ram.c b/migration/ram.c
index 91ca743..7f08a34 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -62,6 +62,7 @@
  #include "qemu/userfaultfd.h"
  #endif /* defined(__linux__) */

+#include "sysemu/kvm.h"
  /***********************************************************/
  /* ram save/restore */

@@ -616,6 +617,64 @@ static size_t save_page_header(RAMState *rs, QEMUFile *f, 
RAMBlock *block,
  }

  /**
+ * Calculate the matched speed limit threshold according to
+ * the current migration bandwidth and the current rate of
+ * dirty pages to aviod time-consuming and pointless attempt.
+ */
+static int calculate_throttle_pct(void)
+{
+    MigrationState *s = migrate_get_current();
+    uint64_t threshold = s->parameters.throttle_trigger_threshold;
+    uint64_t pct_initial = s->parameters.cpu_throttle_initial;
+    uint64_t pct_icrement = s->parameters.cpu_throttle_increment;
+    int pct_max = s->parameters.max_cpu_throttle;
+
+    int matched_pct = 0;
+    float facter1 = 0.0;
+    float facter2 = 0.0;
+    int64_t dirty_pages_rate = 0;
+    double bandwith_expect = 0.0;
+    double dirty_pages_rate_expect = 0.0;
+    double bandwith = (s->mbps / 8) * 1024 * 1024;
+
+    if (kvm_dirty_ring_enabled()) {
+        dirty_pages_rate = kvm_dirty_ring_get_peak_rate() *
+            qemu_target_page_size();
+    } else {
+        dirty_pages_rate = ram_counters.dirty_pages_rate *
+            qemu_target_page_size();
+    }
+
+    if (dirty_pages_rate) {
+        facter1 = (float)threshold / 100;
+        bandwith_expect = bandwith * facter1;
+
+        for (uint64_t i = pct_initial; i <= pct_max;) {
+            facter2 = 1 - (float)i / 100;
+            dirty_pages_rate_expect = dirty_pages_rate * facter2;
+
+            if (bandwith_expect > dirty_pages_rate_expect) {
+                matched_pct = i;
+                break;
+            }
+            i += pct_icrement;
+        }
+
+        if (!matched_pct) {
+            info_report("Not find matched throttle pct, "
+                        "maybe pressure too high, use max");
+            matched_pct = pct_max;
+        }
+    } else {
+        matched_pct = pct_initial;
+    }
+
+    s->have_caculated_throttle_pct = true;
+
+    return matched_pct;
+}
+
+/**
   * mig_throttle_guest_down: throttle down the guest
   *
   * Reduce amount of guest cpu execution to hopefully slow down memory
@@ -628,7 +687,6 @@ static void mig_throttle_guest_down(uint64_t bytes_dirty_period,
                                      uint64_t bytes_dirty_threshold)
  {
      MigrationState *s = migrate_get_current();
-    uint64_t pct_initial = s->parameters.cpu_throttle_initial;
      uint64_t pct_increment = s->parameters.cpu_throttle_increment;
      bool pct_tailslow = s->parameters.cpu_throttle_tailslow;
      int pct_max = s->parameters.max_cpu_throttle;
@@ -637,8 +695,8 @@ static void mig_throttle_guest_down(uint64_t bytes_dirty_period,
      uint64_t cpu_now, cpu_ideal, throttle_inc;

      /* We have not started throttling yet. Let's start it. */
-    if (!cpu_throttle_active()) {
-        cpu_throttle_set(pct_initial);
+    if (!s->have_caculated_throttle_pct) {
+        cpu_throttle_set(MIN(calculate_throttle_pct(), pct_max));
      } else {
          /* Throttling already on, just increase the rate */
          if (!pct_tailslow) {
--
1.8.3.1

-- 
Best Regard,
Chongyun Wu

