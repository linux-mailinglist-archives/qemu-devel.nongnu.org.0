Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F101736D633
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 13:12:46 +0200 (CEST)
Received: from localhost ([::1]:53142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbi7a-0007OL-18
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 07:12:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lbhwv-00068V-OR
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 07:01:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52237)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lbhwr-000504-Pw
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 07:01:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619607701;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y/kl2aHuxlMmmxeaeoocdR+zk0WlDLgKZZlO92j7sgc=;
 b=R8fDT1ypXej22WzKGKhQmkpACoKWJkY/yY0FLECloG5VE273qHdTgIVUmfaI8eorD2E1Jd
 utb3lW+/e0Crdoh3469S3us/2V4pHMGVSqfgKESd118y1yTtjKftF0uiJilJ/mkVmagMPE
 +i1Rnq3iV9/JH8HXKoRtihAJqkFBErQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-105-ILQFzksaMACfH6rdQxerkA-1; Wed, 28 Apr 2021 07:01:38 -0400
X-MC-Unique: ILQFzksaMACfH6rdQxerkA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D05AA18C35C2;
 Wed, 28 Apr 2021 11:01:37 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-115-35.ams2.redhat.com
 [10.36.115.35])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 971A61001B2C;
 Wed, 28 Apr 2021 11:01:36 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, vgoyal@redhat.com, stefanha@redhat.com,
 groug@kaod.org
Subject: [PATCH v3 08/26] DAX: virtio-fs: Add cache BAR
Date: Wed, 28 Apr 2021 12:00:42 +0100
Message-Id: <20210428110100.27757-9-dgilbert@redhat.com>
In-Reply-To: <20210428110100.27757-1-dgilbert@redhat.com>
References: <20210428110100.27757-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
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
Cc: virtio-fs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

Add a cache BAR into which files will be directly mapped.
The size can be set with the cache-size= property, e.g.
   -device vhost-user-fs-pci,chardev=char0,tag=myfs,cache-size=16G

The default is no cache.

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
with PPC fixes by:
Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 hw/virtio/vhost-user-fs-pci.c     | 32 +++++++++++++++++++++++++++++++
 hw/virtio/vhost-user-fs.c         | 32 +++++++++++++++++++++++++++++++
 include/hw/virtio/vhost-user-fs.h |  2 ++
 3 files changed, 66 insertions(+)

diff --git a/hw/virtio/vhost-user-fs-pci.c b/hw/virtio/vhost-user-fs-pci.c
index 2ed8492b3f..20e447631f 100644
--- a/hw/virtio/vhost-user-fs-pci.c
+++ b/hw/virtio/vhost-user-fs-pci.c
@@ -12,14 +12,19 @@
  */
 
 #include "qemu/osdep.h"
+#include "qapi/error.h"
 #include "hw/qdev-properties.h"
 #include "hw/virtio/vhost-user-fs.h"
 #include "virtio-pci.h"
 #include "qom/object.h"
+#include "standard-headers/linux/virtio_fs.h"
+
+#define VIRTIO_FS_PCI_CACHE_BAR 2
 
 struct VHostUserFSPCI {
     VirtIOPCIProxy parent_obj;
     VHostUserFS vdev;
+    MemoryRegion cachebar;
 };
 
 typedef struct VHostUserFSPCI VHostUserFSPCI;
