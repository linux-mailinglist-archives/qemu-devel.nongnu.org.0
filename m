Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E38854511C
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 17:44:03 +0200 (CEST)
Received: from localhost ([::1]:33862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzKKI-0002br-2C
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 11:44:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nzJI5-0002ND-M3
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 10:37:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36209)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nzJI2-00071q-7e
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 10:37:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654785457;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z6/zkzlz561dWh1RoYTIAHN4wuxuWznc6xg02g0zsGw=;
 b=FA/XSMhN8R19W5WvE5pHjeCqQJyo37BOmrt5+5lSGcD1/N/GNtYYlKv8A3XNRYf3J2G9iM
 9Pok4MajMWCengKhlLeW+GjrhVSG4wnPGgnBHtfOSr3oxmSghssmiLfoXHmHRZ3m9aQ10/
 WnmqyMMOBUSb/qlYgb7b5nBvspWxp+s=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-616-Fq-AJ-GZNWyzThLBW75Bjw-1; Thu, 09 Jun 2022 10:37:33 -0400
X-MC-Unique: Fq-AJ-GZNWyzThLBW75Bjw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5EF7738005CE;
 Thu,  9 Jun 2022 14:37:33 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1F420492C3B;
 Thu,  9 Jun 2022 14:37:33 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PATCH 4/8] virtio: categorize callbacks in GS
Date: Thu,  9 Jun 2022 10:37:23 -0400
Message-Id: <20220609143727.1151816-5-eesposit@redhat.com>
In-Reply-To: <20220609143727.1151816-1-eesposit@redhat.com>
References: <20220609143727.1151816-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
  from a MemoryRegionOps callback, which always run in the main loop.

- realize: iothread is not even created yet.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 hw/block/virtio-blk.c  | 2 ++
 hw/virtio/virtio-bus.c | 5 +++++
 hw/virtio/virtio-pci.c | 2 ++
 hw/virtio/virtio.c     | 8 ++++++++
 4 files changed, 17 insertions(+)

diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
index 29a9c53ebc..4e6421c35e 100644
--- a/hw/block/virtio-blk.c
+++ b/hw/block/virtio-blk.c
@@ -1032,6 +1032,8 @@ static void virtio_blk_set_status(VirtIODevice *vdev, uint8_t status)
 {
     VirtIOBlock *s = VIRTIO_BLK(vdev);
 
+    GLOBAL_STATE_CODE();
+
     if (!(status & (VIRTIO_CONFIG_S_DRIVER | VIRTIO_CONFIG_S_DRIVER_OK))) {
         assert(!s->dataplane_started);
     }
diff --git a/hw/virtio/virtio-bus.c b/hw/virtio/virtio-bus.c
index d7ec023adf..0891ddb2ff 100644
--- a/hw/virtio/virtio-bus.c
+++ b/hw/virtio/virtio-bus.c
@@ -23,6 +23,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/main-loop.h"
 #include "qemu/error-report.h"
 #include "qemu/module.h"
 #include "qapi/error.h"
@@ -223,6 +224,8 @@ int virtio_bus_start_ioeventfd(VirtioBusState *bus)
     VirtioDeviceClass *vdc = VIRTIO_DEVICE_GET_CLASS(vdev);
     int r;
 
+    GLOBAL_STATE_CODE();
+
     if (!k->ioeventfd_assign || !k->ioeventfd_enabled(proxy)) {
         return -ENOSYS;
     }
@@ -247,6 +250,8 @@ void virtio_bus_stop_ioeventfd(VirtioBusState *bus)
     VirtIODevice *vdev;
     VirtioDeviceClass *vdc;
 
+    GLOBAL_STATE_CODE();
+
     if (!bus->ioeventfd_started) {
         return;
     }
diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index 0566ad7d00..6798039391 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -301,6 +301,8 @@ static void virtio_ioport_write(void *opaque, uint32_t addr, uint32_t val)
     VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
     hwaddr pa;
 
+    GLOBAL_STATE_CODE();
+
     switch (addr) {
     case VIRTIO_PCI_GUEST_FEATURES:
         /* Guest does not negotiate properly?  We have to assume nothing. */
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 5d607aeaa0..2650504dd4 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -1977,6 +1977,8 @@ int virtio_set_status(VirtIODevice *vdev, uint8_t val)
     VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
     trace_virtio_set_status(vdev, val);
 
+    GLOBAL_STATE_CODE();
+
     if (virtio_vdev_has_feature(vdev, VIRTIO_F_VERSION_1)) {
         if (!(vdev->status & VIRTIO_CONFIG_S_FEATURES_OK) &&
             val & VIRTIO_CONFIG_S_FEATURES_OK) {
@@ -2025,6 +2027,8 @@ void virtio_reset(void *opaque)
     VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
     int i;
 
+    GLOBAL_STATE_CODE();
+
     virtio_set_status(vdev, 0);
     if (current_cpu) {
         /* Guest initiated reset */
@@ -2882,6 +2886,8 @@ int virtio_save(VirtIODevice *vdev, QEMUFile *f)
     uint32_t guest_features_lo = (vdev->guest_features & 0xffffffff);
     int i;
 
+    GLOBAL_STATE_CODE();
+
     if (k->save_config) {
         k->save_config(qbus->parent, f);
     }
@@ -3024,6 +3030,8 @@ int virtio_load(VirtIODevice *vdev, QEMUFile *f, int version_id)
     VirtioBusClass *k = VIRTIO_BUS_GET_CLASS(qbus);
     VirtioDeviceClass *vdc = VIRTIO_DEVICE_GET_CLASS(vdev);
 
+    GLOBAL_STATE_CODE();
+
     /*
      * We poison the endianness to ensure it does not get used before
      * subsections have been loaded.
-- 
2.31.1


