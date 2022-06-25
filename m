Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3BE755ABC6
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Jun 2022 19:43:08 +0200 (CEST)
Received: from localhost ([::1]:37914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o59oJ-0006Du-Cd
	for lists+qemu-devel@lfdr.de; Sat, 25 Jun 2022 13:43:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1o59kH-0003LY-Pi
 for qemu-devel@nongnu.org; Sat, 25 Jun 2022 13:38:57 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.228]:53072
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1o59kE-0007Qx-93
 for qemu-devel@nongnu.org; Sat, 25 Jun 2022 13:38:57 -0400
HMM_SOURCE_IP: 172.18.0.48:34982.1285566443
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-171.223.97.81 (unknown [172.18.0.48])
 by chinatelecom.cn (HERMES) with SMTP id C340F2800C3;
 Sun, 26 Jun 2022 01:38:42 +0800 (CST)
X-189-SAVE-TO-SEND: +huangy81@chinatelecom.cn
Received: from  ([172.18.0.48])
 by app0024 with ESMTP id d9fb434b24bc4be0bd8af13d4cff97eb for
 qemu-devel@nongnu.org; Sun, 26 Jun 2022 01:38:45 CST
X-Transaction-ID: d9fb434b24bc4be0bd8af13d4cff97eb
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.48
X-MEDUSA-Status: 0
From: huangy81@chinatelecom.cn
To: qemu-devel <qemu-devel@nongnu.org>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Peter Xu <peterx@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Hyman <huangy81@chinatelecom.cn>
Subject: [PATCH v25 1/8] accel/kvm/kvm-all: Refactor per-vcpu dirty ring
 reaping
Date: Sun, 26 Jun 2022 01:38:30 +0800
Message-Id: <c32001242875e83b0d9f78f396fe2dcd380ba9e8.1656177590.git.huangy81@chinatelecom.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1656177590.git.huangy81@chinatelecom.cn>
References: <cover.1656177590.git.huangy81@chinatelecom.cn>
In-Reply-To: <cover.1656177590.git.huangy81@chinatelecom.cn>
References: <cover.1656177590.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.228;
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

Add a non-required argument 'CPUState' to kvm_dirty_ring_reap so
that it can cover single vcpu dirty-ring-reaping scenario.

Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
Reviewed-by: Peter Xu <peterx@redhat.com>
---
 accel/kvm/kvm-all.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index ba3210b..672ed00 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -757,17 +757,20 @@ static uint32_t kvm_dirty_ring_reap_one(KVMState *s, CPUState *cpu)
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
@@ -788,7 +791,7 @@ static uint64_t kvm_dirty_ring_reap_locked(KVMState *s)
  * Currently for simplicity, we must hold BQL before calling this.  We can
  * consider to drop the BQL if we're clear with all the race conditions.
  */
-static uint64_t kvm_dirty_ring_reap(KVMState *s)
+static uint64_t kvm_dirty_ring_reap(KVMState *s, CPUState *cpu)
 {
     uint64_t total;
 
@@ -808,7 +811,7 @@ static uint64_t kvm_dirty_ring_reap(KVMState *s)
      *     reset below.
      */
     kvm_slots_lock();
-    total = kvm_dirty_ring_reap_locked(s);
+    total = kvm_dirty_ring_reap_locked(s, cpu);
     kvm_slots_unlock();
 
     return total;
@@ -855,7 +858,7 @@ static void kvm_dirty_ring_flush(void)
      * vcpus out in a synchronous way.
      */
     kvm_cpu_synchronize_kick_all();
-    kvm_dirty_ring_reap(kvm_state);
+    kvm_dirty_ring_reap(kvm_state, NULL);
     trace_kvm_dirty_ring_flush(1);
 }
 
@@ -1399,7 +1402,7 @@ static void kvm_set_phys_mem(KVMMemoryListener *kml,
                  * Not easy.  Let's cross the fingers until it's fixed.
                  */
                 if (kvm_state->kvm_dirty_ring_size) {
-                    kvm_dirty_ring_reap_locked(kvm_state);
+                    kvm_dirty_ring_reap_locked(kvm_state, NULL);
                 } else {
                     kvm_slot_get_dirty_log(kvm_state, mem);
                 }
@@ -1471,7 +1474,7 @@ static void *kvm_dirty_ring_reaper_thread(void *data)
         r->reaper_state = KVM_DIRTY_RING_REAPER_REAPING;
 
         qemu_mutex_lock_iothread();
-        kvm_dirty_ring_reap(s);
+        kvm_dirty_ring_reap(s, NULL);
         qemu_mutex_unlock_iothread();
 
         r->reaper_iteration++;
@@ -2967,7 +2970,7 @@ int kvm_cpu_exec(CPUState *cpu)
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


