Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A27075B31A3
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Sep 2022 10:26:16 +0200 (CEST)
Received: from localhost ([::1]:48182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWZL5-0001I5-8L
	for lists+qemu-devel@lfdr.de; Fri, 09 Sep 2022 04:26:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oWZ7M-00089q-Pg
 for qemu-devel@nongnu.org; Fri, 09 Sep 2022 04:12:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oWZ7J-0003Pn-Fx
 for qemu-devel@nongnu.org; Fri, 09 Sep 2022 04:12:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662711120;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WfbTGILIwnlqrhBy2hpfPOMOrZst7fDmliV6QGcqmGY=;
 b=iO1WsOFomZvJ6cfNamYUw1aYsosHVhwlQXw7sUIZHai+LZY4SSU48mA/xrbJ5aVA7pXJS1
 Ti1jPaxZvppM6pCnhFxnjXlqa6PFy8OY+Pk8mRaagobbQF7tdbz7r/HyN72rLYlivXxlLN
 4+yF8EWuFnYoSlwr0w3oIhL5EGgzZ60=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-462-0YNmnC_oO_m-mxQhTD3Adg-1; Fri, 09 Sep 2022 04:11:56 -0400
X-MC-Unique: 0YNmnC_oO_m-mxQhTD3Adg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 73129185A7A4;
 Fri,  9 Sep 2022 08:11:56 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2EB524011960;
 Fri,  9 Sep 2022 08:11:56 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Maxim Levitsky <mlevitsk@redhat.com>, kvm@vger.kernel.org,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [RFC PATCH v2 2/3] accel/kvm/kvm-all.c: pass
 kvm_userspace_memory_region_entry instead
Date: Fri,  9 Sep 2022 04:11:49 -0400
Message-Id: <20220909081150.709060-3-eesposit@redhat.com>
In-Reply-To: <20220909081150.709060-1-eesposit@redhat.com>
References: <20220909081150.709060-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
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

It won't change anything from the kernel side, but prepares the logic
for KVM_SET_USER_MEMORY_REGION_LIST ioctl, where all requests are sent
at once.

Because QEMU does not send any memslot MOVE request to KVM, simplify
mem.invalidate_slot logic to only detect DELETE requests.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 accel/kvm/kvm-all.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 645f0a249a..e9947ec18b 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -360,7 +360,7 @@ int kvm_physical_memory_addr_from_host(KVMState *s, void *ram,
 static int kvm_set_user_memory_region(KVMMemoryListener *kml, KVMSlot *slot, bool new)
 {
     KVMState *s = kvm_state;
-    struct kvm_userspace_memory_region mem;
+    struct kvm_userspace_memory_region_entry mem;
     int ret;
 
     mem.slot = slot->slot | (kml->as_id << 16);
@@ -372,12 +372,29 @@ static int kvm_set_user_memory_region(KVMMemoryListener *kml, KVMSlot *slot, boo
         /* Set the slot size to 0 before setting the slot to the desired
          * value. This is needed based on KVM commit 75d61fbc. */
         mem.memory_size = 0;
+        mem.invalidate_slot = 1;
+        /*
+         * Note that mem is struct kvm_userspace_memory_region_entry, while the
+         * kernel expects a kvm_userspace_memory_region, so it will currently
+         * ignore mem->invalidate_slot and mem->padding.
+         */
         ret = kvm_vm_ioctl(s, KVM_SET_USER_MEMORY_REGION, &mem);
         if (ret < 0) {
             goto err;
         }
     }
     mem.memory_size = slot->memory_size;
+    /*
+     * Invalidate if it's a kvm memslot MOVE or DELETE operation, but
+     * currently QEMU does not perform any memslot MOVE operation.
+     */
+    mem.invalidate_slot = slot->memory_size == 0;
+
+    /*
+     * Note that mem is struct kvm_userspace_memory_region_entry, while the
+     * kernel expects a kvm_userspace_memory_region, so it will currently
+     * ignore mem->invalidate_slot and mem->padding.
+     */
     ret = kvm_vm_ioctl(s, KVM_SET_USER_MEMORY_REGION, &mem);
     slot->old_flags = mem.flags;
 err:
-- 
2.31.1


