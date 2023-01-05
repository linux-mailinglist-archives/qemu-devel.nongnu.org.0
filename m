Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 334A265E80A
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 10:40:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDMLq-0002eM-8o; Thu, 05 Jan 2023 04:15:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pDMLk-0002Wt-6r
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 04:15:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pDMLg-0007BT-SY
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 04:15:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672910144;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8rdjip+25b1dwiqpkqVWxqDvIT7eKP5F+F/OwUaW8Q0=;
 b=O7veVVb437OnACdA0auaR1aDEI0cPvzGfexs4/cx+mPlpnAEFb1nxEkPsJGH8x10eIonDN
 +G4zhebAMDKDasX+IJZwSorEfZ/cKyL/wSpSlrkEDhfxKwBMcJHF/TvXVEoy1W1ZOBcKk0
 NfuSSrf1IrThPZwFLCC1vNKThAr9HOQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-170-te4Zt1DOPReUXqlICbzfOw-1; Thu, 05 Jan 2023 04:15:43 -0500
X-MC-Unique: te4Zt1DOPReUXqlICbzfOw-1
Received: by mail-wr1-f71.google.com with SMTP id
 g18-20020adfa492000000b0027174820fdbso4531335wrb.4
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 01:15:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8rdjip+25b1dwiqpkqVWxqDvIT7eKP5F+F/OwUaW8Q0=;
 b=njH5K6+9ymZjq2lSxWNCL3h5Dvd3Ni5PuAdyZYo1ArraBE6tt1wqRAChudokzJCQdP
 PR2ZsIgAhf5x5LaA5xTN7rcYRWyuHsQ5fF9oBUIc+3jH3Q27Gx5V6SuzAaGcOOFjdUQr
 Xp9TT4urqcj4uKrNi9n17vKsKvxoIOsoXGsSe/dkqSqpiZbCMTWeHDtTVLVktA2WzcZJ
 9PJtWmwdgha3Mi1Qj9eolIdL4u/l3s7OR4qxPVtVO3fhPT9SOpd34ApJmLQJxVyDgVhN
 P+4hwNTmKp/DO932C7J68ewZuCT0X7gqkVp40DiFGzY8jZphyUnc+rbk/62Wuudzcp+w
 l4ow==
X-Gm-Message-State: AFqh2krou5a6pOrK7rD5ySZ+gX+4+YxMioTBrIcqk03fwBqvDzzBncPy
 KHBTPK6apxFjKAgc0j+pmzADShr2a+rjeXfqcZ8neK7WZ2Ml7pggsfpuEcZBVjucMKHIqgep8Bp
 l141ycTIsjJMZXJV6lVbo1d9iHDAdWioobX6TDTO50hQ76a8gXp7/tyh2bfBR
X-Received: by 2002:a05:600c:1ca5:b0:3d1:d746:7bca with SMTP id
 k37-20020a05600c1ca500b003d1d7467bcamr36003033wms.4.1672910141291; 
 Thu, 05 Jan 2023 01:15:41 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvctaPvdiF1skO622aNTjIsQA8k9BhYPEj1U7Dyp8YL8oo3f+CqS6l3pdZ0Pi4TqVSTUvdEbA==
X-Received: by 2002:a05:600c:1ca5:b0:3d1:d746:7bca with SMTP id
 k37-20020a05600c1ca500b003d1d7467bcamr36003012wms.4.1672910140932; 
 Thu, 05 Jan 2023 01:15:40 -0800 (PST)
Received: from redhat.com ([2.52.151.85]) by smtp.gmail.com with ESMTPSA id
 g19-20020a05600c4ed300b003d978f8f255sm2371959wmq.27.2023.01.05.01.15.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 01:15:40 -0800 (PST)
Date: Thu, 5 Jan 2023 04:15:38 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jonah Palmer <jonah.palmer@oracle.com>
Subject: [PULL 26/51] hw/virtio: Extract QMP QOM-specific functions to
 virtio-qmp.c
