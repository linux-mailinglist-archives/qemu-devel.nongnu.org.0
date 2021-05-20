Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64AAD389FDB
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 10:32:03 +0200 (CEST)
Received: from localhost ([::1]:38878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lje66-0003hE-EA
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 04:32:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ljdxf-0005OE-9R
 for qemu-devel@nongnu.org; Thu, 20 May 2021 04:23:20 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:46900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ljdxY-0001Wv-32
 for qemu-devel@nongnu.org; Thu, 20 May 2021 04:23:15 -0400
Received: by mail-wr1-x430.google.com with SMTP id y14so14589746wrm.13
 for <qemu-devel@nongnu.org>; Thu, 20 May 2021 01:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Cb/EIE1W0YCsIKhSOhonZiq7HmU1guIPixtbSVuS12k=;
 b=BDHDaNyaL7OjEsv/MBUph3q0vw88a4QIvhWZtA30u5/au6lzhLnvwk4/ZnU9BEM0xh
 a3NNM+9ZcinwqRZ7yCRSywlDBzDoTpxx3Y8ephVWVpnZiTTk0JCse/86UmGSqglp044x
 i3p91sebkC5nN7iXjIlbPPLfXwBB4t33ZWMqJUpm8eSNdymzMf7aVMHiHvfxUOPtyyK/
 bPuHp03iKWM8O3+hMDcs6/MbMF0IcpYEtq7WNHGVmpALVSbCX/IEDTI8wbFGy1O50+9s
 JVJngP9dj+7srtd7zd7wYf0Hg4EibFj3YlKfebuqtJIELv2P1kPceKtBr/RZm6OTQmcc
 jQYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Cb/EIE1W0YCsIKhSOhonZiq7HmU1guIPixtbSVuS12k=;
 b=E/Wwihshr2Xg2CVeV2xhT+24PS2dloYTnjWqem5O1nfVlb5AMt6tX3c9bsIsQsE+WQ
 zQuJNpT+WxvdHMLN4s2zkml8vczGkOL3DwxcFgF93Aqzp8g74UIT/G+s27SW3L8Lnqzx
 tQJmDBr0FpBN7PSTlegKHgFFTDTt6AWzLYmV/M4lrIGNa04S+U/q3Y5yPOpM1sZQnkBl
 KFTM7gCoUrdm5dfnzmQjbmWS/XkRXLz5EyL73lYJqFs532lfRgnbTCuA1wiJw+o/PwVF
 uxs6alji1kVSni3mHlDPIieRbteLMFYPn8fvyr9evvHYzzjrAkGvAU0oIvlvL6KVtsg0
 HIbA==
X-Gm-Message-State: AOAM532NMa/EGAlmsVbDhr6GhZwMR1ZdSAItbv3erQ7vUHVAUz5ioTmm
 JZCMqRbRaUmyZRRQvIPFDHk1DnopasE4Ow==
X-Google-Smtp-Source: ABdhPJyGZg92jyLdJ6jpyk8vrMFb41UeD+amYNCkqQy2pSfnDSlO9I0/zpl2BuMgQkB8Iu8LcG+l/Q==
X-Received: by 2002:a5d:4408:: with SMTP id z8mr3057137wrq.2.1621498986395;
 Thu, 20 May 2021 01:23:06 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 v10sm2603506wrq.0.2021.05.20.01.23.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 01:23:06 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 12/26] KVM: Create the KVMSlot dirty bitmap on flag changes
Date: Thu, 20 May 2021 10:22:43 +0200
Message-Id: <20210520082257.187061-13-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210520082257.187061-1-pbonzini@redhat.com>
References: <20210520082257.187061-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x430.google.com
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
Cc: "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Peter Xu <peterx@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Xu <peterx@redhat.com>

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
Message-Id: <20210506160549.130416-4-peterx@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 accel/kvm/kvm-all.c | 23 +++++++++--------------
 1 file changed, 9 insertions(+), 14 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index f8980e155b..5bc40fd71b 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -177,6 +177,8 @@ static QemuMutex kml_slots_lock;
 #define kvm_slots_lock()    qemu_mutex_lock(&kml_slots_lock)
 #define kvm_slots_unlock()  qemu_mutex_unlock(&kml_slots_lock)
 
+static void kvm_slot_init_dirty_bitmap(KVMSlot *mem);
+
 static inline void kvm_resample_fd_remove(int gsi)
 {
     KVMResampleFd *rfd;
@@ -500,6 +502,7 @@ static int kvm_slot_update_flags(KVMMemoryListener *kml, KVMSlot *mem,
         return 0;
     }
 
+    kvm_slot_init_dirty_bitmap(mem);
     return kvm_set_user_memory_region(kml, mem, false);
 }
 
@@ -584,8 +587,12 @@ static int kvm_get_dirty_pages_log_range(MemoryRegionSection *section,
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
@@ -640,11 +647,6 @@ static int kvm_physical_sync_dirty_bitmap(KVMMemoryListener *kml,
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
@@ -1181,14 +1183,7 @@ static void kvm_set_phys_mem(KVMMemoryListener *kml,
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
2.31.1



