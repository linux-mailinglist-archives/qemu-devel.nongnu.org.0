Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A222B41AFB2
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 15:12:10 +0200 (CEST)
Received: from localhost ([::1]:43878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVCu1-0007Aw-IF
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 09:12:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mVCaL-0006go-7E
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 08:51:51 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:37546)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mVCaJ-0001XR-Av
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 08:51:49 -0400
Received: by mail-ed1-x52f.google.com with SMTP id ba1so24898632edb.4
 for <qemu-devel@nongnu.org>; Tue, 28 Sep 2021 05:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Wa0TczWrJRWfuwrLLq+Ir9rEkx82edYO7rT2p35STvk=;
 b=GP6otkpksotKQ35Y6L2I+E4ea7BonlBbjmK60W2rS8JwftKL8GxTEOoXYm4ccvYjcd
 LAQTb7b3pdo9URT4eubeUu2tbdPXL63j6SsYJMzMi6hWAJ8n/hEVuAw1MuTdroyez6oa
 Vk+5wX8A52v2wm4ODNiEFThSkUGlu8vg6SuiiYBzTdqWOs8+c4xlkUkbi88A8nNOHniL
 yaGt6NdywWy6/ylKnIvrorjnmKnlVhWEeo2W1g8F/CdowFdlX/bBvnqudok4abdnFi2q
 /NBusywD26j4YkI8GV8Z3xb6DpWP/i5C7bSVFyrdEfEa2DEgJwwiEe5VWKQ9rRwdoApy
 m1Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Wa0TczWrJRWfuwrLLq+Ir9rEkx82edYO7rT2p35STvk=;
 b=RLquaN27Mm6Lc0DijRGU/Lp0zSwsKsvOsXPcSczj82WhipJSOSWMeZ2JkBDGBiLA0D
 ywdrQNrxAbqLVKSweGo6BnzQSkwg+UGwkiSkK24uU5x7zkatj1y4yVnxFx5GgA0rXA51
 CsODegL5P1sL3tqMYciqg1LRX5KtmvvHR0q2RLgRVrC+rV4CVU4gEDW1Tw6L1JD/vOga
 crULDl5YpEioNaIrhukaRrt9C2x88uA42fb6euEdgzjZEtENdIAl4DKFRMoL9E5LjOS6
 NcYL/sUJed2moYpUumiJCoNhN4qECh8gO33+vUF/7jMv1Kzv23raIr+AgrKV9txLCQiU
 qxAQ==
X-Gm-Message-State: AOAM533s015F5/8p9OoFOxzwAN4cRV1puFDpc/JhBknGhVbH7FmEq0Q2
 0vJnRNgZ6RwnSggP6f/Ii8Oj042Nt7I=
X-Google-Smtp-Source: ABdhPJy+2q+YPTWVAYIaiLjgYrYcof9sWMW3PRtmdABMHWQNmyeb/Ai+jZZ0Dh3s1qXiRldBWvVaBw==
X-Received: by 2002:a50:bf07:: with SMTP id f7mr7405467edk.288.1632833501958; 
 Tue, 28 Sep 2021 05:51:41 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id p24sm12641685edq.27.2021.09.28.05.51.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Sep 2021 05:51:41 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 30/33] memory: Name all the memory listeners
Date: Tue, 28 Sep 2021 14:51:13 +0200
Message-Id: <20210928125116.183620-31-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210928125116.183620-1-pbonzini@redhat.com>
References: <20210928125116.183620-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Xu <peterx@redhat.com>

Provide a name field for all the memory listeners.  It can be used to identify
which memory listener is which.

