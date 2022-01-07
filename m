Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F4E5487773
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 13:09:44 +0100 (CET)
Received: from localhost ([::1]:59918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5o3z-0003xl-8h
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 07:09:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5n40-0001So-FT
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 06:05:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37889)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5n3p-0002BN-R6
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 06:05:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641553509;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hs67YvZIvahNXlhwkP8umtVyFMBTNC8kSLZ1qlqLMz4=;
 b=WCp9EPoBpQjS1pmf6hMJOQ3V5cucslFbWWqB6JZz+7WHnFJ4yd5pxp7ylXjIl1/atpUgYG
 zxTA0bP/yJeZccZrxFxrxZTSy72MYrM00ztKQSR5XSQDA+ggQmRwn07wNwPdHzlO9OntfP
 6cyaxcPq6UQiA/unyztVfPZc+Ddof50=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-214-E1rmQMLoNaK531MOxxjYVA-1; Fri, 07 Jan 2022 06:05:08 -0500
X-MC-Unique: E1rmQMLoNaK531MOxxjYVA-1
Received: by mail-wr1-f71.google.com with SMTP id
 k14-20020adfb34e000000b001a5d060e1edso526038wrd.7
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 03:05:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hs67YvZIvahNXlhwkP8umtVyFMBTNC8kSLZ1qlqLMz4=;
 b=k5G60TuTHoptWttKoGe8q+AaafysEnZyKs77l9QVjjDbjkycMntcOkZjx326XuMDFs
 +cd4KgDhwQYVUrpnIZbCq7Hpy/ynaNc3qCe17TT5vHATn/NqsG8OIqB3J08cJIQbnNfH
 YAll31mqejyY3VDKZsUKDAyDdYMU3oljXLaZlu0hRuOe2FjOY/vFCxoI7PRSGnW/jZyC
 z3wCaY9PYf8LBYmJsUQr1NpvcnhVZnwZZEkZEhUAv9FYDLmA+id61ROX8G91VOwZFxnl
 CAc5X/f1Qbjs8j+jnaDIgbDv2Jfg6mL3NAiatexwnWaNu/ImpJJ4eaa90ZxHCRyvM38G
 PWIA==
X-Gm-Message-State: AOAM533KDJ0iPhwNpAkgXuYjbFTlyzt+pqOj2ZepZDj+oK5/lcKA3bs3
 UhIq6R9CyXwDrlZ/5KcmKqAQZVNwvjEE1CHybroN1RSVXtCFEUoCSuZLwLnjavA6YV6/1gUQkZq
 eEKK8GAmeTB08aEX5yN++2cttUhHgvNjlCoKqDQPSoYnGNUUr7zSXzjUAsyw9
X-Received: by 2002:a05:6000:104f:: with SMTP id
 c15mr53635963wrx.665.1641553507271; 
 Fri, 07 Jan 2022 03:05:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy55cOnnOHszCtdqP0bpN2okqu4WFzgTkUIV3d7t+igN1pJ9fbfiqXOzphMOuegMvd6d2YwSA==
X-Received: by 2002:a05:6000:104f:: with SMTP id
 c15mr53635942wrx.665.1641553506950; 
 Fri, 07 Jan 2022 03:05:06 -0800 (PST)
Received: from redhat.com ([2.55.16.192])
 by smtp.gmail.com with ESMTPSA id r62sm3986315wmr.35.2022.01.07.03.05.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 03:05:06 -0800 (PST)
Date: Fri, 7 Jan 2022 06:05:04 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 40/55] virtio-mem: Support
 VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE
Message-ID: <20220107102526.39238-41-mst@redhat.com>
References: <20220107102526.39238-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220107102526.39238-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Michal Privoznik <mprivozn@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Hildenbrand <david@redhat.com>

With VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE, we signal the VM that reading
unplugged memory is not supported. We have to fail feature negotiation
in case the guest does not support VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE.

First, VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE is required to properly handle
memory backends (or architectures) without support for the shared zeropage
in the hypervisor cleanly. Without the shared zeropage, even reading an
unpopulated virtual memory location can populate real memory and
consequently consume memory in the hypervisor. We have a guaranteed shared
zeropage only on MAP_PRIVATE anonymous memory.

