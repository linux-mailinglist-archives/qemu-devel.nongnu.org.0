Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 156B54E1FBE
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 06:06:57 +0100 (CET)
Received: from localhost ([::1]:54448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWAFs-00046N-HA
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 01:06:56 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wucy11@chinatelecom.cn>)
 id 1nW8cp-0002El-8F
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 23:22:31 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.228]:39688
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <wucy11@chinatelecom.cn>) id 1nW8cm-0006hz-QT
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 23:22:30 -0400
HMM_SOURCE_IP: 172.18.0.188:56498.1142451369
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-36.111.64.85 (unknown [172.18.0.188])
 by chinatelecom.cn (HERMES) with SMTP id BBEB4280121;
 Mon, 21 Mar 2022 11:13:01 +0800 (CST)
X-189-SAVE-TO-SEND: wucy11@chinatelecom.cn
Received: from  ([172.18.0.188])
 by app0023 with ESMTP id 03cc16217acd4594baad444239715a21 for
 kvm@vger.kernel.org; Mon, 21 Mar 2022 11:13:06 CST
X-Transaction-ID: 03cc16217acd4594baad444239715a21
X-Real-From: wucy11@chinatelecom.cn
X-Receive-IP: 172.18.0.188
X-MEDUSA-Status: 0
Message-ID: <0cc500bb-d53f-605a-b4a1-5f3c9115c326@chinatelecom.cn>
Date: Mon, 21 Mar 2022 11:12:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
From: Chongyun Wu <wucy11@chinatelecom.cn>
Subject: [PATCH 2/5] kvm: Dynamically adjust the rate of dirty ring reaper
 thread
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

Dynamically adjust the dirty ring collection thread to
reduce the occurrence of ring full, thereby reducing the
impact on customers, improving the efficiency of dirty
page collection, and thus improving the migration efficiency.

Implementation:
1) Define different collection speeds for the reap thread.

2) Divide the total number of dirty pages collected each
time by the ring size to get a ratio which indicates the
occupancy rate of dirty pages in the ring. The higher the
ratio, the higher the possibility that the ring will be full.

3) Different ratios correspond to different running speeds.
A higher ratio value indicates that a higher running speed
is required to collect dirty pages as soon as possible to
ensure that too many ring fulls will not be generated,
which will affect the customer's business.

This patch can significantly reduce the number of ring full
occurrences in the case of high memory dirty page pressure,
and minimize the impact on guests.

Using this patch for the qeum guestperf test, the memory
performance during the migration process is somewhat improved
compared to the bitmap method, and is significantly improved
compared to the unoptimized dirty ring method. For detailed
test data, please refer to the follow-up series of patches.

Signed-off-by: Chongyun Wu <wucy11@chinatelecom.cn>
---
  accel/kvm/kvm-all.c | 149 ++++++++++++++++++++++++++++++++++++++++++++++++++--
  1 file changed, 144 insertions(+), 5 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 0e66ebb..51012f4 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -91,6 +91,27 @@ enum KVMDirtyRingReaperState {
      KVM_DIRTY_RING_REAPER_REAPING,
  };

+enum KVMDirtyRingReaperRunLevel {
+    /* The reaper runs at default normal speed */
+    KVM_DIRTY_RING_REAPER_RUN_NORMAL = 0,
+    /* The reaper starts to accelerate in different gears */
+    KVM_DIRTY_RING_REAPER_RUN_FAST1,
+    KVM_DIRTY_RING_REAPER_RUN_FAST2,
+    KVM_DIRTY_RING_REAPER_RUN_FAST3,
+    KVM_DIRTY_RING_REAPER_RUN_FAST4,
+    /* The reaper runs at the fastest speed */
+    KVM_DIRTY_RING_REAPER_RUN_MAX_SPEED,
+};
+
+enum KVMDirtyRingReaperSpeedControl {
+    /* Maintain current speed */
+    KVM_DIRTY_RING_REAPER_SPEED_CONTROL_KEEP = 0,
+    /* Accelerate current speed */
+    KVM_DIRTY_RING_REAPER_SPEED_CONTROL_UP,
+    /* Decrease current speed */
+    KVM_DIRTY_RING_REAPER_SPEED_CONTROL_DOWN
+};
+
  /*
   * KVM reaper instance, responsible for collecting the KVM dirty bits
   * via the dirty ring.
@@ -100,6 +121,11 @@ struct KVMDirtyRingReaper {
      QemuThread reaper_thr;
      volatile uint64_t reaper_iteration; /* iteration number of reaper thr */
      volatile enum KVMDirtyRingReaperState reaper_state; /* reap thr state */
+    /* Control the running speed of the reaper thread to fit dirty page rate */
+    enum KVMDirtyRingReaperRunLevel run_level;
+    uint64_t ring_full_cnt;
+    float ratio_adjust_threshold;
+    int stable_count_threshold;
  };

  struct KVMState
@@ -1449,11 +1475,115 @@ out:
      kvm_slots_unlock();
  }

