Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85CF45B360B
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Sep 2022 13:09:22 +0200 (CEST)
Received: from localhost ([::1]:44582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWbsu-0004NY-0Y
	for lists+qemu-devel@lfdr.de; Fri, 09 Sep 2022 07:09:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oWblX-0007wo-St
 for qemu-devel@nongnu.org; Fri, 09 Sep 2022 07:01:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oWblW-0004y3-1b
 for qemu-devel@nongnu.org; Fri, 09 Sep 2022 07:01:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662721301;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QZ7cp/F9ZhuoBQSl9KZ5nLiwALh3iP/kh0uBnlYquJs=;
 b=LTTDCzCq28iOae2oeTGk0TYVLUynOJ3+W1FxJQCJ34WwXxlhvqB1f/Hb+MtecOhI3zdeqE
 RJKLOGz/6tD6EQuUbUD/nqP6ndhlwYpgVgsPshFbnpMnERlWpDoHGTy3aZR8NYo9qV7Fz+
 01Y2iDZVKkM6ih4U3JqTpmhmP2cYPRE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-649-YxD6is4vPkuhfgtaIIw0EQ-1; Fri, 09 Sep 2022 07:01:37 -0400
X-MC-Unique: YxD6is4vPkuhfgtaIIw0EQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 86AE61C068D3;
 Fri,  9 Sep 2022 11:01:36 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 804962166B26;
 Fri,  9 Sep 2022 11:01:28 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>,
 Maxim Levitsky <mlevitsk@redhat.com>, kvm@vger.kernel.org,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [RFC PATCH 1/1] kvm/kvm-all.c: implement
 KVM_SET_USER_MEMORY_REGION_LIST ioctl
Date: Fri,  9 Sep 2022 07:00:34 -0400
Message-Id: <20220909110034.740282-2-eesposit@redhat.com>
In-Reply-To: <20220909110034.740282-1-eesposit@redhat.com>
References: <20220909110034.740282-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Instead of sending memslot updates in each callback, kvm listener
already takes care of sending them in the commit phase, as multiple
ioctls.

Using the new KVM_SET_USER_MEMORY_REGION_LIST, we just need a single
call containing all memory regions to update.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 accel/kvm/kvm-all.c | 25 ++++++++++---------------
 1 file changed, 10 insertions(+), 15 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 9780f3d2da..6a7f7b4567 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -1547,30 +1547,25 @@ static void kvm_commit(MemoryListener *listener)
     KVMMemoryListener *kml = container_of(listener, KVMMemoryListener,
                                           listener);
     KVMState *s = kvm_state;
-    int i;
+    int i, ret;
 
     for (i = 0; i < kml->mem_array.list->nent; i++) {
         struct kvm_userspace_memory_region_entry *mem;
-        int ret;
 
         mem = &kml->mem_array.list->entries[i];
 
-        /*
-         * Note that mem is struct kvm_userspace_memory_region_entry, while the
-         * kernel expects a kvm_userspace_memory_region, so it will currently
-         * ignore mem->invalidate_slot and mem->padding.
-         */
-        ret = kvm_vm_ioctl(s, KVM_SET_USER_MEMORY_REGION, mem);
-
         trace_kvm_set_user_memory(mem->slot, mem->flags, mem->guest_phys_addr,
                                   mem->memory_size, mem->userspace_addr, 0);
+    }
 
-        if (ret < 0) {
-            error_report("%s: KVM_SET_USER_MEMORY_REGION failed, slot=%d,"
-                         " start=0x%" PRIx64 ": %s",
-                         __func__, mem->slot,
-                         (uint64_t)mem->memory_size, strerror(errno));
-        }
+    ret = kvm_vm_ioctl(s, KVM_SET_USER_MEMORY_REGION_LIST, kml->mem_array.list);
+
+    if (ret < 0) {
+        error_report("%s: KVM_SET_USER_MEMORY_REGION_LIST failed, size=0x%"
+                     PRIx64 " flags=0x%" PRIx64 ": %s",
+                     __func__, (uint64_t)kml->mem_array.list->nent,
+                     (uint64_t)kml->mem_array.list->flags,
+                     strerror(errno));
     }
 
     kml->mem_array.list->nent = 0;
-- 
2.31.1


