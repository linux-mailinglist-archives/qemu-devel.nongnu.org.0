Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5183F2FDF81
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 03:42:05 +0100 (CET)
Received: from localhost ([::1]:34978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2PvA-0006wG-CL
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 21:42:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l2Pqd-0001bM-RP
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 21:37:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54393)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l2PqZ-0003k0-J7
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 21:37:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611196638;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rWsNbfno5eQmALjcQ0NugNktpINR/bP8vlBM0Vwjwe4=;
 b=i9aeznTA3v25zkraHXqGWlY1cda4vQQc0qYRjkRLlygXHUwPi0KxIOx5ViOcVd+4b0e5Xh
 wiDyMKijohNAQhrprsv+nW4/x6aZhfCb9cRSotGvbyH+cT0FsDGADQbWog/ujFWupFdDmU
 IX/Tycnbl0+UENXD4BIHVqJs2vWiS0g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-366-OmmbbNF5OmWTvn1XXuQuCw-1; Wed, 20 Jan 2021 21:37:16 -0500
X-MC-Unique: OmmbbNF5OmWTvn1XXuQuCw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D68018030A3;
 Thu, 21 Jan 2021 02:37:14 +0000 (UTC)
Received: from blue.redhat.com (ovpn-113-116.phx2.redhat.com [10.3.113.116])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C9A085D764;
 Thu, 21 Jan 2021 02:37:02 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/13] block: Honor blk_set_aio_context() context requirements
Date: Wed, 20 Jan 2021 20:36:47 -0600
Message-Id: <20210121023657.1186241-4-eblake@redhat.com>
In-Reply-To: <20210121023657.1186241-1-eblake@redhat.com>
References: <20210121023657.1186241-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "open list:virtio-blk" <qemu-block@nongnu.org>, Sergio Lopez <slp@redhat.com>,
 Paul Durrant <paul@xen.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Sergio Lopez <slp@redhat.com>

The documentation for bdrv_set_aio_context_ignore() states this:

 * The caller must own the AioContext lock for the old AioContext of bs, but it
 * must not own the AioContext lock for new_context (unless new_context is the
 * same as the current context of bs).

As blk_set_aio_context() makes use of this function, this rule also
applies to it.

Fix all occurrences where this rule wasn't honored.

Suggested-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Sergio Lopez <slp@redhat.com>
Message-Id: <20201214170519.223781-2-slp@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 hw/block/dataplane/virtio-blk.c | 4 ++++
 hw/block/dataplane/xen-block.c  | 7 ++++++-
 hw/scsi/virtio-scsi.c           | 6 ++++--
 3 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/hw/block/dataplane/virtio-blk.c b/hw/block/dataplane/virtio-blk.c
index 37499c556482..e9050c8987e7 100644
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
index 71c337c7b7e7..3675f8deaf9d 100644
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
index 9690bc63c860..99ff261cead1 100644
--- a/hw/scsi/virtio-scsi.c
+++ b/hw/scsi/virtio-scsi.c
@@ -849,15 +849,17 @@ static void virtio_scsi_hotplug(HotplugHandler *hotplug_dev, DeviceState *dev,
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
2.30.0


