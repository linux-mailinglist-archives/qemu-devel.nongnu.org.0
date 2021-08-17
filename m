Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6940B3EE3CA
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 03:39:06 +0200 (CEST)
Received: from localhost ([::1]:54232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFo4H-0001cm-FW
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 21:39:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mFo1L-0007ED-A1
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 21:36:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51386)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mFo1J-0001Mh-6r
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 21:36:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629164160;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CyN5t6FRrtEr1W6zSY24aiaw29UMXAfpZzaauaF0otA=;
 b=LAV1wh/e5DgfDrj5nVLg6fAZfWiow1XUbgKs94PHCiOAjul5qqhKLN7M80GlguFRT6M8xj
 Swd5upJS0UP7g1su+/btXH/DSk2cb0hLYPxwyIfWP4/yPKFjNvII/Z6v7AeejYanR/oCVp
 WY93Mc0YqaGjeeeLYeVVJJbvLmij5DQ=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-483-hMTeL5b0OSKOmFOMVWA4bQ-1; Mon, 16 Aug 2021 21:35:59 -0400
X-MC-Unique: hMTeL5b0OSKOmFOMVWA4bQ-1
Received: by mail-qv1-f72.google.com with SMTP id
 a3-20020a0cb3430000b02903432d100232so14225311qvf.16
 for <qemu-devel@nongnu.org>; Mon, 16 Aug 2021 18:35:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CyN5t6FRrtEr1W6zSY24aiaw29UMXAfpZzaauaF0otA=;
 b=FwCz75LfJP93jUp8X1W7EOetpKX7TMXfNf02XyVShAgS42BTLUKEmqHU9AXcKTW0C4
 XMh4s30DV/JX4cXxIUdYQV06KpEvxOA3kalDxa07wDOqtchAG70wTJuzcnCeK5cKiTt2
 A2dYUX3cB7pR/OdrHu5Nj/ft9VD3CQUVmQDJlQwU2iwaHnCjtpeRu2CIZYqPKJW+v5BC
 HkQlMRyOBGdlf6E6MPDqpLggNKjB84m0c2S1uP18lrOFsXJ4m6OQMz7oE5Do5YuReekn
 +an4TWZXtYZJTzx+FFGhGofiBJyz/LH8jDuxAnsfr8xOOdN10IPriEz+T0UJgYXR5u+u
 kz4w==
X-Gm-Message-State: AOAM5337Q0G6D3uF7NnZVcD/tzb89ZkJeZROORUfsIA+txDZf0w0VeL/
 4idjprXfvTbTV2yHIAFADvhS9G9yPhQvs5tHXQ8oZ3dK8Tg7e7iopjNeDXbMjJY51E8g+qHdow6
 gUmII2lvlPg8Lkc/GgNsXpH636brUgI22mOZQHLLQq4CxsAkNXZcQD5bNeT4q4wk4
X-Received: by 2002:a05:620a:f91:: with SMTP id
 b17mr1346816qkn.107.1629164157796; 
 Mon, 16 Aug 2021 18:35:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx2FFm4CJtYCZY/sMsJDi3maENGPCJaVkzVkQ2q6M9h+uTc/Nvms9tVU48eQo1QHD2n9dZ6Cg==
X-Received: by 2002:a05:620a:f91:: with SMTP id
 b17mr1346793qkn.107.1629164157469; 
 Mon, 16 Aug 2021 18:35:57 -0700 (PDT)
Received: from t490s.redhat.com ([2607:fea8:56a3:500::d413])
 by smtp.gmail.com with ESMTPSA id b15sm391867qka.107.2021.08.16.18.35.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 18:35:57 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RESEND 1/2] memory: Name all the memory listeners
