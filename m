Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7028C42BD45
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 12:41:07 +0200 (CEST)
Received: from localhost ([::1]:57864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mabh4-0007Vn-GH
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 06:41:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mabdy-0002cx-40
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 06:37:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41329)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mabdv-0000XB-Ee
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 06:37:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634121470;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cR7jsj4sT8SdKZLXHhxaONioj6cXcFsXdgOGCFcDfN8=;
 b=T9o6XMq89RYM8y9uHksTxj++EKvaHDBNhLatEESzhfhLOYn/Rx/uwhN9SlM2+9N6xWX8jy
 7JategU+vecnCXCis8Rr0ARft7w6nprMCoXtOkvYJw/IKnAmjVVURZI7KRaPC2Dy+v8qak
 vP8V7fOTPXrRCIM/QPZTZpCaKaQ2WS0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-79-n_8PDKCePwmwv9Jm79D1zw-1; Wed, 13 Oct 2021 06:37:49 -0400
X-MC-Unique: n_8PDKCePwmwv9Jm79D1zw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2E35118D6A35;
 Wed, 13 Oct 2021 10:37:48 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.194.27])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 593F55D9D5;
 Wed, 13 Oct 2021 10:36:44 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC 08/15] memory-device: Support memory devices that consume
 a variable number of memslots
Date: Wed, 13 Oct 2021 12:33:23 +0200
Message-Id: <20211013103330.26869-9-david@redhat.com>
In-Reply-To: <20211013103330.26869-1-david@redhat.com>
References: <20211013103330.26869-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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

We want to support memory devices that have a container as device memory
region, and (dynamically) map individual chunks into that container
resulting in multiple memslots getting consumed by such a device.

We already have one such device: NVDIMM. However, an NVDIMM also end up
consuming exactly one memslot.

The target use case will be virtio-mem, which will dynamically map
parts of a source RAM memory region into the container device region
using aliases, consuming one memslot per alias.

We need a way to query from a memory device:
* The currently used number memslots.
* The total number of memslots that might get used across device
  lifetime.

Expose some helper functions that will be used by vhost code to respect
the current memslot reservation when realizing vhost devices, and by
virtio-mem to dynamically figure out how many memslots it can use.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 hw/mem/memory-device.c         | 136 ++++++++++++++++++++++++++++++---
 include/hw/mem/memory-device.h |  32 ++++++++
 stubs/qmp_memory_device.c      |   5 ++
 3 files changed, 164 insertions(+), 9 deletions(-)

diff --git a/hw/mem/memory-device.c b/hw/mem/memory-device.c
index a915894819..5876c90a59 100644
--- a/hw/mem/memory-device.c
+++ b/hw/mem/memory-device.c
@@ -50,8 +50,28 @@ static int memory_device_build_list(Object *obj, void *opaque)
     return 0;
 }
 
+static unsigned int memory_device_get_used_memslots(const MemoryDeviceState *md)
+{
+    const MemoryDeviceClass *mdc = MEMORY_DEVICE_GET_CLASS(md);
+
+    if (!mdc->get_used_memslots)
+        return 1;
+    return mdc->get_used_memslots(md, &error_abort);
+}
+
+static unsigned int memory_device_get_memslots(const MemoryDeviceState *md)
+{
+    const MemoryDeviceClass *mdc = MEMORY_DEVICE_GET_CLASS(md);
+
+    if (!mdc->get_memslots)
+        return 1;
+    return mdc->get_memslots(md, &error_abort);
+}
+
 struct memory_devices_info {
     uint64_t region_size;
+    unsigned int used_memslots;
+    unsigned int reserved_memslots;
 };
 
 static int memory_devices_collect_info(Object *obj, void *opaque)