Second, we want VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE to be the default
long-term as even populating the shared zeropage can be problematic: for
example, without THP support (possible) or without support for the shared
huge zeropage with THP (unlikely), the PTE page tables to hold the shared
zeropage entries can consume quite some memory that cannot be reclaimed
easily.

Third, there are other optimizations+features (e.g., protection of
unplugged memory, reducing the total memory slot size and bitmap sizes)
that will require VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE.

We really only support x86 targets with virtio-mem for now (and
Linux similarly only support x86), but that might change soon, so prepare
for different targets already.

Add a new "unplugged-inaccessible" tristate property for x86 targets:
- "off" will keep VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE unset and legacy
  guests working.
- "on" will set VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE and stop legacy guests
  from using the device.
- "auto" selects the default based on support for the shared zeropage.

Warn in case the property is set to "off" and we don't have support for the
shared zeropage.

For existing compat machines, the property will default to "off", to
not change the behavior but eventually warn about a problematic setup.
Short-term, we'll set the property default to "auto" for new QEMU machines.
Mid-term, we'll set the property default to "on" for new QEMU machines.
Long-term, we'll deprecate the parameter and disallow legacy
guests completely.

The property has to match on the migration source and destination. "auto"
will result in the same VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE setting as long
as the qemu command line (esp. memdev) match -- so "auto" is good enough
for migration purposes and the parameter doesn't have to be migrated
explicitly.

Reviewed-by: Michal Privoznik <mprivozn@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
Message-Id: <20211217134039.29670-3-david@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/virtio/virtio-mem.h |  8 +++++
 hw/virtio/virtio-mem.c         | 63 ++++++++++++++++++++++++++++++++++
 2 files changed, 71 insertions(+)

