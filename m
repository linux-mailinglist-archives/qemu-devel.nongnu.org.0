Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 413FB42BD49
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 12:41:55 +0200 (CEST)
Received: from localhost ([::1]:60536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mabhq-0000ts-AV
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 06:41:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mabcx-0000ye-Ad
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 06:36:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44613)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mabcv-000898-4s
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 06:36:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634121408;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ih+jDEDdCSReJb44DrIvYsF7h99Td6g1C16k8E/cins=;
 b=V8O9z058xXLaqyzZq0xxnpVTk7EDiNRU8sp4czzBpXVM56ypSgvgfSPeIAMhqMUb3iZJeV
 1/NnAJY0fxzqYXn/BTS+kDC1l0VReKPBdGCCzd001z3c9YT75pSp8uu4sQFLhUnnYhE/KQ
 U3gRpXWmdIS6RcZASLaGIjBG/QA3YUU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-500-lfpmDYmLNYu6Z_BvezUuGw-1; Wed, 13 Oct 2021 06:36:45 -0400
X-MC-Unique: lfpmDYmLNYu6Z_BvezUuGw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EC63518D6A38;
 Wed, 13 Oct 2021 10:36:43 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.194.27])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ABCED5D9D5;
 Wed, 13 Oct 2021 10:35:46 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC 07/15] memory-device: Generalize
 memory_device_used_region_size()
Date: Wed, 13 Oct 2021 12:33:22 +0200
Message-Id: <20211013103330.26869-8-david@redhat.com>
In-Reply-To: <20211013103330.26869-1-david@redhat.com>
References: <20211013103330.26869-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let's generalize traversal of all plugged memory devices to collect
information to prepare for future changes.

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


