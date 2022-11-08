Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53791621E73
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 22:20:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osW0p-0005Ae-EY; Tue, 08 Nov 2022 16:20:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1osW0k-00055Q-Ga
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 16:19:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1osW0i-0008Lh-FA
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 16:19:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667942395;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MXXd9gV1zeE8VURJJ/WkGjI4zaICParTIrkVpyMNxWw=;
 b=ccxDWa7pkHnpmd0G7bwLrMAVG82Pjx/LYapbkm5L9ZXLhCUIpt5vNE70O+zXOCP76s+/FD
 mEcljcuJuzJx6vDkAUot2miOEYVCkNcqyP0liKCbhDRAqpBGgnzpzbY9Tjg4jRfjyCuIzK
 ipmjOZCffTXu65CYDAxQipqde/D4moc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-636-fZ6jcltOM_Sb5b-fUmoP5A-1; Tue, 08 Nov 2022 16:19:52 -0500
X-MC-Unique: fZ6jcltOM_Sb5b-fUmoP5A-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4AC1E101A58F;
 Tue,  8 Nov 2022 21:19:52 +0000 (UTC)
Received: from localhost (unknown [10.39.192.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1D676477F5F;
 Tue,  8 Nov 2022 21:19:39 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-block@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PATCH 3/8] virtio: categorize callbacks in GS
Date: Tue,  8 Nov 2022 16:19:25 -0500
Message-Id: <20221108211930.876142-4-stefanha@redhat.com>
In-Reply-To: <20221108211930.876142-1-stefanha@redhat.com>
References: <20221108211930.876142-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

From: Emanuele Giuseppe Esposito <eesposit@redhat.com>

All the callbacks below are always running in the main loop.

The callbacks are the following:
- start/stop_ioeventfd: these are the callbacks where
  blk_set_aio_context(iothread) is done, so they are called in the main
  loop.

- save and load: called during migration, when VM is stopped from the
  main loop.

- reset: before calling this callback, stop_ioeventfd is invoked, so
  it can only run in the main loop.

- set_status: going through all the callers we can see it is called
  from a MemoryRegionOps callback, which always run in a vcpu thread and
  hold the BQL.

- realize: iothread is not even created yet.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20220609143727.1151816-5-eesposit@redhat.com>
---
 hw/block/virtio-blk.c  | 2 ++
 hw/virtio/virtio-bus.c | 5 +++++
 hw/virtio/virtio-pci.c | 2 ++
 hw/virtio/virtio.c     | 8 ++++++++
 4 files changed, 17 insertions(+)

diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
index 96d00103a4..96bc11d2fe 100644
--- a/hw/block/virtio-blk.c
+++ b/hw/block/virtio-blk.c
@@ -1005,6 +1005,8 @@ static void virtio_blk_set_status(VirtIODevice *vdev, uint8_t status)
 {
     VirtIOBlock *s = VIRTIO_BLK(vdev);
 
+    GLOBAL_STATE_CODE();
+
     if (!(status & (VIRTIO_CONFIG_S_DRIVER | VIRTIO_CONFIG_S_DRIVER_OK))) {
         assert(!s->dataplane_started);
     }
diff --git a/hw/virtio/virtio-bus.c b/hw/virtio/virtio-bus.c
index 896feb37a1..74cdf4bd27 100644
--- a/hw/virtio/virtio-bus.c
+++ b/hw/virtio/virtio-bus.c
@@ -23,6 +23,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/main-loop.h"
 #include "qemu/error-report.h"
 #include "qemu/module.h"
 #include "qapi/error.h"
@@ -224,6 +225,8 @@ int virtio_bus_start_ioeventfd(VirtioBusState *bus)
     VirtioDeviceClass *vdc = VIRTIO_DEVICE_GET_CLASS(vdev);
     int r;
 
+    GLOBAL_STATE_CODE();
+
     if (!k->ioeventfd_assign || !k->ioeventfd_enabled(proxy)) {
         return -ENOSYS;
     }
@@ -248,6 +251,8 @@ void virtio_bus_stop_ioeventfd(VirtioBusState *bus)
     VirtIODevice *vdev;
     VirtioDeviceClass *vdc;
 
+    GLOBAL_STATE_CODE();
+
     if (!bus->ioeventfd_started) {
         return;
     }
diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index a1c9dfa7bb..4f9a94f61b 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -313,6 +313,8 @@ static void virtio_ioport_write(void *opaque, uint32_t addr, uint32_t val)
     uint16_t vector;
     hwaddr pa;
 
+    GLOBAL_STATE_CODE();
+
     switch (addr) {
     case VIRTIO_PCI_GUEST_FEATURES:
         /* Guest does not negotiate properly?  We have to assume nothing. */
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 9683b2e158..468e8f5ad0 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -2422,6 +2422,8 @@ int virtio_set_status(VirtIODevice *vdev, uint8_t val)
     VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
     trace_virtio_set_status(vdev, val);
 
+    GLOBAL_STATE_CODE();
+
     if (virtio_vdev_has_feature(vdev, VIRTIO_F_VERSION_1)) {
         if (!(vdev->status & VIRTIO_CONFIG_S_FEATURES_OK) &&
             val & VIRTIO_CONFIG_S_FEATURES_OK) {
@@ -2515,6 +2517,8 @@ void virtio_reset(void *opaque)
     VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
     int i;
 
+    GLOBAL_STATE_CODE();
+
     virtio_set_status(vdev, 0);
     if (current_cpu) {
         /* Guest initiated reset */
@@ -3357,6 +3361,8 @@ int virtio_save(VirtIODevice *vdev, QEMUFile *f)
     uint32_t guest_features_lo = (vdev->guest_features & 0xffffffff);
     int i;
 
+    GLOBAL_STATE_CODE();
+
     if (k->save_config) {
         k->save_config(qbus->parent, f);
     }
@@ -3508,6 +3514,8 @@ int virtio_load(VirtIODevice *vdev, QEMUFile *f, int version_id)
     VirtioBusClass *k = VIRTIO_BUS_GET_CLASS(qbus);
     VirtioDeviceClass *vdc = VIRTIO_DEVICE_GET_CLASS(vdev);
 
+    GLOBAL_STATE_CODE();
+
     /*
      * We poison the endianness to ensure it does not get used before
      * subsections have been loaded.
-- 
2.38.1


