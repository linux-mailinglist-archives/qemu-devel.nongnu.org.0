Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C45B578C1D
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Jul 2019 14:58:55 +0200 (CEST)
Received: from localhost ([::1]:51934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hs5Et-0004W6-23
	for lists+qemu-devel@lfdr.de; Mon, 29 Jul 2019 08:58:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38330)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <slp@redhat.com>) id 1hs5EA-00047c-26
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 08:58:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <slp@redhat.com>) id 1hs5E8-0005GG-1p
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 08:58:10 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38888)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <slp@redhat.com>) id 1hs5E7-0005FO-Qc
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 08:58:08 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id F33683082E51;
 Mon, 29 Jul 2019 12:58:05 +0000 (UTC)
Received: from dritchie.redhat.com (unknown [10.33.36.70])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 33D145D6A3;
 Mon, 29 Jul 2019 12:57:58 +0000 (UTC)
From: Sergio Lopez <slp@redhat.com>
To: mst@redhat.com
Date: Mon, 29 Jul 2019 14:57:55 +0200
Message-Id: <20190729125755.45008-1-slp@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Mon, 29 Jul 2019 12:58:06 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [RFC] virtio-mmio: implement modern (v2) personality
 (virtio-1)
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org,
 Sergio Lopez <slp@redhat.com>
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
 hw/virtio/virtio-mmio.c | 264 ++++++++++++++++++++++++++++++++++++++--
 1 file changed, 254 insertions(+), 10 deletions(-)

diff --git a/hw/virtio/virtio-mmio.c b/hw/virtio/virtio-mmio.c
index 97b7f35496..1da841336f 100644
--- a/hw/virtio/virtio-mmio.c
+++ b/hw/virtio/virtio-mmio.c
@@ -47,14 +47,24 @@
         OBJECT_CHECK(VirtIOMMIOProxy, (obj), TYPE_VIRTIO_MMIO)
=20
 #define VIRT_MAGIC 0x74726976 /* 'virt' */
-#define VIRT_VERSION 1
+#define VIRT_VERSION_LEGACY 1
+#define VIRT_VERSION_MODERN 2
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
+    bool modern;
     /* Guest accessible state needing migration and reset */
     uint32_t host_features_sel;
     uint32_t guest_features_sel;
@@ -62,6 +72,9 @@ typedef struct {
     /* virtio-bus */
     VirtioBusState bus;
     bool format_transport_address;
+    /* Fields only used for v2 (modern) devices */
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
+            if (proxy->modern) {
+                return VIRT_VERSION_MODERN;
+            } else {
+                return VIRT_VERSION_LEGACY;
+            }
         case VIRTIO_MMIO_VENDOR_ID:
             return VIRT_VENDOR;
         default:
@@ -146,14 +163,18 @@ static uint64_t virtio_mmio_read(void *opaque, hwad=
dr offset, unsigned size)
     case VIRTIO_MMIO_MAGIC_VALUE:
         return VIRT_MAGIC;
     case VIRTIO_MMIO_VERSION:
-        return VIRT_VERSION;
+        if (proxy->modern) {
+            return VIRT_VERSION_MODERN;
+        } else {
+            return VIRT_VERSION_LEGACY;
+        }
     case VIRTIO_MMIO_DEVICE_ID:
         return vdev->device_id;
     case VIRTIO_MMIO_VENDOR_ID:
         return VIRT_VENDOR;
     case VIRTIO_MMIO_DEVICE_FEATURES:
         if (proxy->host_features_sel) {
-            return 0;
+            return vdev->host_features >> 32;
         }
         return vdev->host_features;
     case VIRTIO_MMIO_QUEUE_NUM_MAX:
@@ -162,12 +183,34 @@ static uint64_t virtio_mmio_read(void *opaque, hwad=
dr offset, unsigned size)
         }
         return VIRTQUEUE_MAX_SIZE;
     case VIRTIO_MMIO_QUEUE_PFN:
+        if (proxy->modern) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: read from legacy register in modern mode\=
n",
+                          __func__);
+            return 0;
+        }
         return virtio_queue_get_addr(vdev, vdev->queue_sel)
             >> proxy->guest_page_shift;
+    case VIRTIO_MMIO_QUEUE_READY:
+        if (!proxy->modern) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: read from modern register in legacy mode\=
n",
+                          __func__);
+            return 0;
+        }
+        return proxy->vqs[vdev->queue_sel].enabled;
     case VIRTIO_MMIO_INTERRUPT_STATUS:
         return atomic_read(&vdev->isr);
     case VIRTIO_MMIO_STATUS:
         return vdev->status;
