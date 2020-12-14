Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF0B2D9D57
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 18:14:18 +0100 (CET)
Received: from localhost ([::1]:49008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1korQP-0002qV-US
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 12:14:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1korIA-0001aX-CP
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 12:05:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1korI7-0005Ux-4T
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 12:05:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607965542;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+Eya5ky4YkXegn79a2KsK7rMFFfw80cpB9O81T1hhcs=;
 b=D8nfXyPen1o7Wnf4yvy+Rd7RUlMUAVWGCfe9xBxy2E3ybg/9xGw3zfDtsfFHNtmg3enqjU
 3Oz+MUgAS/NFfi74odgd45oEm9ZN17vaI04tpuPxGAeWM+ymkXjSas/nvkknBq3I2RazsO
 s2Qv27XHqZrZg4S5HIMoRwzGsPEBhj0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-580-s8NqP3znNFanUNxldhXiHw-1; Mon, 14 Dec 2020 12:05:38 -0500
X-MC-Unique: s8NqP3znNFanUNxldhXiHw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 548C3B8122;
 Mon, 14 Dec 2020 17:05:37 +0000 (UTC)
Received: from toolbox.redhat.com (ovpn-112-231.rdu2.redhat.com
 [10.10.112.231])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 50A455D6AB;
 Mon, 14 Dec 2020 17:05:34 +0000 (UTC)
From: Sergio Lopez <slp@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/4] block: Honor blk_set_aio_context() context requirements
Date: Mon, 14 Dec 2020 18:05:16 +0100
Message-Id: <20201214170519.223781-2-slp@redhat.com>
In-Reply-To: <20201214170519.223781-1-slp@redhat.com>
References: <20201214170519.223781-1-slp@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=slp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=slp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Stefano Stabellini <sstabellini@kernel.org>, Sergio Lopez <slp@redhat.com>,
 qemu-block@nongnu.org, Paul Durrant <paul@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The documentation for bdrv_set_aio_context_ignore() states this:

 * The caller must own the AioContext lock for the old AioContext of bs, but it
 * must not own the AioContext lock for new_context (unless new_context is the
 * same as the current context of bs).

As blk_set_aio_context() makes use of this function, this rule also
applies to it.

Fix all occurrences where this rule wasn't honored.

Suggested-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Sergio Lopez <slp@redhat.com>
---
 hw/block/dataplane/virtio-blk.c | 4 ++++
 hw/block/dataplane/xen-block.c  | 7 ++++++-
 hw/scsi/virtio-scsi.c           | 6 ++++--
 3 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/hw/block/dataplane/virtio-blk.c b/hw/block/dataplane/virtio-blk.c
index 37499c5564..e9050c8987 100644
--- a/hw/block/dataplane/virtio-blk.c
+++ b/hw/block/dataplane/virtio-blk.c
@@ -172,6 +172,7 @@ int virtio_blk_data_plane_start(VirtIODevice *vdev)
     VirtIOBlockDataPlane *s = vblk->dataplane;
     BusState *qbus = BUS(qdev_get_parent_bus(DEVICE(vblk)));
     VirtioBusClass *k = VIRTIO_BUS_GET_CLASS(qbus);
+    AioContext *old_context;
     unsigned i;
     unsigned nvqs = s->conf->num_queues;
     Error *local_err = NULL;
@@ -214,7 +215,10 @@ int virtio_blk_data_plane_start(VirtIODevice *vdev)
     vblk->dataplane_started = true;
     trace_virtio_blk_data_plane_start(s);
 
+    old_context = blk_get_aio_context(s->conf->conf.blk);
+    aio_context_acquire(old_context);
     r = blk_set_aio_context(s->conf->conf.blk, s->ctx, &local_err);
+    aio_context_release(old_context);
     if (r < 0) {
         error_report_err(local_err);
         goto fail_guest_notifiers;
diff --git a/hw/block/dataplane/xen-block.c b/hw/block/dataplane/xen-block.c
index 71c337c7b7..3675f8deaf 100644
--- a/hw/block/dataplane/xen-block.c
+++ b/hw/block/dataplane/xen-block.c
@@ -725,6 +725,7 @@ void xen_block_dataplane_start(XenBlockDataPlane *dataplane,
 {
     ERRP_GUARD();
     XenDevice *xendev = dataplane->xendev;
+    AioContext *old_context;
     unsigned int ring_size;
     unsigned int i;
 
@@ -808,10 +809,14 @@ void xen_block_dataplane_start(XenBlockDataPlane *dataplane,
         goto stop;
     }
 
-    aio_context_acquire(dataplane->ctx);
+    old_context = blk_get_aio_context(dataplane->blk);
+    aio_context_acquire(old_context);
     /* If other users keep the BlockBackend in the iothread, that's ok */
     blk_set_aio_context(dataplane->blk, dataplane->ctx, NULL);
+    aio_context_release(old_context);
+
     /* Only reason for failure is a NULL channel */
+    aio_context_acquire(dataplane->ctx);
     xen_device_set_event_channel_context(xendev, dataplane->event_channel,
                                          dataplane->ctx, &error_abort);
     aio_context_release(dataplane->ctx);
diff --git a/hw/scsi/virtio-scsi.c b/hw/scsi/virtio-scsi.c
index 3db9a8aae9..7a347ceac5 100644
--- a/hw/scsi/virtio-scsi.c
+++ b/hw/scsi/virtio-scsi.c
@@ -821,15 +821,17 @@ static void virtio_scsi_hotplug(HotplugHandler *hotplug_dev, DeviceState *dev,
     VirtIODevice *vdev = VIRTIO_DEVICE(hotplug_dev);
     VirtIOSCSI *s = VIRTIO_SCSI(vdev);
     SCSIDevice *sd = SCSI_DEVICE(dev);
+    AioContext *old_context;
     int ret;
 
     if (s->ctx && !s->dataplane_fenced) {
         if (blk_op_is_blocked(sd->conf.blk, BLOCK_OP_TYPE_DATAPLANE, errp)) {
             return;
         }
-        virtio_scsi_acquire(s);
+        old_context = blk_get_aio_context(sd->conf.blk);
+        aio_context_acquire(old_context);
         ret = blk_set_aio_context(sd->conf.blk, s->ctx, errp);
-        virtio_scsi_release(s);
+        aio_context_release(old_context);
         if (ret < 0) {
             return;
         }
-- 
2.26.2


