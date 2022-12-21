Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6788D653195
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 14:22:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7yni-0006Nt-2t; Wed, 21 Dec 2022 08:06:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7ynH-0005x5-MW
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 08:06:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7yn7-0004K3-IC
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 08:05:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671627941;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VVe3hvli5zfO+u4yEF4Y9xsdgKYFA5TH6Bl5P9SgDvo=;
 b=WQkNNc7jtBWoHkJM54pVRAG3EN5SxndxkFpjNsgTMlvPNE63GOyudVLWuoWXmF1pT2y3KQ
 IBVkLrpfqdCbsni9g8Oy2XtcG/TMh9/AhHTOvKIV83P2QMpDNuWxwCjusJeRvMBk+RcPdS
 F46HdeZmxCOAbX86KKSdxwAXYrVMbLY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-209-nwGL_4mEOgukrSluLeN2PQ-1; Wed, 21 Dec 2022 08:05:40 -0500
X-MC-Unique: nwGL_4mEOgukrSluLeN2PQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 a6-20020a05600c224600b003d1f3ed49adso669101wmm.4
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 05:05:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VVe3hvli5zfO+u4yEF4Y9xsdgKYFA5TH6Bl5P9SgDvo=;
 b=XmkZ3C1pWIhvzp8SiOw7TBg7IborkaKqMGHlZQ+ITj+GgGQbbfdtyx7HEtyGKmXex5
 3HexShoMpphds/j49PGAeQesYKn72j0LI9X7L15rAU7lg3uFIqvPhEDXqUv1al6JMrXh
 8AeU4cL4/gn4MpyDS4OfRClnECS4rbEK4wQG1glhTgVUKmJftpkexhdI0hP99RAmeYVo
 P9qqKqA4WG/zVSfOWkVytm2jaW77VUt3kN1mAHNl8W/D2jePXvB1tLn07mEaWeil4j+8
 hxDlNQgA2tTCinMPEwA/Jjip1oOwheL/u3r5YBbcMCkSNAaW144NfFq8YPkml9olp+pL
 4y7A==
X-Gm-Message-State: AFqh2koGaTVVthr+1HcMeeXWUe/FrNCywkwdazH7hBN9hS3n/QRVLNIw
 KcxPVEtXSxqS/QkeHS5GdhN5BKlVZkpx46d5eJiiK83n07yc4oEYlphBRZPPLrSSJVCP5fjlso8
 68B4t0ztv564yMyDYk95uwVPEVQiwEir0T+CuDr7yJYL2iKc3RiZXv9f+1xZt
X-Received: by 2002:a5d:4908:0:b0:242:3602:5619 with SMTP id
 x8-20020a5d4908000000b0024236025619mr1228641wrq.48.1671627938180; 
 Wed, 21 Dec 2022 05:05:38 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvL6dZPYELvI16VUSILouCSA4bvkmhzDFwUiQQldYorDJgO0Nf4s3wuw8X0l027iE2vpXijLg==
X-Received: by 2002:a5d:4908:0:b0:242:3602:5619 with SMTP id
 x8-20020a5d4908000000b0024236025619mr1228615wrq.48.1671627937808; 
 Wed, 21 Dec 2022 05:05:37 -0800 (PST)
Received: from redhat.com ([2.52.8.61]) by smtp.gmail.com with ESMTPSA id
 n4-20020a056000170400b002366dd0e030sm15299935wrc.68.2022.12.21.05.05.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 05:05:37 -0800 (PST)
Date: Wed, 21 Dec 2022 08:05:35 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
 Jason Wang <jasowang@redhat.com>
Subject: [PULL 20/41] vdpa: add asid parameter to vhost_vdpa_dma_map/unmap
Message-ID: <20221221130339.1234592-21-mst@redhat.com>
References: <20221221130339.1234592-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221221130339.1234592-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

From: Eugenio Pérez <eperezma@redhat.com>