Message-ID: <20230105091310.263867-27-mst@redhat.com>
References: <20230105091310.263867-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230105091310.263867-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Philippe Mathieu-Daudé <philmd@linaro.org>

virtio.c is big enough, extract more QMP related code to virtio-qmp.c.
To do so, expose qmp_find_virtio_device() and declar virtio_list in
the internal virtio-qmp.h header.

Note we have to leave qmp_x_query_virtio_queue_status() and
qmp_x_query_virtio_queue_element(), because they access VirtQueue
internal fields, and VirtQueue is only declared within virtio.c.

Suggested-by: Jonah Palmer <jonah.palmer@oracle.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20221222080005.27616-3-philmd@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/virtio-qmp.h |   9 ++
 hw/virtio/virtio-qmp.c | 192 ++++++++++++++++++++++++++++++++++++++++-
 hw/virtio/virtio.c     | 191 +---------------------------------------
 3 files changed, 201 insertions(+), 191 deletions(-)

diff --git a/hw/virtio/virtio-qmp.h b/hw/virtio/virtio-qmp.h
index 075fc27030..59681082e5 100644
--- a/hw/virtio/virtio-qmp.h
+++ b/hw/virtio/virtio-qmp.h
@@ -12,7 +12,16 @@
 #define HW_VIRTIO_QMP_H
 
 #include "qapi/qapi-types-virtio.h"
+#include "hw/virtio/virtio.h"
 
+#include "qemu/queue.h"
+
+typedef QTAILQ_HEAD(QmpVirtIODeviceList, VirtIODevice) QmpVirtIODeviceList;
+
+/* QAPI list of realized VirtIODevices */
+extern QmpVirtIODeviceList virtio_list;
+
+VirtIODevice *qmp_find_virtio_device(const char *path);
 VirtioDeviceStatus *qmp_decode_status(uint8_t bitmap);
 VhostDeviceProtocols *qmp_decode_protocols(uint64_t bitmap);
 VirtioDeviceFeatures *qmp_decode_features(uint16_t device_id, uint64_t bitmap);
diff --git a/hw/virtio/virtio-qmp.c b/hw/virtio/virtio-qmp.c
index 8e7282658f..e4d4bece2d 100644
--- a/hw/virtio/virtio-qmp.c
+++ b/hw/virtio/virtio-qmp.c
@@ -10,9 +10,14 @@
  */
 
 #include "qemu/osdep.h"
-#include "hw/virtio/virtio.h"
 #include "virtio-qmp.h"
 
+#include "qapi/error.h"
+#include "qapi/qapi-commands-virtio.h"
+#include "qapi/qapi-commands-qom.h"
+#include "qapi/qmp/qobject.h"
+#include "qapi/qmp/qjson.h"
+
 #include "standard-headers/linux/virtio_ids.h"
 #include "standard-headers/linux/vhost_types.h"
 #include "standard-headers/linux/virtio_blk.h"
@@ -657,3 +662,188 @@ VirtioDeviceFeatures *qmp_decode_features(uint16_t device_id, uint64_t bitmap)
 
     return features;
 }
