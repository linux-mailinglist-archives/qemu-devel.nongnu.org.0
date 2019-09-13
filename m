Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C07B1D12
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Sep 2019 14:08:46 +0200 (CEST)
Received: from localhost ([::1]:43170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i8kNZ-0001dA-P7
	for lists+qemu-devel@lfdr.de; Fri, 13 Sep 2019 08:08:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51802)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <slp@redhat.com>) id 1i8kMc-000193-D3
 for qemu-devel@nongnu.org; Fri, 13 Sep 2019 08:07:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <slp@redhat.com>) id 1i8kMa-000631-7I
 for qemu-devel@nongnu.org; Fri, 13 Sep 2019 08:07:46 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34344)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <slp@redhat.com>) id 1i8kMZ-00062o-Vc
 for qemu-devel@nongnu.org; Fri, 13 Sep 2019 08:07:44 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 244A48980F8;
 Fri, 13 Sep 2019 12:07:43 +0000 (UTC)
Received: from dritchie.redhat.com (unknown [10.33.36.15])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7B6285D712;
 Fri, 13 Sep 2019 12:07:35 +0000 (UTC)
From: Sergio Lopez <slp@redhat.com>
To: mst@redhat.com
Date: Fri, 13 Sep 2019 14:06:01 +0200
Message-Id: <20190913120559.40835-1-slp@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.67]); Fri, 13 Sep 2019 12:07:43 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v3] virtio-mmio: implement modern (v2)
 personality (virtio-1)
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
Cc: peter.maydell@linaro.org, Sergio Lopez <slp@redhat.com>, stefanha@gmail.com,
 cohuck@redhat.com, qemu-devel@nongnu.org, abologna@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement the modern (v2) personality, according to the VirtIO 1.0
specification.

Support for v2 among guests is not as widespread as it'd be
desirable. While the Linux driver has had it for a while, support is
missing, at least, from Tianocore EDK II, NetBSD and FreeBSD.

For this reason, the v2 personality is disabled, keeping the legacy
behavior as default. Machine types willing to use v2, can enable it
using MachineClass's compat_props.

Signed-off-by: Sergio Lopez <slp@redhat.com>
---
Changelog:

v3:
 - Use %HWADDR_PRIx instead of %x. (Stefan Hajnoczi)
 - Return 0 if host_features_sel > 0 for legacy mode. (Cornelia Huck)
 - Mask out legacy features in non-legacy mode. (Cornelia Huck)
 - Log an error in guest attempts to write guest_features with
   guest_features_sel > 0 in legacy mode. (Cornelia Huck)

v2:
 - Switch from RFC to PATCH.
 - Avoid the modern vs. legacy dichotomy. Use legacy or non-legacy
   instead. (Andrea Bolognani, Cornelia Huck)
 - Include the register offset in the warning messages. (Stefan
   Hajnoczi)
 - Fix device endianness for the non-legacy mode. (Michael S. Tsirkin)
 - Honor the specs in VIRTIO_MMIO_QUEUE_READY. (Michael S. Tsirkin)
---
 hw/virtio/virtio-mmio.c | 342 +++++++++++++++++++++++++++++++++++++---
 1 file changed, 319 insertions(+), 23 deletions(-)

diff --git a/hw/virtio/virtio-mmio.c b/hw/virtio/virtio-mmio.c
index 97b7f35496..3578ae37be 100644
--- a/hw/virtio/virtio-mmio.c
+++ b/hw/virtio/virtio-mmio.c
@@ -47,14 +47,24 @@
         OBJECT_CHECK(VirtIOMMIOProxy, (obj), TYPE_VIRTIO_MMIO)
=20
 #define VIRT_MAGIC 0x74726976 /* 'virt' */
-#define VIRT_VERSION 1
+#define VIRT_VERSION 2
+#define VIRT_VERSION_LEGACY 1
 #define VIRT_VENDOR 0x554D4551 /* 'QEMU' */