@@ -38,7 +43,9 @@ static Property vhost_user_fs_pci_properties[] = {
 static void vhost_user_fs_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
 {
     VHostUserFSPCI *dev = VHOST_USER_FS_PCI(vpci_dev);
+    bool modern_pio = vpci_dev->flags & VIRTIO_PCI_FLAG_MODERN_PIO_NOTIFY;
     DeviceState *vdev = DEVICE(&dev->vdev);
+    uint64_t cachesize;
 
     if (vpci_dev->nvectors == DEV_NVECTORS_UNSPECIFIED) {
         /* Also reserve config change and hiprio queue vectors */
@@ -46,6 +53,31 @@ static void vhost_user_fs_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
     }
 
     qdev_realize(vdev, BUS(&vpci_dev->bus), errp);
+    cachesize = dev->vdev.conf.cache_size;
+
+    if (cachesize && modern_pio) {
+        error_setg(errp, "DAX Cache can not be used together with modern_pio");
+        return;
+    }
+
+    /*
+     * The bar starts with the data/DAX cache
+     * Others will be added later.
+     */
+    memory_region_init(&dev->cachebar, OBJECT(vpci_dev),
+                       "vhost-user-fs-pci-cachebar", cachesize);
+    if (cachesize) {
+        memory_region_add_subregion(&dev->cachebar, 0, &dev->vdev.cache);
+        virtio_pci_add_shm_cap(vpci_dev, VIRTIO_FS_PCI_CACHE_BAR, 0, cachesize,
+                               VIRTIO_FS_SHMCAP_ID_CACHE);
+
+        /* After 'realized' so the memory region exists */
+        pci_register_bar(&vpci_dev->pci_dev, VIRTIO_FS_PCI_CACHE_BAR,
+                         PCI_BASE_ADDRESS_SPACE_MEMORY |
+                         PCI_BASE_ADDRESS_MEM_PREFETCH |
+                         PCI_BASE_ADDRESS_MEM_TYPE_64,
+                         &dev->cachebar);
+    }
 }
 
 static void vhost_user_fs_pci_class_init(ObjectClass *klass, void *data)
diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
index 6f7f91533d..dd0a02aa99 100644
--- a/hw/virtio/vhost-user-fs.c
+++ b/hw/virtio/vhost-user-fs.c
@@ -35,6 +35,16 @@ static const int user_feature_bits[] = {
     VHOST_INVALID_FEATURE_BIT
 };
 
+/*
+ * The powerpc kernel code expects the memory to be accessible during
+ * addition/removal.
+ */
+#if defined(TARGET_PPC64) && defined(CONFIG_LINUX)
+#define DAX_WINDOW_PROT PROT_READ
+#else
+#define DAX_WINDOW_PROT PROT_NONE
+#endif
+
 static void vuf_get_config(VirtIODevice *vdev, uint8_t *config)
 {
     VHostUserFS *fs = VHOST_USER_FS(vdev);
@@ -175,6 +185,7 @@ static void vuf_device_realize(DeviceState *dev, Error **errp)
 {
     VirtIODevice *vdev = VIRTIO_DEVICE(dev);
     VHostUserFS *fs = VHOST_USER_FS(dev);
+    void *cache_ptr;
     unsigned int i;
     size_t len;
     int ret;
@@ -214,6 +225,26 @@ static void vuf_device_realize(DeviceState *dev, Error **errp)
                    VIRTQUEUE_MAX_SIZE);
         return;
     }
+    if (fs->conf.cache_size &&
+        (!is_power_of_2(fs->conf.cache_size) ||
+          fs->conf.cache_size < qemu_real_host_page_size)) {
+        error_setg(errp, "cache-size property must be a power of 2 "
+                         "no smaller than the page size");
+        return;
+    }
+    if (fs->conf.cache_size) {
+        /* Anonymous, private memory is not counted as overcommit */
+        cache_ptr = mmap(NULL, fs->conf.cache_size, DAX_WINDOW_PROT,
+                         MAP_ANONYMOUS | MAP_PRIVATE, -1, 0);
+        if (cache_ptr == MAP_FAILED) {
+            error_setg(errp, "Unable to mmap blank cache");
+            return;
+        }
+
+        memory_region_init_ram_ptr(&fs->cache, OBJECT(vdev),
+                                   "virtio-fs-cache",
+                                   fs->conf.cache_size, cache_ptr);
+    }
 
     if (!vhost_user_init(&fs->vhost_user, &fs->conf.chardev, errp)) {
         return;
@@ -289,6 +320,7 @@ static Property vuf_properties[] = {
     DEFINE_PROP_UINT16("num-request-queues", VHostUserFS,
                        conf.num_request_queues, 1),
     DEFINE_PROP_UINT16("queue-size", VHostUserFS, conf.queue_size, 128),
+    DEFINE_PROP_SIZE("cache-size", VHostUserFS, conf.cache_size, 0),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/include/hw/virtio/vhost-user-fs.h b/include/hw/virtio/vhost-user-fs.h
index 0d62834c25..04596799e3 100644
--- a/include/hw/virtio/vhost-user-fs.h
+++ b/include/hw/virtio/vhost-user-fs.h
@@ -28,6 +28,7 @@ typedef struct {
     char *tag;
     uint16_t num_request_queues;
     uint16_t queue_size;
+    uint64_t cache_size;
 } VHostUserFSConf;
 
 struct VHostUserFS {
@@ -42,6 +43,7 @@ struct VHostUserFS {
     int32_t bootindex;
 
     /*< public >*/
+    MemoryRegion cache;
 };
 
 #endif /* _QEMU_VHOST_USER_FS_H */
-- 
2.31.1


