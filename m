Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5EC237586D
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 18:27:11 +0200 (CEST)
Received: from localhost ([::1]:54946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1legqE-0008NB-OW
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 12:27:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1legW1-0004Ts-M0
 for qemu-devel@nongnu.org; Thu, 06 May 2021 12:06:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1legVr-0003c7-6k
 for qemu-devel@nongnu.org; Thu, 06 May 2021 12:06:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620317165;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1KRsB3dZd2ZuwXeR581le5W9+VnyOI+ccWnxFXDSIGU=;
 b=aXc9e75bkDWlHcZl3JZVAv6oSb7qcqqeZVbdmA08cZoPLQ+vdc3h4ky7BjKtXs2bWC0DH7
 bjMonPz2oaHhy7jsWBsH9bb/0o0X6zZ+b5CfW6gfa0LWNXKf1YOyD2gMvHtqEfyH7Csr6W
 UDNijdBsfR9zGsWuiSeUlGhcu8d3K2A=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-492-SeRJ0tDuMiWajvFqLu_uww-1; Thu, 06 May 2021 12:06:02 -0400
X-MC-Unique: SeRJ0tDuMiWajvFqLu_uww-1
Received: by mail-qt1-f199.google.com with SMTP id
 s4-20020ac85cc40000b02901b59d9c0986so3859663qta.19
 for <qemu-devel@nongnu.org>; Thu, 06 May 2021 09:06:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1KRsB3dZd2ZuwXeR581le5W9+VnyOI+ccWnxFXDSIGU=;
 b=fpf672SMWub8LMEHe2t/I5gG/RH4eR50jczRt1/iD8okNplSsND1s/QN0KAsnIGcoP
 l2BafI1mP9zGui3XYvRKtFWPm9LYTuMIV9USzl/3WSy2TcCoFyL7OV6nJZvsH0okPE/j
 VU0eud4V5dFe+Beh/DbU/EzUJqgLfSqxcNcAf01VjT8xHTvVEo5xFDkSbLB5OulhLH64
 hHqyxb9CbuZKsMS92iwpvrcVcb0StXjVWqptyUgyfmfNbGxt42o2amryCVIoOMkD1RS8
 1FCjB/WQjmAI+1EmoRLElAghdozfT9dJN1RxhswEe2OMX2oDPBULDq+PsNrFfxw5RFjQ
 /aFg==
X-Gm-Message-State: AOAM5335bAcz/RAF06nXeJWs0Hv+5bXKRedpAsqy0t3B3ldcjy5195De
 W058RBnZRlY0vvguoWr3kVtoASeSZ1+TV2Ji3NgvulBxQKBJMDJ1lIe4V1iLtTywSsWw2UGAkMK
 TB80eyDSH21aj0KuDTB/iEAwsWA0ffbeDPeEyofZwE6dfz5zW/fSIUxIvzia6QsyX
X-Received: by 2002:a05:620a:cca:: with SMTP id
 b10mr4733783qkj.136.1620317159965; 
 Thu, 06 May 2021 09:05:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy5oZNS+YKpEWcgNqfNZvKUS0XfC3nDKmLEe7S6G5ZuMEI+nCw7qj5PI7r4fRRT/lbwlXx91A==
X-Received: by 2002:a05:620a:cca:: with SMTP id
 b10mr4733605qkj.136.1620317158129; 
 Thu, 06 May 2021 09:05:58 -0700 (PDT)
Received: from t490s.redhat.com
 (bras-base-toroon474qw-grc-72-184-145-4-219.dsl.bell.ca. [184.145.4.219])
 by smtp.gmail.com with ESMTPSA id y84sm2194131qkb.134.2021.05.06.09.05.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 May 2021 09:05:56 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 03/10] KVM: Create the KVMSlot dirty bitmap on flag changes
Date: Thu,  6 May 2021 12:05:42 -0400
Message-Id: <20210506160549.130416-4-peterx@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.69,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
index d335e1ec380..84272d18553 100644
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