+static uint64_t calcu_sleep_time(KVMState *s,
+                                       uint64_t dirty_count,
+                                       uint64_t ring_full_cnt_last,
+                                       uint32_t *speed_down_cnt)
+{
+    float ratio = 0.0;
+    uint64_t sleep_time = 1000000;
+    enum KVMDirtyRingReaperRunLevel run_level_want;
+    enum KVMDirtyRingReaperSpeedControl speed_control;
+
+    /*
+     * When the number of dirty pages collected exceeds
+     * the given percentage of the ring size,the speed
+     * up action will be triggered.
+     */
+    s->reaper.ratio_adjust_threshold = 0.1;
+    s->reaper.stable_count_threshold = 5;
+
+    ratio = (float)dirty_count / s->kvm_dirty_ring_size;
+
+    if (s->reaper.ring_full_cnt > ring_full_cnt_last) {
+        /* If get a new ring full need speed up reaper thread */
+        if (s->reaper.run_level != KVM_DIRTY_RING_REAPER_RUN_MAX_SPEED) {
+            s->reaper.run_level++;
+        }
+    } else {
+        /*
+         * If get more dirty pages this loop and this status continus
+         * for many times try to speed up reaper thread.
+         * If the status is stable and need to decide which speed need
+         * to use.
+         */
+        if (ratio < s->reaper.ratio_adjust_threshold) {
+            run_level_want = KVM_DIRTY_RING_REAPER_RUN_NORMAL;
+        } else if (ratio < s->reaper.ratio_adjust_threshold * 2) {
+            run_level_want = KVM_DIRTY_RING_REAPER_RUN_FAST1;
+        } else if (ratio < s->reaper.ratio_adjust_threshold * 3) {
+            run_level_want = KVM_DIRTY_RING_REAPER_RUN_FAST2;
+        } else if (ratio < s->reaper.ratio_adjust_threshold * 4) {
+            run_level_want = KVM_DIRTY_RING_REAPER_RUN_FAST3;
+        } else if (ratio < s->reaper.ratio_adjust_threshold * 5) {
+            run_level_want = KVM_DIRTY_RING_REAPER_RUN_FAST4;
+        } else {
+            run_level_want = KVM_DIRTY_RING_REAPER_RUN_MAX_SPEED;
+        }
+
+        /* Get if need speed up or slow down */
+        if (run_level_want > s->reaper.run_level) {
+            speed_control = KVM_DIRTY_RING_REAPER_SPEED_CONTROL_UP;
+            *speed_down_cnt = 0;
+        } else if (run_level_want < s->reaper.run_level) {
+            speed_control = KVM_DIRTY_RING_REAPER_SPEED_CONTROL_DOWN;
+            *speed_down_cnt++;
+        } else {
+            speed_control = KVM_DIRTY_RING_REAPER_SPEED_CONTROL_KEEP;
+        }
+
+        /* Control reaper thread run in sutiable run speed level */
+        if (speed_control == KVM_DIRTY_RING_REAPER_SPEED_CONTROL_UP) {
+            /* If need speed up do not check its stable just do it */
+            s->reaper.run_level++;
+        } else if (speed_control ==
+            KVM_DIRTY_RING_REAPER_SPEED_CONTROL_DOWN) {
+            /* If need speed down we should filter this status */
+            if (*speed_down_cnt > s->reaper.stable_count_threshold) {
+                s->reaper.run_level--;
+            }
+        }
+    }
+
+    /* Set the actual running rate of the reaper */
+    switch (s->reaper.run_level) {
+    case KVM_DIRTY_RING_REAPER_RUN_NORMAL:
+        sleep_time = 1000000;
+        break;
+    case KVM_DIRTY_RING_REAPER_RUN_FAST1:
+        sleep_time = 500000;
+        break;
+    case KVM_DIRTY_RING_REAPER_RUN_FAST2:
+        sleep_time = 250000;
+        break;
+    case KVM_DIRTY_RING_REAPER_RUN_FAST3:
+        sleep_time = 125000;
+        break;
+    case KVM_DIRTY_RING_REAPER_RUN_FAST4:
+        sleep_time = 100000;
+        break;
+    case KVM_DIRTY_RING_REAPER_RUN_MAX_SPEED:
+        sleep_time = 80000;
+        break;
+    default:
+        sleep_time = 1000000;
+        error_report("Bad reaper thread run level, use default");
+    }
+
+    return sleep_time;
+}
+
  static void *kvm_dirty_ring_reaper_thread(void *data)
  {
      KVMState *s = data;
      struct KVMDirtyRingReaper *r = &s->reaper;

+    uint64_t count = 0;
+    uint64_t sleep_time = 1000000;
+    uint64_t ring_full_cnt_last = 0;
+    /* Filter speed jitter */
+    uint32_t speed_down_cnt = 0;
+
      rcu_register_thread();

      trace_kvm_dirty_ring_reaper("init");
@@ -1461,18 +1591,26 @@ static void *kvm_dirty_ring_reaper_thread(void *data)
      while (true) {
          r->reaper_state = KVM_DIRTY_RING_REAPER_WAIT;
          trace_kvm_dirty_ring_reaper("wait");
-        /*
-         * TODO: provide a smarter timeout rather than a constant?
-         */
-        sleep(1);
+
+       ring_full_cnt_last = s->reaper.ring_full_cnt;
+
+        usleep(sleep_time);

          trace_kvm_dirty_ring_reaper("wakeup");
          r->reaper_state = KVM_DIRTY_RING_REAPER_REAPING;

          qemu_mutex_lock_iothread();
-        kvm_dirty_ring_reap(s);
+        count = kvm_dirty_ring_reap(s);
          qemu_mutex_unlock_iothread();

+        /*
+         * Calculate the appropriate sleep time according to
+         * the speed of the current dirty page.
+         */
+        sleep_time = calcu_sleep_time(s, count,
+                                      ring_full_cnt_last,
+                                      &speed_down_cnt);
+
          r->reaper_iteration++;
      }

@@ -2957,6 +3095,7 @@ int kvm_cpu_exec(CPUState *cpu)
              trace_kvm_dirty_ring_full(cpu->cpu_index);
              qemu_mutex_lock_iothread();
              kvm_dirty_ring_reap(kvm_state);
+            kvm_state->reaper.ring_full_cnt++;
              qemu_mutex_unlock_iothread();
              ret = 0;
              break;
--
1.8.3.1

-- 
Best Regard,
Chongyun Wu