=20
+typedef struct VirtIOMMIOQueue {
+    uint16_t num;
+    bool enabled;
+    uint32_t desc[2];
+    uint32_t avail[2];
+    uint32_t used[2];
+} VirtIOMMIOQueue;
+
 typedef struct {
     /* Generic */
     SysBusDevice parent_obj;
     MemoryRegion iomem;
     qemu_irq irq;
+    bool legacy;
     /* Guest accessible state needing migration and reset */
     uint32_t host_features_sel;
     uint32_t guest_features_sel;
@@ -62,6 +72,9 @@ typedef struct {
     /* virtio-bus */
     VirtioBusState bus;
     bool format_transport_address;
+    /* Fields only used for non-legacy (v2) devices */
+    uint32_t guest_features[2];
+    VirtIOMMIOQueue vqs[VIRTIO_QUEUE_MAX];
 } VirtIOMMIOProxy;
=20
 static bool virtio_mmio_ioeventfd_enabled(DeviceState *d)
@@ -115,7 +128,11 @@ static uint64_t virtio_mmio_read(void *opaque, hwadd=
r offset, unsigned size)
         case VIRTIO_MMIO_MAGIC_VALUE:
             return VIRT_MAGIC;
         case VIRTIO_MMIO_VERSION:
-            return VIRT_VERSION;
+            if (proxy->legacy) {
+                return VIRT_VERSION_LEGACY;
+            } else {
+                return VIRT_VERSION;
+            }
         case VIRTIO_MMIO_VENDOR_ID:
             return VIRT_VENDOR;
         default:
@@ -146,28 +163,64 @@ static uint64_t virtio_mmio_read(void *opaque, hwad=
dr offset, unsigned size)
     case VIRTIO_MMIO_MAGIC_VALUE:
         return VIRT_MAGIC;
     case VIRTIO_MMIO_VERSION:
-        return VIRT_VERSION;
+        if (proxy->legacy) {
+            return VIRT_VERSION_LEGACY;
+        } else {
+            return VIRT_VERSION;
+        }
     case VIRTIO_MMIO_DEVICE_ID:
         return vdev->device_id;
     case VIRTIO_MMIO_VENDOR_ID:
         return VIRT_VENDOR;
     case VIRTIO_MMIO_DEVICE_FEATURES:
-        if (proxy->host_features_sel) {
-            return 0;
+        if (proxy->legacy) {
+            if (proxy->host_features_sel) {
+                return 0;
+            } else {
+                return vdev->host_features;
+            }
+        } else {
+            VirtioDeviceClass *vdc =3D VIRTIO_DEVICE_GET_CLASS(vdev);
+            return (vdev->host_features & ~vdc->legacy_features)
+                >> (32 * proxy->host_features_sel);
         }
-        return vdev->host_features;
     case VIRTIO_MMIO_QUEUE_NUM_MAX:
         if (!virtio_queue_get_num(vdev, vdev->queue_sel)) {
             return 0;
         }
         return VIRTQUEUE_MAX_SIZE;
     case VIRTIO_MMIO_QUEUE_PFN:
+        if (!proxy->legacy) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: read from legacy register (0x%"
+                          HWADDR_PRIx ") in non-legacy mode\n",
+                          __func__, offset);
+            return 0;
+        }
         return virtio_queue_get_addr(vdev, vdev->queue_sel)
             >> proxy->guest_page_shift;
+    case VIRTIO_MMIO_QUEUE_READY:
+        if (proxy->legacy) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: read from non-legacy register (0x%"
+                          HWADDR_PRIx ") in legacy mode\n",
+                          __func__, offset);
+            return 0;
+        }
+        return proxy->vqs[vdev->queue_sel].enabled;
     case VIRTIO_MMIO_INTERRUPT_STATUS:
         return atomic_read(&vdev->isr);
     case VIRTIO_MMIO_STATUS:
         return vdev->status;
+    case VIRTIO_MMIO_CONFIG_GENERATION:
+        if (proxy->legacy) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: read from non-legacy register (0x%"
+                          HWADDR_PRIx ") in legacy mode\n",
+                          __func__, offset);
+            return 0;
+        }
+        return vdev->generation;
     case VIRTIO_MMIO_DEVICE_FEATURES_SEL:
     case VIRTIO_MMIO_DRIVER_FEATURES:
     case VIRTIO_MMIO_DRIVER_FEATURES_SEL:
@@ -177,12 +230,20 @@ static uint64_t virtio_mmio_read(void *opaque, hwad=
dr offset, unsigned size)
     case VIRTIO_MMIO_QUEUE_ALIGN:
     case VIRTIO_MMIO_QUEUE_NOTIFY:
     case VIRTIO_MMIO_INTERRUPT_ACK:
