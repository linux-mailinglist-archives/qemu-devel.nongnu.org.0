Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B305553B2
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 20:54:18 +0200 (CEST)
Received: from localhost ([::1]:53746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o45UW-0002ru-84
	for lists+qemu-devel@lfdr.de; Wed, 22 Jun 2022 14:54:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1o45Gj-0008Ft-Ef
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 14:40:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1o45Gg-0002HR-QT
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 14:40:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655923196;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gVkCW/MbdgCVRNcQ8mL3o0ALPDubARCe+EyFeHqskQI=;
 b=DY74O5ob6Zhy6KG96N2TEB60RIzM/GSxL9EQ2w8/+JcIwjelDYj1D6LJXkYyX0o0+TwSGO
 ROO/FDo/wLPEeuzuE2V83A9CmoqXFYop+gBmknAiYRn9eVSmzmRYsVLzdujH9DPp4EpvUw
 RyaqWqq64r1+xJUkvcqsbIKbFJ4/Mmw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-379-UMy7ej0ZMnOczUCG-_eRhg-1; Wed, 22 Jun 2022 14:39:53 -0400
X-MC-Unique: UMy7ej0ZMnOczUCG-_eRhg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A30E63C41661;
 Wed, 22 Jun 2022 18:39:52 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.33.36.161])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C61A71131D;
 Wed, 22 Jun 2022 18:39:51 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, berrange@redhat.com, huangy81@chinatelecom.cn,
 quintela@redhat.com, leobras@redhat.com
Cc: jdenemar@redhat.com
Subject: [PULL 26/33] accel/kvm/kvm-all: Refactor per-vcpu dirty ring reaping
Date: Wed, 22 Jun 2022 19:39:10 +0100
Message-Id: <20220622183917.155308-27-dgilbert@redhat.com>
In-Reply-To: <20220622183917.155308-1-dgilbert@redhat.com>
References: <20220622183917.155308-1-dgilbert@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
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

Add a non-required argument 'CPUState' to kvm_dirty_ring_reap so
that it can cover single vcpu dirty-ring-reaping scenario.

Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
Reviewed-by: Peter Xu <peterx@redhat.com>
Message-Id: <bc37b83d5a189add887433728a0f632d35fb3e3e.1652931128.git.huangy81@chinatelecom.cn>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 accel/kvm/kvm-all.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index ba3210b1c1..672ed004ab 100644
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
2.36.1