diff --git a/include/hw/virtio/virtio-mem.h b/include/hw/virtio/virtio-mem.h
index 0ac7bcb3b6..7745cfc1a3 100644
--- a/include/hw/virtio/virtio-mem.h
+++ b/include/hw/virtio/virtio-mem.h
@@ -30,6 +30,7 @@ OBJECT_DECLARE_TYPE(VirtIOMEM, VirtIOMEMClass,
 #define VIRTIO_MEM_REQUESTED_SIZE_PROP "requested-size"
 #define VIRTIO_MEM_BLOCK_SIZE_PROP "block-size"
 #define VIRTIO_MEM_ADDR_PROP "memaddr"
+#define VIRTIO_MEM_UNPLUGGED_INACCESSIBLE_PROP "unplugged-inaccessible"
 #define VIRTIO_MEM_PREALLOC_PROP "prealloc"
 
 struct VirtIOMEM {
@@ -63,6 +64,13 @@ struct VirtIOMEM {
     /* block size and alignment */
     uint64_t block_size;
 
+    /*
+     * Whether we indicate VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE to the guest.
+     * For !x86 targets this will always be "on" and consequently indicate
+     * VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE.
+     */
+    OnOffAuto unplugged_inaccessible;
+
     /* whether to prealloc memory when plugging new blocks */
     bool prealloc;
 
diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c
index ab975ff566..fb6687d4c7 100644
--- a/hw/virtio/virtio-mem.c
+++ b/hw/virtio/virtio-mem.c
@@ -32,6 +32,14 @@
 #include CONFIG_DEVICES
 #include "trace.h"
 
+/*
+ * We only had legacy x86 guests that did not support
+ * VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE. Other targets don't have legacy guests.
+ */
+#if defined(TARGET_X86_64) || defined(TARGET_I386)
+#define VIRTIO_MEM_HAS_LEGACY_GUESTS
+#endif
+
 /*
  * Let's not allow blocks smaller than 1 MiB, for example, to keep the tracking
  * bitmap small.
@@ -110,6 +118,19 @@ static uint64_t virtio_mem_default_block_size(RAMBlock *rb)
     return MAX(page_size, VIRTIO_MEM_MIN_BLOCK_SIZE);
 }
 
+#if defined(VIRTIO_MEM_HAS_LEGACY_GUESTS)
+static bool virtio_mem_has_shared_zeropage(RAMBlock *rb)
+{
+    /*
+     * We only have a guaranteed shared zeropage on ordinary MAP_PRIVATE
+     * anonymous RAM. In any other case, reading unplugged *can* populate a
+     * fresh page, consuming actual memory.
+     */
+    return !qemu_ram_is_shared(rb) && rb->fd < 0 &&
+           qemu_ram_pagesize(rb) == qemu_real_host_page_size;
+}
+#endif /* VIRTIO_MEM_HAS_LEGACY_GUESTS */
+
 /*
  * Size the usable region bigger than the requested size if possible. Esp.
  * Linux guests will only add (aligned) memory blocks in case they fully
@@ -683,15 +704,29 @@ static uint64_t virtio_mem_get_features(VirtIODevice *vdev, uint64_t features,
                                         Error **errp)
 {
     MachineState *ms = MACHINE(qdev_get_machine());
+    VirtIOMEM *vmem = VIRTIO_MEM(vdev);
 
     if (ms->numa_state) {
 #if defined(CONFIG_ACPI)
         virtio_add_feature(&features, VIRTIO_MEM_F_ACPI_PXM);
 #endif
     }
+    assert(vmem->unplugged_inaccessible != ON_OFF_AUTO_AUTO);
+    if (vmem->unplugged_inaccessible == ON_OFF_AUTO_ON) {
+        virtio_add_feature(&features, VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE);
+    }
     return features;
 }
 
+static int virtio_mem_validate_features(VirtIODevice *vdev)
+{
+    if (virtio_host_has_feature(vdev, VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE) &&
+        !virtio_vdev_has_feature(vdev, VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE)) {
+        return -EFAULT;
+    }
+    return 0;
+}
+
 static void virtio_mem_system_reset(void *opaque)
 {
     VirtIOMEM *vmem = VIRTIO_MEM(opaque);
@@ -746,6 +781,29 @@ static void virtio_mem_device_realize(DeviceState *dev, Error **errp)
     rb = vmem->memdev->mr.ram_block;
     page_size = qemu_ram_pagesize(rb);
 
+#if defined(VIRTIO_MEM_HAS_LEGACY_GUESTS)
+    switch (vmem->unplugged_inaccessible) {
+    case ON_OFF_AUTO_AUTO:
+        if (virtio_mem_has_shared_zeropage(rb)) {
+            vmem->unplugged_inaccessible = ON_OFF_AUTO_OFF;
+        } else {
+            vmem->unplugged_inaccessible = ON_OFF_AUTO_ON;
+        }
+        break;
+    case ON_OFF_AUTO_OFF:
+        if (!virtio_mem_has_shared_zeropage(rb)) {
+            warn_report("'%s' property set to 'off' with a memdev that does"
+                        " not support the shared zeropage.",
+                        VIRTIO_MEM_UNPLUGGED_INACCESSIBLE_PROP);
+        }
+        break;
+    default:
+        break;
+    }
+#else /* VIRTIO_MEM_HAS_LEGACY_GUESTS */
+    vmem->unplugged_inaccessible = ON_OFF_AUTO_ON;
+#endif /* VIRTIO_MEM_HAS_LEGACY_GUESTS */
+
     /*
      * If the block size wasn't configured by the user, use a sane default. This
      * allows using hugetlbfs backends of any page size without manual
@@ -1141,6 +1199,10 @@ static Property virtio_mem_properties[] = {
     DEFINE_PROP_BOOL(VIRTIO_MEM_PREALLOC_PROP, VirtIOMEM, prealloc, false),
     DEFINE_PROP_LINK(VIRTIO_MEM_MEMDEV_PROP, VirtIOMEM, memdev,
                      TYPE_MEMORY_BACKEND, HostMemoryBackend *),
+#if defined(VIRTIO_MEM_HAS_LEGACY_GUESTS)
+    DEFINE_PROP_ON_OFF_AUTO(VIRTIO_MEM_UNPLUGGED_INACCESSIBLE_PROP, VirtIOMEM,
+                            unplugged_inaccessible, ON_OFF_AUTO_OFF),
+#endif
     DEFINE_PROP_END_OF_LIST(),
 };
 
@@ -1279,6 +1341,7 @@ static void virtio_mem_class_init(ObjectClass *klass, void *data)
     vdc->unrealize = virtio_mem_device_unrealize;
     vdc->get_config = virtio_mem_get_config;
     vdc->get_features = virtio_mem_get_features;
+    vdc->validate_features = virtio_mem_validate_features;
     vdc->vmsd = &vmstate_virtio_mem_device;
 
     vmc->fill_device_info = virtio_mem_fill_device_info;
-- 
MST


