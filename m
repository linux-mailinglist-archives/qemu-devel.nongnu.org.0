Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A31B33D3B74
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 15:54:04 +0200 (CEST)
Received: from localhost ([::1]:38894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6vcp-0000G2-OG
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 09:54:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1m6vbd-0007pT-8u
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 09:52:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55008)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1m6vbb-0003bL-I2
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 09:52:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627048366;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8KR2u/bnP3vgdT/n0PD7aPEqYUfrrJfP7G2HxLQyqvU=;
 b=SlUMm3zbMrqsvWBdqdjfuGYKFJRI2ZS2n5Rjqtqe1dRZR+qpvIYPvfIOjI3yaG+FYuuLRf
 K6XoNbz01ZhGzFKCZ/GXdUoKhSg54g8uEv1TRlIUqj+yaZ721/weIfM2kCXq/Wo2eIhutE
 gEWcurdj2qLbBJGMKtq14AtYuz59zlg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-132-6MUnHKoROSSNIKa1l8nYDA-1; Fri, 23 Jul 2021 09:52:45 -0400
X-MC-Unique: 6MUnHKoROSSNIKa1l8nYDA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3DD21802C9B;
 Fri, 23 Jul 2021 13:52:44 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-106.ams2.redhat.com
 [10.36.114.106])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A179A5DA60;
 Fri, 23 Jul 2021 13:52:43 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 11C6B18000A3; Fri, 23 Jul 2021 15:52:42 +0200 (CEST)
Date: Fri, 23 Jul 2021 15:52:42 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Antonio Caggiano <antonio.caggiano@collabora.com>
Subject: Re: virtio-gpu: Mapping blob resources
Message-ID: <20210723135242.w5bcqwwrm5stec3b@sirius.home.kraxel.org>
References: <0eb17319-0b1d-5f43-f5d9-8ccadb0839ef@collabora.com>
MIME-Version: 1.0
In-Reply-To: <0eb17319-0b1d-5f43-f5d9-8ccadb0839ef@collabora.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
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
Cc: qemu-devel@nongnu.org, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 vivek.kasireddy@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jul 23, 2021 at 03:33:24PM +0200, Antonio Caggiano wrote:
> Hi,
> 
> I am trying to implement blob resource mapping support, but there is
> something I still did not manage to figure out.
> 
> According to the spec, VIRTIO_GPU_CMD_RESOURCE_MAP_BLOB maps a host-only
> blob resource into an offset in the host visible memory region. So, I
> believe I will need something like:
> 
> > void *data = g->hotstmem[mblob.offset]; // pseudo-code
> > virgl_renderer_resource_map(..., &data, ...);
> 
> Questions:
> - Does my approach make sense?

No ;)

> - How do I get an address to the host visible memory region?

You don't need that.

qemu has a memory api for that which manages a tree of regions.
Each pci bar is such a region.  Below is an old patch from an
archived branch adding a pci bar and memory region and some virtio
feature flag stuff.  Surely will not apply as-is, but should show
what you need to do.

Then you can create a new memory region for each (mappable) host
resource and register that as sub-region of the pci bar memory region.
sub-regions can be moved around (set offset) and enabled (aka mapped)
and disabled (aka unmapped), and qemu will take care to update the
guest's view of the memory as needed.

HTH,
  Gerd

commit e3e24a1ff3f68335a5691d9948f29d7f50b65929
Author: Gerd Hoffmann <kraxel@redhat.com>
Date:   Wed Sep 25 14:54:29 2019 +0200

    virtio-gpu: hostmem [wip]

diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.h
index decc940048e1..9bb26139e686 100644
--- a/include/hw/virtio/virtio-gpu.h
+++ b/include/hw/virtio/virtio-gpu.h
@@ -108,12 +108,15 @@ enum virtio_gpu_base_conf_flags {
     (_cfg.flags & (1 << VIRTIO_GPU_FLAG_SHARED_ENABLED))
 #define virtio_gpu_blob_enabled(_cfg) \
     (_cfg.flags & (1 << VIRTIO_GPU_FLAG_BLOB_ENABLED))
+#define virtio_gpu_hostmem_enabled(_cfg) \
+    (_cfg.hostmem > 0)
 
 struct virtio_gpu_base_conf {
     uint32_t max_outputs;
     uint32_t flags;
     uint32_t xres;
     uint32_t yres;
+    uint64_t hostmem;
 };
 
 struct virtio_gpu_ctrl_command {
@@ -137,6 +140,8 @@ typedef struct VirtIOGPUBase {
     int renderer_blocked;
     int enable;
 
+    MemoryRegion hostmem;
+
     struct virtio_gpu_scanout scanout[VIRTIO_GPU_MAX_SCANOUTS];
 
     int enabled_output_bitmask;
diff --git a/hw/display/virtio-gpu-base.c b/hw/display/virtio-gpu-base.c
index 09f2efb09968..985f92983a4c 100644
--- a/hw/display/virtio-gpu-base.c
+++ b/hw/display/virtio-gpu-base.c
@@ -194,6 +194,9 @@ virtio_gpu_base_get_features(VirtIODevice *vdev, uint64_t features,
     if (virtio_gpu_blob_enabled(g->conf)) {
         features |= (1 << VIRTIO_GPU_F_RESOURCE_BLOB);
     }
+    if (virtio_gpu_hostmem_enabled(g->conf)) {
+        features |= (1 << VIRTIO_GPU_F_HOSTMEM);
+    }
 
     return features;
 }
diff --git a/hw/display/virtio-gpu-pci.c b/hw/display/virtio-gpu-pci.c
index 3d152ff5c873..3f81f4952e59 100644
--- a/hw/display/virtio-gpu-pci.c
+++ b/hw/display/virtio-gpu-pci.c
@@ -33,6 +33,19 @@ static void virtio_gpu_pci_base_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
     int i;
     Error *local_error = NULL;
 
+    if (virtio_gpu_hostmem_enabled(g->conf)) {
+        vpci_dev->msix_bar_idx = 1;
+        vpci_dev->modern_mem_bar_idx = 2;
+        memory_region_init(&g->hostmem, OBJECT(g), "virtio-gpu-hostmem",
+                           g->conf.hostmem);
+        pci_register_bar(&vpci_dev->pci_dev, 4,
+                         PCI_BASE_ADDRESS_SPACE_MEMORY |
+                         PCI_BASE_ADDRESS_MEM_PREFETCH |
+                         PCI_BASE_ADDRESS_MEM_TYPE_64,
+                         &g->hostmem);
+        virtio_pci_add_shm_cap(vpci_dev, 4, 0, g->conf.hostmem, 0);
+    }
+
     qdev_set_parent_bus(vdev, BUS(&vpci_dev->bus));
     virtio_pci_force_virtio_1(vpci_dev);
     object_property_set_bool(OBJECT(vdev), true, "realized", &local_error);
diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
index 795c4c1d429c..58bcd9c116c8 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -1213,11 +1213,20 @@ static void virtio_gpu_device_realize(DeviceState *qdev, Error **errp)
         }
     }
 
+    if (virtio_gpu_hostmem_enabled(g->parent_obj.conf)) {
+        /* FIXME: to be investigated ... */
+        if (virtio_gpu_virgl_enabled(g->parent_obj.conf)) {
+            error_setg(errp, "hostmem and virgl are not compatible (yet)");
+            return;
+        }
+    }
+
     if (virtio_gpu_shared_enabled(g->parent_obj.conf) ||
-        virtio_gpu_blob_enabled(g->parent_obj.conf)) {
+        virtio_gpu_blob_enabled(g->parent_obj.conf) ||
+        virtio_gpu_hostmem_enabled(g->parent_obj.conf)) {
         /* FIXME: must xfer resource type somehow */
         error_setg(&g->parent_obj.migration_blocker,
-                   "shared/blob is not migratable (yet)");
+                   "shared/blob/hostmem is not migratable (yet)");
         migrate_add_blocker(g->parent_obj.migration_blocker, &local_err);
         if (local_err) {
             error_propagate(errp, local_err);
@@ -1344,6 +1353,7 @@ static Property virtio_gpu_properties[] = {
 #endif
     DEFINE_PROP_BIT("shared", VirtIOGPU, parent_obj.conf.flags,
                     VIRTIO_GPU_FLAG_SHARED_ENABLED, false),
+    DEFINE_PROP_SIZE("hostmem", VirtIOGPU, parent_obj.conf.hostmem, 0),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/display/virtio-vga.c b/hw/display/virtio-vga.c
index 2b4c2aa126c7..933b74c496e5 100644
--- a/hw/display/virtio-vga.c
+++ b/hw/display/virtio-vga.c
@@ -112,8 +112,21 @@ static void virtio_vga_base_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
      * virtio regions are moved to the end of bar #2, to make room for
      * the stdvga mmio registers at the start of bar #2.
      */
-    vpci_dev->modern_mem_bar_idx = 2;
-    vpci_dev->msix_bar_idx = 4;
+    if (!virtio_gpu_hostmem_enabled(g->conf)) {
+        vpci_dev->modern_mem_bar_idx = 2;
+        vpci_dev->msix_bar_idx = 4;
+    } else {
+        vpci_dev->msix_bar_idx = 1;
+        vpci_dev->modern_mem_bar_idx = 2;
+        memory_region_init(&g->hostmem, OBJECT(g), "virtio-gpu-hostmem",
+                           g->conf.hostmem);
+        pci_register_bar(&vpci_dev->pci_dev, 4,
+                         PCI_BASE_ADDRESS_SPACE_MEMORY |
+                         PCI_BASE_ADDRESS_MEM_PREFETCH |
+                         PCI_BASE_ADDRESS_MEM_TYPE_64,
+                         &g->hostmem);
+        virtio_pci_add_shm_cap(vpci_dev, 4, 0, g->conf.hostmem, 0);
+    }
 
     if (!(vpci_dev->flags & VIRTIO_PCI_FLAG_PAGE_PER_VQ)) {
         /*


