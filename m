Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B87A375861
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 18:22:12 +0200 (CEST)
Received: from localhost ([::1]:46180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leglP-0004Q8-Cv
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 12:22:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1legVo-0004HU-G2
 for qemu-devel@nongnu.org; Thu, 06 May 2021 12:06:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51547)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1legVk-0003ZC-Md
 for qemu-devel@nongnu.org; Thu, 06 May 2021 12:06:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620317160;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OM2XyTzzC86YAJbdG9JEgthtoxhW4weKyjnb13GxWdA=;
 b=c+YIc7iAK4uarVMm9NcQgg1IdK9ebfmdgWcVKmoJP4UmFCj1Q6S0ys506eMa479VGTd+OA
 TfRQK5pdE//1cC5fKO5rN3dnjHW2IPt2aG8LsHG28GAe2OR6IwOz7R/89jS149p4jQktFy
 kw4P4fQUxEYuCzS69LZHe6/fRL6Tzeg=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-7-VeLatu4UNtehf8mT6Z_Zqg-1; Thu, 06 May 2021 12:05:57 -0400
X-MC-Unique: VeLatu4UNtehf8mT6Z_Zqg-1
Received: by mail-qv1-f71.google.com with SMTP id
 b10-20020a0cf04a0000b02901bda1df3afbso4486679qvl.13
 for <qemu-devel@nongnu.org>; Thu, 06 May 2021 09:05:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OM2XyTzzC86YAJbdG9JEgthtoxhW4weKyjnb13GxWdA=;
 b=NXS7eeaZhfH6zI3U9bzsnrbPM3/q0zBaPfw4cuDm7vS+l3uJUJPi/0nvDl6xMij9tl
 R1hWhLcavFl0SPyxp1FOa+7j52qH8qsSKf+5/8uUUG0UU/5lxI8LBdKCwGMuV9M14nBN
 IErxrrvUu110icC0HPj4spXL8qFuCJA27UAjSv7R6Op0m+gZ5gLqrYqmT5qmmANnh7yI
 dWzAsIVeHR+tVWtBZAHkk+AZK8hrsLGMO2xV6BCHr/MOEdyvrIOQacp9+kXoQdG89OeV
 vAD2kusmVrXblHFmoiFMx5+TOokJwAaNmWKLECG9M/ZHPEz5tZDMecQbZhEVIU2hTqzc
 Bo6g==
X-Gm-Message-State: AOAM530CjpGcxH29IQIQ9zNJu90AwkK9NP377n9iR1PUntGoUIuXtB/g
 xJdbk6NE4AKwK/iOrWwo/PknWu84UP7kH5F19wC6V5Ww5kObwHsPOGkqRKlm2Fk+WVWjsXyBwwX
 DzfqkVJzgrFxLOwDRRccnNA4uKbmvNRijK0Apq3hCzqX4FZhpVNwXdNTlQl8iTUPF
X-Received: by 2002:a37:d205:: with SMTP id f5mr4748302qkj.244.1620317156248; 
 Thu, 06 May 2021 09:05:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw+8zGk4G6Q+FN8o8nDTrBAaUi8+Avl3U08N93bZ6ReOcCTBQFwZl3dGtGFVc+/t8dmLgKALg==
X-Received: by 2002:a37:d205:: with SMTP id f5mr4748265qkj.244.1620317155903; 
 Thu, 06 May 2021 09:05:55 -0700 (PDT)
Received: from t490s.redhat.com
 (bras-base-toroon474qw-grc-72-184-145-4-219.dsl.bell.ca. [184.145.4.219])
 by smtp.gmail.com with ESMTPSA id y84sm2194131qkb.134.2021.05.06.09.05.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 May 2021 09:05:54 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 02/10] KVM: Use a big lock to replace per-kml slots_lock
Date: Thu,  6 May 2021 12:05:41 -0400
Message-Id: <20210506160549.130416-3-peterx@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210506160549.130416-1-peterx@redhat.com>
References: <20210506160549.130416-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.69,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Keqian Zhu <zhukeqian1@huawei.com>,
 Hyman <huangy81@chinatelecom.cn>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
---
 accel/kvm/kvm-all.c      | 33 ++++++++++++++++++---------------
 include/sysemu/kvm_int.h |  2 --
 2 files changed, 18 insertions(+), 17 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 4e0168e88b9..d335e1ec380 100644
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
index ccb8869f01b..1da30e18841 100644
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


