Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D46389FC6
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 10:27:57 +0200 (CEST)
Received: from localhost ([::1]:58642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lje28-0005uP-8K
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 04:27:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ljdxf-0005OF-8n
 for qemu-devel@nongnu.org; Thu, 20 May 2021 04:23:20 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:39929)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ljdxY-0001Wp-12
 for qemu-devel@nongnu.org; Thu, 20 May 2021 04:23:15 -0400
Received: by mail-wr1-x434.google.com with SMTP id v12so16672602wrq.6
 for <qemu-devel@nongnu.org>; Thu, 20 May 2021 01:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Dm9fdtL6t7afNY/kOhuKcUr0Mn8HCiKEsUB/elQwJdU=;
 b=Xpv16JC1lI0DEFy3A6clqgPyC7qz5Yh7uJxqWnohJnudKrIPDlSbO765USVlStTM9U
 99rzmQM/AoH/At4S4HPF4Ln/9RGAj/Kp2DtaN2st814CwDLG4vy0CXPRrmO4bUomfV3n
 PTOV5xiaKFjrFMJ2oNpZFsAn9zki+7VN3NqwSdzirxN/l0hm1Zpgfu7kJpUlpLZWSDrK
 WnDc3F3652YAOLDEcOE2XDw1FlpwaGig08dd8lMihxmOPS4vnVp/IV1Z7N+YlmbCwZma
 nADSD7iNAdFne7n1ObuAyHrQ4hF9K4eAit8/CCmh09Xukgx8AHlIUWbwh7lXWw2peszw
 g8Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Dm9fdtL6t7afNY/kOhuKcUr0Mn8HCiKEsUB/elQwJdU=;
 b=gGTGYcpRV/f6dxzU2HmnrSjCymcdQ7Gl7lNRLCkjwZjvH3KL3JvDc3HEFVGInnt9aM
 zHCYFnTjqN+fpjkETs1VPdSQ0vJfuLhvEiEdRccGbF5npIZkG/oUWvLaTfbESAx2M2o0
 5QYsTGHfZ21Phc2EMhkDgSmvnjJfhwlcyJ5YVGNzo4g2GYKF9xZM58Sc/iPbQ0a2z6p4
 5szGcAi0p/QdLGC9aosMNxZhMZS4h1hvCTP85qwu6mM+hdkXbvvjFj2M6mLb0ajJRGX1
 7ldQDY1fTZ4i7w1Z/k4OYTJye4vSuGv5UDB7JoQhTYF1f9ggX9Xw3npuY0jyN2GZGR9K
 bYmw==
X-Gm-Message-State: AOAM532+FFvm3DBLJUZjHkZHWAYRNpQJktq9MUNyCuo7f9ZC+a7UaM4S
 4ns06Y6bsQ7TWN276EDCnwjTbT3cISMQJA==
X-Google-Smtp-Source: ABdhPJzTDHqCoJkxq0PkvXsAs1XqBinMf2MenqZ840+6dmmpCI/x69uSKFga9QsLUX3xc3O45CJ1GA==
X-Received: by 2002:a5d:570c:: with SMTP id a12mr2926498wrv.354.1621498985740; 
 Thu, 20 May 2021 01:23:05 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 v10sm2603506wrq.0.2021.05.20.01.23.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 01:23:05 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 11/26] KVM: Use a big lock to replace per-kml slots_lock
Date: Thu, 20 May 2021 10:22:42 +0200
Message-Id: <20210520082257.187061-12-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210520082257.187061-1-pbonzini@redhat.com>
References: <20210520082257.187061-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Xu <peterx@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Xu <peterx@redhat.com>

Per-kml slots_lock will bring some trouble if we want to take all slots_lock of
all the KMLs, especially when we're in a context that we could have taken some
of the KML slots_lock, then we even need to figure out what we've taken and
what we need to take.

Make this simple by merging all KML slots_lock into a single slots lock.

Per-kml slots_lock isn't anything that helpful anyway - so far only x86 has two
address spaces (so, two slots_locks).  All the rest archs will be having one
address space always, which means there's actually one slots_lock so it will be
the same as before.

Signed-off-by: Peter Xu <peterx@redhat.com>
Message-Id: <20210506160549.130416-3-peterx@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 accel/kvm/kvm-all.c      | 33 ++++++++++++++++++---------------
 include/sysemu/kvm_int.h |  2 --
 2 files changed, 18 insertions(+), 17 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 54c0860979..f8980e155b 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -172,8 +172,10 @@ typedef struct KVMResampleFd KVMResampleFd;
 static QLIST_HEAD(, KVMResampleFd) kvm_resample_fd_list =
     QLIST_HEAD_INITIALIZER(kvm_resample_fd_list);
 