Date: Mon, 16 Aug 2021 21:35:52 -0400
Message-Id: <20210817013553.30584-2-peterx@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210817013553.30584-1-peterx@redhat.com>
References: <20210817013553.30584-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Provide a name field for all the memory listeners.  It can be used to identify
which memory listener is which.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 accel/hvf/hvf-accel-ops.c         | 1 +
 accel/kvm/kvm-all.c               | 7 +++++--
 hw/i386/xen/xen-hvm.c             | 2 ++
 hw/intc/openpic_kvm.c             | 1 +
 hw/remote/proxy-memory-listener.c | 1 +
 hw/vfio/common.c                  | 1 +
 hw/vfio/spapr.c                   | 1 +
 hw/virtio/vhost-vdpa.c            | 1 +
 hw/virtio/vhost.c                 | 2 ++
 hw/virtio/virtio.c                | 1 +
 hw/xen/xen_pt.c                   | 2 ++
 include/exec/memory.h             | 8 ++++++++
 include/sysemu/kvm_int.h          | 2 +-
 softmmu/physmem.c                 | 1 +
 target/arm/kvm.c                  | 1 +
 target/i386/hax/hax-mem.c         | 1 +
 target/i386/kvm/kvm.c             | 2 +-
 target/i386/nvmm/nvmm-all.c       | 1 +
 target/i386/whpx/whpx-all.c       | 1 +
 19 files changed, 33 insertions(+), 4 deletions(-)

