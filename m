Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE8D3348FC
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 21:39:46 +0100 (CET)
Received: from localhost ([::1]:47676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK5cP-0002e9-8R
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 15:39:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lK5W7-0005vi-FV
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 15:33:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lK5W2-0000d2-F8
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 15:33:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615408389;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FYTm0Ygz3+9TFDUpsIdZ9xetLL5/rO9MVJVwiaBlDfA=;
 b=NBrKPqjJgbC+/HUo0hfiV7oVUWFnO4poQYu8sfSL9+kvY6WJs562BBd+1VxK8GB90fKi71
 GLU7n7sJn0CRDbyrNcYH5v5xoJ2utT0hOuzBGBYFEoOcJlv8NR5PGigkkEKEpLwGAamf3J
 MjQhkYpJ0bX/VJR4J0lSG1Yz1S1DX4Y=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-108-D-NIIMWhNt-gNh5vB3y7mw-1; Wed, 10 Mar 2021 15:33:08 -0500
X-MC-Unique: D-NIIMWhNt-gNh5vB3y7mw-1
Received: by mail-qk1-f197.google.com with SMTP id k185so13700960qkb.17
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 12:33:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FYTm0Ygz3+9TFDUpsIdZ9xetLL5/rO9MVJVwiaBlDfA=;
 b=li3crto/0D7Y1UFTOfqQkbrycNR9jLXwXq1xmn/lEF8zpCufhHKxhzOO8ypg25a4TC
 QiRCWrypnW3/uS2h9mJ6894H8pBnkrfDYVc3kH7hOJ60Vjjxw6BuhfkBgHjWcQ9GddpX
 on2luSgYX8q8YyF8mhgSOlhTMwfcKYTdL8nUWh3dmP3AQH9aRgWCI5dbi/C6l773X3jp
 SGJkWcZ1D9jZ5aPoo4HDj6UXKiLLkO6iuBjS9HoPxUsWiBSMvcZqfBix3jSJL958C647
 +Haj3sTSp4/VD1EKImR42DuMlemFqPcCtLJLPow15HUXjdm57XlULJ/xRAJKoy8XWwoQ
 0gNA==
X-Gm-Message-State: AOAM530o3GI+xHJVRl77BNeo1d8gt0cBGSrTo0R44lfBEgieXj7c/4jg
 jrltKgkKtAAAf/Yf4i8/7JQ7Fqg7pzLfrwUandzvIfDI7RRWlw82K/s0+wqQtqVLyJflMNCBMTZ
 EKoDc4p8c+IO90BHJv/0+x+MVg70oUyO/Ui5MZVCENqdN0ZOVuP1o+vLeXlZmQ/0T
X-Received: by 2002:ac8:cc5:: with SMTP id o5mr4609603qti.0.1615408387764;
 Wed, 10 Mar 2021 12:33:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxZsKyFq64L2fGAfQP0hq3M08rN5MaSCE18JJ89rNQMd3wvrLBASjrUodU48X1fWFyj4drs4A==
X-Received: by 2002:ac8:cc5:: with SMTP id o5mr4609585qti.0.1615408387448;
 Wed, 10 Mar 2021 12:33:07 -0800 (PST)
Received: from xz-x1.redhat.com ([142.126.89.138])
 by smtp.gmail.com with ESMTPSA id z89sm306746qtd.5.2021.03.10.12.33.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 12:33:06 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 04/10] KVM: Provide helper to get kvm dirty log
Date: Wed, 10 Mar 2021 15:32:55 -0500
Message-Id: <20210310203301.194842-5-peterx@redhat.com>
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

Provide a helper kvm_slot_get_dirty_log() to make the function
kvm_physical_sync_dirty_bitmap() clearer.  We can even cache the as_id
into KVMSlot when it is created, so that we don't even need to pass it
down every time.

Since at it, remove return value of kvm_physical_sync_dirty_bitmap()
because it should never fail.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 accel/kvm/kvm-all.c      | 52 +++++++++++++++++++++++-----------------
 include/sysemu/kvm_int.h |  2 ++
 2 files changed, 32 insertions(+), 22 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index fa337418636..853dfb076bd 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -617,6 +617,30 @@ static void kvm_slot_init_dirty_bitmap(KVMSlot *mem)
     mem->dirty_bmap = g_malloc0(bitmap_size);
 }
 