Signed-off-by: Peter Xu <peterx@redhat.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
Message-Id: <20210817013553.30584-2-peterx@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
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
index 93976f4ece..6cbd2c3f97 100644
--- a/accel/hvf/hvf-accel-ops.c
+++ b/accel/hvf/hvf-accel-ops.c
@@ -295,6 +295,7 @@ static void hvf_region_del(MemoryListener *listener,
 }
 
 static MemoryListener hvf_memory_listener = {
+    .name = "hvf",
     .priority = 10,
     .region_add = hvf_region_add,
     .region_del = hvf_region_del,
diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index cace5ffe64..db8d83b137 100644
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
index 1289cfa8be..a784b219e6 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -1435,6 +1435,7 @@ static void vfio_listener_log_sync(MemoryListener *listener,
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
index 7633ea66d1..47d7a5a23d 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -246,6 +246,7 @@ static void vhost_vdpa_listener_region_del(MemoryListener *listener,
  * depends on the addnop().
  */
 static const MemoryListener vhost_vdpa_memory_listener = {
+    .name = "vhost-vdpa",
     .commit = vhost_vdpa_listener_commit,
     .region_add = vhost_vdpa_listener_region_add,
     .region_del = vhost_vdpa_listener_region_del,
diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index b4b29413e6..437347ad01 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -1366,6 +1366,7 @@ int vhost_dev_init(struct vhost_dev *hdev, void *opaque,
     hdev->features = features;
 
     hdev->memory_listener = (MemoryListener) {
+        .name = "vhost",
         .begin = vhost_begin,
         .commit = vhost_commit,
         .region_add = vhost_region_addnop,
@@ -1381,6 +1382,7 @@ int vhost_dev_init(struct vhost_dev *hdev, void *opaque,
     };
 
     hdev->iommu_listener = (MemoryListener) {
+        .name = "vhost-iommu",
         .region_add = vhost_iommu_region_add,
         .region_del = vhost_iommu_region_del,
     };
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 3a1f6c520c..240759ff0b 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -3670,6 +3670,7 @@ static void virtio_device_realize(DeviceState *dev, Error **errp)
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
index 9446874d21..a185b6dcb8 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -982,6 +982,14 @@ struct MemoryListener {
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
index 088660d973..f67ad29981 100644
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
index 94b970bbf9..bbf1ce7ba3 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -335,6 +335,7 @@ static void kvm_arm_devlistener_del(MemoryListener *listener,
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
index f6bbf33bc1..7f1b060e6d 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -2248,7 +2248,7 @@ static void register_smram_listener(Notifier *n, void *unused)
 
     address_space_init(&smram_address_space, &smram_as_root, "KVM-SMRAM");
     kvm_memory_listener_register(kvm_state, &smram_listener,
-                                 &smram_address_space, 1);
+                                 &smram_address_space, 1, "kvm-smram");
 }
 
 int kvm_arch_init(MachineState *ms, KVMState *s)
diff --git a/target/i386/nvmm/nvmm-all.c b/target/i386/nvmm/nvmm-all.c
index a488b00e90..14c996f968 100644
--- a/target/i386/nvmm/nvmm-all.c
+++ b/target/i386/nvmm/nvmm-all.c
@@ -1123,6 +1123,7 @@ nvmm_log_sync(MemoryListener *listener, MemoryRegionSection *section)
 }
 
 static MemoryListener nvmm_memory_listener = {
+    .name = "nvmm",
     .begin = nvmm_transaction_begin,
     .commit = nvmm_transaction_commit,
     .region_add = nvmm_region_add,
diff --git a/target/i386/whpx/whpx-all.c b/target/i386/whpx/whpx-all.c
index 3e925b9da7..ef896da0a2 100644
--- a/target/i386/whpx/whpx-all.c
+++ b/target/i386/whpx/whpx-all.c
@@ -1598,6 +1598,7 @@ static void whpx_log_sync(MemoryListener *listener,
 }
 
 static MemoryListener whpx_memory_listener = {
+    .name = "whpx",
     .begin = whpx_transaction_begin,
     .commit = whpx_transaction_commit,
     .region_add = whpx_region_add,
-- 
2.31.1