diff --git a/accel/hvf/hvf-accel-ops.c b/accel/hvf/hvf-accel-ops.c
index d1691be989..ecd48337b4 100644
--- a/accel/hvf/hvf-accel-ops.c
+++ b/accel/hvf/hvf-accel-ops.c
@@ -291,6 +291,7 @@ static void hvf_region_del(MemoryListener *listener,
 }
 
 static MemoryListener hvf_memory_listener = {
+    .name = "hvf",
     .priority = 10,
     .region_add = hvf_region_add,
     .region_del = hvf_region_del,
diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 0125c17edb..3d6f44cb4d 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -1129,6 +1129,7 @@ static void kvm_coalesce_pio_del(MemoryListener *listener,
 }
 
 static MemoryListener kvm_coalesced_pio_listener = {
+    .name = "kvm-coalesced-pio",
     .coalesced_io_add = kvm_coalesce_pio_add,
     .coalesced_io_del = kvm_coalesce_pio_del,
 };
@@ -1633,7 +1634,7 @@ static void kvm_io_ioeventfd_del(MemoryListener *listener,
 }
 
 void kvm_memory_listener_register(KVMState *s, KVMMemoryListener *kml,
-                                  AddressSpace *as, int as_id)
+                                  AddressSpace *as, int as_id, const char *name)
 {
     int i;
 
@@ -1649,6 +1650,7 @@ void kvm_memory_listener_register(KVMState *s, KVMMemoryListener *kml,
     kml->listener.log_start = kvm_log_start;
     kml->listener.log_stop = kvm_log_stop;
     kml->listener.priority = 10;
+    kml->listener.name = name;
 
     if (s->kvm_dirty_ring_size) {
         kml->listener.log_sync_global = kvm_log_sync_global;
@@ -1669,6 +1671,7 @@ void kvm_memory_listener_register(KVMState *s, KVMMemoryListener *kml,
 }
 
 static MemoryListener kvm_io_listener = {
+    .name = "kvm-io",
     .eventfd_add = kvm_io_ioeventfd_add,
     .eventfd_del = kvm_io_ioeventfd_del,
     .priority = 10,
@@ -2579,7 +2582,7 @@ static int kvm_init(MachineState *ms)
     s->memory_listener.listener.coalesced_io_del = kvm_uncoalesce_mmio_region;
 
     kvm_memory_listener_register(s, &s->memory_listener,
-                                 &address_space_memory, 0);
+                                 &address_space_memory, 0, "kvm-memory");
     if (kvm_eventfds_allowed) {
         memory_listener_register(&kvm_io_listener,
                                  &address_space_io);
diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
index 9b432773f0..e3d3d5cf89 100644
--- a/hw/i386/xen/xen-hvm.c
+++ b/hw/i386/xen/xen-hvm.c
@@ -721,6 +721,7 @@ static void xen_log_global_stop(MemoryListener *listener)
 }
 
 static MemoryListener xen_memory_listener = {
+    .name = "xen-memory",
     .region_add = xen_region_add,
     .region_del = xen_region_del,
     .log_start = xen_log_start,
@@ -732,6 +733,7 @@ static MemoryListener xen_memory_listener = {
 };
 
 static MemoryListener xen_io_listener = {
+    .name = "xen-io",
     .region_add = xen_io_add,
     .region_del = xen_io_del,
     .priority = 10,
diff --git a/hw/intc/openpic_kvm.c b/hw/intc/openpic_kvm.c
index 21da680389..557dd0c2bf 100644
--- a/hw/intc/openpic_kvm.c
+++ b/hw/intc/openpic_kvm.c
@@ -234,6 +234,7 @@ static void kvm_openpic_realize(DeviceState *dev, Error **errp)
 
     opp->mem_listener.region_add = kvm_openpic_region_add;
     opp->mem_listener.region_del = kvm_openpic_region_del;
+    opp->mem_listener.name = "openpic-kvm";
     memory_listener_register(&opp->mem_listener, &address_space_memory);
 
     /* indicate pic capabilities */
diff --git a/hw/remote/proxy-memory-listener.c b/hw/remote/proxy-memory-listener.c
index 901dbf1357..882c9b4854 100644
--- a/hw/remote/proxy-memory-listener.c
+++ b/hw/remote/proxy-memory-listener.c
@@ -219,6 +219,7 @@ void proxy_memory_listener_configure(ProxyMemoryListener *proxy_listener,
     proxy_listener->listener.region_add = proxy_memory_listener_region_addnop;
     proxy_listener->listener.region_nop = proxy_memory_listener_region_addnop;
     proxy_listener->listener.priority = 10;
+    proxy_listener->listener.name = "proxy";
 
     memory_listener_register(&proxy_listener->listener,
                              &address_space_memory);
diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 8728d4d5c2..3476170067 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -1434,6 +1434,7 @@ static void vfio_listener_log_sync(MemoryListener *listener,
 }
 
 static const MemoryListener vfio_memory_listener = {
+    .name = "vfio",
     .region_add = vfio_listener_region_add,
     .region_del = vfio_listener_region_del,
     .log_global_start = vfio_listener_log_global_start,
diff --git a/hw/vfio/spapr.c b/hw/vfio/spapr.c
index ea3f70bd2f..04c6e67f8f 100644
--- a/hw/vfio/spapr.c
+++ b/hw/vfio/spapr.c
@@ -136,6 +136,7 @@ static void vfio_prereg_listener_region_del(MemoryListener *listener,
 }
 
 const MemoryListener vfio_prereg_listener = {
+    .name = "vfio-pre-reg",
     .region_add = vfio_prereg_listener_region_add,
     .region_del = vfio_prereg_listener_region_del,
 };
diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 4fa414feea..1ee17b9e9b 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -234,6 +234,7 @@ static void vhost_vdpa_listener_region_del(MemoryListener *listener,
  * depends on the addnop().
  */
 static const MemoryListener vhost_vdpa_memory_listener = {
+    .name = "vhost-vdpa",
     .begin = vhost_vdpa_listener_begin,
     .commit = vhost_vdpa_listener_commit,
     .region_add = vhost_vdpa_listener_region_add,
diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index e8f85a5d2d..6efcfc8faf 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -1341,6 +1341,7 @@ int vhost_dev_init(struct vhost_dev *hdev, void *opaque,
     hdev->features = features;
 
     hdev->memory_listener = (MemoryListener) {
+        .name = "vhost",
         .begin = vhost_begin,
         .commit = vhost_commit,
         .region_add = vhost_region_addnop,
@@ -1356,6 +1357,7 @@ int vhost_dev_init(struct vhost_dev *hdev, void *opaque,
     };
 
     hdev->iommu_listener = (MemoryListener) {
+        .name = "vhost-iommu",
         .region_add = vhost_iommu_region_add,
         .region_del = vhost_iommu_region_del,
     };
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 874377f37a..0dbf968c9b 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -3671,6 +3671,7 @@ static void virtio_device_realize(DeviceState *dev, Error **errp)
     }
 
     vdev->listener.commit = virtio_memory_listener_commit;
+    vdev->listener.name = "virtio";
     memory_listener_register(&vdev->listener, vdev->dma_as);
 }
 
diff --git a/hw/xen/xen_pt.c b/hw/xen/xen_pt.c
index 232482d65f..ca0a98187e 100644
--- a/hw/xen/xen_pt.c
+++ b/hw/xen/xen_pt.c
@@ -689,12 +689,14 @@ static void xen_pt_io_region_del(MemoryListener *l, MemoryRegionSection *sec)
 }
 
 static const MemoryListener xen_pt_memory_listener = {
+    .name = "xen-pt-mem",
     .region_add = xen_pt_region_add,
     .region_del = xen_pt_region_del,
     .priority = 10,
 };
 
 static const MemoryListener xen_pt_io_listener = {
+    .name = "xen-pt-io",
     .region_add = xen_pt_io_region_add,
     .region_del = xen_pt_io_region_del,
     .priority = 10,
diff --git a/include/exec/memory.h b/include/exec/memory.h
index c3d417d317..ac79fee250 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -979,6 +979,14 @@ struct MemoryListener {
      */
     unsigned priority;
 
+    /**
+     * @name:
+     *
+     * Name of the listener.  It can be used in contexts where we'd like to
+     * identify one memory listener with the rest.
+     */
+    const char *name;
+
     /* private: */
     AddressSpace *address_space;
     QTAILQ_ENTRY(MemoryListener) link;
diff --git a/include/sysemu/kvm_int.h b/include/sysemu/kvm_int.h
index c788452cd9..1f5487d9b7 100644
--- a/include/sysemu/kvm_int.h
+++ b/include/sysemu/kvm_int.h
@@ -37,7 +37,7 @@ typedef struct KVMMemoryListener {
 } KVMMemoryListener;
 
 void kvm_memory_listener_register(KVMState *s, KVMMemoryListener *kml,
-                                  AddressSpace *as, int as_id);
+                                  AddressSpace *as, int as_id, const char *name);
 
 void kvm_set_max_memslot_size(hwaddr max_slot_size);
 
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 3c1912a1a0..3729f2537d 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -756,6 +756,7 @@ void cpu_address_space_init(CPUState *cpu, int asidx,
     if (tcg_enabled()) {
         newas->tcg_as_listener.log_global_after_sync = tcg_log_global_after_sync;
         newas->tcg_as_listener.commit = tcg_commit;
+        newas->tcg_as_listener.name = "tcg";
         memory_listener_register(&newas->tcg_as_listener, as);
     }
 }
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index d8381ba224..97ec88a587 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -330,6 +330,7 @@ static void kvm_arm_devlistener_del(MemoryListener *listener,
 }
 
 static MemoryListener devlistener = {
+    .name = "kvm-arm",
     .region_add = kvm_arm_devlistener_add,
     .region_del = kvm_arm_devlistener_del,
 };
diff --git a/target/i386/hax/hax-mem.c b/target/i386/hax/hax-mem.c
index 8d44edbffd..a226d174d8 100644
--- a/target/i386/hax/hax-mem.c
+++ b/target/i386/hax/hax-mem.c
@@ -285,6 +285,7 @@ static void hax_log_sync(MemoryListener *listener,
 }
 
 static MemoryListener hax_memory_listener = {
+    .name = "hax",
     .begin = hax_transaction_begin,
     .commit = hax_transaction_commit,
     .region_add = hax_region_add,
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index e69abe48e3..771b06b39e 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -2227,7 +2227,7 @@ static void register_smram_listener(Notifier *n, void *unused)
 
     address_space_init(&smram_address_space, &smram_as_root, "KVM-SMRAM");
     kvm_memory_listener_register(kvm_state, &smram_listener,
-                                 &smram_address_space, 1);
+                                 &smram_address_space, 1, "kvm-smram");
 }
 
 int kvm_arch_init(MachineState *ms, KVMState *s)
diff --git a/target/i386/nvmm/nvmm-all.c b/target/i386/nvmm/nvmm-all.c
index dfa690d65d..5a3f6d69c3 100644
--- a/target/i386/nvmm/nvmm-all.c
+++ b/target/i386/nvmm/nvmm-all.c
@@ -1125,6 +1125,7 @@ nvmm_log_sync(MemoryListener *listener, MemoryRegionSection *section)
 }
 
 static MemoryListener nvmm_memory_listener = {
+    .name = "nvmm",
     .begin = nvmm_transaction_begin,
     .commit = nvmm_transaction_commit,
     .region_add = nvmm_region_add,
diff --git a/target/i386/whpx/whpx-all.c b/target/i386/whpx/whpx-all.c
index f832f286ac..ded096261f 100644
--- a/target/i386/whpx/whpx-all.c
+++ b/target/i386/whpx/whpx-all.c
@@ -1600,6 +1600,7 @@ static void whpx_log_sync(MemoryListener *listener,
 }
 
 static MemoryListener whpx_memory_listener = {
+    .name = "whpx",
     .begin = whpx_transaction_begin,
     .commit = whpx_transaction_commit,
     .region_add = whpx_region_add,
-- 
2.31.1


