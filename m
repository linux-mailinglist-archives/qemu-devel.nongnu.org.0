Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64CAA653142
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 14:05:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7ymL-0004WR-Lp; Wed, 21 Dec 2022 08:05:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7ymI-0004S3-VD
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 08:04:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7ymH-0003yr-7E
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 08:04:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671627896;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=D6fT+Iu1jI6RLvNgNp7FxJIv+uR0ETmIVUr1p91FboM=;
 b=RGlqmzDK7BOl/HTCq0icQRHT7JvAb2PvIaAb0/8acO0PjmBmkvF5effWthKLn6GGVLsTGH
 PqYu29ONf3VuWeH7/PwWwdKF8FfFquk5SYyP01jP1HCfUw1+vgD0p2SuigcTGlHFbXyAz8
 6N3O5XGwGnUoJF0Yyj44fTXGFEm9PZg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-74-63sBwlDfMgSldLGxsx_eYQ-1; Wed, 21 Dec 2022 08:04:55 -0500
X-MC-Unique: 63sBwlDfMgSldLGxsx_eYQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 i187-20020a1c3bc4000000b003d634aca337so1765281wma.1
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 05:04:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D6fT+Iu1jI6RLvNgNp7FxJIv+uR0ETmIVUr1p91FboM=;
 b=nRKe6jLmC3kZBQ0rEx0QLEKC0GF+oEXcvltjqJZrodUW6ag/ZnZjNfaAR2DTQyAth4
 cR/Wcix0usY4DQzeSLTn9FA1kF08jJhYVjYM9BeankSgU/8XU0o3K6lWLEMvXgEps3QP
 PuxqyQ3Q64GcSVS9wm3p27FygH3l2sbHzFB97Frizy84BXgH4OhJKBSH/jQba4qyxAsi
 WJhMgS8VbWaGvAYOQ4cUAyA3UbT84lhhcMxiksq/kj9LL8H10YEQ+OAHH4hH5qnlu7EE
 LM3ym4ow95h5xlNac2FzOoSUb1Kar4Cs5mjXMl7upWDBdk/vErkzf4MybpALV9iZpGaP
 NXFA==
X-Gm-Message-State: AFqh2krL2n236wcnOApGkZQB56ecoP9v5aPzWQJHDN7EhPhxMi8Q/twB
 rndS3dKRzUQkQjuf5THKresVAy5T4j2jPZ4YsPtesF82CV2os1Z/YXq08G9pqgMBvvqeRAGWOr+
 hCQtwEMkquw1SVzY61c6DE+4+wjyz/SIrvRm/bz1l0wEdXqV38OqZElZoGeGM
X-Received: by 2002:a05:600c:a4d:b0:3cf:6e78:e2ca with SMTP id
 c13-20020a05600c0a4d00b003cf6e78e2camr4322450wmq.5.1671627892207; 
 Wed, 21 Dec 2022 05:04:52 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsdyqZShxCsQzx7NWYfKO5Q1XZR38l76dOAhvpwvNJL+D0HIo8Tumb5/R7FIm++ExaBRUd0uQ==
X-Received: by 2002:a05:600c:a4d:b0:3cf:6e78:e2ca with SMTP id
 c13-20020a05600c0a4d00b003cf6e78e2camr4322431wmq.5.1671627891891; 
 Wed, 21 Dec 2022 05:04:51 -0800 (PST)
Received: from redhat.com ([2.52.8.61]) by smtp.gmail.com with ESMTPSA id
 f1-20020a1c6a01000000b003cfa80443a0sm2207294wmc.35.2022.12.21.05.04.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 05:04:49 -0800 (PST)
Date: Wed, 21 Dec 2022 08:04:47 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Longpeng <longpeng2@huawei.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL 08/41] virtio: get class_id and pci device id by the virtio id
Message-ID: <20221221130339.1234592-9-mst@redhat.com>
References: <20221221130339.1234592-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221221130339.1234592-1-mst@redhat.com>
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

From: Longpeng <longpeng2@huawei.com>

Add helpers to get the "Transitional PCI Device ID" and "class_id"
of the device specified by the "Virtio Device ID".

These helpers will be used to build the generic vDPA device later.

Acked-by: Jason Wang <jasowang@redhat.com>
Signed-off-by: Longpeng <longpeng2@huawei.com>
Message-Id: <20221215134944.2809-2-longpeng2@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/virtio/virtio-pci.h |  5 ++
 hw/virtio/virtio-pci.c         | 88 ++++++++++++++++++++++++++++++++++
 2 files changed, 93 insertions(+)

diff --git a/include/hw/virtio/virtio-pci.h b/include/hw/virtio/virtio-pci.h
index 938799e8f6..24fba1604b 100644
--- a/include/hw/virtio/virtio-pci.h
+++ b/include/hw/virtio/virtio-pci.h
@@ -151,6 +151,8 @@ struct VirtIOPCIProxy {
     bool disable_modern;
     bool ignore_backend_features;
     OnOffAuto disable_legacy;
+    /* Transitional device id */
+    uint16_t trans_devid;
     uint32_t class_code;
     uint32_t nvectors;
     uint32_t dfselect;
@@ -184,6 +186,9 @@ static inline void virtio_pci_disable_modern(VirtIOPCIProxy *proxy)
     proxy->disable_modern = true;
 }
 