@@ -61,9 +81,15 @@ static int memory_devices_collect_info(Object *obj, void *opaque)
     if (object_dynamic_cast(obj, TYPE_MEMORY_DEVICE)) {
         const DeviceState *dev = DEVICE(obj);
         const MemoryDeviceState *md = MEMORY_DEVICE(obj);
+        unsigned int used, total;
 
         if (dev->realized) {
             i->region_size += memory_device_get_region_size(md, &error_abort);
+
+            used = memory_device_get_used_memslots(md);
+            total = memory_device_get_memslots(md);
+            i->used_memslots += used;
+            i->reserved_memslots += total - used;
         }
     }
 
@@ -71,24 +97,116 @@ static int memory_devices_collect_info(Object *obj, void *opaque)
     return 0;
 }
 
-static void memory_device_check_addable(MachineState *ms, MemoryRegion *mr,
-                                        Error **errp)
+/*
+ * Get the number of memslots that are reserved (not used yet but will get used
+ * dynamically in the future without further checks) by all memory devices.
+ */
+unsigned int memory_devices_get_reserved_memslots(void)
+{
+    struct memory_devices_info info = {};
+
+    object_child_foreach(qdev_get_machine(), memory_devices_collect_info, &info);
+    return info.reserved_memslots;
+}
+
+/*
+ * Calculate the maximum number of memslots using a heuristic a memory device
+ * with the given region size may used. Called before/while plugging and
+ * realizing a memory device that can determine the number of memslots to use
+ * dynamically depending on the actual number of available memslots.
+ */
+unsigned int memory_devices_calc_memslot_limit(uint64_t region_size)
+{
+    struct memory_devices_info info = {};
+    MachineState *ms = current_machine;
+    unsigned int total, free, limit;
+    double percent;
+
+    free = vhost_get_free_memslots();
+    if (kvm_enabled()) {
+        free = MIN(free, kvm_get_free_memslots());
+    }
+    object_child_foreach(OBJECT(ms), memory_devices_collect_info, &info);
+
+    /*
+     * Consider all memslots that are used+reserved by memory devices and
+     * can be used for memory devices. This leaves any memslots used for
+     * something else (e.g., initial memory) out of the picture.
+     */
+    total = info.used_memslots + info.reserved_memslots + free;
+
+    /*
+     * Cap the total to something reasonable for now. We don't want to have
+     * infinite memslots or max out the KVM limit ...
+     */
+    total = MIN(4096, total);
+    if (total > info.used_memslots + info.reserved_memslots) {
+        free = total - info.used_memslots + info.reserved_memslots;
+    } else {
+        free = 0;
+    }
+
+    /*
+     * Simple heuristic: equally distribute the total slots over the whole
+     * device region.
+     */
+    percent = (double)region_size / (ms->maxram_size - ms->ram_size);
+    limit = total * percent;
+
+    /*
+     * However, let's be conservative and prepare for some smaller devices
+     * that consume more memslots-per-byte. Only use 90% of the assigned
+     * percentage.
+     */
+    limit = 0.9 * limit;
+
+    /*
+     * In rare corner cases (especially, appearance of vhost devices after
+     * already plugging memory devices), we might still run into trouble.
+     * Let's try to leave 16 slots around "just in case".
+     */
+    if (limit > free) {
+        if (free > 16) {
+            free = free - 16;
+        } else {
+            free = 0;
+        }
+        limit = MIN(limit, free);
+    }
+    return !limit ? 1 : limit;
+}
+
+static void memory_device_check_addable(MachineState *ms, MemoryDeviceState *md,
+                                        MemoryRegion *mr, Error **errp)
 {
     const uint64_t size = memory_region_size(mr);
     struct memory_devices_info info = {};
+    unsigned int required, reserved;
+
+    memory_devices_collect_info(OBJECT(ms), &info);
+    reserved = info.reserved_memslots;
+    required = memory_device_get_memslots(md);
 
-    /* we will need a new memory slot for kvm and vhost */
-    if (kvm_enabled() && !kvm_get_free_memslots()) {
-        error_setg(errp, "hypervisor has no free memory slots left");
+    /*
+     * All memslots used by memory devices are already subtracted from
+     * the free memslots as reported by kvm and vhost. Memory devices that
+     * use multiple memslots are expected to take proper care (disabling
+     * merging of memory regions) such that used memslots don't end up
+     * actually consuming less right now and might consume more later.
+     */
+    if (kvm_enabled() && kvm_get_free_memslots() < reserved + required) {
+        error_setg(errp, "KVM does not have enough free memory slots left (%u vs. %u)",
+                   required, kvm_get_free_memslots() - reserved);
         return;
     }
-    if (!vhost_get_free_memslots()) {
-        error_setg(errp, "a used vhost backend has no free memory slots left");
+    if (vhost_get_free_memslots() < reserved + required) {
+        error_setg(errp,
+                   "a used vhost backend does not have enough free memory slots left (%u vs. %u)",
+                   required, vhost_get_free_memslots() - reserved);
         return;
     }
 
     /* will we exceed the total amount of memory specified */
-    memory_devices_collect_info(OBJECT(ms), &info);
     if (info.region_size + size < info.region_size ||
         info.region_size + size > ms->maxram_size - ms->ram_size) {
         error_setg(errp, "not enough space, currently 0x%" PRIx64
@@ -257,7 +375,7 @@ void memory_device_pre_plug(MemoryDeviceState *md, MachineState *ms,
         goto out;
     }
 
-    memory_device_check_addable(ms, mr, &local_err);
+    memory_device_check_addable(ms, md, mr, &local_err);
     if (local_err) {
         goto out;
     }
diff --git a/include/hw/mem/memory-device.h b/include/hw/mem/memory-device.h
index 48d2611fc5..fe4387438c 100644
--- a/include/hw/mem/memory-device.h
+++ b/include/hw/mem/memory-device.h
@@ -98,6 +98,36 @@ struct MemoryDeviceClass {
      */
     uint64_t (*get_min_alignment)(const MemoryDeviceState *md);
 
+    /*
+     * Optional: Return the number of used individual memslots (i.e.,
+     * individual RAM mappings) the device has created in the memory region of
+     * the device. The device has to make sure that memslots won't get merged
+     * internally (e.g,, by disabling merging of memory region aliases) if the
+     * memory region layout could allow for that.
+     *
+     * If this function is not implemented, we assume the device memory region
+     * is not a container and that there is exactly one memslot.
+     *
+     * Called when plugging the memory device or when iterating over
+     * all realized memory devices to calculate used/reserved/available
+     * memslots.
+     */
+    unsigned int (*get_used_memslots)(const MemoryDeviceState *md, Error **errp);
+
+    /*
+     * Optional: Return the total number of individual memslots
+     * (i.e., individual RAM mappings) the device may create in the the memory
+     * region of the device over its lifetime. The result must never change.
+     *
+     * If this function is not implemented, we assume the device memory region
+     * is not a container and that there will be exactly one memslot.
+     *
+     * Called when plugging the memory device or when iterating over
+     * all realized memory devices to calculate used/reserved/available
+     * memslots.
+     */
+    unsigned int (*get_memslots)(const MemoryDeviceState *md, Error **errp);
+
     /*
      * Translate the memory device into #MemoryDeviceInfo.
      */
@@ -113,5 +143,7 @@ void memory_device_plug(MemoryDeviceState *md, MachineState *ms);
 void memory_device_unplug(MemoryDeviceState *md, MachineState *ms);
 uint64_t memory_device_get_region_size(const MemoryDeviceState *md,
                                        Error **errp);
+unsigned int memory_devices_get_reserved_memslots(void);
+unsigned int memory_devices_calc_memslot_limit(uint64_t region_size);
 
 #endif
diff --git a/stubs/qmp_memory_device.c b/stubs/qmp_memory_device.c
index e75cac62dc..318a5d4187 100644
--- a/stubs/qmp_memory_device.c
+++ b/stubs/qmp_memory_device.c
@@ -10,3 +10,8 @@ uint64_t get_plugged_memory_size(void)
 {
     return (uint64_t)-1;
 }
+
+unsigned int memory_devices_get_reserved_memslots(void)
+{
+    return 0;
+}
-- 
2.31.1