+    case VIRTIO_MMIO_CONFIG_GENERATION:
+        if (!proxy->modern) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: read from modern register in legacy mode\=
n",
+                          __func__);
+            return 0;
+        }
+        return vdev->generation;
     case VIRTIO_MMIO_DEVICE_FEATURES_SEL:
     case VIRTIO_MMIO_DRIVER_FEATURES:
     case VIRTIO_MMIO_DRIVER_FEATURES_SEL:
@@ -177,6 +220,12 @@ static uint64_t virtio_mmio_read(void *opaque, hwadd=
r offset, unsigned size)
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
                       "%s: read of write-only register\n",
                       __func__);
@@ -232,14 +281,26 @@ static void virtio_mmio_write(void *opaque, hwaddr =
offset, uint64_t value,
         proxy->host_features_sel =3D value;
         break;
     case VIRTIO_MMIO_DRIVER_FEATURES:
-        if (!proxy->guest_features_sel) {
+        if (proxy->modern) {
+            proxy->guest_features[proxy->guest_features_sel] =3D value;
+        } else if (!proxy->guest_features_sel) {
             virtio_set_features(vdev, value);
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
+        if (proxy->modern) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: write to legacy register in modern mode\n=
",
+                          __func__);
+            return;
+        }
         proxy->guest_page_shift =3D ctz32(value);
         if (proxy->guest_page_shift > 31) {
             proxy->guest_page_shift =3D 0;
@@ -253,15 +314,29 @@ static void virtio_mmio_write(void *opaque, hwaddr =
offset, uint64_t value,
         break;
     case VIRTIO_MMIO_QUEUE_NUM:
         trace_virtio_mmio_queue_write(value, VIRTQUEUE_MAX_SIZE);
-        virtio_queue_set_num(vdev, vdev->queue_sel, value);
-        /* Note: only call this function for legacy devices */
-        virtio_queue_update_rings(vdev, vdev->queue_sel);
+        if (proxy->modern) {
+            proxy->vqs[vdev->queue_sel].num =3D value;
+        } else {
+            virtio_queue_set_num(vdev, vdev->queue_sel, value);
+            virtio_queue_update_rings(vdev, vdev->queue_sel);
+        }
         break;
     case VIRTIO_MMIO_QUEUE_ALIGN:
-        /* Note: this is only valid for legacy devices */
+        if (proxy->modern) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: write to legacy register in modern mode\n=
",
+                          __func__);
+            return;
+        }
         virtio_queue_set_align(vdev, vdev->queue_sel, value);
         break;
     case VIRTIO_MMIO_QUEUE_PFN:
+        if (proxy->modern) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: write to legacy register in modern mode\n=
",
+                          __func__);
+            return;
+        }
         if (value =3D=3D 0) {
             virtio_reset(vdev);
         } else {
@@ -269,6 +344,24 @@ static void virtio_mmio_write(void *opaque, hwaddr o=
ffset, uint64_t value,
                                   value << proxy->guest_page_shift);
         }
         break;