+/*
+ * Sync dirty bitmap from kernel to KVMSlot.dirty_bmap, return true if
+ * succeeded, false otherwise
+ */
+static bool kvm_slot_get_dirty_log(KVMState *s, KVMSlot *slot)
+{
+    struct kvm_dirty_log d = {};
+    int ret;
+
+    d.dirty_bitmap = slot->dirty_bmap;
+    d.slot = slot->slot | (slot->as_id << 16);
+    ret = kvm_vm_ioctl(s, KVM_GET_DIRTY_LOG, &d);
+
+    if (ret == -ENOENT) {
+        /* kernel does not have dirty bitmap in this slot */
+        ret = 0;
+    }
+    if (ret) {
+        error_report_once("%s: KVM_GET_DIRTY_LOG failed with %d",
+                          __func__, ret);
+    }
+    return ret == 0;
+}
+
 /**
  * kvm_physical_sync_dirty_bitmap - Sync dirty bitmap from kernel space
  *
@@ -628,15 +652,13 @@ static void kvm_slot_init_dirty_bitmap(KVMSlot *mem)
  * @kml: the KVM memory listener object
  * @section: the memory section to sync the dirty bitmap with
  */
-static int kvm_physical_sync_dirty_bitmap(KVMMemoryListener *kml,
-                                          MemoryRegionSection *section)
+static void kvm_physical_sync_dirty_bitmap(KVMMemoryListener *kml,
+                                           MemoryRegionSection *section)
 {
     KVMState *s = kvm_state;
-    struct kvm_dirty_log d = {};
     KVMSlot *mem;
     hwaddr start_addr, size;
     hwaddr slot_size, slot_offset = 0;
-    int ret = 0;
 
     size = kvm_align_section(section, &start_addr);
     while (size) {
@@ -646,19 +668,10 @@ static int kvm_physical_sync_dirty_bitmap(KVMMemoryListener *kml,
         mem = kvm_lookup_matching_slot(kml, start_addr, slot_size);
         if (!mem) {
             /* We don't have a slot if we want to trap every access. */
-            goto out;
+            return;
         }
 
-        d.dirty_bitmap = mem->dirty_bmap;
-        d.slot = mem->slot | (kml->as_id << 16);
-        ret = kvm_vm_ioctl(s, KVM_GET_DIRTY_LOG, &d);
-        if (ret == -ENOENT) {
-            /* kernel does not have dirty bitmap in this slot */
-            ret = 0;
-        } else if (ret < 0) {
-            error_report("ioctl KVM_GET_DIRTY_LOG failed: %d", errno);
-            goto out;
-        } else {
+        if (kvm_slot_get_dirty_log(s, mem)) {
             subsection.offset_within_region += slot_offset;
             subsection.size = int128_make64(slot_size);
             kvm_get_dirty_pages_log_range(&subsection, d.dirty_bitmap);
@@ -668,8 +681,6 @@ static int kvm_physical_sync_dirty_bitmap(KVMMemoryListener *kml,
         start_addr += slot_size;
         size -= slot_size;
     }
-out:
-    return ret;
 }
 
 /* Alignment requirement for KVM_CLEAR_DIRTY_LOG - 64 pages */
@@ -1188,6 +1199,7 @@ static void kvm_set_phys_mem(KVMMemoryListener *kml,
     do {
         slot_size = MIN(kvm_max_slot_size, size);
         mem = kvm_alloc_slot(kml);
+        mem->as_id = kml->as_id;
         mem->memory_size = slot_size;
         mem->start_addr = start_addr;
         mem->ram = ram;
@@ -1230,14 +1242,10 @@ static void kvm_log_sync(MemoryListener *listener,
                          MemoryRegionSection *section)
 {
     KVMMemoryListener *kml = container_of(listener, KVMMemoryListener, listener);
-    int r;
 
     kvm_slots_lock();
-    r = kvm_physical_sync_dirty_bitmap(kml, section);
+    kvm_physical_sync_dirty_bitmap(kml, section);
     kvm_slots_unlock();
-    if (r < 0) {
-        abort();
-    }
 }
 
 static void kvm_log_clear(MemoryListener *listener,
diff --git a/include/sysemu/kvm_int.h b/include/sysemu/kvm_int.h
index 1da30e18841..e13075f738a 100644
--- a/include/sysemu/kvm_int.h
+++ b/include/sysemu/kvm_int.h
@@ -23,6 +23,8 @@ typedef struct KVMSlot
     int old_flags;
     /* Dirty bitmap cache for the slot */
     unsigned long *dirty_bmap;
+    /* Cache of the address space ID */
+    int as_id;
 } KVMSlot;
 
 typedef struct KVMMemoryListener {
-- 
2.26.2


