Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 975973480D9
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 19:45:07 +0100 (CET)
Received: from localhost ([::1]:47914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP8V8-00023s-8G
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 14:45:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lP8QL-0007JZ-57
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 14:40:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45222)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lP8QI-0006YN-E4
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 14:40:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616611205;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vl1BvGQfceFPZAGFbqFHhEuQ9V+7JVB+FCewYBIoqoc=;
 b=WKeak5k9q7o9kCCS8tGsQVlLIPl07yddXZD6ufAcwcfJMuUj+7b/PCbHxVRDq3FAl1fngG
 xxcrJnzRcLaG60vxpj8yZ+XkI5xBqaSqCksp+0TlFT5I/2mPIPWTdDkjuwWz6AjbvKGtK9
 xVQEPl/DaWj45xP1e40lNk3qW5a5Bhk=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-440-HugiSWf5Nna7UnR3g6H4Bw-1; Wed, 24 Mar 2021 14:40:03 -0400
X-MC-Unique: HugiSWf5Nna7UnR3g6H4Bw-1
Received: by mail-qk1-f199.google.com with SMTP id c1so2283976qke.8
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 11:40:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Vl1BvGQfceFPZAGFbqFHhEuQ9V+7JVB+FCewYBIoqoc=;
 b=e72SgeXNeXXW1s2vbNcJgdPjrdlTjtFYf9TAf8AXKMje85+or+vYKpbbr0q+EhAvjK
 GFlF9EqOSthCrdAaESfo+PdAOiGbyBB20DGwibfiSeFnOp1vkKKvnTVDtcS3Jgf5GaAT
 xFTFcHVneih1Llr+LlbYSqZO2e7u2ZCAKnsfy5i7/031Ybhemd7k0VcIIsJcFweCqax4
 ZTIHu2WgEdOdj7YjTzazLmJZQqrOEPgSfjzj9JN4cYAkbHh8qnitv2VOuBeMKpQt7yTj
 MeT2Pm97SkJfOMzgyUyOxwKjrb0t+1+xqCdtHtMtJ4girw/ce5v+RVtpftIaF4P0qaUW
 5uTA==
X-Gm-Message-State: AOAM533ly+zEo205VGyWBxi5goLTy+gzkuE+qWYJYSDi17S9OXyIuFpb
 Cfx6NioMlBVdCHEpJf7JR+541OSsE5uOResm3wsTNtTxSihdLWUlOKIJ/Tm7f0dkYBjnZEibyFc
 Qgwx5HJrIYPntN1cv8OjUfCm9/x9JUq01dBGwL/g87Ur7CGI450edfWge3Csv87e7
X-Received: by 2002:ac8:6690:: with SMTP id d16mr4339653qtp.312.1616611202571; 
 Wed, 24 Mar 2021 11:40:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwFR7zfFKEfi/ccyelTPCpMJeQZH6QcUNn4NNjvyGAa0hHuqNdayTxuL9QvggeqcMo/pnqdLA==
X-Received: by 2002:ac8:6690:: with SMTP id d16mr4339619qtp.312.1616611202247; 
 Wed, 24 Mar 2021 11:40:02 -0700 (PDT)
Received: from xz-x1.redhat.com
 (bras-base-toroon474qw-grc-82-174-91-135-175.dsl.bell.ca. [174.91.135.175])
 by smtp.gmail.com with ESMTPSA id t24sm2001083qto.23.2021.03.24.11.40.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 11:40:01 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 03/10] KVM: Create the KVMSlot dirty bitmap on flag changes
Date: Wed, 24 Mar 2021 14:39:47 -0400
Message-Id: <20210324183954.345629-4-peterx@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210324183954.345629-1-peterx@redhat.com>
References: <20210324183954.345629-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

Previously we have two places that will create the per KVMSlot dirty
bitmap:

  1. When a newly created KVMSlot has dirty logging enabled,
  2. When the first log_sync() happens for a memory slot.

The 2nd case is lazy-init, while the 1st case is not (which is a fix
of what the 2nd case missed).

To do explicit initialization of dirty bitmaps, what we're missing is
to create the dirty bitmap when the slot changed from not-dirty-track
to dirty-track.  Do that in kvm_slot_update_flags().

With that, we can safely remove the 2nd lazy-init.

This change will be needed for kvm dirty ring because kvm dirty ring
does not use the log_sync() interface at all.

Also move all the pre-checks into kvm_slot_init_dirty_bitmap().

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 accel/kvm/kvm-all.c | 23 +++++++++--------------
 1 file changed, 9 insertions(+), 14 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 766a7ad8c72..55ee5f1ad69 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -179,6 +179,8 @@ static QemuMutex kml_slots_lock;
 #define kvm_slots_lock()    qemu_mutex_lock(&kml_slots_lock)
 #define kvm_slots_unlock()  qemu_mutex_unlock(&kml_slots_lock)
 
+static void kvm_slot_init_dirty_bitmap(KVMSlot *mem);
+
 static inline void kvm_resample_fd_remove(int gsi)
 {
     KVMResampleFd *rfd;
@@ -502,6 +504,7 @@ static int kvm_slot_update_flags(KVMMemoryListener *kml, KVMSlot *mem,
         return 0;
     }
 
+    kvm_slot_init_dirty_bitmap(mem);
     return kvm_set_user_memory_region(kml, mem, false);
 }
 
@@ -586,8 +589,12 @@ static int kvm_get_dirty_pages_log_range(MemoryRegionSection *section,
 #define ALIGN(x, y)  (((x)+(y)-1) & ~((y)-1))
 
 /* Allocate the dirty bitmap for a slot  */
-static void kvm_memslot_init_dirty_bitmap(KVMSlot *mem)
+static void kvm_slot_init_dirty_bitmap(KVMSlot *mem)
 {
+    if (!(mem->flags & KVM_MEM_LOG_DIRTY_PAGES) || mem->dirty_bmap) {
+        return;
+    }
+
     /*
      * XXX bad kernel interface alert
      * For dirty bitmap, kernel allocates array of size aligned to
@@ -642,11 +649,6 @@ static int kvm_physical_sync_dirty_bitmap(KVMMemoryListener *kml,
             goto out;
         }
 
-        if (!mem->dirty_bmap) {
-            /* Allocate on the first log_sync, once and for all */
-            kvm_memslot_init_dirty_bitmap(mem);
-        }
-
         d.dirty_bitmap = mem->dirty_bmap;
         d.slot = mem->slot | (kml->as_id << 16);
         ret = kvm_vm_ioctl(s, KVM_GET_DIRTY_LOG, &d);
@@ -1183,14 +1185,7 @@ static void kvm_set_phys_mem(KVMMemoryListener *kml,
         mem->start_addr = start_addr;
         mem->ram = ram;
         mem->flags = kvm_mem_flags(mr);
-
-        if (mem->flags & KVM_MEM_LOG_DIRTY_PAGES) {
-            /*
-             * Reallocate the bmap; it means it doesn't disappear in
-             * middle of a migrate.
-             */
-            kvm_memslot_init_dirty_bitmap(mem);
-        }
+        kvm_slot_init_dirty_bitmap(mem);
         err = kvm_set_user_memory_region(kml, mem, true);
         if (err) {
             fprintf(stderr, "%s: error registering slot: %s\n", __func__,
-- 
2.26.2