So the caller can choose which ASID is destined.

No need to update the batch functions as they will always be called from
memory listener updates at the moment. Memory listener updates will
always update ASID 0, as it's the passthrough ASID.

All vhost devices's ASID are 0 at this moment.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20221215113144.322011-10-eperezma@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/virtio/vhost-vdpa.h | 14 ++++++++++---
 hw/virtio/vhost-vdpa.c         | 36 +++++++++++++++++++++++-----------
 net/vhost-vdpa.c               |  6 +++---
 hw/virtio/trace-events         |  4 ++--
 4 files changed, 41 insertions(+), 19 deletions(-)

diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-vdpa.h
index 1111d85643..e57dfa1fd1 100644
--- a/include/hw/virtio/vhost-vdpa.h
+++ b/include/hw/virtio/vhost-vdpa.h
@@ -19,6 +19,12 @@
 #include "hw/virtio/virtio.h"
 #include "standard-headers/linux/vhost_types.h"
 
+/*
+ * ASID dedicated to map guest's addresses.  If SVQ is disabled it maps GPA to
+ * qemu's IOVA.  If SVQ is enabled it maps also the SVQ vring here
+ */
+#define VHOST_VDPA_GUEST_PA_ASID 0
+
 typedef struct VhostVDPAHostNotifier {
     MemoryRegion mr;
     void *addr;
@@ -29,6 +35,7 @@ typedef struct vhost_vdpa {
     int index;
     uint32_t msg_type;
     bool iotlb_batch_begin_sent;
+    uint32_t address_space_id;
     MemoryListener listener;
     struct vhost_vdpa_iova_range iova_range;
     uint64_t acked_features;
@@ -42,8 +49,9 @@ typedef struct vhost_vdpa {
     VhostVDPAHostNotifier notifier[VIRTIO_QUEUE_MAX];
 } VhostVDPA;
 
-int vhost_vdpa_dma_map(struct vhost_vdpa *v, hwaddr iova, hwaddr size,
-                       void *vaddr, bool readonly);
-int vhost_vdpa_dma_unmap(struct vhost_vdpa *v, hwaddr iova, hwaddr size);
+int vhost_vdpa_dma_map(struct vhost_vdpa *v, uint32_t asid, hwaddr iova,
+                       hwaddr size, void *vaddr, bool readonly);
+int vhost_vdpa_dma_unmap(struct vhost_vdpa *v, uint32_t asid, hwaddr iova,
+                         hwaddr size);
 
 #endif
diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index b7a624607b..beb6368e40 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -72,22 +72,28 @@ static bool vhost_vdpa_listener_skipped_section(MemoryRegionSection *section,
     return false;
 }
 
-int vhost_vdpa_dma_map(struct vhost_vdpa *v, hwaddr iova, hwaddr size,
-                       void *vaddr, bool readonly)
+/*
+ * The caller must set asid = 0 if the device does not support asid.
+ * This is not an ABI break since it is set to 0 by the initializer anyway.
+ */
+int vhost_vdpa_dma_map(struct vhost_vdpa *v, uint32_t asid, hwaddr iova,
+                       hwaddr size, void *vaddr, bool readonly)
 {
     struct vhost_msg_v2 msg = {};
     int fd = v->device_fd;
     int ret = 0;
 
     msg.type = v->msg_type;
+    msg.asid = asid;
     msg.iotlb.iova = iova;
     msg.iotlb.size = size;
     msg.iotlb.uaddr = (uint64_t)(uintptr_t)vaddr;
     msg.iotlb.perm = readonly ? VHOST_ACCESS_RO : VHOST_ACCESS_RW;
     msg.iotlb.type = VHOST_IOTLB_UPDATE;
 
-   trace_vhost_vdpa_dma_map(v, fd, msg.type, msg.iotlb.iova, msg.iotlb.size,
-                            msg.iotlb.uaddr, msg.iotlb.perm, msg.iotlb.type);
+    trace_vhost_vdpa_dma_map(v, fd, msg.type, msg.asid, msg.iotlb.iova,
+                             msg.iotlb.size, msg.iotlb.uaddr, msg.iotlb.perm,
+                             msg.iotlb.type);
 
     if (write(fd, &msg, sizeof(msg)) != sizeof(msg)) {
         error_report("failed to write, fd=%d, errno=%d (%s)",
@@ -98,18 +104,24 @@ int vhost_vdpa_dma_map(struct vhost_vdpa *v, hwaddr iova, hwaddr size,
     return ret;
 }
 
-int vhost_vdpa_dma_unmap(struct vhost_vdpa *v, hwaddr iova, hwaddr size)
+/*
+ * The caller must set asid = 0 if the device does not support asid.
+ * This is not an ABI break since it is set to 0 by the initializer anyway.
+ */
+int vhost_vdpa_dma_unmap(struct vhost_vdpa *v, uint32_t asid, hwaddr iova,
+                         hwaddr size)
 {
     struct vhost_msg_v2 msg = {};
     int fd = v->device_fd;
     int ret = 0;
 
     msg.type = v->msg_type;
+    msg.asid = asid;
     msg.iotlb.iova = iova;
     msg.iotlb.size = size;
     msg.iotlb.type = VHOST_IOTLB_INVALIDATE;
 
-    trace_vhost_vdpa_dma_unmap(v, fd, msg.type, msg.iotlb.iova,
+    trace_vhost_vdpa_dma_unmap(v, fd, msg.type, msg.asid, msg.iotlb.iova,
                                msg.iotlb.size, msg.iotlb.type);
 
     if (write(fd, &msg, sizeof(msg)) != sizeof(msg)) {
@@ -229,8 +241,8 @@ static void vhost_vdpa_listener_region_add(MemoryListener *listener,
     }
 
     vhost_vdpa_iotlb_batch_begin_once(v);
-    ret = vhost_vdpa_dma_map(v, iova, int128_get64(llsize),
-                             vaddr, section->readonly);
+    ret = vhost_vdpa_dma_map(v, VHOST_VDPA_GUEST_PA_ASID, iova,
+                             int128_get64(llsize), vaddr, section->readonly);
     if (ret) {
         error_report("vhost vdpa map fail!");
         goto fail_map;
@@ -303,7 +315,8 @@ static void vhost_vdpa_listener_region_del(MemoryListener *listener,
         vhost_iova_tree_remove(v->iova_tree, *result);
     }
     vhost_vdpa_iotlb_batch_begin_once(v);
-    ret = vhost_vdpa_dma_unmap(v, iova, int128_get64(llsize));
+    ret = vhost_vdpa_dma_unmap(v, VHOST_VDPA_GUEST_PA_ASID, iova,
+                               int128_get64(llsize));
     if (ret) {
         error_report("vhost_vdpa dma unmap error!");
     }
@@ -869,7 +882,7 @@ static void vhost_vdpa_svq_unmap_ring(struct vhost_vdpa *v, hwaddr addr)
     }
 
     size = ROUND_UP(result->size, qemu_real_host_page_size());
-    r = vhost_vdpa_dma_unmap(v, result->iova, size);
+    r = vhost_vdpa_dma_unmap(v, v->address_space_id, result->iova, size);
     if (unlikely(r < 0)) {
         error_report("Unable to unmap SVQ vring: %s (%d)", g_strerror(-r), -r);
         return;
@@ -909,7 +922,8 @@ static bool vhost_vdpa_svq_map_ring(struct vhost_vdpa *v, DMAMap *needle,
         return false;
     }
 
-    r = vhost_vdpa_dma_map(v, needle->iova, needle->size + 1,
+    r = vhost_vdpa_dma_map(v, v->address_space_id, needle->iova,
+                           needle->size + 1,
                            (void *)(uintptr_t)needle->translated_addr,
                            needle->perm == IOMMU_RO);
     if (unlikely(r != 0)) {
diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index e829ef1f43..a592ee07ec 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -259,7 +259,7 @@ static void vhost_vdpa_cvq_unmap_buf(struct vhost_vdpa *v, void *addr)
         return;
     }
 
-    r = vhost_vdpa_dma_unmap(v, map->iova, map->size + 1);
+    r = vhost_vdpa_dma_unmap(v, v->address_space_id, map->iova, map->size + 1);
     if (unlikely(r != 0)) {
         error_report("Device cannot unmap: %s(%d)", g_strerror(r), r);
     }
@@ -299,8 +299,8 @@ static int vhost_vdpa_cvq_map_buf(struct vhost_vdpa *v, void *buf, size_t size,
         return r;
     }
 
-    r = vhost_vdpa_dma_map(v, map.iova, vhost_vdpa_net_cvq_cmd_page_len(), buf,
-                           !write);
+    r = vhost_vdpa_dma_map(v, v->address_space_id, map.iova,
+                           vhost_vdpa_net_cvq_cmd_page_len(), buf, !write);
     if (unlikely(r < 0)) {
         goto dma_map_err;
     }
diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
index 14fc5b9bb2..96da58a41f 100644
--- a/hw/virtio/trace-events
+++ b/hw/virtio/trace-events
@@ -30,8 +30,8 @@ vhost_user_write(uint32_t req, uint32_t flags) "req:%d flags:0x%"PRIx32""
 vhost_user_create_notifier(int idx, void *n) "idx:%d n:%p"
 
 # vhost-vdpa.c
-vhost_vdpa_dma_map(void *vdpa, int fd, uint32_t msg_type, uint64_t iova, uint64_t size, uint64_t uaddr, uint8_t perm, uint8_t type) "vdpa:%p fd: %d msg_type: %"PRIu32" iova: 0x%"PRIx64" size: 0x%"PRIx64" uaddr: 0x%"PRIx64" perm: 0x%"PRIx8" type: %"PRIu8
-vhost_vdpa_dma_unmap(void *vdpa, int fd, uint32_t msg_type, uint64_t iova, uint64_t size, uint8_t type) "vdpa:%p fd: %d msg_type: %"PRIu32" iova: 0x%"PRIx64" size: 0x%"PRIx64" type: %"PRIu8
+vhost_vdpa_dma_map(void *vdpa, int fd, uint32_t msg_type, uint32_t asid, uint64_t iova, uint64_t size, uint64_t uaddr, uint8_t perm, uint8_t type) "vdpa:%p fd: %d msg_type: %"PRIu32" asid: %"PRIu32" iova: 0x%"PRIx64" size: 0x%"PRIx64" uaddr: 0x%"PRIx64" perm: 0x%"PRIx8" type: %"PRIu8
+vhost_vdpa_dma_unmap(void *vdpa, int fd, uint32_t msg_type, uint32_t asid, uint64_t iova, uint64_t size, uint8_t type) "vdpa:%p fd: %d msg_type: %"PRIu32" asid: %"PRIu32" iova: 0x%"PRIx64" size: 0x%"PRIx64" type: %"PRIu8
 vhost_vdpa_listener_begin_batch(void *v, int fd, uint32_t msg_type, uint8_t type)  "vdpa:%p fd: %d msg_type: %"PRIu32" type: %"PRIu8
 vhost_vdpa_listener_commit(void *v, int fd, uint32_t msg_type, uint8_t type)  "vdpa:%p fd: %d msg_type: %"PRIu32" type: %"PRIu8
 vhost_vdpa_listener_region_add(void *vdpa, uint64_t iova, uint64_t llend, void *vaddr, bool readonly) "vdpa: %p iova 0x%"PRIx64" llend 0x%"PRIx64" vaddr: %p read-only: %d"
-- 
MST


