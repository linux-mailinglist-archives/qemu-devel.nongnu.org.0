Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FFA038A00F
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 10:46:17 +0200 (CEST)
Received: from localhost ([::1]:41316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljeJq-0008GD-FS
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 04:46:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ljdxj-0005RN-9X
 for qemu-devel@nongnu.org; Thu, 20 May 2021 04:23:29 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:39919)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ljdxf-0001X1-0o
 for qemu-devel@nongnu.org; Thu, 20 May 2021 04:23:22 -0400
Received: by mail-wr1-x429.google.com with SMTP id v12so16672695wrq.6
 for <qemu-devel@nongnu.org>; Thu, 20 May 2021 01:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yoh7aaW0HkXExKTvgyPRoyUhprnmP0RXGSbOvZabGVI=;
 b=cRMi4+Kln8ra0OueGEWNMcVRUtw1YD1qTg5Kww/qKp3IBmvzeUr2p1iJbs0JaJhODU
 lx61OzGx/QOf8xHFruMp8Ry1becppKcDttRrmutM+NPJvhEfqMnqc7+fsiHmyjq25jfq
 Y5+Uhv3YRBubNS8Yf8CC7O4rQq+x1pJaWJFMRgkUQ+7S5ZrkMZ+ALIRZgsDwte/Ro1p0
 bIoFyX+jBCZwyoPg7XW/lWLJlRAE3I5Wb3+7C4gUUs3eNLP0k6HQi8uqSxqJRWSCn07A
 aPmb9PyMtUZ4pyqpxTICF9WadbCWJDFX/SCkIGj/IRm8qQDCtcqs/dm7PQV6vqWvGtM6
 oJrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=yoh7aaW0HkXExKTvgyPRoyUhprnmP0RXGSbOvZabGVI=;
 b=jpSCbwSaF72a6CvbHOwJcx878qFV5emPOW1CmQisvZw2dcjI375NL2Wwv+6s77sXIp
 SS9YvVfgYwTCrUxEVRxYSlol0eHLyLa+1KTIFlav5QdB2G9OMT7qxMQtPtfsoEVgY7z2
 5y+p0Q7yVTiVtmJ0rOUNuiJqr93mNk3QlQIHQvEXvms3mLR6olKZanOrIUnjdq1P6XR8
 yAp73YcUQ7EOOx7OJ5XUFHa2m8+d9n7EuakfWt98MHaj+eP+2BxIg/ba0OYn40aggr6M
 nHO89HB2it7QR5nmPKyNDPcB8wvvEnWPf1i2VMSipmTAcRDy6Q0zJstxjfpwUVzK8p4m
 os/w==
X-Gm-Message-State: AOAM5334qalTSE5eqEYcc2hQHK7SE9LPBy5BjX703/bat9O+wsSU5QjL
 xycBIRZDUyEtzxCQ5UYmhplVSdNrKKEXmQ==
X-Google-Smtp-Source: ABdhPJw6SxVwTOT6HM5+o8Fpjbbk0lT1nDX7YCqLLRggP4KX8+0AyiH5hY44BouHnSwXlSgYmQho3g==
X-Received: by 2002:a05:6000:108f:: with SMTP id
 y15mr3058346wrw.115.1621498987148; 
 Thu, 20 May 2021 01:23:07 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 v10sm2603506wrq.0.2021.05.20.01.23.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 01:23:06 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 13/26] KVM: Provide helper to get kvm dirty log
Date: Thu, 20 May 2021 10:22:44 +0200
Message-Id: <20210520082257.187061-14-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210520082257.187061-1-pbonzini@redhat.com>
References: <20210520082257.187061-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x429.google.com
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

Provide a helper kvm_slot_get_dirty_log() to make the function
kvm_physical_sync_dirty_bitmap() clearer.  We can even cache the as_id
into KVMSlot when it is created, so that we don't even need to pass it
down every time.

Since at it, remove return value of kvm_physical_sync_dirty_bitmap()
because it should never fail.

Signed-off-by: Peter Xu <peterx@redhat.com>
Message-Id: <20210506160549.130416-5-peterx@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 accel/kvm/kvm-all.c      | 52 +++++++++++++++++++++++-----------------
 include/sysemu/kvm_int.h |  2 ++
 2 files changed, 32 insertions(+), 22 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 5bc40fd71b..caaa2a5c98 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -615,6 +615,30 @@ static void kvm_slot_init_dirty_bitmap(KVMSlot *mem)
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
@@ -626,15 +650,13 @@ static void kvm_slot_init_dirty_bitmap(KVMSlot *mem)
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
@@ -644,19 +666,10 @@ static int kvm_physical_sync_dirty_bitmap(KVMMemoryListener *kml,
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
@@ -666,8 +679,6 @@ static int kvm_physical_sync_dirty_bitmap(KVMMemoryListener *kml,
         start_addr += slot_size;
         size -= slot_size;
     }
-out:
-    return ret;
 }
 
 /* Alignment requirement for KVM_CLEAR_DIRTY_LOG - 64 pages */
@@ -1179,6 +1190,7 @@ static void kvm_set_phys_mem(KVMMemoryListener *kml,
     do {
         slot_size = MIN(kvm_max_slot_size, size);
         mem = kvm_alloc_slot(kml);
+        mem->as_id = kml->as_id;
         mem->memory_size = slot_size;
         mem->start_addr = start_addr;
         mem->ram = ram;
@@ -1221,14 +1233,10 @@ static void kvm_log_sync(MemoryListener *listener,
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
index 1da30e1884..e13075f738 100644
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
2.31.1



