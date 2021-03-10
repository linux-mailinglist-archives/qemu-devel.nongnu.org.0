Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD35D3348F6
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 21:38:31 +0100 (CET)
Received: from localhost ([::1]:45006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK5bC-0001J3-TX
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 15:38:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lK5W4-0005rI-TL
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 15:33:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30152)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lK5W1-0000aT-6H
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 15:33:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615408387;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W45wrGyush/oGSqrXaYtg/y5rrnMn7xxwc1GgVTmze0=;
 b=DASuEIjKOYB1nzS/A1AXSrv9zfIgncsIzPSdVBU7lpArWFxfSJSOg5drENU6K3VIe2XMOF
 yTqJAA4nQn/DVKaFxE4lHmowpHUXflB/4P0BQtkuGZdhfxdm1ulbKnJiyBmec3ebGIYUKs
 62/qFzN1fIdC7QnL9y68WE8NQVaU0DQ=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-22-2-GrXgl3OXCSDCeXH0ieFg-1; Wed, 10 Mar 2021 15:33:06 -0500
X-MC-Unique: 2-GrXgl3OXCSDCeXH0ieFg-1
Received: by mail-qk1-f198.google.com with SMTP id i188so13712771qkd.7
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 12:33:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=W45wrGyush/oGSqrXaYtg/y5rrnMn7xxwc1GgVTmze0=;
 b=etpuPMuQGdG47rc/nI9axLL+hQs+rViRzvl0mIAnCc6HIZc19Ug9ubW8ob7hyNB4Mb
 b3Mt3cGbOa1P8TG81thifzmf5rXr1LU4hw/b3plTlWuw6nqzhL6ySjMaT5ZxAJc5xl4q
 Aa6fp0NSXPoy7r4prvy1geHzyfs3VgmvzxWFncm0PGDwP46G3ug/k5rr4+LrO0TtRmT7
 b1B/pdrTTlKFvrhqN97BYMgyfX3VXIlv9vhg3xT94/y9+5KlFMCevQTjYJ4BJxLvapny
 k9+4lImh2qq1Yu3J8kM4LE5wvI98ZRwZ/Kt3AIIDx8sevaMMpckUguG7Xma7vaI8/Pca
 xb2g==
X-Gm-Message-State: AOAM5316/EqP+7pX9kgKI54XZhTV+2pzUmRTIhOGWujBUGvou37EtklX
 sroUVskHaCb7/hFb+RL1wdqIPud0hzpeLwfJZa6eLq6Pdf/1t/e5Bz+mkO4TBakv46P+IK1/+n6
 ZRzH0A46nX4Y50ZJ+XTex/HuSNYMwU/PoxHVQm0pr0m0qpLIyMW9wtjpAsdP0WFzc
X-Received: by 2002:a37:8b44:: with SMTP id n65mr4323346qkd.235.1615408385469; 
 Wed, 10 Mar 2021 12:33:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwBVqrwR5oHqRsKNh/jZ0aqwqXq22sWwqifzbwAKqigbCaMJ8Zv7qpTmxs6fcC5fEQMN3PE+A==
X-Received: by 2002:a37:8b44:: with SMTP id n65mr4323318qkd.235.1615408385131; 
 Wed, 10 Mar 2021 12:33:05 -0800 (PST)
Received: from xz-x1.redhat.com ([142.126.89.138])
 by smtp.gmail.com with ESMTPSA id z89sm306746qtd.5.2021.03.10.12.33.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 12:33:04 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 02/10] KVM: Use a big lock to replace per-kml slots_lock
Date: Wed, 10 Mar 2021 15:32:53 -0500
Message-Id: <20210310203301.194842-3-peterx@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210310203301.194842-1-peterx@redhat.com>
References: <20210310203301.194842-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Hyman <huangy81@chinatelecom.cn>,
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
 accel/kvm/kvm-all.c      | 32 +++++++++++++++++---------------
 include/sysemu/kvm_int.h |  2 --
 2 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index f88a52393fe..94e881f123b 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -174,8 +174,10 @@ typedef struct KVMResampleFd KVMResampleFd;
 static QLIST_HEAD(, KVMResampleFd) kvm_resample_fd_list =
     QLIST_HEAD_INITIALIZER(kvm_resample_fd_list);
 