+    case VIRTIO_MMIO_QUEUE_DESC_LOW:
+    case VIRTIO_MMIO_QUEUE_DESC_HIGH:
+    case VIRTIO_MMIO_QUEUE_AVAIL_LOW:
+    case VIRTIO_MMIO_QUEUE_AVAIL_HIGH:
+    case VIRTIO_MMIO_QUEUE_USED_LOW:
+    case VIRTIO_MMIO_QUEUE_USED_HIGH:
         qemu_log_mask(LOG_GUEST_ERROR,
-                      "%s: read of write-only register\n",
-                      __func__);
+                      "%s: read of write-only register (0x%" HWADDR_PRIx=
 ")\n",
+                      __func__, offset);
         return 0;
     default:
-        qemu_log_mask(LOG_GUEST_ERROR, "%s: bad register offset\n", __fu=
nc__);
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: bad register offset (0x%" HWADDR_PRIx ")\n",
+                      __func__, offset);
         return 0;
     }
     return 0;
@@ -229,17 +290,41 @@ static void virtio_mmio_write(void *opaque, hwaddr =
offset, uint64_t value,
     }
     switch (offset) {
     case VIRTIO_MMIO_DEVICE_FEATURES_SEL:
-        proxy->host_features_sel =3D value;
+        if (value) {
+            proxy->host_features_sel =3D 1;
+        } else {
+            proxy->host_features_sel =3D 0;
+        }
         break;
     case VIRTIO_MMIO_DRIVER_FEATURES:
-        if (!proxy->guest_features_sel) {
-            virtio_set_features(vdev, value);
+        if (proxy->legacy) {
+            if (proxy->guest_features_sel) {
+                qemu_log_mask(LOG_GUEST_ERROR,
+                              "%s: attempt to write guest features with =
"
+                              "guest_features_sel > 0 in legacy mode\n",
+                              __func__);
+            } else {
+                virtio_set_features(vdev, value);
+            }
+        } else {
+            proxy->guest_features[proxy->guest_features_sel] =3D value;
         }
         break;
     case VIRTIO_MMIO_DRIVER_FEATURES_SEL:
-        proxy->guest_features_sel =3D value;
+        if (value) {
+            proxy->guest_features_sel =3D 1;
+        } else {
+            proxy->guest_features_sel =3D 0;
+        }
         break;
     case VIRTIO_MMIO_GUEST_PAGE_SIZE:
+        if (!proxy->legacy) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: write to legacy register (0x%"
+                          HWADDR_PRIx ") in non-legacy mode\n",
+                          __func__, offset);
+            return;
+        }
         proxy->guest_page_shift =3D ctz32(value);
         if (proxy->guest_page_shift > 31) {
             proxy->guest_page_shift =3D 0;
@@ -253,15 +338,31 @@ static void virtio_mmio_write(void *opaque, hwaddr =
offset, uint64_t value,
         break;
     case VIRTIO_MMIO_QUEUE_NUM:
         trace_virtio_mmio_queue_write(value, VIRTQUEUE_MAX_SIZE);
-        virtio_queue_set_num(vdev, vdev->queue_sel, value);
-        /* Note: only call this function for legacy devices */
-        virtio_queue_update_rings(vdev, vdev->queue_sel);
+        if (proxy->legacy) {
+            virtio_queue_set_num(vdev, vdev->queue_sel, value);
+            virtio_queue_update_rings(vdev, vdev->queue_sel);
+        } else {
+            proxy->vqs[vdev->queue_sel].num =3D value;
+        }
         break;
     case VIRTIO_MMIO_QUEUE_ALIGN:
-        /* Note: this is only valid for legacy devices */
+        if (!proxy->legacy) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: write to legacy register (0x%"
+                          HWADDR_PRIx ") in non-legacy mode\n",
+                          __func__, offset);
+            return;
+        }
         virtio_queue_set_align(vdev, vdev->queue_sel, value);
         break;
     case VIRTIO_MMIO_QUEUE_PFN:
+        if (!proxy->legacy) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: write to legacy register (0x%"
+                          HWADDR_PRIx ") in non-legacy mode\n",
+                          __func__, offset);
+            return;
+        }
         if (value =3D=3D 0) {
             virtio_reset(vdev);
         } else {
@@ -269,6 +370,29 @@ static void virtio_mmio_write(void *opaque, hwaddr o=
ffset, uint64_t value,
                                   value << proxy->guest_page_shift);
         }
         break;
+    case VIRTIO_MMIO_QUEUE_READY:
+        if (proxy->legacy) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: write to non-legacy register (0x%"
+                          HWADDR_PRIx ") in legacy mode\n",
+                          __func__, offset);
+            return;
+        }
+        if (value) {
+            virtio_queue_set_num(vdev, vdev->queue_sel,
+                                 proxy->vqs[vdev->queue_sel].num);
+            virtio_queue_set_rings(vdev, vdev->queue_sel,
+                ((uint64_t)proxy->vqs[vdev->queue_sel].desc[1]) << 32 |
+                proxy->vqs[vdev->queue_sel].desc[0],
+                ((uint64_t)proxy->vqs[vdev->queue_sel].avail[1]) << 32 |
+                proxy->vqs[vdev->queue_sel].avail[0],
+                ((uint64_t)proxy->vqs[vdev->queue_sel].used[1]) << 32 |
+                proxy->vqs[vdev->queue_sel].used[0]);
+            proxy->vqs[vdev->queue_sel].enabled =3D 1;
+        } else {
+            proxy->vqs[vdev->queue_sel].enabled =3D 0;
+        }
+        break;
     case VIRTIO_MMIO_QUEUE_NOTIFY:
         if (value < VIRTIO_QUEUE_MAX) {
             virtio_queue_notify(vdev, value);
@@ -283,6 +407,12 @@ static void virtio_mmio_write(void *opaque, hwaddr o=
ffset, uint64_t value,
             virtio_mmio_stop_ioeventfd(proxy);
         }
=20
+        if (!proxy->legacy && (value & VIRTIO_CONFIG_S_FEATURES_OK)) {
+            virtio_set_features(vdev,
+                                ((uint64_t)proxy->guest_features[1]) << =
32 |
+                                proxy->guest_features[0]);
+        }
+
         virtio_set_status(vdev, value & 0xff);
=20
         if (value & VIRTIO_CONFIG_S_DRIVER_OK) {
@@ -293,6 +423,66 @@ static void virtio_mmio_write(void *opaque, hwaddr o=
ffset, uint64_t value,
             virtio_reset(vdev);
         }
         break;
+    case VIRTIO_MMIO_QUEUE_DESC_LOW:
+        if (proxy->legacy) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: write to non-legacy register (0x%"
+                          HWADDR_PRIx ") in legacy mode\n",
+                          __func__, offset);
+            return;
+        }
+        proxy->vqs[vdev->queue_sel].desc[0] =3D value;
+        break;
+    case VIRTIO_MMIO_QUEUE_DESC_HIGH:
+        if (proxy->legacy) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: write to non-legacy register (0x%"
+                          HWADDR_PRIx ") in legacy mode\n",
+                          __func__, offset);
+            return;
+        }
+        proxy->vqs[vdev->queue_sel].desc[1] =3D value;
+        break;
+    case VIRTIO_MMIO_QUEUE_AVAIL_LOW:
+        if (proxy->legacy) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: write to non-legacy register (0x%"
+                          HWADDR_PRIx ") in legacy mode\n",
+                          __func__, offset);
+            return;
+        }
+        proxy->vqs[vdev->queue_sel].avail[0] =3D value;
+        break;
+    case VIRTIO_MMIO_QUEUE_AVAIL_HIGH:
+        if (proxy->legacy) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: write to non-legacy register (0x%"
+                          HWADDR_PRIx ") in legacy mode\n",
+                          __func__, offset);
+            return;
+        }
+        proxy->vqs[vdev->queue_sel].avail[1] =3D value;
+        break;
+    case VIRTIO_MMIO_QUEUE_USED_LOW:
+        if (proxy->legacy) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: write to non-legacy register (0x%"
+                          HWADDR_PRIx ") in legacy mode\n",
+                          __func__, offset);
+            return;
+        }
+        proxy->vqs[vdev->queue_sel].used[0] =3D value;
+        break;
+    case VIRTIO_MMIO_QUEUE_USED_HIGH:
+        if (proxy->legacy) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: write to non-legacy register (0x%"
+                          HWADDR_PRIx ") in legacy mode\n",
+                          __func__, offset);
+            return;
+        }
+        proxy->vqs[vdev->queue_sel].used[1] =3D value;
+        break;
     case VIRTIO_MMIO_MAGIC_VALUE:
     case VIRTIO_MMIO_VERSION:
     case VIRTIO_MMIO_DEVICE_ID:
