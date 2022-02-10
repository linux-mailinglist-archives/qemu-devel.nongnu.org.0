Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E8374B161D
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 20:20:26 +0100 (CET)
Received: from localhost ([::1]:49832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIEzQ-0007om-Ml
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 14:20:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1nIBym-0003Gb-8Y
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 11:07:34 -0500
Received: from prt-mail.chinatelecom.cn ([42.123.76.222]:58956
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1nIByR-0006Xv-05
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 11:07:15 -0500
HMM_SOURCE_IP: 172.18.0.48:41426.295907247
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-171.223.98.151 (unknown [172.18.0.48])
 by chinatelecom.cn (HERMES) with SMTP id 4ED5928009A;
 Fri, 11 Feb 2022 00:06:59 +0800 (CST)
X-189-SAVE-TO-SEND: +huangy81@chinatelecom.cn
Received: from  ([172.18.0.48])
 by app0024 with ESMTP id 24e7ed15dd864d95b0675b7eb3fddc3b for
 qemu-devel@nongnu.org; Fri, 11 Feb 2022 00:07:05 CST
X-Transaction-ID: 24e7ed15dd864d95b0675b7eb3fddc3b
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.48
X-MEDUSA-Status: 0
From: huangy81@chinatelecom.cn
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH V13 1/7] accel/kvm/kvm-all: Refactor per-vcpu dirty ring
 reaping
Date: Fri, 11 Feb 2022 00:06:27 +0800
Message-Id: <5ed8d9ce7dd1ffaf413a6b225ddb0c851a3a35f9.1644508591.git.huangy81@chinatelecom.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1644506963.git.huangy81@chinatelecom.cn>
References: <cover.1644506963.git.huangy81@chinatelecom.cn>
In-Reply-To: <cover.1644508591.git.huangy81@chinatelecom.cn>
References: <cover.1644508591.git.huangy81@chinatelecom.cn>
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
Cc: Eduardo Habkost <eduardo@habkost.net>, David Hildenbrand <david@redhat.com>,
 Hyman <huangy81@chinatelecom.cn>, Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus ArmBruster <armbru@redhat.com>, Peter Xu <peterx@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>

Add a non-required argument 'CPUState' to kvm_dirty_ring_reap so
that it can cover single vcpu dirty-ring-reaping scenario.

Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
---
 accel/kvm/kvm-all.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 0e66ebb..7b06b8a 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -756,17 +756,20 @@ static uint32_t kvm_dirty_ring_reap_one(KVMState *s, CPUState *cpu)
 }
 
 /* Must be with slots_lock held */
-static uint64_t kvm_dirty_ring_reap_locked(KVMState *s)
+static uint64_t kvm_dirty_ring_reap_locked(KVMState *s, CPUState* cpu)
 {
     int ret;
-    CPUState *cpu;
     uint64_t total = 0;
     int64_t stamp;
 
     stamp = get_clock();
 
-    CPU_FOREACH(cpu) {
-        total += kvm_dirty_ring_reap_one(s, cpu);
+    if (cpu) {
+        total = kvm_dirty_ring_reap_one(s, cpu);
+    } else {
+        CPU_FOREACH(cpu) {
+            total += kvm_dirty_ring_reap_one(s, cpu);
+        }
     }
 
     if (total) {
@@ -787,7 +790,7 @@ static uint64_t kvm_dirty_ring_reap_locked(KVMState *s)
  * Currently for simplicity, we must hold BQL before calling this.  We can
  * consider to drop the BQL if we're clear with all the race conditions.
  */
-static uint64_t kvm_dirty_ring_reap(KVMState *s)
+static uint64_t kvm_dirty_ring_reap(KVMState *s, CPUState *cpu)
 {
     uint64_t total;
 
@@ -807,7 +810,7 @@ static uint64_t kvm_dirty_ring_reap(KVMState *s)
      *     reset below.
      */
     kvm_slots_lock();
-    total = kvm_dirty_ring_reap_locked(s);
+    total = kvm_dirty_ring_reap_locked(s, cpu);
     kvm_slots_unlock();
 
     return total;
@@ -854,7 +857,7 @@ static void kvm_dirty_ring_flush(void)
      * vcpus out in a synchronous way.
      */
     kvm_cpu_synchronize_kick_all();
-    kvm_dirty_ring_reap(kvm_state);
+    kvm_dirty_ring_reap(kvm_state, NULL);
     trace_kvm_dirty_ring_flush(1);
 }
 
@@ -1398,7 +1401,7 @@ static void kvm_set_phys_mem(KVMMemoryListener *kml,
                  * Not easy.  Let's cross the fingers until it's fixed.
                  */
                 if (kvm_state->kvm_dirty_ring_size) {
-                    kvm_dirty_ring_reap_locked(kvm_state);
+                    kvm_dirty_ring_reap_locked(kvm_state, NULL);
                 } else {
                     kvm_slot_get_dirty_log(kvm_state, mem);
                 }
@@ -1470,7 +1473,7 @@ static void *kvm_dirty_ring_reaper_thread(void *data)
         r->reaper_state = KVM_DIRTY_RING_REAPER_REAPING;
 
         qemu_mutex_lock_iothread();
-        kvm_dirty_ring_reap(s);
+        kvm_dirty_ring_reap(s, NULL);
         qemu_mutex_unlock_iothread();
 
         r->reaper_iteration++;
@@ -2956,7 +2959,7 @@ int kvm_cpu_exec(CPUState *cpu)
              */
             trace_kvm_dirty_ring_full(cpu->cpu_index);
             qemu_mutex_lock_iothread();
-            kvm_dirty_ring_reap(kvm_state);
+            kvm_dirty_ring_reap(kvm_state, NULL);
             qemu_mutex_unlock_iothread();
             ret = 0;
             break;
-- 
1.8.3.1


