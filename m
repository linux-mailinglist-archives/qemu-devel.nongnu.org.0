Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F36B38F1C2
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 18:49:05 +0200 (CEST)
Received: from localhost ([::1]:36442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llDlI-0002O2-AD
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 12:49:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1llDeK-0004jK-OJ
 for qemu-devel@nongnu.org; Mon, 24 May 2021 12:41:53 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:39663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1llDeI-0004M0-DX
 for qemu-devel@nongnu.org; Mon, 24 May 2021 12:41:52 -0400
Received: by mail-ej1-x629.google.com with SMTP id l1so42788889ejb.6
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 09:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Dm9fdtL6t7afNY/kOhuKcUr0Mn8HCiKEsUB/elQwJdU=;
 b=roIJFHelJ/OdE5TALajGmsrL0RLAdyfBHpPlWaS6E8OeJhQVVMFc6Vy/acp5mFD9MW
 s+XFu1XfgJSVskkyqAl9dyvioa9Y7AvEXjmujuEMOm++P47l3UN2Hiq3QvUois9O4jGo
 946XdgUU2lTDeUMuCkqZEiJUB2nezuy69U7WIMZqvlynhpZlxFKZe1EG8pqVoZpoDjUE
 CHrV0n3bgfnH1mGktYjbR+/Oh/XeUkWoJb+vM6bqC9fbyrTyblRPRu8k+UcVc8xHbCPT
 d2jUuCOqzNjH3uEsrmLGMnWWVRRlNUkZjziWPFBgLxl0xJ/5rVmvwMAmW+wQ8SDqIfmU
 jMKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Dm9fdtL6t7afNY/kOhuKcUr0Mn8HCiKEsUB/elQwJdU=;
 b=PByClJR1+okBUzItBTfwSZe2LODfFD4EppNkX9SdTmAy8kPqGeg6z4zCZxJWoV0KUL
 eLX61IY+rf2qeQTa1eEcDmuQwrVdjjI4Ua9v+5ulmlHpTe/bVHVQ8nASUM0tPbMcu6nk
 6W181RyeHIOpdrR0oQfEUgCoRWDipbLmtF7lmfB8q529HTa+OcSZeshnRStLa1YeeLwJ
 1MJLu0Vus4dOWsBwgkpQk06uQIPLho7SDELJXbhxN4YnZaDgziU5BY8yskPa9duH76qd
 q0S1NVNF1Gz0eh9yWEqO8mAtZfMls5QZ8LSBOkeN6G4CuNYO/yBeGKRvgxyWSt29JmDQ
 hcgA==
X-Gm-Message-State: AOAM530CyNhNgw18c9nnqBumWMhA6Vt9kclxeJrR8NHAOs2QTGq68FL+
 WWhw2J1GX26AKCKbBSTEh1pg4LoWRaezKA==
X-Google-Smtp-Source: ABdhPJxzn6fY6fCGPKNccnuf8miCNN+MBJH4xKbJcTJiSXYva4bK2g/8Lh0jek/zFMi5/nXLjN6GNw==
X-Received: by 2002:a17:906:26ce:: with SMTP id
 u14mr23999302ejc.187.1621874499339; 
 Mon, 24 May 2021 09:41:39 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 g4sm9581922edm.83.2021.05.24.09.41.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 09:41:38 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/28] KVM: Use a big lock to replace per-kml slots_lock
Date: Mon, 24 May 2021 18:41:13 +0200
Message-Id: <20210524164131.383778-11-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210524164131.383778-1-pbonzini@redhat.com>
References: <20210524164131.383778-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x629.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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