@@ -300,22 +490,31 @@ static void virtio_mmio_write(void *opaque, hwaddr =
offset, uint64_t value,
     case VIRTIO_MMIO_DEVICE_FEATURES:
     case VIRTIO_MMIO_QUEUE_NUM_MAX:
     case VIRTIO_MMIO_INTERRUPT_STATUS:
+    case VIRTIO_MMIO_CONFIG_GENERATION:
         qemu_log_mask(LOG_GUEST_ERROR,
-                      "%s: write to readonly register\n",
-                      __func__);
+                      "%s: write to read-only register (0x%" HWADDR_PRIx=
 ")\n",
+                      __func__, offset);
         break;
=20
     default:
-        qemu_log_mask(LOG_GUEST_ERROR, "%s: bad register offset\n", __fu=
nc__);
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: bad register offset (0x%" HWADDR_PRIx ")\n",
+                      __func__, offset);
     }
 }
=20
-static const MemoryRegionOps virtio_mem_ops =3D {
+static const MemoryRegionOps virtio_legacy_mem_ops =3D {
     .read =3D virtio_mmio_read,
     .write =3D virtio_mmio_write,
     .endianness =3D DEVICE_NATIVE_ENDIAN,
 };
=20
+static const MemoryRegionOps virtio_mem_ops =3D {
+    .read =3D virtio_mmio_read,
+    .write =3D virtio_mmio_write,
+    .endianness =3D DEVICE_LITTLE_ENDIAN,
+};
+
 static void virtio_mmio_update_irq(DeviceState *opaque, uint16_t vector)
 {
     VirtIOMMIOProxy *proxy =3D VIRTIO_MMIO(opaque);
@@ -349,15 +548,90 @@ static void virtio_mmio_save_config(DeviceState *op=
aque, QEMUFile *f)
     qemu_put_be32(f, proxy->guest_page_shift);
 }
=20
+static const VMStateDescription vmstate_virtio_mmio_queue_state =3D {
+    .name =3D "virtio_mmio/queue_state",
+    .version_id =3D 1,
+    .minimum_version_id =3D 1,
+    .fields =3D (VMStateField[]) {
+        VMSTATE_UINT16(num, VirtIOMMIOQueue),
+        VMSTATE_BOOL(enabled, VirtIOMMIOQueue),
+        VMSTATE_UINT32_ARRAY(desc, VirtIOMMIOQueue, 2),
+        VMSTATE_UINT32_ARRAY(avail, VirtIOMMIOQueue, 2),
+        VMSTATE_UINT32_ARRAY(used, VirtIOMMIOQueue, 2),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static const VMStateDescription vmstate_virtio_mmio_state_sub =3D {
+    .name =3D "virtio_mmio/state",
+    .version_id =3D 1,
+    .minimum_version_id =3D 1,
+    .fields =3D (VMStateField[]) {
+        VMSTATE_UINT32_ARRAY(guest_features, VirtIOMMIOProxy, 2),
+        VMSTATE_STRUCT_ARRAY(vqs, VirtIOMMIOProxy, VIRTIO_QUEUE_MAX, 0,
+                             vmstate_virtio_mmio_queue_state,
+                             VirtIOMMIOQueue),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static const VMStateDescription vmstate_virtio_mmio =3D {
+    .name =3D "virtio_mmio",
+    .version_id =3D 1,
+    .minimum_version_id =3D 1,
+    .minimum_version_id_old =3D 1,
+    .fields =3D (VMStateField[]) {
+        VMSTATE_END_OF_LIST()
+    },
+    .subsections =3D (const VMStateDescription * []) {
+        &vmstate_virtio_mmio_state_sub,
+        NULL
+    }
+};
+
+static void virtio_mmio_save_extra_state(DeviceState *opaque, QEMUFile *=
f)
+{
+    VirtIOMMIOProxy *proxy =3D VIRTIO_MMIO(opaque);
+
+    vmstate_save_state(f, &vmstate_virtio_mmio, proxy, NULL);
+}
+
+static int virtio_mmio_load_extra_state(DeviceState *opaque, QEMUFile *f=
)
+{
+    VirtIOMMIOProxy *proxy =3D VIRTIO_MMIO(opaque);
+
+    return vmstate_load_state(f, &vmstate_virtio_mmio, proxy, 1);
+}
+
+static bool virtio_mmio_has_extra_state(DeviceState *opaque)
+{
+    VirtIOMMIOProxy *proxy =3D VIRTIO_MMIO(opaque);
+
+    return !proxy->legacy;
+}
+
 static void virtio_mmio_reset(DeviceState *d)
 {
     VirtIOMMIOProxy *proxy =3D VIRTIO_MMIO(d);
+    int i;
=20
     virtio_mmio_stop_ioeventfd(proxy);
     virtio_bus_reset(&proxy->bus);
     proxy->host_features_sel =3D 0;
     proxy->guest_features_sel =3D 0;
     proxy->guest_page_shift =3D 0;
+
+    if (!proxy->legacy) {
+        proxy->guest_features[0] =3D proxy->guest_features[1] =3D 0;
+
+        for (i =3D 0; i < VIRTIO_QUEUE_MAX; i++) {
+            proxy->vqs[i].enabled =3D 0;
+            proxy->vqs[i].num =3D 0;
+            proxy->vqs[i].desc[0] =3D proxy->vqs[i].desc[1] =3D 0;
+            proxy->vqs[i].avail[0] =3D proxy->vqs[i].avail[1] =3D 0;
+            proxy->vqs[i].used[0] =3D proxy->vqs[i].used[1] =3D 0;
+        }
+    }
 }
=20
 static int virtio_mmio_set_guest_notifier(DeviceState *d, int n, bool as=
sign,
@@ -420,11 +694,22 @@ assign_error:
     return r;
 }
=20
+static void virtio_mmio_pre_plugged(DeviceState *d, Error **errp)
+{
+    VirtIOMMIOProxy *proxy =3D VIRTIO_MMIO(d);
+    VirtIODevice *vdev =3D virtio_bus_get_device(&proxy->bus);
+
+    if (!proxy->legacy) {
+        virtio_add_feature(&vdev->host_features, VIRTIO_F_VERSION_1);
+    }
+}
+
 /* virtio-mmio device */
=20
 static Property virtio_mmio_properties[] =3D {
     DEFINE_PROP_BOOL("format_transport_address", VirtIOMMIOProxy,
                      format_transport_address, true),
+    DEFINE_PROP_BOOL("force-legacy", VirtIOMMIOProxy, legacy, true),
     DEFINE_PROP_END_OF_LIST(),
 };
=20
@@ -436,8 +721,15 @@ static void virtio_mmio_realizefn(DeviceState *d, Er=
ror **errp)
     qbus_create_inplace(&proxy->bus, sizeof(proxy->bus), TYPE_VIRTIO_MMI=
O_BUS,
                         d, NULL);
     sysbus_init_irq(sbd, &proxy->irq);
-    memory_region_init_io(&proxy->iomem, OBJECT(d), &virtio_mem_ops, pro=
xy,
-                          TYPE_VIRTIO_MMIO, 0x200);
+    if (proxy->legacy) {
+        memory_region_init_io(&proxy->iomem, OBJECT(d),
+                              &virtio_legacy_mem_ops, proxy,
+                              TYPE_VIRTIO_MMIO, 0x200);
+    } else {
+        memory_region_init_io(&proxy->iomem, OBJECT(d),
+                              &virtio_mem_ops, proxy,
+                              TYPE_VIRTIO_MMIO, 0x200);
+    }
     sysbus_init_mmio(sbd, &proxy->iomem);
 }
=20
@@ -508,9 +800,13 @@ static void virtio_mmio_bus_class_init(ObjectClass *=
klass, void *data)
     k->notify =3D virtio_mmio_update_irq;
     k->save_config =3D virtio_mmio_save_config;
     k->load_config =3D virtio_mmio_load_config;
+    k->save_extra_state =3D virtio_mmio_save_extra_state;
+    k->load_extra_state =3D virtio_mmio_load_extra_state;
+    k->has_extra_state =3D virtio_mmio_has_extra_state;
     k->set_guest_notifiers =3D virtio_mmio_set_guest_notifiers;
     k->ioeventfd_enabled =3D virtio_mmio_ioeventfd_enabled;
     k->ioeventfd_assign =3D virtio_mmio_ioeventfd_assign;
+    k->pre_plugged =3D virtio_mmio_pre_plugged;
     k->has_variable_vring_alignment =3D true;
     bus_class->max_dev =3D 1;
     bus_class->get_dev_path =3D virtio_mmio_bus_get_dev_path;
--=20
2.21.0


