Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EFDA43CA14
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 14:49:20 +0200 (CEST)
Received: from localhost ([::1]:48902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfiMn-0002mD-3a
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 08:49:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mfiJl-0008GQ-5h
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 08:46:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59426)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mfiJi-00038D-2C
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 08:46:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635338765;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Icv29slOxUnH4zF0alx14tDkDXA6WVbCnInv3q9rhxo=;
 b=F6Y7vYnpghmnVkDHx4qNlYlGFU73hq90n+vIyesrfR6HZp+h/VH7qa24izjDGSjZokXpg4
 YrJ1pYtFa1kHP+RlBPbDL1xBCaOH/A8oEXd9JJYKAIkwW4sbcUmdSdhgur79ZWEFVE3ob8
 TG03yato1V+TxTM/sQVHd+aV2M4AyZU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-204-0G5tDUYzOYCytiLAiGMnOQ-1; Wed, 27 Oct 2021 08:46:02 -0400
X-MC-Unique: 0G5tDUYzOYCytiLAiGMnOQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C03FF802B52;
 Wed, 27 Oct 2021 12:46:00 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.193.176])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2E61419D9F;
 Wed, 27 Oct 2021 12:45:57 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 06/12] memory-device: Generalize
 memory_device_used_region_size()
Date: Wed, 27 Oct 2021 14:45:25 +0200
Message-Id: <20211027124531.57561-7-david@redhat.com>
In-Reply-To: <20211027124531.57561-1-david@redhat.com>
References: <20211027124531.57561-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Sebastien Boeuf <sebastien.boeuf@intel.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Paolo Bonzini <pbonzini@redhat.com>, Hui Zhu <teawater@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let's generalize traversal of all plugged memory devices to collect
information in the context of memory_device_check_addable() to prepare for
future changes.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 hw/mem/memory-device.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/hw/mem/memory-device.c b/hw/mem/memory-device.c
index 68a2c3dbcc..a915894819 100644
--- a/hw/mem/memory-device.c
+++ b/hw/mem/memory-device.c
@@ -50,20 +50,24 @@ static int memory_device_build_list(Object *obj, void *opaque)
     return 0;
 }
 
-static int memory_device_used_region_size(Object *obj, void *opaque)
+struct memory_devices_info {
+    uint64_t region_size;
+};
+
+static int memory_devices_collect_info(Object *obj, void *opaque)
 {
-    uint64_t *size = opaque;
+    struct memory_devices_info *i = opaque;
 
     if (object_dynamic_cast(obj, TYPE_MEMORY_DEVICE)) {
         const DeviceState *dev = DEVICE(obj);
         const MemoryDeviceState *md = MEMORY_DEVICE(obj);
 
         if (dev->realized) {
-            *size += memory_device_get_region_size(md, &error_abort);
+            i->region_size += memory_device_get_region_size(md, &error_abort);
         }
     }
 
-    object_child_foreach(obj, memory_device_used_region_size, opaque);
+    object_child_foreach(obj, memory_devices_collect_info, opaque);
     return 0;
 }
 
@@ -71,7 +75,7 @@ static void memory_device_check_addable(MachineState *ms, MemoryRegion *mr,
                                         Error **errp)
 {
     const uint64_t size = memory_region_size(mr);
-    uint64_t used_region_size = 0;
+    struct memory_devices_info info = {};
 
     /* we will need a new memory slot for kvm and vhost */
     if (kvm_enabled() && !kvm_get_free_memslots()) {
@@ -84,12 +88,12 @@ static void memory_device_check_addable(MachineState *ms, MemoryRegion *mr,
     }
 
     /* will we exceed the total amount of memory specified */
-    memory_device_used_region_size(OBJECT(ms), &used_region_size);
-    if (used_region_size + size < used_region_size ||
-        used_region_size + size > ms->maxram_size - ms->ram_size) {
+    memory_devices_collect_info(OBJECT(ms), &info);
+    if (info.region_size + size < info.region_size ||
+        info.region_size + size > ms->maxram_size - ms->ram_size) {
         error_setg(errp, "not enough space, currently 0x%" PRIx64
                    " in use of total space for memory devices 0x" RAM_ADDR_FMT,
-                   used_region_size, ms->maxram_size - ms->ram_size);
+                   info.region_size, ms->maxram_size - ms->ram_size);
         return;
     }
 
-- 
2.31.1