+uint16_t virtio_pci_get_trans_devid(uint16_t device_id);
+uint16_t virtio_pci_get_class_id(uint16_t device_id);
+
 /*
  * virtio-input-pci: This extends VirtioPCIProxy.
  */
diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index 7873083b86..70639300aa 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -19,6 +19,7 @@
 
 #include "exec/memop.h"
 #include "standard-headers/linux/virtio_pci.h"
+#include "standard-headers/linux/virtio_ids.h"
 #include "hw/boards.h"
 #include "hw/virtio/virtio.h"
 #include "migration/qemu-file-types.h"
@@ -224,6 +225,90 @@ static int virtio_pci_load_queue(DeviceState *d, int n, QEMUFile *f)
     return 0;
 }
 
+typedef struct VirtIOPCIIDInfo {
+    /* virtio id */
+    uint16_t vdev_id;
+    /* pci device id for the transitional device */
+    uint16_t trans_devid;
+    uint16_t class_id;
+} VirtIOPCIIDInfo;
+
+static const VirtIOPCIIDInfo virtio_pci_id_info[] = {
+    {
+        .vdev_id = VIRTIO_ID_CRYPTO,
+        .class_id = PCI_CLASS_OTHERS,
+    }, {
+        .vdev_id = VIRTIO_ID_FS,
+        .class_id = PCI_CLASS_STORAGE_OTHER,
+    }, {
+        .vdev_id = VIRTIO_ID_NET,
+        .trans_devid = PCI_DEVICE_ID_VIRTIO_NET,
+        .class_id = PCI_CLASS_NETWORK_ETHERNET,
+    }, {
+        .vdev_id = VIRTIO_ID_BLOCK,
+        .trans_devid = PCI_DEVICE_ID_VIRTIO_BLOCK,
+        .class_id = PCI_CLASS_STORAGE_SCSI,
+    }, {
+        .vdev_id = VIRTIO_ID_CONSOLE,
+        .trans_devid = PCI_DEVICE_ID_VIRTIO_CONSOLE,
+        .class_id = PCI_CLASS_COMMUNICATION_OTHER,
+    }, {
+        .vdev_id = VIRTIO_ID_SCSI,
+        .trans_devid = PCI_DEVICE_ID_VIRTIO_SCSI,
+        .class_id = PCI_CLASS_STORAGE_SCSI
+    }, {
+        .vdev_id = VIRTIO_ID_9P,
+        .trans_devid = PCI_DEVICE_ID_VIRTIO_9P,
+        .class_id = PCI_BASE_CLASS_NETWORK,
+    }, {
+        .vdev_id = VIRTIO_ID_BALLOON,
+        .trans_devid = PCI_DEVICE_ID_VIRTIO_BALLOON,
+        .class_id = PCI_CLASS_OTHERS,
+    }, {
+        .vdev_id = VIRTIO_ID_RNG,
+        .trans_devid = PCI_DEVICE_ID_VIRTIO_RNG,
+        .class_id = PCI_CLASS_OTHERS,
+    },
+};
+
+static const VirtIOPCIIDInfo *virtio_pci_get_id_info(uint16_t vdev_id)
+{
+    const VirtIOPCIIDInfo *info = NULL;
+    int i;
+
+    for (i = 0; i < ARRAY_SIZE(virtio_pci_id_info); i++) {
+        if (virtio_pci_id_info[i].vdev_id == vdev_id) {
+            info = &virtio_pci_id_info[i];
+            break;
+        }
+    }
+
+    if (!info) {
+        /* The device id is invalid or not added to the id_info yet. */
+        error_report("Invalid virtio device(id %u)", vdev_id);
+        abort();
+    }
+
+    return info;
+}
+
+/*
+ * Get the Transitional Device ID for the specific device, return
+ * zero if the device is non-transitional.
+ */
+uint16_t virtio_pci_get_trans_devid(uint16_t device_id)
+{
+    return virtio_pci_get_id_info(device_id)->trans_devid;
+}
+
+/*
+ * Get the Class ID for the specific device.
+ */
+uint16_t virtio_pci_get_class_id(uint16_t device_id)
+{
+    return virtio_pci_get_id_info(device_id)->class_id;
+}
+
 static bool virtio_pci_ioeventfd_enabled(DeviceState *d)
 {
     VirtIOPCIProxy *proxy = to_virtio_pci_proxy(d);
@@ -1729,6 +1814,9 @@ static void virtio_pci_device_plugged(DeviceState *d, Error **errp)
          * is set to PCI_SUBVENDOR_ID_REDHAT_QUMRANET by default.
          */
         pci_set_word(config + PCI_SUBSYSTEM_ID, virtio_bus_get_vdev_id(bus));
+        if (proxy->trans_devid) {
+            pci_config_set_device_id(config, proxy->trans_devid);
+        }
     } else {
         /* pure virtio-1.0 */
         pci_set_word(config + PCI_VENDOR_ID,
-- 
MST


