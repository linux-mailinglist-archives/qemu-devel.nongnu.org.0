Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BBB92EF610
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 17:55:35 +0100 (CET)
Received: from localhost ([::1]:58322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxv30-00021f-6M
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 11:55:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kxuyc-0008Gl-1u
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 11:51:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45063)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kxuyZ-0005TA-Vt
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 11:51:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610124659;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=onsr8KF3PBLI6UDXEBSCNCjeHrVYzpBaCySkBptySp0=;
 b=TYZifMKUw5DqoqQZXm8LxND8fASbSq6cXQ2yjwtClMJrck2cSM/T+VNkvgkzn67DZbEwFP
 /iW1fVj2ZMfCWCKE3zazp0Ri7IIZSGdIdWVPWllZNsh0SlZS7lfofjlazUue/31QU5uIXX
 phhjomiOoLIKRAlCovbTYE9sHCKzpME=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-59-ubVM2ronMLyXCMSZ2RWGOQ-1; Fri, 08 Jan 2021 11:50:55 -0500
X-MC-Unique: ubVM2ronMLyXCMSZ2RWGOQ-1
Received: by mail-qt1-f200.google.com with SMTP id p20so8727833qtq.3
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 08:50:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=onsr8KF3PBLI6UDXEBSCNCjeHrVYzpBaCySkBptySp0=;
 b=VJSCObphDOvHvvipzyelxOBrGLLOvQI3RdGVzHL5jsAPwQPpDn756innOgPxnt65Lf
 dS9laQu50qQdF9exQdZw8IEPIX1mAN9k6+5cglujkc1lPxGBazi49WpoJJuiIc18XQsi
 ALh7jEgy1XmOW4t0XbA1BRszPv/DM6L3xgDLjbquELFBkNIVPormSDvWDHZwr8/BSKPZ
 6wjhXE4ClUkO/3w0xqZbtVki9hSHTZ/OMCalwAybsHDaucDdZZBD5g8IIw02fRiT7lD1
 dsyHyK9pgYTH+EUJcrjEH5yEfy6Tlli+1iC/fGDpkom54YV34zHx620S7LcRJsUc3qbW
 dzCw==
X-Gm-Message-State: AOAM531AtAQM9OYmQ89FDmgxa/EJ6QlpLcCW2daymZinjh8zi4Qh5en1
 h50CbjdCaHAsZIyWCiFCaUZOvNKy5zybHHGjYiZMgX+K+wDUMIM9gBt7su1kaHCnvSvJzWwMASt
 EfQmKtHqrEkAdXnpo691kLJwmgWTcKhWvMdzBCS+oIsjm09MkvEtFtHzip7Kv4teC
X-Received: by 2002:a05:620a:2108:: with SMTP id
 l8mr1434159qkl.232.1610124655014; 
 Fri, 08 Jan 2021 08:50:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz5c+wYJ6RxuJPNtyka4TXp/Jp51WCVbd3Mhk+xaJi8VLT5/39ayDXXsM1ojp+owzJa4N09Og==
X-Received: by 2002:a05:620a:2108:: with SMTP id
 l8mr1434134qkl.232.1610124654741; 
 Fri, 08 Jan 2021 08:50:54 -0800 (PST)
Received: from xz-x1.redhat.com ([142.126.83.202])
 by smtp.gmail.com with ESMTPSA id n5sm4954064qkh.126.2021.01.08.08.50.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 08:50:53 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 06/13] KVM: Create the KVMSlot dirty bitmap on flag changes
Date: Fri,  8 Jan 2021 11:50:43 -0500
Message-Id: <20210108165050.406906-3-peterx@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210108165050.406906-1-peterx@redhat.com>
References: <20210108164601.406146-1-peterx@redhat.com>
 <20210108165050.406906-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.247,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
index d891a22a3b..445ce1b177 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -181,6 +181,8 @@ static QemuMutex kml_slots_lock;
 #define kvm_slots_lock()  qemu_mutex_lock(&kml_slots_lock)
 #define kvm_slots_unlock()  qemu_mutex_unlock(&kml_slots_lock)
 
+static void kvm_slot_init_dirty_bitmap(KVMSlot *mem);
+
 static inline void kvm_resample_fd_remove(int gsi)
 {
     KVMResampleFd *rfd;
@@ -524,6 +526,7 @@ static int kvm_slot_update_flags(KVMMemoryListener *kml, KVMSlot *mem,
         return 0;
     }
 
+    kvm_slot_init_dirty_bitmap(mem);
     return kvm_set_user_memory_region(kml, mem, false);
 }
 
@@ -608,8 +611,12 @@ static int kvm_get_dirty_pages_log_range(MemoryRegionSection *section,
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
@@ -660,11 +667,6 @@ static int kvm_physical_sync_dirty_bitmap(KVMMemoryListener *kml,
             goto out;
         }
 
-        if (!mem->dirty_bmap) {
-            /* Allocate on the first log_sync, once and for all */
-            kvm_memslot_init_dirty_bitmap(mem);
-        }
-
         d.dirty_bitmap = mem->dirty_bmap;
         d.slot = mem->slot | (kml->as_id << 16);
         if (kvm_vm_ioctl(s, KVM_GET_DIRTY_LOG, &d) == -1) {
@@ -1197,14 +1199,7 @@ static void kvm_set_phys_mem(KVMMemoryListener *kml,
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