+
+VirtioInfoList *qmp_x_query_virtio(Error **errp)
+{
+    VirtioInfoList *list = NULL;
+    VirtioInfoList *node;
+    VirtIODevice *vdev;
+
+    QTAILQ_FOREACH(vdev, &virtio_list, next) {
+        DeviceState *dev = DEVICE(vdev);
+        Error *err = NULL;
+        QObject *obj = qmp_qom_get(dev->canonical_path, "realized", &err);
+
+        if (err == NULL) {
+            GString *is_realized = qobject_to_json_pretty(obj, true);
+            /* virtio device is NOT realized, remove it from list */
+            if (!strncmp(is_realized->str, "false", 4)) {
+                QTAILQ_REMOVE(&virtio_list, vdev, next);
+            } else {
+                node = g_new0(VirtioInfoList, 1);
+                node->value = g_new(VirtioInfo, 1);
+                node->value->path = g_strdup(dev->canonical_path);
+                node->value->name = g_strdup(vdev->name);
+                QAPI_LIST_PREPEND(list, node->value);
+            }
+           g_string_free(is_realized, true);
+        }
+        qobject_unref(obj);
+    }
+
+    return list;
+}
+
+VirtIODevice *qmp_find_virtio_device(const char *path)
+{
+    VirtIODevice *vdev;
+
+    QTAILQ_FOREACH(vdev, &virtio_list, next) {
+        DeviceState *dev = DEVICE(vdev);
+
+        if (strcmp(dev->canonical_path, path) != 0) {
+            continue;
+        }
+
+        Error *err = NULL;
+        QObject *obj = qmp_qom_get(dev->canonical_path, "realized", &err);
+        if (err == NULL) {
+            GString *is_realized = qobject_to_json_pretty(obj, true);
+            /* virtio device is NOT realized, remove it from list */
+            if (!strncmp(is_realized->str, "false", 4)) {
+                g_string_free(is_realized, true);
+                qobject_unref(obj);
+                QTAILQ_REMOVE(&virtio_list, vdev, next);
+                return NULL;
+            }
+            g_string_free(is_realized, true);
+        } else {
+            /* virtio device doesn't exist in QOM tree */
+            QTAILQ_REMOVE(&virtio_list, vdev, next);
+            qobject_unref(obj);
+            return NULL;
+        }
+        /* device exists in QOM tree & is realized */
+        qobject_unref(obj);
+        return vdev;
+    }
+    return NULL;
+}
+
+VirtioStatus *qmp_x_query_virtio_status(const char *path, Error **errp)
+{
+    VirtIODevice *vdev;
+    VirtioStatus *status;
+
+    vdev = qmp_find_virtio_device(path);
+    if (vdev == NULL) {
+        error_setg(errp, "Path %s is not a VirtIODevice", path);
+        return NULL;
+    }
+
+    status = g_new0(VirtioStatus, 1);
+    status->name = g_strdup(vdev->name);
+    status->device_id = vdev->device_id;
+    status->vhost_started = vdev->vhost_started;
+    status->guest_features = qmp_decode_features(vdev->device_id,
+                                                 vdev->guest_features);
+    status->host_features = qmp_decode_features(vdev->device_id,
+                                                vdev->host_features);
+    status->backend_features = qmp_decode_features(vdev->device_id,
+                                                   vdev->backend_features);
+
+    switch (vdev->device_endian) {
+    case VIRTIO_DEVICE_ENDIAN_LITTLE:
+        status->device_endian = g_strdup("little");
+        break;
+    case VIRTIO_DEVICE_ENDIAN_BIG:
+        status->device_endian = g_strdup("big");
+        break;
+    default:
+        status->device_endian = g_strdup("unknown");
+        break;
+    }
+
+    status->num_vqs = virtio_get_num_queues(vdev);
+    status->status = qmp_decode_status(vdev->status);
+    status->isr = vdev->isr;
+    status->queue_sel = vdev->queue_sel;
+    status->vm_running = vdev->vm_running;
+    status->broken = vdev->broken;
+    status->disabled = vdev->disabled;
+    status->use_started = vdev->use_started;
+    status->started = vdev->started;
+    status->start_on_kick = vdev->start_on_kick;
+    status->disable_legacy_check = vdev->disable_legacy_check;
+    status->bus_name = g_strdup(vdev->bus_name);
+    status->use_guest_notifier_mask = vdev->use_guest_notifier_mask;
+
+    if (vdev->vhost_started) {
+        VirtioDeviceClass *vdc = VIRTIO_DEVICE_GET_CLASS(vdev);
+        struct vhost_dev *hdev = vdc->get_vhost(vdev);
+
+        status->vhost_dev = g_new0(VhostStatus, 1);
+        status->vhost_dev->n_mem_sections = hdev->n_mem_sections;
+        status->vhost_dev->n_tmp_sections = hdev->n_tmp_sections;
+        status->vhost_dev->nvqs = hdev->nvqs;
+        status->vhost_dev->vq_index = hdev->vq_index;
+        status->vhost_dev->features =
+            qmp_decode_features(vdev->device_id, hdev->features);
+        status->vhost_dev->acked_features =
+            qmp_decode_features(vdev->device_id, hdev->acked_features);
+        status->vhost_dev->backend_features =
+            qmp_decode_features(vdev->device_id, hdev->backend_features);
+        status->vhost_dev->protocol_features =
+            qmp_decode_protocols(hdev->protocol_features);
+        status->vhost_dev->max_queues = hdev->max_queues;
+        status->vhost_dev->backend_cap = hdev->backend_cap;
+        status->vhost_dev->log_enabled = hdev->log_enabled;
+        status->vhost_dev->log_size = hdev->log_size;
+    }
+
+    return status;
+}
+
+VirtVhostQueueStatus *qmp_x_query_virtio_vhost_queue_status(const char *path,
+                                                            uint16_t queue,
+                                                            Error **errp)
+{
+    VirtIODevice *vdev;
+    VirtVhostQueueStatus *status;
+
+    vdev = qmp_find_virtio_device(path);
+    if (vdev == NULL) {
+        error_setg(errp, "Path %s is not a VirtIODevice", path);
+        return NULL;
+    }
+
+    if (!vdev->vhost_started) {
+        error_setg(errp, "Error: vhost device has not started yet");
+        return NULL;
+    }
+
+    VirtioDeviceClass *vdc = VIRTIO_DEVICE_GET_CLASS(vdev);
+    struct vhost_dev *hdev = vdc->get_vhost(vdev);
+
+    if (queue < hdev->vq_index || queue >= hdev->vq_index + hdev->nvqs) {
+        error_setg(errp, "Invalid vhost virtqueue number %d", queue);
+        return NULL;
+    }
+
+    status = g_new0(VirtVhostQueueStatus, 1);
+    status->name = g_strdup(vdev->name);
+    status->kick = hdev->vqs[queue].kick;
+    status->call = hdev->vqs[queue].call;
+    status->desc = (uintptr_t)hdev->vqs[queue].desc;
+    status->avail = (uintptr_t)hdev->vqs[queue].avail;
+    status->used = (uintptr_t)hdev->vqs[queue].used;
+    status->num = hdev->vqs[queue].num;
+    status->desc_phys = hdev->vqs[queue].desc_phys;
+    status->desc_size = hdev->vqs[queue].desc_size;
+    status->avail_phys = hdev->vqs[queue].avail_phys;
+    status->avail_size = hdev->vqs[queue].avail_size;
+    status->used_phys = hdev->vqs[queue].used_phys;
+    status->used_size = hdev->vqs[queue].used_size;
+
+    return status;
+}
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index e08443e3bf..02a49d9fa1 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -13,10 +13,7 @@
 
 #include "qemu/osdep.h"
 #include "qapi/error.h"