-#define kvm_slots_lock(kml)      qemu_mutex_lock(&(kml)->slots_lock)
-#define kvm_slots_unlock(kml)    qemu_mutex_unlock(&(kml)->slots_lock)
+static QemuMutex kml_slots_lock;
+
+#define kvm_slots_lock()    qemu_mutex_lock(&kml_slots_lock)
+#define kvm_slots_unlock()  qemu_mutex_unlock(&kml_slots_lock)
 
 static inline void kvm_resample_fd_remove(int gsi)
 {
@@ -239,9 +241,9 @@ bool kvm_has_free_slot(MachineState *ms)
     bool result;
     KVMMemoryListener *kml = &s->memory_listener;
 
-    kvm_slots_lock(kml);
+    kvm_slots_lock();
     result = !!kvm_get_free_slot(kml);
-    kvm_slots_unlock(kml);
+    kvm_slots_unlock();
 
     return result;
 }
@@ -307,7 +309,7 @@ int kvm_physical_memory_addr_from_host(KVMState *s, void *ram,
     KVMMemoryListener *kml = &s->memory_listener;
     int i, ret = 0;
 
-    kvm_slots_lock(kml);
+    kvm_slots_lock();
     for (i = 0; i < s->nr_slots; i++) {
         KVMSlot *mem = &kml->slots[i];
 
@@ -317,7 +319,7 @@ int kvm_physical_memory_addr_from_host(KVMState *s, void *ram,
             break;
         }
     }
-    kvm_slots_unlock(kml);
+    kvm_slots_unlock();
 
     return ret;
 }
@@ -513,7 +515,7 @@ static int kvm_section_update_flags(KVMMemoryListener *kml,
         return 0;
     }
 
-    kvm_slots_lock(kml);
+    kvm_slots_lock();
 
     while (size && !ret) {
         slot_size = MIN(kvm_max_slot_size, size);
@@ -529,7 +531,7 @@ static int kvm_section_update_flags(KVMMemoryListener *kml,
     }
 
 out:
-    kvm_slots_unlock(kml);
+    kvm_slots_unlock();
     return ret;
 }
 
@@ -810,7 +812,7 @@ static int kvm_physical_log_clear(KVMMemoryListener *kml,
         return ret;
     }
 
-    kvm_slots_lock(kml);
+    kvm_slots_lock();
 
     for (i = 0; i < s->nr_slots; i++) {
         mem = &kml->slots[i];
@@ -836,7 +838,7 @@ static int kvm_physical_log_clear(KVMMemoryListener *kml,
         }
     }
 
-    kvm_slots_unlock(kml);
+    kvm_slots_unlock();
 
     return ret;
 }
@@ -1141,7 +1143,7 @@ static void kvm_set_phys_mem(KVMMemoryListener *kml,
     ram = memory_region_get_ram_ptr(mr) + section->offset_within_region +
           (start_addr - section->offset_within_address_space);
 
-    kvm_slots_lock(kml);
+    kvm_slots_lock();
 
     if (!add) {
         do {
@@ -1199,7 +1201,7 @@ static void kvm_set_phys_mem(KVMMemoryListener *kml,
     } while (size);
 
 out:
-    kvm_slots_unlock(kml);
+    kvm_slots_unlock();
 }
 
 static void kvm_region_add(MemoryListener *listener,
@@ -1226,9 +1228,9 @@ static void kvm_log_sync(MemoryListener *listener,
     KVMMemoryListener *kml = container_of(listener, KVMMemoryListener, listener);
     int r;
 
-    kvm_slots_lock(kml);
+    kvm_slots_lock();
     r = kvm_physical_sync_dirty_bitmap(kml, section);
-    kvm_slots_unlock(kml);
+    kvm_slots_unlock();
     if (r < 0) {
         abort();
     }
@@ -1328,7 +1330,6 @@ void kvm_memory_listener_register(KVMState *s, KVMMemoryListener *kml,
 {
     int i;
 
-    qemu_mutex_init(&kml->slots_lock);
     kml->slots = g_malloc0(s->nr_slots * sizeof(KVMSlot));
     kml->as_id = as_id;
 
@@ -2001,6 +2002,8 @@ static int kvm_init(MachineState *ms)
     int type = 0;
     uint64_t dirty_log_manual_caps;
 
+    qemu_mutex_init(&kml_slots_lock);
+
     s = KVM_STATE(ms->accelerator);
 
     /*
diff --git a/include/sysemu/kvm_int.h b/include/sysemu/kvm_int.h
index ccb8869f01..1da30e1884 100644
--- a/include/sysemu/kvm_int.h
+++ b/include/sysemu/kvm_int.h
@@ -27,8 +27,6 @@ typedef struct KVMSlot
 
 typedef struct KVMMemoryListener {
     MemoryListener listener;
-    /* Protects the slots and all inside them */
-    QemuMutex slots_lock;
     KVMSlot *slots;
     int as_id;
 } KVMMemoryListener;
-- 
2.31.1



