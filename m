Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A13F42BCF5
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 12:37:23 +0200 (CEST)
Received: from localhost ([::1]:46566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mabdS-0008QK-6S
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 06:37:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1maban-0005rw-Se
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 06:34:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mabam-0002m1-2n
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 06:34:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634121274;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PxRO//KGswXPKqSCCWXXkgC8CPdp/iPZT12lPG2xPHY=;
 b=aPBAvTObIvr67D8aL32EqA2g49yS5pqASkLXlgT/jdZXinQPqQ+g3B4dA2u3yrPMuqNsPv
 3zETv6lqhY2zy9KHCuMz2TRolUvLj34BfidOEwzHo0dTcWoKA6rqeiUUgVamRpFQHfUBji
 laXKHwOk1NisPIRGOXuN5wJwJP5DA+I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-551-3LdVgzHfPDiuu_EhC-eoYw-1; Wed, 13 Oct 2021 06:34:31 -0400
X-MC-Unique: 3LdVgzHfPDiuu_EhC-eoYw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C911F10A8E00;
 Wed, 13 Oct 2021 10:34:29 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.194.27])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4C71E5D9D5;
 Wed, 13 Oct 2021 10:34:14 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC 02/15] kvm: Return number of free memslots
Date: Wed, 13 Oct 2021 12:33:17 +0200
Message-Id: <20211013103330.26869-3-david@redhat.com>
In-Reply-To: <20211013103330.26869-1-david@redhat.com>
References: <20211013103330.26869-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let's return the number of free slots instead of only checking if there
is a free slot. Required to support memory devices that consume multiple
memslots.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 accel/kvm/kvm-all.c    | 24 +++++++++++-------------
 accel/stubs/kvm-stub.c |  4 ++--
 hw/mem/memory-device.c |  2 +-
 include/sysemu/kvm.h   |  2 +-
 4 files changed, 15 insertions(+), 17 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index db8d83b137..0846be835e 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -103,6 +103,7 @@ struct KVMState
     AccelState parent_obj;
 
     int nr_slots;
+    int nr_free_slots;
     int fd;
     int vmfd;
     int coalesced_mmio;
@@ -245,6 +246,13 @@ int kvm_get_max_memslots(void)
     return s->nr_slots;
 }
 
+unsigned int kvm_get_free_memslots(void)
+{
+    KVMState *s = kvm_state;
+
+    return s->nr_free_slots;
+}
+
 /* Called with KVMMemoryListener.slots_lock held */
 static KVMSlot *kvm_get_free_slot(KVMMemoryListener *kml)
 {
@@ -260,19 +268,6 @@ static KVMSlot *kvm_get_free_slot(KVMMemoryListener *kml)
     return NULL;
 }
 
-bool kvm_has_free_slot(MachineState *ms)
-{
-    KVMState *s = KVM_STATE(ms->accelerator);
-    bool result;
-    KVMMemoryListener *kml = &s->memory_listener;
-
-    kvm_slots_lock();
-    result = !!kvm_get_free_slot(kml);
-    kvm_slots_unlock();
-
-    return result;
-}
-
 /* Called with KVMMemoryListener.slots_lock held */
 static KVMSlot *kvm_alloc_slot(KVMMemoryListener *kml)
 {
@@ -1410,6 +1405,7 @@ static void kvm_set_phys_mem(KVMMemoryListener *kml,
             }
             start_addr += slot_size;
             size -= slot_size;
+            kvm_state->nr_free_slots++;
         } while (size);
         goto out;
     }
@@ -1435,6 +1431,7 @@ static void kvm_set_phys_mem(KVMMemoryListener *kml,
         ram_start_offset += slot_size;
         ram += slot_size;
         size -= slot_size;
+        kvm_state->nr_free_slots--;
     } while (size);
 
 out:
@@ -2364,6 +2361,7 @@ static int kvm_init(MachineState *ms)
     if (!s->nr_slots) {
         s->nr_slots = 32;
     }
+    s->nr_free_slots = s->nr_slots;
 
     s->nr_as = kvm_check_extension(s, KVM_CAP_MULTI_ADDRESS_SPACE);
     if (s->nr_as <= 1) {
diff --git a/accel/stubs/kvm-stub.c b/accel/stubs/kvm-stub.c
index 5b1d00a222..cbaeb7c656 100644
--- a/accel/stubs/kvm-stub.c
+++ b/accel/stubs/kvm-stub.c
@@ -133,9 +133,9 @@ int kvm_irqchip_remove_irqfd_notifier_gsi(KVMState *s, EventNotifier *n,
     return -ENOSYS;
 }
 
-bool kvm_has_free_slot(MachineState *ms)
+unsigned int kvm_get_free_memslots(void)
 {
-    return false;
+    return 0;
 }
 
 void kvm_init_cpu_signals(CPUState *cpu)
diff --git a/hw/mem/memory-device.c b/hw/mem/memory-device.c
index d9f8301711..9045ead33e 100644
--- a/hw/mem/memory-device.c
+++ b/hw/mem/memory-device.c
@@ -73,7 +73,7 @@ static void memory_device_check_addable(MachineState *ms, uint64_t size,
     uint64_t used_region_size = 0;
 
     /* we will need a new memory slot for kvm and vhost */
-    if (kvm_enabled() && !kvm_has_free_slot(ms)) {
+    if (kvm_enabled() && !kvm_get_free_memslots()) {
         error_setg(errp, "hypervisor has no free memory slots left");
         return;
     }
diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
index a1ab1ee12d..c18be3cbd5 100644
--- a/include/sysemu/kvm.h
+++ b/include/sysemu/kvm.h
@@ -211,7 +211,7 @@ typedef struct Notifier Notifier;
 
 /* external API */
 
-bool kvm_has_free_slot(MachineState *ms);
+unsigned int kvm_get_free_memslots(void);
 bool kvm_has_sync_mmu(void);
 int kvm_has_vcpu_events(void);
 int kvm_has_robust_singlestep(void);
-- 
2.31.1