-#include "qapi/qmp/qdict.h"
 #include "qapi/qapi-commands-virtio.h"
-#include "qapi/qapi-commands-qom.h"
-#include "qapi/qmp/qjson.h"
 #include "trace.h"
 #include "qemu/error-report.h"
 #include "qemu/log.h"
@@ -47,8 +44,7 @@
 #include "standard-headers/linux/virtio_mem.h"
 #include "standard-headers/linux/virtio_vsock.h"
 
-/* QAPI list of realized VirtIODevices */
-static QTAILQ_HEAD(, VirtIODevice) virtio_list;
+QmpVirtIODeviceList virtio_list;
 
 /*
  * Maximum size of virtio device config space
@@ -3824,191 +3820,6 @@ bool virtio_device_ioeventfd_enabled(VirtIODevice *vdev)
     return virtio_bus_ioeventfd_enabled(vbus);
 }
 
-VirtioInfoList *qmp_x_query_virtio(Error **errp)
-{
-    VirtioInfoList *list = NULL;
-    VirtioInfoList *node;
-    VirtIODevice *vdev;
-
-    QTAILQ_FOREACH(vdev, &virtio_list, next) {
-        DeviceState *dev = DEVICE(vdev);
-        Error *err = NULL;
-        QObject *obj = qmp_qom_get(dev->canonical_path, "realized", &err);
-
-        if (err == NULL) {
-            GString *is_realized = qobject_to_json_pretty(obj, true);
-            /* virtio device is NOT realized, remove it from list */
-            if (!strncmp(is_realized->str, "false", 4)) {
-                QTAILQ_REMOVE(&virtio_list, vdev, next);
-            } else {
-                node = g_new0(VirtioInfoList, 1);
-                node->value = g_new(VirtioInfo, 1);
-                node->value->path = g_strdup(dev->canonical_path);
-                node->value->name = g_strdup(vdev->name);
-                QAPI_LIST_PREPEND(list, node->value);
-            }
-           g_string_free(is_realized, true);
-        }
-        qobject_unref(obj);
-    }
-
-    return list;
-}
-
-static VirtIODevice *qmp_find_virtio_device(const char *path)
-{
-    VirtIODevice *vdev;
-
-    QTAILQ_FOREACH(vdev, &virtio_list, next) {
-        DeviceState *dev = DEVICE(vdev);
-
-        if (strcmp(dev->canonical_path, path) != 0) {
-            continue;
-        }
-
-        Error *err = NULL;
-        QObject *obj = qmp_qom_get(dev->canonical_path, "realized", &err);
-        if (err == NULL) {
-            GString *is_realized = qobject_to_json_pretty(obj, true);
-            /* virtio device is NOT realized, remove it from list */
-            if (!strncmp(is_realized->str, "false", 4)) {
-                g_string_free(is_realized, true);
-                qobject_unref(obj);
-                QTAILQ_REMOVE(&virtio_list, vdev, next);
-                return NULL;
-            }
-            g_string_free(is_realized, true);
-        } else {
-            /* virtio device doesn't exist in QOM tree */
-            QTAILQ_REMOVE(&virtio_list, vdev, next);
-            qobject_unref(obj);
-            return NULL;
-        }
-        /* device exists in QOM tree & is realized */
-        qobject_unref(obj);
-        return vdev;
-    }
-    return NULL;
-}
-
-VirtioStatus *qmp_x_query_virtio_status(const char *path, Error **errp)
-{
-    VirtIODevice *vdev;
-    VirtioStatus *status;
-
-    vdev = qmp_find_virtio_device(path);
-    if (vdev == NULL) {
-        error_setg(errp, "Path %s is not a VirtIODevice", path);
-        return NULL;
-    }
-
-    status = g_new0(VirtioStatus, 1);
-    status->name = g_strdup(vdev->name);
-    status->device_id = vdev->device_id;
-    status->vhost_started = vdev->vhost_started;
-    status->guest_features = qmp_decode_features(vdev->device_id,
-                                                 vdev->guest_features);
-    status->host_features = qmp_decode_features(vdev->device_id,
-                                                vdev->host_features);
-    status->backend_features = qmp_decode_features(vdev->device_id,
-                                                   vdev->backend_features);
-
-    switch (vdev->device_endian) {
-    case VIRTIO_DEVICE_ENDIAN_LITTLE:
-        status->device_endian = g_strdup("little");
-        break;
-    case VIRTIO_DEVICE_ENDIAN_BIG:
-        status->device_endian = g_strdup("big");
-        break;
-    default:
-        status->device_endian = g_strdup("unknown");
-        break;
-    }
-
-    status->num_vqs = virtio_get_num_queues(vdev);
-    status->status = qmp_decode_status(vdev->status);
-    status->isr = vdev->isr;
-    status->queue_sel = vdev->queue_sel;
-    status->vm_running = vdev->vm_running;
-    status->broken = vdev->broken;
-    status->disabled = vdev->disabled;
-    status->use_started = vdev->use_started;
-    status->started = vdev->started;
-    status->start_on_kick = vdev->start_on_kick;
-    status->disable_legacy_check = vdev->disable_legacy_check;
-    status->bus_name = g_strdup(vdev->bus_name);
-    status->use_guest_notifier_mask = vdev->use_guest_notifier_mask;
-
-    if (vdev->vhost_started) {
-        VirtioDeviceClass *vdc = VIRTIO_DEVICE_GET_CLASS(vdev);
-        struct vhost_dev *hdev = vdc->get_vhost(vdev);
-
-        status->vhost_dev = g_new0(VhostStatus, 1);
-        status->vhost_dev->n_mem_sections = hdev->n_mem_sections;
-        status->vhost_dev->n_tmp_sections = hdev->n_tmp_sections;
-        status->vhost_dev->nvqs = hdev->nvqs;
-        status->vhost_dev->vq_index = hdev->vq_index;
-        status->vhost_dev->features =
-            qmp_decode_features(vdev->device_id, hdev->features);
-        status->vhost_dev->acked_features =
-            qmp_decode_features(vdev->device_id, hdev->acked_features);
-        status->vhost_dev->backend_features =
-            qmp_decode_features(vdev->device_id, hdev->backend_features);
-        status->vhost_dev->protocol_features =
-            qmp_decode_protocols(hdev->protocol_features);
-        status->vhost_dev->max_queues = hdev->max_queues;
-        status->vhost_dev->backend_cap = hdev->backend_cap;
-        status->vhost_dev->log_enabled = hdev->log_enabled;
-        status->vhost_dev->log_size = hdev->log_size;
-    }
-
-    return status;
-}
-
-VirtVhostQueueStatus *qmp_x_query_virtio_vhost_queue_status(const char *path,
-                                                            uint16_t queue,
-                                                            Error **errp)
-{
-    VirtIODevice *vdev;
-    VirtVhostQueueStatus *status;
-
-    vdev = qmp_find_virtio_device(path);
-    if (vdev == NULL) {
-        error_setg(errp, "Path %s is not a VirtIODevice", path);
-        return NULL;
-    }
-
-    if (!vdev->vhost_started) {
-        error_setg(errp, "Error: vhost device has not started yet");
-        return NULL;
-    }
-
-    VirtioDeviceClass *vdc = VIRTIO_DEVICE_GET_CLASS(vdev);
-    struct vhost_dev *hdev = vdc->get_vhost(vdev);
-
-    if (queue < hdev->vq_index || queue >= hdev->vq_index + hdev->nvqs) {
-        error_setg(errp, "Invalid vhost virtqueue number %d", queue);
-        return NULL;
-    }
-
-    status = g_new0(VirtVhostQueueStatus, 1);
-    status->name = g_strdup(vdev->name);
-    status->kick = hdev->vqs[queue].kick;
-    status->call = hdev->vqs[queue].call;
-    status->desc = (uintptr_t)hdev->vqs[queue].desc;
-    status->avail = (uintptr_t)hdev->vqs[queue].avail;
-    status->used = (uintptr_t)hdev->vqs[queue].used;
-    status->num = hdev->vqs[queue].num;
-    status->desc_phys = hdev->vqs[queue].desc_phys;
-    status->desc_size = hdev->vqs[queue].desc_size;
-    status->avail_phys = hdev->vqs[queue].avail_phys;
-    status->avail_size = hdev->vqs[queue].avail_size;
-    status->used_phys = hdev->vqs[queue].used_phys;
-    status->used_size = hdev->vqs[queue].used_size;
-
-    return status;
-}
-
 VirtQueueStatus *qmp_x_query_virtio_queue_status(const char *path,
                                                  uint16_t queue,
                                                  Error **errp)
-- 
MST


