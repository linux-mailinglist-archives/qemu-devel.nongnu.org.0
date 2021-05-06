Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 049CC375860
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 18:21:13 +0200 (CEST)
Received: from localhost ([::1]:42538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1legkS-0002li-1M
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 12:21:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1legVr-0004JO-GZ
 for qemu-devel@nongnu.org; Thu, 06 May 2021 12:06:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27317)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1legVo-0003au-0N
 for qemu-devel@nongnu.org; Thu, 06 May 2021 12:06:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620317163;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DZYX5Y52f1JWYi6nZzE3uGv6I3Ja2831c2co8CAQUwY=;
 b=GJEvvLLZ24Lk5H9W8I21Hem2xQiZUnaU4q8Rc83ZbGztQtwsX56AH5GUFgSxIRZ9JpKniS
 GO69P7tSFCjcbk6lzR+HraYdbBHaG+Lcv8oAAM9lT6NjL4eEF/CMTropSAo8C1NmcJzuLL
 XIV0M0m/YPcKPG34hlKVJm/slcpFAzk=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-251-Ct342NnWO7amjNR3FPPp-w-1; Thu, 06 May 2021 12:06:01 -0400
X-MC-Unique: Ct342NnWO7amjNR3FPPp-w-1
Received: by mail-qv1-f69.google.com with SMTP id
 b10-20020a0cf04a0000b02901bda1df3afbso4486854qvl.13
 for <qemu-devel@nongnu.org>; Thu, 06 May 2021 09:06:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DZYX5Y52f1JWYi6nZzE3uGv6I3Ja2831c2co8CAQUwY=;
 b=CENZz2uP6LwsuqgylNgFLpmH19egaJA8T8sw2Yur47PzL++Q7e6lvhB9IDM60r6lLu
 xh+TgH16CdX+lrMGcxYlLIKGcrEca+qjwrf/tGY+3BUZEPl6VEaJUvR6xVh1QYytUDdB
 Be5owzgz4O0XBtpDy8BanJ4Ul3VxvI2/byZb4cK6cSNQqBD7/alB/MPe/lUnTSh5r8MJ
 nktDvKliRTiRocVrDTc15wM4YDi+k9Li9xQ7iH+SpPRS9IfML8lkyzuaYxeKXMODsa6O
 /J6xVCIneJe8gnxxu9fbR0Ve9qp7EmZ6fOPdfifq88wRJ1/pFg7cp3ydj9J1eTzkCHsp
 9Iww==
X-Gm-Message-State: AOAM531NP8N99Uuv+LWzrqF1dp/hBmfX8g8Zatu8eKqPaGcJDq+7AwEb
 kYLZ/iFCL9rk4KNRTdDyeoAkOo38dJThzLrQh1u86z7w+aj2jOXgb5QCieVDJYBXjKIa4sn+KYD
 jOVCSJoecrbAbYVTn1Z7fbDlMOuPWxnCWVKYX9PXiLmn05jio0DDXeUIsJ7f1MTrQ
X-Received: by 2002:a05:620a:4043:: with SMTP id
 i3mr4554778qko.380.1620317160504; 
 Thu, 06 May 2021 09:06:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzFNG2svdwxFIyKGWm20slhPETseEoS2bnbCWfgELVWIL8JYIlN4QKzUG36a4i4nPu1VHR2dQ==
X-Received: by 2002:a05:620a:4043:: with SMTP id
 i3mr4554737qko.380.1620317160196; 
 Thu, 06 May 2021 09:06:00 -0700 (PDT)
Received: from t490s.redhat.com
 (bras-base-toroon474qw-grc-72-184-145-4-219.dsl.bell.ca. [184.145.4.219])
 by smtp.gmail.com with ESMTPSA id y84sm2194131qkb.134.2021.05.06.09.05.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 May 2021 09:05:59 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 04/10] KVM: Provide helper to get kvm dirty log
Date: Thu,  6 May 2021 12:05:43 -0400
Message-Id: <20210506160549.130416-5-peterx@redhat.com>
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
index 84272d18553..4ed5b4a3631 100644
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
2.31.1