-#define kvm_slots_lock(kml)      qemu_mutex_lock(&(kml)->slots_lock)
-#define kvm_slots_unlock(kml)    qemu_mutex_unlock(&(kml)->slots_lock)
+static QemuMutex kml_slots_lock;
+
+#define kvm_slots_lock()  qemu_mutex_lock(&kml_slots_lock)
+#define kvm_slots_unlock()  qemu_mutex_unlock(&kml_slots_lock)
 
 static inline void kvm_resample_fd_remove(int gsi)
 {
@@ -241,9 +243,9 @@ bool kvm_has_free_slot(MachineState *ms)
     bool result;
     KVMMemoryListener *kml = &s->memory_listener;
 
-    kvm_slots_lock(kml);
+    kvm_slots_lock();
     result = !!kvm_get_free_slot(kml);
-    kvm_slots_unlock(kml);
+    kvm_slots_unlock();
 
     return result;
 }
@@ -309,7 +311,7 @@ int kvm_physical_memory_addr_from_host(KVMState *s, void *ram,
     KVMMemoryListener *kml = &s->memory_listener;
     int i, ret = 0;
 
-    kvm_slots_lock(kml);
+    kvm_slots_lock();
     for (i = 0; i < s->nr_slots; i++) {
         KVMSlot *mem = &kml->slots[i];
 
@@ -319,7 +321,7 @@ int kvm_physical_memory_addr_from_host(KVMState *s, void *ram,
             break;
         }
     }
-    kvm_slots_unlock(kml);
+    kvm_slots_unlock();
 
     return ret;
 }
@@ -515,7 +517,7 @@ static int kvm_section_update_flags(KVMMemoryListener *kml,
         return 0;
     }
 
-    kvm_slots_lock(kml);
+    kvm_slots_lock();
 
     while (size && !ret) {
         slot_size = MIN(kvm_max_slot_size, size);
@@ -531,7 +533,7 @@ static int kvm_section_update_flags(KVMMemoryListener *kml,
     }
 
 out:
-    kvm_slots_unlock(kml);
+    kvm_slots_unlock();
     return ret;
 }
 
@@ -819,7 +821,7 @@ static int kvm_physical_log_clear(KVMMemoryListener *kml,
         return ret;
     }
 
-    kvm_slots_lock(kml);
+    kvm_slots_lock();
 
     for (i = 0; i < s->nr_slots; i++) {
         mem = &kml->slots[i];
@@ -845,7 +847,7 @@ static int kvm_physical_log_clear(KVMMemoryListener *kml,
         }
     }
 
-    kvm_slots_unlock(kml);
+    kvm_slots_unlock();
 
     return ret;
 }
@@ -1150,7 +1152,7 @@ static void kvm_set_phys_mem(KVMMemoryListener *kml,
     ram = memory_region_get_ram_ptr(mr) + section->offset_within_region +
           (start_addr - section->offset_within_address_space);
 
-    kvm_slots_lock(kml);
+    kvm_slots_lock();
 
     if (!add) {
         do {
@@ -1208,7 +1210,7 @@ static void kvm_set_phys_mem(KVMMemoryListener *kml,
     } while (size);
 
 out:
-    kvm_slots_unlock(kml);
+    kvm_slots_unlock();
 }
 
 static void kvm_region_add(MemoryListener *listener,
@@ -1235,9 +1237,9 @@ static void kvm_log_sync(MemoryListener *listener,
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
@@ -1337,7 +1339,7 @@ void kvm_memory_listener_register(KVMState *s, KVMMemoryListener *kml,
 {
     int i;
 
-    qemu_mutex_init(&kml->slots_lock);
+    qemu_mutex_init(&kml_slots_lock);
     kml->slots = g_malloc0(s->nr_slots * sizeof(KVMSlot));
     kml->as_id = as_id;
 
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
2.26.2