+    case VIRTIO_MMIO_QUEUE_READY:
+        if (!proxy->modern) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: write to modern register in legacy mode\n=
",
+                          __func__);
+            return;
+        }
+        virtio_queue_set_num(vdev, vdev->queue_sel,
+                             proxy->vqs[vdev->queue_sel].num);
+        virtio_queue_set_rings(vdev, vdev->queue_sel,
+                       ((uint64_t)proxy->vqs[vdev->queue_sel].desc[1]) <=
< 32 |
+                       proxy->vqs[vdev->queue_sel].desc[0],
+                       ((uint64_t)proxy->vqs[vdev->queue_sel].avail[1]) =
<< 32 |
+                       proxy->vqs[vdev->queue_sel].avail[0],
+                       ((uint64_t)proxy->vqs[vdev->queue_sel].used[1]) <=
< 32 |
+                       proxy->vqs[vdev->queue_sel].used[0]);
+        proxy->vqs[vdev->queue_sel].enabled =3D 1;
+        break;
     case VIRTIO_MMIO_QUEUE_NOTIFY:
         if (value < VIRTIO_QUEUE_MAX) {
             virtio_queue_notify(vdev, value);
@@ -283,6 +376,12 @@ static void virtio_mmio_write(void *opaque, hwaddr o=
ffset, uint64_t value,
             virtio_mmio_stop_ioeventfd(proxy);
         }
=20
+        if (proxy->modern && (value & VIRTIO_CONFIG_S_FEATURES_OK)) {
+            virtio_set_features(vdev,
+                                ((uint64_t)proxy->guest_features[1]) << =
32 |
+                                proxy->guest_features[0]);
+        }
+
         virtio_set_status(vdev, value & 0xff);
=20
         if (value & VIRTIO_CONFIG_S_DRIVER_OK) {
@@ -293,6 +392,60 @@ static void virtio_mmio_write(void *opaque, hwaddr o=
ffset, uint64_t value,
             virtio_reset(vdev);
         }
         break;
+    case VIRTIO_MMIO_QUEUE_DESC_LOW:
+        if (!proxy->modern) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: write to legacy register in modern mode\n=
",
+                          __func__);
+            return;
+        }
+        proxy->vqs[vdev->queue_sel].desc[0] =3D value;
+        break;
+    case VIRTIO_MMIO_QUEUE_DESC_HIGH:
+        if (!proxy->modern) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: write to legacy register in modern mode\n=
",
+                          __func__);
+            return;
+        }
+        proxy->vqs[vdev->queue_sel].desc[1] =3D value;
+        break;
+    case VIRTIO_MMIO_QUEUE_AVAIL_LOW:
+        if (!proxy->modern) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: write to legacy register in modern mode\n=
",
+                          __func__);
+            return;
+        }
+        proxy->vqs[vdev->queue_sel].avail[0] =3D value;
+        break;
+    case VIRTIO_MMIO_QUEUE_AVAIL_HIGH:
+        if (!proxy->modern) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: write to legacy register in modern mode\n=
",
+                          __func__);
+            return;
+        }
+        proxy->vqs[vdev->queue_sel].avail[1] =3D value;
+        break;
+    case VIRTIO_MMIO_QUEUE_USED_LOW:
+        if (!proxy->modern) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: write to legacy register in modern mode\n=
",
+                          __func__);
+            return;
+        }
+        proxy->vqs[vdev->queue_sel].used[0] =3D value;
+        break;
+    case VIRTIO_MMIO_QUEUE_USED_HIGH:
+        if (!proxy->modern) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: write to legacy register in modern mode\n=
",
+                          __func__);
+            return;
+        }
+        proxy->vqs[vdev->queue_sel].used[1] =3D value;
+        break;
     case VIRTIO_MMIO_MAGIC_VALUE:
     case VIRTIO_MMIO_VERSION:
     case VIRTIO_MMIO_DEVICE_ID:
@@ -300,6 +453,7 @@ static void virtio_mmio_write(void *opaque, hwaddr of=
fset, uint64_t value,
     case VIRTIO_MMIO_DEVICE_FEATURES:
     case VIRTIO_MMIO_QUEUE_NUM_MAX:
     case VIRTIO_MMIO_INTERRUPT_STATUS:
+    case VIRTIO_MMIO_CONFIG_GENERATION:
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: write to readonly register\n",
                       __func__);
@@ -349,15 +503,90 @@ static void virtio_mmio_save_config(DeviceState *op=
aque, QEMUFile *f)
     qemu_put_be32(f, proxy->guest_page_shift);
 }
=20
+static const VMStateDescription vmstate_virtio_mmio_modern_queue_state =3D=
 {
+    .name =3D "virtio_mmio/modern_queue_state",
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
+static const VMStateDescription vmstate_virtio_mmio_modern_state_sub =3D=
 {
+    .name =3D "virtio_mmio/modern_state",
+    .version_id =3D 1,
+    .minimum_version_id =3D 1,
+    .fields =3D (VMStateField[]) {
+        VMSTATE_UINT32_ARRAY(guest_features, VirtIOMMIOProxy, 2),
+        VMSTATE_STRUCT_ARRAY(vqs, VirtIOMMIOProxy, VIRTIO_QUEUE_MAX, 0,
+                             vmstate_virtio_mmio_modern_queue_state,
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
+    .subsections =3D (const VMStateDescription*[]) {
+        &vmstate_virtio_mmio_modern_state_sub,
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
+    return proxy->modern;
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
+    if (proxy->modern) {
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
@@ -420,11 +649,22 @@ assign_error:
     return r;
 }
=20
+static void virtio_mmio_pre_plugged(DeviceState *d, Error **errp)
+{
+    VirtIOMMIOProxy *proxy =3D VIRTIO_MMIO(d);
+    VirtIODevice *vdev =3D virtio_bus_get_device(&proxy->bus);
+
+    if (proxy->modern) {
+        virtio_add_feature(&vdev->host_features, VIRTIO_F_VERSION_1);
+    }
+}
+
 /* virtio-mmio device */
=20
 static Property virtio_mmio_properties[] =3D {
     DEFINE_PROP_BOOL("format_transport_address", VirtIOMMIOProxy,
                      format_transport_address, true),
+    DEFINE_PROP_BOOL("modern", VirtIOMMIOProxy, modern, false),
     DEFINE_PROP_END_OF_LIST(),
 };
=20
@@ -508,9 +748,13 @@ static void virtio_mmio_bus_class_init(ObjectClass *=
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


